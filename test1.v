`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:24:24 03/27/2021
// Design Name:   P_SC
// Module Name:   F:/BITS/Year 3 Sem 2/Computer Architecture/Assignment/Assignment/test1.v
// Project Name:  Assignment
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: P_SC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test1;

	// Inputs
	reg clk;
	reg reset;

	// Instantiate the Unit Under Test (UUT)
	P_SC uut (
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

