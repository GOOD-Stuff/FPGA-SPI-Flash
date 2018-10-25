#set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]

#create_pblock pblock_AdcTplvl_Tplvl_inst
#add_cells_to_pblock [get_pblocks pblock_AdcTplvl_Tplvl_inst] [get_cells -quiet [list AdcToplevel_Toplevel_inst]]
#resize_pblock [get_pblocks pblock_AdcTplvl_Tplvl_inst] -add {SLICE_X98Y55:SLICE_X109Y95}
#resize_pblock [get_pblocks pblock_AdcTplvl_Tplvl_inst] -add {RAMB18_X6Y22:RAMB18_X6Y37}
#resize_pblock [get_pblocks pblock_AdcTplvl_Tplvl_inst] -add {RAMB36_X6Y11:RAMB36_X6Y18}

#create_pblock pblock_filter_rx_ir_inst
#add_cells_to_pblock [get_pblocks pblock_filter_rx_ir_inst] [get_cells -quiet [list receiver_inst/filter_rx_ir_gen.filter_rx_ir_inst]]
#resize_pblock [get_pblocks pblock_filter_rx_ir_inst] -add {SLICE_X56Y0:SLICE_X109Y105}
#resize_pblock [get_pblocks pblock_filter_rx_ir_inst] -add {DSP48_X3Y0:DSP48_X5Y41}
#resize_pblock [get_pblocks pblock_filter_rx_ir_inst] -add {RAMB18_X3Y0:RAMB18_X6Y41}
#resize_pblock [get_pblocks pblock_filter_rx_ir_inst] -add {RAMB36_X3Y0:RAMB36_X6Y20}

#create_pblock pblock_filter_rx_im4_inst
#add_cells_to_pblock [get_pblocks pblock_filter_rx_im4_inst] [get_cells -quiet [list receiver_inst/filter_rx_im4_gen.filter_rx_im4_inst]]
#resize_pblock [get_pblocks pblock_filter_rx_im4_inst] -add {SLICE_X56Y0:SLICE_X109Y105}
#resize_pblock [get_pblocks pblock_filter_rx_im4_inst] -add {DSP48_X3Y0:DSP48_X5Y41}
#resize_pblock [get_pblocks pblock_filter_rx_im4_inst] -add {RAMB18_X3Y0:RAMB18_X6Y41}
#resize_pblock [get_pblocks pblock_filter_rx_im4_inst] -add {RAMB36_X3Y0:RAMB36_X6Y20}

#create_pblock pblock_filter_rx_th_inst
#add_cells_to_pblock [get_pblocks pblock_filter_rx_th_inst] [get_cells -quiet [list receiver_inst/filter_rx_th_gen.filter_rx_th_inst]]
#resize_pblock [get_pblocks pblock_filter_rx_th_inst] -add {SLICE_X56Y0:SLICE_X109Y105}
#resize_pblock [get_pblocks pblock_filter_rx_th_inst] -add {DSP48_X3Y0:DSP48_X5Y41}
#resize_pblock [get_pblocks pblock_filter_rx_th_inst] -add {RAMB18_X3Y0:RAMB18_X6Y41}
#resize_pblock [get_pblocks pblock_filter_rx_th_inst] -add {RAMB36_X3Y0:RAMB36_X6Y20}

set_property BITSTREAM.CONFIG.CONFIGRATE 33      [current_design]
set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR YES [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 1     [current_design] 
set_property CONFIG_MODE SPIx1                   [current_design]
