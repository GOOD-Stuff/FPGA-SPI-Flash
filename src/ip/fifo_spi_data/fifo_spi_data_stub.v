// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.3 (win64) Build 1682563 Mon Oct 10 19:07:27 MDT 2016
// Date        : Sat Feb 17 14:36:04 2018
// Host        : PC4719 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub -rename_top fifo_spi_data -prefix
//               fifo_spi_data_ fifo_spi_data_stub.v
// Design      : fifo_spi_data
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k160tffg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_1_2,Vivado 2016.3" *)
module fifo_spi_data(wr_clk, rd_clk, din, wr_en, rd_en, dout, full, 
  almost_full, empty, almost_empty, prog_full, prog_empty)
/* synthesis syn_black_box black_box_pad_pin="wr_clk,rd_clk,din[31:0],wr_en,rd_en,dout[7:0],full,almost_full,empty,almost_empty,prog_full,prog_empty" */;
  input wr_clk;
  input rd_clk;
  input [31:0]din;
  input wr_en;
  input rd_en;
  output [7:0]dout;
  output full;
  output almost_full;
  output empty;
  output almost_empty;
  output prog_full;
  output prog_empty;
endmodule
