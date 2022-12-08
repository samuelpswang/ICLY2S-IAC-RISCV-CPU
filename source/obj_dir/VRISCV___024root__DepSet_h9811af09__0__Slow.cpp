// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VRISCV.h for the primary calling header

#include "verilated.h"

#include "VRISCV___024root.h"

VL_ATTR_COLD void VRISCV___024root___initial__TOP__0(VRISCV___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VRISCV__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VRISCV___024root___initial__TOP__0\n"); );
    // Init
    VlWide<7>/*223:0*/ __Vtemp_h5a2690f6__0;
    // Body
    VL_WRITEF("[DUT] Load instr_mem from f1_branch.mem file.\n");
    __Vtemp_h5a2690f6__0[0U] = 0x2e6d656dU;
    __Vtemp_h5a2690f6__0[1U] = 0x745f7636U;
    __Vtemp_h5a2690f6__0[2U] = 0x2f746573U;
    __Vtemp_h5a2690f6__0[3U] = 0x6d2f6631U;
    __Vtemp_h5a2690f6__0[4U] = 0x6f677261U;
    __Vtemp_h5a2690f6__0[5U] = 0x2e2f7072U;
    __Vtemp_h5a2690f6__0[6U] = 0x2eU;
    VL_READMEM_N(true, 32, 256, 0, VL_CVT_PACK_STR_NW(7, __Vtemp_h5a2690f6__0)
                 ,  &(vlSelf->RISCV__DOT__instr_mem__DOT__instr_data)
                 , 0, ~0ULL);
}

VL_ATTR_COLD void VRISCV___024root___settle__TOP__0(VRISCV___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VRISCV__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VRISCV___024root___settle__TOP__0\n"); );
    // Body
    vlSelf->a0 = vlSelf->RISCV__DOT__register__DOT__reg_data
        [0xaU];
    vlSelf->RISCV__DOT__Instruction = vlSelf->RISCV__DOT__instr_mem__DOT__instr_data
        [(0xffU & (vlSelf->RISCV__DOT__pc >> 2U))];
    if ((0x40U & vlSelf->RISCV__DOT__Instruction)) {
        if ((0x20U & vlSelf->RISCV__DOT__Instruction)) {
            if ((0x10U & vlSelf->RISCV__DOT__Instruction)) {
                vlSelf->RISCV__DOT__ResultSrc = 0U;
                vlSelf->RISCV__DOT__ALUControl = 0xfU;
                vlSelf->RISCV__DOT__ImmSrc = 3U;
            } else if ((8U & vlSelf->RISCV__DOT__Instruction)) {
                if ((4U & vlSelf->RISCV__DOT__Instruction)) {
                    if ((2U & vlSelf->RISCV__DOT__Instruction)) {
                        if ((1U & vlSelf->RISCV__DOT__Instruction)) {
                            vlSelf->RISCV__DOT__ResultSrc = 2U;
                            vlSelf->RISCV__DOT__ALUControl = 0U;
                        } else {
                            vlSelf->RISCV__DOT__ResultSrc = 0U;
                            vlSelf->RISCV__DOT__ALUControl = 0xfU;
                        }
                    } else {
                        vlSelf->RISCV__DOT__ResultSrc = 0U;
                        vlSelf->RISCV__DOT__ALUControl = 0xfU;
                    }
                } else {
                    vlSelf->RISCV__DOT__ResultSrc = 0U;
                    vlSelf->RISCV__DOT__ALUControl = 0xfU;
                }
                vlSelf->RISCV__DOT__ImmSrc = 3U;
            } else if ((4U & vlSelf->RISCV__DOT__Instruction)) {
                if ((2U & vlSelf->RISCV__DOT__Instruction)) {
                    if ((1U & vlSelf->RISCV__DOT__Instruction)) {
                        vlSelf->RISCV__DOT__ResultSrc = 2U;
                        vlSelf->RISCV__DOT__ALUControl = 9U;
                        vlSelf->RISCV__DOT__ImmSrc = 0U;
                    } else {
                        vlSelf->RISCV__DOT__ResultSrc = 0U;
                        vlSelf->RISCV__DOT__ALUControl = 0xfU;
                        vlSelf->RISCV__DOT__ImmSrc = 3U;
                    }
                } else {
                    vlSelf->RISCV__DOT__ResultSrc = 0U;
                    vlSelf->RISCV__DOT__ALUControl = 0xfU;
                    vlSelf->RISCV__DOT__ImmSrc = 3U;
                }
            } else {
                vlSelf->RISCV__DOT__ResultSrc = 0U;
                if ((2U & vlSelf->RISCV__DOT__Instruction)) {
                    if ((1U & vlSelf->RISCV__DOT__Instruction)) {
                        vlSelf->RISCV__DOT__ALUControl 
                            = ((1U == (7U & (vlSelf->RISCV__DOT__Instruction 
                                             >> 0xcU)))
                                ? 1U : 0xfU);
                        vlSelf->RISCV__DOT__ImmSrc = 1U;
                    } else {
                        vlSelf->RISCV__DOT__ALUControl = 0xfU;
                        vlSelf->RISCV__DOT__ImmSrc = 3U;
                    }
                } else {
                    vlSelf->RISCV__DOT__ALUControl = 0xfU;
                    vlSelf->RISCV__DOT__ImmSrc = 3U;
                }
            }
        } else {
            vlSelf->RISCV__DOT__ResultSrc = 0U;
            vlSelf->RISCV__DOT__ALUControl = 0xfU;
            vlSelf->RISCV__DOT__ImmSrc = 3U;
        }
        vlSelf->RISCV__DOT__RegWrite = (1U & (IData)(
                                                     ((0x20U 
                                                       == 
                                                       (0x30U 
                                                        & vlSelf->RISCV__DOT__Instruction)) 
                                                      & ((8U 
                                                          & vlSelf->RISCV__DOT__Instruction)
                                                          ? (IData)(
                                                                    (7U 
                                                                     == 
                                                                     (7U 
                                                                      & vlSelf->RISCV__DOT__Instruction)))
                                                          : (IData)(
                                                                    (7U 
                                                                     == 
                                                                     (7U 
                                                                      & vlSelf->RISCV__DOT__Instruction)))))));
        vlSelf->RISCV__DOT__ALUSrc = (1U & (IData)(
                                                   ((0x20U 
                                                     == 
                                                     (0x30U 
                                                      & vlSelf->RISCV__DOT__Instruction)) 
                                                    & ((8U 
                                                        & vlSelf->RISCV__DOT__Instruction)
                                                        ? (IData)(
                                                                  (7U 
                                                                   == 
                                                                   (7U 
                                                                    & vlSelf->RISCV__DOT__Instruction)))
                                                        : (IData)(
                                                                  (7U 
                                                                   == 
                                                                   (7U 
                                                                    & vlSelf->RISCV__DOT__Instruction)))))));
    } else if ((0x20U & vlSelf->RISCV__DOT__Instruction)) {
        vlSelf->RISCV__DOT__ResultSrc = 0U;
        vlSelf->RISCV__DOT__RegWrite = (1U & (IData)(
                                                     (0x13U 
                                                      == 
                                                      (0x1fU 
                                                       & vlSelf->RISCV__DOT__Instruction))));
        if ((0x10U & vlSelf->RISCV__DOT__Instruction)) {
            vlSelf->RISCV__DOT__ALUControl = ((8U & vlSelf->RISCV__DOT__Instruction)
                                               ? 0xfU
                                               : ((4U 
                                                   & vlSelf->RISCV__DOT__Instruction)
                                                   ? 0xfU
                                                   : 
                                                  ((2U 
                                                    & vlSelf->RISCV__DOT__Instruction)
                                                    ? 
                                                   ((1U 
                                                     & vlSelf->RISCV__DOT__Instruction)
                                                     ? 
                                                    ((IData)(
                                                             (0U 
                                                              == 
                                                              (0xfe007000U 
                                                               & vlSelf->RISCV__DOT__Instruction)))
                                                      ? 0U
                                                      : 
                                                     ((IData)(
                                                              (0x4000U 
                                                               == 
                                                               (0xfe007000U 
                                                                & vlSelf->RISCV__DOT__Instruction)))
                                                       ? 4U
                                                       : 0xfU))
                                                     : 0xfU)
                                                    : 0xfU)));
            vlSelf->RISCV__DOT__ImmSrc = 3U;
        } else if ((8U & vlSelf->RISCV__DOT__Instruction)) {
            vlSelf->RISCV__DOT__ALUControl = 0xfU;
            vlSelf->RISCV__DOT__ImmSrc = 3U;
        } else if ((4U & vlSelf->RISCV__DOT__Instruction)) {
            vlSelf->RISCV__DOT__ALUControl = 0xfU;
            vlSelf->RISCV__DOT__ImmSrc = 3U;
        } else if ((2U & vlSelf->RISCV__DOT__Instruction)) {
            if ((1U & vlSelf->RISCV__DOT__Instruction)) {
                vlSelf->RISCV__DOT__ALUControl = 0U;
                vlSelf->RISCV__DOT__ImmSrc = 2U;
            } else {
                vlSelf->RISCV__DOT__ALUControl = 0xfU;
                vlSelf->RISCV__DOT__ImmSrc = 3U;
            }
        } else {
            vlSelf->RISCV__DOT__ALUControl = 0xfU;
            vlSelf->RISCV__DOT__ImmSrc = 3U;
        }
        vlSelf->RISCV__DOT__ALUSrc = (1U & (IData)(
                                                   (3U 
                                                    == 
                                                    (0x1fU 
                                                     & vlSelf->RISCV__DOT__Instruction))));
    } else if ((0x10U & vlSelf->RISCV__DOT__Instruction)) {
        vlSelf->RISCV__DOT__ResultSrc = 0U;
        vlSelf->RISCV__DOT__RegWrite = (1U & (IData)(
                                                     (3U 
                                                      == 
                                                      (0xfU 
                                                       & vlSelf->RISCV__DOT__Instruction))));
        if ((8U & vlSelf->RISCV__DOT__Instruction)) {
            vlSelf->RISCV__DOT__ALUControl = 0xfU;
            vlSelf->RISCV__DOT__ImmSrc = 3U;
        } else if ((4U & vlSelf->RISCV__DOT__Instruction)) {
            vlSelf->RISCV__DOT__ALUControl = 0xfU;
            vlSelf->RISCV__DOT__ImmSrc = 3U;
        } else if ((2U & vlSelf->RISCV__DOT__Instruction)) {
            if ((1U & vlSelf->RISCV__DOT__Instruction)) {
                vlSelf->RISCV__DOT__ALUControl = ((0U 
                                                   == 
                                                   (7U 
                                                    & (vlSelf->RISCV__DOT__Instruction 
                                                       >> 0xcU)))
                                                   ? 0U
                                                   : 
                                                  ((IData)(
                                                           (0x1000U 
                                                            == 
                                                            (0xfe007000U 
                                                             & vlSelf->RISCV__DOT__Instruction)))
                                                    ? 6U
                                                    : 0xfU));
                vlSelf->RISCV__DOT__ImmSrc = 0U;
            } else {
                vlSelf->RISCV__DOT__ALUControl = 0xfU;
                vlSelf->RISCV__DOT__ImmSrc = 3U;
            }
        } else {
            vlSelf->RISCV__DOT__ALUControl = 0xfU;
            vlSelf->RISCV__DOT__ImmSrc = 3U;
        }
        vlSelf->RISCV__DOT__ALUSrc = (1U & (IData)(
                                                   (3U 
                                                    == 
                                                    (0xfU 
                                                     & vlSelf->RISCV__DOT__Instruction))));
    } else {
        if ((8U & vlSelf->RISCV__DOT__Instruction)) {
            vlSelf->RISCV__DOT__ResultSrc = 0U;
            vlSelf->RISCV__DOT__ALUControl = 0xfU;
            vlSelf->RISCV__DOT__ImmSrc = 3U;
        } else if ((4U & vlSelf->RISCV__DOT__Instruction)) {
            vlSelf->RISCV__DOT__ResultSrc = 0U;
            vlSelf->RISCV__DOT__ALUControl = 0xfU;
            vlSelf->RISCV__DOT__ImmSrc = 3U;
        } else if ((2U & vlSelf->RISCV__DOT__Instruction)) {
            if ((1U & vlSelf->RISCV__DOT__Instruction)) {
                vlSelf->RISCV__DOT__ResultSrc = 1U;
                vlSelf->RISCV__DOT__ALUControl = 0U;
                vlSelf->RISCV__DOT__ImmSrc = 0U;
            } else {
                vlSelf->RISCV__DOT__ResultSrc = 0U;
                vlSelf->RISCV__DOT__ALUControl = 0xfU;
                vlSelf->RISCV__DOT__ImmSrc = 3U;
            }
        } else {
            vlSelf->RISCV__DOT__ResultSrc = 0U;
            vlSelf->RISCV__DOT__ALUControl = 0xfU;
            vlSelf->RISCV__DOT__ImmSrc = 3U;
        }
        vlSelf->RISCV__DOT__RegWrite = (1U & (IData)(
                                                     (3U 
                                                      == 
                                                      (0xfU 
                                                       & vlSelf->RISCV__DOT__Instruction))));
        vlSelf->RISCV__DOT__ALUSrc = (1U & (IData)(
                                                   (3U 
                                                    == 
                                                    (0xfU 
                                                     & vlSelf->RISCV__DOT__Instruction))));
    }
    vlSelf->RISCV__DOT__Jump = (1U & (IData)(((0x60U 
                                               == (0x70U 
                                                   & vlSelf->RISCV__DOT__Instruction)) 
                                              & ((8U 
                                                  & vlSelf->RISCV__DOT__Instruction)
                                                  ? (IData)(
                                                            (7U 
                                                             == 
                                                             (7U 
                                                              & vlSelf->RISCV__DOT__Instruction)))
                                                  : (IData)(
                                                            (7U 
                                                             == 
                                                             (7U 
                                                              & vlSelf->RISCV__DOT__Instruction)))))));
    vlSelf->RISCV__DOT__Branch = (1U & (IData)(((0x60U 
                                                 == 
                                                 (0x78U 
                                                  & vlSelf->RISCV__DOT__Instruction)) 
                                                & ((4U 
                                                    & vlSelf->RISCV__DOT__Instruction)
                                                    ? 
                                                   ((vlSelf->RISCV__DOT__Instruction 
                                                     >> 1U) 
                                                    & vlSelf->RISCV__DOT__Instruction)
                                                    : 
                                                   ((vlSelf->RISCV__DOT__Instruction 
                                                     >> 1U) 
                                                    & vlSelf->RISCV__DOT__Instruction)))));
    vlSelf->RISCV__DOT__RD1 = vlSelf->RISCV__DOT__register__DOT__reg_data
        [(0x1fU & (vlSelf->RISCV__DOT__Instruction 
                   >> 0xfU))];
    vlSelf->RISCV__DOT__RD2 = vlSelf->RISCV__DOT__register__DOT__reg_data
        [(0x1fU & (vlSelf->RISCV__DOT__Instruction 
                   >> 0x14U))];
    if ((0U == (IData)(vlSelf->RISCV__DOT__ImmSrc))) {
        vlSelf->RISCV__DOT__ImmOp = (((- (IData)((vlSelf->RISCV__DOT__Instruction 
                                                  >> 0x1fU))) 
                                      << 0xcU) | (vlSelf->RISCV__DOT__Instruction 
                                                  >> 0x14U));
    } else if ((1U == (IData)(vlSelf->RISCV__DOT__ImmSrc))) {
        vlSelf->RISCV__DOT__ImmOp = (((- (IData)((vlSelf->RISCV__DOT__Instruction 
                                                  >> 0x1fU))) 
                                      << 0xdU) | ((0x1000U 
                                                   & (vlSelf->RISCV__DOT__Instruction 
                                                      >> 0x13U)) 
                                                  | ((0x800U 
                                                      & (vlSelf->RISCV__DOT__Instruction 
                                                         << 4U)) 
                                                     | ((0x7e0U 
                                                         & (vlSelf->RISCV__DOT__Instruction 
                                                            >> 0x14U)) 
                                                        | (0x1eU 
                                                           & (vlSelf->RISCV__DOT__Instruction 
                                                              >> 7U))))));
    } else if ((2U == (IData)(vlSelf->RISCV__DOT__ImmSrc))) {
        vlSelf->RISCV__DOT__ImmOp = (((- (IData)((vlSelf->RISCV__DOT__Instruction 
                                                  >> 0x1fU))) 
                                      << 0xcU) | ((0xfe0U 
                                                   & (vlSelf->RISCV__DOT__Instruction 
                                                      >> 0x14U)) 
                                                  | (0x1fU 
                                                     & (vlSelf->RISCV__DOT__Instruction 
                                                        >> 7U))));
    } else if ((3U == (IData)(vlSelf->RISCV__DOT__ImmSrc))) {
        vlSelf->RISCV__DOT__ImmOp = (((- (IData)((vlSelf->RISCV__DOT__Instruction 
                                                  >> 0x1fU))) 
                                      << 0x14U) | (
                                                   (0xff000U 
                                                    & vlSelf->RISCV__DOT__Instruction) 
                                                   | ((0x800U 
                                                       & (vlSelf->RISCV__DOT__Instruction 
                                                          >> 9U)) 
                                                      | (0x7feU 
                                                         & (vlSelf->RISCV__DOT__Instruction 
                                                            >> 0x14U)))));
    }
    vlSelf->RISCV__DOT__ALU__DOT__ALUop2 = ((IData)(vlSelf->RISCV__DOT__ALUSrc)
                                             ? vlSelf->RISCV__DOT__ImmOp
                                             : vlSelf->RISCV__DOT__RD2);
    vlSelf->RISCV__DOT__SUM = ((8U & (IData)(vlSelf->RISCV__DOT__ALUControl))
                                ? ((4U & (IData)(vlSelf->RISCV__DOT__ALUControl))
                                    ? 0U : ((2U & (IData)(vlSelf->RISCV__DOT__ALUControl))
                                             ? 0U : 
                                            ((1U & (IData)(vlSelf->RISCV__DOT__ALUControl))
                                              ? (0xfffffffeU 
                                                 & (vlSelf->RISCV__DOT__RD1 
                                                    + vlSelf->RISCV__DOT__ALU__DOT__ALUop2))
                                              : (vlSelf->RISCV__DOT__RD1 
                                                 >> 
                                                 (0x1fU 
                                                  & vlSelf->RISCV__DOT__ALU__DOT__ALUop2)))))
                                : ((4U & (IData)(vlSelf->RISCV__DOT__ALUControl))
                                    ? ((2U & (IData)(vlSelf->RISCV__DOT__ALUControl))
                                        ? ((1U & (IData)(vlSelf->RISCV__DOT__ALUControl))
                                            ? (vlSelf->RISCV__DOT__RD1 
                                               >> (0x1fU 
                                                   & vlSelf->RISCV__DOT__ALU__DOT__ALUop2))
                                            : (vlSelf->RISCV__DOT__RD1 
                                               << (0x1fU 
                                                   & vlSelf->RISCV__DOT__ALU__DOT__ALUop2)))
                                        : ((1U & (IData)(vlSelf->RISCV__DOT__ALUControl))
                                            ? VL_LTS_III(32, vlSelf->RISCV__DOT__RD1, vlSelf->RISCV__DOT__ALU__DOT__ALUop2)
                                            : (vlSelf->RISCV__DOT__RD1 
                                               ^ vlSelf->RISCV__DOT__ALU__DOT__ALUop2)))
                                    : ((2U & (IData)(vlSelf->RISCV__DOT__ALUControl))
                                        ? ((1U & (IData)(vlSelf->RISCV__DOT__ALUControl))
                                            ? (vlSelf->RISCV__DOT__RD1 
                                               | vlSelf->RISCV__DOT__ALU__DOT__ALUop2)
                                            : (vlSelf->RISCV__DOT__RD1 
                                               & vlSelf->RISCV__DOT__ALU__DOT__ALUop2))
                                        : ((1U & (IData)(vlSelf->RISCV__DOT__ALUControl))
                                            ? (vlSelf->RISCV__DOT__RD1 
                                               - vlSelf->RISCV__DOT__ALU__DOT__ALUop2)
                                            : (vlSelf->RISCV__DOT__RD1 
                                               + vlSelf->RISCV__DOT__ALU__DOT__ALUop2)))));
    vlSelf->RISCV__DOT__PC__DOT__next_pc = ((((IData)(vlSelf->RISCV__DOT__Branch) 
                                              & (vlSelf->RISCV__DOT__RD1 
                                                 != vlSelf->RISCV__DOT__ALU__DOT__ALUop2)) 
                                             | (IData)(vlSelf->RISCV__DOT__Jump))
                                             ? (vlSelf->RISCV__DOT__pc 
                                                + ((IData)(vlSelf->RISCV__DOT__Jump)
                                                    ? 
                                                   ((IData)(vlSelf->RISCV__DOT__Branch)
                                                     ? vlSelf->RISCV__DOT__SUM
                                                     : vlSelf->RISCV__DOT__ImmOp)
                                                    : 
                                                   ((IData)(vlSelf->RISCV__DOT__Branch)
                                                     ? vlSelf->RISCV__DOT__ImmOp
                                                     : 0U)))
                                             : ((IData)(4U) 
                                                + vlSelf->RISCV__DOT__pc));
}

VL_ATTR_COLD void VRISCV___024root___eval_initial(VRISCV___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VRISCV__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VRISCV___024root___eval_initial\n"); );
    // Body
    VRISCV___024root___initial__TOP__0(vlSelf);
    vlSelf->__Vclklast__TOP__clk = vlSelf->clk;
}

VL_ATTR_COLD void VRISCV___024root___eval_settle(VRISCV___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VRISCV__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VRISCV___024root___eval_settle\n"); );
    // Body
    VRISCV___024root___settle__TOP__0(vlSelf);
    vlSelf->__Vm_traceActivity[1U] = 1U;
    vlSelf->__Vm_traceActivity[0U] = 1U;
}

VL_ATTR_COLD void VRISCV___024root___final(VRISCV___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VRISCV__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VRISCV___024root___final\n"); );
}

VL_ATTR_COLD void VRISCV___024root___ctor_var_reset(VRISCV___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VRISCV__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VRISCV___024root___ctor_var_reset\n"); );
    // Body
    vlSelf->rst = VL_RAND_RESET_I(1);
    vlSelf->clk = VL_RAND_RESET_I(1);
    vlSelf->a0 = VL_RAND_RESET_I(32);
    vlSelf->RISCV__DOT__ImmOp = VL_RAND_RESET_I(32);
    vlSelf->RISCV__DOT__pc = VL_RAND_RESET_I(32);
    vlSelf->RISCV__DOT__Instruction = VL_RAND_RESET_I(32);
    vlSelf->RISCV__DOT__RegWrite = VL_RAND_RESET_I(1);
    vlSelf->RISCV__DOT__ResultSrc = VL_RAND_RESET_I(2);
    vlSelf->RISCV__DOT__Jump = VL_RAND_RESET_I(1);
    vlSelf->RISCV__DOT__Branch = VL_RAND_RESET_I(1);
    vlSelf->RISCV__DOT__ALUControl = VL_RAND_RESET_I(4);
    vlSelf->RISCV__DOT__ALUSrc = VL_RAND_RESET_I(1);
    vlSelf->RISCV__DOT__ImmSrc = VL_RAND_RESET_I(2);
    vlSelf->RISCV__DOT__SUM = VL_RAND_RESET_I(32);
    vlSelf->RISCV__DOT__RD1 = VL_RAND_RESET_I(32);
    vlSelf->RISCV__DOT__RD2 = VL_RAND_RESET_I(32);
    vlSelf->RISCV__DOT__PC__DOT__next_pc = VL_RAND_RESET_I(32);
    for (int __Vi0=0; __Vi0<256; ++__Vi0) {
        vlSelf->RISCV__DOT__instr_mem__DOT__instr_data[__Vi0] = VL_RAND_RESET_I(32);
    }
    for (int __Vi0=0; __Vi0<32; ++__Vi0) {
        vlSelf->RISCV__DOT__register__DOT__reg_data[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->RISCV__DOT__ALU__DOT__ALUop2 = VL_RAND_RESET_I(32);
    for (int __Vi0=0; __Vi0<4096; ++__Vi0) {
        vlSelf->RISCV__DOT__data_memory__DOT__mem_data[__Vi0] = VL_RAND_RESET_I(32);
    }
    for (int __Vi0=0; __Vi0<2; ++__Vi0) {
        vlSelf->__Vm_traceActivity[__Vi0] = VL_RAND_RESET_I(1);
    }
}
