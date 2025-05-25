/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */
#include "main.h"

//============================khai bao bien va hang==========================//
unsigned char DataEEprom ; 
unsigned int DataMPU;
float AccX;
unsigned char i;
unsigned char buffer[14]= {0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00};
unsigned char hour = 0;
unsigned char minute = 0;
unsigned char second = 0;
unsigned char date = 0;
unsigned char month = 0;
unsigned char hourAlam = 0;
unsigned char minuteAlam = 0;
unsigned char ValueSecond;
unsigned char ValueMinute;
bool StatusStartStop;
bool StatusAlam = RESET;
unsigned char mode = 0;
//============ ================khai bao ham==================================//
void Clock_setup(void);	//thiet lap xung clk cho MCU
void GPIO_setup(void);	//thiet lap GPIO
void Timer1_int_Configuration(void);
void Exti_Config(void);
//============================HAM MAIN=======================================//
int main()
{
	Clock_setup();
	GPIO_setup();
	delay_config();
	Exti_Config();
	TM1628_INIT(1,1);
	I2C_init();
	
	BEEP_DeInit();
	BEEP_Init(BEEP_FREQUENCY_4KHZ);
	BEEP_Cmd(DISABLE );

	for(i=0; i< 14; ++i)
	{
		TM1628_display_segments(i,0,0); 
	}
	BEEP_Cmd(DISABLE );
	
	//WriteData(0x05, 4);
	//WriteData(0x04, 23);
	/*================================================*/
	/*Dong dien trung binh : 16mA, tuy chinh gio,phut,giay 17mA
		khi co beep cua buzzer co the len toi 32mA
	*/
	while (1)
	{
		hour = ReadData(0x02);
		minute = ReadData(0x01);
		second = ReadData(0x00);
		
		if (GPIO_ReadInputPin(BUT_PORT2, BUT_PIN2) == RESET){
			date = ReadData(0x04);
			month = ReadData(0x05);
			buffer[0] = date / 10;
			buffer[2] = date % 10;
			buffer[4] = month / 10;
			buffer[6] = month % 10;
		} else {			
			buffer[0] = hour / 10;
			buffer[2] = hour % 10;
			buffer[4] = minute / 10;
			buffer[6] = minute % 10;
		}
		
		if (GPIO_ReadInputPin(BUT_PORT3, BUT_PIN3) == RESET){
			BEEP_Cmd(ENABLE );
			delay_us(50000);
			BEEP_Cmd(DISABLE );
			while (GPIO_ReadInputPin(BUT_PORT3, BUT_PIN3) == RESET){}
			StatusAlam = ! StatusAlam;
			if (StatusAlam){
				GPIO_WriteHigh(LedAlam_PORT, LedAlam_PIN);
			}
			else {
				GPIO_WriteLow(LedAlam_PORT, LedAlam_PIN);
			}
		}
		
		for(i=0; i< 14; ++i)
		{
			if( second % 2 ){
				TM1628_display_segments(i,buffer[i],1); 
			}
			else {
				TM1628_display_segments(i,buffer[i],0); 
			}
		}
		
		if (StatusAlam){
			if (hour == hourAlam){
				if (minute == minuteAlam){
					TIM4_Cmd(ENABLE);
					while(ValueSecond < 5){
						BEEP_Cmd(ENABLE );
						delay_us(10000);
						BEEP_Cmd(DISABLE );
						delay_us(40000);
					}
					TIM4_Cmd(DISABLE);
				}
			}
		}
		
		while (mode == 1){
			/*Neu Button1 duoc nhan lan thu nhat -> Vao che do cai dat gio va phut*/
			/*Cai dat gio*/
			if (GPIO_ReadInputPin(BUT_PORT2, BUT_PIN2) == RESET){
				delay_us(5000);
				/*Tang bien hour va ghi vao DS1307*/
				hour++;
				if(hour > 23) hour = 0;
				WriteData(0x02, hour);
			}
			/*Cai dat phut*/
			if (GPIO_ReadInputPin(BUT_PORT3, BUT_PIN3) == RESET){
				delay_us(5000);
				/*Tang bien minute va ghi vao DS1307*/
				minute++;
				if(minute > 59) minute = 0;
				WriteData(0x01, minute);
				WriteData(0x00, 0);
			}
			
			/*Hien thi gio va phut dang cai dat len LED7DOAN*/
			buffer[0] = hour / 10;
			buffer[2] = hour % 10;
			buffer[4] = minute / 10;
			buffer[6] = minute % 10;
			
			for(i=0; i< 14; ++i)
			{
				TM1628_display_segments(i,buffer[i],1); 
			}
		}

		while(mode == 2){
			/* Dong ho bam gio*/
			if (GPIO_ReadInputPin(BUT_PORT2, BUT_PIN2) == RESET){
				/*Cho buzzer keu bao hieu start dem gio*/
				BEEP_Cmd(ENABLE );
				delay_us(50000);
				BEEP_Cmd(DISABLE );
				while (GPIO_ReadInputPin(BUT_PORT2, BUT_PIN2) == RESET){}
				StatusStartStop = ~StatusStartStop ;
				if (StatusStartStop){
					TIM4_Cmd(ENABLE);
				}
				else{
					TIM4_Cmd(DISABLE);
				}
			}			
			
			if (GPIO_ReadInputPin(BUT_PORT3, BUT_PIN3) == RESET){
				/*Cho buzzer keu bao hieu start dem gio*/
				BEEP_Cmd(ENABLE );
				delay_us(50000);
				BEEP_Cmd(DISABLE );
				while (GPIO_ReadInputPin(BUT_PORT3, BUT_PIN3) == RESET){}
				ValueSecond = 0;
			}
						
			buffer[0] = ValueMinute / 10;
			buffer[2] = ValueMinute % 10;
			buffer[4] = ValueSecond / 10;
			buffer[6] = ValueSecond % 10;
			
			for(i=0; i< 14; ++i)
			{
				TM1628_display_segments(i,buffer[i],2); 
			}
			
		}
		
		while (mode == 3)
		{
			hourAlam = Read_EEPROM(0x4000);
			minuteAlam = Read_EEPROM(0x4001);
			/*Mode cai dat bao thuc*/
			if (GPIO_ReadInputPin(BUT_PORT2, BUT_PIN2) == RESET){
				delay_us(5000);
				hourAlam++;
				if(hourAlam > 23) hourAlam = 0;
				Write_EEPROM(0x4000, hourAlam);
			}
			
			if (GPIO_ReadInputPin(BUT_PORT3, BUT_PIN3) == RESET){
				delay_us(5000);
				minuteAlam++;
				if(minuteAlam > 59) minuteAlam = 0;
				Write_EEPROM(0x4001, minuteAlam);
			}
			
			buffer[0] = hourAlam / 10;
			buffer[2] = hourAlam % 10;
			buffer[4] = minuteAlam / 10;
			buffer[6] = minuteAlam % 10;
			
			for(i=0; i< 14; ++i)
			{
				TM1628_display_segments(i,buffer[i],0); 
			}
		}
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
	GPIO_Init(LedAlam_PORT, LedAlam_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
	GPIO_Init(GPIOB, GPIO_PIN_4 | GPIO_PIN_5, GPIO_MODE_OUT_OD_HIZ_SLOW);
	GPIO_Init(BUT_PORT1 ,BUT_PIN1 ,GPIO_MODE_IN_PU_IT);
	GPIO_Init(BUT_PORT2 ,BUT_PIN2 ,GPIO_MODE_IN_PU_NO_IT);
	GPIO_Init(BUT_PORT3 ,BUT_PIN3 ,GPIO_MODE_IN_PU_NO_IT);
}

void Exti_Config(void){
	/*ngat ngoai*/
	EXTI_DeInit();
	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOD, EXTI_SENSITIVITY_FALL_ONLY);
	enableInterrupts();
}



