module instruction_memory_pip #(
    parameter INSTR_WIDTH = 32,
    parameter ADDR_WIDTH = 32
)(
    input logic clk,
    input logic [ADDR_WIDTH-1:0] PCF,
    input logic [INSTR_WIDTH-1:0] INSTRF,
    output logic [ADDR_WIDTH-1:0] PCD,
    output logic [INSTR_WIDTH-1:0] INSTRD,
    output logic [ADDR_WIDTH-1:0] PCPLUS4D
);

always_ff @(posedge clk) begin
    INSTRD <= INSTRF;
    PCD <= PCF;
    PCPLUS4D <= PCF + 32'd4;
end
endmodule
