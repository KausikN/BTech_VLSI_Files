`include "64BitAdder.v"

module top;

reg[64:1] a;
reg[64:1] b;
reg cin;
wire[64:1] sum;
wire cout;

	Bit64Adder BA64_0(a, b, cin, sum, cout);

initial
begin
	a[64:1]=64'h0000000000000000;
	#10 b[64:1]=64'h0000000000000000;
	#10 cin=0;
	
	#10 a[64:1]=64'ha0041020021b00c0;b[64:1]=64'h0f010000100fda11;cin=1;
	#10 a[64:1]=64'h1103450111100000;b[64:1]=64'h01a4608d00011111;cin=0;
	#10 a[64:1]=64'h00101efa3d011000;b[64:1]=64'h0011100000110000;cin=0;
	
	#10 a[64:1]=64'h001111001110aaa0;b[64:1]=64'h011a398071100000;cin=1;
	#10 a[64:1]=64'h0111111100000000;b[64:1]=64'h0000000011110000;cin=0;
	#10 a[64:1]=64'h0aaa111100000110;b[64:1]=64'h0111000134120000;cin=1;
	
	#10 a[64:1]=64'hffffffffffffffff;b[64:1]=64'hffffffffffffffff;cin=1;
	#10;
end

initial
begin
	$monitor($time, ": a = %d, b = %d, cin = %b, Sum = %d, cout = %b", a, b, cin, sum, cout);
	$dumpfile("64BitAdder.vcd");
	$dumpvars;
end

endmodule
