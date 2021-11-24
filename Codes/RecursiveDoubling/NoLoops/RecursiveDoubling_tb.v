`include "RecursiveDoubling.v"

module top;

reg [16:1] a,b;
reg cin;
wire [16:1] sum;
wire cout;

RecursiveDoubling rd(a, b, cin, sum, cout);

initial
begin
	a=16'b1011010110010111; b=16'b0001111101010111; cin=1'b0;
end


initial
begin
	$monitor($time, "\t a = %d, b = %d, cin = %d, cout = %d, sum = %d",a,b,cin,cout,sum);
	$dumpfile("RecursiveDoubling_tb.vcd");
	$dumpvars;
end

endmodule
