#include "Vrtl.h"
#include "verilated.h"
#include "verilated_vcd_c.h"
#include "vbuddy.cpp"

int main(int argc, char **argv, char **env) {
    // init variables
    int clk;

    //  init top verilog instance
    Verilated::commandArgs(argc,argv);
    Vrtl* top = new Vrtl;

    // init trace dump
    Verilated::traceEverOn(true);
    VerilatedVcdC* tfp = new VerilatedVcdC;
    top->trace(tfp, 99);
    tfp->open("Vrtl.vcd");

    // init vbuddy
    if (vbdOpen() != 1) return 1;
    vbdHeader("F1 Lights");
    
    // initial variable state
    top->clk =1;
    top->rst=0;

    // run simulation for many clock cycles
    int tick = 0;
    for (int i = 0; i < 1000000; i++) {
        // Add to readme, remember to compelete part 2 of challenge
        // dump variables into .vcd and toggle clock
        for (clk = 0; clk < 2; clk++) {
            tfp->dump(2*i+clk);
            top->clk = !top->clk;
            top->eval();
        }
        
        top->clk = 1;
        top->rst = 0;
        vbdBar(top->a0 & 0xFF);
        
        if(Verilated::gotFinish()) exit(0);
    }

    // housekeeping
    vbdClose();
    tfp->close();
    exit(0);
}
