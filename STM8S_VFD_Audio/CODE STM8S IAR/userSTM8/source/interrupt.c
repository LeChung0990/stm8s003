#include "interrupt.h"


uint8_t Time_Tick_2, Time_Tick_3, Time_Tick_4;
uint16_t Time_Tick_1;

#pragma vector = TIM4_OVR_UIF_vector
__interrupt void NgatTranTimer4(void)    //Ngat 1ms
{
    TIM4->SR1 = 0x00;
    Time_Tick_1++;
    Time_Tick_2++;
    Time_Tick_3++;
    Time_Tick_4++;
    //
    
}

extern BAR_DATA Sample;
uint8_t Sample_Count=0;
#pragma vector = TIM1_OVR_UIF_vector
__interrupt void NgatTranTimer1(void)
{
    TIM1->SR1 = 0x00;
    uint16_t ADC_Value = ADC1_GetBufferValue(2);
    if(ADC_Value < 13)ADC_Value = 0; else ADC_Value -= 13; //OFFSET
    //if(ADC_Value > 63)ADC_Value = 64; //Gioi han gia tri
    Sample.Data[Sample_Count] = ADC_Value >> 2; //Xen gia tri /4
    if(++Sample_Count > (Point_FFT/2))Sample_Count = 0;
    
}
