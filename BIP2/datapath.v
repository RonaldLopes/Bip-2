//-----------------------------------
//		DATAPATH
//-----------------------------------
`timescale 10 ns/10 ns

module datapath 
#(
	parameter MSB_DATA 		= 16,
	parameter MSB_OPERAND 	= 11,
	parameter MSB_ROM 		= 11,
	parameter MSB_OP 			= 1,
	parameter MSB_SELA 		= 2,
	parameter LSB 				= 0
)
(
	clock_i,
	selA_i,
	selB_i,
	WRACC_i,
	operand_i,
	op_i,
	dm_out_data,
	dm_in_data,
	dm_addr,
	flagZ_o,
	flagN_o,
	ext_o
);

input wire                       clock_i; 	  // system clock_i
input wire			 [(MSB_SELA-1):LSB] selA_i;	  	  // select mux3x2 input
input wire                       selB_i;  	  // select mux2x1 input
input wire                       WRACC_i; 	  // set accumulator
input wire [(MSB_OPERAND-1):LSB] operand_i;   // operand from control
input wire op_i; 		  // select ULA operation
input wire [(MSB_ROM-1):LSB] dm_out_data;

output wire [(MSB_ROM-1):LSB] dm_in_data;
output wire [(MSB_ROM-1):LSB] dm_addr;   // address to instruction memory
output wire flagZ_o;
output wire flagN_o;
output wire [(MSB_OPERAND-1):LSB] ext_o;

wire wn_i;
wire wz_i;	
wire wn_o;
wire wz_o;
wire [(MSB_ROM-1):LSB] wdata_ext;
wire [(MSB_ROM-1):LSB] wext_mux2_mux3;
wire [(MSB_ROM-1):LSB] wmux2_ula;
wire [(MSB_ROM-1):LSB] wext_mux3;
wire [(MSB_ROM-1):LSB] wmux3_acc;
wire [(MSB_ROM-1):LSB] wacc_ula;
wire [(MSB_ROM-1):LSB] wacc_ula_indata;
wire [(MSB_ROM-1):LSB] woutdata_mux2_mux3;
wire [(MSB_OPERAND-1):LSB] woperand; 
wire [(MSB_ROM-1):LSB] wula_mux3;

assign woperand = operand_i;
assign woutdata_mux2_mux3 = dm_out_data;

extensor 
EXT0
(
	.im_to_ext_i   ( woperand ),
	.ext_o ( wext_mux2_mux3 ) 
);

mux_3x2 
MUX3
(
	.out_data_i   (woutdata_mux2_mux3),
	.ext_i   (wext_mux2_mux3), 
	.ula_i   (wula_mux3), 
	.SelA_i (selA_i),
	.mux_3x2_o   (wmux3_acc)
);

ACC 
ACC
(
	.mux3x2_i  ( wmux3_acc     ),
	.clock_i ( clock_i      ),
	.WrAcc   ( WRACC_i     ),
	.Acc_o  ( wacc_ula_indata )
);

mux_2x1 
MUX2
(
	.incrementer_i(woutdata_mux2_mux3),
	.branch_i( selB_i         ),
	.ext_i( wext_mux2_mux3        ), 
	.pc_o( wmux2_ula      )
);

Ula 
ULA0
(
	.operand1   ( wacc_ula_indata ),
	.operand2   ( wmux2_ula     ),
	.operation     ( op_i         ),
	.z_o		( wz_i ),
	.n_o		( wn_i ),
	.result    ( wula_mux3     )
);

FLAGS
FLAGS0
(
	.N_i	( wn_i ),
	.Z_i	( wz_i ),
	.N_o	( wn_o ),
	.Z_o	( wz_o )
);

assign dm_in_data = wacc_ula_indata;
assign dm_addr = woperand;
assign flagZ_o = wz_o;
assign flagN_o = wn_o;
assign ext_o = wext_mux2_mux3;
endmodule
