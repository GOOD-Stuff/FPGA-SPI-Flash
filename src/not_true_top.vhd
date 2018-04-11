library ieee;
    use ieee.std_logic_1164.all;
    use IEEE.STD_LOGIC_ARITH.ALL;
    use IEEE.STD_LOGIC_UNSIGNED.ALL;

Library UNISIM;
    use UNISIM.vcomponents.all;
    
entity some_top is
	port (
		-- some ports
		OPAD_CS   : out std_logic;
    	OPAD_DQ0  : out std_logic; -- Serial data - transfers data into the device  (FPGA -> Flash)
		IPAD_DQ1  : in  std_logic; -- Serial data - Transfer data out of the device (FPGA <- Flash)
	);
end some_top;

architecture some_top_arch of some_top is
---------------------------------------------------------------------------
-->>>>>>>>>>>>>>> declaration component spi loader <<<<<<<<<<<<<<<<<<<<<--
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

signal flash_data_dv		 : std_logic := '0';
signal flash_data 			 : std_logic_vector(31 downto 0) := (others => '0');

signal flash_data_out_dv	 : std_logic := '0';
signal flash_data_out   	 : std_logic_vector( 7 downto 0) := (others => '0');

signal flash_cmd_dv     	 : std_logic := '0';
signal flash_cmd     		 : std_logic_vector( 2 downto 0) := (others => '0');
signal flash_start_addr		 : std_logic_vector(23 downto 0) := (others => '0');
signal flash_page_cnt		 : std_logic_vector(15 downto 0) := (others => '0');
signal flash_sector_cnt		 : std_logic_vector( 7 downto 0) := (others => '0');

signal flash_cmd_fifo_empty  : std_logic := '0';
signal flash_cmd_fifo_full   : std_logic := '0';
signal flash_data_fifo_pfull : std_logic := '0';

---------------------------------------------------------------------------
-->>>>>>>>>>>>>> declaration component spi_loader_ila <<<<<<<<<<<<<<<<<<<--
---------------------------------------------------------------------------
component spi_loader_ila
	port (
		clk 	: IN STD_LOGIC;
		probe0 	: IN STD_LOGIC_VECTOR( 0 DOWNTO 0); 
		probe1 	: IN STD_LOGIC_VECTOR(31 DOWNTO 0); 
		probe2 	: IN STD_LOGIC_VECTOR( 0 DOWNTO 0); 
		probe3 	: IN STD_LOGIC_VECTOR( 7 DOWNTO 0); 
		probe4 	: IN STD_LOGIC_VECTOR( 0 DOWNTO 0); 
		probe5 	: IN STD_LOGIC_VECTOR( 2 DOWNTO 0); 
		probe6 	: IN STD_LOGIC_VECTOR(23 DOWNTO 0); 
		probe7 	: IN STD_LOGIC_VECTOR(15 DOWNTO 0); 
		probe8 	: IN STD_LOGIC_VECTOR( 7 DOWNTO 0); 
		probe9 	: IN STD_LOGIC_VECTOR( 0 DOWNTO 0); 
		probe10 : IN STD_LOGIC_VECTOR( 0 DOWNTO 0);
		probe11 : IN STD_LOGIC_VECTOR( 0 DOWNTO 0)
	);
end component;

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
-->>>>>>>>>>>>>>>>>> declaration component clk_ext <<<<<<<<<<<<<<<<<<<<<<--
-- Component which provide clock (here must be your implementation)
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

signal clk50            : std_logic;
signal reset_ctrl       : std_logic;
signal SysRefClk        : std_logic;

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
-->>>>>>>>>>>>>>>>> instantiate component spi_loader_top <<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
spi_loader_top_inst : spi_loader_top
	port map (
		
		CLK_INT             => clk_ctrl,  -- clk100 MHz
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
    
-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>> instantiate component spi_loader_ila <<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
spi_loader_ila_inst : spi_loader_ila
	port map (
		clk 	    => clk_ctrl, --clk_ctrl,

		probe0(0) 	=> flash_data_dv, 
		probe1 		=> flash_data, 
		probe2(0)	=> flash_data_out_dv, 
		probe3 		=> flash_data_out, 
		probe4(0) 	=> flash_cmd_dv, 
		probe5 		=> flash_cmd, 
		probe6 		=> flash_start_addr, 
		probe7 		=> flash_page_cnt, 
		probe8 		=> flash_sector_cnt, 
		probe9(0)	=> flash_cmd_fifo_empty, 
		probe10(0) 	=> flash_cmd_fifo_full,
		probe11(0) 	=> flash_data_fifo_pfull
	);

end some_top_arch;