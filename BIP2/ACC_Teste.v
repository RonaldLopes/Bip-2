`timescale 10 ns / 10 ns

module ACC_Teste;

//Inputs
reg [10:0] mux3x2_i;
reg clock_i;
reg WrAcc_i;

//Outputs
wire [10:0] Acc_o;//Saída do mux

ACC DUT(mux3x2_i, clock_i, WrAcc_i, Acc_o);
initial
	begin
	
	WrAcc_i = 1'b0;
	clock_i = 1'b0;
	mux3x2_i = 11'b1010;

	#5 clock_i = 1'b1;
	
	#5 WrAcc_i = 1'b1; clock_i = 1'b0;
	
	#5 clock_i = 1'b1;

	#5 mux3x2_i = 11'b1110; clock_i = 1'b0; WrAcc_i = 1'b0;
	
	#5 clock_i = 1'b1;
	
	#5 mux3x2_i = 11'b0;
	
	#5 mux3x2_i = 11'b0;
	
	end
endmodule 