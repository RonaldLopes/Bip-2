`timescale 10 ns / 10 ns
module extensor
#(
	parameter MSB_ROM = 11,
	parameter LSB = 0
)
(
	im_to_ext_i, //Saída da memória de instrução e entrada da extensora
					 // instruction memory to extensor

	ext_o//Saída do PC
);
input wire [(MSB_ROM-1):LSB] im_to_ext_i;

output reg [(MSB_ROM-1):LSB] ext_o;

always @(im_to_ext_i)
begin
	ext_o = im_to_ext_i;
end
endmodule 
