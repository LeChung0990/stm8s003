#include "stm8s.h"
#include "74HC595.h"

void main (void)
{
    CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
    HC595_Init();
    //GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);
    //ONE7SEG(2);

    HIENTHI(7);
    while(1) 
    {
        //GPIO_WriteReverse(GPIOD, GPIO_PIN_3);
        //delay_ms(400);
        //HIENTHI(256);
    }
}