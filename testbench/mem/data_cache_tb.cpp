#include "verilated.h"
#include "verilated_vcd_c.h"
#include "Vdata_cache.h"

int main(int argc, char **argv, char **env){
    int i;
    int clk;
    Verilated::commandArgs(argc,argv);
    Vdata_cache* top = new Vdata_cache;
    Verilated::traceEverOn(true);
    VerilatedVcdC* tfp = new VerilatedVcdC;
    top->trace(tfp,99);
    tfp->open("Vdata_cache.vcd");

    top->clk = clk;
    top->WEE = 0;
    top->tag = 0;
    top->set_num = 0b001;
    top->hit = 0;
    top->block_offset = 0b00;
    top->DATA_IN = 0x0000AAAA;
    top->DATA_IN_0 = 0x00001111;
    top->DATA_IN_1 = 0x00002222;
    top->DATA_IN_2 = 0x00003333;
    top->DATA_IN_3 = 0x00004444;


    int tick = 0;
    for(i = 0; i < 300; i++){
        for(clk = 0; clk < 2; clk++){
        tfp->dump(2*i+clk);
        top->clk = !top->clk;
        top->eval();
        }

    if(i == 1){
        top->WEE = 1;
    }
    else if(i == 2){
        top->WEE = 0;
    }
    else{
        top->WEE = 0;
    }

    if(Verilated::gotFinish()) exit(0);
    }
    tfp->close();
    exit(0);
}