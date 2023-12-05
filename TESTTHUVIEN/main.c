#include "stm8s.h"
#include "stdio.h"
#include "stdint.h"
// #include "lib.h"
// #include "math.h"
// #include "time.h"
// #include "string.h"

#define LED_PORT    GPIOD
#define LED_PIN     (1<<3)
#define BUT_PORT    GPIOD
#define BUT_PIN     (1<<4)

// uint32_t clk=0;
// float a=960.0;
// float b=456.7;
// float c=998.8;
void mydelay(uint32_t time){
    while(time--);
}
// void GPIO_Setup(void);
void tim4_isr() __interrupt(23) __naked {
    __asm__("jp 0x8464");
}
void main (void)
{
    /*Using HSI clock 16Mhz*/
    // CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1); 
    CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
    CLK->CKDIVR |= (uint8_t)0x00;

    LED_PORT->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
    LED_PORT->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
    LED_PORT->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
    LED_PORT->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */

    LED_PORT->DDR |= (uint8_t)LED_PIN; /* Set Output mode */
    LED_PORT->ODR |= (uint8_t)LED_PIN; /* High level */
    LED_PORT->CR1 |= (uint8_t)LED_PIN; /* Pull-Up or Push-Pull */
    LED_PORT->CR2 |= (uint8_t)LED_PIN; /* Interrupt or Slow slope */

    // EXTI->CR1 = EXTI_CR1_RESET_VALUE;
    // EXTI->CR2 = EXTI_CR2_RESET_VALUE;
    // /* Reset corresponding bit to GPIO_Pin in CR2 register */
    // BUT_PORT->CR2 &= (uint8_t)(~(BUT_PIN));
    // BUT_PORT->DDR &= (uint8_t)(~(BUT_PIN)); /* Set Input mode */
    // BUT_PORT->CR1 |= (uint8_t)BUT_PIN; /* Pull-Up or Push-Pull */
    // BUT_PORT->CR2 |= (uint8_t)BUT_PIN; /* Interrupt or Slow slope */
    // EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS); /*!< PORTD external interrupt sensitivity bits mask */
    // EXTI->CR1 |= (uint8_t)((0x02) << 6);  /*!< Interrupt on Falling edge only */
    // a /= 4096.0;
    // b /= 4096.0;
    // c /= 4096.0;
    // sqrtf(c*a*b + a*b + c*a);
    // enableInterrupts();
    
    while (1)
    {
        LED_PORT->ODR ^= (uint8_t)LED_PIN;
        	for (int x = 0; x < 10; ++x) __asm__("nop");
        
        __asm__("jp 0x8400");



        // a = (float)a/0.987;
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


// void GPIO_Setup(void){
//     /*Su dung port nao thi reset port do*/
//     GPIO_DeInit(LED_PORT);
//     GPIO_DeInit(BUT_PORT);

//     GPIO_Init(LED_PORT, LED_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
//     /*input pull-up*/
//     GPIO_Init(BUT_PORT, BUT_PIN, GPIO_MODE_IN_PU_NO_IT);
// }

INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
{
  LED_PORT->ODR ^= (uint8_t)LED_PIN;
}
