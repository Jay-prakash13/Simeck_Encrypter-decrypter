`timescale 1ns / 1ps

module keygen #(parameter DATAW = 16)
               (input [(DATAW-1):0]key,
                input [(DATAW-1):0]k,
                output [(DATAW-1):0]out,
                input kctr,
                input clk,
                input reset,
                output [(DATAW-1):0]wb,
                output [(DATAW-1):0]w1,
                output [(DATAW-1):0]w2);

wire [(DATAW-1):0] w4,wa;

assign wa = kctr?key:w4;

                        
REG #(.DATAW(DATAW)) 
    rega(.clk(clk),
         .in(wa),
         .out(wb),
         .reset(reset));
         
REG #(.DATAW(DATAW)) 
    regb(.clk(clk),
         .in(wb),
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
         .out(out),
         .reset(reset));
         
ROUND #(.DATAW(DATAW)) 
    rounde(.L(w2),
           .R(out),
           .C(k),
           .out(w4));

endmodule
