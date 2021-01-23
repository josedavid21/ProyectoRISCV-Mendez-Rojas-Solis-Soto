`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:25:29 01/21/2021 
// Design Name: 
// Module Name:    UnidadControl 
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
module UnidadControl( opcode, funct3, funct7, jal_sel, j_sel, reg_sel, ws_en, w_en, ext_sel,
 alu_src, alu_sel, width
    );
input [6:0] opcode;
input [2:0] funct3;
input [6:0] funct7;

output reg [1:0] alu_src;
output reg jal_sel, j_sel, ws_en, w_en,  width;
output reg [1:0] reg_sel;
output reg [3:0] ext_sel, alu_sel;

//opcode: 0110011 tipo R
//opcode: 0010011 tipo I
//opcode: 0000011 tipo I (load)
//opcode: 0100011 tipo S
//opcode: 1100011 tipo B
//opcode: 1100111 Jalr
//opcode: 1101111 Jal
//opcode: 0110111 tipo U 


always @*
	case(opcode)
	
	7'b0110011: begin//tipo R
	if(funct7==0000000) begin //add
			jal_sel <= 0;
			j_sel <= 0;
			ws_en <= 0;
			w_en <= 1;
			ext_sel <= 4'b0000;
			alu_src <= 2'b00;
			width <= 0;
			reg_sel <= 2'b10;
			alu_sel <= 4'b0000;
		end
	else if (funct7==0100000) begin//sub
			jal_sel <= 0;
			j_sel <= 0;
			ws_en <= 0;
			w_en <= 1;
			ext_sel <= 4'b0000;
			alu_src <= 2'b00;
			width <= 0;
			reg_sel <= 2'b10;
			alu_sel <= 4'b0001;
		end
	end
	7'b0010011: begin //Tipo I
//funct3: 000 Addi
//funct3: 100 XOri
//funct3: 111 ANDi
//funct3: 001 SLLi
//funct3: 101 SRAi o SLRi
//funct7: 0100000 SRAi
//funct7: 0000000 SLRi, en el resto el funct7 es don't care
if(funct3==000) begin //Addi
			jal_sel <= 0;
			j_sel <= 0;
			ws_en <= 0;
			w_en <= 1;
			ext_sel <= 4'b0001;
			alu_src <= 2'b01;
			width <= 0;
			reg_sel <= 2'b10;
			alu_sel <= 4'b0000;
	end
	else if(funct3==100) begin //XORi
			jal_sel <= 0;
			j_sel <= 0;
			ws_en <= 0;
			w_en <= 1;
			ext_sel <= 4'b0001;
			alu_src <= 2'b01;
			width <= 0;
			reg_sel <= 2'b10;
			alu_sel <= 4'b0011;
	end
	else if(funct3==111) begin //ANDi
			jal_sel <= 0;
			j_sel <= 0;
			ws_en <= 0;
			w_en <= 1;
			ext_sel <= 4'b0001;
			alu_src <= 2'b01;
			width <= 0;
			reg_sel <= 2'b10;
			alu_sel <= 4'b0010;
	end
	else if(funct3==001) begin //SLLi
			jal_sel <= 0;
			j_sel <= 0;
			ws_en <= 0;
			w_en <= 1;
			ext_sel <= 4'b0001;
			alu_src <= 2'b01;
			width <= 0;
			reg_sel <= 2'b10;
			alu_sel <= 4'b0101;
	end
	else if(funct3==101) begin
			if(funct7==0100000)begin//SRAi
				jal_sel <= 0;
				j_sel <= 0;
				ws_en <= 0;
				w_en <= 1;
				ext_sel <= 4'b0001;
				alu_src <= 2'b01;
				width <= 0;
				reg_sel <= 2'b10;
				alu_sel <= 4'b0100;
			end
			else if(funct7==0000000)begin //SLRi
				jal_sel <= 0;
				j_sel <= 0;
				ws_en <= 0;
				w_en <= 1;
				ext_sel <= 4'b0001;
				alu_src <= 2'b01;
				width <= 0;
				reg_sel <= 2'b10;
				alu_sel <= 4'b0110;
			end
	end
end
	7'b0000011: begin//Tipo i (load)
	//funct3: 100 LBU
//funct3: 010 LW

	if(funct3==100) begin //LBU
				jal_sel <= 0;
				j_sel <= 0;
				ws_en <= 0;
				w_en <= 1;
				ext_sel <= 4'b0001;
				alu_src <= 2'b01;
				width <= 1;
				reg_sel <= 2'b01;
				alu_sel <= 4'b0000;
	end
	else if(funct3==010) begin //LW
				jal_sel <= 0;
				j_sel <= 0;
				ws_en <= 0;
				w_en <= 1;
				ext_sel <= 4'b0001;
				alu_src <= 2'b01;
				width <= 0;
				reg_sel <= 2'b01;
				alu_sel <= 4'b0000;
	end
	
	end
	7'b0100011: //tipo S
	//funct3: 010 SW
	//funct3: 000 SB

	if(funct3==010) begin //SW
		jal_sel <= 0;
		j_sel <= 0;
		ws_en <= 1;
		w_en <= 0;
		ext_sel <= 4'b0010;
		alu_src <= 2'b01;
		width <= 0;
		reg_sel <= 2'b00;
		alu_sel <= 4'b0000;
	end
	else if(funct3==000) begin //SB
		jal_sel <= 0;
		j_sel <= 0;
		ws_en <= 1;
		w_en <= 0;
		ext_sel <= 4'b0010;
		alu_src <= 2'b01;
		width <= 1;
		reg_sel <= 00;
		alu_sel <= 4'b0000;
	end
7'b1100011:begin//Bne
		jal_sel <= 1;
		j_sel <= 0;
		ws_en <= 0;
		w_en <= 0;
		ext_sel <=4'b0011 ;
		alu_src <=2'b00 ;
		width <= 0;
		reg_sel <=2'b00 ;
		alu_sel <=4'b0111 ;

end

7'b1100111: begin//Jalr
		jal_sel <= 0;
		j_sel <= 1;
		ws_en <= 0;
		w_en <= 1;
		ext_sel <=4'b1100 ;
		alu_src <=2'b01 ;
		width <= 0;
		reg_sel <=2'b11 ;
		alu_sel <=4'b0000 ;
end

7'b1101111: begin//Jal
		jal_sel <= 0;
		j_sel <= 1;
		ws_en <= 0;
		w_en <= 1;
		ext_sel <=4'b0100 ;
		alu_src <=2'b10 ;
		width <= 0;
		reg_sel <=2'b11 ;
		alu_sel <=4'b0000 ;
end


7'b0110111: begin //LUI
		jal_sel <= 0;
		j_sel <= 0;
		ws_en <= 0;
		w_en <= 1;
		ext_sel <=4'b0101 ;
		alu_src <=2'b01 ;
		width <= 0;
		reg_sel <=2'b10 ;
		alu_sel <=4'b1000 ;
end
	

endcase

endmodule