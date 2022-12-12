#include "verilated.h"
#include "verilated_vcd_c.h"
#include "Vcached_memory_2way_top.h"

int main(int argc, char **argv, char **env){
    int i;
    int clk;
    Verilated::commandArgs(argc,argv);
    Vcached_memory_2way_top* top = new Vcached_memory_2way_top;
    Verilated::traceEverOn(true);
    VerilatedVcdC* tfp = new VerilatedVcdC;
    top->trace(tfp,99);
    tfp->open("Vcached_memory_2way_top.vcd");

    top->A = 0x0000000C;
    top->WD = 0x00001111;
    top->WE = 0;
    top->BLOCK_OFFSET = 0b11;
    top->SET = 0;
    top->TAG = 0;

    int tick = 0;
    for(i = 0; i < 300; i++){
        for(clk = 0; clk < 2; clk++){
        tfp->dump(2*i+clk);
        top->clk = !top->clk;
        top->eval();
        }

    top->WE = (i==3);
    if(2<i && i<6 || 9<i){
        top->A = 0x00000024;
        top->TAG = 0;
        top->SET = 0b010;
        top->BLOCK_OFFSET = 0b01;
    }
    if(5<i && i< 10){
        top->A = 0x0000000C;
        top->TAG = 0;
        top->SET = 0;
        top->BLOCK_OFFSET = 0b11;
    }

    if(Verilated::gotFinish()) exit(0);
    }
    tfp->close();
    exit(0);
}