#include "stm8s.h"
#include "stdio.h"
#include "stdint.h"

#define LED_PORT    GPIOD
#define LED_PIN     GPIO_PIN_3
#define BUT_PORT    GPIOC
#define BUT_PIN     GPIO_PIN_7

/*Ham delay code theo thanh ghi*/
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
    /*Using HSI clock 16Mhz*/
    // CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1); 
    CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
    CLK->CKDIVR |= (uint8_t)CLK_PRESCALER_HSIDIV1;

    LED_PORT->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
    LED_PORT->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
    LED_PORT->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
    LED_PORT->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */

    LED_PORT->DDR |= (uint8_t)LED_PIN; /* Set Output mode */
    LED_PORT->ODR |= (uint8_t)LED_PIN; /* High level */
    LED_PORT->CR1 |= (uint8_t)LED_PIN; /* Pull-Up or Push-Pull */
    LED_PORT->CR2 |= (uint8_t)LED_PIN; /* Interrupt or Slow slope */
    Timer4Config();
    while (1)
    {
        Timer4DelayMs(1000);
        LED_PORT->ODR ^= (uint8_t)LED_PIN;
        
        /*Nhan Nut Dao trang thai LED*/
        // if(GPIO_ReadInputPin(BUT_PORT, BUT_PIN)== RESET){
        //     mydelay(200000);
        //     while(GPIO_ReadInputPin(BUT_PORT, BUT_PIN)== RESET);
        //     GPIO_WriteReverse(LED_PORT, LED_PIN);
        // }

        /*Nhan nut led sang, tha ra LED tat*/
        // if(GPIO_ReadInputPin(BUT_PORT, BUT_PIN)== RESET){
        //     mydelay(200000);
        //     if(GPIO_ReadInputPin(BUT_PORT, BUT_PIN)== RESET){
        //         // GPIO_WriteHigh(LED_PORT, LED_PIN);
        //         GPIO_WriteLow(LED_PORT, LED_PIN);
        //     }
        //     else{
        //         // GPIO_WriteLow(LED_PORT, LED_PIN);
        //         GPIO_WriteHigh(LED_PORT, LED_PIN);
        //     }
        // }
    }
}

