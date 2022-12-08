// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "VRISCV__Syms.h"


void VRISCV___024root__trace_chg_sub_0(VRISCV___024root* vlSelf, VerilatedVcd::Buffer* bufp);

void VRISCV___024root__trace_chg_top_0(void* voidSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VRISCV___024root__trace_chg_top_0\n"); );
    // Init
    VRISCV___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<VRISCV___024root*>(voidSelf);
    VRISCV__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (VL_UNLIKELY(!vlSymsp->__Vm_activity)) return;
    // Body
    VRISCV___024root__trace_chg_sub_0((&vlSymsp->TOP), bufp);
}

void VRISCV___024root__trace_chg_sub_0(VRISCV___024root* vlSelf, VerilatedVcd::Buffer* bufp) {
    if (false && vlSelf) {}  // Prevent unused
    VRISCV__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VRISCV___024root__trace_chg_sub_0\n"); );
    // Init
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode + 1);
    // Body
    if (VL_UNLIKELY(vlSelf->__Vm_traceActivity[1U])) {
        bufp->chgIData(oldp+0,(vlSelf->RISCV__DOT__ImmOp),32);
        bufp->chgIData(oldp+1,(vlSelf->RISCV__DOT__pc),32);
        bufp->chgIData(oldp+2,(((IData)(vlSelf->RISCV__DOT__Jump)
                                 ? ((IData)(vlSelf->RISCV__DOT__Branch)
                                     ? vlSelf->RISCV__DOT__SUM
                                     : vlSelf->RISCV__DOT__ImmOp)
                                 : ((IData)(vlSelf->RISCV__DOT__Branch)
                                     ? vlSelf->RISCV__DOT__ImmOp
                                     : 0U))),32);
        bufp->chgIData(oldp+3,(vlSelf->RISCV__DOT__Instruction),32);
        bufp->chgCData(oldp+4,((0x7fU & vlSelf->RISCV__DOT__Instruction)),7);
        bufp->chgCData(oldp+5,((7U & (vlSelf->RISCV__DOT__Instruction 
                                      >> 0xcU))),3);
        bufp->chgCData(oldp+6,((vlSelf->RISCV__DOT__Instruction 
                                >> 0x19U)),7);
        bufp->chgBit(oldp+7,(vlSelf->RISCV__DOT__RegWrite));
        bufp->chgCData(oldp+8,(vlSelf->RISCV__DOT__ResultSrc),2);
        bufp->chgBit(oldp+9,((IData)((0x23U == (0x7fU 
                                                & vlSelf->RISCV__DOT__Instruction)))));
        bufp->chgBit(oldp+10,(vlSelf->RISCV__DOT__Jump));
        bufp->chgBit(oldp+11,(vlSelf->RISCV__DOT__Branch));
        bufp->chgCData(oldp+12,(vlSelf->RISCV__DOT__ALUControl),4);
        bufp->chgBit(oldp+13,(vlSelf->RISCV__DOT__ALUSrc));
        bufp->chgCData(oldp+14,(vlSelf->RISCV__DOT__ImmSrc),2);
        bufp->chgCData(oldp+15,((0x1fU & (vlSelf->RISCV__DOT__Instruction 
                                          >> 0xfU))),5);
        bufp->chgCData(oldp+16,((0x1fU & (vlSelf->RISCV__DOT__Instruction 
                                          >> 0x14U))),5);
        bufp->chgCData(oldp+17,((0x1fU & (vlSelf->RISCV__DOT__Instruction 
                                          >> 7U))),5);
        bufp->chgIData(oldp+18,(((2U & (IData)(vlSelf->RISCV__DOT__ResultSrc))
                                  ? ((1U & (IData)(vlSelf->RISCV__DOT__ResultSrc))
                                      ? vlSelf->RISCV__DOT__SUM
                                      : ((IData)(4U) 
                                         + vlSelf->RISCV__DOT__pc))
                                  : ((1U & (IData)(vlSelf->RISCV__DOT__ResultSrc))
                                      ? vlSelf->RISCV__DOT__data_memory__DOT__mem_data
                                     [(0xfffU & vlSelf->RISCV__DOT__SUM)]
                                      : vlSelf->RISCV__DOT__SUM))),32);
        bufp->chgIData(oldp+19,(vlSelf->RISCV__DOT__SUM),32);
        bufp->chgIData(oldp+20,(vlSelf->RISCV__DOT__RD1),32);
        bufp->chgIData(oldp+21,(vlSelf->RISCV__DOT__RD2),32);
        bufp->chgIData(oldp+22,((vlSelf->RISCV__DOT__Instruction 
                                 >> 7U)),25);
        bufp->chgBit(oldp+23,((vlSelf->RISCV__DOT__RD1 
                               == vlSelf->RISCV__DOT__ALU__DOT__ALUop2)));
        bufp->chgIData(oldp+24,(vlSelf->RISCV__DOT__data_memory__DOT__mem_data
                                [(0xfffU & vlSelf->RISCV__DOT__SUM)]),32);
        bufp->chgIData(oldp+25,(vlSelf->RISCV__DOT__ALU__DOT__ALUop2),32);
        bufp->chgIData(oldp+26,((vlSelf->RISCV__DOT__RD1 
                                 + vlSelf->RISCV__DOT__ALU__DOT__ALUop2)),32);
        bufp->chgBit(oldp+27,((((IData)(vlSelf->RISCV__DOT__Branch) 
                                & (vlSelf->RISCV__DOT__RD1 
                                   != vlSelf->RISCV__DOT__ALU__DOT__ALUop2)) 
                               | (IData)(vlSelf->RISCV__DOT__Jump))));
        bufp->chgIData(oldp+28,(((((IData)(vlSelf->RISCV__DOT__Branch) 
                                   & (vlSelf->RISCV__DOT__RD1 
                                      != vlSelf->RISCV__DOT__ALU__DOT__ALUop2)) 
                                  | (IData)(vlSelf->RISCV__DOT__Jump))
                                  ? (vlSelf->RISCV__DOT__pc 
                                     + ((IData)(vlSelf->RISCV__DOT__Jump)
                                         ? ((IData)(vlSelf->RISCV__DOT__Branch)
                                             ? vlSelf->RISCV__DOT__SUM
                                             : vlSelf->RISCV__DOT__ImmOp)
                                         : ((IData)(vlSelf->RISCV__DOT__Branch)
                                             ? vlSelf->RISCV__DOT__ImmOp
                                             : 0U)))
                                  : ((IData)(4U) + vlSelf->RISCV__DOT__pc))),32);
        bufp->chgSData(oldp+29,((0xfffU & vlSelf->RISCV__DOT__SUM)),12);
        bufp->chgIData(oldp+30,(vlSelf->RISCV__DOT__register__DOT__reg_data[0]),32);
        bufp->chgIData(oldp+31,(vlSelf->RISCV__DOT__register__DOT__reg_data[1]),32);
        bufp->chgIData(oldp+32,(vlSelf->RISCV__DOT__register__DOT__reg_data[2]),32);
        bufp->chgIData(oldp+33,(vlSelf->RISCV__DOT__register__DOT__reg_data[3]),32);
        bufp->chgIData(oldp+34,(vlSelf->RISCV__DOT__register__DOT__reg_data[4]),32);
        bufp->chgIData(oldp+35,(vlSelf->RISCV__DOT__register__DOT__reg_data[5]),32);
        bufp->chgIData(oldp+36,(vlSelf->RISCV__DOT__register__DOT__reg_data[6]),32);
        bufp->chgIData(oldp+37,(vlSelf->RISCV__DOT__register__DOT__reg_data[7]),32);
        bufp->chgIData(oldp+38,(vlSelf->RISCV__DOT__register__DOT__reg_data[8]),32);
        bufp->chgIData(oldp+39,(vlSelf->RISCV__DOT__register__DOT__reg_data[9]),32);
        bufp->chgIData(oldp+40,(vlSelf->RISCV__DOT__register__DOT__reg_data[10]),32);
        bufp->chgIData(oldp+41,(vlSelf->RISCV__DOT__register__DOT__reg_data[11]),32);
        bufp->chgIData(oldp+42,(vlSelf->RISCV__DOT__register__DOT__reg_data[12]),32);
        bufp->chgIData(oldp+43,(vlSelf->RISCV__DOT__register__DOT__reg_data[13]),32);
        bufp->chgIData(oldp+44,(vlSelf->RISCV__DOT__register__DOT__reg_data[14]),32);
        bufp->chgIData(oldp+45,(vlSelf->RISCV__DOT__register__DOT__reg_data[15]),32);
        bufp->chgIData(oldp+46,(vlSelf->RISCV__DOT__register__DOT__reg_data[16]),32);
        bufp->chgIData(oldp+47,(vlSelf->RISCV__DOT__register__DOT__reg_data[17]),32);
        bufp->chgIData(oldp+48,(vlSelf->RISCV__DOT__register__DOT__reg_data[18]),32);
        bufp->chgIData(oldp+49,(vlSelf->RISCV__DOT__register__DOT__reg_data[19]),32);
        bufp->chgIData(oldp+50,(vlSelf->RISCV__DOT__register__DOT__reg_data[20]),32);
        bufp->chgIData(oldp+51,(vlSelf->RISCV__DOT__register__DOT__reg_data[21]),32);
        bufp->chgIData(oldp+52,(vlSelf->RISCV__DOT__register__DOT__reg_data[22]),32);
        bufp->chgIData(oldp+53,(vlSelf->RISCV__DOT__register__DOT__reg_data[23]),32);
        bufp->chgIData(oldp+54,(vlSelf->RISCV__DOT__register__DOT__reg_data[24]),32);
        bufp->chgIData(oldp+55,(vlSelf->RISCV__DOT__register__DOT__reg_data[25]),32);
        bufp->chgIData(oldp+56,(vlSelf->RISCV__DOT__register__DOT__reg_data[26]),32);
        bufp->chgIData(oldp+57,(vlSelf->RISCV__DOT__register__DOT__reg_data[27]),32);
        bufp->chgIData(oldp+58,(vlSelf->RISCV__DOT__register__DOT__reg_data[28]),32);
        bufp->chgIData(oldp+59,(vlSelf->RISCV__DOT__register__DOT__reg_data[29]),32);
        bufp->chgIData(oldp+60,(vlSelf->RISCV__DOT__register__DOT__reg_data[30]),32);
        bufp->chgIData(oldp+61,(vlSelf->RISCV__DOT__register__DOT__reg_data[31]),32);
    }
    bufp->chgBit(oldp+62,(vlSelf->rst));
    bufp->chgBit(oldp+63,(vlSelf->clk));
    bufp->chgIData(oldp+64,(vlSelf->a0),32);
}

void VRISCV___024root__trace_cleanup(void* voidSelf, VerilatedVcd* /*unused*/) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VRISCV___024root__trace_cleanup\n"); );
    // Init
    VRISCV___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<VRISCV___024root*>(voidSelf);
    VRISCV__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    vlSymsp->__Vm_activity = false;
    vlSymsp->TOP.__Vm_traceActivity[0U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[1U] = 0U;
}
