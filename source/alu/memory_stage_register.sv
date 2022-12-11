module memory_stage_register #(
    DATA_WIDTH = 32,
    PC_WIDTH = 32

)(
    input logic clk,
    input logic RegWriteE,
    input logic [1:0] ResultSrcE,
    input logic MemWriteE,
    input logic [DATA_WIDTH-1:0] ALUResultE,
    input logic BE,
    input logic [DATA_WIDTH-1:0] WriteDataE,
    input logic [4:0] RdE,
    input logic [PC_WIDTH-1:0] PCPlus4E,
    output logic RegWriteM,
    output logic [1:0] ResultSrcM,
    output logic MemWriteM,
    output logic [DATA_WIDTH-1:0] ALUResultM,
    output logic BM,
    output logic [DATA_WIDTH-1:0] WriteDataM,
    output logic [4:0] RdM,
    output logic [PC_WIDTH-1:0] PCPlus4M

);
    
    always_ff @ (posedge clk) begin
        RegWriteM <= RegWriteE;
        ResultSrcM <= ResultSrcE;
        MemWriteM <= MemWriteE;
        ALUResultM <= ALUResultE;
        BD<=BM;
        WriteDataM <= WriteDataE;
        RdM <= RdE;
        PCPlus4M <= PCPlus4E;
    end
endmodule
