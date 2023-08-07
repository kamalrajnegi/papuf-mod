module papuf32(C,Data_in,R);
//  input rst;
     input [31:0] C;
     input Data_in;
//   input [1:0] sel;
     
     output  R;
    // output done;


(* DONT_TOUCH = "TRUE" *) wire [31:0] TY;
(* DONT_TOUCH = "TRUE" *) wire [31:0] BY;
(* DONT_TOUCH = "TRUE" *) wire [31:0] CY;
(* DONT_TOUCH = "TRUE" *) wire R0;
(* DONT_TOUCH = "TRUE" *) wire R1;
(* DONT_TOUCH = "TRUE" *) wire R2;
(* DONT_TOUCH = "TRUE" *) wire R3;
(* DONT_TOUCH = "TRUE" *) wire R4;


LUT3 #(
.INIT( 8'hCA) // initialization
)
MUX0(
.O(TY[0]), // output 
.I0(Data_in), // data1 
.I1(Data_in), // data2 
.I2(C[0]) // sel input for mux
);




LUT3 #(
.INIT( 8'hCA) // initialization
)
MUX1(
.O(BY[0]), // output 
.I0(Data_in), // data1 
.I1(Data_in), // data2 
.I2(C[0]) // sel input for mux
);



LUT3 #(
.INIT( 8'hCA) // initialization
)
CMUX0(
.O(CY[0]), // output 
.I0(Data_in), // data1 
.I1(Data_in), // data2 
.I2(C[0]) // sel input for mux
);




// stage 1 


LUT3 #(.INIT( 8'hCA)) TMUX1(.O(TY[1]),.I0(CY[0]),.I1(BY[0]),.I2(C[1]));

LUT3 #(.INIT( 8'hCA)) CMUX1(.O(CY[1]),.I0(BY[0]),.I1(TY[0]),.I2(C[1]));

LUT3 #(.INIT( 8'hCA)) BMUX1(.O(BY[1]),.I0(TY[0]),.I1(CY[0]),.I2(C[1])); 

// stage 2


LUT3 #(.INIT( 8'hCA)) TMUX2(.O(TY[2]),.I0(CY[1]),.I1(BY[1]),.I2(C[2]));

LUT3 #(.INIT( 8'hCA)) CMUX2(.O(CY[2]),.I0(BY[1]),.I1(TY[1]),.I2(C[2]));

LUT3 #(.INIT( 8'hCA)) BMUX2(.O(BY[2]),.I0(TY[1]),.I1(CY[1]),.I2(C[2]));

// stage 3



LUT3 #(.INIT( 8'hCA)) TMUX3(.O(TY[3]),.I0(CY[2]),.I1(BY[2]),.I2(C[3]));

LUT3 #(.INIT( 8'hCA)) CMUX3(.O(CY[3]),.I0(BY[2]),.I1(TY[2]),.I2(C[3]));

LUT3 #(.INIT( 8'hCA)) BMUX3(.O(BY[3]),.I0(TY[2]),.I1(CY[2]),.I2(C[3]));

// stage 4


LUT3 #(.INIT( 8'hCA)) TMUX4(.O(TY[4]),.I0(CY[3]),.I1(BY[3]),.I2(C[4]));

LUT3 #(.INIT( 8'hCA)) CMUX4(.O(CY[4]),.I0(BY[3]),.I1(TY[3]),.I2(C[4]));

LUT3 #(.INIT( 8'hCA)) BMUX4(.O(BY[4]),.I0(TY[3]),.I1(CY[3]),.I2(C[4]));

// stage 5



LUT3 #(.INIT( 8'hCA)) TMUX5(.O(TY[5]),.I0(CY[4]),.I1(BY[4]),.I2(C[5]));

LUT3 #(.INIT( 8'hCA)) CMUX5(.O(CY[5]),.I0(BY[4]),.I1(TY[4]),.I2(C[5]));

LUT3 #(.INIT( 8'hCA)) BMUX5(.O(BY[5]),.I0(TY[4]),.I1(CY[4]),.I2(C[5]));

// stage 6



LUT3 #(.INIT( 8'hCA)) TMUX6(.O(TY[6]),.I0(CY[5]),.I1(BY[5]),.I2(C[6]));

LUT3 #(.INIT( 8'hCA)) CMUX6(.O(CY[6]),.I0(BY[5]),.I1(TY[5]),.I2(C[6]));

LUT3 #(.INIT( 8'hCA)) BMUX6(.O(BY[6]),.I0(TY[5]),.I1(CY[5]),.I2(C[6]));


// stage 7


LUT3 #(.INIT( 8'hCA)) BMUX7(.O(BY[7]),.I0(CY[6]),.I1(BY[6]),.I2(C[7]));

LUT3 #(.INIT( 8'hCA)) CMUX7(.O(CY[7]),.I0(BY[6]),.I1(TY[6]),.I2(C[7]));

LUT3 #(.INIT( 8'hCA)) TMUX7(.O(TY[7]),.I0(TY[6]),.I1(CY[6]),.I2(C[7]));



// stage 8 

LUT3 #(.INIT( 8'hCA)) TMUX8(.O(TY[8]),.I0(CY[7]),.I1(BY[7]),.I2(C[8]));

LUT3 #(.INIT( 8'hCA)) CMUX8(.O(CY[8]),.I0(BY[7]),.I1(TY[7]),.I2(C[8]));

LUT3 #(.INIT( 8'hCA)) BMUX8(.O(BY[8]),.I0(TY[7]),.I1(CY[7]),.I2(C[8]));

// stage 9


LUT3 #(.INIT( 8'hCA)) TMUX9(.O(TY[9]),.I0(CY[8]),.I1(BY[8]),.I2(C[9]));

LUT3 #(.INIT( 8'hCA)) CMUX9(.O(CY[9]),.I0(BY[8]),.I1(TY[8]),.I2(C[9]));

LUT3 #(.INIT( 8'hCA)) BMUX9(.O(BY[9]),.I0(TY[8]),.I1(CY[8]),.I2(C[9]));


// stage 10

LUT3 #(.INIT( 8'hCA)) TMUX10(.O(TY[10]),.I0(CY[9]),.I1(BY[9]),.I2(C[10]));

LUT3 #(.INIT( 8'hCA)) CMUX10(.O(CY[10]),.I0(BY[9]),.I1(TY[9]),.I2(C[10]));

LUT3 #(.INIT( 8'hCA)) BMUX10(.O(BY[10]),.I0(TY[9]),.I1(CY[9]),.I2(C[10]));

// stage 11

LUT3 #(.INIT( 8'hCA)) TMUX11(.O(TY[11]),.I0(CY[10]),.I1(BY[10]),.I2(C[11]));

LUT3 #(.INIT( 8'hCA)) CMUX11(.O(CY[11]),.I0(BY[10]),.I1(TY[10]),.I2(C[11]));

LUT3 #(.INIT( 8'hCA)) BMUX11(.O(BY[11]),.I0(TY[10]),.I1(CY[10]),.I2(C[11]));

// stage 12


LUT3 #(.INIT( 8'hCA)) TMUX12(.O(TY[12]),.I0(CY[11]),.I1(BY[11]),.I2(C[12]));

LUT3 #(.INIT( 8'hCA)) CMUX12(.O(CY[12]),.I0(BY[11]),.I1(TY[11]),.I2(C[12]));

LUT3 #(.INIT( 8'hCA)) BMUX12(.O(BY[12]),.I0(TY[11]),.I1(CY[11]),.I2(C[12]));


// stage 13
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) TMUX13(.O(TY[13]),.I0(CY[12]),.I1(BY[12]),.I2(C[13]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) CMUX13(.O(CY[13]),.I0(BY[12]),.I1(TY[12]),.I2(C[13]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) BMUX13(.O(BY[13]),.I0(TY[12]),.I1(CY[12]),.I2(C[13]));


//stage 14
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) TMUX14(.O(TY[14]),.I0(CY[13]),.I1(BY[13]),.I2(C[14]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) CMUX14(.O(CY[14]),.I0(BY[13]),.I1(TY[13]),.I2(C[14]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) BMUX14(.O(BY[14]),.I0(TY[13]),.I1(CY[13]),.I2(C[14]));

//stage 15
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) TMUX15(.O(TY[15]),.I0(CY[14]),.I1(BY[14]),.I2(C[15]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) CMUX15(.O(CY[15]),.I0(BY[14]),.I1(TY[14]),.I2(C[15]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) BMUX15(.O(BY[15]),.I0(TY[14]),.I1(CY[14]),.I2(C[15]));



// stage 16

LUT3 #(.INIT( 8'hCA)) TMUX16(.O(TY[16]),.I0(CY[15]),.I1(BY[15]),.I2(C[16]));

LUT3 #(.INIT( 8'hCA)) CMUX16(.O(CY[16]),.I0(BY[15]),.I1(TY[15]),.I2(C[16]));

LUT3 #(.INIT( 8'hCA)) BMUX16(.O(BY[16]),.I0(TY[15]),.I1(CY[15]),.I2(C[16])); 

// stage 17


LUT3 #(.INIT( 8'hCA)) TMUX17(.O(TY[17]),.I0(CY[16]),.I1(BY[16]),.I2(C[17]));

LUT3 #(.INIT( 8'hCA)) CMUX17(.O(CY[17]),.I0(BY[16]),.I1(TY[16]),.I2(C[17]));

LUT3 #(.INIT( 8'hCA)) BMUX17(.O(BY[17]),.I0(TY[16]),.I1(CY[16]),.I2(C[17])); 

// stage 18


LUT3 #(.INIT( 8'hCA)) TMUX18(.O(TY[18]),.I0(CY[17]),.I1(BY[17]),.I2(C[18]));

LUT3 #(.INIT( 8'hCA)) CMUX18(.O(CY[18]),.I0(BY[17]),.I1(TY[17]),.I2(C[18]));

LUT3 #(.INIT( 8'hCA)) BMUX18(.O(BY[18]),.I0(TY[17]),.I1(CY[17]),.I2(C[18]));

// stage 19

LUT3 #(.INIT( 8'hCA)) TMUX19(.O(TY[19]),.I0(CY[18]),.I1(BY[18]),.I2(C[19]));

LUT3 #(.INIT( 8'hCA)) CMUX19(.O(CY[19]),.I0(BY[18]),.I1(TY[18]),.I2(C[19]));

LUT3 #(.INIT( 8'hCA)) BMUX19(.O(BY[19]),.I0(TY[18]),.I1(CY[18]),.I2(C[19]));

// stage 20

LUT3 #(.INIT( 8'hCA)) TMUX20(.O(TY[20]),.I0(CY[19]),.I1(BY[19]),.I2(C[20]));

LUT3 #(.INIT( 8'hCA)) CMUX20(.O(CY[20]),.I0(BY[19]),.I1(TY[19]),.I2(C[20]));

LUT3 #(.INIT( 8'hCA)) BMUX20(.O(BY[20]),.I0(TY[19]),.I1(CY[19]),.I2(C[20]));

// stage 21

LUT3 #(.INIT( 8'hCA)) TMUX21(.O(TY[21]),.I0(CY[20]),.I1(BY[20]),.I2(C[21]));

LUT3 #(.INIT( 8'hCA)) CMUX21(.O(CY[21]),.I0(BY[20]),.I1(TY[20]),.I2(C[21]));

LUT3 #(.INIT( 8'hCA)) BMUX21(.O(BY[21]),.I0(TY[20]),.I1(CY[20]),.I2(C[21]));

// stage 22

LUT3 #(.INIT( 8'hCA)) TMUX22(.O(TY[22]),.I0(CY[21]),.I1(BY[21]),.I2(C[22]));

LUT3 #(.INIT( 8'hCA)) CMUX22(.O(CY[22]),.I0(BY[21]),.I1(TY[21]),.I2(C[22]));

LUT3 #(.INIT( 8'hCA)) BMUX22(.O(BY[22]),.I0(TY[21]),.I1(CY[21]),.I2(C[22]));


// stage 23

LUT3 #(.INIT( 8'hCA)) BMUX23(.O(BY[23]),.I0(CY[22]),.I1(BY[22]),.I2(C[23]));

LUT3 #(.INIT( 8'hCA)) CMUX23(.O(CY[23]),.I0(BY[22]),.I1(TY[22]),.I2(C[23]));

LUT3 #(.INIT( 8'hCA)) TMUX23(.O(TY[23]),.I0(TY[22]),.I1(CY[22]),.I2(C[23]));



// stage 24

LUT3 #(.INIT( 8'hCA)) TMUX24(.O(TY[24]),.I0(CY[23]),.I1(BY[23]),.I2(C[24]));

LUT3 #(.INIT( 8'hCA)) CMUX24(.O(CY[24]),.I0(BY[23]),.I1(TY[23]),.I2(C[24]));

LUT3 #(.INIT( 8'hCA)) BMUX24(.O(BY[24]),.I0(TY[23]),.I1(CY[23]),.I2(C[24]));

// stage 25

LUT3 #(.INIT( 8'hCA)) TMUX25(.O(TY[25]),.I0(CY[24]),.I1(BY[24]),.I2(C[25]));

LUT3 #(.INIT( 8'hCA)) CMUX25(.O(CY[25]),.I0(BY[24]),.I1(TY[24]),.I2(C[25]));

LUT3 #(.INIT( 8'hCA)) BMUX25(.O(BY[25]),.I0(TY[24]),.I1(CY[24]),.I2(C[25]));


// stage 26

LUT3 #(.INIT( 8'hCA)) TMUX26(.O(TY[26]),.I0(CY[25]),.I1(BY[25]),.I2(C[26]));

LUT3 #(.INIT( 8'hCA)) CMUX26(.O(CY[26]),.I0(BY[25]),.I1(TY[25]),.I2(C[26]));

LUT3 #(.INIT( 8'hCA)) BMUX26(.O(BY[26]),.I0(TY[25]),.I1(CY[25]),.I2(C[26]));

// stage 27

LUT3 #(.INIT( 8'hCA)) TMUX27(.O(TY[27]),.I0(CY[26]),.I1(BY[26]),.I2(C[27]));

LUT3 #(.INIT( 8'hCA)) CMUX27(.O(CY[27]),.I0(BY[26]),.I1(TY[26]),.I2(C[27]));

LUT3 #(.INIT( 8'hCA)) BMUX27(.O(BY[27]),.I0(TY[26]),.I1(CY[26]),.I2(C[27]));

// stage 28

LUT3 #(.INIT( 8'hCA)) TMUX28(.O(TY[28]),.I0(CY[27]),.I1(BY[27]),.I2(C[28]));

LUT3 #(.INIT( 8'hCA)) CMUX28(.O(CY[28]),.I0(BY[27]),.I1(TY[27]),.I2(C[28]));

LUT3 #(.INIT( 8'hCA)) BMUX28(.O(BY[28]),.I0(TY[27]),.I1(CY[27]),.I2(C[28]));


// stage 29
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) TMUX29(.O(TY[29]),.I0(CY[28]),.I1(BY[28]),.I2(C[29]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) CMUX29(.O(CY[29]),.I0(BY[28]),.I1(TY[28]),.I2(C[29]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) BMUX29(.O(BY[29]),.I0(TY[28]),.I1(CY[28]),.I2(C[29]));


//stage 30
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) TMUX30(.O(TY[30]),.I0(CY[29]),.I1(BY[29]),.I2(C[30]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) CMUX30(.O(CY[30]),.I0(BY[29]),.I1(TY[29]),.I2(C[30]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) BMUX30(.O(BY[30]),.I0(TY[29]),.I1(CY[29]),.I2(C[30]));

//stage 31
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) TMUX31(.O(TY[31]),.I0(CY[30]),.I1(BY[30]),.I2(C[31]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) CMUX31(.O(CY[31]),.I0(BY[30]),.I1(TY[30]),.I2(C[31]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) BMUX31(.O(BY[31]),.I0(TY[30]),.I1(CY[30]),.I2(C[31]));


//----------------------------------- Priority Arbiter --------------------------------------
//(* LOCK_PINS="ALL"*)  
FD #(.INIT(0)) FF_PArb9(.Q(R0),.C(BY[31]),.D(TY[31]));
//(* LOCK_PINS="ALL"*) 
FD #(.INIT(0)) FF_PArb10(.Q(R1),.C(CY[31]),.D(BY[31]));
//(* LOCK_PINS="ALL"*)
FD #(.INIT(0)) FF_PArb11(.Q(R2),.C(TY[31]),.D(BY[31]));

(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) MUX_OUT(.O(R3),.I0(R0),.I1(R1),.I2(R2));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) MUX_OUT1(.O(R4),.I0(R1),.I1(R2),.I2(R0));

assign R = R3 ^ R4;


endmodule