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

// port/parameter declarations in block file ----------------

module srio_gen2_0_block
  #(
   //  Parameter declarations -----------
    parameter TCQ                       = 100,

    parameter COMPONENT_NAME            = ("srio_gen2_0"),
    parameter C_DEVICEID_WIDTH          = ( 8) ,
    parameter C_DEVICEID                = ("00FF"),
    parameter C_INIT_NREAD              = ( 1) ,
    parameter C_INIT_NWRITE             = ( 1) ,
    parameter C_INIT_NWRITE_R           = ( 1) ,
    parameter C_INIT_SWRITE             = ( 1) ,
    parameter C_INIT_DB                 = ( 1) ,
    parameter C_INIT_ATOMIC             = ( 1) ,
    parameter C_INIT_DS                 = ( 0) ,
    parameter C_TARGET_NREAD            = ( 1) ,
    parameter C_TARGET_NWRITE           = ( 1) ,
    parameter C_TARGET_NWRITE_R         = ( 1) ,
    parameter C_TARGET_SWRITE           = ( 1) ,
    parameter C_TARGET_DB               = ( 1) ,
    parameter C_TARGET_ATOMIC           = ( 1) ,
    parameter C_TARGET_DS               = ( 0) ,
    parameter C_MSG_INIT_SINGLE         = ( 1) ,
    parameter C_MSG_INIT_MULTI          = ( 1) ,
    parameter C_MSG_SINK_SINGLE         = ( 1) ,
    parameter C_MSG_SINK_MULTI          = ( 1) ,
    parameter C_CRF_SUPPORT             = ( 0) ,
    parameter C_SINGLE_SEG_MBOX         = ( 16) ,
    parameter C_MAINT_SOURCE            = ( 1) ,
    parameter C_MAINT_CFG               = ( 1) ,
    parameter C_DEVID_CAR               = ("00000000"),
    parameter C_DEVINFO_CAR             = ("00000000"),
    parameter C_DEV_CAR_OVRD            = ( 0) ,
    parameter C_LCSBA_SUPPORT           = ( 1) ,
    parameter C_LCSBA                   = ("3FF"),
    parameter C_HW_ARCH                 = ( 6) ,
    parameter C_ASSY_ID                 = ("0000"),
    parameter C_ASSY_VENDOR             = ("0000"),
    parameter C_ASSY_REV                = ("0000"),
    parameter C_PHY_EF_PTR              = ("0100"),
    parameter C_PE_BRIDGE               = ( 0) ,
    parameter C_PE_MEMORY               = ( 1) ,
    parameter C_PE_PROC                 = ( 0) ,
    parameter C_PE_SWITCH               = ( 0) ,
    parameter C_PORT_IO_HELLO           = ( 1) ,
    parameter C_PORT_MSG_HELLO          = ( 1) ,
    parameter C_PORT_MAINT_HELLO        = ( 1) ,
    parameter C_PORT_IO_STYLE           = ( 0) ,
    parameter C_PORT_MSG_STYLE          = ( 0) ,
    parameter C_PORT_MAINT_STYLE        = ( 1) ,
    parameter C_PORT_USERDEF_ENABLED    = ( 0) ,
    parameter C_PORT_ERR_RESP_ENABLED   = ( 0) ,
    parameter C_TX_ENABLE_FAIRNESS      = ( 0) ,
    parameter C_REQ_REORDER             = ( 1) ,
    parameter C_TX_DEPTH                = ( 32) ,
    parameter C_RX_DEPTH                = ( 32) ,
    parameter C_RX_FC_ONLY              = ( 0) ,
    parameter C_UNIFIED_CLK             = ( 0) ,
    parameter C_MODE_XG                 = ( 3) ,
    parameter C_WM0                     = ( 3) ,
    parameter C_WM1                     = ( 2) ,
    parameter C_WM2                     = ( 1) ,
    parameter C_IDLE2                   = ( 0) ,
    parameter C_LINK_WIDTH              = ( 2) ,
    parameter C_SIM_TRAIN               = ( 0) ,
    parameter C_IDLE1                   = ( 1) ,
    parameter C_SCRAM                   = ( 0) ,
    parameter C_RETRY                   = ( 1) ,
    parameter C_LINK_REQUESTS           = ( 3) ,
    parameter C_LANE_EF_PTR             = ("0400"),
    parameter C_VC_EF_PTR               = ("800"),
    parameter C_LINK_TIMEOUT            = ("FFFFFF"),
    parameter C_PORT_TIMEOUT            = ("FFFFFF"),
    parameter C_IS_HOST                 = ( 0) ,
    parameter C_MASTER_EN               = ( 0) ,
    parameter C_DISCOVERED              = ( 0) ,
    parameter C_USER_EF_PTR             = ("0000"),
    parameter C_SW_CSR                  = ( 1) ,
    parameter c_enable_user_ef          = ( 0) ,
    parameter c_device_id_width         = ( 8) ,
    parameter c_device_id               = ("00FF"),
    parameter c_validation              = ( 0) ,
    parameter c_ref_clk                 = ( 2) ,
    parameter c_xiltest                 = ( 0) ,
    parameter c_speedgrade              = ("-2"),
    parameter c_component_name          = ("srio_gen2_0"),
    parameter c_vc_en                   = ( 0) ,
    parameter c_vc_ct                   = ( 1) ,
    parameter c_family                  = ("kintex7"),
    parameter c_device                  = ("xc7k160t"),
    parameter c_part                    = ("xc7k160tffg676-2"),
    parameter C_SILICON_REV             = ( 2) ,
    parameter C_SHARED_LOGIC            = ( 1) ,
    parameter c_gt0_debug_ports         = ( 1) ,
    parameter c_side_band               = ( 1) ,
    parameter c_transceivercontrol      = ( 0)
    )

   //  ----------------------------------
   (
   //  port declarations ----------------
    // clocks and resets and general signals
    input             log_lcl_log_clk,         // LOG interface clock
    input             phy_lcl_phy_clk,         // PHY interface clock
    input             log_lcl_cfg_clk,         // CFG interface clock
    input             gt_clk,                  // GT Internal clock
    input             gt_pcs_clk,              // GT Fabric interface clock
    input             drpclk,                  // GT Dynamic Reconfiguration Port clock
    input             refclk,                  // GT reference clock
    input             clk_lock,                // Clocks are valid

    input             log_lcl_cfg_rst,         // Reset for CFG clock Domain
    input             log_rst,                 // Reset for LOG clock Domain
    input             buf_rst,                 // Reset for BUFFER core
    input             phy_rst,                 // Reset for PHY clock Domain
    input             gt_pcs_rst,              // Reset for GT Fabric clock Domain


    input             gt0_qpll_clk        ,
    input             gt0_qpll_out_refclk ,




    input             s_axi_maintr_rst,        // Reset for maintr interface, on LOG clk domain


    // Serial IO Interface
    input             srio_rxn0,               // Serial Receive Data
    input             srio_rxp0,               // Serial Receive Data
    input             srio_rxn1,               // Serial Receive Data
    input             srio_rxp1,               // Serial Receive Data

    output            srio_txn0,               // Serial Transmit Data
    output            srio_txp0,               // Serial Transmit Data
    output            srio_txn1,               // Serial Transmit Data
    output            srio_txp1,               // Serial Transmit Data

    // LOG User I/O Interface
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

    // Maintenance Port Interface
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
    input             sim_train_en                 , // Reduce timers for inialization for simulation
    input             force_reinit                 , // Force reinitialization
    input             phy_mce                      , // Send MCE control symbol
    input             phy_link_reset               , // Send link reset control symbols

    output            phy_rcvd_mce                 , // MCE control symbol received
    output            phy_rcvd_link_reset          , // Received 4 consecutive reset symbols
    output    [223:0] phy_debug                    , // Useful debug signals
    output            gtrx_disperr_or              , // GT disparity error (reduce ORed)
    output            gtrx_notintable_or           , // GT not in table error (reduce ORed)





//--

//--

   // side band signals
    output            port_error                   ,       // In Port Error State
    output     [23:0] port_timeout                 ,       // Timeout value from Port Response Timeout CSR
    output            srio_host                    ,       // Endpoint is the system host

    // LOG Informational signals
    output            port_decode_error            ,       // Received transaction did not match a valid port
    output     [15:0] deviceid                     ,       // Device ID
    output            idle2_selected               ,       // The PHY is operating in IDLE2 mode

    output            phy_lcl_master_enable_out    ,
    output            buf_lcl_response_only_out    ,
    output            buf_lcl_tx_flow_control_out  ,
    output      [5:0] buf_lcl_phy_buf_stat_out     ,
    output      [5:0] phy_lcl_phy_next_fm_out      ,
    output      [5:0] phy_lcl_phy_last_ack_out     ,
    output            phy_lcl_phy_rewind_out       ,
    output      [5:0] phy_lcl_phy_rcvd_buf_stat_out,
    output            phy_lcl_maint_only_out       ,


    // PHY Informational signals
    output            port_initialized,        // Port is intialized
    output            link_initialized,        // Ready to transmit data
    output            idle_selected,           // The IDLE sequence has been selected
    output            mode_1x                  // Link is trained down to 1x mode
   //  ----------------------------------


   );

  //  local parameters -----------------

  localparam LINK_WIDTH = 2;

  //  End local parameters -------------


  //  wire declarations ----------------
  // LOG - CFG interface signals
  wire                           cfgr_awvalid;
  wire                           cfgr_awready;
  wire [23:0]                    cfgr_awaddr;
  wire                           cfgr_wvalid;
  wire                           cfgr_wready;
  wire [31:0]                    cfgr_wdata;
  wire [3:0]                     cfgr_wstrb;
  wire [2:0]                     cfgr_awprot;
  wire                           cfgr_bvalid;
  wire                           cfgr_bready;
  wire [1:0]                     cfgr_bresp;
  wire                           cfgr_arvalid;
  wire                           cfgr_arready;
  wire [23:0]                    cfgr_araddr;
  wire [2:0]                     cfgr_arprot;
  wire                           cfgr_rvalid;
  wire                           cfgr_rready;
  wire [31:0]                    cfgr_rdata;
  wire [1:0]                     cfgr_rresp;

  wire                           cfgl_awvalid;
  wire                           cfgl_awready;
  wire [23:0]                    cfgl_awaddr;
  wire                           cfgl_wvalid;
  wire                           cfgl_wready;
  wire [31:0]                    cfgl_wdata;
  wire [3:0]                     cfgl_wstrb;
  wire                           cfgl_bvalid;
  wire                           cfgl_bready;
  wire                           cfgl_arvalid;
  wire                           cfgl_arready;
  wire [23:0]                    cfgl_araddr;
  wire                           cfgl_rvalid;
  wire                           cfgl_rready;
  wire [31:0]                    cfgl_rdata;


  // LOG - BUF interface signals
  wire                           buft_tvalid;
  wire                           buft_tready;
  wire [63:0]                    buft_tdata;
  wire [7:0]                     buft_tkeep;
  wire                           buft_tlast;
  wire [7:0]                     buft_tuser;
  wire                           response_only;

  wire                           bufr_tvalid;
  wire                           bufr_tready;
  wire [63:0]                    bufr_tdata;
  wire [7:0]                     bufr_tkeep;
  wire                           bufr_tlast;
  wire [7:0]                     bufr_tuser;


  // PHY - BUF interface signals
  wire                           phyt_tvalid;
  wire                           phyt_tready;
  wire [63:0]                    phyt_tdata;
  wire [7:0]                     phyt_tkeep;
  wire                           phyt_tlast;
  wire [7:0]                     phyt_tuser;

  wire                           phyr_tvalid;
  wire                           phyr_tready;
  wire [63:0]                    phyr_tdata;
  wire [7:0]                     phyr_tkeep;
  wire                           phyr_tlast;
  wire [7:0]                     phyr_tuser;

  wire                           phy_rewind;
  wire [5:0]                     phy_buf_stat;
  wire [5:0]                     phy_rcvd_buf_stat;
  wire [5:0]                     phy_last_ack;
  wire [5:0]                     phy_next_fm;
  wire                           tx_flow_control;


  // BUF - CFG interface signals
  wire                           cfgb_awvalid;
  wire                           cfgb_awready;
  wire [23:0]                    cfgb_awaddr;
  wire                           cfgb_wvalid;
  wire                           cfgb_wready;
  wire [31:0]                    cfgb_wdata;
  wire [3:0]                     cfgb_wstrb;
  wire                           cfgb_bvalid;
  wire                           cfgb_bready;
  wire                           cfgb_arvalid;
  wire                           cfgb_arready;
  wire [23:0]                    cfgb_araddr;
  wire                           cfgb_rvalid;
  wire                           cfgb_rready;
  wire [31:0]                    cfgb_rdata;


  // PHY CFG signals
  wire                           maint_only;
  wire                           master_enable;

  // PHY - CFG interface signals
  wire                           cfgp_awvalid;
  wire                           cfgp_awready;
  wire [23:0]                    cfgp_awaddr;
  wire                           cfgp_wvalid;
  wire                           cfgp_wready;
  wire [31:0]                    cfgp_wdata;
  wire [3:0]                     cfgp_wstrb;
  wire                           cfgp_bvalid;
  wire                           cfgp_bready;
  wire                           cfgp_arvalid;
  wire                           cfgp_arready;
  wire [23:0]                    cfgp_araddr;
  wire                           cfgp_rvalid;
  wire                           cfgp_rready;
  wire [31:0]                    cfgp_rdata;


  // High Speed Serial IO
  wire [LINK_WIDTH*4*8-1:0]      gttx_data;
  wire [LINK_WIDTH*4-1:0]        gttx_charisk;

  wire [LINK_WIDTH*4*8-1:0]      gtrx_data;
  wire [LINK_WIDTH*4-1:0]        gtrx_charisk;
  wire [LINK_WIDTH*4-1:0]        gtrx_chariscomma;
  wire [LINK_WIDTH*4-1:0]        gtrx_disperr;
  wire [LINK_WIDTH*4-1:0]        gtrx_notintable;
  wire [LINK_WIDTH-1:0]          gttx_inhibit;
  wire [LINK_WIDTH-1:0]          gtrx_chanisaligned;
  wire                           gtrx_reset_req;
  wire [LINK_WIDTH-1:0]          gtrx_reset_done;
  wire                           gtrx_reset;
  wire                           gtrx_chanbonden;

  //  End wire declarations ------------


  //  Simple Assignments ---------------
    assign gtrx_disperr_or    = |gtrx_disperr;
    assign gtrx_notintable_or = |gtrx_notintable;

    assign phy_lcl_master_enable_out   = master_enable;
    assign buf_lcl_response_only_out   = response_only;
    assign buf_lcl_tx_flow_control_out = tx_flow_control;
    assign buf_lcl_phy_buf_stat_out    = phy_buf_stat;
    assign phy_lcl_phy_next_fm_out     = phy_next_fm;
    assign phy_lcl_phy_last_ack_out    = phy_last_ack;
    assign phy_lcl_phy_rewind_out      = phy_rewind;
    assign phy_lcl_phy_rcvd_buf_stat_out = phy_rcvd_buf_stat;
    assign phy_lcl_maint_only_out      = maint_only;

  //  End Simple Assignments -----------

//------------------------------------------------------------------------------
  // SRIO_BLOCK instantiation --------------------
  // for production and shared logic in the core
  srio_gen2_v4_0_5_unifiedtop
        #(
        .COMPONENT_NAME                 (COMPONENT_NAME          ),
        .C_DEVICEID_WIDTH               (C_DEVICEID_WIDTH        ),
        .C_DEVICEID                     (C_DEVICEID              ),
        .C_INIT_NREAD                   (C_INIT_NREAD            ),
        .C_INIT_NWRITE                  (C_INIT_NWRITE           ),
        .C_INIT_NWRITE_R                (C_INIT_NWRITE_R         ),
        .C_INIT_SWRITE                  (C_INIT_SWRITE           ),
        .C_INIT_DB                      (C_INIT_DB               ),
        .C_INIT_ATOMIC                  (C_INIT_ATOMIC           ),
        .C_INIT_DS                      (C_INIT_DS               ),
        .C_TARGET_NREAD                 (C_TARGET_NREAD          ),
        .C_TARGET_NWRITE                (C_TARGET_NWRITE         ),
        .C_TARGET_NWRITE_R              (C_TARGET_NWRITE_R       ),
        .C_TARGET_SWRITE                (C_TARGET_SWRITE         ),
        .C_TARGET_DB                    (C_TARGET_DB             ),
        .C_TARGET_ATOMIC                (C_TARGET_ATOMIC         ),
        .C_TARGET_DS                    (C_TARGET_DS             ),
        .C_MSG_INIT_SINGLE              (C_MSG_INIT_SINGLE       ),
        .C_MSG_INIT_MULTI               (C_MSG_INIT_MULTI        ),
        .C_MSG_SINK_SINGLE              (C_MSG_SINK_SINGLE       ),
        .C_MSG_SINK_MULTI               (C_MSG_SINK_MULTI        ),
        .C_CRF_SUPPORT                  (C_CRF_SUPPORT           ),
        .C_SINGLE_SEG_MBOX              (C_SINGLE_SEG_MBOX       ),
        .C_MAINT_SOURCE                 (C_MAINT_SOURCE          ),
        .C_MAINT_CFG                    (C_MAINT_CFG             ),
        .C_DEVID_CAR                    (C_DEVID_CAR             ),
        .C_DEVINFO_CAR                  (C_DEVINFO_CAR           ),
        .C_DEV_CAR_OVRD                 (C_DEV_CAR_OVRD          ),
        .C_LCSBA_SUPPORT                (C_LCSBA_SUPPORT         ),
        .C_LCSBA                        (C_LCSBA                 ),
        .C_HW_ARCH                      (C_HW_ARCH               ),
        .C_ASSY_ID                      (C_ASSY_ID               ),
        .C_ASSY_VENDOR                  (C_ASSY_VENDOR           ),
        .C_ASSY_REV                     (C_ASSY_REV              ),
        .C_PHY_EF_PTR                   (C_PHY_EF_PTR            ),
        .C_PE_BRIDGE                    (C_PE_BRIDGE             ),
        .C_PE_MEMORY                    (C_PE_MEMORY             ),
        .C_PE_PROC                      (C_PE_PROC               ),
        .C_PE_SWITCH                    (C_PE_SWITCH             ),
        .C_PORT_IO_HELLO                (C_PORT_IO_HELLO         ),
        .C_PORT_MSG_HELLO               (C_PORT_MSG_HELLO        ),
        .C_PORT_MAINT_HELLO             (C_PORT_MAINT_HELLO      ),
        .C_PORT_IO_STYLE                (C_PORT_IO_STYLE         ),
        .C_PORT_MSG_STYLE               (C_PORT_MSG_STYLE        ),
        .C_PORT_MAINT_STYLE             (C_PORT_MAINT_STYLE      ),
        .C_PORT_USERDEF_ENABLED         (C_PORT_USERDEF_ENABLED  ),
        .C_PORT_ERR_RESP_ENABLED        (C_PORT_ERR_RESP_ENABLED ),
        .C_TX_ENABLE_FAIRNESS           (C_TX_ENABLE_FAIRNESS    ),
        .C_REQ_REORDER                  (C_REQ_REORDER           ),
        .C_TX_DEPTH                     (C_TX_DEPTH              ),
        .C_RX_DEPTH                     (C_RX_DEPTH              ),
        .C_RX_FC_ONLY                   (C_RX_FC_ONLY            ),
        .C_UNIFIED_CLK                  (C_UNIFIED_CLK           ),
        .C_MODE_XG                      (C_MODE_XG               ),
        .C_WM0                          (C_WM0                   ),
        .C_WM1                          (C_WM1                   ),
        .C_WM2                          (C_WM2                   ),
        .C_IDLE2                        (C_IDLE2                 ),
        .C_LINK_WIDTH                   (C_LINK_WIDTH            ),
        .C_SIM_TRAIN                    (C_SIM_TRAIN             ),
        .C_IDLE1                        (C_IDLE1                 ),
        .C_SCRAM                        (C_SCRAM                 ),
        .C_RETRY                        (C_RETRY                 ),
        .C_LINK_REQUESTS                (C_LINK_REQUESTS         ),
        .C_LANE_EF_PTR                  (C_LANE_EF_PTR           ),
        .C_VC_EF_PTR                    (C_VC_EF_PTR             ),
        .C_LINK_TIMEOUT                 (C_LINK_TIMEOUT          ),
        .C_PORT_TIMEOUT                 (C_PORT_TIMEOUT          ),
        .C_IS_HOST                      (C_IS_HOST               ),
        .C_MASTER_EN                    (C_MASTER_EN             ),
        .C_DISCOVERED                   (C_DISCOVERED            ),
        .C_USER_EF_PTR                  (C_USER_EF_PTR           ),
        .C_SW_CSR                       (C_SW_CSR                ),
        .c_enable_user_ef               (c_enable_user_ef        ),
        .c_device_id_width              (c_device_id_width       ),
        .c_device_id                    (c_device_id             ),
        .c_validation                   (c_validation            ),
        .c_ref_clk                      (c_ref_clk               ),
        .c_xiltest                      (c_xiltest               ),
        .c_speedgrade                   (c_speedgrade            ),
        .c_component_name               (c_component_name        ),
        .c_vc_en                        (c_vc_en                 ),
        .c_vc_ct                        (c_vc_ct                 ),
        .c_family                       (c_family                ),
        .c_device                       (c_device                ),
        .c_part                         (c_part                  ),
        .C_SILICON_REV                  (C_SILICON_REV           ),
        .C_SHARED_LOGIC                 (C_SHARED_LOGIC          ),// not directly used in RTL, but affects the file delivery of shared and non shared mode logic.
        .c_gt0_debug_ports              (c_gt0_debug_ports       ),// not directly used in RTL
        .c_side_band                    (c_side_band             ),// not directly used in RTL
        .c_transceivercontrol           (c_transceivercontrol    )
        )
        srio_gen2_v4_0_5_unifiedtop_inst(
      // LOG signals
      .log_lcl_log_clk            (log_lcl_log_clk),
      .log_rst                    (log_rst),
      .log_lcl_cfg_clk            (log_lcl_cfg_clk),
      .log_lcl_cfg_rst            (log_lcl_cfg_rst),
      .s_axi_maintr_rst           (s_axi_maintr_rst),

      // I/O Port
      .s_axis_iotx_tvalid         (s_axis_iotx_tvalid),
      .s_axis_iotx_tready         (s_axis_iotx_tready),
      .s_axis_iotx_tlast          (s_axis_iotx_tlast),
      .s_axis_iotx_tdata          (s_axis_iotx_tdata),
      .s_axis_iotx_tkeep          (s_axis_iotx_tkeep),
      .s_axis_iotx_tuser          (s_axis_iotx_tuser),

      .m_axis_iorx_tvalid         (m_axis_iorx_tvalid),
      .m_axis_iorx_tready         (m_axis_iorx_tready),
      .m_axis_iorx_tlast          (m_axis_iorx_tlast),
      .m_axis_iorx_tdata          (m_axis_iorx_tdata),
      .m_axis_iorx_tkeep          (m_axis_iorx_tkeep),
      .m_axis_iorx_tuser          (m_axis_iorx_tuser),










      .m_axis_erriresp_tvalid     (),    // output   default values
      .m_axis_erriresp_tready     (1'b0),// input
      .m_axis_erriresp_tlast      (),    // output
      .m_axis_erriresp_tdata      (),    // output  [63:0]
      .m_axis_erriresp_tkeep      (),    // output  [7:0]
      .m_axis_erriresp_tuser      (),    // output  [31:0]

      .s_axis_msgireq_tvalid      (1'b0),  // input         default values
      .s_axis_msgireq_tready      (),      // output
      .s_axis_msgireq_tlast       (1'b0),  // input
      .s_axis_msgireq_tdata       (64'b0), // input  [63:0]
      .s_axis_msgireq_tkeep       (8'b0),  // input  [7:0]
      .s_axis_msgireq_tuser       (32'b0), // input  [31:0]

      .m_axis_msgiresp_tvalid     (),       // output       default values
      .m_axis_msgiresp_tready     (1'b0),   // input
      .m_axis_msgiresp_tlast      (),       // output
      .m_axis_msgiresp_tdata      (),       // output  [63:0]
      .m_axis_msgiresp_tkeep      (),       // output  [7:0]
      .m_axis_msgiresp_tuser      (),       // output  [31:0]

      .s_axis_msgtresp_tvalid     (1'b0),   // input        default values
      .s_axis_msgtresp_tready     (),       // output
      .s_axis_msgtresp_tlast      (1'b0),   // input
      .s_axis_msgtresp_tdata      (64'b0),  // input  [63:0]
      .s_axis_msgtresp_tkeep      (8'b0),   // input  [7:0]
      .s_axis_msgtresp_tuser      (32'b0),    // input  [31:0]

      .m_axis_msgtreq_tvalid      (),       // output        default values
      .m_axis_msgtreq_tready      (1'b0),   // input
      .m_axis_msgtreq_tlast       (),       // output
      .m_axis_msgtreq_tdata       (),       // output  [63:0]
      .m_axis_msgtreq_tkeep       (),       // output  [7:0]
      .m_axis_msgtreq_tuser       (),       // output  [31:0]
      // User-Defined Port
      .s_axis_usrtx_tvalid        (1'b0), // input      default values
      .s_axis_usrtx_tready        (),     // output
      .s_axis_usrtx_tlast         (1'b0), // input
      .s_axis_usrtx_tdata         (64'b0),// input  [63:0]
      .s_axis_usrtx_tkeep         (8'b0), // input  [7:0]
      .s_axis_usrtx_tuser         (8'b0), // input  [7:0]

      .m_axis_usrrx_tvalid        (),       // output   default values
      .m_axis_usrrx_tready        (1'b0),   // input
      .m_axis_usrrx_tlast         (),       // output
      .m_axis_usrrx_tdata         (),       // output  [63:0]
      .m_axis_usrrx_tkeep         (),       // output  [7:0]
      .m_axis_usrrx_tuser         (),       // output  [7:0]

      // maintrx, maintreq and maintresp ports @ default values
      .m_axis_maintrx_tvalid      (),       // out std_logic;
      .m_axis_maintrx_tready      (1'b0),   // in  std_logic := '0';
      .m_axis_maintrx_tlast       (),       // out std_logic;
      .m_axis_maintrx_tdata       (),       // out std_logic_vector(63 downto 0)  ;
      .m_axis_maintrx_tkeep       (),       // out std_logic_vector(7 downto 0)  ;
      .m_axis_maintrx_tuser       (),       // out std_logic_vector(((C_PORT_MAINT_HELLO * 24) + 7) downto 0)  ;

      .s_axis_maintreq_tvalid     (1'b0),   // : in std_logic := '0';
      .s_axis_maintreq_tready     (),       // : out std_logic;
      .s_axis_maintreq_tlast      (1'b0),   // : in std_logic := '0';
      .s_axis_maintreq_tdata      (64'b0),  // : in std_logic_vector(63 downto 0) := (others => '0');
      .s_axis_maintreq_tkeep      (8'b0),   // : in std_logic_vector(7 downto 0) := (others => '0');
      .s_axis_maintreq_tuser      (32'b0),// : in std_logic_vector(((C_PORT_MAINT_HELLO * 24) + 7) downto 0) := (others => '0');

      .s_axis_maintresp_tvalid    (1'b0),   // : in std_logic := '0';
      .s_axis_maintresp_tready    (),       // : out std_logic;
      .s_axis_maintresp_tlast     (1'b0),   // : in std_logic := '0';
      .s_axis_maintresp_tdata     (64'b0),  // : in std_logic_vector(63 downto 0) := (others => '0');
      .s_axis_maintresp_tkeep     (8'b0),   // : in std_logic_vector(7 downto 0) := (others => '0');
      .s_axis_maintresp_tuser     (32'b0),  // : in std_logic_vector(((C_PORT_MAINT_HELLO * 24) + 7) downto 0) := (others => '0');


      // Maintenance Port
      .s_axi_maintr_awvalid       (s_axi_maintr_awvalid),
      .s_axi_maintr_awready       (s_axi_maintr_awready),
      .s_axi_maintr_awaddr        (s_axi_maintr_awaddr),
      .s_axi_maintr_wvalid        (s_axi_maintr_wvalid),
      .s_axi_maintr_wready        (s_axi_maintr_wready),
      .s_axi_maintr_wdata         (s_axi_maintr_wdata),
      .s_axi_maintr_bvalid        (s_axi_maintr_bvalid),
      .s_axi_maintr_bready        (s_axi_maintr_bready),
      .s_axi_maintr_bresp         (s_axi_maintr_bresp),
      .s_axi_maintr_arvalid       (s_axi_maintr_arvalid),
      .s_axi_maintr_arready       (s_axi_maintr_arready),
      .s_axi_maintr_araddr        (s_axi_maintr_araddr),
      .s_axi_maintr_rvalid        (s_axi_maintr_rvalid),
      .s_axi_maintr_rready        (s_axi_maintr_rready),
      .s_axi_maintr_rdata         (s_axi_maintr_rdata),
      .s_axi_maintr_rresp         (s_axi_maintr_rresp),

      // Configuration Master Interface
      .m_axi_cfgr_awvalid         (cfgr_awvalid),
      .m_axi_cfgr_awready         (cfgr_awready),
      .m_axi_cfgr_awaddr          (cfgr_awaddr),
      .m_axi_cfgr_wvalid          (cfgr_wvalid),
      .m_axi_cfgr_wready          (cfgr_wready),
      .m_axi_cfgr_wdata           (cfgr_wdata),
      .m_axi_cfgr_wstrb           (cfgr_wstrb),
      .m_axi_cfgr_awprot          (cfgr_awprot),
      .m_axi_cfgr_bvalid          (cfgr_bvalid),
      .m_axi_cfgr_bready          (cfgr_bready),
      .m_axi_cfgr_bresp           (cfgr_bresp),
      .m_axi_cfgr_arvalid         (cfgr_arvalid),
      .m_axi_cfgr_arready         (cfgr_arready),
      .m_axi_cfgr_araddr          (cfgr_araddr),
      .m_axi_cfgr_arprot          (cfgr_arprot),
      .m_axi_cfgr_rvalid          (cfgr_rvalid),
      .m_axi_cfgr_rready          (cfgr_rready),
      .m_axi_cfgr_rdata           (cfgr_rdata),
      .m_axi_cfgr_rresp           (cfgr_rresp),

      // LOG-BUF Interface
      .m_axis_buft_tvalid         (buft_tvalid),
      .m_axis_buft_tready         (buft_tready),
      .m_axis_buft_tdata          (buft_tdata),
      .m_axis_buft_tkeep          (buft_tkeep),
      .m_axis_buft_tlast          (buft_tlast),
      .m_axis_buft_tuser          (buft_tuser),
      .log_lcl_response_only      (response_only),

      .s_axis_bufr_tvalid         (bufr_tvalid),
      .s_axis_bufr_tready         (bufr_tready),
      .s_axis_bufr_tdata          (bufr_tdata),
      .s_axis_bufr_tkeep          (bufr_tkeep),
      .s_axis_bufr_tlast          (bufr_tlast),
      .s_axis_bufr_tuser          (bufr_tuser),

      // LOG Configuration Register Interface
      .s_axi_cfgl_awvalid         (cfgl_awvalid),
      .s_axi_cfgl_awready         (cfgl_awready),
      .s_axi_cfgl_awaddr          (cfgl_awaddr),
      .s_axi_cfgl_wvalid          (cfgl_wvalid),
      .s_axi_cfgl_wready          (cfgl_wready),
      .s_axi_cfgl_wdata           (cfgl_wdata),
      .s_axi_cfgl_wstrb           (cfgl_wstrb),
      .s_axi_cfgl_bvalid          (cfgl_bvalid),
      .s_axi_cfgl_bready          (cfgl_bready),
      .s_axi_cfgl_arvalid         (cfgl_arvalid),
      .s_axi_cfgl_arready         (cfgl_arready),
      .s_axi_cfgl_araddr          (cfgl_araddr),
      .s_axi_cfgl_rvalid          (cfgl_rvalid),
      .s_axi_cfgl_rready          (cfgl_rready),
      .s_axi_cfgl_rdata           (cfgl_rdata),

      .port_decode_error          (port_decode_error),
      .deviceid                   (deviceid),
      .log_lcl_maint_only         (maint_only),

      // BUF signals
      .buf_lcl_phy_clk            (phy_lcl_phy_clk),
      .buf_lcl_log_clk            (log_lcl_log_clk),
      .buf_lcl_cfg_clk            (log_lcl_cfg_clk),
      .buf_rst                    (buf_rst),
      .buf_lcl_cfg_rst            (log_lcl_cfg_rst),

      // LOG-BUF Interface
      .s_axis_buft_tvalid         (buft_tvalid),
      .s_axis_buft_tready         (buft_tready),
      .s_axis_buft_tdata          (buft_tdata),
      .s_axis_buft_tkeep          (buft_tkeep),
      .s_axis_buft_tlast          (buft_tlast),
      .s_axis_buft_tuser          (buft_tuser),
      .buf_lcl_response_only      (response_only),

      .m_axis_bufr_tvalid         (bufr_tvalid),
      .m_axis_bufr_tready         (bufr_tready),
      .m_axis_bufr_tdata          (bufr_tdata),
      .m_axis_bufr_tkeep          (bufr_tkeep),
      .m_axis_bufr_tlast          (bufr_tlast),
      .m_axis_bufr_tuser          (bufr_tuser),

      // BUF-PHY Interface
      .m_axis_phyt_tvalid         (phyt_tvalid),
      .m_axis_phyt_tready         (phyt_tready),
      .m_axis_phyt_tdata          (phyt_tdata),
      .m_axis_phyt_tkeep          (phyt_tkeep),
      .m_axis_phyt_tlast          (phyt_tlast),
      .m_axis_phyt_tuser          (phyt_tuser),

      .s_axis_phyr_tvalid         (phyr_tvalid),
      .s_axis_phyr_tready         (phyr_tready),
      .s_axis_phyr_tdata          (phyr_tdata),
      .s_axis_phyr_tkeep          (phyr_tkeep),
      .s_axis_phyr_tlast          (phyr_tlast),
      .s_axis_phyr_tuser          (phyr_tuser),
      .buf_lcl_phy_rewind         (phy_rewind),

      .buf_lcl_phy_buf_stat       (phy_buf_stat),
      .buf_lcl_phy_rcvd_buf_stat  (phy_rcvd_buf_stat),
      .buf_lcl_phy_last_ack       (phy_last_ack),
      .buf_lcl_phy_next_fm        (phy_next_fm),
      .buf_lcl_tx_flow_control    (tx_flow_control),
      .buf_lcl_idle2_selected     (idle2_selected),

      // Config signals
      .buf_lcl_master_enable      (master_enable),

      // BUF Configuration Register Interface
      .s_axi_cfgb_awvalid         (cfgb_awvalid ),
      .s_axi_cfgb_awready         (cfgb_awready ),
      .s_axi_cfgb_awaddr          (cfgb_awaddr  ),
      .s_axi_cfgb_wvalid          (cfgb_wvalid  ),
      .s_axi_cfgb_wready          (cfgb_wready  ),
      .s_axi_cfgb_wdata           (cfgb_wdata   ),
      .s_axi_cfgb_wstrb           (cfgb_wstrb   ),
      .s_axi_cfgb_bvalid          (cfgb_bvalid  ),
      .s_axi_cfgb_bready          (cfgb_bready  ),
      .s_axi_cfgb_arvalid         (cfgb_arvalid ),
      .s_axi_cfgb_arready         (cfgb_arready ),
      .s_axi_cfgb_araddr          (cfgb_araddr  ),
      .s_axi_cfgb_rvalid          (cfgb_rvalid  ),
      .s_axi_cfgb_rready          (cfgb_rready  ),
      .s_axi_cfgb_rdata           (cfgb_rdata   ),

      // PHY signals
      .phy_lcl_phy_clk            (phy_lcl_phy_clk),
      .phy_rst                    (phy_rst),
      .phy_lcl_log_clk            (log_lcl_log_clk),
      .gt_pcs_clk                 (gt_pcs_clk),
      .gt_pcs_rst                 (gt_pcs_rst),
      .phy_lcl_cfg_clk            (log_lcl_cfg_clk),
      .phy_lcl_cfg_rst            (log_lcl_cfg_rst),

      // BUF-PHY Interface
      .s_axis_phyt_tvalid         (phyt_tvalid  ),
      .s_axis_phyt_tready         (phyt_tready  ),
      .s_axis_phyt_tdata          (phyt_tdata   ),
      .s_axis_phyt_tkeep          (phyt_tkeep   ),
      .s_axis_phyt_tlast          (phyt_tlast   ),
      .s_axis_phyt_tuser          (phyt_tuser   ),

      .m_axis_phyr_tvalid         (phyr_tvalid  ),
      .m_axis_phyr_tready         (phyr_tready  ),
      .m_axis_phyr_tdata          (phyr_tdata   ),
      .m_axis_phyr_tkeep          (phyr_tkeep   ),
      .m_axis_phyr_tlast          (phyr_tlast   ),
      .m_axis_phyr_tuser          (phyr_tuser   ),

      .phy_lcl_phy_rewind         (phy_rewind           ),
      .phy_lcl_phy_rcvd_buf_stat  (phy_rcvd_buf_stat    ),
      .phy_lcl_phy_next_fm        (phy_next_fm          ),
      .phy_lcl_phy_last_ack       (phy_last_ack         ),
      .phy_lcl_phy_buf_stat       (phy_buf_stat         ),
      .phy_lcl_tx_flow_control    (tx_flow_control      ),

      // PHY Configuration Register Interface
      .s_axi_cfgp_awvalid         (cfgp_awvalid ),
      .s_axi_cfgp_awready         (cfgp_awready ),
      .s_axi_cfgp_awaddr          (cfgp_awaddr  ),
      .s_axi_cfgp_wvalid          (cfgp_wvalid  ),
      .s_axi_cfgp_wready          (cfgp_wready  ),
      .s_axi_cfgp_wdata           (cfgp_wdata   ),
      .s_axi_cfgp_wstrb           (cfgp_wstrb   ),
      .s_axi_cfgp_bvalid          (cfgp_bvalid  ),
      .s_axi_cfgp_bready          (cfgp_bready  ),
      .s_axi_cfgp_arvalid         (cfgp_arvalid ),
      .s_axi_cfgp_arready         (cfgp_arready ),
      .s_axi_cfgp_araddr          (cfgp_araddr  ),
      .s_axi_cfgp_rvalid          (cfgp_rvalid  ),
      .s_axi_cfgp_rready          (cfgp_rready  ),
      .s_axi_cfgp_rdata           (cfgp_rdata   ),

      // PHY Control/Status signals
      .sim_train_en               (sim_train_en         ),
      .idle_selected              (idle_selected        ),
      .phy_lcl_idle2_selected     (idle2_selected       ),
      .phy_mce                    (phy_mce              ),
      .phy_link_reset             (phy_link_reset       ),
      .force_reinit               (force_reinit         ),
      .phy_lcl_master_enable      (master_enable        ),
      .phy_lcl_maint_only         (maint_only           ),
      .link_initialized           (link_initialized     ),
      .phy_rcvd_mce               (phy_rcvd_mce         ),
      .phy_rcvd_link_reset        (phy_rcvd_link_reset  ),
      .port_error                 (port_error           ),
      .port_initialized           (port_initialized     ),
      .mode_1x                    (mode_1x              ),
      .rx_lane_r                  (),
      .port_timeout               (port_timeout         ),
      .srio_host                  (srio_host            ),

      // High-Speed Serial IO
      .gttx_data                  (gttx_data            ),
      .gttx_charisk               (gttx_charisk         ),
      .gtrx_data                  (gtrx_data            ),
      .gtrx_charisk               (gtrx_charisk         ),
      .gtrx_chariscomma           (gtrx_chariscomma     ),
      .gtrx_disperr               (gtrx_disperr         ),
      .gtrx_notintable            (gtrx_notintable      ),
      .gttx_inhibit               (gttx_inhibit         ),
      .gtrx_chanisaligned         (gtrx_chanisaligned   ),
      .gtrx_reset_req             (gtrx_reset_req       ),
      .gtrx_reset_done            (gtrx_reset_done      ),
      .gtrx_reset                 (gtrx_reset           ),
      .gtrx_chanbonden            (gtrx_chanbonden      ),
      .phy_debug                  (phy_debug            )
    );
  //  End of block instantiation -------------
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
  //  GT WRAPPER instantiation -----------------
  srio_gt_wrapper_srio_gen2_0_k7_2x
    #(.TCQ                        (TCQ),
      .LINK_WIDTH                 (LINK_WIDTH))
    srio_gt_wrapper_inst
     (
    .gt0_qpll_clk_out             (gt0_qpll_clk       ),
    .gt0_qpll_out_refclk_out      (gt0_qpll_out_refclk),




    .refclk                      (refclk),

    .drpclk                      (drpclk),

    .gt_clk                      (gt_clk       ),
    .gt_pcs_clk                  (gt_pcs_clk   ),
    .gt_pcs_rst                  (gt_pcs_rst   ),
    .clk_lock                    (clk_lock     ),
    .srio_rxn0                   (srio_rxn0    ),
    .srio_rxp0                   (srio_rxp0    ),

      .srio_rxn1                 (srio_rxn1),
      .srio_rxp1                 (srio_rxp1),
      .srio_txn0                 (srio_txn0),
      .srio_txp0                 (srio_txp0),
      .srio_txn1                 (srio_txn1),
      .srio_txp1                 (srio_txp1),
    //--------------------------------------------------------------------------1
    //--------------------------------------------------------------------------2
    //-------------newly added signals as per gt interface requirements for K7 -
    //-------------when transceiver debug option is disabled, these signals are tied to defaults
    .gt_drpdo_out               (),
    .gt_drprdy_out              (),
    .gt_drpaddr_in              (18'b0),
    .gt_drpdi_in                (32'b0),
    .gt_drpen_in                (2'b0),
    .gt_drpwe_in                (2'b0),

    .gt_txpmareset_in           (2'b0),
    .gt_rxpmareset_in           (2'b0),
    .gt_txpcsreset_in           (2'b0),
    .gt_rxpcsreset_in           (2'b0),
    .gt_eyescanreset_in         (2'b0),
    .gt_eyescantrigger_in       (2'b0),
    .gt_eyescandataerror_out    (),
    .gt_loopback_in             (6'b0),
    .gt_rxpolarity_in           (2'b0),
    .gt_txpolarity_in           (2'b0),
    .gt_rxlpmen_in              (2'b11),
    .gt_txprecursor_in          (10'b0),
    .gt_txpostcursor_in         (10'b0),
    .gt0_txdiffctrl_in          (4'b1000),
    .gt1_txdiffctrl_in          (4'b1000),
    .gt_txprbsforceerr_in       (2'b0),
    .gt_txprbssel_in            (6'b0),
    .gt_rxprbssel_in            (6'b0),
    .gt_rxprbscntreset_in       (2'b0),
    .gt_rxcdrhold_in            (2'b0),
    .gt_rxdfelpmreset_in        (2'b0),
    .gt_rxprbserr_out           (),
    .gt_rxcommadet_out          (),
    .gt_dmonitorout_out         (),
    .gt_rxresetdone_out         (),
    .gt_txresetdone_out         (),
    .gt_rxbufstatus_out         (),
    .gt_txbufstatus_out         (),
    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------
    

    .gtrx_chariscomma          (gtrx_chariscomma      ),
    .gtrx_disperr              (gtrx_disperr          ),
    .gtrx_notintable           (gtrx_notintable       ),
    .gttx_inhibit              (gttx_inhibit          ),
    .gtrx_chanisaligned        (gtrx_chanisaligned    ),
    .gtrx_reset_req            (gtrx_reset_req        ),
    .gtrx_reset_done           (gtrx_reset_done       ),
    .gtrx_reset                (gtrx_reset            ),
    .gtrx_chanbonden           (gtrx_chanbonden       ),
    .gtrx_data                 (gtrx_data             ),
    .gtrx_charisk              (gtrx_charisk          ),
    .gttx_data                 (gttx_data             ),
    .gttx_charisk              (gttx_charisk          )

   );

   // End of GT WRAPPER instantiation ----------
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
  // CFG_FABRIC instantiation -----------------
  cfg_fabric_srio_gen2_0
    #(.TCQ                        (TCQ))
    cfg_fabric_inst
    (
      .cfg_clk                    (log_lcl_cfg_clk),
      .cfg_rst                    (log_lcl_cfg_rst),

      // Configuration Master Interface
      .cfgr_awvalid               (cfgr_awvalid ),
      .cfgr_awready               (cfgr_awready ),
      .cfgr_awaddr                (cfgr_awaddr  ),
      .cfgr_wvalid                (cfgr_wvalid  ),
      .cfgr_wready                (cfgr_wready  ),
      .cfgr_wdata                 (cfgr_wdata   ),
      .cfgr_wstrb                 (cfgr_wstrb   ),
      .cfgr_awprot                (cfgr_awprot  ),
      .cfgr_bvalid                (cfgr_bvalid  ),
      .cfgr_bready                (cfgr_bready  ),
      .cfgr_bresp                 (cfgr_bresp   ),
      .cfgr_arvalid               (cfgr_arvalid ),
      .cfgr_arready               (cfgr_arready ),
      .cfgr_araddr                (cfgr_araddr  ),
      .cfgr_arprot                (cfgr_arprot  ),
      .cfgr_rvalid                (cfgr_rvalid  ),
      .cfgr_rready                (cfgr_rready  ),
      .cfgr_rdata                 (cfgr_rdata   ),
      .cfgr_rresp                 (cfgr_rresp   ),

      // Configuration LOG Interface
      .cfgl_awvalid               (cfgl_awvalid ),
      .cfgl_awready               (cfgl_awready ),
      .cfgl_awaddr                (cfgl_awaddr  ),
      .cfgl_wvalid                (cfgl_wvalid  ),
      .cfgl_wready                (cfgl_wready  ),
      .cfgl_wdata                 (cfgl_wdata   ),
      .cfgl_wstrb                 (cfgl_wstrb   ),
      .cfgl_awprot                (),
      .cfgl_bvalid                (cfgl_bvalid  ),
      .cfgl_bready                (cfgl_bready  ),
      .cfgl_arvalid               (cfgl_arvalid ),
      .cfgl_arready               (cfgl_arready ),
      .cfgl_araddr                (cfgl_araddr  ),
      .cfgl_arprot                (),
      .cfgl_rvalid                (cfgl_rvalid  ),
      .cfgl_rready                (cfgl_rready  ),
      .cfgl_rdata                 (cfgl_rdata   ),

      // Configuration BUF Interface
      .cfgb_awvalid               (cfgb_awvalid ),
      .cfgb_awready               (cfgb_awready ),
      .cfgb_awaddr                (cfgb_awaddr  ),
      .cfgb_wvalid                (cfgb_wvalid  ),
      .cfgb_wready                (cfgb_wready  ),
      .cfgb_wdata                 (cfgb_wdata   ),
      .cfgb_wstrb                 (cfgb_wstrb   ),
      .cfgb_awprot                (),
      .cfgb_bvalid                (cfgb_bvalid  ),
      .cfgb_bready                (cfgb_bready  ),
      .cfgb_arvalid               (cfgb_arvalid ),
      .cfgb_arready               (cfgb_arready ),
      .cfgb_arprot                (),
      .cfgb_araddr                (cfgb_araddr  ),
      .cfgb_rvalid                (cfgb_rvalid  ),
      .cfgb_rready                (cfgb_rready  ),
      .cfgb_rdata                 (cfgb_rdata   ),

      // Configuration PHY Interface
      .cfgp_awvalid               (cfgp_awvalid ),
      .cfgp_awready               (cfgp_awready ),
      .cfgp_awaddr                (cfgp_awaddr  ),
      .cfgp_wvalid                (cfgp_wvalid  ),
      .cfgp_wready                (cfgp_wready  ),
      .cfgp_wdata                 (cfgp_wdata   ),
      .cfgp_wstrb                 (cfgp_wstrb   ),
      .cfgp_awprot                (),
      .cfgp_bvalid                (cfgp_bvalid  ),
      .cfgp_bready                (cfgp_bready  ),
      .cfgp_arvalid               (cfgp_arvalid ),
      .cfgp_arready               (cfgp_arready ),
      .cfgp_arprot                (),
      .cfgp_araddr                (cfgp_araddr  ),
      .cfgp_rvalid                (cfgp_rvalid  ),
      .cfgp_rready                (cfgp_rready  ),
      .cfgp_rdata                 (cfgp_rdata   )
    );
   // End of CFG_FABRIC instantiation ----------
//------------------------------------------------------------------------------


endmodule
