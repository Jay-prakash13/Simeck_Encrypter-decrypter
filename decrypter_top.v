`timescale 1ns / 1ps

module decrypter_top #(parameter DDATAW=20)
           (input clk,
           input [DDATAW-1:0] Data,
           input [2*DDATAW-1:0] Key,
           input incoming,
           output [(DDATAW-1): 0]plaintext);
wire kctr,dctr,save,set,lfsrset;
wire [(DDATAW/2-1): 0]distkey,distdata;
reg income;
always @(posedge clk) begin
    if(incoming)begin
        income <= 1;
    end
    else begin
        income <= 0;
    end
end
        
FSM2 #(.DATAW(DDATAW/2))
    fsmdec(.clk(clk),
           .income(income),
           .dctr(dctr),
           .kctr(kctr),
           .save(save),
           .set(set),
           .lfsrset(lfsrset),
           .Data(Data),
           .Key(Key),
           .dataout(distdata),
           .keyout(distkey));

decrypter #(DDATAW/2)
        dec(.clk(clk),
            .reset(set),
            .dctr(dctr),
            .kctr(kctr),
            .lfsrset(lfsrset),
            .plaindata(plaintext),
            .cipherdata(distdata),
            .key(distkey),
            .save(save));
endmodule
