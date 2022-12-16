module data_memory_cached #(
  parameter WORD_WIDTH = 8,
  parameter ADDR_WIDTH = 17,
  parameter DATA_WIDTH = 32
)(
  input logic clk,
  input logic [DATA_WIDTH-1:0] A,
  input logic B,
  input logic WE,
  input logic [DATA_WIDTH-1:0] WD,
  output logic [DATA_WIDTH-1:0] RD0, // Data for cache write, block offset 00
  output logic [DATA_WIDTH-1:0] RD1, // Data for cache write, block offset 01
  output logic [DATA_WIDTH-1:0] RD2, // Data for cache write, block offset 10
  output logic [DATA_WIDTH-1:0] RD3 // Data for cache write, block offset 11
);

logic [WORD_WIDTH-1:0] data [2**ADDR_WIDTH-1:0];
logic [DATA_WIDTH-1:0] A0;
logic [DATA_WIDTH-1:0] A1;
logic [DATA_WIDTH-1:0] A2;
logic [DATA_WIDTH-1:0] A3;

/*always_comb begin
  if (A[1:0] == 2'b00) RD = {data[A[ADDR_WIDTH-1:0]+3], data[A[ADDR_WIDTH-1:0]+2], data[A[ADDR_WIDTH-1:0]+1], data[A[ADDR_WIDTH-1:0]]};
  else if (A[1:0] == 2'b10) RD = {{16{1'b0}},data[A[ADDR_WIDTH-1:0]+1], data[A[ADDR_WIDTH-1:0]]};
  else RD = {24'b0, data[A[ADDR_WIDTH-1:0]]};
end*/

initial begin
  $display("[DUT] Loading data memory from program/ref/gaussian.mem file.");
  $readmemh("program/ref/sine.mem", data, 65536);
end

always_comb begin
    A0 = {A[31:4], {2'b0}, {2'b0}};
    A1 = {A[31:4], {2'b01}, {2'b0}};
    A2 = {A[31:4], {2'b10}, {2'b0}};
    A3 = {A[31:4], {2'b11}, {2'b0}};
end

always_comb begin
    RD0 = {data[A0+3],data[A0+2],data[A0+1],data[A0]};
    RD1 = {data[A1+3],data[A1+2],data[A1+1],data[A1]};
    RD2 = {data[A2+3],data[A2+2],data[A2+1],data[A2]};
    RD3 = {data[A3+3],data[A3+2],data[A3+1],data[A3]};
end

always_ff @ (posedge clk) begin
  if (WE) begin
      if (B) begin
      data[A[ADDR_WIDTH-1:0]] <= WD[7:0];
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
