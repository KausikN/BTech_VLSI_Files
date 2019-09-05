`include "UpDownSync.v"
module UpDownSync_tb;
reg clk;
reg reset;
reg select;

wire [4:1]q;

initial begin
	$dumpfile("UpDownSync_tb.vcd");
	$dumpvars(0, UpDownSync_tb);
	$monitor($time, ": , clk: %b, reset: %b, select: %b, q: %b", clk, reset, select, q);
end
UpDownSync UpDownSync_(.clk(clk), .reset(reset), .select(select), .q(q));
always 10
	clk = ! clk;

initial begin
clk = 1'b0; 
reset = 1'b0; 
select = 1'b0; 

#10 clk = 1'b0; reset = 1'b1; select = 1'b0; 
#10 clk = 1'b0; reset = 1'b1; select = 1'b0; 
#10 clk = 1'b0; reset = 1'b1; select = 1'b0; 
#10 clk = 1'b1; reset = 1'b0; select = 1'b0; 
#10 clk = 1'b1; reset = 1'b0; select = 1'b0; 
#10 clk = 1'b0; reset = 1'b1; select = 1'b1; 
#10 clk = 1'b1; reset = 1'b0; select = 1'b1; 
#10 clk = 1'b1; reset = 1'b1; select = 1'b0; 
#10 clk = 1'b1; reset = 1'b1; select = 1'b1; 
#10 clk = 1'b0; reset = 1'b1; select = 1'b0; 

end
endmodule
