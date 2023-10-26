module rom #(
    parameter ADDRESS_WIDTH = 8,
              DATA_WIDTH = 8
) (
    input logic clk,
    input logic [ADDRESS_WIDTH-1:0] addr1,
    input logic [ADDRESS_WIDTH-1:0] addr2, 
    output logic [DATA_WIDTH-1:0] dout1,
    output logic [DATA_WIDTH-1:0] dout2
);

    // Define the ROM content using the .mem file
    logic [DATA_WIDTH-1:0] sine_wave_rom [2**ADDRESS_WIDTH-1:0];

    initial begin
        // Read the .mem file to initialize the ROM
        $readmemh("sinerom.mem", sine_wave_rom);
    end

    // Output the ROM value based on the given address
    always_ff @(posedge clk) begin
        dout1 <= sine_wave_rom[addr1];
        dout2 <= sine_wave_rom[addr2];
    end

endmodule

