#ifndef __ADC_H
#define __ADC_H
#include "main.h"

void ADC_Init(void);
void Read_Vref(void);
uint16_t Read_Vol_Channel(uint8_t Channel);
void Check_Boost_ON(void);

#endif