`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.12.2017 15:20:07
// Design Name: 
// Module Name: spi_serdes
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


module spi_serdes(
    input         CLK_I,              // System clock. Fmax <= SPI peripheral Fmax
    input         RST_I,              // Active-high, synchronous reset

    input         START_TRANS_I,      // Active-high, initiate transfer of data
    output        DONE_TRANS_O,       // Active-high when transfer is done

    input  [7:0]  DATA_TO_SPI_I,      // Sent to SPI device
    output [7:0]  DATA_FROM_SPI_O,    // Received from SPI device
    
    output        SPI_CLK_O,          // SPI clock to SPI device
    output        SPI_MOSI_O,         // SPI master-out, slave in to SPI device
    input         SPI_MISO_I          // SPI master-in, slave-out from SPI device
    );

    // {{{ Constant declarations ----------------
        localparam [8:0] C_SHIFT_COUNT_INIT = 9'h01;        
    // }}} End of constant declarations ---------


    // {{{ Wire declarations ----------------
        reg  [8:0]  ShiftCount = 9'h01;
        reg  [7:0]  ShiftData  = 8'h00;
        reg         SpiCsB     = 1'b1;
        reg         SpiMosi    = 1'b1;
        reg         dTransDone = 1'b1;
        wire        sTransferDone;
    // }}} End of wire declarations ---------

    // {{{ Wire assignment ----------------
        assign sTransferDone = ShiftCount[0];
        assign SPI_CLK_O       = (CLK_I | sTransferDone | dTransDone); // BAD IDEA
        assign SPI_MOSI_O      = SpiMosi;
        assign DONE_TRANS_O    = sTransferDone;
        assign DATA_FROM_SPI_O = ShiftData;
    // }}} End of wire assignment ---------

    always @(negedge CLK_I) begin // dTransDone delayed by half clock cycle
        dTransDone <= sTransferDone;
    end

    always @(posedge CLK_I) begin // SPI chip-select is always inverse of RST (?!)
        SpiCsB <= RST_I; // WTF???
    end

    always @(posedge CLK_I) begin  // Track transfer of serial data with barrel shifter
        if (RST_I)
            ShiftCount <= C_SHIFT_COUNT_INIT;
        else if ((sTransferDone == 1'b0) || (START_TRANS_I == 1'b1))
            ShiftCount <= {ShiftCount[0], ShiftCount[8:1]}; // Barrel shift, rotate right
    end

    always @(posedge CLK_I) begin
        if (sTransferDone == 1'b0)
            ShiftData <= {ShiftData[6:0], SPI_MISO_I}; // SHIFT-left while not DONE_START
        else if (START_TRANS_I == 1'b1)
            ShiftData <= DATA_TO_SPI_I; // Load data to start a new transfer sequence from a done state
    end

    always @(negedge CLK_I) begin
        if (RST_I)
            SpiMosi <= 1'b1;
        else if (sTransferDone == 1'b0)
            SpiMosi <= ShiftData[7];
    end

endmodule
