module spapuf(
    input pulse,
    input [15:0]challenge,
    output [15:0]response
);

wire [15:0]res1,res2;


papuf_ff1 p0(challenge,pulse,res1[0]);
papuf_ff1 p1(challenge,pulse,res1[1]);
papuf_ff1 p2(challenge,pulse,res1[2]);
papuf_ff1 p3(challenge,pulse,res1[3]);
papuf_ff1 p4(challenge,pulse,res1[4]);
papuf_ff1 p5(challenge,pulse,res1[5]);
papuf_ff1 p6(challenge,pulse,res1[6]);
papuf_ff1 p7(challenge,pulse,res1[7]);
papuf_ff1 p8(challenge,pulse,res1[8]);
papuf_ff1 p9(challenge,pulse,res1[9]);
papuf_ff1 p10(challenge,pulse,res1[10]);
papuf_ff1 p11(challenge,pulse,res1[11]);
papuf_ff1 p12(challenge,pulse,res1[12]);
papuf_ff1 p13(challenge,pulse,res1[13]);
papuf_ff1 p14(challenge,pulse,res1[14]);
papuf_ff1 p15(challenge,pulse,res1[15]);

papuf_ff1 q0(challenge,pulse,res2[0]);
papuf_ff1 q1(challenge,pulse,res2[1]);
papuf_ff1 q2(challenge,pulse,res2[2]);
papuf_ff1 q3(challenge,pulse,res2[3]);
papuf_ff1 q4(challenge,pulse,res2[4]);
papuf_ff1 q5(challenge,pulse,res2[5]);
papuf_ff1 q6(challenge,pulse,res2[6]);
papuf_ff1 q7(challenge,pulse,res2[7]);
papuf_ff1 q8(challenge,pulse,res2[8]);
papuf_ff1 q9(challenge,pulse,res2[9]);
papuf_ff1 q10(challenge,pulse,res2[10]);
papuf_ff1 q11(challenge,pulse,res2[11]);
papuf_ff1 q12(challenge,pulse,res2[12]);
papuf_ff1 q13(challenge,pulse,res2[13]);
papuf_ff1 q14(challenge,pulse,res2[14]);
papuf_ff1 q15(challenge,pulse,res2[15]);

assign response = res1 ^ res2;

endmodule