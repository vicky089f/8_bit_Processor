`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:30:32 04/10/2021 
// Design Name: 
// Module Name:    ControlUnit 
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
module ControlUnit(
    input [1:0] opcode,
	 input flushed,
    output PC_sel,
	 output sign_ex,
    output muxA,
    output muxB,
    output RegWrite,
    output ALUCtrl
    );

assign PC_sel = opcode[1];
assign muxA = opcode[1];
assign muxB = opcode[0];
assign RegWrite = !opcode[1] & !flushed;
assign ALUCtrl = opcode[0];
assign sign_ex = opcode[1];

endmodule
