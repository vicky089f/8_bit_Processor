`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:57:32 04/11/2021 
// Design Name: 
// Module Name:    fwd_unit 
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
module fwd_unit(
    input [7:0] ID_EX_Instr,
    input [2:0] EX_WB_Dst,
    input [7:0] EX_WB_ALUOut,
    input [7:0] A,
	 input [7:0] B,
    output reg [7:0] fwdA,
	 output reg [7:0] fwdB
    );

always@(*)
begin
	if(ID_EX_Instr[7] != 1'b1)
	begin
		if(ID_EX_Instr[6] == 1'b0) begin
		fwdA <= A;
			if(EX_WB_Dst == ID_EX_Instr[2:0])
				fwdB <= EX_WB_ALUOut;
			else
				fwdB <= B;
		end
		else begin
		fwdB <= B;
			if(EX_WB_Dst == ID_EX_Instr[5:3])
				fwdA <= EX_WB_ALUOut;
			else
				fwdA <= A;
		end
	end
	else begin
		fwdA <= A;
		fwdB <= B;
	end
end
endmodule
