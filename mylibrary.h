#ifndef __MYLIBRARY_H
#define __MYLIBRARY_H

#include "stm8s.h"
#include "stdio.h"
/*DEFINE ASCII CHARACTER*/
#define NEW_LINE    10
#define SPACE       32

/*
-------------------Function------------------
*/


/*------------Ham Delay Timer4-----------*/
void delay_msSetup(void);
void delay_ms(uint16_t u16Delay);


/*-----------Ham truyen Data UART1-------------*/
/*	pin 2  PD5/ AIN5/ UART1 data transmit
	pin 3 PD6/ AIN6/ UART1 data receive	*/
void UART1_Setup(void);
void UART1_number(uint8_t data);
void UART1_String(const char *cy);


/*--------------------Ham I2C------------------*/
void I2C_init(uint32_t I2C_CLOCK, uint8_t I2C_ADDR);
void I2C_start(void);
void I2C_address(uint8_t I2C_ADDR, uint8_t mode);
void I2C_write(uint8_t data);
void I2C_stop(void);

#endif