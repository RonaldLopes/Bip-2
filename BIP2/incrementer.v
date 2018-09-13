`timescale 10 ns / 10 ns
module incrementer
#(
	
	parameter MSB_ROM = 11,
	parameter LSB = 0
)
(
	wpc_i, //Endereço PC

	incrementer_o //Saída do incrementador
);
input wire [(MSB_ROM-1):LSB] wpc_i;

output reg [(MSB_ROM-1):LSB] incrementer_o = 11'b0; // Primeiro endereço é zero

always @(wpc_i)
begin
	incrementer_o = wpc_i + 1'b1;
end
endmodule 
