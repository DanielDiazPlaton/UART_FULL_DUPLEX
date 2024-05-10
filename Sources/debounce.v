/**********************************************************************************************
 * Project Name       : Debounce
 * Engineer           : Daniel Diaz Platon
 * Module description : 
 * Target             : 5CSXFC6D6F31C6
 * Date               : 2024/02/27
 **********************************************************************************************/

 module debounce #(
	parameter	COUNTS 		= 125000 //Data width
	) (
	input 	clk,
	input 	rst,
	input 	button_in,
	output	button_out
);
	wire	q0;
	wire 				q1; 
	wire				q2;
	wire				clk_out;
	wire	q2_n = ~q2;
	assign button_out = q1 & q2_n;
	clk_div	#(.COUNTS(COUNTS))	clock_div	(	.clk 		(clk),
																.clk_out (clk_out)
															);
	FF_D_enable	ff0	(	.clk	(clk_out),
							.rst	(rst),
							.enable	(1'b1),
							.d		(button_in),
							.q		(q0)	
						);
	FF_D_enable	ff1	(	.clk	(clk_out),
							.rst	(rst),
							.enable	(1'b1),
							.d		(q0),
							.q		(q1)	
						);
	FF_D_enable	ff2	(	.clk	(clk_out),
							.rst	(rst),
							.enable	(1'b1),
							.d		(q1),
							.q		(q2)	
						);
endmodule