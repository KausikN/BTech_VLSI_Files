`include "SR_SISO.v"

module SR_SISO_tb;

reg clk, reset;
wire q;

reg inp;

initial
	begin
		$dumpfile("SR_SISO_tb.vcd");
		$dumpvars(0, SR_SISO_tb);
	end

SR_SISO srsiso(inp, clk, reset, q);


initial
	begin
		inp = 0;
		reset=0;
		clk =0;
	end

always@(negedge clk)
	inp = ~inp;

always #5  
	clk =  ! clk; 

initial
	$monitor($time, ": clk=%b, rst=%b, inp=%b, q=%b\n", clk, reset, inp, q);

initial
	#100 $finish;

endmodule
