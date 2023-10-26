module sinegen (
    input logic clk,       
    input logic rst,      
    input logic en,        
    input logic [7:0] offset, 
    output logic [7:0] data1,
    output logic [7:0] data2 
);


    counter myCounter (
        .clk(clk),
        .rst(rst),
        .en(en),
        .incr(1),
        .count(addr1)
    );

    rom myRom (
        .clk(clk),
        .addr1(addr1), 
        .addr2(addr1+offset),
        .dout1(data1),
        .dout2(data2)
    );

endmodule

