`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.11.2024 23:05:47
// Design Name: 
// Module Name: keydegen
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


`timescale 1ns / 1ps

module keydegen #(parameter DATAW = 10)
               (input [(DATAW-1):0]key,
                input [(DATAW-1):0]k,
                output [(DATAW-1):0]out,
                input kctr,
                input clk,
                input reset
                );

wire [(DATAW-1):0] w1,w2,w3,w4,w5,w6;

assign w5 = kctr?key:w4;

                        
REG #(.DATAW(DATAW)) 
    rega(.clk(clk),
         .in(w5),
         .out(out),
         .reset(reset));
         
REG #(.DATAW(DATAW)) 
    regb(.clk(clk),
         .in(out),
         .out(w1),
         .reset(reset));
         
REG #(.DATAW(DATAW)) 
    regr(.clk(clk),
         .in(w1),
         .out(w2),
         .reset(reset));

REG #(.DATAW(DATAW)) 
    reg1(.clk(clk),
         .in(w2),
         .out(w3),
         .reset(reset));
         
ROUND #(.DATAW(DATAW)) 
    rounde(.L(out),
           .R(w3),
           .C(k),
           .out(w4));

endmodule