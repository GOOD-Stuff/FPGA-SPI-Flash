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
    output        FIFO_WRERR_O,
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
    localparam [2:0] WR_IDLE_S         = 3'h00;
    localparam [2:0] WR_ASSCS1_S       = 3'h01;
    localparam [2:0] WR_WRCMD_S        = 3'h02;
    localparam [2:0] WR_ASSCS2_S       = 3'h03;
    localparam [2:0] WR_PROGRAM_S      = 3'h04;
    localparam [2:0] WR_DATA_S         = 3'h05;
    localparam [2:0] WR_PPDONE_S       = 3'h06;
    localparam [2:0] WR_PPDONE_WAIT_S  = 3'h07;
    // Erase    
    localparam [3:0] ER_IDLE_S         = 4'h00;
    localparam [3:0] ER_ASSCS1_S       = 4'h01;    
    localparam [3:0] ER_SSECMD_S       = 4'h02;
    localparam [3:0] ER_ASSCS2_S       = 4'h03;        
    localparam [3:0] ER_ASSCS3_S       = 4'h04;
    localparam [3:0] ER_STATCMD_S      = 4'h05;    
    localparam [3:0] ER_ASSCS4_S       = 4'h06;
    localparam [3:0] ER_RDSTAT_S       = 4'h07;        
// }}} End local parameters -------------

// {{{ Wire declarations ----------------
    //----- write -----
    reg  [5:0]       wr_cmd_counter         = 6'h27;
    reg  [31:0]      wr_cmd_reg             = 32'h11111111; // ?
    reg  [1:0]       wr_rd_data             = 2'h00;
    reg  [2:0]       wr_data_valid_count    = 3'h00;
    reg  [2:0]       wr_data_count          = 3'h00; // SPI from FIFO Nibble count
    reg  [WIDTH-1:0] wr_current_addr        = 24'h00;
    reg  [31:0]      spi_wrdata             = 32'h00;
    reg  [16:0]      page_count             = 17'h1FFFF;    
    reg  [1:0]       spi_status             = 2'h03;
    reg              status_data_valid      = 1'b0;
    reg              write_done;
    wire             wrerr;
    wire             rderr;    
    reg  [2:0]       wr_state, wr_next_state;    
    //----- erase -----
    reg  [5:0]       er_cmd_cntr         = 6'h3F;
    reg  [31:0]      er_cmd_reg             = 32'h3FF;
    reg  [1:0]       er_rd_data;
    reg  [2:0]       er_data_valid_cntr;
    reg  [13:0]      er_sector_count;
    reg  [WIDTH-1:0] er_current_sector_addr;
    reg              er_SpiCsB;
    reg  [1:0]       er_status              = 2'h03;
    reg              erase_inprogress;
    wire             erase_start;
    reg  [3:0]       er_state, er_next_state;
    //----- Startupe2 signals -----
    wire             sSpi_Miso;
    reg              Spi_Mosi;
    reg              wr_SpiCsB;                 // Chip Select (inversion: 1 - device is deselected, 0 - enables the device)
    reg              SPI_CsB_N;
    //reg              SPI_CsB_FFDin;   
    wire [3:0]       di_out;
    reg  [3:0]       dopin_ts               = 4'h0E;
    reg              spi_mosi_int;    
    //----- FIFO signals -----
    reg              fifo_rden              = 1'b0;
    wire             fifo_empty;
    wire             fifo_full;  
    wire             fifo_almostfull;
    wire             fifo_almostempty;
    wire [63:0]      fifo_dout;
    wire [63:0]      fifo_unconned;   
    //----- Other -----    
    reg              er_strt_cmd_cnt;
    reg              er_strt_valid_cnt;
    reg              er_strt_delay_cnt;
    reg  [1:0]       synced_fifo_almostfull = 2'h00;    
    reg  [3:0]       er_delay_cntr;
    wire             sSpi_clk;
// }}} End of wire declarations ------------


// {{{ Wire initializations ------------ 
//	assign sSpi_Miso           = di_out[1]; // Synonym    
    assign sSpi_Miso           = SPI_MISO_I;
    assign fifo_unconned       = DATA_TO_FIFO_I;
    assign erase_start         = ERASE_I;
    assign FIFO_FULL_O         = fifo_full;
    assign FIFO_EMPTY_O        = fifo_empty;
    assign ERASEING_O          = erase_inprogress;
    assign WRITE_DONE_O        = write_done;
    assign SPI_CS_O            = SPI_CsB_N;
// }}} End of wire initializations ------------	

always @(posedge LOG_CLK_I) begin
    if (erase_inprogress == 1'b1)
        Spi_Mosi <= er_cmd_reg[31];
    else
        Spi_Mosi <= spi_mosi_int;
end

/*always @(posedge LOG_CLK_I) begin
    if (LOG_RST_I)
        SPI_CsB_FFDin <= 1'b1;
    else if (erase_inprogress == 1'b1)
        SPI_CsB_FFDin <= er_SpiCsB;
    else
        SPI_CsB_FFDin <= wr_SpiCsB;
end*/

always @(negedge LOG_CLK_I) begin
    if (LOG_RST_I)
        SPI_CsB_N <= 1'b1;
    else if (erase_inprogress == 1'b1)
        SPI_CsB_N <= er_SpiCsB;
    else
        SPI_CsB_N <= wr_SpiCsB;
end

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
    if (LOG_RST_I)
        er_data_valid_cntr <= 3'h00;
    else if (er_strt_valid_cnt)
        er_data_valid_cntr <= er_data_valid_cntr + 1'b1;
end 

// {{{ Erase Sectors FSM ------------ 
	always @(posedge LOG_CLK_I) begin
		if (LOG_RST_I)
			er_state <= ER_IDLE_S;
		else		
			er_state <= er_next_state;
	end

	always @(er_state, erase_start, er_cmd_cntr, er_data_valid_cntr, er_status, er_sector_count) begin
		er_next_state = ER_IDLE_S;
		case (er_state)
			ER_IDLE_S: begin                             // 0
                if (erase_start)
                    er_next_state = ER_ASSCS1_S;
                else 
                    er_next_state = ER_IDLE_S;
			end

			ER_ASSCS1_S: begin                           // 1
                if (er_cmd_cntr == 6'd23)
                    er_next_state = ER_SSECMD_S;
                else
                    er_next_state = ER_ASSCS1_S;
			end

            ER_ASSCS2_S: begin                          // 3
                er_next_state = ER_SSECMD_S;
            end

			ER_SSECMD_S: begin                          // 2 ! THIS DOESN'T WORK. WHY?
                if (er_delay_cntr == 4'h05)
                    er_next_state = ER_ASSCS3_S;
                else
                    er_next_state = ER_SSECMD_S;
			end

			ER_ASSCS3_S: begin                          // 4
                if (er_cmd_cntr == 6'd00)
                    er_next_state = ER_STATCMD_S;
                else
                    er_next_state = ER_ASSCS3_S;
			end

			ER_STATCMD_S: begin                         // 5                
                if (er_delay_cntr == 4'h05)  
                    er_next_state = ER_ASSCS4_S;                    
                else
                    er_next_state = ER_STATCMD_S;
			end

			ER_ASSCS4_S: begin                          // 6
                if (er_cmd_cntr == 6'd23)
                    er_next_state = ER_RDSTAT_S;
                else
                    er_next_state = ER_ASSCS4_S;
			end

			ER_RDSTAT_S: begin                          // 7
				if ((er_data_valid_cntr == 3'd7) && (er_status == 2'h00)) begin
                    if (er_sector_count == 14'h00)
                        er_next_state = ER_IDLE_S;
                    else                
                        er_next_state = ER_ASSCS2_S;
                end
                else
                    er_next_state = ER_RDSTAT_S;
			end

			default: begin
			    er_next_state = ER_IDLE_S;  
			end
		endcase
	end

	always @(er_state) begin		
		case (er_state)
			ER_IDLE_S: begin                                         // 0
				if (SECTOR_COUNT_VALID_I) 
                    er_sector_count        <= SECTOR_COUNT_I;
                else       
                    er_sector_count = 14'h3FFF;
                if (START_ADDR_VALID_I)  
                    er_current_sector_addr <= START_ADDR_I;
                else 
                    er_current_sector_addr <= 24'h00;
                er_strt_cmd_cnt            <= 1'b0;                
                er_strt_valid_cnt          <= 1'b0;
                er_strt_delay_cnt          <= 1'b0;
                erase_inprogress           <= 1'b0;
                er_SpiCsB                  <= 1'b1;
                er_data_valid_cntr         <= 3'h00;                
                er_rd_data                 <= 2'b00;
                er_cmd_reg                 <= {CMD_WE, 24'h00};
			end

			ER_ASSCS1_S: begin                                       // 1
				erase_inprogress           <= 1'b1;                
                er_SpiCsB                  <= 1'b0;
                er_strt_cmd_cnt            <= 1'b1;
                if (er_cmd_cntr != 6'd23) 
                    er_cmd_reg             <= {er_cmd_reg[30:0], 1'b0};
			end
			
			ER_ASSCS2_S: begin                                       // 4
                er_strt_delay_cnt          <= 1'b0;                                
                er_SpiCsB                  <= 1'b0;
                er_strt_cmd_cnt            <= 1'b1;
			end

			ER_SSECMD_S: begin                                       // 3                            
                er_strt_cmd_cnt        <= 1'b0;                    
                er_strt_delay_cnt      <= 1'b1;                                
                er_SpiCsB              <= 1'b1;                
                er_cmd_reg             <= {CMD_SSE, er_current_sector_addr}; // erase 4 KB subsector                                                    
			end

			ER_ASSCS3_S: begin
                er_strt_delay_cnt          <= 1'b0;                                
                er_SpiCsB                  <= 1'b0;
                er_strt_cmd_cnt            <= 1'b1;
                if (er_cmd_cntr != 6'd00)
                    er_cmd_reg             <= {er_cmd_reg[30:0], 1'b0};
			end

			ER_STATCMD_S: begin                                      // 5 
                er_SpiCsB              <= 1'b1;
                er_strt_cmd_cnt        <= 1'b0;
                er_cmd_reg             <= {CMD_RDST, 24'h00};            
                er_strt_delay_cnt      <= 1'b1;                                
			end

			ER_ASSCS4_S: begin                                       // 6
               er_strt_delay_cnt           <= 1'b0;                                
               er_SpiCsB                   <= 1'b0;
               er_strt_cmd_cnt             <= 1'b1;
               if (er_cmd_cntr != 6'd23) 
                    er_cmd_reg             <= {er_cmd_reg[30:0], 1'b0};
			end

			ER_RDSTAT_S: begin                                       // 7
                er_SpiCsB             <= 1'b1;
                er_strt_cmd_cnt       <= 1'b0;
                er_strt_valid_cnt     <= 1'b1;
                er_rd_data            <= {er_rd_data[1], sSpi_Miso};
                if (er_data_valid_cntr == 3'h07) begin // Check Status after 8 bits (+1) of status read
                    er_status         <= er_rd_data;   // Check WE and ERASE in progress one cycle after er_rd_date
                    er_strt_valid_cnt <= 1'b0;
                    if (er_status == 2'h00) begin
                        if (er_sector_count == 14'h00)
                            erase_inprogress <= 1'b0;
                        else begin
                            er_SpiCsB              <= 1'b1;                                
                            er_current_sector_addr <= er_current_sector_addr + SUBSECTOR_SIZE;
                            er_sector_count        <= er_sector_count - 1'b1;
                            er_cmd_reg             <= {CMD_WE, 24'h00};
                        end
                    end
                end
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

    always @(wr_state, synced_fifo_almostfull, wr_cmd_counter, page_count, wr_data_count, 
             wr_current_addr, spi_status) begin
        wr_next_state = WR_IDLE_S;
        case (wr_state)
            WR_IDLE_S: begin
                if (synced_fifo_almostfull[1] == 1'b1)   
                    wr_next_state = WR_ASSCS1_S;
                else
                    wr_next_state = WR_IDLE_S;
            end

            WR_ASSCS1_S: begin
                if (page_count != 0)
                    if (synced_fifo_almostfull[1] == 1'b1)
                        wr_next_state = WR_WRCMD_S;
                    else
                        wr_next_state = WR_ASSCS1_S;
                else
                    wr_next_state = WR_WRCMD_S;
            end

            WR_WRCMD_S: begin
                if (wr_cmd_counter != 6'd32) 
                    wr_next_state = WR_WRCMD_S;
                else if (page_count != 17'h00)
                    wr_next_state = WR_ASSCS2_S;
                else
                    wr_next_state = WR_IDLE_S;
            end

            WR_ASSCS2_S: begin
                wr_next_state = WR_PROGRAM_S;
            end

            WR_PROGRAM_S: begin
                if (wr_cmd_counter != 0)
                    wr_next_state = WR_PROGRAM_S;
                else
                    wr_next_state = WR_DATA_S;
            end

            WR_DATA_S: begin
                if ((wr_data_count == 7) && (wr_current_addr[7:0] == 32'd252))
                    wr_next_state = WR_PPDONE_S;
                else
                    wr_next_state = WR_DATA_S;
            end

            WR_PPDONE_S: begin
                wr_next_state = WR_PPDONE_WAIT_S;
            end

            WR_PPDONE_WAIT_S: begin
                if ((wr_cmd_counter == 6'd31) && (spi_status == 2'b0))
                    wr_next_state = WR_ASSCS1_S;
                else 
                    wr_next_state = WR_PPDONE_WAIT_S;
            end

            default: begin
                wr_next_state = WR_IDLE_S;
            end
        endcase
    end

    always @(wr_state) begin
        case (wr_state)
            WR_IDLE_S: begin
                spi_mosi_int   <= wr_cmd_reg[31];
                wr_SpiCsB      <= 1'b1;
                write_done     <= 1'b0;
                if (START_ADDR_VALID_I == 1'b1) wr_current_addr <= START_ADDR_I;
                if (PAGE_COUNT_VALID_I == 1'b1) page_count      <= PAGE_COUNT_I;
                if (synced_fifo_almostfull[1] == 1'b1) begin
                    dopin_ts            <= 4'h0E;
                    wr_data_valid_count <= 3'h00;
                    wr_cmd_counter      <= 6'h27;
                    wr_rd_data          <= 2'h00;
                    wr_cmd_reg          <= {CMD_WE, 24'h00};
                    fifo_rden           <= 1'b0;
                    wr_data_count       <= 3'h00; 
                    spi_wrdata          <= 32'h00;                    
                end
            end

            WR_ASSCS1_S: begin
                spi_mosi_int <= wr_cmd_reg[31];
                if (page_count != 0) begin
                    if (synced_fifo_almostfull[1] == 1'b1)
                        wr_SpiCsB <= 1'b0;
                end else
                    wr_SpiCsB  <= 1'b0;
            end

            WR_WRCMD_S: begin
                spi_mosi_int <= wr_cmd_reg[31];
                if (wr_cmd_counter != 6'd32) begin
                    wr_cmd_counter <= wr_cmd_counter - 1'b1;
                    wr_cmd_reg     <= {wr_cmd_reg[30:0], 1'b0};
                end else if (page_count != 0) begin
                    wr_SpiCsB        <= 1'b1;
                    wr_cmd_counter <= 6'h27;
                    wr_cmd_reg     <= {CMD_PP, wr_current_addr}; // Program Page at current_addr                    
                end else begin
                    wr_SpiCsB        <= 1'b1;
                    wr_cmd_counter <= 6'h27;
                    write_done     <= 1'b1;
                end
            end

            WR_ASSCS2_S: begin
                spi_mosi_int <= wr_cmd_reg[31];
                wr_SpiCsB      <= 1'b0;            
            end

            WR_PROGRAM_S: begin
                spi_mosi_int <= wr_cmd_reg[31];
                if (wr_cmd_counter != 0) begin
                    wr_cmd_counter <= wr_cmd_counter - 1'b1;
                    wr_cmd_reg     <= {wr_cmd_reg[30:0], 1'b0};
                end else begin
                    fifo_rden <= 1'b1;
                    dopin_ts  <= 4'h00;
                end
            end

            WR_DATA_S: begin
                spi_mosi_int  <= fifo_dout[0];
                wr_SpiCsB       <= 1'b0;
                wr_data_count <= wr_data_count + 1'b1;
                if (wr_data_count == 3'd7) begin// 8x4 bits from FIFO. wr_data_count rolls over to 0
                    wr_current_addr <= wr_current_addr + 3'd4; // 4 bytes out of 256 bytes per page
                    if (wr_current_addr[7:0] == 8'd252) begin // every 256 bytes (1 PP) written, only check lower bits = mod 256
                        wr_SpiCsB        <= 1'b1; 
                        fifo_rden      <= 1'b0;
                        dopin_ts       <= 4'h0E;
                        wr_cmd_counter <= 6'h27;                        
                        wr_cmd_reg     <= {CMD_RDST, 24'h00};
                    end
                end
            end

            WR_PPDONE_S: begin
                spi_mosi_int        <= wr_cmd_reg[31];
                dopin_ts            <= 4'h0E;
                wr_SpiCsB             <= 1'b0;
                wr_data_valid_count <= 3'h00;
                wr_cmd_counter      <= 6'h27;
            end

            WR_PPDONE_WAIT_S: begin
                spi_mosi_int <= wr_cmd_reg[31];
                fifo_rden    <= 1'b0;                
                if (wr_cmd_counter != 6'd31) begin
                    wr_cmd_counter <= wr_cmd_counter - 1'b1;
                    wr_cmd_reg     <= {wr_cmd_reg[30:0], 1'b0};
                end else begin
                    wr_data_valid_count     <= wr_data_valid_count + 1'b1;
                    wr_rd_data              <= {wr_rd_data[1], sSpi_Miso}; 
                    if (wr_data_valid_count == 3'd7) // catch status byte
                        status_data_valid   <= 1'b1; // copy WE and Write_in_progress one cycle after rddate
                    else 
                        status_data_valid   <= 1'b0;
                    if (status_data_valid   == 1'b1)  spi_status <= wr_rd_data;
                    if (spi_status          == 2'h00) begin      // Done with page program
                        wr_SpiCsB             <= 1'b1;
                        wr_cmd_counter      <= 6'h27;
                        wr_cmd_reg          <= {CMD_WE, 24'h00};
                        wr_data_valid_count <= 3'h00;
                        status_data_valid   <= 1'b0;
                        spi_status          <= 2'h03;
                        page_count          <= page_count - 1'b1;
                    end                    
                end
            end

            default: begin
                spi_mosi_int      <= wr_cmd_reg[39];
                wr_SpiCsB           <= 1'b1;
                status_data_valid <= 1'b0;
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
        .full               ( FIFO_FULL_O      ),
        .almost_full        ( fifo_almostfull  ),
        .empty              ( FIFO_EMPTY_O     ),
        .almost_empty       ( fifo_almostempty )
    );     
// }}} End of Include other modules ------------

endmodule