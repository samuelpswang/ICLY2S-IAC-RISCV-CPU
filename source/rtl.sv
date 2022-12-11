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

logic [IMMO_WIDTH-1:0] ImmOp;
logic [ADDR_WIDTH-1:0] pc;
logic [IMMO_WIDTH-1:0] label;

// label logic using Jump and Branch 
// (JB == 01 || JB == 10) -> Branch and JAL , (JB == 11) -> JALR
assign label = Jump ? (Branch ? SUM : pc+ImmOp ) : (Branch ? pc+ImmOp : 0 );

pc_reg pc(
  .clk(clk),
  .rst(rst),
  .PCsrc((Branch && !EQ) || Jump),
  .label(label),
  .pc(pc)
);

// Program Counter: End



// Instruction Memory: Begin

logic [INSTR_WIDTH-1:0] Instruction;

instruction_memory instr_mem(
  .A(pc),
  .RD(Instruction)
);

// Instruction Memory: End



// Control Unit: Begin

// Assigning Instr[6:0] to opcode 
logic [6:0] op = Instruction[6:0];
logic [2:0] funct3 = Instruction[14:12];
logic [6:0] funct7 = Instruction[31:25];
logic RegWrite;
logic [1:0] ResultSrc;
logic MemWrite;
logic Jump;
logic Branch;
logic [3:0] ALUControl;
logic ALUSrc;
logic [2:0] ImmSrc;

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

logic [4:0] AD1 = Instruction[19:15]; // Assinging Instr[19:15] to address of rs1
logic [4:0] AD2 = Instruction[24:20]; // Assigning Instr[24:20] to address of rs2
logic [4:0] AD3 = Instruction[11:7]; // Assigning Instr[11:7] to address of rd
logic [DATA_WIDTH-1:0] WD3;
logic [DATA_WIDTH-1:0] SUM;

// Assigning WriteData based on operation (2-bit Multiplexer)
assign WD3 = ResultSrc[1] ? (ResultSrc[0] ? SUM : pc+32'd4) : (ResultSrc[0] ? RDout : SUM);

logic [DATA_WIDTH-1:0] RD1;
logic [DATA_WIDTH-1:0] RD2;

register_file register(
  .clk(clk),
  .A1(AD1),
  .A2(AD2),
  .A3(AD3),
  .WE3(RegWrite),
  .WD3(WD3),
  .RD1(RD1),
  .RD2(RD2),
  .a0(a0)
);

// Register File: End



// Sign Extend: Begin

logic [31:7] Imm = Instruction[31:7];

extend sign_extend(
  .Instr(Imm),
  .ImmSrc(ImmSrc),
  .ImmExt(ImmOp)
);

// Sign Extend: End 



// ALU: Begin

logic EQ;

alu alu(
  .ALUsrc(ALUSrc),
  .ALUctrl(ALUControl),
  .ImmOp(ImmOp),
  .ALUop1(RD1),
  .regOp2(RD2),
  .EQ(EQ),
  .SUM(SUM)
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
);

// Data Memory: End



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
