`include "32BitAdder.v"

module top;

reg[32:1] a;
reg[32:1] b;
reg cin;
wire[32:1] sum;
wire cout;

	Bit32Adder BA32_0(a, b, cin, sum, cout);

initial
begin
	a[32:1]=32'h00000000;
	#10 b[32:1]=32'h00000000;
	#10 cin=0;
	
	#10 a[32:1]=32'ha4202b00;b[32:1]=32'h0f01da11;cin=1;
	#10 a[32:1]=32'h34501000;b[32:1]=32'h01a40011;cin=0;
	#10 a[32:1]=32'h1013d000;b[32:1]=32'h11000000;cin=0;
	
	#10 a[32:1]=32'h1110aaa0;b[32:1]=32'h01187100;cin=1;
	#10 a[32:1]=32'h01111111;b[32:1]=32'h00110000;cin=0;
	#10 a[32:1]=32'h0aaa0110;b[32:1]=32'h01134000;cin=1;
	
	#10 a[32:1]=32'hffffaff;b[32:1]=32'hfffaffff;cin=1;
	#10;
end

initial
begin
	$monitor($time, ": a = %d, b = %d, cin = %b, Sum = %d, cout = %b", a, b, cin, sum, cout);
	$dumpfile("32BitAdder.vcd");
	$dumpvars;
end

endmodule
