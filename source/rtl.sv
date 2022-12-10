module rtl #(
    // 32-bit data in memory
    parameter DATA_WIDTH = 32, 
    // 32-bit counter
    parameter ADDR_WIDTH = 32,
    // 32-bit immediate
    parameter IMMO_WIDTH = 32,
    // 32-bit instruction 
    parameter INSTR_WIDTH = 32

)(
    // reset cpu
    input logic rst,
    // clock
    input logic clk,
    //output register
    output logic [DATA_WIDTH-1:0] a0
);


// Program Counter

logic [IMMO_WIDTH-1:0] ImmOp;
logic [ADDR_WIDTH-1:0] pc;
logic [IMMO_WIDTH-1:0] label;

// label logic using Jump and Branch 
// (JB == 01 || JB == 10) -> Branch and JAL , (JB == 11) -> JALR

assign label = Jump ? (Branch ? SUM : pc+ImmOp ) : (Branch ? pc+ImmOp : 0 );


pc_reg PC(
    .clk(clk),
    .rst(rst),
    .PCsrc((Branch && !EQ) || Jump),
    .label(label),
    .pc(pc)
);

// end 


// Instruction memory

logic [INSTR_WIDTH-1:0] Instruction;

instruction_memory instr_mem(
    .A(pc),
    .RD(Instruction)
);

// end


// Control Unit 

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

// end 


// Register File

// Assinging Instr[19:15] to address of rs1
logic [4:0] AD1 = Instruction[19:15];
// Assigning Instr[24:20] to address of rs2
logic [4:0] AD2 = Instruction[24:20];
// Assigning Instr[11:7] to address of rd
logic [4:0] AD3 = Instruction[11:7];
logic [DATA_WIDTH-1:0] WD3;
logic [DATA_WIDTH-1:0] SUM;

// Assigning WriteData based on operation (2-bit Multiplexer)

assign WD3 = ResultSrc[1] ? (ResultSrc[0] ? SUM : pc+32'd4) : (ResultSrc[0] ? RDout : SUM);


logic [DATA_WIDTH-1:0] RD1;
logic [DATA_WIDTH-1:0] RD2;

reg_file register(
    .clk(clk),
    .AD1(AD1),
    .AD2(AD2),
    .AD3(AD3),
    .WE3(RegWrite),
    .WD3(WD3),
    .RD1(RD1),
    .RD2(RD2),
    .a0(a0)
);

//end


// Sign Extend 
logic [31:7] Imm = Instruction[31:7];

extend sign_extend(
    .Instr(Imm),
    .ImmSrc(ImmSrc),
    .ImmExt(ImmOp)
);

// end 


// ALU 

logic EQ;

alu ALU(
    .ALUsrc(ALUSrc),
    .ALUctrl(ALUControl),
    .ImmOp(ImmOp),
    .ALUop1(RD1),
    .regOp2(RD2),
    .EQ(EQ),
    .SUM(SUM)
);

// end 


// Data Memory

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

//end

logic [31:0] RDout;

output_controller output_controller(
    .MemWrite(MemWrite),
    .RegWrite(RegWrite),
    .RegSrc(RegSrc),
    .B(B),
    .RDin(RD),
    .RDout(RDout)
);



endmodule
