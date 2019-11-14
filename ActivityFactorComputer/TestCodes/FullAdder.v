// FULL ADDER

module fa (A, B, C, sum, carry);

input A, B, C;

output sum, carry;

wire w1, w2, w3, w4, w5;

xor XOR_1 (w1, A, B);
xor XOR_2 (sum, w1, C);

nand NAND_1 (w2, w1, C);
not NOT_1 (w3, w2);
and AND_1 (w5, A, B);
nor NOR_1 (w4, w3, w5);
not NOT_2 (carry, w4);

endmodule