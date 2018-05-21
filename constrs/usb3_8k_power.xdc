#############################################################################################
## CLK_FPGA                                                                                ##
#############################################################################################
set_property IOSTANDARD LVDS [get_ports IPAD_CLK_FPGA_P]
set_property IOSTANDARD LVDS [get_ports IPAD_CLK_FPGA_N]

#############################################################################################
##  100 MHz for IODELAYCTRL from application                                               ##
#############################################################################################
set_property IOSTANDARD LVDS [get_ports IPAD_SYSREFCLK_P]
set_property IOSTANDARD LVDS [get_ports IPAD_SYSREFCLK_N]

#############################################################################################
## NUMBER DEVICE                                                                           ##
#############################################################################################
set_property IOSTANDARD LVCMOS18 [get_ports {IPAD_NUMBER_DEVICE[*]}]

#############################################################################################
## FLASH                                                                                   ##
#############################################################################################
set_property IOSTANDARD LVCMOS18 [get_ports OPAD_DQ0]
set_property IOSTANDARD LVCMOS18 [get_ports IPAD_DQ1]
set_property IOSTANDARD LVCMOS18 [get_ports OPAD_CS]

set_property CONFIG_MODE SPIx1  [current_design]

#############################################################################################
## USB 3.0                                                                                 ##
#############################################################################################
set_property IOSTANDARD LVCMOS18 [get_ports {IOPAD_DATA[*]}]
set_property IOSTANDARD LVCMOS18 [get_ports OPAD_PCLK_FX3]

set_property IOSTANDARD LVCMOS18 [get_ports OPAD_SLCS]
set_property IOSTANDARD LVCMOS18 [get_ports OPAD_SLWR]
set_property IOSTANDARD LVCMOS18 [get_ports OPAD_SLOE]
set_property IOSTANDARD LVCMOS18 [get_ports OPAD_SLRD]
set_property IOSTANDARD LVCMOS18 [get_ports IPAD_FLAGA]
set_property IOSTANDARD LVCMOS18 [get_ports IPAD_FLAGC]
set_property IOSTANDARD LVCMOS18 [get_ports IPAD_FLAGB]
set_property IOSTANDARD LVCMOS18 [get_ports OPAD_PKTEND]
set_property IOSTANDARD LVCMOS18 [get_ports IPAD_FLAGD]
set_property IOSTANDARD LVCMOS18 [get_ports {OPAD_ADDR[*]}]
set_property IOSTANDARD LVCMOS18 [get_ports OPAD_RESET_FX3]

set_property IOB TRUE [get_ports OPAD_SLCS]
set_property IOB TRUE [get_ports OPAD_SLWR]
set_property IOB TRUE [get_ports OPAD_SLOE]
set_property IOB TRUE [get_ports OPAD_SLRD]
set_property IOB TRUE [get_ports IPAD_FLAGA]
set_property IOB TRUE [get_ports IPAD_FLAGC]
set_property IOB TRUE [get_ports IPAD_FLAGB]
set_property IOB TRUE [get_ports OPAD_PKTEND]
set_property IOB TRUE [get_ports IPAD_FLAGD]

set_property IOB TRUE [get_ports {OPAD_ADDR[*]}]

#############################################################################################
## DAC 0                                                                                   ##
#############################################################################################
set_property IOSTANDARD LVCMOS18 [get_ports OPAD_DAC0_LDO_EN]
#set_property IOSTANDARD LVCMOS18 [get_ports OPAD_DAC0_RESET]
##set_property IOSTANDARD LVCMOS18 [get_ports OPAD_DAC0_SCLK]
##set_property IOSTANDARD LVCMOS18 [get_ports OPAD_DAC0_CSB_N]
##set_property IOSTANDARD LVCMOS18 [get_ports IOPAD_DAC0_SDIO]

#set_property IOSTANDARD LVDS [get_ports IPAD_DAC0_DCO_P]
#set_property IOSTANDARD LVDS [get_ports IPAD_DAC0_DCO_N]
#set_property IOSTANDARD LVDS [get_ports OPAD_DAC0_DCI_P]
#set_property IOSTANDARD LVDS [get_ports OPAD_DAC0_DCI_N]
#set_property IOSTANDARD LVDS [get_ports {OPAD_DAC0_DATA_P[*]}]
#set_property IOSTANDARD LVDS [get_ports {OPAD_DAC0_DATA_N[*]}]

#############################################################################################
## DAC 1                                                                                   ##
#############################################################################################
set_property IOSTANDARD LVCMOS18 [get_ports OPAD_DAC1_LDO_EN]
#set_property IOSTANDARD LVCMOS18 [get_ports OPAD_DAC1_RESET]
##set_property IOSTANDARD LVCMOS18 [get_ports OPAD_DAC1_SCLK]
##set_property IOSTANDARD LVCMOS18 [get_ports OPAD_DAC1_CSB_N]
##set_property IOSTANDARD LVCMOS18 [get_ports IOPAD_DAC1_SDIO]

#set_property IOSTANDARD LVDS [get_ports IPAD_DAC1_DCO_P]
#set_property IOSTANDARD LVDS [get_ports IPAD_DAC1_DCO_N]
#set_property IOSTANDARD LVDS [get_ports OPAD_DAC1_DCI_P]
#set_property IOSTANDARD LVDS [get_ports OPAD_DAC1_DCI_N]
#set_property IOSTANDARD LVDS [get_ports {OPAD_DAC1_DATA_P[*]}]
#set_property IOSTANDARD LVDS [get_ports {OPAD_DAC1_DATA_N[*]}]

#############################################################################################
## ADC 0                                                                                   ##
#############################################################################################
set_property IOSTANDARD LVDS [get_ports IPAD_ADC0_DCLK_P]
set_property IOSTANDARD LVDS [get_ports IPAD_ADC0_DCLK_N]
set_property IOSTANDARD LVDS [get_ports IPAD_ADC0_FCLK_P]
set_property IOSTANDARD LVDS [get_ports IPAD_ADC0_FCLK_N]
set_property IOSTANDARD LVDS [get_ports {IPAD_ADC0_DATA_P[*]}]
set_property IOSTANDARD LVDS [get_ports {IPAD_ADC0_DATA_N[*]}]

set_property IOSTANDARD LVCMOS18 [get_ports OPAD_ADC0_SCLK]
set_property IOSTANDARD LVCMOS18 [get_ports IOPAD_ADC0_SDIO]
set_property IOSTANDARD LVCMOS18 [get_ports OPAD_ADC0_CSB]
set_property IOSTANDARD LVCMOS18 [get_ports OPAD_ADC0_PWDN]
set_property IOSTANDARD LVCMOS18 [get_ports OPAD_ADC0_SYNC]

#############################################################################################
## ADC 1                                                                                   ##
#############################################################################################
set_property IOSTANDARD LVDS [get_ports IPAD_ADC1_DCLK_P]
set_property IOSTANDARD LVDS [get_ports IPAD_ADC1_DCLK_N]
set_property IOSTANDARD LVDS [get_ports IPAD_ADC1_FCLK_P]
set_property IOSTANDARD LVDS [get_ports IPAD_ADC1_FCLK_N]
set_property IOSTANDARD LVDS [get_ports {IPAD_ADC1_DATA_P[*]}]
set_property IOSTANDARD LVDS [get_ports {IPAD_ADC1_DATA_N[*]}]

set_property IOSTANDARD LVCMOS18 [get_ports OPAD_ADC1_SCLK]
set_property IOSTANDARD LVCMOS18 [get_ports IOPAD_ADC1_SDIO]
set_property IOSTANDARD LVCMOS18 [get_ports OPAD_ADC1_CSB]
set_property IOSTANDARD LVCMOS18 [get_ports OPAD_ADC1_PWDN]
set_property IOSTANDARD LVCMOS18 [get_ports OPAD_ADC1_SYNC]

#############################################################################################
## AD9522 CONTROL                                                                          ##
#############################################################################################
set_property IOSTANDARD LVCMOS18 [get_ports OPAD_CLK_CS_FPGA]
set_property IOSTANDARD LVCMOS18 [get_ports OPAD_CLK_SCLK_FPGA]
set_property IOSTANDARD LVCMOS18 [get_ports IOPAD_CLK_SDIO_FPGA]
set_property IOSTANDARD LVCMOS18 [get_ports OPAD_CLK_SYNC_FPGA]
set_property IOSTANDARD LVCMOS18 [get_ports OPAD_CLK_RESET_FPGA]
set_property IOSTANDARD LVCMOS18 [get_ports OPAD_CLK_PD_FPGA]

#############################################################################################
## UMS, ShRPU and I/O Control                                                              ##
#############################################################################################
#set_property IOSTANDARD LVCMOS18 [get_ports OPAD_UMS_CLK]
#set_property IOSTANDARD LVCMOS18 [get_ports OPAD_UMS_LE1]
#set_property IOSTANDARD LVCMOS18 [get_ports OPAD_UMS_LE2]
#set_property IOSTANDARD LVCMOS18 [get_ports OPAD_UMS_LE3]
#set_property IOSTANDARD LVCMOS18 [get_ports OPAD_UMS_DATA]

#set_property IOSTANDARD LVCMOS18 [get_ports OPAD_UMS_DA]
#set_property IOSTANDARD LVCMOS18 [get_ports OPAD_UMS_DB]
#set_property IOSTANDARD LVCMOS18 [get_ports OPAD_UMS_DC]
#set_property IOSTANDARD LVCMOS18 [get_ports OPAD_UMS_DD]
#set_property IOSTANDARD LVCMOS18 [get_ports OPAD_UMS_DE]
#set_property IOSTANDARD LVCMOS18 [get_ports OPAD_UMS_DF]
#set_property IOSTANDARD LVCMOS18 [get_ports OPAD_UMS_DG]

#set_property IOSTANDARD LVCMOS18 [get_ports OPAD_LVTTL_PIN1]
#set_property IOSTANDARD LVCMOS18 [get_ports OPAD_LVTTL_PIN2]
#set_property IOSTANDARD LVCMOS18 [get_ports OPAD_LVTTL_PIN3]

##set_property IOSTANDARD LVCMOS18 [get_ports OPAD_EXT_DF_STROBE]

##set_property IOSTANDARD LVCMOS18 [get_ports OPAD_ANT_SW_PIN[0]]
##set_property IOSTANDARD LVCMOS18 [get_ports OPAD_ANT_SW_PIN[1]]
##set_property IOSTANDARD LVCMOS18 [get_ports OPAD_ANT_SW_PIN[2]]
##set_property IOSTANDARD LVCMOS18 [get_ports OPAD_ANT_SW_PIN[3]]

#set_property IOSTANDARD LVCMOS18 [get_ports OPAD_SHRPU_CLK1]
#set_property IOSTANDARD LVCMOS18 [get_ports OPAD_SHRPU_DATA1]
#set_property IOSTANDARD LVCMOS18 [get_ports OPAD_SHRPU_LE1]
#set_property IOSTANDARD LVCMOS18 [get_ports OPAD_SHRPU_CLK2]
#set_property IOSTANDARD LVCMOS18 [get_ports OPAD_SHRPU_DATA2]
#set_property IOSTANDARD LVCMOS18 [get_ports OPAD_SHRPU_LE2]

##set_property IOSTANDARD LVCMOS18 [get_ports OPAD_BUF1_DIR]
##set_property IOSTANDARD LVCMOS18 [get_ports OPAD_BUF2_DIR]
##set_property IOSTANDARD LVCMOS18 [get_ports OPAD_BUF3_DIR]
##set_property IOSTANDARD LVCMOS18 [get_ports OPAD_BUF4_DIR]






