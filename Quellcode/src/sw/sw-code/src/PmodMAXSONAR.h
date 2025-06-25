#ifndef PmodMAXSONAR_H
#define PmodMAXSONAR_H

#define __MICROBLAZE__ 

/************ Include files ************/
#include <xil_types.h>

/************ Register offset definition ************/

#define SON_GCSR_OFFSET   0x00
#define SON_GIER_OFFSET   0x04
#define SON_IPIER_OFFSET  0x08
#define SON_IPISR_OFFSET  0x0C
#define SON_IDR_OFFSET    0x10
#define SON_VERR_OFFSET   0x14
#define SON_SCSR0_OFFSET  0x18
#define SON_DIST0_OFFSET  0x1C
#define SON_UCSR_OFFSET   0x20
#define SON_ADSR_OFFSET   0x24

/************ Register mask definition ************/
                                 
#define SON_GCSR_AP_START_MASK       0x00000001
#define SON_GCSR_AP_DONE_MASK        0x00000002
#define SON_GCSR_AUTO_RESTART_MASK   0x00000080

#define SON_SCSR0_POWERUP_DONE_MASK  0x00000001
#define SON_SCSR0_CONFIG_DONE_MASK   0x00000002
#define SON_SCSR0_READ_VALID_MASK    0x00000004
#define SON_SCSR0_RESET_IP_MASK      0x00000020

#define SON_DIST0_DIST_IN_MASK       0x000000FF

#define SON_ADSR_AD_ERROR_MASK       0x00000001


/************ Return values definition ************/

#define SON_SUCCESS                    0x00
#define SON_TIMEOUT_ERROR              0x01
#define SON_SENSOR_POWERED_OFF_ERROR   0x02
#define SON_NO_VALID_READING           0x03
#define SON_UNEXPECTED_ERROR           0xFF

/************ Function declarations ************/

u8 SON_initialize(UINTPTR baseAddr);
void SON_reset(UINTPTR baseAddr);
u8 SON_getIN(UINTPTR baseAddr);
u16 SON_getCM(UINTPTR baseAddr);
u16 SON_testRegisters(UINTPTR baseAddr);


#endif // PmodMAXSONAR_H