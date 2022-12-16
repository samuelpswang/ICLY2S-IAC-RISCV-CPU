#include "Vcontrol_top.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

int main(int agrc, char **argv, char **env) {
    int i, clk;

    Verilated::commandArgs(agrc, argv);
    Vcontrol_top* top = new Vcontrol_top;
    Verilated::traceEverOn(true);
    VerilatedVcdC* tfp = new VerilatedVcdC;
    top->trace (tfp, 99);
    tfp->open ("control_top.vcd");

    top->clk = 1;
    top->Instr = 0x00001063; // bne zero, zero, <same_line>
    top->Result = 0x00000000;

    for(i = 0; i < 4; i++){
        for(clk = 0; clk<2; clk++){
            tfp->dump(2*i+clk);
            top->clk = !top->clk;
            top->eval();
        }
        if(Verilated::gotFinish()) exit(0);
    }

    tfp->close();
    exit(0);
}