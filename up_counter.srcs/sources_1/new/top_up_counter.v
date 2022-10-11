`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/11 16:48:59
// Design Name: 
// Module Name: top_up_counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top_up_counter(
        input i_clk,  
        input i_reset,
        output[3:0] o_position,
        output[7:0] o_value
    );

     wire w_clk;
     wire [1:0] w_counter;
     wire w_clk_10hz;
     wire [13:0] w_value;
     wire [3:0] w_1000, w_100, w_10, w_1;
     wire [3:0] w_result;

    clock_divider clk_div(
        .i_clk(i_clk),
        .i_reset(i_reset),
        .o_clk(w_clk)
    );

    counter_fnd cnt_fnd(
        .i_clk(w_clk),  
        .i_reset(i_reset),  
        .o_counter(w_counter)
    );

    decoder_2x4 decoder_24(
        .i_digitSelect(w_counter),
        .i_en(1'b0),
        .o_digit(o_position)
    );

    clock_divider_digit clk_div_digit(
        .i_clk(i_clk),
        .i_reset(i_reset),
        .o_clk(w_clk_10hz)
    );

    counter_data cnt_data(
        .i_clk(w_clk_10hz),
        .i_reset(i_reset),

        .o_counter(w_value)
    );

    digit_divider digit_div(
        .i_value(w_value),
        .o_1000(w_1000),
        .o_100(w_100),
        .o_10(w_10),
        .o_1(w_1)
    );

    mux_4x1 mux_4x1_dut(
        .i_1000(w_1000),
        .i_100(w_100),
        .i_10(w_10),
        .i_1(w_1),
        .i_counter(w_counter),
        
        .o_value(w_result)
    );

    bcd2fnd_decoder bcd2fnd_decoder_dut(
        .i_value(w_result),
        .i_en(1'b0),
        .o_font(o_value)
    );
endmodule
