`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:58:32 04/11/2021 
// Design Name: 
// Module Name:    IF_ID_Reg 
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
module IF_ID_Reg(
    input clk,
    input reset,
	 input Flush,
    input [7:0] Instr,
    input [7:0] NPC,
    output reg [7:0] IF_ID_Instr,
    output reg [7:0] IF_ID_NPC,
	 output reg flushed
    );

always@(negedge reset)
begin
	IF_ID_Instr <= 0;
	IF_ID_NPC <= 0;
end

always@(posedge clk)
begin
	if(Flush) begin
		IF_ID_Instr <= 0;
		IF_ID_NPC <= 0;
		flushed <= 1;
	end
	else begin
		IF_ID_Instr <= Instr;
		IF_ID_NPC <= NPC;
		flushed <= 0;
	end
end

endmodule
