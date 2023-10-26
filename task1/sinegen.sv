module sinegen #(
    parameter A_WIDTH = 8,
              D_WIDTH = 8
)(
    input logic clk,       
    input logic rst,      
    input logic en,        
    input logic [D_WIDTH-1:0] incr, 
    output logic [D_WIDTH-1:0] dout 
);

    logic [A_WIDTH-1:0] counter_value; 

    counter myCounter (
        .clk(clk),
        .rst(rst),
        .en(en),
        .incr(incr),
        .count(counter_value)
    );

    rom myRom (
        .clk(clk),
        .addr(counter_value),  
        .data_out(dout)
    );

endmodule

