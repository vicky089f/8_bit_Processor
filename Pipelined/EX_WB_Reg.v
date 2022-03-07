`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:07:47 04/11/2021 
// Design Name: 
// Module Name:    EX_WB_Reg 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module EX_WB_Reg(
    input clk,
    input reset,
	 input [7:0] ID_EX_Instr,
    input [7:0] ALUOut,
    input RegWrite,
	 output reg [7:0] EX_WB_Instr,
    output reg [7:0] EX_WB_ALUOut,
    output reg EX_WB_RegWrite
    );

always@(negedge reset)
begin
	EX_WB_Instr <= 0;
	EX_WB_ALUOut <= 0;
	EX_WB_RegWrite <= 0;
end

always@(posedge clk)
begin
	EX_WB_Instr <= ID_EX_Instr;
	EX_WB_ALUOut <= ALUOut;
	EX_WB_RegWrite <= RegWrite;
end

endmodule
