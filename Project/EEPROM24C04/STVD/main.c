/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */


#include "main.h"
//===========================khai bao cac chan vao ra======================//
#define LED_PORT  GPIOA//khai bao lED o PORTB
#define LED_PIN  GPIO_PIN_3//khai bao LED1 o chan PB0
#define BUT_PORT	GPIOC
#define BUT_PIN  	GPIO_PIN_4//khai bao BUTTON o chan PC7
//============================khai bao bien va hang==========================//
uint8_t DataEEprom ; 
uint16_t DataMPU;
float AccX;
//============================khai bao ham==================================//
void Clock_setup(void);	//thiet lap xung clk cho MCU
void GPIO_setup(void);	//thiet lap GPIO
//============================HAM MAIN=======================================//
int main()
{
	Clock_setup();//goi lai ham
	GPIO_setup();//goi lai ham
	delay_config();
	I2C_init();
	uart_init();
	initMPU6050();
	while (1)
	{
		//DataEEprom = I2C_Read_Eeprom();
		DataMPU = I2C_Read_MPU6050();
		
		//AccX = DataMPU/4096.0;
		//AccX = AccX * 100;
		uart1_number((int)DataMPU);
		uart1_nline();
		delay_ms(1000);
	}
}

void Clock_setup(void)
{
	//KHAI BAO XUNG CLK
	CLK_DeInit();   
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
}
void GPIO_setup(void)
{
	///RESET CAC PORT
	GPIO_DeInit(GPIOD);
	GPIO_DeInit(GPIOC);
	GPIO_DeInit(GPIOA);
	GPIO_DeInit(GPIOE);
	GPIO_DeInit(GPIOB);   
	GPIO_DeInit(GPIOF);
	//KHAI BAO CAC CHAN VAO RA
	GPIO_Init(LED_PORT,LED_PIN,GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(GPIOB, GPIO_PIN_4 | GPIO_PIN_5, GPIO_MODE_OUT_OD_HIZ_SLOW);
}





