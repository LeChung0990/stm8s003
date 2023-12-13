#ifndef LIB_H_
#define LIB_H_

#include "stm8s.h"
typedef enum
{
  I2C_DIRECTION_TX = (uint8_t)0x00,  /*!< Transmission direction */
  I2C_DIRECTION_RX = (uint8_t)0x01   /*!< Reception direction */
} I2C_Direction_TypeDef;

void Timer4Config(void);
void Timer4DelayMs(uint16_t u16Delay);

void I2C_init(void);
void I2C_start(void);
void I2C_stop(void);
void I2C_address(uint8_t I2C_ADDR, I2C_Direction_TypeDef Direction);
void I2C_write(uint8_t data);


#endif