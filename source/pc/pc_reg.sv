module pc_reg #(
  parameter ADDR_WIDTH = 32,
  parameter DATA_WIDTH = 32,
  parameter IMMO_WIDTH = 32
)(
  input logic clk,
  input logic rst,
  input logic PCsrc,
  input logic [IMMO_WIDTH-1:0] ImmoOp,
  output logic [ADDR_WIDTH-1:0] pc
);

logic [ADDR_WIDTH-1:0] next_pc;

assign next_pc = (PCsrc ? {pc + ImmOp} : {pc + 32'd4});

always_ff @(posedge clk) begin
  if (rst|pc == {8{1'hF}}) pc <= {3'hBFC,ADDR_WIDTH-12{1'b0}}; 
  pc <= next_pc;
end

endmodule
