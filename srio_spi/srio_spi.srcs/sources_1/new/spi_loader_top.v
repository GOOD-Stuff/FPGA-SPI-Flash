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
//              __________
// CMD_DVI     |          | CMD_FIFO_EMPTY
// ----------->|          |--------------------------------->
// CMD 3       |          | CMD_FIFO_FULL
// ----/------>|   FIFO   |--------------------------------->
// ST_ADDR 24  |          |
// ---------/->|          |
// PG_CNT 16   |          |
// -------/--->|          |
// ST_CNT 8    |          |
// -------/--->|          |        _______
//             |__________|       |       |
//                                | FIFO  |
// DATA_DVI                       |       |DATA_FIFO_PFULL
// ------------------------------>|       |----------------->
// DATA_TO_PROG                   |       |
// ------------------------------>|       |
//                                |_______|
//
//////////////////////////////////////////////////////////////////////////////////


module spi_loader_top(
    input         CLK_INT,          // Syncro signal, 100 MHz
    input         CLK_I,            // Synchro signal, 50 MHz
    input         SRST_I,           // Reset synchro signal

    input         CMD_DVI_I,
    input  [2:0]  CMD_I,            // Command (erase/write/read)        
    input  [23:0] START_ADDR_I,     // Address of SPI Flash for write
    input  [15:0] PAGE_COUNT_I,     // Count of page of SPI Flash for write
    input  [7:0]  SECTOR_COUNT_I,   // Count of sector of SPI Flash for write    

    input         DATA_DVI_I,       // Valid signal for input data to SPI Flash
    input  [31:0] DATA_TO_PROG_I,   // Data to write into SPI Flash

    output        DATA_DVO_O,       // Valid signal for output data from SPI Flash
    output [7:0]  DATA_OUT_O,       // Received data from SPI memory

    output        CMD_FIFO_EMPTY_O,  // The signal of module when it has completed erasing
    output        CMD_FIFO_FULL_O,   // The signal of module when it has completed writing
    output        DATA_FIFO_PFULL_O, // FIFO is full, must wait while it will be release    
    

    output        SPI_CS_O,         // Chip Select signal for SPI Flash
    output        SPI_MOSI_O,       // Master Output Slave Input
    input         SPI_MISO_I        // Master Input Slave Output
    );
    
    // {{{ local parameters (constants) --------    
        localparam [2:0] ERASE_SUB    = 3'h00; // Erase SubSector
        localparam [2:0] ERASE_SEC    = 3'h01; // Erase SEctor
        localparam [2:0] ERASE_CHIP   = 3'h02; // Erase (Bulk) Chip
        localparam [2:0] WRITE_DATA   = 3'h03; // Write data return
        localparam [2:0] WRITE_HEADER = 3'h04; // Write header (not implemented)
        localparam [2:0] READ_DATA    = 3'h05; // Read data
        localparam [2:0] READ_STATUS  = 3'h06; // Read Flag Status
    // FSM
        localparam [3:0] IDLE_S       = 4'h00; // Set validation of data
        localparam [3:0] GET_FIFO_S   = 4'h01; // Read from command FIFO
        localparam [3:0] PARSE_CMD_S  = 4'h02; // Parse command               
        localparam [3:0] ERASE_S      = 4'h03; // Wait while SPI Flash erasing
        localparam [3:0] ERASE_DONE_S = 4'h04; // Start erase subsector        
        localparam [3:0] WRITE_DATA_S = 4'h05; // Send data to SPI
        localparam [3:0] READ_S       = 4'h06; // Read data
        localparam [3:0] READ_ST_S    = 4'h07;
    // }}} End local parameters -------------
    
    // {{{ Wire declarations ----------------
        wire        sSpi_Miso;
    // FSM
        reg  [3:0]  state, next_state;
    // Counters
        reg  [1:0]  counter            = 2'h00; // for some delay        
        reg  [15:0] pkg_counter        = 16'h00;
    // Control signals        
        wire        write_done;
        wire        read_done;
        wire        load_valid;
        reg  [2:0]  cmd;
        wire        cmd_dvi;        
    // Continuous signals
        reg         strt_sect_erase;
        reg         strt_subs_erase;        
        reg         start_write;        
        wire        erasing_spi;
        reg         start_read;
    // Memory signals (address, pages, etc.)
        reg         start_addr_valid;
        reg         page_count_valid;
        reg         sector_count_valid;
        reg  [23:0] start_address;
        reg  [15:0] page_count;
        reg  [7:0]  sector_count;
    // FIFO
        wire        cmd_fifo_full;
        wire        cmd_fifo_empty;
        wire [51:0] cmd_fifo_dout;
        wire [51:0] cmd_fifo_din;
        reg         cmd_fifo_rdenb;
        wire        data_fifo_wren;
        wire        data_fifo_full;
        wire        data_fifo_empty;    
        
        wire [31:0] data_to_fifo;

        wire        tmp_sect_valid;  
        wire        tmp_sect_erase;  
        wire        tmp_subs_erase;
        wire        tmp_fifo_rdenb;
    // }}} End of wire declarations ------------
        
        
    // {{{ Wire initializations ------------ 
        assign cmd_fifo_din       = {CMD_DVI_I, CMD_I, START_ADDR_I, 
                                    PAGE_COUNT_I, SECTOR_COUNT_I};
        assign load_valid         = !cmd_fifo_empty;
        assign cmd_dvi            = cmd_fifo_dout[51];
    
        assign sSpi_Miso          = SPI_MISO_I;
        assign data_fifo_wren     = (!data_fifo_full) ? DATA_DVI_I : 1'b0;

        assign DATA_FIFO_PFULL_O  = data_fifo_full;           
        assign CMD_FIFO_FULL_O    = cmd_fifo_full;
        assign CMD_FIFO_EMPTY_O   = cmd_fifo_empty;
        // reverse order bit
        assign data_to_fifo       = {DATA_TO_PROG_I[7], DATA_TO_PROG_I[6], DATA_TO_PROG_I[5],
                                     DATA_TO_PROG_I[4], DATA_TO_PROG_I[3], DATA_TO_PROG_I[2],
                                     DATA_TO_PROG_I[1], DATA_TO_PROG_I[0], DATA_TO_PROG_I[15],
                                     DATA_TO_PROG_I[14], DATA_TO_PROG_I[13], DATA_TO_PROG_I[12],
                                     DATA_TO_PROG_I[11], DATA_TO_PROG_I[10], DATA_TO_PROG_I[9],
                                     DATA_TO_PROG_I[8], DATA_TO_PROG_I[23], DATA_TO_PROG_I[22],
                                     DATA_TO_PROG_I[21], DATA_TO_PROG_I[20], DATA_TO_PROG_I[19],
                                     DATA_TO_PROG_I[18], DATA_TO_PROG_I[17], DATA_TO_PROG_I[16],
                                     DATA_TO_PROG_I[31], DATA_TO_PROG_I[30], DATA_TO_PROG_I[29],
                                     DATA_TO_PROG_I[28], DATA_TO_PROG_I[27], DATA_TO_PROG_I[26],
                                     DATA_TO_PROG_I[25], DATA_TO_PROG_I[24]};
                                    // { << { DATA_TO_PROG_I } }; 
                                   /*{DATA_TO_PROG_I[0], DATA_TO_PROG_I[1], DATA_TO_PROG_I[2],
                                     DATA_TO_PROG_I[3], DATA_TO_PROG_I[4], DATA_TO_PROG_I[5],
                                     DATA_TO_PROG_I[6], DATA_TO_PROG_I[7], DATA_TO_PROG_I[8],
                                     DATA_TO_PROG_I[9], DATA_TO_PROG_I[10], DATA_TO_PROG_I[11],
                                     DATA_TO_PROG_I[12], DATA_TO_PROG_I[13], DATA_TO_PROG_I[14],
                                     DATA_TO_PROG_I[15], DATA_TO_PROG_I[16], DATA_TO_PROG_I[17],
                                     DATA_TO_PROG_I[18], DATA_TO_PROG_I[19], DATA_TO_PROG_I[20],
                                     DATA_TO_PROG_I[21], DATA_TO_PROG_I[22], DATA_TO_PROG_I[23],
                                     DATA_TO_PROG_I[24], DATA_TO_PROG_I[25], DATA_TO_PROG_I[26],
                                     DATA_TO_PROG_I[27], DATA_TO_PROG_I[28], DATA_TO_PROG_I[29],
                                     DATA_TO_PROG_I[30], DATA_TO_PROG_I[31]   };*/

        assign tmp_sect_valid     = sector_count_valid;   
        assign tmp_sect_erase     = strt_sect_erase;
        assign tmp_subs_erase     = strt_subs_erase;
        assign tmp_fifo_rdenb     = cmd_fifo_rdenb;
    // }}} End of wire initializations ------------

    
    always @(posedge CLK_I) begin
        if (SRST_I)
            pkg_counter <= 16'h00;
        else if (cmd_fifo_rdenb) 
            pkg_counter <= pkg_counter + 1'b1;        
    end

    always @(posedge CLK_I) begin
        if (SRST_I) begin
            sector_count_valid <= 1'b0;    
            start_addr_valid   <= 1'b0;                
            page_count_valid   <= 1'b0;                
        end else if (cmd_dvi && cmd_fifo_rdenb) begin
            sector_count_valid <= 1'b1;   
            start_addr_valid   <= 1'b1;                
            page_count_valid   <= 1'b1;         
        end
    end

    always @(posedge CLK_I) begin
        if (SRST_I) begin
            cmd           <= 3'h00;
            start_address <= 24'h00;
            page_count    <= 16'h00;
            sector_count  <= 8'h00;           
        end else if (cmd_dvi && cmd_fifo_rdenb) begin
            cmd           <= cmd_fifo_dout[50:48];
            start_address <= cmd_fifo_dout[47:24];
            page_count    <= cmd_fifo_dout[23:8];   
            sector_count  <= cmd_fifo_dout[7:0];
        end
    end

    always @(posedge CLK_I) begin
        if (SRST_I)
            counter <= 2'h00;
        else
            counter <= counter + 1'b1;
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
                if (cmd == ERASE_SEC)
                    next_state = ERASE_S;
                else if (cmd == ERASE_SUB)
                    next_state = ERASE_S;
                else if (cmd == ERASE_CHIP)
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
                strt_sect_erase      = 1'b0;
                strt_subs_erase      = 1'b0;                                
                start_write          = 1'b0;                
                start_read           = 1'b0;                                             
                cmd_fifo_rdenb       = 1'b0;             
            end
               
            GET_FIFO_S: begin                           // 1
                cmd_fifo_rdenb       = 1'b1;
                start_write          = 1'b0;       
                start_read           = 1'b0;       
                strt_sect_erase      = 1'b0;
                strt_subs_erase      = 1'b0;                
            end

            PARSE_CMD_S: begin                          // 2
                cmd_fifo_rdenb       = 1'b0;
                strt_sect_erase      = 1'b0;
                strt_subs_erase      = 1'b0;                    
                start_write          = 1'b0;                
                start_read           = 1'b0;
                if (cmd == ERASE_SUB)                                        
                    strt_subs_erase  = 1'b1;                                        
                else if (cmd == ERASE_SEC)                                                                          
                    strt_sect_erase  = 1'b1;                                       
                else if (cmd == ERASE_CHIP)                     
                    strt_sect_erase  = 1'b1;                    
                else if (cmd == WRITE_DATA)                                         
                    start_write      = 1'b1;
                else if (cmd == READ_DATA)                             
                    start_read       = 1'b1;                
            end    

            ERASE_S: begin                             // 3
                cmd_fifo_rdenb       = 1'b0;                
                start_write          = 1'b0;                
                start_read           = 1'b0;                               
                strt_sect_erase      = 1'b0;
                strt_subs_erase      = 1'b0;
            end

            ERASE_DONE_S: begin                        // 4
                cmd_fifo_rdenb       = 1'b0;                
                start_write          = 1'b0;                
                start_read           = 1'b0;                               
                strt_sect_erase      = 1'b0;
                strt_subs_erase      = 1'b0;
            end
          
            WRITE_DATA_S: begin                        // 5                
                cmd_fifo_rdenb       = 1'b0;
                start_write          = 1'b0;
                start_read           = 1'b0;   
                strt_sect_erase      = 1'b0;
                strt_subs_erase      = 1'b0;                            
            end
            
            READ_S: begin                              // 6
                cmd_fifo_rdenb       = 1'b0;
                start_write          = 1'b0;
                start_read           = 1'b0;  
                strt_sect_erase      = 1'b0;
                strt_subs_erase      = 1'b0;                             
            end

            default: begin
                                        
            end
        endcase
    end
    // }}} End of FSM logic ------------
    
    
    // {{{ Include other modules ------------
    spi_flash_programmer spi_prog (
        .WR_CLK_I                 ( CLK_INT            ),
        .LOG_CLK_I                ( CLK_I              ),               
        .LOG_RST_I                ( SRST_I             ),
                                         
        .DATA_TO_FIFO_I           ( data_to_fifo       ),
        .START_ADDR_I             ( start_address      ),
        .START_ADDR_VALID_I       ( start_addr_valid   ),
        .PAGE_COUNT_I             ( page_count         ),
        .PAGE_COUNT_VALID_I       ( page_count_valid   ),
        .SECTOR_COUNT_I           ( sector_count       ),  
        .SECTOR_COUNT_VALID_I     ( sector_count_valid ),
        .DATA_FROM_SPI_O          ( DATA_OUT_O         ),
                                         
        .FIFO_WREN_I              ( data_fifo_wren     ),
        .FIFO_FULL_O              ( data_fifo_full     ),
        .FIFO_EMPTY_O             ( data_fifo_empty    ),        
        .WRITE_DONE_O             ( write_done         ),
                                         
        .SECT_ERASE_I             ( strt_sect_erase    ),
        .SSECT_ERASE_I            ( strt_subs_erase    ),
        .WRITE_I                  ( start_write        ),
        .READ_I                   ( start_read         ),
        .ERASEING_O               ( erasing_spi        ),
        .READ_VALID_O             ( DATA_DVO_O         ),
        .READ_DONE_O              ( read_done          ),
   
        .SPI_CS_O                 ( SPI_CS_O           ),
        .SPI_MOSI_O               ( SPI_MOSI_O         ),
        .SPI_MISO_I               ( sSpi_Miso          )
    );              


    fifo_cmd fifo_cmd (
        .wr_clk       ( CLK_INT          ),
        .rd_clk       ( CLK_I            ),
        .rst          ( SRST_I           ),
        .din          ( cmd_fifo_din     ),
        .wr_en        ( CMD_DVI_I        ),
        .rd_en        ( cmd_fifo_rdenb   ),
        .dout         ( cmd_fifo_dout    ),
        .full         (     ),        
        .empty        ( cmd_fifo_empty   ),
        .prog_full    ( cmd_fifo_full ),
        .prog_empty   (  )

    );

    dbg_spi_cmd dbg_cmd (
        .clk            ( CLK_I           ),

        .probe0         ( state           ),
        .probe1         ( next_state      ),

        .probe2         ( start_address   ),
        .probe3         ( page_count      ),
        .probe4         ( sector_count    ),      
        .probe5         ( cmd_dvi         ),
        .probe6         ( cmd             ),
      
        .probe7         ( write_done      ),
        .probe8         ( read_done       ),
        .probe9         ( erasing_spi     ),
        .probe10        ( tmp_subs_erase  ),
        .probe11        ( start_write     ),
        .probe12        ( tmp_sect_valid  ),
        .probe13        ( tmp_sect_erase  ),
        .probe14        ( start_read      ),
        .probe15        ( cmd_fifo_empty  ),
        .probe16        ( data_to_fifo    ),
        .probe17        ( tmp_fifo_rdenb  ),
        .probe18        ( pkg_counter     ),
        .probe19        ( cmd_fifo_dout   ),
        .probe20        ( DATA_OUT_O      )       
    );
    // }}} End of Include other modules ------------
endmodule
