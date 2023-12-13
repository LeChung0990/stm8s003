#include "stm8s.h"
#include "mylibrary.h"
volatile uint8_t datareceive = 0;
float volt = 0;
volatile uint16_t adc_value = 0;
void main(void)
{
	/*------------Set internal clock 16Mhz----------*/
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
	/*-------------Set GPIO-----------*/
	// GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_HIGH_FAST);
	// GPIO_Init(GPIOD, GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT);
	/*-----Khoi tao ham Delay tu TIMER4 -------------*/
	delay_msSetup();
	/*-------------Khoi tao UART1-------------*/
	UART1_Setup();

	/*------------Khoi tao ADC1 toc do fADC1 = fcpu/8,
	Single conversion mode,  -------------*/

	// ADC1_DeInit();
	// ADC1_Init(ADC1_CONVERSIONMODE_SINGLE, ADC1_CHANNEL_3, ADC1_PRESSEL_FCPU_D8, 
	// ADC1_EXTTRIG_TIM, DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL3, DISABLE);
	// ADC1_Cmd(ENABLE);

    while(1) 
	{
		// while(UART1_GetFlagStatus(UART1_FLAG_RXNE) == RESET);
		// datareceive = UART1_ReceiveData8();
		// if(datareceive == 65){
		// 		UART1_SendData8(datareceive);
		// 		while(UART1_GetFlagStatus(UART1_FLAG_TXE)==0){}
		// 		UART1_ClearFlag(UART1_FLAG_TXE);
		// 		datareceive = 0;
		// }
		/*---------In ra Terminal ky tu "chung"-------------*/
		UART1_String("chung");
		//UART1_String("	");
		UART1_number(987);
		delay_ms(1000);
		
		/*--------------------------------------------------*/

		/*----- Read ADC Value----*/

		// ADC1_StartConversion();
		// while(ADC1_GetFlagStatus(ADC1_FLAG_EOC)==0){}
		// ADC1_ClearFlag(ADC1_FLAG_EOC);
		// adc_value = ADC1_GetConversionValue();

		/*----- Print ADC Value to Terminal ---------*/

		// UART1_number((uint16_t)adc_value/1000);
		// UART1_number((uint8_t)(adc_value/100)%10);
		// UART1_number((uint8_t)(adc_value/10)%10);
		// UART1_number((uint8_t)adc_value%10);
		// UART1_String("	");
		
		/*-------Print Voltage Value ---------------- */
		// volt = (adc_value*5.14)/1024.0;
		// UART1_number((uint8_t)volt/1);
		// UART1_String(".");
		// UART1_number((uint8_t)(volt*10)%10);
		// UART1_number((uint16_t)(volt*100)%10);
    }
}
//  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
//  {
// 	if(UART1_GetFlagStatus(UART1_IT_RXNE))
// 	{
// 		datareceive = UART1_ReceiveData8();
// 	}
//  }
