`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:04:21 01/22/2021
// Design Name:   Decodificador
// Module Name:   C:/Xilinx/ProyectoMicros/Decodificador_tb.v
// Project Name:  ProyectoMicros
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Decodificador
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Decodificador_tb;

	// Inputs
	reg [31:0] instr;
	reg clock;

	// Outputs
	wire [4:0] R1;
	wire [4:0] R2;
	wire [4:0] W1;
	wire [6:0] opcode;
	wire [2:0] funct3;
	wire [6:0] funct7;

	// Instantiate the Unit Under Test (UUT)
	Decodificador uut (
		.instr(instr), 
		.clock(clock), 
		.R1(R1), 
		.R2(R2), 
		.W1(W1), 
		.opcode(opcode), 
		.funct3(funct3), 
		.funct7(funct7)
	);

	initial begin
		// Initialize Inputs
		instr = 0;
		clock = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		//Objetivo: probar que se da correctamente la decodificacion de la instruccion
		// con los bits correspondientes para opcode, funct3 y funct 7
		//como entrada se da la instruccion fd010113 = 11111101000000010000000100010011
		// como salida deberia dar
		//opcode= 0010011
		//funct3=000
		//funct7=1111110
		
		instr = 32'b11111101000000010000000100010011;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
       always #5 clock = ~clock;
endmodule

