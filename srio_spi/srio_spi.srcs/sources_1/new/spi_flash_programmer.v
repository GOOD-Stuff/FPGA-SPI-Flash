`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: VlSU
// Engineer: Gustov Vladimir
// 
// Create Date: 12.12.2017 10:56:54
// Design Name: 
// Module Name: spi_loader_top
// Project Name: srio_spi
// Target Devices: Kintex-7 UltraScale
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
    input         log_clk, 
    input         log_rst,
    //
    input [31:0]  data_to_fifo,
    input [31:0]  start_addr,
    input         start_addr_valid,
    input [16:0]  page_count,
    input         page_count_valid,
    input [13:0]  sector_count,
    input         sector_count_valid,
    //
    input         fifo_wren,
    output        fifo_full,
    output        fifo_empty,
    output        fifo_wrerr,
    output        write_done,
    //    
    input         erase,
    output        eraseing,
    //
    output        SPI_CS
);

/*
    SPI Flash Memory - Micron N25Q128A:
        All size        - 16777216 bytes (16 MB);
        65536 Pages     - by 256 bytes;
        256 Sectors     - by 65536 bytes; 
        4096 Subsectors - by 4096 bytes; 
*/

// {{{ local parameters (constants) --------    
    // SPI sector size (in bits)
    localparam SectorSize    = 32'd65536;  // 64 Kbits
    localparam SubSectorSize = 32'd4096;   // 4 Kbits
    localparam PageSize      = 32'd256;    // 256 
    localparam SectorCount   = 32'd256;
    localparam PageCount     = 32'd65536;
    localparam StartAddr     = 32'h00000000; // First address in SPI
    localparam EndAddr       = 32'h00FFFFFF; // Last address in SPI (128 Mb)
    // SPI ID Code
    localparam IDcode25NQ128 = 23'h20BB18;   // RDID N25Q128A    
    // SPI commands
    localparam [7:0] CmdREAD      = 8'h03; // Read
    localparam [7:0] CmdFastREAD  = 8'h0B; // Fast Read
    localparam [7:0] CmdRDID      = 8'h9F; // Read ID
    localparam [7:0] CmdFlagStat  = 8'h70; // Read Flag Status Register
    localparam [7:0] CmdClearStat = 8'h50; // Clear Flag Status Register
    localparam [7:0] CmdReadStat  = 8'h05; // Read Status Register
    localparam [7:0] CmdWE        = 8'h06; // Write Enable
    localparam [7:0] CmdWD        = 8'h04; // Write Disable
    localparam [7:0] CmdSE        = 8'hD8; // Sector Erase
    localparam [7:0] CmdSSE       = 8'h20; // SubSector Erase
    localparam [7:0] CmdBE        = 8'hC7; // Bulk Erase
    localparam [7:0] CmdPP        = 8'h02; // Page Program
    localparam [7:0] CmdPPDual    = 8'hA2; // Dual Input Fast Program
    localparam [7:0] CmdPPQuad    = 8'h32; // Quad Input Fast Program    
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
    localparam [3:0] ER_WECMD_S        = 4'h02;
    localparam [3:0] ER_SSECMD_S       = 4'h03;
    localparam [3:0] ER_ASSCS2_S       = 4'h04;        
    localparam [3:0] ER_STATCMD_S      = 4'h05;
    localparam [3:0] ER_ASSCS3_S       = 4'h06;
    localparam [3:0] ER_ASSCS4_S       = 4'h07;
    localparam [3:0] ER_RDSTAT_S       = 4'h08;                 
// }}} End local parameters -------------

// {{{ Wire declarations ----------------
    //----- write -----
    reg  [5:0]  wr_cmd_counter         = 6'h27;
    reg  [39:0] wr_cmd_reg             = 40'h1111111111; // ?
    reg  [1:0]  wr_rd_data             = 2'h00;
    reg  [2:0]  wr_data_valid_count    = 3'h00;
    reg  [2:0]  wrdata_count           = 3'h00; // SPI from FIFO Nibble count
    reg  [31:0] spi_wrdata             = 32'h00;
    reg  [16:0] page_count_int         = 17'h1FFFF;
    reg  [31:0] wr_current_addr        = 32'h00;
    reg  [1:0]  spi_status             = 2'h03;
    reg         status_data_valid      = 1'b0;
    reg         write_done_int         = 1'b0;
    wire        wrerr;
    wire        rderr;    
    reg  [2:0]  wr_state, wr_next_state;    
    //----- erase -----
    reg  [5:0]  er_cmd_counter         = 6'h3F;
    reg  [39:0] er_cmd_reg             = 40'h3FF;
    reg  [1:0]  er_rd_data             = 2'h00;
    reg  [2:0]  er_data_valid_count    = 3'h00;
    reg  [13:0] er_sector_count        = 14'h3FFF;
    reg  [31:0] er_current_sector_addr = 32'h00;
    reg         er_SpiCsB;
    reg  [1:0]  er_status              = 2'h03;
    reg         erase_inprogress       = 1'b0;
    wire        erase_start;
    reg  [3:0]  er_state, er_next_state;
    //----- Startupe3 signals -----
    wire        sSpiMiso;
    reg         sSpiMosi;
    reg         SPI_CsB                = 1'b1; // Chip Select (inversion: 1 - device is deselected, 0 - enables the device)
    reg         SPI_CsB_N;
    reg         SPI_CsB_FFDin          = 1'b1;    
    wire [3:0]  di_out;
    reg  [3:0]  dopin_ts               = 4'h0E;
    reg         SPI_MOSI_int;
    //----- FIFO signals -----
    reg         fifo_rden              = 1'b0;
    wire        fifo_empty_int;
    wire        fifo_full_int;  
    wire        fifo_almostfull;
    wire        fifo_almostempty;
    wire [63:0] fifo_dout;
    wire [63:0] fifo_unconned;   
    //----- Other -----    
    reg  [1:0]  synced_fifo_almostfull = 2'h00;
    reg  [1:0]  synced_erase           = 2'h00;
    wire        sSpi_clk;
// }}} End of wire declarations ------------


// {{{ Wire initializations ------------ 
	assign sSpiMiso            = di_out[1]; // Synonym    
    assign fifo_unconned[31:0] = data_to_fifo;
    assign fifo_full           = fifo_full_int;
    assign fifo_empty          = fifo_empty_int;
    assign eraseing            = erase_inprogress;
    assign write_done          = write_done_int;
    assign SPI_CS              = (erase_start == 1'b1) ? er_SpiCsB : SPI_CsB;
// }}} End of wire initializations ------------	

always @(log_clk) begin
    if (erase_inprogress == 1'b1)
        sSpiMosi <= er_cmd_reg[39];
    else
        sSpiMosi <= SPI_MOSI_int;
end

always @(log_clk) begin
    if (erase_inprogress == 1'b1)
        SPI_CsB_FFDin <= er_SpiCsB;
    else
        SPI_CsB_FFDin <= SPI_CsB;
end

always @(posedge log_clk) begin
    synced_fifo_almostfull <= {synced_fifo_almostfull[0], fifo_almostfull};
    synced_erase           <= {synced_erase[0], erase};
end

// {{{ Erase Sectors ------------ 
	always @(posedge log_clk or posedge log_rst) begin
		if (log_rst)
			er_state <= ER_IDLE_S;
		else		
			er_state <= er_next_state;
	end

	always @(er_state, erase_start, er_cmd_counter, er_data_valid_count, er_status, er_sector_count) begin
		er_next_state = ER_IDLE_S;
		case (er_state)
			ER_IDLE_S: begin
				if (erase_start == 1'b1)
					er_next_state = ER_ASSCS1_S;
				else
					er_next_state = ER_IDLE_S;
			end

			ER_ASSCS1_S: begin
				er_next_state = ER_WECMD_S;
			end

			ER_WECMD_S: begin
				if (er_cmd_counter != 6'd32)					
					er_next_state = ER_WECMD_S;							
				else 
					er_next_state = ER_ASSCS2_S;						
			end
			
			ER_ASSCS2_S: begin
				er_next_state = ER_SSECMD_S;
			end

			ER_SSECMD_S: begin
				if (er_cmd_counter != 6'd32)
					er_next_state = ER_SSECMD_S;
				else
					er_next_state = ER_ASSCS3_S;
			end

			ER_ASSCS3_S: begin
				er_next_state = ER_STATCMD_S;
			end

			ER_STATCMD_S: begin
				if (er_cmd_counter != 6'd00)
					er_next_state = ER_STATCMD_S;
				else
					er_next_state = ER_ASSCS4_S;
			end

			ER_ASSCS4_S: begin
				er_next_state = ER_RDSTAT_S;
			end

			ER_RDSTAT_S: begin
				if (er_cmd_counter >= 6'd31)
					er_next_state = ER_RDSTAT_S;					
				else if ((er_data_valid_count == 3'h07)	&& (er_status == 2'h00)) begin
					if (er_sector_count == 14'h00)
						er_next_state = ER_IDLE_S; // Done. All sectors erased
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
			ER_IDLE_S: begin
				if (sector_count_valid == 1'b1) er_sector_count <= sector_count;
				if (start_addr_valid == 1'b1) er_current_sector_addr <= start_addr;
				if (erase_start == 1'b1) begin
					er_data_valid_count <= 3'h00;
					er_cmd_counter 		<= 6'h27;
					er_rd_data 			<= 2'h00;
					erase_inprogress	<= 1'b1;
				end
			end

			ER_ASSCS1_S: begin
				er_SpiCsB <= 1'b0;
			end

			ER_WECMD_S: begin
				if (er_cmd_counter != 6'd32) begin
					er_cmd_counter <= er_cmd_counter - 1'b1;
					er_cmd_reg 	   <= {er_cmd_reg[38:0], 1'b0};
				end else begin
					er_SpiCsB	   <= 1'b1;            // turn off SPI
					er_cmd_counter <= 6'h27;
					er_cmd_reg	   <= {CmdWE, 32'h00}; // Concat
				end
			end
			
			ER_ASSCS2_S: begin
                er_SpiCsB <= 1'b0;
                er_status <= 2'h03;
			end

			ER_SSECMD_S: begin
                if (er_cmd_counter != 6'd32) begin
                    er_cmd_counter <= er_cmd_counter - 1'b1;
                    er_cmd_reg     <= {er_cmd_reg[38:0], 1'b0};                    
                end else begin
                    er_SpiCsB      <= 1'b1;                    
                    er_cmd_counter <= 6'h27;
                    er_cmd_reg     <= {CmdSSE, er_current_sector_addr}; // send erase + 32 bit address
                end
			end

			ER_ASSCS3_S: begin
                er_SpiCsB <= 1'b0;
			end

			ER_STATCMD_S: begin
                if (er_cmd_counter != 6'd32) begin
                    er_cmd_counter <= er_cmd_counter - 1'b1;
                    er_cmd_reg     <= {er_cmd_reg[38:0], 1'b0};
                end else begin
                    er_SpiCsB      <= 1'b1;
                    er_cmd_counter <= 6'h27;
                    er_cmd_reg     <= {CmdReadStat, 32'h00}; //  Read Status register
                end
			end

			ER_ASSCS4_S: begin
                er_SpiCsB <= 1'b0;                
			end

			ER_RDSTAT_S: begin
                if (er_cmd_counter >= 6'd31) begin
                    er_cmd_counter <= er_cmd_counter - 1'b1;
                    er_cmd_reg     <= {er_cmd_reg[38:0], 1'b0};
                end else begin
                    er_data_valid_count <= er_data_valid_count + 1'b1;
                    er_rd_data <= {er_rd_data[1] & sSpiMiso};
                    if (er_data_valid_count == 3'd7) begin // Check Status after 8 bits (+1) of status read
                        er_status <= er_rd_data; // Check WE and erase_in_progress one cycle after er_rd_data
                        if (er_status == 2'h00) begin
                            if (er_sector_count == 14'h00) begin
                                erase_inprogress <= 1'b0;
                            end else begin
                                er_current_sector_addr <= er_current_sector_addr + SubSectorSize;
                                er_sector_count        <= er_sector_count - 1'b1;
                                er_cmd_counter         <= 6'h27;
                                er_cmd_reg             <= {CmdWE, 32'h00};
                                er_SpiCsB              <= 1'b1;
                            end
                        end
                    end
                end
			end

			default: begin
                er_SpiCsB      <= 1'b1;
                er_cmd_counter <= 6'h3F;
                er_cmd_reg     <= 40'h00;
			end
		endcase
	end
// }}} End of erase sectors ------------	

// {{{ Write Data to Program Pages -----
    always @(posedge log_clk or posedge log_rst) begin
        if (log_rst)
            wr_state <= WR_IDLE_S;
        else
            wr_state <= wr_next_state;
    end

    always @(wr_state, synced_fifo_almostfull, wr_cmd_counter, page_count_int, wrdata_count, 
             wr_current_addr, log_rst, spi_status) begin
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
                        wr_state = WR_WRCMD_S;
                    else
                        wr_state = WR_ASSCS1_S;
                else
                    wr_state = WR_WRCMD_S;
            end

            WR_WRCMD_S: begin
                if (wr_cmd_counter != 6'd32) 
                    wr_next_state = WR_WRCMD_S;
                else if (page_count_int != 17'h00)
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
                if ((wrdata_count == 7) && (wr_current_addr[7:0] == 32'd252))
                    wr_next_state = WR_PPDONE_S;
                else
                    wr_next_state = WR_DATA_S;
            end

            WR_PPDONE_S: begin
                wr_next_state = WR_PPDONE_WAIT_S;
            end

            WR_PPDONE_WAIT_S: begin
                if (log_rst) 
                    wr_next_state = WR_IDLE_S;
                else if ((wr_cmd_counter == 6'd31) && (spi_status == 2'b0))
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
                SPI_MOSI_int   <= wr_cmd_reg[39];
                SPI_CsB        <= 1'b1;
                write_done_int <= 1'b0;
                if (start_addr_valid == 1'b1) wr_current_addr <= start_addr;
                if (page_count_valid == 1'b1) page_count_int  <= page_count;
                if (synced_fifo_almostfull[1] == 1'b1) begin
                    dopin_ts            <= 4'h0E;
                    wr_data_valid_count <= 3'h00;
                    wr_cmd_counter      <= 6'h27;
                    wr_rd_data          <= 2'h00;
                    wr_cmd_reg          <= {CmdWE, 32'h00};
                    fifo_rden           <= 1'b0;
                    wrdata_count        <= 3'h00; 
                    spi_wrdata          <= 32'h00;                    
                end
            end

            WR_ASSCS1_S: begin
                SPI_MOSI_int <= wr_cmd_reg[39];
                if (page_count != 0) begin
                    if (synced_fifo_almostfull[1] == 1'b1)
                        SPI_CsB <= 1'b0;
                end else
                    SPI_CsB  <= 1'b0;
            end

            WR_WRCMD_S: begin
                SPI_MOSI_int <= wr_cmd_reg[39];
                if (wr_cmd_counter != 6'd32) begin
                    wr_cmd_counter <= wr_cmd_counter - 1'b1;
                    wr_cmd_reg     <= {wr_cmd_reg[38:0], 1'b0};
                end else if (page_count_int != 0) begin
                    SPI_CsB        <= 1'b1;
                    wr_cmd_counter <= 6'h27;
                    wr_cmd_reg     <= {CmdPP, wr_current_addr}; // Program Page at current_addr                    
                end else begin
                    SPI_CsB        <= 1'b1;
                    wr_cmd_counter <= 6'h27;
                    write_done_int <= 1'b1;
                end
            end

            WR_ASSCS2_S: begin
                SPI_MOSI_int <= wr_cmd_reg[39];
                SPI_CsB      <= 1'b0;            
            end

            WR_PROGRAM_S: begin
                SPI_MOSI_int <= wr_cmd_reg[39];
                if (wr_cmd_counter != 0) begin
                    wr_cmd_counter <= wr_cmd_counter - 1'b1;
                    wr_cmd_reg     <= {wr_cmd_reg[38:0], 1'b0};
                end else begin
                    fifo_rden <= 1'b1;
                    dopin_ts  <= 4'h00;
                end
            end

            WR_DATA_S: begin
                SPI_MOSI_int <= fifo_dout[0];
                SPI_CsB      <= 1'b0;
                wrdata_count <= wrdata_count + 1'b1;
                if (wrdata_count == 3'd7) begin// 8x4 bits from FIFO. wrdata_count rolls over to 0
                    wr_current_addr <= wr_current_addr + 3'd4; // 4 bytes out of 256 bytes per page
                    if (wr_current_addr[7:0] == 8'd252) begin // every 256 bytes (1 PP) written, only check lower bits = mod 256
                        SPI_CsB        <= 1'b1; 
                        fifo_rden      <= 1'b0;
                        dopin_ts       <= 4'h0E;
                        wr_cmd_counter <= 6'h27;                        
                        wr_cmd_reg     <= {CmdReadStat, 32'h00};
                    end
                end
            end

            WR_PPDONE_S: begin
                SPI_MOSI_int        <= wr_cmd_reg[39];
                dopin_ts            <= 4'h0E;
                SPI_CsB             <= 1'b0;
                wr_data_valid_count <= 3'h00;
                wr_cmd_counter      <= 6'h27;
            end

            WR_PPDONE_WAIT_S: begin
                SPI_MOSI_int <= wr_cmd_reg[39];
                fifo_rden    <= 1'b0;
                if (!log_rst) begin
                    if (wr_cmd_counter != 6'd31) begin
                        wr_cmd_counter <= wr_cmd_counter - 1'b1;
                        wr_cmd_reg     <= {wr_cmd_reg[38:0], 1'b0};
                    end else begin
                        wr_data_valid_count <= wr_data_valid_count + 1'b1;
                        wr_rd_data          <= {wr_rd_data[1], sSpiMiso}; 
                        if (wr_data_valid_count == 3'd7) // catch status byte
                            status_data_valid <= 1'b1; // copy WE and Write_in_progress one cycle after rddate
                        else 
                            status_data_valid <= 1'b0;
                        if (status_data_valid == 1'b1) spi_status <= wr_rd_data;
                        if (spi_status == 2'h00) begin      // Done with page program
                            SPI_CsB             <= 1'b1;
                            wr_cmd_counter      <= 6'h27;
                            wr_cmd_reg          <= {CmdWE, 32'h00};
                            wr_data_valid_count <= 3'h00;
                            status_data_valid   <= 1'b0;
                            spi_status          <= 2'h03;
                            page_count_int      <= page_count_int - 1'b1;
                        end
                    end
                end
            end

            default: begin
                SPI_MOSI_int      <= wr_cmd_reg[39];
                SPI_CsB           <= 1'b1;
                status_data_valid <= 1'b0;
            end
        endcase
    end
// }}} End of write data ---------------

// {{{ Include other modules ------------
    oneshot oneshot(
        .trigger  ( synced_erase[0] ),
        .clk      ( log_clk         ),
        .pulse    ( erase_start     )
    );

    spi_serdes SerDes(
        .CLK           ( log_clk ),          
        .RST           ( log_rst ),          
                   
        .START_TRANS   ( ),  
        .DONE_TRANS    ( ),   
                    
        .DATA_TO_SPI   ( ),  
        .DATA_FROM_SPI ( ),
                     
        .SPI_CS        ( ),       
        .SPI_CLK       ( sSpi_clk ),      
        .SPI_MOSI      ( ),     
        .SPI_MISO      ( )        
    );

    STARTUPE2 #(
        .PROG_USR           ( "FALSE" ),  // Activate program event security feature. Requires encrypted bitstreams.
        .SIM_CCLK_FREQ      ( 0.0     )       // Set the Configuration Clock Frequency (ns) for simulation
    )
    STARTUPE2_inst (
        .CFGCLK             ( ),           // 1-bit output: Configuration main clock output
        .CFGMCLK            ( ),    	   // 1-bit output: Configuration internal oscillator clock output        
        .EOS                ( ),           // 1-bit output: Active-High output signal indicating the End Of Startup
        .PREQ               ( ),           // 1-bit output: PROGRAM request to fabric output        
        .CLK                ( 1'b0    ),           // 1-bit input: User start-up clock input        
        .GSR                ( 1'b0    ),      // 1-bit input: Global Set/Reset input (GSR cannot be used for the port)
        .GTS                ( 1'b0    ),      // 1-bit input: Global 3-state input (GTS cannot be used for the port name)
        .KEYCLEARB          ( 1'b1    ), 	   // 1-bit input: Clear AES Decrypter Key input from Battery-Backed RAM (BBRAM)
        .PACK               ( 1'b1    ),      // 1-bit input: PROGRAM acknowledge input
        .USRCCLKO           ( sSpi_clk ),      // 1-bit input: User CCLK input
        .USRCCLKTS          ( 1'b0    ),      // 1-bit input: User CCLK 3-state enable input
        .USRDONEO           ( 1'b1    ),      // 1-bit input: User DONE pin output control
        .USRDONETS          ( 1'b0    )       // 1-bit input: User DONE 3-state enable output
    );

    FIFO36E1 #(
      .DO_REG                       (),      
      .EN_ECC_READ                  ("FALSE"),             // Enable ECC decoder, (FALSE, TRUE)
      .EN_ECC_WRITE                 ("FALSE"),            // Enable ECC encoder, (FALSE, TRUE)
      .FIRST_WORD_FALL_THROUGH      ("FALSE"), // FALSE, TRUE
      .INIT                         (72'h000000000000000000),     // Initial values on output port
      .ALMOST_EMPTY_OFFSET          (2/*256*/),           // Programmable Empty Threshold
      .ALMOST_FULL_OFFSET           (65/*256*/),            // Programmable Full Threshold
      // Programmable Inversion Attributes: Specifies the use of the built-in programmable inversion              
      .SRVAL                        (72'h000000000000000000), // SET/reset value of the FIFO outputs      
      .DATA_WIDTH                   (36/*4*/)                       // 18-9
    )    
    FIFO36E1_inst (
      // Cascade Signals outputs: Multi-FIFO cascade signals
      .CASDOUT                      ( ),        // 64-bit output: Data cascade output bus
      .CASDOUTP                     ( ),        // 8-bit output: Parity data cascade output bus
      .CASNXTEMPTY                  ( ),        // 1-bit output: Cascade next empty
      .CASPRVRDEN                   ( ),        // 1-bit output: Cascade previous read enable
      // ECC Signals outputs: Error Correction Circuitry ports
      .DBITERR                      ( ),        // 1-bit output: Double bit error status
      .ECCPARITY                    ( ),        // 8-bit output: Generated error correction parity
      .SBITERR                      ( ),        // 1-bit output: Single bit error status
      // Read Data outputs: Read output data
      .DOUT                         ( fifo_dout ),   // 64-bit output: FIFO data output bus
      .DOUTP                        ( ),        // 8-bit output: FIFO parity output bus.
      // Status outputs: Flags and other FIFO status outputs
      .EMPTY                        ( fifo_empty_int   ),   // 1-bit output: Empty
      .FULL                         ( fifo_full_int    ),   // 1-bit output: Full
      .PROGEMPTY                    ( fifo_almostempty ),   // 1-bit output: Programmable empty
      .PROGFULL                     ( fifo_almostfull  ),   // 1-bit output: Programmable full
      .RDCOUNT                      ( ),        // 14-bit output: Read count
      .RDERR                        ( rderr ),        // 1-bit output: Read error
      .RDRSTBUSY                    ( ),        // 1-bit output: Reset busy (sync to RDCLK)
      .WRCOUNT                      ( ),        // 14-bit output: Write count
      .WRERR                        ( wrerr ),   // 1-bit output: Write Error
      .WRRSTBUSY                    ( ),        // 1-bit output: Reset busy (sync to WRCLK)
      // Cascade Signals inputs: Multi-FIFO cascade signals
      .CASDIN                       ( 64'h00 ),   // 64-bit input: Data cascade input bus
      .CASDINP                      ( 8'h00  ),   // 8-bit input: Parity data cascade input bus
      .CASDOMUX                     ( 1'b0 ),   // 1-bit input: Cascade MUX select input
      .CASDOMUXEN                   ( 1'b1 ),   // 1-bit input: Enable for cascade MUX select
      .CASNXTRDEN                   ( 1'b0 ),   // 1-bit input: Cascade next read enable
      .CASOREGIMUX                  ( 1'b0 ),   // 1-bit input: Cascade output MUX select
      .CASOREGIMUXEN                ( 1'b1 ),   // 1-bit input: Cascade output MUX select enable
      .CASPRVEMPTY                  ( 1'b0 ),   // 1-bit input: Cascade previous empty
      // ECC Signals inputs: Error Correction Circuitry ports
      .INJECTDBITERR                ( 1'b0 ),   // 1-bit input: Inject a double bit error
      .INJECTSBITERR                ( 1'b0 ),   // 1-bit input: Inject a single bit error
      // Read Control Signals inputs: Read clock, enable and reset input signals
      .RDCLK                        ( log_clk  	),   // 1-bit input: Read clock
      .RDEN                         ( fifo_rden ),   // 1-bit input: Read enable
      .REGCE                        ( 1'b1 		),   // 1-bit input: Output register clock enable
      .RSTREG                       ( 1'b0		),   // 1-bit input: Output register reset
      .SLEEP                        ( 1'b0		),   // 1-bit input: Sleep Mode
      // Write Control Signals inputs: Write clock and enable input signals
      .RST                          ( log_rst   ),   // 1-bit input: Reset
      .WRCLK                        ( log_clk	),   // 1-bit input: Write clock
      .WREN                         ( fifo_wren ),   // 1-bit input: Write enable
      // Write Data inputs: Write input data
      .DIN                          ( fifo_unconned ),   // 64-bit input: FIFO data input bus
      .DINP                         ( 8'h00 		)    // 8-bit input: FIFO parity input bus
    );    
// }}} End of Include other modules ------------

endmodule