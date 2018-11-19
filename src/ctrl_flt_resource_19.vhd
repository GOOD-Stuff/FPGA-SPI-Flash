
library IEEE;
	use IEEE.std_logic_1164.all;

package ctrl_flt_resource_19_pkg is

component ctrl_flt_resource_19 is
    port (
        -- clock & reset
        RST                     : in  std_logic;
        ENABLE					        : in  std_logic;
        CLK                     : in  std_logic;
        
        --- control resource №19 (CLK clock domain) ---
        ready_ctrl_src_wr_19    : out std_logic;
        ctrl_src_wr_val_19      : in  std_logic;
        ctrl_src_wr_19          : in  std_logic_vector(31 downto 0);

        -- output parameter resource №19 (CLK clock domain)
	     	FLASH_DATA_DVO			    : out	std_logic;
        FLASH_DATA			        : out	std_logic_vector(31 downto 0);

        FLASH_CMD_DVO		        : out	std_logic;
		    FLASH_CMD               : out	std_logic_vector( 2 downto 0);	
        FLASH_CMD_START_ADDR	  : out	std_logic_vector(31 downto 0);
        FLASH_CMD_PAGE_CNT		  : out	std_logic_vector(15 downto 0);
        FLASH_CMD_SECTOR_CNT	  : out	std_logic_vector( 7 downto 0)

     );
end component;

end package;

library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.std_logic_UNSIGNED.all;
	
library UNISIM;
	use UNISIM.VCOMPONENTS.all;

entity ctrl_flt_resource_19 is
    port (
    	-- clock & reset
    	  RST                     : in  std_logic;
        ENABLE					        : in	std_logic;
        CLK                     : in  std_logic;
    
        --- control resource №19 (CLK clock domain) ---
    	  ready_ctrl_src_wr_19    : out std_logic;
    	  ctrl_src_wr_val_19      : in  std_logic;
    	  ctrl_src_wr_19          : in  std_logic_vector(31 downto 0);

    	-- output parameter resource №19 (CLK clock domain)
		    FLASH_DATA_DVO			    : out	std_logic;
		    FLASH_DATA				      : out	std_logic_vector(31 downto 0);
    
		    FLASH_CMD_DVO			      : out	std_logic;
		    FLASH_CMD            	  : out	std_logic_vector( 2 downto 0);			
		    FLASH_CMD_START_ADDR	  : out	std_logic_vector(31 downto 0);
		    FLASH_CMD_PAGE_CNT		  : out	std_logic_vector(15 downto 0);
		    FLASH_CMD_SECTOR_CNT	  : out	std_logic_vector( 7 downto 0)
	
    );
end ctrl_flt_resource_19;

architecture ctrl_flt_resource_19_arch of ctrl_flt_resource_19 is

signal c_ctrl_src_wr_19         : std_logic_vector( 7 downto 0);
signal cmd_wr_flag              : std_logic;
signal flash_address            : std_logic_vector( 23 downto 0);
begin

ready_ctrl_src_wr_19	<= '1'; -- not fifo_almost_full;

--//////////////////////////// source 19 //////////////////////////////////////////////
process (CLK, RST) begin
  	if RST = '1' then
  		c_ctrl_src_wr_19 <= b"0000_0000";
  	elsif rising_edge(CLK) then
     	if ENABLE = '1' and ctrl_src_wr_val_19 = '1' then	-- work enable check --
        	if c_ctrl_src_wr_19 = b"1111_1110" then
        		c_ctrl_src_wr_19 <= b"0000_0000";
        	else
        		c_ctrl_src_wr_19 <= c_ctrl_src_wr_19 + '1';
        	end if;
     	end if;
  	end if;
end process;

process (CLK, RST) begin
  	if RST = '1' then
		  FLASH_DATA_DVO			  <= '0';
      FLASH_DATA				    <= (others => '0');
  	
		  FLASH_CMD_DVO			    <= '0';
		  FLASH_CMD            	<= (others => '0');
  		flash_address         <= (others => '0');
  		FLASH_CMD_START_ADDR	<= (others => '0');
  		FLASH_CMD_PAGE_CNT		<= (others => '0');
  		FLASH_CMD_SECTOR_CNT	<= (others => '0');
  		
  		cmd_wr_flag           <= '0';
		
	elsif rising_edge(CLK) then
     	if ENABLE = '1' and ctrl_src_wr_val_19 = '1' then	-- work enable check --
			
			-- CMD
       		case c_ctrl_src_wr_19 is 
        		when b"0000_0001" => -- номер пакета
					FLASH_CMD_DVO			<= '0';
					FLASH_CMD            	<= ctrl_src_wr_19( 2 downto  0);
  					flash_address        	<= ctrl_src_wr_19(31 downto  8);
  					
  					if (ctrl_src_wr_19( 2 downto  0) = "011") then
  					     cmd_wr_flag <= '1';
  					else
  					     cmd_wr_flag <= '0';
  					end if;
  					       		
          		when b"0000_0010" =>        		
				       	FLASH_CMD_DVO			    <= '1';
				       	FLASH_CMD_START_ADDR  <= ctrl_src_wr_19(7 downto 0) & flash_address;
  					    FLASH_CMD_PAGE_CNT		<= ctrl_src_wr_19(23 downto 8);
  					    FLASH_CMD_SECTOR_CNT	<= ctrl_src_wr_19(31 downto 24);					
        			
          		when others => 
					      FLASH_CMD_DVO			    <= '0';         			
          		
        	end case;
        	
        	-- DATA -- b"0100_0100"
        	if (c_ctrl_src_wr_19 > b"0000_0010" and c_ctrl_src_wr_19 < b"0100_0011" and cmd_wr_flag = '1') then
        		FLASH_DATA_DVO	<= '1';
        		FLASH_DATA		  <= ctrl_src_wr_19;
        	else
        		FLASH_DATA_DVO	<= '0';	        	
        	end if;
        	
		else
			FLASH_CMD_DVO	  <= '0';
			FLASH_DATA_DVO	<= '0';	
    end if;
  	end if;
end process;

end ctrl_flt_resource_19_arch;

