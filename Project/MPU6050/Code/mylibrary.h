#ifndef __MYLIBRARY_H
#define __MYLIBRARY_H

#include "stm8s.h"
#include "stdio.h"
/*DEFINE ASCII CHARACTER*/
#define NEW_LINE    10
#define SPACE       32

void CLK_HSIConfig(void);
void delay_nop_ms (int time_ms);
/*
-------------------Function------------------
*/
/*------------Ham Delay Timer4-----------*/
// void delay_msSetup(void);
// void delay_ms(uint16_t u16Delay);

// /*-----------Ham truyen Data UART1-------------*/
// /*	pin 2  PD5/ AIN5/ UART1 data transmit
// 	pin 3 PD6/ AIN6/ UART1 data receive	*/
// void UART1_Setup(void);
// void UART1_number(int number);
// void UART1_String(const char *cy);
// void UART1_newline(void);

/*----------Ham OLED LCD SSD1306------------------*/
void I2C_init(void);
void I2C_start(void);
void I2C_stop(void);
void I2C_address(uint8_t I2C_ADDR, I2C_Direction_TypeDef Direction);
void I2C_write(uint8_t data);
uint8_t I2C_ByteRead(uint8_t I2C_Slave_Address, uint8_t ReadAddr)


#endif