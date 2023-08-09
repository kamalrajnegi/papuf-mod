module arbiter_16_1(
    input pulse,
    input [15:0]challenge,
    output response
);


(* DONT_TOUCH = "TRUE" *)wire [15:0]TW,BW;


(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) TMUX0(.O(TW[0]),.I0(pulse),.I1(pulse),.I2(challenge[0]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) BMUX0(.O(BW[0]),.I0(pulse),.I1(pulse),.I2(challenge[0]));


(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) TMUX1(.O(TW[1]),.I0(TW[0]),.I1(BW[0]),.I2(challenge[1]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) BMUX1(.O(BW[1]),.I0(BW[0]),.I1(TW[0]),.I2(challenge[1]));

(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) TMUX2(.O(TW[2]),.I0(TW[1]),.I1(BW[1]),.I2(challenge[2]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) BMUX2(.O(BW[2]),.I0(BW[1]),.I1(TW[1]),.I2(challenge[2]));


(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) TMUX3(.O(TW[3]),.I0(TW[2]),.I1(BW[2]),.I2(challenge[3]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) BMUX3(.O(BW[3]),.I0(BW[2]),.I1(TW[2]),.I2(challenge[3]));

(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) TMUX4(.O(TW[4]),.I0(TW[3]),.I1(BW[3]),.I2(challenge[4]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) BMUX4(.O(BW[4]),.I0(BW[3]),.I1(TW[3]),.I2(challenge[4]));

(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) TMUX5(.O(TW[5]),.I0(TW[4]),.I1(BW[4]),.I2(challenge[5]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) BMUX5(.O(BW[5]),.I0(BW[4]),.I1(TW[4]),.I2(challenge[5]));

(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) TMUX6(.O(TW[6]),.I0(TW[5]),.I1(BW[5]),.I2(challenge[6]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) BMUX6(.O(BW[6]),.I0(BW[5]),.I1(TW[5]),.I2(challenge[6]));

(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) TMUX7(.O(TW[7]),.I0(TW[6]),.I1(BW[6]),.I2(challenge[7]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) BMUX7(.O(BW[7]),.I0(BW[6]),.I1(TW[6]),.I2(challenge[7]));

(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) TMUX8(.O(TW[8]),.I0(TW[7]),.I1(BW[7]),.I2(challenge[8]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) BMUX8(.O(BW[8]),.I0(BW[7]),.I1(TW[7]),.I2(challenge[8]));

(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) TMUX9(.O(TW[9]),.I0(TW[8]),.I1(BW[8]),.I2(challenge[9]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) BMUX9(.O(BW[9]),.I0(BW[8]),.I1(TW[8]),.I2(challenge[9]));

(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) TMUX10(.O(TW[10]),.I0(TW[9]),.I1(BW[9]),.I2(challenge[10]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) BMUX10(.O(BW[10]),.I0(BW[9]),.I1(TW[9]),.I2(challenge[10]));

(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) TMUX11(.O(TW[11]),.I0(TW[10]),.I1(BW[10]),.I2(challenge[11]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) BMUX11(.O(BW[11]),.I0(BW[10]),.I1(TW[10]),.I2(challenge[11]));

(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) TMUX12(.O(TW[12]),.I0(TW[11]),.I1(BW[11]),.I2(challenge[12]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) BMUX12(.O(BW[12]),.I0(BW[11]),.I1(TW[11]),.I2(challenge[12]));

(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) TMUX13(.O(TW[13]),.I0(TW[12]),.I1(BW[12]),.I2(challenge[13]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) BMUX13(.O(BW[13]),.I0(BW[12]),.I1(TW[12]),.I2(challenge[13]));

(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) TMUX14(.O(TW[14]),.I0(TW[13]),.I1(BW[13]),.I2(challenge[14]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) BMUX14(.O(BW[14]),.I0(BW[13]),.I1(TW[13]),.I2(challenge[14]));

(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) TMUX15(.O(TW[15]),.I0(TW[14]),.I1(BW[14]),.I2(challenge[15]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) BMUX15(.O(BW[15]),.I0(BW[14]),.I1(TW[14]),.I2(challenge[15]));


FD #(.INIT(0)) FF_PArb9(.Q(response),.C(BW[15]),.D(TW[15]));

endmodule