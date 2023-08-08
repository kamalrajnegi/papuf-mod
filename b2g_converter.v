module b2g_converter #(parameter WIDTH=16) (input [WIDTH-1:0] binary, output [WIDTH-1:0] gray);
  genvar i;    
  generate
    for(i=0;i<WIDTH-1;i = i+1) begin
      assign gray[i] = binary[i] ^ binary[i+1];
    end
  endgenerate
  
  assign gray[WIDTH-1] = binary[WIDTH-1];
endmodule