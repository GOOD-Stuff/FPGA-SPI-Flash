`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: VlSU
// Engineer: Gustov Vladimir
// 
// Create Date: 12.12.2017 10:56:54
// Design Name: srio_spi
// Module Name: spi_loader_top
// Project Name: spi_flash_programmer
// Target Devices:  XC7K160TFFQ676-2 (Kintex-7)
// Tool Versions: Vivado 2016.3
// Description: This module is wrapper under SPI Flash programmer
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module spi_loader_top(
    input         CLK_I,
    input         RST_I,
    input  [31:0] DATA_TO_PROG_I,
    input  [23:0] START_ADDR_I,
    input  [15:0] PAGE_COUNT_I,
    input  [11:0] SECTOR_COUNT_I,
    output        SPI_CS_O,
    output        SPI_MOSI_O,
    input         SPI_MISO_I    
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
    reg  [4:0]  data_counter;
    wire        write_done;
    
    //wire [23:0] start_addr;
    reg         start_addr_valid;
    //wire [15:0] page_count;
    reg         page_count_valid;
    //wire [11:0] sector_count;
    reg         sector_count_valid;
    reg         start_erase;
    wire        erasing_spi;
    
    reg         fifo_wren;
    wire        fifo_full;
    wire        fifo_empty;
    wire        overflow;
    // }}} End of wire declarations ------------
        
        
    // {{{ Wire initializations ------------ 
    
    // }}} End of wire initializations ------------
    
    always @(posedge CLK_I) begin
        if (RST_I)
            counter <= 5'h00;
        else
            counter <= counter + 1'b1;
    end
    
    always @(posedge CLK_I) begin
        if (RST_I)
            data_counter <= 5'h00;
        else if (state == DATA_S)
            data_counter <= data_counter + 1'b1;
    end


    // {{{ FSM logic ------------    
    always @(posedge CLK_I) begin
        if (RST_I)
            state <= IDLE_S;
        else
            state <= next_state;
    end
    
    always @(state, counter, erasing_spi, write_done) begin
        next_state = IDLE_S;    
        case (state)
            IDLE_S: begin
                next_state = ERASE_S;
            end
            
            ERASE_S: begin
                if ((counter == 5'd31) && (erasing_spi == 1'b0))
                    next_state = ALIGN_S;
                else
                    next_state = ERASE_S;
            end
            
            ALIGN_S: begin
                if (counter == 5'h31) // ?
                    next_state = DATA_S;
                else
                    next_state = ALIGN_S;
            end
            
            DATA_S: begin
                if (write_done == 1'b1)
                    next_state = IDLE_S;
                else  
                    next_state = DATA_S;
            end            
        endcase
    end
    
    always @(state) begin
        case (state)
            IDLE_S: begin
                start_erase        <= 1'b0;
                sector_count_valid <= 1'b1;
                start_addr_valid   <= 1'b1;
                page_count_valid   <= 1'b1;                 
            end
            
            ERASE_S: begin
                start_erase <= 1'b1;                
                if (counter == 5'd31) begin
                    start_erase <= 1'b0;
                    if (erasing_spi == 1'b0) begin
                        sector_count_valid <= 1'b0;
                        start_addr_valid   <= 1'b0;
                        page_count_valid   <= 1'b0;
                    end                   
                end
            end
            
            ALIGN_S: begin
                counter <= counter + 1'b1;                
            end
            
            DATA_S: begin // TODO !                
                if (data_counter == 5'd31)
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
        .LOG_CLK_I             ( CLK_I              ),               
        .LOG_RST_I             ( RST_I              ),
                                      
        .DATA_TO_FIFO_I        ( DATA_TO_PROG_I     ),
        .START_ADDR_I          ( START_ADDR_I       ),
        .START_ADDR_VALID_I    ( start_addr_valid   ),
        .PAGE_COUNT_I          ( PAGE_COUNT_I       ),
        .PAGE_COUNT_VALID_I    ( page_count_valid   ),
        .SECTOR_COUNT_I        ( SECTOR_COUNT_I     ),
        .SECTOR_COUNT_VALID_I  ( sector_count_valid ),
                              
        .FIFO_WREN_I           ( fifo_wren          ),
        .FIFO_FULL_O           ( fifo_full          ),
        .FIFO_EMPTY_O          ( fifo_empty         ),
        .FIFO_WRERR_O          ( overflow           ),
        .WRITE_DONE_O          ( write_done         ),
                                      
        .ERASE_I               ( start_erase        ),
        .ERASEING_O            ( erasing_spi        ),

        .SPI_CS_O              ( SPI_CS_O           ),
        .SPI_MOSI_O            ( SPI_MOSI_O         ),
        .SPI_MISO_I            ( SPI_MISO_I         )
    );              
    // }}} End of Include other modules ------------
endmodule
