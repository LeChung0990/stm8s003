/**
  ******************************************************************************
  * Ten Tep      :        main.h
  * Tac Gia      :        www.hocdientu123.vn
  * Ngay         :        01-08-2019
  ******************************************************************************
  */
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H
#include "stm8s.h"
#include "stm8s_mylib.h"
#include "stm8s_it.h"
#include "stm8s_exti.h"
/* Private define ------------------------------------------------------------*/
//===========================khai bao cac chan vao ra======================//
#define LedAlam_PORT  	GPIOA		//khai bao lED o PORTB
#define LedAlam_PIN  	GPIO_PIN_3	//khai bao LED1 o chan PB0
#define BUT_PORT1	GPIOD
#define BUT_PIN1  	GPIO_PIN_3	//khai bao BUTTON1 o chan D3
#define BUT_PORT2	GPIOD
#define BUT_PIN2  	GPIO_PIN_2	//khai bao BUTTON2 o chan D2
#define BUT_PORT3	GPIOC
#define BUT_PIN3  	GPIO_PIN_7	//khai bao BUTTON3 o chan C7

#define TM1628_PORT	GPIOC
#define	DIO			GPIO_PIN_4	//PC4- DIO
#define SCLK		GPIO_PIN_5	//PC5 - SCLK	
#define	STB			GPIO_PIN_6	//PC6 - STB
#endif /* __MAIN_H*/

/******************* END OF FILE****/