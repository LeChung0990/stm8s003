#ifndef __LCD1602_H
#define __LCD1602_H

#include "stm8s.h"

/*  Define LCD use  */

#define RS_PORT     GPIOA
#define RS_PIN      GPIO_PIN_1

#define EN_PORT     GPIOA
#define EN_PIN      GPIO_PIN_2

#define D7_PORT     GPIOD
#define D7_PIN      GPIO_PIN_6

#define D6_PORT     GPIOD
#define D6_PIN      GPIO_PIN_4

#define D5_PORT     GPIOD
#define D5_PIN      GPIO_PIN_3

#define D4_PORT     GPIOD
#define D4_PIN      GPIO_PIN_2

#define PIN_LOW(PORT, PIN)  GPIO_WriteLow(PORT, PIN);
#define PIN_HIGH(PORT, PIN)  GPIO_WriteHigh(PORT, PIN);

void delay_ms(uint16_t u16Delay);
void lcd_init(void);
void lcd_write(uint8_t type, uint8_t data);
void lcd_puts(uint8_t x, uint8_t y, int8_t *string);
void lcd_clear(void);

#endif


