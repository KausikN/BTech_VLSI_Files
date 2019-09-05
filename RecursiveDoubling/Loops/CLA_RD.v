`include "RecursiveDoubling.v"
`include "FullAdder.v"
`include "FindStates.v"

module CLA_RD (a, b, sum, carry);
input [16:1] a, b;

output [16:1] sum;
output carry;

wire[16:1] states;
wire[16:1] cin;

FindStates fs(a, b, states);

RecursiveDoubling rd(states, cin);

FullAdder fa_1(a[1], b[1], 1'b0, sum[1]);
FullAdder fa_2(a[2], b[2], cin[1], sum[2]);
FullAdder fa_3(a[3], b[3], cin[2], sum[3]);
FullAdder fa_4(a[4], b[4], cin[3], sum[4]);

FullAdder fa_5(a[5], b[5], cin[4], sum[5]);
FullAdder fa_6(a[6], b[6], cin[5], sum[6]);
FullAdder fa_7(a[7], b[7], cin[6], sum[7]);
FullAdder fa_8(a[8], b[8], cin[7], sum[8]);

FullAdder fa_9(a[9], b[9], cin[8], sum[9]);
FullAdder fa_10(a[10], b[10], cin[9], sum[10]);
FullAdder fa_11(a[11], b[11], cin[10], sum[11]);
FullAdder fa_12(a[12], b[12], cin[11], sum[12]);

FullAdder fa_13(a[13], b[13], cin[12], sum[13]);
FullAdder fa_14(a[14], b[14], cin[13], sum[14]);
FullAdder fa_15(a[15], b[15], cin[14], sum[15]);
FullAdder fa_16(a[16], b[16], cin[15], sum[16]);

assign carry = cin[16];

endmodule
