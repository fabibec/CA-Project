#ifndef PMODCLP_H
#define PMODCLP_H
#define __MICROBLAZE__ 


/****************** Include Files ********************/

#include <xil_types.h>

/************ Register offset definition ************/

#define CLP_GCSR_OFFSET   0x00
#define CLP_GIER_OFFSET   0x04
#define CLP_IPIER_OFFSET  0x08
#define CLP_IPISR_OFFSET  0x0C
#define CLP_IDR_OFFSET    0x10
#define CLP_VERR_OFFSET   0x14
#define CLP_SCSR0_OFFSET  0x18
#define CLP_CCR_OFFSET    0x1C
#define CLP_CDR_OFFSET    0x20
#define CLP_DCR_OFFSET    0x24

/************ Register mask definition ************/

#define CLP_GCSR_AP_START_MASK             0x00000001
#define CLP_GCSR_AP_DONE_MASK              0x00000002

#define CLP_SCSR0_LED_INITIALIZED_MASK     0x00000001
#define CLP_SCSR0_LED_STATE_MASK           0x000001FE
#define CLP_SCSR0_LED_ERROR_FLAG_MASK      0x00000200

#define CLP_CCR_DRAM_POS_LAST_WRITTEN_MASK 0x000000FF
#define CLP_CCR_WRITE_CHAR_MASK            0x00010000

#define CLP_CDR_SYMBOL_TO_WRITE_MASK       0x000000FF

#define CLP_DCR_CLEAR_DISPLAY_MASK         0x00000001
#define CLP_DCR_RETURN_HOME_MASK           0x00000002
#define CLP_DCR_CURSOR_ON_MASK             0x00000004
#define CLP_DCR_CURSOR_BLINK_MASK          0x00000008
#define CLP_DCR_CURSOR_APPLY_MASK          0x00000010
#define CLP_DCR_DISPLAY_LINE_MASK          0x00000020

/************ Return values definition ************/

#define CLP_SUCCESS          0x00
#define CLP_STRING_TOO_LONG  0x01
#define CLP_INIT_ERROR       0x02
#define CLP_UNAVAILIABLE     0x03
#define CLP_TIMEOUT_ERROR    0x04
#define CLP_ACK_ERROR        0x05
#define CLP_LCD_ERROR        0x06
#define CLP_ERROR            0x07
#define CLP_UNEXPECTED_ERROR 0xFF

/************ typedefs ************/

typedef enum bool{
  false,
  true
}  bool;

/************ Function declarations ************/


u8 CLP_initialize(UINTPTR baseAddr);
u8 CLP_checkAvailiableDisplay(UINTPTR baseAddr);
u8 CLP_clearDisplay(UINTPTR baseAddr);
u8 CLP_writeDisplay(UINTPTR baseAddr, char* inString);
u8 CLP_setCursor(UINTPTR baseAddr, u8 blink, u8 on);
u16 CLP_testRegisters(UINTPTR baseAddr);

#endif // PMODCLP_H
