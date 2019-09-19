`include "16BitMultiplier.v"
`include "36BitAdder.v"
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
    /*
    DFF d1 (fm[1], clk, reset, fa[1]);
    DFF d2 (fm[2], clk, reset, fa[2]);
    DFF d3 (fm[3], clk, reset, fa[3]);
    DFF d4 (fm[4], clk, reset, fa[4]);
    DFF d5 (fm[5], clk, reset, fa[5]);
    DFF d6 (fm[6], clk, reset, fa[6]);
    DFF d7 (fm[7], clk, reset, fa[7]);
    DFF d8 (fm[8], clk, reset, fa[8]);
    DFF d9 (fm[9], clk, reset, fa[9]);
    DFF d10 (fm[10], clk, reset, fa[10]);
    DFF d11 (fm[11], clk, reset, fa[11]);
    DFF d12 (fm[12], clk, reset, fa[12]);
    DFF d13 (fm[13], clk, reset, fa[13]);
    DFF d14 (fm[14], clk, reset, fa[14]);
    DFF d15 (fm[15], clk, reset, fa[15]);
    DFF d16 (fm[16], clk, reset, fa[16]);
    */
    DFF d (fm, clk, reset, fa);
    // Stage 2
    Bit36Adder Add (outfeedback, fa, reset, out, cout);
    /*
    DFF dd1 (out[1], clk, reset, outfeedback[1]);
    DFF dd2 (out[2], clk, reset, outfeedback[2]);
    DFF dd3 (out[3], clk, reset, outfeedback[3]);
    DFF dd4 (out[4], clk, reset, outfeedback[4]);
    DFF dd5 (out[5], clk, reset, outfeedback[5]);
    DFF dd6 (out[6], clk, reset, outfeedback[6]);
    DFF dd7 (out[7], clk, reset, outfeedback[7]);
    DFF dd8 (out[8], clk, reset, outfeedback[8]);
    DFF dd9 (out[9], clk, reset, outfeedback[9]);
    DFF dd10 (out[10], clk, reset, outfeedback[10]);
    DFF dd11 (out[11], clk, reset, outfeedback[11]);
    DFF dd12 (out[12], clk, reset, outfeedback[12]);
    DFF dd13 (out[13], clk, reset, outfeedback[13]);
    DFF dd14 (out[14], clk, reset, outfeedback[14]);
    DFF dd15 (out[15], clk, reset, outfeedback[15]);
    DFF dd16 (out[16], clk, reset, outfeedback[16]);
    */
    DFF dd (out, clk, reset, outfeedback);

    
    // ----- Step 5 --------------------------------------
/*
always@(*) 
    $display(": Intermediate Binary: A = %b (%d), B = %b (%d), Product: %b (%d) -- --%b--", A, A, B, B, prod, prod, p1);
*/
endmodule