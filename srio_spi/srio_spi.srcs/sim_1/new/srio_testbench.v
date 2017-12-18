`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2017 11:51:09
// Design Name: 
// Module Name: srio_testbench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module srio_testbench();
    
    // wire declarations
    reg         log_clk_t;
    reg         log_rst_t;
    
    // signals into the DUT
    wire        iotx_tvalid_t;         // Indicates that the information on the channel is valid
    reg         iotx_tready_t;         // Indicates that the data from the source is accepted (if valid)
    wire        iotx_tlast_t;          // Indicates the last beat of a packet    
    wire [63:0] iotx_tdata_t;          // Packet header and data
    wire [7:0]  iotx_tkeep_t;          // Indicates whether the content of the associated byte of data is valid
    wire [31:0] iotx_tuser_t;          // Consists of the Source ID and Destination ID
    
    reg         iorx_tvalid_t;         // Indicates that the information on the channel is valid
    wire        iorx_tready_t;         // Indicates that the data from the source is accepted (if valid)
    reg         iorx_tlast_t;          // Indicates the last beat of a packet  
    reg  [63:0] iorx_tdata_t;          // Packet header and data
    reg  [7:0]  iorx_tkeep_t;          // Indicates whether the content of the associated byte of data is valid
    reg  [31:0] iorx_tuser_t;          // Consists of the Source ID and Destination ID
    
    reg [2:0]  current_state;
    reg [2:0]  next_state;
    reg [4:0]  some_counter;
    
    // FSM    
    localparam [2:0] IDLE_S     = 3'h00;
    localparam [2:0] SEND_SW_S  = 3'h01; // erase flash
    localparam [2:0] SEND_DT_S  = 3'h02; // send data
    localparam [2:0] SEND_RD_S  = 3'h03; // set some values      
    localparam [2:0] PRE_SEND_S = 3'h04; // preparation to send     
    localparam [2:0] FINAL_S    = 3'h05; // send data
    
    srio_response srio_rx(
        .log_clk            ( log_clk_t     ),
        .log_rst            ( log_rst_t     ),
            
        .src_id             ( 8'hFF         ),
        .id_override        ( 1'b0          ),
        
        // Regs with request data (from DSP to FPGA)
        .axis_iorx_tvalid   ( iorx_tvalid_t ),
        .axis_iorx_tready   ( iorx_tready_t ),
        .axis_iorx_tlast    ( iorx_tlast_t  ),
        .axis_iorx_tdata    ( iorx_tdata_t  ),
        .axis_iorx_tkeep    ( iorx_tkeep_t  ),
        .axis_iorx_tuser    ( iorx_tuser_t  ),
        
        // Regs with response data (from FPGA to DSP)
        .axis_iotx_tvalid   ( iotx_tvalid_t ),
        .axis_iotx_tlast    ( iotx_tlast_t  ),
        .axis_iotx_tdata    ( iotx_tdata_t  ),
        .axis_iotx_tkeep    ( iotx_tkeep_t  ),
        .axis_iotx_tuser    ( iotx_tuser_t  ),
        .axis_iotx_tready   ( iotx_tready_t )      
    );
    
    initial begin
        log_clk_t            = 1'b1;
        log_rst_t            = 1'b0;
        
        iotx_tready_t        = 1'b1;
        
        iorx_tvalid_t        = 1'b0;   
        iorx_tlast_t         = 1'b0;     
        iorx_tuser_t         = 32'h00;
        iorx_tdata_t         = 64'h00;              
        iorx_tkeep_t         = 8'b0;             
             
        current_state        = IDLE_S;        
        some_counter         = 5'b0;                  
        $display("<< Running testbench >>");
    end
    
    always // генератор clk
        #10 log_clk_t = !log_clk_t; // 50 MHz     
        
    event reset_trigger;      // объ€вление событий
    event reset_done_trigger;
    
    // блок формировани€ Reset
    initial begin
        forever begin // бесконечный цикл
            @(reset_trigger); // ждЄм событи€ reset_trigger
            @(negedge log_clk_t); // ждЄм negedge clk_t
            log_rst_t = 1'b1;   // сброс
            @(negedge log_clk_t);
            log_rst_t = 1'b0;
            -> reset_done_trigger; // сообщаем, что reset выполнен
        end
    end
    
    always @( posedge log_clk_t or posedge log_rst_t ) begin
        if( log_rst_t )
            current_state = IDLE_S;
        else
            current_state = next_state;       
    end
    
    // next-state logic
    always @( current_state, iotx_tlast_t, some_counter, iorx_tready_t ) begin
       next_state = IDLE_S;
       case( current_state )
           IDLE_S: begin
               next_state = PRE_SEND_S;
           end               
               
           SEND_SW_S: begin
               next_state = SEND_DT_S;
           end
           
           SEND_DT_S: begin
               next_state = PRE_SEND_S;                  
           end
           
           SEND_RD_S: begin
               next_state = PRE_SEND_S;              
           end
           
           PRE_SEND_S: begin
               if( iotx_tlast_t == 1'b1 )
                   next_state = FINAL_S;
               else if( some_counter < 5'h04 )
                   next_state = SEND_RD_S;
               else if( (iorx_tready_t == 1'b1) && (some_counter == 5'h00))
                   next_state = SEND_SW_S; 
               else 
                   next_state = PRE_SEND_S;
           end
           
           FINAL_S: begin               
                $finish;
           end            
       endcase
   end
    
   // ’од симул€ции
   /*
   initial
   begin: TEST_CASE
       #5 -> reset_trigger;    // сделать reset
       @ (reset_done_trigger); // ждЄм завершени€ reset
   end
   */ 
   
   always @( current_state ) begin              
       case( current_state )  
           IDLE_S: begin
               #5 -> reset_trigger;    // сделать reset
               @ (reset_done_trigger); // ждЄм завершени€ reset
           end
                       
           SEND_SW_S: begin      
               iorx_tuser_t         = 32'h00cb00ff;
               iorx_tdata_t         = 64'h006020001093de10;              
               iorx_tkeep_t         = 8'hFF;                            
               iorx_tvalid_t        = 1'b1;   
               iorx_tlast_t         = 1'b0;                    
           end
           
           SEND_DT_S: begin
               iorx_tdata_t         = 64'hddbbddbbddbbddbb;                                                                    
               iorx_tvalid_t        = 1'b1;   
               iorx_tlast_t         = 1'b1;     
               iorx_tuser_t         = 32'h00cb00ff;
               some_counter         = some_counter + 1'b1;
           end
           
           SEND_RD_S: begin               
               iorx_tdata_t         = 64'h012420f01093de10;
               iorx_tvalid_t        = 1'b1;   
               iorx_tlast_t         = 1'b1;     
               iorx_tuser_t         = 32'h00cb00ff;
               some_counter         = some_counter + 1'b1;                               
           end
          
           PRE_SEND_S: begin
               iorx_tvalid_t        = 1'b0;   
               iorx_tlast_t         = 1'b0;     
               iorx_tuser_t         = 32'h00cb00ff;
               iorx_tdata_t         = 64'h00;  
               iorx_tkeep_t         = 8'hFF; 
           end
                              
        endcase 
   end
    
endmodule
