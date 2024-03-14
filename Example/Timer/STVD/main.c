/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */


#include "main.h"
//===========================khai bao cac chan vao ra======================//
#define LED_PORT  GPIOB//khai bao lED o PORTB
#define LED1_PIN  GPIO_PIN_5//khai bao LED1 o chan PB0
//============================khai bao bien va hang==========================//
//============================khai bao ham==================================//
void Clock_setup(void);//thiet lap xung clk cho MCU
void GPIO_setup(void);//thiet lap GPIO
//============================HAM MAIN=======================================//
int main()
{
	Clock_setup();//goi lai ham
	GPIO_setup();//goi lai ham
	delay_config();
	
	
	while (1)
	{
			GPIO_WriteLow(LED_PORT,LED1_PIN);//goi muc 0 ra LED1
			delay_ms(500);
			GPIO_WriteHigh(LED_PORT,LED1_PIN);//goi muc 1 ra LED1
			delay_ms(500);
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
      GPIO_Init(LED_PORT,LED1_PIN,GPIO_MODE_OUT_OD_LOW_SLOW);
}





