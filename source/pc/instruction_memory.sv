module instruction_memory #(
  parameter WORD_WIDTH = 8,
  parameter ADDR_WIDTH = 12,
  parameter INSTR_WIDTH = 32
)(
  input logic [INSTR_WIDTH-1:0] A,
  output logic [INSTR_WIDTH-1:0] RD
);

logic [WORD_WIDTH-1:0] instr_data [2**ADDR_WIDTH-1:0];

initial begin
  $display("[DUT] Loading instr_data from f1_jump.hex file.");
  $readmemh("program/f1/f1_jump.s.hex", instr_data);
end

always_comb begin
  if (A[1:0] == 2'b00) RD = {instr_data[A[ADDR_WIDTH-1:0]+3], instr_data[A[ADDR_WIDTH-1:0]+2], instr_data[A[ADDR_WIDTH-1:0]+1], instr_data[A[ADDR_WIDTH-1:0]]};
  else RD = {24'b0, instr_data[A[ADDR_WIDTH-1:0]]};
end

endmodule
