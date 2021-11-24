`include "WallaceMultiplier.v"

module tb;
    
    reg [4:1] A;
    reg [4:1] B;

    wire [8:1] products;

    WallaceMultiplier wm (A, B, products);

    initial begin

        A = 4'b1010;
        B = 4'b0011;
        #10;
    end

    initial
    begin
        $monitor($time, ": Binary: A = %b (%d), B = %b (%d), Product: %b (%d)", A, A, B, B, products, products);
        $dumpfile("WallaceMultiplier.vcd");
        $dumpvars;

    end
      
endmodule