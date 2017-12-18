`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: VlSU
// Engineer: Gustov Vladimir
// 
// Create Date: 14.09.2017 09:33:27
// Design Name: 
// Module Name: srio_example_test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: Try to implement SRIO data transfer between FPGA and DSP
// FPGA must be slave
//////////////////////////////////////////////////////////////////////////////////
(* DowngradeIPIdentifiedWarnings = "yes" *)

module srio_example_test(
    // Clocks and Resets
    input  sys_clkp,         // MMCM reference clock
    input  sys_clkn,         // MMCM reference clock
    output rst,
    // high-speed IO
    // Serial Receive Data
    input  srio_rxn0,        
    input  srio_rxp0,        
    input  srio_rxn1,
    input  srio_rxp1,    
    /*input  srio_rxn2,        
    input  srio_rxp2,        
    input  srio_rxn3,
    input  srio_rxp3,*/
    // Serial Transmit Data
    output srio_txn0,        
    output srio_txp0,        
    output srio_txn1,
    output srio_txp1,
    output [63:0] data_to_out   
    /*output srio_txn2,        
    output srio_txp2,        
    output srio_txn3,
    output srio_txp3*/         
    );
    
    // wire declarations
    wire         log_clk;
    wire         phy_clk;
    wire         gt_clk;
    wire         gt_pcs_clk;
    wire         drpclk;
    wire         refclk;
    
    wire         log_rst;
    wire         phy_rst;
    wire         cfg_rst;    
    wire         buf_rst;        
    wire         sys_rst = 1'b0;      // Global reset signal
    
    wire         clk_lock;            // asserts from the MMCM
    
    // signals into the DUT
    // From FPGA to DSP
    wire         iotx_tvalid;         // Indicates that the information on the channel is valid
    wire         iotx_tready;         // Indicates that the data from the source is accepted (if valid)
    wire         iotx_tlast;          // Indicates the last beat of a packet    
    wire [63:0]  iotx_tdata;          // Packet header and data
    wire [7:0]   iotx_tkeep;          // Indicates whether the content of the associated byte of data is valid
    wire [31:0]  iotx_tuser;          // Consists of the Source ID and Destination ID
    // From DSP to FPGA      
    wire         iorx_tvalid;         // Indicates that the information on the channel is valid
    wire         iorx_tready;         // Indicates that the data from the source is accepted (if valid)
    wire         iorx_tlast;          // Indicates the last beat of a packet  
    wire [63:0]  iorx_tdata;          // Packet header and data
    wire [7:0]   iorx_tkeep;          // Indicates whether the content of the associated byte of data is valid
    wire [31:0]  iorx_tuser;          // Consists of the Source ID and Destination ID
    
    wire         maintr_rst = 1'b0;    
    wire         maintr_awvalid = 1'b0;
    wire         maintr_awready;
    wire [31:0]  maintr_awaddr = 32'b0;
    wire         maintr_wvalid = 1'b0;
    wire         maintr_wready;
    wire [31:0]  maintr_wdata = 32'b0;
    wire         maintr_bvalid;
    wire         maintr_bready = 1'b0;
    wire [1:0]   maintr_bresp;

    wire         maintr_arvalid = 1'b0;
    wire         maintr_arready;
    wire [31:0]  maintr_araddr = 32'b0;
    wire         maintr_rvalid;
    wire         maintr_rready = 1'b0;
    wire [31:0]  maintr_rdata;
    wire [1:0]   maintr_rresp;
    //debug
    wire [63:0]  dbg_s_axis_tdata;    
    // PHY control signals
    wire         phy_mce = 1'b0;         // Send MCE control symbol == broadcast
    wire         phy_link_reset = 1'b0;  // Send link reset control symbols
    wire         force_reinit = 1'b0;    // Force reinitialization    
    wire         sim_train_en = 1'b0;    // Set this only when simulating to reduce the size of counters
    wire         gt0_qpll_clk_out;       // QPLL outputs
    wire         gt0_qpll_out_refclk_out;
    wire         gt_pcs_rst;
    // debug wires    
    wire         phy_rcvd_mce;           // MCE control symbol received
    wire         phy_rcvd_link_reset;    // Received 4 consecutive reset symbols
    wire [223:0] phy_debug;              // Usefull debug signals
    wire         gtrx_disperr_or;        // GT disparity error (reduce ORed)
    wire         gtrx_notintable_or;     // GT not in table error       
    wire         port_error;             // In Port Error State
    wire [23:0]  port_timeout;           // Timeout value from Port Response Timeout CSR   
    wire         srio_host;              // Endpoint is the system host
    
    wire         port_decode_error;      // Received transaction did not match a valid port   
    wire [15:0]  deviceid;               // Device ID
    
    wire         idle2_selected;      // The PHY is operating in IDLE2 mode
    
    wire         port_init;           // Port is Initialized
    wire         link_init;           // Link is Initialized
    wire         mode_1x;             // Link is trained down to 1x mode
    wire         idle_selected;       // The IDLE sequence has been selected
    wire         dbg_rst;
    
    assign rst         = log_rst;
    assign data_to_out = iotx_tdata;
    
    vio_0 vio_ip(
        .clk        ( log_clk    ),
        .probe_in0  ( mode_1x    ),
        .probe_in1  ( port_init  ),
        .probe_in2  ( link_init  ),
        .probe_in3  ( port_error ),
        
        .probe_out0 ( dbg_rst    )
    );
    
/*    ila_1 ila_ip(
        .clk (log_clk),
        .probe0 (iotx_tdata),
        .probe1 (iorx_tdata)
        .probe2 (iotx_tuser),
        .probe3 (iorx_tuser),
        .probe4 (iotx_tready),
        .probe5 (iorx_tready),
        .probe6 (iotx_tvalid),
        .probe7 (iorx_tvalid)
    );*/
  
      
    /*
        TODO: This module must to accept SRIO packet from DSP side, 
        save data (which was in packet) in DDR (on current time in FIFO),
        and send response packet with data (if was get NREAD request);
        In this part we accept packet by SRIO IP (srio_ip), 
        transfer data into srio_response, save their in FIFO and
        transfer it back
    */
                  
    srio_response srio_rx(
        .log_clk            ( log_clk     ),
        .log_rst            ( log_rst     ),
        .dbg_rst            ( dbg_rst     ),
                        
        .src_id             ( deviceid    ),
        .id_override        ( 1'b0        ),
        
        // Regs with request data (from DSP to FPGA)
        .axis_iorx_tvalid   ( iorx_tvalid ),
        .axis_iorx_tready   ( iorx_tready ),
        .axis_iorx_tlast    ( iorx_tlast  ),
        .axis_iorx_tdata    ( iorx_tdata  ),
        .axis_iorx_tkeep    ( iorx_tkeep  ),
        .axis_iorx_tuser    ( iorx_tuser  ),
        
        // Regs with response data (from FPGA to DSP)
        .axis_iotx_tvalid   ( iotx_tvalid ),
        .axis_iotx_tlast    ( iotx_tlast  ),
        .axis_iotx_tdata    ( iotx_tdata  ),
        .axis_iotx_tkeep    ( iotx_tkeep  ),
        .axis_iotx_tuser    ( iotx_tuser  ),
        .axis_iotx_tready   ( iotx_tready )      
    );
        
    srio_gen2_0 srio_ip(
        .sys_clkp                      ( sys_clkp                ),
        .sys_clkn                      ( sys_clkn                ),
        .sys_rst                       ( sys_rst                 ),
        // all clocks as output in shared logic mode
        .log_clk_out                   ( log_clk                 ),
        .phy_clk_out                   ( phy_clk                 ),
        .gt_clk_out                    ( gt_clk                  ),
        .gt_pcs_clk_out                ( gt_pcs_clk              ),
        .drpclk_out                    ( drpclk                  ),
        .refclk_out                    ( refclk                  ),
        .clk_lock_out                  ( clk_lock                ),
        // all resets as output in shared logic mode
        .log_rst_out                   ( log_rst                 ),
        .phy_rst_out                   ( phy_rst                 ),
        .buf_rst_out                   ( buf_rst                 ),
        .cfg_rst_out                   ( cfg_rst                 ),
        .gt_pcs_rst_out                ( gt_pcs_rst              ),        
        .gt0_qpll_clk_out              ( gt0_qpll_clk_out        ),
        .gt0_qpll_out_refclk_out       ( gt0_qpll_out_refclk_out ),
        // Serial IO Interface
        .srio_rxn0                     ( srio_rxn0               ),
        .srio_rxp0                     ( srio_rxp0               ),
        .srio_rxn1                     ( srio_rxn1               ),
        .srio_rxp1                     ( srio_rxp1               ),            
       /* .srio_rxn2                     ( srio_rxn2               ),
        .srio_rxp2                     ( srio_rxp2               ),
        .srio_rxn3                     ( srio_rxn3               ),
        .srio_rxp3                     ( srio_rxp3               ),*/
            
        .srio_txn0                     ( srio_txn0               ),
        .srio_txp0                     ( srio_txp0               ),                
        .srio_txn1                     ( srio_txn1               ),
        .srio_txp1                     ( srio_txp1               ),                        
        /*.srio_txn2                     ( srio_txn2               ),
        .srio_txp2                     ( srio_txp2               ),                
        .srio_txn3                     ( srio_txn3               ),
        .srio_txp3                     ( srio_txp3               ),*/
        // LOG User I/O Interface
        .s_axis_iotx_tvalid            ( iotx_tvalid             ),
        .s_axis_iotx_tready            ( iotx_tready             ), // output
        .s_axis_iotx_tlast             ( iotx_tlast              ),
        .s_axis_iotx_tdata             ( iotx_tdata              ),
        .s_axis_iotx_tkeep             ( iotx_tkeep              ),
        .s_axis_iotx_tuser             ( iotx_tuser              ),
    
        .m_axis_iorx_tvalid            ( iorx_tvalid             ),
        .m_axis_iorx_tready            ( iorx_tready             ), // input
        .m_axis_iorx_tlast             ( iorx_tlast              ),
        .m_axis_iorx_tdata             ( iorx_tdata              ),
        .m_axis_iorx_tkeep             ( iorx_tkeep              ),
        .m_axis_iorx_tuser             ( iorx_tuser              ),
        // Maintenance Port Interface    
        .s_axi_maintr_rst              ( maintr_rst              ),
     
        .s_axi_maintr_awvalid          ( maintr_awvalid          ),
        .s_axi_maintr_awready          ( maintr_awready          ),
        .s_axi_maintr_awaddr           ( maintr_awaddr           ),
        .s_axi_maintr_wvalid           ( maintr_wvalid           ),
        .s_axi_maintr_wready           ( maintr_wready           ),
        .s_axi_maintr_wdata            ( maintr_wdata            ),
        .s_axi_maintr_bvalid           ( maintr_bvalid           ),
        .s_axi_maintr_bready           ( maintr_bready           ),
        .s_axi_maintr_bresp            ( maintr_bresp            ),
  
        .s_axi_maintr_arvalid          ( maintr_arvalid          ),
        .s_axi_maintr_arready          ( maintr_arready          ),
        .s_axi_maintr_araddr           ( maintr_araddr           ),
        .s_axi_maintr_rvalid           ( maintr_rvalid           ),
        .s_axi_maintr_rready           ( maintr_rready           ),
        .s_axi_maintr_rdata            ( maintr_rdata            ),
        .s_axi_maintr_rresp            ( maintr_rresp            ),
        // PHY control signa
        .sim_train_en                  ( sim_train_en            ),
        .phy_mce                       ( phy_mce                 ),
        .phy_link_reset                ( phy_link_reset          ),
        .force_reinit                  ( force_reinit            ),
        // Core debug signals
        .phy_rcvd_mce                  ( phy_rcvd_mce            ),
        .phy_rcvd_link_reset           ( phy_rcvd_link_reset     ),
        .phy_debug                     ( phy_debug               ),
        .gtrx_disperr_or               ( gtrx_disperr_or         ),
        .gtrx_notintable_or            ( gtrx_notintable_or      ),
        // Side band signals
        .port_error                    ( port_error              ),
        .port_timeout                  ( port_timeout            ),
        .srio_host                     ( srio_host               ),
        // LOG Informational signals
        .port_decode_error             ( port_decode_error       ),
        .deviceid                      ( deviceid                ),
        .idle2_selected                ( idle2_selected          ),
        .phy_lcl_master_enable_out     (), // these are side band output only signals
        .buf_lcl_response_only_out     (),
        .buf_lcl_tx_flow_control_out   (),
        .buf_lcl_phy_buf_stat_out      (),
        .phy_lcl_phy_next_fm_out       (),
        .phy_lcl_phy_last_ack_out      (),
        .phy_lcl_phy_rewind_out        (),
        .phy_lcl_phy_rcvd_buf_stat_out (),
        .phy_lcl_maint_only_out        (),
        // PHY Informational signals
        .port_initialized              ( port_init               ),
        .link_initialized              ( link_init               ),
        .idle_selected                 ( idle_selected           ),
        .mode_1x                       ( mode_1x                 )
    );
    
endmodule
