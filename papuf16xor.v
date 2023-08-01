module papuf16xor(
    input pulse,
    input [15:0]challenge,
    output [15:0]response
);

// wire [15:0]r1,r2;

// (* DONT_TOUCH = "yes" *)papuf16A papuf0(pulse,challenge,r1);
// (* DONT_TOUCH = "yes" *)papuf16B papuf1(pulse,{challenge[7:0],challenge[15:8]},r2);

// assign response = r1 ^ r2;



PPUF_LONGER p0(challenge,pulse,response[0]);
PPUF_LONGER p1(challenge,pulse,response[1]);
PPUF_LONGER p2(challenge,pulse,response[2]);
PPUF_LONGER p3(challenge,pulse,response[3]);
PPUF_LONGER p4(challenge,pulse,response[4]);
PPUF_LONGER p5(challenge,pulse,response[5]);
PPUF_LONGER p6(challenge,pulse,response[6]);
PPUF_LONGER p7(challenge,pulse,response[7]);
PPUF_LONGER p8(challenge,pulse,response[8]);
PPUF_LONGER p9(challenge,pulse,response[9]);
PPUF_LONGER p10(challenge,pulse,response[10]);
PPUF_LONGER p11(challenge,pulse,response[11]);
PPUF_LONGER p12(challenge,pulse,response[12]);
PPUF_LONGER p13(challenge,pulse,response[13]);
PPUF_LONGER p14(challenge,pulse,response[14]);
PPUF_LONGER p15(challenge,pulse,response[15]);

endmodule