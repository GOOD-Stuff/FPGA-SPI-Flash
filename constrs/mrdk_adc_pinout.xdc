set_property BITSTREAM.CONFIG.USR_ACCESS 17000200 [current_design]

#############################################################################################
## CLK_FPGA                                                                                ##
#############################################################################################
set_property PACKAGE_PIN Y18 [get_ports CLK_300_N]
set_property PACKAGE_PIN Y17 [get_ports CLK_300_P]

set_property PACKAGE_PIN V24 [get_ports REFCLK_300_N]
set_property PACKAGE_PIN U24 [get_ports REFCLK_300_P]

set_property PACKAGE_PIN AB20 [get_ports FPGA_CLK_N]
set_property PACKAGE_PIN AB19 [get_ports FPGA_CLK_P]

#############################################################################################
## Backplane interface                                                                     ##
#############################################################################################
set_property PACKAGE_PIN AD24 [get_ports BKPLN_SYSEN_N]
set_property PACKAGE_PIN AE22 [get_ports BKPLN_WAKE_IN_N]
set_property PACKAGE_PIN AE25 [get_ports BKPLN_RST_N]
set_property PACKAGE_PIN AD26 [get_ports BKPLN_SATA_SL]
set_property PACKAGE_PIN AB21 [get_ports BKPLN_SATA_SCL]
set_property PACKAGE_PIN AD25 [get_ports BKPLN_SATA_SDO]
set_property PACKAGE_PIN AC21 [get_ports BKPLN_SATA_SDI]

#############################################################################################
## address                                                                                 ##
#############################################################################################
set_property PACKAGE_PIN AC16 [get_ports {RS[0]}]
set_property PACKAGE_PIN AD16 [get_ports {RS[1]}]

set_property PACKAGE_PIN D26 [get_ports {GA[0]}]
set_property PACKAGE_PIN C26 [get_ports {GA[1]}]
set_property PACKAGE_PIN B26 [get_ports {GA[2]}]

#############################################################################################
## SYSMON                                                                                  ##
#############################################################################################
set_property PACKAGE_PIN AE23 [get_ports SYSMON_A_SDA]
set_property PACKAGE_PIN AD23 [get_ports SYSMON_A_SCL]

############################################################################################# 
## external IIC extender                                                                   ## 
############################################################################################# 
set_property PACKAGE_PIN AF24 [get_ports {IIC_EXTEND[0]}] 
set_property PACKAGE_PIN AF20 [get_ports {IIC_EXTEND[1]}]

#############################################################################################
## LEDs                                                                                    ##
#############################################################################################
set_property PACKAGE_PIN AF25 [get_ports {LED[0]}]
set_property PACKAGE_PIN AE26 [get_ports {LED[1]}]



