/******************************************************************************/
/*                                                                            */
/* PmodCLP.h -- PmodCLP Example Projects (adapted from PmodCLS)               */
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
/* Revision History:               
*/
/*    01/22/2025: strongly adapted                                                                         */
/*    06/15/2016(MikelSkreen): Created                                        */
/*    08/17/2017(jPeyron):     Updated                                        */
/*    11/03/2017(artvvb):      2016.4 Maintenance                             */
/*    02/12/2018(atangzwj):    Validated for Vivado 2017.4                    */
/*                                                                            */
/******************************************************************************/

#ifndef PMODCLP_H
#define PMODCLP_H


/****************** Include Files ********************/

#include "xil_types.h"
#include "xstatus.h"
#include "xgpio.h"
#include "xgpio_l.h"
#include "sleep.h"


/* ------------------------------------------------------------ */
/*                  Definitions                                 */
/* ------------------------------------------------------------ */
#define CLP_GPIO_CHANNEL_CONTROL 1
#define CLP_GPIO_CHANNEL_DATA 2
#define CLP_GPIO_DIRECTION_IN 0xffffffff
#define CLP_GPIO_DIRECTION_OUT 0x00000000
#define CLP_GPIO_INTERUPTS_OFF 0xffffffff

#define CLP_GPIO_CONTROL_RS_MASK 0x1
#define CLP_GPIO_CONTROL_RW_MASK 0x2
#define CLP_GPIO_CONTROL_E_MASK 0x4


// Commands for the display list (taken from mplab example)
//#define cmdLcdFcnInit 	0x38	// function set command, (8-bit interface, 2 lines, and 5x8 dots)
#define cmdLcdFcnInit 	0x2C    // function set command, (4-bit interface, 2 lines, and 5x8 dots)

#define cmdLcdCtlInit 	0x08	// display control set command
#define displaySetOptionDisplayOn	0x4 // Set Display On option
#define	displaySetOptionCursorOn 	0x2 // Set Cursor On option
#define	displaySetBlinkOn 			0x1 // Set Blink On option

#define cmdLcdEntryModeInit 0x06 //increment and no shift

#define cmdLcdClear		0x01		// clear display command
#define cmdLcdRetHome	0x02		// return home command
#define cmdLcdDisplayShift 0x18		// shift display command
#define cmdLcdCursorShift  0x10		// shift cursor command
#define cmdLcdSetDdramPos	0x80	// set DDRAM position command
#define cmdLcdSetCgramPos	0x40	// set CGRAM position command

#define waitInitPowerOn 30000 //30000us 30ms
#define waitExecutionTimeClearDisplayReturnHome 1640 //1640us 1.64ms
#define waitExecutionTime 40 //40us typically for all other commands
#define waitExecutionTime1stnibble 1 //1us 

#define mskBStatus 0x80		// bit busy 
#define mskShiftRL 0x04		// bit busy 




#define posCgramChar0 0		// position in CGRAM for character 0
#define posCgramChar1 8		// position in CGRAM for character 1
#define posCgramChar2 16	// position in CGRAM for character 2
#define posCgramChar3 24	// position in CGRAM for character 3
#define posCgramChar4 32	// position in CGRAM for character 4
#define posCgramChar5 40	// position in CGRAM for character 5
#define posCgramChar6 48	// position in CGRAM for character 6
#define posCgramChar7 56	// position in CGRAM for character 7

/* ------------------------------------------------------------ */
/*                  Errors Definitions                          */
/* ------------------------------------------------------------ */

#define CLP_LCDS_ERR_SUCCESS           0 // Action completed successfully
#define CLP_LCDS_ERR_ARG_ROW_RANGE     1 // Argument not within 0, 2 range for
                                         // rows
#define CLP_LCDS_ERR_ARG_COL_RANGE     2 // Argument not within 0, 39 range
#define CLP_LCDS_ERR_ARG_ERASE_OPTIONS 3 // Argument not within 0, 2 range for
                                         // erase types
#define CLP_LCDS_ERR_ARG_BR_RANGE      4 // Argument not within 0, 6 range
#define CLP_LCDS_ERR_ARG_TABLE_RANGE   5 // Argument not within 0, 3 range for
                                         // table selection
#define CLP_LCDS_ERR_ARG_COMM_RANGE    6 // Argument not within 0, 7 range
#define CLP_LCDS_ERR_ARG_CRS_RANGE     7 // Argument not within 0, 2 range for
                                         // cursor modes
#define CLP_LCDS_ERR_ARG_DSP_RANGE     8 // Argument not within 0, 3 range for
                                         // display settings types
#define CLP_LCDS_ERR_ARG_POS_RANGE     9 // Argument not within 0, 7 range for
                                         // characters position in the memory

// Other defines used for library functions


/* ------------------------------------------------------------ */
/*                  Register Addresses Definitions              */
/* ------------------------------------------------------------ */

/* ------------------------------------------------------------ */
/*                  Bit Masks Definitions                       */
/* ------------------------------------------------------------ */

/* ------------------------------------------------------------ */
/*                  Parameters Definitions                      */
/* ------------------------------------------------------------ */

/* ------------------------------------------------------------ */
/*                  Procedure Declarations                      */
/* ------------------------------------------------------------ */

typedef struct PmodCLP {
   XGpio_Config *CLPComIpConfig;
   XGpio CLPComIp;
} PmodCLP;

void CLP_begin(PmodCLP *InstancePtr, u32 BaseAddress);
void CLP_end(PmodCLP *InstancePtr);
int CLP_ComIpInit(PmodCLP *InstancePtr, u32 BaseAddress);
int ClP_ClpInit(PmodCLP *InstancePtr);

u8 CLP_WriteStringAtPos(PmodCLP *InstancePtr, uint8_t idxRow, uint8_t idxCol,
      char *strLn);
void CLP_SetWriteDdramPosition(PmodCLP *InstancePtr, u8 bAdr);

//void CLP_WriteBytesAtPosCgram(PmodCLP *InstancePtr, u8 *pBytes, u8 len, u8 bAdr);
//void CLP_SetWriteCgramPosition(PmodCLP *InstancePtr, u8 bAdr);

//void CLP_DisplaySet(PmodCLP *InstancePtr, u8 bDisplaySetOptions);
//void CLP_DisplayShift(PmodCLP *InstancePtr,u8 fRight);
//void CLP_CursorShift(PmodCLP *InstancePtr, u8 fRight);
//void CLP_ReturnHome(PmodCLP *InstancePtr);
void CLP_DisplayClear(PmodCLP *InstancePtr);
void CLP_FunctionSet(PmodCLP *InstancePtr);

void CLP_WriteCommand(PmodCLP *InstancePtr, u8 cmd);
void CLP_WriteDataByte(PmodCLP *InstancePtr, u8 byte);
void CLP_WaitUntilNotBusy(PmodCLP *InstancePtr);
u8 CLP_ReadStatus(PmodCLP *InstancePtr);
u8 CLP_ReadByte(PmodCLP *InstancePtr);
u8 CLP_ReadNibble(PmodCLP *InstancePtr);
void CLP_WriteByte(PmodCLP *InstancePtr, u8 byte);
void CLP_WriteNibble(PmodCLP *InstancePtr, u8 nibble);
void CLP_SetRS(PmodCLP *InstancePtr);
void CLP_ClearRS(PmodCLP *InstancePtr);
void CLP_SetRW(PmodCLP *InstancePtr);
void CLP_ClearRW(PmodCLP *InstancePtr);
void CLP_SetE(PmodCLP *InstancePtr);
void CLP_ClearE(PmodCLP *InstancePtr);

#endif // PMODCLP_H
