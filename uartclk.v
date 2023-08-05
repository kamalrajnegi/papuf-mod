module uart_rx_clk(
    input clk,
    output reg clk_out
    );

reg [31:0]count;

always @(posedge clk) begin
    if(count == 68)             //Baud rate is 115200   for 125MHz
    //if(count == 27)                   //edge 115200
        count <= 0;
    else
        count <= count +1;
    clk_out <= (count < 34)?1:0;  //zybo
    //clk_out <= (count < 13)?1:0;  //50% duty cycle
end
endmodule



module uart_tx_clk(
input clk,
output reg clk_out

    );
    
    reg [20:0]count;
    always @ (posedge clk)begin
    if(count == 1085)             //baud rate is 115200 
    //if(count == 434)                 //baud rate is 115200
        count <= 0;
    else
        count <= count + 1;
        
    clk_out <= (count < 540)?1:0; //zybo
    //clk_out <= (count < 217)?1:0; //edge
    end
endmodule