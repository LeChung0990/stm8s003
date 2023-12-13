#include "adc.h"

void ADC_Init(void)
{
    ADC1_ConversionConfig(ADC1_CONVERSIONMODE_CONTINUOUS, ADC1_CHANNEL_4, ADC1_ALIGN_RIGHT);
    ADC1_PrescalerConfig(ADC1_PRESSEL_FCPU_D2);
    ADC1_DataBufferCmd(ENABLE);
    ADC1_ScanModeCmd(ENABLE);
    //ADC1_ITConfig(ADC1_IT_EOCIE, ENABLE);
    ADC1_StartConversion();
    ADC1_Cmd(ENABLE);

}

uint16_t ADC_Vref=5000;
void Read_Vref(void)
{
    ADC_Vref = ( ((uint32_t)1830*1023)/ADC1_GetBufferValue(4) );
}

uint16_t Read_Vol_Channel(uint8_t Channel)
{
    return ((uint32_t)ADC_Vref*ADC1_GetBufferValue(Channel))/1023;
}  

extern uint8_t Time_Tick_3;
uint16_t Vol_FB;
void Check_Boost_ON(void)
{
    uint8_t Time_Break = 6;
    Vol_FB = Read_Vol_Channel(3)*11;
    if(Time_Tick_3 > 250){
      Time_Tick_3 = 0;
      Read_Vref();
      if((ADC_Vref < 4200 || ADC_Vref > 5200)){ //Error --> 4.2V > Vin > 5.3V
        LED_STT = 1;
        Boost_SetDuty(0);
        Display_Bright(0);
        while(Time_Break--){
            LED_STT = !LED_STT;
            delay_ms(500);
        }
        Display_Bright(100);
      }
    }
    //Ngat xung bao ve, 4V --> Low (chap tai, mat V_FB, hong cuon cam), bao ve qua ap >15V
    if(Vol_FB < VSET && Vol_FB > 4000){ 
        LED_STT = 0; //ON
        Boost_SetDuty(76);
    }else{
        LED_STT = 1; //OFF
        Boost_SetDuty(0);
    }
}
