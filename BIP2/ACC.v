`timescale 10 ns / 10 ns
module ACC
#(
	parameter MSB_ROM = 11,
	parameter LSB = 0
)
(
	mux3x2_i, //Saída do mux, entrada do ACC
	clock_i, //clock
	WrAcc, // Habilita a escrita no reg

	Acc_o//Saída do Acc
);
input wire [(MSB_ROM-1):LSB] mux3x2_i;
input wire clock_i;
input wire WrAcc;

output reg [(MSB_ROM-1):LSB] Acc_o;
initial
begin
	Acc_o = 11'b0;
end
always @(posedge clock_i)
begin
	if (WrAcc == 1'b1)
	begin
		Acc_o = mux3x2_i;
	end
end
endmodule 
