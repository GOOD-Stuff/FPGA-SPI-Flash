`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: VlSU
// Engineer: Gustov Vladimir
// 
// Create Date: 12.12.2017 10:56:54
// Design Name: srio_spi
// Module Name: spi_flash_programmer
// Project Name: spi_flash_programmer
// Target Devices: XC7K160TFFQ676-2 (Kintex-7)
// Tool Versions: Vivado 2016.3
// Description: This module work with SPI Flash memory N25Q128.
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//    SPI Flash Memory - Micron N25Q128A:
//     All size        - 16777216 bytes (16 MB);
//     65536 Pages     - each by 256 bytes;
//     256 Sectors     - each by 65536 bytes; 
//     4096 Subsectors - each by 4096 bytes; 
//     24 (3 byte addr mode)
//     CPOL = 0 - 
//     CPHA = 0 -
//     SpiSerDes work in 1, 1 (CPOL, CPHA)
//     RDID             - 20BB18h
//////////////////////////////////////////////////////////////////////////////////

module spi_flash_programmer(
    input         LOG_CLK_I,            // Clock signal
    input         LOG_RST_I,            // Active-high, synchronous reset
    // Flash
    input [31:0]  DATA_TO_FIFO_I,       // 8-bit data to FIFO
    input [23:0]  START_ADDR_I,         // Start address for write into SPI memory
    input         START_ADDR_VALID_I,   // Valid signal of start address
    input [15:0]  PAGE_COUNT_I,         // Count of pages for write into SPI memory
    input         PAGE_COUNT_VALID_I,   // Valid signal of page counts
    input [7:0]   SECTOR_COUNT_I,       // Count of sectors for erase into SPI memory
    input         SECTOR_COUNT_VALID_I, // Valid signal of sector counts
    output [7:0]  DATA_FROM_SPI_O,      // Received data from SPI memory
    // FIFO
    input         FIFO_WREN_I,          // Write Enable signal for FIFO
    output        FIFO_FULL_O,          // Signal of full from FIFO
    output        FIFO_EMPTY_O,         // Signal of empty from FIFO
    output        WRITE_DONE_O,         // Flash of SPI memory was done    
    // Control signals       
    input         SECT_ERASE_I,         // Signal of start erasing sectors
    input         SSECT_ERASE_I,        // Signal of start erasing subsectors
    input         WRITE_I,              // Signal of start writing
    input         READ_I,               // Signal of start read phase
    output        ERASEING_O,           // Finish of erase phase
    output        READ_VALID_O,
    output        READ_DONE_O,          // Signal of end of read phase
    // SPI 
    output        SPI_CS_O,             // SPI Chip Select for phy transaction
    output        SPI_MOSI_O,           // SPI MOSI for phy transation
    input         SPI_MISO_I            // SPI MISO for phy transaction
);


// {{{ local parameters (constants) --------    
    // SPI Address Width
    localparam       WIDTH            = 24;    // 3 bytes address
    // SPI sector size (in bits)
    localparam       SECTOR_SIZE      = 65536; // 64 KB
    localparam       SUBSECTOR_SIZE   = 4096;  // 4 KB
    localparam       PAGE_SIZE        = 256;   // 256 bytes
    localparam       SECTOR_COUNT     = 256;   // count of sectors
    localparam       PAGE_COUNT       = 65536; // count of pages 
    localparam       START_ADDR       = 32'h00000000; // First address in SPI
    localparam       END_ADDR         = 32'h00FFFFFF; // Last address in SPI (128 Mb)
    // SPI ID Code
    localparam       IDCODE_25NQ128   = 24'h20BB18;   // RDID N25Q128A 36 page   
    // SPI commands
    localparam [7:0] CMD_RD           = 8'h03; // Read
    localparam [7:0] CMD_FASTREAD     = 8'h0B; // Fast Read
    localparam [7:0] CMD_RDID         = 8'h9F; // Read ID
    localparam [7:0] CMD_FLAGSTAT     = 8'h70; // Read Flag Status Register
    localparam [7:0] CMD_CLEARSTAT    = 8'h50; // Clear Flag Status Register
    localparam [7:0] CMD_RDST         = 8'h05; // Read Status Register, ???‚?ˆ 21
    localparam [7:0] CMD_WE           = 8'h06; // Write Enable
    localparam [7:0] CMD_WD           = 8'h04; // Write Disable
    localparam [7:0] CMD_SE           = 8'hD8; // Sector Erase;   64 KB
    localparam [7:0] CMD_SSE          = 8'h20; // SubSector Erase; 4 KB
    localparam [7:0] CMD_BE           = 8'hC7; // Bulk Erase
    localparam [7:0] CMD_PP           = 8'h02; // Page Program
    localparam [7:0] CMD_PPDUAL       = 8'hA2; // Dual Input Fast Program
    localparam [7:0] CMD_PPQUAD       = 8'h32; // Quad Input Fast Program    
    // FSM
    // Read    
    localparam [2:0] RD_IDLE_S        = 3'h00; // Get start_address and size for read (in bytes), and set FAST_READ command
    localparam [2:0] RD_SENDCMD1_S    = 3'h01; // Send FAST_READ command
    localparam [2:0] RD_DELAY1_S      = 3'h02;
    localparam [2:0] RD_READ_S        = 3'h03; // Read data from SPI memory
    localparam [2:0] RD_DELAY2_S      = 3'h04; // Wait dummy cycles    
    localparam [2:0] RD_DONE_S        = 3'h05; // Set read_done signal. End of read.
    // Write
    localparam [3:0] WR_IDLE_S        = 4'h00; // Get start_address and count of page, and set WE command
    localparam [3:0] WR_SENDCMD1_S    = 4'h01; // Send WE command
    localparam [3:0] WR_PPCMD_S       = 4'h02; // Set PP command
    localparam [3:0] WR_SENDCMD2_S    = 4'h03; // Send PP command
    localparam [3:0] WR_DATA_S        = 4'h04; // Send (?) data from FIFO 
    localparam [3:0] WR_STATCMD_S     = 4'h05; // Set READSTAT command
    localparam [3:0] WR_SENDCMD3_S    = 4'h06; // Send READSTAT command
    localparam [3:0] WR_PPDONE_S      = 4'h07; // Get status
    localparam [3:0] WR_PPDONE_WAIT_S = 4'h08; // Check status and set WE command
    // Erase    
    localparam [3:0] ER_IDLE_S        = 4'h00; // Get start_address and count of sector, and set WE command
    localparam [3:0] ER_SENDCMD1_S    = 4'h01; // Send WE command
    localparam [3:0] ER_SECMD_S       = 4'h02; // Set SE command    
    localparam [3:0] ER_SENDCMD2_S    = 4'h03; // Send SE command
    localparam [3:0] ER_STATCMD_S     = 4'h04; // Set READDSTAT command
    localparam [3:0] ER_SENDCMD3_S    = 4'h05; // Send READSTAT command
    localparam [3:0] ER_RDSTAT_S      = 4'h06; // Get status
    localparam [3:0] ER_CHKSTAT_S     = 4'h07; // Check received status and set WE command
    localparam [3:0] ER_DELAY_S       = 4'h08; 
// }}} End local parameters -------------


// {{{ Wire declarations ----------------
    //----- write -----
    reg  [5:0]       wr_cmd_cntr         = 6'h20;
    reg  [31:0]      wr_cmd_reg;
    reg  [1:0]       wr_rd_data          = 2'h00;

    reg  [2:0]       wr_data_valid_cntr  = 3'h00;
    reg  [7:0]       wr_delay_cntr       = 8'h00;
    reg  [3:0]       wr_data_cntr        = 4'h08;  // SPI from FIFO Nibble count

    reg  [WIDTH-1:0] wr_current_addr;
    reg              wr_SpiCsB           = 1'b1;   // Chip Select (inversion: 1 - device is deselected, 0 - enables the device)    
    reg  [15:0]      page_count          = 16'h00;    
    reg  [1:0]       wr_status           = 2'h03;
    reg              status_data_valid   = 1'b0;

    reg              wr_strt_cmd_cnt;
    reg              wr_strt_valid_cnt;
    reg              wr_strt_delay_cnt;
    reg              wr_strt_data_cntr;
    reg              d_wr_strt_data_cntr = 1'b0;

    wire             write_start;
    reg              write_done;

    reg  [3:0]       wr_state; 
    reg  [3:0]       wr_next_state;    
    //----- erase -----
    reg  [5:0]       er_cmd_cntr         = 6'h20;
    reg  [31:0]      er_cmd_reg;
    reg  [7:0]       er_rd_data          = 8'h00;

    reg  [2:0]       er_data_valid_cntr  = 3'h00;
    reg  [7:0]       er_delay_cntr       = 8'h00;

    reg  [7:0]       er_sector_count;
    reg  [WIDTH-1:0] er_curr_sect_addr;

    reg              er_SpiCsB;
    reg  [1:0]       er_status;


    reg              er_strt_shft;
    reg  [31:0]      er_shft_reg;


    reg              er_strt_cmd_cnt;
    reg              er_strt_valid_cnt;
    reg              er_strt_delay_cnt;   
    reg              er_strt_subtr_cnt;

    reg              erase_inprogress;
    reg              serase_inprogress;
    reg              sserase_inprogress;
    wire             serase_start;
    wire             sserase_start;

    reg  [3:0]       er_state;
    reg  [3:0]       er_next_state;
    //----- read ---------
    reg  [5:0]       rd_cmd_cntr         = 6'h20;
    reg  [31:0]      rd_cmd_reg;
    reg  [7:0]       rd_rd_data          = 8'h00;

    reg  [2:0]       rd_delay_cntr       = 3'h07;
    reg  [2:0]       rd_data_cntr        = 3'h00;

    reg  [WIDTH-1:0] rd_current_addr;
    reg  [15:0]      rd_data_size; // to count data in bytes    
    reg  [7:0]       rd_data_out;  

    reg              rd_strt_cmd_cnt;
    reg              rd_strt_delay_cnt;
    reg              rd_strt_data_cnt;

    reg              rd_SpiCsB;
    wire             read_start;
    reg              read_done;
    reg              read_valid;
    reg              d_read_valid, dd_read_valid;

    reg [2:0]        rd_state;
    reg [2:0]        rd_next_state;
    //----- Startupe2 signals -----
    wire             sSpi_clk;    
    //----- FIFO signals -----
    reg              fifo_rden;
    wire             fifo_empty;
    wire             fifo_full;  
    wire             fifo_almostfull;
    wire             fifo_almostempty;
    wire [7:0]       fifo_dout;
    wire [31:0]      fifo_unconned;   
    wire             fifo_progfull;
    wire             fifo_progempty;
    //----- Other -----              
    //reg  [WIDTH-1:0] sCurrent_addr;
    //wire [7:0]       sSector_count;
    wire [15:0]      sPage_count;
    wire             sSpi_Miso;    
    wire             sSpi_cs;
    wire             sSpi_cs_n;            
    wire [7:0]       data_to_spi;
    
    wire [23:0]      tmp_addr;
    wire [7:0]       tmp_sect_cnt;
    wire [1:0]       tmp_status;

    wire             tmp_er_strt_vald;
    wire             tmp_er_strt_dly;
    wire [31:0]      tmp_er_cmd_reg;
    wire             tmp_er_inprog;
    wire             tmp_er_spics;
    wire             tmp_strt_shft;
    wire [7:0]       tmp_er_dly_cntr;
    wire             tmp_er_strt_subtr;

    wire [31:0]      tmp_wr_cmd_reg;
    wire             tmp_wr_spics;

    wire [31:0]      tmp_rd_cmd_reg;                    
    wire [7:0]       tmp_rd_out;
    wire [15:0]      tmp_rd_dt_cnt;
    wire             tmp_strt_dt_cnt;
    wire             tmp_rd_done;
    wire             tmp_rd_valid;    
// }}} End of wire declarations ------------


// {{{ Wire initializations ------------ 
    // TODO: try write like reg
    // delay SPI_CS by 1 clock
    //assign sSector_count    = (SECTOR_COUNT_VALID_I) ? SECTOR_COUNT_I : 8'hFF;
    assign sPage_count      = (PAGE_COUNT_VALID_I)   ? PAGE_COUNT_I   : 16'h00;
     
    assign sSpi_Miso        = SPI_MISO_I;    
       
    assign fifo_unconned    = DATA_TO_FIFO_I;
       
    assign serase_start     = SECT_ERASE_I;
    assign sserase_start    = SSECT_ERASE_I;
    assign write_start      = WRITE_I;
    assign read_start       = READ_I;
 
    assign data_to_spi      = er_cmd_reg[31:24]; // TODO: er_cmd_reg                             
    assign sSpi_cs          = er_SpiCsB; // TODO: er_SpiCsB;
 
    assign DATA_FROM_SPI_O  = rd_data_out;
    assign FIFO_FULL_O      = fifo_almostfull;
    assign FIFO_EMPTY_O     = fifo_progempty;
    assign ERASEING_O       = erase_inprogress;
    assign READ_VALID_O     = dd_read_valid;
    assign READ_DONE_O      = read_done;
    assign WRITE_DONE_O     = write_done;
    assign SPI_CS_O         = sSpi_cs_n;
     
    assign tmp_addr         = er_curr_sect_addr;
    assign tmp_sect_cnt     = er_sector_count;    
    assign tmp_er_progress  = erase_inprogress;
    assign tmp_er_cmd_reg   = er_cmd_reg;
    assign tmp_er_strt_dly  = er_strt_delay_cnt;
    assign tmp_er_strt_vald = er_strt_valid_cnt;
    assign tmp_status       = er_status;
    assign tmp_er_spics     = er_SpiCsB;
    assign tmp_strt_shft    = er_strt_shft;
    assign tmp_er_dly_cntr  = er_delay_cntr;
    assign tmp_er_strt_subtr = er_strt_subtr_cnt;
 
    assign tmp_wr_cmd_reg   = wr_cmd_reg;    
    assign tmp_wr_spics     = wr_SpiCsB; 
     
    assign tmp_rd_cmd_reg   = rd_cmd_reg;
    assign tmp_rd_out       = rd_data_out;
    assign tmp_rd_dt_cnt    = rd_data_size;
    assign tmp_strt_dt_cnt  = rd_strt_data_cnt;
    assign tmp_rd_done      = read_done;
    assign tmp_rd_valid     = d_read_valid;

// }}} End of wire initializations ------------ 

    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I) 
            er_curr_sect_addr <= 24'h00;
        else if (START_ADDR_VALID_I)
            er_curr_sect_addr <= START_ADDR_I;
        else if (er_strt_subtr_cnt && serase_inprogress)            
            er_curr_sect_addr <= er_curr_sect_addr + SECTOR_SIZE;
        else if (er_strt_subtr_cnt && sserase_inprogress)               
                er_curr_sect_addr <= er_curr_sect_addr + SUBSECTOR_SIZE;       
    end

    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I) 
            er_sector_count <= 8'h00;
        else if (SECTOR_COUNT_VALID_I && ((serase_start) || (sserase_start))) begin
            er_sector_count <= SECTOR_COUNT_I;
        end else if (er_strt_subtr_cnt && (er_sector_count > 8'h00))
            er_sector_count <= er_sector_count - 1'b1;
    end

    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I) 
            er_shft_reg <= 32'h00;                    
        else if (er_strt_shft)
            er_shft_reg <= {er_shft_reg[23:0], 8'h00};
        else 
            er_shft_reg <= er_cmd_reg;        
    end
    
    // Erase phase counters
    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I)
            er_cmd_cntr <= 6'h20; // d32: 8 bit cmd and 24 bit address
        else if (!er_strt_cmd_cnt)
            er_cmd_cntr <= 6'h20;
        else
            er_cmd_cntr <= er_cmd_cntr - 1'b1;
    end

    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I)
            er_delay_cntr <= 8'h00;
        else if (!er_strt_delay_cnt)
            er_delay_cntr <= 8'h00;
        else 
            er_delay_cntr <= er_delay_cntr + 1'b1;
    end

    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I)
            er_data_valid_cntr <= 3'h00;
        else if (!er_strt_valid_cnt)
            er_data_valid_cntr <= 3'h00;
        else 
            er_data_valid_cntr <= er_data_valid_cntr + 1'b1;
    end 

    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I)
            er_rd_data <= 8'h00;
        else if (!er_strt_valid_cnt)
            er_rd_data <= 8'h00;
        else if (er_strt_valid_cnt) // may be some bug with timing
            er_rd_data <= {er_rd_data[6:0], sSpi_Miso};
    end

    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I)
            serase_inprogress <= 1'b0;
        else if (serase_start == 1'b0 && erase_inprogress == 1'b0)
            serase_inprogress <= 1'b0;
        else if (serase_start)
            serase_inprogress <= 1'b1;
    end

    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I)
            sserase_inprogress <= 1'b0;
        else if (sserase_start == 1'b0 && erase_inprogress == 1'b0)
            sserase_inprogress <= 1'b0;
        else if (sserase_start)
            sserase_inprogress <= 1'b1;
    end

    // Write phase counters
    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I)
            wr_cmd_cntr <= 6'h20; // d32: 8 bit cmd and 24 bit address
        else if (!wr_strt_cmd_cnt)
            wr_cmd_cntr <= 6'h20; 
        else
            wr_cmd_cntr <= wr_cmd_cntr - 1'b1;
    end

    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I)
            wr_delay_cntr <= 8'h00;
        else if (!wr_strt_delay_cnt)
            wr_delay_cntr <= 8'h00;
        else
            wr_delay_cntr <= wr_delay_cntr + 1'b1;
    end

    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I)
            wr_data_valid_cntr <= 3'h00;
        else if (!wr_strt_valid_cnt)
            wr_data_valid_cntr <= 3'h00;
        else
            wr_data_valid_cntr <= wr_data_valid_cntr + 1'b1;
    end 

    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I) 
            wr_data_cntr  <= 4'h08;
        else if (!d_wr_strt_data_cntr)
            wr_data_cntr  <= 4'h08;
        else if ((wr_data_cntr == 4'h08) || (wr_data_cntr == 4'h07))
            wr_data_cntr  <= 4'h00;
        else
            wr_data_cntr  <= wr_data_cntr + 1'b1;
    end

    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I)
            d_wr_strt_data_cntr <= 1'b0;
        else
            d_wr_strt_data_cntr <= wr_strt_data_cntr;
    end

    // Serialize status of FLash from SPI MISO
    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I)
            wr_rd_data <= 2'h00;
        else if (!wr_strt_valid_cnt)
            wr_rd_data <= 2'h00;
        else if (wr_strt_valid_cnt) // may be some bug with timing
            wr_rd_data <= {wr_rd_data[0], sSpi_Miso};
    end

    // Read phase counters
    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I)
            rd_cmd_cntr <= 6'h20;
        else if (!rd_strt_cmd_cnt)
            rd_cmd_cntr <= 6'h20;
        else
            rd_cmd_cntr <= rd_cmd_cntr - 1'b1;
    end

    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I)
            rd_delay_cntr <= 3'h07;
        else if (!rd_strt_delay_cnt)
            rd_delay_cntr <= 3'h07;
        else
            rd_delay_cntr <= rd_delay_cntr - 1'b1;
    end
   
    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I)
            rd_data_cntr <= 3'h00;
        else if (!rd_strt_data_cnt)
            rd_data_cntr <= 3'h00;
        else
            rd_data_cntr <= rd_data_cntr + 1'b1;
    end

    // Serialize status of FLash from SPI MISO
    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I)
            rd_rd_data <= 8'h00;
        else if (!rd_strt_data_cnt)
            rd_rd_data <= 8'h00;
        else if (rd_strt_data_cnt)
            rd_rd_data <= {rd_rd_data[6:0], sSpi_Miso};
    end

    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I)
            rd_data_size <= 16'h03;
        else if (!rd_strt_data_cnt)
            rd_data_size <= 16'h03;
        else if (rd_data_cntr == 3'h07) begin
            rd_data_size <= rd_data_size - 1'b1;
        end
    end

    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I) begin
            d_read_valid  <= 1'b0;
            dd_read_valid <= 1'b0;
        end else  begin
            d_read_valid  <= read_valid;
            dd_read_valid <= d_read_valid;
        end
    end

    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I)
            rd_data_out <= 8'h00;
        else if (d_read_valid) begin
            rd_data_out <= rd_rd_data;
        end
    end

// {{{ Erase Sectors FSM ------------     
    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I)
            er_state <= ER_IDLE_S;
        else        
            er_state <= er_next_state;
    end

    always @(*) begin
        er_next_state = ER_IDLE_S;
        case (er_state)
            ER_IDLE_S: begin                              // 0
                if (serase_start || sserase_start) // TODO: from ER state
                    er_next_state = ER_SENDCMD1_S;
                else 
                    er_next_state = ER_IDLE_S;
            end

            ER_SENDCMD1_S: begin                          // 1
                if (er_cmd_cntr == 6'd24) begin
                    er_next_state = ER_SECMD_S;
                end else
                    er_next_state = ER_SENDCMD1_S;
            end

            ER_SECMD_S: begin                             // 2 
                if (er_delay_cntr == 8'h04)
                    er_next_state = ER_SENDCMD2_S;
                else
                    er_next_state = ER_SECMD_S;
            end     

            ER_SENDCMD2_S: begin                          // 3
                if (er_cmd_cntr == 6'd00)
                    er_next_state = ER_STATCMD_S;
                else 
                    er_next_state = ER_SENDCMD2_S;
            end

            ER_STATCMD_S: begin                           // 4
                if (er_delay_cntr == 8'h05)
                    er_next_state = ER_SENDCMD3_S;
                else
                    er_next_state = ER_STATCMD_S;
            end

            ER_SENDCMD3_S: begin                           // 5
                if (er_cmd_cntr == 6'd24)
                    er_next_state = ER_RDSTAT_S;
                else
                    er_next_state = ER_SENDCMD3_S;
            end

            ER_RDSTAT_S: begin                            // 6
                if (er_data_valid_cntr == 3'h07)
                    er_next_state = ER_CHKSTAT_S;
                else
                    er_next_state = ER_RDSTAT_S;                
            end

            ER_CHKSTAT_S: begin                             // 7
                if (er_status == 2'h00) begin               
                    if (er_sector_count == 8'h00)
                        er_next_state = ER_IDLE_S;
                    else
                        er_next_state = ER_DELAY_S;
                end else
                    er_next_state = ER_STATCMD_S;
            end

            ER_DELAY_S: begin
                if (er_delay_cntr == 8'h03)
                    er_next_state = ER_SENDCMD1_S;
                else
                    er_next_state = ER_DELAY_S;
            end

            default: begin
                er_next_state = ER_IDLE_S;
            end
        endcase
    end

    always @(*) begin       
        case (er_state)
            ER_IDLE_S: begin                                           // 0                                                                            
                er_SpiCsB         = 1'b1;
                er_status         = 2'h03;
                er_strt_cmd_cnt   = 1'b0;
                er_strt_delay_cnt = 1'b0;                
                er_strt_valid_cnt = 1'b0;     
                erase_inprogress  = 1'b0;           
                er_strt_subtr_cnt = 1'b0;                  
                er_cmd_reg        = {CMD_WE, 24'h00};
            end

            ER_SENDCMD1_S: begin                                       // 1
                er_SpiCsB         = 1'b0;
                er_strt_cmd_cnt   = 1'b1;
                er_strt_delay_cnt = 1'b0;                
                erase_inprogress  = 1'b1;
                er_strt_valid_cnt = 1'b0;     
                er_strt_subtr_cnt = 1'b0;                  
            end
            
            ER_SECMD_S: begin                                      // 2                             
                erase_inprogress  = 1'b1;
                er_SpiCsB         = 1'b1;
                er_strt_cmd_cnt   = 1'b0;
                er_strt_delay_cnt = 1'b1;                
                er_strt_valid_cnt = 1'b0;
                er_strt_subtr_cnt = 1'b0;                  
                if (serase_inprogress)
                    er_cmd_reg    = {CMD_SE, er_curr_sect_addr};                
                else if (sserase_inprogress)
                    er_cmd_reg    = {CMD_SSE, er_curr_sect_addr};                
            end

            ER_SENDCMD2_S: begin                                   // 3
                er_SpiCsB         = 1'b0;
                er_strt_cmd_cnt   = 1'b1;
                er_strt_delay_cnt = 1'b0;
                er_strt_shft      = 1'b0;
                er_cmd_reg        = er_shft_reg;
                erase_inprogress  = 1'b1;
                er_strt_valid_cnt = 1'b0;
                er_strt_subtr_cnt = 1'b0;                  
                if ((er_cmd_cntr == 6'd09) || (er_cmd_cntr == 6'd17)
                    || (er_cmd_cntr == 6'd25))
                    er_strt_shft  = 1'b1;
            end 

            ER_STATCMD_S: begin                                      // 4
                er_SpiCsB          = 1'b1;
                er_strt_cmd_cnt    = 1'b0;
                er_strt_delay_cnt  = 1'b1;                 
                er_strt_shft       = 1'b0;
                er_strt_subtr_cnt  = 1'b0;                  
                erase_inprogress   = 1'b1;
                er_strt_valid_cnt  = 1'b0;
                er_cmd_reg         = {CMD_RDST, 24'h00};
            end

            ER_SENDCMD3_S: begin                                     // 5
                er_SpiCsB          = 1'b0;
                er_strt_cmd_cnt    = 1'b1;
                er_strt_delay_cnt  = 1'b0;                                            
                erase_inprogress   = 1'b1;
                er_strt_valid_cnt  = 1'b0;
                er_strt_subtr_cnt  = 1'b0;                                  
            end

            ER_RDSTAT_S: begin                                        // 6
                er_SpiCsB          = 1'b0;
                er_strt_cmd_cnt    = 1'b0;                
                er_strt_delay_cnt  = 1'b0;                                            
                erase_inprogress   = 1'b1;
                er_strt_valid_cnt  = 1'b1;
                er_strt_subtr_cnt  = 1'b0;                  
                er_cmd_reg         = {CMD_RDST, 24'h00};
                er_status          = er_rd_data[1:0];
            end

            ER_CHKSTAT_S: begin                                     // 7
                er_SpiCsB          = 1'b1;   
                er_strt_cmd_cnt    = 1'b0;                    
                er_strt_valid_cnt  = 1'b0;
                er_strt_delay_cnt  = 1'b0;                                            
                erase_inprogress   = 1'b1;
                er_strt_subtr_cnt  = 1'b0;
                if (er_status == 2'h00) begin                    
                    if (er_sector_count > 8'h00)                                                        
                        er_strt_subtr_cnt = 1'b1;                                                                
                end 
            end

            ER_DELAY_S: begin
                er_SpiCsB          = 1'b1; 
                er_strt_cmd_cnt    = 1'b0;                      
                er_strt_delay_cnt  = 1'b1;
                er_strt_valid_cnt  = 1'b0;
                erase_inprogress   = 1'b1;
                er_strt_subtr_cnt  = 1'b0;
                er_cmd_reg         = {CMD_WE, 24'h00};
            end

            default: begin
                //erase_inprogress  = 1'b1;
                //er_SpiCsB         = 1'b1;
                //er_strt_cmd_cnt   = 1'b0;
                //er_strt_valid_cnt = 1'b0;      
                //er_strt_delay_cnt = 1'b0;
                //er_strt_subtr_cnt = 1'b0;                  
                er_strt_shft      = 1'b0;
                er_status         = 2'h03;           
            end
        endcase
    end
// }}} End of erase sectors FSM ------------    


// {{{ Write Data to Program Pages FSM -----
    
// }}} End of write data FSM ---------------


// {{{ Read data of FSM ---------
    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I)
            rd_state <= RD_IDLE_S;
        else
            rd_state <= rd_next_state;
    end

    always @(*) begin
        rd_next_state = RD_IDLE_S;
        case (rd_state)
            RD_IDLE_S: begin                            // 0
                if (read_start)//.. && (rd_data_size > 16'h00))
                    rd_next_state = RD_SENDCMD1_S;
                else
                    rd_next_state = RD_IDLE_S;
            end

            RD_SENDCMD1_S: begin                        // 1
                if (rd_cmd_cntr == 6'd25)
                    rd_next_state = RD_DELAY1_S;
                else
                    rd_next_state = RD_SENDCMD1_S;
            end

            RD_DELAY1_S: begin                          // 2
                if (rd_delay_cntr == 3'h06)
                    rd_next_state = RD_READ_S;
                else 
                    rd_next_state = RD_DELAY1_S;
            end

            RD_READ_S: begin                            // 3
                if (rd_data_size == 16'd00)
                    rd_next_state = RD_DELAY2_S;
                else
                    rd_next_state = RD_READ_S;
            end

            RD_DELAY2_S: begin
                if (rd_delay_cntr == 3'h00)
                    rd_next_state = RD_SENDCMD1_S;
                else begin
                    rd_next_state = RD_DELAY2_S;
                end
            end

            RD_DONE_S: begin
                rd_next_state = RD_IDLE_S;
            end

            default: begin
                rd_next_state = RD_IDLE_S;
            end
        endcase
    end

    always @(*) begin
        case(rd_state)
            RD_IDLE_S: begin                                                // 0                                
                read_done         = 1'b0;
                rd_SpiCsB         = 1'b1;                
                rd_strt_cmd_cnt   = 1'b0;                                                        
                rd_cmd_reg        = {CMD_RDID, 24'h00};
            end

            RD_SENDCMD1_S: begin                                            // 1
                rd_SpiCsB         = 1'b0;                
                rd_strt_cmd_cnt   = 1'b1; 
                rd_strt_delay_cnt = 1'b0;              
                rd_strt_data_cnt  = 1'b0;    
            end

            RD_DELAY1_S: begin                                             // 2
                rd_SpiCsB         = 1'b0;                
                rd_strt_cmd_cnt   = 1'b0;
                rd_strt_delay_cnt = 1'b1;    
                rd_strt_data_cnt  = 1'b0;               
                rd_cmd_reg        = 32'h00;                        
            end

            RD_READ_S: begin                                                // 3                
                rd_SpiCsB         = 1'b0;                
                read_valid        = 1'b0;
                rd_strt_cmd_cnt   = 1'b0;              
                rd_strt_delay_cnt = 1'b0;                
                rd_strt_data_cnt  = 1'b1;                   
                if (rd_data_cntr == 3'h07) begin
                    read_valid    = 1'b1;                         
                end
            end

            RD_DELAY2_S: begin
                rd_SpiCsB         = 1'b1;
                rd_strt_data_cnt  = 1'b0;
                rd_strt_delay_cnt = 1'b1;                
                read_valid        = 1'b0;                
                rd_cmd_reg        = {CMD_RDID, 24'h00};
            end

            RD_DONE_S: begin                                                // 4                                            
                read_done        = 1'b1;
            end

            default: begin                                
                read_valid       = 1'b0;
            end
        endcase
    end
// }}} End of read data FSM -------------


// {{{ Include other modules ------------
    spi_serdes SerDes (
        .CLK_I           ( LOG_CLK_I  ),   // 1 bit input:  Clock signal       
        .RST_I           ( LOG_RST_I  ),   // 1 bit input:  Reset signal
        
        .SPI_CS_I        ( sSpi_cs    ),   // 1 bit input:  SPI Chip Select signal
        .START_TRANS_I   ( !sSpi_cs_n ),   // 1 bit input:  Signal of start of SPI transfer
        .DONE_TRANS_O    ( ),              // 1 bit output: End of SPI transfer
                        
        .DATA_TO_SPI_I   ( data_to_spi ),  // 8 bit input:  Data to transfer via SPI
        .DATA_FROM_SPI_O ( ),              // 8 bit output: Received data from SPI
                        
        .SPI_CLK_O       ( sSpi_clk   ),   // 1 bit output: Clock signal for SPI transaction
        .SPI_CS_N_O      ( sSpi_cs_n  ),   // 1 bit output: Negedge Chip Select signal for SPI transaction 
        .SPI_MOSI_O      ( SPI_MOSI_O ),   // 1 bit output: Master output signal  
        .SPI_MISO_I      ( sSpi_Miso  )    // 1 bit input:  Master input signal
    );

    STARTUPE2 #(
        .PROG_USR           ( "FALSE" ),   // Activate program event security feature. Requires encrypted bitstreams.
        .SIM_CCLK_FREQ      ( 0.0     )    // Set the Configuration Clock Frequency (ns) for simulation
    )
    STARTUPE2_inst (
        .CFGCLK             ( ),           // 1-bit output: Configuration main clock output
        .CFGMCLK            ( ),           // 1-bit output: Configuration internal oscillator clock output        
        .EOS                ( ),           // 1-bit output: Active-High output signal indicating the End Of Startup
        .PREQ               ( ),           // 1-bit output: PROGRAM request to fabric output        
        .CLK                ( 1'b0    ),   // 1-bit input: User start-up clock input        
        .GSR                ( 1'b0    ),   // 1-bit input: Global Set/Reset input (GSR cannot be used for the port)
        .GTS                ( 1'b0    ),   // 1-bit input: Global 3-state input (GTS cannot be used for the port name)
        .KEYCLEARB          ( 1'b1    ),   // 1-bit input: Clear AES Decrypter Key input from Battery-Backed RAM (BBRAM)
        .PACK               ( 1'b1    ),   // 1-bit input: PROGRAM acknowledge input
        .USRCCLKO           ( sSpi_clk ),  // 1-bit input: User CCLK input
        .USRCCLKTS          ( 1'b0    ),   // 1-bit input: User CCLK 3-state enable input
        .USRDONEO           ( 1'b1    ),   // 1-bit input: User DONE pin output control
        .USRDONETS          ( 1'b0    )    // 1-bit input: User DONE 3-state enable output
    );
    
    fifo_spi_data fifo_spi  (
        .clk                ( LOG_CLK_I        ),
        .srst               ( LOG_RST_I        ),
        .din                ( fifo_unconned    ),
        .wr_en              ( FIFO_WREN_I      ),
        .rd_en              ( 1'b0        ),
        .dout               ( fifo_dout        ),
        .full               ( fifo_full        ),
        .almost_full        ( fifo_almostfull  ),
        .empty              ( fifo_empty       ),
        .almost_empty       ( fifo_almostempty ),
        .prog_full          ( fifo_progfull    ),
        .prog_empty         ( fifo_progempty   )
    );    

    dbg_spi_flash dbg_spi_ila (
        .clk                ( LOG_CLK_I           ),
                                                  
        .probe0             ( er_state            ),        
        .probe1             ( er_next_state       ),        
        
        .probe2             ( er_cmd_cntr         ), //er_cmd_reg        
        .probe3             ( tmp_er_cmd_reg      ),        
       
        .probe4             ( tmp_er_progress     ), //erase_inprogress
        .probe5             ( sserase_start       ),

        .probe6             ( sSpi_cs_n           ),
        .probe7             ( SPI_MOSI_O          ),
         
        .probe8             ( er_rd_data          ),        
          
        .probe9             ( sSpi_Miso           ),        
         
        .probe10            ( tmp_status          ),
        .probe11            ( tmp_sect_cnt        ),
        .probe12            ( tmp_addr            ),
        .probe13            ( tmp_er_strt_vald    ),
        .probe14            ( tmp_er_dly_cntr     ),        
        .probe15            ( er_data_valid_cntr  ),
        
        .probe16            ( sserase_inprogress  ),
        .probe17            ( SECTOR_COUNT_VALID_I ),
        .probe18            ( tmp_strt_shft       ),
        .probe19            ( er_shft_reg         ),
        .probe20            ( tmp_er_strt_dly     ),
        .probe21            ( tmp_er_strt_subtr   ),
        .probe22            ( serase_start        ),
        .probe23            ( serase_inprogress   ),

        .probe24            ( rd_state            ),
        .probe25            ( tmp_rd_valid        )
    );
// }}} End of Include other modules ------------

endmodule