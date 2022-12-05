#include "Valu_top.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

int main(int agrc, char **argv, char **env){
    int i;
    int clk;

    Verilated::commandArgs(agrc, argv);
    Valu_top* top = new Valu_top;
    Verilated::traceEverOn(true);
    VerilatedVcdC* tfp = new VerilatedVcdC;
    top->trace (tfp, 99);
    tfp->open ("alu_top.vcd");

    top->clk = 1;
    top->ALUsrc = 1;
    top->ALUctrl = 0b1111;
    top->Instr = 0x00090900;
    top->RegWrite = 1;
    top->ImmOp = 0x0000001;

    for(i = 0; i<11; i++){
        for(clk = 0; clk<2; clk++){
            tfp->dump(2*i+clk);
            top->clk = !top->clk;
            top->eval();
        }
        top->ALUctrl += 0b0001;
        top->RegWrite = (i == 0);
        if(Verilated::gotFinish()) exit(0);
    }
    tfp->close();
    exit(0);
}