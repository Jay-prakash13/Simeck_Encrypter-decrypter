/*`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.10.2024 15:27:10
// Design Name: 
// Module Name: Round
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


module ROUND #(parameter DATAW=10)(R1,R2,C,out);
input [(DATAW-1):0]R1,R2,C;
output [(DATAW-1):0]out;
wire [(DATAW-1):0]w1,w2,w3,w4,w5;

LSHIFT #(10,5) shift5(R1,w1);
LSHIFT #(10,1) shift1(R1,w2);
AND #(10) and1(R1,w1,w3);
XOR #(10) xor1(w3,R2,w4);
XOR #(10) xor2(w2,w4,w5);
XOR #(10) xor3(w5,C,out);
endmodule
*/

`timescale 1ns / 1ps

module ROUND #(parameter DATAW=10)
              (input [(DATAW-1):0]L,
               input [(DATAW-1):0]R,
               input [(DATAW-1):0]C,
               output [(DATAW-1):0]out);
               
wire [(DATAW-1):0]w1,w2,w3,w4,w5;

LSHIFT #(.DATAW(DATAW),
         .SHIFT(5)) 
  shift5(.in(L),
         .out(w1));
 
LSHIFT #(.DATAW(DATAW),
         .SHIFT(1)) 
  shift1(.in(L),
         .out(w2));

assign w3 = L & w1;
assign w4 = R ^ w3;
assign w5 = w2 ^ w4;
assign out = C ^ w5;


endmodule
