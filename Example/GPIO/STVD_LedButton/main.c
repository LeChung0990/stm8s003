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

//============================khai bao ham==================================//
void Clock_setup(void);	//thiet lap xung clk cho MCU
void GPIO_setup(void);	//thiet lap GPIO

//============================HAM MAIN=======================================//
int main()
{
	Clock_setup();//goi lai ham
	GPIO_setup();//goi lai ham
	delay_config();
	while (1)
	{
		/*Nhan Nut Dao trang thai LED*/
		if(GPIO_ReadInputPin(BUT_PORT, BUT_PIN)== RESET)
		{
			delay_ms(200);
			while(GPIO_ReadInputPin(BUT_PORT, BUT_PIN)== RESET);
			GPIO_WriteReverse(LED_PORT, LED_PIN);
		}
		
		
		/*Nhan nut led sang, tha ra LED tat*/
		/*
		if(GPIO_ReadInputPin(BUT_PORT, BUT_PIN)== RESET)
		{
			delay_ms(200);
			if(GPIO_ReadInputPin(BUT_PORT, BUT_PIN)== RESET)
			{
				GPIO_WriteHigh(LED_PORT, LED_PIN);
				GPIO_WriteLow(LED_PORT, LED_PIN);
			}
			else
			{
				GPIO_WriteLow(LED_PORT, LED_PIN);
				GPIO_WriteHigh(LED_PORT, LED_PIN);
			}
		}
		
		*/
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
}





