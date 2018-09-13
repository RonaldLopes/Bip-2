`timescale 10 ns / 10 ns

module PC_Teste;

//Inputs
reg enable_i;
reg clock_i;
reg [10:0] mux_i;

//Outputs
wire [10:0] pc_o;//Saída do mux

PC DUT(enable_i, clock_i, mux_i, pc_o);
initial
	begin
	
	enable_i = 1'b0;
	clock_i = 1'b0;
	mux_i = 11'b1010;

	#5 clock_i = 1'b1;
	
	#5 enable_i = 1'b1; clock_i = 1'b0;
	
	#5 clock_i = 1'b1;

	#5 mux_i = 11'b1110; clock_i = 1'b0; enable_i = 1'b0;
	
	#5 clock_i = 1'b1;
	
	#5 mux_i = 11'b0;
	
	#5 mux_i = 11'b0;
	
	end
endmodule 