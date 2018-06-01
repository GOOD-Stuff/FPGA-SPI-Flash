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

---- ad9653_wrapper
signal clk_done			: std_logic;
signal fsm_done			: std_logic;
signal adc_data_ch0		: std_logic_vector(15 downto 0);
signal adc_data_ch1		: std_logic_vector(15 downto 0);
signal adc_data_ch2		: std_logic_vector(15 downto 0);
signal adc_data_ch3		: std_logic_vector(15 downto 0);

---- ser_adc
signal adc_clkx4_dv		: std_logic := '0';
signal adc_clkx4_data	: std_logic_vector(15 downto 0) := (others => '0');
signal adc_clkx4_ch 	: std_logic_vector( 1 downto 0) := (others => '0');
signal adc_clkx4_tlast	: std_logic := '0';
signal adc_clkx4_rst	: std_logic := '0';

-- madc_ddc_warapper
signal ddc0_arst		: std_logic := '0';
signal ddc0_valid		: std_logic := '1';
signal ddc0_pinc		: std_logic_vector(31 downto 0) := x"20000000";
signal ddc0_poff		: std_logic_vector(31 downto 0) := x"00000000";

signal ddc1_arst		: std_logic := '0';
signal ddc1_valid		: std_logic := '1';
signal ddc1_pinc		: std_logic_vector(31 downto 0) := x"20000000";
signal ddc1_poff		: std_logic_vector(31 downto 0) := x"00000000";

signal ddc2_arst		: std_logic := '0';
signal ddc2_valid		: std_logic := '1';
signal ddc2_pinc		: std_logic_vector(31 downto 0) := x"20000000";
signal ddc2_poff		: std_logic_vector(31 downto 0) := x"00000000";

signal ddc3_arst		: std_logic := '0';
signal ddc3_valid		: std_logic := '1';
signal ddc3_pinc		: std_logic_vector(31 downto 0) := x"20000000";
signal ddc3_poff		: std_logic_vector(31 downto 0) := x"00000000";

signal ddc_data_valid	: std_logic := '0';
signal ddc0_data_re		: std_logic_vector(17 downto 0) := (others => '0');
signal ddc0_data_im		: std_logic_vector(17 downto 0) := (others => '0');
signal ddc1_data_re		: std_logic_vector(17 downto 0) := (others => '0');
signal ddc1_data_im		: std_logic_vector(17 downto 0) := (others => '0');
signal ddc2_data_re		: std_logic_vector(17 downto 0) := (others => '0');
signal ddc2_data_im		: std_logic_vector(17 downto 0) := (others => '0');
signal ddc3_data_re		: std_logic_vector(17 downto 0) := (others => '0');
signal ddc3_data_im		: std_logic_vector(17 downto 0) := (others => '0');

signal ddc_data_clkx4_valid	: std_logic := '0';
signal ddc0_data_clkx4_re	: std_logic_vector(17 downto 0) := (others => '0');
signal ddc0_data_clkx4_im	: std_logic_vector(17 downto 0) := (others => '0');
signal ddc1_data_clkx4_re	: std_logic_vector(17 downto 0) := (others => '0');
signal ddc1_data_clkx4_im	: std_logic_vector(17 downto 0) := (others => '0');
signal ddc2_data_clkx4_re	: std_logic_vector(17 downto 0) := (others => '0');
signal ddc2_data_clkx4_im	: std_logic_vector(17 downto 0) := (others => '0');
signal ddc3_data_clkx4_re	: std_logic_vector(17 downto 0) := (others => '0');
signal ddc3_data_clkx4_im	: std_logic_vector(17 downto 0) := (others => '0');

-- madc_fir_wrapper
signal fira0_scale			: std_logic_vector( 3 downto 0) := "0011";
signal fira1_scale			: std_logic_vector( 3 downto 0) := "0011";
signal fira2_scale			: std_logic_vector( 3 downto 0) := "0011";
signal fira3_scale			: std_logic_vector( 3 downto 0) := "0011";

signal fira_dvo				: std_logic;
signal fira0_do_re			: std_logic_vector(15 downto 0) := (others => '0');
signal fira0_do_im			: std_logic_vector(15 downto 0) := (others => '0');
signal fira1_do_re			: std_logic_vector(15 downto 0) := (others => '0');
signal fira1_do_im			: std_logic_vector(15 downto 0) := (others => '0');
signal fira2_do_re			: std_logic_vector(15 downto 0) := (others => '0');
signal fira2_do_im			: std_logic_vector(15 downto 0) := (others => '0');
signal fira3_do_re			: std_logic_vector(15 downto 0) := (others => '0');
signal fira3_do_im			: std_logic_vector(15 downto 0) := (others => '0');

-- c2c_wrapper
signal c2c_line_up			: std_logic;
signal c2c_channel_up		: std_logic;

signal firb0_dvo			: std_logic;
signal firb1_dvo			: std_logic;
signal firb2_dvo			: std_logic;
signal firb3_dvo			: std_logic;
signal firb0_do_re			: std_logic_vector(15 downto 0) := (others => '0');
signal firb0_do_im			: std_logic_vector(15 downto 0) := (others => '0');
signal firb1_do_re			: std_logic_vector(15 downto 0) := (others => '0');
signal firb1_do_im			: std_logic_vector(15 downto 0) := (others => '0');
signal firb2_do_re			: std_logic_vector(15 downto 0) := (others => '0');
signal firb2_do_im			: std_logic_vector(15 downto 0) := (others => '0');
signal firb3_do_re			: std_logic_vector(15 downto 0) := (others => '0');
signal firb3_do_im			: std_logic_vector(15 downto 0) := (others => '0');

-- madc2mdsp
signal madc2mdsp_rst		: std_logic;
signal madc2mdsp_tvalid		: std_logic;
signal madc2mdsp_tready		: std_logic := '1';
signal madc2mdsp_tlast		: std_logic;
signal madc2mdsp_tdata		: std_logic_vector(63 downto 0);
signal madc2mdsp_tkeep		: std_logic_vector( 7 downto 0);

-- c2bkpln_wrapper
signal c2bkpln_line_up		: std_logic;
signal c2bkpln_channel_up	: std_logic;
signal c2bkpln_clk_out		: std_logic;
signal c2bkpln_rx_tlast		: std_logic;
signal c2bkpln_rx_tvalid	: std_logic;
signal c2bkpln_rx_tkeep		: std_logic_vector( 7 downto 0);
signal c2bkpln_rx_tdata		: std_logic_vector(63 downto 0);

------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>>> declaration component cots_top <<<<<<<<<<<<<<<<<<<<<<<--
------------------------------------------------------------------------------
component cots_top
    generic (
        BW                  : integer := 16;
        BW_INT              : integer := 18;
        PATHS               : integer := 4; 
        -- MADC
        MADC_DDS_BW_P_INC   : integer := 32;
        MADC_DDS_BW_DO      : integer := 16;
        
        MADC_SER_CH_O       : integer := 4; 
        MADC_SER_BW_CH_O    : integer := 2; 
        MADC_SER_PATHS_O    : integer := 1; 
        MADC_ROUND	        : std_logic_vector(1 downto 0) := "10";
        MADC_SCALE_BW       : integer := 5;
        -- DET
        DET_DDS_CH          : integer := 4;
        DET_BW_DDS_CH       : integer := 2;
        DET_BW_DDS          : integer := 16;
        
        DET_CX_PATHS        : integer := 1;
        DET_MP_CH           : integer := 16;
        DET_BW_MP_CH        : integer := 4;
        
        DET_BW_SCALE        : integer := 5
    );
    port(
        CLK             : in std_logic;
        RST             : in std_logic;

        MADC_SCALE      : in std_logic_vector(MADC_SCALE_BW*MADC_SER_CH_O - 1 downto 0);
        DET_SCALE       : in std_logic_vector(DET_BW_SCALE*DET_MP_CH - 1 downto 0);

        MADC_P_INC      : in std_logic_vector(MADC_DDS_BW_P_INC - 1 downto 0);
        MADC_P_TVALID   : in std_logic;

        DI              : in std_logic_vector(BW - 1 downto 0);
        CH_I            : in std_logic_vector(MADC_SER_BW_CH_O - 1 downto 0);
        DVI             : in std_logic;
        TLAST_I         : in std_logic;
        
        RET_MODE_RE     : out std_logic_vector(BW - 1 downto 0);
        RET_MODE_IM     : out std_logic_vector(BW - 1 downto 0);
        RET_MODE_CH     : out std_logic_vector(MADC_SER_BW_CH_O - 1 downto 0);
        RET_MODE_DV     : out std_logic;
        
        DET_MODE_RE     : out std_logic_vector(BW - 1 downto 0);
        DET_MODE_IM     : out std_logic_vector(BW - 1 downto 0);
        DET_MODE_CH     : out std_logic_vector(DET_BW_MP_CH - 1 downto 0);
        DET_MODE_DV     : out std_logic;
        
        DO              : out std_logic_vector(2*DET_CX_PATHS*BW_INT - 1 downto 0); 
        DVO             : out std_logic;
        CH_O            : out std_logic_vector(DET_BW_MP_CH - 1 downto 0);
        TLAST_O         : out std_logic;

        DATA_FLAG_O     : out std_logic
    );
end component;

signal madc_scale   	: std_logic_vector(19 downto 0) := (others => '0');
signal det_scale    	: std_logic_vector(79 downto 0) := (others => '0');

signal madc_p_inc   	: std_logic_vector(31 downto 0) := (others => '0');
signal madc_p_tvalid	: std_logic := '0';

signal det_do       	: std_logic_vector(35 downto 0) := (others => '0');
signal det_ch       	: std_logic_vector( 3 downto 0) := (others => '0');
signal det_dv       	: std_logic := '0';
signal det_tlast    	: std_logic := '0';
signal det_data_flag	: std_logic := '0';

signal ret_mode_re  	: std_logic_vector(15 downto 0);
signal ret_mode_im  	: std_logic_vector(15 downto 0);
signal ret_mode_ch  	: std_logic_vector( 1 downto 0);
signal ret_mode_dv  	: std_logic;

signal det_mode_re  	: std_logic_vector(15 downto 0);
signal det_mode_im  	: std_logic_vector(15 downto 0);
signal det_mode_ch  	: std_logic_vector( 3 downto 0);
signal det_mode_dv  	: std_logic;

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

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>> instantiate component ad9653_wrapper <<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
ad9653_wrapper_inst : ad9653_wrapper
	port map (
		-- clock & reset
		RST				=> adc_rst, 
		REF_CLK			=> refclk_300,	
		ADC_CLK			=> adc_clk,
		-- init interface (REF_CLK clock domain)
		RELOAD			=> '0',
		-- status (ADC_CLK clock domain)	
		CLK_DONE 		=> clk_done,
		FSM_DONE		=> fsm_done,
		-- ADC data out (ADC_CLK clock domain)
		ADC_DATA_CH0	=> adc_data_ch0,
		ADC_DATA_CH1	=> adc_data_ch1,
		ADC_DATA_CH2	=> adc_data_ch2,
		ADC_DATA_CH3	=> adc_data_ch3,
		-- ADC control interface
		ADC_PDWN		=> ADC_PDWN,
		ADC_SYNC		=> ADC_SYNC,
		ADC_SCLK		=> ADC_SCLK,
		ADC_SDIO		=> ADC_SDIO,
		ADC_CSB			=> ADC_CSB,
		-- ADC data interface package pins
		ADC_DCO_P      	=> ADC_DCO_P,
		ADC_DCO_N      	=> ADC_DCO_N,
		ADC_FCO_P      	=> ADC_FCO_P,
		ADC_FCO_N      	=> ADC_FCO_N,		
		ADC_A_D0_P     	=> ADC_A_D0_P,
		ADC_A_D0_N     	=> ADC_A_D0_N,
		ADC_A_D1_P     	=> ADC_A_D1_P,
		ADC_A_D1_N     	=> ADC_A_D1_N,		
		ADC_B_D0_P     	=> ADC_B_D0_P,
		ADC_B_D0_N     	=> ADC_B_D0_N,		
		ADC_B_D1_P     	=> ADC_B_D1_P,
		ADC_B_D1_N     	=> ADC_B_D1_N,	
		ADC_C_D0_P     	=> ADC_C_D0_P,
		ADC_C_D0_N     	=> ADC_C_D0_N,		
		ADC_C_D1_P     	=> ADC_C_D1_P,
		ADC_C_D1_N     	=> ADC_C_D1_N,
		ADC_D_D0_P     	=> ADC_D_D0_P,
		ADC_D_D0_N     	=> ADC_D_D0_N,
		ADC_D_D1_P     	=> ADC_D_D1_P,
		ADC_D_D1_N     	=> ADC_D_D1_N
	);

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>> instantiate component madc_ddc_warapper <<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
madc_ddc_warapper_inst : madc_ddc_warapper
	port map (
		-- clock & reset
		RST					=> adc_rst, 
		ADC_CLK				=> adc_clk,
		ADC_CLK_X4			=> adc_clk_x4,	
		-- DDC tuning
		DDC0_ARST			=> ddc0_arst,
		DDC0_VALID			=> ddc0_valid,	
		DDC0_PINC			=> ddc0_pinc,
		DDC0_POFF			=> ddc0_poff,
		DDC1_ARST			=> ddc1_arst,
		DDC1_VALID			=> ddc1_valid,	
		DDC1_PINC			=> ddc1_pinc,
		DDC1_POFF			=> ddc1_poff,
		DDC2_ARST			=> ddc2_arst,
		DDC2_VALID			=> ddc2_valid,	
		DDC2_PINC			=> ddc2_pinc,
		DDC2_POFF			=> ddc2_poff,
		DDC3_ARST			=> ddc3_arst,
		DDC3_VALID			=> ddc3_valid,	
		DDC3_PINC			=> ddc3_pinc,
		DDC3_POFF			=> ddc3_poff,		
		-- ADC data out (ADC_CLK clock domain)
		ADC_DATA_EN			=> fsm_done,
		ADC0_DATA			=> adc_data_ch0,
		ADC1_DATA			=> adc_data_ch1,		
		ADC2_DATA			=> adc_data_ch2,
		ADC3_DATA			=> adc_data_ch3,			
		-- DDC output (ADC_CLK clock domain)
		DDC_DATA_VALID		=> ddc_data_valid,
		DDC0_DATA_RE		=> ddc0_data_re,
		DDC0_DATA_IM		=> ddc0_data_im,
		DDC1_DATA_RE		=> ddc1_data_re,
		DDC1_DATA_IM		=> ddc1_data_im,		
		DDC2_DATA_RE		=> ddc2_data_re,
		DDC2_DATA_IM		=> ddc2_data_im,	
		DDC3_DATA_RE		=> ddc3_data_re,
		DDC3_DATA_IM		=> ddc3_data_im,
		-- DDC output (	ADC_CLK_X4 clock domain)
		DDC_DATA_X4_VALID	=> ddc_data_clkx4_valid,
		DDC0_DATA_X4_RE		=> ddc0_data_clkx4_re,
		DDC0_DATA_X4_IM		=> ddc0_data_clkx4_im,
		DDC1_DATA_X4_RE		=> ddc1_data_clkx4_re,
		DDC1_DATA_X4_IM		=> ddc1_data_clkx4_im,		
		DDC2_DATA_X4_RE		=> ddc2_data_clkx4_re,
		DDC2_DATA_X4_IM		=> ddc2_data_clkx4_im,		
		DDC3_DATA_X4_RE		=> ddc3_data_clkx4_re,
		DDC3_DATA_X4_IM		=> ddc3_data_clkx4_im		
	);

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>> instantiate component madc_fir_wrapper <<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
madc_fir_wrapper_inst : madc_fir_wrapper
	port map (
		-- clock & reset
		RST				=> adc_rst, 
		ADC_CLK_X4		=> adc_clk_x4,	
		-- tuning FIR
		SCALE0			=> fira0_scale,
		SCALE1			=> fira1_scale,
		SCALE2			=> fira2_scale,
		SCALE3			=> fira3_scale,				
		-- input data
		DVI				=> ddc_data_clkx4_valid,
		DI0_RE			=> ddc0_data_clkx4_re,
		DI0_IM			=> ddc0_data_clkx4_im,
		DI1_RE			=> ddc1_data_clkx4_re,
		DI1_IM			=> ddc1_data_clkx4_im,		
		DI2_RE			=> ddc2_data_clkx4_re,
		DI2_IM			=> ddc2_data_clkx4_im,			
		DI3_RE			=> ddc3_data_clkx4_re,
		DI3_IM			=> ddc3_data_clkx4_im,		
		-- output data	
		DVO				=> fira_dvo,
		DO0_RE			=> fira0_do_re,
		DO0_IM			=> fira0_do_im,
		DO1_RE			=> fira1_do_re,
		DO1_IM			=> fira1_do_im,		
		DO2_RE			=> fira2_do_re,
		DO2_IM			=> fira2_do_im,			
		DO3_RE			=> fira3_do_re,
		DO3_IM			=> fira3_do_im
	);

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>> instantiate component c2c_wrapper <<<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
c2c_wrapper_inst : c2c_wrapper
	port map (
		-- clock & reset
		RST				=> adc_rst,
		CLK_78			=> clk_78,		
		ADC_CLK_X4		=> adc_clk_x4,
		-- GTH ref clock
		GTREFCLK_P		=> GTREFCLK_P,
		GTREFCLK_N		=> GTREFCLK_N,
		GTREFCLK_OUT	=> gtrefclk,
		-- C2C status
		LANE_UP			=> c2c_line_up,
		CHANNEL_UP		=> c2c_channel_up,		
		-- input data (ADC_CLK_X4 clock domain)
		DVI				=> fira_dvo,
		DI0_RE			=> fira0_do_re,
		DI0_IM			=> fira0_do_im,
		DI1_RE			=> fira1_do_re,
		DI1_IM			=> fira1_do_im,		
		DI2_RE			=> fira2_do_re,
		DI2_IM			=> fira2_do_im,			
		DI3_RE			=> fira3_do_re,
		DI3_IM			=> fira3_do_im,
		-- output data (ADC_CLK_X4 clock domain)
		DVO0			=> firb0_dvo,
		DO0_RE			=> firb0_do_re,
		DO0_IM			=> firb0_do_im,
		DVO1			=> firb1_dvo,		
		DO1_RE			=> firb1_do_re,
		DO1_IM			=> firb1_do_im,
		DVO2			=> firb2_dvo,				
		DO2_RE			=> firb2_do_re,
		DO2_IM			=> firb2_do_im,
		DVO3			=> firb3_dvo,					
		DO3_RE			=> firb3_do_re,
		DO3_IM			=> firb3_do_im	
	);

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>> instantiate component madc2mdsp <<<<<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
madc2mdsp_inst : madc2mdsp
    port map (
		-- clock & reset
		RST				=> madc2mdsp_rst, -- adc_rst,
		ADC_CLK_X4		=> adc_clk_x4,
        CLK_OUT         => c2bkpln_clk_out,
        -- tuning
        RS				=> rs_c2bkpln,
   		-- input data FIRA (ADC_CLK_X4 clock domain)
		FIRA_DVI		=> fira_dvo,
		FIRA_DI0_RE		=> fira0_do_re,
		FIRA_DI0_IM		=> fira0_do_im,
		FIRA_DI1_RE		=> fira1_do_re,
		FIRA_DI1_IM		=> fira1_do_im,		
		FIRA_DI2_RE		=> fira2_do_re,
		FIRA_DI2_IM		=> fira2_do_im,			
		FIRA_DI3_RE		=> fira3_do_re,
		FIRA_DI3_IM		=> fira3_do_im,
		-- input data FIRB (ADC_CLK_X4 clock domain)
		FIRB_DVI 		=> firb0_dvo,
		FIRB_DI0_RE		=> firb0_do_re,
		FIRB_DI0_IM		=> firb0_do_im,
		FIRB_DI1_RE		=> firb1_do_re,
		FIRB_DI1_IM		=> firb1_do_im,
		FIRB_DI2_RE		=> firb2_do_re,
		FIRB_DI2_IM		=> firb2_do_im,
		FIRB_DI3_RE		=> firb3_do_re,
		FIRB_DI3_IM		=> firb3_do_im,
        -- output data form MDSP (CLK_OUT clock domain)
		M_AXI_TVALID    => madc2mdsp_tvalid,
		M_AXI_TLAST     => madc2mdsp_tlast,		
		M_AXI_TDATA     => madc2mdsp_tdata,
        M_AXI_TKEEP     => madc2mdsp_tkeep,        
		M_AXI_TREADY 	=> madc2mdsp_tready 
	);

madc2mdsp_rst	<= adc_rst or bkpln_sata_sl_c2bkpln;

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

ddc0_arst	<= BKPLN_SATA_SL;
ddc1_arst	<= BKPLN_SATA_SL;
ddc2_arst	<= BKPLN_SATA_SL;
ddc3_arst	<= BKPLN_SATA_SL;

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

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>> instantiate component ila_madc2mdsp <<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
ila_madc2mdsp_inst : ila_madc2mdsp
	port map (
		clk 		=> c2bkpln_clk_out,
		probe0(0) 	=> madc2mdsp_tvalid, 
		probe1(0) 	=> madc2mdsp_tlast,
		probe2(0) 	=> madc2mdsp_tready,				
		probe3 		=> madc2mdsp_tdata,
		probe4(0) 	=> c2bkpln_rx_tlast,
		probe5(0) 	=> c2bkpln_rx_tvalid,				
		probe6 		=> c2bkpln_rx_tdata( 7 downto 0),
		probe7(0) 	=> bkpln_sata_sl_c2bkpln
	);

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>> instantiate component ila_madc_ddc <<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
ila_madc_ddc_inst : ila_madc_ddc
	port map (
		clk 		=> adc_clk_x4, 	-- adc_clk,
		probe0(0) 	=> firb0_dvo, 	-- ddc_data_clkx4_valid, 	-- ddc_data_valid,
		probe1(0) 	=> firb1_dvo, 	-- ddc_data_clkx4_valid, 	-- ddc_data_valid,		
		probe2(0) 	=> firb2_dvo, 	-- ddc_data_clkx4_valid, 	-- ddc_data_valid,
		probe3(0) 	=> firb3_dvo, 	-- ddc_data_clkx4_valid, 	-- ddc_data_valid,
		probe4(0) 	=> firb_dvo_err, 	-- 					 
		probe5 		=> firb2_do_re, -- ddc0_data_clkx4_re,		-- ddc0_data_re,
		probe6 		=> firb2_do_im  -- ddc0_data_clkx4_im		-- ddc0_data_im
	);

firb_dvo_err	<= firb0_dvo xor firb1_dvo xor firb2_dvo xor firb3_dvo;

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>>>> instantiate component ser_adc <<<<<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
--ser_adc_inst : ser_adc
--	port map (
--		-- clock & reset
--		RST				=> adc_rst, 
--		ADC_CLK			=> adc_clk,
--		ADC_CLK_X4		=> adc_clk_x4,
--		-- status (ADC_CLK clock domain)
--		FSM_DONE		=> fsm_done,
--		-- ADC data in (ADC_CLK clock domain)
--		ADC_DATA_CH0	=> adc_data_ch0,
--		ADC_DATA_CH1	=> adc_data_ch1,
--		ADC_DATA_CH2	=> adc_data_ch2,
--		ADC_DATA_CH3	=> adc_data_ch3,
--		-- ADC data out (ADC_CLK_X4 clock domain)
--		ADC_RST_USER	=> adc_clkx4_rst,
--        ADC_DO          => adc_clkx4_data,
--		ADC_CH          => adc_clkx4_ch,
--		ADC_DVO         => adc_clkx4_dv,
--		ADC_TLAST       => adc_clkx4_tlast
--	);

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>> instantiate component c2c_gth_interface <<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
--c2c_gth_interface_inst : c2c_gth_interface
--	port map (
		
--		-- clock & reset
--		CLK_78			=> clk_78, -- 312.5/4 = 78.125 MHz
		
--		-- GTH ref clock
--		GTREFCLK_P		=> GTREFCLK_P,
--		GTREFCLK_N		=> GTREFCLK_N,
		
--		-- GTH pins
--		GTRX_N			=> GTRX_N,
--		GTRX_P			=> GTRX_P,
--		GTTX_N			=> GTTX_N,
--		GTTX_P			=> GTTX_P
				
--	);

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>> instantiate component ila_adc_clkx4 <<<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
--ila_adc_clkx4_inst : ila_adc_clkx4
--	port map (
--		clk 		=> adc_clk_x4,
--		probe0 		=> adc_clkx4_data, 
--		probe1 		=> adc_clkx4_ch, 
--		probe2(0) 	=> adc_clkx4_dv,
--		probe3(0) 	=> adc_clkx4_tlast
--	);

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>> instantiate component vio_sys_rst <<<<<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
vio_sys_rst_inst : vio_sys_rst
	port map (
  		clk 			=> clk_300,
  		probe_in0	 	=> RS,
  		probe_in1	 	=> GA,
  		probe_in2(0) 	=> c2c_line_up,  		
  		probe_in3(0) 	=> c2c_channel_up,
  		probe_in4(0) 	=> c2bkpln_line_up,  		
  		probe_in5(0) 	=> c2bkpln_channel_up,
  		probe_in6 		=> usr_accesse_data,  		
  		probe_out0(0) 	=> sys_rst
	);

rst_n	<= not adc_rst;

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>> instantiate component misc_clk_conv <<<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
misc_clk_conv_inst : misc_clk_conv
	port map (
    	s_axis_aresetn 	=> rst_n,
    	m_axis_aresetn 	=> rst_n,
   		s_axis_aclk 	=> clk_300,
    	s_axis_tvalid 	=> misc_clk_conv_in_tready,
    	s_axis_tready 	=> misc_clk_conv_in_tready,
    	s_axis_tdata 	=> misc_clk_conv_in_data,
    	m_axis_aclk 	=> c2bkpln_clk_out,
    	m_axis_tvalid 	=> misc_clk_conv_in_valid,
    	m_axis_tready 	=> '1',
    	m_axis_tdata 	=> misc_clk_conv_out_data
  	);

misc_clk_conv_in_data( 1 downto 0)	<= RS;
misc_clk_conv_in_data( 4 downto 2)	<= GA;
misc_clk_conv_in_data( 5)			<= BKPLN_SATA_SL;

process (c2bkpln_clk_out) begin
	if (c2bkpln_clk_out'event and c2bkpln_clk_out = '1') then
		if (misc_clk_conv_in_valid = '1') then
			rs_c2bkpln				<= misc_clk_conv_out_data( 1 downto 0);
			ga_c2bkpln				<= misc_clk_conv_out_data( 4 downto 2);
			bkpln_sata_sl_c2bkpln	<= misc_clk_conv_out_data( 5);
		end if;
	end if;
end process;

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>>> instantiate component sys_mng_wiz <<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------	
sys_mng_wiz_inst : sys_mng_wiz
	port map (
    	dclk_in 		=> clk_78,
    	reset_in 		=> '0',
    	channel_out 	=> open,
    	eoc_out 		=> open,
    	alarm_out 		=> open,
    	eos_out 		=> open,
    	busy_out 		=> open,
    	i2c_sda 		=> SYSMON_A_SDA,
    	i2c_sclk 		=> SYSMON_A_SCL
  	);

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>> instantiate component USR_ACCESSE2 <<<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
USR_ACCESSE2_inst : USR_ACCESSE2
	port map (
   		CFGCLK 		=> open,    			-- 1-bit output: Configuration Clock
   		DATA 		=> usr_accesse_data,   	-- 32-bit output: Configuration Data reflecting the contents of the AXSS register
   		DATAVALID 	=> open  				-- 1-bit output: Active High Data Valid
	);

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>>>> instantiate component STARTUPE3 <<<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
--STARTUPE3_inst : STARTUPE3
--   generic map (
--      PROG_USR 		=> "FALSE", -- Activate program event security feature. Requires encrypted bitstreams.
--      SIM_CCLK_FREQ => 0.0  	-- Set the Configuration Clock Frequency (ns) for simulation
--   )
--   port map (
--      CFGCLK 		=> open,        -- 1-bit output: Configuration main clock output
--      CFGMCLK 		=> cfgmclk,     -- 1-bit output: Configuration internal oscillator clock output
--      DI 			=> open,        -- 4-bit output: Allow receiving on the D input pin
--      EOS 			=> open,        -- 1-bit output: Active-High output signal indicating the End Of Startup
--      PREQ 			=> open,        -- 1-bit output: PROGRAM request to fabric output
--      DO 			=> "0000",      -- 4-bit input: Allows control of the D pin output
--      DTS 			=> "0000",      -- 4-bit input: Allows tristate of the D pin
--      FCSBO 		=> '1',         -- 1-bit input: Controls the FCS_B pin for flash access
--      FCSBTS 		=> '1',         -- 1-bit input: Tristate the FCS_B pin
--      GSR 			=> '0',         -- 1-bit input: Global Set/Reset input (GSR cannot be used for the port)
--      GTS 			=> '0',         -- 1-bit input: Global 3-state input (GTS cannot be used for the port name)
--      KEYCLEARB 	=> '0', 		-- 1-bit input: Clear AES Decrypter Key input from Battery-Backed RAM (BBRAM)
--      PACK 			=> '1',        	-- 1-bit input: PROGRAM acknowledge input
--      USRCCLKO 		=> '0',   		-- 1-bit input: User CCLK input
--      USRCCLKTS 	=> '1', 		-- 1-bit input: User CCLK 3-state enable input
--      USRDONEO 		=> userdone,   	-- 1-bit input: User DONE pin output control
--      USRDONETS 	=> '0'  		-- 1-bit input: User DONE 3-state enable output
--   );

--process (cfgmclk) begin
--	if (cfgmclk'event and cfgmclk = '1') then
--		cnt_done <= cnt_done + 1;
--	end if;
--end process;

--userdone	<= cnt_done(25);

end mrdk_adc_ab_arch;
