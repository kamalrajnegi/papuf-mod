module papuf(C,Data_in,R);
//  input rst;
     input [15:0] C;
     input Data_in;
//   input [1:0] sel;
     
     output  R;
    // output done;


(* DONT_TOUCH = "TRUE" *) wire [15:0] TY;
(* DONT_TOUCH = "TRUE" *) wire [15:0] BY;
(* DONT_TOUCH = "TRUE" *) wire [15:0] CY;
(* DONT_TOUCH = "TRUE" *) wire R0;
(* DONT_TOUCH = "TRUE" *) wire R1;
(* DONT_TOUCH = "TRUE" *) wire R2;
(* DONT_TOUCH = "TRUE" *) wire R3;
(* DONT_TOUCH = "TRUE" *) wire R4;


//wire [39:0] TY,BY,CY; //0,TY1,TY2,TY3,TY4,TY5,TY6,TY7;    
//wire BY0,BY1,BY2,BY3,BY4,BY5,BY6,BY7; 



//wire [23:0] FR;
//wire R0,R1,R2;
//reg R;




(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(
.INIT( 8'hCA) // initialization
)
MUX0(
.O(TY[0]), // output 
.I0(Data_in), // data1 
.I1(Data_in), // data2 
.I2(C[0]) // sel input for mux
);



(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(
.INIT( 8'hCA) // initialization
)
MUX1(
.O(BY[0]), // output 
.I0(Data_in), // data1 
.I1(Data_in), // data2 
.I2(C[0]) // sel input for mux
);


(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
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

(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) TMUX1(.O(TY[1]),.I0(CY[0]),.I1(BY[0]),.I2(C[1]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) CMUX1(.O(CY[1]),.I0(BY[0]),.I1(TY[0]),.I2(C[1]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) BMUX1(.O(BY[1]),.I0(TY[0]),.I1(CY[0]),.I2(C[1])); 

// stage 2

(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) TMUX2(.O(TY[2]),.I0(CY[1]),.I1(BY[1]),.I2(C[2]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) CMUX2(.O(CY[2]),.I0(BY[1]),.I1(TY[1]),.I2(C[2]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) BMUX2(.O(BY[2]),.I0(TY[1]),.I1(CY[1]),.I2(C[2]));

// stage 3


(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) TMUX3(.O(TY[3]),.I0(CY[2]),.I1(BY[2]),.I2(C[3]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) CMUX3(.O(CY[3]),.I0(BY[2]),.I1(TY[2]),.I2(C[3]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) BMUX3(.O(BY[3]),.I0(TY[2]),.I1(CY[2]),.I2(C[3]));

// stage 4

(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) TMUX4(.O(TY[4]),.I0(CY[3]),.I1(BY[3]),.I2(C[4]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) CMUX4(.O(CY[4]),.I0(BY[3]),.I1(TY[3]),.I2(C[4]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) BMUX4(.O(BY[4]),.I0(TY[3]),.I1(CY[3]),.I2(C[4]));

// stage 5


(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) TMUX5(.O(TY[5]),.I0(CY[4]),.I1(BY[4]),.I2(C[5]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) CMUX5(.O(CY[5]),.I0(BY[4]),.I1(TY[4]),.I2(C[5]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) BMUX5(.O(BY[5]),.I0(TY[4]),.I1(CY[4]),.I2(C[5]));

// stage 6


(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) TMUX6(.O(TY[6]),.I0(CY[5]),.I1(BY[5]),.I2(C[6]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) CMUX6(.O(CY[6]),.I0(BY[5]),.I1(TY[5]),.I2(C[6]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) BMUX6(.O(BY[6]),.I0(TY[5]),.I1(CY[5]),.I2(C[6]));


// stage 7

(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) BMUX7(.O(BY[7]),.I0(CY[6]),.I1(BY[6]),.I2(C[7]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) CMUX7(.O(CY[7]),.I0(BY[6]),.I1(TY[6]),.I2(C[7]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) TMUX7(.O(TY[7]),.I0(TY[6]),.I1(CY[6]),.I2(C[7]));


////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////




// stage 8 



(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) TMUX8(.O(TY[8]),.I0(CY[7]),.I1(BY[7]),.I2(C[8]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) CMUX8(.O(CY[8]),.I0(BY[7]),.I1(TY[7]),.I2(C[8]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) BMUX8(.O(BY[8]),.I0(TY[7]),.I1(CY[7]),.I2(C[8]));

// stage 9

(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) TMUX9(.O(TY[9]),.I0(CY[8]),.I1(BY[8]),.I2(C[9]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) CMUX9(.O(CY[9]),.I0(BY[8]),.I1(TY[8]),.I2(C[9]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) BMUX9(.O(BY[9]),.I0(TY[8]),.I1(CY[8]),.I2(C[9]));


// stage 10



(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) TMUX10(.O(TY[10]),.I0(CY[9]),.I1(BY[9]),.I2(C[10]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) CMUX10(.O(CY[10]),.I0(BY[9]),.I1(TY[9]),.I2(C[10]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) BMUX10(.O(BY[10]),.I0(TY[9]),.I1(CY[9]),.I2(C[10]));

// stage 11



(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) TMUX11(.O(TY[11]),.I0(CY[10]),.I1(BY[10]),.I2(C[11]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) CMUX11(.O(CY[11]),.I0(BY[10]),.I1(TY[10]),.I2(C[11]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) BMUX11(.O(BY[11]),.I0(TY[10]),.I1(CY[10]),.I2(C[11]));

// stage 12

(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) TMUX12(.O(TY[12]),.I0(CY[11]),.I1(BY[11]),.I2(C[12]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) CMUX12(.O(CY[12]),.I0(BY[11]),.I1(TY[11]),.I2(C[12]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *) 
LUT3 #(.INIT( 8'hCA)) BMUX12(.O(BY[12]),.I0(TY[11]),.I1(CY[11]),.I2(C[12]));


// stage 13
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) TMUX61(.O(TY[13]),.I0(CY[12]),.I1(BY[12]),.I2(C[13]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) CMUX61(.O(CY[13]),.I0(BY[12]),.I1(TY[12]),.I2(C[13]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) BMUX61(.O(BY[13]),.I0(TY[12]),.I1(CY[12]),.I2(C[13]));


//stage 65

(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) TMUX62(.O(TY[14]),.I0(CY[13]),.I1(BY[13]),.I2(C[14]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) CMUX62(.O(CY[14]),.I0(BY[13]),.I1(TY[13]),.I2(C[14]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) BMUX63(.O(BY[14]),.I0(TY[13]),.I1(CY[13]),.I2(C[14]));

//stage 66

(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) TMUX64(.O(TY[15]),.I0(CY[14]),.I1(BY[14]),.I2(C[15]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) CMUX64(.O(CY[15]),.I0(BY[14]),.I1(TY[14]),.I2(C[15]));
(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) BMUX64(.O(BY[15]),.I0(TY[14]),.I1(CY[14]),.I2(C[15]));




//(* LOCK_PINS="ALL"*)  
FD #(.INIT(0)) FF_PArb9(.Q(R0),.C(BY[15]),.D(TY[15]));


//(* LOCK_PINS="ALL"*) 
FD #(.INIT(0)) FF_PArb10(.Q(R1),.C(CY[15]),.D(BY[15]));


//(* LOCK_PINS="ALL"*)
FD #(.INIT(0)) FF_PArb11(.Q(R2),.C(TY[15]),.D(BY[15]));


(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) MUX_OUT(.O(R3),.I0(R0),.I1(R1),.I2(R2));

(* LOCK_PINS = "I2:A3, I1:A2, I0:A1" ,BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) MUX_OUT1(.O(R4),.I0(R1),.I1(R2),.I2(R0));


assign R = R3 ^ R4;


endmodule