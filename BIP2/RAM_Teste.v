`timescale 10 ns / 10 ns

module RAM_Teste;

//Inputs
reg WR_i;
reg [10:0] ADDR_dm_i;
reg [10:0] IN_DATA_i;

//Outputs
wire [10:0] OUT_DATA_o;

RAM DUT(WR_i, ADDR_dm_i, IN_DATA_i,OUT_DATA_o);
initial
	begin

	WR_i = 1'b0; ADDR_dm_i = 11'b0; IN_DATA_i = 11'b0;
	
	#10 ADDR_dm_i = 11'b1; // Atualize saída para 701

	#10 WR_i = 1'b1; // Posição 1 da memória recebe 0
 
	#10 WR_i = 1'b0; //Atualizar saída
	
	#10 WR_i = 1'b1; IN_DATA_i = 11'b10; // Posição 1 da memória recebe 2 E Atualiza saída 2

	#10 WR_i = 1'b0; //Atualizar saída
	
	#10 ADDR_dm_i = 11'b11; //Atualiza saída para 11
	
	end
endmodule 