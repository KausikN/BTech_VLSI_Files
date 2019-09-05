`include "DFF.v"

module SR_PISO(d,clk,reset,q, write_check);

input [4:1]d;
input write_check;
input clk, reset;
output q;

wire w[3:1];

wire outputs[3:1];

assign w[1] = (write_check&d[1]) | ((~write_check)&outputs[1]);
assign w[2] = (write_check&d[2]) | ((~write_check)&outputs[2]);
assign w[3] = (write_check&d[3]) | ((~write_check)&outputs[3]);

DFF dff_1(d[1], clk, reset, outputs[1]);
DFF dff_2(w[1], clk, reset, outputs[2]);
DFF dff_3(w[2], clk, reset, outputs[3]);
DFF dff_4(w[3], clk, reset, q);

endmodule
