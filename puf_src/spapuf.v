module spapuf(
    input pulse,
    input [15:0]challenge,
    output [15:0]response
);

wire [15:0]res1,res2;


papuf p0(challenge,pulse,res1[0]);
papuf p1(challenge,pulse,res1[1]);
papuf p2(challenge,pulse,res1[2]);
papuf p3(challenge,pulse,res1[3]);
papuf p4(challenge,pulse,res1[4]);
papuf p5(challenge,pulse,res1[5]);
papuf p6(challenge,pulse,res1[6]);
papuf p7(challenge,pulse,res1[7]);
papuf p8(challenge,pulse,res1[8]);
papuf p9(challenge,pulse,res1[9]);
papuf p10(challenge,pulse,res1[10]);
papuf p11(challenge,pulse,res1[11]);
papuf p12(challenge,pulse,res1[12]);
papuf p13(challenge,pulse,res1[13]);
papuf p14(challenge,pulse,res1[14]);
papuf p15(challenge,pulse,res1[15]);

papuf q0(challenge,pulse,res2[0]);
papuf q1(challenge,pulse,res2[1]);
papuf q2(challenge,pulse,res2[2]);
papuf q3(challenge,pulse,res2[3]);
papuf q4(challenge,pulse,res2[4]);
papuf q5(challenge,pulse,res2[5]);
papuf q6(challenge,pulse,res2[6]);
papuf q7(challenge,pulse,res2[7]);
papuf q8(challenge,pulse,res2[8]);
papuf q9(challenge,pulse,res2[9]);
papuf q10(challenge,pulse,res2[10]);
papuf q11(challenge,pulse,res2[11]);
papuf q12(challenge,pulse,res2[12]);
papuf q13(challenge,pulse,res2[13]);
papuf q14(challenge,pulse,res2[14]);
papuf q15(challenge,pulse,res2[15]);

assign response = res1 ^ res2;

endmodule