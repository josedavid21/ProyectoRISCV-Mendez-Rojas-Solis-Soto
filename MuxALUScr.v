`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:37:27 01/22/2021 
// Design Name: 
// Module Name:    MuxALUScr 
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
module MuxALUScr(
    input [31:0]ext_out,
    input [31:0]pc,
    input [31:0]out1,
    output reg [31:0]alumuxout,
    input [1:0]alu_scr
    );

	always@*
	begin
		
		case(alu_scr)
				2'b00: alumuxout <= out1;				//Salida 1 del RegisterFile
				2'b01: alumuxout <= ext_out;			//Salida del extensor
				2'b10: alumuxout <= pc;					//PC
		default begin
				alumuxout <= out1;
		end
		
		endcase
	
	end
	
	

endmodule
