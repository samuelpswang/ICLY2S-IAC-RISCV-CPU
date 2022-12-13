module way_merger #(
  parameter DATA_WIDTH = 32
)(
  //input logic WE,
  input logic V0, // Valid bit from cache 0
  input logic V1, // Valid bit from cache 1
  input logic WE0,
  input logic WE1,
  input logic [24:0] TAG0, // Tag from cache 0
  input logic [24:0] TAG1, // Tag from cache 1
  input logic [DATA_WIDTH-1:0] DATA0, // Data from cache 0
  input logic [DATA_WIDTH-1:0] DATA1, // Data from cache 1
  input logic [24:0] Tag,
  input logic valid0,
  input logic valid1,
  input logic dirty0,
  input logic dirty1,
  input logic [DATA_WIDTH-1:0] Cache_0_WD0,
  input logic [DATA_WIDTH-1:0] Cache_0_WD1,
  input logic [DATA_WIDTH-1:0] Cache_0_WD2,
  input logic [DATA_WIDTH-1:0] Cache_0_WD3,
  input logic [DATA_WIDTH-1:0] Cache_1_WD0,
  input logic [DATA_WIDTH-1:0] Cache_1_WD1,
  input logic [DATA_WIDTH-1:0] Cache_1_WD2,
  input logic [DATA_WIDTH-1:0] Cache_1_WD3,
  output logic [DATA_WIDTH-1:0] DATA_OUT, // Data output if hit
  output logic hit,
  output logic Data_Mem_WE,
  output logic [DATA_WIDTH-1:0] WD0,
  output logic [DATA_WIDTH-1:0] WD1,
  output logic [DATA_WIDTH-1:0] WD2,
  output logic [DATA_WIDTH-1:0] WD3,
  output logic hit0,
  output logic hit1
);

// See if hit
always_comb begin
    hit0 = (Tag == TAG0) && V0;
    hit1 = (Tag == TAG1) && V1;
    hit = hit0 | hit1;
end

always_comb begin
  if (valid0 && valid1 && !hit) begin
    if (WE0 && dirty0) begin
      Data_Mem_WE = 1'b1;
      WD0 = Cache_1_WD0;
      WD1 = Cache_1_WD1;
      WD2 = Cache_1_WD2;
      WD3 = Cache_1_WD3;
    end
    else if (WE1 && dirty1) begin
      Data_Mem_WE = 1'b1;
      WD0 = Cache_0_WD0;
      WD1 = Cache_0_WD1;
      WD2 = Cache_0_WD2;
      WD3 = Cache_0_WD3; 
    end
  end 
  else Data_Mem_WE = 1'b0;
end

// Data output
always_comb begin
    if (hit0 == 1'b1) DATA_OUT = DATA0;
    else if (hit1 == 1'b1) DATA_OUT = DATA1;
    else DATA_OUT = 32'b0;
end

endmodule
