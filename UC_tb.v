`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:53:35 01/22/2021
// Design Name:   UnidadControl
// Module Name:   C:/Xilinx/ProyectoMicros/UC_tb.v
// Project Name:  ProyectoMicros
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: UnidadControl
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
//Objetivo de la prueba: Verificar wue las salidas correspondan a las entradas según la tabla de verdad realizada
//Estímulos: Cada 100 ns se cambiará el valor del opcode y/o funct3 y funct7 para probar las diferentes instrucciones
//Resultados esperados: Las diferentes señales de control deben coincidir con lo que se puede apreciar en la tabla de verdad

module UC_tb;

	// Inputs
	reg [6:0] opcode;
	reg [2:0] funct3;
	reg [6:0] funct7;


	// Outputs
	wire jal_sel;
	wire j_sel;
	wire [1:0] reg_sel;
	wire ws_en;
	wire w_en;
	wire [3:0] ext_sel;
	wire [1:0] alu_src;
	wire [3:0] alu_sel;
	wire width;

	// Instantiate the Unit Under Test (UUT)
	UnidadControl uut (
		.opcode(opcode), 
		.funct3(funct3), 
		.funct7(funct7), 
		.jal_sel(jal_sel), 
		.j_sel(j_sel), 
		.reg_sel(reg_sel), 
		.ws_en(ws_en), 
		.w_en(w_en), 
		.ext_sel(ext_sel), 
		.alu_src(alu_src), 
		.alu_sel(alu_sel), 
		.width(width)
	
	);

	initial begin
		// Initialize Inputs
		opcode = 0;
		funct7 = 0;
		funct3 = 0;

		// Wait 100 ns for global reset to finish
		
		//LW
		#100;
		opcode = 7'b0000011;
		funct7 = 7'b0100000;
		funct3 = 3'b010;
		
		
		//LBU 
		#100;
		funct3 = 3'b100;
		
		//JALR
		#100;
		opcode = 7'b1100111;
		funct7 = 7'b0100000;
		funct3 = 3'b000;
		
		//JAL
		#100;
		opcode = 7'b1101111;
		funct7 = 7'b0100000;
		funct3 = 3'b000;
		
		//ADD
		#100;
		opcode = 7'b0110011;
		funct7 = 7'b0000000;
		funct3 = 3'b000;
		
		//SUB
		#100
		opcode = 7'b0110011;
		funct7 = 7'b0100000;
		funct3 = 3'b000;
		
		
		//BNE
		#100
		opcode = 7'b1100011;
		funct7 = 7'b0000000;
		funct3 = 3'b001;
		
		
		//LUI
		#100
		opcode = 7'b0110111;
		funct7 = 7'b0000000;
		funct3 = 3'b001;
		
        
		// Add stimulus here

	end
      
endmodule

