library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.std_logic_UNSIGNED.all;
	
library UNISIM;
	use UNISIM.VCOMPONENTS.all;

---------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>>>>>>> declaration components <<<<<<<<<<<<<<<<<<<<<<<<--
---------------------------------------------------------------------------
    use work.dbg_pkg.all;
    use work.mdsp_a_cmd_pkg.all;
    
entity mrdk_40g_a is
	port (
		-- clocks (package pins)
		SYSCLK_100_P	: in	std_logic;
		SYSCLK_100_N	: in	std_logic;

		SYSCLK2_100_P	: in	std_logic;
		SYSCLK2_100_N	: in	std_logic;		

		-- GTH ref clock			
		GT_REFCLK_P     : in	std_logic; -- 229 40G refclk
		GT_REFCLK_N		: in	std_logic;
		
		REFCLK_129_P	: in 	std_logic; -- 129 aurora refclk
		REFCLK_129_N	: in 	std_logic;
	    
	    -- status LEDs
        LED0            : out   std_logic;
        LED1            : out   std_logic;

        -- A <-> Z interface
        C2Z_CLK         : out   std_logic;
        C2Z_DV          : out   std_logic;          
        C2Z_DATA        : out   std_logic_vector( 4 downto 0);
        Z2C_CLK         : in    std_logic;
        Z2C_DV          : in    std_logic;          
        Z2C_DATA        : in    std_logic_vector( 4 downto 0);
        
        -- address settings
        RS              : in    std_logic_vector( 1 downto 0);
        
        -- SYSMON I2C DRP Interface
        I2CSDA          : inout std_logic;
        I2CSCLK         : inout std_logic 

	);     
end mrdk_40g_a;

architecture mrdk_40g_a_arch of mrdk_40g_a is
---------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>> declaration component clkgen_bb <<<<<<<<<<<<<<<<<<<<<--
---------------------------------------------------------------------------
component clkgen_bb
	port (
		-- Clock in ports
	  	clk_in1_p         : in     std_logic;
	  	clk_in1_n         : in     std_logic;
	  	-- Clock out ports
	  	clk_out1          : out    std_logic;
	  	-- Status and control signals
	  	locked            : out    std_logic
	);
end component;

signal clk_320				: std_logic;
signal clkgen_bb_locked		: std_logic;

-- c2c_c_interface 
signal z2c_axis_tdata		: std_logic_vector( 7 downto 0) := (others => '0');
signal z2c_axis_tvalid		: std_logic := '0';
signal z2c_axis_tlast		: std_logic := '0';
signal z2c_axis_tready		: std_logic := '1';

signal c2z_axis_tdata		: std_logic_vector( 7 downto 0) := (others => '0');
signal c2z_axis_tvalid		: std_logic := '0';
signal c2z_axis_tlast		: std_logic := '0';
signal c2z_axis_tready		: std_logic := '1';

signal cnt_test				: std_logic_vector(16 downto 0) := (others => '0');

-- dbg_ch_sel
signal dbg_adc_ch_num		: std_logic_vector( 2 downto 0); 
signal dbg_tdata			: std_logic_vector(31 downto 0);
signal dbg_tdata_i			: std_logic_vector(15 downto 0);
signal dbg_tdata_q			: std_logic_vector(15 downto 0);
signal dbg_tvalid			: std_logic;
signal dbg_ch_sel_rst		: std_logic;

---------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>> declaration component sys_mng_wiz <<<<<<<<<<<<<<<<<<<--
---------------------------------------------------------------------------
component sys_mng_wiz
  	port (
  	    dclk_in 		: in	std_logic;
    	channel_out 	: out 	std_logic_vector( 5 downto 0);
    	eoc_out 		: out 	std_logic;
    	alarm_out 		: out 	std_logic;
    	eos_out 		: out 	std_logic;
    	busy_out 		: out 	std_logic;
    	i2c_sda 		: inout std_logic;
    	i2c_sclk 		: inout std_logic
  	);
end component;

begin

LED0        <= '0';
LED1        <= '1'; -- golden

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>> instantiate component IBUFDS 100MHz <<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
ibufds_100_inst : IBUFDS
	generic map (
   		DQS_BIAS => "FALSE"  -- (FALSE, TRUE)
	)
	port map (
   		O 		=> dclk,   			-- 1-bit output: Buffer output
   		I 		=> SYSCLK_100_P,   	-- 1-bit input: Diff_p buffer input (connect directly to top-level port)
   		IB 		=> SYSCLK_100_N  	-- 1-bit input: Diff_n buffer input (connect directly to top-level port)
	);

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>> instantiate component clkgen_bb <<<<<<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
clkgen_bb_inst : clkgen_bb
	port map (
		-- Clock in ports
	  	clk_in1_p	=> SYSCLK2_100_P,
	  	clk_in1_n   => SYSCLK2_100_N,
	  	-- Clock out ports
	  	clk_out1    => clk_320,
	  	-- Status and control signals
	  	locked      => clkgen_bb_locked
	);

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>>> instantiate component mdsp_a_cmd <<<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
mdsp_a_cmd_inst : mdsp_a_cmd
	port map (
        -- clock & reset
		RST                 => '0', -- sys_reset,
		CLK                 => dclk,
		CLK_BKPLN           => c2bkpln_clk_out,		
		CLK_BB              => clk_320,
		CLK_HOST            => clk_320, -- exdes_0_tx_axis_clk,
        CLK_FLASH           => dclk, -- 100 MHz
		-- address settings
		RS					=> RS,		
		-- input interface (CLK clock domain)
		S_AXI_TVALID        => z2c_axis_tvalid,
		S_AXI_TLAST         => z2c_axis_tlast,		
		S_AXI_TDATA         => z2c_axis_tdata,
		-- sync (CLK_BKPLN clock domain)
		SYNC_CLK_BKPLN 		=> bkpln2bb_sync_clk_bkpln,
		-- sync (CLK_BB clock domain)
		SYNC_CLK_BB 		=> bkpln2bb_sync_clk_bb
	);

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>> instantiate component sys_mng_wiz <<<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
sys_mng_wiz_inst : sys_mng_wiz
  	port map (
		dclk_in 	=> dclk,
    	channel_out => open,
    	eoc_out 	=> open,
    	alarm_out 	=> open,
    	eos_out 	=> open,
    	busy_out 	=> open,
    	i2c_sda 	=> I2CSDA,
    	i2c_sclk 	=> I2CSCLK
  	);

end mrdk_40g_a_arch;
