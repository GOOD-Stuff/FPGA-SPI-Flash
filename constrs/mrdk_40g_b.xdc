set_property BITSTREAM.CONFIG.CONFIGRATE 56.7 [current_design]
set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR YES [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]

################################################################################
###  clocks (package pins)
################################################################################

set_property PACKAGE_PIN AG9 [get_ports SYSCLK_100_P]
set_property PACKAGE_PIN AG8 [get_ports SYSCLK_100_N]

set_property IOSTANDARD LVDS [get_ports SYSCLK_100_N]
set_property IOSTANDARD LVDS [get_ports SYSCLK_100_P]

set_property PACKAGE_PIN AC9 [get_ports SYSCLK2_100_P]
set_property PACKAGE_PIN AC8 [get_ports SYSCLK2_100_N]

set_property IOSTANDARD LVDS [get_ports SYSCLK2_100_N]
set_property IOSTANDARD LVDS [get_ports SYSCLK2_100_P]

create_clock -period 10.000 [get_nets dclk]

## 229
set_property PACKAGE_PIN G7 [get_ports GT_REFCLK_N]
set_property PACKAGE_PIN G8 [get_ports GT_REFCLK_P]

## 230
#set_property PACKAGE_PIN  F9 [get_ports GT_REFCLK_N]
#set_property PACKAGE_PIN F10 [get_ports GT_REFCLK_P]

# 129
set_property PACKAGE_PIN L24 [get_ports REFCLK_129_N]
set_property PACKAGE_PIN L23 [get_ports REFCLK_129_P]

create_clock -period 6.400 [get_ports GT_REFCLK_P]
create_clock -period 6.400 [get_ports REFCLK_129_P]

################################################################################
###  C <-> Z Interface
################################################################################
set_property PACKAGE_PIN AC7 [get_ports C2Z_CLK]
set_property PACKAGE_PIN AD2 [get_ports C2Z_DV]
set_property PACKAGE_PIN AA2 [get_ports {C2Z_DATA[0]}]
set_property PACKAGE_PIN Y2 [get_ports {C2Z_DATA[1]}]
set_property PACKAGE_PIN AC3 [get_ports {C2Z_DATA[2]}]
set_property PACKAGE_PIN AE2 [get_ports {C2Z_DATA[3]}]
set_property PACKAGE_PIN AC2 [get_ports {C2Z_DATA[4]}]

set_property PACKAGE_PIN AD6 [get_ports Z2C_CLK]
set_property PACKAGE_PIN Y1 [get_ports Z2C_DV]
set_property PACKAGE_PIN AC1 [get_ports {Z2C_DATA[0]}]
set_property PACKAGE_PIN AB1 [get_ports {Z2C_DATA[1]}]
set_property PACKAGE_PIN AA1 [get_ports {Z2C_DATA[2]}]
set_property PACKAGE_PIN AE1 [get_ports {Z2C_DATA[3]}]
set_property PACKAGE_PIN AD1 [get_ports {Z2C_DATA[4]}]

set_property IOSTANDARD LVCMOS18 [get_ports C2Z_CLK]
set_property IOSTANDARD LVCMOS18 [get_ports C2Z_DV]
set_property IOSTANDARD LVCMOS18 [get_ports {C2Z_DATA[*]}]

set_property IOSTANDARD LVCMOS18 [get_ports Z2C_CLK]
set_property IOSTANDARD LVCMOS18 [get_ports Z2C_DV]
set_property IOSTANDARD LVCMOS18 [get_ports {Z2C_DATA[*]}]

################################################################################
###  SYSMON I2C DRP Interface
################################################################################
set_property PACKAGE_PIN AG11 [get_ports {RS[0]}]
set_property PACKAGE_PIN AF13 [get_ports {RS[1]}]

set_property IOSTANDARD LVCMOS18 [get_ports {RS[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {RS[1]}]

################################################################################
###  SYSMON I2C DRP Interface
################################################################################
set_property PACKAGE_PIN AF1 [get_ports I2CSDA]
set_property PACKAGE_PIN AF3 [get_ports I2CSCLK]

set_property IOSTANDARD LVCMOS18 [get_ports I2CSDA]
set_property IOSTANDARD LVCMOS18 [get_ports I2CSCLK]

################################################################################
### status LEDs
################################################################################
set_property PACKAGE_PIN U1 [get_ports LED0]
set_property PACKAGE_PIN T1 [get_ports LED1]

set_property IOSTANDARD LVCMOS18 [get_ports LED0]
set_property IOSTANDARD LVCMOS18 [get_ports LED1]

### Any other Constraints
set_false_path -from [get_clocks dclk] -to [get_clocks -of_objects [get_pins clkgen_bb_inst/inst/mmcme4_adv_inst/CLKOUT0]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets c2bkpln_clk_out]
