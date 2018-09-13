`timescale 10 ns / 10 ns
module FLAGS
(
	N_i,
	Z_i,

	N_o,
	Z_o
);
input wire N_i;
input wire Z_i;

output reg N_o;
output reg Z_o;

initial
begin
	N_o = 1'b0;
	Z_o = 1'b0;
end

always @(N_i or Z_i)
begin
	N_o = N_i;
	Z_o = Z_i;
end
endmodule 
