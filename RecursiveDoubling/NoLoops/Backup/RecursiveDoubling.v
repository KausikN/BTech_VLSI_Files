//`include "Full_adder.v"
module RecursiveDoubling(a, b, sum, cout);


input [15 : 0] a, b;
output reg [15 : 0] sum;
output reg cout;


wire [31 : 0] cla, cla1, cla2, cla3, cla4;


reg d = 1'b1;
reg e = 1'b1;

assign cla[1] = 1'b0;
assign cla[0] = a[0] & b[0];  
//always @(*) begin
  //$display("%b %b // %b %b", cla[0], cla[1], a[0], b[0]);
//end
generate
  genvar i;  
  for (i = 1; i < 16; i = i + 1)
    begin : gen1
        assign cla[2*i] = a[i] | b[i];
        assign cla[2*i + 1] = a[i]^b[i]; 
        //always @(*) begin       
                //$display("c = %b, d = %b, a = %b, b = %b", cla[2*i + 1], cla[2*i], a[i], b[i]);
        //end
    end
endgenerate 




generate
  genvar j;
  genvar t;
  assign cla1[0] = cla[0];
  assign cla1[1] = cla[1];
  for (j = 0; j < 29; j = j + 2)
    begin : gen2
        assign cla1[30 - j + 1] = (cla[30 - j + 1] & cla[30 - j - 1]);
        assign cla1[30 - j] = (~cla[30 - j + 1])&(cla[30 - j]) | (cla[30 - j] & cla[30 - j - 2]);

        //always @(*) begin
                //$display("1 %d ", 30 - j);
                //$display("before - c = %b, d = %b, a = %b, b = %b", cla1[30 - (j - 1)], cla1[30 - (j)], cla1[30 - (j + 1)], cla1[30 - (j + 2)]);
                //$display("after - c = %b, d = %b, a = %b, b = %b",  cla1[30 - (j - 1)], cla1[30 - (j)], cla1[30 - (j + 1)], cla1[30 - (j + 2)]);
        //end
    end
endgenerate


generate
  assign cla2[0] = cla1 [0];
  assign cla2[1] = cla1 [1];
  assign cla2[2] = cla1 [2];
  assign cla2[3] = cla1 [3];
  for (j = 0; j < 27; j = j + 2)
    begin : gen3
        assign  cla2[30 - j + 1] = (cla1[30 - j + 1] & cla1[30 - j - 3]);
        assign  cla2[30 - j] = (~cla1[30 - j + 1])&(cla1[30 - j]) | (cla1[30 - j] & cla1[30 - j - 4]);
        //always @(*) begin
                //$display("2 %d ", 30 - j);
                //$display("before - c = %b, d = %b, a = %b, b = %b", cla2[30 - (j - 1)], cla[30 - (j)], cla2[30 - (j + 3)], cla2[30 - (j + 4)]);
                //$display("after - c = %b, d = %b, a = %b, b = %b",  cla2[30 - (j - 1)], cla[30 - (j)], cla2[30 - (j + 3)], cla2[30 - (j + 4)]);
        //end
    end
endgenerate


generate
  assign cla3[0] = cla2[0];
  assign cla3[1] = cla2[1];
  assign cla3[2] = cla2[2];
  assign cla3[3] = cla2[3];
  assign cla3[4] = cla2[4];
  assign cla3[5] = cla2[5];
  assign cla3[6] = cla2[6];
  assign cla3[7] = cla2[7];
  for (j = 0; j < 23; j = j + 2)
    begin : gen4
        assign cla3[30 - j + 1] = (cla2[30 - j + 1] & cla2[30 - j - 7]);
        assign cla3[30 - j] = (~cla2[30 - j + 1])&(cla2[30 - j]) | (cla2[30 - j] & cla2[30 - j - 8]);
        //always @(*) begin
                //$display("3 %d ", 30 - j);
                //$display("before - c = %b, d = %b, a = %b, b = %b", cla3[30 - (j - 1)], cla3[30 - (j)], cla3[30 - (j + 7)], cla3[30 - (j + 8)]);
                //$display("after - c = %b, d = %b, a = %b, b = %b",  cla3[30 - (j - 1)], cla3[30 - (j)], cla3[30 - (j + 7)], cla3[30 - (j + 8)]);
        //end
    end
endgenerate

generate
  assign cla4[0] = cla3[0];
  assign cla4[1] = cla3[1];
  assign cla4[2] = cla3[2];
  assign cla4[3] = cla3[3];
  assign cla4[4] = cla3[4];
  assign cla4[5] = cla3[5];
  assign cla4[6] = cla3[6];
  assign cla4[7] = cla3[7];
  assign cla4[8] = cla3[8];
  assign cla4[9] = cla3[9];
  assign cla4[10] = cla3[10];
  assign cla4[11] = cla3[11];
  assign cla4[12] = cla3[12];
  assign cla4[13] = cla3[13];
  assign cla4[14] = cla3[14];
  assign cla4[15] = cla3[15];
  
  for (j = 0; j < 15; j = j + 2)
        begin : gen5
        assign cla4[30 - j + 1] = (cla3[30 - j + 1] & cla3[30 - j - 7]);
        assign cla4[30 - j] = (~cla3[30 - j + 1])&(cla3[30 - j]) | (cla3[30 - j] & cla3[30 - j - 8]);
        //always @(j) begin
                //$display("4 %d ", 30 - j);
                //$display("before - c = %b, d = %b, a = %b, b = %b", cla4[30 - (j - 1)], cla4[30 - (j)], cla4[30 - (j + 15)], cla4[30 - (j + 16)]);
                //$display("after - c = %b, d = %b, a = %b, b = %b",  cla4[30 - (j - 1)], cla4[30 - (j)], cla4[30 - (j + 15)], cla4[30 - (j + 16)]);
        //end
    end
endgenerate

generate
  genvar k;
  always @* begin
    sum[0] = a[0] ^ b[0];
    cout = cla4[30];
  end
  for(k = 1; k < 16; k = k + 1)
  begin : gen6
    always @(*) begin
      sum[k] = a[k] ^ b[k] ^ cla4[2*(k - 1)];
      //$display("sum[%d] = %b", k, sum[k]);
    end
  end
endgenerate












// always @* begin
//     if(a[0] ^ b[0] == 0)
//         begin
//             cla[0] = a[0];
//             cla[1] = 1'b0;
//         end
//     else
//         begin
//             cla[0] = 1'b0;
//             cla[1] = 1'b1;
//         end
//     if(a[1] ^ b[1] == 0)
//         begin
//             cla[2] = a[1];
//             cla[3] = 1'b0;
//         end
//     else
//         begin
//             cla[1] = 2'b10;;
//         end
//     if(a[2] ^ b[2] == 0)
//         begin
//             cla[4] = a[2];
//             cla[5] = 1'b0;
//         end
//     else
//         begin
//             cla[4] = 1'b0;
//             cla[5] = 1'b1;
//         end
//     if(a[3] ^ b[3] == 0)
//         begin
//             cla[6] = a[3];
//             cla[7] = 1'b0;
//         end
//     else
//         begin
//             cla[6] = 1'b0;
//             cla[7] = 1'b1;
//         end
//     if(a[4] ^ b[4] == 0)
//         begin
//             cla[8] = a[4];
//             cla[9] = 1'b0;
//         end
//     else
//         begin
//             cla[8] = 1'b0;
//             cla[9] = 1'b1;
//         end
//     if(a[5] ^ b[5] == 0)
//         begin
//             cla[10] = a[5];
//             cla[11] = 1'b0;
//         end
//     else
//         begin
//             cla[10] = 1'b0;
//             cla[11] = 1'b1;
//         end
//     if(a[6] ^ b[6] == 0)
//         begin
//             cla[12] = a[6];
//             cla[13] = 1'b0;
//         end
//     else
//         begin
//             cla[12] = 1'b0;
//             cla[13] = 1'b1;
//         end
//     if(a[7] ^ b[7] == 0)
//         begin
//             cla[14] = a[7];
//             cla[15] = 1'b0;
//         end
//     else
//         begin
//             cla[14] = 1'b0;
//             cla[15] = 1'b1;
//         end
//     if(a[8] ^ b[8] == 0)
//         begin
//             cla[16] = a[8];
//             cla[17] = 1'b0;
//         end
//     else
//         begin
//             cla[16] = 1'b0;
//             cla[17] = 1'b1;
//         end
//     if(a[9] ^ b[9] == 0)
//         begin
//             cla[18] = a[9];
//             cla[19] = 1'b0;
//         end
//     else
//         begin
//             cla[18] = 1'b0;
//             cla[19] = 1'b1;
//         end
//     if(a[10] ^ b[10] == 0)
//         begin
//             cla[20] = a[10];
//             cla[21] = 1'b0;;
//         end
//     else
//         begin
//             cla[20] = 1'b0;
//             cla[21] = 1'b1;
//         end
//     if(a[11] ^ b[11] == 0)
//         begin
//             cla[22] = a[11];
//             cla[23] = 1'b0;
//         end
//     else
//         begin
//             cla[22] = 1'b0;
//             cla[23] = 1'b1;
//         end
//     if(a[12] ^ b[12] == 0)
//         begin
//             cla[24] = a[12];
//             cla[25] = 1'b0;
//         end
//     else
//         begin
//             cla[24] = 1'b0;
//             cla[25] = 1'b1;
//         end
//     if(a[13] ^ b[13] == 0)
//         begin
//             cla[26] = a[13];
//             cla[27] = 1'b0;
//         end
//     else
//         begin
//             cla[26] = 1'b0;
//             cla[27] = 1'b1;
//         end
//     if(a[14] ^ b[14] == 0)
//         begin
//             cla[28] = a[14];
//             cla[29] = 1'b0;
//         end
//     else
//         begin
//             cla[28] = 1'b0;
//             cla[29] = 1'b1;
//         end
//     if(a[15] ^ b[15] == 0)
//         begin
//                 cla[30] = a[15];
//                 cla[31] = 1'b0;
//         end
//     else
//         begin
//             cla[30] = 1'b0;
//             cla[31] = 1'b1;
//         end
// end

// //recursive doubling for 1

// always @* begin

//     i = 31;
//     while(i>1)
//         begin
//             if(cla[i] == 1'b1 && cla[i - 1] == 1'b0)
//             begin
//                 cla[i] = cla[i-2];
//                 cla[i-1] = cla[i-3];
//             end
//                 i = i - 2;
//         end

// end



// // always @* begin
// //     if(cla[31] == 1'b1 && cla[30] == 1'b0)
// //         cla[31] = cla[29];
// //         cla[30] = cla[28];
// //     if(cla[29] == 1'b1 && cla[28] == 1'b0)
// //         cla[29] = cla[27];
// //         cla[28] = cla[26];
// //     if(cla[27] == 1'b1 && cla[26] == 1'b0)
// //         cla[27] = cla[25];
// //         cla[26] = cla[24];
// //     if(cla[25] == 1'b1 && cla[24] == 1'b0)
// //         cla[25] = cla[23];
// //         cla[24] = cla[22];
// //     if(cla[23] == 1'b1 && cla[22] == 1'b0)
// //         cla[23] = cla[21];
// //         cla[22] = cla[20];
// //     if(cla[21] == 1'b1 && cla[20] == 1'b0)
// //         cla[21] = cla[19];
// //         cla[20] = cla[18];
// //     if(cla[19] == 1'b1 && cla[18] == 1'b0)
// //         cla[19] = cla[17];
// //         cla[18] = cla[16];
// //     if(cla[17] == 1'b1 && cla[16] == 1'b0)
// //         cla[17] = cla[15];
// //         cla[16] = cla[14];
// //     if(cla[15] == 1'b1 && cla[14] == 1'b0)
// //         cla[15] = cla[13];
// //         cla[14] = cla[12];
// //     if(cla[13] == 1'b1 && cla[12] == 1'b0)
// //         cla[13] = cla[11];
// //         cla[12] = cla[10];
// //     if(cla[11] == 1'b1 && cla[10] == 1'b0)
// //         cla[11] = cla[9];
// //         cla[10] = cla[8];
// //     if(cla[9] == 1'b1 && cla[8] == 1'b0)
// //         cla[9] = cla[7];
// //         cla[8] = cla[6];
// //     if(cla[7] == 1'b1 && cla[6] == 1'b0)
// //         cla[7] = cla[5];
// //         cla[6] = cla[4];
// //     if(cla[5] == 1'b1 && cla[4] == 1'b0)
// //         cla[5] = cla[3];
// //         cla[4] = cla[2];
// //     if(cla[3] == 1'b1 && cla[2] == 1'b0)
// //         cla[3] = cla[1];
// //         cla[2] = cla[0];
// // end

// // // // rd for 2

// always @ (i) begin
//     i = 31;
//     while(i>3)
//         begin
//             if(cla[i] == 1'b1 && cla[i - 1] == 1'b0)
//             begin
//                 cla[i] = cla[i-4];
//                 cla[i-1] = cla[i-5];
//             end
//                 i = i - 2;
//             //$display("%d", i);
//         end


// end
// // always @*begin
// //     if(cla[31] == 1'b1 && cla[30] == 1'b0)
// //         cla[31] = cla[27];
// //         cla[30] = cla[26];
// //     if(cla[29] == 1'b1 && cla[28] == 1'b0)
// //         cla[29] = cla[25];
// //         cla[28] = cla[24];
// //     if(cla[27] == 1'b1 && cla[26] == 1'b0)
// //         cla[27] = cla[23];
// //         cla[26] = cla[22];
// //     if(cla[25] == 1'b1 && cla[24] == 1'b0)
// //         cla[25] = cla[21];
// //         cla[24] = cla[20];
// //     if(cla[23] == 1'b1 && cla[22] == 1'b0)
// //         cla[23] = cla[19];
// //         cla[22] = cla[18];
// //     if(cla[21] == 1'b1 && cla[20] == 1'b0)
// //         cla[21] = cla[17];
// //         cla[20] = cla[16];
// //     if(cla[19] == 1'b1 && cla[18] == 1'b0)
// //         cla[19] = cla[15];
// //         cla[18] = cla[14];
// //     if(cla[17] == 1'b1 && cla[16] == 1'b0)
// //         cla[17] = cla[13];
// //         cla[16] = cla[12];
// //     if(cla[15] == 1'b1 && cla[14] == 1'b0)
// //         cla[15] = cla[11];
// //         cla[14] = cla[10];
// //     if(cla[13] == 1'b1 && cla[12] == 1'b0)
// //         cla[13] = cla[9];
// //         cla[12] = cla[8];
// //     if(cla[11] == 1'b1 && cla[10] == 1'b0)
// //         cla[11] = cla[7];
// //         cla[10] = cla[6];
// //     if(cla[9] == 1'b1 && cla[8] == 1'b0)
// //         cla[9] = cla[5];
// //         cla[8] = cla[4];
// //     if(cla[7] == 1'b1 && cla[6] == 1'b0)
// //         cla[7] = cla[3];
// //         cla[6] = cla[2];
// //     if(cla[5] == 1'b1 && cla[4] == 1'b0)
// //         cla[5] = cla[1];
// //         cla[4] = cla[0];

// // end

// // // // //rd for 4
// // always @* begin

// //     i = 31;
// //     while(i>7)
// //         begin
// //             if(cla[i] == 1'b1 && cla[i - 1] == 1'b0)
// //             begin
// //                 cla[i] = cla[i-8];
// //                 cla[i-1] = cla[i-9];
// //             end
// //                 i = i - 2;
// //         end

// // end

// // always @*begin
// // if(cla[31] == 1'b1 && cla[30] == 1'b0)
// //         cla[31] = cla[25];
// //         cla[30] = cla[24];
// //     if(cla[29] == 1'b1 && cla[28] == 1'b0)
// //         cla[29] = cla[23];
// //         cla[28] = cla[22];
// //     if(cla[27] == 1'b1 && cla[26] == 1'b0)
// //         cla[27] = cla[19];
// //         cla[26] = cla[18];
// //     if(cla[25] == 1'b1 && cla[24] == 1'b0)
// //         cla[25] = cla[17];
// //         cla[24] = cla[16];
// //     if(cla[23] == 1'b1 && cla[22] == 1'b0)
// //         cla[23] = cla[15];
// //         cla[22] = cla[14];
// //     if(cla[21] == 1'b1 && cla[20] == 1'b0)
// //         cla[21] = cla[13];
// //         cla[20] = cla[12];
// //     if(cla[19] == 1'b1 && cla[18] == 1'b0)
// //         cla[19] = cla[11];
// //         cla[18] = cla[10];
// //     if(cla[17] == 1'b1 && cla[16] == 1'b0)
// //         cla[17] = cla[9];
// //         cla[16] = cla[8];
// //     if(cla[15] == 1'b1 && cla[14] == 1'b0)
// //         cla[15] = cla[7];
// //         cla[14] = cla[6];
// //     if(cla[13] == 1'b1 && cla[12] == 1'b0)
// //         cla[13] = cla[5];
// //         cla[12] = cla[4];
// //     if(cla[11] == 1'b1 && cla[10] == 1'b0)
// //         cla[11] = cla[3];
// //         cla[10] = cla[2];
// //     if(cla[9] == 1'b1 && cla[8] == 1'b0)
// //         cla[9] = cla[1];
// //         cla[8] = cla[0];



// // end

// // // // // rd for 8
// // always @* begin

// //     i = 31;
// //     while(i>15)
// //         begin
// //             if(cla[i] == 1'b1 && cla[i - 1] == 1'b0)
// //             begin
// //                 cla[i] = cla[i-16];
// //                 cla[i-1] = cla[i-17];
// //             end
// //                 i = i - 2;
// //         end

// // end

// // always @*begin
// // if(cla[31] == 1'b1 && cla[30] == 1'b0)
// //         cla[31] = cla[15];
// //         cla[30] = cla[14];
// //     if(cla[29] == 1'b1 && cla[28] == 1'b0)
// //         cla[29] = cla[13];
// //         cla[28] = cla[12];
// //     if(cla[27] == 1'b1 && cla[26] == 1'b0)
// //         cla[27] = cla[11];
// //         cla[26] = cla[10];
// //     if(cla[25] == 1'b1 && cla[24] == 1'b0)
// //         cla[25] = cla[9];
// //         cla[24] = cla[8];
// //     if(cla[23] == 1'b1 && cla[22] == 1'b0)
// //         cla[23] = cla[7];
// //         cla[22] = cla[6];
// //     if(cla[21] == 1'b1 && cla[20] == 1'b0)
// //         cla[21] = cla[5];
// //         cla[20] = cla[4];
// //     if(cla[19] == 1'b1 && cla[18] == 1'b0)
// //         cla[19] = cla[3];
// //         cla[18] = cla[2];
// //     if(cla[17] == 1'b1 && cla[16] == 1'b0)
// //         cla[17] = cla[1];
// //         cla[16] = cla[0];
// // end


// // reg [14 : 0] c;
// // integer i;
// // // Full_adder fa0(a[0], b[0], 1'b0, sum[0], c[0]);
// // // Full_adder fa1(a[1], b[1], cla[0], sum[1], c[1]);

// // // Full_adder fa2(a[2], b[2], cla[1], sum[2], c[2]);
// // // Full_adder fa3(a[3], b[3], cla[2], sum[3], c[3]);


// // // Full_adder fa4(a[4], b[4], cla[3], sum[4], c[4]);
// // // Full_adder fa5(a[5], b[5], cla[4], sum[5], c[5]);


// // // Full_adder fa6(a[6], b[6], cla[5], sum[6], c[6]);
// // // Full_adder fa7(a[7], b[7], cla[6], sum[7], c[7]);

// // // Full_adder fa8(a[8], b[9], cla[7], sum[8], c[8]);
// // // Full_adder fa9(a[9], b[9], cla[8], sum[9], c[9]);


// // // Full_adder fa10(a[10], b[10], cla[9], sum[10], c[10]);
// // // Full_adder fa11(a[11], b[11], cla[10], sum[11], c[11]);

// // // Full_adder fa12(a[12], b[12], cla[11], sum[12], c[12]);
// // // Full_adder fa13(a[13], b[13], cla[12], sum[13], c[13]);


// // // Full_adder fa14(a[14], b[14], cla[13], sum[14], c[14]);
// // // Full_adder fa15(a[15], b[15], cla[14], sum[15], cout);

// // always @* begin


endmodule
