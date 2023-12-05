#include "stm8s.h"

volatile uint16_t adc_value = 0;
void delay_ms(uint16_t u16Delay);
void config(void)
{
	ADC1->CR1 |= (uint8_t)(ADC1_CSR_CH);
	ADC1->CR2 |= (uint8_t)(ADC1_CR2_ALIGN);
	ADC1->CR1 |= (uint8_t)(ADC1_CR1_ADON);

}
uint16_t read_adc(void)
{
	uint16_t value = 0;
	ADC1->CR1 |= (uint8_t)(ADC1_CR1_ADON);
	while(ADC1_GetFlagStatus(ADC1_FLAG_EOC)==0){}
	ADC1_ClearFlag(ADC1_FLAG_EOC);
	value = ADC1_GetConversionValue();
	return value;
}
void main(void)
{
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
	//GPIO_DeInit(GPIOD); 	/*CLEAR REGISTER GPIO OR RESET VALUE*/
	TIM4_TimeBaseInit(TIM4_PRESCALER_128, 125 - 1);
	TIM4_Cmd(ENABLE);

	GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_HIGH_FAST);
	GPIO_Init(GPIOD, GPIO_PIN_2, GPIO_MODE_IN_FL_NO_IT);
	
	ADC1_DeInit();
	ADC1_Init(ADC1_CONVERSIONMODE_SINGLE, ADC1_CHANNEL_3, ADC1_PRESSEL_FCPU_D18, 
		ADC1_EXTTRIG_TIM, DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL3, DISABLE);
	ADC1_Cmd(ENABLE);
    while(1) {
		ADC1_StartConversion();
		while(ADC1_GetFlagStatus(ADC1_FLAG_EOC)==0){}
		ADC1_ClearFlag(ADC1_FLAG_EOC);
		adc_value = ADC1_GetConversionValue();
		if(adc_value > 1000)
		{ GPIO_WriteHigh(GPIOD, GPIO_PIN_3);}
        else 
		{GPIO_WriteLow(GPIOD, GPIO_PIN_3);}
		delay_ms(100);
    }
}

void delay_ms(uint16_t u16Delay)
{
	
	while (u16Delay) {
		TIM4_SetCounter(0);
		TIM4_ClearFlag(TIM4_FLAG_UPDATE);
		while (TIM4_GetFlagStatus(TIM4_FLAG_UPDATE) == RESET) {
		}
		--u16Delay;
	}
}
