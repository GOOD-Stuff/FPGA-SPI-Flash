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

    input  [2:0]  CMD_I,            // Command (erase/write/read)

    input  [7:0]  DATA_TO_PROG_I,   // Data to write into SPI Flash
    
    input  [23:0] START_ADDR_I,     // Address of SPI Flash for write
    input  [15:0] PAGE_COUNT_I,     // Count of page of SPI Flash for write
    input  [7:0]  SECTOR_COUNT_I,   // Count of sector of SPI Flash for write
    output [7:0]  DATA_FROM_SPI_O,  // Received data from SPI memory

    input         START_FLASH_I,    // Start of program (and erase)  
    output        STOP_WRITE_O,     // FIFO is full, must wait while it will be release    
    output        ERASE_BUSY_O,     // The signal of module when it busy erasing memory
    output        ERASE_DONE_O,     // The signal of module when it has completed erasing
    output        WRITE_DONE_O,     // The signal of module when it has completed writing
    output        READ_DONE_O,

    output        SPI_CS_O,         // Chip Select signal for SPI Flash
    output        SPI_MOSI_O,       // Master Ouput Slave Input
    input         SPI_MISO_I        // Master Input Slave Output
    );
    
    // {{{ local parameters (constants) --------
    // CMD
        localparam [2:0] ERASE_SUB    = 3'h00; // Erase SubSector
        localparam [2:0] ERASE_SEC    = 3'h01; // Erase SEctor
        localparam [2:0] ERASE_CHIP   = 3'h02; // Erase (Bulk) Chip
        localparam [2:0] WRITE_DATA   = 3'h03; // Write data
        localparam [2:0] WRITE_HEADER = 3'h04; // Write header (not implemented)
        localparam [2:0] READ_DATA    = 3'h05; // XXX: on future
    // FSM
        localparam [3:0] IDLE_S       = 4'h00; // Set validation of data
        localparam [3:0] PARSE_CMD_S  = 4'h01;                
        localparam [3:0] ERASE_S      = 4'h02; // Wait while SPI Flash erasing
        localparam [3:0] ERASE_DONE_S = 4'h03; // Start erase subsector        
        localparam [3:0] WRITE_DATA_S = 4'h04; // Send data to SPI
        localparam [3:0] READ_S       = 4'h05; // XXX: on future
    // }}} End local parameters -------------
    
    // {{{ Wire declarations ----------------
    // FSM
        reg  [3:0]  state, next_state;
    // Counters
        reg  [1:0]  counter            = 2'h00; // for some delay
        reg  [5:0]  data_counter       = 6'h00;
    // Control signals
        reg         erase_done         = 1'b0;        
        wire        write_done;
        wire        read_done; // XXX: on future
        wire        load_valid;
        wire [2:0]  cmd;
    // Continuous signals
        reg         strt_sect_erase    = 1'b0;
        reg         strt_subs_erase    = 1'b0;        
        reg         start_write        = 1'b0;
        reg         stop_write         = 1'b1;
        reg         erase_busy         = 1'b0;
        wire        erasing_spi;
        reg         start_read         = 1'b0;
    // Memory signals (address, pages, etc.)
        reg         start_addr_valid   = 1'b0;
        reg         page_count_valid   = 1'b0;
        reg         sector_count_valid = 1'b0;
    // FIFO
        reg         fifo_wren          = 1'b0;
        wire        fifo_full;
        wire        fifo_empty;        
    // }}} End of wire declarations ------------
        
        
    // {{{ Wire initializations ------------ 
        assign load_valid   = START_FLASH_I && (!write_done);
        assign cmd          = CMD_I;                
        assign STOP_WRITE_O = stop_write;   
        assign ERASE_DONE_O = erase_done;  
        assign WRITE_DONE_O = write_done & (!load_valid);        
        assign READ_DONE_O  = read_done;
        assign ERASE_BUSY_O = erase_busy;
        //assign STOP_WRITE_O = (fifo_full) ? 0 : 1;
    // }}} End of wire initializations ------------


    always @(posedge CLK_I) begin
        if (SRST_I)
            counter <= 2'h00;
        else
            counter <= counter + 1'b1;
    end
    
    always @(posedge CLK_I) begin
        if (SRST_I)
            data_counter <= 6'h00;
        else if (!stop_write)
            data_counter <= 6'h00;
        else
            data_counter <= data_counter + 1'b1;            
    end


    // {{{ FSM logic ------------    
    always @(posedge CLK_I) begin
        if (SRST_I)
            state <= IDLE_S;
        else
            state <= next_state;
    end
    
    always @(state, load_valid, cmd, counter, erasing_spi, write_done, read_done) begin
        next_state = IDLE_S;    
        case (state)
            IDLE_S: begin                                   // 0
                if (load_valid)
                    next_state = PARSE_CMD_S;
                else 
                    next_state = IDLE_S;
            end
            
            PARSE_CMD_S: begin                              // 1
                if (cmd == ERASE_SEC || cmd == ERASE_SUB || cmd == ERASE_CHIP)
                    next_state = ERASE_S;
                else if (cmd == WRITE_DATA)
                    next_state = WRITE_DATA_S;
                else if (cmd == READ_DATA)
                    next_state = READ_S;
                else
                    next_state = PARSE_CMD_S;
            end

            ERASE_S: begin                                   // 2
                if (!erasing_spi && (counter == 2'h03))
                    next_state = ERASE_DONE_S;
                else
                    next_state = ERASE_S;
            end
            
            ERASE_DONE_S: begin                              // 3   
                next_state = IDLE_S;
            end
            
            WRITE_DATA_S: begin                              // 4
                if (write_done)
                    next_state = IDLE_S;                
                else
                    next_state = WRITE_DATA_S;
            end     

            READ_S: begin
                if (read_done)
                    next_state = IDLE_S;
                else
                    next_state = READ_S;
            end

            default: begin
                next_state = IDLE_S;
            end       
        endcase
    end
    
    always @(state, fifo_full, data_counter, load_valid) begin
        case (state)    
            IDLE_S: begin                               // 0
                if (load_valid) begin
                    sector_count_valid <= 1'b1;
                    start_addr_valid   <= 1'b1;                
                    page_count_valid   <= 1'b1;
                end else begin
                    sector_count_valid <= 1'b0;
                    start_addr_valid   <= 1'b0;                
                    page_count_valid   <= 1'b0;
                end
                erase_done             <= 1'b0;
                strt_sect_erase        <= 1'b0;
                strt_subs_erase        <= 1'b0;                                
                start_write            <= 1'b0;
                start_read             <= 1'b0;
                stop_write             <= 1'b1;                
                erase_busy             <= 1'b0;
                fifo_wren              <= 1'b0;
            end
               
            PARSE_CMD_S: begin                          // 1
                if (cmd == ERASE_SEC) begin                    
                    strt_sect_erase <= 1'b1;
                end else if (cmd == ERASE_SUB)  begin                    
                    strt_subs_erase <= 1'b1;
                end else if (cmd == ERASE_CHIP) begin
                    strt_sect_erase <= 1'b1;
                    sector_count_valid <= 1'b0;
                end else if (cmd == WRITE_DATA) begin
                    fifo_wren              <= 1'b1;
                    stop_write             <= 1'b0;
                    start_write            <= 1'b1;
                end else if (cmd == READ_DATA) begin
                    start_read             <= 1'b1;
                end
            end    

            ERASE_S: begin                             // 2
                erase_busy             <= 1'b1;
                strt_sect_erase        <= 1'b0;
                strt_subs_erase        <= 1'b0;
            end

            ERASE_DONE_S: begin                        // 3
                erase_busy <= 1'b0;
                erase_done <= 1'b1;
                stop_write <= 1'b0;
            end
          
            WRITE_DATA_S: begin                        // 4
                //start_write    <= 1'b0;    
                if (fifo_full) begin
                    stop_write <= 1'b1;
                    fifo_wren  <= 1'b0;
                end else if (data_counter == 6'h3F)begin
                    stop_write <= 1'b0;
                    fifo_wren  <= 1'b1;
                end 
            end
            
            READ_S: begin

            end

            default: begin
                strt_sect_erase       <= 1'b0;
                sector_count_valid    <= 1'b0;
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
        .LOG_RST_I             ( SRST_I             ),
                                      
        .DATA_TO_FIFO_I        ( DATA_TO_PROG_I     ),
        .START_ADDR_I          ( START_ADDR_I       ),
        .START_ADDR_VALID_I    ( start_addr_valid   ),
        .PAGE_COUNT_I          ( PAGE_COUNT_I       ),
        .PAGE_COUNT_VALID_I    ( page_count_valid   ),
        .SECTOR_COUNT_I        ( SECTOR_COUNT_I     ),
        .SECTOR_COUNT_VALID_I  ( sector_count_valid ),
        .DATA_FROM_SPI_O       ( DATA_FROM_SPI_O    ),
                                      
        .FIFO_WREN_I           ( fifo_wren          ),
        .FIFO_FULL_O           ( fifo_full          ),
        .FIFO_EMPTY_O          ( fifo_empty         ),        
        .WRITE_DONE_O          ( write_done         ),
                                      
        .SECT_ERASE_I          ( strt_sect_erase    ),
        .SSECT_ERASE_I         ( strt_subs_erase    ),
        .WRITE_I               ( start_write        ),
        .READ_I                ( start_read         ),
        .ERASEING_O            ( erasing_spi        ),
        .READ_DONE_O           ( read_done          ),

        .SPI_CS_O              ( SPI_CS_O           ),
        .SPI_MOSI_O            ( SPI_MOSI_O         ),
        .SPI_MISO_I            ( SPI_MISO_I         )
    );              
    // }}} End of Include other modules ------------
endmodule
