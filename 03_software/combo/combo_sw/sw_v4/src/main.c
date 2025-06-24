#define __MICROBLAZE__ 

#include "PmodCLP.h"
#include "PmodMAXSONAR.h"
#include <xil_io.h>
#include <xil_types.h>
#include <sleep.h>

void itoa(char* str, int number){
  str[0] = (number/100) + '0';
  number = number%100;

  str[1] = (number/10) + '0';
  number = number%10;

  str[2] = (number) + '0';

  str[3] = '\0';
}

u16 inchesToCentimeter(u8 inches){
  return (u16)((inches*254)/100);
}

int main(){

  const UINTPTR sonar = 0x00020000;
  const UINTPTR clp = 0x00010000;

  CLP_initialize(clp);
  SON_initialize(sonar);
  CLP_setCursor(clp, 0, 0);
  char s0[] = "    Distanz:     ";
  char s1[4];
  char s2[] = "cm || ";
  char s3[4];
  char s4[] = "in";
  int distIN, distCM;
  while(1){
    distIN = SON_getIN(sonar);
    distCM = inchesToCentimeter(distIN);
    if(distIN >= 6) {
      itoa(s3, distIN);
      itoa(s1, distCM);
    }
    CLP_clearDisplay(clp);
    CLP_writeDisplay(clp,s0);
    CLP_writeDisplay(clp,s1);
    CLP_writeDisplay(clp,s2);
    CLP_writeDisplay(clp,s3);
    CLP_writeDisplay(clp,s4);
    usleep(1000); //Not necessary, but makes the display more readable
  }
  return 0;
}