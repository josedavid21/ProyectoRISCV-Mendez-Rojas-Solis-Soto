`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:43:24 01/18/2021 
// Design Name: 
// Module Name:    ExtensorSigno 
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
module ExtensorSigno( COD, ext_sel, IMM, clock
    );
	 input [3:0] ext_sel; 							//Señal de 4 bits de la UC
	 input[31:0] COD; 								//Código que recibe
	 input clock;
	 
	 wire Type = ext_sel[2:0];
	 wire JALR = ext_sel[3];						//primer bit indica si es JALR, los demás el tipo de instruccion
	 
	 output reg[31:0]IMM; //Salida del ExtensorSigno
	 
	 always @(Type,JALR)
	 //Type0 = R Type
	 //Type1 = I Type
	 //Type2 = S Type
	 //Type3 = B Type
	 //Type4 = J Type
	 //Type5 = U Type
      if(Type==0) begin
			IMM <= 32'd0;
			end
		else if(Type==1) begin
			IMM <= 32'd0;
			IMM[11:0] <= COD[31:20];
			end
		else if(Type==2) begin
			IMM <= 32'd0;
			IMM[4:0] <= COD[11:7];
			IMM[11:5] <= COD[31:25];
			end
		else if(Type==3) begin
			IMM <= 32'd0;
			IMM[4:1] <= COD[11:8];
			IMM[10:5] <= COD[30:25];
			IMM[11] <= COD[7];
			IMM[12] <= COD[31];
			end
		else if(Type==4) begin
			IMM <= 32'd0;
			if (JALR) begin
				IMM[11:0] <= COD[31:20];
				end
			else begin
				IMM[20] <= COD[31];
				IMM[10:1] <= COD[30:21];
				IMM[11] <= COD[20];
				IMM[19:12] <= COD[19:12];
				end
			end
		else if(Type==5) begin
			IMM <= 32'd0;
			IMM[31:12] <= COD[31:12];
			end 
		else begin								//Si el Type no es de un tipo soportada, las señales de lel Imm extendido como tipo R
			IMM <= 32'd0;
			end


endmodule
