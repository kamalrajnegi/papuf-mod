module apuf_16_1(
    input pulse,
    input [15:0]challenge,
    output [3:0]response
);

(* dont_touch = "yes" *) wire [15:0]carry0,carry1,carry3,carry4,carry5,carry6,carry7,carry8,A;

wire [7:0]ls0,ls1;

//stage0
kogge_stone_16bit_lut puf0({16{pulse}},challenge,carry0);
kogge_stone_16bit_lut puf1({16{pulse}},challenge,carry1);


wire [7:0]carry2;
//last stage
wire [3:0]ls;
kogge_stone_8bit_lut puf3(carry0[15:8],carry1[15:8],carry2);
dff_arbiter arb3(carry2[7:4],ls);

assign response = {ls[0], ls[1], ls[2] , ls[3]};


endmodule