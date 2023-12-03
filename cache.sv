module cache #(
    parameter SET_WIDTH = 3,  // Index width set to 3 bits
    parameter OFFSET_WIDTH = 2,  // Block offset width set to 2 bits
    parameter TAG_WIDTH = 27,    // Tag width set to 27 bits
    parameter DATA_WIDTH = 32,   // Data width set to 32 bits
    parameter CACHE_LINES = 8   // Number of cache lines set to 8

)(
    input logic clk,
    input logic [DATA_WIDTH-1:0] data_in,    
    input logic [DATA_WIDTH-1:0] address_in,  
    input logic we,                  

    output logic [DATA_WIDTH-1:0] data_out,   
    output logic cache_hit                     
);

    // Cache storage definitions
    logic valid [CACHE_LINES-1:0];                    // Array of valid bits
    logic [TAG_WIDTH-1:0] tags [CACHE_LINES-1:0];     // Array of tag storage
    logic [DATA_WIDTH-1:0] cache_data [CACHE_LINES-1:0]; // Array of data storage

    // Decomposing input address
    logic [SET_WIDTH-1:0] set;
    logic [TAG_WIDTH-1:0] tag;

    // Extracting tag and index from input address
    assign tag = address_in[DATA_WIDTH-1:DATA_WIDTH-TAG_WIDTH];
    assign set = address_in[DATA_WIDTH-TAG_WIDTH-1:OFFSET_WIDTH];

    assign cache_hit = valid[set] && (tags[set] == tag); // Checking for cache hit

    always_comb begin
        data_out = cache_hit ? cache_data[set] : 32'b0;
    end

    always_ff @(posedge clk) begin
        if (we) begin
            cache_data[set] <= data_in;
            tags[set] <= tag;
            valid[set] <= 1'b1; 
        end
    end

endmodule

