 `timescale 10ns / 10ns

module IF_TESTE;
//Inputs
 reg entrada; 

//Outputs
 wire [1:0] saida;

 IF DUT(entrada, saida);
    initial 
    begin
		entrada = 1'b0;
		
      #10 entrada = 1'b1;
		#10 entrada = 1'b0;
		#10 entrada = 1'b1;
		#10 entrada = 1'b0;

     end
      
endmodule 