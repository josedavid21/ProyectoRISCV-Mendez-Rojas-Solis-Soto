`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:13:41 01/22/2021
// Design Name:   ALU
// Module Name:   C:/Users/adria/OneDrive/Escritorio/RISCV/PROYECTOMICROS/ALU_tb.v
// Project Name:  PROYECTOMICROS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_tb;

	// Inputs
	reg [31:0] alu_in1;
	reg [31:0] alu_in2;
	reg [3:0] alu_sel;
	reg clock;

	// Outputs
	wire [31:0] alu_out;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.alu_in1(alu_in1), 
		.alu_in2(alu_in2), 
		.alu_out(alu_out), 
		.alu_sel(alu_sel), 
		.clock(clock)
	);

	initial begin
		// Segun la entrada alu_sel que viene de la UC se selecciona la operacion en la ALU
		//Se da como entradas In1 y In2 y el tipo de operacion (ale_sel)
		//como salida se debe tener el resultado de la operacion respectiva de In1 y In2
		
		
	/*alu_sel
	suma = 0000						add, addi, lw, sw, sb
	resta = 0001					sub
	and = 0010						andi
	xor = 0011						xori
	sra = 0100						srai
	sll = 0101						slli
	srl = 0110						srli
	bne = 0111						bne
	lui = 1000						lui
	*/
		
		alu_in1 = 12; alu_in2 = 5; 
		alu_sel = 4'b0000; 			//suma = 17
		clock = 0;
		
		#100;

		alu_sel = 4'b0001; #100; 	//resta = 7
		alu_sel = 4'b0010; #100; 	//and = 4
		alu_sel = 4'b0011; #100;	//xor = 9
		alu_sel = 4'b0100; #100;	//sra	= 0
		alu_sel = 4'b0101; #100;	//sll = 384
		alu_sel = 4'b0110; #100; 	//srl = 0
		alu_sel = 4'b0111; #100;	//bne = 1
		alu_sel = 4'b1000; #100;	//lui	=20480		
	

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      always #5 clock = ~clock; 
endmodule

