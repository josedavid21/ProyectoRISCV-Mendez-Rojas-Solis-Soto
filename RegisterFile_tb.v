`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:30:16 01/22/2021
// Design Name:   RegisterFile
// Module Name:   C:/Xilinx/ProyectoMicros/RegisterFile_tb.v
// Project Name:  ProyectoMicros
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RegisterFile
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
//Objetivo de la prueba: Verificar la capacidad de cargar y guardar datos en registros
//Estímulos: Cada 10 ns se cambiará el valor de las distintas entradas con el fin de revisar si la salida coincide con lo esperado
//Resultados esperados: El Out1 y Out 2 deberían de tener el valor dado a rd

module RegisterFile_tb;

	// Inputs
	reg [4:0] rs1;
	reg [4:0] rs2;
	reg [4:0] rd;
	reg [31:0] inf;
	reg we;
	reg clock;

	// Outputs
	wire [31:0] out1;
	wire [31:0] out2;

	// Instantiate the Unit Under Test (UUT)
	RegisterFile uut (
		.rs1(rs1), 
		.rs2(rs2), 
		.rd(rd), 
		.inf(inf), 
		.we(we), 
		.out1(out1), 
		.out2(out2), 
		.clock(clock)
	);

	initial begin
		// Initialize Inputs
		rs1 = 0;
		rs2 = 0;
		rd = 0;
		inf = 3;
		we = 0;
		clock = 0;

		#10;
      rs1 = 2;
		rs2 = 4;
		we = 1;
		rd = 2;
		#20;
		rd = 4;

	end
      always #5 clock = ~clock;

      
endmodule

