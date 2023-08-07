module papuf32_32(
    input pulse,
    input [31:0] challenge,
    output [31:0]response
);


wire [31:0]res1,res2;

genvar i;

generate 
for(i = 0; i<32 ; i=i+1)
    papuf32 puf(challenge,pulse,res1[i]);
endgenerate

generate 
for(i = 0; i<32 ; i=i+1)
    papuf32 puf({challenge[15:0],challenge[31:16]},pulse,res2[i]);
endgenerate

assign response = res1 ^ res2;

endmodule