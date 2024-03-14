/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */


#include "main.h"
//===========================khai bao cac chan vao ra======================//
#define BUT_PORT	GPIOD
#define BUT_PIN  	GPIO_PIN_2//khai bao BUTTON o chan PC7
//============================khai bao bien va hang==========================//
uint16_t adc_value = 0;
float ADC_Offset;
float ADC_current;
float Weight;
unsigned char i;
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
	Clock_setup();//goi lai ham
	GPIO_setup();//goi lai ham
	delay_config();
	uart_init();
	ADC1_DeInit();
	ADC1_Init(ADC1_CONVERSIONMODE_SINGLE, ADC1_CHANNEL_4, ADC1_PRESSEL_FCPU_D18, 
		ADC1_EXTTRIG_TIM, DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL4, DISABLE);
	ADC1_Cmd(ENABLE);
	
	for (i=0; i<20; ++i)
	{	
		ADC1_StartConversion();
		while(ADC1_GetFlagStatus(ADC1_FLAG_EOC)==0){}
		ADC1_ClearFlag(ADC1_FLAG_EOC);
		adc_value = ADC1_GetConversionValue();
		ADC_Offset += adc_value;
	}
	ADC_Offset = ADC_Offset / 20.0;
	
	while (1)
	{
		if(GPIO_ReadInputPin(BUT_PORT, BUT_PIN) == 0)
		{
			delay_ms(200);
			while(GPIO_ReadInputPin(BUT_PORT, BUT_PIN) == 0){}
			ADC_Offset = 0;
			for (i=0; i<20; ++i)
			{	
				ADC1_StartConversion();
				while(ADC1_GetFlagStatus(ADC1_FLAG_EOC)==0){}
				ADC1_ClearFlag(ADC1_FLAG_EOC);
				adc_value = ADC1_GetConversionValue();
				ADC_Offset += adc_value;
			}
			ADC_Offset = ADC_Offset / 20.0;
		}
		
		
		ADC1_StartConversion();
		while(ADC1_GetFlagStatus(ADC1_FLAG_EOC)==0){}
		ADC1_ClearFlag(ADC1_FLAG_EOC);
		adc_value = ADC1_GetConversionValue();
		ADC_current = adc_value;
		
		Weight = (( abs((int) (ADC_current - ADC_Offset) )/1024.0) * 3.3) * 1000.0;
		uart1_string("S");
		uart1_number((int)Weight);
		uart1_nline();
		delay_ms(500);
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
	//KHAI BAO NUT NHAN
	GPIO_Init(BUT_PORT,BUT_PIN,GPIO_MODE_IN_PU_IT);
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
	
	/*Set baudrate = 115200, BRR1 = 0x08, BRR2 = 0x0B in datasheet*/
	UART1->BRR2 = (uint8_t)0x0B;
	UART1->BRR1 = (uint8_t)0x08;
	
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





