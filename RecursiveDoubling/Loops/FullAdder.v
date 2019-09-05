module FullAdder (a, b, cin, sum);
input a, b, cin;
output sum;
	assign sum = a ^ b ^ cin;
endmodule
