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
//----------------------------------------------------------------------
//
// CFG_FABRIC
// Description:
// The Configuration Fabric unites all of the configuration spaces
// within the Xilinx sRIO solution for pointed access.
//
// Hierarchy:
// CFG_FABRIC
// ---------------------------------------------------------------------

`timescale 1ps/1ps

module cfg_fabric_srio_gen2_0
  #(
   // {{{ Parameter declarations -----------
    parameter TCQ                        = 100)  // in pS

   // }}} ----------------------------------
   (
   // {{{ port declarations ----------------
    // clocks and resets and general signals
    input             cfg_clk,                 // CFG interface clock
    input             cfg_rst,                 // Reset for CFG clock Domain


    // LOG CFG Master Fabric Interface
    //----------------------------------------
    // Write Request Port
    input             cfgr_awvalid,         // Write Command Valid
    output reg        cfgr_awready,         // Write Port Ready
    input      [23:0] cfgr_awaddr,          // Write Address
    input             cfgr_wvalid,          // Write Data Valid
    output reg        cfgr_wready,          // Write Port Ready
    input      [31:0] cfgr_wdata,           // Write Data
    input       [3:0] cfgr_wstrb,           // Write Data byte enables
    input       [2:0] cfgr_awprot,          // Write Protection (Tied to 0)

    // Write Response Port
    output reg        cfgr_bvalid,          // Write Response Valid
    input             cfgr_bready,          // Write Response Fabric Ready
    output      [1:0] cfgr_bresp,           // Write Response

    // Read Request Port
    input             cfgr_arvalid,         // Read Command Valid
    output reg        cfgr_arready,         // Read Port Ready
    input      [23:0] cfgr_araddr,          // Read Address
    input       [2:0] cfgr_arprot,          // Read Protection (Tied to 0)

    // Read Response Port
    output reg        cfgr_rvalid,          // Read Response Valid
    input             cfgr_rready,          // Read Response Fabric Ready
    output reg [31:0] cfgr_rdata,           // Read Data
    output      [1:0] cfgr_rresp,           // Read Response


    // Config Fabric to LOG CFG Registers Interface
    //----------------------------------------
    // Write Request Port
    output reg        cfgl_awvalid,         // Write Command Valid
    input             cfgl_awready,         // Write Port Ready
    output     [23:0] cfgl_awaddr,          // Write Address
    output reg        cfgl_wvalid,          // Write Data Valid
    input             cfgl_wready,          // Write Port Ready
    output     [31:0] cfgl_wdata,           // Write Data
    output      [3:0] cfgl_wstrb,           // Write Data byte enables
    output      [2:0] cfgl_awprot,          // Write Protection (Tied to 0)

    // Write Response Port
    input             cfgl_bvalid,          // Write Response Valid
    output            cfgl_bready,          // Write Response Fabric Ready

    // Read Request Port
    output reg        cfgl_arvalid,         // Read Command Valid
    input             cfgl_arready,         // Read Port Ready
    output     [23:0] cfgl_araddr,          // Read Address
    output      [2:0] cfgl_arprot,          // Read Protection (Tied to 0)

    // Read Response Port
    input             cfgl_rvalid,          // Read Response Valid
    output            cfgl_rready,          // Read Response Fabric Ready
    input      [31:0] cfgl_rdata,           // Read Data


    // Config Fabric to BUF CFG Registers Interface
    //----------------------------------------
    // Write Request Port
    output reg        cfgb_awvalid,         // Write Command Valid
    input             cfgb_awready,         // Write Port Ready
    output     [23:0] cfgb_awaddr,          // Write Address
    output reg        cfgb_wvalid,          // Write Data Valid
    input             cfgb_wready,          // Write Port Ready
    output     [31:0] cfgb_wdata,           // Write Data
    output      [3:0] cfgb_wstrb,           // Write Data Byte Enables
    output      [2:0] cfgb_awprot,          // Write Protection (Tied to 0)

    // Write Response Port
    input             cfgb_bvalid,          // Write Response Valid
    output            cfgb_bready,          // Write Response Fabric Ready

    // Read Request Port
    output reg        cfgb_arvalid,         // Read Command Valid
    input             cfgb_arready,         // Read port Ready
    output     [23:0] cfgb_araddr,          // Read Address
    output      [2:0] cfgb_arprot,          // Read Protection (Tied to 0)

    // Read Response Port
    input             cfgb_rvalid,          // Read Response Valid
    output            cfgb_rready,          // Read response Fabric Ready
    input      [31:0] cfgb_rdata,           // Read Data


    // Config Fabric to PHY CFG Registers Interface
    //----------------------------------------
    // Write Request Port
    output reg        cfgp_awvalid,         // Write Command Valid
    input             cfgp_awready,         // Write Port Ready
    output     [23:0] cfgp_awaddr,          // Write Address
    output reg        cfgp_wvalid,          // Write Data Valid
    input             cfgp_wready,          // Write Port Ready
    output     [31:0] cfgp_wdata,           // Write Data
    output      [3:0] cfgp_wstrb,           // Write Data byte enables
    output      [2:0] cfgp_awprot,          // Write Protection (Tied to 0)

    // Write Response Port
    input             cfgp_bvalid,          // Write Response Valid
    output            cfgp_bready,          // Write Response Fabric Ready

    // Read Request Port
    output reg        cfgp_arvalid,         // Read Command Valid
    input             cfgp_arready,         // Read Port Ready
    output     [23:0] cfgp_araddr,          // Read Address
    output      [2:0] cfgp_arprot,          // Read Protection (Tied to 0)

    // Read Response Port
    input             cfgp_rvalid,          // Read Response Valid
    output            cfgp_rready,          // Read Response Fabric Ready
    input      [31:0] cfgp_rdata            // Read Data

   // }}} ----------------------------------
   );


  // {{{ local parameters -----------------

  // Base Address Registers for register access
  localparam [23:0] LOG_BAR = 24'h000000;
  localparam [23:0] PHY_BAR = 24'h000100;
  localparam [23:0] BUF_BAR = 24'h010000;

  // AXI default response "OK"
  localparam  [1:0] AXI_OK  = 2'b00;

  // }}} End local parameters -------------


  // {{{ wire declarations ----------------

  reg         cfg_rst_q = 1;               // Registered reset signal

  // Write request port signals
    // config write master interface
    wire        cfgr_waddr_vld = cfgr_awready && cfgr_awvalid;
    wire        cfgr_wdata_vld = cfgr_wready  && cfgr_wvalid;
    reg         cfgr_initial_awready_set;
    reg         cfgr_initial_wready_set;
    reg         unaffiliated_cfgr_data_vld;
    // config write LOG interface
    wire        cfgl_waddr_vld = cfgl_awready && cfgl_awvalid;
    wire        cfgl_wdata_vld = cfgl_wready  && cfgl_wvalid;
    reg         set_cfgl_awvalid;
    reg         set_cfgl_wvalid;
    reg         find_cfgl_wvalid, find_cfgl_wvalid_q;
    // config write BUF interface
    wire        cfgb_waddr_vld = cfgb_awready && cfgb_awvalid;
    wire        cfgb_wdata_vld = cfgb_wready  && cfgb_wvalid;
    reg         set_cfgb_awvalid;
    reg         set_cfgb_wvalid;
    reg         find_cfgb_wvalid, find_cfgb_wvalid_q;
    // config write PHY interface
    wire        cfgp_waddr_vld = cfgp_awready && cfgp_awvalid;
    wire        cfgp_wdata_vld = cfgp_wready  && cfgp_wvalid;
    reg         set_cfgp_awvalid;
    reg         set_cfgp_wvalid;
    reg         find_cfgp_wvalid, find_cfgp_wvalid_q;
  // -- end Write request port signals

  // Write response port signals
    wire        cfgl_bresp_vld = cfgl_bready && cfgl_bvalid;
    wire        cfgb_bresp_vld = cfgb_bready && cfgb_bvalid;
    wire        cfgp_bresp_vld = cfgp_bready && cfgp_bvalid;
  // -- end Write response port signals


  // Read request port signals
    // config read master interface
    wire        cfgr_raddr_vld = cfgr_arready && cfgr_arvalid;
    reg         cfgr_initial_arready_set;
    // config read LOG interface
    wire        cfgl_raddr_vld = cfgl_arready && cfgl_arvalid;
    reg         set_cfgl_arvalid;
    // config read BUF interface
    wire        cfgb_raddr_vld = cfgb_arready && cfgb_arvalid;
    reg         set_cfgb_arvalid;
    // config read PHY interface
    wire        cfgp_raddr_vld = cfgp_arready && cfgp_arvalid;
    reg         set_cfgp_arvalid;
  // -- end Read request port signals

  // Read response port signals
    wire        cfgl_rresp_vld = cfgl_rready && cfgl_rvalid;
    wire        cfgb_rresp_vld = cfgb_rready && cfgb_rvalid;
    wire        cfgp_rresp_vld = cfgp_rready && cfgp_rvalid;
  // -- end Read response port signals

  // }}} End wire declarations ------------


  // {{{ Reset Structure ------------------

  // register the reset in each and every top-level block to reduce fanout
  // This is not a synchronization block.
  always @(posedge cfg_clk or posedge cfg_rst) begin
    if (cfg_rst)
      cfg_rst_q <= #TCQ 1'b1;
    else
      cfg_rst_q <= #TCQ 1'b0;
  end

  // }}} End of Reset Structure -----------


  // {{{ Write Request Port Selection -------------

  // write data and strobe generation to each config port
  reg [31:0] lr_cfgr_wdata_q;   // registered write data
  reg  [3:0] lr_cfgr_wstrb_q;   // registered write strobe
  reg [23:0] lr_cfgr_awaddr_q;  // registered write address
  reg  [2:0] lr_cfgr_awprot_q;  // registered write protection
  always @(posedge cfg_clk) begin
    if (cfg_rst_q) begin
      lr_cfgr_wdata_q  <= #TCQ 0;
      lr_cfgr_wstrb_q  <= #TCQ 0;
      lr_cfgr_awprot_q <= #TCQ 0;
    end else if (cfgr_wdata_vld) begin
      lr_cfgr_wdata_q  <= #TCQ cfgr_wdata;
      lr_cfgr_wstrb_q  <= #TCQ cfgr_wstrb;
      lr_cfgr_awprot_q <= #TCQ cfgr_awprot;
    end
  end
  assign cfgl_wdata = lr_cfgr_wdata_q;
  assign cfgb_wdata = lr_cfgr_wdata_q;
  assign cfgp_wdata = lr_cfgr_wdata_q;

  assign cfgl_wstrb = lr_cfgr_wstrb_q;
  assign cfgb_wstrb = lr_cfgr_wstrb_q;
  assign cfgp_wstrb = lr_cfgr_wstrb_q;

  assign cfgl_awprot = lr_cfgr_awprot_q;
  assign cfgb_awprot = lr_cfgr_awprot_q;
  assign cfgp_awprot = lr_cfgr_awprot_q;
  // -- end write data and strobe generation


  // write address generation to each config port
  always @(posedge cfg_clk) begin
    if (cfg_rst_q) begin
      lr_cfgr_awaddr_q <= #TCQ 0;
    end else if (cfgr_waddr_vld) begin
      lr_cfgr_awaddr_q <= #TCQ cfgr_awaddr;
    end
  end
  assign cfgl_awaddr = lr_cfgr_awaddr_q;
  assign cfgb_awaddr = lr_cfgr_awaddr_q;
  assign cfgp_awaddr = lr_cfgr_awaddr_q;
  // -- end write address generation


  // set the master write AWREADY and WREADY signals
  // - only one active write can be handled at a time
  // - wait until the old write completely exits before asserting TREADY again
  always @(posedge cfg_clk) begin
    if (cfg_rst_q) begin
      cfgr_awready <= #TCQ 1'b0;
    end else if (cfgr_initial_awready_set) begin
      cfgr_awready <= #TCQ 1'b1;
    end else if (cfgr_waddr_vld) begin
      cfgr_awready <= #TCQ 1'b0;
    end else if (cfgl_waddr_vld || cfgb_waddr_vld || cfgp_waddr_vld) begin
      cfgr_awready <= #TCQ 1'b1;
    end
  end
  always @(posedge cfg_clk) begin
    if (cfg_rst_q) begin
      cfgr_initial_awready_set <= #TCQ 1'b1;
    end else if (cfgr_awready) begin
      cfgr_initial_awready_set <= #TCQ 1'b0;
    end
  end

  always @(posedge cfg_clk) begin
    if (cfg_rst_q) begin
      cfgr_wready <= #TCQ 1'b0;
    end else if (cfgr_initial_wready_set) begin
      cfgr_wready <= #TCQ 1'b1;
    end else if (cfgr_wdata_vld) begin
      cfgr_wready <= #TCQ 1'b0;
    end else if (cfgl_wdata_vld || cfgb_wdata_vld || cfgp_wdata_vld) begin
      cfgr_wready <= #TCQ 1'b1;
    end
  end
  always @(posedge cfg_clk) begin
    if (cfg_rst_q) begin
      cfgr_initial_wready_set <= #TCQ 1'b1;
    end else if (cfgr_awready) begin
      cfgr_initial_wready_set <= #TCQ 1'b0;
    end
  end
  // -- end set the master write AWREADY and WREADY signals


  // Decode the write address to determine the destination
  wire [2:0] write_bar_hits = {cfgr_awaddr >= BUF_BAR,
                               cfgr_awaddr >= PHY_BAR,
                               cfgr_awaddr >= LOG_BAR};
  // Destination Address set - wait only for a valid address
  always @* begin
    set_cfgl_awvalid = 1'b0;
    set_cfgb_awvalid = 1'b0;
    set_cfgp_awvalid = 1'b0;
    if (cfgr_waddr_vld) begin
      casex (write_bar_hits)
        3'b1xx  : set_cfgb_awvalid = 1'b1;
        3'b01x  : set_cfgp_awvalid = 1'b1;
        3'b001  : set_cfgl_awvalid = 1'b1;
        default : ;
      endcase
    end
  end

  // Destination Data set - must wait on both address and data to enable dest
  // - Either Data or Address may arrive first on Master Interface

  // LOG
  always @* begin
    find_cfgl_wvalid = find_cfgl_wvalid_q;
    if (set_cfgl_awvalid) begin
      find_cfgl_wvalid = 1'b1;
    end else if (cfgl_wvalid) begin
      find_cfgl_wvalid = 1'b0;
    end
  end
  always @(posedge cfg_clk) begin
    if (cfg_rst_q) begin
      find_cfgl_wvalid_q <= #TCQ 1'b0;
    end else begin
      find_cfgl_wvalid_q <= #TCQ find_cfgl_wvalid;
    end
  end
  always @* begin
    set_cfgl_wvalid = 1'b0;
    if (find_cfgl_wvalid && (cfgr_wdata_vld || unaffiliated_cfgr_data_vld)) begin
      set_cfgl_wvalid = 1'b1;
    end
  end

  // BUF
  always @* begin
    find_cfgb_wvalid = find_cfgb_wvalid_q;
    if (set_cfgb_awvalid) begin
      find_cfgb_wvalid = 1'b1;
    end else if (cfgb_wvalid) begin
      find_cfgb_wvalid = 1'b0;
    end
  end
  always @(posedge cfg_clk) begin
    if (cfg_rst_q) begin
      find_cfgb_wvalid_q <= #TCQ 1'b0;
    end else begin
      find_cfgb_wvalid_q <= #TCQ find_cfgb_wvalid;
    end
  end
  always @* begin
    set_cfgb_wvalid = 1'b0;
    if (find_cfgb_wvalid && (cfgr_wdata_vld || unaffiliated_cfgr_data_vld)) begin
      set_cfgb_wvalid = 1'b1;
    end
  end

  // PHY
  always @* begin
    find_cfgp_wvalid = find_cfgp_wvalid_q;
    if (set_cfgp_awvalid) begin
      find_cfgp_wvalid = 1'b1;
    end else if (cfgp_wvalid) begin
      find_cfgp_wvalid = 1'b0;
    end
  end
  always @(posedge cfg_clk) begin
    if (cfg_rst_q) begin
      find_cfgp_wvalid_q <= #TCQ 1'b0;
    end else begin
      find_cfgp_wvalid_q <= #TCQ find_cfgp_wvalid;
    end
  end
  always @* begin
    set_cfgp_wvalid = 1'b0;
    if (find_cfgp_wvalid && (cfgr_wdata_vld || unaffiliated_cfgr_data_vld)) begin
      set_cfgp_wvalid = 1'b1;
    end
  end

  // set this flag whenever the data is valid
  // before the address is on the master interface
  always @(posedge cfg_clk) begin
    if (cfg_rst_q) begin
      unaffiliated_cfgr_data_vld <= 1'b0;
    end else if (cfgr_wdata_vld &&
                 !(find_cfgl_wvalid || find_cfgb_wvalid || find_cfgp_wvalid)) begin
      unaffiliated_cfgr_data_vld <= 1'b1;
    end else if (set_cfgl_awvalid || set_cfgb_awvalid || set_cfgp_awvalid) begin
      unaffiliated_cfgr_data_vld <= 1'b0;
    end
  end
  // -- end Decode the write address to determine the destination


  // Set each destination ports' AWVALID and WVALID signals

  // LOG
  always @(posedge cfg_clk) begin
    if (cfg_rst_q) begin
      cfgl_awvalid <= #TCQ 1'b0;
    end else if (set_cfgl_awvalid) begin
      cfgl_awvalid <= #TCQ 1'b1;
    end else if (cfgl_waddr_vld) begin
      cfgl_awvalid <= #TCQ 1'b0;
    end
  end
  always @(posedge cfg_clk) begin
    if (cfg_rst_q) begin
      cfgl_wvalid <= #TCQ 1'b0;
    end else if (set_cfgl_wvalid) begin
      cfgl_wvalid <= #TCQ 1'b1;
    end else if (cfgl_wdata_vld) begin
      cfgl_wvalid <= #TCQ 1'b0;
    end
  end
 
  // BUF
  always @(posedge cfg_clk) begin
    if (cfg_rst_q) begin
      cfgb_awvalid <= #TCQ 1'b0;
    end else if (set_cfgb_awvalid) begin
      cfgb_awvalid <= #TCQ 1'b1;
    end else if (cfgb_waddr_vld) begin
      cfgb_awvalid <= #TCQ 1'b0;
    end
  end
  always @(posedge cfg_clk) begin
    if (cfg_rst_q) begin
      cfgb_wvalid <= #TCQ 1'b0;
    end else if (set_cfgb_wvalid) begin
      cfgb_wvalid <= #TCQ 1'b1;
    end else if (cfgb_wdata_vld) begin
      cfgb_wvalid <= #TCQ 1'b0;
    end
  end
 
  // PHY
  always @(posedge cfg_clk) begin
    if (cfg_rst_q) begin
      cfgp_awvalid <= #TCQ 1'b0;
    end else if (set_cfgp_awvalid) begin
      cfgp_awvalid <= #TCQ 1'b1;
    end else if (cfgp_waddr_vld) begin
      cfgp_awvalid <= #TCQ 1'b0;
    end
  end
  always @(posedge cfg_clk) begin
    if (cfg_rst_q) begin
      cfgp_wvalid <= #TCQ 1'b0;
    end else if (set_cfgp_wvalid) begin
      cfgp_wvalid <= #TCQ 1'b1;
    end else if (cfgp_wdata_vld) begin
      cfgp_wvalid <= #TCQ 1'b0;
    end
  end
  // -- end Set each destination ports' AWVALID and WVALID signals
 
  // }}} End of Write Request Port Selection ------


  // {{{ Write Response Port Selection ------------

  // Write Responses are always OK
  assign cfgr_bresp = AXI_OK;


  // Assign Destination BREADY signals
  reg lr_cfgr_bready_q;   // registered master I/F response ready
  always @(posedge cfg_clk) begin
    if (cfg_rst_q) begin
      lr_cfgr_bready_q <= #TCQ 1'b0;
    end else begin
      lr_cfgr_bready_q <= #TCQ cfgr_bready;
    end
  end
  assign cfgl_bready = lr_cfgr_bready_q;
  assign cfgb_bready = lr_cfgr_bready_q;
  assign cfgp_bready = lr_cfgr_bready_q;
  // -- end Assign Destination BREADY signals


  // Assign Master I/F BVALID signal
  always @(posedge cfg_clk) begin
    if (cfg_rst_q) begin
      cfgr_bvalid <= #TCQ 1'b0;
    end else if (cfgr_bready || !cfgr_bvalid) begin
      cfgr_bvalid <= #TCQ cfgl_bresp_vld || cfgb_bresp_vld || cfgp_bresp_vld;
    end
  end
  // -- end Assign Master I/F BVALID signal

  // }}} End of Write Response Port Selection -----


  // {{{ Read Request Port Selection --------------

  // Read address generation to each config port
  reg [23:0] lr_cfgr_araddr_q;  // registered read address
  reg  [2:0] lr_cfgr_arprot_q;  // registered read protection
  always @(posedge cfg_clk) begin
    if (cfg_rst_q) begin
      lr_cfgr_araddr_q <= #TCQ 0;
      lr_cfgr_arprot_q <= #TCQ 0;
    end else if (cfgr_raddr_vld) begin
      lr_cfgr_araddr_q <= #TCQ cfgr_araddr;
      lr_cfgr_arprot_q <= #TCQ cfgr_arprot;
    end
  end
  assign cfgl_araddr = lr_cfgr_araddr_q;
  assign cfgb_araddr = lr_cfgr_araddr_q;
  assign cfgp_araddr = lr_cfgr_araddr_q;

  assign cfgl_arprot = lr_cfgr_arprot_q;
  assign cfgb_arprot = lr_cfgr_arprot_q;
  assign cfgp_arprot = lr_cfgr_arprot_q;
  // -- end Read address generation


  // Set the master read ARREADY signal
  always @(posedge cfg_clk) begin
    if (cfg_rst_q) begin
      cfgr_arready <= #TCQ 1'b0;
    end else if (cfgr_initial_arready_set) begin
      cfgr_arready <= #TCQ 1'b1;
    end else if (cfgr_raddr_vld) begin
      cfgr_arready <= #TCQ 1'b0;
    end else if (cfgl_raddr_vld || cfgb_raddr_vld || cfgp_raddr_vld) begin
      cfgr_arready <= #TCQ 1'b1;
    end
  end
  always @(posedge cfg_clk) begin
    if (cfg_rst_q) begin
      cfgr_initial_arready_set <= #TCQ 1'b1;
    end else if (cfgr_arready) begin
      cfgr_initial_arready_set <= #TCQ 1'b0;
    end
  end
  // -- end Set the master read ARREADY signal


  // Decode the read address to determine the destination
  wire [2:0] read_bar_hits = {cfgr_araddr >= BUF_BAR,
                              cfgr_araddr >= PHY_BAR,
                              cfgr_araddr >= LOG_BAR};
  // Destination Address set
  always @* begin
    set_cfgl_arvalid = 1'b0;
    set_cfgb_arvalid = 1'b0;
    set_cfgp_arvalid = 1'b0;
    if (cfgr_raddr_vld) begin
      casex (read_bar_hits)
        3'b1xx  : set_cfgb_arvalid = 1'b1;
        3'b01x  : set_cfgp_arvalid = 1'b1;
        3'b001  : set_cfgl_arvalid = 1'b1;
        default : ;
      endcase
    end
  end
  // -- end Decode the read address to determine the destination


  // Set each destination ports' ARVALID signals

  // LOG
  always @(posedge cfg_clk) begin
    if (cfg_rst_q) begin
      cfgl_arvalid <= #TCQ 1'b0;
    end else if (set_cfgl_arvalid) begin
      cfgl_arvalid <= #TCQ 1'b1;
    end else if (cfgl_raddr_vld) begin
      cfgl_arvalid <= #TCQ 1'b0;
    end
  end

  // BUF
  always @(posedge cfg_clk) begin
    if (cfg_rst_q) begin
      cfgb_arvalid <= #TCQ 1'b0;
    end else if (set_cfgb_arvalid) begin
      cfgb_arvalid <= #TCQ 1'b1;
    end else if (cfgb_raddr_vld) begin
      cfgb_arvalid <= #TCQ 1'b0;
    end
  end

  // PHY
  always @(posedge cfg_clk) begin
    if (cfg_rst_q) begin
      cfgp_arvalid <= #TCQ 1'b0;
    end else if (set_cfgp_arvalid) begin
      cfgp_arvalid <= #TCQ 1'b1;
    end else if (cfgp_raddr_vld) begin
      cfgp_arvalid <= #TCQ 1'b0;
    end
  end
  // -- end Set each destination ports' ARVALID signals

  // }}} End of Read Request Port Selection -------


  // {{{ Read Response Port Selection -------------

  // Read Responses are always OK
  assign cfgr_rresp = AXI_OK;


  // Assign Destination RREADY signals
  reg lr_cfgr_rready_q;   // registered master I/F response ready
  always @(posedge cfg_clk) begin
    if (cfg_rst_q) begin
      lr_cfgr_rready_q <= #TCQ 1'b0;
    end else begin
      lr_cfgr_rready_q <= #TCQ cfgr_rready;
    end
  end
  assign cfgl_rready = lr_cfgr_rready_q;
  assign cfgb_rready = lr_cfgr_rready_q;
  assign cfgp_rready = lr_cfgr_rready_q;
  // -- end Assign Destination RREADY signals


  // Assign return read data and RVALID
  always @(posedge cfg_clk) begin
    if (cfg_rst_q) begin
      cfgr_rdata  <= #TCQ 32'h0;
      cfgr_rvalid <= #TCQ 1'b0;
    end else if (cfgr_rready || !cfgr_rvalid) begin
      cfgr_rvalid <= #TCQ cfgl_rresp_vld || cfgb_rresp_vld || cfgp_rresp_vld;

      casex ({cfgl_rresp_vld, cfgb_rresp_vld, cfgp_rresp_vld})
        3'b1xx  : cfgr_rdata <= #TCQ cfgl_rdata;
        3'b01x  : cfgr_rdata <= #TCQ cfgb_rdata;
        3'b001  : cfgr_rdata <= #TCQ cfgp_rdata;
        default : ;
      endcase
    end
  end
  // -- end Assign return read data and RVALID

  // }}} End of Read Response Port Selection ------

endmodule
// {{{ DISCLAIMER OF LIABILITY
// -----------------------------------------------------------------
// (c) Copyright 2010 Xilinx, Inc. All rights reserved.
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
// PART OF THIS FILE AT ALL TIMES.
// }}}

