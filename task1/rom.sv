module rom #(
    parameter ADDRESS_WIDTH = 8,
              DATA_WIDTH = 8
) (
    input logic clk,
    input logic [ADDRESS_WIDTH-1:0] addr, 
    output logic [DATA_WIDTH-1:0] data_out
);

    // Define the ROM content using the .mem file
    logic [DATA_WIDTH-1:0] sine_wave_rom [2**ADDRESS_WIDTH-1:0];

    initial begin
        // Read the .mem file to initialize the ROM
        $readmemh("sinerom.mem", sine_wave_rom);
    end;

    // Output the ROM value based on the given address
    always_ff @(posedge clk) begin
        data_out <= sine_wave_rom[addr];
    end

endmodule

