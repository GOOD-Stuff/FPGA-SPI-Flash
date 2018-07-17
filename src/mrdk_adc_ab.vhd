library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;
    use IEEE.STD_LOGIC_ARITH.ALL;
    use IEEE.STD_LOGIC_UNSIGNED.ALL;

library UNISIM;
	use UNISIM.vcomponents.all;
	
---------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>>> declaration DEBUG components <<<<<<<<<<<<<<<<<<<<<<--
---------------------------------------------------------------------------
    use work.dbg_pkg.all;
    
---------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>>>>>>> declaration components <<<<<<<<<<<<<<<<<<<<<<<<--
---------------------------------------------------------------------------
    use work.clk_adc_pkg.all;
    use work.ad9653_wrapper_pkg.all;    
    use work.ser_adc_pkg.all;
    use work.madc_ddc_warapper_pkg.all;
    use work.madc_fir_wrapper_pkg.all;
    use work.c2c_wrapper_pkg.all;
    use work.madc2mdsp_pkg.all;
    use work.c2bkpln_wrapper_pkg.all;
    use work.madc_cmd_pkg.all;               
        
entity mrdk_adc_ab is
	port (
		
		-- clock
		CLK_300_P		: in	std_logic;
		CLK_300_N		: in	std_logic;
		
		REFCLK_300_P	: in	std_logic;
		REFCLK_300_N	: in	std_logic;
			
		FPGA_CLK_P		: in	std_logic;
		FPGA_CLK_N		: in	std_logic;
				
		-- ADC data interface
		ADC_DCO_P       : in	std_logic;
		ADC_DCO_N       : in 	std_logic;
		ADC_FCO_P       : in 	std_logic;
		ADC_FCO_N       : in 	std_logic;		
		ADC_A_D0_P      : in 	std_logic;
		ADC_A_D0_N      : in 	std_logic;
		ADC_A_D1_P      : in 	std_logic;
		ADC_A_D1_N      : in 	std_logic;		
		ADC_B_D0_P      : in 	std_logic;
		ADC_B_D0_N      : in 	std_logic;		
		ADC_B_D1_P      : in 	std_logic;
		ADC_B_D1_N      : in 	std_logic;	
		ADC_C_D0_P      : in 	std_logic;
		ADC_C_D0_N      : in 	std_logic;		
		ADC_C_D1_P      : in 	std_logic;
		ADC_C_D1_N      : in 	std_logic;
		ADC_D_D0_P      : in 	std_logic;
		ADC_D_D0_N      : in 	std_logic;
		ADC_D_D1_P      : in 	std_logic;
		ADC_D_D1_N      : in 	std_logic;
		
		-- ADC control interface
		ADC_PDWN		: out	std_logic;
		ADC_SYNC		: out	std_logic;
		ADC_SCLK		: out	std_logic;
		ADC_SDIO		: out	std_logic;
		ADC_CSB			: out	std_logic;
		
		-- Backplane interface
		BKPLN_SYSEN_N	: out	std_logic;
		BKPLN_WAKE_IN_N	: out   std_logic;
		BKPLN_RST_N		: in	std_logic;
		    	
		BKPLN_SATA_SL	: in	std_logic;
		BKPLN_SATA_SCL	: in	std_logic;
		BKPLN_SATA_SDO	: in	std_logic;
		BKPLN_SATA_SDI	: out	std_logic; 
		
		-- address 
		RS				: in	std_logic_vector( 1 downto 0);
		GA				: in	std_logic_vector( 2 downto 0);
				
		-- SYSMON
    	SYSMON_A_SDA	: inout	std_logic;
		SYSMON_A_SCL	: inout	std_logic;
		
		-- external IIC extender 
		IIC_EXTEND 		: out   std_logic_vector( 1 downto 0);

		-- GTH ref clock
		GTREFCLK_P		: in 	std_logic;
		GTREFCLK_N		: in 	std_logic;
		
		-- leds
		LED  			: out	std_logic_vector( 1 downto 0)
		
	);
end mrdk_adc_ab;

architecture mrdk_adc_ab_arch of mrdk_adc_ab is


------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>>>> ONLY FOR DEBUG LOADER USING <<<<<<<<<<<<<<<<<<<<<<<<<--
------------------------------------------------------------------------------

    signal  clk_counter : std_logic_Vector ( 31 downto 0 ) := (others => '0') ;
    signal  led_shifter : std_logic_Vector (  1 downto 0 ) := (others => '0') ;



signal clk_300			: std_logic := '0';
signal refclk_300		: std_logic := '0';
signal clk_78			: std_logic;
signal gtrefclk			: std_logic;
signal rst_n			: std_logic;

signal cnt				: std_logic_vector(31 downto 0) := (others => '0');
signal cnt_done			: std_logic_vector(31 downto 0) := (others => '0');

signal cfgmclk			: std_logic;
signal userdone			: std_logic := '0';
signal sys_rst			: std_logic := '1';
signal rst				: std_logic := '1';
signal adc_rst			: std_logic := '1';

signal flash_cmd_busy   : std_logic := '0';
signal flash_data_busy  : std_logic := '0';

signal usr_accesse_data	: std_logic_vector(31 downto 0);

------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>> declaration component misc_clk_conv <<<<<<<<<<<<<<<<<<<<<--
------------------------------------------------------------------------------
component misc_clk_conv
	port (
    	s_axis_aresetn 	: in 	std_logic;
    	m_axis_aresetn 	: in 	std_logic;
   		s_axis_aclk 	: in 	std_logic;
    	s_axis_tvalid 	: in	 std_logic;
    	s_axis_tready 	: out 	std_logic;
    	s_axis_tdata 	: in 	std_logic_vector(7 downto 0);
    	m_axis_aclk 	: in 	std_logic;
    	m_axis_tvalid 	: out 	std_logic;
    	m_axis_tready 	: in 	std_logic;
    	m_axis_tdata 	: out 	std_logic_vector(7 downto 0)
  	);
end component;

signal misc_clk_conv_in_valid	: std_logic;
signal misc_clk_conv_in_tready	: std_logic;
signal misc_clk_conv_in_data	: std_logic_vector(7 downto 0);
signal misc_clk_conv_out_data	: std_logic_vector(7 downto 0);

signal rs_c2bkpln				: std_logic_vector( 1 downto 0);
signal ga_c2bkpln				: std_logic_vector( 2 downto 0);
signal bkpln_sata_sl_c2bkpln	: std_logic;
  
---- clk_adc
signal adc_clk			: std_logic := '0';
signal adc_clk_x4       : std_logic := '0';
signal clk_adc_locked	: std_logic;


-- c2c_wrapper
signal c2c_line_up			: std_logic;
signal c2c_channel_up		: std_logic;

-- c2bkpln_wrapper
signal c2bkpln_line_up		: std_logic;
signal c2bkpln_channel_up	: std_logic;
signal c2bkpln_clk_out		: std_logic;
signal c2bkpln_rx_tlast		: std_logic;
signal c2bkpln_rx_tvalid	: std_logic;
signal c2bkpln_rx_tkeep		: std_logic_vector( 7 downto 0);
signal c2bkpln_rx_tdata		: std_logic_vector(63 downto 0);

------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>>> declaration component sys_mng_wiz <<<<<<<<<<<<<<<<<<<<--
------------------------------------------------------------------------------
component sys_mng_wiz
	port (
    	dclk_in 		: in 	std_logic;
    	reset_in 		: in 	std_logic;
    	channel_out 	: out 	std_logic_vector( 5 downto 0);
    	eoc_out 		: out 	std_logic;
    	alarm_out 		: out 	std_logic;
    	eos_out 		: out 	std_logic;
    	busy_out 		: out 	std_logic;
    	i2c_sda 		: inout std_logic;
    	i2c_sclk 		: inout std_logic
  	);
end component;

signal firb_dvo_err		: std_logic;

------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>>> declaration component dbg_iic     <<<<<<<<<<<<<<<<<<<<--
------------------------------------------------------------------------------
component dbg_iic
    port (
        clk                 :   in std_logic;
        probe0              :   in std_logic_vector(0 DOWNTO 0);
        probe1              :   in std_logic_vector(0 DOWNTO 0)    
    );
end component;

begin


clk_counter_processing : process(clk_78)
begin
    if clk_78'event AND clk_78 = '1' then 
        if clk_counter < 78125000 then 
            clk_counter <= clk_counter + 1;
        else
            clk_counter <= (others => '0');
        end if;
    end if;
end process;



led_shifter_processing : process(clk_78)
begin
    if clk_78'event AND clk_78 = '1' then 
        if clk_counter < 78125000 then
            led_shifter <= led_shifter;
        else
            led_shifter <= led_shifter(0 downto 0) & NOT(led_shifter (1)); 
        end if;
    end if;
end process;


LED(0)			<= led_shifter(0);     -- <= not (c2c_line_up and c2c_channel_up and c2bkpln_line_up and c2bkpln_channel_up); -- cnt(26);
LED(1)			<= led_shifter(1);     -- <= not fsm_done;

BKPLN_SYSEN_N	<= 'Z';
BKPLN_WAKE_IN_N	<= 'Z';
BKPLN_SATA_SDI	<= 'Z';


-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>>>>>>> instantiate component IBUFDS <<<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
ibufds_300_inst : IBUFDS
	generic map (
    	DQS_BIAS => "FALSE"  -- (FALSE, TRUE)
   	)
   	port map (
      	O 		=> clk_300,   	-- 1-bit output: Buffer output
      	I 		=> CLK_300_P,   -- 1-bit input: Diff_p buffer input (connect directly to top-level port)
      	IB 		=> CLK_300_N	-- 1-bit input: Diff_n buffer input (connect directly to top-level port)
   	);

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>>> instantiate component BUFGCE_DIV <<<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
BUFGCE_DIV_inst : BUFGCE_DIV
   generic map (
      BUFGCE_DIVIDE 	=> 4,     	-- 1-8
      -- Programmable Inversion Attributes: Specifies built-in programmable inversion on specific pins
      IS_CE_INVERTED 	=> '0',  	-- Optional inversion for CE
      IS_CLR_INVERTED 	=> '0', 	-- Optional inversion for CLR
      IS_I_INVERTED 	=> '0'    	-- Optional inversion for I
   )
   port map (
      O 	=> clk_78,     	-- 1-bit output: Buffer
      CE 	=> '1',   		-- 1-bit input: Buffer enable
      CLR 	=> '0', 		-- 1-bit input: Asynchronous clear
      I		=> clk_300      -- 1-bit input: Buffer
   );

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>>>>>>> instantiate component IBUFDS <<<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
ibufds_ref300_inst : IBUFDS
	generic map (
    	DQS_BIAS => "FALSE"  -- (FALSE, TRUE)
   	)
   	port map (
      	O 		=> refclk_300,  -- 1-bit output: Buffer output
      	I 		=> REFCLK_300_P,-- 1-bit input: Diff_p buffer input (connect directly to top-level port)
      	IB 		=> REFCLK_300_N	-- 1-bit input: Diff_n buffer input (connect directly to top-level port)
   	);

process (clk_300, BKPLN_RST_N) begin
	if (sys_rst = '1') then
		cnt	<= (others => '0');		
		rst	<= '1';
		
	elsif (clk_300'event and clk_300 = '1') then
		cnt	<= cnt + 1;
		
		if (cnt = x"0000FFFF") then
			rst	<= '0';
		end if;
		
	end if;
end process;

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>>>>> instantiate component clk_adc <<<<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
clk_adc_inst : clk_adc
	port map (
		-- clock
		FPGA_CLK_P		=> FPGA_CLK_P,
		FPGA_CLK_N		=> FPGA_CLK_N,
		-- status
		LOCKED			=> clk_adc_locked,
		-- clk out
		ADC_CLK			=> adc_clk,
        ADC_CLKx4       => adc_clk_x4
		
	);

adc_rst	<= (not clk_adc_locked) or rst;
madc2mdsp_rst	<= adc_rst or bkpln_sata_sl_c2bkpln;



--
-- some others module and etc.
--


-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>> instantiate component c2bkpln_wrapper <<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
c2bkpln_wrapper_inst : c2bkpln_wrapper
	port map (
		-- clock & reset
		RST					=> adc_rst,
		CLK_78				=> clk_78,
		CLK_OUT				=> c2bkpln_clk_out,
		-- GTH ref clock
		GTREFCLK    		=> gtrefclk,
		-- C2BKPLN status
		LANE_UP				=> c2bkpln_line_up,
		CHANNEL_UP			=> c2bkpln_channel_up,
		-- input interface (CLK_OUT clock domain)
		S_AXI_TVALID        => madc2mdsp_tvalid,
		S_AXI_TLAST         => madc2mdsp_tlast,		
		S_AXI_TDATA         => madc2mdsp_tdata,
        S_AXI_TKEEP         => madc2mdsp_tkeep,        
		S_AXI_TREADY        => madc2mdsp_tready,
		-- output interface (CLK_OUT clock domain)
        M_AXI_TDATA     	=> c2bkpln_rx_tdata,
		M_AXI_TKEEP     	=> c2bkpln_rx_tkeep,
		M_AXI_TVALID    	=> c2bkpln_rx_tvalid,
		M_AXI_TLAST     	=> c2bkpln_rx_tlast		
	);

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>>> instantiate component madc_cmd <<<<<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
madc_cmd_inst : madc_cmd
	port map (
        -- clock & reset
		RST                 => adc_rst,
		CLK                 => c2bkpln_clk_out,
		CLK_FLASH           => clk_78,	
		CLK_ADC 			=> adc_clk,
		CLK_ADC_X4			=> adc_clk_x4,
		-- address settings
		RS					=> rs_c2bkpln,
		GA					=> ga_c2bkpln,
		-- input interface (CLK clock domain)
		S_AXI_TVALID        => c2bkpln_rx_tvalid,
		S_AXI_TLAST         => c2bkpln_rx_tlast,		
		S_AXI_TDATA         => c2bkpln_rx_tdata( 7 downto 0),
		
		-- QSPI feedback
		FLASH_CMD_BUSY 		=> flash_cmd_busy,
		FLASH_DATA_BUSY 	=> flash_data_busy,		
		
		-- DDC tuning (CLK_ADC clock domain) -- 0x01
		DDC0_ARST			=> open, -- ddc0_arst,
		DDC0_VALID			=> ddc0_valid,	
		DDC0_PINC			=> ddc0_pinc,
		DDC0_POFF			=> ddc0_poff,
		DDC1_ARST			=> open, -- ddc0_arst,ddc1_arst,
		DDC1_VALID			=> ddc1_valid,	
		DDC1_PINC			=> ddc1_pinc,
		DDC1_POFF			=> ddc1_poff,
		DDC2_ARST			=> open, -- ddc0_arst,ddc2_arst,
		DDC2_VALID			=> ddc2_valid,	
		DDC2_PINC			=> ddc2_pinc,
		DDC2_POFF			=> ddc2_poff,
		DDC3_ARST			=> open, -- ddc3_arst,
		DDC3_VALID			=> ddc3_valid,	
		DDC3_PINC			=> ddc3_pinc,
		DDC3_POFF			=> ddc3_poff,
		-- tuning FIR (ADC_CLK_X4 clock domain) -- 0x02
		SCALE0				=> fira0_scale,
		SCALE1				=> fira1_scale,
		SCALE2				=> fira2_scale,
		SCALE3				=> fira3_scale	
	);

IIC_EXTEND(0) <= flash_cmd_busy;
IIC_EXTEND(1) <= flash_data_busy;

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>> instantiate component dbg_iic <<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
tmp_dbg_iic : dbg_iic 
    port map (
        clk     => c2bkpln_clk_out,

        probe0(0) => flash_cmd_busy,
        probe1(0) => flash_data_busy        
    );

end mrdk_adc_ab_arch;
