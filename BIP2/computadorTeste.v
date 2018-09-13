`timescale 10 ns / 10 ns

module computadorTeste;

//Inputs
reg CLOCK_i;
reg RESET_i;

computador DUT(CLOCK_i,RESET_i);
initial
	begin
	
	RESET_i = 1'b0;
	CLOCK_i = 1'b0;

	#10 CLOCK_i = 1'b1;//1
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//2
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//3
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//4
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//5
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//6
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//7
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//8
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//9
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//10
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//11
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//12
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//13
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//14
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//15
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//16
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//17
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//18
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//19
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//20
	#10 CLOCK_i = 1'b0;

	#10 CLOCK_i = 1'b1;//21
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//22
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//23
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//24
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//25
	#10 CLOCK_i = 1'b0;

	#10 CLOCK_i = 1'b1;//26
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//27
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//28
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//29
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//30
	#10 CLOCK_i = 1'b0;
	
	RESET_i = 1'b1;

	#10 CLOCK_i = 1'b1;//1
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//2
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//3
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//4
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//5
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//6
	#10 CLOCK_i = 1'b0;RESET_i = 1'b0;
	
	
	#10 CLOCK_i = 1'b1;//7
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//8
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//9
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//10
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//11
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//12
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//13
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//14
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//15
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//16
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//17
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//18
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//19
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//20
	#10 CLOCK_i = 1'b0;

	#10 CLOCK_i = 1'b1;//21
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//22
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//23
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//24
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//25
	#10 CLOCK_i = 1'b0;

	#10 CLOCK_i = 1'b1;//26
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//27
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//28
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//29
	#10 CLOCK_i = 1'b0;
	
	#10 CLOCK_i = 1'b1;//30
	#10 CLOCK_i = 1'b0;
	
	end
endmodule 