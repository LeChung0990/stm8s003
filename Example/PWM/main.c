#include "stm8s.h"

void delay_ms(uint16_t u16Delay);

static void TIM2_Config(void)
{
	TIM2_TimeBaseInit(TIM2_PRESCALER_8, 1250);
	TIM2_OC1Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE, 125 ,TIM2_OCPOLARITY_HIGH);
	TIM2_OC1PreloadConfig(ENABLE);
	TIM2_ARRPreloadConfig(ENABLE);

	TIM2_Cmd(ENABLE);
}


void main(void)
{
	
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
	GPIO_DeInit(GPIOD); 	/*CLEAR REGISTER GPIO OR RESET VALUE*/
	GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);
	// TIM4_TimeBaseInit(TIM4_PRESCALER_128, 63 - 1);
	// TIM4_Cmd(ENABLE);
	
	TIM2_Config();
    while(1) {
        // delay_ms(1);
		// GPIO_WriteReverse(GPIOD, GPIO_PIN_3);	/*Nhap nhay LED tai chan PD3*/
    }
}

void delay_ms(uint16_t u16Delay)	//Ham delay dung timer4
{
	
	while (u16Delay) {
		TIM4_SetCounter(0);
		TIM4_ClearFlag(TIM4_FLAG_UPDATE);
		while (TIM4_GetFlagStatus(TIM4_FLAG_UPDATE) == RESET) {
		}
		--u16Delay;
	}
}