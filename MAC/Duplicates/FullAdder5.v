module FullAdder5 (a, b, cin, sum, cout);
input a, b, cin;
output sum, cout;
	assign sum = a ^ b ^ cin;
	assign cout  = ((a^b)&cin) | (a&b);	// carry = (a xor b)cin + ab
endmodule