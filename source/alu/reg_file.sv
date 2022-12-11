module reg_file #(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 5
) (
  input logic clk,
  input logic [ADDR_WIDTH-1:0] AD1,
  input logic [ADDR_WIDTH-1:0] AD2,
  input logic [ADDR_WIDTH-1:0] AD3,
  input logic WE3,
  input logic [DATA_WIDTH-1:0] WD3,
  output logic [DATA_WIDTH-1:0] RD1,
  output logic [DATA_WIDTH-1:0] RD2,
  output logic [DATA_WIDTH-1:0] a0
);

logic [DATA_WIDTH-1:0] reg_data [2**ADDR_WIDTH-1:0]; 

always_comb begin
  RD1 = reg_data[AD1];
  RD2 = reg_data[AD2];
  a0 = reg_data[10];
end

always_ff @ (posedge clk)
  if (WE3 && AD3 != 5'd0) reg_data[AD3] <= WD3; 
  else reg_data[AD3] <= 32'b0;

endmodule
