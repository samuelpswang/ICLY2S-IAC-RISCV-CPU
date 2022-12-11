#include "Vrtl.h"
#include "verilated.h"
#include "verilated_vcd_c.h"
// #include"vbuddy.cpp"

int main(int argc, char **argv, char **env){
    int it;
    int clk;
    Verilated::commandArgs(argc,argv);
//  initialise top verilog instance
    Vrtl* top = new Vrtl;
// initialise trace dump
    Verilated::traceEverOn(true);
    VerilatedVcdC* tfp = new VerilatedVcdC;
    top->trace(tfp,99);
    tfp->open("Vrtl.vcd");
    // init Vbuddy
    // if (vbdOpen()!=1) return (-1);
    // vbdHeader("F1 Lights");
    // initialise simulation outputs
    top->clk =1;
    top->rst=0;


    // run simulation for many clock cycles
    int tick = 0;
    for(int i=0;i< 100000; i++){
        // Add to readme, remember to compelete part 2 of challenge
        // dump variables into VCD file and toggle clock
        for(clk=0;clk<2;clk++){
            // in ps
            tfp->dump (2*i+clk);
            // falling edge
            top->clk = !top->clk;
            top->eval ();
        }
        
        top->clk =1;
        top->rst=0;
        // if(i > 50000) vbdPlot(int(top->a0),0,255);
        // vbdCycle(i+1);
        
        if(Verilated::gotFinish()) exit(0);
        
    }
    // vbdClose();
    tfp->close();
    exit(0);

}
