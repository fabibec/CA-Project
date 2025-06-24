/******************************************************************************/
/*                                                                            */
/* PmodMAXSONAR.h -- Driver definitions for the PmodMAXSONAR                  */
/*                                                                            */
/******************************************************************************/
/* Author: Arvin Tang                                                         */
/*                                                                            */
/******************************************************************************/
/* File Description:                                                          */
/*                                                                            */
/* This file contains the drivers for the PmodMAXSONAR IP from Digilent       */
/*                                                                            */
/******************************************************************************/
/* Revision History:                                                          */
/*                                                                                   */
/*    10/18/2017(atangzwj): Created                                           */
/*                                                                            */
/******************************************************************************/

#ifndef PmodMAXSONAR_H
#define PmodMAXSONAR_H

/************ Include Files ************/

#include "xil_types.h"
#include "xstatus.h"

//DM
#include "xgpio.h"
#include "xuartlite.h"
#include "xuartlite_l.h"

//Pmodmaxsonar uart protocol:
//When maxsonar-rx 1 -> 5 bytes: 'R' <3digitsdistance(max255)> 0x13 //0x13= ASCII CR 
#define PACKET_SIZE 5 
#define BUFFER_SIZE PACKET_SIZE  

//DM end

/************ Type Definitions ************/

typedef struct PmodMAXSONAR {
   u32 UART_addr;
   u32 GPIO_addr;
   u32 ClockFreq;

   XGpio* pmyXGpio;
   XUartLite* pmyXUart;

} PmodMAXSONAR;


/************ Function Prototypes ************/

void MAXSONAR_begin(PmodMAXSONAR *InstancePtr, XUartLite *myXUart, XGpio *myXGpio, u32 UART_Address, u32 GPIO_Address, u32 clk_freq);

u32 MAXSONAR_getDistance(PmodMAXSONAR *InstancePtr);

#endif // PmodMAXSONAR_H
