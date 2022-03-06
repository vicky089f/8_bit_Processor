`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:32:07 03/27/2021 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
    input [7:0] A,
    input [7:0] B,
    input ALUCtrl,
    output reg [7:0] ALUOut
    );

always@(*)
begin
	case(ALUCtrl)
		1'b0: ALUOut = B;
		1'b1: ALUOut = A+B;
		default: ALUOut = 8'h00;
	endcase
end

endmodule
