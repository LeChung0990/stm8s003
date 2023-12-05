#include "stm8s.h"

#define PORT_CP	GPIOD	
#define PORT_DSADSB	GPIOD
#define PORT_DIG3	GPIOD

#define CP		GPIO_PIN_2	//PIN 19
#define DS 		GPIO_PIN_3	//PIN 20
#define DIG3	GPIO_PIN_4	//PIN 1 FOR DIGIT 3 OF 7 SEG LED

/*CODE 7 SEGMENT ANODE COMMON*/
char MAP[]  = {0xC0, 0XF9, 0XA4, 0XB0, 0X99, 0X92, 0X82, 0XF8, 0X80, 0X90}
void delay_ms(uint16_t u16Delay);
void main(void)
{
	
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
	GPIO_DeInit(GPIOB); 	/*CLEAR REGISTER GPIO OR RESET VALUE*/
	GPIO_Init(GPIOB, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_FAST);
	TIM4_TimeBaseInit(TIM4_PRESCALER_128, 125 - 1);
	TIM4_Cmd(ENABLE);
	
    while(1) {
        delay_ms(100);
		GPIO_WriteReverse(GPIOB, GPIO_PIN_4);	/*Nhap nhay LED tai chan PD3*/
    }
}

void delay_ms(uint16_t u16Delay)
{
	
	while (u16Delay) {
		TIM4_SetCounter(0);
		TIM4_ClearFlag(TIM4_FLAG_UPDATE);
		while (TIM4_GetFlagStatus(TIM4_FLAG_UPDATE) == RESET) {
		}
		--u16Delay;
	}
}
void ShiftData(uint8_t data)
{
	char i;
	data = MAP[data];
	for (i=0;i<8;i++)
	{
		if((data & 0x01) == 0) //bit LSB
		{
			GPIO_WriteLow(PORT_CP, CP);
			GPIO_WriteLow(PORT_DSADSB, DS);
			GPIO_WriteHigh(PORT_CP, CP);
		}
		else 
		{
			GPIO_WriteLow(PORT_CP, CP);
			GPIO_WriteHigh(PORT_DSADSB, DS);
			GPIO_WriteHigh(PORT_CP, CP);
		}
		data = data>>1;
	}
}