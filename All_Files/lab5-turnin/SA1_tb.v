`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2020 06:15:44 PM
// Design Name: 
// Module Name: SA1_tb
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


module SA1_tb();
    reg A,B,C;
    wire F0,F1;
    
    Circuit_SA1 SA1(.A(A),.B(B),.C(C),.F0(F0),.F1(F1));
    
    initial begin
        {A,B,C} = 3'b000;
        #10;
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













