
module BitWiseAND(A, B, p);
    
    input [16:1] A;
    input B;

    output [16:1] p;

    assign p[1] = A[1] & B;
    assign p[2] = A[2] & B;
    assign p[3] = A[3] & B;
    assign p[4] = A[4] & B;
    assign p[5] = A[1] & B;
    assign p[6] = A[2] & B;
    assign p[7] = A[3] & B;
    assign p[8] = A[4] & B;
    assign p[9] = A[1] & B;
    assign p[10] = A[2] & B;
    assign p[11] = A[3] & B;
    assign p[12] = A[4] & B;
    assign p[13] = A[1] & B;
    assign p[14] = A[2] & B;
    assign p[15] = A[3] & B;
    assign p[16] = A[4] & B;

endmodule