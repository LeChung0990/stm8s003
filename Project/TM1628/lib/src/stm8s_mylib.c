#include "stm8s_mylib.h"
static uint8_t _config = TM1628_SET_DISPLAY_ON | TM1628_BRIGHTNESS_MAX;
static uint8_t _segments = 0xff;
static const uint8_t _digit2segments[15] =
{
	0x3F, // 0
	0x06, // 1
	0x5B, // 2
	0x4F, // 3
	0x66, // 4
	0x6D, // 5
	0x7D, // 6
	0x07, // 7
	0x7F, // 8
	0x6F, // 9
	0x77, //A
	0x38, //L
	0x74, //h
	0x54, //n	
	0x5e, //d
};


void delay_config(void){
	TIM4_DeInit();
	TIM4_TimeBaseInit(TIM4_PRESCALER_128, 125 - 1);
	TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
	TIM4_ClearFlag(TIM4_FLAG_UPDATE);
	TIM4_Cmd(DISABLE);
	enableInterrupts();
}
void delay_ms(unsigned int  u16Delay)
{
	while (u16Delay) {
		TIM4_SetCounter(0);
		TIM4_ClearFlag(TIM4_FLAG_UPDATE);
		while (TIM4_GetFlagStatus(TIM4_FLAG_UPDATE) == RESET) {
		}
		--u16Delay;
	}
}

void delay_us(unsigned long int  us) {
  for(;us > 0; us--) nop();
}

void SEND_STOP(void)
{
	STB_1;
	DIO_0; TM_DELAY;  
	CLK_1; TM_DELAY;
	DIO_1; TM_DELAY;
}
void SEND_START(void)
{
	
	CLK_1; TM_DELAY;
	DIO_1; TM_DELAY;
	STB_0;
	DIO_0; TM_DELAY;
	CLK_0; TM_DELAY;
}

void SEND_WRITE(unsigned char data)
{
	unsigned char i;
	for (i = 0; i < 8; ++i)
	{
		if (data & 0x01) {DIO_1;}
		else {DIO_0;}
		TM_DELAY;	
		CLK_1;
		TM_DELAY;
		CLK_0;
		data >>= 1;
	}
}
void TM1628_SEND_COMMAND(const unsigned char value)
{
	SEND_START();
	SEND_WRITE(value);
	SEND_STOP();
	TM_DELAY;
}

void TM1628_SEND_CONFIG(const unsigned char enable, const unsigned char brightness)
{
	TM1628_SEND_COMMAND(TM1628_CMD_MODE_DIS_2);
	_config = (enable ? TM1628_SET_DISPLAY_ON : TM1628_SET_DISPLAY_OFF) |
		(brightness > TM1628_BRIGHTNESS_MAX ? TM1628_BRIGHTNESS_MAX : brightness);
	
	TM1628_SEND_COMMAND(TM1628_CMD_SET_DSIPLAY | _config);
	
}
void TM1628_INIT(unsigned char enable, const unsigned char brightness)
{	
	GPIO_Init(GPIOA, STB, GPIO_MODE_OUT_PP_HIGH_FAST);	
    GPIO_Init(GPIOD, DIO|SCLK, GPIO_MODE_OUT_PP_HIGH_FAST);

	TM1628_SEND_CONFIG(enable, brightness);
}
void TM1628_DISPLAY_SEGMENTS(const unsigned char position, const unsigned char digit, unsigned char dot)
{
	unsigned char segments ;
	if (digit < 15)
	{
		segments = _digit2segments[digit];
	} else
	{
		segments = 0x00;	
	}
	if ( (dot == 1 & (position == 2 )) | (dot == 2 & (position == 0 )) ) {
		segments = segments | 0x80;
	}
	TM1628_SEND_COMMAND(TM1628_CMD_SET_DATA | TM1628_SET_DATA_F_ADDR);
	SEND_START();
	SEND_WRITE(TM1628_CMD_SET_ADDR | position );
	SEND_WRITE(segments);
	SEND_STOP();
	TM_DELAY;
}
void Write_EEPROM(uint32_t Address, unsigned char Data){
    /* Unlock data memory */
    FLASH->DUKR = (uint8_t)0xAE ; /*!< Second RASS key */ /* Warning: keys are reversed on data memory !!! */ 
    FLASH->DUKR = (uint8_t)0x56 ;  /*!< First RASS key */

    *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;

    /* Lock memory */
    FLASH->IAPSR &= (uint8_t)0xF7; /*!< Data EEPROM memory */
}
uint8_t Read_EEPROM(uint32_t Address){
    return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address);
}
