
create_clock -period 9.524 -name ADC_CLK -waveform {0.000 4.762} [get_pins clk_adc_inst/BUFG_OUT_0/O]
create_clock -period 2.381 -name ADC_CLK_X4 -waveform {0.000 1.190} [get_pins clk_adc_inst/BUFG_OUT_1/O]

create_clock -period 3.333 -name ADC_DCO -waveform {0.000 1.667} [get_ports ADC_DCO_P]
create_clock -period 3.200 -name CLK_300 -waveform {0.000 1.600} [get_ports CLK_300_P]
create_clock -period 3.200 -name GTREFCLK -waveform {0.000 1.600} [get_ports GTREFCLK_P]
create_clock -period 3.200 -name REFCLK_300 -waveform {0.000 1.600} [get_ports REFCLK_300_P]
create_clock -period 10.000 -name cfgmclk -waveform {0.000 5.000} [get_pins STARTUPE3_inst/CFGMCLK]

set_false_path -from [get_clocks CLK_300] -to [get_ports {LED[0]}]
set_false_path -from [get_clocks REFCLK_300] -to [get_ports {LED[1]}]

set_false_path -from [get_clocks ADC_DCO] -to [get_clocks ADC_CLK]
set_false_path -from [get_clocks CLK_300] -to [get_clocks ADC_CLK]
set_false_path -from [get_clocks REFCLK_300] -to [get_clocks ADC_CLK]
set_false_path -from [get_clocks ADC_CLK] -to [get_clocks ADC_CLK_X4]
set_false_path -from [get_clocks CLK_300] -to [get_clocks ADC_CLK_X4]
set_false_path -from [get_clocks -of_objects [get_pins c2c_wrapper_inst/aurora_64b66b_c2c_wrapper_inst/aurora_64b66b_226_0_inst/inst/clock_module_i/ultrascale_tx_userclk_1/gen_gtwiz_userclk_tx_main.bufg_gt_usrclk2_inst/O]] -to [get_clocks ADC_CLK_X4]
set_false_path -from [get_clocks -of_objects [get_pins c2c_wrapper_inst/aurora_64b66b_c2c_wrapper_inst/aurora_64b66b_227_0_inst/inst/clock_module_i/ultrascale_tx_userclk_1/gen_gtwiz_userclk_tx_main.bufg_gt_usrclk2_inst/O]] -to [get_clocks ADC_CLK_X4]
set_false_path -from [get_clocks -of_objects [get_pins {c2bkpln_wrapper_inst/aurora_8b10b_fr_bckpln_wrapper_inst/aurora_8b10b_bckpln_inst/U0/aurora_8b10b_bckpln_core_i/gt_wrapper_i/aurora_8b10b_bckpln_gt_i/inst/gen_gtwizard_gthe3_top.aurora_8b10b_bckpln_gt_gtwizard_gthe3_inst/gen_gtwizard_gthe3.gen_channel_container[1].gen_enabled_channel.gthe3_channel_wrapper_inst/channel_inst/gthe3_channel_gen.gen_gthe3_channel_inst[0].GTHE3_CHANNEL_PRIM_INST/TXOUTCLK}]] -to [get_clocks ADC_CLK_X4]
set_false_path -from [get_clocks -of_objects [get_pins c2c_wrapper_inst/aurora_64b66b_c2c_wrapper_inst/aurora_64b66b_226_0_inst/inst/clock_module_i/ultrascale_tx_userclk_1/gen_gtwiz_userclk_tx_main.bufg_gt_usrclk2_inst/O]] -to [get_clocks CLK_300]
set_false_path -from [get_clocks -of_objects [get_pins c2c_wrapper_inst/aurora_64b66b_c2c_wrapper_inst/aurora_64b66b_227_0_inst/inst/clock_module_i/ultrascale_tx_userclk_1/gen_gtwiz_userclk_tx_main.bufg_gt_usrclk2_inst/O]] -to [get_clocks CLK_300]
set_false_path -from [get_clocks -of_objects [get_pins {c2bkpln_wrapper_inst/aurora_8b10b_fr_bckpln_wrapper_inst/aurora_8b10b_bckpln_inst/U0/aurora_8b10b_bckpln_core_i/gt_wrapper_i/aurora_8b10b_bckpln_gt_i/inst/gen_gtwizard_gthe3_top.aurora_8b10b_bckpln_gt_gtwizard_gthe3_inst/gen_gtwizard_gthe3.gen_channel_container[1].gen_enabled_channel.gthe3_channel_wrapper_inst/channel_inst/gthe3_channel_gen.gen_gthe3_channel_inst[0].GTHE3_CHANNEL_PRIM_INST/TXOUTCLK}]] -to [get_clocks CLK_300]
set_false_path -from [get_clocks CLK_300] -to [get_clocks -of_objects [get_pins BUFGCE_DIV_inst/O]]
set_false_path -from [get_clocks ADC_CLK_X4] -to [get_clocks -of_objects [get_pins c2c_wrapper_inst/aurora_64b66b_c2c_wrapper_inst/aurora_64b66b_226_0_inst/inst/clock_module_i/ultrascale_tx_userclk_1/gen_gtwiz_userclk_tx_main.bufg_gt_usrclk2_inst/O]]
set_false_path -from [get_clocks ADC_CLK_X4] -to [get_clocks -of_objects [get_pins c2c_wrapper_inst/aurora_64b66b_c2c_wrapper_inst/aurora_64b66b_227_0_inst/inst/clock_module_i/ultrascale_tx_userclk_1/gen_gtwiz_userclk_tx_main.bufg_gt_usrclk2_inst/O]]
set_false_path -from [get_clocks CLK_300] -to [get_clocks -of_objects [get_pins c2c_wrapper_inst/aurora_64b66b_c2c_wrapper_inst/aurora_64b66b_227_0_inst/inst/clock_module_i/ultrascale_tx_userclk_1/gen_gtwiz_userclk_tx_main.bufg_gt_usrclk2_inst/O]]
set_false_path -from [get_clocks ADC_CLK_X4] -to [get_clocks -of_objects [get_pins {c2bkpln_wrapper_inst/aurora_8b10b_fr_bckpln_wrapper_inst/aurora_8b10b_bckpln_inst/U0/aurora_8b10b_bckpln_core_i/gt_wrapper_i/aurora_8b10b_bckpln_gt_i/inst/gen_gtwizard_gthe3_top.aurora_8b10b_bckpln_gt_gtwizard_gthe3_inst/gen_gtwizard_gthe3.gen_channel_container[1].gen_enabled_channel.gthe3_channel_wrapper_inst/channel_inst/gthe3_channel_gen.gen_gthe3_channel_inst[0].GTHE3_CHANNEL_PRIM_INST/TXOUTCLK}]]
set_false_path -from [get_clocks CLK_300] -to [get_clocks -of_objects [get_pins {c2bkpln_wrapper_inst/aurora_8b10b_fr_bckpln_wrapper_inst/aurora_8b10b_bckpln_inst/U0/aurora_8b10b_bckpln_core_i/gt_wrapper_i/aurora_8b10b_bckpln_gt_i/inst/gen_gtwizard_gthe3_top.aurora_8b10b_bckpln_gt_gtwizard_gthe3_inst/gen_gtwizard_gthe3.gen_channel_container[1].gen_enabled_channel.gthe3_channel_wrapper_inst/channel_inst/gthe3_channel_gen.gen_gthe3_channel_inst[0].GTHE3_CHANNEL_PRIM_INST/TXOUTCLK}]]
set_false_path -from [get_clocks ADC_CLK] -to [get_clocks REFCLK_300]


set_input_delay -clock CLK_300 -min 4.500 [get_ports {RS[*]}]
set_input_delay -clock CLK_300 -max 4.800 [get_ports {RS[*]}]

set_input_delay -clock CLK_300 -min 4.500 [get_ports {GA[*]}]
set_input_delay -clock CLK_300 -max 4.800 [get_ports {GA[*]}]

set_output_delay -clock CLK_300 -min -1.100 [get_ports {LED[0]}]
set_output_delay -clock CLK_300 -max -1.200 [get_ports {LED[0]}]

set_output_delay -clock REFCLK_300 -min -1.100 [get_ports {LED[1]}]
set_output_delay -clock REFCLK_300 -max -1.200 [get_ports {LED[1]}]

set_output_delay -clock REFCLK_300 -min 4.500 [get_ports ADC_CSB]
set_output_delay -clock REFCLK_300 -max 4.800 [get_ports ADC_CSB]

set_output_delay -clock REFCLK_300 -min 4.500 [get_ports ADC_SCLK]
set_output_delay -clock REFCLK_300 -max 4.800 [get_ports ADC_SCLK]

set_output_delay -clock REFCLK_300 -min 4.500 [get_ports ADC_SDIO]
set_output_delay -clock REFCLK_300 -max 4.800 [get_ports ADC_SDIO]



