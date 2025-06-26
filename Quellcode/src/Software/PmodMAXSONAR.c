
#include "PmodMAXSONAR.h"
#include <sleep.h>
#include <xil_io.h>
#include <xil_types.h>

#include "registerTest.h"

#define AUTO_RESTART

u8 SON_initialize(UINTPTR baseAddr){
  //Reset IP
  SON_reset(baseAddr);

  //Set AP-Start
  u32 reg = Xil_In32(baseAddr + SON_GCSR_OFFSET);
  reg |= SON_GCSR_AP_START_MASK;
  #ifdef AUTO_RESTART
    reg |= SON_GCSR_AUTO_RESTART_MASK;   //Auto-Restart
  #endif
  Xil_Out32(baseAddr + SON_GCSR_OFFSET, reg);

    //Wait for Calibration
  int timeout = 10000; //1 second
  u32 masterMask = SON_SCSR0_POWERUP_DONE_MASK | SON_SCSR0_CONFIG_DONE_MASK;
  while((Xil_In32(baseAddr + SON_SCSR0_OFFSET) & masterMask) != masterMask){
    usleep(100);
    timeout--;
    if(timeout <= 0) return SON_TIMEOUT_ERROR;
  }
  return SON_SUCCESS;
}

void SON_reset(UINTPTR baseAddr){
  u32 reg = Xil_In32(baseAddr + SON_SCSR0_OFFSET);
  reg |= SON_SCSR0_RESET_IP_MASK;
  Xil_Out32(baseAddr + SON_SCSR0_OFFSET, reg);

  usleep(100);
  
  reg &= ~SON_SCSR0_RESET_IP_MASK;
  Xil_Out32(baseAddr + SON_SCSR0_OFFSET, reg);
}

u8 SON_getIN(UINTPTR baseAddr){
  //Set AP_START
  #ifndef AUTO_RESTART
  u32 reg = Xil_In32(baseAddr + SON_GCSR_OFFSET);
  reg |= SON_GCSR_AP_START_MASK;
  Xil_Out32(baseAddr + SON_GCSR_OFFSET, reg);
  #endif
  
  //Wait for AP_DONE
  int timeout = 10000; //1 second
  while (!(Xil_In32(baseAddr + SON_GCSR_OFFSET) & SON_GCSR_AP_DONE_MASK)) {
      usleep(100);
      timeout--;
      if(timeout <= 0) return SON_TIMEOUT_ERROR;
  }

  //Check for AD_ERROR
  if(Xil_In32(baseAddr + SON_ADSR_OFFSET) & SON_ADSR_AD_ERROR_MASK) return SON_UNEXPECTED_ERROR;

  //Read the distance
  u8 dist =  (u8)Xil_In32(baseAddr + SON_DIST0_OFFSET) & SON_DIST0_DIST_IN_MASK;
  
  //Return value if valid, else return error
  if(dist>=0x06){
    return dist;
  }else {
    return SON_NO_VALID_READING;
  }
}

u16 SON_getCM(UINTPTR baseAddr){
 u8 distIn = SON_getIN(baseAddr);
 return (distIn != SON_NO_VALID_READING) ? (u16)((distIn*254)/100) : (u16)SON_NO_VALID_READING;
}

u16 SON_testRegisters(UINTPTR baseAddr){
  u16 errors = 0;
  //TODO alle Register testen
  if(testRegister(baseAddr + SON_ADSR_OFFSET,0x0,0x0 )) errors+=1;
  if(testRegister(baseAddr + SON_UCSR_OFFSET,0x0,0x0 )) errors+=2;
  if(testRegister(baseAddr + SON_DIST0_OFFSET, 0x0, 0x0)) errors+=4;
  if(testRegister(baseAddr + SON_SCSR0_OFFSET, 0x0C0, 0x0)) errors+=8; 
  if(testRegister(baseAddr + SON_VERR_OFFSET, 0x80001000, 0x80001000)) errors+=16;
  if(testRegister(baseAddr + SON_IDR_OFFSET, 0x534F4E52, 0x534F4E52)) errors+=32;
  if(testRegister(baseAddr + SON_IPISR_OFFSET, 0x0, 0x0)) errors+=64;
  if(testRegister(baseAddr + SON_IPIER_OFFSET, 0x0, 0x0)) errors+=128;
  if(testRegister(baseAddr + SON_GIER_OFFSET, 0x0, 0x0)) errors+=256;
  //if(testRegister(baseAddr + SON_GCSR_OFFSET, 0x1, 0x00000001)) errors+=512; //error wegen apstart register
  
  return errors;
}