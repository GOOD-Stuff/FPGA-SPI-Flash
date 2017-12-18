`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: VlSU
// Engineer: Gustov Vladimir
// 
// Create Date: 12.12.2017 10:56:54
// Design Name: 
// Module Name: spi_loader_top
// Project Name: 
// Target Devices: 
// Tool Versions: Vivado 2016.3
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module spi_loader_top(
    input        log_clk,
    input        log_rst,
    input [31:0] data_to_prog,
    output       SPI_CS    
    );
    
    // {{{ local parameters (constants) --------
    // FSM
    localparam [1:0] IDLE_S  = 2'h00;
    localparam [1:0] ERASE_S = 2'h01;
    localparam [1:0] ALIGN_S = 2'h02;
    localparam [1:0] DATA_S  = 2'h03; 
    // }}} End local parameters -------------
    
    // {{{ Wire declarations ----------------
    reg  [1:0]  state, next_state;
    reg  [4:0]  counter;
    
    wire [31:0] start_addr;
    wire        start_addr_valid;
    wire [16:0] page_count;
    wire        page_count_valid;
    wire [13:0] sector_count;
    wire        sector_count_valid;
    reg         start_erase;
    wire        erasing_spi;
    
    reg         fifo_wren;
    wire        fifo_full;
    wire        fifo_empty;
    wire        overflow;
    // }}} End of wire declarations ------------
        
        
    // {{{ Wire initializations ------------ 
    
    // }}} End of wire initializations ------------
    
    
    // {{{ FSM logic ------------    
    always @(posedge log_clk or posedge log_rst) begin
        if (log_rst)
            state <= IDLE_S;
        else
            state <= next_state;
    end
    
    always @(state) begin
        next_state = IDLE_S;    
        case (state)
            IDLE_S: begin
                next_state = ERASE_S;
            end
            
            ERASE_S: begin
                if (erasing_spi == 1'b0)
                    next_state = ALIGN_S;
                else
                    next_state = ERASE_S;
            end
            
            ALIGN_S: begin
                if (counter == 5'h0A)
                    next_state = DATA_S;
                else
                    next_state = ALIGN_S;
            end
            
            DATA_S: begin
                next_state = IDLE_S;
            end            
        endcase
    end
    
    always @(state) begin
        case (state)
            IDLE_S: begin
                // ???
            end
            
            ERASE_S: begin
                start_erase <= 1'b1;
                if (counter == 5'd31) begin
                    start_erase <= 1'b0;
                    // ???
                end
            end
            
            ALIGN_S: begin
                // ++;
            end
            
            DATA_S: begin
                if (counter == 5'h0B)
                    fifo_wren <= 1'b1;
                else
                    fifo_wren <= 1'b0;
            end
            
            default: begin
            end
        endcase
    end
    // }}} End of FSM logic ------------
    
    
    // {{{ Include other modules ------------
    spi_flash_programmer spi_prog(
        .log_clk             ( log_clk            ),               
        .log_rst             ( log_rst            ),
                                   
        .data_to_fifo        ( data_to_prog       ),
        .start_addr          ( start_addr         ),
        .start_addr_valid    ( start_addr_valid   ),
        .page_count          ( page_count         ),
        .page_count_valid    ( page_count_valid   ),
        .sector_count        ( sector_count       ),
        .sector_count_valid  ( sector_count_valid ),
                          
        .fifo_wren           ( fifo_wren          ),
        .fifo_full           ( fifo_full          ),
        .fifo_empty          ( fifo_empty         ),
        .fifo_wrerr          ( overflow           ),
        .write_done          ( ),
                                   
        .erase               ( start_erase        ),
        .eraseing            ( erasing_spi        ),

        .SPI_CS              ( SPI_CS             )
    );    
    // }}} End of Include other modules ------------
endmodule
