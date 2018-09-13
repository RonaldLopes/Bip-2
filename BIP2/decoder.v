`timescale 10 ns / 10 ns
module decoder
#(
	parameter OPCODE_WIDTH = 5,
	parameter LSB = 0
)
(
	reset_i,
	clock_i, //clock
	Opcode_i, //Código de instrução
	n_i, //flag negativa
	z_i, //flag zero
	
	Branch_o, //Seletor para o PC
	Wrpc_o, //Habilita escrita no PC
	SelA_o, //Seleciona qual valor vai para o Acumulador
	SelB_o, //Seleciona qual valor vai para a 2ª entrada da ULA
	Wracc_o, //Habilita a escrita no Acumulador
	Op_o, //Código para a ULA
	Wrram_o,
	reset_pc_o
);

//Entradas e Saídas
input wire reset_i;
input wire clock_i;
input wire [(OPCODE_WIDTH-1):LSB] Opcode_i;
input wire n_i;
input wire z_i;

output reg Branch_o;
output reg Wrpc_o;
output reg [1:0] SelA_o;
output reg SelB_o;
output reg Wracc_o;
output reg Op_o; // 0 = soma e 1 = subtração
output reg Wrram_o; 
output reg reset_pc_o;

//Registradores de estado
reg [1:0] ESTADOATUAL;
reg [1:0] PROXIMOESTADO;
//Registradores de flag
reg FN_Anterior; //Guarda valor da flag N após execucao de 1 instrucao
reg FZ_Anterior; //Guarda valor da flag Z após execucao de 1 instrucao

//lista de estados do decodificador
localparam BUSCA = 2'b00, DECODIFICACAO = 2'b01, EXECUCAO = 2'b10, RESET = 2'b11;

//lista de OpCodes
localparam HLT = 5'b00000,
			  STO = 5'b00001, //DONE
			  LD = 5'b00010, //DONE
			  LDI = 5'b00011, //DONE
			  ADD = 5'b00100, //DONE
			  ADDI = 5'b00101, //DONE
			  SUB = 5'b00110, //DONE
			  SUBI = 5'b00111, //DONE
			  BEQ = 5'b01000, //DONE
			  BNE = 5'b01001, //DONE
			  BGT = 5'b01010, //DONE
			  BGE = 5'b01011, //DONE
			  BLT = 5'b01100, //DONE
			  BLE = 5'b01101, //DONE
			  JMP = 5'b01110; //dONE
			  
//Inicializações da saidaS e do estado inicial
initial
begin
	Branch_o = 1'b0;
	Wrpc_o = 1'b0;
	SelA_o = 2'b0;
	SelB_o = 1'b0;
	Wracc_o = 1'b0;
	Op_o = 1'b0; // 0 = soma e 1 = subtração
	Wrram_o = 1'b0; 
	reset_pc_o = 1'b0;
	ESTADOATUAL = BUSCA;
	PROXIMOESTADO = DECODIFICACAO;
end

always @(clock_i)
begin

	if(clock_i == 1'b1) //SUBIDA DE CLOCK
	
	begin
		case(ESTADOATUAL)
		
		BUSCA://1
		begin
				PROXIMOESTADO = DECODIFICACAO;
				$display("Um");
		end
		
		DECODIFICACAO://3
		begin
			case (Opcode_i)
			HLT:
			begin
				PROXIMOESTADO = RESET;
			end
			STO: PROXIMOESTADO = EXECUCAO;
			LDI:
			begin
				SelA_o = 2'b1;//(Colocando o operando para ser a entrada do ACC)
				PROXIMOESTADO = EXECUCAO;
			end
			LD: 
			begin
				SelA_o = 2'b0;//(Colocando o conteudo de MEM[operando] na entrada do ACC)
				PROXIMOESTADO = EXECUCAO;
			end
			ADD: 
			begin
				SelB_o = 1'b0;//(Colocando o conteudo de MEM[operando] na 2ª entrada da ULA)
				Op_o = 1'b0;//Soma 
				SelA_o = 2'b10;//Preparando para o ACC receber da saida da ULA
				PROXIMOESTADO = EXECUCAO;
			end
			ADDI:
			begin
				SelB_o = 1'b1;//(Colocando o conteudo de operando na 2ª entrada da ULA)
				Op_o = 1'b0;//Soma 
				SelA_o = 2'b10;//Preparando para o ACC receber da saida da ULA
				PROXIMOESTADO = EXECUCAO;
			end
			SUB: 
			begin
				SelB_o = 1'b0;//(Colocando o conteudo de MEM[operando] na 2ª entrada da ULA)
				Op_o = 1'b1;//Subtracao 
				SelA_o = 2'b10;//Preparando para o ACC receber da saida da ULA
				PROXIMOESTADO = EXECUCAO;
			end
			SUBI:
			begin
				SelB_o = 1'b1;//(Colocando o conteudo de operando na 2ª entrada da ULA)
				Op_o = 1'b1;//Soma 
				SelA_o = 2'b10;//Preparando para o ACC receber da saida da ULA
				PROXIMOESTADO = EXECUCAO;
			end
			BEQ://Branch se forem iguais 
			begin
				if(FZ_Anterior == 1'b1)//Se flag Z levantada 
					Branch_o = 1'b1;
				ESTADOATUAL = EXECUCAO;
				PROXIMOESTADO = BUSCA;
			end
			BNE://Branch se forem direfentes
			begin
				if(FZ_Anterior == 1'b0)//Se flag Z baixada
					Branch_o = 1'b1;
				ESTADOATUAL = EXECUCAO;
				PROXIMOESTADO = BUSCA;
			end
			BGT://Branch se for positivo
			begin
				if(FZ_Anterior == 1'b0 && FN_Anterior == 1'b0)
					Branch_o = 1'b1;
				ESTADOATUAL = EXECUCAO;
				PROXIMOESTADO = BUSCA;
			end
			BGE://Branch se for positivo ou igual a zero
			begin
				if(FN_Anterior == 1'b0)
					Branch_o = 1'b1;
				ESTADOATUAL = EXECUCAO;
				PROXIMOESTADO = BUSCA;
			end
			BLT://Branch se for negativo
			begin
				if(FN_Anterior == 1'b1)
					Branch_o = 1'b1;
				ESTADOATUAL = EXECUCAO;
				PROXIMOESTADO = BUSCA;
			end
			BLE://Branch se for negativo ou igual a zero
			begin
				if(FZ_Anterior == 1'b1 || FN_Anterior == 1'b1)
					Branch_o = 1'b1;
				ESTADOATUAL = EXECUCAO;
				PROXIMOESTADO = BUSCA;
			end
			JMP://Branch
			begin
				Branch_o = 1'b1;
				ESTADOATUAL = EXECUCAO;
				PROXIMOESTADO = BUSCA;
			end
			endcase
			reset_pc_o = 1'b0;//Liberta o PC
			$display("Tres", Opcode_i);
		end
		
		EXECUCAO://5
		begin
				PROXIMOESTADO = BUSCA;
				$display("Cinco");
		end
		
		RESET://7
		begin
			if(reset_i == 1'b1)
			begin
				reset_pc_o = 1'b1;
				ESTADOATUAL = BUSCA;
				PROXIMOESTADO = DECODIFICACAO;
			end
			$display("Sete");
		end
		
		endcase
	end
	
	else if(clock_i == 1'b0)//DESCIDA DE CLOCK
	
	begin
		case(ESTADOATUAL)
		
			BUSCA://2
			begin
				Wrpc_o = 1'b0;//Reseta a escrita no PC
				Branch_o = 1'b0;//Caso a instrucao anterior seja branch
				$display("Dois");
			end
			
			DECODIFICACAO://4
			begin
				case (Opcode_i)
					LDI: Wracc_o = 1'b1; //(Escreve na saída do ACC na prox subida)
					LD: Wracc_o = 1'b1;
					STO: Wrram_o = 1'b1;// (Escreva na memória) 
					ADD: Wracc_o = 1'b1;
					ADDI: Wracc_o = 1'b1;
					SUB: Wracc_o = 1'b1;
					SUBI: Wracc_o = 1'b1;
				endcase
				FN_Anterior = n_i;//Armazena os valores da flag antes q ACC seja sobrescrito
				FZ_Anterior = z_i;
				$display("Quatro");
			end
			
			EXECUCAO://6
			begin
				Wracc_o = 1'b0;// Resetando os valores para que não haja escritas
				Wrram_o = 1'b0;
				Wrpc_o = 1'b1; //Preparando para incrementar o PC
				$display("Seis");
			end
			
		endcase
		ESTADOATUAL = PROXIMOESTADO; //Atualiza estado
	end
	
end

endmodule
