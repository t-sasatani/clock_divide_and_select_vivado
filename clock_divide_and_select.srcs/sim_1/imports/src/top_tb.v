`timescale 10ns/1ns

module top_tb;
    //define signal
    reg     r_clk;
    reg     [7:0]   r_io_in;
    wire    [7:0]   w_out;
    //reg     [4:0]   r_clock_counter_a;
    //reg     [4:0]   r_clock_div_factor_a;

    //1MHz clock signal generation
    initial begin
        r_clk = 0;
        r_io_in = 8'b00000110;
    end
            
    always #(1)
        r_clk <= ~r_clk;
        
    always #(100)
        r_io_in[0] <= ~r_io_in[0];

    //read out top module
    top top_inst(
        //.clock_div_factor_a (r_clock_div_factor_a),
        //.clock_counter_a    (r_clock_counter_a),
        .clk        (r_clk),
        .io_in      (r_io_in),
        .out        (w_out)
    );

endmodule