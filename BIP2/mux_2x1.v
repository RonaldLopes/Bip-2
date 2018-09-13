`timescale 10 ns / 10 ns
module mux_2x1
#(
	parameter MSB_ROM = 11,
	parameter LSB = 0
)
(
	incrementer_i, //Saída do incrementador
	branch_i, //Selecionador
	ext_i,

	pc_o//Saída do mux
);
input wire [(MSB_ROM-1):LSB] incrementer_i;
input wire [(MSB_ROM-1):LSB] ext_i;
input wire branch_i;

output reg [(MSB_ROM-1):LSB] pc_o;

always @(ext_i or branch_i or incrementer_i)
begin
	if (branch_i == 1'b0)
	begin
		pc_o = incrementer_i;
	end
	else if(branch_i == 1'b1)
	begin
		pc_o = ext_i;
	end
end
endmodule 
