`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:12:57 01/21/2021
// Design Name:   memoria
// Module Name:   C:/Users/ESTEBAN/Documents/U/sistemas/ise/memoria_tb.v
// Project Name:  projecto_micros
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: memoria
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module memoria_tb;

	// Inputs
	reg [31:0] dir;
	reg width;
	reg WEn;
	reg [31:0] Out2;
	reg clock;

	// Outputs
	wire [31:0] Out;

	// Instantiate the Unit Under Test (UUT)
	memoria uut (
		.dir(dir), 
		.width(width), 
		.WEn(WEn), 
		.in(in), 
		.clock(clock), 
		.Out(Out)
	);

	initial begin
		// Initialize Inputs
		dir = 0;
		width = 0;
		WEn = 1;
		Out2 = 0;
		clock = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		Out2 = 136; // valor en binario 10001000 para verificacion
		dir = 8;
		
		df= $fopen("dump.txt","w");
		$fwrite(df,"Dirección de Memoria| Valor en hexadecimal\n");
		for(i=0; i<(11040); i=i+1)begin
		$fwrite(df,"___________________|______________________\n");
		$fwrite(df,"0x%h            | 0x%h\n",i*4,uut.DMem.Memoria[i]);
   end
		
	end
	
   initial forever #10 clock = ~clock;//reloj para escritura
	initial forever #100 WEn = ~WEn; //enciende o apaga la posibilidad de sobreescribir
	initial forever #200 width = ~width;// alterna el valor width para cambiar entre si se desea guardar la palabra entera o solo el primer byte
	//se espera ver como en cada iteración del clock el valor de la direccion 8 en memoria cambia entre 136 o 8 dependiendo del valor actual de width, 
	//tambien se espera ver que el valor de salida refleje siempre lo que se encuentra almacenado en el espacio 8
	
	
endmodule

