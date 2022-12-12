module data_cache #(
    parameter DATA_WIDTH = 32,
    parameter TAG_WIDTH = 25
)(
    input logic clk,
    input logic WEE, // Write enable from outside
    input logic WEC, // Write enable for the cache
    input logic [24:0] tag,
    input logic [2:0] set_num,
    input logic [1:0] block_offset,
    input logic [DATA_WIDTH-1:0] DATA_IN, // Data from outside
    input logic [DATA_WIDTH-1:0] DATA_IN_0, // Data0 from data memory
    input logic [DATA_WIDTH-1:0] DATA_IN_1,  
    input logic [DATA_WIDTH-1:0] DATA_IN_2,
    input logic [DATA_WIDTH-1:0] DATA_IN_3,
    output logic [TAG_WIDTH-1:0] TAG,
    output logic V,  
    output logic [DATA_WIDTH-1:0] DATA_OUT
);

logic [DATA_WIDTH-1:0] data_reg_0 [7:0];
logic [DATA_WIDTH-1:0] data_reg_1 [7:0];
logic [DATA_WIDTH-1:0] data_reg_2 [7:0];
logic [DATA_WIDTH-1:0] data_reg_3 [7:0];
logic [7:0] valid_reg;
logic [TAG_WIDTH-1:0] tag_reg [7:0];

always_ff @ (negedge clk) begin
    if (WEC) begin
        if (WEE) begin
            case {block_offset}
                2'b00: begin
                    data_reg_0[set_num] = DATA_IN;
                    tag_reg[set_num] = tag;
                    valid_reg[set_num] = 1'b1;
                end
                2'b01: begin
                    data_reg_1[set_num] = DATA_IN;
                    tag_reg[set_num] = tag;
                    valid_reg[set_num] = 1'b1;
                end
                2'b10: begin
                    data_reg_2[set_num] = DATA_IN;
                    tag_reg[set_num] = tag;
                    valid_reg[set_num] = 1'b1;
                end
                2'b11: begin
                    data_reg_3[set_num] = DATA_IN;
                    tag_reg[set_num] = tag;
                    valid_reg[set_num] = 1'b1;
                end
                default: begin
                    data_reg_0[set_num] = 32'b0;
                    data_reg_1[set_num] = 32'b0;
                    data_reg_2[set_num] = 32'b0;
                    data_reg_3[set_num] = 32'b0;
                    tag_reg[set_num] = 25'b0;
                    valid_reg[set_num] = 1'b0;
                end
            endcase
        end
        else begin
        data_reg_0[set_num] <= DATA_IN_0;
        data_reg_1[set_num] <= DATA_IN_1;
        data_reg_2[set_num] <= DATA_IN_2;
        data_reg_3[set_num] <= DATA_IN_3;
        tag_reg[set_num] <= tag;
        valid_reg[set_num] <= 1'b1;
        end
    end
end

always_comb begin
    TAG = tag_reg[set_num];
    V = valid_reg[set_num];
    case (block_offset)
    2'b00: DATA_OUT = data_reg_0[set_num];
    2'b01: DATA_OUT = data_reg_1[set_num];
    2'b10: DATA_OUT = data_reg_2[set_num];
    2'b11: DATA_OUT = data_reg_3[set_num];
    default: begin
         DATA_OUT = data_reg_0[set_num];
    end
    endcase
end

endmodule
