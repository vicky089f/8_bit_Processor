`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:04:18 04/11/2021 
// Design Name: 
// Module Name:    ID_EX_Reg 
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
module ID_EX_Reg(
    input clk,
    input reset,
	 input Flush,
    input [7:0] A,
    input [7:0] B,
	 input [7:0] IF_ID_Instr,
	 input PC_sel,
    input RegWrite,
    input ALUCtrl,
    output reg [7:0] ID_EX_A,
    output reg [7:0] ID_EX_B,
    output reg [7:0] ID_EX_Instr,
	 output reg ID_EX_PC_sel,
	 output reg ID_EX_RegWrite,
    output reg ID_EX_ALUCtrl
    );

always@(negedge reset)
begin
	ID_EX_A <= 0;
	ID_EX_B <= 0;
	ID_EX_Instr <= 0;
	ID_EX_PC_sel <= 0;
	ID_EX_RegWrite <= 0;
	ID_EX_ALUCtrl <= 0;
end

always@(posedge clk)
begin
	if(Flush) begin
		ID_EX_A <= 0;
		ID_EX_B <= 0;
		ID_EX_Instr <= 0;
		ID_EX_PC_sel <= 0;
		ID_EX_RegWrite <= 0;
		ID_EX_ALUCtrl <= 0;
	end
	else begin
		ID_EX_A <= A;
		ID_EX_B <= B;
		ID_EX_Instr <= IF_ID_Instr;
		ID_EX_PC_sel <= PC_sel;
		ID_EX_RegWrite <= RegWrite;
		ID_EX_ALUCtrl <= ALUCtrl;
	end
end

endmodule
