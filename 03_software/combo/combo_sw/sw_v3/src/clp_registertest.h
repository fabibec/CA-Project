#ifndef CLP_REGISTERTEST_H
#define CLP_REGISTERTEST_H

#include <xil_types.h>
//32 bit großer wert
#define CLP_TESTVAL 0xA5A5A5A5

void CLP_RegisterTest(UINTPTR baseAddr,u32 offset, u32 testval, u32 mask);

void CLP_testSCSR0(UINTPTR baseAddr);
void CLP_testGCSR(UINTPTR baseAddr);
void CLP_testCCR(UINTPTR baseAddr);
void CLP_testCDR(UINTPTR baseAddr);
void CLP_testDCR(UINTPTR baseAddr);


#endif