
#############################################################################################
## CLK_FPGA                                                                                ##
#############################################################################################
set_property IOSTANDARD LVDS_25 [get_ports CLK_300_P]
set_property IOSTANDARD LVDS_25 [get_ports CLK_300_N]

set_property IOSTANDARD LVDS [get_ports REFCLK_300_P]
set_property IOSTANDARD LVDS [get_ports REFCLK_300_N]

set_property IOSTANDARD LVDS_25 [get_ports FPGA_CLK_P]
set_property IOSTANDARD LVDS_25 [get_ports FPGA_CLK_N]

#############################################################################################
## Backplane interface                                                                     ##
#############################################################################################
set_property IOSTANDARD LVCMOS18 [get_ports BKPLN_SYSEN_N]
set_property IOSTANDARD LVCMOS18 [get_ports BKPLN_WAKE_IN_N]
set_property IOSTANDARD LVCMOS18 [get_ports BKPLN_RST_N]
set_property IOSTANDARD LVCMOS18 [get_ports BKPLN_SATA_SL]
set_property IOSTANDARD LVCMOS18 [get_ports BKPLN_SATA_SCL]
set_property IOSTANDARD LVCMOS18 [get_ports BKPLN_SATA_SDO]
set_property IOSTANDARD LVCMOS18 [get_ports BKPLN_SATA_SDI]

#############################################################################################
## LEDs                                                                                    ##
#############################################################################################
set_property IOSTANDARD LVCMOS18 [get_ports {LED[*]}]
set_property IOB TRUE  [get_ports {LED[*]}]
set_property SLEW FAST [get_ports {LED[*]}]

#############################################################################################
## address                                                                                 ##
#############################################################################################
set_property IOSTANDARD LVCMOS18 [get_ports {RS[*]}]
set_property IOSTANDARD LVCMOS18 [get_ports {GA[*]}]

#############################################################################################
## SYSMON                                                                                  ##
#############################################################################################
set_property IOSTANDARD LVCMOS18 [get_ports SYSMON_A_SDA]
set_property IOSTANDARD LVCMOS18 [get_ports SYSMON_A_SCL]

############################################################################################# 
## external IIC extender  																   ## 
############################################################################################# 
set_property IOSTANDARD LVCMOS18 [get_ports {IIC_EXTEND[*]}]


#set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]

set_property BITSTREAM.CONFIG.CONFIGRATE 57 [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 1 [current_design]
set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR YES [current_design]
#set_property BITSTREAM.CONFIG.USR_ACCESS TIMESTAMP [current_design]


