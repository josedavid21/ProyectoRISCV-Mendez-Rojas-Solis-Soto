`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:33:50 01/21/2021 
// Design Name: 
// Module Name:    Decodificador 
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
module Decodificador( instr, clock, R1, R2, W1, opcode, funct3, funct7 );

    input [31:0] instr;
    input clock;
	 
    output reg [4:0]R1;
    output reg [4:0]R2;
    output reg [4:0]W1;
	 output reg [6:0]opcode;
	 output reg [2:0]funct3;
	 output reg [6:0]funct7;
	 
	 //Toma la instruccion y le asigna los valores a R1, R2, W1 opcode, funct3 y funct7
	 
	 
	 always@(posedge clock) begin
		R1 = instr[19:15];
		R2 = instr[24:20];
		W1 = instr[11:7];
		funct3 = instr[14:12];
		funct7 = instr[31:25];
		opcode = instr[6:0];
	 end
	 
endmodule
