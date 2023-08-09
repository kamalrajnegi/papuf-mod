module apuf_16_16(
    input pulse,
    input [15:0]challenge,
    output [15:0]response
);

wire [15:0]res1,res2;

apuf_16_1 puf0(pulse,challenge,res1[15:12]);
apuf_16_1 puf1(pulse,challenge,res1[11:8]);
apuf_16_1 puf2(pulse,challenge,res1[7:4]);
apuf_16_1 puf3(pulse,challenge,res1[3:0]);

apuf_16_1 puf4(pulse,{challenge[7:0],challenge[15:8]},res2[15:12]);
apuf_16_1 puf5(pulse,{challenge[7:0],challenge[15:8]},res2[11:8]);
apuf_16_1 puf6(pulse,{challenge[7:0],challenge[15:8]},res2[7:4]);
apuf_16_1 puf7(pulse,{challenge[7:0],challenge[15:8]},res2[3:0]);

assign response = res1 ^ res2;

endmodule