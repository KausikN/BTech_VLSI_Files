`include "16BitMultiplier.v"
`include "DFF.v"

module MAC_16Bit(clk, A, B, out, reset);
    
    input clk;
    input [16:1] A,B;
    input reset;
    output [36:1] out;

    wire [36:1] fm, fa;
    wire cout;
    wire [36:1] outfeedback;

    //initial 
        //outfeedback <= 'd0;

    // Stage 1
    Multiplier_16Bit Mul (A, B, fm);

    DFF d (fm, clk, reset, fa);
    // Stage 2
    Bit36Adder Add (outfeedback, fa, reset, out, cout);

    DFF dd (out, clk, reset, outfeedback);

    
    // ----- Step 5 --------------------------------------
/*
always@(*) 
    $display(": Intermediate Binary: A = %b (%d), B = %b (%d), Product: %b (%d) -- --%b--", A, A, B, B, prod, prod, p1);
*/
endmodule