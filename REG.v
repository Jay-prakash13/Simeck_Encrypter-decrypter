/*`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.10.2024 08:01:00
// Design Name: 
// Module Name: REG
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


module REG #(parameter DATAW=10)(clk,in,out,reset);
input clk,reset;
input [DATAW-1:0]in;
output [DATAW-1:0]out;
reg [DATAW-1:0]out;

always @(posedge clk)
if (reset)
out = 0;

else
out = in;

endmodule*/

`timescale 1ns / 1ps

module REG #(parameter DATAW=10)
            (input clk,
             input reset,
             input [DATAW-1:0]in,
             output reg [DATAW-1:0]out);

always @(posedge clk)
begin
    if (reset)
    begin
        out <= 0;
    end
    else
    begin
        out <= in;
    end
end

endmodule

