module extend(
  input logic [31:7] Instr,
  input logic [1:0] ImmSrc,
  output logic [31:0] ImmExt
);

// 00: Sign Extend I-type
// 01: Sign Extend B-type
// 10: Sign Extend S-type
// 11: Output 0
always_comb begin
  if (ImmSrc == 2'b00) ImmExt = {{20{Instr[31]}}, Instr[31:20]};
  else if (ImmSrc == 2'b01) ImmExt = {{19{Instr[31]}}, Instr[31], Instr[7], Instr[30:25], Instr[11:8], 1'b0};
  else if (ImmSrc == 2'b10) ImmExt = {{20{Instr[31]}}, Instr[31:25], Instr[11:7]};
  else ImmExt = 32'd0;
end
  
endmodule
