// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VRISCV.h for the primary calling header

#include "verilated.h"

#include "VRISCV__Syms.h"
#include "VRISCV___024root.h"

void VRISCV___024root___ctor_var_reset(VRISCV___024root* vlSelf);

VRISCV___024root::VRISCV___024root(VRISCV__Syms* symsp, const char* name)
    : VerilatedModule{name}
    , vlSymsp{symsp}
 {
    // Reset structure values
    VRISCV___024root___ctor_var_reset(this);
}

void VRISCV___024root::__Vconfigure(bool first) {
    if (false && first) {}  // Prevent unused
}

VRISCV___024root::~VRISCV___024root() {
}
