module puf128(
    input clk,rst,
    input [15:0] C,
    output reg [127:0]puf_out,
    output reg puf_done,
    output reg [5:0]state
    );


//wire [15:0]data_out = 16'h1234;      //This is for testing this module connect this to PUF Output


//************************************** This is PUF 16 -------------------------


(* DONT_TOUCH = "TRUE" *) wire [15:0]data_out;


papuf_16_16 PUF0(next_LFSR,mux_in,data_out);


//wire [15:0]data_out = 16'h5566;
//-------------------------------------------- Linear Feedback Shift Register ------------------------ 
(* DONT_TOUCH = "TRUE" *) wire [15:0]mux_in;
wire done;
reg start_new,next_LFSR;
//reg [5:0]state;
    

LFSR_16_PUFTRNG lfsr(clk,start_new,next_LFSR,C,mux_in,done);



always @ (posedge clk)
begin
    if(rst) 
        begin
            start_new <= 0;
            next_LFSR <= 0;
            state <= 0;
            puf_done <= 0;
            puf_out <= 128'h5468697349734E6F74576F726B696E67;
        end
    else begin
        case (state)
            6'd0:
            begin
                start_new <= 1;
                state <= 1;
                next_LFSR <= 0;
                puf_done <= 0;
            end
            6'd1:
            begin
                if(done) begin
                    puf_done <= 0;
                    next_LFSR <= 1;
                    state <= 2;
                end
                else begin
                    puf_done <= 0;
                    next_LFSR <= 0;
                end
            end
            6'd2:
            begin
                puf_done <= 0;
                    next_LFSR <= 1;
                    state <= 3;
            end
            6'd3:
            begin
                if(done) begin
                    puf_done <= 0;
                    next_LFSR <= 1;
                    state <= 4;
                end
                else begin
                    puf_done <= 0;
                    puf_out[127:112] <= data_out;
                    next_LFSR <= 0;
                end
            end
            6'd4:
            begin
                    next_LFSR <= 1;
                    state <= 5;
                    puf_done <= 0;
            end
            6'd5:
            begin
                if(done) begin
                    next_LFSR <= 1;
                    state <= 6;
                    puf_done <= 0;
                end
                else begin
                    puf_out[111:96] <= data_out;
                    next_LFSR <= 0;
                    puf_done <= 0;
                end
            end
            6'd6:
            begin
                    next_LFSR <= 1;
                    state <= 7;
                    puf_done <= 0;
            end
            6'd7:
            begin
                if(done) begin
                    next_LFSR <= 1;
                    state <= 8;
                    puf_done <= 0;
                end
                else begin
                    puf_out[95:80] <= data_out;
                    next_LFSR <= 0;
                    puf_done <= 0;
                end
            end
            6'd8:
            begin
                    next_LFSR <= 1;
                    state <= 9;
                    puf_done <= 0;
            end
            6'd9:
            begin
                if(done) begin
                    next_LFSR <= 1;
                    state <= 10;
                    puf_done <= 0;
                end
                else begin
                    puf_out[79:64] <= data_out;
                    next_LFSR <= 0;
                    puf_done <= 0;
                end
            end
            6'd10:
            begin
                    next_LFSR <= 1;
                    state <= 11;
                    puf_done <= 0;
            end
            6'd11:
            begin
                if(done) begin
                    next_LFSR <= 1;
                    state <= 12;
                    puf_done <= 0;
                end
                else begin
                    puf_out[63:48] <= data_out;
                    next_LFSR <= 0;
                    puf_done <= 0;
                end
            end
            6'd12:
            begin
                    next_LFSR <= 1;
                    state <= 13;
                    puf_done <= 0;
            end
            6'd13:
            begin
                if(done) begin
                    next_LFSR <= 1;
                    state <= 14;
                    puf_done <= 0;
                end
                else begin
                    puf_out[47:32] <= data_out;
                    next_LFSR <= 0;
                    puf_done <= 0;
                end
            end

            6'd14:
            begin
                    next_LFSR <= 1;
                    state <= 15;
                    puf_done <= 0;
            end
            6'd15:
            begin
                if(done) begin
                    next_LFSR <= 1;
                    state <= 16;
                    puf_done <= 0;
                end
                else begin
                    puf_out[31:16] <= data_out;
                    next_LFSR <= 0;
                    puf_done <= 0;
                end
            end 
            6'd16:
            begin
                state <= 17;
                next_LFSR <= 0;
                puf_done <= 0;
            end
            6'd17:
            begin
                puf_out[15:0] <= data_out;
                start_new <= 0;
                next_LFSR <= 0;
                state <= 18;
                puf_done <= 0;
            end
            6'd18:
            begin
                state <= 18;
                puf_done <= 1;
                start_new <= 0;
                next_LFSR <= 0;
            end
                default :
                state <= 0;
        endcase
    end
 
end



endmodule

