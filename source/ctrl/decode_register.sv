module decode_register(
  // clock signal
  input logic clk,
  // decode state
  input logic RegWriteD,
  input logic [1:0] ResultSrcD,
  input logic MemWriteD,
  input logic JumpD,
  input logic BranchD,
  input logic [3:0] ALUControlD,
  input logic ALUSrcD,
  input logic [31:0] RD1D,
  input logic [31:0] RD2D,
  input logic [31:0] PCD,
  input logic [31:0] ImmExtD,
  input logic [31:0] PCPlus4D,
  input logic [4:0] RdD,
  // execution stage
  output logic RegWriteE,
  output logic [1:0] ResultSrcE,
  output logic MemWriteE,
  output logic JumpE,
  output logic BranchE,
  output logic [3:0] ALUControlE,
  output logic ALUSrcE,
  output logic [31:0] RD1E,
  output logic [31:0] RD2E,
  output logic [31:0] PCE,
  output logic [4:0] RdE,
  output logic [31:0] ImmExtE,
  output logic [31:0] PCPlus4E
);

always_ff @ (negedge clk) begin
  PCPlus4E <= PCPlus4D;
  RegWriteE <= RegWriteD;
  ResultSrcE <= ResultSrcD;
  MemWriteE <= MemWriteD;
  JumpE <= JumpD;
  BranchE <= BranchD;
  ALUControlE <= ALUControlD;
  ALUSrcE <= ALUSrcD;
  RD1E <= RD1D;
  RD2E <= RD2D;
  PCE <= PCD;
  RdE <= RdD;
  ImmExtE <= ImmExtD;
  PCPlus4E <= PCPlus4D;
end
  
endmodule
