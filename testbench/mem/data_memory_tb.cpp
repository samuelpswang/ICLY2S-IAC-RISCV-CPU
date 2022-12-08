#include "verilated.h"
#include "verilated_vcd_c.h"
#include "Vdata_memory.h"

int main(int argc, char **argv, char **env){
    int i;
    int clk;
    Verilated::commandArgs(argc,argv);
    Vdata_memory* top = new Vdata_memory;
    Verilated::traceEverOn(true);
    VerilatedVcdC* tfp = new VerilatedVcdC;
    top->trace(tfp,99);
    tfp->open("Vdata_memory.vcd");

    top->A = 0x00000000;
    top->WD = 0x00000000;
    top->WE = 0;

    int tick = 0;
    for(i = 0; i < 300; i++){
        for(clk = 0; clk < 2; clk++){
        tfp->dump(2*i+clk);
        top->clk = !top->clk;
        top->eval();
        }

    top->A += 0x00000001;
    top->WD += 0x00000001;
    top->WE = !top->WE;
    if(Verilated::gotFinish()) exit(0);
    }
    tfp->close();
    exit(0);
}