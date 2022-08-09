`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2020 03:21:20 PM
// Design Name: 
// Module Name: Circuit_SA1_tb
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


module Circuit_SA1_tb();
    reg A;
    reg B;
    reg C;
    wire F0;
    wire F1;
    

    Circuit_SA1 tb(.A(A),.B(B),.C(C),.F0(F0),.F1(F1));   
    
    initial begin
    {A,B,C} = 3'b000; 
    end
    
    always #10 {A,B,C} = {A,B,C} + 3'b1;
    

endmodule
