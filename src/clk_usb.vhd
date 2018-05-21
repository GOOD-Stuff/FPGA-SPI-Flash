----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:20:17 02/15/2013 
-- Design Name: 
-- Module Name:    clk_ext - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.std_logic_UNSIGNED.all;
library UNISIM;
	use UNISIM.VCOMPONENTS.all;

entity clk_usb is
    port (
         SysRefClk_p_pin           : in std_logic;      -- 100 MHz for IODELAYCTRL from application
         SysRefClk_n_pin           : in std_logic;
			SysRefClk                 : out std_logic;
	      clk_fx3                   : out std_logic;
	      clk_fx3_io                : out std_logic;
			clk200                    : out std_logic;
			clk50                    : out std_logic;
			reset_out                 : out std_logic;
			enable_out                : out std_logic
	 		 );
end clk_usb;

architecture Behavioral of clk_usb is
-- Functions
function TermOrNot (Term : integer) return boolean is
begin
    if (Term = 0) then
        return FALSE;
    else
        return TRUE;
    end if;
end TermOrNot;

constant C_OnChipLvdsTerm    : integer := 1;     -- 0 = No Term, 1 - Termination ON.

signal SysRefClk_in          : std_logic;
signal SysRefClk_in_gbuf     : std_logic;
signal SysRefClk_0           : std_logic;
signal SysRefClk_1           : std_logic;
signal SysRefClk_FB          : std_logic;
signal lock_dcm_SysClk       : std_logic;

signal PCLK_FX3_BUFR         : std_logic;
signal clkout0	              : std_logic;
signal clkout1	              : std_logic;
signal clkout2	              : std_logic;
signal clkout3	              : std_logic;
signal clkfbout              : std_logic;
signal clk_dcm_Usb           : std_logic;
signal lock_dcm_Usb          : std_logic;
signal enable_int            : std_logic;
signal c                     : integer range 0 to 255;

begin

---------------------------------------------------------------------------------------------
-- SysRefClk
---------------------------------------------------------------------------------------------

IBUFDS_SysRefClk : IBUFDS
    generic map (DIFF_TERM  => TermOrNot(C_OnChipLvdsTerm), IOSTANDARD  => "LVDS")
    port map (I => SysRefClk_p_pin, IB =>  SysRefClk_n_pin, O => SysRefClk_in);

BUFG_SysRefClk_in : BUFG 
   port map (I => SysRefClk_in, O => SysRefClk_in_gbuf);

   MMCM_SysRefClk : MMCM_BASE
   generic map (
      BANDWIDTH => "OPTIMIZED",  -- Jitter programming (HIGH,LOW,OPTIMIZED)
      CLKFBOUT_MULT_F => 10.0,    -- Multiply value for all CLKOUT (5.0-64.0).
      CLKFBOUT_PHASE => 0.0,     -- Phase offset in degrees of CLKFB (0.00-360.00).
      CLKIN1_PERIOD => 10.0,      -- Input clock period in nS to ps resolution (i.e. 33.333 is 33 MHz).
      -- CLKOUT0_DIVIDE - CLKOUT6_DIVIDE: Divide amount for each CLKOUT (1-128)
      CLKOUT1_DIVIDE => 10,
      CLKOUT2_DIVIDE => 1,
      CLKOUT3_DIVIDE => 1,
      CLKOUT4_DIVIDE => 1,
      CLKOUT5_DIVIDE => 1,
      CLKOUT6_DIVIDE => 1,
      CLKOUT0_DIVIDE_F => 5.0,   -- Divide amount for CLKOUT0 (1.000-128.000).
      -- CLKOUT0_DUTY_CYCLE - CLKOUT6_DUTY_CYCLE: Duty cycle for each CLKOUT (0.01-0.99).
      CLKOUT0_DUTY_CYCLE => 0.5,
      CLKOUT1_DUTY_CYCLE => 0.5,
      CLKOUT2_DUTY_CYCLE => 0.5,
      CLKOUT3_DUTY_CYCLE => 0.5,
      CLKOUT4_DUTY_CYCLE => 0.5,
      CLKOUT5_DUTY_CYCLE => 0.5,
      CLKOUT6_DUTY_CYCLE => 0.5,
      -- CLKOUT0_PHASE - CLKOUT6_PHASE: Phase offset for each CLKOUT (-360.000-360.000).
      CLKOUT0_PHASE => 0.0,
      CLKOUT1_PHASE => 0.0,
      CLKOUT2_PHASE => 0.0,
      CLKOUT3_PHASE => 0.0,
      CLKOUT4_PHASE => 0.0,
      CLKOUT5_PHASE => 0.0,
      CLKOUT6_PHASE => 0.0,
      CLKOUT4_CASCADE => FALSE,  -- Cascase CLKOUT4 counter with CLKOUT6 (TRUE/FALSE)
      CLOCK_HOLD => FALSE,       -- Hold VCO Frequency (TRUE/FALSE)
      DIVCLK_DIVIDE => 1,        -- Master division value (1-80)
      REF_JITTER1 => 0.0,        -- Reference input jitter in UI (0.000-0.999).
      STARTUP_WAIT => FALSE      -- Not supported. Must be set to FALSE.
   )
   port map (
      -- Clock Outputs: 1-bit (each) User configurable clock outputs
      CLKOUT0 => SysRefClk_0,     -- 1-bit CLKOUT0 output
      CLKOUT0B => open,   -- 1-bit Inverted CLKOUT0 output
      CLKOUT1 => SysRefClk_1, --clk100_0,     -- 1-bit CLKOUT1 output
      CLKOUT1B => open,   -- 1-bit Inverted CLKOUT1 output
      CLKOUT2 => open,     -- 1-bit CLKOUT2 output
      CLKOUT2B => open,   -- 1-bit Inverted CLKOUT2 output
      CLKOUT3 => open,     -- 1-bit CLKOUT3 output
      CLKOUT3B => open,   -- 1-bit Inverted CLKOUT3 output
      CLKOUT4 => open,     -- 1-bit CLKOUT4 output
      CLKOUT5 => open,     -- 1-bit CLKOUT5 output
      CLKOUT6 => open,     -- 1-bit CLKOUT6 output
      -- Feedback Clocks: 1-bit (each) Clock feedback ports
      CLKFBOUT => SysRefClk_FB,   -- 1-bit Feedback clock output
      CLKFBOUTB => open, -- 1-bit Inverted CLKFBOUT output
      -- Status Port: 1-bit (each) MMCM status ports
      LOCKED => lock_dcm_SysClk,       -- 1-bit LOCK output
      -- Clock Input: 1-bit (each) Clock input
      CLKIN1 => SysRefClk_in_gbuf,
      -- Control Ports: 1-bit (each) MMCM control ports
      PWRDWN => '0',       -- 1-bit Power-down input
      RST => '0', --DacRst,             -- 1-bit Reset input
      -- Feedback Clocks: 1-bit (each) Clock feedback ports
      CLKFBIN => SysRefClk_FB      -- 1-bit Feedback clock input
   );
	
BUFG_SysRefClk : BUFG 
   port map (I => SysRefClk_0, O => SysRefClk);

---------------------------------------------------------------------------------------------
-- UsbClk
---------------------------------------------------------------------------------------------

   MMCM_BASE_inst : MMCM_BASE
   generic map (
      BANDWIDTH => "OPTIMIZED",  -- Jitter programming (HIGH,LOW,OPTIMIZED)
      CLKFBOUT_MULT_F => 10.0,    -- Multiply value for all CLKOUT (5.0-64.0).
      CLKFBOUT_PHASE => 0.0,     -- Phase offset in degrees of CLKFB (0.00-360.00).
      CLKIN1_PERIOD => 10.0,      -- Input clock period in nS to ps resolution (i.e. 33.333 is 33 MHz).
      -- CLKOUT0_DIVIDE - CLKOUT6_DIVIDE: Divide amount for each CLKOUT (1-128)
      CLKOUT1_DIVIDE => 5,
      CLKOUT2_DIVIDE => 10,
      CLKOUT3_DIVIDE => 10, -- 100 MHz
      CLKOUT4_DIVIDE => 1,
      CLKOUT5_DIVIDE => 1,
      CLKOUT6_DIVIDE => 1,
      CLKOUT0_DIVIDE_F => 10.0,   -- Divide amount for CLKOUT0 (1.000-128.000).
      -- CLKOUT0_DUTY_CYCLE - CLKOUT6_DUTY_CYCLE: Duty cycle for each CLKOUT (0.01-0.99).
      CLKOUT0_DUTY_CYCLE => 0.5,
      CLKOUT1_DUTY_CYCLE => 0.5,
      CLKOUT2_DUTY_CYCLE => 0.5,
      CLKOUT3_DUTY_CYCLE => 0.5,
      CLKOUT4_DUTY_CYCLE => 0.5,
      CLKOUT5_DUTY_CYCLE => 0.5,
      CLKOUT6_DUTY_CYCLE => 0.5,
      -- CLKOUT0_PHASE - CLKOUT6_PHASE: Phase offset for each CLKOUT (-360.000-360.000).
      CLKOUT0_PHASE => 0.0,
      CLKOUT1_PHASE => 0.0,
      CLKOUT2_PHASE => 0.0,
      CLKOUT3_PHASE => 0.0,
      CLKOUT4_PHASE => 0.0,
      CLKOUT5_PHASE => 0.0,
      CLKOUT6_PHASE => 0.0,
      CLKOUT4_CASCADE => FALSE,  -- Cascase CLKOUT4 counter with CLKOUT6 (TRUE/FALSE)
      CLOCK_HOLD => FALSE,       -- Hold VCO Frequency (TRUE/FALSE)
      DIVCLK_DIVIDE => 1,        -- Master division value (1-80)
      REF_JITTER1 => 0.0,        -- Reference input jitter in UI (0.000-0.999).
      STARTUP_WAIT => FALSE      -- Not supported. Must be set to FALSE.
   )
   port map (
      -- Clock Outputs: 1-bit (each) User configurable clock outputs
      CLKOUT0 => CLKOUT0,     -- 1-bit CLKOUT0 output
      CLKOUT0B => open,   -- 1-bit Inverted CLKOUT0 output
      CLKOUT1 => CLKOUT1,     -- 1-bit CLKOUT1 output
      CLKOUT1B => open,   -- 1-bit Inverted CLKOUT1 output
      CLKOUT2 => CLKOUT2,     -- 1-bit CLKOUT2 output
      CLKOUT2B => open,   -- 1-bit Inverted CLKOUT2 output
      CLKOUT3 => CLKOUT3,     -- 1-bit CLKOUT3 output
      CLKOUT3B => open,   -- 1-bit Inverted CLKOUT3 output
      CLKOUT4 => open,     -- 1-bit CLKOUT4 output
      CLKOUT5 => open,     -- 1-bit CLKOUT5 output
      CLKOUT6 => open,     -- 1-bit CLKOUT6 output
      -- Feedback Clocks: 1-bit (each) Clock feedback ports
      CLKFBOUT => CLKFBOUT,   -- 1-bit Feedback clock output
      CLKFBOUTB => open, -- 1-bit Inverted CLKFBOUT output
      -- Status Port: 1-bit (each) MMCM status ports
      LOCKED => lock_dcm_Usb,       -- 1-bit LOCK output
      -- Clock Input: 1-bit (each) Clock input
      CLKIN1 => SysRefClk_1,
      -- Control Ports: 1-bit (each) MMCM control ports
      PWRDWN => '0',       -- 1-bit Power-down input
      RST => '0', --DacRst,             -- 1-bit Reset input
      -- Feedback Clocks: 1-bit (each) Clock feedback ports
      CLKFBIN => CLKFBOUT      -- 1-bit Feedback clock input
   );
	
BUFG_OUT0 : BUFG 
   port map (I => CLKOUT0, O => clk_dcm_Usb);
	
BUFG_OUT1 : BUFG 
   port map (I => CLKOUT1, O => clk200);

BUFG_OUT3 : BUFG 
   port map (I => CLKOUT3, O => clk50);

clk_fx3 <= clk_dcm_Usb;

fx3_I_Bufr : BUFR
	generic map (BUFR_DIVIDE => "BYPASS", SIM_DEVICE => "7SERIES")
	port map (I => CLKOUT2, O => PCLK_FX3_BUFR,
				 CE => '1', CLR => '0');

clk_fx3_io <= PCLK_FX3_BUFR;
--clk_fx3_io <= clk_dcm_Usb;

process (clk_dcm_Usb, lock_dcm_Usb, lock_dcm_SysClk)
begin
 if lock_dcm_Usb = '0' and lock_dcm_SysClk = '0' then
    c <= 0;
 elsif (clk_dcm_Usb'event and clk_dcm_Usb = '1') then
    if enable_int = '0' then
       if c = 255 then c <= 0;
       else c <= c + 1;
       end if;
    end if;
 end if;
end process;

process (clk_dcm_Usb, lock_dcm_Usb, lock_dcm_SysClk)
begin
 if lock_dcm_Usb = '0' and lock_dcm_SysClk = '0' then
    reset_out <= '0';
 elsif (clk_dcm_Usb'event and clk_dcm_Usb = '1') then
    if c = 1  then reset_out <= '1';
    elsif c = 127 then reset_out <= '0';
    end if;
 end if;
end process;

process (clk_dcm_Usb, lock_dcm_Usb, lock_dcm_SysClk)
begin
 if lock_dcm_Usb = '0' and lock_dcm_SysClk = '0' then
    enable_int <= '0';
 elsif (clk_dcm_Usb'event and clk_dcm_Usb = '1') then
    if c = 255  then enable_int <= '1';
    end if;
 end if;
end process;

enable_out <= enable_int;

end Behavioral;

