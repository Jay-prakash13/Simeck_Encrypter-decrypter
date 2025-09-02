`timescale 1ns / 1ps
//module LFSR (input clk,
//             input reset,
//             input set,
//             output out1,
//             output out2);
          
//wire w1;
             
//shiftreg feedreg(.clk(clk),
//                 .set(set),
//                 .reset(reset),
//                 .si(w1),
//                 .s5(out1),
//                 .s2(out2));

//XOR #(.DATAW(1))
//       regxor(.in1 (out1),
//              .in2 (out2),
//              .out(w1));


        
//endmodule

module LFSR(input clk,
            input reset,
            input set,
            output out);
            
wire r1,r2,r3,r4,r5;

//reg [4:0] tmp;
//always @(posedge clk or  reset or  set )
//begin
//if (reset)
//begin 
//    tmp <= 5'b00000;
//end
//else if (set)
//begin
//    tmp <= 5'b11111;
//end
//else begin
//    tmp <= tmp << 1;
//    tmp[0] <= tmp[4]^tmp[1];
//end
//out <= tmp[4];
//end
//endmodule


////whenever instantiating try to use "." type calling as it helps to understand which wire is connecting to which input.
reg1b reg1(.clk(clk),
           .in(r1),
           .out(r2),
           .reset(reset),
           .set(set));   
           
reg1b reg2(.clk(clk),
           .in(r2),
           .out(r3),
           .reset(reset),
           .set(set));
           
reg1b reg3(.clk(clk),
           .in(r3),
           .out(r4),
           .reset(reset),
           .set(set));
           
reg1b reg4(.clk(clk),
           .in(r4),
           .out(r5),
           .reset(reset),
           .set(set));
           
reg1b reg5(.clk(clk),
           .in(r5),
           .out(out),
           .reset(reset),
           .set(set));
           
//XOR #(.DATAW(1)) 
//    xorl1(.in1(r3),
//          .in2(out),
//          .out(r1));
assign r1 = (r3) ^ (out);
          
endmodule
