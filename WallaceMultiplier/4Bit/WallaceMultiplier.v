`include "FullAdder.v"
`include "HalfAdder.v"


module WallaceMultiplier(A,B,prod);
    
    input [4:1] A,B;
    output [8:1] prod;

    wire s11,s12,s13,s14,s15,s22,s23,s24,s25,s26,s32,s33,s34,s35,s36,s37;
    wire c11,c12,c13,c14,c15,c22,c23,c24,c25,c26,c32,c33,c34,c35,c36,c37;
    wire [4:1] p0,p1,p2,p3;

    assign p0[1] = A[1] & B[1];
    assign p0[2] = A[2] & B[1];
    assign p0[3] = A[3] & B[1];
    assign p0[4] = A[4] & B[1];

    assign p1[1] = A[1] & B[2];
    assign p1[2] = A[2] & B[2];
    assign p1[3] = A[3] & B[2];
    assign p1[4] = A[4] & B[2];

    assign p2[1] = A[1] & B[3];
    assign p2[2] = A[2] & B[3];
    assign p2[3] = A[3] & B[3];
    assign p2[4] = A[4] & B[3];

    assign p3[1] = A[1] & B[4];
    assign p3[2] = A[2] & B[4];
    assign p3[3] = A[3] & B[4];
    assign p3[4] = A[4] & B[4];
  
    assign prod[1] = p0[1];
    assign prod[2] = s11;
    assign prod[3] = s22;
    assign prod[4] = s32;
    assign prod[5] = s34;
    assign prod[6] = s35;
    assign prod[7] = s36;
    assign prod[8] = s37;

    HalfAdder ha11 (p0[2],p1[1],s11,c11);
    FullAdder fa12 (p0[3],p1[2],p2[1],s12,c12);
    FullAdder fa13 (p0[4],p1[3],p2[2],s13,c13);
    FullAdder fa14 (p1[4],p2[3],p3[2],s14,c14);
    HalfAdder ha15 (p2[4],p3[3],s15,c15);

    HalfAdder ha22 (c11,s12,s22,c22);
    FullAdder fa23 (p3[1],c12,s13,s23,c23);
    FullAdder fa24 (c13,c32,s14,s24,c24);
    FullAdder fa25 (c14,c24,s15,s25,c25);
    FullAdder fa26 (c15,c25,p3[4],s26,c26);

    HalfAdder ha32 (c22,s23,s32,c32);
    HalfAdder ha34 (c23,s24,s34,c34);
    HalfAdder ha35 (c34,s25,s35,c35);
    HalfAdder ha36 (c35,s26,s36,c36);
    HalfAdder ha37 (c36,c26,s37,c37);

endmodule