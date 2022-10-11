`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/11 15:28:36
// Design Name: 
// Module Name: clock_divider
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


module clock_divider(
        input i_clk,
        input i_reset,
        output o_clk
    );

    reg  r_clk = 0;
    reg [31:0] r_counter = 0;
    assign o_clk = r_clk;
    // 100_000 / 2 -1 => 1kHz  =====> 100_000_000 / 1_000 = 100_000
    always @(posedge i_clk or posedge i_reset) begin
        if(i_reset)begin
            r_clk <= 0;
            r_counter <= 0;
        end
        else begin
            if(r_counter == 50_000 - 1) begin
                r_counter <= 0;
                r_clk = ~r_clk;
            end
            else begin
                r_counter <= r_counter + 1;
            end
        end

    end
endmodule
