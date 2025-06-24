#define __MICROBLAZE__ 

#include "PmodCLP.h"
#include "PmodMAXSONAR.h"
#include <xil_io.h>
#include <xil_types.h>
#include <sleep.h>


#define SONAR 0x00020000
#define CLP 0x00010000


//only works with integers up to three digits
void intToString(char* str, unsigned int number){
  //Guard against large numbers
  if(number/1000) return;

  str[0] = (number/100) + '0';
  number = number%100;

  str[1] = (number/10) + '0';
  number = number%10;

  str[2] = (number) + '0';

  //To make it look cleaner
  if(str[0] == '0'){
    str[0] = ' ';
    if(str[1] == '0') str[1] = ' ';
  }

  str[3] = '\0';
}

u16 inchesToCentimeter(u8 inches){
  return (u16)((inches*254)/100);
}


void demo(){
  char welcome[] = "Projekt:        Sonar & Display ";
  char bin1[] = "1";
  char bin0[] = "0";
  char pattern[] = "11101100100110000001001001001110";
    CLP_writeDisplay(CLP, welcome);
    sleep(2);
    for(int i = 0; i<32;i++){
    usleep(200000);
    if(pattern[i] == '1') CLP_writeDisplay(CLP, bin1);
    else CLP_writeDisplay(CLP, bin0);
    }
    sleep(1);
    CLP_clearDisplay(CLP);
}

int main(){
  CLP_initialize(CLP);
  SON_initialize(SONAR);
  CLP_setCursor(CLP, 0, 0);
  demo();
  char s0[] = "    Distanz:     ";
  char s1[4];
  char s2[] = "cm || ";
  char s3[4];
  char s4[] = "in ";
  int distIN, distCM;
  while(1){
    distIN = SON_getIN(SONAR);
    distCM = inchesToCentimeter(distIN);
    if(distIN >= 6) {
      intToString(s3, distIN);
      intToString(s1, distCM);
    }
    CLP_clearDisplay(CLP);
    CLP_writeDisplay(CLP,s0);
    CLP_writeDisplay(CLP,s1);
    CLP_writeDisplay(CLP,s2);
    CLP_writeDisplay(CLP,s3);
    CLP_writeDisplay(CLP,s4);
    usleep(1000); //Not necessary, but makes the display more readable
  }
  return 0;
}

