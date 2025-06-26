/******************************************************************************/
/*                                                                            */
/* PmodMAXSONAR.c -- Driver definitions for the PmodMAXSONAR                  */
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
/*                                                                            */
/*    10/18/2017(atangzwj): Created                                           */
/*    01/20/2018(atangzwj): Validated for Vivado 2017.4                       */
/*                                                                            */
/******************************************************************************/

/************ Include Files ************/

#include "PmodMAXSONAR.h"
#include "xil_io.h"

///DM
#include "sleep.h"
#include "stdlib.h"

/*
 * The following buffers are used in this example to send and receive data
 * with the UartLite.
 */
extern u8 SendBuffer[BUFFER_SIZE];	/* Buffer for Transmitting Data */
extern u8 RecvBuffer[BUFFER_SIZE];	/* Buffer for Receiving Data */

//DM end

/************ Function Definitions ************/

/*
 * 
 * -----------------------------------------------------------------------------
 * Parameters:
 *
 * Return:
 *    void
 *
 * Description:
 *    Initialize the PmodMAXSONAR IP
 */
 ///DM
void MAXSONAR_begin(PmodMAXSONAR *InstancePtr, XUartLite *myXUart, XGpio *myXGpio, u32 UART_Address, u32 GPIO_Address, u32 clk_freq) {
  int Status;
  int Index;

  ///init internal structures   
  //init PmodMAXSONAR internal structure
  InstancePtr->pmyXGpio=myXGpio; //TODO assert
  InstancePtr->pmyXUart=myXUart; //TODO assert
   
  InstancePtr->UART_addr = UART_Address;
  InstancePtr->GPIO_addr = GPIO_Address;
  InstancePtr->ClockFreq = clk_freq;

  //init GPIO internal structure
  Status = XGpio_Initialize( InstancePtr->pmyXGpio,  InstancePtr->GPIO_addr);
  if (Status != XST_SUCCESS) {
	  xil_printf("Gpio Initialization Failed\r\n");
	  return; //XST_FAILURE;
	}

  //init UART internal structure
  Status = XUartLite_Initialize( InstancePtr->pmyXUart, InstancePtr->UART_addr);
  if (Status != XST_SUCCESS) {
	  xil_printf("Uart Initialization Failed\r\n");
	  return; //XST_FAILURE;
	}


  ///init GPIO 
  //configure maxsonar-rx pin as FPGA GPIO out pin (already done fixed in HW)
    //XGpio_SetDataDirection(InstancePtr->pmyXGpio, 0, 0); //channel 1, direction in=1 / out=0 //TODO Check
  //Set maxsonar-rx 0
  XGpio_DiscreteWrite(InstancePtr->pmyXGpio, 1, 0);


  ///init UART 
  //configure maxsonar-tx pin as FPGA uartlite IP rx (9600, 8 bits, no parity, single stop) (already done fixed in HW)

  //init UART RX/TX buffers
  /*
	 * Initialize the send buffer bytes with a pattern to send and the
	 * the receive buffer bytes to zero.
	 */
	for (Index = 0; Index < BUFFER_SIZE; Index++) {
		SendBuffer[Index] = Index;
		RecvBuffer[Index] = 0;
	}


   
  ///init pmod maxsonar
  usleep(250000);  //allow for powerup before sending RX command to trigger selfcalibration
  XGpio_DiscreteWrite(InstancePtr->pmyXGpio, 1, 1); //set maxsonar-rx 1
  usleep(49000);  //delay for calibration after RX pin is left open or held high
  usleep(49000);  //delay for initial range reading; //TODO check: 100ms instead of 49ms wait time for first reading? docu is not precise here ...
  xil_printf("Getting Range Data:\n\r");

///DM end
}

/*
 * 
 * -----------------------------------------------------------------------------
 * Parameters: 
 *
 * Return:
 *    Distance to object detected by PmodMAXSONAR (in inches)
 *
 * Description:
 *    Return distance to object detected by PmodMAXSONAR, rounded to the nearest
 *    integer
 */
u32 MAXSONAR_getDistance(PmodMAXSONAR *InstancePtr) {
  ///DM
  int i = 0;
	uint16_t data = 0;
	char tmpdatachararr[3];
  u32 output=0;
	
  //int Status;
	unsigned int SentCount;
	unsigned int ReceivedCount = 0;
	//int index;

  //step 1 data quisition
	while(XUartLite_IsReceiveEmpty( InstancePtr->UART_addr) && (i < 50)){  //timeout
		usleep(1000); 
		i++;
	}
  
  while (1) {
		ReceivedCount += XUartLite_Recv( InstancePtr->pmyXUart,
						RecvBuffer + ReceivedCount,
						PACKET_SIZE - ReceivedCount);
		if (ReceivedCount == PACKET_SIZE) {
			break;
		}
	}
  
  //step 2 packet parsing  
  if (RecvBuffer[0] == 'R'){
    for(i = 0; i < 3; i++){
      tmpdatachararr[i]=RecvBuffer[i+1];
    }    
    if (RecvBuffer[4] == 0x0D){ //check for carridge return
      data = atoi(tmpdatachararr);
    }
    else{
      data = 0;  //packet error
    }
  }    
  else{
			data = 0;  //packet error
  }    
    
	if(i >= 50){
		data = 1;	//timeout error
	}
  
  //step 3 conv inch to cem and return data as cm
  output=254 * data / 100; // output=data* 2.54 (conv to cm)
  return output;    
  ///DM end
}
