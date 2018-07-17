
library IEEE;
	use IEEE.std_logic_1164.all;

package madc_cmd_pkg is

component madc_cmd
	port (
        -- clock & reset
		RST                 : in   std_logic;
		CLK                 : in   std_logic;
		CLK_FLASH           : in   std_logic;	
		CLK_ADC 			: in   std_logic;
		CLK_ADC_X4			: in   std_logic;

		-- address settings
		RS					: in	std_logic_vector( 1 downto 0);
		GA					: in	std_logic_vector( 2 downto 0);
			
		-- input interface (CLK clock domain)
		S_AXI_TVALID        : in   std_logic;
		S_AXI_TLAST         : in   std_logic;		
		S_AXI_TDATA         : in   std_logic_vector( 7 downto 0);
		
		-- QSPI feedback
		FLASH_CMD_BUSY 		: out  std_logic;
		FLASH_DATA_BUSY 	: out  std_logic;
		
		-- DDC tuning (CLK_ADC clock domain) -- 0x01
		DDC0_ARST			: out	std_logic;
		DDC0_VALID			: out	std_logic;	
		DDC0_PINC			: out	std_logic_vector(31 downto 0);
		DDC0_POFF			: out	std_logic_vector(31 downto 0);
		
		DDC1_ARST			: out	std_logic;
		DDC1_VALID			: out	std_logic;	
		DDC1_PINC			: out	std_logic_vector(31 downto 0);
		DDC1_POFF			: out	std_logic_vector(31 downto 0);		

		DDC2_ARST			: out	std_logic;
		DDC2_VALID			: out	std_logic;	
		DDC2_PINC			: out	std_logic_vector(31 downto 0);
		DDC2_POFF			: out	std_logic_vector(31 downto 0);				

		DDC3_ARST			: out	std_logic;
		DDC3_VALID			: out	std_logic;	
		DDC3_PINC			: out	std_logic_vector(31 downto 0);
		DDC3_POFF			: out	std_logic_vector(31 downto 0);	

		-- tuning FIR (ADC_CLK_X4 clock domain) -- 0x02
		SCALE0				: out	std_logic_vector( 3 downto 0);
		SCALE1				: out	std_logic_vector( 3 downto 0);
		SCALE2				: out	std_logic_vector( 3 downto 0);
		SCALE3				: out	std_logic_vector( 3 downto 0)	
		
	);
end component;

end package;

library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.std_logic_UNSIGNED.all;
	
--library UNISIM;
--	use UNISIM.VCOMPONENTS.all;

	


entity madc_cmd is
	port (
        -- clock & reset
		RST                 : in   std_logic;
		CLK                 : in   std_logic;
		CLK_FLASH           : in   std_logic;		
		CLK_ADC 			: in   std_logic;
		CLK_ADC_X4			: in   std_logic;
		
		-- address settings
		RS					: in	std_logic_vector( 1 downto 0);
		GA					: in	std_logic_vector( 2 downto 0);
			
		-- input interface (CLK clock domain)
		S_AXI_TVALID        : in   std_logic;
		S_AXI_TLAST         : in   std_logic;		
		S_AXI_TDATA         : in   std_logic_vector( 7 downto 0);
		
		-- QSPI feedback
		FLASH_CMD_BUSY 		: out  std_logic;
		FLASH_DATA_BUSY 	: out  std_logic;
		
		-- DDC tuning (CLK_ADC clock domain) -- 0x01
		DDC0_ARST			: out	std_logic;
		DDC0_VALID			: out	std_logic;	
		DDC0_PINC			: out	std_logic_vector(31 downto 0);
		DDC0_POFF			: out	std_logic_vector(31 downto 0);
		
		DDC1_ARST			: out	std_logic;
		DDC1_VALID			: out	std_logic;	
		DDC1_PINC			: out	std_logic_vector(31 downto 0);
		DDC1_POFF			: out	std_logic_vector(31 downto 0);		

		DDC2_ARST			: out	std_logic;
		DDC2_VALID			: out	std_logic;	
		DDC2_PINC			: out	std_logic_vector(31 downto 0);
		DDC2_POFF			: out	std_logic_vector(31 downto 0);				

		DDC3_ARST			: out	std_logic;
		DDC3_VALID			: out	std_logic;	
		DDC3_PINC			: out	std_logic_vector(31 downto 0);
		DDC3_POFF			: out	std_logic_vector(31 downto 0);	

		-- tuning FIR (ADC_CLK_X4 clock domain) -- 0x02
		SCALE0				: out	std_logic_vector( 3 downto 0);
		SCALE1				: out	std_logic_vector( 3 downto 0);
		SCALE2				: out	std_logic_vector( 3 downto 0);
		SCALE3				: out	std_logic_vector( 3 downto 0)	
		
	);
end madc_cmd;

architecture madc_cmd_arch of madc_cmd is

constant RESOURCE_DDC				: std_logic_vector( 7 downto 0) := x"01";
constant RESOURCE_FIR				: std_logic_vector( 7 downto 0) := x"02";
constant RESOURCE_SVC_FLASH_LOADER	: std_logic_vector( 7 downto 0) := x"80";

signal address			: std_logic_vector( 7 downto 0);
signal addr_en			: std_logic;
signal resource			: std_logic_vector( 7 downto 0);
signal in_byte_cnt		: std_logic_vector( 8 downto 0) := (others => '0');

signal rst_n			: std_logic;

signal ddc_num			: std_logic_vector( 1 downto 0) := (others => '0');
signal ddc_valid		: std_logic;
signal ddc_pinc			: std_logic_vector(31 downto 0) := (others => '0');
signal ddc_poff			: std_logic_vector(31 downto 0) := (others => '0');

signal fir_num			: std_logic_vector( 1 downto 0) := (others => '0');
signal fir_valid		: std_logic;
signal fir_scale		: std_logic_vector( 3 downto 0) := (others => '0');

signal flash_cmd_valid		: std_logic;
signal flash_data_valid		: std_logic;
signal flash_in_data		: std_logic_vector( 7 downto 0) := (others => '0');
signal flash_in_cmd     	: std_logic_vector( 2 downto 0) := (others => '0');
signal flash_in_start_addr	: std_logic_vector(31 downto 0) := (others => '0');
signal flash_in_page_cnt	: std_logic_vector(15 downto 0) := (others => '0');
signal flash_in_sector_cnt	: std_logic_vector( 7 downto 0) := (others => '0');


---------------------------------------------------------------------------
-->>>>>>>>>>>>>> declaration component axis_checker_x8 <<<<<<<<<<<<<<<<<<--
---------------------------------------------------------------------------


    component axis_checker_x8
        generic(
            TIMER_LIMIT             :           integer                          := 156250000   
        );
        port(
            ACLK                    :   in      std_logic                                       ;
            ARESET                  :   in      std_logic                                       ;
            ENABLE                  :   in      std_logic                                       ;
            S_AXIS_TDATA            :   in      std_logic_vector (  7 downto 0 )                ;
            S_AXIS_TVALID           :   in      std_logic                                       ;
            DATA_SPEED              :   out     std_logic_vector ( 31 downto 0 )                ;
            HAS_DATA_ERR            :   out     std_logic                           
        );
    end component;
    
	
	
	signal 	vio_RESET                  :   std_logic                                       ;
	signal 	vio_ENABLE                  :   std_logic                                       ;
	signal 	chk_S_AXIS_TDATA            :   std_logic_vector (  7 downto 0 )                ;
	signal 	chk_S_AXIS_TVALID           :   std_logic                                       ;
	signal 	chk_DATA_SPEED              :   std_logic_vector ( 31 downto 0 )                ;
	signal 	chk_HAS_DATA_ERR            :   std_logic 			 							;
  
	
	---------------------------------------------------------------------------
	-->>>>>>>>>>>>>>>> declaration component vio_checker <<<<<<<<<<<<<<<<<<<<--
	---------------------------------------------------------------------------

  
  
    COMPONENT vio_checker
	  PORT (
	    clk : IN STD_LOGIC;
	    probe_in0 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	    probe_out0 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
	    probe_out1 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
	  );
	END COMPONENT;


---------------------------------------------------------------------------
-->>>>>>>>>>>>>> declaration component spi_loader_fifo <<<<<<<<<<<<<<<<<<--
---------------------------------------------------------------------------
component spi_loader_fifo
	port (
		rst 	: in 	std_logic;
		wr_clk 	: in 	std_logic;
		rd_clk 	: in 	std_logic;
		din 	: in 	std_logic_vector(7 downto 0);
		wr_en 	: in 	std_logic;
		rd_en 	: in 	std_logic;
		dout 	: out 	std_logic_vector(7 downto 0);
		full 	: out 	std_logic;
		empty 	: out 	std_logic;
    	wr_rst_busy : OUT STD_LOGIC;
    	rd_rst_busy : OUT STD_LOGIC		

);
end component;

signal flash_data_fifo_rden		: std_logic := '0';
signal flash_data_fifo_empty	: std_logic := '0';
signal flash_data_fifo_full 	: std_logic := '0';


-- TODO: del, for debug
--component ila_0
--	port (
--		clk     : in std_logic;
--		probe0  : in std_logic_vector(0 downto 0);
--		probe1  : in std_logic_vector(7 downto 0);
--		probe2  : in std_logic_vector(0 downto 0);
--		probe3  : in std_logic_vector(7 downto 0);
--		probe4  : in std_logic_vector(0 downto 0);
--		probe5  : in std_logic_vector(0 downto 0);
--		probe6  : in std_logic_vector(8 downto 0);
--		probe7  : in std_logic_vector(2 downto 0);
--		probe8  : in std_logic_vector(7 downto 0);
--		probe9  : in std_logic_vector(0 downto 0);
--		probe10 : in std_logic_vector(0 downto 0)
--	);
--end component;

---------------------------------------------------------------------------
-->>>>>>>>>>>>>> declaration component spi_loader_top <<<<<<<<<<<<<<<<<<<--
---------------------------------------------------------------------------
component spi_loader_top
	port (

        CLK_INT				: in	std_logic; 	-- Syncro signal, 100 MHz
    	CLK_I				: in	std_logic; 	-- Synchro signal
        SRST_I				: in	std_logic;	-- Reset synchro signal
    
        CMD_DVI_I			: in	std_logic;	-- 
        CMD_I				: in	std_logic_vector( 2 downto 0);	-- Command (erase/write/read)        
        START_ADDR_I		: in	std_logic_vector(31 downto 0);	-- Address of SPI Flash for write
        PAGE_COUNT_I		: in	std_logic_vector(15 downto 0);	-- Count of page of SPI Flash for write
        SECTOR_COUNT_I		: in	std_logic_vector(7 downto 0);	-- Count of sector of SPI Flash for write    
    
        DATA_DVI_I			: in	std_logic;	-- 
        DATA_TO_PROG_I		: in	std_logic_vector(7 downto 0);	-- Data to write into SPI Flash
    
        DATA_DVO_O			: out	std_logic;	--  
        DATA_OUT_O  		: out	std_logic_vector(7 downto 0); 	-- Received data from SPI memory
    
        CMD_FIFO_EMPTY_O	: out	std_logic;	-- The signal of module when it has completed erasing
        CMD_FIFO_FULL_O  	: out	std_logic;	-- The signal of module when it has completed writing
        DATA_FIFO_PFULL_O	: out	std_logic;	-- FIFO is full, must wait while it will be release    

        SPI_CS_O			: out	std_logic;	-- Chip Select signal for SPI Flash
        SPI_MOSI_O			: out	std_logic	-- Master Output Slave Input
    );
end component;

signal flash_data_dv		: std_logic := '0';
signal flash_data 			: std_logic_vector( 7 downto 0) := (others => '0');

signal flash_data_out_dv	: std_logic := '0';
signal flash_data_out   	: std_logic_vector( 7 downto 0) := (others => '0');

signal flash_cmd_dv     	: std_logic := '0';
signal flash_cmd     		: std_logic_vector( 2 downto 0) := (others => '0');
signal flash_start_addr		: std_logic_vector(31 downto 0) := (others => '0');
signal flash_page_cnt		: std_logic_vector(15 downto 0) := (others => '0');
signal flash_sector_cnt		: std_logic_vector( 7 downto 0) := (others => '0');

signal flash_cmd_fifo_empty 	: std_logic := '0';
signal flash_cmd_fifo_full  	: std_logic := '0';
signal flash_data_fifo_pfull 	: std_logic := '0';

------------------------------------------------------------------------------
-->>>>>>>>>>>>> declaration component madc_cmd_clk_conv <<<<<<<<<<<<<<<<<<<<--
------------------------------------------------------------------------------
component madc_cmd_clk_conv
	port (
    	s_axis_aresetn 	: in 	std_logic;
    	m_axis_aresetn 	: in 	std_logic;
    	s_axis_aclk 	: in 	std_logic;
    	s_axis_tvalid 	: in 	std_logic;
    	s_axis_tready 	: out 	std_logic;
    	s_axis_tdata 	: in 	std_logic_vector(63 downto 0);
    	m_axis_aclk 	: in 	std_logic;
    	m_axis_tvalid 	: out 	std_logic;
    	m_axis_tready 	: in 	std_logic;
   	 	m_axis_tdata 	: out 	std_logic_vector(63 downto 0)
  	);
end component;

-- svc FLASH
signal s_axis_tvalid_flash 	: std_logic;
signal s_axis_tdata_flash	: std_logic_vector(63 downto 0);
signal m_axis_tvalid_flash 	: std_logic;
signal s_axis_tready_flash 	: std_logic;
signal m_axis_tdata_flash	: std_logic_vector(63 downto 0);

begin

rst_n	<= not RST;
address	<= "000" & RS(0) & '1' & GA;

---------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>>>>>>>>> CHECK address <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<--
---------------------------------------------------------------------------
process (RST, CLK) begin
	if (CLK'event and CLK = '1') then
		if (RST = '1') then
			in_byte_cnt	<= (others => '0');
			resource	<= (others => '0');
			addr_en		<= '0';
						
		else
			
			if (S_AXI_TVALID = '1') then
				if (S_AXI_TLAST = '1') then
					in_byte_cnt	<= (others => '0');
				else
					if (in_byte_cnt < x"10C") then --x"FF") then
						in_byte_cnt	<= in_byte_cnt + 1;
					end if;
				end if;				

				-- address			
        		if (in_byte_cnt = x"02") then
        			if (S_AXI_TDATA = address) then
     					addr_en		<= '1';
     				else
     					addr_en		<= '0';
     				end if;
				end if;  			
			
				-- resource			
        		if (in_byte_cnt = x"03") then 
     				resource	<= S_AXI_TDATA;
				end if;
			   			
			end if;			
		end if;	
	end if;
end process;

---------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>>> RESOURCE_SVC_FLASH_LOADER <<<<<<<<<<<<<<<<<<<<<<<<<--
---------------------------------------------------------------------------
process (RST, CLK) begin
	if (CLK'event and CLK = '1') then
		if (RST = '1') then
			flash_cmd_valid		<= '0';
			flash_data_valid	<= '0';
			flash_in_data		<= (others => '0');
			flash_in_cmd     	<= (others => '0');
			flash_in_start_addr	<= (others => '0');
			flash_in_page_cnt	<= (others => '0');
			flash_in_sector_cnt	<= (others => '0');

		else
		
			if (S_AXI_TVALID = '1' and addr_en = '1' and resource = RESOURCE_SVC_FLASH_LOADER) then	

				--	4	CMD[2:0]
				if (in_byte_cnt = 4) then
					flash_in_cmd	<= S_AXI_TDATA( 2 downto 0);
				end if;
				
				--	5	START_ADDR[7:0]
				if (in_byte_cnt = 5) then
					flash_in_start_addr( 7 downto  0)	<= S_AXI_TDATA;
				end if;
				
				--	6	START_ADDR[15:8]
				if (in_byte_cnt = 6) then
					flash_in_start_addr(15 downto  8)	<= S_AXI_TDATA;
				end if;
				
				--	7	START_ADDR[23:16]
				if (in_byte_cnt = 7) then
					flash_in_start_addr(23 downto 16)	<= S_AXI_TDATA;
				end if;
				
				--	8	START_ADDR[31:24]
				if (in_byte_cnt = 8) then
					flash_in_start_addr(31 downto 24)	<= S_AXI_TDATA;
				end if;

				--	9	PAGE_COUNT[7:0]
				if (in_byte_cnt = 9) then
					flash_in_page_cnt( 7 downto  0)	<= S_AXI_TDATA;
				end if;				
								
				--	10	PAGE_COUNT[15:8]
				if (in_byte_cnt = 10) then
					flash_in_page_cnt(15 downto  8)	<= S_AXI_TDATA;
				end if;
								
				--	11	SECTOR_COUNT[7:0]
				if (in_byte_cnt = 11) then
					flash_in_sector_cnt	<= S_AXI_TDATA;
				end if;			
				
				-- DATA_TO_PROG (256 байт)	
				if (in_byte_cnt > 11 and in_byte_cnt < 268 and flash_in_cmd = "011") then
					flash_data_valid	<= '1';
					flash_in_data		<= S_AXI_TDATA;
				else
					flash_data_valid	<= '0';
				end if;
				
				if (S_AXI_TLAST = '1') then
					flash_cmd_valid	<= '1';
				else
					flash_cmd_valid	<= '0';
				end if;
			
			else
				flash_cmd_valid		<= '0';
				flash_data_valid	<= '0';
			end if;
			
		end if;	
	end if;
end process;

process (RST, CLK) begin
	if (CLK'event and CLK = '1') then
		if (RST = '1') then
			s_axis_tvalid_flash	<= '0';
		else
			if (flash_cmd_valid = '1') then
				s_axis_tvalid_flash	<= '1';		
			else
				if (s_axis_tready_flash = '1') then
					s_axis_tvalid_flash 	<= '0';
				end if;
			end if;			
		end if;	
	end if;
end process;

s_axis_tdata_flash( 2 downto  0)	<= flash_in_cmd;
s_axis_tdata_flash(34 downto  3)	<= flash_in_start_addr;
s_axis_tdata_flash(50 downto 35)	<= flash_in_page_cnt;
s_axis_tdata_flash(58 downto 51)	<= flash_in_sector_cnt;

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>> instantiate component madc_cmd_clk_conv <<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
madc_cmd_clk_conv_flash_inst : madc_cmd_clk_conv
	port map (
    	s_axis_aresetn 	=> rst_n,
    	m_axis_aresetn 	=> rst_n,
    	s_axis_aclk 	=> CLK,
    	s_axis_tvalid 	=> s_axis_tvalid_flash,
    	s_axis_tready 	=> s_axis_tready_flash,
    	s_axis_tdata 	=> s_axis_tdata_flash,
    	m_axis_aclk 	=> CLK_FLASH,
    	m_axis_tvalid 	=> m_axis_tvalid_flash,
    	m_axis_tready 	=> '1',
   	 	m_axis_tdata 	=> m_axis_tdata_flash
  	);

process (CLK_FLASH) begin
	if (CLK_FLASH'event and CLK_FLASH = '1') then
		if (m_axis_tvalid_flash = '1') then
			flash_cmd_dv		<= '1';
			flash_cmd			<= m_axis_tdata_flash( 2 downto  0);
			flash_start_addr	<= m_axis_tdata_flash(34 downto  3);
			flash_page_cnt		<= m_axis_tdata_flash(50 downto 35);
			flash_sector_cnt	<= m_axis_tdata_flash(58 downto 51);
		else
			flash_cmd_dv		<= '0';
		end if;
	end if;
end process;

-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>> instantiate component spi_loader_fifo <<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
spi_loader_fifo_inst : spi_loader_fifo
	port map (
		rst 	=> RST,
		wr_clk 	=> CLK,
		rd_clk 	=> CLK_FLASH,
		din 	=> flash_in_data,
		wr_en 	=> flash_data_valid,
		rd_en 	=> flash_data_fifo_rden,
		dout 	=> flash_data,
		full 	=> flash_data_fifo_full,
		empty 	=> flash_data_fifo_empty,
    	wr_rst_busy => open, 
		rd_rst_busy => open
		
	);

flash_data_fifo_rden	<= '1' when (flash_data_fifo_empty = '0' and flash_data_fifo_pfull = '0')  else '0'; -- and flash_data_fifo_pfull = '0') else '0';
flash_data_dv			<= flash_data_fifo_rden;


--ila_spi_loader_fifo: ila_0
--	port map (
--		clk        => CLK,
--		probe0(0)  => flash_data_dv,
--		probe1     => flash_data,
--		probe2(0)  => flash_data_valid,
--		probe3 	   => flash_in_data,
--		probe4(0)  => flash_data_fifo_empty,
--		probe5(0)  => chk_has_data_err,
--		probe6     => in_byte_cnt,
--		probe7 	   => flash_in_cmd,
--		probe8 	   => S_AXI_TDATA,
--		probe9(0)  => S_AXI_TVALID ,
--		probe10(0) => flash_data_fifo_pfull
--	);
-------------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>> instantiate component spi_loader_top <<<<<<<<<<<<<<<<<<<<--
-------------------------------------------------------------------------------
-- we use one clock for write and read because data already translate to clock CLK_FLASH in spi_loader_fifo
spi_loader_top_inst : spi_loader_top
	port map (
		CLK_INT				=> CLK_FLASH, 
    	CLK_I				=> CLK_FLASH,
        SRST_I				=> RST,
    
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

		SPI_CS_O  			=> open,
		SPI_MOSI_O  		=> open
    ); 

FLASH_CMD_BUSY  <= flash_cmd_fifo_full;
FLASH_DATA_BUSY <= flash_data_fifo_pfull;


end madc_cmd_arch;
