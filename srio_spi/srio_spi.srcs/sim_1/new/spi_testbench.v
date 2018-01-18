`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.12.2017 17:46:20
// Design Name: 
// Module Name: spi_testbench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module spi_testbench();

    reg log_clk_t;      
    reg log_rst_t;
    
    reg start_work;  // signal of DVI for out interface
    reg [2:0] cmd;   // command signal
    reg [63:0] dout; // data for MISO
    reg miso;       
    reg [31:0] din;   // data for write into SPI Flash
    reg din_dvi;
    reg cmd_dvi;

    reg [23:0] flash_addr;
    reg [15:0] page_count;
    reg [7:0]  sector_count;

    wire check_stop; // check busy our interface (for WRITE)
    wire write_done; 
    wire read_done;
    wire erase_done;        
    
    wire CS;    
    wire DQ0;    
    reg  DQ1;
    
    integer count;       // common counter
    integer delay_count; // counter for READ state

    initial begin // initialize registers
        log_clk_t            = 1'b0;
        log_rst_t            = 1'b0;
        start_work           = 1'b1;
        count                = 0; 
        delay_count          = 0;   
        miso                 = 1'b0;
        dout                 = 64'h32bbccddeeff321f;
        cmd                  = 3'h00; // Command of SubSector Erase
        DQ1                  = 1'b0;        
        din                  = 32'hCDF5CF2A;
        flash_addr           = 24'h0100;
        page_count           = 16'h01;
        sector_count         = 8'h50;                
        din_dvi              = 1'b0;
        cmd_dvi              = 1'b0;

        $display("<< Running testbench >>");
    end
    
    always begin// generate clk
        #10 log_clk_t = !log_clk_t; // 50 MHz     
        
    end

    always @(posedge log_clk_t) begin
        count <= count + 1'b1;        
    end 

    always @(posedge log_clk_t) begin
        if (cmd == 3'h05) // READ state
            delay_count <= delay_count + 1'b1;
    end

    // Generate RESET signal
    always @(posedge log_clk_t) begin
        if (count < 100)
            log_rst_t <= 1'b1;
        else
            log_rst_t <= 1'b0;
    end


    always @(posedge log_clk_t) begin
        if (count > 105 && count < 233)
            din_dvi <= 1'b1;
        else
            din_dvi <= 1'b0;
    end

    always @(posedge log_clk_t) begin
        if (count == 102) begin
            cmd_dvi <= 1'b1;
            cmd     <= 3'h00;
        end else if (count == /*10500*/105 ) begin
            cmd_dvi <= 1'b1;
            cmd     <= 3'h03;
        end else if (count == 107) begin
            cmd_dvi <= 1'b1;
            cmd     <= 3'h03;
            flash_addr <= 24'h0200;
        end else if (count == 108) begin
            cmd_dvi    <= 1'b1;
            cmd        <= 3'h05;
            flash_addr <= 24'h0200;
            page_count <= 16'h020;
        end else begin
            cmd_dvi <= 1'b0;            
        end
    end

    always @(posedge log_clk_t) begin
        if (count == 183000)
            $finish;
    end

    // Generate SPI MISO signals
    always @(negedge log_clk_t) begin
        if (/*delay_count*/count > 7117) 
            dout <= {dout[62:0], miso};            
        else if (count == 7117)  // and commen this (2)
            dout <= 64'h32bbccddeeff321f;         
        /*else if (count > 161 && count < 188354) // comment this (1), for work only with READ state
            dout <= {dout[62:0], miso};            */
    end

    always @(*) begin
        miso = dout[63];
    end


    always @(posedge log_clk_t) begin
        /*if (read_done == 1'b1) begin
            start_work <= 1'b0;  // If Read was successful - finish test
            $finish;                              
        end*/
    end

    spi_loader_top spi_loader(
        .CLK_I             ( log_clk_t    ),
        .SRST_I            ( log_rst_t    ),
  
        .CMD_DVI_I         ( cmd_dvi      ),
        .CMD_I             ( cmd          ),    
        .START_ADDR_I      ( flash_addr   ),
        .PAGE_COUNT_I      ( page_count   ),
        .SECTOR_COUNT_I    ( sector_count ),
        .DATA_OUT_O        (              ),

        .DATA_DVI_I        ( din_dvi      ),
        .DATA_TO_PROG_I    ( din          ),
        
        .CMD_FIFO_EMPTY_O  (  ),
        .CMD_FIFO_FULL_O   (  ),
        .DATA_FIFO_PFULL_O (  ),
        
        .SPI_CS_O          ( CS           ),
        .SPI_MOSI_O        ( DQ0          ),
        .SPI_MISO_I        ( miso         )
    );

endmodule
