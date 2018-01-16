#-----------------------------------------------------------------------------
#
# File name:    srio_gen2_0.xdc
# Rev:          4.0
# Description:  This module constrains the example design
#
#-----------------------------------------------------------------------------
######################################
#         Core Time Specs            #
######################################

create_clock -period 6.4 -name sys_clkp [get_ports SYSCLK_P]

################################################################################
######################################################
##       GT and other Pin Locations                  #
## NOTE: These pins need to be updated for device:   #
## "xc7k160tffg676-2"#
## Below LOC's are given as dummy LOC's and          #
## need to be updated by the user                    #
######################################################
set_property IOSTANDARD LVDS [get_ports SYSCLK_P]
set_property PACKAGE_PIN H6 [get_ports SYSCLK_P]
set_property PACKAGE_PIN H5 [get_ports SYSCLK_N]
set_property IOSTANDARD LVDS [get_ports SYSCLK_N]

set_property CFGBVS GND [current_design]
set_property CONFIG_VOLTAGE 1.8 [current_design]

## SPI
set_property LOC B24 [get_ports DQ0]
set_property LOC A25 [get_ports DQ1]
set_property LOC C23 [get_ports CS]

set_property IOSTANDARD LVCMOS25 [get_ports DQ0]
set_property IOSTANDARD LVCMOS25 [get_ports DQ1]
set_property IOSTANDARD LVCMOS25 [get_ports CS]

set_property CONFIG_MODE SPIx1 [current_design]
