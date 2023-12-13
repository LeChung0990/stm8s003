/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */
#include "main.h"
//===========================khai bao cac chan vao ra======================//
#define LED_PORT    GPIOD
#define LED_PIN     GPIO_PIN_3
#define BUT_PORT    GPIOD
#define BUT_PIN     GPIO_PIN_4



//===========================khai bao 74hc595=============================//




#define SH_PORT     GPIOC
#define SH_PIN      GPIO_PIN_7

#define DATA_PORT   GPIOC
#define DATA_PIN    GPIO_PIN_5

#define ST_PORT     GPIOC
#define ST_PIN      GPIO_PIN_6

#define PIN_LOW(PORT, PIN)  GPIO_WriteLow(PORT, PIN);
#define PIN_HIGH(PORT, PIN)  GPIO_WriteHigh(PORT, PIN);

const char SEG_MAP[] = {0x3F, 0X06, 0X5B, 0X4F, 0X66, 0X6D, 0X7D, 0X07, 0X7F, 0X6F};
const char SEG_SELECT[] = {0XF7, 0XFB, 0XFD, 0XFE};

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
void data(unsigned char data)
{
  char t;
	unsigned char i;
	for(i = 0 ; i < 8; i++)
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


void UART1_Setup(void)
{
	UART1_DeInit();
    UART1_Init(9600, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, 
	UART1_PARITY_NO, UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE);	
	// UART1_ITConfig(UART1_IT_RXNE_OR, ENABLE);
	UART1_Cmd(ENABLE);
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
 
volatile uint16_t adc_value = 0;
int main()
{
	/*------------Set internal clock 16Mhz----------*/
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
	
	GPIO_DeInit(SH_PORT);
  GPIO_DeInit(BUT_PORT);

  GPIO_Init(LED_PORT, LED_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
  /*input pull-up*/
  GPIO_Init(BUT_PORT, BUT_PIN, GPIO_MODE_IN_PU_IT);
	
	//HC595_Init();
	//FOUR7SEG(SEG_SELECT[0], SEG_MAP[0]);
	ADC1_DeInit();
	ADC1_Init(ADC1_CONVERSIONMODE_SINGLE, ADC1_CHANNEL_3, ADC1_PRESSEL_FCPU_D18, 
		ADC1_EXTTRIG_TIM, DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL3, DISABLE);
	ADC1_Cmd(ENABLE);
	while (1)
	{
		ADC1_StartConversion();
		while(ADC1_GetFlagStatus(ADC1_FLAG_EOC)==0){}
		ADC1_ClearFlag(ADC1_FLAG_EOC);
		adc_value = ADC1_GetConversionValue();

		
		
		//if(GPIO_ReadInputPin(BUT_PORT, BUT_PIN)== RESET){
		//	delay_ms(200);
		//	if(GPIO_ReadInputPin(BUT_PORT, BUT_PIN)== RESET){
				// GPIO_WriteHigh(LED_PORT, LED_PIN);
		//		GPIO_WriteLow(LED_PORT, LED_PIN);
		//	}else{
				// GPIO_WriteLow(LED_PORT, LED_PIN);
		//		GPIO_WriteHigh(LED_PORT, LED_PIN);
		//	}
		//}
	}
}


