`include "DFF.v"

module SR_SISO(d,clk,reset,q);

input d, clk, reset;
output q;

wire w1, w2, w3;

DFF dff_1(d, clk, reset, w1);
DFF dff_2(w1, clk, reset, w2);
DFF dff_3(w2, clk, reset, w3);
DFF dff_4(w3, clk, reset, q);

endmodule
