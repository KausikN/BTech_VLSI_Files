`include "DFF.v"

module UpASync(clk,reset,q);
input clk, reset;
output [4:1] q;

DFF dff_1(~q[1], clk, reset, q[1]);
DFF dff_2(~q[2], ~q[1], reset, q[2]);
DFF dff_3(~q[3], ~q[2], reset, q[3]);
DFF dff_4(~q[4], ~q[3], reset, q[4]);

endmodule
