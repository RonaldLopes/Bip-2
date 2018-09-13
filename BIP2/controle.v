`timescale 10 ns / 10 ns

module controle
#(
	parameter MSB_ROM = 11,
	parameter MSB_Data = 16,
	parameter MSB_OP = 5,
	parameter LSB = 0,
	parameter SEL_A = 2
	
)
(
	
	RESET_i,
	Addr_ext_i,
	z_i,//
	n_i,//
	SellA_o,//
	SellB_o,//
	WrAcc_o,//
	Op_o,
	WrRam_o,//
	Clock_i,
	DATA_im_i,
	DATA_im_o,
	ADDR_im_o //saida do PC
	
);
input wire RESET_i;
wire wBranch, wWrPC;
output wire WrRam_o,SellB_o,WrAcc_o;
output wire [(SEL_A-1):LSB]SellA_o;
input wire Clock_i;
input wire[(MSB_ROM-1):LSB] Addr_ext_i;
output wire Op_o;
wire [(MSB_ROM-1):LSB]wIncrementer, wMux_2x1;
input wire [(MSB_Data-1):LSB] DATA_im_i;
output wire  [(MSB_ROM-1):LSB] DATA_im_o;
output wire [(MSB_ROM-1):LSB] ADDR_im_o;
assign DATA_im_o =  DATA_im_i[(MSB_ROM-1):LSB];
input z_i,n_i;
wire reset;
decoder
DEC
(
	.reset_i(RESET_i),
	.clock_i(Clock_i),
	.Opcode_i(DATA_im_i[(MSB_Data-1):(MSB_ROM)]),
	.n_i(n_i),
	.z_i(z_i),
	.Branch_o(wBranch),
	.Wrpc_o(wWrPC),
	.SelA_o(SellA_o),
	.SelB_o(SellB_o),
	.Wracc_o(WrAcc_o),
	.Op_o(Op_o),
	.Wrram_o(WrRam_o),
	.reset_pc_o(reset)
);


incrementer
INC
(
	.wpc_i(ADDR_im_o),
	.incrementer_o(wIncrementer)
);

mux_2x1
MUX
(
	.incrementer_i(wIncrementer),
	.branch_i(wBranch),
	.ext_i(Addr_ext_i),
	.pc_o(wMux_2x1)
);

PC
PC0
(
	.enable_i(wWrPC),
	.clock_i(Clock_i),
	.mux_i(wMux_2x1),
	.reset_i(reset),
	.pc_o(ADDR_im_o)
);


endmodule
