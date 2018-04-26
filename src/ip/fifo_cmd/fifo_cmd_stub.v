// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4.1 (win64) Build 2117270 Tue Jan 30 15:32:00 MST 2018
// Date        : Thu Apr 19 13:50:56 2018
// Host        : vldmr-PC running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               C:/Projects/mrdk_adc_ab/mrdk_adc_ab/mrdk_adc_ab.srcs/sources_1/misc/cmd/ip/fifo_cmd/fifo_cmd_stub.v
// Design      : fifo_cmd
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku035-fbva676-1-c
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_2_1,Vivado 2017.4.1" *)
module fifo_cmd(srst, wr_clk, rd_clk, din, wr_en, rd_en, dout, full, 
  empty, prog_full, prog_empty, wr_rst_busy, rd_rst_busy)
/* synthesis syn_black_box black_box_pad_pin="srst,wr_clk,rd_clk,din[59:0],wr_en,rd_en,dout[59:0],full,empty,prog_full,prog_empty,wr_rst_busy,rd_rst_busy" */;
  input srst;
  input wr_clk;
  input rd_clk;
  input [59:0]din;
  input wr_en;
  input rd_en;
  output [59:0]dout;
  output full;
  output empty;
  output prog_full;
  output prog_empty;
  output wr_rst_busy;
  output rd_rst_busy;
endmodule
