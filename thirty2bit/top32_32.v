module top16_32(
    input check,
    output enable,
    input clk,
    input rx,
    input enable_rx,
    output done_rx,
    output tx_out,
    output tx_done
    );


wire txclk,tx_done,enable;
(*DONT_TOUCH = "TRUE"*)wire [15:0]challenge;
(*DONT_TOUCH = "TRUE"*)wire [31:0]response;

wire done_rx;

wire [15:0]binary;

uart_rx_16 RX(rx,clk,enable_rx,binary,done_rx);

b2g_converter grey(binary,challenge);


papuf_16_32 puf(done_rx,challenge,response);

reg [3:0]delay;

always @(posedge txclk) begin
    delay[0] <= done_rx;
    delay[1] <= delay[0];
    delay[2] <= delay[1];
    delay[3] <= delay[2];
end

assign enable = ~ delay[3];

wire [31:0] response_check;

assign response_check = check?{16'd0,binary}:response;


uart_tx_32 TX(clk,enable,response_check,tx_out,tx_done,txclk);

endmodule