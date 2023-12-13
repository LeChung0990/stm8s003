#include "stm8s.h"
#include "stdio.h"
#include "stdlib.h"

#define LED_PORT    GPIOD
#define LED_PIN     (1<<3)
#define BUT_PORT    GPIOC
#define BUT_PIN     (1<<7)
void send_0(void) {                                                   
  GPIOD->ODR |= (uint8_t)(1<<3);    
  __asm__("nop\n nop\n nop\n nop\n nop\n");                                                               
  GPIOD->ODR &= ~(uint8_t)(1<<3);                                  
  __asm__("nop\n nop\n nop\n nop\n nop\n nop\n nop\n nop\n nop\n nop\n");
}
void send_1(void) {
  GPIOD->ODR |= (uint8_t)(1<<3);    
  __asm__("nop\n nop\n nop\n nop\n nop\nii nop\n nop\n nop\n nop\n nop\n nop\n nop\n");                                                        
  GPIOD->ODR &= ~(uint8_t)(1<<3);                                  
  __asm__("nop\n nop\n nop\n");  
}
// void Color_byte(uint8_t data){
//   for(uint8_t i=0;i < 8; i++){
//     if(data & 0x80) send_1();
//     else send_0();
//     data <<= 1;
//   }
// }

// void send_raw_color(uint32_t color){
//   for(uint8_t i=0;i<24;++i){
//     if(color & 0x80) send_1;
//     else send_0;
//     color <<=1;
//   }
// }
// void send_rgb(uint8_t r, uint8_t g, uint8_t b) {
//   uint32_t raw = 0;
//   uint32_t rev_r = 0, rev_g = 0, rev_b = 0;

//   for(int i=0; i<8; i++) 
//     rev_r |= (((r>>(7-i)) & 1) ? (1<<i) : 0);
//   for(int i=0; i<8; i++) 
//     rev_g |= (((g>>(7-i)) & 1) ? (1<<i) : 0);
//   for(int i=0; i<8; i++) 
//     rev_b |= (((b>>(7-i)) & 1) ? (1<<i) : 0);
  
//   raw = (rev_b << 16) | (rev_r << 8) | rev_g;
//   send_raw_color(raw);
// }


// uint32_t clk=0;
/*CODE THEO THANH GHI*/
// void Timer4Config(void){
//   TIM4->PSCR = (uint8_t)0x07;
//   TIM4->ARR = (uint8_t)125 - 1;
//   /*Enables the TIM4 peripheral*/
//   TIM4->CR1 |= TIM4_CR1_CEN;
// }
// void Timer4DelayMs(uint16_t u16Delay){
//   while(u16Delay){
//     TIM4->CNTR = (uint8_t)0;
//     /* Clear the flags (rc_w0) clear this bit by writing 0*/
//     TIM4->SR1 = (uint8_t)(~0x01);
//     while((TIM4->SR1 & (uint8_t)0x01) == RESET){}
//     --u16Delay;
//   }
// }
// void ADC1_DeInit(void){
//     ADC1->CSR  = ADC1_CSR_RESET_VALUE;
//     ADC1->CR1  = ADC1_CR1_RESET_VALUE;
//     ADC1->CR2  = ADC1_CR2_RESET_VALUE;
//     ADC1->CR3  = ADC1_CR3_RESET_VALUE;
//     ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
//     ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
//     ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
//     ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
//     ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
//     ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
//     ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
//     ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
// }
// void ADC1_Init(void){
//     /* Clear the ADC1 channels */
//     ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
//     /* Select the Analog channel 3 , AIN3, pin PD3 (19)*/
//     ADC1->CSR |= (uint8_t)(0x04);

//     /* Clear the align bit */
//     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
//     /* Configure the data alignment:  Data alignment right */
//     ADC1->CR2 |= (uint8_t)(0x08);

//     /* Set the single conversion mode */
//     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);

//     /* Clear the SPSEL bits */
//     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
//     /* Prescaler selection fADC1 = fcpu/18 */
//     ADC1->CR1 |= (uint8_t)0x70;  

//     ADC1->CR1 |= ADC1_CR1_ADON;

// }
// uint16_t ADC1_Read(void){
//     /*Enable the ADC1 peripheral to conversion*/
//     ADC1->CR1 |= ADC1_CR1_ADON;
//     /* Waiting for conversion complete, bit EOC */
//     while( (ADC1->CSR & ADC1_CSR_EOC) == RESET){}    
//     /* Clear EOC flag status */
//     ADC1->CSR &= (uint8_t) (~ADC1_CSR_EOC);

//     uint16_t temph = 0;
//     uint8_t templ = 0;
//     /* Read LSB first */
//     templ = ADC1->DRL;
//     /* Then read MSB */
//     temph = ADC1->DRH;
//     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
//     return ((uint16_t)temph);
// }
// void uart_init(void){
// 	uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
	
// 	UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  /* Clear the word length bit */
// 	UART1->CR1 |= (uint8_t)0x00; /* Set the word length bit, 8 Data bits */
// 	UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  /* Clear the STOP bits */
// 	UART1->CR3 |= (uint8_t)0x00; /**< One stop bit is transmitted at the end of frame*/

// 	UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  /* Clear the Parity Control bit */
// 	UART1->CR1 |= (uint8_t)0x00;  /* Set No Parity Control bit */
	
// 	UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  /* Clear the LSB mantissa of UART1DIV  */
// 	UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);	/* Clear the MSB mantissa of UART1DIV  */
// 	UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  /* Clear the Fraction bits of UART1DIV */

// 	// /*Set baudrate = 9600, BRR1 = 0x68, BRR2 = 0x03*/
// 	UART1->BRR2 = (uint8_t)0x03;
// 	UART1->BRR1 = (uint8_t)0x68;
// 	/*Set baudrate = 57600, BRR1 = 0x11, BRR2 = 0x06 in datasheet*/
// 	// UART1->BRR2 = (uint8_t)0x06;
// 	// UART1->BRR1 = (uint8_t)0x11;
  	
// 	UART1->CR2 |= (uint8_t)UART1_CR2_TEN; /*Transmit Enable and Receive Enable*/ 
// 	UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
//     UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); /*Sync mode Disable, SLK pin Disable*/
//     UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); /* UART1 Enable */
// }
// void uart1_number(int number)
// {
//     char count = 0;
//     char digit[5] = "";
//     while(number != 0)
//     {
//         digit[count] = number%10;   //lay chu so ngoai cung xxxx8;
//         ++count;
//         number = number/10;         //chia so number cho 10 de bo so ngoai cung xxxx
//     }
//     while (count!=0)
//     {
//         UART1->DR = (digit[count - 1] + 0x30); // 0x30 = 48 ;
// 		while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET);
//         --count;
//     }
// }

/*--------------------------MAIN FUNCTION--------------------*/
// volatile uint16_t adc_value = 0;
// int r, g, b;
// int fr = 1, fg = 1, fb = 1;
// uint8_t rev_r = 0, rev_g = 0, rev_b = 0;


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

    // send_raw_color(0x00ff0000);
    // sendRGB(1,0,0);sendRGB(0,1,0);sendRGB(0,0,1);sendRGB(0,0,1);
    // sendRGB(1,1,0);sendRGB(1,0,1);sendRGB(0,1,1);sendRGB(1,1,1);
    // ADC1_DeInit();
    // ADC1_Init();
    // uart_init();
    while (1)
    {
      //  r = ADC1_Read() % 256;
      //  uart1_number(r);
      //  g = rand() % 256;
      //  b = rand() % 256;

      //     if(r == 255) fr = -1;
      //     if(r == 0) fr = 1;
      //     r += fr;

      //     if(g == 255) fg = -1;
      //     if(g == 0) fg = 1;
      //     g += fg;

      //     if(b == 255) fb = -1;
      //     if(b == 0) fb = 1;
      //     b += fb;

      // for(int i=0; i<8; i++) 
      //   rev_r |= (((r>>(7-i)) & 1) ? (1<<i) : 0);
      // for(int i=0; i<8; i++) 
      //   rev_g |= (((g>>(7-i)) & 1) ? (1<<i) : 0);
      // for(int i=0; i<8; i++) 
      //   rev_b |= (((b>>(7-i)) & 1) ? (1<<i) : 0);
      // sendRGB(r,0,0);
      // Timer4DelayMs(500);
    }
}


