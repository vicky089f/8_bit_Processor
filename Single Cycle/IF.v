`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:35:30 03/09/2021 
// Design Name: 
// Module Name:    IF 
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
module IF(
    input clk,
    input reset,
    input PC_sel,
    input [7:0] Target,
    output [7:0] NPC,
    output [7:0] Instr
    );

reg [7:0] PC;

IMem M1(PC,reset,Instr);
assign NPC = PC + 1;

always@(negedge reset)
begin
	PC <= 0;
end

always@(posedge clk)
begin
	if(PC_sel)
		PC <= Target;
	else
		PC <= NPC;
end

endmodule
