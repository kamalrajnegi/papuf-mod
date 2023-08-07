module papuf_16_32(
    input pulse,
    input [15:0] challenge,
    output [31:0]response
);

genvar i;

generate 
for(i = 0; i<32 ; i=i+1)
    papuf_16_1 puf(challenge,pulse,response[i]);
endgenerate

endmodule



