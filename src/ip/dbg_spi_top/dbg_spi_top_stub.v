// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Fri Jun 15 17:27:19 2018
// Host        : vldmr-PC running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               C:/Projects/mrdk_40g_a/mrdk_40g_a/mrdk_40g_a.srcs/sources_1/ip/dbg_spi_top/dbg_spi_top_stub.v
// Design      : dbg_spi_top
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku9p-ffve900-1-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "ila,Vivado 2018.1" *)
module dbg_spi_top(clk, probe0, probe1, probe2, probe3, probe4, probe5, 
  probe6, probe7, probe8, probe9)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[0:0],probe1[0:0],probe2[0:0],probe3[0:0],probe4[7:0],probe5[58:0],probe6[0:0],probe7[7:0],probe8[7:0],probe9[0:0]" */;
  input clk;
  input [0:0]probe0;
  input [0:0]probe1;
  input [0:0]probe2;
  input [0:0]probe3;
  input [7:0]probe4;
  input [58:0]probe5;
  input [0:0]probe6;
  input [7:0]probe7;
  input [7:0]probe8;
  input [0:0]probe9;
endmodule
