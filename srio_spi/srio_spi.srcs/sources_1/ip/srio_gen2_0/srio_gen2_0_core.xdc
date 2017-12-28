#-----------------------------------------------------------------------------
#
# File name:    srio_gen2_0_core.xdc
# Description:  Includes core constraints 
#
#-----------------------------------------------------------------------------
######################################
#         Core Constraints           #
######################################


set_case_analysis 0 [list [get_pins -hierarchical *mode_1x]] 

set_false_path -to [get_cells -hierarchical -filter {NAME =~ *srio_rst*inst*/*reg[0]}]
set_false_path -to [get_cells -hierarchical -filter {NAME =~ *gt_decode_error_phy_clk_stg1_reg}]



set_false_path -to [get_cells -hierarchical -filter {NAME =~ *data_sync_reg1}]
set_false_path -to [get_cells -hierarchical -filter {NAME =~ *ack_sync_reg1}]
