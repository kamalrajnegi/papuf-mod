module spuf_16_16(
    input pulse,
    input [15:0]challenge,
    output [15:0]response
);

wire [15:0]r1,r2;

(* DONT_TOUCH = "yes" *)arbiter_16_16 papuf0(pulse,challenge,r1);
(* DONT_TOUCH = "yes" *)arbiter_16_16 papuf1(pulse,{challenge[7:0],challenge[15:8]},r2);

assign response = r1 ^ r2;


endmodule