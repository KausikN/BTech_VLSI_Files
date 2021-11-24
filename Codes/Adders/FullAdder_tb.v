`include "FullAdder.v"

module top;

reg a, b, cin;
wire sum, cout;

	FullAdder FA_0(a, b, cin, sum, cout);

initial
begin
	a=0;
	#10 b=0;
	#10 cin=0;
	
	#10 a=0;b=0;cin=1;
	#10 a=0;b=1;cin=0;
	#10 a=1;b=0;cin=0;
	
	#10 a=0;b=1;cin=1;
	#10 a=1;b=1;cin=0;
	#10 a=1;b=0;cin=1;
	
	#10 a=1;b=1;cin=1;
	#10;
end

initial
begin
	$monitor($time, ": a = %b, b = %b, cin = %b, Sum = %b, cout = %b", a, b, cin, sum, cout);
	$dumpfile("FullAdder.vcd");
	$dumpvars;
end

endmodule
