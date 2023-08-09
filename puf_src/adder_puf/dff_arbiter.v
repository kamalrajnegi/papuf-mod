module dff_arbiter(
    input [3:0]in,
    output [3:0]out
);

reg out0,out1,out2,out3;

always @ (posedge in[0])begin
    out0 = in[3];
end

always @ (posedge in[1])begin
    out1 = in[0];
end

always @ (posedge in[2])begin
    out2 = in[1];
end

always @ (posedge in[3])begin
    out3 = in[2];
end

assign out = {out3,out2,out1,out0};

endmodule