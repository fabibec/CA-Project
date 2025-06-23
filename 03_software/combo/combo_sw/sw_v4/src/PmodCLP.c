
#include "PmodCLP.h"
#include <xil_io.h>
#include <xil_types.h>
#include <sleep.h>


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

//only for testing consistent error readings
u8 CLP_executeCommand1(UINTPTR baseAddr){
  //setzen von ap start und schreiben in das register
  u32 reg = Xil_In32(baseAddr + CLP_GCSR_OFFSET);
  reg |= CLP_GCSR_AP_START_MASK;
  Xil_Out32(baseAddr + CLP_GCSR_OFFSET, reg);
  //check if Ap Start is set
  if (!(Xil_In32(baseAddr + CLP_GCSR_OFFSET) & CLP_GCSR_AP_START_MASK))return CLP_ACK_ERROR;
  //check if LCD Error Mask is set
  if ((Xil_In32(baseAddr + CLP_SCSR0_OFFSET) & CLP_SCSR0_LED_ERROR_FLAG_MASK))return CLP_LCD_ERROR;
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
    u8 mssg;
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
        //if(mssg != CLP_SUCCESS)return mssg;
        i++;
    }
    controlReg &= ~CLP_CCR_WRITE_CHAR_MASK; //Turn off character write
    Xil_Out32(baseAddr + CLP_CCR_OFFSET, controlReg);
    return CLP_SUCCESS;
}