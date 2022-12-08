module control_top(
  input logic clk,
  input logic [31:0] Instr,
  input logic [31:0] Result,
  // output logic RegWrite: only for pipelining
  output logic [1:0] ResultSrc,
  output logic MemWrite,
  output logic Jump,
  output logic Branch,
  output logic [3:0] ALUControl,
  output logic ALUSrc,
  output logic [31:0] RD1,
  output logic [31:0] RD2,
  // output logic [5:0] Rd: only for pipelining
  output logic [31:0] ImmExt,
  output logic [31:0] a0
);

// Inner Wires
logic [1:0] ImmSrc;

// Inner Wires: only for no pipelining
logic RegWrite;
logic [4:0] Rd;
assign Rd = Instr[11:7];

control_unit cu(
  .op(Instr[6:0]),
  .funct3(Instr[14:12]),
  .funct7(Instr[31:25]),
  .RegWrite(RegWrite),
  .ResultSrc(ResultSrc),
  .MemWrite(MemWrite),
  .Jump(Jump),
  .Branch(Branch),
  .ALUControl(ALUControl),
  .ALUSrc(ALUSrc),
  .ImmSrc(ImmSrc)
);

register_file rf(
  .clk(clk),
  .A1(Instr[19:15]),
  .A2(Instr[24:20]),
  .A3(Rd),
  .WE3(RegWrite),
  .WD3(Result),
  .RD1(RD1),
  .RD2(RD2),
  .a0(a0)
);

extend ex(
  .Instr(Instr[31:7]),
  .ImmSrc(ImmSrc),
  .ImmExt(ImmExt)
);

endmodule
