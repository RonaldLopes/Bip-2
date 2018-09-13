 `timescale 10ns / 10ns

module UlaTeste;
//Inputs
 reg [10:0] operand1;
 reg [10:0] operand2;
 reg operation;

//Outputs
 wire z_o;
 wire n_o;
 wire [10:0] result;

 Ula DUT(operand1, operand2, operation, z_o, n_o, result);
    initial 
    begin
      operand1 = 11'b00000000011;
      operand2 = 11'b00000000010;
      operation = 1'b0;
      #10 operation = 1'b1;
		#10 operand2 = 11'b00000000011; operand1 = 11'b00000000010;
		#10 operand1 = 11'b00000000011;
     end
      
endmodule 