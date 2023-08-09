module uart_rx_clk(
    input clk,
    output reg clk_out
    );

reg [31:0]count;

always @(posedge clk) begin
    if(count == 54)                 //baud rate is 115200 for 100MHZ Nexys 4 DDR
    //if(count == 68)             //Baud rate is 115200   for 125MHz
    //if(count == 27)                   //edge 115200
        count <= 0;
    else
        count <= count +1;
    clk_out <= (count < 27)?1:0; //Nexys 4 DDR
    //clk_out <= (count < 34)?1:0;  //zybo
    //clk_out <= (count < 13)?1:0;  //edge
end
endmodule



module uart_tx_clk(
input clk,
output reg clk_out

    );
    
    reg [20:0]count;
    always @ (posedge clk)begin
    if(count == 868)                //NEXYS4 DDR
    //if(count == 1085)             //baud rate is 115200 
    //if(count == 434)                 //baud rate is 115200
        count <= 0;
    else
        count <= count + 1;
    clk_out <= (count < 434)?1:0; //nexys4 ddr 
    //clk_out <= (count < 540)?1:0; //zybo
    //clk_out <= (count < 217)?1:0; //edge
    end
endmodule