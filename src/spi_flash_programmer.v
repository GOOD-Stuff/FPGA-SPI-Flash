`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: VlSU
// Engineer: Gustov Vladimir
// 
// Create Date: 12.12.2017 10:56:54
// Design Name: mrdk_40g_a
// Module Name: spi_flash_programmer
// Project Name: marduk
// Target Devices: XCKU9P-FFVE900-1-e (Ultrascale +)
// Tool Versions: Vivado 2018.1
// Description: This module work with SPI Flash memory S25FL512S.
// Dependencies: 
// 
// Additional Comments:
//    SPI Flash Memory - Cypress S25FL512S:
//     All size        - 67108863 bytes (64 MB);
//     131072 Pages    - each by 512 bytes;
//     256 Sectors     - each by 262144 bytes; 
//     32 (4 byte addr mode)
//     CPOL = 0 - 
//     CPHA = 0 -
//     SpiSerDes work in 1, 1 (CPOL, CPHA)
//     RDID            - 0119h // TODO: check
//////////////////////////////////////////////////////////////////////////////////
module spi_flash_programmer(
    input         WR_CLK_I,             // Clock signal, 100 MHz
    input         LOG_CLK_I,            // Clock signal, for SPI communication, may be slower
    input         LOG_RST_I,            // Active-high, synchronous reset
    // Flash
    input  [7:0]  DATA_TO_FIFO_I,       // 8-bit data to FIFO
    input  [31:0] START_ADDR_I,         // Start address for write into SPI memory
    input         START_ADDR_VALID_I,   // Valid signal of start address
    input  [15:0] PAGE_COUNT_I,         // Count of pages for write into SPI memory
    input         PAGE_COUNT_VALID_I,   // Valid signal of page counts
    input  [7:0]  SECTOR_COUNT_I,       // Count of sectors for erase into SPI memory
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
    input         READ_ST_I,
    output        ERASEING_O,           // Finish of erase phase
    output        READ_VALID_O,         // Valid signal of output data
    output        READ_DONE_O,          // Signal of end of read phase
    // SPI 
    output        SPI_CS_O,             // SPI Chip Select for phy transaction
    output        SPI_MOSI_O,           // SPI MOSI for phy transation
    input         SPI_MISO_I            // SPI MISO for phy transaction
);


// {{{ local parameters (constants) --------    
    // SPI Address Width
    localparam       WIDTH            = 32;    // 3 bytes address
    // SPI sector size (in bits)
    localparam       SECTOR_SIZE      = 262144;  // 256 KB
    localparam       SUBSECTOR_SIZE   = 262144;  // because we doesn't have subsectors
    localparam       PAGE_SIZE        = 512;     // 512 bytes
    localparam       SECTOR_COUNT     = 256;   // count of sectors
    localparam       PAGE_COUNT       = 131072; // count of pages 
    localparam       START_ADDR       = 32'h00000000; // First address in SPI
    localparam       END_ADDR         = 32'h03FFFFFF; // Last address in SPI (128 Mb)
    // SPI ID Code
    localparam       IDCODE_25NQ128   = 24'h0119;   // RDID S25FL512S, but not sure
    // SPI tristate
    localparam [3:0] TS_OUTPUT        = 4'h0E;
    localparam [3:0] TS_INPUT         = 4'h0D;
    localparam [3:0] TS_INOUT         = 4'h0C; // TODO: not sure, that this work
    // SPI commands
    localparam [7:0] CMD_RD           = 8'h03; // Read
    localparam [7:0] CMD_FASTREAD     = 8'h0B; // Fast Read
    localparam [7:0] CMD_4FASTREAD    = 8'h0C; // Fast Read from 4 byte address
    localparam [7:0] CMD_RDID         = 8'h9F; // Read ID    
    localparam [7:0] CMD_RDST         = 8'h05; // Read Status Register
    localparam [7:0] CMD_FLAGSTAT     = 8'h70; // Read Flag Status Register
    localparam [7:0] CMD_CLEARSTAT    = 8'h50; // Clear Flag Status Register
    localparam [7:0] CMD_WE           = 8'h06; // Write Enable
    localparam [7:0] CMD_WD           = 8'h04; // Write Disable
    localparam [7:0] CMD_SE           = 8'hD8; // Sector Erase;   64 KB
    localparam [7:0] CMD_4SE          = 8'hDC; // Sector Erase for 4 byte addr
    localparam [7:0] CMD_SSE          = 8'h20; // SubSector Erase; 4 KB
    localparam [7:0] CMD_4SSE         = 8'h21; // SubSector Erase for 4 byte addr
    localparam [7:0] CMD_BE           = 8'hC7; // Bulk Erase
    localparam [7:0] CMD_PP           = 8'h02; // Page Program
    localparam [7:0] CMD_4PP          = 8'h12; // Page Program for 4 byte addr
    localparam [7:0] CMD_PPDUAL       = 8'hA2; // Dual Input Fast Program
    localparam [7:0] CMD_PPQUAD       = 8'h32; // Quad Input Fast Program    
    localparam [7:0] CMD_RDNVCR       = 8'hB5; // Read Non Volatile Configuration Register
    localparam [7:0] CMD_RDVCR        = 8'h85; // Read Volatile Configuration Register
    localparam [7:0] CMD_WRNVCR       = 8'hB1; // Write Non Volatile Configuration register
    localparam [7:0] CMD_WRVCR        = 8'h81; // Write Volatile Configuration register
    localparam [7:0] CMD_RDLK         = 8'hE8; // Read Lock Register
    // FSM
    // Read    
    localparam [2:0] RD_IDLE_S        = 3'h00; // Wait start
    localparam [2:0] RD_INIT_S        = 3'h01; // Set RDID Command
    localparam [2:0] RD_SENDCMD1_S    = 3'h02; // Send READ ID command
    localparam [2:0] RD_DELAY_S       = 3'h03; // Little delay for align
    localparam [2:0] RD_READ_S        = 3'h04; // Read data from SPI MISO    
    localparam [2:0] RD_DONE_S        = 3'h05; // Set read_done signal. End of read.
    // Write
    localparam [3:0] WR_IDLE_S        = 4'h00; // Get start_address and count of page, and set WE command
    localparam [3:0] WR_SENDCMD1_S    = 4'h01; // Send WE command
    localparam [3:0] WR_PPCMD_S       = 4'h02; // Set PP command
    localparam [3:0] WR_SENDCMD2_S    = 4'h03; // Send PP command
    localparam [3:0] WR_DATA_S        = 4'h04; // Send data from FIFO 
    localparam [3:0] WR_STATCMD_S     = 4'h05; // Set READSTAT command
    localparam [3:0] WR_SENDCMD3_S    = 4'h06; // Send READSTAT command
    localparam [3:0] WR_PPDONE_S      = 4'h07; // Get status
    localparam [3:0] WR_PPDONE_WAIT_S = 4'h08; // Check status and set WE command
    localparam [3:0] WR_DELAY_S       = 4'h09;
    // Erase    
    localparam [3:0] ER_IDLE_S        = 4'h00; // Get start_address and count of sector, and set WE command
    localparam [3:0] ER_SENDCMD1_S    = 4'h01; // Send WE command
    localparam [3:0] ER_SECMD_S       = 4'h02; // Set SE command    
    localparam [3:0] ER_SENDCMD2_S    = 4'h03; // Send SE command
    localparam [3:0] ER_STATCMD_S     = 4'h04; // Set READDSTAT command
    localparam [3:0] ER_SENDCMD3_S    = 4'h05; // Send READSTAT command
    localparam [3:0] ER_RDSTAT_S      = 4'h06; // Get status
    localparam [3:0] ER_CHKSTAT_S     = 4'h07; // Check received status and set WE command
    localparam [3:0] ER_DELAY_S       = 4'h08; // Little delay of end
// }}} End local parameters -------------


// {{{ Wire declarations ----------------
    //----- write ----- 
    reg  [5:0]       wr_cmd_cntr         = 6'h28;  // Counter for command
    reg  [39:0]      wr_cmd_reg;                   // Register of command and variables
    reg  [7:0]       wr_rd_data          = 8'h00;  // Register for RDST 
    reg  [39:0]      wr_shft_reg         = 40'h00; // Shift-register for command
 
    reg  [3:0]       wr_data_valid_cntr  = 4'h08;  // Counter of reading of data
    reg  [7:0]       wr_delay_cntr       = 8'h00;  // Counter of delay
    reg  [2:0]       wr_data_cntr        = 3'h00;  // SPI from FIFO Nibble count

    reg  [WIDTH-1:0] wr_current_addr     = 32'h00; // Contains the address of SPI memory
    reg              wr_SpiCsB;                    // Chip Select (inversion: 1 - device is deselected, 0 - enables the device)    
    reg  [3:0]       wr_tristate_data    = 4'h0E;  // Tristate of DO/DI
    reg  [15:0]      page_count          = 16'h00;     
    reg  [7:0]       wr_status           = 8'h03;    
    reg  [9:0]       pkg_counter;

    reg              wr_strt_cmd_cnt;
    reg              wr_strt_vld_cnt;
    reg              wr_strt_dly_cnt;
    reg              wr_strt_data_cntr;
    reg              d_wr_strt_data_cntr = 1'b0;
    reg              wr_strt_shft;
    reg              wr_strt_subtr_cnt;

    wire             write_start;
    reg              write_inprogress    = 1'b0;
    reg              write_done;

    reg  [3:0]       wr_state, wr_next_state;        
    //----- erase -----
    reg  [5:0]       er_cmd_cntr         = 6'h28;
    reg  [39:0]      er_cmd_reg;
    reg  [7:0]       er_rd_data          = 8'h00;

    reg  [3:0]       er_data_valid_cntr  = 4'h08;
    reg  [7:0]       er_delay_cntr       = 8'h00;

    reg  [7:0]       er_sector_count     = 8'h00;
    reg  [WIDTH-1:0] er_curr_sect_addr   = 32'h00;

    reg              er_SpiCsB;
    reg  [3:0]       er_tristate_data    = 4'h0E;
    reg  [7:0]       er_status;

    reg              er_strt_shft;
    reg  [39:0]      er_shft_reg         = 40'h00;

    reg              er_strt_cmd_cnt;
    reg              er_strt_valid_cnt;
    reg              er_strt_delay_cnt;   
    reg              er_strt_subtr_cnt;

    reg              erase_inprogress;
    reg              serase_inprogress   = 1'b0;
    reg              sserase_inprogress  = 1'b0;
    wire             serase_start;
    wire             sserase_start;

    reg  [3:0]       er_state, er_next_state;
    //----- read ---------
    /*reg  [5:0]       rd_cmd_cntr         = 6'h28;
    reg  [39:0]      rd_cmd_reg;
    reg  [7:0]       rd_rd_data          = 8'h00;
    reg  [39:0]      rd_shft_reg         = 40'h00;

    reg  [3:0]       rd_delay_cntr       = 4'h08;
    reg  [3:0]       rd_data_cntr        = 4'h08;

    reg  [WIDTH-1:0] rd_current_addr     = 32'h00;
    reg  [15:0]      rd_data_size        = 16'h00; // to count data in bytes    
    reg  [7:0]       rd_data_out         = 8'h00;  

    reg              rd_strt_cmd_cnt;
    reg              rd_strt_delay_cnt;
    reg              rd_strt_data_cnt;
    reg              rd_strt_shft;    
    reg              d_rd_strt_data_cnt  = 1'b0;

    reg              rd_SpiCsB;
    reg  [3:0]       rd_tristate_data    = 4'h0E;
    wire             read_start;
    reg              read_done;
    reg              read_valid;
    reg              d_read_valid, dd_read_valid;

    reg              read_inprogress     = 1'b0;

    reg  [2:0]       rd_state, rd_next_state;*/
    //----- Startupe3 signals -----
    wire             sSpi_clk;   
    wire             serdes_done; 
    wire             sSpi_cs_done;    
    //----- FIFO signals -----
    reg              fifo_rden;
    reg              d_fifo_rden;
    wire             fifo_empty;
    wire             fifo_full;  
    wire             fifo_almostfull;
    wire             fifo_almostempty;
    wire [7:0]       fifo_dout;
    wire [7:0]       fifo_unconned;   
    wire             fifo_progfull;
    wire             fifo_progempty;
    //----- Other -----                      
    wire [3:0]       miso;
    wire [3:0]       mosi;
    wire             sSpi_Mosi;
    wire             sSpi_Miso;    
    wire             sSpi_cs;
    wire             sSpi_cs_n;            
    wire [7:0]       data_to_spi;           
    
    reg  [31:0]      byte_counter;
    //----- ILA signals -----    
    wire             tmp_er_strt_vald;
    wire             tmp_er_strt_dly;
    wire [39:0]      tmp_er_cmd_reg;
    wire             tmp_er_inprog;
    wire             tmp_er_spics;
    wire             tmp_strt_shft;    
    wire             tmp_er_strt_subtr;

    wire [39:0]      tmp_wr_cmd_reg;
    wire             tmp_wr_spics;
    wire             tmp_wr_done;     
    wire             tmp_wr_strt_cmd;    
    wire             tmp_wr_strt_vld;        
    wire             tmp_fifo_rden;

    /*wire [39:0]      tmp_rd_cmd_reg;                        
    wire             tmp_strt_dt_cnt;
    wire             tmp_rd_done;
    wire             tmp_rd_valid;  
    wire             tmp_rd_strt_dly;
    wire             tmp_rd_strt_dt;
    wire             tmp_rd_strt_shft;     */
// }}} End of wire declarations ------------


// {{{ Wire initializations ------------                       
    assign sSpi_Miso         = miso[1];    
    assign sSpi_cs_done      = sSpi_cs_n || serdes_done;   // TODO: ?
    assign mosi              = {3'b00, sSpi_Mosi};
    assign fifo_unconned     = DATA_TO_FIFO_I;
        
    assign serase_start      = SECT_ERASE_I;
    assign sserase_start     = SSECT_ERASE_I;
    assign write_start       = WRITE_I;
    assign read_start        = READ_I;
    assign st_read_start     = READ_ST_I;
  
    assign data_to_spi       = (erase_inprogress) ? er_cmd_reg[39:32] : 
                               (write_inprogress) ? wr_cmd_reg[39:32] : 8'b00;
                               //rd_cmd_reg[39:32]; 
    assign sSpi_cs           = (erase_inprogress) ? er_SpiCsB         : 
                               (write_inprogress) ? wr_SpiCsB         : 1'b1;
                               //rd_SpiCsB;    

    assign DATA_FROM_SPI_O   = 8'h00;
    assign FIFO_FULL_O       = fifo_progfull; 
    assign FIFO_EMPTY_O      = fifo_progempty;
    assign ERASEING_O        = erase_inprogress;
    assign READ_VALID_O      = 1'b0;//dd_read_valid; 
    assign READ_DONE_O       = 1'b0;//read_done;
    assign WRITE_DONE_O      = write_done;
    assign SPI_MOSI_O        = sSpi_Mosi;
    assign SPI_CS_O          = sSpi_cs_n;
    // Signals for ILA      
    assign tmp_er_addr       = er_curr_sect_addr;    
    assign tmp_er_inprog     = erase_inprogress;
    assign tmp_er_cmd_reg    = er_cmd_reg;
    assign tmp_er_strt_dly   = er_strt_delay_cnt;
    assign tmp_er_strt_vald  = er_strt_valid_cnt;    
    assign tmp_er_spics      = er_SpiCsB;
    assign tmp_strt_shft     = er_strt_shft;
    assign tmp_er_dly_cntr   = er_delay_cntr;
    assign tmp_er_strt_subtr = er_strt_subtr_cnt;
 
    assign tmp_wr_cmd_reg    = wr_cmd_reg;        
    assign tmp_wr_done       = write_done;
    assign tmp_wr_strt_cmd   = wr_strt_cmd_cnt;        
    assign tmp_wr_strt_vld   = wr_strt_vld_cnt;        
    assign tmp_fifo_rden     = fifo_rden;    

    /*assign tmp_rd_cmd_reg    = rd_cmd_reg;        
    assign tmp_rd_done       = read_done; 
    assign tmp_rd_valid      = read_valid; 
    assign tmp_rd_strt_dly   = rd_strt_delay_cnt;
    assign tmp_rd_strt_dt    = rd_strt_data_cnt;
    assign tmp_rd_strt_shft  = rd_strt_shft;   */ 
// }}} End of wire initializations ------------ 

    // Set sector address 
    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I) 
            er_curr_sect_addr <= 32'h00;            
        else if (START_ADDR_VALID_I && ((serase_start) || (sserase_start))) 
            er_curr_sect_addr <= START_ADDR_I;            
        else if (er_strt_subtr_cnt && serase_inprogress)            
            er_curr_sect_addr <= er_curr_sect_addr + SECTOR_SIZE;
        else if (er_strt_subtr_cnt && sserase_inprogress)               
                er_curr_sect_addr <= er_curr_sect_addr + SUBSECTOR_SIZE;       
    end

    // Set count of sectors
    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I) 
            er_sector_count <= 8'h00;
        else if (SECTOR_COUNT_VALID_I && ((serase_start) || (sserase_start))) begin
            er_sector_count <= SECTOR_COUNT_I;
        end else if (er_strt_subtr_cnt && (er_sector_count > 8'h00))
            er_sector_count <= er_sector_count - 1'b1;
    end

    // Shift register for transfer more than 8 bits
    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I) 
            er_shft_reg <= 40'h00;                    
        else if (er_strt_shft) // left-shift (MSB <- LSB)
            er_shft_reg <= {er_shft_reg[31:0], er_shft_reg[39:32]};
        else 
            er_shft_reg <= er_cmd_reg;        
    end
    
    // Erase phase counters
    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I)
            er_cmd_cntr <= 6'h28; // d40: 8 bit cmd and 32 bit address
        else if (!er_strt_cmd_cnt)
            er_cmd_cntr <= 6'h28;
        else
            er_cmd_cntr <= er_cmd_cntr - 1'b1;
    end

    // Delay counter
    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I)
            er_delay_cntr <= 8'h00;
        else if (!er_strt_delay_cnt)
            er_delay_cntr <= 8'h00;
        else 
            er_delay_cntr <= er_delay_cntr + 1'b1;
    end

    // Valid data counter
    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I)
            er_data_valid_cntr <= 4'h08;
        else if (!er_strt_valid_cnt)
            er_data_valid_cntr <= 4'h08;
        else 
            er_data_valid_cntr <= er_data_valid_cntr - 1'b1;
    end 

    // Read data from MISO
    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I)
            er_rd_data <= 8'h00;
        else if (!er_strt_valid_cnt)
            er_rd_data <= 8'h00;
        else  
            er_rd_data <= {er_rd_data[6:0], sSpi_Miso};
    end

    // Status of erasing
    always @(*) begin
        if (LOG_RST_I)
            er_status <= 8'h03;
        else if (er_data_valid_cntr == 4'h00)
            er_status <= er_rd_data;
        else
            er_status <= 8'h03;
    end

    // Internal busy signal for sector erasing
    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I)
            serase_inprogress <= 1'b0;
        else if (serase_start == 1'b0 && erase_inprogress == 1'b0)
            serase_inprogress <= 1'b0;
        else if (serase_start)
            serase_inprogress <= 1'b1;
    end

    // Internal busy signal for subsector eraseing
    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I)
            sserase_inprogress <= 1'b0;
        else if (sserase_start == 1'b0 && erase_inprogress == 1'b0)
            sserase_inprogress <= 1'b0;
        else if (sserase_start)
            sserase_inprogress <= 1'b1;
    end

    //***************** WRITE PHASE counters ************************   
    // Set busy signal
    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I) 
            write_inprogress <= 1'b0;
        else if (write_start)
            write_inprogress <= 1'b1;
        else if (write_done)
            write_inprogress <= 1'b0;
        else 
            write_inprogress <= write_inprogress;
    end

    // Counter of address for writing
    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I)
            wr_current_addr <= 32'h00;
        else if (START_ADDR_VALID_I && (write_start)) 
            wr_current_addr <= START_ADDR_I;
        else if (wr_data_cntr == 3'h07 && (wr_current_addr[8:0] != 10'd511)) 
            wr_current_addr <= wr_current_addr + 1'b1; 
        else if (wr_strt_subtr_cnt)
            wr_current_addr <= wr_current_addr + 1'b1;
    end

    // Counter of pages for writing
    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I)
            page_count <= 16'h00;
        else if (PAGE_COUNT_VALID_I && (write_start)) 
            page_count <= PAGE_COUNT_I;    
        else if (wr_strt_subtr_cnt)    
            page_count <= page_count - 1'b1;
    end

    // Shift reg for command reg
    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I)
            wr_shft_reg <= 40'h00;
        else if (wr_strt_shft)
            wr_shft_reg <= {wr_shft_reg[31:0], wr_shft_reg[39:32]};
        else
            wr_shft_reg <= wr_cmd_reg;
    end

    // Counter for command reg
    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I)
            wr_cmd_cntr <= 6'h28; // d40: 8 bit cmd and 32 bit address
        else if (!wr_strt_cmd_cnt)
            wr_cmd_cntr <= 6'h28; 
        else
            wr_cmd_cntr <= wr_cmd_cntr - 1'b1;
    end

    // Counter of delay
    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I)
            wr_delay_cntr <= 8'h00;
        else if (!wr_strt_dly_cnt)
            wr_delay_cntr <= 8'h00;
        else
            wr_delay_cntr <= wr_delay_cntr + 1'b1;
    end

    // Counter of valid (input from SPI) data
    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I)
            wr_data_valid_cntr <= 4'h08;
        else if (!wr_strt_vld_cnt)
            wr_data_valid_cntr <= 4'h08;
        else
            wr_data_valid_cntr <= wr_data_valid_cntr - 1'b1;
    end 

    // Counter of input data
    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I) 
            wr_data_cntr <= 3'h00;
        else if (!wr_strt_data_cntr)
            wr_data_cntr <= 3'h00;        
        else
            wr_data_cntr <= wr_data_cntr + 1'b1;
    end

    // Delayed signal of start of data count
    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I)
            d_wr_strt_data_cntr <= 1'b0;
        else
            d_wr_strt_data_cntr <= wr_strt_data_cntr;
    end

    // Status of writing
    always @(*) begin
        if (LOG_RST_I) 
            wr_status <= 8'h03;
        else if (wr_data_valid_cntr == 4'h00)
            wr_status <= wr_rd_data;
        else
            wr_status <= 8'h03;
    end   

    // Delayed signal of FIFO read enable
    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I)
            d_fifo_rden <= 1'b0;
        else 
            d_fifo_rden <= fifo_rden;
    end

    // Counter of bytes in sending page
    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I) 
            pkg_counter <= 10'h00;
        else if (wr_strt_subtr_cnt)
            pkg_counter <= 10'h00;
        else if (d_fifo_rden)
            pkg_counter <= pkg_counter + 1'b1;        
    end
    
    // Couner of all sending bytes    
    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I)
            byte_counter <= 32'h00;
        else if ((wr_data_cntr == 3'h07) && (d_wr_strt_data_cntr == 1'b1))
            byte_counter <= byte_counter + 1'b1;
    end
  
    // Serialize status of Flash from SPI MISO    
    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I)
            wr_rd_data <= 8'h00;
        else if (!wr_strt_vld_cnt)
            wr_rd_data <= 8'h00;
        else 
            wr_rd_data <= {wr_rd_data[6:0], sSpi_Miso};
    end    
    
    //************* READ PHASE counters ****************
  /*  always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I)
            read_inprogress <= 1'b0;                    
        else if (read_start)
            read_inprogress <= 1'b1;
        else if (read_done)        
            read_inprogress <= 1'b0;
        else
            read_inprogress <= read_inprogress;
    end

    // Counter of command bytes for sending
    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I)
            rd_cmd_cntr <= 6'h28;
        else if (!rd_strt_cmd_cnt)
            rd_cmd_cntr <= 6'h28;
        else
            rd_cmd_cntr <= rd_cmd_cntr - 1'b1;
    end

    // Delay counter
    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I)
            rd_delay_cntr <= 4'h08;
        else if (!rd_strt_delay_cnt)
            rd_delay_cntr <= 4'h08;
        else
            rd_delay_cntr <= rd_delay_cntr - 1'b1;
    end
   
    // Count of input (from SPI Flash) data
    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I)
            rd_data_cntr <= 4'h08;
        else if (!rd_strt_data_cnt)
            rd_data_cntr <= 4'h08;
        else if ((rd_data_cntr == 4'h08) || (rd_data_cntr == 4'h07))
            rd_data_cntr <= 4'h00;
        else
            rd_data_cntr <= rd_data_cntr + 1'b1;
    end

    // Serialize data from SPI MISO
    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I)
            rd_rd_data <= 8'h00;
        else if (!d_rd_strt_data_cnt)
            rd_rd_data <= 8'h00;
        else
            rd_rd_data <= {rd_rd_data[6:0], sSpi_Miso};
    end

    // Count of size of requested data
    always @(posedge LOG_CLK_I) begin 
        if (LOG_RST_I)
            rd_data_size <= 16'h00;        
        else if (rd_data_cntr == 4'h06) begin
            rd_data_size <= rd_data_size - 1'b1;
        end else if (read_start && PAGE_COUNT_VALID_I)
            rd_data_size <= PAGE_COUNT_I;
    end

    // Get start address for reading
    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I) 
            rd_current_addr <= 32'h00;
        else if (START_ADDR_VALID_I && read_start) 
            rd_current_addr <= START_ADDR_I;        
    end

    // Set delay signal for valid
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
            d_rd_strt_data_cnt <= 1'b0;
        else 
            d_rd_strt_data_cnt <= rd_strt_data_cnt;
    end    

    // Set output data
    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I)
            rd_data_out <= 8'h00; 
        else if (d_read_valid) 
            rd_data_out <= rd_rd_data;
        else
            rd_data_out <= 8'h00;
    end

    // Set shift register for command (when need send more than 1 byte)
    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I) 
            rd_shft_reg <= 40'h00;
        else if (rd_strt_shft)
            rd_shft_reg <= {rd_shft_reg[31:0], 8'h00};
        else
            rd_shft_reg <= rd_cmd_reg;
    end*/
    //*******************************************


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
                if (serase_start || sserase_start) 
                    er_next_state = ER_SENDCMD1_S;
                else 
                    er_next_state = ER_IDLE_S;
            end

            ER_SENDCMD1_S: begin                          // 1
                if (er_sector_count == 8'h00)
                    er_next_state = ER_IDLE_S;
                else begin
                    if (er_cmd_cntr == 6'd32) 
                        er_next_state = ER_SECMD_S;
                    else
                        er_next_state = ER_SENDCMD1_S;
                end
            end

            ER_SECMD_S: begin                             // 2 
                if (er_delay_cntr == 8'h02)
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
                if (er_delay_cntr == 8'h04) // TODO: was +1 (5)
                    er_next_state = ER_SENDCMD3_S;
                else
                    er_next_state = ER_STATCMD_S;
            end

            ER_SENDCMD3_S: begin                           // 5
                if (er_cmd_cntr == 6'd32)
                    er_next_state = ER_RDSTAT_S;
                else
                    er_next_state = ER_SENDCMD3_S;
            end

            ER_RDSTAT_S: begin                            // 6
                if (er_data_valid_cntr == 4'h01)
                    er_next_state = ER_CHKSTAT_S;
                else
                    er_next_state = ER_RDSTAT_S;                
            end

            ER_CHKSTAT_S: begin                             // 7
                if (er_status[1:0] == 2'h00) begin                                   
                    er_next_state = ER_DELAY_S;
                end else
                    er_next_state = ER_STATCMD_S;
            end

            ER_DELAY_S: begin
                if (er_delay_cntr == 8'h02)
                    er_next_state = ER_SENDCMD1_S;
                else
                    er_next_state = ER_DELAY_S;
            end

            default: begin
                er_next_state     = ER_IDLE_S;
            end
        endcase
    end

    always @(*) begin       
        case (er_state)
            ER_IDLE_S: begin                                           // 0                                                                            
                er_SpiCsB         = 1'b1;                
                er_strt_cmd_cnt   = 1'b0;
                er_strt_delay_cnt = 1'b0;                
                er_strt_valid_cnt = 1'b0;    
                er_strt_shft      = 1'b0;                 
                erase_inprogress  = 1'b0;           
                er_strt_subtr_cnt = 1'b0;                  
                er_cmd_reg        = {CMD_WE, 32'h00};
            end

            ER_SENDCMD1_S: begin                                       // 1
                er_strt_shft      = 1'b0;                                   
                er_cmd_reg        = {CMD_WE, 32'h00};
                if (er_sector_count > 8'h00) begin
                    er_SpiCsB         = 1'b0;
                    erase_inprogress  = 1'b1;
                    er_strt_cmd_cnt   = 1'b1;
                    er_strt_delay_cnt = 1'b0; 
                    er_strt_valid_cnt = 1'b0;     
                    er_strt_subtr_cnt = 1'b0;         
                end else begin
                    er_SpiCsB         = 1'b1;
                    erase_inprogress  = 1'b0;
                end
            end
            
            ER_SECMD_S: begin                                      // 2                             
                er_SpiCsB         = 1'b1;                
                erase_inprogress  = 1'b1;                
                er_strt_cmd_cnt   = 1'b0;
                er_strt_delay_cnt = 1'b1;                
                er_strt_valid_cnt = 1'b0;
                er_strt_subtr_cnt = 1'b0;
                er_strt_shft      = 1'b0;                                              
                if (serase_inprogress)
                    er_cmd_reg    = {CMD_4SE, er_curr_sect_addr};                
                else if (sserase_inprogress)
                    er_cmd_reg    = {CMD_4SE, er_curr_sect_addr}; // TODO: was SSE
            end

            ER_SENDCMD2_S: begin                                   // 3
                er_SpiCsB         = 1'b0;                
                erase_inprogress  = 1'b1;
                er_strt_cmd_cnt   = 1'b1;
                er_strt_delay_cnt = 1'b0;
                er_strt_shft      = 1'b0;                
                er_strt_valid_cnt = 1'b0;
                er_strt_subtr_cnt = 1'b0;    
                er_cmd_reg        = er_shft_reg;                              
                if ((er_cmd_cntr == 6'd09) || (er_cmd_cntr == 6'd17)
                 || (er_cmd_cntr == 6'd25) || (er_cmd_cntr == 6'd33))
                    er_strt_shft  = 1'b1;
            end 

            ER_STATCMD_S: begin                                      // 4
                er_SpiCsB          = 1'b1;
                erase_inprogress   = 1'b1;
                er_strt_cmd_cnt    = 1'b0;
                er_strt_delay_cnt  = 1'b1;                 
                er_strt_shft       = 1'b0;
                er_strt_subtr_cnt  = 1'b0;                  
                er_strt_valid_cnt  = 1'b0;              
                er_cmd_reg         = {CMD_RDST, 32'h00};
            end

            ER_SENDCMD3_S: begin                                     // 5
                er_SpiCsB          = 1'b0;                
                erase_inprogress   = 1'b1;
                er_strt_cmd_cnt    = 1'b1;
                er_strt_delay_cnt  = 1'b0;                                            
                er_strt_valid_cnt  = 1'b0;
                er_strt_subtr_cnt  = 1'b0;
                er_strt_shft       = 1'b0;                                                          
                er_cmd_reg         = {CMD_RDST, 32'h00};
            end

            ER_RDSTAT_S: begin                                        // 6
                er_SpiCsB          = 1'b0;                
                erase_inprogress   = 1'b1;
                er_strt_cmd_cnt    = 1'b0;                
                er_strt_delay_cnt  = 1'b0;
                er_strt_valid_cnt  = 1'b1;
                er_strt_subtr_cnt  = 1'b0;  
                er_strt_shft       = 1'b0;                                                
                er_cmd_reg         = {CMD_RDST, 32'h00};                
            end

            ER_CHKSTAT_S: begin                                     // 7
                er_SpiCsB          = 1'b1;                
                erase_inprogress   = 1'b1;
                er_strt_cmd_cnt    = 1'b0;                    
                er_strt_valid_cnt  = 1'b0;
                er_strt_delay_cnt  = 1'b0;                                            
                er_strt_subtr_cnt  = 1'b0;
                er_strt_shft       = 1'b0;        
                er_cmd_reg         = {CMD_RDST, 32'h00};        
                if (er_status[1:0] == 2'h00)                                                                                         
                    er_strt_subtr_cnt = 1'b1;                                                                                 
            end

            ER_DELAY_S: begin
                er_SpiCsB          = 1'b1;                
                erase_inprogress   = 1'b1; 
                er_strt_cmd_cnt    = 1'b0;                      
                er_strt_delay_cnt  = 1'b1;
                er_strt_valid_cnt  = 1'b0;
                er_strt_subtr_cnt  = 1'b0;
                er_strt_shft       = 1'b0;                            
                er_cmd_reg         = {CMD_WE, 32'h00};
            end

            default: begin                                                  
                            
            end
        endcase
    end
// }}} End of erase sectors FSM ------------    


// {{{ Write Data to Program Pages FSM -----
    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I)
            wr_state <= WR_IDLE_S;
        else 
            wr_state <= wr_next_state;
    end

    always @(*) begin
        wr_next_state = WR_IDLE_S;
        case(wr_state)
            WR_IDLE_S: begin                                            // 0
                if (!fifo_progempty && write_inprogress)
                    wr_next_state = WR_SENDCMD1_S;
                else
                    wr_next_state = WR_IDLE_S;
            end

            WR_SENDCMD1_S: begin                                        // 1
                if (page_count != 16'h00) begin
                    if (wr_cmd_cntr == 6'd32)
                        wr_next_state = WR_PPCMD_S;
                    else
                        wr_next_state = WR_SENDCMD1_S;
                end else
                    wr_next_state = WR_IDLE_S;
            end

            WR_PPCMD_S: begin                                           // 2
                if (wr_delay_cntr == 8'h02)
                    wr_next_state = WR_SENDCMD2_S;
                else
                    wr_next_state = WR_PPCMD_S;
            end

            WR_SENDCMD2_S: begin                                        // 3
                if (wr_cmd_cntr == 6'd01) 
                    wr_next_state = WR_DATA_S;
                else
                    wr_next_state = WR_SENDCMD2_S;
            end

            WR_DATA_S: begin                                            // 4
                if ((pkg_counter == 10'd511) && (d_fifo_rden)) 
                    wr_next_state = WR_STATCMD_S;
                else
                    wr_next_state = WR_DATA_S;
            end

            WR_STATCMD_S: begin                                         // 5
                if (wr_delay_cntr == 8'h04)
                    wr_next_state = WR_SENDCMD3_S;
                else
                    wr_next_state = WR_STATCMD_S;
            end

            WR_SENDCMD3_S: begin                                        // 6
                if (wr_cmd_cntr == 6'd32)
                    wr_next_state = WR_PPDONE_S;
                else
                    wr_next_state = WR_SENDCMD3_S;
            end

            WR_PPDONE_S: begin                                           // 7
                if (wr_data_valid_cntr == 4'h01)
                    wr_next_state = WR_PPDONE_WAIT_S;
                else
                    wr_next_state = WR_PPDONE_S;
            end

            WR_PPDONE_WAIT_S: begin                                      // 8
                if (wr_status[1:0] == 2'h00)                
                    wr_next_state = WR_DELAY_S;
                else
                    wr_next_state = WR_STATCMD_S;
            end

            WR_DELAY_S: begin
                if (wr_delay_cntr == 8'h01)
                    wr_next_state = WR_SENDCMD1_S;
                else
                    wr_next_state = WR_DELAY_S;
            end

            default: begin
                wr_next_state     = WR_IDLE_S;
            end
        endcase
    end

    always @(*) begin
        case (wr_state)
            WR_IDLE_S: begin                                            // 0
                wr_SpiCsB         = 1'b1;                
                fifo_rden         = 1'b0;
                write_done        = 1'b0;               
                wr_strt_cmd_cnt   = 1'b0;
                wr_strt_data_cntr = 1'b0;
                wr_strt_vld_cnt   = 1'b0;
                wr_strt_dly_cnt   = 1'b0;
                wr_strt_shft      = 1'b0;
                wr_strt_subtr_cnt = 1'b0;
                wr_cmd_reg        = {CMD_WE, 32'h00};
            end

            WR_SENDCMD1_S: begin                                        // 1                
                wr_SpiCsB         = 1'b0;                
                fifo_rden         = 1'b0;                            
                wr_strt_data_cntr = 1'b0;
                wr_strt_vld_cnt   = 1'b0;
                wr_strt_dly_cnt   = 1'b0;       
                wr_strt_shft      = 1'b0;
                wr_strt_subtr_cnt = 1'b0;
                wr_cmd_reg        = {CMD_WE, 32'h00};         
                write_done        = 1'b0;                  
                wr_strt_cmd_cnt   = 1'b1; 
                if (page_count    == 16'h00) begin                                                                      
                    wr_SpiCsB       = 1'b1;
                    write_done      = 1'b1;
                    wr_strt_cmd_cnt = 1'b0;
                end
            end

            WR_PPCMD_S: begin                                           // 2
                wr_SpiCsB         = 1'b1;                
                fifo_rden         = 1'b0;               
                wr_strt_cmd_cnt   = 1'b0;
                wr_strt_data_cntr = 1'b0;
                wr_strt_vld_cnt   = 1'b0;
                wr_strt_dly_cnt   = 1'b1;
                wr_strt_shft      = 1'b0;
                wr_strt_subtr_cnt = 1'b0;
                wr_cmd_reg        = {CMD_4PP, wr_current_addr};
                write_done        = 1'b0;                
            end

            WR_SENDCMD2_S: begin                                        // 3
                wr_SpiCsB         = 1'b0;                
                fifo_rden         = 1'b0;                
                wr_strt_cmd_cnt   = 1'b1;
                wr_strt_data_cntr = 1'b0;
                wr_strt_vld_cnt   = 1'b0;
                wr_strt_dly_cnt   = 1'b0;
                wr_strt_shft      = 1'b0;
                wr_strt_subtr_cnt = 1'b0;
                wr_cmd_reg        = wr_shft_reg;
                write_done        = 1'b0;                
                if ((wr_cmd_cntr == 6'd09) || (wr_cmd_cntr == 6'd17)
                 || (wr_cmd_cntr == 6'd25) || (wr_cmd_cntr == 6'd33))
                    wr_strt_shft  = 1'b1;
            end

            WR_DATA_S: begin                                            // 4
                wr_SpiCsB         = 1'b0;                   
                wr_strt_cmd_cnt   = 1'b0;
                wr_strt_data_cntr = 1'b1;
                wr_strt_vld_cnt   = 1'b0;
                wr_strt_dly_cnt   = 1'b0;
                wr_strt_shft      = 1'b0;
                wr_strt_subtr_cnt = 1'b0;
                write_done        = 1'b0;                
                if ((wr_data_cntr == 3'h07) && (d_wr_strt_data_cntr == 1'b1))
                    fifo_rden     = 1'b1;
                else
                    fifo_rden     = 1'b0;                
                wr_cmd_reg        = {fifo_dout, 32'h00};                
            end

            WR_STATCMD_S: begin                                         // 5
                wr_SpiCsB         = 1'b1;                
                fifo_rden         = 1'b0;                               
                wr_strt_cmd_cnt   = 1'b0;
                wr_strt_data_cntr = 1'b0;
                wr_strt_vld_cnt   = 1'b0;
                wr_strt_dly_cnt   = 1'b1;
                wr_strt_shft      = 1'b0;
                wr_strt_subtr_cnt = 1'b0;
                wr_cmd_reg        = {CMD_RDST, 32'h00};
                write_done        = 1'b0;                
            end

            WR_SENDCMD3_S: begin                                        // 6
                wr_SpiCsB         = 1'b0;                
                fifo_rden         = 1'b0;                 
                wr_strt_cmd_cnt   = 1'b1;
                wr_strt_data_cntr = 1'b0;
                wr_strt_vld_cnt   = 1'b0;
                wr_strt_dly_cnt   = 1'b0;
                wr_strt_shft      = 1'b0;
                wr_strt_subtr_cnt = 1'b0;
                wr_cmd_reg        = {CMD_RDST, 32'h00};
                write_done        = 1'b0;                
                if (wr_cmd_cntr == 6'd32)
                    wr_cmd_reg    = 32'h00;
            end

            WR_PPDONE_S: begin                                          // 7
                wr_SpiCsB         = 1'b0;                   
                fifo_rden         = 1'b0;              
                wr_strt_cmd_cnt   = 1'b0;
                wr_strt_data_cntr = 1'b0;
                wr_strt_vld_cnt   = 1'b1;
                wr_strt_dly_cnt   = 1'b0;
                wr_strt_shft      = 1'b0;
                wr_strt_subtr_cnt = 1'b0;                                               
                wr_cmd_reg        = 32'h00;
                write_done        = 1'b0;                
            end

            WR_PPDONE_WAIT_S: begin                                     // 8
                wr_SpiCsB         = 1'b1;                 
                fifo_rden         = 1'b0;                            
                wr_strt_cmd_cnt   = 1'b0;
                wr_strt_data_cntr = 1'b0;
                wr_strt_vld_cnt   = 1'b0;
                wr_strt_dly_cnt   = 1'b0;
                wr_strt_shft      = 1'b0;                
                wr_strt_subtr_cnt = 1'b0;
                wr_cmd_reg        = {CMD_RDST, 32'h00};
                write_done        = 1'b0;                
                if (wr_status[1:0] == 2'h00) begin
                    wr_cmd_reg        = {CMD_WE, 32'h00};
                    wr_strt_subtr_cnt = 1'b1;
                end 
            end

            WR_DELAY_S: begin
                wr_SpiCsB         = 1'b1;                   
                fifo_rden         = 1'b0;              
                wr_strt_cmd_cnt   = 1'b0;
                wr_strt_data_cntr = 1'b0;
                wr_strt_vld_cnt   = 1'b0;
                wr_strt_dly_cnt   = 1'b1;
                wr_strt_shft      = 1'b0;
                wr_strt_subtr_cnt = 1'b0;                               
                wr_cmd_reg        = {CMD_WE, 32'h00};
                write_done        = 1'b0;
            end

            default: begin
                 
            end
        endcase
    end
// }}} End of write data FSM ---------------


// {{{ Read data of FSM ---------
/*    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I)
            rd_state <= RD_IDLE_S;
        else
            rd_state <= rd_next_state;
    end

    always @(*) begin
        rd_next_state = RD_IDLE_S;
        case (rd_state)
            RD_IDLE_S: begin                            // 0
                if (read_inprogress && (rd_data_size > 16'h00))
                    rd_next_state = RD_INIT_S;
                else
                    rd_next_state = RD_IDLE_S;
            end

            RD_INIT_S: begin                            // 1
                rd_next_state     = RD_SENDCMD1_S;
            end

            RD_SENDCMD1_S: begin                        // 2
                if (rd_cmd_cntr == 6'h01)
                    rd_next_state = RD_DELAY_S; // READ_S;
                else
                    rd_next_state = RD_SENDCMD1_S;
            end

            // XXX: uncomment for FAST_READ
            RD_DELAY_S: begin                          // 3
                if (rd_delay_cntr == 4'h01)
                    rd_next_state = RD_READ_S;
                else 
                    rd_next_state = RD_DELAY_S;
            end

            RD_READ_S: begin                            // 4
                if (rd_data_size == 16'h00)
                    rd_next_state = RD_DONE_S;
                else
                    rd_next_state = RD_READ_S;
            end

            RD_DONE_S: begin                            // 5
                rd_next_state     = RD_IDLE_S;
            end

            default: begin
                rd_next_state     = RD_IDLE_S;
            end
        endcase
    end

    always @(*) begin
        case(rd_state)
            RD_IDLE_S: begin                                                // 0                                
                rd_SpiCsB         = 1'b1;                
                rd_strt_cmd_cnt   = 1'b0;
                rd_strt_data_cnt  = 1'b0;
                rd_strt_delay_cnt = 1'b0;
                rd_strt_shft      = 1'b0;
                read_valid        = 1'b0;    
                read_done         = 1'b0;            
                rd_cmd_reg        = 40'h00;
            end

            RD_INIT_S: begin                                                // 1
                rd_SpiCsB         = 1'b1;                
                rd_strt_cmd_cnt   = 1'b0;
                rd_strt_data_cnt  = 1'b0;
                rd_strt_delay_cnt = 1'b0;
                rd_strt_shft      = 1'b0;
                read_valid        = 1'b0;
                read_done         = 1'b0;                
                rd_cmd_reg        = {CMD_4FASTREAD, rd_current_addr};
            end

            RD_SENDCMD1_S: begin                                            // 2
                rd_SpiCsB         = 1'b0;                          
                rd_strt_cmd_cnt   = 1'b1;
                rd_strt_data_cnt  = 1'b0;
                rd_strt_delay_cnt = 1'b0;                
                rd_strt_shft      = 1'b0;
                read_valid        = 1'b0;
                read_done         = 1'b0;
                rd_cmd_reg        = rd_shft_reg;
                if ((rd_cmd_cntr == 6'd09) || (rd_cmd_cntr == 6'd17)
                 || (rd_cmd_cntr == 6'd25) || (rd_cmd_cntr == 6'd33))
                    rd_strt_shft  = 1'b1;                
            end

            RD_DELAY_S: begin                                             // 3
                rd_SpiCsB         = 1'b0;                
                rd_strt_cmd_cnt   = 1'b0;
                rd_strt_data_cnt  = 1'b0;
                rd_strt_delay_cnt = 1'b1;
                rd_strt_shft      = 1'b0;
                rd_cmd_reg        = 40'h00;
                read_valid        = 1'b0;   
                read_done         = 1'b0;                
            end

            RD_READ_S: begin                                                // 4                
                rd_SpiCsB         = 1'b0;            
                rd_strt_cmd_cnt   = 1'b0;
                rd_strt_data_cnt  = 1'b1;
                rd_strt_delay_cnt = 1'b0;
                rd_strt_shft      = 1'b0;
                rd_cmd_reg        = 40'h00;                
                read_valid        = 1'b0;
                read_done         = 1'b0; 
                if (rd_data_cntr == 4'h07)
                    read_valid    = 1'b1;                
            end        

            RD_DONE_S: begin                                                // 5                                            
                rd_SpiCsB         = 1'b1;                
                rd_strt_cmd_cnt   = 1'b0;
                rd_strt_data_cnt  = 1'b0;
                rd_strt_delay_cnt = 1'b0;
                rd_strt_shft      = 1'b0;
                rd_cmd_reg        = 40'h00;
                read_valid        = 1'b0;
                read_done         = 1'b1;                
            end

            default: begin                                
                
            end
        endcase
    end*/
// }}} End of read data FSM -------------


// {{{ Include other modules ------------
    spi_serdes SerDes    (
        .CLK_I           ( LOG_CLK_I  ),   // 1 bit input:  Clock signal       
        .RST_I           ( LOG_RST_I  ),   // 1 bit input:  Reset signal
        
        .SPI_CS_I        ( sSpi_cs    ),   // 1 bit input:  SPI Chip Select signal
        .START_TRANS_I   ( !sSpi_cs_n ),   // 1 bit input:  Signal of start of SPI transfer
        .DONE_TRANS_O    ( serdes_done ),  // 1 bit output: End of SPI transfer
                        
        .DATA_TO_SPI_I   ( data_to_spi ),  // 8 bit input:  Data to transfer via SPI
        .DATA_FROM_SPI_O (     ),  // 8 bit output: Received data from SPI
                        
        .SPI_CLK_O       ( sSpi_clk   ),   // 1 bit output: Clock signal for SPI transaction
        .SPI_CS_N_O      ( sSpi_cs_n  ),   // 1 bit output: Negedge Chip Select signal for SPI transaction 
        .SPI_MOSI_O      ( sSpi_Mosi  ),   // 1 bit output: Master output signal  
        .SPI_MISO_I      ( sSpi_Miso  )    // 1 bit input:  Master input signal
    );

    STARTUPE3 #(
      .PROG_USR("FALSE"),   // Activate program event security feature. Requires encrypted bitstreams.
      .SIM_CCLK_FREQ(0.0)  // Set the Configuration Clock Frequency (ns) for simulation
    )
    STARTUPE3_inst (
      .CFGCLK      (              ),          // 1-bit output: Configuration main clock output
      .CFGMCLK     (              ),          // 1-bit output: Configuration internal oscillator clock output
      .DI          ( miso         ),          // 4-bit output: Allow receiving on the D input pin
      .EOS         (              ),          // 1-bit output: Active-High output signal indicating the End Of Startup
      .PREQ        (              ),          // 1-bit output: PROGRAM request to fabric output
      .DO          ( mosi         ),          // 4-bit input: Allows control of the D pin output
      .DTS         ( TS_OUTPUT    ),          // 4-bit input: Allows tristate of the D pin
      .FCSBO       ( sSpi_cs_done ),          // 1-bit input: Controls the FCS_B pin for flash access
      .FCSBTS      ( 1'b0         ),          // 1-bit input: Tristate the FCS_B pin
      .GSR         ( 1'b0         ),          // 1-bit input: Global Set/Reset input (GSR cannot be used for the port)
      .GTS         ( 1'b0         ),          // 1-bit input: Global 3-state input (GTS cannot be used for the port name)
      .KEYCLEARB   ( 1'b1         ),          // 1-bit input: Clear AES Decrypter Key input from Battery-Backed RAM (BBRAM)
      .PACK        ( 1'b1         ),          // 1-bit input: PROGRAM acknowledge input
      .USRCCLKO    ( LOG_CLK_I    ),          // 1-bit input: User CCLK input
      .USRCCLKTS   ( 1'b0         ),          // 1-bit input: User CCLK 3-state enable input
      .USRDONEO    ( 1'b1         ),          // 1-bit input: User DONE pin output control
      .USRDONETS   ( 1'b0         )           // 1-bit input: User DONE 3-state enable output
    );
    

    fifo_spi_data fifo_spi (
        .wr_clk            ( WR_CLK_I         ),
        .rd_clk            ( LOG_CLK_I        ),
        .rst               ( LOG_RST_I        ),

        .din               ( fifo_unconned    ),
        .dout              ( fifo_dout        ),

        .wr_en             ( FIFO_WREN_I      ),
        .rd_en             ( fifo_rden        ),        
        .full              ( fifo_full        ),        
        .empty             ( fifo_empty       ),        
        .prog_full         ( fifo_progfull    ), 
        .prog_empty        ( fifo_progempty   ),

        .wr_rst_busy       ( ),
        .rd_rst_busy       ( )
    );    
   

    dbg_spi_data dbg_data (
        .clk              ( LOG_CLK_I           ),
  
        .probe0           ( sSpi_cs_done        ),
        .probe1           ( sSpi_Mosi           ),
        .probe2           ( sSpi_Miso           ),
    
        // Erase phase                                                
        .probe3           ( er_state            ),        
        .probe4           ( er_next_state       ),                
  
        .probe5           ( er_cmd_cntr         ),
        .probe6           ( tmp_er_cmd_reg      ),                
                             
        .probe7           ( tmp_er_strt_dly     ),
        .probe8           ( tmp_er_strt_subtr   ),        
  
        .probe9           ( er_rd_data          ),                                         
        .probe10          ( er_status           ),
  
        .probe11          ( er_sector_count     ),
        .probe12          ( er_curr_sect_addr   ),
  
        .probe13          ( tmp_er_strt_vald    ),
        .probe14          ( er_delay_cntr       ),        
        .probe15          ( er_data_valid_cntr  ),                                    
  
        // Write phase  
        .probe16          ( data_to_spi         ),        
  
        .probe17          ( wr_state            ), 
        .probe18          ( wr_next_state       ), 
  
        .probe19          ( write_start         ),
        .probe20          ( tmp_wr_strt_cmd     ), 
        .probe21          ( wr_cmd_cntr         ), 
        .probe22          ( tmp_wr_cmd_reg      ), 
        .probe23          ( tmp_wr_done         ),                 

        .probe24          ( wr_delay_cntr       ), 
        .probe25          ( tmp_wr_strt_vld     ),      
        .probe26          ( wr_data_valid_cntr  ), 
                
        .probe27          ( page_count          ),
        .probe28          ( wr_current_addr     ),     

        .probe29          ( fifo_progempty      ),
        .probe30          ( wr_status           ),
        .probe31          ( wr_rd_data          ), // TODO: wr_Rd_data
        .probe32          ( tmp_fifo_rden       ),
        .probe33          ( fifo_dout           ),        
        
        //.probe34          ( byte_counter        ),
        .probe34          ( write_inprogress    ),
        // Read phase  
/*        .probe36          ( rd_state            ), 
        .probe37          ( rd_next_state       ), 

        .probe38          ( rd_data_out         ),
        .probe39          ( read_valid          ), 

        .probe40          ( fifo_progfull       ),
        .probe41          ( rd_delay_cntr       ),
                
        .probe42          ( rd_rd_data          ),
        .probe43          ( rd_current_addr     ),
        .probe44          ( tmp_rd_done         ),*/
        .probe35          ( fifo_unconned       ),

        .probe36          ( pkg_counter         ),
        .probe37          ( d_fifo_rden         )
    );
// }}} End of Include other modules ------------

endmodule