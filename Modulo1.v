`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:32:25 01/18/2021 
// Design Name: 
// Module Name:    Modulo1 
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
module Modulo1 #(parameter ROM_WIDTH= 8 , ROM_ADDR_BITS= 11)(

input clk,
input rst,

input [11:0] aluout,
input [11:0] ext_out,
input jal_sel,
input jal_Sel,

output reg[11:0] pcadded,
output reg[11:0] pc


);
    
	 /*Entonces vamos a tener como entrdas de este módulo
	 aluout (puede cambiar por una de igual cantidad de bits pero reacomodada): 32b
	 ext/out (puede ser que cambie): 32b
	 clk (está siempre se quedará, señal de reloj): 1b
	 j_sel (señal de control): 1b
	 jal_Sel (señal control) 1b
	 
	 aluoutbit0: es aluout[0] 
	 */
	 
	 /*Como salidas estarán
	 output reg[11:0] pcadded, que va hacia un mux que decide escritura en registro
	 output reg[11:0] pc, que correspondería al address del banco de instrucciones
	 */
	 
	 reg [11:0] pcout;
	 reg [11:0] pcin;
	 
	 reg [11:0] pcaddedpc;
	 reg [11:0] oper_pc;
	 reg alubit0;
	 
	
	 //Este mux se encargará de seleccionar 4 (para PC+4) o lo que venga del ext/out (resulta imm acomodado) 
	 always@* begin
	 alubit0 = aluout[0];
	 if (jal_Sel&&alubit0) 
	 oper_pc = ext_out;
	 else
	 oper_pc = 4;
	 end
	 
	 	 //Previo a PC se deberá colocar un sumador que realice la operación con PC y el resultado de un mux
	 always@* begin
	 pcaddedpc = pcout+oper_pc;
	 end
	 //Este mux se encargará de seleccionar si la info viene directamente de ALU o de PC+(imm o 4)
	 always@* begin
	 if (jal_sel==0) 
	 pcin= pcaddedpc;
	 else
	 pcin= aluout;
	 end
	 
	 
	 //Primero debo realizar el registro PC, que se encargará de brindar
	 //la dirección de memoria de la siguiente instrucción por realizar
	 always@(posedge clk)begin
	 if (rst==1)
	 pcout=0;
	 else
	 pcout=pcin;
	 end
	 
	 always@(posedge clk)begin
	 pc=pcout;
	 pcadded=pcaddedpc;
	 end
	  
	 //salidas

endmodule	 