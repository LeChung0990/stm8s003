#ifndef LIB_H_
#define LIB_H_

#include "stm8s.h"
typedef enum
{
  I2C_DIRECTION_TX = (uint8_t)0x00,  /*!< Transmission direction */
  I2C_DIRECTION_RX = (uint8_t)0x01   /*!< Reception direction */
} I2C_Direction_TypeDef;

typedef enum {
    FLASH_MEMTYPE_PROG      = (uint8_t)0xFD, /*!< Program memory */
    FLASH_MEMTYPE_DATA      = (uint8_t)0xF7  /*!< Data EEPROM memory */
} FLASH_MemType_TypeDef;
#define FLASH_RASS_KEY1 ((uint8_t)0x56) /*!< First RASS key */
#define FLASH_RASS_KEY2 ((uint8_t)0xAE) /*!< Second RASS key */


void Timer4Config(void);
void Timer4DelayMs(uint16_t u16Delay);

void I2C_init(void);
void I2C_start(void);
void I2C_stop(void);
void I2C_address(uint8_t I2C_ADDR, I2C_Direction_TypeDef Direction);
void I2C_write(uint8_t data);
uint8_t I2C_ByteRead(uint8_t I2C_Slave_Address, uint8_t ReadAddr);


void uart_init(void);
void uart1_number(int number);
void uart1_string(const char *cy);
void uart1_nline(void);

#endif