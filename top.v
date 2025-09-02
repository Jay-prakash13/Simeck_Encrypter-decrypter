`timescale 1ns / 1ps

module top(input [31:0] enc_data_in,
           input rclk,
           input wclk,
           input rst,
           input w_en,
           output full,
           output [31:0] dec_data_out);
reg [63:0] masterkey = 64'h9c18a4b3d408eeb7;
reg [5:0] counter =63 ;  
reg [31:0] data2; 
reg r_en;
wire empty,incoming; 
wire [31:0] data1;
assign incoming = !empty;
fifo_top #(.DEPTH(16), .DATA_WIDTH(32), .PTR_WIDTH(4)) 
                      fifo (.wclk(wclk), 
                            .wrst_n(rst),
                            .rclk(rclk),
                            .rrst_n(rst),
                            .w_en(w_en),
                            .r_en(r_en),
                            .data_in(enc_data_in),
                            .data_out(data1),
                            .full(full),
                            .empty(empty));
                            
decrypter_top #(.DDATAW(32))
            decrypter(.clk(rclk),
                      .Data(data2),
                      .incoming(incoming),
                      .Key(masterkey),
                      .plaintext(dec_data_out));

always @(posedge rclk) begin
    counter <= counter + 1;
    if (counter == 34) 
    begin
        r_en <= 1;
        data2 <= data1;
        counter <= 0;
    end
    else r_en <= 0;
end       
        
    
endmodule
           

