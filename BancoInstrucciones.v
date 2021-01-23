`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:47:21 01/18/2021 
// Design Name: 
// Module Name:    BancoInstrucciones 
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
module BancoInstrucciones (
input clk,
input rst,
input [11:0] address,
output reg [31:0] instr

);
	parameter ROM_WIDTH= 32 ;
   parameter	ROM_ADDR_BITS= 12;
   reg [ROM_WIDTH-1:0] rom [(2**ROM_ADDR_BITS)-1:0];


   initial
      $readmemh("C:\\Users\\XPC\\Desktop\\1basicops.txt", rom);

   always @(posedge clk)
      if (!rst)
         instr <= rom[address>>2];
		else
			instr <= 0; 
endmodule
