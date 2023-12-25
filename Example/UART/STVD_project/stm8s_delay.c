#include "stm8s_delay.h"
void delay_config(void){
	TIM4_TimeBaseInit(TIM4_PRESCALER_128, 125 - 1);
	TIM4_Cmd(ENABLE);
}
void delay_ms(unsigned int  u16Delay)
{
	while (u16Delay) {
		TIM4_SetCounter(0);
		TIM4_ClearFlag(TIM4_FLAG_UPDATE);
		while (TIM4_GetFlagStatus(TIM4_FLAG_UPDATE) == RESET) {
		}
		--u16Delay;
	}
}