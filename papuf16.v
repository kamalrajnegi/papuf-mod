module papuf16A(
    input pulse,
    input [15:0]challenge,
    output [15:0]response
);


(* DONT_TOUCH = "yes" *)wire [15:0]response;

(* DONT_TOUCH = "yes" *)PPUF_LONGER p0(challenge,pulse,response[0]);
(* DONT_TOUCH = "yes" *)PPUF_LONGER p1(challenge,pulse,response[1]);
(* DONT_TOUCH = "yes" *)PPUF_LONGER p2(challenge,pulse,response[2]);
(* DONT_TOUCH = "yes" *)PPUF_LONGER p3(challenge,pulse,response[3]);
(* DONT_TOUCH = "yes" *)PPUF_LONGER p4(challenge,pulse,response[4]);
(* DONT_TOUCH = "yes" *)PPUF_LONGER p5(challenge,pulse,response[5]);
(* DONT_TOUCH = "yes" *)PPUF_LONGER p6(challenge,pulse,response[6]);
(* DONT_TOUCH = "yes" *)PPUF_LONGER p7(challenge,pulse,response[7]);
(* DONT_TOUCH = "yes" *)PPUF_LONGER p8(challenge,pulse,response[8]);
(* DONT_TOUCH = "yes" *)PPUF_LONGER p9(challenge,pulse,response[9]);
(* DONT_TOUCH = "yes" *)PPUF_LONGER p10(challenge,pulse,response[10]);
(* DONT_TOUCH = "yes" *)PPUF_LONGER p11(challenge,pulse,response[11]);
(* DONT_TOUCH = "yes" *)PPUF_LONGER p12(challenge,pulse,response[12]);
(* DONT_TOUCH = "yes" *)PPUF_LONGER p13(challenge,pulse,response[13]);
(* DONT_TOUCH = "yes" *)PPUF_LONGER p14(challenge,pulse,response[14]);
(* DONT_TOUCH = "yes" *)PPUF_LONGER p15(challenge,pulse,response[15]);

endmodule


module papuf16B(
    input pulse,
    input [15:0]challenge,
    output [15:0]response
);


(* DONT_TOUCH = "yes" *)wire [15:0]response;

(* DONT_TOUCH = "yes" *)PPUF_LONGER p0(challenge,pulse,response[0]);
(* DONT_TOUCH = "yes" *)PPUF_LONGER p1(challenge,pulse,response[1]);
(* DONT_TOUCH = "yes" *)PPUF_LONGER p2(challenge,pulse,response[2]);
(* DONT_TOUCH = "yes" *)PPUF_LONGER p3(challenge,pulse,response[3]);
(* DONT_TOUCH = "yes" *)PPUF_LONGER p4(challenge,pulse,response[4]);
(* DONT_TOUCH = "yes" *)PPUF_LONGER p5(challenge,pulse,response[5]);
(* DONT_TOUCH = "yes" *)PPUF_LONGER p6(challenge,pulse,response[6]);
(* DONT_TOUCH = "yes" *)PPUF_LONGER p7(challenge,pulse,response[7]);
(* DONT_TOUCH = "yes" *)PPUF_LONGER p8(challenge,pulse,response[8]);
(* DONT_TOUCH = "yes" *)PPUF_LONGER p9(challenge,pulse,response[9]);
(* DONT_TOUCH = "yes" *)PPUF_LONGER p10(challenge,pulse,response[10]);
(* DONT_TOUCH = "yes" *)PPUF_LONGER p11(challenge,pulse,response[11]);
(* DONT_TOUCH = "yes" *)PPUF_LONGER p12(challenge,pulse,response[12]);
(* DONT_TOUCH = "yes" *)PPUF_LONGER p13(challenge,pulse,response[13]);
(* DONT_TOUCH = "yes" *)PPUF_LONGER p14(challenge,pulse,response[14]);
(* DONT_TOUCH = "yes" *)PPUF_LONGER p15(challenge,pulse,response[15]);

endmodule