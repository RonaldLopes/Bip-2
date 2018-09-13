`timescale 10 ns / 10 ns
module RAM
#(
	parameter MEM_SIZE = 1023,
	//parameter MEM_SIZE = 3,
	parameter WORD_WIDTH = 11,
	parameter MSB_RAM = 11,
	parameter LSB = 0,
	parameter MSB = 0
)
(
	WR_i,
	ADDR_dm_i, //Endereço
	IN_DATA_i,
	OUT_DATA_o 
);
input wire WR_i;
input wire [(MSB_RAM-1):LSB] ADDR_dm_i;
input wire [(WORD_WIDTH-1):LSB] IN_DATA_i;

output reg [(WORD_WIDTH-1):LSB] OUT_DATA_o;

reg [(WORD_WIDTH)-1:LSB] RAM_mem[MSB:MEM_SIZE];

initial
begin
	$readmemb("C:/intelFPGA_lite/17.1/Aulas/BIP2v3/dataMemory.list", RAM_mem);
end
always @(WR_i or ADDR_dm_i)
begin
 if(WR_i == 1'b1)
		RAM_mem[ADDR_dm_i] = IN_DATA_i;
 OUT_DATA_o = RAM_mem[ADDR_dm_i];
end
endmodule 
