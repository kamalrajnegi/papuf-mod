module spapuf_16_32(
    input pulse,
    input [15:0]challenge,
    output [31:0]response
);


wire [31:0]r1,r2;

(* DONT_TOUCH = "yes" *)papuf_16_32 papuf0(pulse,challenge,r1);
(* DONT_TOUCH = "yes" *)papuf_16_32 papuf1(pulse,{challenge[7:0],challenge[15:8]},r2);

assign response = r1 ^ r2;


endmodule