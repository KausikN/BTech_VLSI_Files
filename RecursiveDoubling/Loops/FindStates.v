
module FindStates (a, b, out);
input [16:1] a, b;
output reg[16:1] out;

reg[16:1] i;

always @* begin

if(a[1] == 1'b1 && b[1] == 1'b1)
	out[1] = 1'b1;
else 
	out[1] = 1'b0;

i = 16'b0000000000000010;

while(i <= 16)
	begin
		if(a[i] == 1'b0 && b[i] == 1'b0)
			out[i] = 1'b0;
		else if(a[i] == 1'b0 && b[i] == 1'b1)
			out[i] = 1'bx;
		else if(a[i] == 1'b1 && b[i] == 1'b0)
			out[i] = 1'bx;
		else if(a[i] == 1'b1 && b[i] == 1'b1)
			out[i] = 1'b1;

		i = i + 1;
	end

end

endmodule