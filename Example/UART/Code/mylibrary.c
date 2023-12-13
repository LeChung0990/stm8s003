#include "mylibrary.h"
uint8_t data = 0;
/*------------Ham Delay Timer4-----------*/
void delay_msSetup(void)
{
    TIM4_TimeBaseInit(TIM4_PRESCALER_128, 125 - 1);
	TIM4_Cmd(ENABLE);
}
void delay_ms(uint16_t u16Delay)
{
	while (u16Delay) {
		TIM4_SetCounter(0);
		TIM4_ClearFlag(TIM4_FLAG_UPDATE);
		while (TIM4_GetFlagStatus(TIM4_FLAG_UPDATE) == RESET) {}
		--u16Delay;
	}
}

/*-----------Ham truyen Data UART1-------------*/
/*	pin 2  PD5/ AIN5/ UART1 data transmit
	pin 3 PD6/ AIN6/ UART1 data receive	*/
void UART1_Setup(void)
{
	UART1_DeInit();
    UART1_Init(9600, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, 
	UART1_PARITY_NO, UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE);	
	// UART1_ITConfig(UART1_IT_RXNE_OR, ENABLE);
	UART1_Cmd(ENABLE);
}
void UART1_number(int number)
{
    char count = 0;
    char digit[5] = "";
	if(number == 0)
	{
        digit[0] = 0;
        count = 1;
    }
    while(number != 0)
    {
        digit[count] = number%10;   //lay chu so ngoai cung xxxx8;
        count++;
        number = number/10;         //chia so number cho 10 de bo so ngoai cung xxxx
    }
    while (count!=0)
    {
        UART1_SendData8(digit[count - 1] + 0x30); // 0x30 = 48 ;
        while(UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET);
        // UART1_ClearFlag(UART1_FLAG_TXE); //khong can xoa co TXE
        count--;
    }
}
char UART1_receive()
{
	// while(UART1_GetFlagStatus(UART1_FLAG_RXNE == 0)){}
	// data = UART1_ReceiveData8();
	// UART1_ClearFlag(UART1_FLAG_RXNE);
	return data;
}
void UART1_String(const char *cy)
{
	while(*cy)
    {
        UART1_SendData8(*cy);
        while(UART1_GetFlagStatus(UART1_FLAG_TXE)==0){}
        // UART1_ClearFlag(UART1_FLAG_TXE); //khong can xoa co TXE
        cy++;
    }
}
//  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
//  {
// 	if(UART1_GetFlagStatus(UART1_IT_RXNE))
// 	{
// 		data = UART1_ReceiveData8();
// 	}
//  }
