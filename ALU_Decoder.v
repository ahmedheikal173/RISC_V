`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/12/2023 04:22:57 PM
// Design Name: 
// Module Name: ALU_Decoder
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
module ALU_Decoder (
    input [1:0]ALU_Op,
    input [2:0]Funct3,
    input Funct7,op5,
    output reg [2:0]ALU_Control
);
    always @(ALU_Op) begin
        if (ALU_Op==2'b00) begin
            ALU_Control=3'b000;
        end
        else if(ALU_Op==2'b01)
        begin
            if (Funct3==3'b000 || Funct3==3'b001 || Funct3==3'b100) begin
                ALU_Control=3'b010;
            end
        end
        else if(ALU_Op==2'b10)
        begin
            if (Funct3==2'b000) begin
                if ({op5,Funct7}==2'b00 || {op5,Funct7}==2'b01 || {op5,Funct7}==2'b10) begin
                    ALU_Control=3'b000;
                end
                else if ({op5,Funct7}==2'b11) begin
                    ALU_Control=3'b010;
                end
            end
            else if (Funct3==2'b001) begin
                ALU_Control=3'b001;
            end
            else if (Funct3==2'b100) begin
                ALU_Control=3'b100;
            end
            else if (Funct3==2'b101) begin
                ALU_Control=3'b101;
            end
            else if (Funct3==2'b110) begin
                ALU_Control=3'b110;
            end
            else if (Funct3==2'b111) begin
                ALU_Control=3'b111;
            end
            else begin
                ALU_Control=3'b000;
            end
        end
        else 
        begin
            ALU_Control=3'b000;
        end
    end
endmodule
