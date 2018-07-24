
library IEEE;
	use IEEE.std_logic_1164.all;

package mdsp_a_cmd_pkg is

component mdsp_a_cmd
	port (
        -- clock & reset
		RST                 : in   	std_logic;
		CLK                 : in   	std_logic;
		CLK_BKPLN           : in   	std_logic;		
		CLK_BB              : in   	std_logic;
		CLK_HOST            : in   	std_logic;
		CLK_FLASH			: in    std_logic; -- 100 MHz
		
		-- address settings
		RS					: in	std_logic_vector( 1 downto 0);
		
		-- input interface (CLK clock domain)
		S_AXI_TVALID        : in   std_logic;
		S_AXI_TLAST         : in   std_logic;		
		S_AXI_TDATA         : in   std_logic_vector( 7 downto 0);
		
		-- output interface
		M_AXI_TVALID 		: out  std_logic;
		M_AXI_TLAST 		: out  std_logic;
		M_AXI_TDATA 		: out  std_logic_vector( 7 downto 0);

		-- sync (CLK_BKPLN clock domain)
		SYNC_CLK_BKPLN 		: out	std_logic;
		
		-- sync (CLK_BB clock domain)
		SYNC_CLK_BB 		: out	std_logic;
		
		----------- tuning NB -----------
		-- (CLK_HOST clock domain)
		NB_DVO  			: out	std_logic;
		NB_NUM				: out	std_logic_vector( 7 downto 0);
		NB_SRC_IP			: out	std_logic_vector(31 downto 0);						
		NB_SRC_PORT			: out	std_logic_vector(15 downto 0);	
		NB_DST_MAC			: out	std_logic_vector(47 downto 0);				
		NB_DST_IP			: out	std_logic_vector(31 downto 0);
		NB_DST_PORT			: out	std_logic_vector(15 downto 0)
		
	);
end component;

end package;

library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.std_logic_UNSIGNED.all;
	
--library UNISIM;
--	use UNISIM.VCOMPONENTS.all;

entity mdsp_a_cmd is
	port (
        -- clock & reset
		RST                 : in   	std_logic;
		CLK                 : in   	std_logic;
		CLK_BKPLN           : in   	std_logic;		
		CLK_BB              : in   	std_logic;
		CLK_HOST            : in   	std_logic;
		CLK_FLASH			: in    std_logic;

		-- address settings
		RS					: in	std_logic_vector( 1 downto 0);
		
		-- input interface (CLK clock domain)
		S_AXI_TVALID        : in   std_logic;
		S_AXI_TLAST         : in   std_logic;		
		S_AXI_TDATA         : in   std_logic_vector( 7 downto 0);
		-- output interface
		M_AXI_TVALID 		: out  std_logic;
		M_AXI_TLAST 		: out  std_logic;
		M_AXI_TDATA 		: out  std_logic_vector( 7 downto 0);

		-- sync (CLK_BKPLN clock domain)
		SYNC_CLK_BKPLN 		: out	std_logic;
		
		-- sync (CLK_BB clock domain)
		SYNC_CLK_BB 		: out	std_logic;		
		
		----------- tuning NB -----------
		-- (CLK_HOST clock domain)
		NB_DVO  			: out	std_logic;
		NB_NUM				: out	std_logic_vector( 7 downto 0);
		NB_SRC_IP			: out	std_logic_vector(31 downto 0);						
		NB_SRC_PORT			: out	std_logic_vector(15 downto 0);	
		NB_DST_MAC			: out	std_logic_vector(47 downto 0);				
		NB_DST_IP			: out	std_logic_vector(31 downto 0);
		NB_DST_PORT			: out	std_logic_vector(15 downto 0)
				
	);
end mdsp_a_cmd;

architecture mdsp_a_cmd_arch of mdsp_a_cmd is

constant RESOURCE_SVC		        : std_logic_vector( 7 downto 0) := x"00";
constant RESOURCE_NB		        : std_logic_vector( 7 downto 0) := x"04";
constant RESOURCE_SVC_FLASH_LOADER	: std_logic_vector( 7 downto 0) := x"80";
constant RESOURCE_CHECK_FLASH 		: std_logic_vector( 7 downto 0) := x"81";
constant FILLER_29BIT				: std_logic_vector(28 downto 0) := (others => '0');
constant FILLER_64BIT 				: std_logic_vector(63 downto 0) := (others => '0');

signal address			: std_logic_vector( 7 downto 0);
signal addr_en			: std_logic;
signal resource			: std_logic_vector( 7 downto 0);
signal in_byte_cnt		: std_logic_vector( 9 downto 0) := (others => '0');

signal rst_n			: std_logic;

signal flash_cmd_valid		: std_logic;
signal flash_data_valid		: std_logic;
signal flash_in_data		: std_logic_vector( 7 downto 0) := (others => '0');
signal flash_in_cmd     	: std_logic_vector( 2 downto 0) := (others => '0');
signal flash_in_start_addr	: std_logic_vector(31 downto 0) := (others => '0');
signal flash_in_page_cnt	: std_logic_vector(15 downto 0) := (others => '0');
signal flash_in_sector_cnt	: std_logic_vector( 7 downto 0) := (others => '0');
signal check_flash_cnt 		: std_logic_vector(31 downto 0) := (others => '0');
signal dma_axi_tvalid 		: std_logic := '0';
signal dma_axi_tlast		: std_logic := '0';
signal dma_axi_tdata 		: std_logic_vector( 7 downto 0) := (others => '0');
signal d_s_axi_tvalid 	    : std_logic := '1'; -- TODO: del
signal dma_valid_snd    	: std_logic := '0';
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
    	s_axis_tdata 	: in 	std_logic_vector(151 downto 0);
    	m_axis_aclk 	: in 	std_logic;
    	m_axis_tvalid 	: out 	std_logic;
    	m_axis_tready 	: in 	std_logic;
   	 	m_axis_tdata 	: out 	std_logic_vector(151 downto 0)
  	);
end component;

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


---------------------------------------------------------------------------
-->>>>>>>>>>>>>> declaration component spi_loader_fifo <<<<<<<<<<<<<<<<<<--
---------------------------------------------------------------------------
component dbg_spi_top
port (
	clk : in std_logic;

	probe0 : in std_logic_vector(0 downto 0);
	probe1 : in std_logic_vector(0 downto 0);
	probe2 : in std_logic_vector(0 downto 0);
	probe3 : in std_logic_vector(0 downto 0);
	probe4 : in std_logic_vector(0 downto 0);
	probe5 : in std_logic_vector(2 downto 0);
	probe6 : in std_logic_vector(7 downto 0);
	probe7 : in std_logic_vector(15 downto 0);
	probe8 : in std_logic_vector(58 downto 0);
	probe9 : in std_logic_vector(0 downto 0);
	probe10 : in std_logic_vector(7 downto 0);
	probe11 : in std_logic_vector(7 downto 0);
	probe12 : in std_logic_vector(0 downto 0);
	probe13 : in std_logic_vector(7 downto 0);
	probe14 : in std_logic_vector(0 downto 0);
	probe15 : in std_logic_vector(0 downto 0);
	probe16 : in std_logic_vector(7 downto 0);
	probe17 : in std_logic_vector(0 downto 0);
	probe18 : in std_logic_vector(0 downto 0)
);
end component;

-- svc FLASH
signal s_axis_tvalid_flash    : std_logic;
signal s_axis_tdata_flash	  : std_logic_vector(58 downto 0);
signal m_axis_tvalid_flash 	  : std_logic;
signal s_axis_tready_flash 	  : std_logic;
signal m_axis_tdata_flash	  : std_logic_vector(58 downto 0);
signal m_axis_tdata_flash_big : std_logic_vector(151 downto 0) := (others => '0');
signal s_axis_tdata_flash_big : std_logic_vector(151 downto 0) := (others => '0');

-- SYNC
signal svc_valid			: std_logic;
signal svc_sync_in			: std_logic;

begin

rst_n	<= not RST;
address	<= "000" & RS(0) & "0000";

---------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>>>>>>>>> CHECK address <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<--
---------------------------------------------------------------------------
process (RST, CLK) begin
	if (CLK'event and CLK = '1') then
		if (RST = '1') then
			in_byte_cnt		<= (others => '0');
			resource		<= (others => '0');
			addr_en			<= '0';
						
		else
			
			if (S_AXI_TVALID = '1') then
				if (S_AXI_TLAST = '1') then
					in_byte_cnt	<= (others => '0');
				else
					if (in_byte_cnt < x"20C") then
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
				
				-- DATA_TO_PROG (256 áàéò)	
				if (in_byte_cnt > 11 and in_byte_cnt < 524 and flash_in_cmd = "011") then
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
-- XXX: deprecated; CLK == CLK_FLASHs
madc_cmd_clk_conv_flash_inst : madc_cmd_clk_conv
	port map (
    	s_axis_aresetn 	=> rst_n,
    	m_axis_aresetn 	=> rst_n,
    	s_axis_aclk 	=> CLK,
    	s_axis_tvalid 	=> s_axis_tvalid_flash,
    	s_axis_tready 	=> s_axis_tready_flash,
    	s_axis_tdata 	=> s_axis_tdata_flash_big,
    	m_axis_aclk 	=> CLK_FLASH,
    	m_axis_tvalid 	=> m_axis_tvalid_flash,
    	m_axis_tready 	=> '1',
   	 	m_axis_tdata 	=> m_axis_tdata_flash_big
  	);

m_axis_tdata_flash <= s_axis_tdata_flash;

process (CLK_FLASH) begin
	if (CLK_FLASH'event and CLK_FLASH = '1') then
		if (m_axis_tvalid_flash = '1') then -- XXX: was m_axis_tvalid_flash
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


dbg_spi_top_inst: dbg_spi_top
	port map (
		clk 	  => CLK_FLASH,

		probe0(0)  => flash_data_fifo_pfull,
		probe1(0)  => flash_cmd_fifo_full,
		probe2(0)  => flash_data_dv,
		probe3(0)  => flash_data_fifo_empty,

		probe4(0)  => S_AXI_TLAST,
		probe5     => flash_cmd,
		probe6     => flash_data,	
	    probe7 	   => flash_page_cnt,	

		probe8     => m_axis_tdata_flash,
		probe9(0)  => S_AXI_TVALID,
		probe10    => S_AXI_TDATA,
		probe11    => flash_in_data,
		probe12(0) => flash_data_valid,

		probe13    => dma_axi_tdata,
		probe14(0) => dma_axi_tvalid,
		probe15(0) => dma_axi_tlast,
		probe16    => resource,
		probe17(0) => addr_en,
		probe18(0) => dma_valid_snd		
	);


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


---------------------------------------------------------------------------
-->>>>>>>>>>>>>>>>>>>>>>>> RESOURCE_CHECK_FLASH <<<<<<<<<<<<<<<<<<<<<<<<<--
---------------------------------------------------------------------------
process (RST, CLK) begin
	if (CLK'event and CLK = '1') then
		if (RST = '1') then
			d_s_axi_tvalid <= '0';
		else
			d_s_axi_tvalid <= S_AXI_TVALID;
		end if;
	end if;
end process;

process (RST, CLK) begin
	if (CLK'event and CLK = '1') then
		if (RST = '1') then			
			dma_axi_tdata  <= x"FF";	
		elsif (addr_en = '1' and resource = RESOURCE_CHECK_FLASH) then									
			dma_axi_tdata   <= "0" & address(4 downto 0) & flash_cmd_fifo_full & flash_data_fifo_pfull;
		else				
			dma_axi_tdata   <= x"FF";--"010000" & flash_cmd_fifo_full & flash_data_fifo_pfull;		
		end if;
	end if;
end process;

dma_valid_snd <= d_s_axi_tvalid and S_AXI_TLAST and (not S_AXI_TVALID);

process (RST, CLK) begin
	if (CLK'event and CLK = '1') then
		if (RST = '1') then
			dma_axi_tvalid <= '0';
			dma_axi_tlast  <= '0';	
		else 
			if (dma_valid_snd = '1' and addr_en = '1' and resource = RESOURCE_CHECK_FLASH) then					
				dma_axi_tvalid <= '1';
				dma_axi_tlast  <= '1';
			else
				dma_axi_tvalid <= '0';
				dma_axi_tlast  <= '0';
			end if;
		end if;
	end if; 
end process;

M_AXI_TVALID <= dma_axi_tvalid;
M_AXI_TLAST  <= dma_axi_tlast;
M_AXI_TDATA  <= dma_axi_tdata;

end mdsp_a_cmd_arch;
