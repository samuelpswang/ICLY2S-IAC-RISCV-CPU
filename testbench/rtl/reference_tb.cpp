#include "Vrtl.h"
#include "verilated.h"
#include "verilated_vcd_c.h"
#include "vbuddy.cpp"

int main(int argc, char **argv, char **env){
    // init variables
    int clk;

    // init verilog instance
    Verilated::commandArgs(argc,argv);
    Vrtl* top = new Vrtl;

    // init trace
    Verilated::traceEverOn(true);
    VerilatedVcdC* tfp = new VerilatedVcdC;
    top->trace(tfp,99);
    tfp->open("Vrtl.vcd");

    // init vbuddy
    if (vbdOpen() != 1) return 1;
    vbdHeader("PDF Plot");

    // initial variable state
    top->clk = 1;
    top->rst = 0;

    // run simulation for many clock cycles
    for (int i = 0; i < 2000000; i++) { // note: triangle waveform required more cycles
        for(clk=0;clk<2;clk++){
            // in ps
            tfp->dump (2*i+clk);
            // falling edge
            top->clk = !top->clk;
            top->eval ();
        }

        if (i > 1000000) {
            int val = int(top->a0);
            if (val) vbdPlot(int(top->a0), 0, 256);
        }
        if (Verilated::gotFinish()) exit(0);
    }

    // housekeeping
    vbdClose();
    tfp->close();
    exit(0);
}
