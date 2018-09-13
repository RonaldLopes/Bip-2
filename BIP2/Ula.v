`timescale 10 ns / 10 ns
module Ula(
	operand1,
	operand2,
	operation,
	z_o,
	n_o,
	result
);

	input wire [10:0] operand1;
	input wire [10:0] operand2;
	input wire operation;
	output reg z_o;
	output reg n_o;
	output reg [10:0] result;
		always @(operation or operand1 or operand2) 
	begin
		case (operation)
			1'b0: result = operand1 + operand2;
			1'b1: result = operand1 - operand2;

	endcase
	if (result == 11'b00000000000) z_o = 1'b1;
	else z_o = 1'b0;
	if (result[10] == 1'b1) n_o = 1'b1;
	else n_o = 1'b0;
end


endmodule
