module data_memory #(
  parameter WORD_WIDTH = 8,
  parameter ADDR_WIDTH = 17,
  parameter DATA_WIDTH = 32
)(
  input logic clk,
  input logic [DATA_WIDTH-1:0] A,
  input logic B,
  input logic WE,
  input logic [DATA_WIDTH-1:0] WD,
  output logic [DATA_WIDTH-1:0] RD
);

logic [WORD_WIDTH-1:0] data [2**ADDR_WIDTH-1:0];

initial begin
  $display("[DUT] Loading data from sine.mem file.");
  $readmemh("program/ref/sine.mem", data, 0x10000);
end

assign RD = {data[A[ADDR_WIDTH-1:0]+3], data[A[ADDR_WIDTH-1:0]+2], data[A[ADDR_WIDTH-1:0]+1], data[A[ADDR_WIDTH-1:0]]};

always_ff @ (posedge clk) begin
  if (WE) begin
    if (B) begin
      data[A[ADDR_WIDTH-1:0]] = WD[7:0];
    end
    else begin
        data[A[ADDR_WIDTH-1:0]+3] <= WD[WORD_WIDTH*4-1:WORD_WIDTH*3];
        data[A[ADDR_WIDTH-1:0]+2] <= WD[WORD_WIDTH*3-1:WORD_WIDTH*2];
        data[A[ADDR_WIDTH-1:0]+1] <= WD[WORD_WIDTH*2-1:WORD_WIDTH];
        data[A[ADDR_WIDTH-1:0]] <= WD[WORD_WIDTH-1:0];
    end
  end
end

endmodule
