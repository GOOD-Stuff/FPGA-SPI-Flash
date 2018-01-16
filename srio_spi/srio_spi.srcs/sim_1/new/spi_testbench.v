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
    reg [7:0] din;   // data for write into SPI Flash
    
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
        din                  = 8'hCD;
                        
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
        if (check_stop == 1'b1) // If interface is BUSY - don't write into interface
            din <= 8'h00;
        else
            din <= 8'hcd;
    end    

    always @(posedge log_clk_t) begin
        if (erase_done)
            cmd <= 3'h03; // command of Write
        if (write_done)
            cmd <= 3'h05; // command of Read
    end

    // Generate SPI MISO signals
    always @(negedge log_clk_t) begin
        if (delay_count > 32'h2A) 
            dout <= {dout[62:0], miso};            
        else if (delay_count == 32'h28)  // and commen this (2)
            dout <= 64'h32bbccddeeff321f;         
        else if (count > 161 && count < 188354) // comment this (1), for work only with READ state
            dout <= {dout[62:0], miso};            
    end

    always @(*) begin
        miso = dout[63];
    end


    always @(posedge log_clk_t) begin
        if (read_done == 1'b1) begin
            start_work <= 1'b0;  // If Read was successful - finish test
            $finish;                              
        end
    end

    spi_loader_top spi_loader(
        .CLK_I             ( log_clk_t  ),
        .SRST_I            ( log_rst_t  ),

        .CMD_I             ( cmd ),

        .DATA_TO_PROG_I    ( din       ),    
        .START_ADDR_I      ( 24'h000100 ),
        .PAGE_COUNT_I      ( 16'd168    ),
        .SECTOR_COUNT_I    ( 8'd80      ),
        .DATA_OUT_O        (            ),

        .START_FLASH_I     ( start_work ),
        .STOP_WRITE_O      ( check_stop ),
        .ERASE_DONE_O      ( erase_done ),
        .WRITE_DONE_O      ( write_done ),
        .READ_DONE_O       ( read_done ),
        
        .SPI_CS_O          ( CS         ),
        .SPI_MOSI_O        ( DQ0        ),
        .SPI_MISO_I        ( miso       )
    );

endmodule
