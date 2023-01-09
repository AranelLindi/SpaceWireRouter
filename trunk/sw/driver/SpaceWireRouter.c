#include <SpaceWireRouter.h>

u32 getRoutingTableEntry(u32 offset, u8 lport)
{
    return SPACEWIRE_ROUTER_mReadReg32(offset, (lport << 2));
}

XStatus setRoutingTableEntry(u32 offset, u8 lport, u32 entry)
{
    SPACEWIRE_ROUTER_mWriteReg32(offset, (lport << 2), entry);

    if (getRoutingTableEntry(offset, lport) == entry)
    {
        return XSucess;
    }
    else
    {
        return XFailure;
    }
}

XStatus setPortReset(u32 offset, u8 lport, u8 val) {
    u32 const reg = SPACEWIRE_ROUTER_mReadReg32(offset, 0x00000400 + (lport << 4)) | (val << 0);

    SPACEWIRE_ROUTER_mWriteReg32(offset, 0x00000400 + (lport << 4), reg);

    if (SPACEWIRE_ROUTER_mReadReg32(offset, 0x00000400 + (lport << 4)) == reg) {
        return XSucess;
    }
    else {
        return XFailure;
    }
}

XStatus setPortDeact(u32 offset, u8 lport, u8 val) {
    u32 const reg = SPACEWIRE_ROUTER_mReadReg32(offset, 0x00000400 + (lport << 4)) | (val << 1);

    SPACEWIRE_ROUTER_mWriteReg32(offset, 0x00000400 + (lport << 4), reg);

    if (SPACEWIRE_ROUTER_mReadReg32(offset, 0x00000400 + (lport << 4)) == reg) {
        return XSucess;
    }
    else {
        return XFailure;
    }
}

XStatus setPortLinkstart(u32 offset, u8 lport, u8 val) {
    u32 const reg = SPACEWIRE_ROUTER_mReadReg32(offset, 0x00000400 + (lport << 4)) | (val << 2);

    SPACEWIRE_ROUTER_mWriteReg32(offset, 0x00000400 + (lport << 4), reg);

    if (SPACEWIRE_ROUTER_mReadReg32(offset, 0x00000400 + (lport << 4)) == reg) {
        return XSucess;
    }
    else {
        return XFailure;
    }
}

XStatus setPortAutostart(u32 offset, u8 lport, u8 val) {
    u32 const reg = SPACEWIRE_ROUTER_mReadReg32(offset, 0x00000400 + (lport << 4)) | (val << 3);

    SPACEWIRE_ROUTER_mWriteReg32(offset, 0x00000400 + (lport << 4), reg);

    if (SPACEWIRE_ROUTER_mReadReg32(offset, 0x00000400 + (lport << 4)) == reg) {
        return XSucess;
    }
    else {
        return XFailure;
    }
}

XStatus setPortWatchdog(u32 offset, u8 lport, u8 val) {
    u32 const reg = SPACEWIRE_ROUTER_mReadReg32(offset, 0x00000400 + (lport << 4)) | (val << 4);

    SPACEWIRE_ROUTER_mWriteReg32(offset, 0x00000400 + (lport << 4), reg);

    if (SPACEWIRE_ROUTER_mReadReg32(offset, 0x00000400 + (lport << 4)) == reg) {
        return XSucess;
    }
    else {
        return XFailure;
    }
}

XStatus setPortTimeCode(u32 offset, u8 lport, u8 val) {
    u32 const reg = SPACEWIRE_ROUTER_mReadReg32(offset, 0x00000400 + (lport << 4)) | (val << 5);

    SPACEWIRE_ROUTER_mWriteReg32(offset, 0x00000400 + (lport << 4), reg);

    if (SPACEWIRE_ROUTER_mReadReg32(offset, 0x00000400 + (lport << 4)) == reg) {
        return XSucess;
    }
    else {
        return XFailure;
    }
}

XStatus setPortTxDivCnt(u32 offset, u8 lport, u8 val) {
    u32 const reg = (SPACEWIRE_ROUTER_mReadReg32(offset, 0x00000400 + (lport << 4)) & 0x000000ff) + (val << 8);

    SPACEWIRE_ROUTER_mWriteReg32(offset, 0x00000400 + (lport << 4), reg);

    if (SPACEWIRE_ROUTER_mReadReg32(offset, 0x00000400 + (lport << 4)) == reg) {
        return XSucess;
    }
    else {
        return XFailure;
    }
}

u32 getPortState(u32 offset, u8 port) {
    return SPACEWIRE_ROUTER_mReadReg32(offset, 0x00000400 + (port << 4) + 4);
}

u8 getPortConnectionState(u32 offset, u8 port) {
    u32 const reg = SPACEWIRE_ROUTER_mReadReg32(offset, 0x00000400 + (port << 4) + 4) & 0x0000000f;

    return (u8)reg;
}

u8 getPortErrState(u32 offset, u8 port) {
    u32 const reg = (SPACEWIRE_ROUTER_mReadReg32(offset, 0x00000400 + (port << 4) + 4) & 0x000000f0) >> 4;

    return (u8)reg;
}

u8 getPortFifoState(u32 offset, u8 port) {
    u32 const reg = (SPACEWIRE_ROUTER_mReadReg32(offset, 0x00000400 + (port << 4) + 4) & 0b00000000000000000011111100000000) >> 8;

    return (u8)reg;    
}

u32 getPortDiscarded(u32 offset, u8 port) {
    u32 const reg = (SPACEWIRE_ROUTER_mReadReg32(offset, 0x00000400 + (port << 4) + 4) & 0b11111111111111111100000000000000) >> 14;

    return reg;        
}

u8 getNumports(u32 offset) {
    return (u8)SPACEWIRE_ROUTER_mReadReg32(offset, 0x00000500);
}

u32 getRunningPorts(u32 offset) {
    return SPACEWIRE_ROUTER_mReadReg32(offset, 0x00000504);
}

u32 getWatchdogCycle(u32 offset) {
    return SPACEWIRE_ROUTER_mReadReg32(offset, 0x00000508)
}

XStatus setWatchdogCycle(32 offset, u32 val) {
    SPACEWIRE_ROUTER_mWriteReg32(offset, 0x00000508, val);

    if (getWatchdogCycle(offset) == val) {
        return XSucess;
    }
    else {
        return XFailure;
    }
}

u32 getAutoTCCycle(u32 offset) {
    return SPACEWIRE_ROUTER_mReadReg32(offset, 0x0000050C);
}

XStatus setAutoTCCycle(32 offset, u32 val) {
    SPACEWIRE_ROUTER_mWriteReg32(offset, 0x0000050C, val);

    if (getAutoTCCycle(offset) == val) {
        return XSucess;
    }
    else {
        return XFailure;
    }
}

u8 getLastTimeCode(u32 offset) {
    return (u8)SPACEWIRE_ROUTER_mReadReg32(offset, 0x00000510);
}

u8 getLastCounterValue(u32 offset) {
    return SPACEWIRE_ROUTER_mReadReg32(offset, 0x00000510) & 0x0000003F;
}

u8 getLastFlag(u32 offset) {
    return (u8)((SPACEWIRE_ROUTER_mReadReg32(offset, 0x00000510) & 0x000000C0) >> 6);
}

u8 getLastTimeCodeAuto(u32 offset) {
    return (u8)SPACEWIRE_ROUTER_mReadReg32(offset, 0x00000514);    
}

u8 getLastCounterValueAuto(u32 offset) {
    return SPACEWIRE_ROUTER_mReadReg32(offset, 0x00000514) & 0x0000003F;
}

u8 getLastFlagAuto(u32 offset) {
    return (u8)((SPACEWIRE_ROUTER_mReadReg32(offset, 0x00000514) & 0x000000C0) >> 6);
}

u32 getInfoReg(u32 offset) {
    return SPACEWIRE_ROUTER_mReadReg32(offset, 0x00000518);
}