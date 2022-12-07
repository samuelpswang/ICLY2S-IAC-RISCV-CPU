module instruction_memory #(
  parameter INSTR_WIDTH = 32,
  parameter ADDR_WIDTH = 32
)(
  input logic [ADDR_WIDTH-1:0] A,
  output logic [INSTR_WIDTH-1:0] RD
);

logic [INSTR_WIDTH-1:0] instr_data [(2**8-1):0];

initial begin
  $display("[DUT] Load instr_data from f1_branch.mem file.");
  $readmemh("../program/f1/f1_branch.mem", instr_data);
end

assign RD = instr_data[A[9:2]];

endmodule
