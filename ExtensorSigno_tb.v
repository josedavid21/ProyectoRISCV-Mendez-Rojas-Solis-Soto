`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:18:15 01/22/2021
// Design Name:   ExtensorSigno
// Module Name:   C:/Xilinx/ProyectoMicros/ExtensorSigno_tb.v
// Project Name:  ProyectoMicros
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ExtensorSigno
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
//Objetivo de la prueba: Verificar el inmediato que genera para cada tipo de instrucción que se le introduzca
//Estímulos: Cada 10 ns se cambiará el valor del tipo de instrucción, por lo que debería cambiar el inmediato generado
//Resultados esperados: Para cada tipo de instrucción, se espera que se genere el inmediato acorde según la tabla referenciada en el informe del proyecto

module ExtensorSigno_tb;

	// Inputs
	reg [31:0] COD;
	reg [3:0] ext_sel;
	reg clock;
	// Outputs
	wire [31:0] IMM;

	// Instantiate the Unit Under Test (UUT)
	ExtensorSigno uut (
		.COD(COD), 
		.ext_sel(ext_sel), 
		.IMM(IMM),
		.clock(clock)
	);
 
	initial begin
		// Initialize Inputs
		COD = 32'b1000111111111111111111111111111;
		ext_sel = 0;
		clock =0;
		#10;
      ext_sel = 1; 
		#10;
		ext_sel = 2;
		#10;
		ext_sel = 3;
		#10;
		ext_sel = 4;
		#10;
		ext_sel = 5; 
		#10;
		ext_sel = 4'b1110;

	end
always #5 clock = ~clock;
endmodule

