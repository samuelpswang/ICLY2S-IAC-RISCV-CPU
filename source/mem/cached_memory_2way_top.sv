module cached_memory_2way_top #(
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

logic [DATA_WIDTH-1:0] RD_0;
logic [DATA_WIDTH-1:0] RD_1;
logic [DATA_WIDTH-1:0] RD_2;
logic [DATA_WIDTH-1:0] RD_3;
logic [24:0] T1;
logic [24:0] T2;
logic V1;
logic V2;
logic [DATA_WIDTH-1:0] DATA_OUT_CACHE_0;
logic [DATA_WIDTH-1:0] DATA_OUT_CACHE_1;
logic hit;
logic U;
logic Cache_0_Data_Mem_WE;
logic Cache_1_Data_Mem_WE;
logic [DATA_WIDTH-1:0] Cache_0_WD0;
logic [DATA_WIDTH-1:0] Cache_0_WD1;
logic [DATA_WIDTH-1:0] Cache_0_WD2;
logic [DATA_WIDTH-1:0] Cache_0_WD3;
logic [DATA_WIDTH-1:0] Cache_1_WD0;
logic [DATA_WIDTH-1:0] Cache_1_WD1;
logic [DATA_WIDTH-1:0] Cache_1_WD2;
logic [DATA_WIDTH-1:0] Cache_1_WD3;
logic [DATA_WIDTH-1:0] WD0;
logic [DATA_WIDTH-1:0] WD1;
logic [DATA_WIDTH-1:0] WD2;
logic [DATA_WIDTH-1:0] WD3;
logic Data_Mem_WE;
logic B;
logic hit0;
logic hit1;


data_cache data_cache_0(
    .clk(clk),
    .tag(A[31:7]),
    .set_num(A[6:4]),
    .block_offset(A[3:2]),
    .hit(hit),
    .WEE(WE),
    .WEC(!U),
    .DATA_IN(WD),
    .DATA_IN_0(RD_0),
    .DATA_IN_1(RD_1),
    .DATA_IN_2(RD_2),
    .DATA_IN_3(RD_3),
    .TAG(T1),
    .V(V1),
    .DATA_OUT(DATA_OUT_CACHE_0),
    .DATA_MEM_WE(Cache_0_Data_Mem_WE),
    .DATA_OUT_0(Cache_0_WD0),
    .DATA_OUT_1(Cache_0_WD1),
    .DATA_OUT_2(Cache_0_WD2),
    .DATA_OUT_3(Cache_0_WD3)
);

data_cache data_cache_1(
    .clk(clk),
    .tag(A[31:7]),
    .set_num(A[6:4]),
    .block_offset(A[3:2]),
    .hit(hit),
    .WEE(WE),
    .WEC(U),
    .DATA_IN(WD),
    .DATA_IN_0(RD_0),
    .DATA_IN_1(RD_1),
    .DATA_IN_2(RD_2),
    .DATA_IN_3(RD_3),
    .TAG(T2),
    .V(V2),
    .DATA_OUT(DATA_OUT_CACHE_1),
    .DATA_MEM_WE(Cache_1_Data_Mem_WE),
    .DATA_OUT_0(Cache_1_WD0),
    .DATA_OUT_1(Cache_1_WD1),
    .DATA_OUT_2(Cache_1_WD2),
    .DATA_OUT_3(Cache_1_WD3)
);

way_divider way_divider(
    .clk(clk),
    .WEE(WE),
    .set_num(A[6:4]),
    .U(U),
    .hit0(hit0),
    .hit1(hit1)
);

way_merger way_merger(
    .V0(V1),
    .V1(V2),
    .WE0(!U),
    .WE1(U),
    .TAG0(T1),
    .TAG1(T2),
    .DATA0(DATA_OUT_CACHE_0),
    .DATA1(DATA_OUT_CACHE_1),
    .Tag(A[31:7]),
    .Cache_0_Data_Mem_WE(Cache_0_Data_Mem_WE),
    .Cache_1_Data_Mem_WE(Cache_1_Data_Mem_WE),
    .Cache_0_WD0(Cache_0_WD0),
    .Cache_0_WD1(Cache_0_WD1),
    .Cache_0_WD2(Cache_0_WD2),
    .Cache_0_WD3(Cache_0_WD3),
    .Cache_1_WD0(Cache_1_WD0),
    .Cache_1_WD1(Cache_1_WD1),
    .Cache_1_WD2(Cache_1_WD2),
    .Cache_1_WD3(Cache_1_WD3),
    .DATA_OUT(RD),
    .hit(hit),
    .Data_Mem_WE(Data_Mem_WE),
    .WD0(WD0),
    .WD1(WD1),
    .WD2(WD2),
    .WD3(WD3),
    .hit0(hit0),
    .hit1(hit1)
);

data_memory_cached data_memory_cached(
    .B(B),
    .clk(clk),
    .A(A),
    .WE(Data_Mem_WE),
    .WD0(WD0),
    .WD1(WD1),
    .WD2(WD2),
    .WD3(WD3),
    .RD0(RD_0),
    .RD1(RD_1),
    .RD2(RD_2),
    .RD3(RD_3)
);

assign stall = !hit;

endmodule
