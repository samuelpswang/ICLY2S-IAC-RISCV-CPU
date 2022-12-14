module cached_memory_1way_top #(
    parameter ADDR_WIDTH = 32,
    parameter DATA_WIDTH = 32
)(
    input logic clk,
    input logic [ADDR_WIDTH-1:0] A,
    input logic WE,
    input logic [DATA_WIDTH-1:0] WD,
    output logic [DATA_WIDTH-1:0] RD,
    output logic stall 
);

logic hit;
logic B;
logic [DATA_WIDTH-1:0] mem_DATA_OUT_0;
logic [DATA_WIDTH-1:0] mem_DATA_OUT_1;
logic [DATA_WIDTH-1:0] mem_DATA_OUT_2;
logic [DATA_WIDTH-1:0] mem_DATA_OUT_3;
logic V;
logic [24:0] TAG;

always_comb begin
    hit = (A[31:7] == TAG) & V;
    stall = !hit;
end

always_comb begin
    if (stall) RD = 32'b0;
end


data_cache data_cache(
    .clk(clk),
    .tag(A[31:7]),
    .set_num(A[6:4]),
    .block_offset(A[3:2]),
    .hit(hit),
    .WEE(WE),
    .DATA_IN(WD),
    .DATA_IN_0(mem_DATA_OUT_0),
    .DATA_IN_1(mem_DATA_OUT_1),
    .DATA_IN_2(mem_DATA_OUT_2),
    .DATA_IN_3(mem_DATA_OUT_3),
    .TAG(TAG),
    .V(V),
    .DATA_OUT(RD)
    );

data_memory_cached data_memory_cached(
    .clk(clk),
    .A(A),
    .B(B),
    .WE(WE),
    .WD(WD),
    .RD0(mem_DATA_OUT_0),
    .RD1(mem_DATA_OUT_1),
    .RD2(mem_DATA_OUT_2),
    .RD3(mem_DATA_OUT_3)
);

endmodule
