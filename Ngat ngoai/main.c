#include "stm8s.h"
// uint16_t i = 0;
  void delay_us(uint16_t us) {
  for(;us > 0; us--);
  }

// void main(void)
// {
//   // CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1); 
//   // GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);

//   // /*ngat ngoai*/
//   // EXTI_DeInit();
//   // GPIO_Init(GPIOD, GPIO_PIN_4, GPIO_MODE_IN_PU_IT);
//   // EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOD, EXTI_SENSITIVITY_FALL_ONLY);
//   // enableInterrupts();


//   while(1) 
//   {
//   }
// }

/*----------------Ngat ngoai------------*/
// INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
// {
//   GPIO_WriteReverse(GPIOD, GPIO_PIN_3);
// }
