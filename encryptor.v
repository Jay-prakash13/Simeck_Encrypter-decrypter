`timescale 1ns / 1ps

module encryptor #(parameter DATAW = 16)
                  (input clk,
                   input [DATAW-1:0] data,
                   input [DATAW-1:0] key,
                   input reset,
                   input dctr,
                   input kctr,
                   input save,
                   input lfsrset,
                   input shiftregReset,
                   output [DATAW-1:0] data2,
                   output [DATAW-1:0] data1,
                   output  w3,
                   output [DATAW-1:0] w2,
                   output [DATAW-1:0] keyout,
                   output [(DATAW-1):0]key1,
                   output [(DATAW-1):0]key2,
                   output [(DATAW-1):0]key3,
                   output reg [(2*DATAW-1):0]ciphertext);
           
//wire [DATAW-1:0] w1,w2;
//wire w3;
parameter num = 2**(DATAW)-4;
wire [(DATAW-1):0]data1,data2;
assign w2 = num ^ w3;

always  @(posedge save)
begin
     ciphertext[DATAW-1:0] <= data1;
     ciphertext[(2*DATAW-1):DATAW] <= data2;
end

encrypt #(.DATAW(DATAW))
       enc1(.data(data),
            .C(keyout),
            .dctr(dctr),
            .clk(clk),
            .reset(reset),
            .out(data2),
            .data1(data1));
           
keygen #(.DATAW(DATAW))
    enckey(.key(key),
           .k(w2),
           .kctr(kctr),
           .clk(clk),
           .reset(reset),
           .out(keyout),
           .wb(key1),
           .w1(key2),
           .w2(key3));
        
 LFSR enclfsr(.set(lfsrset),
              .reset(shiftregReset),
              .clk(clk),
              .out(w3));
 
endmodule
