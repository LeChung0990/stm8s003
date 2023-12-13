#include "clock.h"
void CLOCK_Init(void)
{
    //CLK_HSICmd(ENABLE);
    //CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV1);
	CLK->CKDIVR = 0;
}