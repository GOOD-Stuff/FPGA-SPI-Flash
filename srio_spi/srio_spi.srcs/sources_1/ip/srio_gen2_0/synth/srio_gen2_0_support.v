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
`timescale 1ps/1ps
(* DowngradeIPIdentifiedWarnings = "yes" *)
   // port/parameter declarations in support file ----------------

  module srio_gen2_0_support

  #(
   // Parameter declarations -----------
    parameter TCQ                       = 100, // in pS
    parameter LINK_WIDTH                = 2,
    parameter C_LINK_WIDTH              = 2
   )

   (
  // port declarations ----------------
    // Clocks and Resets
    input             sys_clkp  ,                // System reference clock
    input             sys_clkn  ,                // MMCM reference clock
    input             sys_rst   ,                // Global reset signal

    // all clocks as output
    output            log_clk_out   ,                // LOG interface clock
    output            phy_clk_out   ,                // PHY interface clock
    output            gt_clk_out    ,
    output            gt_pcs_clk_out,                // GT fabric interface clock
    output            drpclk_out    ,
    output            refclk_out    ,

    output            clk_lock_out  ,
    // all resets as output
    output            log_rst_out   ,                // Reset for LOG clock Domain
    output            phy_rst_out   ,                // Reset for PHY clock Domain
    output            buf_rst_out   ,
    output            cfg_rst_out   ,
    output            gt_pcs_rst_out,
    // QPLL outputs
    output            gt0_qpll_clk_out       ,
    output            gt0_qpll_out_refclk_out,




//---------------------------------------------------------------
    input             s_axi_maintr_rst,              // Reset for maintr interface, on LOG clk domain

    // high-speed IO
    input             srio_rxn0,               // Serial Receive Data
    input             srio_rxp0,               // Serial Receive Data
    input             srio_rxn1,               // Serial Receive Data
    input             srio_rxp1,               // Serial Receive Data

    output            srio_txn0,               // Serial Transmit Data
    output            srio_txp0,               // Serial Transmit Data
    output            srio_txn1,               // Serial Transmit Data
    output            srio_txp1,               // Serial Transmit Data

    // I/O Port
    input             s_axis_iotx_tvalid,             // Indicates Valid Input on the Request Channel
    output            s_axis_iotx_tready,             // Beat has been accepted
    input             s_axis_iotx_tlast,              // Indicates last beat
    input  [63:0]     s_axis_iotx_tdata,              // Req Data Bus
    input  [7:0]      s_axis_iotx_tkeep,              // Req Keep Bus
    input  [31:0]     s_axis_iotx_tuser,              // Req User Bus

    output            m_axis_iorx_tvalid,             // Indicates Valid Output on the Response Channel
    input             m_axis_iorx_tready,             // Beat has been accepted
    output            m_axis_iorx_tlast,              // Indicates last beat
    output  [63:0]    m_axis_iorx_tdata,              // Resp Data Bus
    output  [7:0]     m_axis_iorx_tkeep,              // Resp Keep Bus
    output  [31:0]    m_axis_iorx_tuser,              // Resp User Bus

    // Maintenance Port
    input             s_axi_maintr_awvalid,          // Write Command Valid
    output            s_axi_maintr_awready,          // Write Port Ready
    input  [31:0]     s_axi_maintr_awaddr,           // Write Address
    input             s_axi_maintr_wvalid,           // Write Data Valid
    output            s_axi_maintr_wready,           // Write Port Ready
    input  [31:0]     s_axi_maintr_wdata,            // Write Data
    output            s_axi_maintr_bvalid,           // Write Response Valid
    input             s_axi_maintr_bready,           // Write Response Fabric Ready
    output [1:0]      s_axi_maintr_bresp,            // Write Response

    input             s_axi_maintr_arvalid,          // Read Command Valid
    output            s_axi_maintr_arready,          // Read Port Ready
    input  [31:0]     s_axi_maintr_araddr,           // Read Address
    output            s_axi_maintr_rvalid,           // Read Response Valid
    input             s_axi_maintr_rready,           // Read Response Fabric Ready
    output [31:0]     s_axi_maintr_rdata,            // Read Data
    output [1:0]      s_axi_maintr_rresp,            // Read Response


    // PHY control signals
    input             sim_train_en,            // Reduce timers for inialization for simulation
    input             force_reinit,            // Force reinitialization
    input             phy_mce,                 // Send MCE control symbol
    input             phy_link_reset,          // Send link reset control symbols

    output            phy_rcvd_mce,            // MCE control symbol received
    output            phy_rcvd_link_reset,     // Received 4 consecutive reset symbols
    output [223:0]    phy_debug,               // Useful debug signals
    output            gtrx_disperr_or,         // GT disparity error (reduce ORed)
    output            gtrx_notintable_or,      // GT not in table error (reduce ORed)

   //  ------------------------------------------------
   // side band signals
    output            port_error                   , // In Port Error State
    output [23:0]     port_timeout                 , // Timeout occurred
    output            srio_host                    , // Endpoint is the system host
    output            port_decode_error            , // No valid output port for the RX transaction
    output [15:0]     deviceid                     , // Device ID
    output            idle2_selected               , // The PHY is operating in IDLE2 mode

    output            phy_lcl_master_enable_out    ,
    output            buf_lcl_response_only_out    ,
    output            buf_lcl_tx_flow_control_out  ,
    output      [5:0] buf_lcl_phy_buf_stat_out     ,
    output      [5:0] phy_lcl_phy_next_fm_out      ,
    output      [5:0] phy_lcl_phy_last_ack_out     ,
    output            phy_lcl_phy_rewind_out       ,
    output      [5:0] phy_lcl_phy_rcvd_buf_stat_out,
    output            phy_lcl_maint_only_out       ,
   // -----------------------------------------





    // PHY Informational signals in support logic
    output            port_initialized,        // Port is intialized
    output            link_initialized,        // Ready to transmit data
    output            idle_selected   ,        // The IDLE sequence has been selected
    output            mode_1x                  // Link is trained down to 1x mode
   );
   // ----------------------------------

  // wire declarations ----------------

  wire              controlled_force_reinit; // Force reinitialization



  // End wire declarations ------------

    //wire gt0_qpll_lock_out;


    //wire gt0_qpll_clk_out;
    //wire gt0_qpll_out_refclk_out;


    wire log_lcl_cfg_rst ;
    wire log_rst         ;
    wire buf_rst         ;
    wire phy_rst         ;
    wire gt_pcs_rst      ;

  // start of SRIO_WRAPPER instantation ----------------
  srio_gen2_0_block  srio_gen2_0_block_inst
     (
// In support logic file for gt common signals
      .log_lcl_log_clk            (log_clk_out          ),
      .phy_lcl_phy_clk            (phy_clk_out          ),
      .log_lcl_cfg_clk            (log_clk_out          ),
      .gt_clk                     (gt_clk_out           ),
      .gt_pcs_clk                 (gt_pcs_clk_out       ),

      .drpclk                     (drpclk_out           ),

      .refclk                     (refclk_out           ),
      .clk_lock                   (clk_lock_out         ),

      .log_lcl_cfg_rst            (cfg_rst_out          ),
      .log_rst                    (log_rst_out          ),
      .buf_rst                    (buf_rst_out          ),
      .phy_rst                    (phy_rst_out          ),
      .gt_pcs_rst                 (gt_pcs_rst_out       ),

    .gt0_qpll_clk              (gt0_qpll_clk_out        ),
    .gt0_qpll_out_refclk       (gt0_qpll_out_refclk_out ),







      .s_axi_maintr_rst           (s_axi_maintr_rst     ),

      .srio_rxn0                  (srio_rxn0),
      .srio_rxp0                  (srio_rxp0),
      .srio_rxn1                  (srio_rxn1),
      .srio_rxp1                  (srio_rxp1),

      .srio_txn0                  (srio_txn0),
      .srio_txp0                  (srio_txp0),
      .srio_txn1                  (srio_txn1),
      .srio_txp1                  (srio_txp1),
      .s_axis_iotx_tvalid            (s_axis_iotx_tvalid        ),
      .s_axis_iotx_tready            (s_axis_iotx_tready        ),
      .s_axis_iotx_tlast             (s_axis_iotx_tlast         ),
      .s_axis_iotx_tdata             (s_axis_iotx_tdata         ),
      .s_axis_iotx_tkeep             (s_axis_iotx_tkeep         ),
      .s_axis_iotx_tuser             (s_axis_iotx_tuser         ),

      .m_axis_iorx_tvalid            (m_axis_iorx_tvalid        ),
      .m_axis_iorx_tready            (m_axis_iorx_tready        ),
      .m_axis_iorx_tlast             (m_axis_iorx_tlast         ),
      .m_axis_iorx_tdata             (m_axis_iorx_tdata         ),
      .m_axis_iorx_tkeep             (m_axis_iorx_tkeep         ),
      .m_axis_iorx_tuser             (m_axis_iorx_tuser         ),

      .s_axi_maintr_awvalid          (s_axi_maintr_awvalid      ),
      .s_axi_maintr_awready          (s_axi_maintr_awready      ),
      .s_axi_maintr_awaddr           (s_axi_maintr_awaddr       ),
      .s_axi_maintr_wvalid           (s_axi_maintr_wvalid       ),
      .s_axi_maintr_wready           (s_axi_maintr_wready       ),
      .s_axi_maintr_wdata            (s_axi_maintr_wdata        ),
      .s_axi_maintr_bvalid           (s_axi_maintr_bvalid       ),
      .s_axi_maintr_bready           (s_axi_maintr_bready       ),
      .s_axi_maintr_bresp            (s_axi_maintr_bresp        ),

      .s_axi_maintr_arvalid          (s_axi_maintr_arvalid      ),
      .s_axi_maintr_arready          (s_axi_maintr_arready      ),
      .s_axi_maintr_araddr           (s_axi_maintr_araddr       ),
      .s_axi_maintr_rvalid           (s_axi_maintr_rvalid       ),
      .s_axi_maintr_rready           (s_axi_maintr_rready       ),
      .s_axi_maintr_rdata            (s_axi_maintr_rdata        ),
      .s_axi_maintr_rresp            (s_axi_maintr_rresp        ),


      .sim_train_en                  (sim_train_en      ),
      .force_reinit                  (controlled_force_reinit),
      .phy_mce                       (phy_mce           ),
      .phy_link_reset                (phy_link_reset    ),

      .phy_rcvd_mce                  (phy_rcvd_mce      ),
      .phy_rcvd_link_reset           (phy_rcvd_link_reset),
      .phy_debug                     (phy_debug         ),
      .gtrx_disperr_or               (gtrx_disperr_or   ),
      .gtrx_notintable_or            (gtrx_notintable_or),

      .port_error                      (port_error        ),
      .port_timeout                    (port_timeout      ),
      .srio_host                       (srio_host         ),
      .port_decode_error               (port_decode_error ),
      .deviceid                        (deviceid          ),
      .idle2_selected                  (idle2_selected    ),
      .phy_lcl_master_enable_out       (phy_lcl_master_enable_out    ),
      .buf_lcl_response_only_out       (buf_lcl_response_only_out    ),
      .buf_lcl_tx_flow_control_out     (buf_lcl_tx_flow_control_out  ),
      .buf_lcl_phy_buf_stat_out        (buf_lcl_phy_buf_stat_out     ),
      .phy_lcl_phy_next_fm_out         (phy_lcl_phy_next_fm_out      ),
      .phy_lcl_phy_last_ack_out        (phy_lcl_phy_last_ack_out     ),
      .phy_lcl_phy_rewind_out          (phy_lcl_phy_rewind_out       ),
      .phy_lcl_phy_rcvd_buf_stat_out   (phy_lcl_phy_rcvd_buf_stat_out),
      .phy_lcl_maint_only_out          (phy_lcl_maint_only_out       ),

//-------------newly added signals as per gt interface requirements-------------



                                                       

      .port_initialized           (port_initialized  ),
      .link_initialized           (link_initialized  ),

      .idle_selected              (idle_selected     ),
      .mode_1x                    (mode_1x           )

     );
  // End of SRIO_WRAPPER instantiation --------

//----------------------------------------------------------------------------//
  // SRIO_CLK Instantiaton --------------------
   srio_gen2_0_srio_clk
   srio_clk_inst (
      .sys_clkp                (sys_clkp        ),// input to the clock module
      .sys_clkn                (sys_clkn        ),// input to the clock module
      .sys_rst                 (sys_rst         ),// input to the clock module
      .mode_1x                 (mode_1x         ),// input to the clock module

      .log_clk                 (log_clk_out     ),// output from clock module
      .phy_clk                 (phy_clk_out     ),// output from clock module
      .gt_clk                  (gt_clk_out      ),// output from clock module
      .gt_pcs_clk              (gt_pcs_clk_out  ),// output from clock module
      .refclk                  (refclk_out      ),// output from clock module


      .drpclk                  (drpclk_out),      // output from clock module

      .clk_lock                (clk_lock_out)        // output from clock module
     );
  // End of SRIO_CLK instantiation ------------

//----------------------------------------------------------------------------//
  //  SRIO_RST Instantiaton --------------------
   srio_gen2_0_srio_rst
   srio_rst_inst (
      .cfg_clk                 (log_clk_out     ),// input to the reset module
      .log_clk                 (log_clk_out     ),// input to the reset module
      .phy_clk                 (phy_clk_out     ),// input to the reset module
      .gt_pcs_clk              (gt_pcs_clk_out  ),// input to the reset module

      .sys_rst                 (sys_rst         ),// input to the reset module
      .port_initialized        (port_initialized),// input to the reset module
      .phy_rcvd_link_reset     (phy_rcvd_link_reset),
      .force_reinit            (force_reinit    ),// input to the reset module
      .clk_lock                (clk_lock_out    ),// input to the reset module

      .controlled_force_reinit (controlled_force_reinit),


      .cfg_rst                 (cfg_rst_out     ),// output from reset module
      .log_rst                 (log_rst_out     ),// output from reset module
      .buf_rst                 (buf_rst_out     ),// output from reset module
      .phy_rst                 (phy_rst_out     ),// output from reset module
      .gt_pcs_rst              (gt_pcs_rst_out  ) // output from reset module
     );
  // End of SRIO_RST instantiation ------------
//----------------------------------------------------------------------------//
       srio_gen2_0_k7_v7_gtxe2_common   k7_v7_gtxe2_common_inst
       (
               .gt0_gtrefclk0_common_in         (refclk_out             ),      // input   connect to refclk
               .gt0_qplllockdetclk_in           (drpclk_out             ),      // input   connect to drpclk
               .gt0_qpllreset_in                (gt_pcs_rst_out         ),      // input   connect to gt_pcs_rst
               .qpll_clk_out                    (gt0_qpll_clk_out       ),      // output
               .qpll_out_refclk_out             (gt0_qpll_out_refclk_out),      // output
               .gt0_qpll_lock_out               (gt0_qpll_lock_out      )       // output  use only when 2x or 4x or 6G
       );
//----------------------------------------------------------------------------//
//----------------------------------------------------------------------------//
//----------------------------------------------------------------------------//
//----------------------------------------------------------------------------//
// end of srio support module 

endmodule
