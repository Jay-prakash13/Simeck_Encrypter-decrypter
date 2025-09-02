`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.10.2024 20:30:45
// Design Name: 
// Module Name: reg1b
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


module reg1b (clk,in,out,reset,set);
input clk,reset,set;
input in;
output reg out;

always @(posedge clk)
begin
    if (reset)
    begin
         out <= 0;
    end
    else if (set)
    begin
         out <= 1;
    end
    else 
    begin
        out <= in;
    end
end

endmodule