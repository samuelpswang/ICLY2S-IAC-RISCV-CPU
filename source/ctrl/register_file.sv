module register_file (
  input logic clk,
  input logic [4:0] A1,
  input logic [4:0] A2,
  input logic [4:0] A3,
  input logic WE3,
  input logic [31:0] WD3,
  output logic [31:0] RD1,
  output logic [31:0] RD2,
  output logic [31:0] a0
);

logic [31:0] reg_data [31:0];

always_comb begin
  RD1 = reg_data[A1];
  RD2 = reg_data[A2];
  a0 = reg_data[10];
end

always_ff @(posedge clk)
  if (WE3) begin
    if (A3 == 5'b0) reg_data[A3] <= 32'b0; 
    else reg_data[A3] <= WD3; 
  end

endmodule
