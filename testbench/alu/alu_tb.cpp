#include "Valu_top.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

int main(int argc, char **argv, char **env){
    int it;
    int clk;
    Verilated::commandArgs(argc,argv);
//  initialise top verilog instance
    Valu_top* top = new Valu_top;
// initialise trace dump
    Verilated::traceEverOn(true);
    VerilatedVcdC* tfp = new VerilatedVcdC;
    top->trace(tfp,99);
    tfp->open("Valu_top.vcd");

    // initialise simulation outputs
    top->clk =1;
    top->ALUsrc = 1;
    top->ALUctrl = 0b1001;
    top->ImmOp = 0b1111;
    top->Instr = 0x3e808067;
    top->RegWrite = 1;

    // run simulation for many clock cycles
    int tick = 0;
    for(int i=0;i< 300; i++){
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
        top->ALUsrc = 0;
        top->ALUctrl = 0b1001;
        top->ImmOp = 0b1111;
        top->Instr = 0x3e808067;
        top-> RegWrite = 0;
        if(Verilated::gotFinish()) exit(0);
        
    }
    tfp->close();
    exit(0);

}
