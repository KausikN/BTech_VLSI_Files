`include "4BitAdder.v"

module top;

reg[4:1] a;
reg[4:1] b;
reg cin;
wire[4:1] sum;
wire cout;

	Bit4Adder BA4_0(a, b, cin, sum, cout);

initial
begin
	a[4:1]=4'b0000;
	#10 b[4:1]=4'b0000;
	#10 cin=0;
	
	#10 a[4:1]=4'ha;b[4:1]=4'b0000;cin=1;
	#10 a[4:1]=4'b0000;b[4:1]=4'b1000;cin=0;
	#10 a[4:1]=4'b0001;b[4:1]=4'b0000;cin=0;
	
	#10 a[4:1]=4'b0000;b[4:1]=4'b0001;cin=1;
	#10 a[4:1]=4'b0001;b[4:1]=4'b0001;cin=0;
	#10 a[4:1]=4'b0001;b[4:1]=4'b0000;cin=1;
	
	#10 a[4:1]=4'b0001;b[4:1]=4'b0001;cin=1;
	#10;
end

initial
begin
	$monitor($time, ": a = %d, b = %d, cin = %b, Sum = %d, cout = %b", a, b, cin, sum, cout);
	$dumpfile("4BitAdder.vcd");
	$dumpvars;
end

endmodule
