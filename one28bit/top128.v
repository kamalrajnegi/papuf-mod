module top128(
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
(*DONT_TOUCH = "TRUE"*)wire [15:0]challenge;
(*DONT_TOUCH = "TRUE"*)wire [127:0]response;

wire done_rx;

wire [15:0]binary;

uart_rx_16 RX(rx,clk,enable_rx,binary,done_rx);

//b2g_converter grey(binary,challenge);

(*DONT_TOUCH = "TRUE"*) wire [5:0]state;
(*DONT_TOUCH = "TRUE"*) wire puf_done;

wire start_puf;

assign start_puf = ~done_rx;

puf128 apuf(clk,start_puf,binary,response,puf_done,state);

reg [3:0]delay;

always @(posedge txclk) begin
    delay[0] <= done_rx;
    delay[1] <= delay[0];
    delay[2] <= delay[1];
    delay[3] <= delay[2];
end

assign enable = ~ delay[3];

wire [127:0] dat = 128'hABCDEF9876543210ABCDEF9876543210;

wire [127:0] response_check;

assign response_check = check?dat:response;


uart_tx_128 TX(clk,enable,response_check,tx_out,tx_done,txclk);

endmodule