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
    input  sys_clkp,         // MMCM reference clock
    input  sys_clkn,         // MMCM reference clock    
    // high-speed IO
    // Serial Receive Data
    input  srio_rxn0,        
    input  srio_rxp0,        
    input  srio_rxn1,
    input  srio_rxp1,    
    // Serial Transmit Data
    output srio_txn0,        
    output srio_txp0,        
    output srio_txn1,
    output srio_txp1,   
    // Serial Peripheral Interface 
    output CS,
    output DQ0, 
    input  DQ1    
    );
    
    wire        log_clk;
    wire        log_rst;
    wire [64:0] data;
    
srio_example_test srio_top(
    // Clocks and Resets
    .sys_clkp   (sys_clkp), //MMCM reference clock
    .sys_clkn   (sys_clkn), //MMCM reference clock
    .rst        (log_rst),
    // high-speed IO
    // Serial Receive Data
    .srio_rxn0  (srio_rxn0),
    .srio_rxp0  (srio_rxp0),
    .srio_rxn1  (srio_rxn1),
    .srio_rxp1  (srio_rxp1),

    // Serial Transmit Data
    .srio_txn0  (srio_txn0),
    .srio_txp0  (srio_txp0),
    .srio_txn1  (srio_txn1),
    .srio_txp1  (srio_txp1),

    .data_to_out (data)
);    

spi_loader_top spi_loader(
    .log_clk      ( spi_clk ),
    .log_rst      ( log_rst ),
    .data_to_prog ( ),
    .SPI_CS       ( CS )
);
        
endmodule
