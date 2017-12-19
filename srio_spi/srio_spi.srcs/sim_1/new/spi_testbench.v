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
        
    initial begin
        log_clk_t            = 1'b1;
        log_rst_t            = 1'b1;
        
        DQ1                  = 1'b0;        
        data                 = 32'h00AABBCCDD;
        
        /*iotx_tready_t        = 1'b1;        
        iorx_tvalid_t        = 1'b0;   
        iorx_tlast_t         = 1'b0;     
        iorx_tuser_t         = 32'h00;
        iorx_tdata_t         = 64'h00;              
        iorx_tkeep_t         = 8'b0;             
             
        current_state        = IDLE_S;        
        some_counter         = 5'b0;*/                  
        $display("<< Running testbench >>");
    end
    
    always begin// генератор clk
        #10 log_clk_t = !log_clk_t; // 50 MHz     
        #5 log_rst_t = 1'b0;
    end

    spi_loader_top spi_loader(
        .CLK_I          ( log_clk_t  ),
        .RST_I          ( log_rst_t  ),
        .DATA_TO_PROG_I ( data       ),    
        .START_ADDR_I   ( 24'hABCD   ),
        .PAGE_COUNT_I   ( 16'h1000   ),
        .SECTOR_COUNT_I ( 12'h10     ),
        .SPI_CS_O       ( CS         ),
        .SPI_MOSI_O     ( DQ0        ),
        .SPI_MISO_I     ( DQ1        )
    );

endmodule
