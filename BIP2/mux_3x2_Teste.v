`timescale 10 ns / 10 ns

module mux_3x2_Teste;

//Inputs
reg [10:0] out_data_i;
reg [10:0] ext_i;
reg [10:0] ula_i;
reg [1:0] SelA_i;

//Outputs
wire [10:0] mux_3x2_o;//Saída do mux

mux_3x2 DUT(out_data_i,ext_i, ula_i, SelA_i, mux_3x2_o);
initial
	begin
		out_data_i = 11'b1;
		ext_i = 11'b10;
		ula_i = 11'b11;
		SelA_i = 2'b0;
		
		#10 SelA_i = 2'b1;
		
		#10 SelA_i = 2'b10;
		
		#10 ext_i = 11'b111;
		
		#10 ext_i = 11'b111;
		
	end
endmodule 