`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:53:28 01/20/2021 
// Design Name: 
// Module Name:    RegisterFile 
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
module RegisterFile( rs1, rs2, rd, inf, we, out1, out2, clock
    );
input[4:0] rs1, rs2; 					//Número de registro a leer (5 bits porque son 32 registros)
input[4:0] rd; 							//Número de registro al que se va a escribir algo
input we; 									//write enable, habilita la escritura en un registro
input[31:0] inf; 							//Datos para guardar en W1
input clock;
output reg[31:0] out1, out2; 			//Salidas para R1 y R2 respectivamente

reg [31:0] rf[31:0]; 					//Un array de 32 registros de 32 bits

always@(posedge clock) begin 			//Se activa cada ciclo de reloj 

	if(we)	rf[rd]<= inf;				// Revisa si está habilitada la escritura y guarda datos de D1 en W1		
	out1 <= rf[rs1];					//Guarda datos de R1 en Out1
	out2 <= rf[rs2];					//Guarda datos de R2 en Out2
end
endmodule
