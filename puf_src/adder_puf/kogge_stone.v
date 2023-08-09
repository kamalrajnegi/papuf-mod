module kogge_stone_16bit_lut(
input [15:0] A,B,
//output [15:0]sum,
output [15:0]carry
    );

//Generator
wire [15:0]p,g;
LUT2 #(.INIT(4'h8)) gen0 (.O(g[0]),.I0(B[0]),.I1(A[0]));
LUT2 #(.INIT(4'h8)) gen1 (.O(g[1]),.I0(B[1]),.I1(A[1]));
LUT2 #(.INIT(4'h8)) gen2 (.O(g[2]),.I0(B[2]),.I1(A[2]));
LUT2 #(.INIT(4'h8)) gen3 (.O(g[3]),.I0(B[3]),.I1(A[3]));
LUT2 #(.INIT(4'h8)) gen4 (.O(g[4]),.I0(B[4]),.I1(A[4]));
LUT2 #(.INIT(4'h8)) gen5 (.O(g[5]),.I0(B[5]),.I1(A[5]));
LUT2 #(.INIT(4'h8)) gen6 (.O(g[6]),.I0(B[6]),.I1(A[6]));
LUT2 #(.INIT(4'h8)) gen7 (.O(g[7]),.I0(B[7]),.I1(A[7]));
LUT2 #(.INIT(4'h8)) gen8 (.O(g[8]),.I0(B[8]),.I1(A[8]));
LUT2 #(.INIT(4'h8)) gen9 (.O(g[9]),.I0(B[9]),.I1(A[9]));
LUT2 #(.INIT(4'h8)) gen10 (.O(g[10]),.I0(B[10]),.I1(A[10]));
LUT2 #(.INIT(4'h8)) gen11 (.O(g[11]),.I0(B[11]),.I1(A[11]));
LUT2 #(.INIT(4'h8)) gen12 (.O(g[12]),.I0(B[12]),.I1(A[12]));
LUT2 #(.INIT(4'h8)) gen13 (.O(g[13]),.I0(B[13]),.I1(A[13]));
LUT2 #(.INIT(4'h8)) gen14 (.O(g[14]),.I0(B[14]),.I1(A[14]));
LUT2 #(.INIT(4'h8)) gen15 (.O(g[15]),.I0(B[15]),.I1(A[15]));

//propagator
LUT2 #(.INIT(4'hE)) pro0 (.O(p[0]),.I0(B[0]),.I1(A[0]));
LUT2 #(.INIT(4'hE)) pro1 (.O(p[1]),.I0(B[1]),.I1(A[1]));
LUT2 #(.INIT(4'hE)) pro2 (.O(p[2]),.I0(B[2]),.I1(A[2]));
LUT2 #(.INIT(4'hE)) pro3 (.O(p[3]),.I0(B[3]),.I1(A[3]));
LUT2 #(.INIT(4'hE)) pro4 (.O(p[4]),.I0(B[4]),.I1(A[4]));
LUT2 #(.INIT(4'hE)) pro5 (.O(p[5]),.I0(B[5]),.I1(A[5]));
LUT2 #(.INIT(4'hE)) pro6 (.O(p[6]),.I0(B[6]),.I1(A[6]));
LUT2 #(.INIT(4'hE)) pro7 (.O(p[7]),.I0(B[7]),.I1(A[7]));
LUT2 #(.INIT(4'hE)) pro8 (.O(p[8]),.I0(B[8]),.I1(A[8]));
LUT2 #(.INIT(4'hE)) pro9 (.O(p[9]),.I0(B[9]),.I1(A[9]));
LUT2 #(.INIT(4'hE)) pro10 (.O(p[10]),.I0(B[10]),.I1(A[10]));
LUT2 #(.INIT(4'hE)) pro11 (.O(p[11]),.I0(B[11]),.I1(A[11]));
LUT2 #(.INIT(4'hE)) pro12 (.O(p[12]),.I0(B[12]),.I1(A[12]));
LUT2 #(.INIT(4'hE)) pro13 (.O(p[13]),.I0(B[13]),.I1(A[13]));
LUT2 #(.INIT(4'hE)) pro14 (.O(p[14]),.I0(B[14]),.I1(A[14]));
LUT2 #(.INIT(4'hE)) pro15 (.O(p[15]),.I0(B[15]),.I1(A[15]));

//stage1
wire gs11,ps11,gs12,ps12,gs13,ps13,gs14,ps14,gs15,ps15,gs16,ps16,gs17,ps17;
wire gs18,ps18,gs19,ps19,gs110,ps110,gs111,ps111,gs112,ps112,gs113,ps113,gs114,ps114,gs115,ps115;
operator s11(g[1],p[1],g[0],1'b0,gs11,ps11);
operator s12(g[2],p[2],g[1],p[1],gs12,ps12);
operator s13(g[3],p[3],g[2],p[2],gs13,ps13);
operator s14(g[4],p[4],g[3],p[3],gs14,ps14);
operator s15(g[5],p[5],g[4],p[4],gs15,ps15);
operator s16(g[6],p[6],g[5],p[5],gs16,ps16);
operator s17(g[7],p[7],g[6],p[6],gs17,ps17);
operator s18(g[8],p[8],g[7],p[7],gs18,ps18);
operator s19(g[9],p[9],g[8],p[8],gs19,ps19);
operator s110(g[10],p[10],g[9],p[9],gs110,ps110);
operator s111(g[11],p[11],g[10],p[10],gs111,ps111);
operator s112(g[12],p[12],g[11],p[11],gs112,ps112);
operator s113(g[13],p[13],g[12],p[12],gs113,ps113);
operator s114(g[14],p[14],g[13],p[13],gs114,ps114);
operator s115(g[15],p[15],g[14],p[14],gs115,ps115);

//stage2

wire gs22,ps22,gs23,ps23,gs24,ps24,gs25,ps25,gs26,ps26,gs27,ps27;
wire gs28,ps28,gs29,ps29,gs210,ps210,gs211,ps211,gs212,ps212,gs213,ps213,gs214,ps214,gs215,ps215;

operator s22(gs12,ps12,g[0],p[0],gs22,ps22);
operator s23(gs13,ps13,gs11,ps11,gs23,ps23);
operator s24(gs14,ps14,gs12,ps12,gs24,ps24);
operator s25(gs15,ps15,gs13,ps13,gs25,ps25);
operator s26(gs16,ps16,gs14,ps14,gs26,ps26);
operator s27(gs17,ps17,gs15,ps15,gs27,ps27);
operator s28(gs18,ps18,gs16,ps16,gs28,ps28);
operator s29(gs19,ps19,gs17,ps17,gs29,ps29);
operator s210(gs110,ps110,gs18,ps18,gs210,ps210);
operator s211(gs111,ps111,gs19,ps19,gs211,ps211);
operator s212(gs112,ps112,gs110,ps110,gs212,ps212);
operator s213(gs113,ps113,gs111,ps111,gs213,ps213);
operator s214(gs114,ps114,gs112,ps112,gs214,ps214);
operator s215(gs115,ps115,gs113,ps113,gs215,ps215);

//stage3 
wire gs34,ps34,gs35,ps35,gs36,ps36,gs37,ps37;
wire gs38,ps38,gs39,ps39,gs310,ps310,gs311,ps311,gs312,ps312,gs313,ps313,gs314,ps314,gs315,ps315;

operator s34(gs24,ps24,g[0],p[0],gs34,ps34);
operator s35(gs25,ps25,gs11,ps11,gs35,ps35);
operator s36(gs26,ps26,gs22,ps22,gs36,ps36);
operator s37(gs27,ps27,gs23,ps23,gs37,ps37);
operator s38(gs28,ps28,gs24,ps24,gs38,ps38);
operator s39(gs29,ps29,gs25,ps25,gs39,ps39);
operator s310(gs210,ps210,gs26,ps26,gs310,ps310);
operator s311(gs211,ps211,gs27,ps27,gs311,ps311);
operator s312(gs212,ps212,gs28,ps28,gs312,ps312);
operator s313(gs213,ps213,gs29,ps29,gs313,ps313);
operator s314(gs214,ps214,gs210,ps210,gs314,ps314);
operator s315(gs215,ps215,gs211,ps211,gs315,ps315);


//stage4 carry calculation
wire gs48,ps48,gs49,ps49,gs410,ps410,gs411,ps411,gs412,ps412,gs413,ps413,gs414,ps414,gs415,ps415;

operator s48(gs38,ps38,g[0],p[0],gs48,ps48);
operator s49(gs39,ps39,gs11,ps11,gs49,ps49);
operator s410(gs310,ps310,gs22,ps22,gs410,ps410);
operator s411(gs311,ps311,gs23,ps23,gs411,ps411);
operator s412(gs312,ps312,gs34,ps34,gs412,ps412);
operator s413(gs313,ps313,gs35,ps35,gs413,ps413);
operator s414(gs314,ps314,gs36,ps36,gs414,ps414);
operator s415(gs315,ps315,gs37,ps37,gs415,ps415);


assign carry[0] = g[0];
assign carry[1] = gs11;
assign carry[2] = gs22;
assign carry[3] = gs23;
assign carry[4] = gs34;
assign carry[5] = gs35;
assign carry[6] = gs36;
assign carry[7] = gs37;
assign carry[8] = gs48;
assign carry[9] = gs49;
assign carry[10] = gs410;
assign carry[11] = gs411;
assign carry[12] = gs412;
assign carry[13] = gs413;
assign carry[14] = gs414;
assign carry[15] = gs415;

/*
assign sum[0] = A[0] ^ B[0];
assign sum[1] = A[1] ^ B[1] ^ carry[0];
assign sum[2] = A[2] ^ B[2] ^ carry[1];
assign sum[3] = A[3] ^ B[3] ^ carry[2];
assign sum[4] = A[4] ^ B[4] ^ carry[3];
assign sum[5] = A[5] ^ B[5] ^ carry[4];
assign sum[6] = A[6] ^ B[6] ^ carry[5];
assign sum[7] = A[7] ^ B[7] ^ carry[6];
assign sum[8] = A[8] ^ B[8] ^ carry[7];
assign sum[9] = A[9] ^ B[9] ^ carry[8];
assign sum[10] = A[10] ^ B[10] ^ carry[9];
assign sum[11] = A[11] ^ B[11] ^ carry[10];
assign sum[12] = A[12] ^ B[12] ^ carry[11];
assign sum[13] = A[13] ^ B[13] ^ carry[12];
assign sum[14] = A[14] ^ B[14] ^ carry[13];
assign sum[15] = A[15] ^ B[15] ^ carry[14];
*/


endmodule





module kogge_stone_8bit_lut(
input [7:0] A,B,
output [7:0]cout
//output [7:0]sum,
//output c1,c2,c3,c4,c5,c6,c7,c8//,c9,c10,c11,c12,c13,c14,c15,c16
    );

//Generator
wire [15:0]p,g;
LUT2 #(.INIT(4'h8)) gen0 (.O(g[0]),.I0(B[0]),.I1(A[0]));
LUT2 #(.INIT(4'h8)) gen1 (.O(g[1]),.I0(B[1]),.I1(A[1]));
LUT2 #(.INIT(4'h8)) gen2 (.O(g[2]),.I0(B[2]),.I1(A[2]));
LUT2 #(.INIT(4'h8)) gen3 (.O(g[3]),.I0(B[3]),.I1(A[3]));
LUT2 #(.INIT(4'h8)) gen4 (.O(g[4]),.I0(B[4]),.I1(A[4]));
LUT2 #(.INIT(4'h8)) gen5 (.O(g[5]),.I0(B[5]),.I1(A[5]));
LUT2 #(.INIT(4'h8)) gen6 (.O(g[6]),.I0(B[6]),.I1(A[6]));
LUT2 #(.INIT(4'h8)) gen7 (.O(g[7]),.I0(B[7]),.I1(A[7]));

//propagator
//LUT2 #(.INIT(4'hE)) pro0 (.O(p[0]),.I0(B[0]),.I1(A[0]));
LUT2 #(.INIT(4'hE)) pro1 (.O(p[1]),.I0(B[1]),.I1(A[1]));
LUT2 #(.INIT(4'hE)) pro2 (.O(p[2]),.I0(B[2]),.I1(A[2]));
LUT2 #(.INIT(4'hE)) pro3 (.O(p[3]),.I0(B[3]),.I1(A[3]));
LUT2 #(.INIT(4'hE)) pro4 (.O(p[4]),.I0(B[4]),.I1(A[4]));
LUT2 #(.INIT(4'hE)) pro5 (.O(p[5]),.I0(B[5]),.I1(A[5]));
LUT2 #(.INIT(4'hE)) pro6 (.O(p[6]),.I0(B[6]),.I1(A[6]));
LUT2 #(.INIT(4'hE)) pro7 (.O(p[7]),.I0(B[7]),.I1(A[7]));


//stage1
wire gs11,ps11,gs12,ps12,gs13,ps13,gs14,ps14,gs15,ps15,gs16,ps16,gs17,ps17;

operator s11(g[1],p[1],g[0],1'b0,gs11,ps11);
operator s12(g[2],p[2],g[1],p[1],gs12,ps12);
operator s13(g[3],p[3],g[2],p[2],gs13,ps13);
operator s14(g[4],p[4],g[3],p[3],gs14,ps14);
operator s15(g[5],p[5],g[4],p[4],gs15,ps15);
operator s16(g[6],p[6],g[5],p[5],gs16,ps16);
operator s17(g[7],p[7],g[6],p[6],gs17,ps17);

//stage2

wire gs22,ps22,gs23,ps23,gs24,ps24,gs25,ps25,gs26,ps26,gs27,ps27;
operator s22(gs12,ps12,g[0],p[0],gs22,ps22);
operator s23(gs13,ps13,gs11,ps11,gs23,ps23);
operator s24(gs14,ps14,gs12,ps12,gs24,ps24);
operator s25(gs15,ps15,gs13,ps13,gs25,ps25);
operator s26(gs16,ps16,gs14,ps14,gs26,ps26);
operator s27(gs17,ps17,gs15,ps15,gs27,ps27);

//stage3 carry calculation
wire gs34,ps34,gs35,ps35,gs36,ps36,gs37,ps37;

operator s34(gs24,ps24,g[0],p[0],gs34,ps34);
operator s35(gs25,ps25,gs11,ps11,gs35,ps35);
operator s36(gs26,ps26,gs22,ps22,gs36,ps36);
operator s37(gs27,ps27,gs23,ps23,gs37,ps37);





assign cout[0] = g[0];
assign cout[1] = gs11;
assign cout[2] = gs22;
assign cout[3] = gs23;
assign cout[4] = gs34;
assign cout[5] = gs35;
assign cout[6] = gs36;
assign cout[7] = gs37;

/*
assign sum[0] = A[0] ^ B[0];
assign sum[1] = A[1] ^ B[1] ^ c1;
assign sum[2] = A[2] ^ B[2] ^ c2;
assign sum[3] = A[3] ^ B[3] ^ c3;
assign sum[4] = A[4] ^ B[4] ^ c4;
assign sum[5] = A[5] ^ B[5] ^ c5;
assign sum[6] = A[6] ^ B[6] ^ c6;
assign sum[7] = A[7] ^ B[7] ^ c7;
*/


endmodule




module kogge_stone(
input [7:0] A,B,
output [7:0]sum,
output c1,c2,c3,c4,c5,c6,c7,c8//,c9,c10,c11,c12,c13,c14,c15,c16
    );

//Generator
(*DONT_TOUCH = "TRUE"*) wire [15:0]p,g;
LUT2 #(.INIT(4'h8)) gen0 (.O(g[0]),.I0(B[0]),.I1(A[0]));
LUT2 #(.INIT(4'h8)) gen1 (.O(g[1]),.I0(B[1]),.I1(A[1]));
LUT2 #(.INIT(4'h8)) gen2 (.O(g[2]),.I0(B[2]),.I1(A[2]));
LUT2 #(.INIT(4'h8)) gen3 (.O(g[3]),.I0(B[3]),.I1(A[3]));
LUT2 #(.INIT(4'h8)) gen4 (.O(g[4]),.I0(B[4]),.I1(A[4]));
LUT2 #(.INIT(4'h8)) gen5 (.O(g[5]),.I0(B[5]),.I1(A[5]));
LUT2 #(.INIT(4'h8)) gen6 (.O(g[6]),.I0(B[6]),.I1(A[6]));
LUT2 #(.INIT(4'h8)) gen7 (.O(g[7]),.I0(B[7]),.I1(A[7]));

//propagator
//LUT2 #(.INIT(4'hE)) pro0 (.O(p[0]),.I0(B[0]),.I1(A[0]));
LUT2 #(.INIT(4'hE)) pro1 (.O(p[1]),.I0(B[1]),.I1(A[1]));
LUT2 #(.INIT(4'hE)) pro2 (.O(p[2]),.I0(B[2]),.I1(A[2]));
LUT2 #(.INIT(4'hE)) pro3 (.O(p[3]),.I0(B[3]),.I1(A[3]));
LUT2 #(.INIT(4'hE)) pro4 (.O(p[4]),.I0(B[4]),.I1(A[4]));
LUT2 #(.INIT(4'hE)) pro5 (.O(p[5]),.I0(B[5]),.I1(A[5]));
LUT2 #(.INIT(4'hE)) pro6 (.O(p[6]),.I0(B[6]),.I1(A[6]));
LUT2 #(.INIT(4'hE)) pro7 (.O(p[7]),.I0(B[7]),.I1(A[7]));


//stage1
wire gs11,ps11,gs12,ps12,gs13,ps13,gs14,ps14,gs15,ps15,gs16,ps16,gs17,ps17;

asso_operator s11(g[1],p[1],g[0],1'b0,gs11,ps11);
asso_operator s12(g[2],p[2],g[1],p[1],gs12,ps12);
asso_operator s13(g[3],p[3],g[2],p[2],gs13,ps13);
asso_operator s14(g[4],p[4],g[3],p[3],gs14,ps14);
asso_operator s15(g[5],p[5],g[4],p[4],gs15,ps15);
asso_operator s16(g[6],p[6],g[5],p[5],gs16,ps16);
asso_operator s17(g[7],p[7],g[6],p[6],gs17,ps17);

//stage2

wire gs22,ps22,gs23,ps23,gs24,ps24,gs25,ps25,gs26,ps26,gs27,ps27;
asso_operator s22(gs12,ps12,g[0],p[0],gs22,ps22);
asso_operator s23(gs13,ps13,gs11,ps11,gs23,ps23);
asso_operator s24(gs14,ps14,gs12,ps12,gs24,ps24);
asso_operator s25(gs15,ps15,gs13,ps13,gs25,ps25);
asso_operator s26(gs16,ps16,gs14,ps14,gs26,ps26);
asso_operator s27(gs17,ps17,gs15,ps15,gs27,ps27);

//stage3 carry calculation
wire gs34,ps34,gs35,ps35,gs36,ps36,gs37,ps37;

asso_operator s34(gs24,ps24,g[0],p[0],gs34,ps34);
asso_operator s35(gs25,ps25,gs11,ps11,gs35,ps35);
asso_operator s36(gs26,ps26,gs22,ps22,gs36,ps36);
asso_operator s37(gs27,ps27,gs23,ps23,gs37,ps37);

assign c1 = g[0];
assign c2 = gs11;
assign c3 = gs22;
assign c4 = gs23;
assign c5 = gs34;
assign c6 = gs35;
assign c7 = gs36;
assign c8 = gs37;

assign sum[0] = A[0] ^ B[0];
assign sum[1] = A[1] ^ B[1] ^ c1;
assign sum[2] = A[2] ^ B[2] ^ c2;
assign sum[3] = A[3] ^ B[3] ^ c3;
assign sum[4] = A[4] ^ B[4] ^ c4;
assign sum[5] = A[5] ^ B[5] ^ c5;
assign sum[6] = A[6] ^ B[6] ^ c6;
assign sum[7] = A[7] ^ B[7] ^ c7;

endmodule


module asso_operator (
    input gi,pi,gj,pj,
    output G,P
);

assign G = gi | (pi & gj);
assign P = pi & pj;

endmodule


module operator(
    input gi,pi,gj,pj,
    output G,P);

(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *)
LUT3 #(.INIT(8'hEA)) op01 (.O(G),.I2(pi),.I1(gj),.I0(gi));
(* LOCK_PINS = "I1:A2, I0:A1" ,BEL="A6LUT" *)
LUT2 #(.INIT(4'h8)) op00 (.O(P),.I1(pi),.I0(pj));

endmodule