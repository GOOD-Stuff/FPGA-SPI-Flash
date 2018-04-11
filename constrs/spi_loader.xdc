#############################################################################################
## FLASH                                                                                   ##
#############################################################################################
set_property PACKAGE_PIN B24 [get_ports OPAD_DQ0]
set_property PACKAGE_PIN A25 [get_ports IPAD_DQ1]
set_property PACKAGE_PIN C23 [get_ports OPAD_CS]

#############################################################################################
## FLASH                                                                                   ##
#############################################################################################
set_property IOSTANDARD LVCMOS18 [get_ports OPAD_DQ0]
set_property IOSTANDARD LVCMOS18 [get_ports IPAD_DQ1]
set_property IOSTANDARD LVCMOS18 [get_ports OPAD_CS]

set_property CONFIG_MODE SPIx1  [current_design]

#set_property BITSTREAM.GENERAL.COMPRESS TRUE  [current_design]
#set_property BITSTREAM.CONFIG.CONFIGRATE 33     [current_design]
set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR NO [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 1    [current_design] 
set_property CONFIG_MODE SPIx1                  [current_design]
