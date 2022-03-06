`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:55:28 03/27/2021 
// Design Name: 
// Module Name:    P_SC 
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
module P_SC(
    input clk,
    input reset
    );

wire [7:0] A, B, Imm, Src, Dst, ALUOut, InstrCode, NPC;
wire PC_sel, sign_ex, RegWrite, muxA, muxB, ALUCtrl;

IF I(
	.clk(clk),
	.reset(reset),
	.PC_sel(PC_sel),
	.Target(ALUOut),
	.NPC(NPC),
   .Instr(InstrCode));

ControlUnit CU(
	.opcode(InstrCode[7:6]),
	.PC_sel(PC_sel),
	.sign_ex(sign_ex),
	.muxA(muxA),
	.muxB(muxB),
	.RegWrite(RegWrite),
	.ALUCtrl(ALUCtrl));

RegFile R(
	.clk(clk),
	.reset(reset),
   .ReadAddr1(InstrCode[5:3]),
   .ReadAddr2(InstrCode[2:0]),
   .WriteAddr(InstrCode[5:3]),
   .WriteData(ALUOut),
   .RegWrite(RegWrite),
   .Data1(Dst),
   .Data2(Src));

sign_extend SE(
	.InstrCode(InstrCode[5:0]),
	.sign_ex(sign_ex),
	.Imm(Imm));

mux mA(Dst,NPC,muxA,A); //Choose Dst if opcode is 00 or 01
								//Else choose NPC for jump instr
								
mux mB(Src,Imm,muxB,B); //Choose Src is opcode is 00
								//Else choose imm value for opcode 01 or 11

ALU PQ(
	.A(A),
	.B(B),
	.ALUCtrl(ALUCtrl),
	.ALUOut(ALUOut));

endmodule
