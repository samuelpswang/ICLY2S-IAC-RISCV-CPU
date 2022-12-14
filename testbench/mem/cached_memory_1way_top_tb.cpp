#include "verilated.h"
#include "verilated_vcd_c.h"
#include "Vcached_memory_1way_top.h"

int main(int argc, char **argv, char **env){
    int i;
    int clk;
    Verilated::commandArgs(argc,argv);
    Vcached_memory_1way_top* top = new Vcached_memory_1way_top;
    Verilated::traceEverOn(true);
    VerilatedVcdC* tfp = new VerilatedVcdC;
    top->trace(tfp,99);
    tfp->open("Vcached_memory_1way_top.vcd");

    top->A = 0x00000000;
    top->WD = 0x0000FFFF;
    top->WE = 0;

    int tick = 0;
    for(i = 0; i < 300; i++){
        for(clk = 0; clk < 2; clk++){
        tfp->dump(2*i+clk);
        top->clk = !top->clk;
        top->eval();
        }

    top->WE = (i==3||i==8||i==15);
    if((2<i && i<6) || 9<i && i<13){
        top->A = 0x00000080;
        top->WD = 0x00001111;
    }
    if(5<i && i< 10){
        top->A = 0x00000000;
        top->WD = 0X00002222;
    }
    if(i>12){
        top->A = 0x00000100;
        top->WD = 0X00003333;
    }

    if(Verilated::gotFinish()) exit(0);
    }
    tfp->close();
    exit(0);
}