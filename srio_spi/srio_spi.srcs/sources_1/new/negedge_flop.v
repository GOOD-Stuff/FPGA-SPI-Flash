`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.12.2017 13:30:49
// Design Name: 
// Module Name: negedge_flop
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


module negedge_flop(
    input      CLK,
    input      D,
    output reg Q
    );

    always @(negedge CLK) begin
        Q <= D;
    end
    
endmodule
