#include "main.h"

void main(void)
{
    CLOCK_Init(); //F_CPU 16Mhz RC
    GPIO_Config();
    ADC_Init();
    TIMER4_Init(); //Ngat 1ms
    TIMER2_Init(); //PWM
    TIMER1_Init(); //Sample Audio
    #if(DEBUG==1)
    USART_Init(115200); //Debug
    #endif
    enableInterrupts(); //Ngat toan cuc
    while(1) 
    {
        Check_Boost_ON(); //Boost 5V to 15V, bao ve qua tai va qua ap
        Scan_Key(); //Nut nhan
        Display_Effect(); //Hieu ung BAR
        VFD_Display(); //Hien thi du lieu len VFD
        #if(DEBUG==1) 
        Debug_System(); //Hien thi thong so he thong
        #endif
    }
}