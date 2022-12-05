module alu (
  input logic ALUsrc,
  input logic [3:0] ALUctrl,
  input logic [31:0] ImmOp,
  input logic [31:0] ALUop1,
  input logic [31:0] regOp2,
  output logic EQ,
  output logic [31:0] SUM // note: 31:1 -> 31:0
);

// note: use correct indentation
logic [31:0] ALUop2;

assign ALUop2 = ALUsrc? ImmOp:regOp2;
  
    
// note: unify number format

always_comb begin
    case (ALUctrl)
    4'b0000: SUM = ALUop1+ALUop2;
    4'b0001: SUM = ALUop1 - ALUop2;
    4'b0010: SUM = ALUop1 & ALUop2;
    4'b0011: SUM = ALUop1 | ALUop2;
    4'b0100: SUM = ALUop1^ALUop2;
    4'b0101: SUM = {{31{1'b0}},(ALUop1<ALUop2)};
    4'b0110: SUM = ALUop1 << ALUop2[4:0];
    4'b0111: SUM = ALUop1 >> ALUop2[4:0];
    4'b1000: SUM = ALUop1 >>> ALUop2[4:0];
    
    default: begin
      SUM = 32'b0;
    end
  endcase
  assign EQ = (ALUop1 == ALUop2);
end


endmodule
