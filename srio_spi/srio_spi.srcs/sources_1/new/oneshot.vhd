Library UNISIM;
library ieee;
use UNISIM.vcomponents.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity oneshot is
  port (
    trigger: in  std_logic;
    clk : in std_logic;
    pulse: out std_logic
  );
end oneshot;

architecture behavioral of oneshot is
    signal QA: std_logic := '0';
    signal QB: std_logic := '0';

begin   -- one shot
  process (trigger,QB)
     begin
       if QB='1' then
         QA <= '0';
       elsif (trigger'event and trigger='1') then
         QA <= '1';
       end if;
   end process;
   
   process (clk)
     begin
       if clk'event and clk ='1' then
        QB <= QA;
       end if;
   end process;

  pulse  <= QB;

end behavioral;
