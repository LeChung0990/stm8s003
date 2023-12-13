#include <stdio.h>
#include "stm8s.h"
#include "stdlib.h"
#include "math.h"

void Timer4Config(void){
  TIM4->PSCR = (uint8_t)0x07;
  TIM4->ARR = (uint8_t)125 - 1;
  /*Enables the TIM4 peripheral*/
  TIM4->CR1 |= TIM4_CR1_CEN;
}
void Timer4DelayMs(uint16_t u16Delay){
  while(u16Delay){
    TIM4->CNTR = (uint8_t)0;
    /* Clear the flags (rc_w0) clear this bit by writing 0*/
    TIM4->SR1 = (uint8_t)(~0x01);
    while((TIM4->SR1 & (uint8_t)0x01) == RESET){}
    --u16Delay;
  }
}
void uart_init(void){
	uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
	
	UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  /* Clear the word length bit */
	UART1->CR1 |= (uint8_t)0x00; /* Set the word length bit, 8 Data bits */
	UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  /* Clear the STOP bits */
	UART1->CR3 |= (uint8_t)0x00; /**< One stop bit is transmitted at the end of frame*/

	UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  /* Clear the Parity Control bit */
	UART1->CR1 |= (uint8_t)0x00;  /* Set No Parity Control bit */
	
	UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  /* Clear the LSB mantissa of UART1DIV  */
	UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);	/* Clear the MSB mantissa of UART1DIV  */
	UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  /* Clear the Fraction bits of UART1DIV */

	// /*Set baudrate = 9600, BRR1 = 0x68, BRR2 = 0x03*/
	UART1->BRR2 = (uint8_t)0x03;
	UART1->BRR1 = (uint8_t)0x68;
	/*Set baudrate = 57600, BRR1 = 0x11, BRR2 = 0x06 in datasheet*/
	// UART1->BRR2 = (uint8_t)0x06;
	// UART1->BRR1 = (uint8_t)0x11;
  	
	UART1->CR2 |= (uint8_t)UART1_CR2_TEN; /*Transmit Enable and Receive Enable*/ 
	UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
    UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); /*Sync mode Disable, SLK pin Disable*/
    UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); /* UART1 Enable */
}
void uart1_number(int number)
{
    char count = 0;
    char digit[5] = "";
    while(number != 0)
    {
        digit[count] = number%10;   //lay chu so ngoai cung xxxx8;
        ++count;
        number = number/10;         //chia so number cho 10 de bo so ngoai cung xxxx
    }
    while (count!=0)
    {
        UART1->DR = (digit[count - 1] + 0x30); // 0x30 = 48 ;
		while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET);
        --count;
    }
}
// void uart1_float(float num){
//     uint32_t num2 = num * 100;
// 	char count = 0;
//     char digit[6] = "";
// 	while(num2!=0){
// 		digit[count] = (uint8_t)num2%10;
// 		num2 = num2 /10;
//         ++count;
//         if(count == 2){digit[2]=-2; ++count;}
// 	}
//     while (count!=0){
//         UART1->DR = (digit[count - 1] + 0x30); // 0x30 = 48 ;
// 		while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET);
//         --count;
//     }
// }

void uart1_string(const char *cy)
{
	while(*cy)
    {
        UART1->DR = (*cy);
        while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET){}
        cy++;
    }
}
void uart1_nline(void)
{
    UART1->DR = (0x0a);
    while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET);
}
float _err_measure;
float _err_estimate;
float _q;
float _current_estimate = 0;
float _last_estimate = 0;
float _kalman_gain = 0;

void SimpleKalmanFilter(float mea_e, float est_e, float q)
{
  _err_measure=mea_e;
  _err_estimate=est_e;
  _q = q;
}

float updateEstimate(float mea)
{
  _kalman_gain = _err_estimate/(_err_estimate + _err_measure);
  _current_estimate = _last_estimate + _kalman_gain * (mea - _last_estimate);
  _err_estimate =  (1.0 - _kalman_gain)*_err_estimate + fabsf(_last_estimate-_current_estimate)*_q;
  _last_estimate=_current_estimate;

  return _current_estimate;
}
void ADC1_DeInit(void){
    ADC1->CSR  = ADC1_CSR_RESET_VALUE;
    ADC1->CR1  = ADC1_CR1_RESET_VALUE;
    ADC1->CR2  = ADC1_CR2_RESET_VALUE;
    ADC1->CR3  = ADC1_CR3_RESET_VALUE;
    ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
    ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
    ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
    ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
    ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
    ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
    ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
    ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
}
void ADC1_Init(void){
    /* Clear the ADC1 channels */
    ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
    /* Select the Analog channel 4 , AIN4, pin PD3 (20)*/
    ADC1->CSR |= (uint8_t)(0x04);

    /* Clear the align bit */
    ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
    /* Configure the data alignment:  Data alignment right */
    ADC1->CR2 |= (uint8_t)(0x08);

    /* Set the single conversion mode */
    ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);

    /* Clear the SPSEL bits */
    ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
    /* Prescaler selection fADC1 = fcpu/18 */
    ADC1->CR1 |= (uint8_t)0x70;  

    ADC1->CR1 |= ADC1_CR1_ADON;

}
uint16_t ADC1_Read(void){
    /*Enable the ADC1 peripheral to conversion*/
    ADC1->CR1 |= ADC1_CR1_ADON;
    /* Waiting for conversion complete, bit EOC */
    while( (ADC1->CSR & ADC1_CSR_EOC) == RESET){}    
    /* Clear EOC flag status */
    ADC1->CSR &= (uint8_t) (~ADC1_CSR_EOC);

    uint16_t temph = 0;
    uint8_t templ = 0;
    /* Read LSB first */
    templ = ADC1->DRL;
    /* Then read MSB */
    temph = ADC1->DRH;
    temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
    return ((uint16_t)temph);
}


volatile uint16_t adc_value = 0;
void main(void)
{
	/*------------Set internal clock 16Mhz----------*/
    CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
    CLK->CKDIVR |= (uint8_t)0x00;
    
	Timer4Config();
	uart_init();
    SimpleKalmanFilter(10, 1, 0.05);
    int a_kalman ;
    ADC1_DeInit();
	ADC1_Init();
    while(1) 
    {
        // ADC1_StartConversion();
		// while(ADC1_GetFlagStatus(ADC1_FLAG_EOC)==0){}
		// ADC1_ClearFlag(ADC1_FLAG_EOC);
		// adc_value = ADC1_GetConversionValue();
        adc_value = ADC1_Read();

        uart1_number(adc_value);
        uart1_string(",");
        a_kalman =(int) updateEstimate(adc_value);
        uart1_number(a_kalman);

        // // sprintf(a,"a=%d",a_kalman);
        // uart1_string("chung");
        uart1_nline();
		// Timer4DelayMs(1000);
    }
}
