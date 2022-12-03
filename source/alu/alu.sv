module ALU#(
    parameter DATA_WIDTH = 32
)(
    input logic [3:0] ALUctrl,
    input logic [DATA_WIDTH-1:0] ALUop1,
    input logic [DATA_WIDTH-1:0] ALUop2,
    output logic [DATA_WIDTH-1:0] SUM,
    output logic EQ
);

always_comb begin
    case (ALUctrl)
    4'b0000: SUM = ALUop1+ALUop2;
    4'b0001: SUM = ALUop1 - ALUop2;
    4'b0010: SUM = ALUop1 & ALUop2;
    4'b0011: SUM = ALUop1 | ALUop2;
    4'b0100: SUM = ALUop1^ALUop2
    4'b0101: SUM = (ALUop1<ALUop2);
    4'b0110: SUM = ALUop1 << ALUop2[4:0]
    4'b0111: SUM = ALUop1 >> ALUop2[4:0]
    4'b1000: SUM = ALUop1 >>> ALUop2[4:0]
        
    endcase

    assign EQ = (ALUop1 == ALUop2);
end

endmodule