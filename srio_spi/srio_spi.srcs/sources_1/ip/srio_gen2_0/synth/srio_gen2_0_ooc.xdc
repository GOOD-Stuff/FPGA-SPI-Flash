#-----------------------------------------------------------------------------
#
# File name:    srio_gen2_0_ooc.xdc
# Rev:          4.0
# Description:  Constrains the core for out-of-context implementation
#
#-----------------------------------------------------------------------------

        create_clock -period 6.4 -name sys_clkp [get_ports sys_clkp]

    set_case_analysis 0 [list [get_pins -hierarchical *mode_1x]]



