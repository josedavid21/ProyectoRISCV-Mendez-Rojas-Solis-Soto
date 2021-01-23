`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:56:52 01/18/2021 
// Design Name: 
// Module Name:    ALU 
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
module ALU( alu_in1, alu_in2, alu_out, alu_sel, clock );


	input [31:0]alu_in1, alu_in2;
	input [3:0]alu_sel;
	input clock;
	
	output [31:0]alu_out;
	reg [31:0]alu_out;
	
	reg [31:0]A;
	reg [31:0]B;
	
	always@(alu_sel, alu_in1, alu_in2)
	begin
	
	//alu_sel
	//suma = 0000						add, addi, lw, sw, sb
	//resta = 0001						sub
	//and = 0010						andi
	//xor = 0011						xori
	//sra = 0100						srai
	//sll = 0101						slli
	//srl = 0110						srli
	//bne = 0111						bne
	//lui = 1000						lui
	
	case(alu_sel)
	
	4'b0000: alu_out = alu_in1 + alu_in2;				//suma
	4'b0001: alu_out = alu_in1 - alu_in2;				//resta
	4'b0010: alu_out = alu_in1 & alu_in2;				//and
	4'b0011: alu_out = alu_in1 ^ alu_in2;				//xor
	
	4'b0100: begin
	A = alu_in1 & 5'b10000;									//sra			
	B = alu_in1 >>> alu_in2[4:0];							
	alu_out = A + B;
	end
	
	4'b0101: alu_out = alu_in1 << alu_in2[4:0];		//sll
	4'b0110: alu_out = alu_in1 >> alu_in2[4:0];		//srl
	4'b0111: alu_out = alu_in1 != alu_in2;				//bne
	4'b1000: alu_out = alu_in2  << 12;					//lui
	
	default: begin
	alu_out = alu_in1 + alu_in2;							//Cualquier otro valor de alu_sel ALU= suma
	end

	endcase
	
	end

endmodule
