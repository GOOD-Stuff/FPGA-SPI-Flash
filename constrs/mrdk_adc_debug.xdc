create_pblock pblock_ad9653_int_inst
resize_pblock [get_pblocks pblock_ad9653_int_inst] -add {CLOCKREGION_X0Y0:CLOCKREGION_X1Y1}

set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_300_BUFG]
