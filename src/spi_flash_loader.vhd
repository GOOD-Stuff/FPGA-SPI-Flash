--------  --------  --------  --------    --------  --------  --------  --------
--  Project:    Estrada
--  Target:     

--  Designer:   Krutin D.V.

--  Task date:  2018 march 29

--  Changes and tests: 
--              2018 march 29 (Krutin D.V.) - First release.

--  Registry added date : not yet
--  Documentation file  : none

--  Comments:  
--
--------  --------  --------  --------    --------  --------  --------  --------

library IEEE;
    use IEEE.STD_LOGIC_1164.ALL;
    use IEEE.STD_LOGIC_ARITH.ALL;
    use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity spi_flash_loader is
    port (
        -- Clock and reset
        RST                     : in    std_logic;
        ENABLE                    : in    std_logic;
        USB_CLK                 : in    std_logic;
        CLK_100                 : in    std_logic;
        -- Input Control interfave
        ready_ctrl_src_wr_1     : out   std_logic;
        ctrl_src_wr_val_1       : in    std_logic;
        ctrl_src_wr_1           : in    std_logic_vector(31 downto 0);
        -- Debug interface
        DATA_DVO_O              : out   std_logic;    --  
        DATA_OUT_O              : out   std_logic_vector(7 downto 0);   -- Received data from SPI memory
        -- Output control interface
        CMD_FIFO_EMPTY_O        : out   std_logic;      -- The signal of module when it has completed erasing
        CMD_FIFO_FULL_O         : out   std_logic;      -- The signal of module when it has completed writing
        DATA_FIFO_PFULL_O       : out   std_logic;      -- FIFO is full, must wait while it will be release    
        -- SPI
        SPI_CS_O                : out   std_logic;      -- Chip Select signal for SPI Flash
        SPI_MOSI_O              : out   std_logic;      -- Master Output Slave Input
        SPI_MISO_I              : in    std_logic       -- Master Input Slave Output
    );
end spi_flash_loader;

architecture spi_flash_loader_arch of spi_flash_loader is

---------------------------------------------------------------------------
-->>>>>>>>>>>>> declaration component dbg_spi_resourse <<<<<<<<<<<<<<--
---------------------------------------------------------------------------
component dbg_spi_resourse
    port (
        clk    : IN STD_LOGIC;       
    
        probe0 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
        probe1 : IN STD_LOGIC_VECTOR(2 DOWNTO 0); 
        probe2 : IN STD_LOGIC_VECTOR(31 DOWNTO 0); 
        probe3 : IN STD_LOGIC_VECTOR(15 DOWNTO 0); 
        probe4 : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
        probe5 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
        probe6 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        probe7 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        probe8 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        probe9 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        probe10 : IN STD_LOGIC_VECTOR(0 DOWNTO 0)
    );
end component;


---------------------------------------------------------------------------
-->>>>>>>>>>>>> declaration component ctrl_flt_resource_19 <<<<<<<<<<<<<<--
---------------------------------------------------------------------------
component ctrl_flt_resource_19 is
    port (
    	-- clock & reset
    	RST                     : in    std_logic;
        ENABLE					: in	std_logic;
        CLK                     : in    std_logic;
    
        --- control resource ¹19 (CLK clock domain) ---
    	ready_ctrl_src_wr_19    : out   std_logic;
    	ctrl_src_wr_val_19      : in    std_logic;
    	ctrl_src_wr_19          : in    std_logic_vector(31 downto 0);

    	-- output parameter resource ¹19 (CLK clock domain)
		FLASH_DATA_DVO			: out	std_logic;
		FLASH_DATA				: out	std_logic_vector(31 downto 0);

		FLASH_CMD_DVO			: out	std_logic;
		FLASH_CMD            	: out	std_logic_vector( 2 downto 0);			
		FLASH_CMD_START_ADDR	: out	std_logic_vector(31 downto 0);
		FLASH_CMD_PAGE_CNT		: out	std_logic_vector(15 downto 0);
		FLASH_CMD_SECTOR_CNT	: out	std_logic_vector( 7 downto 0)
    );
end component;

-- Interface signals
signal flash_data_dv            : std_logic := '0';
signal flash_data               : std_logic_vector(31 downto 0) := (others => '0');
signal flash_cmd_dv             : std_logic := '0';
signal flash_cmd                : std_logic_vector( 2 downto 0) := (others => '0');
signal flash_start_addr         : std_logic_vector(31 downto 0) := (others => '0');
signal flash_page_cnt           : std_logic_vector(15 downto 0) := (others => '0');
signal flash_sector_cnt         : std_logic_vector( 7 downto 0) := (others => '0');

signal flash_fifo_cmd_empty         : std_logic := '0';
signal flash_fifo_cmd_full          : std_logic := '0';
signal flash_fifo_data_full         : std_logic := '0';

---------------------------------------------------------------------------
-->>>>>>>>>>>>>>>> declaration component spi_loader_top <<<<<<<<<<<<<<<<<--
---------------------------------------------------------------------------
component spi_loader_top
    port (
        CLK_INT                 : in    std_logic;
        CLK_I                   : in    std_logic; 	-- Synchro signal
        SRST_I                  : in    std_logic;	-- Reset synchro signal

        CMD_DVI_I               : in    std_logic;	-- 
        CMD_I                   : in    std_logic_vector( 2 downto 0);	-- Command (erase/write/read)        
        START_ADDR_I            : in    std_logic_vector(31 downto 0);	-- Address of SPI Flash for write
        PAGE_COUNT_I            : in    std_logic_vector(15 downto 0);	-- Count of page of SPI Flash for write
        SECTOR_COUNT_I          : in    std_logic_vector(7 downto 0);	-- Count of sector of SPI Flash for write    

        DATA_DVI_I              : in    std_logic;	-- 
        DATA_TO_PROG_I          : in    std_logic_vector(31 downto 0);	-- Data to write into SPI Flash

        DATA_DVO_O              : out   std_logic;	--  
        DATA_OUT_O              : out   std_logic_vector(7 downto 0); 	-- Received data from SPI memory

        CMD_FIFO_EMPTY_O        : out   std_logic;	-- The signal of module when it has completed erasing
        CMD_FIFO_FULL_O         : out   std_logic;	-- The signal of module when it has completed writing
        DATA_FIFO_PFULL_O       : out   std_logic;	-- FIFO is full, must wait while it will be release    

        SPI_CS_O                : out   std_logic;	-- Chip Select signal for SPI Flash
        SPI_MOSI_O              : out   std_logic;	-- Master Output Slave Input
        SPI_MISO_I              : in    std_logic	-- Master Input Slave Output
    );
end component;

begin    
    -------------------------------------------------------------------------------
    -->>>>>>>>>>>>>>> instantiate component ctrl_flt_resource_19 <<<<<<<<<<<<<<<<--
    -------------------------------------------------------------------------------   
    ctrl_flt_resource_19_inst : ctrl_flt_resource_19
        port map (
            -- clock & reset
            RST                     => RST,
            ENABLE					=> ENABLE,
            CLK                     => USB_CLK,
        
            --- control resource ¹19 (CLK clock domain) ---
            ready_ctrl_src_wr_19    => ready_ctrl_src_wr_1,
            ctrl_src_wr_val_19      => ctrl_src_wr_val_1,
            ctrl_src_wr_19          => ctrl_src_wr_1,
    
            -- output parameter resource ¹19 (CLK clock domain)
            FLASH_DATA_DVO          => flash_data_dv,
            FLASH_DATA              => flash_data,
    
            FLASH_CMD_DVO           => flash_cmd_dv,
            FLASH_CMD               => flash_cmd,
            FLASH_CMD_START_ADDR    => flash_start_addr,
            FLASH_CMD_PAGE_CNT      => flash_page_cnt,
            FLASH_CMD_SECTOR_CNT    => flash_sector_cnt
        );
 
    CMD_FIFO_EMPTY_O  <= flash_fifo_cmd_empty;
    CMD_FIFO_FULL_O   <= flash_fifo_cmd_full;
    DATA_FIFO_PFULL_O <= flash_fifo_data_full;
    -------------------------------------------------------------------------------
    -->>>>>>>>>>>>>>>>> instantiate component spi_loader_top <<<<<<<<<<<<<<<<<<<<--
    -------------------------------------------------------------------------------
    spi_loader_top_inst : spi_loader_top
        port map (
            
            CLK_INT             => USB_CLK,
            CLK_I               => CLK_100,
            SRST_I              => RST,
        
            CMD_DVI_I           => flash_cmd_dv, 
            CMD_I               => flash_cmd,        
            START_ADDR_I        => flash_start_addr,
            PAGE_COUNT_I        => flash_page_cnt,
            SECTOR_COUNT_I      => flash_sector_cnt,    
    
            DATA_DVI_I          => flash_data_dv, 
            DATA_TO_PROG_I      => flash_data,
        
            DATA_DVO_O          => DATA_DVO_O,  
            DATA_OUT_O          => DATA_OUT_O,
        
            CMD_FIFO_EMPTY_O    => flash_fifo_cmd_empty,
            CMD_FIFO_FULL_O     => flash_fifo_cmd_full,
            DATA_FIFO_PFULL_O   => flash_fifo_data_full,    
    
            SPI_CS_O            => SPI_CS_O,
            SPI_MOSI_O          => SPI_MOSI_O,
            SPI_MISO_I          => SPI_MISO_I
        ); 
                    
    -------------------------------------------------------------------------------
    -->>>>>>>>>>>>>>>>> instantiate component spi_loader_top <<<<<<<<<<<<<<<<<<<<--
    -------------------------------------------------------------------------------
    dbg_resourse: dbg_spi_resourse
    port map (
        clk => USB_CLK,    
    
        probe0(0) => flash_cmd_dv, 
        probe1    => flash_cmd, 
        probe2    => flash_start_addr, 
        probe3    => flash_page_cnt, 
        probe4    => flash_sector_cnt, 
        probe5(0) => flash_data_dv, 
        probe6    => flash_data,
        probe7(0) => ENABLE,

        probe8(0) => flash_fifo_cmd_empty,
        probe9(0) => flash_fifo_cmd_full,
        probe10(0) => flash_fifo_data_full
    );        
        
end spi_flash_loader_arch;