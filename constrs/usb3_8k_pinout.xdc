

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
## NUMBER DEVICE                                                                           ##
#############################################################################################
set_property PACKAGE_PIN Y25 [get_ports {IPAD_NUMBER_DEVICE[0]}]
set_property PACKAGE_PIN Y26 [get_ports {IPAD_NUMBER_DEVICE[1]}]
set_property PACKAGE_PIN AA23 [get_ports {IPAD_NUMBER_DEVICE[2]}]
set_property PACKAGE_PIN AB24 [get_ports {IPAD_NUMBER_DEVICE[3]}]

#############################################################################################
## FLASH                                                                                   ##
#############################################################################################
set_property PACKAGE_PIN B24 [get_ports OPAD_DQ0]
set_property PACKAGE_PIN A25 [get_ports IPAD_DQ1]
set_property PACKAGE_PIN C23 [get_ports OPAD_CS]

#############################################################################################
## USB 3.0                                                                                 ##
#############################################################################################
set_property PACKAGE_PIN A14 [get_ports {IOPAD_DATA[0]}]
set_property PACKAGE_PIN G14 [get_ports {IOPAD_DATA[1]}]
set_property PACKAGE_PIN H14 [get_ports {IOPAD_DATA[2]}]
set_property PACKAGE_PIN B15 [get_ports {IOPAD_DATA[3]}]
set_property PACKAGE_PIN B14 [get_ports {IOPAD_DATA[4]}]
set_property PACKAGE_PIN A15 [get_ports {IOPAD_DATA[5]}]
set_property PACKAGE_PIN C14 [get_ports {IOPAD_DATA[6]}]
set_property PACKAGE_PIN D14 [get_ports {IOPAD_DATA[7]}]
set_property PACKAGE_PIN  J8 [get_ports {IOPAD_DATA[8]}]
set_property PACKAGE_PIN C13 [get_ports {IOPAD_DATA[9]}]
set_property PACKAGE_PIN F14 [get_ports {IOPAD_DATA[10]}]
set_property PACKAGE_PIN J13 [get_ports {IOPAD_DATA[11]}]
set_property PACKAGE_PIN J10 [get_ports {IOPAD_DATA[12]}]
set_property PACKAGE_PIN A13 [get_ports {IOPAD_DATA[13]}]
set_property PACKAGE_PIN D13 [get_ports {IOPAD_DATA[14]}]
set_property PACKAGE_PIN J11 [get_ports {IOPAD_DATA[15]}]
set_property PACKAGE_PIN  D9 [get_ports {IOPAD_DATA[16]}]
set_property PACKAGE_PIN  D8 [get_ports {IOPAD_DATA[17]}]
set_property PACKAGE_PIN H12 [get_ports {IOPAD_DATA[18]}]
set_property PACKAGE_PIN F12 [get_ports {IOPAD_DATA[19]}]
set_property PACKAGE_PIN E11 [get_ports {IOPAD_DATA[20]}]
set_property PACKAGE_PIN F10 [get_ports {IOPAD_DATA[21]}]
set_property PACKAGE_PIN  F8 [get_ports {IOPAD_DATA[22]}]
set_property PACKAGE_PIN E10 [get_ports {IOPAD_DATA[23]}]
set_property PACKAGE_PIN  G9 [get_ports {IOPAD_DATA[24]}]
set_property PACKAGE_PIN  F9 [get_ports {IOPAD_DATA[25]}]
set_property PACKAGE_PIN G12 [get_ports {IOPAD_DATA[26]}]
set_property PACKAGE_PIN G11 [get_ports {IOPAD_DATA[27]}]
set_property PACKAGE_PIN G10 [get_ports {IOPAD_DATA[28]}]
set_property PACKAGE_PIN  H8 [get_ports {IOPAD_DATA[29]}]
set_property PACKAGE_PIN H11 [get_ports {IOPAD_DATA[30]}]
set_property PACKAGE_PIN  H9 [get_ports {IOPAD_DATA[31]}]

set_property PACKAGE_PIN B10 [get_ports OPAD_PCLK_FX3]

set_property PACKAGE_PIN A12 [get_ports OPAD_SLCS]
set_property PACKAGE_PIN C12 [get_ports OPAD_SLWR]
set_property PACKAGE_PIN B12 [get_ports OPAD_SLOE]
set_property PACKAGE_PIN B11 [get_ports OPAD_SLRD]
set_property PACKAGE_PIN C11 [get_ports IPAD_FLAGA]
set_property PACKAGE_PIN A10 [get_ports IPAD_FLAGC]
set_property PACKAGE_PIN E13 [get_ports IPAD_FLAGB]
set_property PACKAGE_PIN  B9 [get_ports OPAD_PKTEND]
set_property PACKAGE_PIN  A8 [get_ports IPAD_FLAGD]
set_property PACKAGE_PIN E12 [get_ports {OPAD_ADDR[1]}]
set_property PACKAGE_PIN H13 [get_ports {OPAD_ADDR[0]}]
set_property PACKAGE_PIN J14 [get_ports OPAD_RESET_FX3]

set_property LOC MMCME2_ADV_X0Y4 [get_cells clk_usb_inst/MMCM_BASE_inst]
set_property LOC BUFR_X0Y16      [get_cells clk_usb_inst/fx3_I_Bufr]

set_property IOB TRUE [all_inputs]
set_property IOB TRUE [all_outputs]

set_property LOC ILOGIC_X0Y207 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[0]]
set_property LOC OLOGIC_X0Y207 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[0]]

set_property LOC ILOGIC_X0Y239 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[1]]
set_property LOC OLOGIC_X0Y239 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[1]]

set_property LOC ILOGIC_X0Y240 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[2]]
set_property LOC OLOGIC_X0Y240 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[2]]

set_property LOC ILOGIC_X0Y204 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[3]]
set_property LOC OLOGIC_X0Y204 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[3]]

set_property LOC ILOGIC_X0Y208 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[4]]
set_property LOC OLOGIC_X0Y208 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[4]]

set_property LOC ILOGIC_X0Y203 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[5]]
set_property LOC OLOGIC_X0Y203 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[5]]

set_property LOC ILOGIC_X0Y212 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[6]]
set_property LOC OLOGIC_X0Y212 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[6]]

set_property LOC ILOGIC_X0Y216 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[7]]
set_property LOC OLOGIC_X0Y216 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[7]]

set_property LOC ILOGIC_X0Y249 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[8]]
set_property LOC OLOGIC_X0Y249 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[8]]

set_property LOC ILOGIC_X0Y211 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[9]]
set_property LOC OLOGIC_X0Y211 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[9]]

set_property LOC ILOGIC_X0Y220 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[10]]
set_property LOC OLOGIC_X0Y220 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[10]]

set_property LOC ILOGIC_X0Y244 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[11]]
set_property LOC OLOGIC_X0Y244 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[11]]

set_property LOC ILOGIC_X0Y241 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[12]]
set_property LOC OLOGIC_X0Y241 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[12]]

set_property LOC ILOGIC_X0Y202 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[13]]
set_property LOC OLOGIC_X0Y202 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[13]]

set_property LOC ILOGIC_X0Y215 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[14]]
set_property LOC OLOGIC_X0Y215 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[14]]

set_property LOC ILOGIC_X0Y242 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[15]]
set_property LOC OLOGIC_X0Y242 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[15]]

set_property LOC ILOGIC_X0Y234 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[16]]
set_property LOC OLOGIC_X0Y234 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[16]]

set_property LOC ILOGIC_X0Y233 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[17]]
set_property LOC OLOGIC_X0Y233 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[17]]

set_property LOC ILOGIC_X0Y238 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[18]]
set_property LOC OLOGIC_X0Y238 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[18]]

set_property LOC ILOGIC_X0Y217 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[19]]
set_property LOC OLOGIC_X0Y217 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[19]]

set_property LOC ILOGIC_X0Y222 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[20]]
set_property LOC OLOGIC_X0Y222 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[20]]

set_property LOC ILOGIC_X0Y227 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[21]]
set_property LOC OLOGIC_X0Y227 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[21]]

set_property LOC ILOGIC_X0Y235 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[22]]
set_property LOC OLOGIC_X0Y235 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[22]]

set_property LOC ILOGIC_X0Y226 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[23]]
set_property LOC OLOGIC_X0Y226 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[23]]

set_property LOC ILOGIC_X0Y245 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[24]]
set_property LOC OLOGIC_X0Y245 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[24]]

set_property LOC ILOGIC_X0Y236 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[25]]
set_property LOC OLOGIC_X0Y236 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[25]]

set_property LOC ILOGIC_X0Y218 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[26]]
set_property LOC OLOGIC_X0Y218 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[26]]

set_property LOC ILOGIC_X0Y228 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[27]]
set_property LOC OLOGIC_X0Y228 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[27]]

set_property LOC ILOGIC_X0Y246 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[28]]
set_property LOC OLOGIC_X0Y246 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[28]]

set_property LOC ILOGIC_X0Y247 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[29]]
set_property LOC OLOGIC_X0Y247 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[29]]

set_property LOC ILOGIC_X0Y237 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[30]]
set_property LOC OLOGIC_X0Y237 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[30]]

set_property LOC ILOGIC_X0Y248 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[31]]
set_property LOC OLOGIC_X0Y248 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[31]]

set_property LOC SLICE_X0Y207 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[0]]
set_property LOC SLICE_X0Y239 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[1]]
set_property LOC SLICE_X0Y240 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[2]]
set_property LOC SLICE_X0Y204 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[3]]
set_property LOC SLICE_X0Y208 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[4]]
set_property LOC SLICE_X0Y203 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[5]]
set_property LOC SLICE_X0Y212 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[6]]
set_property LOC SLICE_X0Y216 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[7]]
set_property LOC SLICE_X0Y249 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[8]]
set_property LOC SLICE_X0Y211 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[9]]
set_property LOC SLICE_X0Y220 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[10]]
set_property LOC SLICE_X0Y244 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[11]]
set_property LOC SLICE_X0Y241 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[12]]
set_property LOC SLICE_X0Y202 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[13]]
set_property LOC SLICE_X0Y215 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[14]]
set_property LOC SLICE_X0Y242 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[15]]
set_property LOC SLICE_X0Y234 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[16]]
set_property LOC SLICE_X0Y233 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[17]]
set_property LOC SLICE_X0Y238 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[18]]
set_property LOC SLICE_X0Y217 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[19]]
set_property LOC SLICE_X0Y222 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[20]]
set_property LOC SLICE_X0Y227 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[21]]
set_property LOC SLICE_X0Y235 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[22]]
set_property LOC SLICE_X0Y226 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[23]]
set_property LOC SLICE_X0Y245 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[24]]
set_property LOC SLICE_X0Y236 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[25]]
set_property LOC SLICE_X0Y218 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[26]]
set_property LOC SLICE_X0Y228 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[27]]
set_property LOC SLICE_X0Y246 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[28]]
set_property LOC SLICE_X0Y247 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[29]]
set_property LOC SLICE_X0Y237 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[30]]
set_property LOC SLICE_X0Y248 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[31]]


#set_property LOC OLOGIC_X0Y243 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/addr_0]

#set_property LOC ILOGIC_X0Y231 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/readiness_inst/flagd_clk]

#set_property LOC OLOGIC_X0Y224 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/slwr]

#set_property LOC ILOGIC_X0Y223 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/readiness_inst/flaga_clk]

#set_property LOC ILOGIC_X0Y214 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/readiness_inst/flagb_clk]

#set_property LOC OLOGIC_X0Y213 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/addr_1]

#set_property LOC OLOGIC_X0Y210 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe]

#set_property LOC OLOGIC_X0Y209 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/slrd]

#set_property LOC OLOGIC_X0Y206 [get_cells PCLK_FX3_out]

#set_property LOC ILOGIC_X0Y205 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/readiness_inst/flagc_clk]

#set_property LOC OLOGIC_X0Y201 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/slcs]





# GPIFII LOC constraints
#set_property LOC MMCME2_ADV_X0Y4 [get_cells clk_usb_inst/MMCM_BASE_inst]
#set_property LOC BUFR_X0Y16      [get_cells clk_usb_inst/fx3_I_Bufr]

#set_property LOC SLICE_X0Y207 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[0]]
#set_property LOC SLICE_X0Y239 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[1]]
#set_property LOC SLICE_X0Y240 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[2]]
#set_property LOC SLICE_X0Y204 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[3]]
#set_property LOC SLICE_X0Y208 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[4]]
#set_property LOC SLICE_X0Y203 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[5]]
#set_property LOC SLICE_X0Y212 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[6]]
#set_property LOC SLICE_X0Y216 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[7]]
#set_property LOC SLICE_X0Y249 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[8]]
#set_property LOC SLICE_X0Y211 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[9]]
#set_property LOC SLICE_X0Y220 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[10]]
#set_property LOC SLICE_X0Y244 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[11]]
#set_property LOC SLICE_X0Y241 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[12]]
#set_property LOC SLICE_X0Y202 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[13]]
#set_property LOC SLICE_X0Y215 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[14]]
#set_property LOC SLICE_X0Y242 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[15]]
#set_property LOC SLICE_X0Y234 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[16]]
#set_property LOC SLICE_X0Y233 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[17]]
#set_property LOC SLICE_X0Y238 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[18]]
#set_property LOC SLICE_X0Y217 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[19]]
#set_property LOC SLICE_X0Y222 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[20]]
#set_property LOC SLICE_X0Y227 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[21]]
#set_property LOC SLICE_X0Y235 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[22]]
#set_property LOC SLICE_X0Y226 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[23]]
#set_property LOC SLICE_X0Y245 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[24]]
#set_property LOC SLICE_X0Y236 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[25]]
#set_property LOC SLICE_X0Y218 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[26]]
#set_property LOC SLICE_X0Y228 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[27]]
#set_property LOC SLICE_X0Y246 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[28]]
#set_property LOC SLICE_X0Y247 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[29]]
#set_property LOC SLICE_X0Y237 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[30]]
#set_property LOC SLICE_X0Y248 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/d_data_out_reg[31]]

#set_property LOC SLICE_X1Y207 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[0]]
#set_property LOC SLICE_X1Y239 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[1]]
#set_property LOC SLICE_X1Y240 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[2]]
#set_property LOC SLICE_X1Y204 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[3]]
#set_property LOC SLICE_X1Y208 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[4]]
#set_property LOC SLICE_X1Y203 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[5]]
#set_property LOC SLICE_X1Y212 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[6]]
#set_property LOC SLICE_X1Y216 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[7]]
#set_property LOC SLICE_X1Y249 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[8]]
#set_property LOC SLICE_X1Y211 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[9]]
#set_property LOC SLICE_X1Y220 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[10]]
#set_property LOC SLICE_X1Y244 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[11]]
#set_property LOC SLICE_X1Y241 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[12]]
#set_property LOC SLICE_X1Y202 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[13]]
#set_property LOC SLICE_X1Y215 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[14]]
#set_property LOC SLICE_X1Y242 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[15]]
#set_property LOC SLICE_X1Y234 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[16]]
#set_property LOC SLICE_X1Y233 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[17]]
#set_property LOC SLICE_X1Y238 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[18]]
#set_property LOC SLICE_X1Y217 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[19]]
#set_property LOC SLICE_X1Y222 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[20]]
#set_property LOC SLICE_X1Y227 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[21]]
#set_property LOC SLICE_X1Y235 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[22]]
#set_property LOC SLICE_X1Y226 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[23]]
#set_property LOC SLICE_X1Y245 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[24]]
#set_property LOC SLICE_X1Y236 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[25]]
#set_property LOC SLICE_X1Y218 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[26]]
#set_property LOC SLICE_X1Y228 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[27]]
#set_property LOC SLICE_X1Y246 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[28]]
#set_property LOC SLICE_X1Y247 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[29]]
#set_property LOC SLICE_X1Y237 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[30]]
#set_property LOC SLICE_X1Y248 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_in_reg[31]]

#set_property LOC SLICE_X2Y207 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[0]]
#set_property LOC SLICE_X2Y239 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[1]]
#set_property LOC SLICE_X2Y240 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[2]]
#set_property LOC SLICE_X2Y204 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[3]]
#set_property LOC SLICE_X2Y208 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[4]]
#set_property LOC SLICE_X2Y203 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[5]]
#set_property LOC SLICE_X2Y212 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[6]]
#set_property LOC SLICE_X2Y216 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[7]]
#set_property LOC SLICE_X2Y249 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[8]]
#set_property LOC SLICE_X2Y211 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[9]]
#set_property LOC SLICE_X2Y220 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[10]]
#set_property LOC SLICE_X2Y244 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[11]]
#set_property LOC SLICE_X2Y241 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[12]]
#set_property LOC SLICE_X2Y202 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[13]]
#set_property LOC SLICE_X2Y215 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[14]]
#set_property LOC SLICE_X2Y242 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[15]]
#set_property LOC SLICE_X2Y234 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[16]]
#set_property LOC SLICE_X2Y233 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[17]]
#set_property LOC SLICE_X2Y238 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[18]]
#set_property LOC SLICE_X2Y217 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[19]]
#set_property LOC SLICE_X2Y222 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[20]]
#set_property LOC SLICE_X2Y227 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[21]]
#set_property LOC SLICE_X2Y235 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[22]]
#set_property LOC SLICE_X2Y226 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[23]]
#set_property LOC SLICE_X2Y245 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[24]]
#set_property LOC SLICE_X2Y236 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[25]]
#set_property LOC SLICE_X2Y218 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[26]]
#set_property LOC SLICE_X2Y228 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[27]]
#set_property LOC SLICE_X2Y246 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[28]]
#set_property LOC SLICE_X2Y247 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[29]]
#set_property LOC SLICE_X2Y237 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[30]]
#set_property LOC SLICE_X2Y248 [get_cells usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/sloe_iobuf_reg[31]]

#############################################################################################
## DAC 0                                                                                   ##
#############################################################################################
# EN_DAC_1
set_property PACKAGE_PIN E22 [get_ports OPAD_DAC0_LDO_EN]
## RESET_DAC_1
###set_property PACKAGE_PIN V19 [get_ports OPAD_DAC0_RESET]
## SCLK_DAC_1
##set_property PACKAGE_PIN W16 [get_ports OPAD_DAC0_SCLK] 
## CSB_DAC_1        
##set_property PACKAGE_PIN V18 [get_ports OPAD_DAC0_CSB_N] 
## SDIO_DAC_1       
##set_property PACKAGE_PIN W15 [get_ports IOPAD_DAC0_SDIO]        

## DCO*_DAC_1 Memory Group 1 Bank 32
#set_property PACKAGE_PIN AC16 [get_ports IPAD_DAC0_DCO_N]
#set_property PACKAGE_PIN AB16 [get_ports IPAD_DAC0_DCO_P]
## DCI*_DAC_1 Memory Group 0 Bank 32
#set_property PACKAGE_PIN AE16 [get_ports OPAD_DAC0_DCI_N]
#set_property PACKAGE_PIN AD16 [get_ports OPAD_DAC0_DCI_P]
## D15*_DAC_1 Memory Group 1 Bank 32
#set_property PACKAGE_PIN AA15 [get_ports {OPAD_DAC0_DATA_N[15]}]
#set_property PACKAGE_PIN AA14 [get_ports {OPAD_DAC0_DATA_P[15]}]
## D14*_DAC_1 Memory Group 2 Bank 32
#set_property PACKAGE_PIN AA19 [get_ports {OPAD_DAC0_DATA_P[14]}]
#set_property PACKAGE_PIN AA20 [get_ports {OPAD_DAC0_DATA_N[14]}]
## D13*_DAC_1 Memory Group 3 Bank 32
#set_property PACKAGE_PIN W18 [get_ports {OPAD_DAC0_DATA_P[13]}]
#set_property PACKAGE_PIN W19 [get_ports {OPAD_DAC0_DATA_N[13]}]
## D12*_DAC_1 Memory Group 3 Bank 32
#set_property PACKAGE_PIN Y17 [get_ports {OPAD_DAC0_DATA_P[12]}]
#set_property PACKAGE_PIN Y18 [get_ports {OPAD_DAC0_DATA_N[12]}]
## D11*_DAC_1 Memory Group 3 Bank 32
#set_property PACKAGE_PIN V16 [get_ports {OPAD_DAC0_DATA_P[11]}]
#set_property PACKAGE_PIN V17 [get_ports {OPAD_DAC0_DATA_N[11]}]
## D10*_DAC_1 Memory Group 1 Bank 32
#set_property PACKAGE_PIN Y15 [get_ports {OPAD_DAC0_DATA_P[10]}]
#set_property PACKAGE_PIN Y16 [get_ports {OPAD_DAC0_DATA_N[10]}]
## D9*_DAC_1 Memory Group 1 Bank 32
#set_property PACKAGE_PIN AB14 [get_ports {OPAD_DAC0_DATA_P[9]}]
#set_property PACKAGE_PIN AB15 [get_ports {OPAD_DAC0_DATA_N[9]}]
## D8*_DAC_1 Memory Group 1 Bank 32
#set_property PACKAGE_PIN AC14 [get_ports {OPAD_DAC0_DATA_P[8]}]
#set_property PACKAGE_PIN AD14 [get_ports {OPAD_DAC0_DATA_N[8]}]
## D7*_DAC_1 Memory Group 0 Bank 32
#set_property PACKAGE_PIN AE17 [get_ports {OPAD_DAC0_DATA_P[7]}]
#set_property PACKAGE_PIN AF17 [get_ports {OPAD_DAC0_DATA_N[7]}]
## D6*_DAC_1 Memory Group 0 Bank 32
#set_property PACKAGE_PIN AF19 [get_ports {OPAD_DAC0_DATA_P[6]}]
#set_property PACKAGE_PIN AF20 [get_ports {OPAD_DAC0_DATA_N[6]}]
## D5*_DAC_1 Memory Group 0 Bank 32
#set_property PACKAGE_PIN AD15 [get_ports {OPAD_DAC0_DATA_P[5]}]
#set_property PACKAGE_PIN AE15 [get_ports {OPAD_DAC0_DATA_N[5]}]
## D4*_DAC_1 Memory Group 2 Bank 32
#set_property PACKAGE_PIN AB19 [get_ports {OPAD_DAC0_DATA_P[4]}]
#set_property PACKAGE_PIN AB20 [get_ports {OPAD_DAC0_DATA_N[4]}]
## D3*_DAC_1 Memory Group 2 Bank 32
#set_property PACKAGE_PIN AC19 [get_ports {OPAD_DAC0_DATA_P[3]}]
#set_property PACKAGE_PIN AD19 [get_ports {OPAD_DAC0_DATA_N[3]}]
## D2*_DAC_1 Memory Group 2 Bank 32
#set_property PACKAGE_PIN AD20 [get_ports {OPAD_DAC0_DATA_P[2]}]
#set_property PACKAGE_PIN AE20 [get_ports {OPAD_DAC0_DATA_N[2]}]
## D1*_DAC_1 Memory Group 0 Bank 32
#set_property PACKAGE_PIN AF14 [get_ports {OPAD_DAC0_DATA_P[1]}]
#set_property PACKAGE_PIN AF15 [get_ports {OPAD_DAC0_DATA_N[1]}]
## D0*_DAC_1 Memory Group 0 Bank 32
#set_property PACKAGE_PIN AE18 [get_ports {OPAD_DAC0_DATA_P[0]}]
#set_property PACKAGE_PIN AF18 [get_ports {OPAD_DAC0_DATA_N[0]}]

#set_property LOC OUT_FIFO_X1Y3 [get_cells ad9783_dacs_phy_iq_v3_0_inst/inst_FIFO1_DAC1_DATA]
#set_property LOC OUT_FIFO_X1Y2 [get_cells ad9783_dacs_phy_iq_v3_0_inst/inst_FIFO2_DAC1_DATA]
#set_property LOC OUT_FIFO_X1Y1 [get_cells ad9783_dacs_phy_iq_v3_0_inst/inst_FIFO3_DAC1_DATA]
#set_property LOC OUT_FIFO_X1Y0 [get_cells ad9783_dacs_phy_iq_v3_0_inst/inst_FIFO4_DAC1_DATA]

#############################################################################################
## DAC 1                                                                                   ##
#############################################################################################
# EN_DAC_2
set_property PACKAGE_PIN C21 [get_ports OPAD_DAC1_LDO_EN]       
## RESET_DAC_2
#set_property PACKAGE_PIN AF2 [get_ports OPAD_DAC1_RESET]
## SCLK_DAC_2       
##set_property PACKAGE_PIN AE5 [get_ports OPAD_DAC1_SCLK]
## CSB_DAC_2         
##set_property PACKAGE_PIN AF3 [get_ports OPAD_DAC1_CSB_N]
## SDIO_DAC_2        
##set_property PACKAGE_PIN AE6 [get_ports IOPAD_DAC1_SDIO]        

## DCO*_DAC_2 Memory Group 1 Bank 34
#set_property PACKAGE_PIN AA3 [get_ports IPAD_DAC1_DCO_P]
#set_property PACKAGE_PIN AA2 [get_ports IPAD_DAC1_DCO_N]
## DCI*_DAC_2 Memory Group 0 Bank 34
#set_property PACKAGE_PIN W5 [get_ports OPAD_DAC1_DCI_N]
#set_property PACKAGE_PIN W6 [get_ports OPAD_DAC1_DCI_P]
## D15*_DAC_2 Memory Group 2 Bank 34
#set_property PACKAGE_PIN AD5 [get_ports {OPAD_DAC1_DATA_N[15]}]
#set_property PACKAGE_PIN AD6 [get_ports {OPAD_DAC1_DATA_P[15]}]
## D14*_DAC_2 Memory Group 3 Bank 34
#set_property PACKAGE_PIN AD4 [get_ports {OPAD_DAC1_DATA_P[14]}]
#set_property PACKAGE_PIN AD3 [get_ports {OPAD_DAC1_DATA_N[14]}]
## D13*_DAC_2 Memory Group 2 Bank 34
#set_property PACKAGE_PIN AC4 [get_ports {OPAD_DAC1_DATA_P[13]}]
#set_property PACKAGE_PIN AC3 [get_ports {OPAD_DAC1_DATA_N[13]}]
## D12*_DAC_2 Memory Group 1 Bank 34
#set_property PACKAGE_PIN Y3 [get_ports {OPAD_DAC1_DATA_P[12]}]
#set_property PACKAGE_PIN Y2 [get_ports {OPAD_DAC1_DATA_N[12]}]
## D11*_DAC_2 Memory Group 1 Bank 34
#set_property PACKAGE_PIN W1 [get_ports {OPAD_DAC1_DATA_P[11]}]
#set_property PACKAGE_PIN Y1 [get_ports {OPAD_DAC1_DATA_N[11]}]
## D10*_DAC_2 Memory Group 1 Bank 34
#set_property PACKAGE_PIN V2 [get_ports {OPAD_DAC1_DATA_P[10]}]
#set_property PACKAGE_PIN V1 [get_ports {OPAD_DAC1_DATA_N[10]}]
## D9*_DAC_2 Memory Group 1 Bank 34
#set_property PACKAGE_PIN AB2 [get_ports {OPAD_DAC1_DATA_P[9]}]
#set_property PACKAGE_PIN AC2 [get_ports {OPAD_DAC1_DATA_N[9]}]
## D8*_DAC_2 Memory Group 0 Bank 34
#set_property PACKAGE_PIN V4 [get_ports {OPAD_DAC1_DATA_P[8]}]
#set_property PACKAGE_PIN W4 [get_ports {OPAD_DAC1_DATA_N[8]}]
## D7*_DAC_2 Memory Group 0 Bank 34
#set_property PACKAGE_PIN V3 [get_ports {OPAD_DAC1_DATA_P[7]}]
#set_property PACKAGE_PIN W3 [get_ports {OPAD_DAC1_DATA_N[7]}]
## D6*_DAC_2 Memory Group 2 Bank 34
#set_property PACKAGE_PIN AA5 [get_ports {OPAD_DAC1_DATA_P[6]}]
#set_property PACKAGE_PIN AB5 [get_ports {OPAD_DAC1_DATA_N[6]}]
## D5*_DAC_2 Memory Group 0 Bank 34
#set_property PACKAGE_PIN U7 [get_ports {OPAD_DAC1_DATA_P[5]}]
#set_property PACKAGE_PIN V6 [get_ports {OPAD_DAC1_DATA_N[5]}]
## D4*_DAC_2 Memory Group 2 Bank 34
#set_property PACKAGE_PIN Y6 [get_ports {OPAD_DAC1_DATA_P[4]}]
#set_property PACKAGE_PIN Y5 [get_ports {OPAD_DAC1_DATA_N[4]}]
## D3*_DAC_2 Memory Group 0 Bank 34
#set_property PACKAGE_PIN U2 [get_ports {OPAD_DAC1_DATA_P[3]}]
#set_property PACKAGE_PIN U1 [get_ports {OPAD_DAC1_DATA_N[3]}]
## D2*_DAC_2 Memory Group 1 Bank 34
#set_property PACKAGE_PIN AB1 [get_ports {OPAD_DAC1_DATA_P[2]}]
#set_property PACKAGE_PIN AC1 [get_ports {OPAD_DAC1_DATA_N[2]}]
## D1*_DAC_2 Memory Group 2 Bank 34
#set_property PACKAGE_PIN AB6 [get_ports {OPAD_DAC1_DATA_P[1]}]
#set_property PACKAGE_PIN AC6 [get_ports {OPAD_DAC1_DATA_N[1]}]
## D0*_DAC_2 Memory Group 3 Bank 34
#set_property PACKAGE_PIN AD1 [get_ports {OPAD_DAC1_DATA_P[0]}]
#set_property PACKAGE_PIN AE1 [get_ports {OPAD_DAC1_DATA_N[0]}]

#set_property LOC OUT_FIFO_X1Y11 [get_cells ad9783_dacs_phy_iq_v3_0_inst/inst_FIFO1_DAC2_DATA]
#set_property LOC OUT_FIFO_X1Y10 [get_cells ad9783_dacs_phy_iq_v3_0_inst/inst_FIFO2_DAC2_DATA]
#set_property LOC OUT_FIFO_X1Y9 [get_cells ad9783_dacs_phy_iq_v3_0_inst/inst_FIFO3_DAC2_DATA]
#set_property LOC OUT_FIFO_X1Y8 [get_cells ad9783_dacs_phy_iq_v3_0_inst/inst_FIFO4_DAC2_DATA]

#############################################################################################
## ADC 0                                                                                   ##
#############################################################################################
set_property LOC BUFIO_X1Y6 [get_cells adctoplevel_toplevel_inst/AD9253INT_0/BUFIO_inst]
set_property LOC AC9 [get_cells adctoplevel_toplevel_inst/AD9253INT_0/DCOBUF]
set_property LOC IDELAY_X1Y76 [get_cells adctoplevel_toplevel_inst/AD9253INT_0/DCOIDL]
set_property LOC ILOGIC_X1Y76 [get_cells adctoplevel_toplevel_inst/AD9253INT_0/CLKISRD]
set_property PACKAGE_PIN AD9 [get_ports IPAD_ADC0_DCLK_N]
set_property PACKAGE_PIN AC9 [get_ports IPAD_ADC0_DCLK_P]
set_property PACKAGE_PIN W11 [get_ports IPAD_ADC0_FCLK_N]
set_property PACKAGE_PIN V11 [get_ports IPAD_ADC0_FCLK_P]
set_property PACKAGE_PIN V8 [get_ports {IPAD_ADC0_DATA_P[0]}]
set_property PACKAGE_PIN V7 [get_ports {IPAD_ADC0_DATA_N[0]}]
set_property PACKAGE_PIN W10 [get_ports {IPAD_ADC0_DATA_P[1]}]
set_property PACKAGE_PIN W9 [get_ports {IPAD_ADC0_DATA_N[1]}]
set_property PACKAGE_PIN Y8 [get_ports {IPAD_ADC0_DATA_P[2]}]
set_property PACKAGE_PIN Y7 [get_ports {IPAD_ADC0_DATA_N[2]}]
set_property PACKAGE_PIN Y11 [get_ports {IPAD_ADC0_DATA_P[3]}]
set_property PACKAGE_PIN Y10 [get_ports {IPAD_ADC0_DATA_N[3]}]
set_property PACKAGE_PIN V9 [get_ports {IPAD_ADC0_DATA_P[4]}]
set_property PACKAGE_PIN W8 [get_ports {IPAD_ADC0_DATA_N[4]}]
set_property PACKAGE_PIN AE7 [get_ports {IPAD_ADC0_DATA_P[5]}]
set_property PACKAGE_PIN AF7 [get_ports {IPAD_ADC0_DATA_N[5]}]
set_property PACKAGE_PIN AA8 [get_ports {IPAD_ADC0_DATA_P[6]}]
set_property PACKAGE_PIN AA7 [get_ports {IPAD_ADC0_DATA_N[6]}]
set_property PACKAGE_PIN AC8 [get_ports {IPAD_ADC0_DATA_P[7]}]
set_property PACKAGE_PIN AD8 [get_ports {IPAD_ADC0_DATA_N[7]}]

set_property PACKAGE_PIN AA17 [get_ports OPAD_ADC0_SCLK]
set_property PACKAGE_PIN AA18 [get_ports IOPAD_ADC0_SDIO]
set_property PACKAGE_PIN AB17 [get_ports OPAD_ADC0_CSB]
set_property PACKAGE_PIN AC17 [get_ports OPAD_ADC0_PWDN]
set_property PACKAGE_PIN AB7 [get_ports OPAD_ADC0_SYNC]


#############################################################################################
## ADC 1                                                                                   ##
#############################################################################################
set_property LOC BUFIO_X1Y5 [get_cells adctoplevel_toplevel_inst/AD9253INT_1/BUFIO_inst]
set_property LOC AB11 [get_cells adctoplevel_toplevel_inst/AD9253INT_1/DCOBUF]
set_property LOC IDELAY_X1Y74 [get_cells adctoplevel_toplevel_inst/AD9253INT_1/DCOIDL]
set_property LOC ILOGIC_X1Y74 [get_cells adctoplevel_toplevel_inst/AD9253INT_1/CLKISRD]
set_property PACKAGE_PIN AC11 [get_ports IPAD_ADC1_DCLK_N]
set_property PACKAGE_PIN AB11 [get_ports IPAD_ADC1_DCLK_P]
set_property PACKAGE_PIN AA13 [get_ports IPAD_ADC1_FCLK_P]
set_property PACKAGE_PIN AA12 [get_ports IPAD_ADC1_FCLK_N]
set_property PACKAGE_PIN AC13 [get_ports {IPAD_ADC1_DATA_P[0]}]
set_property PACKAGE_PIN AD13 [get_ports {IPAD_ADC1_DATA_N[0]}]
set_property PACKAGE_PIN Y13 [get_ports {IPAD_ADC1_DATA_P[1]}]
set_property PACKAGE_PIN Y12 [get_ports {IPAD_ADC1_DATA_N[1]}]
set_property PACKAGE_PIN AD11 [get_ports {IPAD_ADC1_DATA_P[2]}]
set_property PACKAGE_PIN AE11 [get_ports {IPAD_ADC1_DATA_N[2]}]
set_property PACKAGE_PIN AD10 [get_ports {IPAD_ADC1_DATA_P[3]}]
set_property PACKAGE_PIN AE10 [get_ports {IPAD_ADC1_DATA_N[3]}]
set_property PACKAGE_PIN AE12 [get_ports {IPAD_ADC1_DATA_P[4]}]
set_property PACKAGE_PIN AF12 [get_ports {IPAD_ADC1_DATA_N[4]}]
set_property PACKAGE_PIN AE8 [get_ports {IPAD_ADC1_DATA_P[5]}]
set_property PACKAGE_PIN AF8 [get_ports {IPAD_ADC1_DATA_N[5]}]
set_property PACKAGE_PIN AE13 [get_ports {IPAD_ADC1_DATA_P[6]}]
set_property PACKAGE_PIN AF13 [get_ports {IPAD_ADC1_DATA_N[6]}]
set_property PACKAGE_PIN AF10 [get_ports {IPAD_ADC1_DATA_P[7]}]
set_property PACKAGE_PIN AF9 [get_ports {IPAD_ADC1_DATA_N[7]}]

set_property PACKAGE_PIN AF5 [get_ports OPAD_ADC1_SCLK]
set_property PACKAGE_PIN AF4 [get_ports IOPAD_ADC1_SDIO]
set_property PACKAGE_PIN AE3 [get_ports OPAD_ADC1_CSB]
set_property PACKAGE_PIN AE2 [get_ports OPAD_ADC1_PWDN]
set_property PACKAGE_PIN AC7 [get_ports OPAD_ADC1_SYNC]

#############################################################################################
## AD9522 CONTROL                                                                          ##
#############################################################################################
set_property PACKAGE_PIN U24 [get_ports OPAD_CLK_CS_FPGA]
set_property PACKAGE_PIN U25 [get_ports OPAD_CLK_SCLK_FPGA]
set_property PACKAGE_PIN V23 [get_ports IOPAD_CLK_SDIO_FPGA]
set_property PACKAGE_PIN U21 [get_ports OPAD_CLK_SYNC_FPGA]
set_property PACKAGE_PIN U22 [get_ports OPAD_CLK_RESET_FPGA]
set_property PACKAGE_PIN V22 [get_ports OPAD_CLK_PD_FPGA]

#############################################################################################
## UMS, ShRPU and I/O Control                                                              ##
#############################################################################################
## IO_FPGA_1  -> IO_1  -> X17:B2  <-> UMS:X5:3
#set_property PACKAGE_PIN T22 [get_ports OPAD_UMS_CLK]
## IO_FPGA_3  -> IO_3  -> X17:B3  <-> UMS:X5:5
#set_property PACKAGE_PIN T20 [get_ports OPAD_UMS_LE1]
## IO_FPGA_10 -> IO_10 -> X17:A8  <-> UMS:X5:16
#set_property PACKAGE_PIN T25 [get_ports OPAD_UMS_LE2]
## IO_FPGA_5  -> IO_5  -> X17:B4  <-> UMS:X5:7
#set_property PACKAGE_PIN N22 [get_ports OPAD_UMS_LE3]
## IO_FPGA_6  -> IO_6  -> X17:A5  <-> UMS:X5:10
#set_property PACKAGE_PIN R20 [get_ports OPAD_UMS_DATA]

## IO_FPGA_11 -> IO_11 -> X17:B8  <-> UMS:X5:15
#set_property PACKAGE_PIN T24 [get_ports OPAD_UMS_DA]
## IO_FPGA_13 -> IO_13 -> X17:B9  <-> UMS:X5:17
#set_property PACKAGE_PIN R25 [get_ports OPAD_UMS_DB]
## IO_FPGA_9  -> IO_9  -> X17:B7  <-> UMS:X5:13
#set_property PACKAGE_PIN T23 [get_ports OPAD_UMS_DC]
## IO_FPGA_4  -> IO_4  -> X17:A4  <-> UMS:X5:8
#set_property PACKAGE_PIN P20 [get_ports OPAD_UMS_DD]
## IO_FPGA_7  -> IO_7  -> X17:B5  <-> UMS:X5:9
#set_property PACKAGE_PIN M22 [get_ports OPAD_UMS_DE]
## IO_FPGA_2  -> IO_2  -> X17:A3  <-> UMS:X5:6
#set_property PACKAGE_PIN P21 [get_ports OPAD_UMS_DF]
## IO_FPGA_0  -> IO_0  -> X17:A2  <-> UMS:X5:4
#set_property PACKAGE_PIN R22 [get_ports OPAD_UMS_DG]

## IO_FPGA_30 -> IO_30 -> X17:A20
#set_property PACKAGE_PIN U19 [get_ports OPAD_LVTTL_PIN1]
## IO_FPGA_15 -> IO_15 -> X17:B10
#set_property PACKAGE_PIN P26 [get_ports OPAD_LVTTL_PIN2]
## IO_FPGA_14 -> IO_14 -> X17:A10
#set_property PACKAGE_PIN R23 [get_ports OPAD_LVTTL_PIN3]

### IO_FPGA_31 -> IO_31 -> X17:B20
##set_property PACKAGE_PIN  U20 [get_ports OPAD_EXT_DF_STROBE]

### IO_FPGA_26 -> IO_26 -> X17:A18
###set_property PACKAGE_PIN  M26 [get_ports OPAD_ANT_SW_PIN[0]]
### IO_FPGA_27 -> IO_27 -> X17:B18
##set_property PACKAGE_PIN  N19 [get_ports OPAD_ANT_SW_PIN[1]]
### IO_FPGA_28 -> IO_28 -> X17:A19
##set_property PACKAGE_PIN  P19 [get_ports OPAD_ANT_SW_PIN[2]]
### IO_FPGA_29 -> IO_29 -> X17:B19
##set_property PACKAGE_PIN  K26 [get_ports OPAD_ANT_SW_PIN[3]]

## IO_FPGA_16 -> IO_16 -> X17:A12
#set_property PACKAGE_PIN P25 [get_ports OPAD_SHRPU_CLK1]
## IO_FPGA_17 -> IO_17 -> X17:B12
#set_property PACKAGE_PIN P24 [get_ports OPAD_SHRPU_DATA1]
## IO_FPGA_18 -> IO_18 -> X17:A13
#set_property PACKAGE_PIN P23 [get_ports OPAD_SHRPU_LE1]
## IO_FPGA_19 -> IO_19 -> X17:B13
#set_property PACKAGE_PIN N23 [get_ports OPAD_SHRPU_CLK2]
## IO_FPGA_20 -> IO_20 -> X17:A14
#set_property PACKAGE_PIN N24 [get_ports OPAD_SHRPU_DATA2]
## IO_FPGA_21 -> IO_21 -> X17:B14
#set_property PACKAGE_PIN N26 [get_ports OPAD_SHRPU_LE2]

### DIR_IO_FPGA_0_7
##set_property PACKAGE_PIN AA22 [get_ports OPAD_BUF1_DIR]
### DIR_IO_FPGA_8_15
##set_property PACKAGE_PIN AC23 [get_ports OPAD_BUF2_DIR]
### DIR_IO_FPGA_16_23
##set_property PACKAGE_PIN AC24 [get_ports OPAD_BUF3_DIR]
### DIR_IO_FPGA_24_31
##set_property PACKAGE_PIN  W20 [get_ports OPAD_BUF4_DIR]



