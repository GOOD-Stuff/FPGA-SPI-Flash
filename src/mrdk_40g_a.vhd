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
    use work.exdes_wrapper_pkg.all;
    use work.c2c_c_interface_pkg.all;
    use work.c2bkpln_wrapper_pkg.all;
    use work.z2bkpln_wrapper_pkg.all;
    use work.dbg_ch_sel_pkg.all;
    use work.cnt_us_pkg.all;
    use work.host_1x_wrapper_pkg.all;
    use work.host_1x_tester_pkg.all;
    use work.host_1x_64b_pnum_wrapper_pkg.all;
    use work.host_1x_64b_tester_pkg.all;
    use work.bkpln2nb_pkg.all; 
    use work.bb_warapper_pkg.all;
    use work.nb_warapper_pkg.all;
    use work.det_4x64_warapper_pkg.all;
    use work.det_16x16_warapper_pkg.all;     
    
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

---------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>>>>>>>>>> DUMP HEADER <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<--
---------------------------------------------------------------------------
constant MAC_BB0			: std_logic_vector(47 downto 0) := x"001500131200";
constant MAC_BB1			: std_logic_vector(47 downto 0) := x"011500131200";
constant MAC_BB2			: std_logic_vector(47 downto 0) := x"021500131200";
constant MAC_BB3			: std_logic_vector(47 downto 0) := x"031500131200";

constant MAC_DET0			: std_logic_vector(47 downto 0) := x"001600131200";
constant MAC_DET1			: std_logic_vector(47 downto 0) := x"011600131200";
constant MAC_DET2			: std_logic_vector(47 downto 0) := x"021600131200";
constant MAC_DET3			: std_logic_vector(47 downto 0) := x"031600131200";
constant MAC_DET4			: std_logic_vector(47 downto 0) := x"001700131200";
constant MAC_NB 			: std_logic_vector(47 downto 0) := x"001800131200";

constant ETH_TYPE			: std_logic_vector(15 downto 0) := x"0800";
constant IP_VER_LEN			: std_logic_vector(15 downto 0) := x"4500";
constant TTL				: std_logic_vector( 7 downto 0) := x"FF";
constant IP_PROTO			: std_logic_vector( 7 downto 0) := x"11";
constant PKT_SIZE_X32  		: std_logic_vector(15 downto 0) := x"0800"; -- x"0800" - 8192 bytes; x"0400" - 4096 bytes
constant PKT_SIZE_X64  		: std_logic_vector(15 downto 0) := x"0400"; -- x"0400" - 8192 bytes; x"0200" - 4096 bytes
constant PKT_SIZE_X64_NB	: std_logic_vector(15 downto 0) := x"0080"; -- x"0400" - 8192 bytes; x"0200" - 4096 bytes; x"0080" - 1024 bytes
---------------------------------------------------------------------------

signal dclk					: std_logic;
signal sys_reset			: std_logic := '0';
signal d0sys_reset			: std_logic := '0';
signal d1sys_reset			: std_logic := '0';
signal d2sys_reset			: std_logic := '0';
signal d3sys_reset			: std_logic := '0';
signal rst_n     			: std_logic;
signal cnt_rst				: std_logic_vector(15 downto 0);

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

-- det_wrapper
constant det0_cdc_pinc		: std_logic_vector(31 downto 0) := x"B0000000"; -- "-6MHz"
constant det1_cdc_pinc		: std_logic_vector(31 downto 0) := x"E5555555"; -- "-2MHz"
constant det2_cdc_pinc		: std_logic_vector(31 downto 0) := x"1AAAAAAB"; -- "+2MHz"
constant det3_cdc_pinc		: std_logic_vector(31 downto 0) := x"50000000"; -- "+6MHz"

signal det0_en				: std_logic;
signal det0_scale			: std_logic_vector( 3 downto 0);
signal det0_src_ip			: std_logic_vector(31 downto 0);
signal det0_src_port		: std_logic_vector(15 downto 0);
signal det0_dst_mac			: std_logic_vector(47 downto 0);
signal det0_dst_ip			: std_logic_vector(31 downto 0);
signal det0_dst_port		: std_logic_vector(15 downto 0);
signal det0_axis_tdata		: std_logic_vector(63 downto 0);
signal det0_axis_tvalid		: std_logic;

signal det1_en				: std_logic;
signal det1_scale			: std_logic_vector( 3 downto 0);
signal det1_src_ip			: std_logic_vector(31 downto 0);
signal det1_src_port		: std_logic_vector(15 downto 0);
signal det1_dst_mac			: std_logic_vector(47 downto 0);
signal det1_dst_ip			: std_logic_vector(31 downto 0);
signal det1_dst_port		: std_logic_vector(15 downto 0);
signal det1_axis_tdata		: std_logic_vector(63 downto 0);
signal det1_axis_tvalid		: std_logic;

signal det2_en				: std_logic;
signal det2_scale			: std_logic_vector( 3 downto 0);
signal det2_src_ip			: std_logic_vector(31 downto 0);
signal det2_src_port		: std_logic_vector(15 downto 0);
signal det2_dst_mac			: std_logic_vector(47 downto 0);
signal det2_dst_ip			: std_logic_vector(31 downto 0);
signal det2_dst_port		: std_logic_vector(15 downto 0);
signal det2_axis_tdata		: std_logic_vector(63 downto 0);
signal det2_axis_tvalid		: std_logic;

signal det3_en				: std_logic;
signal det3_scale			: std_logic_vector( 3 downto 0);
signal det3_src_ip			: std_logic_vector(31 downto 0);
signal det3_src_port		: std_logic_vector(15 downto 0);
signal det3_dst_mac			: std_logic_vector(47 downto 0);
signal det3_dst_ip			: std_logic_vector(31 downto 0);
signal det3_dst_port		: std_logic_vector(15 downto 0);
signal det3_axis_tdata		: std_logic_vector(63 downto 0);
signal det3_axis_tvalid		: std_logic;

signal det4_en				: std_logic;
signal det4_src_ip			: std_logic_vector(31 downto 0);
signal det4_src_port		: std_logic_vector(15 downto 0);
signal det4_dst_mac			: std_logic_vector(47 downto 0);
signal det4_dst_ip			: std_logic_vector(31 downto 0);
signal det4_dst_port		: std_logic_vector(15 downto 0);
signal det4_axis_tdata		: std_logic_vector(63 downto 0);
signal det4_axis_tvalid		: std_logic;

-- bb_wrapper
signal bb0_rst				: std_logic;
signal bb0_cdc_arst			: std_logic;
signal bb0_cdc_valid		: std_logic;
signal bb0_cdc_pinc			: std_logic_vector(31 downto 0);
signal bb0_en				: std_logic;
signal bb0_band				: std_logic_vector( 2 downto 0);
signal bb0_scale			: std_logic_vector( 3 downto 0);
signal bb0_host_reload		: std_logic;
signal bb0_fir_ready		: std_logic;
signal bb0_src_ip			: std_logic_vector(31 downto 0);
signal bb0_src_port			: std_logic_vector(15 downto 0);
signal bb0_dst_mac			: std_logic_vector(47 downto 0);
signal bb0_dst_ip			: std_logic_vector(31 downto 0);
signal bb0_dst_port			: std_logic_vector(15 downto 0);
signal bb0_axis_tdata		: std_logic_vector(63 downto 0);
signal bb0_axis_tvalid		: std_logic;

signal bb1_rst				: std_logic;
signal bb1_cdc_arst			: std_logic;
signal bb1_cdc_valid		: std_logic;
signal bb1_cdc_pinc			: std_logic_vector(31 downto 0);
signal bb1_en				: std_logic;
signal bb1_band				: std_logic_vector( 2 downto 0);
signal bb1_scale			: std_logic_vector( 3 downto 0);
signal bb1_host_reload		: std_logic;
signal bb1_fir_ready		: std_logic;
signal bb1_src_ip			: std_logic_vector(31 downto 0);
signal bb1_src_port			: std_logic_vector(15 downto 0);
signal bb1_dst_mac			: std_logic_vector(47 downto 0);
signal bb1_dst_ip			: std_logic_vector(31 downto 0);
signal bb1_dst_port			: std_logic_vector(15 downto 0);
signal bb1_axis_tdata		: std_logic_vector(63 downto 0);
signal bb1_axis_tvalid		: std_logic;

signal bb2_rst				: std_logic;
signal bb2_cdc_arst			: std_logic;
signal bb2_cdc_valid		: std_logic;
signal bb2_cdc_pinc			: std_logic_vector(31 downto 0);
signal bb2_en				: std_logic;
signal bb2_band				: std_logic_vector( 2 downto 0);
signal bb2_scale			: std_logic_vector( 3 downto 0);
signal bb2_host_reload		: std_logic;
signal bb2_fir_ready		: std_logic;
signal bb2_src_ip			: std_logic_vector(31 downto 0);
signal bb2_src_port			: std_logic_vector(15 downto 0);
signal bb2_dst_mac			: std_logic_vector(47 downto 0);
signal bb2_dst_ip			: std_logic_vector(31 downto 0);
signal bb2_dst_port			: std_logic_vector(15 downto 0);
signal bb2_axis_tdata		: std_logic_vector(63 downto 0);
signal bb2_axis_tvalid		: std_logic;

signal bb3_rst				: std_logic;
signal bb3_cdc_arst			: std_logic;
signal bb3_cdc_valid		: std_logic;
signal bb3_cdc_pinc			: std_logic_vector(31 downto 0);
signal bb3_en				: std_logic;
signal bb3_band				: std_logic_vector( 2 downto 0);
signal bb3_scale			: std_logic_vector( 3 downto 0);
signal bb3_host_reload		: std_logic;
signal bb3_fir_ready		: std_logic;
signal bb3_src_ip			: std_logic_vector(31 downto 0);
signal bb3_src_port			: std_logic_vector(15 downto 0);
signal bb3_dst_mac			: std_logic_vector(47 downto 0);
signal bb3_dst_ip			: std_logic_vector(31 downto 0);
signal bb3_dst_port			: std_logic_vector(15 downto 0);
signal bb3_axis_tdata		: std_logic_vector(63 downto 0);
signal bb3_axis_tvalid		: std_logic;

signal nb_dvo				: std_logic;
signal nb_num				: std_logic_vector( 7 downto 0);
signal nb_src_ip			: std_logic_vector(31 downto 0);
signal nb_src_port			: std_logic_vector(15 downto 0);
signal nb_dst_mac			: std_logic_vector(47 downto 0);
signal nb_dst_ip			: std_logic_vector(31 downto 0);
signal nb_dst_port			: std_logic_vector(15 downto 0);
signal nb_pnum				: std_logic_vector(15 downto 0);
signal nb_axis_tdata		: std_logic_vector(63 downto 0);
signal nb_axis_tvalid		: std_logic;

-- nb_wrapper
signal nb_wrapper_src_ip	: std_logic_vector(31 downto 0);
signal nb_wrapper_src_port	: std_logic_vector(15 downto 0);
signal nb_wrapper_dst_mac	: std_logic_vector(47 downto 0);
signal nb_wrapper_dst_ip	: std_logic_vector(31 downto 0);
signal nb_wrapper_dst_port	: std_logic_vector(15 downto 0);

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

-- bkpln2bb
signal bkpln2bb_sync_clk_bkpln	: std_logic;
signal bkpln2bb_sync_clk_bb		: std_logic;
signal bkpln2bb_tdata			: std_logic_vector(255 downto 0) := (others => '0');
signal bkpln2bb_tvalid			: std_logic;
signal bkpln2bb_tlast			: std_logic;

-- bkpln2nb
signal bkpln2nb_tdata		: std_logic_vector(63 downto 0) := (others => '0');
signal bkpln2nb_tvalid		: std_logic;
signal bkpln2nb_tlast		: std_logic;

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

-- host_wrapper
--signal host00_src_mac    	: std_logic_vector(47 downto 0);
--signal host00_src_ip     	: std_logic_vector(31 downto 0);
--signal host00_src_port   	: std_logic_vector(15 downto 0);		
--signal host00_dst_mac    	: std_logic_vector(47 downto 0);
--signal host00_dst_ip		: std_logic_vector(31 downto 0);
--signal host00_dst_port 	: std_logic_vector(15 downto 0);
--signal host00_ipchksum 	: std_logic_vector(15 downto 0);

signal host10_src_mac    	: std_logic_vector(47 downto 0);
signal host10_src_ip     	: std_logic_vector(31 downto 0);
signal host10_src_port   	: std_logic_vector(15 downto 0);		
signal host10_dst_mac    	: std_logic_vector(47 downto 0);
signal host10_dst_ip		: std_logic_vector(31 downto 0);
signal host10_dst_port 		: std_logic_vector(15 downto 0);
signal host10_ipchksum 		: std_logic_vector(15 downto 0);

signal host_0_src_mac    	: std_logic_vector(47 downto 0);
signal host_0_src_port   	: std_logic_vector(15 downto 0);		
signal host_0_src_ip     	: std_logic_vector(31 downto 0);
signal host_0_dst_mac    	: std_logic_vector(47 downto 0);
signal host_0_dst_ip		: std_logic_vector(31 downto 0);
signal host_0_dst_port 		: std_logic_vector(15 downto 0);
signal pktgen_0_en       	: std_logic;
signal pktgen_0_timout      : std_logic_vector(31 downto 0);
signal pktgen_0_size     	: std_logic_vector(13 downto 0);

signal host_1_src_mac    	: std_logic_vector(47 downto 0);
signal host_1_src_port   	: std_logic_vector(15 downto 0);		
signal host_1_src_ip     	: std_logic_vector(31 downto 0);
signal host_1_dst_mac    	: std_logic_vector(47 downto 0);
signal host_1_dst_ip		: std_logic_vector(31 downto 0);
signal host_1_dst_port 		: std_logic_vector(15 downto 0);
signal pktgen_1_en       	: std_logic;
signal pktgen_1_timout      : std_logic_vector(31 downto 0);
signal pktgen_1_size     	: std_logic_vector(13 downto 0);

signal host_2_src_mac    	: std_logic_vector(47 downto 0);
signal host_2_src_port   	: std_logic_vector(15 downto 0);		
signal host_2_src_ip     	: std_logic_vector(31 downto 0);
signal host_2_dst_mac    	: std_logic_vector(47 downto 0);
signal host_2_dst_ip		: std_logic_vector(31 downto 0);
signal host_2_dst_port 		: std_logic_vector(15 downto 0);
signal pktgen_2_en       	: std_logic;
signal pktgen_2_timout      : std_logic_vector(31 downto 0);
signal pktgen_2_size     	: std_logic_vector(13 downto 0);

signal host_3_src_mac    	: std_logic_vector(47 downto 0);
signal host_3_src_port   	: std_logic_vector(15 downto 0);		
signal host_3_src_ip     	: std_logic_vector(31 downto 0);
signal host_3_dst_mac    	: std_logic_vector(47 downto 0);
signal host_3_dst_ip		: std_logic_vector(31 downto 0);
signal host_3_dst_port 		: std_logic_vector(15 downto 0);
signal pktgen_3_en       	: std_logic;
signal pktgen_3_timout      : std_logic_vector(31 downto 0);
signal pktgen_3_size     	: std_logic_vector(13 downto 0);

-- cnt_us
signal counter_us			: std_logic_vector(63 downto 0);

-- host_1x_64b_wrapper
signal h00_tdata			: std_logic_vector(63 downto 0);
signal h00_tvalid			: std_logic;
signal h00_tready    		: std_logic;

signal h01_tdata			: std_logic_vector(63 downto 0);
signal h01_tvalid			: std_logic;
signal h01_tready    		: std_logic;

signal h02_tdata			: std_logic_vector(63 downto 0);
signal h02_tvalid			: std_logic;
signal h02_tready    		: std_logic;

signal h03_tdata			: std_logic_vector(63 downto 0);
signal h03_tvalid			: std_logic;
signal h03_tready    		: std_logic;

signal h04_tdata			: std_logic_vector(63 downto 0);
signal h04_tvalid			: std_logic;
signal h04_tready    		: std_logic;

-- host_1x_wrapper
signal h10_tdata			: std_logic_vector(63 downto 0);
signal h10_tvalid			: std_logic;
signal h10_tready    		: std_logic;
signal h10_done    			: std_logic;

signal h11_tdata			: std_logic_vector(63 downto 0);
signal h11_tvalid			: std_logic;
signal h11_tready    		: std_logic;

signal h12_tdata			: std_logic_vector(63 downto 0);
signal h12_tvalid			: std_logic;
signal h12_tready    		: std_logic;

signal h13_tdata			: std_logic_vector(63 downto 0);
signal h13_tvalid			: std_logic;
signal h13_tready    		: std_logic;

-- exdes_wrapper
signal exdes_0_rx_gt_locked	: std_logic;
signal exdes_0_rx_aligned	: std_logic;
signal exdes_1_rx_gt_locked	: std_logic;
signal exdes_1_rx_aligned	: std_logic;

signal exdes_0_tx_axis_clk 	: std_logic;
signal exdes_1_tx_axis_clk 	: std_logic;

signal sw00_axis_tdata		: std_logic_vector( 63 downto 0) := (others => '0');
signal sw00_axis_tvalid		: std_logic := '0';
signal sw00_axis_tlast 		: std_logic := '0';
signal sw00_axis_tready		: std_logic := '0';

signal sw01_axis_tdata		: std_logic_vector( 63 downto 0) := (others => '0');
signal sw01_axis_tvalid		: std_logic := '0';
signal sw01_axis_tlast 		: std_logic := '0';
signal sw01_axis_tready		: std_logic := '1';

signal sw02_axis_tdata		: std_logic_vector( 63 downto 0) := (others => '0');
signal sw02_axis_tvalid		: std_logic := '0';
signal sw02_axis_tlast 		: std_logic := '0';
signal sw02_axis_tready		: std_logic := '1';

signal sw03_axis_tdata		: std_logic_vector( 63 downto 0) := (others => '0');
signal sw03_axis_tvalid		: std_logic := '0';
signal sw03_axis_tlast 		: std_logic := '0';
signal sw03_axis_tready		: std_logic := '1';

signal sw04_axis_tdata		: std_logic_vector( 63 downto 0) := (others => '0');
signal sw04_axis_tvalid		: std_logic := '0';
signal sw04_axis_tlast 		: std_logic := '0';
signal sw04_axis_tready		: std_logic := '1';

signal sw10_axis_tdata		: std_logic_vector( 63 downto 0) := (others => '0');
signal sw10_axis_tvalid		: std_logic := '0';
signal sw10_axis_tlast 		: std_logic := '0';
signal sw10_axis_tready		: std_logic := '0';

signal sw11_axis_tdata		: std_logic_vector( 63 downto 0) := (others => '0');
signal sw11_axis_tvalid		: std_logic := '0';
signal sw11_axis_tlast 		: std_logic := '0';
signal sw11_axis_tready		: std_logic := '1';

signal sw12_axis_tdata		: std_logic_vector( 63 downto 0) := (others => '0');
signal sw12_axis_tvalid		: std_logic := '0';
signal sw12_axis_tlast 		: std_logic := '0';
signal sw12_axis_tready		: std_logic := '1';

signal sw13_axis_tdata		: std_logic_vector( 63 downto 0) := (others => '0');
signal sw13_axis_tvalid		: std_logic := '0';
signal sw13_axis_tlast 		: std_logic := '0';
signal sw13_axis_tready		: std_logic := '1';

component data_collector
    generic (
        BW_DI   : integer := 32;
        BW_CH   : integer := 2
    );
    port (
        CLK : in std_logic;
        RST : in std_logic;
        
        SEL : in std_logic_vector(BW_CH - 1 downto 0);
        
        DI  : in std_logic_vector(BW_DI - 1 downto 0);
        CH  : in std_logic_vector(BW_CH - 1 downto 0);
        DVI : in std_logic;
        
        DO  : out std_logic_vector(BW_DI - 1 downto 0);
        DVO : out std_logic
    ); 
end component;

signal dbg_col_tdata_i		: std_logic_vector(15 downto 0);
signal dbg_col_tdata_q		: std_logic_vector(15 downto 0);
signal dbg_col_tvalid		: std_logic;

begin

GT229_LED0	<= '1';
GT229_LED1	<= '1';       
GT230_LED0	<= '1';
GT230_LED1	<= '1';

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
        -- output interface
        --M_AXI_TVALID        => c2z_axis_tvalid,
        --M_AXI_TLAST         => c2z_axis_tlast,
        --M_AXI_TDATA         => c2z_axis_tdata,
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
-->>>>>>>>>>>>>>>>> instantiate component ila_set_nb <<<<<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
ila_set_nb_inst : ila_set_nb
	port map (
		clk 		=> clk_320,
		probe0(0) 	=> nb_dvo, 
		probe1 		=> nb_num, 
		probe2 		=> nb_src_ip, 
		probe3 		=> nb_src_port, 
		probe4 		=> nb_dst_mac, 
		probe5 		=> nb_dst_ip,
		probe6 		=> nb_dst_port
	);

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>> instantiate component nb_warapper <<<<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
nb_warapper_inst : nb_warapper
	port map (
		-- clock & reset
		RST					=> '0', -- sys_reset, -- bb0_rst,
		CLK					=> clk_320,
		-- tuning interface
		NB_DVI  			=> nb_dvo,
		NB_NUM				=> nb_num,
		NB_SRC_IP			=> nb_src_ip,						
		NB_SRC_PORT			=> nb_src_port,	
		NB_DST_MAC			=> nb_dst_mac,				
		NB_DST_IP			=> nb_dst_ip,
		NB_DST_PORT			=> nb_dst_port,
        -- input interface
		S_AXIS_TDATA     	=> bkpln2nb_tdata,
		S_AXIS_TLAST    	=> bkpln2nb_tlast,
		S_AXIS_TVALID    	=> bkpln2nb_tvalid,
		-- HOST
		HOST_RDY			=> h10_done,
		-- output interface HOST settings
		SRC_IP     			=> nb_wrapper_src_ip,
		SRC_PORT   			=> nb_wrapper_src_port,
		DST_MAC    			=> nb_wrapper_dst_mac,
		DST_IP				=> nb_wrapper_dst_ip, 
		DST_PORT   			=> nb_wrapper_dst_port,
		PNUM				=> nb_pnum,
        -- output interface DATA
		M_AXIS_TDATA     	=> nb_axis_tdata,
		M_AXIS_TVALID    	=> nb_axis_tvalid 
	);

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>> instantiate component bb_warapper <<<<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
--bb_warapper_0_inst : bb_warapper
--	port map (
--		-- clock & reset
--		RST					=> '0', -- sys_reset, -- bb0_rst,
--		CLK					=> clk_320,
--		-- CDC tuning
--		BB_CDC_ARST			=> bb0_cdc_arst,
--		BB_CDC_VALID		=> bb0_cdc_valid,	
--		BB_CDC_PINC			=> bb0_cdc_pinc,
--		-- FIR tuning
--		BB_EN				=> bb0_en,		
--		BB_BAND				=> bb0_band,
--		BB_SCALE			=> bb0_scale,
--		-- status
--		FIR_READY			=> bb0_fir_ready,
--        -- input interface
--		S_AXIS_TDATA     	=> bkpln2bb_tdata,
--		S_AXIS_TVALID    	=> bkpln2bb_tvalid,
--		S_AXIS_TLAST    	=> bkpln2bb_tlast,			
--        -- output interface
--		M_AXIS_TDATA     	=> bb0_axis_tdata,
--		M_AXIS_TVALID    	=> bb0_axis_tvalid 
--	);

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>> instantiate component bb_warapper <<<<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
--bb_warapper_1_inst : bb_warapper
--	port map (
--		-- clock & reset
--		RST					=> '0', -- sys_reset, -- bb1_rst,
--		CLK					=> clk_320,
--		-- CDC tuning
--		BB_CDC_ARST			=> bb1_cdc_arst,
--		BB_CDC_VALID		=> bb1_cdc_valid,	
--		BB_CDC_PINC			=> bb1_cdc_pinc,
--		-- FIR tuning
--		BB_EN				=> bb1_en,		
--		BB_BAND				=> bb1_band,
--		BB_SCALE			=> bb1_scale,
--		-- status
--		FIR_READY			=> bb1_fir_ready,
--        -- input interface
--		S_AXIS_TDATA     	=> bkpln2bb_tdata,
--		S_AXIS_TVALID    	=> bkpln2bb_tvalid,
--		S_AXIS_TLAST    	=> bkpln2bb_tlast,		
--        -- output interface
--		M_AXIS_TDATA     	=> bb1_axis_tdata,
--		M_AXIS_TVALID    	=> bb1_axis_tvalid 
--	);

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>> instantiate component bb_warapper <<<<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
--bb_warapper_2_inst : bb_warapper
--	port map (
--		-- clock & reset
--		RST					=> '0', -- sys_reset, -- bb2_rst,
--		CLK					=> clk_320,
--		-- CDC tuning
--		BB_CDC_ARST			=> bb2_cdc_arst,
--		BB_CDC_VALID		=> bb2_cdc_valid,	
--		BB_CDC_PINC			=> bb2_cdc_pinc,
--		-- FIR tuning
--		BB_EN				=> bb2_en,		
--		BB_BAND				=> bb2_band,
--		BB_SCALE			=> bb2_scale,
--		-- status
--		FIR_READY			=> bb2_fir_ready,
--        -- input interface
--		S_AXIS_TDATA     	=> bkpln2bb_tdata,
--		S_AXIS_TVALID    	=> bkpln2bb_tvalid,
--		S_AXIS_TLAST    	=> bkpln2bb_tlast,	
--        -- output interface
--		M_AXIS_TDATA     	=> bb2_axis_tdata,
--		M_AXIS_TVALID    	=> bb2_axis_tvalid 
--	);

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>> instantiate component bb_warapper <<<<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
--bb_warapper_3_inst : bb_warapper
--	port map (
--		-- clock & reset
--		RST					=> '0', -- sys_reset, -- bb3_rst,
--		CLK					=> clk_320,
--		-- CDC tuning
--		BB_CDC_ARST			=> bb3_cdc_arst,
--		BB_CDC_VALID		=> bb3_cdc_valid,	
--		BB_CDC_PINC			=> bb3_cdc_pinc,
--		-- FIR tuning
--		BB_EN				=> bb3_en,		
--		BB_BAND				=> bb3_band,
--		BB_SCALE			=> bb3_scale,
--		-- status
--		FIR_READY			=> bb3_fir_ready,
--        -- input interface
--		S_AXIS_TDATA     	=> bkpln2bb_tdata,
--		S_AXIS_TVALID    	=> bkpln2bb_tvalid,
--		S_AXIS_TLAST    	=> bkpln2bb_tlast,		
--        -- output interface
--		M_AXIS_TDATA     	=> bb3_axis_tdata,
--		M_AXIS_TVALID    	=> bb3_axis_tvalid 
--	);

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>> instantiate component det_4x64_warapper <<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
--det_4x64_warapper_0_inst : det_4x64_warapper
--	port map (
--		-- clock & reset
--		RST					=> '0',
--		CLK					=> clk_320,
--		-- CDC tuning
--		DET_CDC_PINC		=> det0_cdc_pinc,
--		-- FIR tuning
--		DET_EN				=> det0_en,
--		DET_SCALE			=> det0_scale,
--        -- input interface
--		S_AXIS_TDATA     	=> bkpln2bb_tdata,
--		S_AXIS_TVALID    	=> bkpln2bb_tvalid,
--		S_AXIS_TLAST    	=> bkpln2bb_tlast,		
--		-- output interface
--		M_AXIS_TDATA     	=> det0_axis_tdata,
--		M_AXIS_TVALID    	=> det0_axis_tvalid 
--	);

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>> instantiate component det_4x64_warapper <<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
--det_4x64_warapper_1_inst : det_4x64_warapper
--	port map (
--		-- clock & reset
--		RST					=> '0',
--		CLK					=> clk_320,
--		-- CDC tuning
--		DET_CDC_PINC		=> det1_cdc_pinc,
--		-- FIR tuning
--		DET_EN				=> det1_en,
--		DET_SCALE			=> det1_scale,
--        -- input interface
--		S_AXIS_TDATA     	=> bkpln2bb_tdata,
--		S_AXIS_TVALID    	=> bkpln2bb_tvalid,
--		S_AXIS_TLAST    	=> bkpln2bb_tlast,		
--		-- output interface
--		M_AXIS_TDATA     	=> det1_axis_tdata,
--		M_AXIS_TVALID    	=> det1_axis_tvalid 
--	);

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>> instantiate component det_4x64_warapper <<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
--det_4x64_warapper_2_inst : det_4x64_warapper
--	port map (
--		-- clock & reset
--		RST					=> '0',
--		CLK					=> clk_320,
--		-- CDC tuning
--		DET_CDC_PINC		=> det2_cdc_pinc,
--		-- FIR tuning
--		DET_EN				=> det2_en,
--		DET_SCALE			=> det2_scale,
--        -- input interface
--		S_AXIS_TDATA     	=> bkpln2bb_tdata,
--		S_AXIS_TVALID    	=> bkpln2bb_tvalid,
--		S_AXIS_TLAST    	=> bkpln2bb_tlast,		
--		-- output interface
--		M_AXIS_TDATA     	=> det2_axis_tdata,
--		M_AXIS_TVALID    	=> det2_axis_tvalid 
--	);

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>> instantiate component det_4x64_warapper <<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
--det_4x64_warapper_3_inst : det_4x64_warapper
--	port map (
--		-- clock & reset
--		RST					=> '0',
--		CLK					=> clk_320,
--		-- CDC tuning
--		DET_CDC_PINC		=> det3_cdc_pinc,
--		-- FIR tuning
--		DET_EN				=> det3_en,
--		DET_SCALE			=> det3_scale,
--        -- input interface
--		S_AXIS_TDATA     	=> bkpln2bb_tdata,
--		S_AXIS_TVALID    	=> bkpln2bb_tvalid,
--		S_AXIS_TLAST    	=> bkpln2bb_tlast,		
--		-- output interface
--		M_AXIS_TDATA     	=> det3_axis_tdata,
--		M_AXIS_TVALID    	=> det3_axis_tvalid 
--	);

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>> instantiate component det_4x64_warapper <<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
--det_16x16_warapper_inst : det_16x16_warapper
--	port map (
--		-- clock & reset
--		RST					=> '0',
--		CLK					=> clk_320,
--		-- tuning
--		DET_EN				=> det4_en,
--	    -- input interface
--		S_AXIS_TDATA     	=> bkpln2bb_tdata,
--		S_AXIS_TVALID    	=> bkpln2bb_tvalid,
--		S_AXIS_TLAST    	=> bkpln2bb_tlast,			
--        -- output interface
--		M_AXIS_TDATA     	=> det4_axis_tdata,
--		M_AXIS_TVALID    	=> det4_axis_tvalid
--	);

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>>>>>>>>> power up reset <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
--process (dclk) begin
----	if (clkgen_bb_locked = '0') then
----		cnt_rst		<= (others => '0');
----		sys_reset	<= '1';
----		d0sys_reset	<= '1';
----		d1sys_reset	<= '1';
----		d2sys_reset	<= '1';
----		d3sys_reset	<= '1';
		
----	elsif (clk_320'event and clk_320 = '1') then
--	if (dclk'event and dclk = '1') then
	
--		if (cnt_rst < x"3FFF") then
--			cnt_rst		<= cnt_rst + 1;
--			sys_reset	<= '1';
--		else
--			sys_reset	<= '0';		
--		end if;
		
--		d0sys_reset	<= sys_reset;
--		d1sys_reset	<= d0sys_reset;
--		d2sys_reset	<= d1sys_reset;
--		d3sys_reset	<= d2sys_reset;
				
--	end if;
--end process;

--   HARD_SYNC_inst : HARD_SYNC
--   generic map (
--      INIT => '0',            -- Initial values, '0', '1'
--      IS_CLK_INVERTED => '0', -- Programmable inversion on CLK input
--      LATENCY => 2            -- 2-3
--   )
--   port map (
--      DOUT => DOUT, -- 1-bit output: Data
--      CLK => CLK,   -- 1-bit input: Clock
--      DIN => DIN    -- 1-bit input: Data
--   );

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>>>>>>>> TEST c2c interface <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
-- TODO: return
process (dclk) begin
    if (dclk'event and dclk = '1') then

 		cnt_test	<= cnt_test + 1;
 		
        if (cnt_test = 26) then
            c2z_axis_tlast <= '1';
        else
            c2z_axis_tlast <= '0';            
        end if;        
            
            if    (cnt_test = 11) then c2z_axis_tdata <= x"F0"; c2z_axis_tvalid <= '1'; 
            elsif (cnt_test = 12) then c2z_axis_tdata <= x"F0"; c2z_axis_tvalid <= '1';  
            elsif (cnt_test = 13) then c2z_axis_tdata <= x"F0"; c2z_axis_tvalid <= '1'; 
            elsif (cnt_test = 14) then c2z_axis_tdata <= x"F0"; c2z_axis_tvalid <= '1'; 
            elsif (cnt_test = 15) then c2z_axis_tdata <= x"11"; c2z_axis_tvalid <= '1'; 
            elsif (cnt_test = 16) then c2z_axis_tdata <= x"12"; c2z_axis_tvalid <= '1'; 
            elsif (cnt_test = 17) then c2z_axis_tdata <= x"13"; c2z_axis_tvalid <= '1'; 
            elsif (cnt_test = 18) then c2z_axis_tdata <= x"14"; c2z_axis_tvalid <= '1'; 
            elsif (cnt_test = 19) then c2z_axis_tdata <= x"15"; c2z_axis_tvalid <= '1'; 
            elsif (cnt_test = 20) then c2z_axis_tdata <= x"16"; c2z_axis_tvalid <= '1'; 
            elsif (cnt_test = 21) then c2z_axis_tdata <= x"17"; c2z_axis_tvalid <= '1'; 
            elsif (cnt_test = 22) then c2z_axis_tdata <= x"18"; c2z_axis_tvalid <= '1'; 
            elsif (cnt_test = 23) then c2z_axis_tdata <= x"0F"; c2z_axis_tvalid <= '1'; 
            elsif (cnt_test = 24) then c2z_axis_tdata <= x"0F"; c2z_axis_tvalid <= '1'; 
            elsif (cnt_test = 25) then c2z_axis_tdata <= x"0F"; c2z_axis_tvalid <= '1'; 
            elsif (cnt_test = 26) then c2z_axis_tdata <= x"17"; c2z_axis_tvalid <= '1'; 
            else  c2z_axis_tdata <= x"FF";  c2z_axis_tvalid <= '0'; 
            end if;
               
    end if;
end process;

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

z2c_axis_tready	<= '1';

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
-->>>>>>>>>>>>>>>>> instantiate component bkpln2nb <<<<<<<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
bkpln2nb_inst : bkpln2nb
	port map (
		-- clock & reset
		RST					=> '0', -- sys_reset,
		CLK_BKPLN           => c2bkpln_clk_out,
		CLK_OUT             => clk_320,
		-- SYNC
		SYNC_CLK_OUT		=> bkpln2bb_sync_clk_bb,
		SYNC_CLK_BKPLN		=> bkpln2bb_sync_clk_bkpln,
		-- C2BKPLN status
		CHANNEL0_UP			=> c2bkpln0_channel_up,
		CHANNEL1_UP			=> c2bkpln1_channel_up,		
		CHANNEL2_UP			=> c2bkpln2_channel_up,			
		CHANNEL3_UP			=> c2bkpln3_channel_up,
		CHANNEL4_UP			=> c2bkpln4_channel_up,		
		CHANNEL5_UP			=> c2bkpln5_channel_up,
		CHANNEL6_UP			=> c2bkpln6_channel_up,			
		CHANNEL7_UP			=> c2bkpln7_channel_up,
        -- input interface (CLK_BKPLN clock domain)
		------------------- SLOT 0 ------------------- 	
		S0_AXI_TDATA     	=> c2bkpln0_rx_tdata,
		S0_AXI_TKEEP     	=> c2bkpln0_rx_tkeep,
		S0_AXI_TVALID    	=> c2bkpln0_rx_tvalid,
		S0_AXI_TLAST     	=> c2bkpln0_rx_tlast,
		------------------- SLOT 1 ------------------- 	
		S1_AXI_TDATA     	=> c2bkpln1_rx_tdata,
		S1_AXI_TKEEP     	=> c2bkpln1_rx_tkeep,
		S1_AXI_TVALID    	=> c2bkpln1_rx_tvalid,
		S1_AXI_TLAST     	=> c2bkpln1_rx_tlast,
		------------------- SLOT 2 ------------------- 	
		S2_AXI_TDATA     	=> c2bkpln2_rx_tdata,
		S2_AXI_TKEEP     	=> c2bkpln2_rx_tkeep,
		S2_AXI_TVALID    	=> c2bkpln2_rx_tvalid,
		S2_AXI_TLAST     	=> c2bkpln2_rx_tlast,
		------------------- SLOT 3 ------------------- 	
		S3_AXI_TDATA     	=> c2bkpln3_rx_tdata,
		S3_AXI_TKEEP     	=> c2bkpln3_rx_tkeep,
		S3_AXI_TVALID    	=> c2bkpln3_rx_tvalid,
		S3_AXI_TLAST     	=> c2bkpln3_rx_tlast,		
		------------------- SLOT 4 ------------------- 	
		S4_AXI_TDATA     	=> c2bkpln4_rx_tdata,
		S4_AXI_TKEEP     	=> c2bkpln4_rx_tkeep,
		S4_AXI_TVALID    	=> c2bkpln4_rx_tvalid,
		S4_AXI_TLAST     	=> c2bkpln4_rx_tlast,		
		------------------- SLOT 5 ------------------- 	
		S5_AXI_TDATA     	=> c2bkpln5_rx_tdata,
		S5_AXI_TKEEP     	=> c2bkpln5_rx_tkeep,
		S5_AXI_TVALID    	=> c2bkpln5_rx_tvalid,
		S5_AXI_TLAST     	=> c2bkpln5_rx_tlast,		
		------------------- SLOT 6 ------------------- 	
		S6_AXI_TDATA     	=> c2bkpln6_rx_tdata,
		S6_AXI_TKEEP     	=> c2bkpln6_rx_tkeep,
		S6_AXI_TVALID    	=> c2bkpln6_rx_tvalid,
		S6_AXI_TLAST     	=> c2bkpln6_rx_tlast,			
		------------------- SLOT 7 ------------------- 	
		S7_AXI_TDATA     	=> c2bkpln7_rx_tdata,
		S7_AXI_TKEEP     	=> c2bkpln7_rx_tkeep,
		S7_AXI_TVALID    	=> c2bkpln7_rx_tvalid,
		S7_AXI_TLAST     	=> c2bkpln7_rx_tlast,
        -- input interface (CLK_OUT clock domain)
		M_AXI_TDATA     	=> bkpln2nb_tdata,
		M_AXI_TVALID    	=> bkpln2nb_tvalid,
		M_AXI_TLAST	    	=> bkpln2nb_tlast		
    );
	
-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>> instantiate component ila_bkpln2bb <<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
ila_bkpln2bb_inst : ila_bkpln2bb
	port map (
		clk 		=> clk_320,
		probe0(0) 	=> bkpln2nb_tvalid, -- h04_tvalid, -- bkpln2bb_tvalid, 
		probe1 		=> bkpln2nb_tdata, 	-- h04_tdata   -- bkpln2bb_tdata
		probe2(0)	=> bkpln2nb_tlast
	);
		
-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>> instantiate component dbg_ch_sel <<<<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
dbg_ch_sel_inst : dbg_ch_sel
	port map (
		-- clock & reset
		RST					=> dbg_ch_sel_rst, -- sys_reset,
		CLK  				=> c2bkpln_clk_out,
		-- tuning
		ADC_CH_NUM			=> dbg_adc_ch_num,
		-- input interface
    	S_AXI_TDATA     	=> c2bkpln2_rx_tdata,
		S_AXI_TKEEP     	=> c2bkpln2_rx_tkeep,
		S_AXI_TVALID    	=> c2bkpln2_rx_tvalid,
		S_AXI_TLAST     	=> c2bkpln2_rx_tlast,
		-- output interface
    	M_AXI_TDATA     	=> dbg_tdata,
		M_AXI_TVALID     	=> dbg_tvalid	
	);

dbg_tdata_i	<= dbg_tdata(15 downto  0);
dbg_tdata_q	<= dbg_tdata(31 downto 16);

dbg_ch_sel_rst	<= sys_reset; --  and pktgen_0_en;

data_collector_i_inst : data_collector
    generic map (
        BW_DI   => 16,
        BW_CH   => 4
    )
    port map (
        CLK 	=> c2bkpln_clk_out,
        RST 	=> '0',
        SEL 	=> x"0",
        DI  	=> dbg_tdata_i,
        CH  	=> x"0",
        DVI 	=> dbg_tvalid,
        DO		=> dbg_col_tdata_i,
        DVO 	=> dbg_col_tvalid
    ); 

data_collector_q_inst : data_collector
    generic map (
        BW_DI   => 16,
        BW_CH   => 4
    )
    port map (
        CLK 	=> c2bkpln_clk_out,
        RST 	=> '0',
        SEL 	=> x"0",
        DI  	=> dbg_tdata_q,
        CH  	=> x"0",
        DVI 	=> dbg_tvalid,
        DO		=> dbg_col_tdata_q,
        DVO 	=> open
    ); 

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>> instantiate component dbg_ch_sel_clk_conv <<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
--dbg_ch_sel_clk_conv_inst : dbg_ch_sel_clk_conv
--	port map (
--    	s_axis_aresetn 	=> rst_n,
--    	m_axis_aresetn 	=> rst_n,
--    	s_axis_aclk 	=> c2bkpln_clk_out,
--    	s_axis_tvalid 	=> dbg_tvalid,
--    	s_axis_tready 	=> open,
--    	s_axis_tdata 	=> dbg_tdata,
--    	m_axis_aclk 	=> exdes_0_tx_axis_clk,
--   	 	m_axis_tvalid 	=> h0_tvalid,
--    	m_axis_tready 	=> h0_tready,
--    	m_axis_tdata 	=> h0_tdata
--  	);

--rst_n			<= not sys_reset;
	
-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>> instantiate component vio_bkpln_dbg <<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
vio_bkpln_dbg_inst : vio_bkpln_dbg
	port map (
	    clk 			=> c2bkpln_clk_out,
		probe_out0 		=> dbg_adc_ch_num 
	);

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>> instantiate component ila_bkpln_dbg <<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
ila_bkpln_dbg_inst : ila_bkpln_dbg
	port map (
		clk 		=> c2bkpln_clk_out,
		probe0(0) 	=> dbg_col_tvalid,  -- dbg_tvalid, 
		probe1 		=> dbg_col_tdata_i, -- dbg_tdata_i, 
		probe2 		=> dbg_col_tdata_q  -- dbg_tdata_q
	);

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>>> instantiate component cnt_us <<<<<<<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
cnt_us_0_inst : cnt_us
	generic map (
		CLK_FREQ  	=> 320 --100 -- clock in MHz ([15:0])
	)
	port map (
	    -- clock & reset
		RST         => '0', -- sys_reset,
	    CLK         => clk_320, -- exdes_0_tx_axis_clk, -- dclk,
		-- us counter
		CNT 		=> counter_us
	);

-- QSFP 2
h00_tdata	<= bb0_axis_tdata;
h00_tvalid	<= bb0_axis_tvalid;

h01_tdata	<= bb1_axis_tdata;
h01_tvalid	<= bb1_axis_tvalid;

h02_tdata	<= bb2_axis_tdata;
h02_tvalid	<= bb2_axis_tvalid;

h03_tdata	<= bb3_axis_tdata;
h03_tvalid	<= bb3_axis_tvalid;

h04_tdata	<= det4_axis_tdata;
h04_tvalid	<= det4_axis_tvalid;

-- QSFP 3
h10_tdata	<= nb_axis_tdata;  -- det0_axis_tdata;
h10_tvalid	<= nb_axis_tvalid; -- det0_axis_tvalid;

h11_tdata	<= det1_axis_tdata;
h11_tvalid	<= det1_axis_tvalid;

h12_tdata	<= det2_axis_tdata;
h12_tvalid	<= det2_axis_tvalid;

h13_tdata	<= det3_axis_tdata;
h13_tvalid	<= det3_axis_tvalid;

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>> instantiate component host_1x_64b_wrapper <<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
--host_1x_64b_wrapper_bb0_inst : host_1x_64b_wrapper
--	generic map (
--		ETH_TYPE		=> ETH_TYPE,
--		IP_VER_LEN		=> IP_VER_LEN,
--		TTL				=> TTL,
--		IP_PROTO		=> IP_PROTO,
--		PKT_SIZE    	=> PKT_SIZE_X64
--	)
--	port map (
--	    -- clock & reset
--		RST             => '0', -- sys_reset,
--		CLK             => clk_320, -- exdes_0_tx_axis_clk,
--		CLK_IN  		=> clk_320,
--	    CLK_CMD			=> clk_320, -- exdes_0_tx_axis_clk,
--		-- restart (CLK_CMD clock domain)
--		RESTART			=> '0', -- bb0_host_reload,
--		RESTART_DONE	=> open,
--		-- host tuning (CLK_CMD clock domain)
--		SRC_MAC    		=> MAC_BB0,
--		SRC_IP     		=> bb0_src_ip,
--		SRC_PORT   		=> bb0_src_port,
--		DST_MAC    		=> bb0_dst_mac,
--		DST_IP			=> bb0_dst_ip,
--		DST_PORT   		=> bb0_dst_port,
--		-- user header (CLK_CMD clock domain)
--		CNT_US			=> counter_us,
--		-- input data (CLK_IN clock domain)
--	    S_AXIS_TDATA    => h00_tdata,
--		S_AXIS_TVALID   => h00_tvalid,		
--		S_AXIS_TREADY   => h00_tready,
--		-- host data( CLK clock domain)
--	    M_AXIS_TDATA    => sw00_axis_tdata,
--		M_AXIS_TVALID   => sw00_axis_tvalid,
--		M_AXIS_TREADY   => sw00_axis_tready,
--		M_AXIS_TLAST    => sw00_axis_tlast			
--	);

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>> instantiate component host_1x_64b_wrapper <<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
--host_1x_64b_wrapper_bb1_inst : host_1x_64b_wrapper
--	generic map (
--		ETH_TYPE		=> ETH_TYPE,
--		IP_VER_LEN		=> IP_VER_LEN,
--		TTL				=> TTL,
--		IP_PROTO		=> IP_PROTO,
--		PKT_SIZE    	=> PKT_SIZE_X64
--	)
--	port map (
--	    -- clock & reset
--		RST             => '0', -- sys_reset,
--		CLK             => clk_320, -- exdes_0_tx_axis_clk,
--		CLK_IN          => clk_320,
--	    CLK_CMD			=> clk_320, -- exdes_0_tx_axis_clk,
--		-- restart
--		RESTART			=> '0', -- bb1_host_reload,
--		RESTART_DONE	=> open,
--		-- host tuning
--		SRC_MAC    		=> MAC_BB1,
--		SRC_IP     		=> bb1_src_ip,
--		SRC_PORT   		=> bb1_src_port,
--		DST_MAC    		=> bb1_dst_mac,
--		DST_IP			=> bb1_dst_ip,
--		DST_PORT   		=> bb1_dst_port,
--		-- user header
--		CNT_US			=> counter_us,
--		-- input data
--	    S_AXIS_TDATA    => h01_tdata,
--		S_AXIS_TVALID   => h01_tvalid,		
--		S_AXIS_TREADY   => h01_tready,
--		-- host data
--	    M_AXIS_TDATA    => sw01_axis_tdata,
--		M_AXIS_TVALID   => sw01_axis_tvalid,
--		M_AXIS_TREADY   => sw01_axis_tready,
--		M_AXIS_TLAST    => sw01_axis_tlast				
--	);

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>> instantiate component host_1x_64b_wrapper <<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
--host_1x_64b_wrapper_bb2_inst : host_1x_64b_wrapper
--	generic map (
--		ETH_TYPE		=> ETH_TYPE,
--		IP_VER_LEN		=> IP_VER_LEN,
--		TTL				=> TTL,
--		IP_PROTO		=> IP_PROTO,
--		PKT_SIZE    	=> PKT_SIZE_X64
--	)
--	port map (
--	    -- clock & reset
--		RST             => '0', -- sys_reset,
--		CLK             => clk_320, -- exdes_0_tx_axis_clk,
--		CLK_IN          => clk_320,
--	    CLK_CMD			=> clk_320, -- exdes_0_tx_axis_clk,
--		-- restart
--		RESTART			=> '0', -- bb2_host_reload,
--		RESTART_DONE	=> open,
--		-- host tuning
--		SRC_MAC    		=> MAC_BB2,
--		SRC_IP     		=> bb2_src_ip,
--		SRC_PORT   		=> bb2_src_port,
--		DST_MAC    		=> bb2_dst_mac,
--		DST_IP			=> bb2_dst_ip,
--		DST_PORT   		=> bb2_dst_port,
--		-- user header
--		CNT_US			=> counter_us,
--		-- input data
--	    S_AXIS_TDATA    => h02_tdata,
--		S_AXIS_TVALID   => h02_tvalid,		
--		S_AXIS_TREADY   => h02_tready,
--		-- host data
--	    M_AXIS_TDATA    => sw02_axis_tdata,
--		M_AXIS_TVALID   => sw02_axis_tvalid,
--		M_AXIS_TREADY   => sw02_axis_tready,
--		M_AXIS_TLAST    => sw02_axis_tlast				
--	);

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>> instantiate component host_1x_64b_wrapper <<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
--host_1x_64b_wrapper_bb3_inst : host_1x_64b_wrapper
--	generic map (
--		ETH_TYPE		=> ETH_TYPE,
--		IP_VER_LEN		=> IP_VER_LEN,
--		TTL				=> TTL,
--		IP_PROTO		=> IP_PROTO,
--		PKT_SIZE    	=> PKT_SIZE_X64
--	)
--	port map (
--	    -- clock & reset
--		RST             => '0', -- sys_reset,
--		CLK             => clk_320, -- exdes_0_tx_axis_clk,
--		CLK_IN          => clk_320,
--	    CLK_CMD			=> clk_320, -- exdes_0_tx_axis_clk,
--		-- restart
--		RESTART			=> '0', -- bb3_host_reload,
--		RESTART_DONE	=> open,
--		-- host tuning
--		SRC_MAC    		=> MAC_BB3,
--		SRC_IP     		=> bb3_src_ip,
--		SRC_PORT   		=> bb3_src_port,
--		DST_MAC    		=> bb3_dst_mac,
--		DST_IP			=> bb3_dst_ip,
--		DST_PORT   		=> bb3_dst_port,
--		-- user header
--		CNT_US			=> counter_us,
--		-- input data
--	    S_AXIS_TDATA    => h03_tdata,
--		S_AXIS_TVALID   => h03_tvalid,		
--		S_AXIS_TREADY   => h03_tready,
--		-- host data
--	    M_AXIS_TDATA    => sw03_axis_tdata,
--		M_AXIS_TVALID   => sw03_axis_tvalid,
--		M_AXIS_TREADY   => sw03_axis_tready,
--		M_AXIS_TLAST    => sw03_axis_tlast				
--	);

-------------------------------------------------------------------------------
-->>>>>>>>>>> instantiate component host_1x_64b_pnum_wrapper <<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
host_1x_64b_pnum_wrapper_nb_inst : host_1x_64b_pnum_wrapper
	generic map (
		ETH_TYPE		=> ETH_TYPE,
		IP_VER_LEN		=> IP_VER_LEN,
		TTL				=> TTL,
		IP_PROTO		=> IP_PROTO,
		PKT_SIZE    	=> PKT_SIZE_X64_NB
	)
	port map (
	    -- clock & reset
		RST             => '0', -- sys_reset,
		CLK             => clk_320, -- exdes_0_tx_axis_clk,
		CLK_IN  		=> clk_320,
	    CLK_CMD			=> clk_320, -- exdes_0_tx_axis_clk,
		-- restart (CLK_CMD clock domain)
		RESTART			=> '0', -- bb0_host_reload,
		RESTART_DONE	=> h10_done,
		-- host tuning (CLK_CMD clock domain)
		SRC_MAC    		=> MAC_NB,
		SRC_IP     		=> nb_wrapper_src_ip,
		SRC_PORT   		=> nb_wrapper_src_port,
		DST_MAC    		=> nb_wrapper_dst_mac,
		DST_IP			=> nb_wrapper_dst_ip,
		DST_PORT   		=> nb_wrapper_dst_port,
		PNUM			=> nb_pnum,
		-- user header (CLK_CMD clock domain)
		CNT_US			=> counter_us,
		-- input data (CLK_IN clock domain)
	    S_AXIS_TDATA    => h10_tdata,
		S_AXIS_TVALID   => h10_tvalid,		
		S_AXIS_TREADY   => h10_tready,
		-- host data( CLK clock domain)
	    M_AXIS_TDATA    => sw10_axis_tdata,
		M_AXIS_TVALID   => sw10_axis_tvalid,
		M_AXIS_TREADY   => sw10_axis_tready,
		M_AXIS_TLAST    => sw10_axis_tlast			
	);

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>> instantiate component nb_host_ila <<<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
nb_host_ila_inst : nb_host_ila
	port map (
		clk 		=> clk_320,
		probe0(0) 	=> h10_tvalid, 
		probe1 		=> h10_tdata, 
		probe2 		=> nb_wrapper_src_ip,
		probe3 		=> nb_wrapper_src_port
	);

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>> instantiate component host_1x_64b_wrapper <<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
--host_1x_64b_wrapper_det1_inst : host_1x_64b_wrapper
--	generic map (
--		ETH_TYPE		=> ETH_TYPE,
--		IP_VER_LEN		=> IP_VER_LEN,
--		TTL				=> TTL,
--		IP_PROTO		=> IP_PROTO,
--		PKT_SIZE    	=> PKT_SIZE_X64
--	)
--	port map (
--	    -- clock & reset
--		RST             => '0', -- sys_reset,
--		CLK             => clk_320, -- exdes_0_tx_axis_clk,
--		CLK_IN  		=> clk_320,
--	    CLK_CMD			=> clk_320, -- exdes_0_tx_axis_clk,
--		-- restart (CLK_CMD clock domain)
--		RESTART			=> '0', -- bb0_host_reload,
--		RESTART_DONE	=> open,
--		-- host tuning (CLK_CMD clock domain)
--		SRC_MAC    		=> MAC_DET1,
--		SRC_IP     		=> det1_src_ip,
--		SRC_PORT   		=> det1_src_port,
--		DST_MAC    		=> det1_dst_mac,
--		DST_IP			=> det1_dst_ip,
--		DST_PORT   		=> det1_dst_port,
--		-- user header (CLK_CMD clock domain)
--		CNT_US			=> counter_us,
--		-- input data (CLK_IN clock domain)
--	    S_AXIS_TDATA    => h11_tdata,
--		S_AXIS_TVALID   => h11_tvalid,		
--		S_AXIS_TREADY   => h11_tready,
--		-- host data( CLK clock domain)
--	    M_AXIS_TDATA    => sw11_axis_tdata,
--		M_AXIS_TVALID   => sw11_axis_tvalid,
--		M_AXIS_TREADY   => sw11_axis_tready,
--		M_AXIS_TLAST    => sw11_axis_tlast			
--	);
	
-------------------------------------------------------------------------------
-->>>>>>>>>>>>>> instantiate component host_1x_64b_wrapper <<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
--host_1x_64b_wrapper_det2_inst : host_1x_64b_wrapper
--	generic map (
--		ETH_TYPE		=> ETH_TYPE,
--		IP_VER_LEN		=> IP_VER_LEN,
--		TTL				=> TTL,
--		IP_PROTO		=> IP_PROTO,
--		PKT_SIZE    	=> PKT_SIZE_X64
--	)
--	port map (
--	    -- clock & reset
--		RST             => '0', -- sys_reset,
--		CLK             => clk_320, -- exdes_0_tx_axis_clk,
--		CLK_IN  		=> clk_320,
--	    CLK_CMD			=> clk_320, -- exdes_0_tx_axis_clk,
--		-- restart (CLK_CMD clock domain)
--		RESTART			=> '0', -- bb0_host_reload,
--		RESTART_DONE	=> open,
--		-- host tuning (CLK_CMD clock domain)
--		SRC_MAC    		=> MAC_DET2,
--		SRC_IP     		=> det2_src_ip,
--		SRC_PORT   		=> det2_src_port,
--		DST_MAC    		=> det2_dst_mac,
--		DST_IP			=> det2_dst_ip,
--		DST_PORT   		=> det2_dst_port,
--		-- user header (CLK_CMD clock domain)
--		CNT_US			=> counter_us,
--		-- input data (CLK_IN clock domain)
--	    S_AXIS_TDATA    => h12_tdata,
--		S_AXIS_TVALID   => h12_tvalid,		
--		S_AXIS_TREADY   => h12_tready,
--		-- host data( CLK clock domain)
--	    M_AXIS_TDATA    => sw12_axis_tdata,
--		M_AXIS_TVALID   => sw12_axis_tvalid,
--		M_AXIS_TREADY   => sw12_axis_tready,
--		M_AXIS_TLAST    => sw12_axis_tlast			
--	);
	
-------------------------------------------------------------------------------
-->>>>>>>>>>>>>> instantiate component host_1x_64b_wrapper <<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
--host_1x_64b_wrapper_det3_inst : host_1x_64b_wrapper
--	generic map (
--		ETH_TYPE		=> ETH_TYPE,
--		IP_VER_LEN		=> IP_VER_LEN,
--		TTL				=> TTL,
--		IP_PROTO		=> IP_PROTO,
--		PKT_SIZE    	=> PKT_SIZE_X64
--	)
--	port map (
--	    -- clock & reset
--		RST             => '0', -- sys_reset,
--		CLK             => clk_320, -- exdes_0_tx_axis_clk,
--		CLK_IN  		=> clk_320,
--	    CLK_CMD			=> clk_320, -- exdes_0_tx_axis_clk,
--		-- restart (CLK_CMD clock domain)
--		RESTART			=> '0', -- bb0_host_reload,
--		RESTART_DONE	=> open,
--		-- host tuning (CLK_CMD clock domain)
--		SRC_MAC    		=> MAC_DET3,
--		SRC_IP     		=> det3_src_ip,
--		SRC_PORT   		=> det3_src_port,
--		DST_MAC    		=> det3_dst_mac,
--		DST_IP			=> det3_dst_ip,
--		DST_PORT   		=> det3_dst_port,
--		-- user header (CLK_CMD clock domain)
--		CNT_US			=> counter_us,
--		-- input data (CLK_IN clock domain)
--	    S_AXIS_TDATA    => h13_tdata,
--		S_AXIS_TVALID   => h13_tvalid,		
--		S_AXIS_TREADY   => h13_tready,
--		-- host data( CLK clock domain)
--	    M_AXIS_TDATA    => sw13_axis_tdata,
--		M_AXIS_TVALID   => sw13_axis_tvalid,
--		M_AXIS_TREADY   => sw13_axis_tready,
--		M_AXIS_TLAST    => sw13_axis_tlast			
--	);
	
-------------------------------------------------------------------------------
-->>>>>>>>>>>>>> instantiate component host_1x_64b_wrapper <<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
--host_1x_64b_wrapper_det4_inst : host_1x_64b_wrapper
--	generic map (
--		ETH_TYPE		=> ETH_TYPE,
--		IP_VER_LEN		=> IP_VER_LEN,
--		TTL				=> TTL,
--		IP_PROTO		=> IP_PROTO,
--		PKT_SIZE    	=> PKT_SIZE_X64
--	)
--	port map (
--	    -- clock & reset
--		RST             => '0', -- sys_reset,
--		CLK             => clk_320, -- exdes_0_tx_axis_clk,
--		CLK_IN  		=> clk_320,
--	    CLK_CMD			=> clk_320, -- exdes_0_tx_axis_clk,
--		-- restart (CLK_CMD clock domain)
--		RESTART			=> '0', -- bb0_host_reload,
--		RESTART_DONE	=> open,
--		-- host tuning (CLK_CMD clock domain)
--		SRC_MAC    		=> MAC_DET4,
--		SRC_IP     		=> det4_src_ip,
--		SRC_PORT   		=> det4_src_port,
--		DST_MAC    		=> det4_dst_mac,
--		DST_IP			=> det4_dst_ip,
--		DST_PORT   		=> det4_dst_port,
--		-- user header (CLK_CMD clock domain)
--		CNT_US			=> counter_us,
--		-- input data (CLK_IN clock domain)
--	    S_AXIS_TDATA    => h04_tdata,
--		S_AXIS_TVALID   => h04_tvalid,		
--		S_AXIS_TREADY   => h04_tready,
--		-- host data( CLK clock domain)
--	    M_AXIS_TDATA    => sw04_axis_tdata,
--		M_AXIS_TVALID   => sw04_axis_tvalid,
--		M_AXIS_TREADY   => sw04_axis_tready,
--		M_AXIS_TLAST    => sw04_axis_tlast			
--	);
	
-------------------------------------------------------------------------------
-->>>>>>>>>>>>>> instantiate component host_1x_wrapper <<<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
--host_1x_wrapper_10_inst : host_1x_wrapper
--	generic map (
--		ETH_TYPE		=> ETH_TYPE,
--		IP_VER_LEN		=> IP_VER_LEN,
--		TTL				=> TTL,
--		IP_PROTO		=> IP_PROTO,
--		PKT_SIZE    	=> PKT_SIZE_X32
--	)
--	port map (
--	    -- clock & reset
--		RST             => '0', -- sys_reset,
--		CLK             => exdes_1_tx_axis_clk, -- dclk,
--		CLK_IN  		=> c2bkpln_clk_out,
--	    CLK_CMD			=> exdes_1_tx_axis_clk, -- dclk,
--		-- restart
--		RESTART			=> '0',
--		RESTART_DONE	=> open,
--		-- host tuning
--		SRC_MAC    		=> MAC_DET16,
--		SRC_IP     		=> det16_src_ip,
--		SRC_PORT   		=> det16_src_port,
--		DST_MAC    		=> det16_dst_mac,
--		DST_IP			=> det16_dst_ip,
--		DST_PORT   		=> det16_dst_port,
--		-- user header
--		CNT_US			=> counter_us,
--		-- input data (CLK_IN clock domain)
--	    S_AXIS_TDATA    => h10_tdata,
--		S_AXIS_TVALID   => h10_tvalid,		
--		S_AXIS_TREADY   => h10_tready,
--		-- host data
--	    M_AXIS_TDATA    => sw10_axis_tdata,
--		M_AXIS_TVALID   => sw10_axis_tvalid,
--		M_AXIS_TREADY   => sw10_axis_tready,
--		M_AXIS_TLAST    => sw10_axis_tlast				
--	);

-------------------------------------------------------------------------------
-->>>>>>>>>>>> instantiate component host_1x_wrapper <<<<<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
--host_1x_tester_0_inst : host_1x_64b_tester
--	port map (
--    	-- clock & reset
--		RST             => '0', -- sys_reset,
--	    CLK             => clk_320, -- exdes_0_tx_axis_clk, -- dclk,
--		-- tuning
--        RKT_GEN_ENABLE  => pktgen_0_en,
--		RKT_GEN_TIMEOUT => pktgen_0_timout,
--		-- output data
--   	 	M_AXIS_TDATA    => h00_tdata,
--		M_AXIS_TVALID   => h00_tvalid,		
--		M_AXIS_TREADY   => h00_tready
--	);

-------------------------------------------------------------------------------
-->>>>>>>>>>>> instantiate component host_1x_wrapper <<<<<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
--host_1x_tester_1_inst : host_1x_64b_tester
--	port map (
--    	-- clock & reset
--		RST             => '0', -- sys_reset,
--	    CLK             => clk_320, -- exdes_0_tx_axis_clk, -- dclk,
--		-- tuning
--        RKT_GEN_ENABLE  => pktgen_1_en,
--		RKT_GEN_TIMEOUT => pktgen_1_timout,
--		-- output data
--   	 	M_AXIS_TDATA    => h01_tdata,
--		M_AXIS_TVALID   => h01_tvalid,		
--		M_AXIS_TREADY   => h01_tready
--	);

-------------------------------------------------------------------------------
-->>>>>>>>>>>> instantiate component host_1x_wrapper <<<<<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
--host_1x_tester_2_inst : host_1x_64b_tester
--	port map (
--    	-- clock & reset
--		RST             => '0', -- sys_reset,
--	    CLK             => clk_320, -- exdes_0_tx_axis_clk, -- dclk,
--		-- tuning
--        RKT_GEN_ENABLE  => pktgen_2_en,
--		RKT_GEN_TIMEOUT => pktgen_2_timout,
--		-- output data
--   	 	M_AXIS_TDATA    => h02_tdata,
--		M_AXIS_TVALID   => h02_tvalid,		
--		M_AXIS_TREADY   => h02_tready
--	);

-------------------------------------------------------------------------------
-->>>>>>>>>>>> instantiate component host_1x_wrapper <<<<<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
--host_1x_tester_3_inst : host_1x_64b_tester
--	port map (
--    	-- clock & reset
--		RST             => '0', -- sys_reset,
--	    CLK             => clk_320, -- exdes_0_tx_axis_clk, -- dclk,
--		-- tuning
--        RKT_GEN_ENABLE  => pktgen_3_en,
--		RKT_GEN_TIMEOUT => pktgen_3_timout,
--		-- output data
--   	 	M_AXIS_TDATA    => h03_tdata,
--		M_AXIS_TVALID   => h03_tvalid,		
--		M_AXIS_TREADY   => h03_tready
--	);

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>> instantiate component exdes_wrapper <<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
exdes_wrapper_inst : exdes_wrapper
	port map (
    	-- clock & reset
    	RST             => sys_reset,
    	DCLK            => dclk,
		-- GTH ref clock			
		GT_REFCLK_P     => GT_REFCLK_P,
		GT_REFCLK_N		=> GT_REFCLK_N,
		-- input interface clock
    	CLK_EXDES_0     => clk_320, -- exdes_0_tx_axis_clk,
    	CLK_EXDES_1     => clk_320, -- exdes_1_tx_axis_clk,
    	-- output 40G MAC clock
    	CLK_EXDES_OUT_0 => exdes_0_tx_axis_clk,
    	CLK_EXDES_OUT_1 => exdes_1_tx_axis_clk,
        ------------- exdes 0 -------------
    	-- input 0 (CLK_EXDES_0 clock domain)
    	S00_AXIS_TDATA  => sw00_axis_tdata,
    	S00_AXIS_TVALID => sw00_axis_tvalid,
    	S00_AXIS_TLAST  => sw00_axis_tlast,
    	S00_AXIS_TREADY => sw00_axis_tready,
    	-- input 1 (CLK_EXDES_0 clock domain)
    	S01_AXIS_TDATA  => sw01_axis_tdata,
    	S01_AXIS_TVALID => sw01_axis_tvalid,
    	S01_AXIS_TLAST  => sw01_axis_tlast,
    	S01_AXIS_TREADY => sw01_axis_tready,
    	-- input 2 (CLK_EXDES_0 clock domain)
    	S02_AXIS_TDATA  => sw02_axis_tdata,
    	S02_AXIS_TVALID => sw02_axis_tvalid,
    	S02_AXIS_TLAST  => sw02_axis_tlast,
    	S02_AXIS_TREADY => sw02_axis_tready,      
    	-- input 3 (CLK_EXDES_0 clock domain)
    	S03_AXIS_TDATA  => sw03_axis_tdata,
    	S03_AXIS_TVALID => sw03_axis_tvalid,
    	S03_AXIS_TLAST  => sw03_axis_tlast,
    	S03_AXIS_TREADY => sw03_axis_tready,
    	-- input 4 (CLK_EXDES_0 clock domain)
    	S04_AXIS_TDATA  => sw04_axis_tdata,
    	S04_AXIS_TVALID => sw04_axis_tvalid,
    	S04_AXIS_TLAST  => sw04_axis_tlast,
    	S04_AXIS_TREADY => sw04_axis_tready,    	
        ------------- exdes 1 -------------
    	-- input 0 (CLK_EXDES_1 clock domain)
    	S10_AXIS_TDATA  => sw10_axis_tdata,
    	S10_AXIS_TVALID => sw10_axis_tvalid,
    	S10_AXIS_TLAST  => sw10_axis_tlast,
    	S10_AXIS_TREADY => sw10_axis_tready,
    	-- input 1 (CLK_EXDES_1 clock domain)
    	S11_AXIS_TDATA  => sw11_axis_tdata,
    	S11_AXIS_TVALID => sw11_axis_tvalid,
    	S11_AXIS_TLAST  => sw11_axis_tlast,
    	S11_AXIS_TREADY => sw11_axis_tready,
    	-- input 2 (CLK_EXDES_1 clock domain)
    	S12_AXIS_TDATA  => sw12_axis_tdata,
    	S12_AXIS_TVALID => sw12_axis_tvalid,
    	S12_AXIS_TLAST  => sw12_axis_tlast,
    	S12_AXIS_TREADY => sw12_axis_tready,
    	-- input 3 (CLK_EXDES_1 clock domain)
    	S13_AXIS_TDATA  => sw13_axis_tdata,
    	S13_AXIS_TVALID => sw13_axis_tvalid,
    	S13_AXIS_TLAST  => sw13_axis_tlast,
    	S13_AXIS_TREADY => sw13_axis_tready,
    	-- status 40G MAC	
		RX0_GT_LOCKED 	=> exdes_0_rx_gt_locked,
		RX0_GT_ALIGNED 	=> exdes_0_rx_aligned,
		RX1_GT_LOCKED 	=> exdes_1_rx_gt_locked,
		RX1_GT_ALIGNED 	=> exdes_1_rx_aligned				
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

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>>>> instantiate component vio_0 <<<<<<<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
vio_0_inst : vio_0
	port map (
    	clk 			=> dclk,
		probe_in0(0) 	=> exdes_1_rx_gt_locked,
		probe_in1(0) 	=> exdes_1_rx_aligned,		
		probe_in2(0) 	=> c2bkpln0_channel_up,
		probe_in3(0) 	=> c2bkpln1_channel_up,
		probe_in4(0) 	=> c2bkpln2_channel_up,
		probe_in5(0) 	=> c2bkpln3_channel_up,
		probe_in6(0) 	=> c2bkpln4_channel_up,
		probe_in7(0) 	=> c2bkpln5_channel_up,
		probe_in8(0) 	=> c2bkpln6_channel_up,		
		probe_in9(0) 	=> c2bkpln7_channel_up,
		probe_in10(0) 	=> exdes_0_rx_gt_locked,
		probe_in11(0) 	=> exdes_0_rx_aligned,
						
   	 	probe_out0(0) 	=> sys_reset
--   	 	probe_out1	 	=> HOST_SRC_MAC,
--   	 	probe_out2	 	=> HOST_SRC_PORT,   	 	
--   	 	probe_out3	 	=> HOST_SRC_IP,
--   	 	probe_out4	 	=> HOST_DST_MAC,  
--   	 	probe_out5	 	=> HOST_DST_IP,
--   	 	probe_out6	 	=> HOST_DST_PORT,   	 	
--   	 	probe_out7(0)	=> RKT_GEN_ENABLE,
--   	 	probe_out8	 	=> RKT_GEN_TIMEOUT,     	 	
--   	 	probe_out9	 	=> RKT_GEN_PKT_SIZE	   	 	
  	); 

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>> instantiate component vio_host_0 <<<<<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
--vio_host_0_inst : vio_host_0
--	port map (
--	    clk 			=> clk_320, -- exdes_0_tx_axis_clk, -- dclk,
--		probe_out0 		=> host_0_src_mac,
--		probe_out1 		=> host_0_src_ip,
--		probe_out2 		=> host_0_src_port,
--		probe_out3 		=> host_0_dst_mac,
--		probe_out4		=> host_0_dst_ip,
--		probe_out5 		=> host_0_dst_port
----		probe_out6(0)	=> pktgen_0_en,
----		probe_out7 		=> pktgen_0_timout
--		-- probe_out8 		=> pktgen_0_size  
--	);

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>> instantiate component vio_host_1 <<<<<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
--vio_host_1_inst : vio_host_1
--	port map (
--	    clk 			=> clk_320, -- exdes_0_tx_axis_clk, --dclk,
--		probe_out0 		=> host_1_src_mac,
--		probe_out1 		=> host_1_src_ip,
--		probe_out2 		=> host_1_src_port,
--		probe_out3 		=> host_1_dst_mac,
--		probe_out4		=> host_1_dst_ip,
--		probe_out5 		=> host_1_dst_port
----		probe_out6(0)	=> pktgen_1_en,
----		probe_out7 		=> pktgen_1_timout
----		probe_out8 		=> pktgen_1_size  
--	);

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>> instantiate component vio_host_2 <<<<<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
--vio_host_2_inst : vio_host_2
--	port map (
--	    clk 			=> clk_320, -- exdes_0_tx_axis_clk, --dclk,
--		probe_out0 		=> host_2_src_mac,
--		probe_out1 		=> host_2_src_ip,
--		probe_out2 		=> host_2_src_port,
--		probe_out3 		=> host_2_dst_mac,
--		probe_out4		=> host_2_dst_ip,
--		probe_out5 		=> host_2_dst_port
----		probe_out6(0)	=> pktgen_2_en,
----		probe_out7 		=> pktgen_2_timout
----		probe_out8 		=> pktgen_2_size  
--	);	
	
-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>> instantiate component vio_host_3 <<<<<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
--vio_host_3_inst : vio_host_3
--	port map (
--	    clk 			=> clk_320, -- exdes_0_tx_axis_clk, --dclk,
--		probe_out0 		=> host_3_src_mac,
--		probe_out1 		=> host_3_src_ip,
--		probe_out2 		=> host_3_src_port,
--		probe_out3 		=> host_3_dst_mac,
--		probe_out4		=> host_3_dst_ip,
--		probe_out5 		=> host_3_dst_port
----		probe_out6(0)	=> pktgen_3_en,
----		probe_out7 		=> pktgen_3_timout
----		probe_out8 		=> pktgen_3_size  
--	);	
	
end mrdk_40g_a_arch;
