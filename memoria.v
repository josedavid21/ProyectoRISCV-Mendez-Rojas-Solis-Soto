`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:20:20 01/20/2021 
// Design Name: 
// Module Name:    memoria 
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
module memoria( dir, width, WEn, out2, clock, OutMem);
	 
input[31:0] dir; 								//Número de registro a leer o escribir   ALUout
input width; 									//indica el ancho de palabra que se desea cargar o guardar
input WEn; 										//write enable, habilita la escritura en un registro
input[31:0] out2; 							//Datos para guardar en memoria
input clock;

output reg[31:0] OutMem; 					//out de informacion para load

reg [7:0] d[100:0]; 							// espacios de memoria = 2^xelen
reg [31:0] cd;


always@(posedge clock) begin
	if (WEn) begin
		cd <= dir;
		if (width) d[dir[7:0]] <= out2[7:0];
		else begin
			d[cd] <= out2[7:0];
			d[cd+1] <= out2[15:8];
			d[cd+2] <= out2[23:16];
			d[cd+3] <= out2[31:24];
		end
	end
	
end
always OutMem <= d[dir];

endmodule
