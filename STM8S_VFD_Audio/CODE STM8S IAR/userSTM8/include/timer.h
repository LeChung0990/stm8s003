#ifndef __TIMER_H

#include "main.h"
#ifdef __STM8S_TIM1_H
void TIMER1_Init(void);
#endif
#ifdef __STM8S_TIM2_H
void TIMER2_Init(void);
#endif
#ifdef __STM8S_TIM3_H
void TIMER3_Init(void);
#endif
#ifdef __STM8S_TIM4_H
void TIMER4_Init(void);
#endif
#ifdef __STM8S_TIM5_H
void TIMER5_Init(void);
#endif
#ifdef __STM8S_TIM6_H
void TIMER6_Init(void);
#endif

#endif
