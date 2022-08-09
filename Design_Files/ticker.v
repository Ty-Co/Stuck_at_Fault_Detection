`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2020 06:06:44 PM
// Design Name: 
// Module Name: ticker
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


module ticker(clk,rst,fault,RGB);
    input clk,rst;
    input  fault;//feed to PED and allow shift
    output reg [2:0] RGB;
    
    reg [2:0] nRGB;
    reg [25:0] Q;
    reg  P1,P2;//used for PED
    reg rstCount;
    wire tick;
    wire [25:0] D;
    
    assign D        = (tick|rstCount) ? 26'b0 : (Q + 26'b1); //26 bit 2 to 1 mux
    assign tick     = (Q == 26'd49_999_999);//0.5 seconds
   // assign rstCount = P1&!P2;//fault detected, send pulse to initialize RGB and Q
    always@*
        begin
            if(rstCount)   nRGB = 3'b001; else
            if(tick&fault) nRGB = {RGB[1:0],RGB[2]}; else
            if(fault)      nRGB = RGB;
            else           nRGB = 3'b000;
        end
    always@(posedge clk,posedge rst)
        begin
            if(rst) begin
                    Q   <= 26'b0; 
                    RGB <= 3'b000;
                    end
            else begin
                    Q <= D;
                    RGB <= nRGB;
                 end
        
            rstCount = P1&!P2;
            
            if(rst) {P1,P2} <= 2'b0; //Posedge Detect
            else    {P1,P2} <= {fault,P1};
        end
    /*
    assign load = (P1 & !P2)|tick;//count reset
    assign tick = (Q == 26'd49_999_999);
    assign stop = (RGB == 3'b100);
    assign shift = tick&fault;
    assign D = tick ? 26'b0 : (Q + 26'b1);
    always@(posedge clk,posedge rst)
        begin
            if(rst|load)  Q <= 26'b0; 
            if(shift) RGB <= {RGB[1:0],RGB[2]};
            
            if(rst) {P1,P2} <= 2'b0; //Posedge Detect
            else    {P1,P2} <= {fault,P1};
        end
*/
endmodule

















