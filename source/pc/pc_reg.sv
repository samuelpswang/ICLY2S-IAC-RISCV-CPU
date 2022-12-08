module pc_reg #(
  parameter ADDR_WIDTH = 32,
  parameter IMMO_WIDTH = 32
)(
  input logic clk,
  input logic rst,
  input logic PCsrc,
  input logic [IMMO_WIDTH-1:0] label,
  output logic [ADDR_WIDTH-1:0] pc
);

logic [ADDR_WIDTH-1:0] next_pc;

assign next_pc = (PCsrc ? pc + label : pc + 32'd4);

always_ff @(posedge clk) begin
  if (rst||pc == {8{4'hF}}) pc <= {32'hBFC00000}; 
  else pc <= next_pc;
end

endmodule
