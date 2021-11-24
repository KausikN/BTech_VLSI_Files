module DFF(d,clk,reset,q);
input clk, reset;
input [36:1] d;
output reg [36:1] q;

always@(negedge clk or posedge reset)
	if(reset)
 		q <= 36'h000000000;
	else
		q <= d;

endmodule
