/**
  * tim.c
  *
  *  Created on: Apr 28, 2017
  *      Author: b4050n
  */

#include "tim.h"

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/


void delay_us(uint16_t us) {
  for(;us > 0; --us) __asm__("nop\n");
}


// /*Ham delay code theo thanh ghi*/
// void Timer4Config(void)
// {
//   // TIM4->PSCR = (uint8_t)0x01;
//   // TIM4->ARR = (uint8_t)8 - 1;

//   TIM4_TimeBaseInit(TIM4_PRESCALER_2, 8 - 1);

//   /*Enables the TIM4 peripheral*/
//   TIM4->CR1 |= TIM4_CR1_CEN;
// }
// void delay_us(uint16_t u16Delay)
// {
//   while (u16Delay)
//   {
//     TIM4->CNTR = (uint8_t)0;
//     /* Clear the flags (rc_w0) clear this bit by writing 0*/
//     TIM4->SR1 = (uint8_t)(~0x01);
//     while ((TIM4->SR1 & (uint8_t)0x01) == RESET)
//     {
//     }
//     --u16Delay;
//   }
// }
// void delay_ms(uint16_t u16Delay)
// {
//   while (u16Delay)
//   {
//     delay_us(1000);
//     --u16Delay;
//   }
// }

