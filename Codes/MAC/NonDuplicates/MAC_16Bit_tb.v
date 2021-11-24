`include "MAC_16Bit.v"
module MAC_16Bit_tb;
reg [16:1]A;
reg [16:1]B;
reg clk;
reg reset;

wire [36:1]out;

initial begin
	$dumpfile("MAC_16Bit_tb.vcd");
	$dumpvars(0, MAC_16Bit_tb);
	$monitor($time, ": , A: %b(%d), B: %b(%d), out: %b(%d)", A, A, B, B, out, out);
end
MAC_16Bit MAC (clk, A, B, out, reset);

always #5
	clk = ! clk;


initial begin
reset = 1'b1;
A = 16'b0000000000000000; 
B = 16'b0000000000000000;
clk = 1'b0;

#10 reset = 1'b0; A = 16'b0000000000000001; B = 16'b0000000000000010;
#10 reset = 1'b0; A = 16'b0000000000000101; B = 16'b0000000000000010;
#10 reset = 1'b0; A = 16'b0000000000001111; B = 16'b0000000000001010;
#10 reset = 1'b0; A = 16'b0000000000000001; B = 16'b0000000000000010;
#10 reset = 1'b0; A = 16'b0000000000000101; B = 16'b0000000000000010;
#10 reset = 1'b0; A = 16'b0000000000001111; B = 16'b0000000000001010;
#10 reset = 1'b0; A = 16'b0000000000000001; B = 16'b0000000000000010;
#10 reset = 1'b0; A = 16'b0000000000000101; B = 16'b0000000000000010;
#10 reset = 1'b0; A = 16'b0000000000001111; B = 16'b0000000000001010;
#10 reset = 1'b0; A = 16'b0000000000000000; B = 16'b0000000000000000;
#50 $finish;
end
endmodule
