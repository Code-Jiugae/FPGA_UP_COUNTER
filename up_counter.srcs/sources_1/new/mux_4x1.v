`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/11 15:31:08
// Design Name: 
// Module Name: mux_4x1
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


module mux_4x1(
        input [3:0] i_1000, i_100, i_10, i_1,
        input [1:0] i_counter,
        
        output[3:0] o_value
    );

    reg [3:0] r_value;
    assign o_value = r_value;

    always @(*) begin
            case (i_counter)
                2'h0 : r_value = i_1;
                2'h1 : r_value = i_10;
                2'h2 : r_value = i_100;
                2'h3 : r_value = i_1000;
            endcase
        end


endmodule
