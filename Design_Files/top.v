`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2020 05:16:13 PM
// Design Name: 
// Module Name: top
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


module top(
    input A,
    input B,
    input C,
    input clk,
    input rst,
    output[2:0] RGB
    );
    wire gateOne,gateTwo,gateThree,gateFour,gateFive,fault0,fault1;
    wire F0;//should be the same as gateTwo
    wire F1;//should be the same as gateFive
//    assign gateOne = A^B;
//    assign gateTwo = (A^B)^C;  
//    assign gateThree = (A^B)&C;
//    assign gateFour = A&B;
//    assign gateFive = gateThree + gateFour;
    assign fault0 = ((A^B)^C)^F0; //fault detected on F0
    assign fault1 = (((A^B) && C) || (A&&B))^F1;//fault detected on F1
    assign fault = fault0 || fault1;
    
    Circuit_SA1 SA1(.A(A),.B(B),.C(C),.F0(F0),.F1(F1));
    ticker tick(.fault(fault),.clk(clk),.rst(rst),.RGB(RGB));
    
    
    
endmodule
