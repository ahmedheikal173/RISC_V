`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/12/2023 04:25:51 PM
// Design Name: 
// Module Name: Risc_V
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


module Risc_V(
    input clk,reset,load,Reset_Reg
    );
    wire [31:0]PCNext,PC,PC_Plus4,Instruction,Imm_Ext,Result,RD1,RD2,SrcB,ALU_Result,ReadData,Result,PCTarget;
    wire Branch,PCSrc,ResultSrc,MemWrite,ALUSrc,RegWrite,Zero;
    wire [1:0]ALUOp;
    wire [2:0]ALUControl;
    wire [1:0]ImmSrc;
    counter C(
        .Address(PCNext),
        .reset(reset),
        .clk(clk),
        .load(load),
        .Q(PC)
    );
    adder_plus_4(
        .PC(PC),
        .PC_Plus4(PC_Plus4)
    );
    Instruction_Memory(
        .PC(PC),
        .Instruction(Instruction)
    );
    Control_Unit(
        .Zero(Zero),
        .Funct7(Instruction[30]),
        .op(Instruction[6:0]),
        .Funct3(Instruction[14:12]),
        .ResultSrc(ResultSrc),
        .MemWrite(MemWrite),
        .ALUSrc(ALUSrc),
        .RegWrite(RegWrite),
        .PCSrc(PCSrc),
        .ImmSrc(ImmSrc),
        .ALUControl(ALUControl)
    );
    Extender(
        .ImmSrc(ImmSrc),
        .Instr(Instruction[31:7]),
        .Imm_Ext(Imm_Ext)
    );
    Register_File(
        .A1(Instruction[19:15]),
        .A2(Instruction[24:20]),
        .A3(Instruction[11:7]),
        .WD3(Result),
        .clk(clk),
        .Reset(Reset_Reg),
        .WE(RegWrite),
        .RD1(RD1),
        .RD2(RD2)
    );
    ALU(
        .Src1(RD1),
        .Src2(SrcB),
        .ALU_Control(ALUControl),
        .zero_Flag(Zero),
        .ALU_Result(ALU_Result)
    );
    mux_2x1 ALU(
        .in2(Imm_Ext),
        .in1(RD2),
        .sel(ALUSrc),
        .res(SrcB)
    );
    Data_Memory(
        .WD(RD2),
        .A(ALU_Result),
        .WE(MemWrite),
        .clk(clk),
        .RD(ReadData)
    );
     mux_2x1 Data_Memory(
           .in2(ReadData),
           .in1(ALU_Result),
           .sel(ResultSrc),
           .res(Result)
    );
    bitadder (
        .Add1(PC),
        .Add2(Imm_Ext),
        .Carry_In(0),
        .Sum(PCTarget)
    );
    mux_2x1 counter(
               .in2(PCTarget),
               .in1(ALU_Result),
               .sel(PCSrc),
               .res(PCNext)
     );
       
endmodule

