/******************************************************************************/
/*                                                                            */
/* main.c -- PmodCLP Example Projects (adapted from PmodCLS)                                         */
/*                                                                            */
/******************************************************************************/
/* Author: Mikel Skreen                                                       */
/*                                                                            */
/******************************************************************************/
/* File Description:                                                          */
/*                                                                            */
/* This demo sends data through GPIO to the PmodCLP. The demo alters the first */
/* string slightly so you can see that the data is changing between the       */
/* different prints to the PmodCLP. Depending on the Rev of the PmodCLS the   */
/* jumper configuration will be different. Make sure to refer to the          */
/* Reference Manual for the correct jumper configuration.                     */
/*                                                                            */
/******************************************************************************/
/* Revision History:                                                          */
/*                                                                            */
/*    06/15/2016(MikelSkreen): Created                                        */
/*    08/17/2017(jPeyron):     Updated                                        */
/*    11/03/2017(artvvb):      2016.4 Maintenance                             */
/*    02/12/2018(atangzwj):    Validated for Vivado 2017.4                    */
/*                                                                            */
/******************************************************************************/
/* Baud Rates:                                                                */
/*                                                                            */
/* Microblaze: 9600 or what was specified in UARTlite core                    */
/* Zynq: 115200                                                               */
/*                                                                            */
/******************************************************************************/

#include <stdio.h>
#include "PmodCLP.h"
#include "sleep.h"
#include "string.h"
#include "xil_cache.h"
#include "xil_printf.h"
#include "xparameters.h"

void DemoInitialize();
void DemoRun();
void DemoCleanup();
void EnableCaches();
void DisableCaches();

PmodCLP myDevice;

int main(void) {
   DemoInitialize();
   DemoRun();
   DemoCleanup();
   return 0;
}

void DemoInitialize() {
   EnableCaches();
   //DM 
     ///CLP_begin(&myDevice, XPAR_PMODCLS_0_AXI_LITE_SPI_BASEADDR); 
     //CLP_begin(&myDevice, XPAR_AXI_QUAD_SPI_0_BASEADDR);  
     //CLP_begin(&myDevice, XPAR_AXI_IIC_0_BASEADDR);
     //CLP_begin(&myDevice, XPAR_AXI_UARTLITE_1_BASEADDR);
     xil_printf("\n\rbefore init\r\n");
     CLP_begin(&myDevice, XPAR_AXI_GPIO_1_BASEADDR); 
     xil_printf("\n\rinit done\r\n");
   //END DM  
}

void DemoRun() {
   char szInfo1[32];
   char szInfo2[32];

   CLP_DisplayClear(&myDevice);
   strcpy(szInfo1, "  PmodCLP Demo");
   strcpy(szInfo2, "  Hello World!");
   CLP_WriteStringAtPos(&myDevice, 0, 0, szInfo1);
   CLP_WriteStringAtPos(&myDevice, 1, 0, szInfo2);

   usleep(500000);

   while (1) {
      CLP_DisplayClear(&myDevice);
      strcpy(szInfo1, "->PmodCLP Demo<- ");
      CLP_WriteStringAtPos(&myDevice, 0, 0, szInfo1);
      CLP_WriteStringAtPos(&myDevice, 1, 0, szInfo2);

      usleep(500000);

      CLP_DisplayClear(&myDevice);
      strcpy(szInfo1, "  PmodCLP Demo   ");
      CLP_WriteStringAtPos(&myDevice, 0, 0, szInfo1);
      CLP_WriteStringAtPos(&myDevice, 1, 0, szInfo2);

      usleep(500000);
   }
}

void DemoCleanup() {
   CLP_end(&myDevice);
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
