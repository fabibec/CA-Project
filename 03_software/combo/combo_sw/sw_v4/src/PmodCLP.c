
#include "PmodCLP.h"
#include <xil_io.h>
#include <xil_types.h>
#include <sleep.h>
#include "registerTest.h"

u8 CLP_executeCommand(UINTPTR baseAddr){
  //Set AP_START
  u32 reg = Xil_In32(baseAddr + CLP_GCSR_OFFSET);
  reg |= CLP_GCSR_AP_START_MASK;
  Xil_Out32(baseAddr + CLP_GCSR_OFFSET, reg);

  //Wait for AP_DONE
  int timeout = 10000; //1 second
  while (!(Xil_In32(baseAddr + CLP_GCSR_OFFSET) & CLP_GCSR_AP_DONE_MASK)) {
      usleep(100);
      timeout--;
      if(timeout <= 0) return CLP_TIMEOUT_ERROR;
  }
  return CLP_SUCCESS;
}

u8 CLP_clearDisplay(UINTPTR baseAddr) {
  //Set display to clear mode
  u32 reg = Xil_In32(baseAddr + CLP_DCR_OFFSET);
  reg |= CLP_DCR_CLEAR_DISPLAY_MASK;
  Xil_Out32(baseAddr + CLP_DCR_OFFSET, reg);
  int mssg = CLP_executeCommand(baseAddr);

  //Unset clear mode after display is cleared
  reg &= ~CLP_DCR_CLEAR_DISPLAY_MASK;
  Xil_Out32(baseAddr + CLP_DCR_OFFSET, reg);
  return mssg;
   }

u8 CLP_initialize(UINTPTR baseAddr) {

    int timeout = 10000;  // 1 second
    while (!(Xil_In32(baseAddr + CLP_SCSR0_OFFSET) & CLP_SCSR0_LED_INITIALIZED_MASK)) {
        usleep(100);
        timeout--;
        if(timeout <= 0) return CLP_INIT_ERROR;
    }
    // Clear display
    //clearDisplay(baseAddr);

    return CLP_SUCCESS;
}


u8 CLP_writeDisplay(UINTPTR baseAddr, char* inString) {
    int i = 0;
    u8 mssg = 0;
    // Initiate write process
    u32 controlReg = Xil_In32(baseAddr + CLP_CCR_OFFSET);
    controlReg |= CLP_CCR_WRITE_CHAR_MASK; //Turn on character write
    Xil_Out32(baseAddr + CLP_CCR_OFFSET, controlReg);
    
    while (inString[i] != '\0') {
        // Write character into register
        u32 reg = Xil_In32(baseAddr + CLP_CDR_OFFSET);
        reg &= ~(CLP_CDR_SYMBOL_TO_WRITE_MASK); //Clear the symbol part of the read register
        reg |= (u32)inString[i];
        Xil_Out32(baseAddr + CLP_CDR_OFFSET, reg);
        mssg = CLP_executeCommand(baseAddr);
        if(mssg != CLP_SUCCESS)return mssg;
        i++;
    }
    controlReg &= ~CLP_CCR_WRITE_CHAR_MASK; //Turn off character write
    Xil_Out32(baseAddr + CLP_CCR_OFFSET, controlReg);
    return CLP_SUCCESS;
}

u8 CLP_setCursor(UINTPTR baseAddr, u8 blink, u8 on){
     u32 dcrReg = Xil_In32(baseAddr + CLP_DCR_OFFSET);
    if(blink) dcrReg |= CLP_DCR_CURSOR_BLINK_MASK;
    if(on) dcrReg |= CLP_DCR_CURSOR_ON_MASK;
    dcrReg |= CLP_DCR_CURSOR_APPLY_MASK;
    Xil_Out32(baseAddr + CLP_DCR_OFFSET, dcrReg);
    return CLP_executeCommand(baseAddr);
}

u16 CLP_testRegisters(UINTPTR baseAddr){
  u16 errors = 0;
  if(testRegister(baseAddr + CLP_DCR_OFFSET, 0x1F, 0x00000010)) errors+=1;
  if(testRegister(baseAddr + CLP_CDR_OFFSET, 0xFF, 0x0)) errors+=2;
  if(testRegister(baseAddr + CLP_CCR_OFFSET, 0x100ff, 0xFF)) errors+=4;
  if(testRegister(baseAddr + CLP_SCSR0_OFFSET, 0x5, 0x5)) errors+=8; 
  if(testRegister(baseAddr + CLP_VERR_OFFSET, 0x80001000, 0x80001000)) errors+=16;
  if(testRegister(baseAddr + CLP_IDR_OFFSET, 0x80010744, 0x80010744)) errors+=32;
  if(testRegister(baseAddr + CLP_IPISR_OFFSET, 0x0, 0x0)) errors+=64;
  if(testRegister(baseAddr + CLP_IPIER_OFFSET, 0x0, 0x0)) errors+=128;
  if(testRegister(baseAddr + CLP_GIER_OFFSET, 0x0, 0x0)) errors+=256;
  //if(testRegister(baseAddr + CLP_GCSR_OFFSET, 0x00000005, 0x00000005)) errors+=512; //error wegen apstart register
  
  return errors;
}