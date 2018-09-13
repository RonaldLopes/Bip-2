`timescale 10 ns / 10 ns

module datapathTeste;

//Inputs
reg                       clock_i;
reg [1:0] 						selA_i;
reg                       selB_i;
reg                       WRACC_i;
reg [10:0] operand_i;
reg op_i;
reg [10:0] dm_out_data;

//Outputs
wire [10:0] dm_in_data;
wire [10:0] dm_addr;
wire flagZ_o;
wire flagN_o;
wire [10:0] ext_o;

datapath DUT(clock_i, selA_i,	selB_i, WRACC_i, operand_i, op_i, dm_out_data, dm_in_data, dm_addr, flagZ_o, flagN_o, ext_o);
initial
	begin

	clock_i = 1'b0;
	selA_i = 2'b0;
	selB_i = 1'b0;
	WRACC_i = 1'b0;
	op_i = 1'b0;
	operand_i = 11'b1;
	dm_out_data = 11'b0;
	
	
	#10 clock_i = 1'b1;
	
	#10 selA_i = 2'b1; WRACC_i = 1; clock_i = 1'b0;
	
	#10 clock_i = 1'b1;
	
	#10 selA_i = 2'b10; dm_out_data = 11'b10; op_i = 1'b1; clock_i = 1'b0;
	
	#10 clock_i = 1'b1;
	
	#10 clock_i = 1'b0;
	end
endmodule 