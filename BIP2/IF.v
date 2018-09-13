`timescale 10 ns / 10 ns
module IF(
	entrada,
	saida
);

	input wire entrada;
	output reg [1:0]saida;
initial
begin 
saida = 2'b11;
end
	always @(entrada) 
	begin
		if(entrada == 1'b1)
		begin
			saida = 2'b00;
			$display("eSTOU AQUI");
		end
		else if (entrada == 1'b0)
			saida = 2'b01;
	end
endmodule
