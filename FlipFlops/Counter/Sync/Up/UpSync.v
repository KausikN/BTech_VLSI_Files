`include "TFF.v"

module UpSync(clk,reset,q);
input clk, reset;
output [4:1] q;

wire [4:1]inputs;

assign inputs[1] = 1'b1;

assign inputs[2] = q[1];
assign inputs[3] = q[1]&q[2];
assign inputs[4] = q[1]&q[2]&q[3];


TFF tff_1(inputs[1], clk, reset, q[1]);
TFF tff_2(inputs[2], clk, reset, q[2]);
TFF tff_3(inputs[3], clk, reset, q[3]);
TFF tff_4(inputs[4], clk, reset, q[4]);

endmodule
