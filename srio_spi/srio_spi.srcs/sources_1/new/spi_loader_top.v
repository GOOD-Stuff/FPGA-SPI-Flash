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
    input         CLK_I,            // Synchro signal
    input         SRST_I,           // Reset synchro signal
    input  [63:0] DATA_TO_PROG_I,   // Data to write into SPI Flash
    input  [23:0] START_ADDR_I,     // Address of SPI Flash for write
    input  [15:0] PAGE_COUNT_I,     // Count of page of SPI Flash for write
    input  [11:0] SUBSECTOR_COUNT_I,// Count of subsector of SPI Flash for write
    output        STOP_WRITE_O,     // FIFO is full, must wait while it will be release    
    output        SPI_CS_O,         // Chip Select signal for SPI Flash
    output        SPI_MOSI_O,       // Master Ouput Slave Input
    input         SPI_MISO_I        // Master Input Slave Output
    );
    
    // {{{ local parameters (constants) --------
    // FSM
        localparam [2:0] IDLE_S       = 3'h00;  // Set validation of data
        localparam [2:0] ERASE_S      = 3'h01;  // Start erase process
        localparam [2:0] WAIT_ERASE_S = 3'h02;  // Wait while SPI Flash erasing
        localparam [2:0] ALIGN_S      = 3'h03;  // Segmentation data to SPI
        localparam [2:0] DATA_S       = 3'h04;  // Send data to SPI
    // }}} End local parameters -------------
    
    // {{{ Wire declarations ----------------
        reg  [2:0]  state, next_state;
        reg  [4:0]  counter;
        reg  [4:0]  data_counter;
        wire        write_done;
        
        //wire [23:0] start_addr;
        reg         start_addr_valid = 1'b0;
        //wire [15:0] page_count;
        reg         page_count_valid = 1'b0;
        //wire [11:0] sector_count;
        reg         subsector_count_valid = 1'b0;
        reg         start_erase = 1'b0;
        reg         start_write = 1'b0;
        reg         stop_write  = 1'b0;
        wire        erasing_spi;
        
        reg         fifo_wren = 1'b0;
        wire        fifo_full;
        wire        fifo_empty;
        wire        overflow;
    // }}} End of wire declarations ------------
        
        
    // {{{ Wire initializations ------------ 
        assign STOP_WRITE_O = stop_write;        
        //assign STOP_WRITE_O = (fifo_full) ? 0 : 1;
    // }}} End of wire initializations ------------
    
    always @(posedge CLK_I) begin
        if (SRST_I)
            counter <= 5'h00;
        else
            counter <= counter + 1'b1;
    end
    
    always @(posedge CLK_I) begin
        if (SRST_I)
            data_counter <= 5'h00;
        else if (stop_write)
            data_counter <= data_counter + 1'b1;
    end

    // {{{ FSM logic ------------    
    always @(posedge CLK_I) begin
        if (SRST_I)
            state <= IDLE_S;
        else
            state <= next_state;
    end
    
    always @(state, counter, erasing_spi, write_done) begin
        next_state = IDLE_S;    
        case (state)
            IDLE_S: begin                               // 0
                next_state = ERASE_S;
            end
            
            ERASE_S: begin                              // 1
                next_state = WAIT_ERASE_S;
            end

            WAIT_ERASE_S: begin                         // 2
                if (!erasing_spi && (counter == 5'd31))
                    next_state = ALIGN_S;
                else
                    next_state = WAIT_ERASE_S;
            end
            
            ALIGN_S: begin                              // 3
                next_state = DATA_S;
            end
            
            DATA_S: begin                               // 4
                if (write_done)
                    next_state = IDLE_S;                
                else
                    next_state = DATA_S;
            end     

            default: begin
                next_state = IDLE_S;
            end       
        endcase
    end
    
    always @(state) begin
        case (state)    
            IDLE_S: begin                               // 0
                subsector_count_valid <= 1'b1;
                start_addr_valid      <= 1'b1;                
                page_count_valid      <= 1'b1;
                fifo_wren             <= 1'b0;
                start_erase           <= 1'b0;
                start_write           <= 1'b0;
                stop_write            <= 1'b0;                
            end
                
            ERASE_S: begin                              // 1
                start_erase               <= 1'b1;
            end
            
            WAIT_ERASE_S: begin                         // 2
                start_erase               <= 1'b0;
                if (!erasing_spi) 
                    subsector_count_valid <= 1'b0;            
            end

            ALIGN_S: begin                              // 3
                fifo_wren             <= 1'b1;
                start_write           <= 1'b1;
            end
            
            DATA_S: begin                               // 4
                //start_write    <= 1'b0;    
                if (fifo_full) begin
                    stop_write <= 1'b1;
                    fifo_wren  <= 1'b0;
                end else if (data_counter == 5'h1F)begin
                    stop_write <= 1'b0;
                    fifo_wren  <= 1'b1;
                end 
            end
            
            default: begin
                start_erase           <= 1'b0;
                subsector_count_valid <= 1'b0;
                start_addr_valid      <= 1'b0;                
                page_count_valid      <= 1'b0;
                stop_write            <= 1'b1;
                fifo_wren             <= 1'b0;
            end
        endcase
    end
    // }}} End of FSM logic ------------
    
    
    // {{{ Include other modules ------------
    spi_flash_programmer spi_prog(
        .LOG_CLK_I             ( CLK_I              ),               
        .LOG_RST_I             ( SRST_I              ),
                                      
        .DATA_TO_FIFO_I        ( DATA_TO_PROG_I     ),
        .START_ADDR_I          ( START_ADDR_I       ),
        .START_ADDR_VALID_I    ( start_addr_valid   ),
        .PAGE_COUNT_I          ( PAGE_COUNT_I       ),
        .PAGE_COUNT_VALID_I    ( page_count_valid   ),
        .SECTOR_COUNT_I        ( SUBSECTOR_COUNT_I     ),
        .SECTOR_COUNT_VALID_I  ( subsector_count_valid ),
                              
        .FIFO_WREN_I           ( fifo_wren          ),
        .FIFO_FULL_O           ( fifo_full          ),
        .FIFO_EMPTY_O          ( fifo_empty         ),        
        .WRITE_DONE_O          ( write_done         ),
                                      
        .ERASE_I               ( start_erase        ),
        .WRITE_I               ( start_write        ),
        .ERASEING_O            ( erasing_spi        ),

        .SPI_CS_O              ( SPI_CS_O           ),
        .SPI_MOSI_O            ( SPI_MOSI_O         ),
        .SPI_MISO_I            ( SPI_MISO_I         )
    );              
    // }}} End of Include other modules ------------
endmodule
