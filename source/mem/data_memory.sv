module data_memory (
  input logic clk,
  input logic [31:0] A,
  input logic WE,
  input logic [31:0] WD,
  output logic [31:0] RD
);

logic [11:0] AD;
logic [31:0] mem_data [2**12 - 1:0]; 

always_comb
    AD = A[11:0];

always_comb
    RD = mem_data[AD];
  
always_ff @ (posedge clk)
  if (WE) mem_data[AD] <= WD; 

endmodule
