`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/12/2023 03:02:28 PM
// Design Name: 
// Module Name: Register_File
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

module Register_File (
    input [4:0] A1,A2,A3,
    input [31:0]WD3,
    input clk,Reset,WE,
    output wire [31:0]RD1,RD2
);

reg [31:0] Registers[31:0];
always @(posedge clk,negedge Reset) 
begin
    if (!Reset) 
    begin
        Registers[A1]<=32'b0;
        Registers[A2]<=32'b0;
    end
    else
    begin
        if (WE==1'b0) 
        begin
            Registers[A3]<=WD3;
        end
    end  
end
    assign RD1=Registers[A1];
    assign RD2=Registers[A2];
endmodule