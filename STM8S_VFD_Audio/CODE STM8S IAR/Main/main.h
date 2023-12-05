#ifndef __MAIN_H
#define __MAIN_H
#define eeprom        __no_init
#define flash         const
/*    Kieu So Nguyen Co Dau    */
typedef  long  int    int32_t;
typedef  int          int16_t;
typedef  char         int8_t;

/*	Kieu So Nguyen Khong Dau */
typedef unsigned long  uint32_t;
typedef unsigned int uint16_t;
typedef unsigned char  uint8_t;
/*	Kieu So Thuc */
typedef   float            float32_t;
/*******************************************************************************
   - STANDAR C - STANDAR C - STANDAR C - STANDAR C - STANDAR C - STANDAR C -
*******************************************************************************/
#include "defstm8s.h"
#include "stdio.h"
//#include "string.h"
//#include "stdlib.h"
//#include "math.h"
/*******************************************************************************
   - FWLIB - FWLIB - FWLIB - FWLIB - FWLIB - FWLIB - FWLIB - FWLIB - FWLIB -
*******************************************************************************/
//#include "stm8s_awu.h"
//#include "stm8s_spi.h"
#include "stm8s_adc1.h"
//#include "stm8s_clk.h"
//#include "stm8s_beep.h"
//#include "stm8s_iwdg.h"
//#include "stm8s_flash.h"
#include "stm8s_tim1.h"
#include "stm8s_tim2.h"
//#include "stm8s_tim3.h"
#include "stm8s_tim4.h"
//#include "stm8s_uart1.h"
//#include "stm8s_exti.h"
//#include "stm8s_itc.h"
/*******************************************************************************
   - USER STM8 - USER STM8 - USER STM8 - USER STM8 - USER STM8 - USER STM8 -
*******************************************************************************/
#include "clock.h"
#include "gpio.h"
#include "timer.h"
#include "usart.h"
//#include "flash.h"
//#include "eeprom.h"
//#include "iwatchdog.h"
#include "adc.h"
//#include "exti.h"
#include "interrupt.h"
/*******************************************************************************
   - USER - USER - USER - USER - USER - USER - USER - USER - USER - USER -
*******************************************************************************/
#include "delay.h"        // tao cac ham delay ms, delay us
/*******************************************************************************
 PROJECT - PROJECT - PROJECT - PROJECT - PROJECT - PROJECT - PROJECT - PROJECT
*******************************************************************************/
//#include "fft.h"
#include "display.h"
/*******************************************************************************
 --- DEFINE PORT PIN - DEFINE PORT PIN - DEFINE PORT PIN - DEFINE PORT PIN ---
*******************************************************************************/
#define LED_STT     PORTB_5     //LED
#define SCK         PORTC_5  //SPI
#define SDA         PORTC_6  //SPI
//#define AIN         PINC_4    //ADC_IN2
//#define FB15V       PIND_2    //ADC_IN3
//#define VCAP        PIND_3    //ADC_IN4 Vcap = 1.83V --> Vref (VDD)
//#define HPWM        PORTD_4   //TIM2_CH1
//#define BPWM        PORTA_3   //TIM2_CH3
//#define PWM_AC1     PORTD_5   //TXD
//#define PWM_AC2     PORTD_6   //RXD
#define STR         PORTC_3     //Lacth#
#define SET         PINA_1
#define KEY         PINA_2
/******************************************************************************/
#define DEBUG                   0
#define Point_FFT		28     // 28 Point FFT   , 14 Bar Column
#define BAR_MAX                 15     //Bar 0-15
#define TOTAL_EFFECT            5
#define VSET                    15000
#define Display_Bright($1)      TIM2->CCR1L=$1;
#define Boost_SetDuty($1)       TIM2->CCR3L=$1;
/******************************************************************************/

typedef struct
{
    uint8_t  Data[(Point_FFT/2)+1];
}BAR_DATA;

#endif
/******************************KET THUC FILE******************************/