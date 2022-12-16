module control_unit(
  input logic [6:0] op,
  input logic [2:0] funct3,
  input logic [6:0] funct7,
  output logic RegWrite,
  output logic [1:0] ResultSrc,
  output logic MemWrite,
  output logic Mem,
  output logic Jump,
  output logic Branch,
  output logic [3:0] ALUControl,
  output logic ALUSrc,
  output logic [2:0] ImmSrc,
  output logic B
);

always_comb 
  case (op)
    7'b0110011: begin // R-type: add, xor
      RegWrite = 1'b1;
      ResultSrc = 2'b00;
      MemWrite = 1'b0;
      Mem = 1'b0;
      Jump = 1'b0;
      Branch = 1'b0;
      ALUSrc = 1'b0;
      ImmSrc = 3'b011;
      B = 1'b0;
      if ((funct3 == 3'b000) && (funct7 == 7'b0000000)) ALUControl = 4'b0000; // add
      else if ((funct3 == 3'b100) && (funct7 == 7'b0000000)) ALUControl = 4'b0100; // xor
      else ALUControl = 4'b1111;
    end // more alu codes is needed to implement whole ISA

    7'b1100011: begin // B-type: bne
      RegWrite = 1'b0;
      ResultSrc = 2'b00;
      MemWrite = 1'b0;
      Mem = 1'b0;
      Jump = 1'b0;
      Branch = 1'b1;
      ALUSrc = 1'b0;
      ImmSrc = 3'b001;
      B = 1'b0;
      if (funct3 == 3'b001) ALUControl = 4'b0001; // bne
      else ALUControl = 4'b1111;
    end // need pc control logic and more alu functions to implement whole ISA

    7'b0000011: begin // I-type: lw
      RegWrite = 1'b1;
      ResultSrc = 2'b01;
      MemWrite = 1'b0;
      Mem = 1'b1;
      Jump = 1'b0;
      Branch = 1'b0;
      ALUControl = 4'b0000;
      ALUSrc = 1'b1;
      ImmSrc = 3'b000;
      if (funct3 == 3'b100) B = 1'b1;
      else B =  1'b0;
    end

    7'b0010011: begin // I-type: addi, slli
      RegWrite = 1'b1;
      ResultSrc = 2'b00;
      MemWrite = 1'b0;
      Mem = 1'b0;
      Jump = 1'b0;
      Branch = 1'b0;
      ALUSrc = 1'b1;
      ImmSrc = 3'b000;
      B = 1'b0;
      if (funct3 == 3'b000) ALUControl = 4'b0000; // addi
      else if ((funct3 == 3'b001) && (funct7 == 7'b0000000)) ALUControl = 4'b0110; // slli
      else ALUControl = 4'b1111;
    end

    7'b0100011: begin // S-type: sw
      RegWrite = 1'b0;
      ResultSrc = 2'b00; 
      MemWrite = 1'b1;
      Mem = 1'b0;
      Jump = 1'b0;
      Branch = 1'b0;
      ALUControl = 4'b0000;
      ALUSrc = 1'b1;
      ImmSrc = 3'b010;
      if (funct3 == 3'b000) B = 1'b1;
      else B = 1'b0;
    end

    7'b1100111: begin  // I-type: jalr
      RegWrite = 1'b1;
      ResultSrc = 2'b10;
      MemWrite = 1'b0;
      Mem = 1'b0;
      Jump = 1'b1;
      Branch = 1'b1;
      ALUControl = 4'b1001;
      ALUSrc = 1'b1;
      ImmSrc = 3'b000;
      B = 1'b0;
    end

    7'b1101111: begin // J-type: jal
      RegWrite = 1'b1;
      ResultSrc = 2'b10;
      MemWrite = 1'b0;
      Mem = 1'b0;
      Jump = 1'b1;
      Branch = 1'b0;
      ALUControl = 4'b0000;
      ALUSrc = 1'b1;
      ImmSrc = 3'b011;
      B = 1'b0;
    end

    7'b0110111: begin // U-type: lui
      RegWrite = 1'b1;
      ResultSrc = 2'b00;
      MemWrite = 1'b0;
      Mem = 1'b1;
      Jump = 1'b0;
      Branch = 1'b0;
      ALUControl = 4'b1010;
      ALUSrc = 1'b1;
      ImmSrc = 3'b100;
      B = 1'b0;
    end


    default: begin // nop
      RegWrite = 1'b0;
      ResultSrc = 2'b00;
      MemWrite = 1'b0;
      Mem = 1'b0;
      Jump = 1'b0;
      Branch = 1'b0;
      ALUControl = 4'b1111;
      ALUSrc = 1'b0;
      ImmSrc = 3'b001;
      B = 1'b0;
    end
  endcase
  
endmodule
