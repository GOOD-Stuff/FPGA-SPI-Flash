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
    reg [31:0] data;
    wire CS;
    wire DQ0;
    reg  DQ1;
    
    integer count;

    initial begin
        log_clk_t            = 1'b0;
        log_rst_t            = 1'b0;
        count                = 0;
        DQ1                  = 1'b0;        
        data                 = 64'h00AABBCCDD;
                        
        $display("<< Running testbench >>");
    end
    
    always begin// генератор clk
        #10 log_clk_t = !log_clk_t; // 50 MHz     
        
    end

    always @(posedge log_clk_t) begin
        count <= count + 1'b1;        
    end 

    always @(posedge log_clk_t) begin
        if (count < 100)
            log_rst_t <= 1'b1;
        else
            log_rst_t <= 1'b0;
    end

    spi_loader_top spi_loader(
        .CLK_I          ( log_clk_t  ),
        .SRST_I         ( log_rst_t  ),
        .DATA_TO_PROG_I ( data       ),    
        .START_ADDR_I   ( 24'hABCD   ),
        .PAGE_COUNT_I   ( 16'h1000   ),
        .SUBSECTOR_COUNT_I ( 12'h100     ),
        .SPI_CS_O       ( CS         ),
        .SPI_MOSI_O     ( DQ0        ),
        .SPI_MISO_I     ( DQ1        )
    );

endmodule
