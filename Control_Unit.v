`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/12/2023 05:00:09 PM
// Design Name: 
// Module Name: Control_Unit
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


module Control_Unit(
    input Zero,Funct7,
    input [6:0]op,
    input [2:0]Funct3,
    output ResultSrc,MemWrite,ALUSrc,RegWrite,PCSrc,
    output [1:0]ImmSrc,
    output [2:0]ALUControl
    );
    
    wire [1:0]ALUOp;
    wire Branch,zero;
    ALU_Decoder(
        .ALU_Op(ALUOp),
        .Funct3(Funct3),
        .Funct7(Funct7),
        .op5(op[5]),
        .ALU_Control(ALUControl)
    );
    Main_Decoder(
        .Opcode(op),
        .ImmSrc(ImmSrc),
        .ALU_Op(ALUOp),
        .ALUSrc(ALUSrc),
        .MemWrite(MemWrite),
        .ResultSrc(ResultSrc),
        .Branch(Branch),
        .RegWrite(RegWrite)
    );
    Branch_And(
        .zero(zero),
        .Branch(Branch),
        .PCSrc(PCSrc)
    );
endmodule
