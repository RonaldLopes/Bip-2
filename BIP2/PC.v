`timescale 10 ns / 10 ns
module PC
#(
	parameter MSB_ROM = 11,
	parameter LSB = 0
)
(
	enable_i, //Ativador
	clock_i, //clock
	mux_i,// saída do mux, entrada Pc
	reset_i,

	pc_o//Saída do PC
);
input wire enable_i;
input wire clock_i;
input wire reset_i;
input wire [(MSB_ROM-1):LSB] mux_i;

output reg [(MSB_ROM-1):LSB] pc_o;
initial
begin
	pc_o = 11'b0;
end
always @(clock_i)
begin
	if(clock_i == 1'b1)
	begin
		if(reset_i == 1'b0)
			if (enable_i == 1'b1)
			begin
				pc_o = mux_i;
			end 
	end
	else if(clock_i == 1'b0)
	begin
		if(reset_i == 1'b1)
			pc_o = 11'b0;
	end
end 
endmodule
