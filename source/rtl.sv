module rtl #(
  parameter DATA_WIDTH = 32, // 32-bit data in memory
  parameter ADDR_WIDTH = 32, // 32-bit counter
  parameter IMMO_WIDTH = 32, // 32-bit immediate
  parameter INSTR_WIDTH = 32 // 32-bit instruction 
)(
  input logic clk, // clock
  input logic rst, // cpu reset
  output logic [DATA_WIDTH-1:0] a0 //output register
);


// Program Counter: Begin

logic [ADDR_WIDTH-1:0] PCF;
logic [IMMO_WIDTH-1:0] label;

// label logic using Jump and Branch 
// (JB == 01 || JB == 10) -> Branch and JAL , (JB == 11) -> JALR

assign label = JumpE ? (BranchE ? ALUResultE : PCE+ImmExtE ) : (BranchE ? PCE+ImmExtE : 0 );


pc_reg PC(
    .clk(clk),
    .rst(rst),
    .PCsrc((BranchE && !EQ) || JumpE),
    .label(label),
    .pc(PCF)
);

// Program Counter: End



// Instruction Memory: Begin

logic [INSTR_WIDTH-1:0] INSTRF;

instruction_memory instr_mem(
    .A(PCF),
    .RD(INSTRF)
);

// Instruction Memory: End


// Fetch stage pipeline register

logic [ADDR_WIDTH-1:0] PCD;
logic [INSTR_WIDTH-1:0] INSTRD;
logic [ADDR_WIDTH-1:0] PCPlus4D;



instruction_memory_pip fetch_register(
    .clk(clk),
    .PCF(PCF),
    .INSTRF(INSTRF),
    .PCD(PCD),
    .INSTRD(INSTRD),
    .PCPLUS4D(PCPlus4D)
);

//end


// Control Unit: Begin

// Assigning Instr[6:0] to opcode 
logic [6:0] op = INSTRD[6:0];
logic [2:0] funct3 = INSTRD[14:12];
logic [6:0] funct7 = INSTRD[31:25];
logic RegWriteD;
logic [1:0] ResultSrcD;
logic MemWriteD;
logic JumpD;
logic BranchD;
logic [3:0] ALUControlD;
logic ALUSrcD;
logic [2:0] ImmSrcD;

control_unit control_unit(
  .op(op),
  .funct3(funct3),
  .funct7(funct7),
  .RegWrite(RegWrite),
  .ResultSrc(ResultSrc),
  .MemWrite(MemWrite),
  .Jump(Jump),
  .Branch(Branch),
  .ALUControl(ALUControl),
  .ALUSrc(ALUSrc),
  .ImmSrc(ImmSrc),
  .B(B)
);

// Control Unit: End 



// Register File: Begin

// Assinging Instr[19:15] to address of rs1
logic [4:0] AD1 = INSTRD[19:15];
// Assigning Instr[24:20] to address of rs2
logic [4:0] AD2 = INSTRD[24:20];
// Assigning Instr[11:7] to address of rd
logic [4:0] RdD = INSTRD[11:7];
//Result of writeback stage]
logic [DATA_WIDTH-1:0] ResultW;


// Assigning WriteData based on operation (2-bit Multiplexer)
assign ResultW = ResultSrcW[1] ? (ResultSrcW[0] ? ALUResultW :  PCPlus4W) : (ResultSrcW[0] ? ReadDataW : ALUResultW);

logic [DATA_WIDTH-1:0] RD1D;
logic [DATA_WIDTH-1:0] RD2D;

reg_file register(
    .clk(clk),
    .AD1(AD1),
    .AD2(AD2),
    .AD3(RdW),
    .WE3(RegWriteW),
    .WD3(ResultW),
    .RD1(RD1D),
    .RD2(RD2D),
    .a0(a0)
);

// Register File: End

// Sign Extend 
logic [31:7] Imm = INSTRD[31:7];
logic [31:0] ImmExtD;

extend sign_extend(
    .Instr(Imm),
    .ImmSrc(ImmSrcD),
    .ImmExt(ImmExtD)
);

// Sign Extend: End 

  
//Decode Pipeline Register

logic RegWriteE;
logic [1:0] ResultSrcE;
logic MemWriteE;
logic JumpE;
logic BranchE;
logic [3:0] ALUControlE;
logic ALUSrcE;
logic [31:0] RD1E;
logic [31:0] RD2E;
logic [31:0] PCE;
logic [4:0] RdE;
logic [31:0] ImmExtE;
logic [31:0] PCPlus4E;

decode_register decode_register(
    .clk(clk),
    .RegWriteD(RegWriteD),
    .ResultSrcD(ResultSrcD),
    .MemWriteD(MemWriteD),
    .JumpD(JumpD),
    .BranchD(BranchD),
    .ALUControlD(ALUControlD),
    .ALUSrcD(ALUSrcD),
    .RD1D(RD1D),
    .RD2D(RD2D),
    .PCD(PCD),
    .RdD(RdD),
    .ImmExtD(ImmExtD),
    .PCPlus4D(PCPlus4D),
    .RegWriteE(RegWriteE),
    .ResultSrcE(ResultSrcE),
    .MemWriteE(MemWriteE),
    .JumpE(JumpE),
    .BranchE(BranchE),
    .ALUControlE(ALUControlE),
    .ALUSrcE(ALUSrcE),
    .RD1E(RD1E),
    .RD2E(RD2E),
    .PCE(PCE),
    .RdE(RdE),
    .ImmExtE(ImmExtE),
    .PCPlus4E(PCPlus4E)
);

//end


// ALU 

logic EQ;
logic[DATA_WIDTH-1:0] ALUResultE;

alu ALU(
    .ALUsrc(ALUSrcE),
    .ALUctrl(ALUControlE),
    .ImmOp(ImmExtE),
    .ALUop1(RD1E),
    .regOp2(RD2E),
    .EQ(EQ),
    .SUM(ALUResultE)
);

// ALU: End 


// Data Memory: Begin

logic [DATA_WIDTH-1:0] RD;
logic B;

data_memory data_memory(
  .clk(clk),
  .A(SUM),
  .B(B),
  .WE(MemWrite),
  .WD(RD2),
  .RD(RD)

 //Data Memory: End
  
// Memory Pipeline Register

logic RegWriteM;
logic [1:0] ResultSrcM;
logic MemWriteM;
logic [DATA_WIDTH-1:0] ALUResultM;
logic [DATA_WIDTH-1:0] WriteDataM;
logic [4:0] RdM;
logic [ADDR_WIDTH-1:0] PCPlus4M;


memory_stage_register memory_register(
    .clk(clk),
    .RegWriteE(RegWriteE),
    .ResultSrcE(ResultSrcE),
    .MemWriteE(MemWriteE),
    .ALUResultE(ALUResultE),
    .WriteDataE(RD2E),
    .RdE(RdE),
    .PCPlus4E(PCPlus4E),
    .RegWriteM(RegWriteM),
    .ResultSrcM(ResultSrcM),
    .MemWriteM(MemWriteM),
    .ALUResultM(ALUResultM),
    .WriteDataM(WriteDataM),
    .RdM(RdM),
    .PCPlus4M(PCPlus4M)
);
// end


// Writeback Pipeline Register
    
logic RegWriteW;
logic [1:0] ResultSrcW;
logic [31:0] ALUResultW;
logic [31:0] ReadDataW;
logic [4:0] RdW;
logic [31:0] PCPlus4W;


memory_writeback_register writeback_register(
    .clk(clk),
    .RegWriteM(RegWriteM),
    .ResultSrcM(ResultSrcM),
    .ALUResultM(ALUResultM),
    .ReadDataM(ReadDataM),
    .RdM(RdM),
    .PCPlus4M(PCPlus4M),
    .RegWriteW(RegWriteW),
    .ResultSrcW(ResultSrcW),
    .ALUResultW(ALUResultW),
    .ReadDataW(ReadDataW),
    .RdW(RdW),
    .PCPlus4W(PCPlus4W)
);

  //end



// Output Controller: Begin

logic [31:0] RDout;

output_controller output_controller(
    .MemWrite(MemWrite),
    .RegWrite(RegWrite),
    .ResultSrc(ResultSrc),
    .B(B),
    .RDin(RD),
    .RDout(RDout)
);

// Output Controller: End

endmodule
