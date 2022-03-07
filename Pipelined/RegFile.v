`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:59:04 03/10/2021 
// Design Name: 
// Module Name:    RegFile 
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
module RegFile(
	 input reset,
    input [2:0] ReadAddr1,
    input [2:0] ReadAddr2,
    input [2:0] WriteAddr,
    input [7:0] WriteData,
    input RegWrite,
    output [7:0] Data1,
    output [7:0] Data2
    );

reg [7:0] R [7:0];
integer i;

//always x[0] <= 0;

assign Data1 = R[ReadAddr1];
assign Data2 = R[ReadAddr2];

always@(negedge reset)
begin
	for(i=0;i<8;i=i+1)
		R[i] = i;
end

always@(*)
begin
	if(RegWrite) R[WriteAddr] <= WriteData;
end

endmodule
