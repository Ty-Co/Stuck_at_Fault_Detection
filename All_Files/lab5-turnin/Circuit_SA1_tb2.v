`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2020 08:21:04 PM
// Design Name: 
// Module Name: Circuit_SA1_tb2
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


module Circuit_SA1_tb2();
reg A, A_tb;
reg B, B_tb;
reg C, C_tb;
wire F0;
wire F1;

wire t0;
wire t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12;
reg s1;

Circuit_SA1 tb2(.A(A),.B(B),.C(C),.F0(F0),.F1(F1));   


assign t0 = ((A_tb^B_tb) && C_tb) || (A_tb&&B_tb);
assign t1 = ((s1^B_tb) && C_tb) || (s1&&B_tb);
assign t2 = ((A_tb^s1) && C_tb) || (A_tb&&s1);
assign t3 = ((A_tb^B_tb) && s1) || (A_tb&&B_tb);
assign t4 = ((s1^B_tb) && C_tb) || (A_tb&&B_tb);
assign t5 = ((A_tb^s1) && C_tb) || (A_tb&&B_tb);
assign t6 = ((A_tb^B_tb) && C_tb) || (s1&&B_tb);
assign t7 = ((A_tb^B_tb) && C_tb) || (A_tb&&s1);
assign t8 = ((A_tb^B_tb) && s1) || (A_tb&&B_tb);
assign t9 = ((s1) && C_tb) || (A_tb&&B_tb); // changes the output of F0
assign t10 = ((A_tb^B_tb) && C_tb) || (s1);    
assign t11 = ((s1) && C_tb) || (A_tb&&B_tb); // the input to the second AND GATE is the real stuck-at-zero
assign t12 = (s1) || (A_tb&&B_tb);

initial begin
{A,B,C} = 3'b000; 
{A_tb,B_tb,C_tb} = 3'b000;
s1 = 1'b1;
end

always #10 {A_tb,B_tb,C_tb} = {A_tb,B_tb,C_tb} + 3'b1;
always #10 {A,B,C} = {A,B,C} + 3'b1;


endmodule