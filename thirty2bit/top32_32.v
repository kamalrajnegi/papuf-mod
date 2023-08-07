module top32_32(
    input check,
    //output enable,
    input clk,
    input rx,
    input enable_rx,
    output done_rx,
    output tx_out,
    //output tx_done
    output [2:0]state
    );


wire txclk,tx_done,enable;
(*DONT_TOUCH = "TRUE"*)wire [31:0]challenge;
(*DONT_TOUCH = "TRUE"*)wire [31:0]response;

wire done_rx;

wire [31:0]binary;

uart_rx_32 RX(rx,clk,enable_rx,binary,done_rx,state);

b2g_converter grey(binary,challenge);


papuf32_32 puf(done_rx,challenge,response);

reg [3:0]delay;

always @(posedge txclk) begin
    delay[0] <= done_rx;
    delay[1] <= delay[0];
    delay[2] <= delay[1];
    delay[3] <= delay[2];
end

assign enable = ~ delay[3];

wire [31:0] response_check;

assign response_check = check?binary:response;


uart_tx_32 TX(clk,enable,response_check,tx_out,tx_done,txclk);

endmodule


module b2g_converter #(parameter WIDTH=32) (input [WIDTH-1:0] binary, output [WIDTH-1:0] gray);
  genvar i;    
  generate
    for(i=0;i<WIDTH-1;i = i+1) begin
      assign gray[i] = binary[i] ^ binary[i+1];
    end
  endgenerate
  
  assign gray[WIDTH-1] = binary[WIDTH-1];
endmodule