#include "74HC595.h"
/* LED CODE 7 SEGMENT CATHODE COMMON IF WANT TO USING DOT: 0X80 IS DOT, 0X00 IS OFF DOT*/
const uint8_t SEG_MAP[] = {0x3F, 0X06, 0X5B, 0X4F, 0X66, 0X6D, 0X7D, 0X07, 0X7F, 0X6F};
const uint8_t SEG_SELECT[] = {0XF7, 0XFB, 0XFD, 0XFE};

void delay_us(unsigned int  value)
{
	register unsigned int loops = value ;
	
	while(loops)
	{
    nop();
		loops--;
	};
}

void HC595_Init(void)
{
  GPIO_Init(SH_PORT,(GPIO_Pin_TypeDef)(SH_PIN|DATA_PIN|ST_PIN),GPIO_MODE_OUT_PP_LOW_FAST);
}

void shcp(void)
{
  PIN_HIGH(SH_PORT, SH_PIN);
  //delay_ms(50);
  PIN_LOW(SH_PORT, SH_PIN);
  //delay_ms();
}

void strobe(void)
{
  /*Khi ST_CP = 1 se xuat du lieu cua thanh ghi SH_CP ra cac chan*/
  PIN_HIGH(ST_PORT, ST_PIN);
  delay_us(300);
  PIN_LOW(ST_PORT, ST_PIN);
}

/*   Ap dung khi ket noi cac chan Q0->Q7 toi chan DP->A cua led 7 doan  */
void data(uint8_t data)
{
  char t;
	for (uint8_t i = 0 ; i < 8; i++)
	{	
		t = data & 0x01;     //Dich du lieu de lay tung bit trong 8 bit
		if (t == 1) {               //Xuat bit 0 hoac 1 ra chan Data
      PIN_HIGH(DATA_PORT, DATA_PIN);
		}
		else {
      PIN_LOW(DATA_PORT, DATA_PIN);
		}
		shcp();                     //CHO 1 XUNG CHAN SH_CP DE XUAT 1 BIT RA CHAN DS
    data = data >> 1;
	}
}
void ONE7SEG(uint8_t Value)
{
  data(Value);
  strobe();
}

void FOUR7SEG(uint8_t Digit, uint8_t Value) {
  data(Value);
  data(Digit);		//Dich data so sau do moi dich ma Digit
  strobe();
}

void HIENTHI(int so)
{
  // FOUR7SEG(SEG_SELECT[0], SEG_MAP[so / 1000]);
  // FOUR7SEG(SEG_SELECT[1], SEG_MAP[(so / 100) % 10]);
  // FOUR7SEG(SEG_SELECT[2], SEG_MAP[(so / 10) % 10]);
  FOUR7SEG(SEG_SELECT[3], SEG_MAP[(so / 1) % 10]);
}