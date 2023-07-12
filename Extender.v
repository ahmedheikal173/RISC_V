`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/12/2023 02:54:06 PM
// Design Name: 
// Module Name: Extender
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


module Extender (
    input [1:0]ImmSrc,
    input [31:7] Instr,
    output reg [31:0] Imm_Ext
);
    always @(ImmSrc) begin
        if (ImmSrc==2'b00) begin
            Imm_Ext={{20{Instr[31]}},Instr[31:20]};
        end
        else if (ImmSrc==2'b01) begin
            Imm_Ext={{20{Instr[31]}},Instr[31:25],Instr[11:7]};
        end
        else if (ImmSrc==2'b10) begin
            Imm_Ext={{20{Instr[31]}},Instr[7],Instr[30:25],Instr[11:8],1'b0};
        end
        else begin
            Imm_Ext=32'b0;
        end
    end
endmodule