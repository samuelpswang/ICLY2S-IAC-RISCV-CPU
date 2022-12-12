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
  output logic [DATA_WIDTH-1:0] DATA_OUT, // Data output if hit
  output logic hit
);

logic hit0;
logic hit1;

// See if hit
always_comb begin
    hit0 = (Tag == TAG0) && V0 && !WE0;
    hit1 = (Tag == TAG1) && V1 && !WE1;
    hit = hit0 | hit1;
end

// Data output
always_comb begin
    if (hit0 == 1'b1) DATA_OUT = DATA0;
    else if (hit1 == 1'b1) DATA_OUT = DATA1;
    else DATA_OUT = 32'b0;
end

endmodule
