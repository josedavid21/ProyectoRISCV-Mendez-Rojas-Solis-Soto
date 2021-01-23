`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:23:54 01/22/2021
// Design Name:   GPIO
// Module Name:   D:/PROYECTO2_MICROS/Modulo1/gpiotb.v
// Project Name:  Modulo1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: GPIO
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module gpiotb;
/*Objetivo: comprobar que efectivamente al pasar dos veces por 0xABCD se 
obtenga en la salida el resultado final

Estímulos: señal de reloj, direccion (para probar que con la direccion 0xABCD se logre la escritura)

Resultados esperados: al completarse el conteo en dos ocasiones cuando la entrada sea 0xABCD el valor
de la salida deberá ser igual a la entrada de datos (que seria la información que llega a memoria en ese
momento, osea, el resultado.
*/
	// Inputs
	reg [31:0] direccion;
	reg [31:0] datos;
	reg clk;
	reg rst;

	// Outputs
	wire [31:0] salida;

	// Instantiate the Unit Under Test (UUT)
	GPIO uut (
		.direccion(direccion), 
		.datos(datos), 
		.clk(clk), 
		.rst(rst), 
		.salida(salida)
	);

	initial begin
		// Initialize Inputs
		direccion = 0;
		datos = 4;
		clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#10;
        
		// Add stimulus here

	end
   always #5 clk=~clk;
	always #20 direccion = 32'hABCD;
	always #60 direccion = 0;
	
endmodule

