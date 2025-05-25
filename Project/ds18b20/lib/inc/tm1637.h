/* i2c.h */

#ifndef I2C_H_
#define I2C_H_

#include "tim.h"
#include "stm8s_gpio.h"

#define PIN_CLK GPIO_PIN_6 /* clk (pin c6)*/
#define PIN_DIO GPIO_PIN_7 /* dio (pin c7)*/

#define I2C_DELAY   delay_us(2);
#define CLK_1 	    GPIO_WriteHigh(GPIOC, PIN_CLK)
#define CLK_0  	    GPIO_WriteLow(GPIOC, PIN_CLK)
#define DIO_1 	    GPIO_WriteHigh(GPIOC, PIN_DIO)
#define DIO_0  	    GPIO_WriteLow(GPIOC, PIN_DIO)


void TM1637_SEND_COMMAND(const uint8_t value);
void TM1637_SEND_CONFIG(const uint8_t enable, const uint8_t brightness);
void TM1637_INIT(uint8_t enable, const uint8_t brightness);
void TM1637_display_segments(const uint8_t position, const uint8_t segments);
void TM1637_DISPLAY_DIGIT(const uint8_t position, const uint8_t digit);
void TM1637_clear(void);


#endif