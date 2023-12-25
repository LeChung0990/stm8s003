#include "stm8s.h" 

void delay_config(void);
void delay_ms(unsigned int  u16Delay);
void I2C_init(void);
void I2C_start(void);
void I2C_Re_start(void);
void I2C_stop(void);
void I2C_address(uint8_t I2C_ADDR, I2C_Direction_TypeDef Direction);
void I2C_write(uint8_t data);
uint16_t I2C_Read_MPU6050(void);
uint8_t I2C_Read_Eeprom(void);
void initMPU6050(void);

void uart_init(void);		//thiet lap UART1
void uart1_number(int number);
void uart1_string(const char *cy);
void uart1_nline(void);