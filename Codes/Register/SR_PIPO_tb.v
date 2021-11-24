`include "SR_PIPO.v"

module SR_PIPO_tb;

reg clk, reset, write;
wire [4:1] q;

reg [4:1] inp;

initial
	begin
		$dumpfile("SR_PIPO_tb.vcd");
		$dumpvars(0, SR_PIPO_tb);
	end

SR_PIPO srPIPO(inp, clk, reset, q, write);


initial
	begin
		reset=0;
		clk =0;
		write = 1;

		inp = 4'b0000;
		#5 write = 1;inp = 4'b0010;
		#5 write = 0;inp = 4'b0001;
		#5 write = 1;inp = 4'b1010;
		#5 write = 0;inp = 4'b0000;
		#5 write = 0;inp = 4'b0110;
		#5 write = 0;inp = 4'b0001;
		#5 write = 0;inp = 4'b0010;
		#5 write = 0;inp = 4'b0000;
		#5 write = 1;inp = 4'b0010;
		#5 write = 0;inp = 4'b0001;
	end

always #5  
	clk =  ! clk; 

initial
	$monitor($time, ": clk=%b, rst=%b, inp=%b, q=%b\n", clk, reset, inp, q);

initial
	#100 $finish;

endmodule
