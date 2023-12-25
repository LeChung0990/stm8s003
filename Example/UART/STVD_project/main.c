/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */


#include "main.h"
//===========================khai bao cac chan vao ra======================//
#define LED_PORT  GPIOA//khai bao lED o PORTB
#define LED_PIN  GPIO_PIN_3//khai bao LED1 o chan PB0
#define BUT_PORT	GPIOC
#define BUT_PIN  	GPIO_PIN_4//khai bao BUTTON o chan PC7
//============================khai bao bien va hang==========================//

//============================khai bao ham==================================//
void Clock_setup(void);	//thiet lap xung clk cho MCU
void GPIO_setup(void);	//thiet lap GPIO
void uart_init(void);		//thiet lap UART1
void uart1_number(int number);
void uart1_string(const char *cy);
void uart1_nline(void);

//============================HAM MAIN=======================================//
int main()
{
	Clock_setup();
	GPIO_setup();
	delay_config();
	uart_init();
	while (1)
	{
		uart1_string("chung");
		delay_ms(1000);
	}
}

void Clock_setup(void)
{
	//KHAI BAO XUNG CLK INTERNAL 16MHZ
	CLK_DeInit();   
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
}
void GPIO_setup(void)
{
	///RESET CAC PORT
	GPIO_DeInit(GPIOD);
	GPIO_DeInit(GPIOC);
	GPIO_DeInit(GPIOA);
	GPIO_DeInit(GPIOE);
	GPIO_DeInit(GPIOB);   
	GPIO_DeInit(GPIOF);
	//KHAI BAO CAC CHAN VAO RA
	GPIO_Init(LED_PORT,LED_PIN,GPIO_MODE_OUT_PP_LOW_FAST);
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

	/*Set baudrate = 9600, BRR1 = 0x68, BRR2 = 0x03*/
	//UART1->BRR2 = (uint8_t)0x03;
	//UART1->BRR1 = (uint8_t)0x68;
	
	/*Set baudrate = 19200, BRR1 = 0x34, BRR2 = 0x01 in datasheet*/
	UART1->BRR2 = (uint8_t)0x01;
	UART1->BRR1 = (uint8_t)0x34;
	
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



