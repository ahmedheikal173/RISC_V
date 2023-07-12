`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/12/2023 02:44:02 PM
// Design Name: 
// Module Name: bitadder
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

module bitadder (
    input [31:0] Add1,Add2,
    input Carry_In,
    output [31:0] Sum,
    output Carry_Out
);
    wire [32:0] Cs;
    assign Cs[0]=Carry_In;
    genvar K;
        generate
            for(K=0;K<32;K=K+1)
            begin: stage
                fullyadder SD(
                    .A_F(Add1[K]),
                    .B_F(Add2[K]),
                    .Carry_In_F(Cs[K]),
                    .Sum_F(Sum[K]),
                    .Carry_Out_F(Cs[K+1])
                );
            end
        endgenerate
       assign Carry_Out=Cs[32];
endmodule

