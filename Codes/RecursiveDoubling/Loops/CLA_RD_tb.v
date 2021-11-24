`include "CLA_RD.v"

module top;

reg[16:1] a, b;

wire[16:1] sum;
wire cout;

integer seed;

	CLA_RD cla_rd(a, b, sum, cout);

initial
begin
	seed = 1;
	a[16:1]={$random(seed)}%(2**16); b[16:1]={$random(seed)}%(2**16);
	#10;
end

initial
begin
	$monitor($time, ": a = %b, b = %b, Sum = %b, cout = %b", a, b, sum, cout);
	$dumpfile("CLA_RD.vcd");
	$dumpvars;
end

endmodule
