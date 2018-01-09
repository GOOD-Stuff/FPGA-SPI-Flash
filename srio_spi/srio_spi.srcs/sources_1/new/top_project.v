`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: VlSU
// Engineer: Gustov Vladimir
// 
// Create Date: 12.12.2017 10:16:18
// Design Name: 
// Module Name: top_project
// Project Name: srio_spi
// Target Devices: 
// Tool Versions:  Vivado 2016.3
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top_project(
    // Clocks and Resets
    input  SYSCLK_P,   // MMCM reference clock
    input  SYSCLK_N,   // MMCM reference clock    

    // Serial Peripheral Interface 
    output CS,         // SPI Chip Select - When HIGH, the device is deselected, when LOW enables the device
    output DQ0,        // Serial data - transfers data into the device  (FPGA -> Flash)
    input  DQ1         // Serial data - Transfer data out of the device (FPGA <- Flash)
    );
    
    wire        log_clk;
    reg         log_rst = 1'b1;
    wire        spi_clk;    
    
    wire [63:0] data = 64'h00AABBCCDD;
        
    localparam RES_WIDTH = 4;    
    reg [RES_WIDTH-1:0] reset_pipe = {RES_WIDTH{1'b1}};        
    always @(posedge log_clk) {log_rst, reset_pipe} <= {reset_pipe, 1'b0};
    
    IBUFDS #(
       .DIFF_TERM     ( "FALSE"  ),       // Differential Termination
       .IBUF_LOW_PWR  ( "TRUE"   ),     // Low power="TRUE", Highest performance="FALSE" 
       .IOSTANDARD    ( "LVDS"   )     // Specify the input I/O standard
    ) IBUFDS_inst (
       .O             ( log_clk  ),  // Buffer output
       .I             ( SYSCLK_P ),  // Diff_p buffer input (connect directly to top-level port)
       .IB            ( SYSCLK_N )   // Diff_n buffer input (connect directly to top-level port)
    );
           
    spi_loader_top spi_loader(
        .CLK_I             ( log_clk_t  ),
        .SRST_I            ( log_rst_t  ),
    
        .DATA_TO_PROG_I    ( data       ),    
        .START_ADDR_I      ( 24'h000100 ),
        .PAGE_COUNT_I      ( 16'd168    ),
        .SECTOR_COUNT_I    ( 12'd80     ),
    
        .START_LOAD_I      ( start_load ),
        .STOP_WRITE_O      ( check_stop ),
        .WRITE_DONE_O      ( write_done ),
    
        .SPI_CS_O          ( CS         ),
        .SPI_MOSI_O        ( DQ0        ),
        .SPI_MISO_I        ( DQ1        )
    );
        
endmodule
