`include "16BitAdder.v"

module Bit64Adder (a, b, cin, sum, cout);
input[64:1] a, b;
input cin;
output[64:1] sum;
output cout;

	wire w1, w2, w3;

	Bit16Adder B16A_0(a[16:1], b[16:1], cin, sum[16:1], w1);
	Bit16Adder B16A_1(a[32:17], b[32:17], w1, sum[32:17], w2);
	Bit16Adder B16A_2(a[48:33], b[48:33], w2, sum[48:33], w3);
	Bit16Adder B16A_3(a[64:49], b[64:49], w3, sum[64:49], cout);

endmodule
