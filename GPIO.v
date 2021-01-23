`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:12:53 01/22/2021 
// Design Name: 
// Module Name:    GPIO 
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
module GPIO(

input[31:0] direccion, //Dirección que se usará para elevar contador cuando esta sea 0xABCD
input[31:0] datos, //datos de entrada en GPIO
input clk, //señal de reloj
input rst, //señal de rst
output reg [31:0] salida //datos de salida en GPIO
    );

reg [1:0] counter; //contador, inicializado en 0
initial
counter<=0;

/*El siguiente bloque se encarga de determinar si la dirección
de entrada es 0xABCD, en caso de serlo, procede a elevar el contador(planteado así
pues en los dump se aprecia que la segunda vez que se apunta a esta dirección finaliza
código de interés)*/

always@(posedge clk)begin
if (direccion== 32'hABCD)
counter<= counter+1; //aumenta contador
else if (rst)
counter<=0;
end


/*En caso de ser ocurrir la coincidencia*/
always@(posedge clk)begin
if (counter==2)
salida<=datos;
else 
salida <=0;
end

endmodule
