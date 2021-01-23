`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:27:11 01/22/2021 
// Design Name: 
// Module Name:    MuxRegSel 
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
module MuxRegSel(
    input [1:0]reg_sel,
	 input [31:0]pc,
    input [31:0]inf_out,
    input [31:0]aluout,
    output reg [31:0]Datos
    );

	always@*
	begin
		
		case(reg_sel)
				2'b00: Datos = aluout;			// NO SE USA, Rd = aluaout
				2'b01: Datos = inf_out;			//Rd = memoria
				2'b10: Datos = aluout;			//Rd = ALUout
				2'b11: Datos = pc;				//Rd = pc
		endcase
	
	end
	
	

endmodule
