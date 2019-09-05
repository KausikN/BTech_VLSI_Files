`include "RecursiveDoubling.v"

module top;

reg [15 : 0] a, b;
wire [15 : 0] sum;
wire cout;
wire [31 : 0] cla;

    RecursiveDoubling rd(a, b, sum, cout);

initial
begin
    a = 16'b1001010101011101;
    b = 16'b1001110001001100;
end

initial
begin
    $monitor($time, "a = %d, b = %d, sum = %d, cout = %b", a, b, sum, cout);
end

endmodule