`timescale 10 ns / 10 ns

module decoderTeste;

//Inputs
reg clock_i;
reg [4:0] Opcode_i;
reg n_i;
reg z_i;

//Outputs
wire Branch_o;
wire Wrpc_o;
wire [1:0] SelA_o;
wire SelB_o;
wire Wracc_o;
wire Op_o;
wire Wrram_o;

decoder DUT(clock_i, Opcode_i, n_i, z_i, Branch_o, Wrpc_o, SelA_o, SelB_o, Wracc_o, Op_o, Wrram_o);
initial
	begin

	clock_i = 1'b0;
	Opcode_i [4:0] = 5'b0000;
	n_i = 1'b0;
	z_i = 1'b0;

	#10 clock_i = 1'b1; //Testa HLT: Espera-se que todos as saídas se mantenham 
	
	#10 Opcode_i = 5'b00001; clock_i = 1'b0;
	
	#10 clock_i = 1'b1;//Testa STO  
	
	#10 Opcode_i = 5'b00010; clock_i = 1'b0;
	
	#10 clock_i = 1'b1;//Testa LD
	
	#10 Opcode_i = 5'b00011; clock_i = 1'b0;
	
	#10 clock_i = 1'b1;//Testa LDI
	
	#10 Opcode_i = 5'b00100; clock_i = 1'b0;
	
	#10 clock_i = 1'b1;//Testa ADD
	
	#10 Opcode_i = 5'b00101; clock_i = 1'b0;
	
	#10 clock_i = 1'b1;//Testa ADDI
	
	#10 Opcode_i = 5'b00110; clock_i = 1'b0;
	
	#10 clock_i = 1'b1;//Testa SUB
	
	#10 Opcode_i = 5'b00111; clock_i = 1'b0;
	
	#10 clock_i = 1'b1;//Testa SUBI
	
	//Teste operações de desvio
	
	#10 Opcode_i = 5'b01000; z_i = 1'b1; clock_i = 1'b0;
	
	#10 clock_i = 1'b1;//Testa BEQ
	
	#10 Opcode_i = 5'b01001; z_i = 1'b0; clock_i = 1'b0;
	
	#10 clock_i = 1'b1;//Testa BNE
	
	#10 Opcode_i = 5'b01010; clock_i = 1'b0;
	
	#10 clock_i = 1'b1;//Testa BGT
	
	#10 Opcode_i = 5'b01011; clock_i = 1'b0;
	
	#10 clock_i = 1'b1;//Testa BGE
	
	#10 Opcode_i = 5'b01100; n_i = 1'b1; clock_i = 1'b0;
	
	#10 clock_i = 1'b1;//Testa BLT
	
	#10 Opcode_i = 5'b01101; z_i = 1'b1; n_i = 1'b1; clock_i = 1'b0;
	
	#10 clock_i = 1'b1;//Testa BLE
	
	#10 Opcode_i = 5'b01110; clock_i = 1'b0;
	
	#10 clock_i = 1'b1;//Testa JMP
	
	#10 clock_i= 1'b0; //end
	
	end
endmodule 