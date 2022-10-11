`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/11 15:30:48
// Design Name: 
// Module Name: decoder_2x4
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


module decoder_2x4(
    input [1:0] i_digitSelect,
    input i_en,
    output [3:0] o_digit
    );

    reg [3:0] r_digit;
    assign o_digit = r_digit;

    always @(i_digitSelect or i_en) begin
        if(i_en) begin
            r_digit = 4'b1111;
        end
        else begin
            case (i_digitSelect)
                2'h0 : r_digit = 4'b1110;
                2'h1 : r_digit = 4'b1101;
                2'h2 : r_digit = 4'b1011;
                2'h3 : r_digit = 4'b0111;
            endcase
        end
        
    end


endmodule
