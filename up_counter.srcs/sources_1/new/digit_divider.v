`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/11 15:31:31
// Design Name: 
// Module Name: digit_divider
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


module digit_divider(
        input [13:0] i_value,
        output [3:0] o_1000, o_100, o_10, o_1
    );

    assign o_1 = i_value % 10;
    assign o_10 = i_value / 10 % 10;
    assign o_100 = i_value / 100 % 10;
    assign o_1000 = i_value / 1000 % 10;

   
endmodule
