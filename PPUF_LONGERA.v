module PPUF_LONGERAKAMAL(C,Data_in,R,RB);
//  input rst;
     input [15:0] C;
     input Data_in;
//   input [1:0] sel;
     
     output  R, RB;
    // output done;


(* DONT_TOUCH = "TRUE" *) wire [60:0] TY,TYB;
(* DONT_TOUCH = "TRUE" *) wire [60:0] BY,BYB;
(* DONT_TOUCH = "TRUE" *) wire [60:0] CY,CYB;
(* DONT_TOUCH = "TRUE" *) wire [48:0] FR,FRB;
(* DONT_TOUCH = "TRUE" *) wire R0,R0B;
(* DONT_TOUCH = "TRUE" *) wire R1,R1B;
(* DONT_TOUCH = "TRUE" *) wire R2,R2B;
(* DONT_TOUCH = "TRUE" *) wire R3,R3B;
(* DONT_TOUCH = "TRUE" *) wire R4,R4B;


//wire [39:0] TY,BY,CY; //0,TY1,TY2,TY3,TY4,TY5,TY6,TY7;    
//wire BY0,BY1,BY2,BY3,BY4,BY5,BY6,BY7; 



//wire [23:0] FR;
//wire R0,R1,R2;
//reg R;





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
MUX0B(
.O(TYB[0]), // output 
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
MUX1B(
.O(BYB[0]), // output 
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


LUT3 #(
.INIT( 8'hCA) // initialization
)
CMUX0B(
.O(CYB[0]), // output 
.I0(Data_in), // data1 
.I1(Data_in), // data2 
.I2(C[0]) // sel input for mux
);



// stage 1 


LUT3 #(.INIT( 8'hCA)) TMUX1(.O(TY[1]),.I0(CY[0]),.I1(BY[0]),.I2(C[1]));

LUT3 #(.INIT( 8'hCA)) CMUX1(.O(CY[1]),.I0(BY[0]),.I1(TY[0]),.I2(C[1]));

LUT3 #(.INIT( 8'hCA)) BMUX1(.O(BY[1]),.I0(TY[0]),.I1(CY[0]),.I2(C[1])); 


LUT3 #(.INIT( 8'hCA)) TMUX1B(.O(TYB[1]),.I0(CYB[0]),.I1(BYB[0]),.I2(C[1]));

LUT3 #(.INIT( 8'hCA)) CMUX1B(.O(CYB[1]),.I0(BYB[0]),.I1(TYB[0]),.I2(C[1]));

LUT3 #(.INIT( 8'hCA)) BMUX1B(.O(BYB[1]),.I0(TYB[0]),.I1(CYB[0]),.I2(C[1]));

// stage 2


LUT3 #(.INIT( 8'hCA)) TMUX2(.O(TY[2]),.I0(CY[1]),.I1(BY[1]),.I2(C[2]));

LUT3 #(.INIT( 8'hCA)) CMUX2(.O(CY[2]),.I0(BY[1]),.I1(TY[1]),.I2(C[2]));

LUT3 #(.INIT( 8'hCA)) BMUX2(.O(BY[2]),.I0(TY[1]),.I1(CY[1]),.I2(C[2]));


LUT3 #(.INIT( 8'hCA)) TMUX2B(.O(TYB[2]),.I0(CYB[1]),.I1(BYB[1]),.I2(C[2]));

LUT3 #(.INIT( 8'hCA)) CMUX2B(.O(CYB[2]),.I0(BYB[1]),.I1(TYB[1]),.I2(C[2]));

LUT3 #(.INIT( 8'hCA)) BMUX2B(.O(BYB[2]),.I0(TYB[1]),.I1(CYB[1]),.I2(C[2]));

// stage 3



LUT3 #(.INIT( 8'hCA)) TMUX3(.O(TY[3]),.I0(CY[2]),.I1(BY[2]),.I2(C[3]));

LUT3 #(.INIT( 8'hCA)) CMUX3(.O(CY[3]),.I0(BY[2]),.I1(TY[2]),.I2(C[3]));

LUT3 #(.INIT( 8'hCA)) BMUX3(.O(BY[3]),.I0(TY[2]),.I1(CY[2]),.I2(C[3]));


LUT3 #(.INIT( 8'hCA)) TMUX3B(.O(TYB[3]),.I0(CYB[2]),.I1(BYB[2]),.I2(C[3]));

LUT3 #(.INIT( 8'hCA)) CMUX3B(.O(CYB[3]),.I0(BYB[2]),.I1(TYB[2]),.I2(C[3]));

LUT3 #(.INIT( 8'hCA)) BMUX3B(.O(BYB[3]),.I0(TYB[2]),.I1(CYB[2]),.I2(C[3]));

// stage 4


LUT3 #(.INIT( 8'hCA)) TMUX4(.O(TY[4]),.I0(CY[3]),.I1(BY[3]),.I2(C[4]));

LUT3 #(.INIT( 8'hCA)) CMUX4(.O(CY[4]),.I0(BY[3]),.I1(TY[3]),.I2(C[4]));

LUT3 #(.INIT( 8'hCA)) BMUX4(.O(BY[4]),.I0(TY[3]),.I1(CY[3]),.I2(C[4]));


LUT3 #(.INIT( 8'hCA)) TMUX4B(.O(TYB[4]),.I0(CYB[3]),.I1(BYB[3]),.I2(C[4]));

LUT3 #(.INIT( 8'hCA)) CMUX4B(.O(CYB[4]),.I0(BYB[3]),.I1(TYB[3]),.I2(C[4]));

LUT3 #(.INIT( 8'hCA)) BMUX4B(.O(BYB[4]),.I0(TYB[3]),.I1(CYB[3]),.I2(C[4]));

// stage 5



LUT3 #(.INIT( 8'hCA)) TMUX5(.O(TY[5]),.I0(CY[4]),.I1(BY[4]),.I2(C[5]));

LUT3 #(.INIT( 8'hCA)) CMUX5(.O(CY[5]),.I0(BY[4]),.I1(TY[4]),.I2(C[5]));

LUT3 #(.INIT( 8'hCA)) BMUX5(.O(BY[5]),.I0(TY[4]),.I1(CY[4]),.I2(C[5]));


LUT3 #(.INIT( 8'hCA)) TMUX5B(.O(TYB[5]),.I0(CYB[4]),.I1(BYB[4]),.I2(C[5]));

LUT3 #(.INIT( 8'hCA)) CMUX5B(.O(CYB[5]),.I0(BYB[4]),.I1(TYB[4]),.I2(C[5]));

LUT3 #(.INIT( 8'hCA)) BMUX5B(.O(BYB[5]),.I0(TYB[4]),.I1(CYB[4]),.I2(C[5]));

// stage 6



LUT3 #(.INIT( 8'hCA)) TMUX6(.O(TY[6]),.I0(CY[5]),.I1(BY[5]),.I2(C[6]));

LUT3 #(.INIT( 8'hCA)) CMUX6(.O(CY[6]),.I0(BY[5]),.I1(TY[5]),.I2(C[6]));

LUT3 #(.INIT( 8'hCA)) BMUX6(.O(BY[6]),.I0(TY[5]),.I1(CY[5]),.I2(C[6]));


LUT3 #(.INIT( 8'hCA)) TMUX6B(.O(TYB[6]),.I0(CYB[5]),.I1(BYB[5]),.I2(C[6]));

LUT3 #(.INIT( 8'hCA)) CMUX6B(.O(CYB[6]),.I0(BYB[5]),.I1(TYB[5]),.I2(C[6]));

LUT3 #(.INIT( 8'hCA)) BMUX6B(.O(BYB[6]),.I0(TYB[5]),.I1(CYB[5]),.I2(C[6]));


// stage 7


LUT3 #(.INIT( 8'hCA)) BMUX7(.O(BY[7]),.I0(CY[6]),.I1(BY[6]),.I2(C[7]));

LUT3 #(.INIT( 8'hCA)) CMUX7(.O(CY[7]),.I0(BY[6]),.I1(TY[6]),.I2(C[7]));

LUT3 #(.INIT( 8'hCA)) TMUX7(.O(TY[7]),.I0(TY[6]),.I1(CY[6]),.I2(C[7]));


LUT3 #(.INIT( 8'hCA)) BMUX7B(.O(BYB[7]),.I0(CYB[6]),.I1(BYB[6]),.I2(C[7]));

LUT3 #(.INIT( 8'hCA)) CMUX7B(.O(CYB[7]),.I0(BYB[6]),.I1(TYB[6]),.I2(C[7]));

LUT3 #(.INIT( 8'hCA)) TMUX7B(.O(TYB[7]),.I0(TYB[6]),.I1(CYB[6]),.I2(C[7]));


////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////




// stage 8 




LUT3 #(.INIT( 8'hCA)) TMUX8(.O(TY[8]),.I0(CY[7]),.I1(BY[7]),.I2(C[8]));

LUT3 #(.INIT( 8'hCA)) CMUX8(.O(CY[8]),.I0(BY[7]),.I1(TY[7]),.I2(C[8]));

LUT3 #(.INIT( 8'hCA)) BMUX8(.O(BY[8]),.I0(TY[7]),.I1(CY[7]),.I2(C[8]));


LUT3 #(.INIT( 8'hCA)) TMUX8B(.O(TYB[8]),.I0(CYB[7]),.I1(BYB[7]),.I2(C[8]));

LUT3 #(.INIT( 8'hCA)) CMUX8B(.O(CYB[8]),.I0(BYB[7]),.I1(TYB[7]),.I2(C[8]));

LUT3 #(.INIT( 8'hCA)) BMUX8B(.O(BYB[8]),.I0(TYB[7]),.I1(CYB[7]),.I2(C[8]));

// stage 9


LUT3 #(.INIT( 8'hCA)) TMUX9(.O(TY[9]),.I0(CY[8]),.I1(BY[8]),.I2(C[9]));

LUT3 #(.INIT( 8'hCA)) CMUX9(.O(CY[9]),.I0(BY[8]),.I1(TY[8]),.I2(C[9]));

LUT3 #(.INIT( 8'hCA)) BMUX9(.O(BY[9]),.I0(TY[8]),.I1(CY[8]),.I2(C[9]));


LUT3 #(.INIT( 8'hCA)) TMUX9B(.O(TYB[9]),.I0(CYB[8]),.I1(BYB[8]),.I2(C[9]));

LUT3 #(.INIT( 8'hCA)) CMUX9B(.O(CYB[9]),.I0(BYB[8]),.I1(TYB[8]),.I2(C[9]));

LUT3 #(.INIT( 8'hCA)) BMUX9B(.O(BYB[9]),.I0(TYB[8]),.I1(CYB[8]),.I2(C[9]));


// stage 10




LUT3 #(.INIT( 8'hCA)) TMUX10(.O(TY[10]),.I0(CY[9]),.I1(BY[9]),.I2(C[10]));

LUT3 #(.INIT( 8'hCA)) CMUX10(.O(CY[10]),.I0(BY[9]),.I1(TY[9]),.I2(C[10]));

LUT3 #(.INIT( 8'hCA)) BMUX10(.O(BY[10]),.I0(TY[9]),.I1(CY[9]),.I2(C[10]));


LUT3 #(.INIT( 8'hCA)) TMUX10B(.O(TYB[10]),.I0(CYB[9]),.I1(BYB[9]),.I2(C[10]));

LUT3 #(.INIT( 8'hCA)) CMUX10B(.O(CYB[10]),.I0(BYB[9]),.I1(TYB[9]),.I2(C[10]));

LUT3 #(.INIT( 8'hCA)) BMUX10B(.O(BYB[10]),.I0(TYB[9]),.I1(CYB[9]),.I2(C[10]));

// stage 11




LUT3 #(.INIT( 8'hCA)) TMUX11(.O(TY[11]),.I0(CY[10]),.I1(BY[10]),.I2(C[11]));

LUT3 #(.INIT( 8'hCA)) CMUX11(.O(CY[11]),.I0(BY[10]),.I1(TY[10]),.I2(C[11]));

LUT3 #(.INIT( 8'hCA)) BMUX11(.O(BY[11]),.I0(TY[10]),.I1(CY[10]),.I2(C[11]));


LUT3 #(.INIT( 8'hCA)) TMUX11B(.O(TYB[11]),.I0(CYB[10]),.I1(BYB[10]),.I2(C[11]));

LUT3 #(.INIT( 8'hCA)) CMUX11B(.O(CYB[11]),.I0(BYB[10]),.I1(TYB[10]),.I2(C[11]));

LUT3 #(.INIT( 8'hCA)) BMUX11B(.O(BYB[11]),.I0(TYB[10]),.I1(CYB[10]),.I2(C[11]));

// stage 12


LUT3 #(.INIT( 8'hCA)) TMUX12(.O(TY[12]),.I0(CY[11]),.I1(BY[11]),.I2(C[12]));

LUT3 #(.INIT( 8'hCA)) CMUX12(.O(CY[12]),.I0(BY[11]),.I1(TY[11]),.I2(C[12]));

LUT3 #(.INIT( 8'hCA)) BMUX12(.O(BY[12]),.I0(TY[11]),.I1(CY[11]),.I2(C[12]));


LUT3 #(.INIT( 8'hCA)) TMUX12B(.O(TYB[12]),.I0(CYB[11]),.I1(BYB[11]),.I2(C[12]));

LUT3 #(.INIT( 8'hCA)) CMUX12B(.O(CYB[12]),.I0(BYB[11]),.I1(TYB[11]),.I2(C[12]));

LUT3 #(.INIT( 8'hCA)) BMUX12B(.O(BYB[12]),.I0(TYB[11]),.I1(CYB[11]),.I2(C[12]));


// stage 13

//(* LOCK_PINS="ALL", BEL="A5FF"*)   
//(* LOCK_PINS="ALL"*)   
FD #(.INIT(0))FF_Arb0(.Q(FR[0]),.C(BY[1]),.D(TY[1]));
//(* LOCK_PINS="ALL", BEL="A5FF"*)  
//(* LOCK_PINS="ALL"*)
FD #(.INIT(0))FF_Arb1(.Q(FR[1]),.C(CY[1]),.D(BY[1]));
//(* LOCK_PINS="ALL"*) 
FD #(.INIT(0))FF_Arb2(.Q(FR[2]),.C(TY[1]),.D(CY[1]));

FD #(.INIT(0))FF_Arb0B(.Q(FRB[0]),.C(BYB[1]),.D(TYB[1]));
//(* LOCK_PINS="ALL", BEL="B5FF"*)  
//(* LOCK_PINS="ALL"*)
FD #(.INIT(0))FF_Arb1B(.Q(FRB[1]),.C(CYB[1]),.D(BYB[1]));
//(* LOCK_PINS="ALL"*) 
FD #(.INIT(0))FF_Arb2B(.Q(FRB[2]),.C(TYB[1]),.D(CYB[1]));

//
//
//
//// stage 17
//
//

LUT3 #(.INIT( 8'hCA)) TMUX16(.O(TY[13]),.I0(CY[12]),.I1(BY[12]),.I2(FR[0]));

LUT3 #(.INIT( 8'hCA)) CMUX16(.O(CY[13]),.I0(BY[12]),.I1(TY[12]),.I2(FR[0]));

LUT3 #(.INIT( 8'hCA)) BMUX16(.O(BY[13]),.I0(TY[12]),.I1(CY[12]),.I2(FR[0]));


LUT3 #(.INIT( 8'hCA)) TMUX16B(.O(TYB[13]),.I0(CYB[12]),.I1(BYB[12]),.I2(FRB[0]));

LUT3 #(.INIT( 8'hCA)) CMUX16B(.O(CYB[13]),.I0(BYB[12]),.I1(TYB[12]),.I2(FRB[0]));

LUT3 #(.INIT( 8'hCA)) BMUX16B(.O(BYB[13]),.I0(TYB[12]),.I1(CYB[12]),.I2(FRB[0]));

//

//


// stage 18



LUT3 #(.INIT( 8'hCA)) TMUX17(.O(TY[14]),.I0(CY[13]),.I1(BY[13]),.I2(FR[1]));

LUT3 #(.INIT( 8'hCA)) CMUX17(.O(CY[14]),.I0(BY[13]),.I1(TY[13]),.I2(FR[1]));

LUT3 #(.INIT( 8'hCA)) BMUX17(.O(BY[14]),.I0(TY[13]),.I1(CY[13]),.I2(FR[1]));


LUT3 #(.INIT( 8'hCA)) TMUX17B(.O(TYB[14]),.I0(CYB[13]),.I1(BYB[13]),.I2(FRB[1]));

LUT3 #(.INIT( 8'hCA)) CMUX17B(.O(CYB[14]),.I0(BYB[13]),.I1(TYB[13]),.I2(FRB[1]));

LUT3 #(.INIT( 8'hCA)) BMUX17B(.O(BYB[14]),.I0(TYB[13]),.I1(CYB[13]),.I2(FRB[1]));



// stage 19



LUT3 #(.INIT( 8'hCA)) TMUX18(.O(TY[15]),.I0(CY[14]),.I1(BY[14]),.I2(FR[2]));

LUT3 #(.INIT( 8'hCA)) CMUX18(.O(CY[15]),.I0(BY[14]),.I1(TY[14]),.I2(FR[2]));

LUT3 #(.INIT( 8'hCA)) BMUX18(.O(BY[15]),.I0(TY[14]),.I1(CY[14]),.I2(FR[2]));


LUT3 #(.INIT( 8'hCA)) TMUX18B(.O(TYB[15]),.I0(CYB[14]),.I1(BYB[14]),.I2(FRB[2]));

LUT3 #(.INIT( 8'hCA)) CMUX18B(.O(CYB[15]),.I0(BYB[14]),.I1(TYB[14]),.I2(FRB[2]));

LUT3 #(.INIT( 8'hCA)) BMUX18B(.O(BYB[15]),.I0(TYB[14]),.I1(CYB[14]),.I2(FRB[2]));

//
////

//stage 20

//(* LOCK_PINS="ALL", BEL="A5FF"*)  
//(* LOCK_PINS="ALL"*) 
FD #(.INIT(0))FF_Arb3(.Q(FR[3]),.C(BY[3]),.D(TY[3]));


//(* LOCK_PINS="ALL" , BEL="A5FF"*)   
//(* LOCK_PINS="ALL"*)
FD #(.INIT(0))FF_Arb4(.Q(FR[4]),.C(CY[3]),.D(BY[3]));


//(* LOCK_PINS="ALL", BEL="A5FF"*)  
//(* LOCK_PINS="ALL"*)
FD #(.INIT(0))FF_Arb5(.Q(FR[5]),.C(TY[3]),.D(CY[3]));


//(* LOCK_PINS="ALL", BEL="A5FF"*)  
//(* LOCK_PINS="ALL"*) 
FD #(.INIT(0))FF_Arb3B(.Q(FRB[3]),.C(BYB[3]),.D(TYB[3]));


//(* LOCK_PINS="ALL" , BEL="A5FF"*)   
//(* LOCK_PINS="ALL"*)
FD #(.INIT(0))FF_Arb4B(.Q(FRB[4]),.C(CYB[3]),.D(BYB[3]));


//(* LOCK_PINS="ALL", BEL="A5FF"*)  
//(* LOCK_PINS="ALL"*)
FD #(.INIT(0))FF_Arb5B(.Q(FRB[5]),.C(TYB[3]),.D(CYB[3]));

// stage 21



LUT3 #(.INIT( 8'hCA)) TMUX19(.O(TY[16]),.I0(CY[15]),.I1(BY[15]),.I2(FR[3]));

LUT3 #(.INIT( 8'hCA)) CMUX19(.O(CY[16]),.I0(BY[15]),.I1(TY[15]),.I2(FR[3]));

LUT3 #(.INIT( 8'hCA)) BMUX19(.O(BY[16]),.I0(TY[15]),.I1(CY[15]),.I2(FR[3]));


LUT3 #(.INIT( 8'hCA)) TMUX19B(.O(TYB[16]),.I0(CYB[15]),.I1(BYB[15]),.I2(FRB[3]));

LUT3 #(.INIT( 8'hCA)) CMUX19B(.O(CYB[16]),.I0(BYB[15]),.I1(TYB[15]),.I2(FRB[3]));

LUT3 #(.INIT( 8'hCA)) BMUX19B(.O(BYB[16]),.I0(TYB[15]),.I1(CYB[15]),.I2(FRB[3]));

//
//// stage 22
//


LUT3 #(.INIT( 8'hCA)) TMUX20(.O(TY[17]),.I0(CY[16]),.I1(BY[16]),.I2(FR[4]));

LUT3 #(.INIT( 8'hCA)) CMUX20(.O(CY[17]),.I0(BY[16]),.I1(TY[16]),.I2(FR[4]));

LUT3 #(.INIT( 8'hCA)) BMUX20(.O(BY[17]),.I0(TY[16]),.I1(CY[16]),.I2(FR[4]));


LUT3 #(.INIT( 8'hCA)) TMUX20B(.O(TYB[17]),.I0(CYB[16]),.I1(BYB[16]),.I2(FRB[4]));

LUT3 #(.INIT( 8'hCA)) CMUX20B(.O(CYB[17]),.I0(BYB[16]),.I1(TYB[16]),.I2(FRB[4]));

LUT3 #(.INIT( 8'hCA)) BMUX20B(.O(BYB[17]),.I0(TYB[16]),.I1(CYB[16]),.I2(FRB[4]));


// stage 23



LUT3 #(.INIT( 8'hCA)) TMUX21(.O(TY[18]),.I0(CY[17]),.I1(BY[17]),.I2(FR[5]));

LUT3 #(.INIT( 8'hCA)) CMUX21(.O(CY[18]),.I0(BY[17]),.I1(TY[17]),.I2(FR[5]));

LUT3 #(.INIT( 8'hCA)) BMUX21(.O(BY[18]),.I0(TY[17]),.I1(CY[17]),.I2(FR[5]));


LUT3 #(.INIT( 8'hCA)) TMUX21B(.O(TYB[18]),.I0(CYB[17]),.I1(BYB[17]),.I2(FRB[5]));

LUT3 #(.INIT( 8'hCA)) CMUX21B(.O(CYB[18]),.I0(BYB[17]),.I1(TYB[17]),.I2(FRB[5]));

LUT3 #(.INIT( 8'hCA)) BMUX21B(.O(BYB[18]),.I0(TYB[17]),.I1(CYB[17]),.I2(FRB[5]));

////
////// stage 24
////
////
//

//(* LOCK_PINS="ALL", BEL="A5FF"*)  
//(* LOCK_PINS="ALL"*)
FD #(.INIT(0))FF_Arb6(.Q(FR[6]),.C(BY[2]),.D(TY[2]));


//(* LOCK_PINS="ALL", BEL="A5FF"*)  
//(* LOCK_PINS="ALL"*) 
FD #(.INIT(0))FF_Arb7(.Q(FR[7]),.C(CY[2]),.D(BY[2]));


//(* LOCK_PINS="ALL", BEL="A5FF"*) 
//(* LOCK_PINS="ALL"*)  
FD #(.INIT(0))FF_Arb8(.Q(FR[8]),.C(TY[2]),.D(CY[2]));

FD #(.INIT(0))FF_Arb6B(.Q(FRB[6]),.C(BYB[2]),.D(TYB[2]));


//(* LOCK_PINS="ALL", BEL="A5FF"*)  
//(* LOCK_PINS="ALL"*) 
FD #(.INIT(0))FF_Arb7B(.Q(FRB[7]),.C(CYB[2]),.D(BYB[2]));


//(* LOCK_PINS="ALL", BEL="A5FF"*) 
//(* LOCK_PINS="ALL"*)  
FD #(.INIT(0))FF_Arb8B(.Q(FRB[8]),.C(TYB[2]),.D(CYB[2]));


//stage 25


LUT3 #(.INIT( 8'hCA)) TMUX22(.O(TY[19]),.I0(CY[18]),.I1(BY[18]),.I2(FR[6]));

LUT3 #(.INIT( 8'hCA)) CMUX22(.O(CY[19]),.I0(BY[18]),.I1(TY[18]),.I2(FR[6]));

LUT3 #(.INIT( 8'hCA)) BMUX22(.O(BY[19]),.I0(TY[18]),.I1(CY[18]),.I2(FR[6]));


LUT3 #(.INIT( 8'hCA)) TMUX22B(.O(TYB[19]),.I0(CYB[18]),.I1(BYB[18]),.I2(FRB[6]));

LUT3 #(.INIT( 8'hCA)) CMUX22B(.O(CYB[19]),.I0(BYB[18]),.I1(TYB[18]),.I2(FRB[6]));

LUT3 #(.INIT( 8'hCA)) BMUX22B(.O(BYB[19]),.I0(TYB[18]),.I1(CYB[18]),.I2(FRB[6]));


// stage 26



LUT3 #(.INIT( 8'hCA)) TMUX23(.O(TY[20]),.I0(CY[19]),.I1(BY[19]),.I2(FR[7]));

LUT3 #(.INIT( 8'hCA)) CMUX23(.O(CY[20]),.I0(BY[19]),.I1(TY[19]),.I2(FR[7]));

LUT3 #(.INIT( 8'hCA)) BMUX23(.O(BY[20]),.I0(TY[19]),.I1(CY[19]),.I2(FR[7]));


LUT3 #(.INIT( 8'hCA)) TMUX23B(.O(TYB[20]),.I0(CYB[19]),.I1(BYB[19]),.I2(FRB[7]));

LUT3 #(.INIT( 8'hCA)) CMUX23B(.O(CYB[20]),.I0(BYB[19]),.I1(TYB[19]),.I2(FRB[7]));

LUT3 #(.INIT( 8'hCA)) BMUX23B(.O(BYB[20]),.I0(TYB[19]),.I1(CYB[19]),.I2(FRB[7]));


// stage 27



LUT3 #(.INIT( 8'hCA)) TMUX24(.O(TY[21]),.I0(CY[20]),.I1(BY[20]),.I2(FR[8]));

LUT3 #(.INIT( 8'hCA)) CMUX24(.O(CY[21]),.I0(BY[20]),.I1(TY[20]),.I2(FR[8]));

LUT3 #(.INIT( 8'hCA)) BMUX24(.O(BY[21]),.I0(TY[20]),.I1(CY[20]),.I2(FR[8]));


LUT3 #(.INIT( 8'hCA)) TMUX24B(.O(TYB[21]),.I0(CYB[20]),.I1(BYB[20]),.I2(FRB[8]));

LUT3 #(.INIT( 8'hCA)) CMUX24B(.O(CYB[21]),.I0(BYB[20]),.I1(TYB[20]),.I2(FRB[8]));

LUT3 #(.INIT( 8'hCA)) BMUX24B(.O(BYB[21]),.I0(TYB[20]),.I1(CYB[20]),.I2(FRB[8]));

//
//

//stage 28

//(* LOCK_PINS="ALL", BEL="A5FF"*)  
//(* LOCK_PINS="ALL"*)
FD #(.INIT(0))FF_Arb9(.Q(FR[9]),.C(BY[7]),.D(TY[7]));

//
//(* LOCK_PINS="ALL", BEL="A5FF"*) 
//(* LOCK_PINS="ALL"*) 
FD #(.INIT(0))FF_Arb10(.Q(FR[10]),.C(CY[7]),.D(BY[7]));


//(* LOCK_PINS="ALL", BEL="A5FF"*)  
//(* LOCK_PINS="ALL"*)
FD #(.INIT(0))FF_Arb11(.Q(FR[11]),.C(TY[7]),.D(CY[7]));

FD #(.INIT(0))FF_Arb9B(.Q(FRB[9]),.C(BYB[7]),.D(TYB[7]));

//
//(* LOCK_PINS="ALL", BEL="A5FF"*) 
//(* LOCK_PINS="ALL"*) 
FD #(.INIT(0))FF_Arb10B(.Q(FRB[10]),.C(CYB[7]),.D(BYB[7]));


//(* LOCK_PINS="ALL", BEL="A5FF"*)  
//(* LOCK_PINS="ALL"*)
FD #(.INIT(0))FF_Arb11B(.Q(FRB[11]),.C(TYB[7]),.D(CYB[7]));

// stage 29



LUT3 #(.INIT( 8'hCA)) TMUX25(.O(TY[22]),.I0(CY[21]),.I1(BY[21]),.I2(FR[9]));

LUT3 #(.INIT( 8'hCA)) CMUX25(.O(CY[22]),.I0(BY[21]),.I1(TY[21]),.I2(FR[9]));

LUT3 #(.INIT( 8'hCA)) BMUX25(.O(BY[22]),.I0(TY[21]),.I1(CY[21]),.I2(FR[9]));


LUT3 #(.INIT( 8'hCA)) TMUX25B(.O(TYB[22]),.I0(CYB[21]),.I1(BYB[21]),.I2(FRB[9]));

LUT3 #(.INIT( 8'hCA)) CMUX25B(.O(CYB[22]),.I0(BYB[21]),.I1(TYB[21]),.I2(FRB[9]));

LUT3 #(.INIT( 8'hCA)) BMUX25B(.O(BYB[22]),.I0(TYB[21]),.I1(CYB[21]),.I2(FRB[9]));


// stage 30



LUT3 #(.INIT( 8'hCA)) TMUX26(.O(TY[23]),.I0(CY[22]),.I1(BY[22]),.I2(FR[10]));

LUT3 #(.INIT( 8'hCA)) CMUX26(.O(CY[23]),.I0(BY[22]),.I1(TY[22]),.I2(FR[10]));

LUT3 #(.INIT( 8'hCA)) BMUX26(.O(BY[23]),.I0(TY[22]),.I1(CY[22]),.I2(FR[10]));


LUT3 #(.INIT( 8'hCA)) TMUX26B(.O(TYB[23]),.I0(CYB[22]),.I1(BYB[22]),.I2(FRB[10]));

LUT3 #(.INIT( 8'hCA)) CMUX26B(.O(CYB[23]),.I0(BYB[22]),.I1(TYB[22]),.I2(FRB[10]));

LUT3 #(.INIT( 8'hCA)) BMUX26B(.O(BYB[23]),.I0(TYB[22]),.I1(CYB[22]),.I2(FRB[10]));




// stage 31



LUT3 #(.INIT( 8'hCA)) TMUX27(.O(TY[24]),.I0(CY[23]),.I1(BY[23]),.I2(FR[11]));

LUT3 #(.INIT( 8'hCA)) CMUX27(.O(CY[24]),.I0(BY[23]),.I1(TY[23]),.I2(FR[11]));

LUT3 #(.INIT( 8'hCA)) BMUX27(.O(BY[24]),.I0(TY[23]),.I1(CY[23]),.I2(FR[11]));


LUT3 #(.INIT( 8'hCA)) TMUX27B(.O(TYB[24]),.I0(CYB[23]),.I1(BYB[23]),.I2(FRB[11]));

LUT3 #(.INIT( 8'hCA)) CMUX27B(.O(CYB[24]),.I0(BYB[23]),.I1(TYB[23]),.I2(FRB[11]));

LUT3 #(.INIT( 8'hCA)) BMUX27B(.O(BYB[24]),.I0(TYB[23]),.I1(CYB[23]),.I2(FRB[11]));


//stage 32

//
//
//(* LOCK_PINS="ALL", BEL="A5FF"*) 
//(* LOCK_PINS="ALL"*)
FD #(.INIT(0))FF_Arb12(.Q(FR[12]),.C(BY[5]),.D(TY[5]));


//(* LOCK_PINS="ALL", BEL="A5FF"*) 
//(* LOCK_PINS="ALL"*)
FD #(.INIT(0))FF_Arb13(.Q(FR[13]),.C(CY[5]),.D(BY[5]));


//(* LOCK_PINS="ALL"*)
//(* LOCK_PINS="ALL", BEL="A5FF"*) 
FD #(.INIT(0))FF_Arb14(.Q(FR[14]),.C(TY[5]),.D(CY[5]));

FD #(.INIT(0))FF_Arb12B(.Q(FRB[12]),.C(BYB[5]),.D(TYB[5]));


//(* LOCK_PINS="ALL", BEL="A5FF"*) 
//(* LOCK_PINS="ALL"*)
FD #(.INIT(0))FF_Arb13B(.Q(FRB[13]),.C(CYB[5]),.D(BYB[5]));


//(* LOCK_PINS="ALL"*)
//(* LOCK_PINS="ALL", BEL="A5FF"*) 
FD #(.INIT(0))FF_Arb14B(.Q(FRB[14]),.C(TYB[5]),.D(CYB[5]));

// stage 33



LUT3 #(.INIT( 8'hCA)) TMUX28(.O(TY[25]),.I0(CY[24]),.I1(BY[24]),.I2(FR[12]));

LUT3 #(.INIT( 8'hCA)) CMUX28(.O(CY[25]),.I0(BY[24]),.I1(TY[24]),.I2(FR[12]));

LUT3 #(.INIT( 8'hCA)) BMUX28(.O(BY[25]),.I0(TY[24]),.I1(CY[24]),.I2(FR[12]));


LUT3 #(.INIT( 8'hCA)) TMUX28B(.O(TYB[25]),.I0(CYB[24]),.I1(BYB[24]),.I2(FRB[12]));

LUT3 #(.INIT( 8'hCA)) CMUX28B(.O(CYB[25]),.I0(BYB[24]),.I1(TYB[24]),.I2(FRB[12]));

LUT3 #(.INIT( 8'hCA)) BMUX28B(.O(BYB[25]),.I0(TYB[24]),.I1(CYB[24]),.I2(FRB[12]));



// stage 34



LUT3 #(.INIT( 8'hCA)) TMUX29(.O(TY[26]),.I0(CY[25]),.I1(BY[25]),.I2(FR[13]));

LUT3 #(.INIT( 8'hCA)) CMUX29(.O(CY[26]),.I0(BY[25]),.I1(TY[25]),.I2(FR[13]));

LUT3 #(.INIT( 8'hCA)) BMUX29(.O(BY[26]),.I0(TY[25]),.I1(CY[25]),.I2(FR[13]));


LUT3 #(.INIT( 8'hCA)) TMUX29B(.O(TYB[26]),.I0(CYB[25]),.I1(BYB[25]),.I2(FRB[13]));

LUT3 #(.INIT( 8'hCA)) CMUX29B(.O(CYB[26]),.I0(BYB[25]),.I1(TYB[25]),.I2(FRB[13]));

LUT3 #(.INIT( 8'hCA)) BMUX29B(.O(BYB[26]),.I0(TYB[25]),.I1(CYB[25]),.I2(FRB[13]));


// stage 35



LUT3 #(.INIT( 8'hCA)) TMUX30(.O(TY[27]),.I0(CY[26]),.I1(BY[26]),.I2(FR[14]));

LUT3 #(.INIT( 8'hCA)) CMUX30(.O(CY[27]),.I0(BY[26]),.I1(TY[26]),.I2(FR[14]));

LUT3 #(.INIT( 8'hCA)) BMUX30(.O(BY[27]),.I0(TY[26]),.I1(CY[26]),.I2(FR[14]));


LUT3 #(.INIT( 8'hCA)) TMUX30B(.O(TYB[27]),.I0(CYB[26]),.I1(BYB[26]),.I2(FRB[14]));

LUT3 #(.INIT( 8'hCA)) CMUX30B(.O(CYB[27]),.I0(BYB[26]),.I1(TYB[26]),.I2(FRB[14]));

LUT3 #(.INIT( 8'hCA)) BMUX30B(.O(BYB[27]),.I0(TYB[26]),.I1(CYB[26]),.I2(FRB[14]));

//stage 36

//
//(* LOCK_PINS="ALL", BEL="A5FF"*)  
//(* LOCK_PINS="ALL"*)
FD #(.INIT(0))FF_Arb15(.Q(FR[15]),.C(BY[9]),.D(TY[9]));


//(* LOCK_PINS="ALL", BEL="A5FF"*) 
//(* LOCK_PINS="ALL"*)
FD #(.INIT(0))FF_Arb16(.Q(FR[16]),.C(CY[9]),.D(BY[9]));


//(* LOCK_PINS="ALL", BEL="A5FF"*)  
//(* LOCK_PINS="ALL"*)
FD #(.INIT(0))FF_Arb17(.Q(FR[17]),.C(TY[9]),.D(CY[9]));

FD #(.INIT(0))FF_Arb15B(.Q(FRB[15]),.C(BYB[9]),.D(TYB[9]));


//(* LOCK_PINS="ALL", BEL="A5FF"*) 
//(* LOCK_PINS="ALL"*)
FD #(.INIT(0))FF_Arb16B(.Q(FRB[16]),.C(CYB[9]),.D(BYB[9]));


//(* LOCK_PINS="ALL", BEL="A5FF"*)  
//(* LOCK_PINS="ALL"*)
FD #(.INIT(0))FF_Arb17B(.Q(FRB[17]),.C(TYB[9]),.D(CYB[9]));

// stage 37



LUT3 #(.INIT( 8'hCA)) TMUX31(.O(TY[28]),.I0(CY[27]),.I1(BY[27]),.I2(FR[15]));

LUT3 #(.INIT( 8'hCA)) CMUX31(.O(CY[28]),.I0(BY[27]),.I1(TY[27]),.I2(FR[15]));

LUT3 #(.INIT( 8'hCA)) BMUX31(.O(BY[28]),.I0(TY[27]),.I1(CY[27]),.I2(FR[15]));


LUT3 #(.INIT( 8'hCA)) TMUX31B(.O(TYB[28]),.I0(CYB[27]),.I1(BYB[27]),.I2(FRB[15]));

LUT3 #(.INIT( 8'hCA)) CMUX31B(.O(CYB[28]),.I0(BYB[27]),.I1(TYB[27]),.I2(FRB[15]));

LUT3 #(.INIT( 8'hCA)) BMUX31B(.O(BYB[28]),.I0(TYB[27]),.I1(CYB[27]),.I2(FRB[15]));



// stage 38



LUT3 #(.INIT( 8'hCA)) TMUX32(.O(TY[29]),.I0(CY[28]),.I1(BY[28]),.I2(FR[16]));

LUT3 #(.INIT( 8'hCA)) CMUX32(.O(CY[29]),.I0(BY[28]),.I1(TY[28]),.I2(FR[16]));

LUT3 #(.INIT( 8'hCA)) BMUX32(.O(BY[29]),.I0(TY[28]),.I1(CY[28]),.I2(FR[16]));


LUT3 #(.INIT( 8'hCA)) TMUX32B(.O(TYB[29]),.I0(CYB[28]),.I1(BYB[28]),.I2(FRB[16]));

LUT3 #(.INIT( 8'hCA)) CMUX32B(.O(CYB[29]),.I0(BYB[28]),.I1(TYB[28]),.I2(FRB[16]));

LUT3 #(.INIT( 8'hCA)) BMUX32B(.O(BYB[29]),.I0(TYB[28]),.I1(CYB[28]),.I2(FRB[16]));


// stage 39


LUT3 #(.INIT( 8'hCA)) TMUX33(.O(TY[30]),.I0(CY[29]),.I1(BY[29]),.I2(FR[17]));

LUT3 #(.INIT( 8'hCA)) CMUX33(.O(CY[30]),.I0(BY[29]),.I1(TY[29]),.I2(FR[17]));

LUT3 #(.INIT( 8'hCA)) BMUX33(.O(BY[30]),.I0(TY[29]),.I1(CY[29]),.I2(FR[17]));


LUT3 #(.INIT( 8'hCA)) TMUX33B(.O(TYB[30]),.I0(CYB[29]),.I1(BYB[29]),.I2(FRB[17]));

LUT3 #(.INIT( 8'hCA)) CMUX33B(.O(CYB[30]),.I0(BYB[29]),.I1(TYB[29]),.I2(FRB[17]));

LUT3 #(.INIT( 8'hCA)) BMUX33B(.O(BYB[30]),.I0(TYB[29]),.I1(CYB[29]),.I2(FRB[17]));

//

//stage 40

//(* LOCK_PINS="ALL", BEL="A5FF"*)
//(* LOCK_PINS="ALL"*) 
FD #(.INIT(0))FF_Arb18(.Q(FR[18]),.C(BY[6]),.D(TY[6]));

//
//(* LOCK_PINS="ALL", BEL="A5FF"*)
//(* LOCK_PINS="ALL"*) 
FD #(.INIT(0))FF_Arb19(.Q(FR[19]),.C(CY[6]),.D(BY[6]));


//(* LOCK_PINS="ALL", BEL="A5FF"*) 
//(* LOCK_PINS="ALL"*)
FD #(.INIT(0))FF_Arb20(.Q(FR[20]),.C(TY[6]),.D(CY[6]));

FD #(.INIT(0))FF_Arb18B(.Q(FRB[18]),.C(BYB[6]),.D(TYB[6]));

//
//(* LOCK_PINS="ALL", BEL="A5FF"*)
//(* LOCK_PINS="ALL"*) 
FD #(.INIT(0))FF_Arb19B(.Q(FRB[19]),.C(CYB[6]),.D(BYB[6]));


//(* LOCK_PINS="ALL", BEL="A5FF"*) 
//(* LOCK_PINS="ALL"*)
FD #(.INIT(0))FF_Arb20B(.Q(FRB[20]),.C(TYB[6]),.D(CYB[6]));

// stage 41



LUT3 #(.INIT( 8'hCA)) TMUX34(.O(TY[31]),.I0(CY[30]),.I1(BY[30]),.I2(FR[18]));

LUT3 #(.INIT( 8'hCA)) CMUX34(.O(CY[31]),.I0(BY[30]),.I1(TY[30]),.I2(FR[18]));

LUT3 #(.INIT( 8'hCA)) BMUX34(.O(BY[31]),.I0(TY[30]),.I1(CY[30]),.I2(FR[18]));


LUT3 #(.INIT( 8'hCA)) TMUX34B(.O(TYB[31]),.I0(CYB[30]),.I1(BYB[30]),.I2(FRB[18]));

LUT3 #(.INIT( 8'hCA)) CMUX34B(.O(CYB[31]),.I0(BYB[30]),.I1(TYB[30]),.I2(FRB[18]));

LUT3 #(.INIT( 8'hCA)) BMUX34B(.O(BYB[31]),.I0(TYB[30]),.I1(CYB[30]),.I2(FRB[18]));



// stage 42



LUT3 #(.INIT( 8'hCA)) TMUX35(.O(TY[32]),.I0(CY[31]),.I1(BY[31]),.I2(FR[19]));

LUT3 #(.INIT( 8'hCA)) CMUX35(.O(CY[32]),.I0(BY[31]),.I1(TY[31]),.I2(FR[19]));

LUT3 #(.INIT( 8'hCA)) BMUX35(.O(BY[32]),.I0(TY[31]),.I1(CY[31]),.I2(FR[19]));


LUT3 #(.INIT( 8'hCA)) TMUX35B(.O(TYB[32]),.I0(CYB[31]),.I1(BYB[31]),.I2(FRB[19]));

LUT3 #(.INIT( 8'hCA)) CMUX35B(.O(CYB[32]),.I0(BYB[31]),.I1(TYB[31]),.I2(FRB[19]));

LUT3 #(.INIT( 8'hCA)) BMUX35B(.O(BYB[32]),.I0(TYB[31]),.I1(CYB[31]),.I2(FRB[19]));


// stage 43


LUT3 #(.INIT( 8'hCA)) TMUX36(.O(TY[33]),.I0(CY[32]),.I1(BY[32]),.I2(FR[20]));

LUT3 #(.INIT( 8'hCA)) CMUX36(.O(CY[33]),.I0(BY[32]),.I1(TY[32]),.I2(FR[20]));

LUT3 #(.INIT( 8'hCA)) BMUX36(.O(BY[33]),.I0(TY[32]),.I1(CY[32]),.I2(FR[20]));


LUT3 #(.INIT( 8'hCA)) TMUX36B(.O(TYB[33]),.I0(CYB[32]),.I1(BYB[32]),.I2(FRB[20]));

LUT3 #(.INIT( 8'hCA)) CMUX36B(.O(CYB[33]),.I0(BYB[32]),.I1(TYB[32]),.I2(FRB[20]));

LUT3 #(.INIT( 8'hCA)) BMUX36B(.O(BYB[33]),.I0(TYB[32]),.I1(CYB[32]),.I2(FRB[20]));


//

//stage 44

//(* LOCK_PINS="ALL", BEL="A5FF"*) 
//(* LOCK_PINS="ALL"*)
FD #(.INIT(0))FF_Arb21(.Q(FR[21]),.C(BY[4]),.D(TY[4]));


//(* LOCK_PINS="ALL", BEL="A5FF"*)  
//(* LOCK_PINS="ALL"*)
FD #(.INIT(0))FF_Arb22(.Q(FR[22]),.C(CY[4]),.D(BY[4]));


//(* LOCK_PINS="ALL", BEL="A5FF"*) 
//(* LOCK_PINS="ALL"*) 
FD #(.INIT(0))FF_Arb23(.Q(FR[23]),.C(TY[4]),.D(CY[4]));

FD #(.INIT(0))FF_Arb21B(.Q(FRB[21]),.C(BYB[4]),.D(TYB[4]));


//(* LOCK_PINS="ALL", BEL="A5FF"*)  
//(* LOCK_PINS="ALL"*)
FD #(.INIT(0))FF_Arb22B(.Q(FRB[22]),.C(CYB[4]),.D(BYB[4]));


//(* LOCK_PINS="ALL", BEL="A5FF"*) 
//(* LOCK_PINS="ALL"*) 
FD #(.INIT(0))FF_Arb23B(.Q(FRB[23]),.C(TYB[4]),.D(CYB[4]));

// stage 45



LUT3 #(.INIT( 8'hCA)) TMUX37(.O(TY[34]),.I0(CY[33]),.I1(BY[33]),.I2(FR[21]));

LUT3 #(.INIT( 8'hCA)) CMUX37(.O(CY[34]),.I0(BY[33]),.I1(TY[33]),.I2(FR[21]));

LUT3 #(.INIT( 8'hCA)) BMUX37(.O(BY[34]),.I0(TY[33]),.I1(CY[33]),.I2(FR[21]));


LUT3 #(.INIT( 8'hCA)) TMUX37B(.O(TYB[34]),.I0(CYB[33]),.I1(BYB[33]),.I2(FRB[21]));

LUT3 #(.INIT( 8'hCA)) CMUX37B(.O(CYB[34]),.I0(BYB[33]),.I1(TYB[33]),.I2(FRB[21]));

LUT3 #(.INIT( 8'hCA)) BMUX37B(.O(BYB[34]),.I0(TYB[33]),.I1(CYB[33]),.I2(FRB[21]));



// stage 46



LUT3 #(.INIT( 8'hCA)) TMUX38(.O(TY[35]),.I0(CY[34]),.I1(BY[34]),.I2(FR[22]));

LUT3 #(.INIT( 8'hCA)) CMUX38(.O(CY[35]),.I0(BY[34]),.I1(TY[34]),.I2(FR[22]));

LUT3 #(.INIT( 8'hCA)) BMUX38(.O(BY[35]),.I0(TY[34]),.I1(CY[34]),.I2(FR[22]));


LUT3 #(.INIT( 8'hCA)) TMUX38B(.O(TYB[35]),.I0(CYB[34]),.I1(BYB[34]),.I2(FRB[22]));

LUT3 #(.INIT( 8'hCA)) CMUX38B(.O(CYB[35]),.I0(BYB[34]),.I1(TYB[34]),.I2(FRB[22]));

LUT3 #(.INIT( 8'hCA)) BMUX38B(.O(BYB[35]),.I0(TYB[34]),.I1(CYB[34]),.I2(FRB[22]));


// stage 47


LUT3 #(.INIT( 8'hCA)) TMUX39(.O(TY[36]),.I0(CY[35]),.I1(BY[35]),.I2(FR[23]));

LUT3 #(.INIT( 8'hCA)) CMUX39(.O(CY[36]),.I0(BY[35]),.I1(TY[35]),.I2(FR[23]));

LUT3 #(.INIT( 8'hCA)) BMUX39(.O(BY[36]),.I0(TY[35]),.I1(CY[35]),.I2(FR[23]));


LUT3 #(.INIT( 8'hCA)) TMUX39B(.O(TYB[36]),.I0(CYB[35]),.I1(BYB[35]),.I2(FRB[23]));

LUT3 #(.INIT( 8'hCA)) CMUX39B(.O(CYB[36]),.I0(BYB[35]),.I1(TYB[35]),.I2(FRB[23]));

LUT3 #(.INIT( 8'hCA)) BMUX39B(.O(BYB[36]),.I0(TYB[35]),.I1(CYB[35]),.I2(FRB[23]));



//stage 48

//(* LOCK_PINS="ALL"*) 
FD #(.INIT(0))FF_Arb24(.Q(FR[24]),.C(BY[11]),.D(TY[11]));


//(* LOCK_PINS="ALL"*) 
FD #(.INIT(0))FF_Arb25(.Q(FR[25]),.C(CY[11]),.D(BY[11]));


//(* LOCK_PINS="ALL"*) 
FD #(.INIT(0))FF_Arb26(.Q(FR[26]),.C(TY[11]),.D(CY[11]));

FD #(.INIT(0))FF_Arb24B(.Q(FRB[24]),.C(BYB[11]),.D(TYB[11]));


//(* LOCK_PINS="ALL"*) 
FD #(.INIT(0))FF_Arb25B(.Q(FRB[25]),.C(CYB[11]),.D(BYB[11]));


//(* LOCK_PINS="ALL"*) 
FD #(.INIT(0))FF_Arb26B(.Q(FRB[26]),.C(TYB[11]),.D(CYB[11]));

// stage 49



LUT3 #(.INIT( 8'hCA)) TMUX40(.O(TY[37]),.I0(CY[36]),.I1(BY[36]),.I2(FR[24]));

LUT3 #(.INIT( 8'hCA)) CMUX40(.O(CY[37]),.I0(BY[36]),.I1(TY[36]),.I2(FR[24]));

LUT3 #(.INIT( 8'hCA)) BMUX40(.O(BY[37]),.I0(TY[36]),.I1(CY[36]),.I2(FR[24]));


LUT3 #(.INIT( 8'hCA)) TMUX40B(.O(TYB[37]),.I0(CYB[36]),.I1(BYB[36]),.I2(FRB[24]));

LUT3 #(.INIT( 8'hCA)) CMUX40B(.O(CYB[37]),.I0(BYB[36]),.I1(TYB[36]),.I2(FRB[24]));

LUT3 #(.INIT( 8'hCA)) BMUX40B(.O(BYB[37]),.I0(TYB[36]),.I1(CYB[36]),.I2(FRB[24]));



// stage 50



LUT3 #(.INIT( 8'hCA)) TMUX41(.O(TY[38]),.I0(CY[37]),.I1(BY[37]),.I2(FR[25]));

LUT3 #(.INIT( 8'hCA)) CMUX41(.O(CY[38]),.I0(BY[37]),.I1(TY[37]),.I2(FR[25]));

LUT3 #(.INIT( 8'hCA)) BMUX41(.O(BY[38]),.I0(TY[37]),.I1(CY[37]),.I2(FR[25]));


LUT3 #(.INIT( 8'hCA)) TMUX41B(.O(TYB[38]),.I0(CYB[37]),.I1(BYB[37]),.I2(FRB[25]));

LUT3 #(.INIT( 8'hCA)) CMUX41B(.O(CYB[38]),.I0(BYB[37]),.I1(TYB[37]),.I2(FRB[25]));

LUT3 #(.INIT( 8'hCA)) BMUX41B(.O(BYB[38]),.I0(TYB[37]),.I1(CYB[37]),.I2(FRB[25]));


// stage 51


LUT3 #(.INIT( 8'hCA)) TMUX42(.O(TY[39]),.I0(CY[38]),.I1(BY[38]),.I2(FR[26]));

LUT3 #(.INIT( 8'hCA)) CMUX42(.O(CY[39]),.I0(BY[38]),.I1(TY[38]),.I2(FR[26]));

LUT3 #(.INIT( 8'hCA)) BMUX42(.O(BY[39]),.I0(TY[38]),.I1(CY[38]),.I2(FR[26]));


LUT3 #(.INIT( 8'hCA)) TMUX42B(.O(TYB[39]),.I0(CYB[38]),.I1(BYB[38]),.I2(FRB[26]));

LUT3 #(.INIT( 8'hCA)) CMUX42B(.O(CYB[39]),.I0(BYB[38]),.I1(TYB[38]),.I2(FRB[26]));

LUT3 #(.INIT( 8'hCA)) BMUX42B(.O(BYB[39]),.I0(TYB[38]),.I1(CYB[38]),.I2(FRB[26]));


//stage 52

////////////////////////////////////////////////////

//(* LOCK_PINS="ALL"*) 
FD #(.INIT(0))FF_Arb27(.Q(FR[27]),.C(BY[7]),.D(TY[7]));


//(* LOCK_PINS="ALL"*) 
FD #(.INIT(0))FF_Arb28(.Q(FR[28]),.C(CY[7]),.D(BY[7]));


//(* LOCK_PINS="ALL"*) 
FD #(.INIT(0))FF_Arb29(.Q(FR[29]),.C(TY[7]),.D(CY[7]));

FD #(.INIT(0))FF_Arb27B(.Q(FRB[27]),.C(BYB[7]),.D(TYB[7]));


//(* LOCK_PINS="ALL"*) 
FD #(.INIT(0))FF_Arb28B(.Q(FRB[28]),.C(CYB[7]),.D(BYB[7]));


//(* LOCK_PINS="ALL"*) 
FD #(.INIT(0))FF_Arb29B(.Q(FRB[29]),.C(TYB[7]),.D(CYB[7]));

// stage 53



LUT3 #(.INIT( 8'hCA)) TMUX43(.O(TY[40]),.I0(CY[39]),.I1(BY[39]),.I2(FR[27]));

LUT3 #(.INIT( 8'hCA)) CMUX43(.O(CY[40]),.I0(BY[39]),.I1(TY[39]),.I2(FR[27]));

LUT3 #(.INIT( 8'hCA)) BMUX43(.O(BY[40]),.I0(TY[39]),.I1(CY[39]),.I2(FR[27]));


LUT3 #(.INIT( 8'hCA)) TMUX43B(.O(TYB[40]),.I0(CYB[39]),.I1(BYB[39]),.I2(FRB[27]));

LUT3 #(.INIT( 8'hCA)) CMUX43B(.O(CYB[40]),.I0(BYB[39]),.I1(TYB[39]),.I2(FRB[27]));

LUT3 #(.INIT( 8'hCA)) BMUX43B(.O(BYB[40]),.I0(TYB[39]),.I1(CYB[39]),.I2(FRB[27]));



// stage 54



LUT3 #(.INIT( 8'hCA)) TMUX44(.O(TY[41]),.I0(CY[40]),.I1(BY[40]),.I2(FR[28]));

LUT3 #(.INIT( 8'hCA)) CMUX44(.O(CY[41]),.I0(BY[40]),.I1(TY[40]),.I2(FR[28]));

LUT3 #(.INIT( 8'hCA)) BMUX44(.O(BY[41]),.I0(TY[40]),.I1(CY[40]),.I2(FR[28]));


LUT3 #(.INIT( 8'hCA)) TMUX44B(.O(TYB[41]),.I0(CYB[40]),.I1(BYB[40]),.I2(FRB[28]));

LUT3 #(.INIT( 8'hCA)) CMUX44B(.O(CYB[41]),.I0(BYB[40]),.I1(TYB[40]),.I2(FRB[28]));

LUT3 #(.INIT( 8'hCA)) BMUX44B(.O(BYB[41]),.I0(TYB[40]),.I1(CYB[40]),.I2(FRB[28]));


// stage 55


LUT3 #(.INIT( 8'hCA)) TMUX45(.O(TY[42]),.I0(CY[41]),.I1(BY[41]),.I2(FR[29]));

LUT3 #(.INIT( 8'hCA)) CMUX45(.O(CY[42]),.I0(BY[41]),.I1(TY[41]),.I2(FR[29]));

LUT3 #(.INIT( 8'hCA)) BMUX45(.O(BY[42]),.I0(TY[41]),.I1(CY[41]),.I2(FR[29]));


LUT3 #(.INIT( 8'hCA)) TMUX45B(.O(TYB[42]),.I0(CYB[41]),.I1(BYB[41]),.I2(FRB[29]));

LUT3 #(.INIT( 8'hCA)) CMUX45B(.O(CYB[42]),.I0(BYB[41]),.I1(TYB[41]),.I2(FRB[29]));

LUT3 #(.INIT( 8'hCA)) BMUX45B(.O(BYB[42]),.I0(TYB[41]),.I1(CYB[41]),.I2(FRB[29]));



//stage 56

////////////////////////////////////////////////////

//(* LOCK_PINS="ALL"*) 
FD #(.INIT(0))FF_Arb30(.Q(FR[30]),.C(BY[11]),.D(TY[11]));


//(* LOCK_PINS="ALL"*) 
FD #(.INIT(0))FF_Arb31(.Q(FR[31]),.C(CY[11]),.D(BY[11]));


//(* LOCK_PINS="ALL"*) 
FD #(.INIT(0))FF_Arb32(.Q(FR[32]),.C(TY[11]),.D(CY[11]));

FD #(.INIT(0))FF_Arb30B(.Q(FRB[30]),.C(BYB[11]),.D(TYB[11]));


//(* LOCK_PINS="ALL"*) 
FD #(.INIT(0))FF_Arb31B(.Q(FRB[31]),.C(CYB[11]),.D(BYB[11]));


//(* LOCK_PINS="ALL"*) 
FD #(.INIT(0))FF_Arb32B(.Q(FRB[32]),.C(TYB[11]),.D(CYB[11]));

// stage 57



LUT3 #(.INIT( 8'hCA)) TMUX46(.O(TY[43]),.I0(CY[42]),.I1(BY[42]),.I2(FR[30]));

LUT3 #(.INIT( 8'hCA)) CMUX46(.O(CY[43]),.I0(BY[42]),.I1(TY[42]),.I2(FR[30]));

LUT3 #(.INIT( 8'hCA)) BMUX46(.O(BY[43]),.I0(TY[42]),.I1(CY[42]),.I2(FR[30]));


LUT3 #(.INIT( 8'hCA)) TMUX46B(.O(TYB[43]),.I0(CYB[42]),.I1(BYB[42]),.I2(FRB[30]));

LUT3 #(.INIT( 8'hCA)) CMUX46B(.O(CYB[43]),.I0(BYB[42]),.I1(TYB[42]),.I2(FRB[30]));

LUT3 #(.INIT( 8'hCA)) BMUX46B(.O(BYB[43]),.I0(TYB[42]),.I1(CYB[42]),.I2(FRB[30]));



// stage 58



LUT3 #(.INIT( 8'hCA)) TMUX47(.O(TY[44]),.I0(CY[43]),.I1(BY[43]),.I2(FR[31]));

LUT3 #(.INIT( 8'hCA)) CMUX47(.O(CY[44]),.I0(BY[43]),.I1(TY[43]),.I2(FR[31]));

LUT3 #(.INIT( 8'hCA)) BMUX47(.O(BY[44]),.I0(TY[43]),.I1(CY[43]),.I2(FR[31]));


LUT3 #(.INIT( 8'hCA)) TMUX47B(.O(TYB[44]),.I0(CYB[43]),.I1(BYB[43]),.I2(FRB[31]));

LUT3 #(.INIT( 8'hCA)) CMUX47B(.O(CYB[44]),.I0(BYB[43]),.I1(TYB[43]),.I2(FRB[31]));

LUT3 #(.INIT( 8'hCA)) BMUX47B(.O(BYB[44]),.I0(TYB[43]),.I1(CYB[43]),.I2(FRB[31]));


// stage 59


LUT3 #(.INIT( 8'hCA)) TMUX48(.O(TY[45]),.I0(CY[44]),.I1(BY[44]),.I2(FR[32]));

LUT3 #(.INIT( 8'hCA)) CMUX48(.O(CY[45]),.I0(BY[44]),.I1(TY[44]),.I2(FR[32]));

LUT3 #(.INIT( 8'hCA)) BMUX48(.O(BY[45]),.I0(TY[44]),.I1(CY[44]),.I2(FR[32]));


LUT3 #(.INIT( 8'hCA)) TMUX48B(.O(TYB[45]),.I0(CYB[44]),.I1(BYB[44]),.I2(FRB[32]));

LUT3 #(.INIT( 8'hCA)) CMUX48B(.O(CYB[45]),.I0(BYB[44]),.I1(TYB[44]),.I2(FRB[32]));

LUT3 #(.INIT( 8'hCA)) BMUX48B(.O(BYB[45]),.I0(TYB[44]),.I1(CYB[44]),.I2(FRB[32]));




//stage 60
////////////////////////////////////////////////////

//(* LOCK_PINS="ALL"*) 
FD #(.INIT(0))FF_Arb33(.Q(FR[33]),.C(BY[12]),.D(TY[12]));


//(* LOCK_PINS="ALL"*) 
FD #(.INIT(0))FF_Arb34(.Q(FR[34]),.C(CY[12]),.D(BY[12]));


//(* LOCK_PINS="ALL"*)
FD #(.INIT(0))FF_Arb35(.Q(FR[35]),.C(TY[12]),.D(CY[12]));

FD #(.INIT(0))FF_Arb33B(.Q(FRB[33]),.C(BYB[12]),.D(TYB[12]));


//(* LOCK_PINS="ALL"*) 
FD #(.INIT(0))FF_Arb34B(.Q(FRB[34]),.C(CYB[12]),.D(BYB[12]));


//(* LOCK_PINS="ALL"*)
FD #(.INIT(0))FF_Arb35B(.Q(FRB[35]),.C(TYB[12]),.D(CYB[12]));


//stage 61

(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) TMUX50(.O(TY[46]),.I0(CY[45]),.I1(BY[45]),.I2(FR[33]));
(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) CMUX50(.O(CY[46]),.I0(BY[45]),.I1(TY[45]),.I2(FR[33]));
(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) BMUX50(.O(BY[46]),.I0(TY[45]),.I1(CY[45]),.I2(FR[33]));

(* BEL="B6LUT" *)
LUT3 #(.INIT( 8'hCA)) TMUX50B(.O(TYB[46]),.I0(CYB[45]),.I1(BYB[45]),.I2(FRB[33]));
(* BEL="B6LUT" *)
LUT3 #(.INIT( 8'hCA)) CMUX50B(.O(CYB[46]),.I0(BYB[45]),.I1(TYB[45]),.I2(FRB[33]));
(* BEL="B6LUT" *)
LUT3 #(.INIT( 8'hCA)) BMUX50B(.O(BYB[46]),.I0(TYB[45]),.I1(CYB[45]),.I2(FRB[33]));

//stage 62

(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) TMUX49(.O(TY[47]),.I0(CY[46]),.I1(BY[46]),.I2(FR[34]));
(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) CMUX49(.O(CY[47]),.I0(BY[46]),.I1(TY[46]),.I2(FR[34]));
(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) BMUX49(.O(BY[47]),.I0(TY[46]),.I1(CY[46]),.I2(FR[34]));

(* BEL="B6LUT" *)
LUT3 #(.INIT( 8'hCA)) TMUX49B(.O(TYB[47]),.I0(CYB[46]),.I1(BYB[46]),.I2(FRB[34]));
(* BEL="B6LUT" *)
LUT3 #(.INIT( 8'hCA)) CMUX49B(.O(CYB[47]),.I0(BYB[46]),.I1(TYB[46]),.I2(FRB[34]));
(* BEL="B6LUT" *)
LUT3 #(.INIT( 8'hCA)) BMUX49B(.O(BYB[47]),.I0(TYB[46]),.I1(CYB[46]),.I2(FRB[34]));

//stage 63


(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) TMUX51(.O(TY[48]),.I0(CY[47]),.I1(BY[47]),.I2(FR[35]));
(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) CMUX51(.O(CY[48]),.I0(BY[47]),.I1(TY[47]),.I2(FR[35]));
(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) BMUX51(.O(BY[48]),.I0(TY[47]),.I1(CY[47]),.I2(FR[35]));

(* BEL="B6LUT" *)
LUT3 #(.INIT( 8'hCA)) TMUX51B(.O(TYB[48]),.I0(CYB[47]),.I1(BYB[47]),.I2(FRB[35]));
(* BEL="B6LUT" *)
LUT3 #(.INIT( 8'hCA)) CMUX51B(.O(CYB[48]),.I0(BYB[47]),.I1(TYB[47]),.I2(FRB[35]));
(* BEL="B6LUT" *)
LUT3 #(.INIT( 8'hCA)) BMUX51B(.O(BYB[48]),.I0(TYB[47]),.I1(CYB[47]),.I2(FRB[35]));


//(* LOCK_PINS="ALL"*) 
FD #(.INIT(0))FF_Arb36(.Q(FR[36]),.C(BY[8]),.D(TY[8]));


//(* LOCK_PINS="ALL"*) 
FD #(.INIT(0))FF_Arb37(.Q(FR[37]),.C(CY[8]),.D(TY[8]));


//(* LOCK_PINS="ALL"*)
FD #(.INIT(0))FF_Arb38(.Q(FR[38]),.C(BY[8]),.D(CY[8]));

FD #(.INIT(0))FF_Arb36B(.Q(FRB[36]),.C(BYB[8]),.D(TYB[8]));


//(* LOCK_PINS="ALL"*) 
FD #(.INIT(0))FF_Arb37B(.Q(FRB[37]),.C(CYB[8]),.D(TYB[8]));


//(* LOCK_PINS="ALL"*)
FD #(.INIT(0))FF_Arb38B(.Q(FRB[38]),.C(BYB[8]),.D(CYB[8]));





//stage 64

(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) TMUX52(.O(TY[49]),.I0(CY[48]),.I1(BY[48]),.I2(FR[36]));
(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) CMUX52(.O(CY[49]),.I0(BY[48]),.I1(TY[48]),.I2(FR[36]));
(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) BMUX52(.O(BY[49]),.I0(TY[48]),.I1(CY[48]),.I2(FR[36]));

(* BEL="B6LUT" *)
LUT3 #(.INIT( 8'hCA)) TMUX52B(.O(TYB[49]),.I0(CYB[48]),.I1(BYB[48]),.I2(FRB[36]));
(* BEL="B6LUT" *)
LUT3 #(.INIT( 8'hCA)) CMUX52B(.O(CYB[49]),.I0(BYB[48]),.I1(TYB[48]),.I2(FRB[36]));
(* BEL="B6LUT" *)
LUT3 #(.INIT( 8'hCA)) BMUX52B(.O(BYB[49]),.I0(TYB[48]),.I1(CYB[48]),.I2(FRB[36]));


//stage 65

(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) TMUX53(.O(TY[50]),.I0(CY[49]),.I1(BY[49]),.I2(FR[37]));
(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) CMUX53(.O(CY[50]),.I0(BY[49]),.I1(TY[49]),.I2(FR[37]));
(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) BMUX53(.O(BY[50]),.I0(TY[49]),.I1(CY[49]),.I2(FR[37]));

(* BEL="B6LUT" *)
LUT3 #(.INIT( 8'hCA)) TMUX53B(.O(TYB[50]),.I0(CYB[49]),.I1(BYB[49]),.I2(FRB[37]));
(* BEL="B6LUT" *)
LUT3 #(.INIT( 8'hCA)) CMUX53B(.O(CYB[50]),.I0(BYB[49]),.I1(TYB[49]),.I2(FRB[37]));
(* BEL="B6LUT" *)
LUT3 #(.INIT( 8'hCA)) BMUX53B(.O(BYB[50]),.I0(TYB[49]),.I1(CYB[49]),.I2(FRB[37]));

//stage 66

(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) TMUX54(.O(TY[51]),.I0(CY[50]),.I1(BY[50]),.I2(FR[38]));
(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) CMUX54(.O(CY[51]),.I0(BY[50]),.I1(TY[50]),.I2(FR[38]));
(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) BMUX54(.O(BY[51]),.I0(TY[50]),.I1(CY[50]),.I2(FR[38]));

(* BEL="B6LUT" *)
LUT3 #(.INIT( 8'hCA)) TMUX54B(.O(TYB[51]),.I0(CYB[50]),.I1(BYB[50]),.I2(FRB[38]));
(* BEL="B6LUT" *)
LUT3 #(.INIT( 8'hCA)) CMUX54B(.O(CYB[51]),.I0(BYB[50]),.I1(TYB[50]),.I2(FRB[38]));
(* BEL="B6LUT" *)
LUT3 #(.INIT( 8'hCA)) BMUX54B(.O(BYB[51]),.I0(TYB[50]),.I1(CYB[50]),.I2(FRB[38]));


//stage 67

//(* LOCK_PINS="ALL"*)  
FD #(.INIT(0)) FF_PArb0(.Q(FR[39]),.C(BY[4]),.D(TY[4]));


//(* LOCK_PINS="ALL"*) 
FD #(.INIT(0)) FF_PArb1(.Q(FR[40]),.C(CY[4]),.D(BY[4]));


//(* LOCK_PINS="ALL"*)
FD #(.INIT(0)) FF_PArb2(.Q(FR[41]),.C(TY[4]),.D(BY[4]));

FD #(.INIT(0)) FF_PArb0B(.Q(FRB[39]),.C(BYB[4]),.D(TYB[4]));


//(* LOCK_PINS="ALL"*) 
FD #(.INIT(0)) FF_PArb1B(.Q(FRB[40]),.C(CYB[4]),.D(BYB[4]));


//(* LOCK_PINS="ALL"*)
FD #(.INIT(0)) FF_PArb2B(.Q(FRB[41]),.C(TYB[4]),.D(BYB[4]));


//stage 68

//wire DR;

(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) TMUX55(.O(TY[52]),.I0(CY[51]),.I1(BY[51]),.I2(FR[39]));
(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) CMUX55(.O(CY[52]),.I0(BY[51]),.I1(TY[51]),.I2(FR[39]));
(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) BMUX55(.O(BY[52]),.I0(TY[51]),.I1(CY[51]),.I2(FR[39]));

(* BEL="B6LUT" *)
LUT3 #(.INIT( 8'hCA)) TMUX55B(.O(TYB[52]),.I0(CYB[51]),.I1(BYB[51]),.I2(FRB[39]));
(* BEL="B6LUT" *)
LUT3 #(.INIT( 8'hCA)) CMUX55B(.O(CYB[52]),.I0(BYB[51]),.I1(TYB[51]),.I2(FRB[39]));
(* BEL="B6LUT" *)
LUT3 #(.INIT( 8'hCA)) BMUX55B(.O(BYB[52]),.I0(TYB[51]),.I1(CYB[51]),.I2(FRB[39]));


//stage 65

(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) TMUX56(.O(TY[53]),.I0(CY[52]),.I1(BY[52]),.I2(FR[40]));
(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) CMUX56(.O(CY[53]),.I0(BY[52]),.I1(TY[52]),.I2(FR[40]));
(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) BMUX56(.O(BY[53]),.I0(TY[52]),.I1(CY[52]),.I2(FR[40]));

(* BEL="B6LUT" *)
LUT3 #(.INIT( 8'hCA)) TMUX56B(.O(TYB[53]),.I0(CYB[52]),.I1(BYB[52]),.I2(FRB[40]));
(* BEL="B6LUT" *)
LUT3 #(.INIT( 8'hCA)) CMUX56B(.O(CYB[53]),.I0(BYB[52]),.I1(TYB[52]),.I2(FRB[40]));
(* BEL="B6LUT" *)
LUT3 #(.INIT( 8'hCA)) BMUX56B(.O(BYB[53]),.I0(TYB[52]),.I1(CYB[52]),.I2(FRB[40]));

//stage 66

(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) TMUX57(.O(TY[54]),.I0(CY[53]),.I1(BY[53]),.I2(FR[41]));
(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) CMUX57(.O(CY[54]),.I0(BY[53]),.I1(TY[53]),.I2(FR[41]));
(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) BMUX57(.O(BY[54]),.I0(TY[53]),.I1(CY[53]),.I2(FR[41]));

(* BEL="B6LUT" *)
LUT3 #(.INIT( 8'hCA)) TMUX57B(.O(TYB[54]),.I0(CYB[53]),.I1(BYB[53]),.I2(FRB[41]));
(* BEL="B6LUT" *)
LUT3 #(.INIT( 8'hCA)) CMUX57B(.O(CYB[54]),.I0(BYB[53]),.I1(TYB[53]),.I2(FRB[41]));
(* BEL="B6LUT" *)
LUT3 #(.INIT( 8'hCA)) BMUX57B(.O(BYB[54]),.I0(TYB[53]),.I1(CYB[53]),.I2(FRB[41]));


//(* LOCK_PINS="ALL"*)  
FD #(.INIT(0)) FF_PArb3(.Q(FR[42]),.C(BY[13]),.D(TY[13]));


//(* LOCK_PINS="ALL"*) 
FD #(.INIT(0)) FF_PArb4(.Q(FR[43]),.C(CY[13]),.D(BY[13]));


//(* LOCK_PINS="ALL"*)
FD #(.INIT(0)) FF_PArb5(.Q(FR[44]),.C(TY[13]),.D(BY[13]));

FD #(.INIT(0)) FF_PArb3B(.Q(FRB[42]),.C(BYB[13]),.D(TYB[13]));


//(* LOCK_PINS="ALL"*) 
FD #(.INIT(0)) FF_PArb4B(.Q(FRB[43]),.C(CYB[13]),.D(BYB[13]));


//(* LOCK_PINS="ALL"*)
FD #(.INIT(0)) FF_PArb5B(.Q(FRB[44]),.C(TYB[13]),.D(BYB[13]));


(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) TMUX58(.O(TY[55]),.I0(CY[54]),.I1(BY[54]),.I2(FR[42]));
(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) CMUX58(.O(CY[55]),.I0(BY[54]),.I1(TY[54]),.I2(FR[42]));
(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) BMUX58(.O(BY[55]),.I0(TY[54]),.I1(CY[54]),.I2(FR[42]));

(* BEL="B6LUT" *)
LUT3 #(.INIT( 8'hCA)) TMUX58B(.O(TYB[55]),.I0(CYB[54]),.I1(BYB[54]),.I2(FRB[42]));
(* BEL="B6LUT" *)
LUT3 #(.INIT( 8'hCA)) CMUX58B(.O(CYB[55]),.I0(BYB[54]),.I1(TYB[54]),.I2(FRB[42]));
(* BEL="B6LUT" *)
LUT3 #(.INIT( 8'hCA)) BMUX58B(.O(BYB[55]),.I0(TYB[54]),.I1(CYB[54]),.I2(FRB[42]));


//stage 65

(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) TMUX59(.O(TY[56]),.I0(CY[55]),.I1(BY[55]),.I2(FR[43]));
(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) CMUX59(.O(CY[56]),.I0(BY[55]),.I1(TY[55]),.I2(FR[43]));
(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) BMUX59(.O(BY[56]),.I0(TY[55]),.I1(CY[55]),.I2(FR[43]));

(* BEL="B6LUT" *)
LUT3 #(.INIT( 8'hCA)) TMUX59B(.O(TYB[56]),.I0(CYB[55]),.I1(BYB[55]),.I2(FRB[43]));
(* BEL="B6LUT" *)
LUT3 #(.INIT( 8'hCA)) CMUX59B(.O(CYB[56]),.I0(BYB[55]),.I1(TYB[55]),.I2(FRB[43]));
(* BEL="B6LUT" *)
LUT3 #(.INIT( 8'hCA)) BMUX59B(.O(BYB[56]),.I0(TYB[55]),.I1(CYB[55]),.I2(FRB[43]));

//stage 66

(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) TMUX60(.O(TY[57]),.I0(CY[56]),.I1(BY[56]),.I2(FR[44]));
(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) CMUX60(.O(CY[57]),.I0(BY[56]),.I1(TY[56]),.I2(FR[44]));
(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) BMUX60(.O(BY[57]),.I0(TY[56]),.I1(CY[56]),.I2(FR[44]));

(* BEL="B6LUT" *)
LUT3 #(.INIT( 8'hCA)) TMUX60B(.O(TYB[57]),.I0(CYB[56]),.I1(BYB[56]),.I2(FRB[44]));
(* BEL="B6LUT" *)
LUT3 #(.INIT( 8'hCA)) CMUX60B(.O(CYB[57]),.I0(BYB[56]),.I1(TYB[56]),.I2(FRB[44]));
(* BEL="B6LUT" *)
LUT3 #(.INIT( 8'hCA)) BMUX60B(.O(BYB[57]),.I0(TYB[56]),.I1(CYB[56]),.I2(FRB[44]));


//(* LOCK_PINS="ALL"*)  
FD #(.INIT(0)) FF_PArb6(.Q(FR[45]),.C(BY[10]),.D(TY[10]));


//(* LOCK_PINS="ALL"*) 
FD #(.INIT(0)) FF_PArb7(.Q(FR[46]),.C(CY[10]),.D(BY[10]));


//(* LOCK_PINS="ALL"*)
FD #(.INIT(0)) FF_PArb8(.Q(FR[47]),.C(TY[10]),.D(BY[10]));

FD #(.INIT(0)) FF_PArb6B(.Q(FRB[45]),.C(BYB[10]),.D(TYB[10]));


//(* LOCK_PINS="ALL"*) 
FD #(.INIT(0)) FF_PArb7B(.Q(FRB[46]),.C(CYB[10]),.D(BYB[10]));


//(* LOCK_PINS="ALL"*)
FD #(.INIT(0)) FF_PArb8B(.Q(FRB[47]),.C(TYB[10]),.D(BYB[10]));



(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) TMUX61(.O(TY[58]),.I0(CY[57]),.I1(BY[57]),.I2(C[13]));
(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) CMUX61(.O(CY[58]),.I0(BY[57]),.I1(TY[57]),.I2(C[13]));
(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) BMUX61(.O(BY[58]),.I0(TY[57]),.I1(CY[57]),.I2(C[13]));

(* BEL="B6LUT" *)
LUT3 #(.INIT( 8'hCA)) TMUX61B(.O(TYB[58]),.I0(CYB[57]),.I1(BYB[57]),.I2(C[13]));
(* BEL="B6LUT" *)
LUT3 #(.INIT( 8'hCA)) CMUX61B(.O(CYB[58]),.I0(BYB[57]),.I1(TYB[57]),.I2(C[13]));
(* BEL="B6LUT" *)
LUT3 #(.INIT( 8'hCA)) BMUX61B(.O(BYB[58]),.I0(TYB[57]),.I1(CYB[57]),.I2(C[13]));


//stage 65

(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) TMUX62(.O(TY[59]),.I0(CY[58]),.I1(BY[58]),.I2(C[14]));
(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) CMUX62(.O(CY[59]),.I0(BY[58]),.I1(TY[58]),.I2(C[14]));
(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) BMUX63(.O(BY[59]),.I0(TY[58]),.I1(CY[58]),.I2(C[14]));

(* BEL="B6LUT" *)
LUT3 #(.INIT( 8'hCA)) TMUX62B(.O(TYB[59]),.I0(CYB[58]),.I1(BYB[58]),.I2(C[14]));
(* BEL="B6LUT" *)
LUT3 #(.INIT( 8'hCA)) CMUX62B(.O(CYB[59]),.I0(BYB[58]),.I1(TYB[58]),.I2(C[14]));
(* BEL="B6LUT" *)
LUT3 #(.INIT( 8'hCA)) BMUX63B(.O(BYB[59]),.I0(TYB[58]),.I1(CYB[58]),.I2(C[14]));

//stage 66

(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) TMUX64(.O(TY[60]),.I0(CY[59]),.I1(BY[59]),.I2(C[15]));
(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) CMUX64(.O(CY[60]),.I0(BY[59]),.I1(TY[59]),.I2(C[15]));
(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) BMUX64(.O(BY[60]),.I0(TY[59]),.I1(CY[59]),.I2(C[15]));

(* BEL="B6LUT" *)
LUT3 #(.INIT( 8'hCA)) TMUX64B(.O(TYB[60]),.I0(CYB[59]),.I1(BYB[59]),.I2(C[15]));
(* BEL="B6LUT" *)
LUT3 #(.INIT( 8'hCA)) CMUX64B(.O(CYB[60]),.I0(BYB[59]),.I1(TYB[59]),.I2(C[15]));
(* BEL="B6LUT" *)
LUT3 #(.INIT( 8'hCA)) BMUX64B(.O(BYB[60]),.I0(TYB[59]),.I1(CYB[59]),.I2(C[15]));




//(* LOCK_PINS="ALL"*)  
FD #(.INIT(0)) FF_PArb9(.Q(R0),.C(BY[60]),.D(TY[60]));


//(* LOCK_PINS="ALL"*) 
FD #(.INIT(0)) FF_PArb10(.Q(R1),.C(CY[60]),.D(BY[60]));


//(* LOCK_PINS="ALL"*)
FD #(.INIT(0)) FF_PArb11(.Q(R2),.C(TY[60]),.D(BY[60]));

FD #(.INIT(0)) FF_PArb9B(.Q(R0B),.C(BYB[60]),.D(TYB[60]));


//(* LOCK_PINS="ALL"*) 
FD #(.INIT(0)) FF_PArb10B(.Q(R1B),.C(CYB[60]),.D(BYB[60]));


//(* LOCK_PINS="ALL"*)
FD #(.INIT(0)) FF_PArb11B(.Q(R2B),.C(TYB[60]),.D(BYB[60]));


(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) MUX_OUT(.O(R3),.I0(R0),.I1(R1),.I2(R2));

(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) MUX_OUT1(.O(R4),.I0(R1),.I1(R2),.I2(R0));

(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) MUX_OUTB(.O(R3B),.I0(R0B),.I1(R1B),.I2(R2B));

(* BEL="A6LUT" *)
LUT3 #(.INIT( 8'hCA)) MUX_OUT1B(.O(R4B),.I0(R1B),.I1(R2B),.I2(R0B));


assign R = R3 ^ R4;

assign RB = R3B ^ R4B;

//assign R = R1 ^ R2 ^ R0;


//(* LOCK_PINS="ALL", BEL="A5FF"*)  
//FD #(.INIT(0)) FDCE_Arb(.Q(done),.C(BY[15]),.D(1));
//
//



endmodule