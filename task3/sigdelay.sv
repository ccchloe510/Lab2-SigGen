module sigdelay (
    input logic clk,       
    input logic rst,      
    input logic wr,        
    input logic rd,        
    input logic [7:0] mic_signal,
    input logic [8:0] offset, 
    output logic [7:0] delayed_signal
);

    logic [8:0] wr_addr; 
    logic [8:0] rd_addr;

    counter myCounter (
        .clk(clk),
        .rst(rst),
        .en(1'b1),         
        .incr(1'b1),       
        .count(wr_addr)
    );

    ram2ports #(
        .ADDRESS_WIDTH(9), 
        .DATA_WIDTH(8)
    ) myRam (
        .clk(clk),
        .wr_en(wr),
        .rd_en(rd),
        .wr_addr(wr_addr),
        .rd_addr(wr_addr + offset),
        .din(mic_signal),
        .dout(delayed_signal)
    );

endmodule
