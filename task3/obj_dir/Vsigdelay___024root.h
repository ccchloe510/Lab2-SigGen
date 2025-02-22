// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vsigdelay.h for the primary calling header

#ifndef VERILATED_VSIGDELAY___024ROOT_H_
#define VERILATED_VSIGDELAY___024ROOT_H_  // guard

#include "verilated.h"


class Vsigdelay__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vsigdelay___024root final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    VL_IN8(clk,0,0);
    VL_IN8(rst,0,0);
    VL_IN8(wr,0,0);
    VL_IN8(rd,0,0);
    VL_IN8(mic_signal,7,0);
    VL_OUT8(delayed_signal,7,0);
    CData/*7:0*/ sigdelay__DOT____Vcellout__myCounter__count;
    CData/*0:0*/ __Vtrigprevexpr___TOP__clk__0;
    CData/*0:0*/ __VactContinue;
    VL_IN16(offset,8,0);
    SData/*8:0*/ sigdelay__DOT__rd_addr;
    IData/*31:0*/ __VactIterCount;
    VlUnpacked<CData/*7:0*/, 512> sigdelay__DOT__myRam__DOT__ram_array;
    VlTriggerVec<1> __VactTriggered;
    VlTriggerVec<1> __VnbaTriggered;

    // INTERNAL VARIABLES
    Vsigdelay__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vsigdelay___024root(Vsigdelay__Syms* symsp, const char* v__name);
    ~Vsigdelay___024root();
    VL_UNCOPYABLE(Vsigdelay___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
