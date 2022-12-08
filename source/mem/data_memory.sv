module dataory #(
  parameter WORD_WIDTH = 8,
  parameter ADDR_WIDTH = 17,
  parameter DATA_WIDTH = 32
)(
  input logic clk,
  input logic [DATA_WIDTH-1:0] A,
  input logic WE,
  input logic [DATA_WIDTH-1:0] WD,
  output logic [DATA_WIDTH-1:0] RD
);

logic [WORD_WIDTH-1:0] data [2**ADDR_WIDTH-1:0];

always_comb begin
  if (A[2:0] == 2'b00) RD = {data[A[ADDR_WIDTH-1:0]+3], data[A[ADDR_WIDTH-1:0]+2], data[A[ADDR_WIDTH-1:0]+1], data[A[ADDR_WIDTH-1:0]]};
  else if (A[2:0] == 2'b10) RD = {data[A[ADDR_WIDTH-1:0]+1], data[A[ADDR_WIDTH-1:0]]};
  else RD = {24'b0, data[A[ADDR_WIDTH-1:0]]};
end

always_ff @ (posedge clk) begin
  if (WE) begin
      if (A[2:0] == 2'b00) begin
        data[A[ADDR_WIDTH-1:0]+3] <= WD[WORD_WIDTH*4-1:WORD_WIDTH*3];
        data[A[ADDR_WIDTH-1:0]+2] <= WD[WORD_WIDTH*3-1:WORD_WIDTH*2];
        data[A[ADDR_WIDTH-1:0]+1] <= WD[WORD_WIDTH*2-1:WORD_WIDTH];
        data[A[ADDR_WIDTH-1:0]] <= WD[WORD_WIDTH-1:0];
      end
      else if (A[2:0] == 2'b10) begin
        data[A[ADDR_WIDTH-1:0]+1] <= WD[WORD_WIDTH*2-1:WORD_WIDTH];
        data[A[ADDR_WIDTH-1:0]] <= WD[WORD_WIDTH-1:0];
      end
      else begin
        data[A[ADDR_WIDTH-1:0]] <= WD[WORD_WIDTH-1:0];
      end
  end
end

endmodule
