#ifndef __MYLIBRARY_H
#define __MYLIBRARY_H

#include "stm8s.h"

/*DEFINE ASCII CHARACTER*/
#define NEW_LINE    10
#define SPACE       32

/*------------Ham Delay Timer4-----------*/
void delay_msSetup(void);
void delay_ms(uint16_t u16Delay);

/*-----------Ham truyen Data UART1-------------*/
/*	pin 2  PD5/ AIN5/ UART1 data transmit
	pin 3 PD6/ AIN6/ UART1 data receive	*/
void UART1_Setup(void);
void UART1_number(int number);
void UART1_String(const char *cy);

#endif