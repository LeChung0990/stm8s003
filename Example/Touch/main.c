/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */


#include "main.h"
//===========================khai bao cac chan vao ra======================//
#define TOUCH_PORT  GPIOD
#define TOUCH_PIN  	GPIO_PIN_4
#define LED_PORT  	GPIOA//khai bao lED o PORTB
#define LED_PIN  	GPIO_PIN_3//khai bao LED1 o chan PB0
#define BUT_PORT	GPIOD
#define BUT_PIN  	GPIO_PIN_4//khai bao BUTTON o chan PC7
//============================khai bao bien va hang==========================//
int time;
int avg1;
char thr1 = 15;
int buf1;
uint8_t c;
//============================khai bao ham==================================//
void Clock_setup(void);	//thiet lap xung clk cho MCU
void GPIO_setup(void);	//thiet lap GPIO
void wait(void);

void uart_init(void);		//thiet lap UART1
void uart1_number(int number);
void uart1_string(const char *cy);
void uart1_nline(void);

//============================HAM MAIN=======================================//
int main()
{
	Clock_setup();//goi lai ham
	GPIO_setup();//goi lai ham
	delay_config();
	uart_init();
	
	#if 0
	for ( c=0; c<16; c++) 
	{
		avg1=0; 
		time=0;
		/* Set Output mode */
		TOUCH_PORT->DDR |= (uint8_t)TOUCH_PIN;
		TOUCH_PORT->ODR |= (uint8_t)TOUCH_PIN; /*1*/
		//GPIOx->CR2 |= (uint8_t)GPIO_Pin; /*10Mhz*/
		wait();
		/* Set Input mode */
		TOUCH_PORT->DDR &= (uint8_t)(~(TOUCH_PIN));
		/* Float */
		TOUCH_PORT->CR1 &= (uint8_t)(~(TOUCH_PIN));
		while( (GPIOx->IDR & (uint8_t)TOUCH_PIN) == SET )
		{ time++; }
		avg1 += time / 16;
	}
	#endif
	uart1_string("Start:");
	//uart1_number(avg1);
	uart1_nline();
	
	while (1)
	{
		/*Nhan Nut Dao trang thai LED*/
		
		
		time=0;
		/* Set Output mode */
		//GPIO_Init(TOUCH_PORT, TOUCH_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
		TOUCH_PORT->DDR |= (uint8_t)TOUCH_PIN;
		TOUCH_PORT->ODR |= (uint8_t)TOUCH_PIN; /*1*/
		//TOUCH_PORT->CR2 |= (uint8_t)TOUCH_PIN; /*10Mhz*/
		wait();
		
		
		/* Set Input mode */
		TOUCH_PORT->DDR &= (uint8_t)(~(TOUCH_PIN));
		/* Float */
		TOUCH_PORT->CR1 &= (uint8_t)(~(TOUCH_PIN));
		
		while( (TOUCH_PORT->IDR & (uint8_t)TOUCH_PIN) )
		{ time++; }
		
		
        if (time > 6000) {
            //buf1 = 20;
            GPIO_WriteHigh(LED_PORT, LED_PIN);
        } else {
            //if (buf1 > 0) {
            //    buf1--;
            //} else {
                GPIO_WriteLow(LED_PORT, LED_PIN);
            //}
        }
		
		
		//uart1_number(time);
		
		//uart1_string("--");
		delay_ms(10);
	}
}

void Clock_setup(void)
{
	//KHAI BAO XUNG CLK
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
	GPIO_Init(TOUCH_PORT, TOUCH_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(LED_PORT, LED_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	//GPIO_Init(BUT_PORT,BUT_PIN,GPIO_MODE_IN_PU_IT);
}

void wait(void)
{
	nop(); nop(); nop(); nop();
	nop(); nop(); nop(); nop();
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
	if (number == 0)
    {
		digit[0] = 0;
		count = 1;
    }
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






