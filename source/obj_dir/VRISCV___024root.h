// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See VRISCV.h for the primary calling header

#ifndef VERILATED_VRISCV___024ROOT_H_
#define VERILATED_VRISCV___024ROOT_H_  // guard

#include "verilated.h"

class VRISCV__Syms;

class VRISCV___024root final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    VL_IN8(clk,0,0);
    VL_IN8(rst,0,0);
    CData/*0:0*/ RISCV__DOT__RegWrite;
    CData/*1:0*/ RISCV__DOT__ResultSrc;
    CData/*0:0*/ RISCV__DOT__Jump;
    CData/*0:0*/ RISCV__DOT__Branch;
    CData/*3:0*/ RISCV__DOT__ALUControl;
    CData/*0:0*/ RISCV__DOT__ALUSrc;
    CData/*1:0*/ RISCV__DOT__ImmSrc;
    CData/*0:0*/ __Vclklast__TOP__clk;
    VL_OUT(a0,31,0);
    IData/*31:0*/ RISCV__DOT__ImmOp;
    IData/*31:0*/ RISCV__DOT__pc;
    IData/*31:0*/ RISCV__DOT__Instruction;
    IData/*31:0*/ RISCV__DOT__SUM;
    IData/*31:0*/ RISCV__DOT__RD1;
    IData/*31:0*/ RISCV__DOT__RD2;
    IData/*31:0*/ RISCV__DOT__PC__DOT__next_pc;
    IData/*31:0*/ RISCV__DOT__ALU__DOT__ALUop2;
    VlUnpacked<IData/*31:0*/, 256> RISCV__DOT__instr_mem__DOT__instr_data;
    VlUnpacked<IData/*31:0*/, 32> RISCV__DOT__register__DOT__reg_data;
    VlUnpacked<IData/*31:0*/, 4096> RISCV__DOT__data_memory__DOT__mem_data;
    VlUnpacked<CData/*0:0*/, 2> __Vm_traceActivity;

    // INTERNAL VARIABLES
    VRISCV__Syms* const vlSymsp;

    // CONSTRUCTORS
    VRISCV___024root(VRISCV__Syms* symsp, const char* name);
    ~VRISCV___024root();
    VL_UNCOPYABLE(VRISCV___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);


#endif  // guard
