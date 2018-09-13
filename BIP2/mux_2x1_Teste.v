`timescale 10 ns / 10 ns

module mux_2x1_Teste;

//Inputs
reg [10:0] incrementer_i;
reg [10:0] ext_i;
reg branch_i;

//Outputs
wire [10:0] pc_o;//Saída do mux

mux_2x1 DUT(incrementer_i, branch_i, ext_i, pc_o);
initial
	begin
	
	incrementer_i = 11'b1001;
	ext_i = 11'b1000;
	branch_i = 1'b0;

	#10 branch_i = 1'b1; // Saída = 8 = 1000
	
	#10 incrementer_i = 11'b1001; // Saída = 8 = 1000
	
	#10 branch_i = 1'b0; //Saída = 9 = 1001 
	
	#10 incrementer_i = 11'b1011; //Saída = 11 = 1011
	
	#10 ext_i = 11'b1110; // Saída = 11 = 1011
	
	#10 branch_i = 1'b1;  // Saída = 14 = 1110
	
	#10 ext_i = 11'b0001; // Saída = 1 = 0001
	
	#10 ext_i = 11'b0001; // Saída = 1 = 0001
	
	end
endmodule 