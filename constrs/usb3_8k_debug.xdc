create_pblock pblock_fx3_interface_inst

create_pblock pblock_usb_mdl_estrd_v3_0_inst

create_pblock pblock_fx3_interface_inst_1
create_pblock pblock_fx3_interface_inst_2
add_cells_to_pblock [get_pblocks pblock_fx3_interface_inst_2] [get_cells -quiet [list usb_module_estrade_v3_0_inst/fx3_interface_inst]]
resize_pblock [get_pblocks pblock_fx3_interface_inst_2] -add {SLICE_X0Y200:SLICE_X15Y249}
resize_pblock [get_pblocks pblock_fx3_interface_inst_2] -add {DSP48_X0Y80:DSP48_X0Y99}
resize_pblock [get_pblocks pblock_fx3_interface_inst_2] -add {RAMB18_X0Y80:RAMB18_X0Y99}
resize_pblock [get_pblocks pblock_fx3_interface_inst_2] -add {RAMB36_X0Y40:RAMB36_X0Y49}


#set_property LOC ILOGIC_ [get_cells {usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_wr_reg[ 0]}]
#set_property LOC ILOGIC_ [get_cells {usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_wr_reg[ 1]}]


# set_property LOC ILOGIC_X0Y202 [get_cells {usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_wr_reg[13]}]

#set_property LOC ILOGIC_ [get_cells {usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_wr_reg[14]}]
#set_property LOC ILOGIC_ [get_cells {usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_wr_reg[15]}]
#set_property LOC ILOGIC_ [get_cells {usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_wr_reg[16]}]
#set_property LOC ILOGIC_ [get_cells {usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_wr_reg[17]}]
#set_property LOC ILOGIC_ [get_cells {usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_wr_reg[18]}]
#set_property LOC ILOGIC_ [get_cells {usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_wr_reg[19]}]
#set_property LOC ILOGIC_ [get_cells {usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_wr_reg[20]}]
#set_property LOC ILOGIC_ [get_cells {usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_wr_reg[21]}]
#set_property LOC ILOGIC_ [get_cells {usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_wr_reg[22]}]
#set_property LOC ILOGIC_ [get_cells {usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_wr_reg[23]}]
#set_property LOC ILOGIC_ [get_cells {usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_wr_reg[24]}]
#set_property LOC ILOGIC_ [get_cells {usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_wr_reg[25]}]

#set_property LOC ILOGIC_ [get_cells {usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_wr_reg[26]}]
#set_property LOC ILOGIC_ [get_cells {usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_wr_reg[27]}]
#set_property LOC ILOGIC_ [get_cells {usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_wr_reg[28]}]
#set_property LOC ILOGIC_ [get_cells {usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_wr_reg[29]}]
#set_property LOC ILOGIC_ [get_cells {usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_wr_reg[30]}]
#set_property LOC ILOGIC_ [get_cells {usb_module_estrade_v3_0_inst/fx3_interface_inst/comm_stream_inst/data_wr_reg[31]}]

#set_property BITSTREAM.GENERAL.COMPRESS TRUE  [current_design]
#set_property BITSTREAM.CONFIG.CONFIGRATE 33     [current_design]
set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR NO [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 1    [current_design] 
set_property CONFIG_MODE SPIx1                  [current_design]

set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
##connect_debug_port dbg_hub/clk [get_nets clk_adc]
