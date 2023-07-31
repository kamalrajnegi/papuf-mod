module uart_rx_16(
    input rx,
    input clk,
    input enable,
    output reg [15:0]data_o,
    output reg done
    );

wire clk_out,rx_done;

wire [7:0]data_out;

reg [7:0]dummy;

uart_rx_clk clk(clk,clk_out);
uart_rx U0(rx,clk_out,enable,data_out,rx_done);


reg [1:0]state = 0;

always @(posedge rx_done) begin
        case (state)
            2'd0: begin
            done <= 0;
            data_o[15:8] <= data_out;
            state <= 1;
            end
            2'd1: begin
            data_o[7:0] <= data_out;
            state <= 2;
            done <= 0;
            end
            2'd2: begin
            dummy <= data_out;
            state <= 0;
            done <= 1;
            end
            default : state <= 0;
        endcase
end

endmodule

module uart_tx_multi(
input clk,
input enable,
input [15:0]tx_data128,
output tx_out,
output reg tx_done,
output txclk
);


wire tx_empty,txclk;

reg [15:0]data;

wire [7:0]tx_data;
assign tx_data = data[15:8];     //Change this to first 8 bit of  MSB

reg load_send;
reg [3:0]state;


reg [5:0]count;

always @ (posedge txclk)begin
if(enable) begin
    state <= 0;
    data <= tx_data128;
    load_send <= 1;
    tx_done <= 0;
    count <= 0;
    end else begin
            case(state)
            4'd0:
                begin
                    load_send <= 1;
                    state <= 1;
                    tx_done <= 0;
                end
            4'd1:
                begin
                    tx_done <= 0;
                    load_send <= 1;
                    state <= 2;
                end
            4'd2:
                begin
                    tx_done <= 0;
                    load_send <= 0;
                        if(tx_empty)
                            state <= 3;
                        else
                            state <= 2;
                end
            4'd3:
                  begin
                    count <= count +1;
                    load_send <= 1;
                    data <= (data << 8);
                    state <= 4;
                    tx_done <= 0;
                  end
            4'd4: 
                begin
                    load_send <= 1;
                    state <= 5;
                    tx_done <= 0;
                end

            4'd5:
                begin
                    tx_done <= 0;
                    load_send <= 0;
                        if(tx_empty)
                            state <= 6;
                        else
                            state <= 5;
                end
            4'd6:
                begin
                    if(count == 1)     //Change the value of count
                        state <= 7;
                    else
                        state <= 3;
                end
            4'd7:
                begin
                    tx_done <= 1;
                    load_send <= 1;
                    state <= 7;
                end
            default:
                state <= 7;
            endcase
        end
end

//---------------------------- UART for 1 byte data transfer ----------------------------------------
assign ld_tx_data = load_send;
assign tx_enable = ~load_send;
uart_tx_clk clk0(clk,txclk);
uart_tx TX(enable,txclk,ld_tx_data,tx_data,tx_enable,tx_out,tx_empty);// reset is modified with enable
//------------------------------------------------------------------------------------------
endmodule


module uart_tx_8 (
    input enable,
    input clk,          //Connect this to System Clock
    input load_send,
    input [7:0]tx_data,
    output tx_out,
    output tx_empty,
    output txclk
    );

//---------------------------- UART for 1 byte data transfer ----------------------------------------
assign ld_tx_data = load_send;
assign tx_enable = ~load_send;
uart_tx_clk clk0(clk,txclk);
uart_tx TX(enable,txclk,ld_tx_data,tx_data,tx_enable,tx_out,tx_empty);// reset is modified with enable
//------------------------------------------------------------------------------------------

endmodule




module uart_rx_8(
    input rx,
    input clk,
    input enable,
    output reg [7:0]data_o,
    output reg [7:0]dummy,
    output reg done
    );
wire clk_out,rx_done;


//reg [7:0]dummy;
wire [7:0] data_out;

uart_rx_clk clk(clk,clk_out);
uart_rx U0(rx,clk_out,enable,data_out,rx_done);


reg state = 0;

always @(posedge rx_done) begin
        case (state)
            1'd0: begin
            done <= 0;
            data_o[7:0] <= data_out;
            state <= 1;
            end
            1'd1: begin
            dummy <= data_out;
            state <= 0;
            done <= 1;
            end
            default : state <= 0;
        endcase
end


endmodule



module uart_rx(input wire rx,
        input wire clk,
        input wire clken,
        output reg [7:0] data,
        output reg rx_done);



parameter RX_STATE_START    = 2'b00;
parameter RX_STATE_DATA     = 2'b01;
parameter RX_STATE_STOP     = 2'b10;
parameter RX_STATE_DONE     = 2'b11;

reg [1:0] state = RX_STATE_START;
reg [3:0] sample = 0;
reg [3:0] bitpos = 0;
reg [7:0] scratch = 8'b0;

always @(posedge clk) begin

    if (clken) begin
        case (state)
        RX_STATE_START: begin
            rx_done <= 0;
            if (!rx || sample != 0)
                sample <= sample + 4'b1;

            if (sample == 15) begin
                state <= RX_STATE_DATA;
                bitpos <= 0;
                sample <= 0;
                scratch <= 0;
            end
        end
        RX_STATE_DATA: begin
            rx_done <= 0;
            sample <= sample + 4'b1;
            if (sample == 4'h8) begin
                scratch[bitpos[2:0]] <= rx;
                bitpos <= bitpos + 4'b1;
            end
            if (bitpos == 8 && sample == 15)
                state <= RX_STATE_STOP;
        end
        RX_STATE_STOP: begin
            if (sample == 15 || (sample >= 8 && !rx)) begin
                state <= RX_STATE_DONE;
                data <= scratch;
                sample <= 0;
            end else begin
                sample <= sample + 4'b1;
            end
        end
        RX_STATE_DONE: begin
            state <= RX_STATE_START;
            rx_done <= 1;
        end
        default: begin
            state <= RX_STATE_START;
        end
        endcase
    end
end

endmodule



module uart_rx_clk(
    input clk,
    output reg clk_out
    );

reg [31:0]count;

always @(posedge clk) begin
    //if(count == 68)             //Baud rate is 115200   for 125MHz
    if(count == 27)                   //edge 115200
        count <= 0;
    else
        count <= count +1;
    //clk_out <= (count < 34)?1:0;  //zybo
    clk_out <= (count < 13)?1:0;  //50% duty cycle
end
endmodule


module uart_tx(
reset          ,
txclk          ,
ld_tx_data     ,
tx_data        ,
tx_enable      ,
tx_out         ,
tx_empty       
);

// Port declarations
input        reset          ; // to rst pin 
input        txclk          ; // set Baud rate as txclk clock frequency 
input        ld_tx_data     ; // load tx data to tx register when '1'
input  [7:0] tx_data        ; // tx data 8-bit data input
input        tx_enable      ; //  transmit when enable 
output       tx_out         ; // Serial port pin; goes to pin PACKAGE_PIN C4(nexys4) 
output       tx_empty       ; // give this pin to Spartan-3E LED
// Internal Variables 
reg [7:0]    tx_reg         ;
reg          tx_empty       ;
reg          tx_over_run  ;   //********************** Unused
reg [3:0]    tx_cnt         ; //counter
reg          tx_out         ; // serial output 


// UART TX Logic
always @ (posedge txclk or posedge reset)
if (reset) begin
  tx_reg        <= 0;
  tx_empty      <= 1;
  tx_over_run   <= 0;         //********************** Unused
  tx_out        <= 1; // default high 
  tx_cnt        <= 0;
end else begin
   if (ld_tx_data) begin//when 1
      if (!tx_empty) begin // when 0(not empty)
        tx_over_run <= 0;
      end else begin
        tx_reg   <= tx_data;// load tx_data when empty
        tx_empty <= 0;
      end
   end
   if (tx_enable && !tx_empty) begin// when clk is high and reg is not empty and tx_en is high
    
     tx_cnt <= tx_cnt + 1;
     if (tx_cnt == 0) begin
       tx_out <= 0;//start bit
     end
     if (tx_cnt > 0 && tx_cnt < 9) begin//8 bit data
        tx_out <= tx_reg[tx_cnt -1];// shifting and transmitting 
     end
     if (tx_cnt == 9) begin
       tx_out <= 1;// stop bit 1
       tx_cnt <= 0;
       //done <= 1'b0;
       tx_empty <= 1;// ready to take next data 
     end
   end
   if (!tx_enable) begin
     tx_cnt <= 0;
   end
end


endmodule


module uart_tx_clk(
input clk,
output reg clk_out

    );
    
    reg [20:0]count;
    always @ (posedge clk)begin
    //if(count == 1085)             //baud rate is 115200 
    if(count == 434)                 //baud rate is 115200
        count <= 0;
    else
        count <= count + 1;
        
    //clk_out <= (count < 540)?1:0; //zybo
    clk_out <= (count < 217)?1:0; //edge
    end
endmodule




module uart_tx_128(
input clk,
input enable,
input [127:0]tx_data128,
output tx_out,
output reg tx_done,
output txclk
);


wire tx_empty,txclk;

reg [127:0]data;

wire [7:0]tx_data;
assign tx_data = data[127:120];     //Change this to first 8 bit of  MSB

reg load_send;
reg [3:0]state;


reg [5:0]count;

always @ (posedge txclk)begin
if(enable) begin
    state <= 0;
    data <= tx_data128;
    load_send <= 1;
    tx_done <= 0;
    count <= 0;
    end else begin
            case(state)
            4'd0:
                begin
                    load_send <= 1;
                    state <= 1;
                    tx_done <= 0;
                end
            4'd1:
                begin
                    tx_done <= 0;
                    load_send <= 1;
                    state <= 2;
                end
            4'd2:
                begin
                    tx_done <= 0;
                    load_send <= 0;
                        if(tx_empty)
                            state <= 3;
                        else
                            state <= 2;
                end
            4'd3:
                  begin
                    count <= count +1;
                    load_send <= 1;
                    data <= (data << 8);
                    state <= 4;
                    tx_done <= 0;
                  end
            4'd4: 
                begin
                    load_send <= 1;
                    state <= 5;
                    tx_done <= 0;
                end

            4'd5:
                begin
                    tx_done <= 0;
                    load_send <= 0;
                        if(tx_empty)
                            state <= 6;
                        else
                            state <= 5;
                end
            4'd6:
                begin
                    if(count == 15)     //Change the value of count
                        state <= 7;
                    else
                        state <= 3;
                end
            4'd7:
                begin
                    tx_done <= 1;
                    load_send <= 1;
                    state <= 7;
                end
            default:
                state <= 7;
            endcase
        end
end

//---------------------------- UART for 1 byte data transfer ----------------------------------------
assign ld_tx_data = load_send;
assign tx_enable = ~load_send;
uart_tx_clk clk0(clk,txclk);
uart_tx TX(enable,txclk,ld_tx_data,tx_data,tx_enable,tx_out,tx_empty);// reset is modified with enable
//------------------------------------------------------------------------------------------
endmodule