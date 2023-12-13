#include "delay.h"
void delay_ms(uint16_t x){
	 while(x--)delay_us(1000);
}
void delay_us(uint16_t y)
{
	 while(y--)
	 {
           nop();
           nop();
           nop();
           nop();
           nop();
           nop();
           nop();
           nop();
           nop();
           nop();
           nop();
	 }
}
void delay_ns(void)
{
    //nop();
    //nop();
    //nop();
    //nop();
}  