`include "UpSync.v"

module UpSync_tb;

reg clk, reset;
wire [4:1] q;

initial
	begin
		$dumpfile("UpSync_tb.vcd");
		$dumpvars(0, UpSync_tb);
	end

UpSync upSync(clk, reset, q);


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
