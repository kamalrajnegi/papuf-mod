`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:46:23 12/18/2017 
// Design Name: 
// Module Name:    LFSR_16_PUFTRNG 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module LFSR_16_PUFTRNG(
    input clk,start_new,next_LFSR,
    input [15:0] C,
    output [15:0] R,
     output reg en
    );



reg start;
reg done;
reg [3:0] cnt;
assign F = R[15] ^ R[11] ^ R[1] ^ R[0]; /// ---- 6319 @7  6311 @8
//assign F = R[15] ^ R[11] ^ R[10] ^ R[1] ^ R[0]; ----- worst 
//assign F = R[15] ^ R[11] ^ R[13] ^ R[1] ^ R[0]; --- 5596 @8
//assign F = R[15] ^ R[13] ^ R[11] ^ R[10] ^ R[12] ^ R[0];  ///  5807 @8 7 max 
//15 13 12 10 

always @ (posedge clk)
begin
if(!start_new) 
   begin
     start <= 1'b0;
     en<=1'b0;
     cnt<=4'd1;
     done <= 1'b0;
    end
else 
 begin
      if(next_LFSR)
      begin
         start <= 1'b1;
         en<=1'b0;
         cnt<=4'd1;
         done <= 1'b0;
      end
else
begin
  if(cnt < 4'd12) 
    begin
        start <=1'b1;
        en<=1'b0;
        cnt <= cnt + 1'b1;
        done <= 1'b1;
    end
   else
    begin
        start <= 1'b1;
        en <= 1'b1;
        cnt <= 4'd15;
        done <= 1'b1;
    end

end
end
end







DFF_initial DFF0(clk,en,start,C[0],F,R[0]);
DFF_initial DFF1(clk,en,start,C[1],R[0],R[1]);
DFF_initial DFF2(clk,en,start,C[2],R[1],R[2]);
DFF_initial DFF3(clk,en,start,C[3],R[2],R[3]);
DFF_initial DFF4(clk,en,start,C[4],R[3],R[4]);
DFF_initial DFF5(clk,en,start,C[5],R[4],R[5]);
DFF_initial DFF6(clk,en,start,C[6],R[5],R[6]);
DFF_initial DFF7(clk,en,start,C[7],R[6],R[7]);
DFF_initial DFF8(clk,en,start,C[8],R[7],R[8]);
DFF_initial DFF9(clk,en,start,C[9],R[8],R[9]);
DFF_initial DFF10(clk,en,start,C[10],R[9],R[10]);
DFF_initial DFF11(clk,en,start,C[11],R[10],R[11]);
DFF_initial DFF12(clk,en,start,C[12],R[11],R[12]);
DFF_initial DFF13(clk,en,start,C[13],R[12],R[13]);
DFF_initial DFF14(clk,en,start,C[14],R[13],R[14]);
DFF_initial DFF15(clk,en,start,C[15],R[14],R[15]);



endmodule

module DFF_initial(
    input clk,en,start,
    input Di,D,
    output reg Q
    );

//reg cnt;
//initial cnt<= 1'b0;

always @ (posedge clk)
begin
if(!en) begin
 if(!start) Q <=Di ;  //  load the initial value;
    else Q <=D ;   //  load the load the present value;
end 
else 
begin
Q<=Q;
end
end
//end




endmodule
