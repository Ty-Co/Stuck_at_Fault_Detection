`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2020 11:30:42 PM
// Design Name: 
// Module Name: ticker_tb
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


module ticker_tb();
    reg clk,rst, fault;
    wire [2:0] RGB;
    
    always#5 clk = ~clk;
    
    initial begin
    rst = 1;
    clk = 0;
    fault = 0;
    #50;
    rst = 0;
    #100;
    fault = 1;
    end
ticker t(.clk(clk),.rst(rst),.fault(fault),.RGB(RGB));
endmodule
