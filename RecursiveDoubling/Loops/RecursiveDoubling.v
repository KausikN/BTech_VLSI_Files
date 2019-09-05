
module RecursiveDoubling (pgk_old, pgk_new);
input [16:1] pgk_old;
output reg[16:1] pgk_new;

reg[16:1] temp;

reg[16:1] i;
reg[16:1] j;

always @* begin
$display("\nIN: %b", pgk_old);
 
pgk_new[16:1] = pgk_old[16:1];
temp[16:1] = pgk_old[16:1];

i = 16'b0000000000000010;

while(i <= 16)
	begin
		j=i;
		while(j <= 16)
			begin
				$display("(%b, %b) -> ", pgk_new[j], pgk_new[j-i+1]);
				case(pgk_new[j])
					1'b0: pgk_new[j] = 1'b0;
					1'b1: pgk_new[j] = 1'b1;
					1'bx: pgk_new[j] = temp[j-i+1];
				endcase
				$display("(%b, %b)\n", pgk_new[j], pgk_new[j-i+1]);

				j = j + 1;
			end
		temp[16:1] = pgk_new[16:1];
		i = i << 1;
	end

	$display("OUT: %b", pgk_new);

end

endmodule
