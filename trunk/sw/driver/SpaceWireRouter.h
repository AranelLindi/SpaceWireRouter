#ifndef SPACEWIREROUTER_H
#define SPACEWIREROUTER_H

/*************** Include Files ***************/
#include "xil_types.h"   // Xilinx function return type
#include "xstatus.h"     // XStatus
#include "xparameters.h" // wirklich nötig?
#include "xil_io.h"      // für was war das nochmal?
/*********************************************/

/************* Macro Definitions *************/
#define SPACEWIREROUTER_BaseAddress 0x40000000U
/*********************************************/

/************* Type Definitions **************/

/**
 *
 * Write/Read 16 bit value to/from SPACEWIRE_ROUTER user logic memory (BRAM).
 *
 * @param   Address is the memory address of the SPACEWIRE_ROUTER device.
 * @param   Data is the value written to user logic memory.
 *
 * @return  The data from the user logic memory.
 *
 * @note
 * C-style signature:
 * 	void SPACEWIRE_ROUTER_mWriteMemory16(u32 Address, u16 Data)
 * 	u32 SPACEWIRE_ROUTER_mReadMemory16(u32 Address)
 *
 */
#define SPACEWIRE_ROUTER_mWriteMemory16(Address, Data) \
    Xil_Out16(Address, (u32)(Data))
#define SPACEWIRE_ROUTER_mReadMemory16(Address) \
    Xil_In16(Address)

/**
 *
 * Write a value to a SPACEWIRE_ROUTER register. A 32 bit write is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is written.
 *
 * @param   BaseAddress is the base address of the SPACEWIRE_ROUTER device.
 * @param   RegOffset is the register offset from the base to write to.
 * @param   Data is the data written to the register.
 *
 * @return  None.
 *
 * @note
 * C-style signature:
 * 	void SPACEWIRE_ROUTER_mWriteReg(u32 BaseAddress, unsigned RegOffset, u32 Data)
 *
 */
#define SPACEWIRE_ROUTER_mWriteReg32(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))

/**
 *
 * Read a value from a SPACEWIRE_ROUTER register. A 32 bit read is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is read from the register. The most significant data
 * will be read as 0.
 *
 * @param   BaseAddress is the base address of the SPACEWIRE_ROUTER device.
 * @param   RegOffset is the register offset from the base to write to.
 *
 * @return  Data is the data from the register.
 *
 * @note
 * C-style signature:
 * 	u32 SPACEWIRE_ROUTER_mReadReg(u32 BaseAddress, unsigned RegOffset)
 *
 */
#define SPACEWIRE_ROUTER_mReadReg32(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))

/*********************************************/

/************ Function Prototypes ************/
// Routing Table

/**
 *
 * Returns the row from the routing table for the respective logical port.
 *
 * @param   offset is the base address of the SPACEWIRE_ROUTER device.
 * @param   lport is the number of the logical port (32-254).
 *
 * @return  Row from routing table.
 *
 */
u32 getRoutingTableEntry(u32 offset, u8 lport);

/**
 *
 * Sets the row in the routing table for the respective logical port.
 *
 * @param   offset is the base address of the SPACEWIRE_ROUTER device.
 * @param   lport is the number of the logical port (32-254).
 * @param   entry is the row to be written into routing table.
 *
 * @return  Row from routing table.
 *
 */
XStatus setRoutingTableEntry(u32 offset, u8 lport, u32 entry);

// Port control

/**
 *
 * Sets reset value of a physical port to given value.
 *
 * @param   offset is the base address of the SPACEWIRE_ROUTER device.
 * @param   port is the number of the physical port (0-31).
 * @param   val is value to be written (0x00 or 0x01).
 *
 * @return  XSuccess or XFailure.
 *
 */
XStatus setPortReset(u32 offset, u8 port, u8 val);

/**
 *
 * Sets deactivation value of a physical port to given value.
 *
 * @param   offset is the base address of the SPACEWIRE_ROUTER device.
 * @param   port is the number of the physical port (0-31).
 * @param   val is value to be written (0x00 or 0x01).
 *
 * @return  XSuccess or XFailure.
 *
 */
XStatus setPortDeact(u32 offset, u8 port, u8 val);

/**
 *
 * Sets linkstart value of a physical port to given value.
 *
 * @param   offset is the base address of the SPACEWIRE_ROUTER device.
 * @param   port is the number of the physical port (0-31).
 * @param   val is value to be written (0x00 or 0x01).
 *
 * @return  XSuccess or XFailure.
 *
 */
XStatus setPortLinkstart(u32 offset, u8 port, u8 val);

/**
 *
 * Sets autostart value of a physical port to given value.
 *
 * @param   offset is the base address of the SPACEWIRE_ROUTER device.
 * @param   port is the number of the physical port (0-31).
 * @param   val is value to be written (0x00 or 0x01).
 *
 * @return  XSuccess or XFailure.
 *
 */
XStatus setPortAutostart(u32 offset, u8 port, u8 val);

/**
 *
 * Sets watch_en value of a physical port to given value.
 *
 * @param   offset is the base address of the SPACEWIRE_ROUTER device.
 * @param   port is the number of the physical port (0-31).
 * @param   val is value to be written (0x00 or 0x01).
 *
 * @return  XSuccess or XFailure.
 *
 */
XStatus setPortWatchdog(u32 offset, u8 port, u8 val);

/**
 *
 * Sets tc_en value of a physical port to given value.
 *
 * @param   offset is the base address of the SPACEWIRE_ROUTER device.
 * @param   port is the number of the physical port (0-31).
 * @param   val is value to be written (0x00 or 0x01).
 *
 * @return  XSuccess or XFailure.
 *
 */
XStatus setPortTimeCode(u32 offset, u8 port, u8 val);

/**
 *
 * Sets txdivcnt value of a physical port to given value.
 *
 * @param   offset is the base address of the SPACEWIRE_ROUTER device.
 * @param   port is the number of the physical port (0-31).
 * @param   val is value to be written.
 *
 * @return  XSuccess or XFailure.
 *
 */
XStatus setPortTxDivCnt(u32 offset, u8 port, u8 val);

// Port state

/**
 *
 * Returns complete status register of a physical port.
 *
 * @param   offset is the base address of the SPACEWIRE_ROUTER device.
 * @param   port is the number of the physical port (0-31).
 *
 * @return  Port status register.
 *
 */
u32 getPortState(u32 offset, u8 port);

/**
 *
 * Returns connection state of a physical port.
 *
 * @param   offset is the base address of the SPACEWIRE_ROUTER device.
 * @param   port is the number of the physical port (0-31).
 *
 * @return  Port connection state.
 *
 */
u8 getPortConnectionState(u32 offset, u8 port);

/**
 *
 * Returns error state of a physical port.
 *
 * @param   offset is the base address of the SPACEWIRE_ROUTER device.
 * @param   port is the number of the physical port (0-31).
 *
 * @return  Port error state.
 *
 */
u8 getPortErrState(u32 offset, u8 port);

/**
 *
 * Returns fifo state of a physical port.
 *
 * @param   offset is the base address of the SPACEWIRE_ROUTER device.
 * @param   port is the number of the physical port (0-31).
 *
 * @return  Port fifo state.
 *
 */
u8 getPortFifoState(u32 offset, u8 port);

/**
 *
 * Returns counter value of discarded packets of a physical port.
 *
 * @param   offset is the base address of the SPACEWIRE_ROUTER device.
 * @param   port is the number of the physical port (0-31).
 *
 * @return  Discarded packets.
 *
 */
u32 getPortDiscarded(u32 offset, u8 port);

// Router register

/**
 *
 * Returns number of SpaceWire ports the router has.
 *
 * @param   offset is the base address of the SPACEWIRE_ROUTER device.
 *
 * @return  Number of SpaceWire ports.
 *
 */
u8 getNumports(u32 offset);

/**
 *
 * Returns which router ports are in running state.
 *
 * @param   offset is the base address of the SPACEWIRE_ROUTER device.
 *
 * @return  Running ports.
 *
 */
u32 getRunningPorts(u32 offset);

/**
 *
 * Returns value of watchdog cycle of the router.
 *
 * @param   offset is the base address of the SPACEWIRE_ROUTER device.
 *
 * @return  Watchdog cycle.
 *
 */
u32 getWatchdogCycle(u32 offset);

/**
 *
 * Sets interval of watchdog of the router.
 *
 * @param   offset is the base address of the SPACEWIRE_ROUTER device.
 * @param   val is the value for watchdog interval.
 *
 * @return  XSuccess or XFailure.
 *
 */
XStatus setWatchdogCycle(u32 offset, u32 val);

/**
 *
 * Returns value of automatically Time Code cycle.
 *
 * @param   offset is the base address of the SPACEWIRE_ROUTER device.
 *
 * @return  Automatic Time Code Cycle.
 *
 */
u32 getAutoTCCycle(u32 offset);

/**
 *
 * Sets value of automatically Time Code generation.
 *
 * @param   offset is the base address of the SPACEWIRE_ROUTER device.
 * @param   val is the value for Time Code generation.
 *
 * @return  XSuccess or XFailure.
 *
 */
XStatus setAutoTCCycle(u32 offset, u32 val);

/**
 *
 * Returns last received regularly Time Code.
 *
 * @param   offset is the base address of the SPACEWIRE_ROUTER device.
 *
 * @return  First two bits are flag, rest counter value.
 *
 */
u8 getLastTimeCode(u32 offset);

/**
 *
 * Returns counter value of last received Time Code.
 *
 * @param   offset is the base address of the SPACEWIRE_ROUTER device.
 *
 * @return  Counter Value.
 *
 */
u8 getLastCounterValue(u32 offset);

/**
 *
 * Returns flag value of last received Time Code.
 *
 * @param   offset is the base address of the SPACEWIRE_ROUTER device.
 *
 * @return  Flag Value.
 *
 */
u8 getLastFlag(u32 offset);


/**
 *
 * Returns last automatically generated Time Code.
 *
 * @param   offset is the base address of the SPACEWIRE_ROUTER device.
 *
 * @return  Auto Time-Code.
 *
 */
u8 getLastTimeCodeAuto(u32 offset);

/**
 *
 * Returns counter value of last automatically generated Time Code.
 *
 * @param   offset is the base address of the SPACEWIRE_ROUTER device.
 *
 * @return  Counter Value.
 *
 */
u8 getLastCounterValueAuto(u32 offset);

/**
 *
 * Returns flag value of last automatically generated Time Code.
 *
 * @param   offset is the base address of the SPACEWIRE_ROUTER device.
 *
 * @return  Flag Value.
 *
 */
u8 getLastFlagAuto(u32 offset);

/**
 *
 * Returns router info register.
 *
 * @param   offset is the base address of the SPACEWIRE_ROUTER device.
 *
 * @return  Info.
 *
 */
u32 getInfoReg(u32 offset);

/*********************************************/
#endif SPACEWIREROUTER_H