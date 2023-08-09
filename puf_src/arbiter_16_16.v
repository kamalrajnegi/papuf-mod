module arbiter_16_16(
    input pulse,
    input [15:0]challenge,
    output [15:0]response
);

arbiter_16_1 p0(pulse,challenge,response[0]);
arbiter_16_1 p1(pulse,challenge,response[1]);
arbiter_16_1 p2(pulse,challenge,response[2]);
arbiter_16_1 p3(pulse,challenge,response[3]);
arbiter_16_1 p4(pulse,challenge,response[4]);
arbiter_16_1 p5(pulse,challenge,response[5]);
arbiter_16_1 p6(pulse,challenge,response[6]);
arbiter_16_1 p7(pulse,challenge,response[7]);
arbiter_16_1 p8(pulse,challenge,response[8]);
arbiter_16_1 p9(pulse,challenge,response[9]);
arbiter_16_1 p10(pulse,challenge,response[10]);
arbiter_16_1 p11(pulse,challenge,response[11]);
arbiter_16_1 p12(pulse,challenge,response[12]);
arbiter_16_1 p13(pulse,challenge,response[13]);
arbiter_16_1 p14(pulse,challenge,response[14]);
arbiter_16_1 p15(pulse,challenge,response[15]);


endmodule