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
    use work.c2bkpln_wrapper_pkg.all;
    use work.z2bkpln_wrapper_pkg.all;   
    
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
	    
	    -- 40G status LEDs
        GT229_LED0      : out   std_logic;
        GT229_LED1      : out   std_logic;        
        GT230_LED0      : out   std_logic;
        GT230_LED1      : out   std_logic;

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

-- c2c_c_interface 
signal z2c_axis_tdata		: std_logic_vector( 7 downto 0) := (others => '0');
signal z2c_axis_tvalid		: std_logic := '0';
signal z2c_axis_tlast		: std_logic := '0';
signal z2c_axis_tready		: std_logic := '1';

signal c2z_axis_tdata		: std_logic_vector( 7 downto 0) := (others => '0');
signal c2z_axis_tvalid		: std_logic := '0';
signal c2z_axis_tlast		: std_logic := '0';
signal c2z_axis_tready		: std_logic := '1';

signal cnt_test				: std_logic_vector(7 downto 0) := (others => '0');

-- c2bkpln_wrapper
signal aur_refclk_out		: std_logic;
signal c2bkpln_clk_out		: std_logic;

signal c2bkpln0_lane_up		: std_logic;
signal c2bkpln0_channel_up	: std_logic;
signal c2bkpln0_tx_tvalid	: std_logic;
signal c2bkpln0_tx_tlast	: std_logic;
signal c2bkpln0_tx_tdata	: std_logic_vector(63 downto 0);
signal c2bkpln0_tx_tkeep	: std_logic_vector( 7 downto 0) := (others => '1');
signal c2bkpln0_tx_tready	: std_logic;
signal c2bkpln0_rx_tvalid	: std_logic;
signal c2bkpln0_rx_tlast	: std_logic;
signal c2bkpln0_rx_tdata	: std_logic_vector(63 downto 0);
signal c2bkpln0_rx_tkeep	: std_logic_vector( 7 downto 0);

signal c2bkpln1_lane_up		: std_logic;
signal c2bkpln1_channel_up	: std_logic;
signal c2bkpln1_tx_tvalid	: std_logic;
signal c2bkpln1_tx_tlast	: std_logic;
signal c2bkpln1_tx_tdata	: std_logic_vector(63 downto 0);
signal c2bkpln1_tx_tkeep	: std_logic_vector( 7 downto 0) := (others => '1');
signal c2bkpln1_tx_tready	: std_logic;
signal c2bkpln1_rx_tvalid	: std_logic;
signal c2bkpln1_rx_tlast	: std_logic;
signal c2bkpln1_rx_tdata	: std_logic_vector(63 downto 0);
signal c2bkpln1_rx_tkeep	: std_logic_vector( 7 downto 0);

signal c2bkpln2_lane_up		: std_logic;
signal c2bkpln2_channel_up	: std_logic;
signal c2bkpln2_tx_tvalid	: std_logic;
signal c2bkpln2_tx_tlast	: std_logic;
signal c2bkpln2_tx_tdata	: std_logic_vector(63 downto 0);
signal c2bkpln2_tx_tkeep	: std_logic_vector( 7 downto 0) := (others => '1');
signal c2bkpln2_tx_tready	: std_logic;
signal c2bkpln2_rx_tvalid	: std_logic;
signal c2bkpln2_rx_tlast	: std_logic;
signal c2bkpln2_rx_tdata	: std_logic_vector(63 downto 0);
signal c2bkpln2_rx_tkeep	: std_logic_vector( 7 downto 0);

signal c2bkpln3_lane_up		: std_logic;
signal c2bkpln3_channel_up	: std_logic;
signal c2bkpln3_tx_tvalid	: std_logic;
signal c2bkpln3_tx_tlast	: std_logic;
signal c2bkpln3_tx_tdata	: std_logic_vector(63 downto 0);
signal c2bkpln3_tx_tkeep	: std_logic_vector( 7 downto 0) := (others => '1');
signal c2bkpln3_tx_tready	: std_logic;
signal c2bkpln3_rx_tvalid	: std_logic;
signal c2bkpln3_rx_tlast	: std_logic;
signal c2bkpln3_rx_tdata	: std_logic_vector(63 downto 0);
signal c2bkpln3_rx_tkeep	: std_logic_vector( 7 downto 0);

signal c2bkpln4_lane_up		: std_logic;
signal c2bkpln4_channel_up	: std_logic;
signal c2bkpln4_tx_tvalid	: std_logic;
signal c2bkpln4_tx_tlast	: std_logic;
signal c2bkpln4_tx_tdata	: std_logic_vector(63 downto 0);
signal c2bkpln4_tx_tkeep	: std_logic_vector( 7 downto 0) := (others => '1');
signal c2bkpln4_tx_tready	: std_logic;
signal c2bkpln4_rx_tvalid	: std_logic;
signal c2bkpln4_rx_tlast	: std_logic;
signal c2bkpln4_rx_tdata	: std_logic_vector(63 downto 0);
signal c2bkpln4_rx_tkeep	: std_logic_vector( 7 downto 0);

signal c2bkpln5_lane_up		: std_logic;
signal c2bkpln5_channel_up	: std_logic;
signal c2bkpln5_tx_tvalid	: std_logic;
signal c2bkpln5_tx_tlast	: std_logic;
signal c2bkpln5_tx_tdata	: std_logic_vector(63 downto 0);
signal c2bkpln5_tx_tkeep	: std_logic_vector( 7 downto 0) := (others => '1');
signal c2bkpln5_tx_tready	: std_logic;
signal c2bkpln5_rx_tvalid	: std_logic;
signal c2bkpln5_rx_tlast	: std_logic;
signal c2bkpln5_rx_tdata	: std_logic_vector(63 downto 0);
signal c2bkpln5_rx_tkeep	: std_logic_vector( 7 downto 0);

signal c2bkpln6_lane_up		: std_logic;
signal c2bkpln6_channel_up	: std_logic;
signal c2bkpln6_tx_tvalid	: std_logic;
signal c2bkpln6_tx_tlast	: std_logic;
signal c2bkpln6_tx_tdata	: std_logic_vector(63 downto 0);
signal c2bkpln6_tx_tkeep	: std_logic_vector( 7 downto 0) := (others => '1');
signal c2bkpln6_tx_tready	: std_logic;
signal c2bkpln6_rx_tvalid	: std_logic;
signal c2bkpln6_rx_tlast	: std_logic;
signal c2bkpln6_rx_tdata	: std_logic_vector(63 downto 0);
signal c2bkpln6_rx_tkeep	: std_logic_vector( 7 downto 0);

signal c2bkpln7_lane_up		: std_logic;
signal c2bkpln7_channel_up	: std_logic;
signal c2bkpln7_tx_tvalid	: std_logic;
signal c2bkpln7_tx_tlast	: std_logic;
signal c2bkpln7_tx_tdata	: std_logic_vector(63 downto 0);
signal c2bkpln7_tx_tkeep	: std_logic_vector( 7 downto 0) := (others => '1');
signal c2bkpln7_tx_tready	: std_logic;
signal c2bkpln7_rx_tvalid	: std_logic;
signal c2bkpln7_rx_tlast	: std_logic;
signal c2bkpln7_rx_tdata	: std_logic_vector(63 downto 0);
signal c2bkpln7_rx_tkeep	: std_logic_vector( 7 downto 0); 

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

COMPONENT ila_0
    PORT (
        clk : IN STD_LOGIC;

        probe0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
        probe1 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
        probe2 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        probe3 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        probe4 : IN STD_LOGIC_VECTOR(7 downto 0)
    );
END COMPONENT;

begin

GT229_LED0	<= '1';
GT229_LED1	<= '1';       
GT230_LED0	<= '1';
GT230_LED1	<= '1';

LED0        <= '1';
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
        -- output interface
        M_AXI_TVALID        => c2z_axis_tvalid,
        M_AXI_TLAST         => c2z_axis_tlast,
        M_AXI_TDATA         => c2z_axis_tdata,
		-- sync (CLK_BKPLN clock domain)
		SYNC_CLK_BKPLN 		=> bkpln2bb_sync_clk_bkpln,
		-- sync (CLK_BB clock domain)
		SYNC_CLK_BB 		=> bkpln2bb_sync_clk_bb,
		----------- tuning NB -----------
		NB_DVO  			=> nb_dvo,
		NB_NUM				=> nb_num,
		NB_SRC_IP			=> nb_src_ip,						
		NB_SRC_PORT			=> nb_src_port,	
		NB_DST_MAC			=> nb_dst_mac,				
		NB_DST_IP			=> nb_dst_ip,
		NB_DST_PORT			=> nb_dst_port
	);
-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>>>>>> c2c_z_interface C <-> Z <<<<<<<<<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
c2c_c_interface_inst : c2c_c_interface
    port map (
        -- clock & reset
        RST             => '0', -- sys_reset,
        CLK             => dclk,
        -- input AXI (CLK clock domain)
        S_AXIS_TDATA    => c2z_axis_tdata,
        S_AXIS_TVALID   => c2z_axis_tvalid,
        S_AXIS_TLAST    => c2z_axis_tlast,
        S_AXIS_TREADY   => c2z_axis_tready,
        -- output AXI (CLK clock domain)
        M_AXIS_TDATA    => z2c_axis_tdata,
        M_AXIS_TVALID   => z2c_axis_tvalid,
        M_AXIS_TLAST    => z2c_axis_tlast,
        M_AXIS_TREADY   => z2c_axis_tready,        
    	-- A or B <-> Z interface  (package pins)
	  	C2Z_CLK			=> Z2C_CLK,
    	C2Z_DV			=> Z2C_DV,	  	
    	C2Z_DATA		=> Z2C_DATA,
		Z2C_CLK			=> C2Z_CLK,
    	Z2C_DV			=> C2Z_DV,	  	
    	Z2C_DATA		=> C2Z_DATA
    );

z2c_axis_tready <= '1';

dbg_c2c_ila: ila_0
PORT MAP (
    clk    => dclk,

    probe0    => c2z_axis_tdata, 
    probe1(0) => c2z_axis_tvalid, 
    probe2(0) => c2z_axis_tlast,
    probe3(0) => c2z_axis_tready,
    probe4    => cnt_test
);

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>> instantiate component c2bkpln_wrapper <<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
c2bkpln_wrapper_inst : c2bkpln_wrapper
	port map (
		-- clock & reset
		RST					=> '0', -- sys_reset,	-- system reset
		INIT_CLK			=> dclk, 		-- 100 MHz
		CLK_OUT				=> c2bkpln_clk_out,
		-- GTH ref clock
		GTREFCLK_P			=> REFCLK_129_P,
		GTREFCLK_N			=> REFCLK_129_N,
		GTREFCLK_OUT		=> aur_refclk_out,
		-- C2BKPLN status
		LANE0_UP			=> c2bkpln0_lane_up,
		CHANNEL0_UP			=> c2bkpln0_channel_up,
		LANE1_UP			=> c2bkpln1_lane_up,
		CHANNEL1_UP			=> c2bkpln1_channel_up,		
		LANE2_UP			=> c2bkpln2_lane_up,
		CHANNEL2_UP			=> c2bkpln2_channel_up,				
		LANE3_UP			=> c2bkpln3_lane_up,
		CHANNEL3_UP			=> c2bkpln3_channel_up,	
		LANE4_UP			=> c2bkpln4_lane_up,
		CHANNEL4_UP			=> c2bkpln4_channel_up,			
		LANE5_UP			=> c2bkpln5_lane_up,
		CHANNEL5_UP			=> c2bkpln5_channel_up,			
		LANE6_UP			=> c2bkpln6_lane_up,
		CHANNEL6_UP			=> c2bkpln6_channel_up,
		LANE7_UP			=> c2bkpln7_lane_up,
		CHANNEL7_UP			=> c2bkpln7_channel_up,		
		------------------- SLOT 0 ------------------- 	
		S0_AXI_TVALID       => c2bkpln0_tx_tvalid,
		S0_AXI_TLAST        => c2bkpln0_tx_tlast,		
		S0_AXI_TDATA        => c2bkpln0_tx_tdata,
        S0_AXI_TKEEP        => c2bkpln0_tx_tkeep,        
		S0_AXI_TREADY       => c2bkpln0_tx_tready,
        M0_AXI_TDATA     	=> c2bkpln0_rx_tdata,
		M0_AXI_TKEEP     	=> c2bkpln0_rx_tkeep,
		M0_AXI_TVALID    	=> c2bkpln0_rx_tvalid,
		M0_AXI_TLAST     	=> c2bkpln0_rx_tlast,
		------------------- SLOT 1 ------------------- 	
		S1_AXI_TVALID       => c2bkpln1_tx_tvalid,
		S1_AXI_TLAST        => c2bkpln1_tx_tlast,		
		S1_AXI_TDATA        => c2bkpln1_tx_tdata,
        S1_AXI_TKEEP        => c2bkpln1_tx_tkeep,        
		S1_AXI_TREADY       => c2bkpln1_tx_tready,
        M1_AXI_TDATA     	=> c2bkpln1_rx_tdata,
		M1_AXI_TKEEP     	=> c2bkpln1_rx_tkeep,
		M1_AXI_TVALID    	=> c2bkpln1_rx_tvalid,
		M1_AXI_TLAST     	=> c2bkpln1_rx_tlast,
		------------------- SLOT 2 ------------------- 	
		S2_AXI_TVALID       => c2bkpln2_tx_tvalid,
		S2_AXI_TLAST        => c2bkpln2_tx_tlast,		
		S2_AXI_TDATA        => c2bkpln2_tx_tdata,
        S2_AXI_TKEEP        => c2bkpln2_tx_tkeep,        
		S2_AXI_TREADY       => c2bkpln2_tx_tready,
        M2_AXI_TDATA     	=> c2bkpln2_rx_tdata,
		M2_AXI_TKEEP     	=> c2bkpln2_rx_tkeep,
		M2_AXI_TVALID    	=> c2bkpln2_rx_tvalid,
		M2_AXI_TLAST     	=> c2bkpln2_rx_tlast,
		------------------- SLOT 3 ------------------- 	
		S3_AXI_TVALID       => c2bkpln3_tx_tvalid,
		S3_AXI_TLAST        => c2bkpln3_tx_tlast,		
		S3_AXI_TDATA        => c2bkpln3_tx_tdata,
        S3_AXI_TKEEP        => c2bkpln3_tx_tkeep,        
		S3_AXI_TREADY       => c2bkpln3_tx_tready,
        M3_AXI_TDATA     	=> c2bkpln3_rx_tdata,
		M3_AXI_TKEEP     	=> c2bkpln3_rx_tkeep,
		M3_AXI_TVALID    	=> c2bkpln3_rx_tvalid,
		M3_AXI_TLAST     	=> c2bkpln3_rx_tlast,
		------------------- SLOT 4 ------------------- 	
		S4_AXI_TVALID       => c2bkpln4_tx_tvalid,
		S4_AXI_TLAST        => c2bkpln4_tx_tlast,		
		S4_AXI_TDATA        => c2bkpln4_tx_tdata,
        S4_AXI_TKEEP        => c2bkpln4_tx_tkeep,        
		S4_AXI_TREADY       => c2bkpln4_tx_tready,
        M4_AXI_TDATA     	=> c2bkpln4_rx_tdata,
		M4_AXI_TKEEP     	=> c2bkpln4_rx_tkeep,
		M4_AXI_TVALID    	=> c2bkpln4_rx_tvalid,
		M4_AXI_TLAST     	=> c2bkpln4_rx_tlast,	
		------------------- SLOT 5 ------------------- 	
		S5_AXI_TVALID       => c2bkpln5_tx_tvalid,
		S5_AXI_TLAST        => c2bkpln5_tx_tlast,		
		S5_AXI_TDATA        => c2bkpln5_tx_tdata,
        S5_AXI_TKEEP        => c2bkpln5_tx_tkeep,        
		S5_AXI_TREADY       => c2bkpln5_tx_tready,
        M5_AXI_TDATA     	=> c2bkpln5_rx_tdata,
		M5_AXI_TKEEP     	=> c2bkpln5_rx_tkeep,
		M5_AXI_TVALID    	=> c2bkpln5_rx_tvalid,
		M5_AXI_TLAST     	=> c2bkpln5_rx_tlast,		
		------------------- SLOT 6 ------------------- 	
		S6_AXI_TVALID       => c2bkpln6_tx_tvalid,
		S6_AXI_TLAST        => c2bkpln6_tx_tlast,		
		S6_AXI_TDATA        => c2bkpln6_tx_tdata,
        S6_AXI_TKEEP        => c2bkpln6_tx_tkeep,        
		S6_AXI_TREADY       => c2bkpln6_tx_tready,
        M6_AXI_TDATA     	=> c2bkpln6_rx_tdata,
		M6_AXI_TKEEP     	=> c2bkpln6_rx_tkeep,
		M6_AXI_TVALID    	=> c2bkpln6_rx_tvalid,
		M6_AXI_TLAST     	=> c2bkpln6_rx_tlast,		
		------------------- SLOT 7 ------------------- 	
		S7_AXI_TVALID       => c2bkpln7_tx_tvalid,
		S7_AXI_TLAST        => c2bkpln7_tx_tlast,		
		S7_AXI_TDATA        => c2bkpln7_tx_tdata,
        S7_AXI_TKEEP        => c2bkpln7_tx_tkeep,        
		S7_AXI_TREADY       => c2bkpln7_tx_tready,
        M7_AXI_TDATA     	=> c2bkpln7_rx_tdata,
		M7_AXI_TKEEP     	=> c2bkpln7_rx_tkeep,
		M7_AXI_TVALID    	=> c2bkpln7_rx_tvalid,
		M7_AXI_TLAST     	=> c2bkpln7_rx_tlast		
	);

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>> instantiate component z2bkpln_wrapper <<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
z2bkpln_wrapper_inst : z2bkpln_wrapper
	port map (
		-- clock & reset
		RST					=> '0', -- sys_reset,
		CLK_Z2C				=> dclk,
		CLK_C2BKPLN			=> c2bkpln_clk_out,
		-- Z to C interface (CLK_Z2C clock domain)
        S_AXIS_TDATA    	=> z2c_axis_tdata,
		S_AXIS_TVALID   	=> z2c_axis_tvalid,
		S_AXIS_TLAST    	=> z2c_axis_tlast,
		S_AXIS_TREADY   	=> z2c_axis_tready,  
		-- (CLK_C2BKPLN clock domain)
		------------------- SLOT 0 ------------------- 	
		M0_AXI_TDATA     	=> c2bkpln0_tx_tdata,
		M0_AXI_TKEEP     	=> c2bkpln0_tx_tkeep,
		M0_AXI_TVALID    	=> c2bkpln0_tx_tvalid,
		M0_AXI_TLAST     	=> c2bkpln0_tx_tlast,
		M0_AXI_TREADY     	=> c2bkpln0_tx_tready,		
		------------------- SLOT 1 ------------------- 	
		M1_AXI_TDATA     	=> c2bkpln1_tx_tdata,
		M1_AXI_TKEEP     	=> c2bkpln1_tx_tkeep,
		M1_AXI_TVALID    	=> c2bkpln1_tx_tvalid,
		M1_AXI_TLAST     	=> c2bkpln1_tx_tlast,
		M1_AXI_TREADY     	=> c2bkpln1_tx_tready,						
		------------------- SLOT 2 ------------------- 	
		M2_AXI_TDATA     	=> c2bkpln2_tx_tdata,
		M2_AXI_TKEEP     	=> c2bkpln2_tx_tkeep,
		M2_AXI_TVALID    	=> c2bkpln2_tx_tvalid,
		M2_AXI_TLAST     	=> c2bkpln2_tx_tlast,
		M2_AXI_TREADY     	=> c2bkpln2_tx_tready,				
		------------------- SLOT 3 ------------------- 	
		M3_AXI_TDATA     	=> c2bkpln3_tx_tdata,
		M3_AXI_TKEEP     	=> c2bkpln3_tx_tkeep,
		M3_AXI_TVALID    	=> c2bkpln3_tx_tvalid,
		M3_AXI_TLAST     	=> c2bkpln3_tx_tlast,
		M3_AXI_TREADY     	=> c2bkpln3_tx_tready,		
		------------------- SLOT 4 ------------------- 	
		M4_AXI_TDATA     	=> c2bkpln4_tx_tdata,
		M4_AXI_TKEEP     	=> c2bkpln4_tx_tkeep,
		M4_AXI_TVALID    	=> c2bkpln4_tx_tvalid,
		M4_AXI_TLAST     	=> c2bkpln4_tx_tlast,
		M4_AXI_TREADY     	=> c2bkpln4_tx_tready,						
		------------------- SLOT 5 ------------------- 	
		M5_AXI_TDATA     	=> c2bkpln5_tx_tdata,
		M5_AXI_TKEEP     	=> c2bkpln5_tx_tkeep,
		M5_AXI_TVALID    	=> c2bkpln5_tx_tvalid,
		M5_AXI_TLAST     	=> c2bkpln5_tx_tlast,
		M5_AXI_TREADY     	=> c2bkpln5_tx_tready,				
		------------------- SLOT 6 ------------------- 	
		M6_AXI_TDATA     	=> c2bkpln6_tx_tdata,
		M6_AXI_TKEEP     	=> c2bkpln6_tx_tkeep,
		M6_AXI_TVALID    	=> c2bkpln6_tx_tvalid,
		M6_AXI_TLAST     	=> c2bkpln6_tx_tlast,
		M6_AXI_TREADY     	=> c2bkpln6_tx_tready,		
		------------------- SLOT 7 ------------------- 	
		M7_AXI_TDATA     	=> c2bkpln7_tx_tdata,
		M7_AXI_TKEEP     	=> c2bkpln7_tx_tkeep,
		M7_AXI_TVALID    	=> c2bkpln7_tx_tvalid,
		M7_AXI_TLAST     	=> c2bkpln7_tx_tlast,
		M7_AXI_TREADY     	=> c2bkpln7_tx_tready
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
