`include "16BitMultiplier.v"
module Multiplier_16Bit_tb;
reg [16:1]A;
reg [16:1]B;

wire [36:1]out;

initial begin
	$dumpfile("Multiplier_16Bit_tb.vcd");
	$dumpvars(0, Multiplier_16Bit_tb);
	$monitor($time, ": , A: %b(%d), B: %b(%d), out: %b(%d)", A, A, B, B, out, out);
end
Multiplier_16Bit Multiplier_16Bit_(.A(A), .B(B), .out(out));


initial begin
A = 16'b0000000000000000; 
B = 16'b0000000000000000; 

#10 A = 16'b1111111100000000; B = 16'b1111111100000000;
#10 A = 16'b1010010101001010; B = 16'b0111010100010001; 

end
endmodule
