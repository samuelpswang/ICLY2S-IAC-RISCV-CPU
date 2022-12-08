module alu (
  input logic ALUsrc,
  input logic [3:0] ALUctrl,
  input logic [31:0] ImmOp,
  input logic [31:0] ALUop1,
  input logic [31:0] regOp2,
  output logic EQ,
  output logic [31:0] SUM 
);


logic [31:0] ALUop2;
logic [31:0] JALR_INTERMEDIATE;
assign ALUop2 = ALUsrc? ImmOp:regOp2;
assign JALR_INTERMEDIATE = ALUop1 + ALUop2;


always_comb begin
    case (ALUctrl)
    // add 
    4'b0000: SUM = ALUop1 + ALUop2;
    // sub
    4'b0001: SUM = ALUop1 - ALUop2;
    // and 
    4'b0010: SUM = ALUop1 & ALUop2;
    // or 
    4'b0011: SUM = ALUop1 | ALUop2;
    // xor 
    4'b0100: SUM = ALUop1^ALUop2;
    // slt 
    4'b0101: SUM = {{31{1'b0}} , (signed'(ALUop1)<signed'(ALUop2))};
    // sll 
    4'b0110: SUM = ALUop1 << ALUop2[4:0];
    // srl
    4'b0111: SUM = ALUop1 >> ALUop2[4:0];
    // sra 
    4'b1000: SUM = ALUop1 >>> ALUop2[4:0];
    // jalr
    4'b1001: SUM = {JALR_INTERMEDIATE[31:1],1'b0};
    
    default: begin
      SUM = 32'b0;
    end
  endcase
  assign EQ = (ALUop1 == ALUop2);
end


endmodule
