`include "SR_SIPO.v"

module SR_SIPO_tb;

reg clk, reset;
wire [4:1] q;

reg inp;

initial
	begin
		$dumpfile("SR_SIPO_tb.vcd");
		$dumpvars(0, SR_SIPO_tb);
	end

SR_SIPO srSIPO(inp, clk, reset, q);


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
