`timescale 10 ns / 10 ns
module mux_3x2
#(
	parameter MSB_ROM = 11,
	parameter SELA = 2,
	parameter LSB = 0
)
(
	out_data_i, //Saída do incrementador
	ext_i, //Selecionador
	ula_i,
	SelA_i,

	mux_3x2_o//Saída do mux
);
input wire [(MSB_ROM-1):LSB] out_data_i;
input wire [(MSB_ROM-1):LSB] ext_i;
input wire [(MSB_ROM-1):LSB] ula_i;
input wire [(SELA-1):LSB] SelA_i;

output reg [(MSB_ROM-1):LSB] mux_3x2_o;

always @(out_data_i or ext_i or ula_i or SelA_i)
begin
	case(SelA_i)
	2'b0: mux_3x2_o = out_data_i;
	2'b1: mux_3x2_o = ext_i;
	2'b10: mux_3x2_o = ula_i;
	endcase
end
endmodule 
