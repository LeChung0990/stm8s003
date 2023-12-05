#ifndef __74HC595_H
#define __74HC595_H

#include "stm8s.h"

/*DEFINE PORT*/

#define SH_PORT     GPIOC
#define SH_PIN      GPIO_PIN_7

#define DATA_PORT   GPIOC
#define DATA_PIN    GPIO_PIN_5

#define ST_PORT     GPIOC
#define ST_PIN      GPIO_PIN_6

#define PIN_LOW(PORT, PIN)  GPIO_WriteLow(PORT, PIN);
#define PIN_HIGH(PORT, PIN)  GPIO_WriteHigh(PORT, PIN);

void HC595_Init(void);
void ONE7SEG(uint8_t Value);
void FOUR7SEG(uint8_t Digit, uint8_t Value);
void HIENTHI(int so);

#endif
