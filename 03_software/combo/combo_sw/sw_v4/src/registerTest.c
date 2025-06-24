#include "registerTest.h"
#define __MICROBLAZE__
#include "xil_io.h"

u8 testRegister(UINTPTR baseAddr, u32 expectedLow, u32 expectedMax){
  Xil_Out32(baseAddr, 0xFFFFFFFF);
  if(Xil_In32(baseAddr) != expectedMax) return 1;

  Xil_Out32(baseAddr, 0x00000000);
  if(Xil_In32(baseAddr) != expectedLow) return 1;
  
  return 0;
}