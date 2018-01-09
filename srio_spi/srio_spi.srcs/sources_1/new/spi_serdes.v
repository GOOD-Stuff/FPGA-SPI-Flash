`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: VlSU
// Engineer: Gustov Vladimir
// 
// Create Date: 18.12.2017 15:20:07
// Design Name: srio_spi
// Module Name: spi_serdes
// Project Name: spi_flash_programmer
// Target Devices: XC7K160TFFQ676-2 (Kintex-7)
// Tool Versions: Vivado 2016.3
// Description: This module serializes the data to be sent to the SPI Flash memory,
// and deserializes the data received from the SPI Flash memory
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// MSB to LSB (MOSI <- MSB)
//////////////////////////////////////////////////////////////////////////////////


module spi_serdes(
    input         CLK_I,              // System clock. Fmax <= SPI peripheral Fmax
    input         RST_I,              // Active-high, synchronous reset

    input         SPI_CS_I,
    input         START_TRANS_I,      // Active-high, initiate transfer of data
    output        DONE_TRANS_O,       // Active-high when transfer is done

    input  [7:0]  DATA_TO_SPI_I,      // Sent to SPI device
    output [7:0]  DATA_FROM_SPI_O,    // Received from SPI device
    
    output        SPI_CLK_O,          // SPI clock to SPI device
    output        SPI_CS_N_O,         // Negedge CS signal
    output        SPI_MOSI_O,         // SPI master-out, slave in to SPI device
    input         SPI_MISO_I          // SPI master-in, slave-out from SPI device
    );

    // {{{ Constant declarations ----------------
        localparam [7:0] C_SHIFT_COUNT_INIT = 8'h01;        
    // }}} End of constant declarations ---------


    // {{{ Wire declarations ----------------
        reg  [7:0]  ShiftCount = C_SHIFT_COUNT_INIT;
        reg  [7:0]  ShiftData  = 8'h00;
        reg         SpiMosi    = 1'b0;
        reg         dTransDone = 1'b1; // Start and End of transaction            
        reg         spi_cs_n   = 1'b1;                
    // }}} End of wire declarations ---------

    // {{{ Wire assignment ----------------        
        assign SPI_CLK_O       = (CLK_I || spi_cs_n || dTransDone); // may be BAD IDEA
        assign SPI_MOSI_O      = SpiMosi;        
        assign DONE_TRANS_O    = dTransDone;
        assign DATA_FROM_SPI_O = ShiftData;
        assign SPI_CS_N_O      = spi_cs_n;
    // }}} End of wire assignment ---------

    // Set CS signal
    always @(negedge CLK_I) begin
        if (RST_I)
            spi_cs_n <= 1'b1;
        else
            spi_cs_n <= SPI_CS_I;
    end

    always @(posedge CLK_I) begin // dTransDone delayed by half clock cycle
        if (RST_I)
            dTransDone <= 1'b1;
        else
            dTransDone <= spi_cs_n;
    end

    always @(posedge CLK_I) begin  // Track transfer of serial data with barrel shifter
        if (RST_I)
            ShiftCount <= C_SHIFT_COUNT_INIT;
        else if (spi_cs_n == 1'b1)
            ShiftCount <= C_SHIFT_COUNT_INIT;
        else if ((spi_cs_n == 1'b0) || (START_TRANS_I == 1'b1))
            ShiftCount <= {ShiftCount[0], ShiftCount[7:1]}; // Barrel shift, rotate right
        
    end

    // Simultaneous serialize outgoing data & deserialize incoming data. MSB first
    always @(posedge CLK_I) begin
        if (RST_I)
            ShiftData <= 8'h00;
        else if ((ShiftCount[0] != 1'b1) && (START_TRANS_I))
            ShiftData <= {ShiftData[6:0], SPI_MISO_I}; // SHIFT-left while not DONE_START
        else if ((ShiftCount[0] == 1'b1) && (START_TRANS_I == 1'b1))
            ShiftData <= DATA_TO_SPI_I; // Load data to start a new transfer sequence from a done state
    end

    // SPI MOSI register outputs on falling edge of CLK. MSB first
    always @(negedge CLK_I) begin
        if (RST_I)
            SpiMosi <= 1'b0;        
        else if (spi_cs_n)
            SpiMosi <= 1'b0;
        else if (spi_cs_n == 1'b0)
            SpiMosi <= ShiftData[7];               
    end

endmodule
