
# формат (идентификатор разработчика)_(номер версии)_(номер ревизии)_(номер теста)
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

#############################################################################################
## ADC                                                                                     ##
#############################################################################################
set_property PACKAGE_PIN AB26 [get_ports ADC_PDWN]
set_property PACKAGE_PIN AC26 [get_ports ADC_SYNC]

set_property PACKAGE_PIN V26 [get_ports ADC_SCLK]
set_property PACKAGE_PIN Y26 [get_ports ADC_CSB]
set_property PACKAGE_PIN U26 [get_ports ADC_SDIO]


set_property PACKAGE_PIN U22 [get_ports ADC_DCO_N]
set_property PACKAGE_PIN T22 [get_ports ADC_DCO_P]

set_property PACKAGE_PIN T24 [get_ports ADC_FCO_N]
set_property PACKAGE_PIN T23 [get_ports ADC_FCO_P]

set_property PACKAGE_PIN R26 [get_ports ADC_A_D0_N]
set_property PACKAGE_PIN P26 [get_ports ADC_A_D0_P]

set_property PACKAGE_PIN R23 [get_ports ADC_A_D1_N]
set_property PACKAGE_PIN R22 [get_ports ADC_A_D1_P]

set_property PACKAGE_PIN P24 [get_ports ADC_B_D0_N]
set_property PACKAGE_PIN P23 [get_ports ADC_B_D0_P]

set_property PACKAGE_PIN R25 [get_ports ADC_B_D1_N]
set_property PACKAGE_PIN P25 [get_ports ADC_B_D1_P]

set_property PACKAGE_PIN T18 [get_ports ADC_C_D0_N]
set_property PACKAGE_PIN R18 [get_ports ADC_C_D0_P]

set_property PACKAGE_PIN R21 [get_ports ADC_C_D1_N]
set_property PACKAGE_PIN P21 [get_ports ADC_C_D1_P]

set_property PACKAGE_PIN P19 [get_ports ADC_D_D0_N]
set_property PACKAGE_PIN P18 [get_ports ADC_D_D0_P]

set_property PACKAGE_PIN T20 [get_ports ADC_D_D1_N]
set_property PACKAGE_PIN T19 [get_ports ADC_D_D1_P]

#############################################################################################
## GTH ref clock                                                                           ##
#############################################################################################
set_property PACKAGE_PIN T5 [get_ports GTREFCLK_N]
set_property PACKAGE_PIN T6 [get_ports GTREFCLK_P]



