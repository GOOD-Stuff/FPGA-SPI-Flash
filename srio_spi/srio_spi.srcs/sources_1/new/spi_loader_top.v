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
/*           __________
CMD_DVI     |          | CMD_FIFO_EMPTY
----------->|          |--------------------------------->
CMD 3       |          | CMD_FIFO_FULL
----/------>|   FIFO   |--------------------------------->
ST_ADDR 24  |          |
---------/->|          |
PG_CNT 16   |          |
-------/--->|          |
ST_CNT 8    |          |
-------/--->|          |        _______
            |__________|       |       |
                               | FIFO  |
DATA_DVI                       |       |DATA_FIFO_PFULL
------------------------------>|       |----------------->
DATA_TO_PROG                   |       |
------------------------------>|       |
                               |_______|
*/

// TODO: DVO - 8 тактов; 1 такт == 1 байт
module spi_loader_top(
    input         CLK_I,            // Synchro signal
    input         SRST_I,           // Reset synchro signal

    input         CMD_DVI_I,
    input  [2:0]  CMD_I,            // Command (erase/write/read)        
    input  [23:0] START_ADDR_I,     // Address of SPI Flash for write
    input  [15:0] PAGE_COUNT_I,     // Count of page of SPI Flash for write
    input  [7:0]  SECTOR_COUNT_I,   // Count of sector of SPI Flash for write    

    input         DATA_DVI_I,
    input  [31:0] DATA_TO_PROG_I,   // Data to write into SPI Flash

    output        DATA_DVO_O,
    output [7:0]  DATA_OUT_O,       // Received data from SPI memory

    output        CMD_FIFO_EMPTY_O,  // The signal of module when it has completed erasing
    output        CMD_FIFO_FULL_O,   // The signal of module when it has completed writing
    output        DATA_FIFO_PFULL_O, // FIFO is full, must wait while it will be release    
    

    output        SPI_CS_O,         // Chip Select signal for SPI Flash
    output        SPI_MOSI_O,       // Master Output Slave Input
    input         SPI_MISO_I        // Master Input Slave Output
    );
    
    // {{{ local parameters (constants) --------
    // CMD
        localparam [2:0] ERASE_SUB    = 3'h00; // Erase SubSector
        localparam [2:0] ERASE_SEC    = 3'h01; // Erase SEctor
        localparam [2:0] ERASE_CHIP   = 3'h02; // Erase (Bulk) Chip
        localparam [2:0] WRITE_DATA   = 3'h03; // Write data
        localparam [2:0] WRITE_HEADER = 3'h04; // Write header (not implemented)
        localparam [2:0] READ_DATA    = 3'h05; // Read data
    // FSM
        localparam [3:0] IDLE_S       = 4'h00; // Set validation of data
        localparam [3:0] GET_FIFO_S   = 4'h01; // Read from command FIFO
        localparam [3:0] PARSE_CMD_S  = 4'h02;                
        localparam [3:0] ERASE_S      = 4'h03; // Wait while SPI Flash erasing
        localparam [3:0] ERASE_DONE_S = 4'h04; // Start erase subsector        
        localparam [3:0] WRITE_DATA_S = 4'h05; // Send data to SPI
        localparam [3:0] READ_S       = 4'h06; // Read data
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
        reg  [2:0]  cmd                = 3'h00;
        wire        cmd_dvi;
        reg         data_dvo           = 1'b0;
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
        reg  [23:0] start_address      = 24'h00;
        reg  [15:0] page_count         = 16'h00;
        reg  [7:0]  sector_count       = 8'h00;
    // FIFO
        wire        cmd_fifo_full;
        wire        cmd_fifo_empty;
        wire [51:0] cmd_fifo_dout;
        wire [51:0] cmd_fifo_din;
        reg         cmd_fifo_rdend     = 1'b0;
        wire        data_fifo_wren;
        wire        data_fifo_full;
        wire        data_fifo_empty;        
    // }}} End of wire declarations ------------
        
        
    // {{{ Wire initializations ------------ 
        assign cmd_fifo_din   = {CMD_DVI_I, CMD_I, START_ADDR_I, 
                                PAGE_COUNT_I, SECTOR_COUNT_I};
        assign load_valid     = !cmd_fifo_empty;
        assign cmd_dvi        = cmd_fifo_dout[51];
        /*assign cmd            = cmd_fifo_dout[50:48];                
        assign start_address  = cmd_fifo_dout[47:24];
        assign page_count     = cmd_fifo_dout[23:8];
        assign sector_count   = cmd_fifo_dout[7:0];*/

        assign data_fifo_wren = (!data_fifo_full) ? DATA_DVI_I : 1'b0;

//        assign DATA_DVO_O     = data_dvo;
        assign DATA_FIFO_PFULL_O   = data_fifo_full;           
        assign CMD_FIFO_FULL_O     = cmd_fifo_full;
        assign CMD_FIFO_EMPTY_O   = cmd_fifo_empty;        
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
    
    always @(*) begin
        next_state = IDLE_S;    
        case (state)
            IDLE_S: begin                                   // 0
                if (load_valid)
                    next_state = GET_FIFO_S;
                else 
                    next_state = IDLE_S;
            end
            
            GET_FIFO_S: begin                               // 1
                next_state     = PARSE_CMD_S;
            end

            PARSE_CMD_S: begin                              // 2
                if (cmd == ERASE_SEC || cmd == ERASE_SUB || cmd == ERASE_CHIP)
                    next_state = ERASE_S;
                else if (cmd == WRITE_DATA)
                    next_state = WRITE_DATA_S;
                else if (cmd == READ_DATA)
                    next_state = READ_S;
                else
                    next_state = PARSE_CMD_S;
            end

            ERASE_S: begin                                   // 3
                if (!erasing_spi && (counter == 2'h03))
                    next_state = ERASE_DONE_S;
                else
                    next_state = ERASE_S;
            end
            
            ERASE_DONE_S: begin                              // 4   
                next_state     = IDLE_S;
            end
            
            WRITE_DATA_S: begin                              // 5
                if (write_done)
                    next_state = IDLE_S;                
                else
                    next_state = WRITE_DATA_S;
            end     

            READ_S: begin                                    // 6
                if (read_done)
                    next_state = IDLE_S;
                else
                    next_state = READ_S;
            end

            default: begin
                next_state     = IDLE_S;
            end       
        endcase
    end
    
    always @(*) begin
        case (state)    
            IDLE_S: begin                               // 0               
                sector_count_valid     = 1'b0;
                start_addr_valid       = 1'b0;                
                page_count_valid       = 1'b0;
                erase_done             = 1'b0;  // delete?
                strt_sect_erase        = 1'b0;
                strt_subs_erase        = 1'b0;                                
                start_write            = 1'b0;
                data_dvo               = 1'b0;
                start_read             = 1'b0;                
                erase_busy             = 1'b0;                
            end
               
            GET_FIFO_S: begin                           // 1
                cmd_fifo_rdend         = 1'b1;
                if (cmd_dvi) begin
                    sector_count_valid = 1'b1;
                    start_addr_valid   = 1'b1;                
                    page_count_valid   = 1'b1;
                    cmd                = cmd_fifo_dout[50:48];
                    start_address      = cmd_fifo_dout[47:24];
                    page_count         = cmd_fifo_dout[23:8];
                    sector_count       = cmd_fifo_dout[7:0];
                end else begin
                    sector_count_valid = 1'b0;
                    start_addr_valid   = 1'b0;                
                    page_count_valid   = 1'b0;
                end

            end

            PARSE_CMD_S: begin                          // 2
                cmd_fifo_rdend         = 1'b0;
                if (cmd == ERASE_SEC) begin                    
                    strt_sect_erase    = 1'b1;
                end else if (cmd == ERASE_SUB)  begin                    
                    strt_subs_erase    = 1'b1;
                end else if (cmd == ERASE_CHIP) begin
                    strt_sect_erase    = 1'b1;
                    sector_count_valid = 1'b0;
                end else if (cmd == WRITE_DATA) begin                                        
                    start_write        = 1'b1;
                end else if (cmd == READ_DATA) begin
                    start_read         = 1'b1;
                end
            end    

            ERASE_S: begin                             // 3
                erase_busy             = 1'b1;
                strt_sect_erase        = 1'b0;
                strt_subs_erase        = 1'b0;
            end

            ERASE_DONE_S: begin                        // 4
                erase_busy             = 1'b0;
                erase_done             = 1'b1;               
            end
          
            WRITE_DATA_S: begin                        // 5                
                
            end
            
            READ_S: begin                              // 6
                if (read_done)
                    data_dvo           = 1'b1;
            end

            default: begin
                strt_sect_erase        = 1'b0;
                sector_count_valid     = 1'b0;
                start_addr_valid       = 1'b0;                
                page_count_valid       = 1'b0;
                stop_write             = 1'b1;                
            end
        endcase
    end
    // }}} End of FSM logic ------------
    
    
    // {{{ Include other modules ------------
    spi_flash_programmer spi_prog (
        .LOG_CLK_I             ( CLK_I              ),               
        .LOG_RST_I             ( SRST_I             ),
                                      
        .DATA_TO_FIFO_I        ( DATA_TO_PROG_I     ),
        .START_ADDR_I          ( start_address      ),
        .START_ADDR_VALID_I    ( start_addr_valid   ),
        .PAGE_COUNT_I          ( page_count         ),
        .PAGE_COUNT_VALID_I    ( page_count_valid   ),
        .SECTOR_COUNT_I        ( sector_count       ),
        .SECTOR_COUNT_VALID_I  ( sector_count_valid ),
        .DATA_FROM_SPI_O       ( DATA_OUT_O         ),
                                      
        .FIFO_WREN_I           ( data_fifo_wren     ),
        .FIFO_FULL_O           ( data_fifo_full     ),
        .FIFO_EMPTY_O          ( data_fifo_empty    ),        
        .WRITE_DONE_O          ( write_done         ),
                                      
        .SECT_ERASE_I          ( strt_sect_erase    ),
        .SSECT_ERASE_I         ( strt_subs_erase    ),
        .WRITE_I               ( start_write        ),
        .READ_I                ( start_read         ),
        .ERASEING_O            ( erasing_spi        ),
        .READ_BUSY_O           ( DATA_DVO_O         ),
        .READ_DONE_O           ( read_done          ),

        .SPI_CS_O              ( SPI_CS_O           ),
        .SPI_MOSI_O            ( SPI_MOSI_O         ),
        .SPI_MISO_I            ( SPI_MISO_I         )
    );              


    fifo_cmd fifo_cmd (
        .clk                ( CLK_I            ),
        .srst               ( SRST_I           ),
        .din                ( cmd_fifo_din     ),
        .wr_en              ( CMD_DVI_I        ),
        .rd_en              ( cmd_fifo_rdend   ),
        .dout               ( cmd_fifo_dout    ),
        .full               ( cmd_fifo_full    ),        
        .empty              ( cmd_fifo_empty   )        
    );
    // }}} End of Include other modules ------------
endmodule
