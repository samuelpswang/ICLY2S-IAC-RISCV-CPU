#include "Vrtl.h"
#include "verilated.h"
#include "verilated_vcd_c.h"
#include "vbuddy.cpp"

int main(int argc, char **argv, char **env){
    // init variables
    int clk;
    bool complete = false;

    // init verilog instance
    Verilated::commandArgs(argc,argv);
    Vrtl* top = new Vrtl;

    // init trace
    Verilated::traceEverOn(true);
    VerilatedVcdC* tfp = new VerilatedVcdC;
    top->trace(tfp,99);
    tfp->open("Vrtl.vcd");

    // init vbuddy
    if (vbdOpen() != 1) exit(1);
    vbdHeader("PDF Plot");

    // initial variable state
    top->clk = 1;
    top->rst = 0;
    
    // run simulation for many clock cycles
    // note: triangle waveform required more cycles
    for (int i = 0; i < 2000000; i++) { 
        for (clk = 0; clk < 2; clk++) {
            tfp->dump(2*i+clk);
            top->clk = !top->clk;
            top->eval();
        }

        if (i > 800000) {
            if (int(top->a0)) complete = true; 
            if (complete) vbdPlot(int(top->a0), 0, 255);
        }
        if (Verilated::gotFinish()) exit(0);
    }

    // housekeeping
    vbdClose();
    tfp->close();
    exit(0);
}
