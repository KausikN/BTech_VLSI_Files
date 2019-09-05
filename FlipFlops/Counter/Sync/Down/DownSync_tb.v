`include "DownSync.v"

module DownSync_tb;

reg clk, reset;
wire [4:1] q;

initial
	begin
		$dumpfile("DownSync_tb.vcd");
		$dumpvars(0, DownSync_tb);
	end

DownSync downSync(clk, reset, q);


initial
	begin
		reset=0;
		clk =0;
	end

always #5  
	clk =  ! clk; 

initial
	$monitor($time, ": clk=%b, rst=%b, q=%b\n", clk, reset, q);

initial
	#100 $finish;
endmodule
