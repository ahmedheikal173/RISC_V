`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/12/2023 02:43:18 PM
// Design Name: 
// Module Name: fullyadder
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


module fullyadder (
    input A_F,B_F,
    input Carry_In_F,
    output Sum_F,Carry_Out_F  
);
    wire Carry1,Carry2,Sum1;
    halfadder A1(
        .A(A_F),
        .B(B_F),
        .Carry(Carry1),
        .Sum(Sum1)
    );

 halfadder A2(
        .A(Carry_In_F),
        .B(Sum1),
        .Carry(Carry2),
        .Sum(Sum_F)
    );
    assign Carry_Out_F= Carry1 | Carry2;

endmodule
