`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: VlSU
// Engineer: Gustov Vladimir
// 
// Create Date: 12.12.2017 10:56:54
// Design Name: 
// Module Name: spi_flash_programmer
// Project Name: srio_spi
// Target Devices: Kintex-7
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

module spi_flash_programmer(
    input         LOG_CLK_I, 
    input         LOG_RST_I,
    //
    input [63:0]  DATA_TO_FIFO_I,
    input [23:0]  START_ADDR_I,
    input         START_ADDR_VALID_I,
    input [15:0]  PAGE_COUNT_I,
    input         PAGE_COUNT_VALID_I,
    input [11:0]  SECTOR_COUNT_I,
    input         SECTOR_COUNT_VALID_I,
    //
    input         FIFO_WREN_I,
    output        FIFO_FULL_O,
    output        FIFO_EMPTY_O,    
    output        WRITE_DONE_O,
    //        
    input         ERASE_I,
    input         WRITE_I,
    output        ERASEING_O,
    //
    output        SPI_CS_O,
    output        SPI_MOSI_O,
    input         SPI_MISO_I    
);

/*
    SPI Flash Memory - Micron N25Q128A:
        All size        - 16777216 bytes (16 MB);
        65536 Pages     - by 256 bytes;
        256 Sectors     - by 65536 bytes; 
        4096 Subsectors - by 4096 bytes; 
        24 (3 byte addr mode)
        CPOL = 0 - Сигнал синхронизации начинается с низкого уровня
        CPHA = 0 - Выборка данных производится по переднему фронту сигнала синхронизации
*/

// {{{ local parameters (constants) --------    
    // SPI Address Width
    localparam       WIDTH          = 24;
    // SPI sector size (in bits)
    localparam       SECTOR_SIZE    = 65536;  // 64 Kbits
    localparam       SUBSECTOR_SIZE = 4096;   // 4 Kbits
    localparam       PAGE_SIZE      = 256;    // 256 
    localparam       SECTOR_COUNT   = 256;
    localparam       PAGE_COUNT     = 65536;
    localparam       START_ADDR     = 32'h00000000; // First address in SPI
    localparam       END_ADDR       = 32'h00FFFFFF; // Last address in SPI (128 Mb)
    // SPI ID Code
    localparam       IDCODE_25NQ128 = 24'h20BB18;   // RDID N25Q128A    
    // SPI commands
    localparam [7:0] CMD_RD         = 8'h03; // Read
    localparam [7:0] CMD_FASTREAD   = 8'h0B; // Fast Read
    localparam [7:0] CMD_RDID       = 8'h9F; // Read ID
    localparam [7:0] CMD_FLAGSTAT   = 8'h70; // Read Flag Status Register
    localparam [7:0] CMD_CLEARSTAT  = 8'h50; // Clear Flag Status Register
    localparam [7:0] CMD_RDST       = 8'h05; // Read Status Register, стр 21
    localparam [7:0] CMD_WE         = 8'h06; // Write Enable
    localparam [7:0] CMD_WD         = 8'h04; // Write Disable
    localparam [7:0] CMD_SE         = 8'hD8; // Sector Erase;   64 KB
    localparam [7:0] CMD_SSE        = 8'h20; // SubSector Erase; 4 KB
    localparam [7:0] CMD_BE         = 8'hC7; // Bulk Erase
    localparam [7:0] CMD_PP         = 8'h02; // Page Program
    localparam [7:0] CMD_PPDUAL     = 8'hA2; // Dual Input Fast Program
    localparam [7:0] CMD_PPQUAD     = 8'h32; // Quad Input Fast Program    
    // FSM
    // Write
    localparam [3:0] WR_IDLE_S         = 4'h00;   // Get start_address and count of page, and set WE command
    localparam [3:0] WR_SENDCMD1_S     = 4'h01;   // Send WE command
    localparam [3:0] WR_PPCMD_S        = 4'h02;   // Set PP command
    localparam [3:0] WR_SENDCMD2_S     = 4'h03;   // Send PP command
    localparam [3:0] WR_DATA_S         = 4'h04;   // Send (?) data from FIFO 
    localparam [3:0] WR_STATCMD_S      = 4'h05;   // Set READSTAT command
    localparam [3:0] WR_SENDCMD3_S     = 4'h06;   // Send READSTAT command
    localparam [3:0] WR_PPDONE_S       = 4'h07;   // Get status
    localparam [3:0] WR_PPDONE_WAIT_S  = 4'h08;   // Check status and set WE command
    // Erase    
    localparam [2:0] ER_IDLE_S         = 3'h00;   // Get start_address and count of sector, and set WE command
    localparam [2:0] ER_SENDCMD1_S     = 3'h01;   // Send WE command
    localparam [2:0] ER_SSECMD_S       = 3'h02;   // Set SSE command
    localparam [2:0] ER_SENDCMD3_S     = 3'h03;   // Send SSE command
    localparam [2:0] ER_STATCMD_S      = 3'h04;   // Set READDSTAT command
    localparam [2:0] ER_SENDCMD4_S     = 3'h05;   // Send READSTAT command
    localparam [2:0] ER_RDSTAT_S       = 3'h06;   // Get status
    localparam [2:0] ER_SENDCMD5_S     = 3'h07;   // Check received status and set WE command
// }}} End local parameters -------------

// {{{ Wire declarations ----------------
    //----- write -----
    reg  [4:0]       wr_cmd_cntr            = 6'h27;
    reg  [31:0]      wr_cmd_reg             = 32'h00; // ?
    reg  [1:0]       wr_rd_data             = 2'h00;
    reg  [2:0]       wr_data_valid_cntr     = 3'h00;
    reg  [3:0]       wr_delay_cntr;
    reg  [2:0]       wr_data_cntr           = 3'h00; // SPI from FIFO Nibble count
    reg  [WIDTH-1:0] wr_current_addr        = 24'h00;
    reg              wr_SpiCsB              = 1'b1;                 // Chip Select (inversion: 1 - device is deselected, 0 - enables the device)
    reg  [31:0]      spi_wrdata             = 32'h00;
    reg  [15:0]      page_count             = 16'hFFFF;    
    reg  [1:0]       wr_status              = 2'h03;
    reg              status_data_valid      = 1'b0;
    reg              wr_strt_cmd_cnt;
    reg              wr_strt_valid_cnt;
    reg              wr_strt_delay_cnt;
    reg              wr_strt_data_cntr;
    wire             write_start;
    reg              write_done;   
    reg  [2:0]       wr_state, wr_next_state;    
    //----- erase -----
    reg  [4:0]       er_cmd_cntr;
    reg  [31:0]      er_cmd_reg;
    reg  [1:0]       er_rd_data;
    reg  [2:0]       er_data_valid_cntr;
    reg  [3:0]       er_delay_cntr;
    reg  [11:0]      er_sector_count;
    reg  [WIDTH-1:0] er_curr_sect_addr;
    wire [WIDTH-1:0] sCurrent_addr;
    wire [11:0]      sSector_count;
    wire [15:0]      sPage_count;
    reg              er_SpiCsB;
    reg  [1:0]       er_status;
    reg              er_strt_cmd_cnt;
    reg              er_strt_valid_cnt;
    reg              er_strt_delay_cnt;    
    reg              erase_inprogress;
    wire             erase_start;
    reg  [2:0]       er_state, er_next_state;
    //----- Startupe2 signals -----
    wire             sSpi_Miso;
    reg              Spi_Mosi;    
    wire             SPI_CsB_N;
    //reg              SPI_CsB_FFDin;   
    wire [3:0]       di_out;
    reg  [3:0]       dopin_ts               = 4'h0E;
    wire              spi_mosi_int;//           = 1'b0;    
    //----- FIFO signals -----
    reg              fifo_rden              = 1'b0;
    wire             fifo_empty;
    wire             fifo_full;  
    wire             fifo_almostfull;
    wire             fifo_almostempty;
    wire [31:0]      fifo_dout;
    wire [63:0]      fifo_unconned;   
    //----- Other -----        
    reg  [1:0]       synced_fifo_almostfull = 2'h00;        
    wire             sSpi_clk;
// }}} End of wire declarations ------------


// {{{ Wire initializations ------------ 
//	assign sSpi_Miso           = di_out[1]; // Synonym      
    assign sCurrent_addr = (START_ADDR_VALID_I)   ? START_ADDR_I   : 24'h00;
    assign sSector_count = (SECTOR_COUNT_VALID_I) ? SECTOR_COUNT_I : 12'hFFF;
    assign sPage_count   = (PAGE_COUNT_VALID_I)   ? PAGE_COUNT_I   : 16'h00;
    assign SPI_CsB_N     = (erase_inprogress)     ? er_SpiCsB      : wr_SpiCsB;
    assign sSpi_Miso     = SPI_MISO_I;
    assign spi_mosi_int  = (wr_state == WR_DATA_S) ? fifo_dout[0] : wr_cmd_reg[31];
    assign fifo_unconned = DATA_TO_FIFO_I;
    assign erase_start   = ERASE_I;
    assign write_start   = WRITE_I;
    assign FIFO_FULL_O   = fifo_full;
    assign FIFO_EMPTY_O  = fifo_empty;
    assign ERASEING_O    = erase_inprogress;
    assign WRITE_DONE_O  = write_done;
    assign SPI_CS_O      = SPI_CsB_N;
// }}} End of wire initializations ------------	

    always @(posedge LOG_CLK_I) begin
        if (erase_inprogress == 1'b1)
            Spi_Mosi <= er_cmd_reg[31];
        else
            Spi_Mosi <= spi_mosi_int;
    end

    // Erase phase counters
    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I || (!er_strt_cmd_cnt))
            er_cmd_cntr <= 6'h1F; // d31: 8 bit cmd and 24 bit address
        else
            er_cmd_cntr <= er_cmd_cntr - 1'b1;
    end

    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I || (!er_strt_delay_cnt))
            er_delay_cntr <= 4'h00;
        else 
            er_delay_cntr <= er_delay_cntr + 1'b1;
    end

    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I || (!er_strt_valid_cnt))
            er_data_valid_cntr <= 3'h00;
        else 
            er_data_valid_cntr <= er_data_valid_cntr + 1'b1;
    end 

    // Write phase counters
    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I || (!wr_strt_cmd_cnt))
            wr_cmd_cntr <= 6'h1F; // d31: 8 bit cmd and 24 bit address
        else
            wr_cmd_cntr <= wr_cmd_cntr - 1'b1;
    end

    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I || (!wr_strt_delay_cnt))
            wr_delay_cntr <= 4'h00;
        else
            wr_delay_cntr <= wr_delay_cntr + 1'b1;
    end

    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I || (!wr_strt_valid_cnt))
            wr_data_valid_cntr <= 3'h00;
        else
            wr_data_valid_cntr <= wr_data_valid_cntr + 1'b1;
    end 

    always @(posedge LOG_CLK_I) begin
        if (LOG_RST_I || (!wr_strt_data_cntr))
            wr_data_cntr <= 3'h00;
        else
            wr_data_cntr <= wr_data_cntr + 1'b1;
    end

// {{{ Erase Sectors FSM ------------ 
	always @(posedge LOG_CLK_I) begin
		if (LOG_RST_I)
			er_state <= ER_IDLE_S;
		else		
			er_state <= er_next_state;
	end

	always @(er_state, erase_start, er_cmd_cntr, er_delay_cntr, er_data_valid_cntr, 
             er_status, er_sector_count) begin
		er_next_state = ER_IDLE_S;
		case (er_state)
			ER_IDLE_S: begin                             // 0
                if (erase_start)
                    er_next_state = ER_SENDCMD1_S;
                else 
                    er_next_state = ER_IDLE_S;
			end

			ER_SENDCMD1_S: begin                           // 1
                if (er_cmd_cntr == 5'd24)
                    er_next_state = ER_SSECMD_S;
                else
                    er_next_state = ER_SENDCMD1_S;
			end

			ER_SSECMD_S: begin                          // 2 
                if (er_delay_cntr == 4'h04)
                    er_next_state = ER_SENDCMD3_S;
                else
                    er_next_state = ER_SSECMD_S;
			end

			ER_SENDCMD3_S: begin                          // 3
                if (er_cmd_cntr == 5'd00)
                    er_next_state = ER_STATCMD_S;
                else 
                    er_next_state = ER_SENDCMD3_S;
			end

			ER_STATCMD_S: begin                         // 4                
                if (er_delay_cntr == 4'h04)  
                    er_next_state = ER_SENDCMD4_S;                    
                else
                    er_next_state = ER_STATCMD_S;
			end

			ER_SENDCMD4_S: begin                          // 5
                if (er_cmd_cntr == 5'd24)
                    er_next_state = ER_RDSTAT_S;
                else
                    er_next_state = ER_SENDCMD4_S;
			end

			ER_RDSTAT_S: begin                          // 6
                //if (er_delay_cntr == 4'h01)
                if (er_data_valid_cntr == 3'd07) 
                    er_next_state = ER_SENDCMD5_S;
                else
                    er_next_state = ER_RDSTAT_S;
			end

            ER_SENDCMD5_S: begin                        // 7
                if (er_status == 2'h00) begin
                    if (er_sector_count == 14'h00)
                        er_next_state = ER_IDLE_S;
                    else                    
                        er_next_state = ER_SENDCMD1_S;
                end else
                    er_next_state = ER_STATCMD_S;

            end

			default: begin
			    er_next_state = ER_IDLE_S;  
			end
		endcase
	end

	always @(er_state, sCurrent_addr) begin		
		case (er_state)
			ER_IDLE_S: begin                                           // 0                
                er_curr_sect_addr         <= sCurrent_addr;
                er_sector_count           <= sSector_count; //sSector_count;                
                er_status                 <= 2'h03;
                er_strt_cmd_cnt           <= 1'b0;                
                er_strt_valid_cnt         <= 1'b0;
                er_strt_delay_cnt         <= 1'b0;
                erase_inprogress          <= 1'b0;
                er_SpiCsB                 <= 1'b1;
                er_data_valid_cntr        <= 3'h00;                
                er_rd_data                <= 2'b00;
                er_cmd_reg                <= {CMD_WE, 24'h00};
			end

			ER_SENDCMD1_S: begin                                       // 1
				er_strt_delay_cnt         <= 1'b0;
                erase_inprogress          <= 1'b1;                
                er_SpiCsB                 <= 1'b0;
                er_strt_cmd_cnt           <= 1'b1;
                if (er_cmd_cntr != 5'd24) 
                    er_cmd_reg            <= {er_cmd_reg[30:0], 1'b0};
			end
			
			ER_SSECMD_S: begin                                      // 2                             
                er_strt_cmd_cnt           <= 1'b0;                    
                er_strt_delay_cnt         <= 1'b1;                                
                er_SpiCsB                 <= 1'b1;                
                er_cmd_reg                <= {CMD_SSE, er_curr_sect_addr}; // erase 4 KB subsector                                                    
			end

			ER_SENDCMD3_S: begin                                     // 3
                er_strt_delay_cnt         <= 1'b0;                                
                er_SpiCsB                 <= 1'b0;
                er_strt_cmd_cnt           <= 1'b1;
                if (er_cmd_cntr != 5'd00)
                    er_cmd_reg            <= {er_cmd_reg[30:0], 1'b0};
			end 
 
			ER_STATCMD_S: begin                                      // 4
                er_SpiCsB                 <= 1'b1;
                er_strt_cmd_cnt           <= 1'b0;
                er_cmd_reg                <= {CMD_RDST, 24'h00};            
                er_strt_delay_cnt         <= 1'b1;                                
			end 
 
			ER_SENDCMD4_S: begin                                       // 5
               er_strt_delay_cnt          <= 1'b0;                                
               er_SpiCsB                  <= 1'b0;
               er_strt_cmd_cnt            <= 1'b1;
               if (er_cmd_cntr != 5'd24) 
                    er_cmd_reg            <= {er_cmd_reg[30:0], 1'b0};
			end 
 
			ER_RDSTAT_S: begin                                        // 6
                //er_SpiCsB             < = 1'b1;           
                er_strt_valid_cnt         <= 1'b1;
                er_strt_cmd_cnt           <= 1'b0;
                er_rd_data                <= {er_rd_data[1], sSpi_Miso};
            end
                			
            ER_SENDCMD5_S: begin                                    // 7
                er_strt_valid_cnt <= 1'b0;                                                
                //if (er_data_valid_cntr == 3'h07) begin // Check Status after 8 bits (+1) of status read                    
                er_status         <= er_rd_data;   // Check WE and ERASE in progress one cycle after er_rd_date
                if (er_status == 2'h00) begin
                    if (er_sector_count == 14'h00)
                       erase_inprogress <= 1'b0;
                    else begin
                        er_SpiCsB         <= 1'b1;                                
                        er_curr_sect_addr <= er_curr_sect_addr + SUBSECTOR_SIZE;
                        er_sector_count   <= er_sector_count - 1'b1;
                        er_cmd_reg        <= {CMD_WE, 24'h00};                        
                    end
                end
            end

			default: begin
                er_sector_count        <= 12'h00;
                er_curr_sect_addr      <= 24'h00;            
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

    always @(wr_state, fifo_almostfull, write_start, page_count, wr_cmd_cntr, wr_delay_cntr, wr_data_valid_cntr, wr_status) begin
        wr_next_state = WR_IDLE_S;
        case (wr_state) 
            WR_IDLE_S: begin                                    // 0
                if (fifo_almostfull && write_start)
                    wr_next_state = WR_SENDCMD1_S;
                else
                    wr_next_state = WR_IDLE_S;
            end

            WR_SENDCMD1_S: begin                                // 1
                if (page_count != 16'h00) begin
                    if (wr_cmd_cntr == 5'd24)
                        wr_next_state = WR_PPCMD_S;
                    else
                        wr_next_state = WR_SENDCMD1_S;
                end else
                    wr_next_state = WR_IDLE_S;
            end    

            WR_PPCMD_S: begin                                   // 2
                if (wr_delay_cntr == 4'h04)
                    wr_next_state = WR_SENDCMD2_S;
                else
                    wr_next_state = WR_PPCMD_S;
            end

            WR_SENDCMD2_S: begin                                // 3
                if (wr_cmd_cntr == 5'd00) 
                    wr_next_state = WR_DATA_S;
                else
                    wr_next_state = WR_SENDCMD2_S;
            end

            WR_DATA_S: begin                                    // 4
                if (wr_current_addr[7:0] == 24'd252)
                    wr_next_state = WR_STATCMD_S;
                else 
                    wr_next_state = WR_DATA_S;
            end

            WR_STATCMD_S: begin                                 // 5
                if (wr_delay_cntr == 4'h04)
                    wr_next_state = WR_PPDONE_S;
                else
                    wr_next_state = WR_STATCMD_S;               
            end        

            WR_SENDCMD3_S: begin                                // 6
                if (wr_cmd_cntr == 5'd24) 
                    wr_next_state = WR_PPDONE_S;
                else
                    wr_next_state = WR_SENDCMD3_S;
            end

            WR_PPDONE_S: begin                                  // 7
                if (wr_data_valid_cntr == 3'd07)
                    wr_next_state = WR_PPDONE_WAIT_S;
                else
                    wr_next_state = WR_PPDONE_S;
            end

            WR_PPDONE_WAIT_S: begin                             // 8
                if (wr_status == 2'h00) 
                    wr_next_state = WR_SENDCMD1_S;
                else
                    wr_next_state = WR_PPDONE_WAIT_S;
            end

            default: begin
                wr_next_state = WR_IDLE_S;
            end
        endcase
    end

    always @(wr_state, sPage_count, wr_cmd_cntr) begin
        case (wr_state)
            WR_IDLE_S: begin                                    // 0
               wr_current_addr    <= sCurrent_addr;
               page_count         <= sPage_count;
               write_done         <= 1'b0;
               wr_SpiCsB          <= 1'b1;
               wr_strt_cmd_cnt    <= 1'b0;
               wr_strt_valid_cnt  <= 1'b0;
               wr_strt_delay_cnt  <= 1'b0;
               wr_strt_data_cntr  <= 1'b0;
               wr_cmd_reg         <= {CMD_WE, 24'h00};
            end

            WR_SENDCMD1_S: begin                                // 1
                if (page_count != 16'h00) begin
                    wr_SpiCsB       <= 1'b0;
                    wr_strt_cmd_cnt <= 1'b1;
                    if (wr_cmd_cntr != 5'd24)
                        wr_cmd_reg  <= {wr_cmd_reg[30:0], 1'b0};
                end else
                    write_done      <= 1'b1;
            end

            WR_PPCMD_S: begin                                   // 2
                wr_SpiCsB         <= 1'b1;
                wr_strt_cmd_cnt   <= 1'b0;
                wr_strt_delay_cnt <= 1'b1;
                wr_cmd_reg        <= {CMD_PP, wr_current_addr};
            end

            WR_SENDCMD2_S: begin                                // 3
                wr_SpiCsB         <= 1'b0;                            
                wr_strt_delay_cnt <= 1'b0;   
                wr_strt_cmd_cnt   <= 1'b1;
                if (wr_cmd_cntr   != 5'd24)
                    wr_cmd_reg    <= {wr_cmd_reg[30:0], 1'b0};
            end

            WR_DATA_S: begin                                    // 4
                wr_strt_cmd_cnt     <= 1'b0;
                fifo_rden           <= 1'b1;
                wr_strt_data_cntr   <= 1'b1;
                if (wr_data_cntr    == 3'h07) begin
                    wr_current_addr <= wr_current_addr + 1'b1; // 1 byte out of 256 bytes per page
                end
            end

            WR_STATCMD_S: begin                                 // 5
                fifo_rden         <= 1'b0;
                wr_SpiCsB         <= 1'b1;
                wr_strt_data_cntr <= 1'b0;
                wr_strt_cmd_cnt   <= 1'b0;
                wr_strt_delay_cnt <= 1'b1;
                wr_cmd_reg        <= {CMD_RDST, 24'h00};
            end
           

            WR_SENDCMD3_S: begin                                // 6
                wr_SpiCsB         <= 1'b0;
                wr_strt_delay_cnt <= 1'b0;
                wr_strt_cmd_cnt   <= 1'b1;
                if (wr_cmd_reg    != 5'd24)
                    wr_cmd_reg    <= {wr_cmd_reg[30:0], 1'b0};
            end

            WR_PPDONE_S: begin                                  // 7
                wr_strt_valid_cnt <= 1'b1;
                wr_strt_cmd_cnt   <= 1'b0;
                wr_rd_data        <= {wr_rd_data[1], sSpi_Miso};
            end

            WR_PPDONE_WAIT_S: begin                             // 8
                wr_strt_valid_cnt <= 1'b0;
                //if (wr_data_valid_cntr == 3'h07)
                status_data_valid <= 1'b1;
              //  else
                //    status_data_valid <= 1'b0;
                //if (status_data_valid == 1'b1)
                wr_status      <= wr_rd_data;
                if (wr_status  == 2'h00) begin
                    wr_SpiCsB  <= 1'b1;
                    wr_cmd_reg <= {CMD_WE, 24'h00};
                    page_count <= page_count - 1'b1;
                    wr_status  <= 2'h03;
                end
            end

            default: begin
                wr_SpiCsB  <= 1'b1;
                page_count <= 16'h00;
            end
        endcase
    end
// }}} End of write data FSM---------------

// {{{ Include other modules ------------
    /*negedge_flop negedge_CS (
        .CLK      ( LOG_CLK_I     ),
        .D        ( SPI_CsB_FFDin ),
        .Q        ( SPI_CsB_N     )
    );*/

    /*oneshot oneshot (
        .trigger  ( ERASE_I       ),
        .clk      ( LOG_CLK_I     ),
        .pulse    ( erase_start   )
    );*/

    spi_serdes SerDes (
        .CLK_I           ( LOG_CLK_I ),          
        .RST_I           ( LOG_RST_I ),          
                        
        .START_TRANS_I   ( 1'b1 ),  
        .DONE_TRANS_O    ( ),   
                        
        .DATA_TO_SPI_I   ( {fifo_dout[7:1], Spi_Mosi} ),  
        .DATA_FROM_SPI_O ( ),
                        
        .SPI_CLK_O       ( sSpi_clk ),      
        .SPI_MOSI_O      ( SPI_MOSI_O ),     
        .SPI_MISO_I      ( SPI_MISO_I )        
    );

    STARTUPE2 #(
        .PROG_USR           ( "FALSE" ),  // Activate program event security feature. Requires encrypted bitstreams.
        .SIM_CCLK_FREQ      ( 0.0     )   // Set the Configuration Clock Frequency (ns) for simulation
    )
    STARTUPE2_inst (
        .CFGCLK             ( ),           // 1-bit output: Configuration main clock output
        .CFGMCLK            ( ),    	   // 1-bit output: Configuration internal oscillator clock output        
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
    
    fifo_generator_0 fifo_spi (
        .clk                ( LOG_CLK_I        ),
        .srst               ( LOG_RST_I        ),
        .din                ( fifo_unconned    ),
        .wr_en              ( FIFO_WREN_I      ),
        .rd_en              ( fifo_rden        ),
        .dout               ( fifo_dout        ),
        .full               ( fifo_full        ),
        .almost_full        ( fifo_almostfull  ),
        .empty              ( fifo_empty       ),
        .almost_empty       ( fifo_almostempty )
    );     
// }}} End of Include other modules ------------

endmodule