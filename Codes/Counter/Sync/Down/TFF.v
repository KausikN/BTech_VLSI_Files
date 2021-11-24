module TFF(d,clk,reset,q);
input clk, reset;
input wire d;
output reg q;

initial 
	q = 1'b1;

always@(posedge clk or posedge reset)
begin
	if(reset)
 		q <= 1'b1;
	else
		q <= (d&(~q)) | ((~d)&q);
end

endmodule
