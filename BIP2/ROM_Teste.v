`timescale 10 ns / 10 ns

module ROM_Teste;

//Inputs
reg [10:0]  ADDR_im_i;

//Outputs
wire [15:0] DATA_im_o;//Saída do dado da memória

ROM DUT(ADDR_im_i, DATA_im_o);
initial
	begin

	ADDR_im_i = 11'b0000; // DATA_im_o = 16'h0000 
	
	#10 ADDR_im_i = 11'b0010; // DATA_im_o = 16'hA010 

	#10 ADDR_im_i = 11'b0001; // DATA_im_o = 16'h0801
 
	#10 ADDR_im_i = 11'b0011; // DATA_im_o = 16'h0011

	#10 ADDR_im_i = 11'b0011; // DATA_im_o = 16'h0011
	
	end
endmodule 