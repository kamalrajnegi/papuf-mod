module papuf16A(
    input pulse,
    input [15:0]challenge,
    output [15:0]response
);


(* DONT_TOUCH = "yes" *)wire [15:0]response;

(* DONT_TOUCH = "yes" *)PPUF_LONGERA p0(challenge,pulse,response[0]);
(* DONT_TOUCH = "yes" *)PPUF_LONGERA p1(challenge,pulse,response[1]);
(* DONT_TOUCH = "yes" *)PPUF_LONGERA p2(challenge,pulse,response[2]);
(* DONT_TOUCH = "yes" *)PPUF_LONGERA p3(challenge,pulse,response[3]);
(* DONT_TOUCH = "yes" *)PPUF_LONGERA p4(challenge,pulse,response[4]);
(* DONT_TOUCH = "yes" *)PPUF_LONGERA p5(challenge,pulse,response[5]);
(* DONT_TOUCH = "yes" *)PPUF_LONGERA p6(challenge,pulse,response[6]);
(* DONT_TOUCH = "yes" *)PPUF_LONGERA p7(challenge,pulse,response[7]);
(* DONT_TOUCH = "yes" *)PPUF_LONGERA p8(challenge,pulse,response[8]);
(* DONT_TOUCH = "yes" *)PPUF_LONGERA p9(challenge,pulse,response[9]);
(* DONT_TOUCH = "yes" *)PPUF_LONGERA p10(challenge,pulse,response[10]);
(* DONT_TOUCH = "yes" *)PPUF_LONGERA p11(challenge,pulse,response[11]);
(* DONT_TOUCH = "yes" *)PPUF_LONGERA p12(challenge,pulse,response[12]);
(* DONT_TOUCH = "yes" *)PPUF_LONGERA p13(challenge,pulse,response[13]);
(* DONT_TOUCH = "yes" *)PPUF_LONGERA p14(challenge,pulse,response[14]);
(* DONT_TOUCH = "yes" *)PPUF_LONGERA p15(challenge,pulse,response[15]);

endmodule


module papuf16B(
    input pulse,
    input [15:0]challenge,
    output [15:0]response
);


(* DONT_TOUCH = "yes" *)wire [15:0]response;

(* DONT_TOUCH = "yes" *)PPUF_LONGERB p0(challenge,pulse,response[0]);
(* DONT_TOUCH = "yes" *)PPUF_LONGERB p1(challenge,pulse,response[1]);
(* DONT_TOUCH = "yes" *)PPUF_LONGERB p2(challenge,pulse,response[2]);
(* DONT_TOUCH = "yes" *)PPUF_LONGERB p3(challenge,pulse,response[3]);
(* DONT_TOUCH = "yes" *)PPUF_LONGERB p4(challenge,pulse,response[4]);
(* DONT_TOUCH = "yes" *)PPUF_LONGERB p5(challenge,pulse,response[5]);
(* DONT_TOUCH = "yes" *)PPUF_LONGERB p6(challenge,pulse,response[6]);
(* DONT_TOUCH = "yes" *)PPUF_LONGERB p7(challenge,pulse,response[7]);
(* DONT_TOUCH = "yes" *)PPUF_LONGERB p8(challenge,pulse,response[8]);
(* DONT_TOUCH = "yes" *)PPUF_LONGERB p9(challenge,pulse,response[9]);
(* DONT_TOUCH = "yes" *)PPUF_LONGERB p10(challenge,pulse,response[10]);
(* DONT_TOUCH = "yes" *)PPUF_LONGERB p11(challenge,pulse,response[11]);
(* DONT_TOUCH = "yes" *)PPUF_LONGERB p12(challenge,pulse,response[12]);
(* DONT_TOUCH = "yes" *)PPUF_LONGERB p13(challenge,pulse,response[13]);
(* DONT_TOUCH = "yes" *)PPUF_LONGERB p14(challenge,pulse,response[14]);
(* DONT_TOUCH = "yes" *)PPUF_LONGERB p15(challenge,pulse,response[15]);

endmodule