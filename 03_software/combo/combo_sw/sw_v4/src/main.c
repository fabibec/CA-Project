#define __MICROBLAZE__ 

#include "PmodCLP.h"
#include "PmodMAXSONAR.h"
#include <xil_io.h>
#include <xil_types.h>

void itoa(char* str, int number){
  str[0] = (number/100) + '0';
  number = number%100;

  str[1] = (number/10) + '0';
  number = number%10;

  str[2] = (number) + '0';

  str[3] = '\0';
}

int main(){

  const UINTPTR sonar = 0x00020000;
  const UINTPTR clp = 0x00010000;

  CLP_initialize(clp);
  SON_initialize(sonar);
  char s2[] = "cm";
  char s1[4] = {0};
  int dist;
  while(1){
    dist = SON_getCM(sonar);
    itoa(s1,dist);
    CLP_clearDisplay(clp);
    usleep(100000);
    CLP_writeDisplay(clp,s1);
    CLP_writeDisplay(clp,s2);
    usleep(1000000);
  }
  return 0;
}