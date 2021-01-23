`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:52:50 01/21/2021
// Design Name:   recortador_l
// Module Name:   C:/Users/ESTEBAN/Documents/U/sistemas/ise/recortador_tb.v
// Project Name:  projecto_micros
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: recortador_l
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module recortador_tb;

	// Inputs
	reg [31:0] in;
	reg width;

	// Outputs
	wire [31:0] OutRecortador;

	// Instantiate the Unit Under Test (UUT)
	recortador_l uut (
		.in(in), 
		.out(out), 
		.width(width)
	);

	initial begin
		// Initialize Inputs
		in = 0;// valor de input para 
		width = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		in = 136;
	end
      initial forever #100 width = ~width;//valor de ancho requerido para el recortador
		//Se espera ver como en cada cambio de la señal width el valor de la salida del recortador cambia entre 136 )10001000 o 8 1000 para comprobar que el recortador es
		//de dejar pasar la señal o recortarla cuando es debido
endmodule

