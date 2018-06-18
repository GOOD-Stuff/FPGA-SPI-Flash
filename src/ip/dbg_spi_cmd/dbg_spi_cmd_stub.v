// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Sat Jun  9 14:56:13 2018
// Host        : vldmr-PC running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               c:/Projects/mrdk_40g_a/mrdk_40g_a/mrdk_40g_a.srcs/sources_1/ip/dbg_spi_cmd/dbg_spi_cmd_stub.v
// Design      : dbg_spi_cmd
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku9p-ffve900-1-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "ila,Vivado 2018.1" *)
module dbg_spi_cmd(clk, probe0, probe1, probe2, probe3, probe4, probe5, 
  probe6, probe7, probe8, probe9, probe10, probe11, probe12, probe13, probe14, probe15, probe16, probe17, 
  probe18, probe19)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[3:0],probe1[3:0],probe2[31:0],probe3[15:0],probe4[7:0],probe5[0:0],probe6[2:0],probe7[0:0],probe8[0:0],probe9[0:0],probe10[0:0],probe11[0:0],probe12[7:0],probe13[0:0],probe14[0:0],probe15[0:0],probe16[0:0],probe17[15:0],probe18[59:0],probe19[0:0]" */;
  input clk;
  input [3:0]probe0;
  input [3:0]probe1;
  input [31:0]probe2;
  input [15:0]probe3;
  input [7:0]probe4;
  input [0:0]probe5;
  input [2:0]probe6;
  input [0:0]probe7;
  input [0:0]probe8;
  input [0:0]probe9;
  input [0:0]probe10;
  input [0:0]probe11;
  input [7:0]probe12;
  input [0:0]probe13;
  input [0:0]probe14;
  input [0:0]probe15;
  input [0:0]probe16;
  input [15:0]probe17;
  input [59:0]probe18;
  input [0:0]probe19;
endmodule
