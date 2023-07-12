`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/12/2023 04:19:55 PM
// Design Name: 
// Module Name: Main_Decoder
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

module Main_Decoder (
    input [6:0]Opcode,
    output reg [1:0]ImmSrc,ALU_Op,
    output reg ALUSrc,MemWrite,ResultSrc,Branch,RegWrite
);
always @(Opcode) begin
    if (Opcode==7'b0000011) begin
        RegWrite=1'b1;
        ImmSrc=2'b00;
        ALUSrc=1'b1;
        MemWrite=1'b0;
        ResultSrc=1'b1;
        Branch=1'b0;
        ALU_Op=2'b00;
    end
    else if (Opcode==7'b0100011) begin
        RegWrite=1'b0;
        ImmSrc=2'b01;
        ALUSrc=1'b1;
        MemWrite=1'b1;
        ResultSrc=1'bX;
        Branch=1'b0;
        ALU_Op=2'b00;
    end  
    else if (Opcode==7'b0110011) begin
        RegWrite=1'b1;
        ImmSrc=2'bxx;
        ALUSrc=1'b0;
        MemWrite=1'b0;
        ResultSrc=1'b0;
        Branch=1'b0;
        ALU_Op=2'b10;
    end  
    else if (Opcode==7'b0010011) begin
        RegWrite=1'b1;
        ImmSrc=2'b00;
        ALUSrc=1'b1;
        MemWrite=1'b0;
        ResultSrc=1'b0;
        Branch=1'b0;
        ALU_Op=2'b10;
    end  
    else if (Opcode==7'b0110011) begin
        RegWrite=1'b0;
        ImmSrc=2'b10;
        ALUSrc=1'b0;
        MemWrite=1'b0;
        ResultSrc=1'bx;
        Branch=1'b1;
        ALU_Op=2'b01;
    end  
    else begin
        RegWrite=1'b0;
        ImmSrc=2'b00;
        ALUSrc=1'b0;
        MemWrite=1'b0;
        ResultSrc=1'b0;
        Branch=1'b0;
        ALU_Op=2'b00;
    end  
end
  
endmodule