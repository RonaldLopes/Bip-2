`timescale 10 ns / 10 ns

module FLAGS_Teste;

//Inputs
reg N_i;
reg Z_i;

//Outputs
wire N_o;
wire Z_o;

FLAGS DUT(N_i, Z_i, N_o, Z_o);
initial
	begin
	
	N_i = 1'b1;
	Z_i = 1'b1;

	#5  Z_i = 1'b0;
	
	#5 N_i = 1'b0; Z_i = 1'b1;
	
	end
endmodule 