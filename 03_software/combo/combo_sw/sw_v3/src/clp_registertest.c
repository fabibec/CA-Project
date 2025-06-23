#include "clp_registertest.h"
#include "PmodCLP.h"
#include <xil_io.h>
#include <xil_assert.h>


//allgemeiner Registertest 

void CLP_RegisterTest(UINTPTR baseAddr,u32 offset, u32 testval, u32 mask){
  Xil_Out32(baseAddr + offset, testval);
  u32 readVal = Xil_In32(baseAddr + offset);
  Xil_AssertVoid((readVal & mask) == (testval & mask));
}

void CLP_testSCSR0(UINTPTR baseAddr){
  const u32 mask = CLP_SCSR0_LED_INITIALIZED_MASK | CLP_SCSR0_LED_STATE_MASK | CLP_SCSR0_LED_ERROR_FLAG_MASK ;
  CLP_RegisterTest(baseAddr,CLP_SCSR0_OFFSET, CLP_TESTVAL, mask);
  //u32 readVal = Xil_In32(baseAddr + CLP_SCSR0_OFFSET);
  //u32 readtestVal = Xil_In32(baseAddr + CLP_SCSR0_OFFSET) & mask;
}