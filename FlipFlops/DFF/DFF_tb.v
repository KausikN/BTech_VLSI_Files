`include "DFF.v"

module DFF_tb;

reg d, clk, reset;
wire q;

initial
	begin
		$dumpfile("DFF_tb.vcd");
		$dumpvars(0, DFF_tb);
	end

DFF d1(d, clk, reset, q);


initial
	begin
		reset=0;
		clk =0;
		d=0;
		#20 reset=1;
	end

always #5  
	clk =  ! clk; 

always #10 
	d=~d;

always@(*)
	begin
 		$display("time:%t d=%b, clk=%b, rst=%b,q=%b\n", $time, d, clk, reset, q);
	end 

initial
	#100 $finish;
endmodule