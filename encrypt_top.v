`timescale 1ns / 1ps

module encrypt_top #(parameter DDATAW=20)
           (input clk,
           input [DDATAW-1:0] Data,
           input [2*DDATAW-1:0] Key,
           output [(DDATAW-1): 0]ciphertext);
reg income;
wire nc;
wire randbit;
wire kctr;
wire dctr;
wire save;
wire set;
wire [(DDATAW/2-1): 0] distkey;
wire [(DDATAW/2-1): 0] key1;
wire [(DDATAW/2-1): 0] key2;
wire [(DDATAW/2-1): 0] key3;
wire [(DDATAW/2-1): 0] cipherkey;
wire [(DDATAW/2-1): 0] distdata;
wire [(DDATAW/2-1): 0] data1;
wire [(DDATAW/2-1): 0] data2;
wire lfsrset;

always @(posedge clk) begin
    if(Data)begin
        income <= 1;
    end
    else begin
        income <= 0;
    end
end
        
           
FSM2 #(.DATAW(DDATAW/2))
    fsmenc(.clk(clk),
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

encryptor #(DDATAW/2)
        enc(.shiftregReset(nc),
            .clk(clk),
            .reset(set),
            .dctr(dctr),
            .kctr(kctr),
            .lfsrset(lfsrset),
            .ciphertext(ciphertext),
            .data(distdata),
            .key(distkey),
            .keyout(cipherkey),
            .data1(data1),
            .data2(data2),
            .key1(key1),
            .key2(key2),
            .key3(key3),
            .w3(randbit),
            .save(save));
endmodule
