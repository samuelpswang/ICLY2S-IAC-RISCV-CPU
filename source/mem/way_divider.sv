module way_divider #(
  parameter ADDR_WIDTH = 32
)(
  input logic clk,
  input logic WEC, // Write enable for cache
  input logic [ADDR_WIDTH-1] ADDR, // Address for cache to be read/written
  output logic U // LRU replacement policy
);

logic Ureg [7:0];
logic [2:0] set_num;

always_comb
  set_num = ADDR[6:4];
  U = (Ureg[set_num] == 1) ? 1'b1 : 1'b0;

always_ff @ (posedge clk) begin
  if (WEC) begin
      if (Ureg[set_num] == 1'b0)
        Ureg[set_num] <= 1'b1;
      else
        Ureg[set_num] <= 1'b0;
  end
end

endmodule