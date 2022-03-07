`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:59:48 04/13/2021
// Design Name:   P_Pipe
// Module Name:   F:/BITS/Year 3 Sem 2/Computer Architecture/Assignment/Assignment/Pipe2/tb.v
// Project Name:  Pipe2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: P_Pipe
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb;

	// Inputs
	reg clk;
	reg reset;

	// Instantiate the Unit Under Test (UUT)
	P_Pipe uut (
		.clk(clk), 
		.reset(reset)
	);

	always #5 clk = ~clk;

	initial begin
		clk = 0;
		reset = 1;
		#3 reset = 0;
	end

endmodule

