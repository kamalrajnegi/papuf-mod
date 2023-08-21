module top16bit(
    input check,
    output enable,
    input clk,
    input rx,
    input enable_rx,
    output done_rx,
    output tx_out,
    output tx_done
    );


wire txclk;
(*DONT_TOUCH = "TRUE"*)wire [15:0]response,challenge,const;
wire done_rx;

wire [15:0]binary;

uart_rx_16 RX(rx,clk,enable_rx,binary,done_rx);

b2g_converter grey(binary,challenge);

//puf1bit16_r16 apuf(challenge,done_rx,response);
(*DONT_TOUCH = "TRUE"*) papuf_16_ff_16_16 apuf(done_rx,challenge,response);

reg [3:0]delay;
always @(posedge txclk) begin
    delay[0] <= done_rx;
    delay[1] <= delay[0];
    delay[2] <= delay[1];
    delay[3] <= delay[2];
end

assign enable = ~ delay[3];

wire [15:0] data;

assign const = 16'h1234;

assign data = check?const:response;

uart_tx_16 TX(clk,enable,data,tx_out,tx_done,txclk);

endmodule
