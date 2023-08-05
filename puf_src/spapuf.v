module spapuf(
    input pulse,
    input [15:0]challenge,
    output [15:0]response
);

papuf p0(challenge,pulse,response[0]);
papuf p1(challenge,pulse,response[1]);
papuf p2(challenge,pulse,response[2]);
papuf p3(challenge,pulse,response[3]);
papuf p4(challenge,pulse,response[4]);
papuf p5(challenge,pulse,response[5]);
papuf p6(challenge,pulse,response[6]);
papuf p7(challenge,pulse,response[7]);
papuf p8(challenge,pulse,response[8]);
papuf p9(challenge,pulse,response[9]);
papuf p10(challenge,pulse,response[10]);
papuf p11(challenge,pulse,response[11]);
papuf p12(challenge,pulse,response[12]);
papuf p13(challenge,pulse,response[13]);
papuf p14(challenge,pulse,response[14]);
papuf p15(challenge,pulse,response[15]);


endmodule