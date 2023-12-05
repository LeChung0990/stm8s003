#include "stm8s.h"

void delay_ms(uint16_t u16Delay);

void Write_EEPROM(uint8_t Data){
	FLASH_Unlock(FLASH_MEMTYPE_DATA);
	FLASH_ProgramByte(0x4000, Data);
	FLASH_Lock(FLASH_MEMTYPE_DATA);
}
uint8_t Read_EEPROM(uint32_t Address){
	uint8_t Data;
	Data = FLASH_ReadByte(Address);
	return Data;
}

void main(void)
{
	
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
	GPIO_DeInit(GPIOD); 	/*CLEAR REGISTER GPIO OR RESET VALUE*/
	GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);
	TIM4_TimeBaseInit(TIM4_PRESCALER_128, 63 - 1);
	TIM4_Cmd(ENABLE);
	
	Write_EEPROM(0x82);
    while(1) {
		if(Read_EEPROM(0x4000) == 255) GPIO_WriteHigh(GPIOD, GPIO_PIN_3);	/*Nhap nhay LED tai chan PD3*/
		else GPIO_WriteLow(GPIOD, GPIO_PIN_3);
    }
}

void delay_ms(uint16_t u16Delay)	//Ham delay dung timer4
{
	
	while (u16Delay) {
		TIM4_SetCounter(0);
		TIM4_ClearFlag(TIM4_FLAG_UPDATE);
		while (TIM4_GetFlagStatus(TIM4_FLAG_UPDATE) == RESET) {
		}
		--u16Delay;
	}
}