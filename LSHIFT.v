`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.10.2024 07:49:03
// Design Name: 
// Module Name: LSHIFT
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



module LSHIFT#(parameter DATAW=10, SHIFT = 5)
              (input [DATAW-1:0]in,
               output [DATAW-1:0]out);


assign out[(DATAW-1):SHIFT] = in[(DATAW-SHIFT-1):0];
assign out[(SHIFT-1):0]= in[(DATAW-1):(DATAW-SHIFT)];
endmodule
