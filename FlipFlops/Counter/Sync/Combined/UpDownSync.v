`include "TFF.v"

module UpDownSync(clk,reset,q, select);
input clk, reset, select;
output [4:1] q;

wire [4:1]inputs;

assign inputs[1] = 1'b1;

/*
initial begin
	q[1] <= 1'b1;
	q[2] <= 1'b1;
	q[3] <= 1'b1;
	q[4] <= 1'b1;
end
*/

assign inputs[2] = select&q[1] | (~select)&(~q[1]);
assign inputs[3] = select&q[1]&q[2] | (~select)&(~q[1])&(~q[2]);
assign inputs[4] = select&q[1]&q[2]&q[3] | (~select)&(~q[1])&(~q[2])&(~q[3]);


TFF tff_1(inputs[1], clk, reset, q[1], select);
TFF tff_2(inputs[2], clk, reset, q[2], select);
TFF tff_3(inputs[3], clk, reset, q[3], select);
TFF tff_4(inputs[4], clk, reset, q[4], select);

/*
initial
	$monitor($time, ": clk=%b, rst=%b, inp=%b, q=%b\n", clk, reset, inputs, q);
*/

endmodule
