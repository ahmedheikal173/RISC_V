`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/11/2023 11:18:06 AM
// Design Name: 
// Module Name: counter
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

module counter(
    input [31:0]Address,
    input reset,
    input clk,
    input load,
    output [31:0]Q
);
reg [31:0] Q_next,Q_reg;
always@(posedge clk,negedge reset)
begin
    if (!reset) 
        Q_reg<=4'H0000;
    else
        Q_reg<=Q_next;
end

always@(Address,load)
begin
    if(load)
        Q_next=Address;
    else
        Q_next=Q_reg;
end
assign Q=Q_reg;

endmodule
