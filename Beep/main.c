#include "stm8s.h"
#include "stdio.h"


void main (void)
{
    /*Using HSI clock 16Mhz*/
    // CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1); 
    CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
    CLK->CKDIVR |= (uint8_t)0x00;
    
    BEEP->CSR = BEEP_CSR_RESET_VALUE;
    /* Set a default calibration value if no calibration is done */
    if ((BEEP->CSR & BEEP_CSR_BEEPDIV) == BEEP_CSR_BEEPDIV)
    {
        BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
        BEEP->CSR |= 0x0B;
    }
    BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPSEL);
    BEEP->CSR |= (uint8_t)(0x40);

    /* Enable the BEEP peripheral */
    BEEP->CSR |= BEEP_CSR_BEEPEN;

    while (1)
    {

    }
}

