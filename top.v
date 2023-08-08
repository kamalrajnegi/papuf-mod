module top(
    output enable,
    input clk,
    input rx,
    input enable_rx,
    output done_rx,
    output tx_out,
    output tx_done//,
    //output [15:0]challenge
    );


wire txclk;
(*DONT_TOUCH = "TRUE"*)wire [15:0]response,challenge;
wire done_rx;

wire [15:0]binary;

uart_rx_16 RX(rx,clk,enable_rx,binary,done_rx);

b2g_converter grey(binary,challenge);

//puf1bit16_r16 apuf(challenge,done_rx,response);
(*DONT_TOUCH = "TRUE"*) papuf16xor apuf(done_rx,challenge,response);

reg [3:0]delay;
always @(posedge txclk) begin
    delay[0] <= done_rx;
    delay[1] <= delay[0];
    delay[2] <= delay[1];
    delay[3] <= delay[2];
end

assign enable = ~ delay[3];

//wire [15:0] dat = 16'hABCD;

uart_tx_multi TX(clk,enable,response,tx_out,tx_done,txclk);

endmodule
