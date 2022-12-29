`timescale 10ns/1ns

module top(
        input   wire    clk,
        input   wire    [7:0]   io_in,
        output  wire    [7:0]   out
    );
    
    reg [3:0]   clock_counter_a     =   4'b0000;
    reg [3:0]   clock_counter_b     =   4'b0000;
    wire [2:0]   clock_div_factor_a;
    wire [2:0]   clock_div_factor_b;
    wire        clock_select;
    wire        enable;
    
    reg         clock_a              =   0;
    reg         clock_b              =   0;
    wire        clock_syn;
    
    assign  clock_select = io_in[0];
    assign  enable = io_in[1];
    assign  clock_syn = (enable)? ((clock_select) ? clock_a:clock_b):0;
    assign  clock_div_factor_a = io_in[4:2];
    assign  clock_div_factor_b = io_in[7:5];
    assign out[0] = clock_syn;
    assign out[1] = clock_a;
    assign out[2] = clock_b;
    assign out[3] = clk;
    assign out[7:4] = 4'b0000;
    
    always begin
        @(posedge clk)
            clock_counter_a <= clock_counter_a + 1;
            clock_counter_b <= clock_counter_b + 1;
        @(negedge clk)
            if (clock_div_factor_a < clock_counter_a) begin
                clock_a <= ~clock_a;
                clock_counter_a <= 4'b0000;
            end
            if (clock_div_factor_b < clock_counter_b) begin
                clock_b <= ~clock_b;
                clock_counter_b <= 4'b0000;
            end
    end
    
endmodule