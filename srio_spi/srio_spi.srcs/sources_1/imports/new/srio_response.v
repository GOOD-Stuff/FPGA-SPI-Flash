//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.09.2017 13:16:39
// Design Name: 
// Module Name: srio_response
// Project Name: 
// Target Devices: xc7k325tffg676-1
// Tool Versions: Vivado - 2016.3
// Description: This module responsible of response on DSP SRIO request;
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: 
// TODO: добавить 2 счётчика: 1 - считает пакеты, 2 - считает такты.
// С возможностью сброса по ILA (и с синхронизацией по приёму)                          
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ps/1ps

module srio_response(
    input             log_clk,
    input             log_rst,
    input             dbg_rst,
    
    input      [15:0] src_id,
    input             id_override,
    
    // Regs with request data (from DSP to FPGA)
    input             axis_iorx_tvalid,
    output            axis_iorx_tready,
    input             axis_iorx_tlast,
    input      [63:0] axis_iorx_tdata,
    input      [7:0]  axis_iorx_tkeep,
    input      [31:0] axis_iorx_tuser,
    
    // Regs with response data (from FPGA to DSP)
    output reg        axis_iotx_tvalid,
    output            axis_iotx_tlast,
    output reg [63:0] axis_iotx_tdata,
    output     [7:0]  axis_iotx_tkeep,
    output     [31:0] axis_iotx_tuser,
    input             axis_iotx_tready        
    );
    
    // {{{ local parameters (constants) -----------------
    // ftype
    localparam [3:0] NREAD      = 4'h02;
    localparam [3:0] NWRITE     = 4'h05;
    localparam [3:0] SWRITE     = 4'h06;
    localparam [3:0] DOORB      = 4'h0A;
    localparam [3:0] MESSG      = 4'h0B;
    localparam [3:0] RESP       = 4'h0D;
    // ttype
    localparam [3:0] TNWR       = 4'h04;
    localparam [3:0] TNWR_R     = 4'h05;
    localparam [3:0] TNRD       = 4'h04;    
    localparam [3:0] TNDATA     = 4'h00; // no data
    localparam [3:0] MSGRSP     = 4'h01; // response to a message transaction
    localparam [3:0] TWDATA     = 4'h08; // with data    
    
    localparam RESERVE          = 1'b0;
    localparam ERROR            = 1'b1;
    // FSM    
    localparam [2:0] IDLE_S     = 3'h00;
    localparam [2:0] WAIT_REQ_S = 3'h01; // wait request    
    localparam [2:0] SEND_HD_S  = 3'h02; // send header
    localparam [2:0] SEND_DT_S  = 3'h04; // send data
    // }}} End local parameters -------------
    
    // {{{ wire declarations ----------------
    wire [15:0] dst_id;           // ID of destination device
    wire        fifo_EMPTY;       // fifo is empty, flag
    wire        fifo_FULL;        // fifo is full, flag
    wire        wr_fifo;          // write enable flag    
    reg         en_rd;            // enable for read enable
    wire        rd_fifo;          // read enable flag    
    wire [63:0] din_fifo;         // buffer of input data (into fifo)
    wire [63:0] dout_fifo;        // buffer of output data (from fifo)
    
    wire        treq_advance_condition  = axis_iorx_tready && axis_iorx_tvalid;
    wire        tresp_advance_condition = axis_iotx_tready && axis_iotx_tvalid;
    wire        request_header_accept;
    reg         d_treq_advance_condition;
                  
    // incoming packet fields
    wire [7:0]  request_tid;
    wire [3:0]  request_ftype;
    wire [3:0]  request_ttype;
    wire [7:0]  request_size;
    wire [1:0]  request_prio;
    wire [33:0] request_addr;    
    // outgoing packet fields
    wire [7:0]  response_size;
    wire [1:0]  response_prio;
    wire [7:0]  response_tid;
    wire [3:0]  response_ftype;
    wire [3:0]  response_ttype;
    reg         response_tlast = 1'b0;
    reg  [7:0]  d_response_tid;   // delay for response_tid signal 
    reg  [7:0]  d_response_size;
    reg  [3:0]  d_response_ftype;
    reg  [3:0]  d_response_ttype;         
    
    reg  [7:0]  array_tid [15:0]; // 16 8-bit elements
    
    reg  [8:0]  current_bit_cnt;     
    reg  [7:0]  count_req;        // request counter
    reg         first_bit;        // first byte (header) in request packet 
    wire        end_request;      // end of request packet
    wire        need_response;    // the package needs a response
    reg         only_header_sent; // response contains only header   
    reg  [3:0]  iter_input;       // iterator for incoming TID 
    reg  [3:0]  iter_output;      // iterator for outputting TID

    reg  [2:0]  next_state, state;
    
    reg         transm_end;       // end of transmission, flag
    reg  [7:0]  delay;            // delay counter
    reg         delay_start;      // start of count delay
    
    reg  [15:0] resp_counter;    // for debug, count response packets
    reg  [63:0] req_counter;
    reg  [63:0] time_counter;
    reg         sync_signl;
    reg         d_full, dd_full, ddd_full, dddd_full, ddddd_full;
    // }}} End of wire declarations ------------
    
    // {{{ Wire initializations ------------  
    assign din_fifo              = axis_iorx_tdata;
    assign request_header_accept = first_bit && treq_advance_condition;
    assign dst_id                = axis_iorx_tuser[31:16];
    // get data from received packet
    assign request_tid      = axis_iorx_tdata[63:56];
    assign request_ftype    = axis_iorx_tdata[55:52]; 
    assign request_ttype    = axis_iorx_tdata[51:48];
    assign request_size     = axis_iorx_tdata[43:36];
    assign request_prio     = axis_iorx_tdata[46:45] + 2'b01; 
    assign request_addr     = axis_iorx_tdata[33:0];
       
    assign response_tid     = ( request_header_accept ) ? request_tid   : d_response_tid;
    assign response_ftype   = ( request_header_accept ) ? request_ftype : d_response_ftype;
    assign response_ttype   = ( request_header_accept ) ? request_ttype : d_response_ttype;
    assign response_prio    = ( request_prio == 2'h03 ) ? ( 2'h03 ):
                                                          ( request_prio + 2'b01 ); // the priority of the answer should be greater by one
    assign response_size    = ( ( request_ftype == NREAD ) 
                            && ( treq_advance_condition == 1'b1 ) ) ? request_size : 
                                                                    d_response_size;            
    assign axis_iorx_tready = ( !fifo_FULL );   
    assign axis_iotx_tkeep  = 8'hFF;
    assign axis_iotx_tuser  = { src_id, dst_id };
    assign axis_iotx_tlast  = response_tlast;
    
    assign rd_fifo          = 1'b1; // delete
    assign wr_fifo          = treq_advance_condition && (( response_ftype == SWRITE ) || ( response_ftype == NWRITE ))//&& d_treq_advance_condition 
                            && ( !fifo_FULL ) && ( !first_bit );    
    assign end_request      = ( response_ftype == NREAD ) ? request_header_accept :
                                                            axis_iorx_tvalid && axis_iorx_tlast; 
                                                            //d_treq_advance_condition && first_bit;
    assign need_response    = (( response_ftype == NREAD ) 
                            || ( response_ftype == DOORB ) 
                            || ( response_ftype == MESSG )   
                            || ( ( response_ftype == NWRITE ) && ( response_ttype == TNWR_R ) )) 
                            && end_request ? 1'b1 : RESERVE;                                                                    
    // }}} End of wire initializations ------------
    
    // {{{ TO DELETE
    
    always @( posedge log_clk or posedge log_rst or posedge dbg_rst ) begin
        if( log_rst || dbg_rst )
            sync_signl <= 1'b0;
        else if( request_header_accept )
            sync_signl <= 1'b1;
    end
       
    always @( posedge log_clk or posedge log_rst or posedge dbg_rst ) begin
        if( log_rst || dbg_rst ) 
            time_counter <= 64'h01;
        else if( sync_signl )
            time_counter <= time_counter + 1'b1;
    end
      
    always @( posedge log_clk or posedge log_rst ) begin
        if( log_rst ) begin
            d_full    <= 1'b0;
            dd_full   <= 1'b0;
            ddd_full  <= 1'b0;
            dddd_full <= 1'b0;
            ddddd_full <= 1'b0;
        end else begin
            d_full    <= fifo_FULL;
            dd_full   <= d_full;
            ddd_full  <= dd_full;
            dddd_full <= ddd_full;
            ddddd_full <= dddd_full;
        end        
    end         
          
    // }}} TO DELETE 
    
    always @( posedge log_clk or posedge log_rst ) begin
        if( log_rst )
            resp_counter <= 8'h00;
        else if( axis_iotx_tvalid && axis_iotx_tlast )             
            resp_counter <= resp_counter + 1'b1;
    end
    
    always @( posedge log_clk or posedge log_rst or posedge dbg_rst ) begin
        if( log_rst || dbg_rst )
            req_counter <= 64'h00;
        else if( treq_advance_condition && axis_iorx_tlast && sync_signl )             
            req_counter <= req_counter + 1'b1;
    end
    
    // {{{ Check end of transmission ------------
    always @( posedge log_clk or posedge log_rst ) begin
        if( log_rst )
            delay <= 8'h00;
        else if( delay_start && ( delay != 8'h20 ) )             
            delay <= delay + 1'b1;
        else if( !delay_start || ( delay == 8'h20 ) )
            delay <= 8'h00;
    end    
    
    always @( posedge log_clk or posedge log_rst ) begin
        if( log_rst )
            transm_end <= 1'b1;
        else if( delay_start && ( delay == 8'h20 ) )
            transm_end <= 1'b1;
        else if( !delay_start )
            transm_end <= 1'b0;
    end
    // }}} End of check end of transmission -----    
    
    // Enable read first 8 bytes
    always @( posedge log_clk or posedge log_rst ) begin
        if( log_rst )
            en_rd <= 1'b1;
        else if( transm_end )
            en_rd <= 1'b1;
        else 
            en_rd <= 1'b0;
    end
    
    // {{{ Set iterators for tid's array ------------
    always @( posedge log_clk or posedge log_rst ) begin
        if( log_rst )
            iter_input = 4'h00;
        else if( axis_iorx_tvalid && axis_iorx_tlast && ( response_ftype == NREAD ) )
            iter_input = iter_input + 1'b1;            
    end
    
    always @( posedge log_clk or posedge log_rst ) begin
        if( log_rst )
            iter_output = 4'h00;
        else if( axis_iotx_tvalid && axis_iotx_tlast && ( response_ftype == NREAD )  )
            iter_output = iter_output + 1'b1;            
    end
    // }}} End of set iterators for tid's array -------
    
    // Contains request ids for serial response
    always @( posedge log_clk or posedge log_rst ) begin
        if( log_rst ) begin            
            array_tid[0]  <= 8'h00;
            array_tid[1]  <= 8'h00;
            array_tid[2]  <= 8'h00;
            array_tid[3]  <= 8'h00;
            array_tid[4]  <= 8'h00;
            array_tid[5]  <= 8'h00;
            array_tid[6]  <= 8'h00;
            array_tid[7]  <= 8'h00;
            array_tid[8]  <= 8'h00;
            array_tid[9]  <= 8'h00;
            array_tid[10] <= 8'h00;
            array_tid[11] <= 8'h00;
            array_tid[12] <= 8'h00;
            array_tid[13] <= 8'h00;
            array_tid[14] <= 8'h00;
            array_tid[15] <= 8'h00;                            
        end else if( axis_iorx_tvalid && axis_iorx_tlast && ( response_ftype == NREAD ) ) begin
            array_tid[iter_input] <= response_tid;
        end        
    end
                
    // Set some delay signals
    always @( posedge log_clk or posedge log_rst ) begin
        if( log_rst )
            d_response_tid   <= 8'h00;
        else 
            d_response_tid   <= response_tid;
    end   
       
    always @( posedge log_clk or posedge log_rst ) begin
        if( log_rst )
            d_response_size  <= 8'h00;
        else 
            d_response_size  <= response_size;
    end  
    
    always @( posedge log_clk or posedge log_rst ) begin
        if( log_rst )
            d_response_ftype <= 4'h00;
        else 
            d_response_ftype <= response_ftype;
    end        
          
    always @( posedge log_clk or posedge log_rst ) begin
        if( log_rst )
            d_response_ttype <= 4'h00;
        else 
            d_response_ttype <= response_ttype;
    end
           
    // for writing into fifo only payload data (without header)
    always @( posedge log_clk or posedge log_rst ) begin
        if( log_rst ) begin
            d_treq_advance_condition <= 1'b0;
        end else begin
            d_treq_advance_condition <= treq_advance_condition;
        end
    end
        
    // find the header of packet
    always @( posedge log_clk or posedge log_rst ) begin
        if( log_rst ) begin
            first_bit <= 1'b1;
        end else if( treq_advance_condition && axis_iorx_tlast ) begin
            first_bit <= 1'b1;
        end else if( treq_advance_condition ) begin
            first_bit <= 1'b0;
        end 
    end      
       
    // count the number of bytes transferred
    always @( posedge log_clk or posedge log_rst ) begin
        if( log_rst ) 
            current_bit_cnt <= 6'h00;
        else if( tresp_advance_condition && axis_iotx_tlast ) 
            current_bit_cnt <= 6'h00;
        else if( tresp_advance_condition && ( !axis_iotx_tlast ) && ( response_ftype == NREAD ) ) 
            current_bit_cnt <= current_bit_cnt + 4'h08;                
    end
    
    // find the last bytes of output packet    
    always @( * ) begin
        if( log_rst ) 
            response_tlast <= 1'b0;    
        else if( ( ( current_bit_cnt - 1 ) == response_size ) && tresp_advance_condition ) 
            response_tlast <= 1'b1;
        else if( only_header_sent )
            response_tlast <= 1'b1;
        else if( axis_iotx_tready || ( !axis_iotx_tvalid ) ) 
            response_tlast <= 1'b0;        
    end
   
    always @(posedge log_clk or posedge log_rst) begin
        if( log_rst ) 
            axis_iotx_tvalid <= 1'b0;
        else if( end_request && need_response ) 
            axis_iotx_tvalid <= 1'b1;
        else if( count_req > 8'h01 )
            axis_iotx_tvalid <= 1'b1;   
        else if( ( count_req == 8'h01 ) && axis_iotx_tlast ) 
            axis_iotx_tvalid <= 1'b0; 
        else if( tresp_advance_condition && axis_iotx_tlast ) 
            axis_iotx_tvalid <= 1'b0;                  
    end
    
    // Set counter of input NREAD request
    always @( posedge log_clk or posedge log_rst ) begin
        if( log_rst )
            count_req <= 8'h00;
        else if( ( axis_iorx_tlast && axis_iorx_tvalid  // if simultaneously get new request and send old response 
                && axis_iotx_tlast && axis_iotx_tvalid ) && ( response_ftype == NREAD ) )
            count_req <= count_req;
        else if( ( axis_iotx_tlast && axis_iotx_tvalid ) && ( response_ftype == NREAD ) 
                && ( count_req > 8'h00 ) )
            count_req <= count_req - 1'h01;     
        else if( ( axis_iorx_tlast && axis_iorx_tvalid ) && ( response_ftype == NREAD ) ) 
            count_req <= count_req + 1'h01;           
    end
                  
    // {{{ FSM logic ------------
    // state register
    always @( posedge log_clk or posedge log_rst ) begin
        if( log_rst ) 
            state <= IDLE_S;
        else 
            state <= next_state;
    end
    
    // next-state logic
    always @( state, need_response, end_request, axis_iotx_tlast, request_ftype ) begin
        next_state = IDLE_S;
        case( state )
            IDLE_S: begin
                next_state = WAIT_REQ_S;
            end
            
            WAIT_REQ_S: begin
                if( need_response && end_request ) 
                    next_state = SEND_HD_S;
                else
                    next_state = WAIT_REQ_S;
            end
            
            SEND_HD_S: begin
                if( response_ftype == NREAD ) 
                    next_state = SEND_DT_S;                    
                else
                    next_state = WAIT_REQ_S;                
            end
            
            SEND_DT_S: begin
                if( !axis_iotx_tlast )
                    next_state = SEND_DT_S;
                else if( count_req > 8'h01 )
                    next_state = SEND_HD_S;
                else
                    next_state = WAIT_REQ_S;
            end
            
            default: begin
                next_state = IDLE_S;
            end            
        endcase
    end                
        
    // output logic
    always @( state ) begin
        case( state )
            IDLE_S: begin                           // 0
                axis_iotx_tdata      <= 64'h00;
                            
            end
            
            WAIT_REQ_S: begin                       // 1
                axis_iotx_tdata      <= 64'h00;                
                only_header_sent     <= 1'b0;
                
                    
                delay_start          <= 1'b1;                           
            end
            
            SEND_HD_S: begin                        // 2
                delay_start          <= 1'b0;                
                if( ( response_ftype != NREAD ) && axis_iotx_tready ) begin
                    axis_iotx_tdata  <= { response_tid, RESP, TNDATA, 1'b0, response_prio, 
                                          1'b0, 8'h00, RESERVE, 35'h00 };
                    only_header_sent <= 1'b1;

                end else begin
                    axis_iotx_tdata  <= { array_tid[iter_output], RESP, TWDATA, 1'b0, response_prio, 
                                          1'b0, 8'h00, RESERVE, 35'h00 };
                    only_header_sent <= 1'b0;
                                                      
                end          
            end
            
            SEND_DT_S: begin                        // 4                
                delay_start          <= 1'b0;
                if( axis_iotx_tready )
                    axis_iotx_tdata  <= dout_fifo;                                           

            end
            
            default: begin
             //   axis_iotx_tdata     <= 64'h00;               
            end
            
        endcase
    end       
    // }}} End of FSM logic ------------
    
    // {{{ Include other modules ------------
    dbg_ila ila_ip(
        .clk     ( log_clk                  ),    
                
        .probe0  ( din_fifo                 ),
        .probe1  ( dout_fifo                ),
        .probe2  ( wr_fifo                  ),
        .probe3  ( rd_fifo                  ),
        
        .probe4  ( axis_iorx_tlast          ),
        .probe5  ( axis_iorx_tvalid         ),
        .probe6  ( axis_iorx_tready         ),                                
        .probe7  ( axis_iorx_tdata          ),            

        .probe8  ( only_header_sent         ),
        
        .probe9  ( axis_iotx_tlast          ),
        .probe10 ( axis_iotx_tvalid         ),
        .probe11 ( axis_iotx_tready         ),        
        .probe12 ( axis_iotx_tdata          ),
                                     
        .probe13 ( first_bit                ),
        .probe14 ( need_response            ),
        .probe15 ( end_request              ),
        .probe16 ( treq_advance_condition   ),
        .probe17 ( d_treq_advance_condition ),
        .probe18 ( tresp_advance_condition  ),
                
        .probe19 ( current_bit_cnt          ),
        .probe20 ( count_req                ),                     
                
        .probe21 ( state                    ),
        .probe22 ( next_state               ),
        .probe23 ( fifo_EMPTY               ),
        .probe24 ( fifo_FULL                ),
        .probe25 ( response_size            ),        
        .probe26 ( response_ftype           ),
        .probe27 ( req_counter              ),
        .probe28 ( resp_counter             ),
        .probe29 ( time_counter             ),
        .probe30 ( dbg_rst                  ),
        .probe31 ( sync_signl               )          
        /*.probe27 ( en_rd                    ),
        .probe28 ( delay_start              ),
        .probe29 ( transm_end               ),
        .probe30 ( delay                    )*/               
    );
           
    fifo_generator_rx_inst fifo_rx_ip(
        .rst     ( log_rst    ),      // input
        .clk     ( log_clk    ),      // input
        .din     ( din_fifo   ),      // input
        .wr_en   ( wr_fifo    ),      // input
        .rd_en   ( rd_fifo    ),      // input
        .dout    ( dout_fifo  ),
        .full    ( fifo_FULL  ),
        .empty   ( fifo_EMPTY )        
        //.rd_data_count (rd_data_count),
        //.wr_data_count (wr_data_count),
        //.prog_full     (fifo_ALMOSTFULL),
        //.prog_empty    (fifo_ALMOSTEMPTY)
    );
    // }}} End of Include other modules ------------
    
endmodule
