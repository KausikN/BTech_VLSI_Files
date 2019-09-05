module TFF(d,clk,reset,q, select);
input clk, reset, select;
input wire d;
output reg q;
/*
initial 
	q = 1'b1;
*/
always@(posedge clk or posedge reset)
begin
	if(reset)
	begin
 		q = ~select;
 	end
	else
		q <= (d&(~q)) | ((~d)&q);
end

endmodule
