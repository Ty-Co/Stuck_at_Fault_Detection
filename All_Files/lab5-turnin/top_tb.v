`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2020 05:20:15 PM
// Design Name: 
// Module Name: top_tb
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


module top_tb();
    reg A,B,C,clk,rst;
    wire[2:0] RGB;
    
    top top(.A(A),.B(B),.C(C),.clk(clk),.rst(rst),.RGB(RGB));
    always #5 clk = ~clk;
    initial begin
            clk = 0;
            rst = 1;
            {A,B,C} = 3'b000;
            #50;
            rst = 0;
            {A,B,C} = 3'b001;
            #10;
            {A,B,C} = 3'b010;
            #10;
            {A,B,C} = 3'b011;
            #10;
            {A,B,C} = 3'b100;
            #10;
            {A,B,C} = 3'b101;
            #10;
            {A,B,C} = 3'b110;
            #10;
            {A,B,C} = 3'b111;
            #10;
        end
endmodule
