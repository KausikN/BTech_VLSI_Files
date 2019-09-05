`include "WallaceMultiplier.v"

module tb;
    
    reg [8:1] A;
    reg [8:1] B;

    wire [18:1] products;

    WallaceMultiplier wm (A, B, products);

    initial begin

        A = 8'b11111111;
        B = 8'b00100101;
        #10;
    end

    initial
    begin
        $monitor($time, ": Binary: A = %b (%d), B = %b (%d), Product: %b (%d)", A, A, B, B, products, products);
        $dumpfile("WallaceMultiplier.vcd");
        $dumpvars;

    end
      
endmodule