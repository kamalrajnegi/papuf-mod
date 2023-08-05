module puf16xor(
    input pulse,
    input [15:0]challenge,
    output [15:0]response
);

wire [15:0]r1,r2;

(* DONT_TOUCH = "yes" *)spapuf papuf0(pulse,challenge,r1);
(* DONT_TOUCH = "yes" *)spapuf papuf1(pulse,{challenge[15],challenge[13],challenge[11],challenge[9],challenge[7],challenge[5],challenge[3],challenge[1],challenge[14],challenge[12],challenge[10],challenge[8],challenge[6],challenge[4],challenge[2],challenge[0]},r2);

assign response = r1 ^ r2;


endmodule