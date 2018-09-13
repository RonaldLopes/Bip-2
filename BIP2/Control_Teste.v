`timescale 10 ns / 10 ns

module Control_Teste;

//Inputs


//Outputs

reg [10:0] Addr_ext_i;
reg	z_i,n_i;//
wire	SellA_o;//
wire	SellB_o;//
wire	WrAcc_o;//
wire	Op_o;
wire	WrRam_o;//
reg	Clock_i;
reg [15:0]DATA_im_i;
wire	[10:0]DATA_im_o;
wire	[10:0]ADDR_im_o;
//LDA 2
//ADD 1
controle DUT(Addr_ext_i,z_i,n_i,SellA_o,SellB_o,WrAcc_o,Op_o,WrRam_o,Clock_i,DATA_im_i,DATA_im_o,ADDR_im_o);

initial
	begin
		Addr_ext_i= 11'b0; z_i=1'b0;n_i=1'b0;Clock_i=1'b0;DATA_im_i=16'b0;
		#5 Clock_i=1'b0; 
		#5 Clock_i=1'b1; DATA_im_i=16'b0001100000000010; Addr_ext_i=11'b00000000010; //LDI 2
		#5 Clock_i=1'b0;
		#5 Clock_i=1'b1; DATA_im_i=16'b0011100000000001; Addr_ext_i=11'b00000000001; //SUBI 1
		#5 Clock_i=1'b0;
		#5 Clock_i=1'b1;DATA_im_i=16'b0100011111111111; z_i=1'b1;Addr_ext_i=11'b00000111111; //branch
		#5 Clock_i=1'b0; 
		#5 Clock_i=1'b1;
		#5 Clock_i=1'b0; 
	end
	
endmodule
