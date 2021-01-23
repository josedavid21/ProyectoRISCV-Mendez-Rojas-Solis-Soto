`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:08:13 01/20/2021 
// Design Name: 
// Module Name:    recortador_l 
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
/////////////////////////-/////////////////////////////////////////////////////////
module recortador_l( in , OutRecortador, width
    );
input[31:0] in;
output reg[31:0] OutRecortador;
input width;
always begin
	if (width) begin
		OutRecortador[7:0] <= in[7:0];
		OutRecortador[31:8] <= 24'b0;
	end else OutRecortador <= in[31:0];
end
endmodule
