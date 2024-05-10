/**********************************************************************************************
 * Project Name       : clk divider
 * Engineer           : Daniel Diaz Platon
 * Module description : 
 * Target             : 5CSXFC6D6F31C6
 * Date               : 2024/02/27
 **********************************************************************************************/


module clk_div #(
	parameter	COUNTS 		=  125000//Data width
	) (
	//Input ports
	input 						clk,
	//output ports
	output reg		clk_out	
);
 
	reg [$clog2(COUNTS)-1:0] counter = {$clog2(COUNTS){1'b0}};
 
	always@ (posedge clk) begin
		counter <= (counter >= COUNTS-1) ? {$clog2(COUNTS){1'b0}} : counter + 1'b1;
		clk_out <= (counter < COUNTS/2) ? 1'b0 : 1'b1;
	end
endmodule