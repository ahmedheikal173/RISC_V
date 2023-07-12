`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/12/2023 03:57:28 PM
// Design Name: 
// Module Name: ALU
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

module ALU (
    input [31:0] Src1,
    input [31:0] Src2,
    input [2:0] ALU_Control,
    
    output reg [31:0] ALU_Result,
    output reg zero_Flag,
    output reg sign_Flag
);



always @(ALU_Control)
    begin
        case (ALU_Control)
            3'b000: ALU_Result = Src1 + Src2;
            3'b001: ALU_Result = Src1 << Src2;
            3'b010: ALU_Result = Src1 - Src2;
            3'b100: ALU_Result = Src1 ^ Src2;
            3'b101: ALU_Result = Src1 >> Src2;
            3'b110: ALU_Result = Src1 | Src2;
            3'b111: ALU_Result = Src1 & Src2;
            default: ALU_Result = 0;
        endcase
        if(ALU_Result==0)
            zero_Flag=1;
        else
            zero_Flag=0;

        if(ALU_Result[31]==0)
            sign_Flag=1;
        else
            sign_Flag=0;
    end
    
endmodule