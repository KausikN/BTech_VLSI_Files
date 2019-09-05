`include "RecursiveDoubling.v"

module top;

reg[4:1] in;

wire[4:1] out;


	RecursiveDoubling RD(in, out);

initial
begin
	in[4:1]='bx1x0;
	#10;
end

initial
begin
	$monitor($time, ": in = %b, out = %b\n", in, out);
	$dumpfile("RecursiveDoubling.vcd");
	$dumpvars;
end

endmodule
