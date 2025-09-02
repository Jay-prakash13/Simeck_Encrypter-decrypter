`timescale 1ns / 1ps

module encrypt_top_tb();

reg clk;
reg [63:0] Key;
reg [31:0] Data;
wire [31:0]ciphertext;


top #(.DDATAW(32))
        main(.clk(clk),
             .Key(Key),
             .Data(Data),
             .ciphertext(ciphertext));
         
initial begin
    clk=0;Data = 32'b10000000010010100000110001011001; Key = 64'h73bce979d5123456 ;
    #350
    Data = 32'b00001000011001000000101011101010;
    #350
    Data = 32'b10000000010010100000110001011001;
     #350
    Data = 32'b10000000011011000001110110101011;
     #350
    Data = 32'b00010000101001100001001001110100;
     #350
    Data = 32'b01000000010001100000111111110100;
     #350
    Data = 32'h11111111;
     #350
    Data = 32'h11111111;
    #6000
    $finish;
end

always begin
    #5
    clk = ~clk;
end
endmodule
