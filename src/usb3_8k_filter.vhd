library ieee;
    use ieee.std_logic_1164.all;
    use IEEE.STD_LOGIC_ARITH.ALL;
    use IEEE.STD_LOGIC_UNSIGNED.ALL;

Library UNISIM;
    use UNISIM.vcomponents.all;

---------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>>>>>>> declaration components <<<<<<<<<<<<<<<<<<<<<<<<--
---------------------------------------------------------------------------
    use work.clk_monitor_pkg.all;
    use work.ctrl_flt_wrapper_pkg.all;
    use work.fft_top_pkg.all;

entity usb3_8k_filter is
    port (
    
        -- CLK	  
        IPAD_CLK_FPGA_P     : in    std_logic;
        IPAD_CLK_FPGA_N     : in    std_logic;
        
        IPAD_SYSREFCLK_P    : in    std_logic; -- 100 MHz for IODELAYCTRL from application
        IPAD_SYSREFCLK_N    : in    std_logic;            

        -- NUMBER DEVICE
	    IPAD_NUMBER_DEVICE  : in   std_logic_vector( 3 downto 0);

        -- FX3 SyncSlaveFIFO
        OPAD_PCLK_FX3       : out   std_logic;
        OPAD_SLCS           : out   std_logic;
        OPAD_PKTEND         : out   std_logic;
        OPAD_SLWR           : out   std_logic;
        OPAD_SLRD           : out   std_logic;
        OPAD_SLOE           : out   std_logic;
        OPAD_ADDR           : out   std_logic_vector( 1 downto 0);
        IOPAD_DATA          : inout std_logic_vector(31 downto 0);
        IPAD_FLAGA          : in    std_logic;
        IPAD_FLAGB          : in    std_logic;
        IPAD_FLAGC          : in    std_logic;
        IPAD_FLAGD          : in    std_logic;
        OPAD_RESET_FX3      : out   std_logic;

    	-- Serial Peripheral Interface 
    	OPAD_CS     		: out   std_logic; -- SPI Chip Select - When HIGH, the device is deselected, when LOW enables the device
    	OPAD_DQ0    		: out   std_logic; -- Serial data - transfers data into the device  (FPGA -> Flash)
		IPAD_DQ1  		    : in    std_logic; -- Serial data - Transfer data out of the device (FPGA <- Flash)
        
--        -- UMS, ShRPU and I/O Control 
--        OPAD_UMS_CLK        : out   std_logic;
--        OPAD_UMS_LE1        : out   std_logic;
--        OPAD_UMS_LE2        : out   std_logic;
--        OPAD_UMS_LE3        : out   std_logic;
--        OPAD_UMS_DATA       : out   std_logic;
--        OPAD_UMS_DA         : out   std_logic;
--        OPAD_UMS_DB         : out   std_logic;
--        OPAD_UMS_DC         : out   std_logic;
--        OPAD_UMS_DD         : out   std_logic;
--        OPAD_UMS_DE         : out   std_logic;
--        OPAD_UMS_DF         : out   std_logic;
--        OPAD_UMS_DG         : out   std_logic;
--        OPAD_LVTTL_PIN1     : out   std_logic;
--        OPAD_LVTTL_PIN2     : out   std_logic;
--        OPAD_LVTTL_PIN3     : out   std_logic;
----        OPAD_EXT_DF_STROBE  : out   std_logic;
----        OPAD_ANT_SW_PIN     : out   std_logic_vector( 3 downto 0);
--        OPAD_SHRPU_CLK1     : out   std_logic;
--        OPAD_SHRPU_DATA1    : out   std_logic;
--        OPAD_SHRPU_LE1      : out   std_logic;
--        OPAD_SHRPU_CLK2     : out   std_logic;
--        OPAD_SHRPU_DATA2    : out   std_logic;
--        OPAD_SHRPU_LE2      : out   std_logic;
----        OPAD_BUF1_DIR       : out   std_logic;
----        OPAD_BUF2_DIR       : out   std_logic;
----        OPAD_BUF3_DIR       : out   std_logic;
----        OPAD_BUF4_DIR       : out   std_logic;

        -- AD9522 CONTROL
        OPAD_CLK_CS_FPGA    : out   std_logic;
        OPAD_CLK_SCLK_FPGA  : out   std_logic;
        IOPAD_CLK_SDIO_FPGA : inout std_logic;
        OPAD_CLK_SYNC_FPGA  : out   std_logic;
        OPAD_CLK_RESET_FPGA : out   std_logic;
        OPAD_CLK_PD_FPGA    : out   std_logic;        

        -- ADC 0
        IPAD_ADC0_DCLK_P    : in    std_logic;
        IPAD_ADC0_DCLK_N    : in    std_logic;  -- Not used.
        IPAD_ADC0_FCLK_P    : in    std_logic;
        IPAD_ADC0_FCLK_N    : in    std_logic;
        IPAD_ADC0_DATA_P    : in    std_logic_vector( 7 downto 0);
        IPAD_ADC0_DATA_N    : in    std_logic_vector( 7 downto 0);
        
        OPAD_ADC0_SCLK      : out   std_logic;
        IOPAD_ADC0_SDIO     : inout std_logic;
        OPAD_ADC0_CSB       : out   std_logic;
        OPAD_ADC0_PWDN      : out   std_logic;
        OPAD_ADC0_SYNC      : out   std_logic;
                
        -- ADC 1
        IPAD_ADC1_DCLK_P    : in    std_logic;
        IPAD_ADC1_DCLK_N    : in    std_logic;  -- Not used.
        IPAD_ADC1_FCLK_P    : in    std_logic;
        IPAD_ADC1_FCLK_N    : in    std_logic;
        IPAD_ADC1_DATA_P    : in    std_logic_vector( 7 downto 0);
        IPAD_ADC1_DATA_N    : in    std_logic_vector( 7 downto 0);

        OPAD_ADC1_SCLK      : out   std_logic;
        IOPAD_ADC1_SDIO     : inout std_logic;
        OPAD_ADC1_CSB       : out   std_logic;
        OPAD_ADC1_PWDN      : out   std_logic;
        OPAD_ADC1_SYNC      : out   std_logic;

        -- DAC 0
--        IPAD_DAC0_DCO_P     : in     std_logic;
--        IPAD_DAC0_DCO_N     : in     std_logic;
--        OPAD_DAC0_DCI_P     : out    std_logic;
--        OPAD_DAC0_DCI_N     : out    std_logic;
--        OPAD_DAC0_DATA_P    : out    std_logic_vector(15 downto 0); 
--        OPAD_DAC0_DATA_N    : out    std_logic_vector(15 downto 0);
        
        OPAD_DAC0_LDO_EN    : out    std_logic;
--        OPAD_DAC0_RESET     : out    std_logic;
--        OPAD_DAC0_SCLK      : out    std_logic;
--        OPAD_DAC0_CSB_N     : out    std_logic;
--        IOPAD_DAC0_SDIO     : inout  std_logic;       

        -- DAC 1
--        IPAD_DAC1_DCO_P     : in     std_logic;
--        IPAD_DAC1_DCO_N     : in     std_logic;
--        OPAD_DAC1_DCI_P     : out    std_logic;
--        OPAD_DAC1_DCI_N     : out    std_logic;
--        OPAD_DAC1_DATA_P    : out    std_logic_vector(15 downto 0); 
--        OPAD_DAC1_DATA_N    : out    std_logic_vector(15 downto 0);
        
        OPAD_DAC1_LDO_EN    : out    std_logic
--        OPAD_DAC1_RESET     : out    std_logic
--        OPAD_DAC1_SCLK      : out    std_logic;
--        OPAD_DAC1_CSB_N     : out    std_logic;
--        IOPAD_DAC1_SDIO     : inout  std_logic          
    
    );
end usb3_8k_filter;

architecture usb3_8k_filter_arch of usb3_8k_filter is

constant NUMBER_VERSION     : std_logic_vector( 7 downto 0) := conv_std_logic_vector(11, 8); -- номер версии
constant NUMBER_REVISION    : std_logic_vector( 7 downto 0) := conv_std_logic_vector( 9, 8); -- номер ревизии

attribute mark_debug        : string;
---------------------------------------------------------------------------
-->>>>>>>>>>>>>>> declaration component ctrl_ad9522 <<<<<<<<<<<<<<<<<<<<<--
---------------------------------------------------------------------------
component spi_loader_top
	port (
		CLK_INT             : in    std_logic;
    	CLK_I				: in	std_logic; 	-- Synchro signal
        SRST_I				: in	std_logic;	-- Reset synchro signal
    
        CMD_DVI_I			: in	std_logic;	-- 
        CMD_I				: in	std_logic_vector( 2 downto 0);	-- Command (erase/write/read)        
        START_ADDR_I		: in	std_logic_vector(23 downto 0);	-- Address of SPI Flash for write
        PAGE_COUNT_I		: in	std_logic_vector(15 downto 0);	-- Count of page of SPI Flash for write
        SECTOR_COUNT_I		: in	std_logic_vector(7 downto 0);	-- Count of sector of SPI Flash for write    
    
        DATA_DVI_I			: in	std_logic;	-- 
        DATA_TO_PROG_I		: in	std_logic_vector(31 downto 0);	-- Data to write into SPI Flash
    
        DATA_DVO_O			: out	std_logic;	--  
        DATA_OUT_O  		: out	std_logic_vector(7 downto 0); 	-- Received data from SPI memory
    
        CMD_FIFO_EMPTY_O	: out	std_logic;	-- The signal of module when it has completed erasing
        CMD_FIFO_FULL_O  	: out	std_logic;	-- The signal of module when it has completed writing
        DATA_FIFO_PFULL_O	: out	std_logic;	-- FIFO is full, must wait while it will be release    

        SPI_CS_O			: out	std_logic;	-- Chip Select signal for SPI Flash
        SPI_MOSI_O			: out	std_logic;	-- Master Output Slave Input
        SPI_MISO_I			: in	std_logic	-- Master Input Slave Output
    );
end component;

component reset_sync
    port( 
        CLK100_I             : in    std_logic;        
        CLK50_I              : in    std_logic;
        RST100_I             : in    std_logic;
        RST50_O              : out   std_logic
    );
end component;

signal reset_spi            : std_logic;

signal flash_data_dv		: std_logic := '0';
signal flash_data 			: std_logic_vector(31 downto 0) := (others => '0');

signal flash_data_out_dv	: std_logic := '0';
signal flash_data_out   	: std_logic_vector( 7 downto 0) := (others => '0');

signal flash_cmd_dv     	: std_logic := '0';
signal flash_cmd     		: std_logic_vector( 2 downto 0) := (others => '0');
signal flash_start_addr		: std_logic_vector(23 downto 0) := (others => '0');
signal flash_page_cnt		: std_logic_vector(15 downto 0) := (others => '0');
signal flash_sector_cnt		: std_logic_vector( 7 downto 0) := (others => '0');

signal flash_cmd_fifo_empty : std_logic := '0';
signal flash_cmd_fifo_full  : std_logic := '0';
signal flash_data_fifo_pfull : std_logic := '0';

---------------------------------------------------------------------------
-->>>>>>>>>>>>>> declaration component spi_loader_ila <<<<<<<<<<<<<<<<<<<--
---------------------------------------------------------------------------
--component spi_loader_ila -- TODO: return back
--	port (
--		clk 	: IN STD_LOGIC;
--		probe0 	: IN STD_LOGIC_VECTOR( 0 DOWNTO 0); 
--		probe1 	: IN STD_LOGIC_VECTOR(31 DOWNTO 0); 
--		probe2 	: IN STD_LOGIC_VECTOR( 0 DOWNTO 0); 
--		probe3 	: IN STD_LOGIC_VECTOR( 7 DOWNTO 0); 
--		probe4 	: IN STD_LOGIC_VECTOR( 0 DOWNTO 0); 
--		probe5 	: IN STD_LOGIC_VECTOR( 2 DOWNTO 0); 
--		probe6 	: IN STD_LOGIC_VECTOR(23 DOWNTO 0); 
--		probe7 	: IN STD_LOGIC_VECTOR(15 DOWNTO 0); 
--		probe8 	: IN STD_LOGIC_VECTOR( 7 DOWNTO 0); 
--		probe9 	: IN STD_LOGIC_VECTOR( 0 DOWNTO 0); 
--		probe10 : IN STD_LOGIC_VECTOR( 0 DOWNTO 0);
--		probe11 : IN STD_LOGIC_VECTOR( 0 DOWNTO 0)
--	);
--end component;

---------------------------------------------------------------------------
-->>>>>>>>>>>>>>> declaration component ctrl_ad9522 <<<<<<<<<<<<<<<<<<<<<--
---------------------------------------------------------------------------
component ctrl_ad9522
    port (
        clk                 : in    std_logic;
        enable              : in    std_logic;
        reset               : in    std_logic;
        --- control resource №2 ---
        ready_ctrl_src_wr_2 : out   std_logic;
        ctrl_src_wr_val_2   : in    std_logic;
        ctrl_src_wr_2       : in    std_logic_vector(31 downto 0);
        --- control ad9522 ---
        csb                 : out   std_logic;
        sclk                : out   std_logic;
        sdio                : inout std_logic;
        sync                : out   std_logic
    );
end component; -- ctrl_ad9522

---------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>> declaration component clk_ext <<<<<<<<<<<<<<<<<<<<<<--
---------------------------------------------------------------------------
component clk_ext
    port (
        CLK_FPGA_p_pin  : in    std_logic;
        CLK_FPGA_n_pin  : in    std_logic;
	    clk_ctrl        : in    std_logic;
        enable_ctrl     : in    std_logic;
        reset           : in    std_logic;
        Extclk          : out   std_logic;
        reset_out       : out   std_logic;
        enable_out      : out   std_logic
    );
end component; -- clk_ext

signal reset_ctrl       : std_logic;
signal SysRefClk        : std_logic;
signal clk200           : std_logic;
signal clk50            : std_logic;
signal enable_ctrl      : std_logic;
signal clk_ctrl         : std_logic;
signal clk_ctrl_io      : std_logic;
signal reset_clk_ext    : std_logic;
signal clk_adc          : std_logic;
signal reset_adc        : std_logic;
signal enable_adc       : std_logic;
signal reset_adc_pll    : std_logic;

---------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>> declaration component clk_usb <<<<<<<<<<<<<<<<<<<<<<--
---------------------------------------------------------------------------
component clk_usb
    port (
        SysRefClk_p_pin : in    std_logic;  -- 100 MHz for IODELAYCTRL from application
        SysRefClk_n_pin : in    std_logic;
        SysRefClk       : out   std_logic;
        clk_fx3         : out   std_logic;
        clk_fx3_io      : out   std_logic;
        clk200          : out   std_logic;
		clk50           : out std_logic;
        reset_out       : out   std_logic;
        enable_out      : out   std_logic
    );
end component; -- clk_usb

---------------------------------------------------------------------------
-->>>>>>>>>>> declaration component usb_module_estrade_v3_0 <<<<<<<<<<<<<--
---------------------------------------------------------------------------
component usb_module_estrade_v3_0
    port  ( 
        clk                     : in    std_logic;
        clk_io                  : in    std_logic;
        reset                   : in    std_logic;
        enable                  : in    std_logic;
        --- fx3 SyncSlaveFIFO ---
        slcs                    : out   std_logic;
        pktend                  : out   std_logic;
        slwr                    : out   std_logic;
        slrd                    : out   std_logic;
        sloe                    : out   std_logic;
        addr                    : out   std_logic_vector( 1 downto 0);
        data                    : inout std_logic_vector(31 downto 0);
        flaga                   : in    std_logic;
        flagb                   : in    std_logic;
        flagc                   : in    std_logic;
        flagd                   : in    std_logic;
        --- CONTROL OUT ---
        reset_input_pll         : out   std_logic; -- сброс цифровой ФАПЧ входного тактового сигнала
        reset_in_data_ch        : out   std_logic; -- сброс входящих каналов данных
        --- Reg №0 ---
        ctrl_reg_0              : out   std_logic_vector( 7 downto 0);
        --- Reg №1 ---
        ctrl_reg_1              : out   std_logic_vector( 7 downto 0);
        --- Reg №2 ---
        ctrl_reg_2              : out   std_logic_vector( 7 downto 0);
        --- Reg №3 ---
        ctrl_reg_3              : out   std_logic_vector( 7 downto 0);
        --- Reg №4 ---
        ctrl_reg_4              : out   std_logic_vector( 7 downto 0);
        --- Reg №5 ---
        ctrl_reg_5              : out   std_logic_vector( 7 downto 0);
        --- Reg №6 ---
        ctrl_reg_6              : out   std_logic_vector( 7 downto 0);
        --- Reg №7 ---
        ctrl_reg_7              : out   std_logic_vector( 7 downto 0);
        --- write control resource №0 ---
        ready_ctrl_src_wr_0     : in    std_logic;
        ctrl_src_wr_val_0       : out   std_logic;
        ctrl_src_wr_0           : out   std_logic_vector(31 downto 0);
        --- write control resource №1 ---
        ready_ctrl_src_wr_1     : in    std_logic;
        ctrl_src_wr_val_1       : out   std_logic;
        ctrl_src_wr_1           : out   std_logic_vector(31 downto 0);
        --- write control resource №2 ---
        ready_ctrl_src_wr_2     : in    std_logic;
        ctrl_src_wr_val_2       : out   std_logic;
        ctrl_src_wr_2           : out   std_logic_vector(31 downto 0);
        --- write control resource №3 ---
        ready_ctrl_src_wr_3     : in    std_logic;
        ctrl_src_wr_val_3       : out   std_logic;
        ctrl_src_wr_3           : out   std_logic_vector(31 downto 0);
        --- write control resource №4 ---
        ready_ctrl_src_wr_4     : in    std_logic;
        ctrl_src_wr_val_4       : out   std_logic;
        ctrl_src_wr_4           : out   std_logic_vector(31 downto 0);
        --- write control resource №5 ---
        ready_ctrl_src_wr_5     : in    std_logic;
        ctrl_src_wr_val_5       : out   std_logic;
        ctrl_src_wr_5           : out   std_logic_vector(31 downto 0);
        --- write control resource №6 ---
        ready_ctrl_src_wr_6     : in    std_logic;
        ctrl_src_wr_val_6       : out   std_logic;
        ctrl_src_wr_6           : out   std_logic_vector(31 downto 0);
        --- write control resource №7 ---
        ready_ctrl_src_wr_7     : in    std_logic;
        ctrl_src_wr_val_7       : out   std_logic;
        ctrl_src_wr_7           : out   std_logic_vector(31 downto 0);
        --- write control resource №8 ---
        ready_ctrl_src_wr_8     : in    std_logic;
        ctrl_src_wr_val_8       : out   std_logic;
        ctrl_src_wr_8           : out   std_logic_vector(31 downto 0);
        --- write control resource №9 ---
        ready_ctrl_src_wr_9     : in    std_logic;
        ctrl_src_wr_val_9       : out   std_logic;
        ctrl_src_wr_9           : out   std_logic_vector(31 downto 0);
        --- write control resource №10 ---
        ready_ctrl_src_wr_10    : in    std_logic;
        ctrl_src_wr_val_10      : out   std_logic;
        ctrl_src_wr_10          : out   std_logic_vector(31 downto 0);
        --- write control resource №11 ---
        ready_ctrl_src_wr_11    : in    std_logic;
        ctrl_src_wr_val_11      : out   std_logic;
        ctrl_src_wr_11          : out   std_logic_vector(31 downto 0);
        --- write control resource №12 ---
        ready_ctrl_src_wr_12    : in    std_logic;
        ctrl_src_wr_val_12      : out   std_logic;
        ctrl_src_wr_12          : out   std_logic_vector(31 downto 0);
        --- write control resource №16 ---
        ready_ctrl_src_wr_16    : in    std_logic;
        ctrl_src_wr_val_16      : out   std_logic;
        ctrl_src_wr_16          : out   std_logic_vector(31 downto 0);
        --- write control resource №17 ---
        ready_ctrl_src_wr_17    : in    std_logic;
        ctrl_src_wr_val_17      : out   std_logic;
        ctrl_src_wr_17          : out   std_logic_vector(31 downto 0);
        --- write control resource №19 ---
        ready_ctrl_src_wr_19    : in    std_logic;
        ctrl_src_wr_val_19      : out   std_logic;
        ctrl_src_wr_19          : out   std_logic_vector(31 downto 0);        
        --- write data port №0 --- 
        ready_data_wr_0         : in    std_logic;
        data_wr_val_0           : out   std_logic;
        data_wr_0               : out   std_logic_vector(31 downto 0);
        --- CONTROL INPUT ---
        number_device           : in    std_logic_vector( 3 downto 0); -- номер устройства
        number_version          : in    std_logic_vector( 7 downto 0); -- номер версии
        number_revision         : in    std_logic_vector( 7 downto 0); -- номер ревизии
        sync_input_pll          : in    std_logic; -- признак синхронизации цифровой ФАПЧ входного тактового сигнала
        AdcBitClkDone_0         : in    std_logic; -- признак синхронизации по тактовой частоте микросхемы АЦП1
        AdcBitClkDone_1         : in    std_logic; -- признак синхронизации по тактовой частоте микросхемы АЦП2
        AdcFrmDone_0            : in    std_logic; -- признак синхронизации по кадровой частоте микросхемы АЦП1
        AdcFrmDone_1            : in    std_logic; -- признак синхронизации по кадровой частоте микросхемы АЦП2
        --- Reg №0 ---
        -- state_reg_0             : in    std_logic_vector( 7 downto 0);
        --- Reg №1 ---
        -- state_reg_1             : in    std_logic_vector( 7 downto 0);
        --- Reg №2 ---
        state_reg_2             : in    std_logic_vector( 7 downto 0);
        --- Reg №3 ---
        state_reg_3             : in    std_logic_vector( 7 downto 0);
        --- Reg №4 ---
        state_reg_4             : in    std_logic_vector( 7 downto 0);
        --- Reg №5 ---
        state_reg_5             : in    std_logic_vector( 7 downto 0);
        --- Reg №6 ---
        state_reg_6             : in    std_logic_vector( 7 downto 0);
        --- Reg №7 ---
        state_reg_7             : in    std_logic_vector( 7 downto 0);

        --- input adc ---
        clk_adc                 : in    std_logic;
        ---
        AdcData_1               : in    std_logic_vector(31 downto 0);
        AdcData_we_1            : in    std_logic;
        AdcData_2               : in    std_logic_vector(31 downto 0);
        AdcData_we_2            : in    std_logic;
        AdcData_3               : in    std_logic_vector(31 downto 0);
        AdcData_we_3            : in    std_logic;
        AdcData_4               : in    std_logic_vector(31 downto 0);
        AdcData_we_4            : in    std_logic;
        AdcData_5               : in    std_logic_vector(31 downto 0);
        AdcData_we_5            : in    std_logic;
        AdcData_6               : in    std_logic_vector(31 downto 0);
        AdcData_we_6            : in    std_logic;
        AdcData_7               : in    std_logic_vector(31 downto 0);
        AdcData_we_7            : in    std_logic;
        AdcData_8               : in    std_logic_vector(31 downto 0);
        AdcData_we_8            : in    std_logic;

        --- input rx filters ---
        clk_rcf                 : in    std_logic;
	 	--- read data port №0 ---
        rdy_filter_0          : out STD_LOGIC;	 
        we_filter_0           : in  STD_LOGIC;
        data_filter_0         : in  STD_LOGIC_VECTOR (31 downto 0);
        
        mode				  : in	std_logic_vector( 1 downto 0);
        fft_pkt_num_dv		  : in  std_logic;
        fft_pkt_num			  : in  std_logic_vector( 7 downto 0);
        fft_freq  		      : in  std_logic_vector( 7 downto 0);        
        
        --- read data port №1 ---
        rdy_filter_1          : out STD_LOGIC;		 
        we_filter_1           : in  STD_LOGIC;
        data_filter_1         : in  STD_LOGIC_VECTOR (31 downto 0);
        --- read data port №2 ---
        rdy_filter_2          : out STD_LOGIC;		 
        we_filter_2           : in  STD_LOGIC;
        data_filter_2         : in  STD_LOGIC_VECTOR (31 downto 0);
        --- read data port №3 ---
        rdy_filter_3          : out STD_LOGIC;		 
        we_filter_3           : in  STD_LOGIC;
        data_filter_3         : in  STD_LOGIC_VECTOR (31 downto 0);
        --- read data port №4 ---
        rdy_filter_4          : out STD_LOGIC;		 
        we_filter_4           : in  STD_LOGIC;
        data_filter_4         : in  STD_LOGIC_VECTOR (31 downto 0);
        --- read data port №5 ---
        rdy_filter_5          : out STD_LOGIC;		 
        we_filter_5           : in  STD_LOGIC;
        data_filter_5         : in  STD_LOGIC_VECTOR (31 downto 0);
        --- read data port №6 ---
        rdy_filter_6          : out STD_LOGIC;		 
        we_filter_6           : in  STD_LOGIC;
        data_filter_6         : in  STD_LOGIC_VECTOR (31 downto 0);
        --- read data port №7 ---
        rdy_filter_7          : out STD_LOGIC;		 
        we_filter_7           : in  STD_LOGIC;
        data_filter_7         : in  STD_LOGIC_VECTOR (31 downto 0);
	 
	 	 --- test ---
        end_packet_rd_2_out     : out   std_logic;
        state_2_out             : out   std_logic_vector( 3 downto 0);
        ready_0_2_out           : out   std_logic;
        rd_0_2_out              : out   std_logic;
        ready_data_rd_2_out     : out   std_logic;
        data_rd_val_2_out       : out   std_logic
	 );
end component; -- usb_module_estrade_v3_0

signal reset_in_data_ch         : std_logic;

signal filter_debug_cnt         : std_logic_vector(31 downto 0);

signal filter_0_rdy             : std_logic;
signal filter_1_rdy             : std_logic;
signal filter_2_rdy             : std_logic;
signal filter_3_rdy             : std_logic;
signal filter_4_rdy             : std_logic;
signal filter_5_rdy             : std_logic;
signal filter_6_rdy             : std_logic;
signal filter_7_rdy             : std_logic;

signal filter_0_dv              : std_logic;
signal filter_0_re              : std_logic_vector(15 downto 0);
signal filter_0_im              : std_logic_vector(15 downto 0);
signal filter_1_dv              : std_logic;
signal filter_1_re              : std_logic_vector(15 downto 0);
signal filter_1_im              : std_logic_vector(15 downto 0);
signal filter_2_dv              : std_logic;
signal filter_2_re              : std_logic_vector(15 downto 0);
signal filter_2_im              : std_logic_vector(15 downto 0);
signal filter_3_dv              : std_logic;
signal filter_3_re              : std_logic_vector(15 downto 0);
signal filter_3_im              : std_logic_vector(15 downto 0);
signal filter_4_dv              : std_logic;
signal filter_4_re              : std_logic_vector(15 downto 0);
signal filter_4_im              : std_logic_vector(15 downto 0);
signal filter_5_dv              : std_logic;
signal filter_5_re              : std_logic_vector(15 downto 0);
signal filter_5_im              : std_logic_vector(15 downto 0);
signal filter_6_dv              : std_logic;
signal filter_6_re              : std_logic_vector(15 downto 0);
signal filter_6_im              : std_logic_vector(15 downto 0);
signal filter_7_dv              : std_logic;
signal filter_7_re              : std_logic_vector(15 downto 0);
signal filter_7_im              : std_logic_vector(15 downto 0);

signal state_reg_0              : std_logic_vector( 7 downto 0);
signal state_reg_1              : std_logic_vector( 7 downto 0);
signal state_reg_2              : std_logic_vector( 7 downto 0);
signal state_reg_3              : std_logic_vector( 7 downto 0);
signal state_reg_4              : std_logic_vector( 7 downto 0);
signal state_reg_5              : std_logic_vector( 7 downto 0);
signal state_reg_6              : std_logic_vector( 7 downto 0);
signal state_reg_7              : std_logic_vector( 7 downto 0);

signal ready_ctrl_src_wr_0      : std_logic;
signal ctrl_src_wr_val_0        : std_logic;
signal ctrl_src_wr_0            : std_logic_vector(31 downto 0);

signal ready_ctrl_src_wr_2      : std_logic;
signal ctrl_src_wr_val_2        : std_logic;
signal ctrl_src_wr_2            : std_logic_vector(31 downto 0);

signal ready_ctrl_src_wr_3      : std_logic;
signal ctrl_src_wr_val_3        : std_logic;
signal ctrl_src_wr_3            : std_logic_vector(31 downto 0);

signal ready_ctrl_src_wr_5      : std_logic;
signal ctrl_src_wr_val_5        : std_logic;
signal ctrl_src_wr_5            : std_logic_vector(31 downto 0);

signal ready_ctrl_src_wr_16     : std_logic;
signal ctrl_src_wr_val_16       : std_logic;
signal ctrl_src_wr_16           : std_logic_vector(31 downto 0);

signal ready_ctrl_src_wr_17     : std_logic;
signal ctrl_src_wr_val_17       : std_logic;
signal ctrl_src_wr_17           : std_logic_vector(31 downto 0);

signal ready_ctrl_src_wr_19     : std_logic;
signal ctrl_src_wr_val_19       : std_logic;
signal ctrl_src_wr_19           : std_logic_vector(31 downto 0);

signal ready_data_wr_0          : std_logic := '1';
signal data_wr_val_0            : std_logic;
signal data_wr_0                : std_logic_vector(31 downto 0);

---------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>> declaration component ctrl_adc <<<<<<<<<<<<<<<<<<<<<--
---------------------------------------------------------------------------
component ctrl_adc
    port (
        clk                 : in    std_logic;
        enable              : in    std_logic;
        reset               : in    std_logic;
	    --- control resource №3 ---
        ready_ctrl_src_wr_3 : out   std_logic;
        ctrl_src_wr_val_3   : in    std_logic;
        ctrl_src_wr_3       : in    std_logic_vector(31 downto 0);
        --- control ADC №1 ---
        csb_1               : out   std_logic;
        sclk_1              : out   std_logic;
        sdio_1              : inout std_logic;
        --- control ADC №2 ---
        csb_2               : out   std_logic;
        sclk_2              : out   std_logic;
        sdio_2              : inout std_logic
    );
end component; -- ctrl_adc

---------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>> declaration component sync_adc <<<<<<<<<<<<<<<<<<<<<--
---------------------------------------------------------------------------
component sync_adc
    port (
        adc_sync        : in    std_logic;
        clk             : in    std_logic;
        reset_adc       : in    std_logic;
        enable_adc      : in    std_logic;
        AdcClkDivSync   : out   std_logic;
        AdcIntrfcRst    : out   std_logic;
        AdcIntrfcEna    : out   std_logic
    );
end component; -- sync_adc

signal AdcClkDivSync    : std_logic;
signal AdcIntrfcRst     : std_logic;
signal AdcIntrfcEna     : std_logic;
signal adc_0_1_sync     : std_logic; -- ClkDivSync  ___|-|___
signal adc_sync     	: std_logic;
signal soft_sync_adc12  : std_logic;

---------------------------------------------------------------------------
-->>>>>>>>>>> declaration component AdcToplevel_Toplevel <<<<<<<<<<<<<<<<--
---------------------------------------------------------------------------
component AdcToplevel_Toplevel
    generic (
        C_OnChipLvdsTerm        : integer := 1;     -- 0 = No Term, 1 - Termination ON.
        C_AdcChnls              : integer := 4;     -- Number of ADC in a package 
        C_AdcWireInt            : integer := 2;     -- 2 = 2-wire, 1 = 1-wire interface
        C_BufioLoc_0            : string := "BUFIO_X1Y6";
        C_BufrLoc_0             : string := "BUFR_X1Y6";
        C_BufioLoc_1            : string := "BUFIO_X1Y5";
        C_BufrLoc_1             : string := "BUFR_X1Y5";
        C_AdcBits               : integer := 16;
        C_StatTaps              : integer := 16;
        C_AdcUseIdlyCtrl        : integer := 1;      -- 0 = No, 1 = Yes
        C_AdcIdlyCtrlLoc        : string  := "IDELAYCTRL_X1Y1";
        C_FrmPattern            : string  := "0000000011110000" -- "1111111100000000"
    );
    port (
        -- ADC 0
        DCLK_0_p_pin            : in    std_logic;
        DCLK_0_n_pin            : in    std_logic;  -- Not used.
        FCLK_0_p_pin            : in    std_logic;
        FCLK_0_n_pin            : in    std_logic;
        DATA_0_p_pin            : in    std_logic_vector((C_AdcChnls*C_AdcWireInt)-1 downto 0);
        DATA_0_n_pin            : in    std_logic_vector((C_AdcChnls*C_AdcWireInt)-1 downto 0);
        -- ADC 1
        DCLK_1_p_pin            : in    std_logic;
        DCLK_1_n_pin            : in    std_logic;  -- Not used.
        FCLK_1_p_pin            : in    std_logic;
        FCLK_1_n_pin            : in    std_logic;
        DATA_1_p_pin            : in    std_logic_vector((C_AdcChnls*C_AdcWireInt)-1 downto 0);
        DATA_1_n_pin            : in    std_logic_vector((C_AdcChnls*C_AdcWireInt)-1 downto 0);
        -- application connections
        SysRefClk               : in    std_logic;      -- 200 MHz for IODELAYCTRL from application
        AdcIntrfcRst            : in    std_logic;
        AdcIntrfcEna            : in    std_logic;
        AdcClkDivSync           : in    std_logic;
        AdcReSync               : in    std_logic;
        -- ADC 0 application connections
        AdcFrmSyncWrn_0         : out   std_logic;
        AdcBitClkAlgnWrn_0      : out   std_logic;
        AdcBitClkInvrtd_0       : out   std_logic;
        AdcBitClkDone_0         : out   std_logic;
        AdcIdlyCtrlRdy_0        : out   std_logic;
        AdcFrmDone_0            : out   std_logic;
        AdcClkOut_0	            : out   std_logic;
        AdcClkDivOut_0	        : out   std_logic;
        -- ADC 1 application connections
        AdcFrmSyncWrn_1         : out   std_logic;
        AdcBitClkAlgnWrn_1      : out   std_logic;
        AdcBitClkInvrtd_1       : out   std_logic;
        AdcBitClkDone_1         : out   std_logic;
        AdcIdlyCtrlRdy_1        : out   std_logic;
        AdcFrmDone_1            : out   std_logic;
        AdcClkOut_1	            : out   std_logic;
        AdcClkDivOut_1	        : out   std_logic;
        -- ADC 0 Data from the frame clock
        AdcFrmDataOut_0         : out   std_logic_vector(15 downto 0);
            -- ADC 1 Data from the frame clock
        AdcFrmDataOut_1         : out   std_logic_vector(15 downto 0);
            -- ADC Data out
        AdcData_ch0             : out   std_logic_vector(13 downto 0);
        AdcData_ch1             : out   std_logic_vector(13 downto 0);
        AdcData_ch2             : out   std_logic_vector(13 downto 0);
        AdcData_ch3             : out   std_logic_vector(13 downto 0);
        AdcData_ch4             : out   std_logic_vector(13 downto 0);
        AdcData_ch5             : out   std_logic_vector(13 downto 0);
        AdcData_ch6             : out   std_logic_vector(13 downto 0);
        AdcData_ch7             : out   std_logic_vector(13 downto 0);
        clk_adc                 : in    std_logic;
        AdcData_16bit_ch0       : out   std_logic_vector(15 downto 0);
        AdcData_16bit_ch1       : out   std_logic_vector(15 downto 0);
        AdcData_16bit_ch2       : out   std_logic_vector(15 downto 0);
        AdcData_16bit_ch3       : out   std_logic_vector(15 downto 0);
        AdcData_16bit_ch4       : out   std_logic_vector(15 downto 0);
        AdcData_16bit_ch5       : out   std_logic_vector(15 downto 0);
        AdcData_16bit_ch6       : out   std_logic_vector(15 downto 0);
        AdcData_16bit_ch7       : out   std_logic_vector(15 downto 0);
        IntDat0_ch0             : out   std_logic_vector( 7 downto 0);
        IntDat1_ch0             : out   std_logic_vector( 7 downto 0);
        IntDat0_ch1             : out   std_logic_vector( 7 downto 0);
        IntDat1_ch1             : out   std_logic_vector( 7 downto 0);
        IntDat0_ch2             : out   std_logic_vector( 7 downto 0);
        IntDat1_ch2             : out   std_logic_vector( 7 downto 0);
        IntDat0_ch3             : out   std_logic_vector( 7 downto 0);
        IntDat1_ch3             : out   std_logic_vector( 7 downto 0);
        IntDat0_ch4             : out   std_logic_vector( 7 downto 0);
        IntDat1_ch4             : out   std_logic_vector( 7 downto 0);
        IntDat0_ch5             : out   std_logic_vector( 7 downto 0);
        IntDat1_ch5             : out   std_logic_vector( 7 downto 0);
        IntDat0_ch6             : out   std_logic_vector( 7 downto 0);
        IntDat1_ch6             : out   std_logic_vector( 7 downto 0);
        IntDat0_ch7             : out   std_logic_vector( 7 downto 0);
        IntDat1_ch7             : out   std_logic_vector( 7 downto 0);
            -- ADC memory input
        AdcMemClk               : in    std_logic;  -- Application clock
        AdcMemRst               : in    std_logic;  -- Application reset 
        AdcMemEna               : in    std_logic   -- Application Enable
	);
end component; -- AdcToplevel_Toplevel

signal AdcBitClkDone_0  : std_logic;
signal AdcFrmDone_0     : std_logic;
signal AdcBitClkDone_1  : std_logic;
signal AdcFrmDone_1     : std_logic;

signal adc_data_ch0     : std_logic_vector(13 downto 0);
signal adc_data_ch1     : std_logic_vector(13 downto 0);
signal adc_data_ch2     : std_logic_vector(13 downto 0);
signal adc_data_ch3     : std_logic_vector(13 downto 0);
signal adc_data_ch4     : std_logic_vector(13 downto 0);
signal adc_data_ch5     : std_logic_vector(13 downto 0);
signal adc_data_ch6     : std_logic_vector(13 downto 0);
signal adc_data_ch7     : std_logic_vector(13 downto 0);

------------------------------------------------------------------------------
-->>>>>>>>> declaration component mc_top
------------------------------------------------------------------------------
constant ROUND	     : std_logic_vector(1 downto 0) := "10"; --! "00" - NoRound, "01" - Simplified to nearest integer (Ilya), "10" - To nearest integer (Anatoly)

constant GROUPS      : integer := 4;
constant PATHS       : integer := 8;
        
constant DDS_P_OBW   : integer := 32;
constant SCA_PAD_BW  : integer := 8;
constant SEL_BW      : integer := 3;
        
constant DI_BW       : integer := 14;
constant INT_BW      : integer := 20;
constant DO_BW       : integer := 16;

component mc_top
    generic(
        ROUND	    : std_logic_vector(1 downto 0) := "00";                     --! "00" - NoRound, "01" - Simplified to nearest integer (Ilya), "10" - To nearest integer (Anatoly)
        
        GROUPS      : integer := 4;
        PATHS       : integer := 8;
        
        DDS_P_OBW   : integer := 32;
        SCA_PAD_BW  : integer := 8;
        SEL_BW      : integer := 3;
        
        DI_BW       : integer := 14;
        INT_BW      : integer := 20;
        DO_BW       : integer := 16
    );
    port(
        CLK         : in std_logic;                                                 --! Синхросигнал
        
        MODE        : in std_logic_vector(0 downto 0);                              --! Режим работы: 0 - ШП, 1 - УП (сейчас работает только ШП режим)
        EN          : in std_logic_vector(GROUPS*PATHS - 1 downto 0);               --! Enable для GROUPS*PATHS фильтров (сейчас активен только LSB для ШП режима)
        
        DDS_INC     : in std_logic_vector(GROUPS*PATHS*DDS_P_OBW - 1 downto 0);     --! FMT: [... [GR3_CH7, GR3_CH6, ..., GR3_CH0], [GR2_CH7, GR2_CH6, ..., GR2_CH0], ..., [GR0_CH7, GR0_CH6, ..., GR0_CH0]]
        DDS_OFF     : in std_logic_vector(GROUPS*PATHS*DDS_P_OBW - 1 downto 0);     --! FMT: [... [GR3_CH7, GR3_CH6, ..., GR3_CH0], [GR2_CH7, GR2_CH6, ..., GR2_CH0], ..., [GR0_CH7, GR0_CH6, ..., GR0_CH0]]
        DDS_ARST_N  : in std_logic_vector(GROUPS*PATHS - 1 downto 0);               --! FMT: [... [GR3_CH7, GR3_CH6, ..., GR3_CH0], [GR2_CH7, GR2_CH6, ..., GR0_CH0], ..., [GR0_CH7, GR0_CH6, ..., GR0_CH0]] 
        
		SCALE_0     : in std_logic_vector(GROUPS*PATHS*SCA_PAD_BW - 1 downto 0);    --! FMT: [... [GR3_CH7, GR3_CH6, ..., GR3_CH0], [GR2_CH7, GR2_CH6, ..., GR0_CH0], ..., [GR0_CH7, GR0_CH6, ..., GR0_CH0]]
		SCALE_1     : in std_logic_vector(GROUPS*PATHS*SCA_PAD_BW - 1 downto 0);    --! FMT: [... [GR3_CH7, GR3_CH6, ..., GR3_CH0], [GR2_CH7, GR2_CH6, ..., GR0_CH0], ..., [GR0_CH7, GR0_CH6, ..., GR0_CH0]]
		SCALE_2     : in std_logic_vector(GROUPS*PATHS*SCA_PAD_BW - 1 downto 0);    --! FMT: [... [GR3_CH7, GR3_CH6, ..., GR3_CH0], [GR2_CH7, GR2_CH6, ..., GR0_CH0], ..., [GR0_CH7, GR0_CH6, ..., GR0_CH0]]
        
        SEL         : in std_logic_vector(GROUPS*PATHS*SEL_BW - 1 downto 0);        --! FMT: [... [GR3_CH7, GR3_CH6, ..., GR3_CH0], [GR2_CH7, GR2_CH6, ..., GR0_CH0], ..., [GR0_CH7, GR0_CH6, ..., GR0_CH0]]
        
        DI          : in std_logic_vector(PATHS*DI_BW - 1 downto 0);                --! FMT: [CH7, CH6, ..., CH0]
        DVI         : in std_logic;                                                 --! DVI
        
        DO_RE       : out std_logic_vector(PATHS*DO_BW - 1 downto 0);        --! Сейчас активны только младшие биты для ШП FMT: [CH7, CH6, ..., CH0]
        DO_IM       : out std_logic_vector(PATHS*DO_BW - 1 downto 0);        --! Сейчас активны только младшие биты для ШП FMT: [CH7, CH6, ..., CH0]
		CH			: out std_logic_vector( 2 downto 0);
        DVO         : out std_logic
    );
end component;

signal mc_dds_rst_n : std_logic_vector(GROUPS*PATHS - 1 downto 0) := (others => '0');
signal mc_di        : std_logic_vector(PATHS*DI_BW - 1 downto 0) := (others => '0');
signal mc_dvi       : std_logic := '0';
signal mc_do_re     : std_logic_vector(PATHS*DO_BW - 1 downto 0) := (others => '0');
signal mc_do_im     : std_logic_vector(PATHS*DO_BW - 1 downto 0) := (others => '0');
signal mc_ch        : std_logic_vector( 2 downto 0) := (others => '0');
signal dmc_ch       : std_logic_vector( 2 downto 0) := (others => '0');
signal mc_dvo       : std_logic := '0';

signal adc_num		: std_logic_vector(32 *  3 - 1 downto 0);
signal dds_off		: std_logic_vector(32 * 32 - 1 downto 0);
signal dds_pinc		: std_logic_vector(32 * 32 - 1 downto 0);
signal scale_0		: std_logic_vector(32 *  8 - 1 downto 0);
signal scale_1		: std_logic_vector(32 *  8 - 1 downto 0);
signal scale_2		: std_logic_vector(32 *  8 - 1 downto 0);

signal mode 				: std_logic_vector( 1 downto 0); -- режим работы: '00' - широкополосный, '01' - узкополосный, '10'  - сканер FFT
signal mode_set  			: std_logic_vector( 1 downto 0); 
signal soft_enable_adc		: std_logic_vector( 7 downto 0);
signal soft_enable_flt		: std_logic_vector(31 downto 0);
signal d0soft_enable_flt	: std_logic_vector(31 downto 0);
signal d1soft_enable_flt	: std_logic_vector(31 downto 0);
signal d2soft_enable_flt	: std_logic_vector(31 downto 0);

signal bb_dv       			: std_logic := '0';
signal dbb_dv      			: std_logic := '0';
signal bb_cnt_byte 			: std_logic_vector( 3 downto 0) := (others => '0');

signal nd_data_0_dv			: std_logic := '0';
signal nd_data_1_dv			: std_logic := '0';
signal nd_data_2_dv			: std_logic := '0';
signal nd_data_3_dv			: std_logic := '0';

signal nd_data_00_re		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_00_im		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_01_re		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_01_im		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_02_re		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_02_im		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_03_re		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_03_im		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_04_re		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_04_im		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_05_re		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_05_im		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_06_re		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_06_im		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_07_re		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_07_im		: std_logic_vector(15 downto 0) := (others => '0');

signal nd_data_10_re		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_10_im		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_11_re		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_11_im		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_12_re		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_12_im		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_13_re		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_13_im		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_14_re		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_14_im		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_15_re		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_15_im		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_16_re		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_16_im		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_17_re		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_17_im		: std_logic_vector(15 downto 0) := (others => '0');

signal nd_data_20_re		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_20_im		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_21_re		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_21_im		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_22_re		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_22_im		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_23_re		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_23_im		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_24_re		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_24_im		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_25_re		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_25_im		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_26_re		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_26_im		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_27_re		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_27_im		: std_logic_vector(15 downto 0) := (others => '0');

signal nd_data_30_re		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_30_im		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_31_re		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_31_im		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_32_re		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_32_im		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_33_re		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_33_im		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_34_re		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_34_im		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_35_re		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_35_im		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_36_re		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_36_im		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_37_re		: std_logic_vector(15 downto 0) := (others => '0');
signal nd_data_37_im		: std_logic_vector(15 downto 0) := (others => '0');

signal nb_0_dv       		: std_logic := '0';
signal dnb_0_dv       		: std_logic := '0';
signal nb_0_cnt_byte 		: std_logic_vector( 3 downto 0) := (others => '0');
signal nb_1_dv       		: std_logic := '0';
signal nb_1_cnt_byte 		: std_logic_vector( 3 downto 0) := (others => '0');
signal nb_2_dv       		: std_logic := '0';
signal nb_2_cnt_byte 		: std_logic_vector( 3 downto 0) := (others => '0');
signal nb_3_dv       		: std_logic := '0';
signal nb_3_cnt_byte 		: std_logic_vector( 3 downto 0) := (others => '0');

----------------------- fft --------------------------------------------------
signal fft_dvo      	: std_logic := '0';
signal fft_do_re    	: std_logic_vector(PATHS*DO_BW - 1 downto 0) := (others => '0');
signal fft_do_im    	: std_logic_vector(PATHS*DO_BW - 1 downto 0) := (others => '0');

signal fft_dv      		: std_logic := '0';
signal dfft_dv     		: std_logic := '0';
signal fft_cnt_byte		: std_logic_vector( 3 downto 0) := (others => '0');

signal fft_pkt_num_dv	: std_logic;
signal fft_pkt_num		: std_logic_vector( 7 downto 0);
signal fft_freq  		: std_logic_vector( 7 downto 0);

signal fft_pkt_num_dv_i	: std_logic;
signal fft_pkt_num_i	: std_logic_vector( 7 downto 0);
signal fft_freq_i		: std_logic_vector( 7 downto 0);

signal scan_wren		: std_logic;
signal scan_addr		: std_logic_vector( 5 downto 0);
signal scan_en			: std_logic;        
signal scan_pinc		: std_logic_vector(31 downto 0);

signal fft_dds_off		: std_logic_vector(32 * 32 - 1 downto 0);
signal fft_dds_pinc		: std_logic_vector(32 * 32 - 1 downto 0);
signal fft_dds_arst_n 	: std_logic_vector(31 downto 0) := (others => '0');

signal dds_off_i		: std_logic_vector(32 * 32 - 1 downto 0);
signal dds_pinc_i		: std_logic_vector(32 * 32 - 1 downto 0);

------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>>>> declaration component ila <<<<<<<<<<<<<<<<<<<<<<<<<< --
------------------------------------------------------------------------------
component ila
    port (
        clk     : in std_logic;
        probe0  : in std_logic_vector(32 downto 0)
    );
end component;

signal probe0   : std_logic_vector(32 downto 0);

------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>>> declaration component ila_ctrl <<<<<<<<<<<<<<<<<<<<<<<--
------------------------------------------------------------------------------
component ila_ctrl
    port (
        clk     : in std_logic;
        probe0  : in std_logic_vector(33 downto 0)
    );
end component;

------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>>>> declaration component vio_0 <<<<<<<<<<<<<<<<<<<<<<<<<--
------------------------------------------------------------------------------
component vio_0
    port (
		clk 		: IN 	STD_LOGIC;
   	 	--probe_out0 	: out 	STD_LOGIC_VECTOR( 7 DOWNTO 0);		
   	 	probe_in0 	: IN 	STD_LOGIC_VECTOR(31 DOWNTO 0);
    	probe_in1 	: IN 	STD_LOGIC_VECTOR(31 DOWNTO 0);
    	probe_in2 	: IN 	STD_LOGIC_VECTOR(31 DOWNTO 0);
    	probe_in3 	: IN 	STD_LOGIC_VECTOR(31 DOWNTO 0);
    	probe_in4 	: IN 	STD_LOGIC_VECTOR(31 DOWNTO 0);
    	probe_in5 	: IN 	STD_LOGIC_VECTOR(31 DOWNTO 0)     
    );
end component;

---------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>> declaration dump_fifo components <<<<<<<<<<<<<<<<<<<--
---------------------------------------------------------------------------
component dump_fifo
    port (
        clk         : in    std_logic;
        srst        : in    std_logic;
        din         : in    std_logic_vector(31 downto 0);
        wr_en       : in    std_logic;
        rd_en       : in    std_logic;
        dout        : out   std_logic_vector(31 downto 0);
        almost_full : out   std_logic;
        full        : out   std_logic;
        empty       : out   std_logic
    );
end component;

signal dump_fifo_wren   : std_logic;
signal dump_fifo_rden   : std_logic;
signal ddump_fifo_rden  : std_logic;
signal dump_fifo_full   : std_logic;
signal dump_fifo_afull  : std_logic;
signal dump_fifo_empty  : std_logic;
signal dump_fifo_do     : std_logic_vector(31 downto 0);
signal dump_fifo_di     : std_logic_vector(31 downto 0);

signal busy_cnt			: std_logic_vector(31 downto 0);
signal busy_cnt_max 	: std_logic_vector(31 downto 0);
signal busy_cnt_trig 	: std_logic_vector(31 downto 0);
signal bysy_cnt_rst		: std_logic;

component vio_busy
	port (
		clk 		: in 	std_logic;
		probe_in0 	: in 	std_logic_vector(31 downto 0);
		probe_in1 	: in 	std_logic_vector(31 downto 0);
		probe_out0 	: out 	std_logic_vector( 0 downto 0)
	);
end component;

signal test_cnt_burst		: std_logic_vector(31 downto 0);
signal test_cnt_burst_set	: std_logic_vector(31 downto 0);
signal test_cnt				: std_logic_vector(31 downto 0);
signal test_cnt_en			: std_logic;

component vio_cnt
	port (
		clk 		: in 	std_logic;
		probe_out0 	: out 	std_logic_vector(31 downto 0);
		probe_out1 	: out 	std_logic_vector( 0 downto 0)	
	);
end component;

component ila_cnt
	port (
		clk 	: IN STD_LOGIC;
		probe0 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    	probe1 : IN STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
end component;

begin

filter_1_dv	<= '0';
filter_2_dv	<= '0';
filter_3_dv	<= '0';

filter_1_re <= (others => '0');
filter_1_im <= (others => '0');
filter_2_re <= (others => '0');
filter_2_im <= (others => '0');
filter_3_re <= (others => '0');
filter_3_im <= (others => '0');

process (clk_adc) begin
     if (clk_adc'event and clk_adc = '1') then
     	
     	if (filter_0_rdy = '0') then
     	
     		if (test_cnt_burst = test_cnt_burst_set) then
     			test_cnt_burst	<= (others => '0');
     		else
     			test_cnt_burst	<= test_cnt_burst + 1;
     		end if;
     	
     		if (test_cnt_burst = 0) then
     			test_cnt	<= test_cnt + 1;
     		
     			if (test_cnt_en = '1' and soft_enable_flt(0) = '1') then
     				filter_0_dv	<= '0'; -- TODO: was 1
     			else
     				filter_0_dv	<= '0';
      			end if;
     		
				filter_0_re <= test_cnt(15 downto  0);
     			filter_0_im <= test_cnt(31 downto 16);
     		else
     			filter_0_dv	<= '0';     		
     	
     		end if;
    	else
    		filter_0_dv	<= '0'; 
     	end if;
	end if;
end process;

test_cnt_burst_set	<= x"0000FF00";
test_cnt_en			<= '1';

--vio_cnt_inst : vio_cnt
--	port map (
--		clk 			=> clk_adc,
--		probe_out0 		=> test_cnt_burst_set,
--		probe_out1(0) 	=> test_cnt_en		
--	);

--ila_cnt_inst : ila_cnt
--	port map (
--		clk 					=> clk_adc,
--		probe0(0)				=> filter_0_dv,
--    	probe1(15 downto  0) 	=> filter_0_re,
--    	probe1(31 downto 16) 	=> filter_0_im    	
--	);

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>> instantiate component ctrl_ad9522 <<<<<<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
ctrl_ad9522_inst : ctrl_ad9522
    port map (
        clk                 => clk_ctrl,
        enable              => enable_ctrl,
        reset               => reset_ctrl,
        --- control resource №2 ---
        ready_ctrl_src_wr_2 => ready_ctrl_src_wr_2,
        ctrl_src_wr_val_2   => ctrl_src_wr_val_2,
        ctrl_src_wr_2       => ctrl_src_wr_2,
        --- control ad9522 ---
        csb                 => OPAD_CLK_CS_FPGA,
        sclk                => OPAD_CLK_SCLK_FPGA,
        sdio                => IOPAD_CLK_SDIO_FPGA,
        sync                => OPAD_CLK_SYNC_FPGA
    );

OPAD_CLK_RESET_FPGA <= not reset_ctrl;
OPAD_CLK_PD_FPGA    <= '1';  

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>> instantiate component clk_ext <<<<<<<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
clk_ext_inst : clk_ext
    port map (
        CLK_FPGA_p_pin  => IPAD_CLK_FPGA_P,
        CLK_FPGA_n_pin  => IPAD_CLK_FPGA_N,
        enable_ctrl     => enable_ctrl,
        clk_ctrl        => clk_ctrl,
        reset           => reset_clk_ext,
        Extclk          => clk_adc,
        reset_out       => reset_adc,
        enable_out      => enable_adc
    );

reset_clk_ext <= reset_adc_pll or reset_ctrl;

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>> instantiate component clk_usb <<<<<<<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
clk_usb_inst : clk_usb
    port map (
        SysRefClk_p_pin  => IPAD_SYSREFCLK_P,
        SysRefClk_n_pin  => IPAD_SYSREFCLK_N,
        SysRefClk        => SysRefClk,    -- 200 MHz for IODELAYCTRL from application
        clk_fx3          => clk_ctrl,
        clk_fx3_io       => clk_ctrl_io,
        clk200           => clk200,
        clk50            => clk50,
        reset_out        => reset_ctrl,
        enable_out       => enable_ctrl
    );

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>>>>>> instantiate component ctrl_adc <<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
ctrl_adc_inst : ctrl_adc
    port map (
        clk                 => clk_ctrl,
        enable              => enable_ctrl,
        reset               => reset_ctrl,
	    --- control resource №3 ---
        ready_ctrl_src_wr_3 => ready_ctrl_src_wr_3,
        ctrl_src_wr_val_3   => ctrl_src_wr_val_3,
        ctrl_src_wr_3       => ctrl_src_wr_3,
        --- control ADC №1 ---
        csb_1               => OPAD_ADC0_CSB,
        sclk_1              => OPAD_ADC0_SCLK,
        sdio_1              => IOPAD_ADC0_SDIO,
        --- control ADC №2 ---
        csb_2               => OPAD_ADC1_CSB,
        sclk_2              => OPAD_ADC1_SCLK,
        sdio_2              => IOPAD_ADC1_SDIO
    );

--OPAD_ADC0_PWDN  <= '0'; -- Digital Input, 30 k? Internal Pull-Down. 
--OPAD_ADC1_PWDN  <= '0'; -- PDWN high = power-down device. PDWN low = run device, normal operation.

OPAD_ADC0_SYNC  <= '0';
OPAD_ADC1_SYNC  <= '0';

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>>>>>> instantiate component sync_adc <<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
sync_adc_inst : sync_adc
    port map ( 
        adc_sync        => adc_sync,
        clk             => clk_adc,
        reset_adc       => reset_adc,
        enable_adc      => enable_adc,
        AdcClkDivSync   => AdcClkDivSync,
        AdcIntrfcRst    => AdcIntrfcRst,
        AdcIntrfcEna    => AdcIntrfcEna
    );

adc_sync	<= adc_0_1_sync or soft_sync_adc12;

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>> instantiate component clk_monitor <<<<<<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
clk_monitor_inst : clk_monitor
    port map (
        -- clock & reset
        RST         => reset_adc,
        CLK         => clk_ctrl,
        -- clock for monitoring
        MON_CLK     => clk_adc,
        -- output
        FALSE_CLK   => adc_0_1_sync
	 );

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>> instantiate component AdcToplevel_Toplevel <<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
adctoplevel_toplevel_inst : AdcToplevel_Toplevel
    generic map (
        C_OnChipLvdsTerm        => 1,     -- 0 = No Term, 1 - Termination ON.
        C_AdcChnls              => 4,     -- Number of ADC in a package 
        C_AdcWireInt            => 2,     -- 2 = 2-wire, 1 = 1-wire interface
        C_BufioLoc_0            => "BUFIO_X1Y6",
        C_BufrLoc_0             => "BUFR_X1Y6", --"BUFR_X1Y5", --"BUFR_X1Y4",
        C_BufioLoc_1            => "BUFIO_X1Y5",
        C_BufrLoc_1             => "BUFR_X1Y5", --"BUFR_X1Y6", --"BUFR_X1Y7",
        C_AdcBits               => 16,
        C_StatTaps              => 16,
        C_AdcUseIdlyCtrl        => 1,      -- 0 = No, 1 = Yes
        C_AdcIdlyCtrlLoc        => "IDELAYCTRL_X1Y1",
        C_FrmPattern            => "0000000000001111" -- "1111111100000000"
    )
    port map (
        -- ADC 0
        DCLK_0_p_pin            => IPAD_ADC0_DCLK_P,
        DCLK_0_n_pin            => IPAD_ADC0_DCLK_N, -- Not used.
        FCLK_0_p_pin            => IPAD_ADC0_FCLK_P,
        FCLK_0_n_pin            => IPAD_ADC0_FCLK_N,
        DATA_0_p_pin            => IPAD_ADC0_DATA_P,
        DATA_0_n_pin            => IPAD_ADC0_DATA_N,
        -- ADC 1
        DCLK_1_p_pin            => IPAD_ADC1_DCLK_P,
        DCLK_1_n_pin            => IPAD_ADC1_DCLK_N, -- Not used.
        FCLK_1_p_pin            => IPAD_ADC1_FCLK_P,
        FCLK_1_n_pin            => IPAD_ADC1_FCLK_N,
        DATA_1_p_pin            => IPAD_ADC1_DATA_P,
        DATA_1_n_pin            => IPAD_ADC1_DATA_N,
        -- application connections
        SysRefClk               => SysRefClk,        -- 200 MHz for IODELAYCTRL from application
        AdcIntrfcRst            => AdcIntrfcRst,
        AdcIntrfcEna            => AdcIntrfcEna,
        AdcClkDivSync           => AdcClkDivSync,
        AdcReSync               => '0',
        -- ADC 0 application connections
        AdcFrmSyncWrn_0         => open,
        AdcBitClkAlgnWrn_0      => open,
        AdcBitClkInvrtd_0       => open,
        AdcBitClkDone_0         => AdcBitClkDone_0,
        AdcIdlyCtrlRdy_0        => open,
        AdcFrmDone_0            => AdcFrmDone_0,
        AdcClkOut_0	            => open,
        AdcClkDivOut_0	        => open,
        -- ADC 1 application connections
        AdcFrmSyncWrn_1         => open,
        AdcBitClkAlgnWrn_1      => open,
        AdcBitClkInvrtd_1       => open,
        AdcBitClkDone_1         => AdcBitClkDone_1,
        AdcIdlyCtrlRdy_1        => open,
        AdcFrmDone_1            => AdcFrmDone_1,
        AdcClkOut_1	            => open,
        AdcClkDivOut_1	        => open,
        -- ADC 0 Data from the frame clock
        AdcFrmDataOut_0         => open,
        -- ADC 1 Data from the frame clock
        AdcFrmDataOut_1         => open,
        -- ADC Data out
        AdcData_ch0             => adc_data_ch0,
        AdcData_ch1             => adc_data_ch1,
        AdcData_ch2             => adc_data_ch2,
        AdcData_ch3             => adc_data_ch3,
        AdcData_ch4             => adc_data_ch4,
        AdcData_ch5             => adc_data_ch5,
        AdcData_ch6             => adc_data_ch6,
        AdcData_ch7             => adc_data_ch7,
        clk_adc                 => clk_adc,
        AdcData_16bit_ch0       => open,
        AdcData_16bit_ch1       => open,
        AdcData_16bit_ch2       => open,
        AdcData_16bit_ch3       => open,
        AdcData_16bit_ch4       => open,
        AdcData_16bit_ch5       => open,
        AdcData_16bit_ch6       => open,
        AdcData_16bit_ch7       => open,
        IntDat0_ch0             => open ,-- state_reg_0,
        IntDat1_ch0             => open ,-- state_reg_1,
        IntDat0_ch1             => open ,-- state_reg_2,
        IntDat1_ch1             => open ,-- state_reg_3,
        IntDat0_ch2             => open ,-- state_reg_4,
        IntDat1_ch2             => open ,-- state_reg_5,
        IntDat0_ch3             => open ,-- state_reg_6,
        IntDat1_ch3             => open ,-- state_reg_7,
        IntDat0_ch4             => open,
        IntDat1_ch4             => open,
        IntDat0_ch5             => open,
        IntDat1_ch5             => open,
        IntDat0_ch6             => open,
        IntDat1_ch6             => open,
        IntDat0_ch7             => open,
        IntDat1_ch7             => open,
        -- ADC memory input
        AdcMemClk               => clk_adc,
        AdcMemRst               => AdcIntrfcRst, 
        AdcMemEna               => AdcIntrfcEna
	);

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>>>>>>> instantiate component ODDR <<<<<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
PCLK_FX3_out : ODDR
    generic map (
        DDR_CLK_EDGE    => "SAME_EDGE", -- "OPPOSITE_EDGE" or "SAME_EDGE" 
        INIT            => '0',         -- Initial value for Q port ('1' or '0')
        SRTYPE          => "ASYNC"      -- Reset Type ("ASYNC" or "SYNC")
    ) 
    port map (
        Q  => OPAD_PCLK_FX3,
        C  => clk_ctrl,
        CE => '1',
        D1 => '0',
        D2 => '1',
        R  => '0',
        S  => '0'
   );

OPAD_RESET_FX3 <= not reset_ctrl;

--reset_reciever <= reset_in_data_ch or reset_adc;

-- soft_enable_flt	<= (others => '1'); -- stub

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>> instantiate component ctrl_flt_wrapper <<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
ctrl_flt_wrapper_inst : ctrl_flt_wrapper 
    port map (
        -- clock & reset
        RST                     => reset_adc,
        ENABLE					=> enable_ctrl,
        CLK                     => clk_ctrl,
        CLK_ADC                 => clk_adc,   
        --- control resource №0 ---
        ready_ctrl_src_wr_0     => ready_ctrl_src_wr_0,
        ctrl_src_wr_val_0       => ctrl_src_wr_val_0,
        ctrl_src_wr_0           => ctrl_src_wr_0,
        --- control resource №5 ---
        ready_ctrl_src_wr_5     => ready_ctrl_src_wr_5,
        ctrl_src_wr_val_5       => ctrl_src_wr_val_5,
        ctrl_src_wr_5           => ctrl_src_wr_5,
        --- control resource №16 ---
        ready_ctrl_src_wr_16    => ready_ctrl_src_wr_16,
        ctrl_src_wr_val_16      => ctrl_src_wr_val_16,
        ctrl_src_wr_16          => ctrl_src_wr_16,        
        --- control resource №17 ---
        ready_ctrl_src_wr_17    => ready_ctrl_src_wr_17,
        ctrl_src_wr_val_17      => ctrl_src_wr_val_17,
        ctrl_src_wr_17          => ctrl_src_wr_17,
        --- control resource №19 ---
        ready_ctrl_src_wr_19    => ready_ctrl_src_wr_19,
        ctrl_src_wr_val_19      => ctrl_src_wr_val_19,
        ctrl_src_wr_19          => ctrl_src_wr_19,
        
		------ output parameter resource №0 (CLK_ADC clock domain) ------
    	ENABLE_ADC           	=> soft_enable_adc,
    	ENABLE_FLT          	=> soft_enable_flt,
		-- reset
    	RESET_FILTERS			=> open,
    	--- ramp_test ---
    	RAMP_TEST_ADC			=> open,
    	RAMP_TEST_FLT			=> open,
    	--- hard_sync ---
    	HARD_SYNC				=> open,
    	--- ADC ---
	 	SYNC_ADC_12           	=> soft_sync_adc12,
	 	PWDN_ADC_0            	=> OPAD_ADC0_PWDN,
	 	PWDN_ADC_1            	=> OPAD_ADC1_PWDN,
	 	
        -- output parameter resource №5 (CLK_ADC clock domain)
		ADC_NUM					=> adc_num,
	 	DDS_OFF					=> dds_off,
	 	DDS_PINC				=> dds_pinc,    	
		SCALE_0					=> scale_0,
		SCALE_1					=> scale_1,
		SCALE_2					=> scale_2,

        -- output parameter resource №16 (CLK clock domain)
		SCAN_WREN 				=> scan_wren,
		SCAN_ADDR				=> scan_addr,
		SCAN_EN 				=> scan_en,        
		SCAN_PINC				=> scan_pinc,

        -- output parameter resource №17 (CLK_ADC clock domain)
		MODE					=> mode_set,  -- режим работы '0' - широкополосный, '1' - узкополосный 

        -- output parameter resource №19 (CLK clock domain)
		FLASH_DATA_DVO			=> flash_data_dv,
        FLASH_DATA				=> flash_data,

        FLASH_CMD_DVO			=> flash_cmd_dv,
		FLASH_CMD            	=> flash_cmd,	
        FLASH_CMD_START_ADDR	=> flash_start_addr,
        FLASH_CMD_PAGE_CNT		=> flash_page_cnt,
        FLASH_CMD_SECTOR_CNT	=> flash_sector_cnt

     );


-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>>>> instantiate component usb_module <<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
usb_module_estrade_v3_0_inst : usb_module_estrade_v3_0
    port map ( 
        clk                     => clk_ctrl,
        clk_io                  => clk_ctrl, -- clk_ctrl_io,
        reset                   => reset_ctrl,
        enable                  => enable_ctrl,
        --- fx3 SyncSlaveFIFO ---
        slcs                    => OPAD_SLCS,
        pktend                  => OPAD_PKTEND,
        slwr                    => OPAD_SLWR,
        slrd                    => OPAD_SLRD,
        sloe                    => OPAD_SLOE,
        addr                    => OPAD_ADDR,
        data                    => IOPAD_DATA,
        flaga                   => IPAD_FLAGA,
        flagb                   => IPAD_FLAGB,
        flagc                   => IPAD_FLAGC,
        flagd                   => IPAD_FLAGD,
        --- CONTROL OUT ---
        reset_input_pll         => reset_adc_pll,       -- сброс цифровой ФАПЧ входного тактового сигнала
        reset_in_data_ch        => reset_in_data_ch,    -- сброс входящих каналов данных
        --- Reg №0-7 ---
        ctrl_reg_0              => open,
        ctrl_reg_1              => open,
        ctrl_reg_2              => open,
        ctrl_reg_3              => open,
        ctrl_reg_4              => open,
        ctrl_reg_5              => open,
        ctrl_reg_6              => open,
        ctrl_reg_7              => open,
        --- write control resource №0 --- 
        ready_ctrl_src_wr_0     => ready_ctrl_src_wr_0,
        ctrl_src_wr_val_0       => ctrl_src_wr_val_0,
        ctrl_src_wr_0           => ctrl_src_wr_0,
        --- write control resource №1 ---
        ready_ctrl_src_wr_1     => '1',
        ctrl_src_wr_val_1       => open,
        ctrl_src_wr_1           => open,
        --- write control resource №2 ---
        ready_ctrl_src_wr_2     => ready_ctrl_src_wr_2,
        ctrl_src_wr_val_2       => ctrl_src_wr_val_2,
        ctrl_src_wr_2           => ctrl_src_wr_2,
        --- write control resource №3 ---
        ready_ctrl_src_wr_3     => ready_ctrl_src_wr_3,
        ctrl_src_wr_val_3       => ctrl_src_wr_val_3,
        ctrl_src_wr_3           => ctrl_src_wr_3,
        --- write control resource №4 ---
        ready_ctrl_src_wr_4     => '1',
        ctrl_src_wr_val_4       => open,
        ctrl_src_wr_4           => open,
        --- write control resource №5 ---
        ready_ctrl_src_wr_5     => ready_ctrl_src_wr_5,
        ctrl_src_wr_val_5       => ctrl_src_wr_val_5,
        ctrl_src_wr_5           => ctrl_src_wr_5,
        --- write control resource №6 ---
        ready_ctrl_src_wr_6     => '1',
        ctrl_src_wr_val_6       => open,
        ctrl_src_wr_6           => open,
        --- write control resource №7 ---
        ready_ctrl_src_wr_7     => '1',
        ctrl_src_wr_val_7       => open,
        ctrl_src_wr_7           => open,
        --- write control resource №8 ---
        ready_ctrl_src_wr_8     => '1',
        ctrl_src_wr_val_8       => open,
        ctrl_src_wr_8           => open,
        --- write control resource №9 ---
        ready_ctrl_src_wr_9     => '1',
        ctrl_src_wr_val_9       => open,
        ctrl_src_wr_9           => open,
        --- write control resource №10 ---
        ready_ctrl_src_wr_10    => '1',
        ctrl_src_wr_val_10      => open,
        ctrl_src_wr_10          => open,
        --- write control resource №11 ---
        ready_ctrl_src_wr_11    => '1',
        ctrl_src_wr_val_11      => open,
        ctrl_src_wr_11          => open,
        --- write control resource №12 ---
        ready_ctrl_src_wr_12    => '1',
        ctrl_src_wr_val_12      => open,
        ctrl_src_wr_12          => open,
        --- write control resource №16 ---
        ready_ctrl_src_wr_16    => ready_ctrl_src_wr_16,
        ctrl_src_wr_val_16      => ctrl_src_wr_val_16,
        ctrl_src_wr_16          => ctrl_src_wr_16,
        --- write control resource №17 ---
        ready_ctrl_src_wr_17    => ready_ctrl_src_wr_17,
        ctrl_src_wr_val_17      => ctrl_src_wr_val_17,
        ctrl_src_wr_17          => ctrl_src_wr_17,
        --- write control resource №19 ---
        ready_ctrl_src_wr_19    => ready_ctrl_src_wr_19,
        ctrl_src_wr_val_19      => ctrl_src_wr_val_19,
        ctrl_src_wr_19          => ctrl_src_wr_19,
        --- write data port №0 --- 
        ready_data_wr_0         => ready_data_wr_0,
        data_wr_val_0           => data_wr_val_0,
        data_wr_0               => data_wr_0,
        --- CONTROL INPUT ---
        number_device           => IPAD_NUMBER_DEVICE,  -- номер устройства
        number_version          => NUMBER_VERSION,      -- номер версии
        number_revision         => NUMBER_REVISION,     -- номер ревизии
        sync_input_pll          => enable_adc,          -- признак синхронизации цифровой ФАПЧ входного тактового сигнала
        AdcBitClkDone_0         => AdcBitClkDone_0,     -- признак синхронизации по тактовой частоте микросхемы АЦП1
        AdcBitClkDone_1         => AdcBitClkDone_1,     -- признак синхронизации по тактовой частоте микросхемы АЦП2
        AdcFrmDone_0            => AdcFrmDone_0,        -- признак синхронизации по кадровой частоте микросхемы АЦП1
        AdcFrmDone_1            => AdcFrmDone_1,        -- признак синхронизации по кадровой частоте микросхемы АЦП2
        --- Reg №0-7 ---
        -- state_reg_0             => state_reg_0,
        -- state_reg_1             => state_reg_1,
        state_reg_2             => state_reg_2,
        state_reg_3             => state_reg_3,
        state_reg_4             => state_reg_4,
        state_reg_5             => state_reg_5,
        state_reg_6             => state_reg_6,
        state_reg_7             => state_reg_7,

        --- input adc ---
        clk_adc                 => clk_adc,
        ---
        AdcData_1               => x"00000000",
        AdcData_we_1            => '0',
        AdcData_2               => x"00000000",
        AdcData_we_2            => '0',
        AdcData_3               => x"00000000",
        AdcData_we_3            => '0',
        AdcData_4               => x"00000000",
        AdcData_we_4            => '0',
        AdcData_5               => x"00000000",
        AdcData_we_5            => '0',
        AdcData_6               => x"00000000",
        AdcData_we_6            => '0',
        AdcData_7               => x"00000000",
        AdcData_we_7            => '0',
        AdcData_8               => x"00000000",
        AdcData_we_8            => '0',

        --- input rx filters ---
        clk_rcf                     => clk_adc, -- clk200,
        --- read data port №0 ---
        rdy_filter_0                => filter_0_rdy,
        we_filter_0                 => filter_0_dv,
        data_filter_0(15 downto  0) => filter_0_re, -- RE
        data_filter_0(31 downto 16) => filter_0_im, -- IM
        
        mode 						=> mode,
        fft_pkt_num_dv		  		=> fft_pkt_num_dv_i,
        fft_pkt_num			  		=> fft_pkt_num_i,
        fft_freq  		      		=> fft_freq_i,   

        --- read data port №1 ---
        rdy_filter_1                => filter_1_rdy,        
        we_filter_1                 => filter_1_dv,
        data_filter_1(15 downto  0) => filter_1_re, -- RE
        data_filter_1(31 downto 16) => filter_1_im, -- IM
        --- read data port №2 ---
        rdy_filter_2                => filter_2_rdy,        
        we_filter_2                 => filter_2_dv,
        data_filter_2(15 downto  0) => filter_2_re, -- RE
        data_filter_2(31 downto 16) => filter_2_im, -- IM
        --- read data port №3 ---
        rdy_filter_3                => filter_3_rdy,          
        we_filter_3                 => filter_3_dv,
        data_filter_3(15 downto  0) => filter_3_re, -- RE
        data_filter_3(31 downto 16) => filter_3_im, -- IM
        --- read data port №4 ---
        rdy_filter_4                => filter_4_rdy,          
        we_filter_4                 => filter_4_dv,
        data_filter_4(15 downto  0) => filter_4_re, -- RE
        data_filter_4(31 downto 16) => filter_4_im, -- IM
        --- read data port №5 ---
        rdy_filter_5                => filter_5_rdy,         
        we_filter_5                 => filter_5_dv,
        data_filter_5(15 downto  0) => filter_5_re, -- RE
        data_filter_5(31 downto 16) => filter_5_im, -- IM
        --- read data port №6 ---
        rdy_filter_6                => filter_6_rdy,          
        we_filter_6                 => filter_6_dv,
        data_filter_6(15 downto  0) => filter_6_re, -- RE
        data_filter_6(31 downto 16) => filter_6_im, -- IM
        --- read data port №7 ---
        rdy_filter_7                => filter_7_rdy,         
        we_filter_7                 => filter_7_dv,
        data_filter_7(15 downto  0) => filter_7_re, -- RE
        data_filter_7(31 downto 16) => filter_7_im, -- IM
	 
	 	 --- test ---
        end_packet_rd_2_out     => open,
        state_2_out             => open,
        ready_0_2_out           => open,
        rd_0_2_out              => open,
        ready_data_rd_2_out     => open,
        data_rd_val_2_out       => open
	 );

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>> instantiate component spi_loader_top <<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
spi_loader_top_inst : spi_loader_top
	port map (
		
		CLK_INT             => clk_ctrl, -- clk100
    	CLK_I				=> clk50,     -- clk50 (100 MHz now)
        SRST_I				=> reset_ctrl,
    
        CMD_DVI_I			=> flash_cmd_dv, 
        CMD_I				=> flash_cmd,        
        START_ADDR_I		=> flash_start_addr,
        PAGE_COUNT_I		=> flash_page_cnt,
        SECTOR_COUNT_I		=> flash_sector_cnt,    
    
        DATA_DVI_I			=> flash_data_dv, 
        DATA_TO_PROG_I		=> flash_data,
    
        DATA_DVO_O			=> flash_data_out_dv,  
        DATA_OUT_O  		=> flash_data_out,
    
        CMD_FIFO_EMPTY_O	=> flash_cmd_fifo_empty,
        CMD_FIFO_FULL_O  	=> flash_cmd_fifo_full,
        DATA_FIFO_PFULL_O	=> flash_data_fifo_pfull,    

		SPI_CS_O  			=> OPAD_CS,
		SPI_MOSI_O  		=> OPAD_DQ0,
		SPI_MISO_I			=> IPAD_DQ1
    );

state_reg_2(0) <= flash_cmd_fifo_empty;
state_reg_2(1) <= flash_cmd_fifo_full;
state_reg_2(2) <= flash_data_fifo_pfull;

--reset_sync_inst: reset_sync
--  port map (
--        CLK100_I  => clk_ctrl,
--        CLK50_I   => clk50,
--        RST100_I  => reset_ctrl,
--       RST50_O   => reset_spi
--    );
-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>> instantiate component spi_loader_ila <<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
--spi_loader_ila_inst : spi_loader_ila
--	port map (
--		clk 	    => clk_ctrl, --clk_ctrl,

--		probe0(0) 	=> flash_data_dv, 
--		probe1 		=> flash_data, 
--		probe2(0)	=> flash_data_out_dv, 
--		probe3 		=> flash_data_out, 
--		probe4(0) 	=> flash_cmd_dv, 
--		probe5 		=> flash_cmd, 
--		probe6 		=> flash_start_addr, 
--		probe7 		=> flash_page_cnt, 
--		probe8 		=> flash_sector_cnt, 
--		probe9(0)	=> flash_cmd_fifo_empty, 
--		probe10(0) 	=> flash_cmd_fifo_full,
--		probe11(0) 	=> flash_data_fifo_pfull
--	);

-- debug USB to ADC interface
-- filter_0_re <= conv_std_logic_vector( 1, 16);
-- filter_0_im <= conv_std_logic_vector( 2, 16);

-- filter_1_re <= conv_std_logic_vector( 3, 16);
-- filter_1_im <= conv_std_logic_vector( 4, 16);

-- filter_2_re <= conv_std_logic_vector( 5, 16);
-- filter_2_im <= conv_std_logic_vector( 6, 16);

-- filter_3_re <= conv_std_logic_vector( 7, 16);
-- filter_3_im <= conv_std_logic_vector( 8, 16);

-- filter_4_re <= conv_std_logic_vector( 9, 16);
-- filter_4_im <= conv_std_logic_vector(10, 16);

-- filter_5_re <= conv_std_logic_vector(11, 16);
-- filter_5_im <= conv_std_logic_vector(12, 16);

-- filter_6_re <= conv_std_logic_vector(13, 16);
-- filter_6_im <= conv_std_logic_vector(14, 16);

-- filter_7_re <= conv_std_logic_vector(15, 16);
-- filter_7_im <= conv_std_logic_vector(16, 16);

-- process (clk_adc, reset_adc) begin
    -- if (clk_adc'event and clk_adc = '1') then
        -- if (reset_adc = '1') then
            -- filter_0_dv         <= '0';        
            -- filter_1_dv         <= '0'; 
            -- filter_2_dv         <= '0';        
            -- filter_3_dv         <= '0'; 
            -- filter_4_dv         <= '0';        
            -- filter_5_dv         <= '0';        
            -- filter_6_dv         <= '0';        
            -- filter_7_dv         <= '0';
            -- filter_debug_cnt    <= (others => '0');
            
        -- else
        
            -- if (filter_debug_cnt = x"00000FFF") then
                -- filter_debug_cnt    <= (others => '0');
            -- else
                -- filter_debug_cnt    <= filter_debug_cnt + 1;
            -- end if;
            
            -- if (filter_debug_cnt = 0) then
                -- filter_0_dv         <= '1';        
                -- filter_1_dv         <= '1'; 
                -- filter_2_dv         <= '1';        
                -- filter_3_dv         <= '1'; 
                -- filter_4_dv         <= '1';        
                -- filter_5_dv         <= '1';        
                -- filter_6_dv         <= '1';        
                -- filter_7_dv         <= '1';             
            -- else
                -- filter_0_dv         <= '0';        
                -- filter_1_dv         <= '0'; 
                -- filter_2_dv         <= '0';        
                -- filter_3_dv         <= '0'; 
                -- filter_4_dv         <= '0';        
                -- filter_5_dv         <= '0';        
                -- filter_6_dv         <= '0';        
                -- filter_7_dv         <= '0';            
            -- end if;
            
        -- end if;
    -- end if;
-- end process;

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>>>> instantiate component vio_0 <<<<<<<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
--vio_0_inst : vio_0
--    port map (
--        CLK         => clk_adc,
--        PROBE_IN0   => dds_pinc(32 * 0 + 31 downto 32 * 0),
--        PROBE_IN1   => dds_pinc(32 * 1 + 31 downto 32 * 1), -- dds_off(32 * 0 + 31 downto 32 * 0),        
--        PROBE_IN2   => dds_pinc(32 * 2 + 31 downto 32 * 2), -- scale_0(8 * 0 + 7 downto 8 * 0),
--        PROBE_IN3   => dds_pinc(32 * 3 + 31 downto 32 * 3), -- scale_1(8 * 0 + 7 downto 8 * 0),
--        PROBE_IN4   => dds_pinc(32 * 5 + 31 downto 32 * 5), -- scale_2(8 * 0 + 7 downto 8 * 0),
--        PROBE_IN5   => dds_pinc(32 * 7 + 31 downto 32 * 7)  -- adc_num(3 * 0 + 2 downto 3 * 0)            
--    );

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>>>> instantiate component ila <<<<<<<<<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
--ila_ctrl_inst : ila_ctrl
--    port map (
--        clk                     => clk_adc,
--        probe0(31 downto 0)     => dds_pinc(31 downto 0),
--        probe0(32)              => soft_sync_adc12,
--        probe0(33)              => adc_sync       
--   );

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>>>> instantiate component ila <<<<<<<<<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
--ila_inst : ila
--    port map (
--        clk         => clk_adc,
--        probe0      => probe0
--    );
    
--probe0(15 downto  0) <= filter_0_re;
--probe0(16) 			 <= filter_0_dv;
--probe0(19 downto 17) <= mc_ch;
--probe0(20) 			 <= mode;
--probe0(32 downto 21) <= (others => '0');
    
probe0(15 downto  0) <= dump_fifo_do(15 downto  0);
probe0(16)           <= ddump_fifo_rden;
probe0(32 downto 17) <= dump_fifo_do(31 downto 16);

dump_fifo_wren              <= nd_data_0_dv; -- when (dmc_ch(2 downto 1) = 1) else '0';
dump_fifo_di(15 downto  0)  <= nd_data_00_re;
dump_fifo_di(31 downto 16)  <= nd_data_00_im;

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>>>> instantiate component dump_fifo <<<<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
dump_fifo_inst : dump_fifo
    port map (
        clk         => clk_adc,
        srst        => '0',
        din         => dump_fifo_di,
        wr_en       => dump_fifo_wren,
        rd_en       => dump_fifo_rden,
        dout        => dump_fifo_do,
        full        => dump_fifo_full,
        almost_full => dump_fifo_afull,
        empty       => dump_fifo_empty
    );

process (clk_adc) begin
    if (clk_adc'event and clk_adc = '1') then
    
        ddump_fifo_rden  <= dump_fifo_rden;
        
        if (dump_fifo_afull = '1') then
            dump_fifo_rden <= '1';
        elsif (dump_fifo_empty = '1') then
            dump_fifo_rden <= '0';
        end if;
        
    end if;
end process;

--vio_busy_inst : vio_busy 
--	port map (
--		clk 			=> clk_adc,
--		probe_in0 		=> busy_cnt_trig,
--		probe_in1 		=> busy_cnt_max,
--		probe_out0(0) 	=> bysy_cnt_rst
--	);

process (clk_adc, bysy_cnt_rst) begin
    if (clk_adc'event and clk_adc = '1') then
    	if (bysy_cnt_rst = '1') then
    		busy_cnt_max	<= (others => '0');
    	else
    		
    		if (busy_cnt_max < busy_cnt) then
    			busy_cnt_max <= busy_cnt;
    		end if;

    		if (filter_0_rdy = '1') then
    			if (mc_dvo = '1') then
    				busy_cnt	<= busy_cnt + 1;
    			end if;
    		else
    			busy_cnt_trig	<= busy_cnt;
    			busy_cnt		<= (others => '0');
    		end if;
    		    		
    	end if;
    end if;
end process;

end usb3_8k_filter_arch;
