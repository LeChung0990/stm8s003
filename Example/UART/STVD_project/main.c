/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */
#include "stm8s.h" 
#include "stdio.h"
#include "math.h"
#include "stm8s_gpio.h"
#include "stm8s_tim4.h"
#include "stm8s_conf.h"

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
void uart_init(void){
	uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
	
	UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  /* Clear the word length bit */
	UART1->CR1 |= (uint8_t)0x00; /* Set the word length bit, 8 Data bits */
	UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  /* Clear the STOP bits */
	UART1->CR3 |= (uint8_t)0x00; /**< One stop bit is transmitted at the end of frame*/

	UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  /* Clear the Parity Control bit */
	UART1->CR1 |= (uint8_t)0x00;  /* Set No Parity Control bit */
	
	UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  /* Clear the LSB mantissa of UART1DIV  */
	UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);	/* Clear the MSB mantissa of UART1DIV  */
	UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  /* Clear the Fraction bits of UART1DIV */

	// /*Set baudrate = 9600, BRR1 = 0x68, BRR2 = 0x03*/
	UART1->BRR2 = (uint8_t)0x03;
	UART1->BRR1 = (uint8_t)0x68;
	/*Set baudrate = 57600, BRR1 = 0x11, BRR2 = 0x06 in datasheet*/
	// UART1->BRR2 = (uint8_t)0x06;
	// UART1->BRR1 = (uint8_t)0x11;
  	
	UART1->CR2 |= (uint8_t)UART1_CR2_TEN; /*Transmit Enable and Receive Enable*/ 
	UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
    UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); /*Sync mode Disable, SLK pin Disable*/
    UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); /* UART1 Enable */
}

void uart1_number(int number)
{
    char count = 0;
    char digit[5] = "";
    while(number != 0)
    {
			digit[count] = number%10;   //lay chu so ngoai cung xxxx8;
			++count;
			number = number/10;         //chia so number cho 10 de bo so ngoai cung xxxx
    }
    while (count!=0)
    {
			UART1->DR = (digit[count - 1] + 0x30); // 0x30 = 48 ;
			while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET);
			--count;
    }
}
void uart1_string(const char *cy)
{
	while(*cy)
    {
			UART1->DR = (*cy);
			while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET){}
			cy++;
    }
}
void uart1_nline(void)
{
	UART1->DR = (0x0a);
	while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET);
}

int main()
{
	/*Using HSI clock 16Mhz*/
	CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
	CLK->CKDIVR |= (uint8_t)0x00;
	Timer4Config();
	//uart_init();
	/*TIM4_TimeBaseInit(TIM4_PRESCALER_128, 125 - 1);
	TIM4_SetCounter(0);
	TIM4_ClearFlag(TIM4_FLAG_UPDATE);
	TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
	enableInterrupts();
	TIM4_Cmd(ENABLE);
	*/
	while (1){
		//uart1_string("chung");
		Timer4DelayMs(1000);
	}
}