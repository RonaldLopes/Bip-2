`timescale 10 ns / 10 ns

module incrementTeste;

//Inputs
reg [10:0] wpc_i;

//Outputs
wire [10:0] incrementer_o;

incrementer DUT(wpc_i, incrementer_o);
initial
	begin
	
	wpc_i = 11'b0;
	
		
	#10 wpc_i = 11'b1; 
	
	#10 wpc_i = 11'b1001; //1010
	
   #10 wpc_i = 11'b1001; 
	
	#10 wpc_i = 11'b1010; //1011
	
	#10 wpc_i = 11'b1010; 
	
	end
endmodule 