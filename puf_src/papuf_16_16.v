module papuf_16_16(
    input pulse,
    input [15:0]challenge,
    output [15:0]response
);

papuf_16_1 p0(challenge,pulse,response[0]);
papuf_16_1 p1(challenge,pulse,response[1]);
papuf_16_1 p2(challenge,pulse,response[2]);
papuf_16_1 p3(challenge,pulse,response[3]);
papuf_16_1 p4(challenge,pulse,response[4]);
papuf_16_1 p5(challenge,pulse,response[5]);
papuf_16_1 p6(challenge,pulse,response[6]);
papuf_16_1 p7(challenge,pulse,response[7]);
papuf_16_1 p8(challenge,pulse,response[8]);
papuf_16_1 p9(challenge,pulse,response[9]);
papuf_16_1 p10(challenge,pulse,response[10]);
papuf_16_1 p11(challenge,pulse,response[11]);
papuf_16_1 p12(challenge,pulse,response[12]);
papuf_16_1 p13(challenge,pulse,response[13]);
papuf_16_1 p14(challenge,pulse,response[14]);
papuf_16_1 p15(challenge,pulse,response[15]);


endmodule