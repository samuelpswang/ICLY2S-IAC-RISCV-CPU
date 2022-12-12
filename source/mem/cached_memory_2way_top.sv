module cached_memory_2way_top #(
    parameter ADDR_WIDTH = 32,
    parameter DATA_WIDTH = 32
)(
    input logic clk,
    input logic [ADDR_WIDTH-1:0] A,
    input logic WE,
    input logic [24:0] TAG,
    input logic [2:0] SET,
    input logic [1:0] BLOCK_OFFSET,
    input logic [DATA_WIDTH-1:0] WD,
    output logic [DATA_WIDTH-1:0] RD
);

logic [DATA_WIDTH-1:0] RD_0;
logic [DATA_WIDTH-1:0] RD_1;
logic [DATA_WIDTH-1:0] RD_2;
logic [DATA_WIDTH-1:0] RD_3;
logic [24:0] T1;
logic [24:0] T2;
logic V1;
logic V2;
logic [DATA_WIDTH-1:0] DATA_OUT_MEM;
logic [DATA_WIDTH-1:0] DATA_OUT_CACHE;
logic [DATA_WIDTH-1:0] DATA_OUT_CACHE_1;
logic [DATA_WIDTH-1:0] DATA_OUT_CACHE_2;
logic hit;
logic U;

data_cache data_cache_1(
    .clk(clk),
    .tag(TAG),
    .set_num(SET),
    .block_offset(BLOCK_OFFSET),
    .WE(!U),
    .DATA_IN_0(RD_0),
    .DATA_IN_1(RD_1),
    .DATA_IN_2(RD_2),
    .DATA_IN_3(RD_3),
    .TAG(T1),
    .V(V1),
    .DATA_OUT(DATA_OUT_CACHE_1)
);

data_cache data_cache_2(
    .clk(clk),
    .tag(TAG),
    .set_num(SET),
    .block_offset(BLOCK_OFFSET),
    .WE(U),
    .DATA_IN_0(RD_0),
    .DATA_IN_1(RD_1),
    .DATA_IN_2(RD_2),
    .DATA_IN_3(RD_3),
    .TAG(T2),
    .V(V2),
    .DATA_OUT(DATA_OUT_CACHE_2)
);

way_divider way_divider(
    .clk(clk),
    .WEC(WE),
    .set_num(SET),
    .U(U)
);

way_merger way_merger(
    .V0(V1),
    .V1(V2),
    .WE0(!U),
    .WE1(U),
    .TAG0(T1),
    .TAG1(T2),
    .DATA0(DATA_OUT_CACHE_1),
    .DATA1(DATA_OUT_CACHE_2),
    .Tag(TAG),
    .DATA_OUT(DATA_OUT_CACHE),
    .hit(hit)
);

data_memory_cached data_memory_cached1(
    .clk(clk),
    .A(A),
    .WE(WE),
    .WD(WD),
    .RD(DATA_OUT_MEM),
    .RD0(RD_0),
    .RD1(RD_1),
    .RD2(RD_2),
    .RD3(RD_3)
);

assign DATA_OUT = (hit ? DATA_OUT_CACHE:DATA_OUT_MEM);

endmodule
