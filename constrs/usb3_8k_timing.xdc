
create_clock -period 8.000 -name IPAD_CLK_FPGA_P -waveform {0.000 4.000} [get_ports IPAD_CLK_FPGA_P]
create_clock -period 10.000 -name IPAD_SYSREFCLK_P -waveform {0.000 5.000} [get_ports IPAD_SYSREFCLK_P]

create_clock -period 10.000 -name USB_CLK -waveform {0.000 5.000} [get_pins clk_usb_inst/BUFG_OUT0/O]
create_clock -period 8.000 -name ADC_CLK -waveform {0.000 4.000} [get_pins clk_ext_inst/BUFG_OUT/O]

set_false_path -from [get_clocks USB_CLK] -to [get_clocks ADC_CLK]
set_false_path -from [get_clocks ADC_CLK] -to [get_clocks USB_CLK]

#set_property ASYNC_REG true [get_cells ad9783_dacs_phy_iq_v3_0_inst/rst_sync_inst/pos_act_edge_rstn.rff1_reg]
#set_property ASYNC_REG true [get_cells ad9783_dacs_phy_iq_v3_0_inst/rst_sync_inst/pos_act_edge_rstn.rff2_reg]
#set_max_delay -from [get_cells ad9783_dacs_phy_iq_v3_0_inst/rst_sync_inst/pos_act_edge_rstn.rff1_reg] -to [get_cells ad9783_dacs_phy_iq_v3_0_inst/rst_sync_inst/pos_act_edge_rstn.rff2_reg] 2.000
#set_false_path -to [get_cells ad9783_dacs_phy_iq_v3_0_inst/rst_sync_inst/pos_act_edge_rstn.rff1_reg]
#set_false_path -to [get_cells ad9783_dacs_phy_iq_v3_0_inst/rst_sync_inst/pos_act_edge_rstn.rff2_reg]

#set_max_delay -from [get_ports IPAD_ADC0_DCLK_P] -to [get_pins adctoplevel_toplevel_inst/AD9253INT_0/CLKISRD/D] 3.000
#set_max_delay -from [get_ports IPAD_ADC0_DCLK_P] -to [get_pins adctoplevel_toplevel_inst/AD9253INT_0/CLKISRD/D] 3.000

set_false_path -from [get_clocks -of_objects [get_pins clk_ext_inst/MMCM_BASE_inst/CLKOUT0]] -to [get_clocks -of_objects [get_pins clk_usb_inst/MMCM_BASE_inst/CLKOUT0]]

#############################################################################################
# ADC Timing constraints
#############################################################################################
# The DCLK input clock, bit clock from the ADC, doesn't need a timespec.
# This clock passes from the IOB through the BUFIO and to the .CLK input of all used ISERDES.
# This path is made from dedicated routing.
#   From the IOB to the BUFIO.I is a dedicated connection only availabel with Clock Capable_IO.
#   This connection takes for all IO-banks in a FPGA and from all FPGAs of the familly an
#   average value of 220 ps.
#   The connection from the BUFIO.O to all ISERDES.CLK is also a dedicated connection, it
#   takes on average 330 ps.
#   The BUFIO average delay is: 869 ps and an LVDS IOB is average: 1094 ps.
# A MAXSKEW constraint is used to detect the skew on the CLK net.

#NET "adc/AD9253INT_1/clk_IO" MAXSKEW = 100 ps;
#NET "adc/AD9253INT_0/clk_IO" MAXSKEW = 100 ps;

# The connection from the BUFR.O to the ISERDES.CLKDIV inputs runs over normal clock nets.
#   Oposite to the BUFIO.O - ISERDES.CLK routing, the BUFR.O net not only connects to the
#   ISERDES.CLKDIV pins of the I/O SERDES in the IO-bank the BUFR is located in but to all
#   clocked elements (FFs, BRAM, DSP, ..) in that clock area.
#   It also connects to the adjacent upper and lower clock areas.
#   Therefore it is necessary to put timing constraints on this clock.
# A MAXSKEW constraint to keep the skew as low as possible. makes sure the ISERDES are clocked
# at the same time so that early-late data cannot appear at the outputs of the ISERDES.

#NET "adc/AD9253INT_1/clk_DIV" MAXSKEW = 300 ps;
#NET "adc/AD9253INT_0/clk_DIV" MAXSKEW = 300 ps;

# A period constraint at the BUFR will make sure the correct timing is applied on clock net.

#NET "*AD9253INT_*/clk_DIV" TNM_NET = "BitClkRefClk";
#TIMESPEC TS_ClkDiv = PERIOD "BitClkRefClk" 125 MHz HIGH 50 %;

create_clock -period 8.000 -name AD9253INT_0_clk_DIV -waveform {0.000 4.000} [get_nets adctoplevel_toplevel_inst/AD9253INT_0/clk_DIV]
create_clock -period 8.000 -name AD9253INT_1_clk_DIV -waveform {0.000 4.000} [get_nets adctoplevel_toplevel_inst/AD9253INT_1/clk_DIV]

set_false_path -from [get_clocks AD9253INT_0_clk_DIV] -to [get_clocks clkout0_1]
set_false_path -from [get_clocks AD9253INT_1_clk_DIV] -to [get_clocks clkout0_1]

#create_clock -period 2.000 -name IPAD_ADC0_DCLK_P -waveform {0.000 1.000} [get_ports IPAD_ADC0_DCLK_P]
#create_clock -period 2.000 -name IPAD_ADC1_DCLK_P -waveform {0.000 1.000} [get_ports IPAD_ADC1_DCLK_P]

create_clock -period 2.000 -name IPAD_ADC0_FCLK_P -waveform {0.000 1.000} [get_ports IPAD_ADC0_FCLK_P]
create_clock -period 2.000 -name IPAD_ADC1_FCLK_P -waveform {0.000 1.000} [get_ports IPAD_ADC1_FCLK_P]

#set_false_path -from [get_clocks AD9253INT_1_clk_DIV] -to [get_clocks -of_objects [get_pins clk_usb_inst/MMCM_BASE_inst/CLKOUT0]]

#################################################################################
## ADC Grouping of components.
#################################################################################
## The logic of the interface is timing constraint with FROM-TO constraints.
## The logic is first grouped per functionality and the constraints are applied.

#INST "*AD9253INT_*/CLKISRD" TNM =  FFS "CLKISRD_Isrds";
#INST "*AD9253INT_*/FRISRD" TNM =  FFS "FRISRD_Isrds";
#INST "*AD9253INT_*/D0AISRD" TNM =  FFS "D0AISRD_Isrds";
#INST "*AD9253INT_*/D1AISRD" TNM =  FFS "D1AISRD_Isrds";
#INST "*AD9253INT_*/D0BISRD" TNM =  FFS "D0BISRD_Isrds";
#INST "*AD9253INT_*/D1BISRD" TNM =  FFS "D1BISRD_Isrds";
#INST "*AD9253INT_*/D0CISRD" TNM =  FFS "D0CISRD_Isrds";
#INST "*AD9253INT_*/D1CISRD" TNM =  FFS "D1CISRD_Isrds";
#INST "*AD9253INT_*/D0DISRD" TNM =  FFS "D0DISRD_Isrds";
#INST "*AD9253INT_*/D1DISRD" TNM =  FFS "D1DISRD_Isrds";
#TIMEGRP AdcClk_Isrds =  "CLKISRD_Isrds" "FRISRD_Isrds" "D0AISRD_Isrds" "D1AISRD_Isrds" "D0BISRD_Isrds" "D1BISRD_Isrds" "D0CISRD_Isrds" "D1CISRD_Isrds" "D0DISRD_Isrds" "D1DISRD_Isrds";
#INST "*AD9253INT_*/*" TNM =  FFS "AdcClk_Ffs";

################################################################################
# Timespec between ADC groups
################################################################################
#TIMESPEC TS_ClkIsrds_ClkFfs = FROM "AdcClk_Isrds" TO "AdcClk_Ffs" 3 ns


