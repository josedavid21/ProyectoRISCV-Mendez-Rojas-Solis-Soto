`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:03:56 01/18/2021
// Design Name:   BancoInstrucciones
// Module Name:   D:/PROYECTO2_MICROS/Modulo1/tbbi.v
// Project Name:  Modulo1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: BancoInstrucciones
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tbbi;
/*Objetivo: comprobar que se está realizando la lectura de la instrucción almacenada en memoria

Estímulos: señal de reloj, direccion (dirección de memoria) se le aplica una suma de 4 para simular PC+4

Resultados esperados: se espera ver progresivamente cada instrucción (PC+4)
*/
	// Inputs
	reg clk;
	reg rst;
	reg [11:0] address;

	// Outputs
	wire [31:0] instr;

	// Instantiate the Unit Under Test (UUT)
	BancoInstrucciones uut (
		.clk(clk), 
		.rst(rst), 
		.address(address), 
		.instr(instr)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		address = 0;

		// Wait 100 ns for global reset to finish
		#100;
		// Add stimulus here

	end
	
	always #10 clk=~clk;
	always #40 address= address+4;
	
endmodule

