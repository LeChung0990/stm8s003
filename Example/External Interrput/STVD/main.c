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
void Clock_setup(void);	//thiet lap xung clk cho MCU
void GPIO_setup(void);	//thiet lap GPIO
void Exti_Config(void);	//thiet lap ngat ngoai

//============================HAM MAIN=======================================//
int main()
{
	Clock_setup();//goi lai ham
	GPIO_setup();//goi lai ham
	Exti_Config();
	delay_config();
	while (1)
	{
		/*
		GPIO_WriteLow(LED_PORT,LED1_PIN);//goi muc 0 ra LED1
		delay_ms(1000);
		GPIO_WriteHigh(LED_PORT,LED1_PIN);//goi muc 1 ra LED1
		delay_ms(1000);
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
	GPIO_Init(LED_PORT,LED1_PIN,GPIO_MODE_OUT_PP_LOW_FAST);
}
void Exti_Config(void){
	GPIO_Init(GPIOD, GPIO_PIN_4, GPIO_MODE_IN_PU_IT);
	EXTI_DeInit();
	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOD, EXTI_SENSITIVITY_FALL_ONLY);
	enableInterrupts();
}




