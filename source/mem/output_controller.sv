module output_controller(
  input logic MemWrite,
  input logic RegWrite,
  input logic [2:0] RegSrc,
  input logic B,
  input logic [31:0] RDin,
  output logic [31:0] RDout
);

always_comb begin
  if (MemWrite == 1'b1 && RegWrite == 1'b1 && RegSrc == 2'b01 && B == 1'b1) RDout = {24'b0, RDin[7:0]};
  else RDout = RDin;
end
  
endmodule
