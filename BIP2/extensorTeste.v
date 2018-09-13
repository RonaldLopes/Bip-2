`timescale 10 ns / 10 ns

module extensorTeste;

//Inputs
reg [10:0] im_to_ext_i;

//Outputs
wire [10:0] ext_o;//Saída do mux

extensor DUT(im_to_ext_i, ext_o);
initial
	begin
	
	im_to_ext_i = 11'b1;

	#5 im_to_ext_i = 11'b101;
	
	#5 im_to_ext_i = 11'b101;
	
	end
endmodule 