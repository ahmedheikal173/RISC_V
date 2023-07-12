`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/12/2023 02:46:15 PM
// Design Name: 
// Module Name: adder_plus_4
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


module adder_plus_4(
    input [31:0]PC,
    
    output [31:0] PC_Plus4,
    output c_out
    );
    
    bitadder A4(
    .Add1(PC),
    .Add2(4'H0004),
    .Carry_In(1'b0),
    .Sum(PC_Plus4),
    .Carry_Out(c_out)
    );
endmodule
