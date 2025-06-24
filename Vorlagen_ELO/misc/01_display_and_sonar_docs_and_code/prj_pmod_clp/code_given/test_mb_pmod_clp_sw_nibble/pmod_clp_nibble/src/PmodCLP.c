/******************************************************************************/
/*                                                                            */
/* PmodCLP.c -- PmodCLP Example Projects (adapted from PmodCLP)               */
/*                                                                            */
/******************************************************************************/
/* Author: Mikel Skreen                                                       */
/* Copyright 2016, Digilent Inc.                                              */
/******************************************************************************/
/* File Description:                                                          */
/*                                                                            */
/* This file contains code for running a demonstration of the PmodCLP when    */
/* used with GPIO IP core as communication IP.                                */
/*                                                                            */
/******************************************************************************/
/* Revision History:                                                          */
/*    01/22/2025: strongly adapted                                                                        */
/*    06/15/2016(MikelSkreen): Created                                        */
/*    08/17/2017(jPeyron):     Updated                                        */
/*    11/03/2017(artvvb):      2016.4 Maintenance                             */
/*    02/12/2018(atangzwj):    Validated for Vivado 2017.4                    */
/*                                                                            */
/******************************************************************************/


/***************************** Include Files ****************************/

#include "PmodCLP.h"


/************************** Function Definitions ************************/


void CLP_begin(PmodCLP *InstancePtr, u32 BaseAddress) {
  
   CLP_ComIpInit(InstancePtr, BaseAddress);
  
   CLP_ClpInit(InstancePtr);
  
}


void CLP_end(PmodCLP *InstancePtr) {
   //XGpio_Stop(&InstancePtr->CLPComIp); //not necessary, not existant
}


int CLP_ComIpInit(PmodCLP *InstancePtr, u32 BaseAddress) {
  int Status;

	InstancePtr->CLPComIpConfig = XGpio_LookupConfig(BaseAddress);
  if (InstancePtr->CLPComIpConfig == NULL) {
		return XST_FAILURE;
	}

   Status = XGpio_CfgInitialize(&(InstancePtr->CLPComIp), InstancePtr->CLPComIpConfig,
         InstancePtr->CLPComIpConfig->BaseAddress);
   if (Status != XST_SUCCESS) {
      return XST_FAILURE;
   }

   /*
   u32 options = ;
   Status = XGpio_SetOptions(&(InstancePtr->CLPComIp, options); //not viabale 
   if (Status != XST_SUCCESS) {
      return XST_FAILURE;
   }
   */

   /*
    * Start the driver so that the device is enabled.
    */
   //XGpio_Start(&(InstancePtr->CLPComIp)); //not necessary 

   /*
    * Disable interrupt to use polled mode operation
    */
   //XGpio_InterruptGlobalDisable(&(InstancePtr->CLPComIp)); //hangs up in assert if interrupt s are not available -> comment out
   //XGpio_InterruptDisable(&(InstancePtr->CLPComIp), CLP_GPIO_INTERUPTS_OFF); //hangs up in assert if interrupt s are not available -> comment out
   
   //CLP_GPIO_CHANNEL_CONTROL is hardwired to output
   //therefore it is not necessary to set the direction for this channel
   //XGpio_SetDataDirection(XGpio *InstancePtr, unsigned Channel,
	 //		    u32 DirectionMask) //direction=0->out, direction=1->out
   //XGpio_SetDataDirection(&(InstancePtr->CLPComIp), CLP_GPIO_CHANNEL_CONTROL, 0x0) 

   //CLP_GPIO_CHANNEL_DATA is tristate -> configure to output
   XGpio_SetDataDirection(&(InstancePtr->CLPComIp), CLP_GPIO_CHANNEL_DATA, CLP_GPIO_DIRECTION_OUT); 
  
   return XST_SUCCESS;
}

int CLP_ClpInit(PmodCLP *InstancePtr) { 
  int Status;
  
  //Note: Busy flag is kept high until initalization phase. 
  //therefore, it cant be read to check if wait time is over 
  //-> use wait times during init phase and later use reading of busy flag

  usleep(waitInitPowerOn); 
	// function set (4-bit interface, 2 lines, and 5x8 dots)
	CLP_FunctionSet(InstancePtr);
	usleep(waitExecutionTime); 

	// display set / display on off
	CLP_WriteCommand(InstancePtr, cmdLcdCtlInit | displaySetOptionDisplayOn); //just display on no cursor no blinking
	usleep(waitExecutionTime); 

  //clear display
	CLP_DisplayClear(InstancePtr);
	usleep(waitExecutionTimeClearDisplayReturnHome); 
  
  //entry mode (no shift and incrment mode; not necessary since it seems that this is default, however it is no damgae to initialize it explicitly)
  CLP_WriteCommand(InstancePtr, cmdLcdEntryModeInit); 
  usleep(waitExecutionTimeClearDisplayReturnHome); 

  return XST_SUCCESS;
}
  


/* --------------------------------------------------------------------*/
/** uint8_t  CLP_WriteStringAtPos
**
**  Parameters:
**     idxLine - the line where the string is written: 0 or 1
**     idxPos  - the start column for the string to be written:0 to 39
**     strLn   - the string to be written
**
**  Return Value:
**     u8 - CLP_LCDS_ERR_SUCCESS - The action completed successfully
**        - a combination of the following errors(OR-ed):
**        - CLP_LCDS_ERR_ARG_COL_RANGE - The argument is not within 0, 39 range
**        - CLP_LCDS_ERR_ARG_ROW_RANGE - The argument is not within 0, 2 range
**
**  Errors:
**     see returned values
**
**  Description:
**     This function writes a string at a specified position
**
-----------------------------------------------------------------------*/
u8 CLP_WriteStringAtPos(PmodCLP *InstancePtr, uint8_t idxRow, uint8_t idxCol,
      char *strLn) {

  uint8_t bResult = CLP_LCDS_ERR_SUCCESS;
  if (idxRow > 2) {
    bResult |= CLP_LCDS_ERR_ARG_ROW_RANGE;
  }
  if (idxCol > 39) {
    bResult |= CLP_LCDS_ERR_ARG_COL_RANGE;
  }
  if (bResult == CLP_LCDS_ERR_SUCCESS) {
     
      // crop string to 0x27 (39dez) chars
      uint8_t len = strlen(strLn);
      if(len > 0x27){
      strLn[0x27] = 0; // trim the string so it contains 40 characters 
        len = 0x27;
      }
    
      //trim the string so that it does not overflow the ddram
      uint8_t lenToPrint = len + idxCol;
      if (lenToPrint > 40) {
         // Truncate the length of the string
         // If it's greater than the positions number of a line
         len = 40 - idxCol;
         //Truncate the string correspondigly
         strLn[len-1]=0; 
      }     

      // Set write position
      u8 bAddrOffset = (idxRow == 0 ? 0: 0x40) + idxCol;
      CLP_SetWriteDdramPosition(InstancePtr, bAddrOffset);

      // write data
      u8 bIdx = 0;
      while(bIdx < len){
        CLP_WriteDataByte(InstancePtr, strLn[bIdx]);
        bIdx++;
      }          
   }
  return bResult;
}


//--------------------------

void CLP_SetWriteDdramPosition(PmodCLP *InstancePtr, u8 bAdr){
 	u8 bCmd = cmdLcdSetDdramPos | bAdr;
	CLP_WriteCommand(InstancePtr, bCmd); 
  //usleep(waitExecutionTime);
}


void CLP_DisplayClear(PmodCLP *InstancePtr) {
  /// Clear the display and returns the cursor home
  CLP_WriteCommand(InstancePtr, cmdLcdClear);
  //usleep(waitExecutionTimeClearDisplayReturnHome);
}


void CLP_FunctionSet(PmodCLP *InstancePtr){
  u8 uppernibble= (cmdLcdFcnInit & 0xF0) >>4;
  u8 lowernibble= cmdLcdFcnInit & 0x0F;

  CLP_ClearRS(InstancePtr);	//function set is a command

  //write the uppernibble twice (see datasheet!)
  CLP_WriteNibble(InstancePtr, uppernibble); 
  usleep(waitExecutionTime); //here the normal executiontime is required

  CLP_WriteNibble(InstancePtr, uppernibble); 
  //usleep(waitExecutionTime1stnibble); 
  usleep(waitExecutionTime); //although it does not seem to be necessary to use the full executiontime, it might be safer

  CLP_WriteNibble(InstancePtr, lowernibble); 
  usleep(waitExecutionTime);   
}


//--------------------------

void CLP_WriteCommand(PmodCLP *InstancePtr, u8 cmd){

  CLP_WaitUntilNotBusy(InstancePtr);

	CLP_ClearRS(InstancePtr);	
	CLP_WriteByte(InstancePtr, cmd);  
}


void CLP_WriteDataByte(PmodCLP *InstancePtr, u8 byte) {  
  CLP_WaitUntilNotBusy(InstancePtr);
  
  CLP_SetRS(InstancePtr);  
  CLP_WriteByte(InstancePtr, byte);    
}


void CLP_WaitUntilNotBusy(PmodCLP *InstancePtr){ 
  u8 bStatus;
	bStatus = CLP_ReadStatus(InstancePtr);
	while (bStatus & mskBStatus)
	{
		usleep(10);
		bStatus = CLP_ReadStatus(InstancePtr);
	}
}

u8 CLP_ReadStatus(PmodCLP *InstancePtr){
  CLP_ClearRS(InstancePtr);
  u8 bStatus = CLP_ReadByte(InstancePtr);
  
	return bStatus;
}


u8 CLP_ReadByte(PmodCLP *InstancePtr) {  
  u8 byte;
  u8 uppernibble, lowernibble;  

  uppernibble=CLP_ReadNibble(InstancePtr);
  usleep(waitExecutionTime1stnibble);   
  lowernibble=CLP_ReadNibble(InstancePtr);

  byte= (uppernibble<<4) | lowernibble;   

  return byte;
}


u8 CLP_ReadNibble(PmodCLP *InstancePtr){
  u32 dword;
  u8 nibble;

  XGpio_SetDataDirection(&(InstancePtr->CLPComIp), CLP_GPIO_CHANNEL_DATA,
			    CLP_GPIO_DIRECTION_IN); 
  
  CLP_SetRW(InstancePtr);     
  CLP_SetE(InstancePtr); //maybe additional wait/noop before E are required to fulfill timing diagram

  dword=XGpio_DiscreteRead(&(InstancePtr->CLPComIp), CLP_GPIO_CHANNEL_DATA);
  
  CLP_ClearE(InstancePtr); //maybe additional wait/noop before E are required to fulfill timing diagram
  CLP_ClearRW(InstancePtr); 

  //current HW interafaces implements db7 downto db0 however nibble mode uses just db7 downto db4   
  //->  to get nibble corretcly shift right by 4
  nibble=(u8)(dword>>4); 

  return nibble;
}


void CLP_WriteByte(PmodCLP *InstancePtr, u8 byte) {  
  u8 uppernibble= (byte & 0xF0) >>4;
  u8 lowernibble= byte & 0x0F;

  CLP_WriteNibble(InstancePtr, uppernibble); 
  usleep(waitExecutionTime1stnibble);   
  CLP_WriteNibble(InstancePtr, lowernibble); 

  //wait execution time: in init handled directly, later during operation handled by reading busyflag
  //-> comment it out here
    //usleep(waitExecutionTime); 
    //usleep(waitExecutionTimeClearDisplayReturnHome);
}


void CLP_WriteNibble(PmodCLP *InstancePtr, u8 nibble){
  u8 correctednibble;
  
   //nibble mode uses only db7 downto db4, current HW platform has db7 downto 0 connected -> use only db7 downto 4 -> shift left by 4
  correctednibble= nibble<<4;

  XGpio_SetDataDirection(&(InstancePtr->CLPComIp), CLP_GPIO_CHANNEL_DATA,
			    CLP_GPIO_DIRECTION_OUT);   
    
  CLP_ClearRW(InstancePtr);  
  CLP_SetE(InstancePtr); //maybe additional wait/noop before E are required to fulfill timing diagram  
  
  XGpio_DiscreteWrite(&(InstancePtr->CLPComIp), CLP_GPIO_CHANNEL_DATA, correctednibble); 
  
  CLP_ClearE(InstancePtr); //maybe additional wait/noop before and after E are required to fulfill timing diagram   
  CLP_SetRW(InstancePtr); 

}


void CLP_SetRS(PmodCLP *InstancePtr){
  XGpio_DiscreteSet(&(InstancePtr->CLPComIp), CLP_GPIO_CHANNEL_CONTROL, CLP_GPIO_CONTROL_RS_MASK);
}  
void CLP_ClearRS(PmodCLP *InstancePtr){
  XGpio_DiscreteClear(&(InstancePtr->CLPComIp), CLP_GPIO_CHANNEL_CONTROL, CLP_GPIO_CONTROL_RS_MASK);
}
void CLP_SetRW(PmodCLP *InstancePtr){
  XGpio_DiscreteSet(&(InstancePtr->CLPComIp), CLP_GPIO_CHANNEL_CONTROL, CLP_GPIO_CONTROL_RW_MASK);
}
void CLP_ClearRW(PmodCLP *InstancePtr){
  XGpio_DiscreteClear(&(InstancePtr->CLPComIp), CLP_GPIO_CHANNEL_CONTROL, CLP_GPIO_CONTROL_RW_MASK); 
}
void CLP_SetE(PmodCLP *InstancePtr){
  XGpio_DiscreteSet(&(InstancePtr->CLPComIp), CLP_GPIO_CHANNEL_CONTROL, CLP_GPIO_CONTROL_E_MASK);
}
void CLP_ClearE(PmodCLP *InstancePtr){
  XGpio_DiscreteClear(&(InstancePtr->CLPComIp), CLP_GPIO_CHANNEL_CONTROL, CLP_GPIO_CONTROL_E_MASK);
}
