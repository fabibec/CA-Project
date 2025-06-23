#include "clp_registertest.h"
#define __MICROBLAZE__ 

#include "PmodCLP.h"
#include "PmodMAXSONAR.h"
#include <xil_io.h>
#include <xil_types.h>

int main(){

  const UINTPTR sonar = 0x00020000;
  const UINTPTR clp = 0x00010000;

  CLP_initialize(clp);
  char s1[] = "";
  char s2[] = "*";
  char s3[] = "#";

  while(1){
    CLP_writeDisplay(clp, s1);
    usleep(100000);
    CLP_writeDisplay(clp, s2);
    usleep(100000);
    CLP_writeDisplay(clp, s3);
    usleep(100000);
  }
  return 0;
}