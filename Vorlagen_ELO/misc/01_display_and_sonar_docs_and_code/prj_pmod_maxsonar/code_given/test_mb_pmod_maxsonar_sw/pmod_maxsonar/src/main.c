/******************************************************************************/
/*                                                                            */
/* main.c -- Example program using the PmodMAXSONAR IP                        */
/*                                                                            */
/******************************************************************************/
/* Author: Arvin Tang                                                         */
/*                                                                            */
/******************************************************************************/
/* File Description:                                                          */
/*                                                                            */
/* This demo continuously polls the PmodMAXSONAR for distance and prints the  */
/* distance.                                                                  */
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
#include "sleep.h"
#include "xil_cache.h"
#include "xparameters.h"

#include "xgpio.h"
#include "xuartlite.h"


/************ Macro Definitions ************/
///DM
#define PMOD_MAXSONAR_GPIO_BASEADDR XPAR_AXI_GPIO_1_BASEADDR
#define PMOD_MAXSONAR_UART_BASEADDR XPAR_AXI_UARTLITE_1_BASEADDR
#define CLK_FREQ 100000000 
//DM end


/************ Global Variables ************/

///DM
XGpio myXGpio; 

XUartLite myXUart; 

PmodMAXSONAR myDevice;

/*
 * The following buffers are used in this example to send and receive data
 * with the UartLite.
 */
u8 SendBuffer[BUFFER_SIZE];	/* Buffer for Transmitting Data */
u8 RecvBuffer[BUFFER_SIZE];	/* Buffer for Receiving Data */
///DM end


/************ Function Prototypes ************/

void DemoInitialize();

void DemoRun();

void DemoCleanup();

void EnableCaches();

void DisableCaches();


/************ Function Definitions ************/

int main(void) {
   DemoInitialize();
   DemoRun();
   DemoCleanup();
   return 0;
}

void DemoInitialize() {
   EnableCaches();
   ///DM
   MAXSONAR_begin(&myDevice, &myXUart, &myXGpio, PMOD_MAXSONAR_UART_BASEADDR, PMOD_MAXSONAR_GPIO_BASEADDR, CLK_FREQ);
   ///DM end
}


void DemoRun() {
   print("\n\r");
   u32 dist;
   while (1) {
      ///DM
      //set maxsonar-rx 1
      XGpio_DiscreteWrite(myDevice.pmyXGpio, 1, 1); 

      dist = MAXSONAR_getDistance(&myDevice);

      xil_printf("dist (cm) = %4d\n\r", dist);

      //End Serial communication to make Pmod not buffer readings
      //set maxsonar-rx 0
      XGpio_DiscreteWrite(myDevice.pmyXGpio, 1, 0); 

      usleep(200000);
      /// DM end
   }
}

void DemoCleanup() {
   DisableCaches();
}

void EnableCaches() {
#ifdef __MICROBLAZE__
#ifdef XPAR_MICROBLAZE_USE_ICACHE
   Xil_ICacheEnable();
#endif
#ifdef XPAR_MICROBLAZE_USE_DCACHE
   Xil_DCacheEnable();
#endif
#endif
}

void DisableCaches() {
#ifdef __MICROBLAZE__
#ifdef XPAR_MICROBLAZE_USE_DCACHE
   Xil_DCacheDisable();
#endif
#ifdef XPAR_MICROBLAZE_USE_ICACHE
   Xil_ICacheDisable();
#endif
#endif
}
