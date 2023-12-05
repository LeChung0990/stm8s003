#include "stm8s.h"
uint16_t i = 0;

/*CODE THEO THANH GHI*/
void Timer4Config(void){
  TIM4->PSCR = (uint8_t)0x07;
  TIM4->ARR = (uint8_t)125 - 1;
  /*Enables the TIM4 peripheral*/
  TIM4->CR1 |= TIM4_CR1_CEN;
}
void Timer4DelayMs(uint16_t u16Delay){
  while(u16Delay){
    TIM4->CNTR = (uint8_t)0;
    /* Clear the flags (rc_w0) clear this bit by writing 0*/
    TIM4->SR1 = (uint8_t)(~0x01);
    while((TIM4->SR1 & (uint8_t)0x01) == RESET){}
    --u16Delay;
  }
}

void main (void)
{
    CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
    GPIO_DeInit(GPIOD);
    GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_HIGH_FAST);

    /*Thet lap ngat cho timer4*/
    TIM4_TimeBaseInit(TIM4_PRESCALER_128, 125 - 1);
    TIM4_SetCounter(0);
    TIM4_ClearFlag(TIM4_FLAG_UPDATE);
    TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
    enableInterrupts();
    TIM4_Cmd(ENABLE);

    while(1) 
    {
    }
}

/*----------------Ngat timer4------------*/
 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 {
    TIM4_SetCounter(0);
    TIM4_ClearFlag(TIM4_FLAG_UPDATE);
    i++;
    if(i>500)
    {
      GPIO_WriteReverse(GPIOD, GPIO_PIN_3);
      i=0;
    }
 }  


