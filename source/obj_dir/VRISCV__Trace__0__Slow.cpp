// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "VRISCV__Syms.h"


VL_ATTR_COLD void VRISCV___024root__trace_init_sub__TOP__0(VRISCV___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VRISCV__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VRISCV___024root__trace_init_sub__TOP__0\n"); );
    // Init
    const int c = vlSymsp->__Vm_baseCode;
    // Body
    tracep->declBit(c+63,"rst", false,-1);
    tracep->declBit(c+64,"clk", false,-1);
    tracep->declBus(c+65,"a0", false,-1, 31,0);
    tracep->pushNamePrefix("RISCV ");
    tracep->declBus(c+66,"DATA_WIDTH", false,-1, 31,0);
    tracep->declBus(c+66,"ADDR_WIDTH", false,-1, 31,0);
    tracep->declBus(c+66,"IMMO_WIDTH", false,-1, 31,0);
    tracep->declBus(c+66,"INSTR_WIDTH", false,-1, 31,0);
    tracep->declBit(c+63,"rst", false,-1);
    tracep->declBit(c+64,"clk", false,-1);
    tracep->declBus(c+65,"a0", false,-1, 31,0);
    tracep->declBus(c+1,"ImmOp", false,-1, 31,0);
    tracep->declBus(c+2,"pc", false,-1, 31,0);
    tracep->declBus(c+3,"label", false,-1, 31,0);
    tracep->declBus(c+4,"Instruction", false,-1, 31,0);
    tracep->declBus(c+5,"op", false,-1, 6,0);
    tracep->declBus(c+6,"funct3", false,-1, 2,0);
    tracep->declBus(c+7,"funct7", false,-1, 6,0);
    tracep->declBit(c+8,"RegWrite", false,-1);
    tracep->declBus(c+9,"ResultSrc", false,-1, 1,0);
    tracep->declBit(c+10,"MemWrite", false,-1);
    tracep->declBit(c+11,"Jump", false,-1);
    tracep->declBit(c+12,"Branch", false,-1);
    tracep->declBus(c+13,"ALUControl", false,-1, 3,0);
    tracep->declBit(c+14,"ALUSrc", false,-1);
    tracep->declBus(c+15,"ImmSrc", false,-1, 1,0);
    tracep->declBus(c+16,"AD1", false,-1, 4,0);
    tracep->declBus(c+17,"AD2", false,-1, 4,0);
    tracep->declBus(c+18,"AD3", false,-1, 4,0);
    tracep->declBus(c+19,"WD3", false,-1, 31,0);
    tracep->declBus(c+20,"SUM", false,-1, 31,0);
    tracep->declBus(c+21,"RD1", false,-1, 31,0);
    tracep->declBus(c+22,"RD2", false,-1, 31,0);
    tracep->declBus(c+23,"Imm", false,-1, 31,7);
    tracep->declBit(c+24,"EQ", false,-1);
    tracep->declBus(c+25,"RD", false,-1, 31,0);
    tracep->pushNamePrefix("ALU ");
    tracep->declBit(c+14,"ALUsrc", false,-1);
    tracep->declBus(c+13,"ALUctrl", false,-1, 3,0);
    tracep->declBus(c+1,"ImmOp", false,-1, 31,0);
    tracep->declBus(c+21,"ALUop1", false,-1, 31,0);
    tracep->declBus(c+22,"regOp2", false,-1, 31,0);
    tracep->declBit(c+24,"EQ", false,-1);
    tracep->declBus(c+20,"SUM", false,-1, 31,0);
    tracep->declBus(c+26,"ALUop2", false,-1, 31,0);
    tracep->declBus(c+27,"JALR_INTERMEDIATE", false,-1, 31,0);
    tracep->popNamePrefix(1);
    tracep->pushNamePrefix("PC ");
    tracep->declBus(c+66,"ADDR_WIDTH", false,-1, 31,0);
    tracep->declBus(c+66,"IMMO_WIDTH", false,-1, 31,0);
    tracep->declBit(c+64,"clk", false,-1);
    tracep->declBit(c+63,"rst", false,-1);
    tracep->declBit(c+28,"PCsrc", false,-1);
    tracep->declBus(c+3,"label", false,-1, 31,0);
    tracep->declBus(c+2,"pc", false,-1, 31,0);
    tracep->declBus(c+29,"next_pc", false,-1, 31,0);
    tracep->popNamePrefix(1);
    tracep->pushNamePrefix("control_unit ");
    tracep->declBus(c+5,"op", false,-1, 6,0);
    tracep->declBus(c+6,"funct3", false,-1, 2,0);
    tracep->declBus(c+7,"funct7", false,-1, 6,0);
    tracep->declBit(c+8,"RegWrite", false,-1);
    tracep->declBus(c+9,"ResultSrc", false,-1, 1,0);
    tracep->declBit(c+10,"MemWrite", false,-1);
    tracep->declBit(c+11,"Jump", false,-1);
    tracep->declBit(c+12,"Branch", false,-1);
    tracep->declBus(c+13,"ALUControl", false,-1, 3,0);
    tracep->declBit(c+14,"ALUSrc", false,-1);
    tracep->declBus(c+15,"ImmSrc", false,-1, 1,0);
    tracep->popNamePrefix(1);
    tracep->pushNamePrefix("data_memory ");
    tracep->declBit(c+64,"clk", false,-1);
    tracep->declBus(c+20,"A", false,-1, 31,0);
    tracep->declBit(c+10,"WE", false,-1);
    tracep->declBus(c+22,"WD", false,-1, 31,0);
    tracep->declBus(c+25,"RD", false,-1, 31,0);
    tracep->declBus(c+30,"AD", false,-1, 11,0);
    tracep->popNamePrefix(1);
    tracep->pushNamePrefix("instr_mem ");
    tracep->declBus(c+66,"INSTR_WIDTH", false,-1, 31,0);
    tracep->declBus(c+66,"ADDR_WIDTH", false,-1, 31,0);
    tracep->declBus(c+2,"A", false,-1, 31,0);
    tracep->declBus(c+4,"RD", false,-1, 31,0);
    tracep->popNamePrefix(1);
    tracep->pushNamePrefix("register ");
    tracep->declBus(c+66,"DATA_WIDTH", false,-1, 31,0);
    tracep->declBus(c+67,"ADDR_WIDTH", false,-1, 31,0);
    tracep->declBit(c+64,"clk", false,-1);
    tracep->declBus(c+16,"AD1", false,-1, 4,0);
    tracep->declBus(c+17,"AD2", false,-1, 4,0);
    tracep->declBus(c+18,"AD3", false,-1, 4,0);
    tracep->declBit(c+8,"WE3", false,-1);
    tracep->declBus(c+19,"WD3", false,-1, 31,0);
    tracep->declBus(c+21,"RD1", false,-1, 31,0);
    tracep->declBus(c+22,"RD2", false,-1, 31,0);
    tracep->declBus(c+65,"a0", false,-1, 31,0);
    for (int i = 0; i < 32; ++i) {
        tracep->declBus(c+31+i*1,"reg_data", true,(i+0), 31,0);
    }
    tracep->popNamePrefix(1);
    tracep->pushNamePrefix("sign_extend ");
    tracep->declBus(c+23,"Instr", false,-1, 31,7);
    tracep->declBus(c+15,"ImmSrc", false,-1, 1,0);
    tracep->declBus(c+1,"ImmExt", false,-1, 31,0);
    tracep->popNamePrefix(2);
}

VL_ATTR_COLD void VRISCV___024root__trace_init_top(VRISCV___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VRISCV__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VRISCV___024root__trace_init_top\n"); );
    // Body
    VRISCV___024root__trace_init_sub__TOP__0(vlSelf, tracep);
}

VL_ATTR_COLD void VRISCV___024root__trace_full_top_0(void* voidSelf, VerilatedVcd::Buffer* bufp);
void VRISCV___024root__trace_chg_top_0(void* voidSelf, VerilatedVcd::Buffer* bufp);
void VRISCV___024root__trace_cleanup(void* voidSelf, VerilatedVcd* /*unused*/);

VL_ATTR_COLD void VRISCV___024root__trace_register(VRISCV___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VRISCV__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VRISCV___024root__trace_register\n"); );
    // Body
    tracep->addFullCb(&VRISCV___024root__trace_full_top_0, vlSelf);
    tracep->addChgCb(&VRISCV___024root__trace_chg_top_0, vlSelf);
    tracep->addCleanupCb(&VRISCV___024root__trace_cleanup, vlSelf);
}

VL_ATTR_COLD void VRISCV___024root__trace_full_sub_0(VRISCV___024root* vlSelf, VerilatedVcd::Buffer* bufp);

VL_ATTR_COLD void VRISCV___024root__trace_full_top_0(void* voidSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VRISCV___024root__trace_full_top_0\n"); );
    // Init
    VRISCV___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<VRISCV___024root*>(voidSelf);
    VRISCV__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    VRISCV___024root__trace_full_sub_0((&vlSymsp->TOP), bufp);
}

VL_ATTR_COLD void VRISCV___024root__trace_full_sub_0(VRISCV___024root* vlSelf, VerilatedVcd::Buffer* bufp) {
    if (false && vlSelf) {}  // Prevent unused
    VRISCV__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VRISCV___024root__trace_full_sub_0\n"); );
    // Init
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode);
    // Body
    bufp->fullIData(oldp+1,(vlSelf->RISCV__DOT__ImmOp),32);
    bufp->fullIData(oldp+2,(vlSelf->RISCV__DOT__pc),32);
    bufp->fullIData(oldp+3,(((IData)(vlSelf->RISCV__DOT__Jump)
                              ? ((IData)(vlSelf->RISCV__DOT__Branch)
                                  ? vlSelf->RISCV__DOT__SUM
                                  : vlSelf->RISCV__DOT__ImmOp)
                              : ((IData)(vlSelf->RISCV__DOT__Branch)
                                  ? vlSelf->RISCV__DOT__ImmOp
                                  : 0U))),32);
    bufp->fullIData(oldp+4,(vlSelf->RISCV__DOT__Instruction),32);
    bufp->fullCData(oldp+5,((0x7fU & vlSelf->RISCV__DOT__Instruction)),7);
    bufp->fullCData(oldp+6,((7U & (vlSelf->RISCV__DOT__Instruction 
                                   >> 0xcU))),3);
    bufp->fullCData(oldp+7,((vlSelf->RISCV__DOT__Instruction 
                             >> 0x19U)),7);
    bufp->fullBit(oldp+8,(vlSelf->RISCV__DOT__RegWrite));
    bufp->fullCData(oldp+9,(vlSelf->RISCV__DOT__ResultSrc),2);
    bufp->fullBit(oldp+10,((IData)((0x23U == (0x7fU 
                                              & vlSelf->RISCV__DOT__Instruction)))));
    bufp->fullBit(oldp+11,(vlSelf->RISCV__DOT__Jump));
    bufp->fullBit(oldp+12,(vlSelf->RISCV__DOT__Branch));
    bufp->fullCData(oldp+13,(vlSelf->RISCV__DOT__ALUControl),4);
    bufp->fullBit(oldp+14,(vlSelf->RISCV__DOT__ALUSrc));
    bufp->fullCData(oldp+15,(vlSelf->RISCV__DOT__ImmSrc),2);
    bufp->fullCData(oldp+16,((0x1fU & (vlSelf->RISCV__DOT__Instruction 
                                       >> 0xfU))),5);
    bufp->fullCData(oldp+17,((0x1fU & (vlSelf->RISCV__DOT__Instruction 
                                       >> 0x14U))),5);
    bufp->fullCData(oldp+18,((0x1fU & (vlSelf->RISCV__DOT__Instruction 
                                       >> 7U))),5);
    bufp->fullIData(oldp+19,(((2U & (IData)(vlSelf->RISCV__DOT__ResultSrc))
                               ? ((1U & (IData)(vlSelf->RISCV__DOT__ResultSrc))
                                   ? vlSelf->RISCV__DOT__SUM
                                   : ((IData)(4U) + vlSelf->RISCV__DOT__pc))
                               : ((1U & (IData)(vlSelf->RISCV__DOT__ResultSrc))
                                   ? vlSelf->RISCV__DOT__data_memory__DOT__mem_data
                                  [(0xfffU & vlSelf->RISCV__DOT__SUM)]
                                   : vlSelf->RISCV__DOT__SUM))),32);
    bufp->fullIData(oldp+20,(vlSelf->RISCV__DOT__SUM),32);
    bufp->fullIData(oldp+21,(vlSelf->RISCV__DOT__RD1),32);
    bufp->fullIData(oldp+22,(vlSelf->RISCV__DOT__RD2),32);
    bufp->fullIData(oldp+23,((vlSelf->RISCV__DOT__Instruction 
                              >> 7U)),25);
    bufp->fullBit(oldp+24,((vlSelf->RISCV__DOT__RD1 
                            == vlSelf->RISCV__DOT__ALU__DOT__ALUop2)));
    bufp->fullIData(oldp+25,(vlSelf->RISCV__DOT__data_memory__DOT__mem_data
                             [(0xfffU & vlSelf->RISCV__DOT__SUM)]),32);
    bufp->fullIData(oldp+26,(vlSelf->RISCV__DOT__ALU__DOT__ALUop2),32);
    bufp->fullIData(oldp+27,((vlSelf->RISCV__DOT__RD1 
                              + vlSelf->RISCV__DOT__ALU__DOT__ALUop2)),32);
    bufp->fullBit(oldp+28,((((IData)(vlSelf->RISCV__DOT__Branch) 
                             & (vlSelf->RISCV__DOT__RD1 
                                != vlSelf->RISCV__DOT__ALU__DOT__ALUop2)) 
                            | (IData)(vlSelf->RISCV__DOT__Jump))));
    bufp->fullIData(oldp+29,(((((IData)(vlSelf->RISCV__DOT__Branch) 
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
                                          : 0U))) : 
                              ((IData)(4U) + vlSelf->RISCV__DOT__pc))),32);
    bufp->fullSData(oldp+30,((0xfffU & vlSelf->RISCV__DOT__SUM)),12);
    bufp->fullIData(oldp+31,(vlSelf->RISCV__DOT__register__DOT__reg_data[0]),32);
    bufp->fullIData(oldp+32,(vlSelf->RISCV__DOT__register__DOT__reg_data[1]),32);
    bufp->fullIData(oldp+33,(vlSelf->RISCV__DOT__register__DOT__reg_data[2]),32);
    bufp->fullIData(oldp+34,(vlSelf->RISCV__DOT__register__DOT__reg_data[3]),32);
    bufp->fullIData(oldp+35,(vlSelf->RISCV__DOT__register__DOT__reg_data[4]),32);
    bufp->fullIData(oldp+36,(vlSelf->RISCV__DOT__register__DOT__reg_data[5]),32);
    bufp->fullIData(oldp+37,(vlSelf->RISCV__DOT__register__DOT__reg_data[6]),32);
    bufp->fullIData(oldp+38,(vlSelf->RISCV__DOT__register__DOT__reg_data[7]),32);
    bufp->fullIData(oldp+39,(vlSelf->RISCV__DOT__register__DOT__reg_data[8]),32);
    bufp->fullIData(oldp+40,(vlSelf->RISCV__DOT__register__DOT__reg_data[9]),32);
    bufp->fullIData(oldp+41,(vlSelf->RISCV__DOT__register__DOT__reg_data[10]),32);
    bufp->fullIData(oldp+42,(vlSelf->RISCV__DOT__register__DOT__reg_data[11]),32);
    bufp->fullIData(oldp+43,(vlSelf->RISCV__DOT__register__DOT__reg_data[12]),32);
    bufp->fullIData(oldp+44,(vlSelf->RISCV__DOT__register__DOT__reg_data[13]),32);
    bufp->fullIData(oldp+45,(vlSelf->RISCV__DOT__register__DOT__reg_data[14]),32);
    bufp->fullIData(oldp+46,(vlSelf->RISCV__DOT__register__DOT__reg_data[15]),32);
    bufp->fullIData(oldp+47,(vlSelf->RISCV__DOT__register__DOT__reg_data[16]),32);
    bufp->fullIData(oldp+48,(vlSelf->RISCV__DOT__register__DOT__reg_data[17]),32);
    bufp->fullIData(oldp+49,(vlSelf->RISCV__DOT__register__DOT__reg_data[18]),32);
    bufp->fullIData(oldp+50,(vlSelf->RISCV__DOT__register__DOT__reg_data[19]),32);
    bufp->fullIData(oldp+51,(vlSelf->RISCV__DOT__register__DOT__reg_data[20]),32);
    bufp->fullIData(oldp+52,(vlSelf->RISCV__DOT__register__DOT__reg_data[21]),32);
    bufp->fullIData(oldp+53,(vlSelf->RISCV__DOT__register__DOT__reg_data[22]),32);
    bufp->fullIData(oldp+54,(vlSelf->RISCV__DOT__register__DOT__reg_data[23]),32);
    bufp->fullIData(oldp+55,(vlSelf->RISCV__DOT__register__DOT__reg_data[24]),32);
    bufp->fullIData(oldp+56,(vlSelf->RISCV__DOT__register__DOT__reg_data[25]),32);
    bufp->fullIData(oldp+57,(vlSelf->RISCV__DOT__register__DOT__reg_data[26]),32);
    bufp->fullIData(oldp+58,(vlSelf->RISCV__DOT__register__DOT__reg_data[27]),32);
    bufp->fullIData(oldp+59,(vlSelf->RISCV__DOT__register__DOT__reg_data[28]),32);
    bufp->fullIData(oldp+60,(vlSelf->RISCV__DOT__register__DOT__reg_data[29]),32);
    bufp->fullIData(oldp+61,(vlSelf->RISCV__DOT__register__DOT__reg_data[30]),32);
    bufp->fullIData(oldp+62,(vlSelf->RISCV__DOT__register__DOT__reg_data[31]),32);
    bufp->fullBit(oldp+63,(vlSelf->rst));
    bufp->fullBit(oldp+64,(vlSelf->clk));
    bufp->fullIData(oldp+65,(vlSelf->a0),32);
    bufp->fullIData(oldp+66,(0x20U),32);
    bufp->fullIData(oldp+67,(5U),32);
}
