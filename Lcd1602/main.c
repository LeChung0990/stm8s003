#include "stm8s.h"
#include "LCD1602.h"
uint16_t i = 0;
void main (void)
{
    CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
    lcd_init();
    while(1) 
    {
      lcd_puts(0,0,"chung");
    }
}