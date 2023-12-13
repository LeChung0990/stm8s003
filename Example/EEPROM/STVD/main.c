/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */


#include "main.h"
//===========================khai bao cac chan vao ra======================//
#define LED_PORT  GPIOA//khai bao lED o PORTB
#define LED1_PIN  GPIO_PIN_3//khai bao LED1 o chan PB0
//============================khai bao bien va hang==========================//
//============================khai bao ham==================================//
void Clock_setup(void);//thiet lap xung clk cho MCU
void GPIO_setup(void);//thiet lap GPIO
void Write_EEPROM(uint8_t Data);
uint8_t Read_EEPROM(uint32_t Address);
//============================HAM MAIN=======================================//
int main()
{
	Clock_setup();//goi lai ham
	GPIO_setup();//goi lai ham
	delay_config();
	Write_EEPROM(0xff);
	if(Read_EEPROM(0x4000) == 255) GPIO_WriteHigh(LED_PORT, GPIO_PIN_3);	/*Nhap nhay LED tai chan PD3*/
	else GPIO_WriteLow(LED_PORT, GPIO_PIN_3);
	while (1)
	{
		
	}
}

void Clock_setup()
{
			//KHAI BAO XUNG CLK
			CLK_DeInit();   
			CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
}
void GPIO_setup()
{
		///RESET CAC PORT
	    GPIO_DeInit(GPIOD);
      GPIO_DeInit(GPIOC);
      GPIO_DeInit(GPIOA);
      GPIO_DeInit(GPIOE);
      GPIO_DeInit(GPIOB);   
      GPIO_DeInit(GPIOF);
		//KHAI BAO CAC CHAN VAO RA
      GPIO_Init(LED_PORT,LED1_PIN,GPIO_MODE_OUT_PP_LOW_FAST);
}
void Write_EEPROM(uint8_t Data){
	FLASH_Unlock(FLASH_MEMTYPE_DATA);
	FLASH_ProgramByte(0x4000, Data);
	FLASH_Lock(FLASH_MEMTYPE_DATA);
}
uint8_t Read_EEPROM(uint32_t Address){
	uint8_t Data;
	Data = FLASH_ReadByte(Address);
	return Data;
}





