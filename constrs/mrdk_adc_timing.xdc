
create_clock -period 9.524 -name ADC_CLK -waveform {0.000 4.762} [get_pins clk_adc_inst/BUFG_OUT_0/O]
create_clock -period 2.381 -name ADC_CLK_X4 -waveform {0.000 1.190} [get_pins clk_adc_inst/BUFG_OUT_1/O]

create_clock -period 3.200 -name CLK_300 -waveform {0.000 1.600} [get_ports CLK_300_P]
create_clock -period 3.200 -name REFCLK_300 -waveform {0.000 1.600} [get_ports REFCLK_300_P]
create_clock -period 10.000 -name cfgmclk -waveform {0.000 5.000} [get_pins STARTUPE3_inst/CFGMCLK]

set_false_path -from [get_clocks CLK_300] -to [get_ports {LED[0]}]
set_false_path -from [get_clocks REFCLK_300] -to [get_ports {LED[1]}]

set_false_path -from [get_clocks ADC_CLK] -to [get_clocks REFCLK_300]


set_input_delay -clock CLK_300 -min 4.500 [get_ports {RS[*]}]
set_input_delay -clock CLK_300 -max 4.800 [get_ports {RS[*]}]

set_input_delay -clock CLK_300 -min 4.500 [get_ports {GA[*]}]
set_input_delay -clock CLK_300 -max 4.800 [get_ports {GA[*]}]

set_output_delay -clock CLK_300 -min -1.100 [get_ports {LED[0]}]
set_output_delay -clock CLK_300 -max -1.200 [get_ports {LED[0]}]

set_output_delay -clock REFCLK_300 -min -1.100 [get_ports {LED[1]}]
set_output_delay -clock REFCLK_300 -max -1.200 [get_ports {LED[1]}]



