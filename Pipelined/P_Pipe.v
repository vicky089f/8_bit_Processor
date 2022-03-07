`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:23:20 04/10/2021 
// Design Name: 
// Module Name:    P_Pipe 
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
module P_Pipe(
    input clk,
    input reset
    );

wire [7:0] A, B, fwdA, fwdB, Imm, Src, Dst, ALUOut, Instr, NPC;
wire [7:0] IF_ID_Instr, IF_ID_NPC, ID_EX_Instr, ID_EX_A, ID_EX_B, EX_WB_Instr, EX_WB_ALUOut;
wire PC_sel, sign_ex, RegWrite, muxA, muxB, ALUCtrl, Flush, flushed;
wire ID_EX_RegWrite, ID_EX_ALUCtrl, EX_WB_RegWrite;

assign Flush = ID_EX_PC_sel;  //Flush if there is a JUMP instr
										//in the EX Stage (ID/EX reg)

IF I(
	.clk(clk),
	.reset(reset),
	.PC_sel(ID_EX_PC_sel),
	.Target(ALUOut),
	.NPC(NPC),
   .Instr(Instr));

IF_ID_Reg R1(
	.clk(clk),
	.reset(reset),
	.Flush(Flush),
	.Instr(Instr),
	.NPC(NPC),						//'flushed' indicates that the IF_ID register
	.IF_ID_Instr(IF_ID_Instr), //has been flushed due to the jump instruction
	.IF_ID_NPC(IF_ID_NPC),		//and this will tell the control unit to
	.flushed(flushed));			//set the RegWrite as 0 for this instr

ControlUnit Ctrl(
	.opcode(IF_ID_Instr[7:6]),
	.flushed(flushed),
	.PC_sel(PC_sel),
	.sign_ex(sign_ex),
	.muxA(muxA),
	.muxB(muxB),
	.RegWrite(RegWrite),
	.ALUCtrl(ALUCtrl));

RegFile RF(
	.reset(reset),
   .ReadAddr1(IF_ID_Instr[5:3]),
   .ReadAddr2(IF_ID_Instr[2:0]),
   .WriteAddr(EX_WB_Instr[5:3]),
   .WriteData(EX_WB_ALUOut),
   .RegWrite(EX_WB_RegWrite),
   .Data1(Dst),
   .Data2(Src));

sign_extend SgnEx(
	.InstrCode(IF_ID_Instr[5:0]),
	.sign_ex(sign_ex),
	.Imm(Imm));

mux mA(Dst,IF_ID_NPC,muxA,A); //Choose Dst if opcode is 00 or 01
										//Else choose NPC for jump instr
mux mB(Src,Imm,muxB,B);	//Choose Src is opcode is 00
								//Else choose imm value for opcode 01 or 11
ID_EX_Reg R2(
	.clk(clk),
	.reset(reset),
	.Flush(Flush),
	.A(A),
	.B(B),
	.IF_ID_Instr(IF_ID_Instr),
	.PC_sel(PC_sel),
	.RegWrite(RegWrite),
	.ALUCtrl(ALUCtrl),
	.ID_EX_A(ID_EX_A),
	.ID_EX_B(ID_EX_B),
	.ID_EX_Instr(ID_EX_Instr),
	.ID_EX_PC_sel(ID_EX_PC_sel),
	.ID_EX_RegWrite(ID_EX_RegWrite),
	.ID_EX_ALUCtrl(ID_EX_ALUCtrl));

fwd_unit F(
	.ID_EX_Instr(ID_EX_Instr),
   .EX_WB_Dst(EX_WB_Instr[5:3]),
   .EX_WB_ALUOut(EX_WB_ALUOut),
   .A(ID_EX_A),
	.B(ID_EX_B),
   .fwdA(fwdA),
	.fwdB(fwdB));

ALU PQ(
	.A(fwdA),
	.B(fwdB),
	.ALUCtrl(ID_EX_ALUCtrl),
	.ALUOut(ALUOut));

EX_WB_Reg R3(
	.clk(clk),
	.reset(reset),
	.ID_EX_Instr(ID_EX_Instr),
	.ALUOut(ALUOut),
	.RegWrite(ID_EX_RegWrite),
	.EX_WB_Instr(EX_WB_Instr),
	.EX_WB_ALUOut(EX_WB_ALUOut),
	.EX_WB_RegWrite(EX_WB_RegWrite));

endmodule
