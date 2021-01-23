`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:04:40 01/22/2021 
// Design Name: 
// Module Name:    MAIN2 
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
module MAIN2(rst, CLK, SALIDA);
	 
	input rst;
	input CLK;		
	output reg [31:0]SALIDA;	
	
	wire [31:0]ALUout; 
	wire [31:0]EXTout;
	wire Jsel, JALsel, WSen, Wen, Width;
	wire [11:0]PCADDED;
	wire [11:0] PC;
	wire [31:0]SALIDA_BI,OutRecortador, DATA, OUT1, OUT2,alumuxout, OutMem;
	wire [4:0] R1,R2,W1; 
	wire [6:0]OPCODE, Funct7;
	wire [2:0]Funct3; 
	wire [1:0] REGsel, ALUsrc;
	wire [3:0]EXTsel, ALUsel;
	
Modulo1 Modulo1 (
    .clk(CLK), 
    .rst(rst), 
    .aluout(ALUout), 
    .ext_out(EXTout), 
    .j_sel(Jsel), 
    .jal_sel(JALsel), 
    .pcadded(PCADDED), 
    .pc(PC)
    );
	 
BancoInstrucciones BancoInstrucciones (
    .clk(CLK), 
    .rst(rst), 
    .address(PC), 
    .sal(SALIDA_BI)
    );
	 
Decodificador Decodificador (
    .instr(SALIDA_BI), 
    .clock(CLK), 
    .R1(R1), 
    .R2(R2), 
    .W1(W1), 
    .opcode(OPCODE), 
    .funct3(Funct3), 
    .funct7(Funct7)
    );
	 
UnidadControl UC (
    .opcode(OPCODE), //
    .funct3(Funct3), //
    .funct7(Funct7), //
    .jal_sel(JALsel), //
    .j_sel(Jsel), //
    .reg_sel(REGsel), //
    .ws_en(WSen), //
    .w_en(Wen), //
    .ext_sel(EXTsel), //
    .alu_src(ALUsrc), //
    .alu_sel(ALUsel), //
    .width(Width) //
    );
	 
ExtensorSigno ExtensorSigno (
    .COD(SALIDA_BI), //
    .ext_sel(EXTsel), //
    .IMM(EXTout), //
    .clock(CLK) //
    );

MuxRegSel MuxRegSel (
    .reg_sel(REGsel), //
    .pc(PCADDED), //
    .inf_out(OutRecortador), //
    .aluout(ALUout), //
    .Datos(DATA) //
    );

RegisterFile RegisterFile (
    .rs1(R1), //
    .rs2(R2), //
    .rd(W1), //
    .inf(DATA), //
    .we(Wen), //
    .out1(OUT1), //
    .out2(OUT2), //
    .clock(CLK) //
    );

MuxALUScr MuxALUScr (
    .ext_out(EXTout), //
    .pc(PC), //////////////////
    .out1(OUT2), //
    .alumuxout(alumuxout), 
    .alu_scr(ALUsrc) //
    );

ALU ALU (
    .alu_in1(OUT1), //
    .alu_in2(alumuxout), //
    .alu_out(ALUout), //
    .alu_sel(ALUsel), //
    .clock(CLK) //
    );
	 
memoria memoria (
    .dir(ALUout), //
    .width(Width), //
    .WEn(WSen), //
    .out2(OUT2), //
    .clock(CLK), //
    .OutMem(OutMem)//
    );

recortador_l instance_name (
    .in(OutMem), //
    .OutRecortador(OutRecortador), //
    .width(Width)//
    );
	 
GPIO instance_name (
    .direccion(ALUout), 
    .datos(OUT2), 
    .clk(CLK), 
    .rst(rst), 
    .salida(SALIDA)
    );
endmodule
