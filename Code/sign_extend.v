`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:25:49 03/27/2021 
// Design Name: 
// Module Name:    sign_extend 
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
module sign_extend(
    input [5:0] InstrCode,
	 input sign_ex,
    output reg [7:0] Imm
    );

always@(*)
begin
	case(sign_ex)
		1'b0: Imm = {{6{InstrCode[2]}},InstrCode[1:0]};
		1'b1: Imm = {{3{InstrCode[5]}},InstrCode[4:0]};
		default: Imm = 8'h00;
	endcase
end

endmodule
