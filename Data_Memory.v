`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/12/2023 03:58:35 PM
// Design Name: 
// Module Name: Data_Memory
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

module Data_Memory (
    input [31:0]WD,A,
    input clk,WE,
    output wire[31:0]RD 
);
    reg [31:0] Data_Registers[63:0];
    always @(posedge clk) begin
        if(WE==1'b1)
        begin
            Data_Registers[A[31:2]]<=WD;
        end
    end
    assign RD = Data_Registers[A];
endmodule