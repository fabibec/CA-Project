#include "registerTest.h"
#define __MICROBLAZE__
#include "xil_io.h"

u8 testRegister(UINTPTR regAddr, u32 expectedMax, u32 expectedLow){
  int errors = 0;
  Xil_Out32(regAddr, 0xFFFFFFFF);
  if(Xil_In32(regAddr) != expectedMax) errors+=1;

  Xil_Out32(regAddr, 0x00000000);
  if(Xil_In32(regAddr) != expectedLow) errors+=2;
  
  return errors;
}