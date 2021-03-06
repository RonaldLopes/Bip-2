`timescale 10 ns/10 ns 
module processor_bip2
#(
	parameter MSB_DATA = 16,
	parameter MSB_ROM = 11,
	parameter MSB_OPERAND = 11,
	parameter MSB_SELA = 2,
	parameter LSB = 0
)
(
// INTERFACE SISTEMA
	RESET_i,
	CLOCK_i,	  //Clock do sistema
	
// INTERFACE MEMÓRIA DE INSTRUÇÃO (Memória ROM)
	ADDR_im_o, //Endereço
	DATA_im_i, //Valor
//INTERFACE MEMÓRIA DE DADOS (Memória RAM)
	WRRAM_o,
	ADDR_dm_o,
	IN_DATA_o,
	OUT_DATA_i
);
input wire RESET_i;
input wire CLOCK_i;

input wire [(MSB_DATA-1):LSB] DATA_im_i;
input wire [(MSB_OPERAND-1):LSB] OUT_DATA_i;

output wire [(MSB_ROM-1):LSB]ADDR_im_o;
output wire WRRAM_o;
output wire [(MSB_ROM-1):LSB]	ADDR_dm_o;
output wire [(MSB_OPERAND-1):LSB]IN_DATA_o;

wire [(MSB_OPERAND-1):LSB] wExt_Mux2x1;
wire wN;
wire wZ;
wire wOp;
wire [(MSB_SELA - 1):LSB] wSelA;
wire wSelB;
wire wWrAcc;
wire [(MSB_OPERAND-1):LSB] wOperand;

controle
Controle0
(
	.RESET_i(RESET_i),
	.Addr_ext_i(wExt_Mux2x1),
	.z_i(wZ),
	.n_i(wN),
	.SellA_o(wSelA),
	.SellB_o(wSelB),
	.WrAcc_o(wWrAcc),
	.Op_o(wOp),
	.WrRam_o(WRRAM_o),
	.Clock_i(CLOCK_i),
	.DATA_im_i(DATA_im_i),
	.DATA_im_o(wOperand),
	.ADDR_im_o(ADDR_im_o)
);

datapath
Datapath0
(
	.clock_i(CLOCK_i),
	.selA_i(wSelA),
	.selB_i(wSelB),
	.WRACC_i(wWrAcc),
	.operand_i(wOperand),
	.op_i(wOp),
	.dm_out_data(OUT_DATA_i),
	.dm_in_data(IN_DATA_o),
	.dm_addr(ADDR_dm_o),
	.flagZ_o(wZ),
	.flagN_o(wN),
	.ext_o(wExt_Mux2x1)
);

endmodule

