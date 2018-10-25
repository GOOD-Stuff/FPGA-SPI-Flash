

#############################################################################################
## CLK_FPGA                                                                                ##
#############################################################################################
set_property PACKAGE_PIN AB9 [get_ports IPAD_CLK_FPGA_N]
set_property PACKAGE_PIN AA9 [get_ports IPAD_CLK_FPGA_P]

#############################################################################################
##  100 MHz for IODELAYCTRL from application                                               ##
#############################################################################################
set_property PACKAGE_PIN U5 [get_ports IPAD_SYSREFCLK_N]
set_property PACKAGE_PIN U6 [get_ports IPAD_SYSREFCLK_P]

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk_usb_inst/SysRefClk_in]


#############################################################################################
## FLASH                                                                                   ##
#############################################################################################
set_property PACKAGE_PIN B24 [get_ports OPAD_DQ0]
set_property PACKAGE_PIN A25 [get_ports IPAD_DQ1]
set_property PACKAGE_PIN C23 [get_ports OPAD_CS]
