//
// (c) Copyright 2010 - 2014 Xilinx, Inc. All rights reserved.
//
//                                                                 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// 	PART OF THIS FILE AT ALL TIMES.                                

`default_nettype wire

`timescale 1ns / 1ps
`define DLY #1
(* DowngradeIPIdentifiedWarnings = "yes" *)

//***************************** Entity Declaration ****************************

module srio_gen2_0_k7_v7_gtxe2_common
#(
    // Simulation attributes
    parameter   WRAPPER_SIM_GTRESET_SPEEDUP    =   "TRUE",     // Set to "true" to speed up sim reset
    parameter   RX_DFE_KL_CFG2_IN              =   32'h3010D90C,
    parameter   PMA_RSV_IN                     =   32'h00018480,
    parameter   SIM_VERSION                    =   "4.0"
)
(
        input   gt0_gtrefclk0_common_in , // connect to refclk
        input   gt0_qplllockdetclk_in   , // connect to drpclk
        input   gt0_qpllreset_in        , // connect to gt_pcs_rst
        output  qpll_clk_out            ,
        output  qpll_out_refclk_out     ,
        output  gt0_qpll_lock_out         // use only when 2x or 4x or 6g
);   //_________________________________________________________________________
   //_________________________________________________________________________
   //_________________________GTXE2_COMMON____________________________________
    // ground and vcc signals

                                 // 8/23/2013
    parameter QPLL_FBDIV_TOP =  40;






    parameter QPLL_FBDIV_IN  =  (QPLL_FBDIV_TOP == 16)  ? 10'b0000100000 :
                                (QPLL_FBDIV_TOP == 20)  ? 10'b0000110000 :
                                (QPLL_FBDIV_TOP == 32)  ? 10'b0001100000 :
                                (QPLL_FBDIV_TOP == 40)  ? 10'b0010000000 :
                                (QPLL_FBDIV_TOP == 64)  ? 10'b0011100000 :
                                (QPLL_FBDIV_TOP == 66)  ? 10'b0101000000 :
                                (QPLL_FBDIV_TOP == 80)  ? 10'b0100100000 :
                                (QPLL_FBDIV_TOP == 100) ? 10'b0101110000 : 10'b0000000000;

   parameter QPLL_FBDIV_RATIO = (QPLL_FBDIV_TOP == 16)  ? 1'b1 :
                                (QPLL_FBDIV_TOP == 20)  ? 1'b1 :
                                (QPLL_FBDIV_TOP == 32)  ? 1'b1 :
                                (QPLL_FBDIV_TOP == 40)  ? 1'b1 :
                                (QPLL_FBDIV_TOP == 64)  ? 1'b1 :
                                (QPLL_FBDIV_TOP == 66)  ? 1'b0 :
                                (QPLL_FBDIV_TOP == 80)  ? 1'b1 :
                                (QPLL_FBDIV_TOP == 100) ? 1'b1 : 1'b1;

    wire            tied_to_ground_i;
    wire    [63:0]  tied_to_ground_vec_i;
    wire            tied_to_vcc_i;
    wire    [63:0]  tied_to_vcc_vec_i;

    assign tied_to_ground_i             = 1'b0;
    assign tied_to_ground_vec_i         = 64'h0000000000000000;
    assign tied_to_vcc_i                = 1'b1;
    assign tied_to_vcc_vec_i            = 64'hffffffffffffffff;

   GTXE2_COMMON #
   (
           // Simulation attributes
           .SIM_RESET_SPEEDUP   (WRAPPER_SIM_GTRESET_SPEEDUP),
           .SIM_QPLLREFCLK_SEL  (3'b001),
           .SIM_VERSION         (SIM_VERSION),


          //----------------COMMON BLOCK Attributes---------------
           .BIAS_CFG                               (64'h0000040000001000),
           .COMMON_CFG                             (32'h00000000),

           .QPLL_CFG                               (27'h06801C1),
           .QPLL_CLKOUT_CFG                        (4'b0000),
           .QPLL_COARSE_FREQ_OVRD                  (6'b010000),
           .QPLL_COARSE_FREQ_OVRD_EN               (1'b0),
           .QPLL_CP                                (10'b0000011111),
           .QPLL_CP_MONITOR_EN                     (1'b0),
           .QPLL_DMONITOR_SEL                      (1'b0),
           .QPLL_FBDIV                             (QPLL_FBDIV_IN),
           .QPLL_FBDIV_MONITOR_EN                  (1'b0),
           .QPLL_FBDIV_RATIO                       (QPLL_FBDIV_RATIO),
           .QPLL_INIT_CFG                          (24'h000006),
           .QPLL_LOCK_CFG                          (16'h21E8),
           .QPLL_LPF                               (4'b1111),
           .QPLL_REFCLK_DIV                        (1)

   )
   gtxe2_common_0_i
   (
       //----------- Common Block  - Dynamic Reconfiguration Port (DRP) -----------
       .DRPADDR                        (tied_to_ground_vec_i[7:0]),
       .DRPCLK                         (tied_to_ground_i),
       .DRPDI                          (tied_to_ground_vec_i[15:0]),
       .DRPDO                          (),
       .DRPEN                          (tied_to_ground_i),
       .DRPRDY                         (),
       .DRPWE                          (tied_to_ground_i),
       //-------------------- Common Block  - Ref Clock Ports ---------------------
       .GTGREFCLK                      (tied_to_ground_i),
       .GTNORTHREFCLK0                 (tied_to_ground_i),
       .GTNORTHREFCLK1                 (tied_to_ground_i),
       .GTREFCLK0                      (gt0_gtrefclk0_common_in),
       .GTREFCLK1                      (tied_to_ground_i),
       .GTSOUTHREFCLK0                 (tied_to_ground_i),
       .GTSOUTHREFCLK1                 (tied_to_ground_i),
       //----------------------- Common Block -  QPLL Ports -----------------------
       .QPLLDMONITOR                   (),
       //--------------------- Common Block - Clocking Ports ----------------------
       .QPLLOUTCLK                     (qpll_clk_out),
       .QPLLOUTREFCLK                  (qpll_out_refclk_out),
       .REFCLKOUTMONITOR               (),
       //----------------------- Common Block - QPLL Ports ------------------------
       .QPLLFBCLKLOST                  (),
       .QPLLLOCK                       (gt0_qpll_lock_out),
       .QPLLLOCKDETCLK                 (gt0_qplllockdetclk_in),
       .QPLLLOCKEN                     (tied_to_vcc_i),
       .QPLLOUTRESET                   (tied_to_ground_i),
       .QPLLPD                         (tied_to_vcc_i),
       .QPLLREFCLKLOST                 (),
       .QPLLREFCLKSEL                  (3'b001),
       .QPLLRESET                      (gt0_qpllreset_in),
       .QPLLRSVD1                      (16'b0000000000000000),
       .QPLLRSVD2                      (5'b11111),
       //------------------------------- QPLL Ports -------------------------------
       .BGBYPASSB                      (tied_to_vcc_i),
       .BGMONITORENB                   (tied_to_vcc_i),
       .BGPDB                          (tied_to_vcc_i),
       .BGRCALOVRD                     (5'b00000),
       .PMARSVD                        (8'b00000000),
       .RCALENB                        (tied_to_vcc_i)

   );




endmodule
