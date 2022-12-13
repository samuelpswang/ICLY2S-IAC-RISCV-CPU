module way_divider (
  input logic clk,
  input logic WEE, // Write enable for cache
  input logic [2:0] set_num,
  output logic U // LRU replacement policy
);

logic [7:0] Ureg;

always_ff @ (posedge clk) begin
  if (WEE) begin
      if (!Ureg[set_num])
        Ureg[set_num] <= 1'b1;
      else
        Ureg[set_num] <= 1'b0;
  end
end

always_comb begin
  U = (Ureg[set_num]) ? 1'b1 : 1'b0;
end

endmodule
