`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:28:18 03/09/2021 
// Design Name: 
// Module Name:    IMem 
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
module IMem(
    input [7:0] Addr,
    input reset,
    output [7:0] InstrCode
    );

reg [7:0] Mem [255:0];

always@(reset)
begin
	if(reset)
	begin
		$readmemh("program1.mem",Mem);
	end
end

assign InstrCode = Mem[Addr];

endmodule
