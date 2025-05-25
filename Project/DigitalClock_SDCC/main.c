#include "stm8s.h"
#include "stm8s_mylib.h"
#include "stm8s_gpio.h"
#include "stm8s_exti.h"
#include "stm8s_adc1.h"
#include "math.h"


/* Private define ------------------------------------------------------------*/
//===========================khai bao cac chan vao ra======================//
#define mode_PORT  	GPIOA		
#define mode_PIN  	GPIO_PIN_3

#define right_port   GPIOC
#define right_pin    GPIO_PIN_6

#define left_port   GPIOC
#define left_pin    GPIO_PIN_5

#define switch_PORT         GPIOC
#define switch_PIN          GPIO_PIN_4

#define	SETHOUR 1
#define SETMIN	2
#define	COUNT	3
#define SETDAY	6
#define	SETMON	7
#define ALHOUR  4
#define ALMIN	5

//=============================khai bao ham==============================================//
void Clock_setup(void);	//thiet lap F_Clock cho MCU
void GPIO_setup(void);	//thiet lap GPIO

void Exti_Config(void);
void readTime(void);
// uint16_t readADC(void);
void setchannel(uint16_t fre);

// Giay, phut, gio, thu, ngay, thang
uint8_t u8Time[6] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
uint8_t u8Radio[4] = {0,0,0,0};

const uint8_t mangAL[] = {
    4, 6, 27, 7,    //8-2024
    3, 7, 29, 8,    //9-2024
    3, 8, 29, 9,    //10-2024
    1, 10, 1, 10,   //11-2024
    1, 11, 1, 11    //12-2024
};

uint16_t FreFM = 0;
uint16_t adc_value = 0;
uint16_t voltBat = 0;
uint16_t counter = 0;
uint8_t powerradio = 0;
uint8_t cnt_second = 0;
uint8_t cnt_autoOff = 0;
uint8_t cnt_minute = 0;
uint8_t mode = 0;
uint16_t temph = 0;
uint8_t templ = 0;
uint8_t date = 0;
uint8_t month = 0;
uint8_t dateAL = 0;
uint8_t monthAL = 0;

uint8_t cnt_refesh = 0;
BitStatus lcdstate = RESET;

//===========================HAM MAIN=====================================================//
void main()
{
	Clock_setup();
	GPIO_setup();
	Tim4_config();
	Exti_Config();
    configADC();
    BEEP_config();
    i2c_init();
    
    delay_ms(100);  //Wait LCD OLED init
    SD1106_sendInitCom();
    SD1106_resetDis();
    SD1106_setContranst(200);
    SD1106_clear();
    lcdstate = SET;
    delay_ms(1);

    // FreFM = (Read_EEPROM(0x4000) << 8) & 0xFF00;
    // delay_ms(1);
	// FreFM = FreFM | Read_EEPROM(0x4001);
    // delay_ms(1);

    // writeTime(10,15,22);

    // setchannel(FreFM);

    // delay_ms(10);

    SD1106_CUS_PRINT();
	
	while (1)
	{
        if(!cnt_refesh){
                SD1106_clear();
                cnt_refesh++;
        }

        if( (cnt_autoOff >= 30) & lcdstate ){
            SD1106_sendCom(0xAE);   //OLED Off
            lcdstate = 0;
            cnt_minute = 0;
            cnt_second = 0; 
            cnt_autoOff = 0;
            if(powerradio){
            } else {
                halt();
                // wfi();
            }
        }

        if(dateAL == 1 | dateAL == 15){
            SD1106_printP("AL:1|15",0,2);
        } 

        if(adc_value != temph){
            //Dien ap tren chan diode la 0.52V khi cap nguon tu 3.7V -> 4.2V
            // De tinh duoc dien ap goc. 1024 x 0.52V = 532.48
            //Nhan 10 de bo qua dau cham phay: 532.48 x 10 = 5325
            // lay 5325/adc_value = 3 7V -> 4 2V
            voltBat = 5325 / temph;
            
            print_levelBAT(voltBat);
            SD1106_print_one_num( (uint8_t)voltBat/10,0,100);
            SD1106_printP(".",    0,  106);
            SD1106_print_one_num( (uint8_t)voltBat%10, 0, 112);
            SD1106_printP("V", 0, 118);
            
            adc_value = temph;
        }

        if (GPIO_ReadInputPin(right_port, right_pin) == RESET){
            delay_ms(20);
            if(powerradio){
                while (GPIO_ReadInputPin(right_port, right_pin) == RESET);
                setchannel(1000);   //Tan so 100.0 MHZ
            }
        }

        //xem ngay
        if (GPIO_ReadInputPin(left_port, left_pin) == RESET){
            delay_ms(20);
            if(powerradio){
                //do kenh FM
                i2c_start();
                i2c_write(ADDR_5807M);
                i2c_write(0xC3);
                i2c_write(0x01);
                i2c_stop();
            } else
            {
                delay_ms(500);
                SD1106_clear();
                while (GPIO_ReadInputPin(left_port, left_pin) == RESET){
                    SD1106_printP("+DATE+",   1,  70);
                    readTime();
                    uint8_t flag = ( (mangAL[(u8Time[5] - 8)*4] - u8Time[4] >= 1) ? 0 : 1);
                    if(flag){
                        dateAL = u8Time[4] - mangAL[(u8Time[5] - 8)*4] + 1;
                        monthAL = mangAL[(u8Time[5] - 8)*4 + 3];
                    } else
                    {
                        dateAL = u8Time[4] + mangAL[(u8Time[5] - 8)*4 + 2] - 1;
                        monthAL = mangAL[(u8Time[5] - 8)*4 + 1];
                    }
                    SD1106_printBigNum(u8Time[4]/10, 25);
                    SD1106_printBigNum(u8Time[4]%10, 42);
                    SD1106_printBigLine(59);
                    SD1106_printBigNum(u8Time[5]/10, 66);
                    SD1106_printBigNum(u8Time[5]%10, 83);
                    
                    SD1106_printP("AL:",0,2);
                    SD1106_printNum(dateAL,0,20);
                    SD1106_printP("-",0,32);
                    SD1106_printNum( monthAL, 0, 38);
                    delay_ms(100);
                    if(GPIO_ReadInputPin(right_port, right_pin) == RESET){
                        delay_ms(400);
                        while(GPIO_ReadInputPin(right_port, right_pin) == RESET){
                            delay_ms(400);
                            month++;
                            if(month > 12) month = 0;
                            SD1106_printBigNum(month/10, 66);
                            SD1106_printBigNum(month%10, 83);
                        }
                        date++;
                        if(date > 31) date = 0;
                        writeDay(date, month);
                    }
                    
                }
                SD1106_clear();
            }
        }
        //lay thoi gian tu RTC
        // if( (cnt_second % 5) == 0){
            readTime();
        // }
        
        // SD1106_printBigNum(u8Time[2]/10, 2);
        // SD1106_printBigNum(u8Time[2]%10, 19);
        // SD1106_printBigPoint(36);
        // SD1106_printBigNum(u8Time[1]/10, 43);
        // SD1106_printBigNum(u8Time[1]%10, 60);
        // SD1106_printBigPoint(77);
        // SD1106_printBigNum(u8Time[0]/10, 84);
        // SD1106_printBigNum(u8Time[0]%10, 101);

        //hour
        SD1106_printBigNum(u8Time[2]/10, 25);
        SD1106_printBigNum(u8Time[2]%10, 42);
        SD1106_printBigPoint(59);
        //minute
        SD1106_printBigNum(u8Time[1]/10, 66);
        SD1106_printBigNum(u8Time[1]%10, 83);
        //second
        SD1106_print_one_num( (uint8_t)u8Time[0]/10,7,100);
        SD1106_print_one_num( (uint8_t)u8Time[0]%10,7,106);
        delay_ms(100);
    
        if(GPIO_ReadInputPin(switch_PORT, switch_PIN)){
            powerradio = 1;
            delay_ms(1);
        } else {
            powerradio = 0;
            clock_icon_ds();
            delay_ms(1);
        }

        //Doc Tan So Kenh Hien tai
        if(powerradio == 1){
            data_read(ADDR_5807M | 0x22, 0x0A, 4, u8Radio);
            FreFM = (u8Radio[0] & 0x1) << 8;    //bit cao
            FreFM |= u8Radio[1];                //bit thap
            FreFM += 870; //tan so kenh hien tai

            print_rssi();
            SD1106_printNum(u8Radio[2] >> 2,    0,  20);

            station_chanel();
            SD1106_print_one_num(  FreFM/1000,      1,  20); // + 6
            SD1106_print_one_num( (FreFM/100)%10,   1,  26);
            SD1106_print_one_num( (FreFM/10) % 10,  1,  32);
            SD1106_printP(".",    1,  38);
            SD1106_print_one_num( (FreFM/1) %10,    1,  44);
        }

        while(mode == 1){

            if(!cnt_refesh){
                SD1106_sendCom(0xAF);   ////OLED On
                lcdstate = SET;
                SD1106_clear();
                cnt_refesh++;
            }
            SD1106_printP("+COUNTER+",   1,  70);
            if(GPIO_ReadInputPin(right_port, right_pin) == RESET){
                delay_ms(20); //stop/start
                while(GPIO_ReadInputPin(right_port, right_pin) == RESET);
                TIM4->CR1 ^= TIM4_CR1_CEN;
            }
            if(GPIO_ReadInputPin(left_port, left_pin) == RESET){
                delay_ms(50); //reset
                counter = 0;
		        cnt_second = 0;
                cnt_minute = 0;
                delay_ms(500);
                if(GPIO_ReadInputPin(left_port, left_pin) == RESET){
                    mode = 0;
                }
                
            }
            SD1106_printBigNum(cnt_minute/10, 25);
            SD1106_printBigNum(cnt_minute%10, 42);
            SD1106_printBigPoint(59);
            SD1106_printBigNum(cnt_second/10, 66);
            SD1106_printBigNum(cnt_second%10, 83);
            delay_ms(100);
        }

        while(mode == 2)
        {
            if(!cnt_refesh){
                SD1106_sendCom(0xAF);   ////OLED On
                lcdstate = SET;
                SD1106_clear();
                cnt_refesh++;
            }
            SD1106_printP("+SET TIME+",   1,  70);
            if( (GPIO_ReadInputPin(right_port, right_pin) == RESET) | (GPIO_ReadInputPin(left_port, left_pin) == RESET) ) {
                delay_ms(20);
                if(GPIO_ReadInputPin(right_port, right_pin) == RESET){
                    delay_ms(100);
                    u8Time[1]++;
                    if(u8Time[1] > 59) u8Time[1] = 0;
                }
                if(GPIO_ReadInputPin(left_port, left_pin) == RESET){
                    delay_ms(100);
                    u8Time[2]++;
                    if(u8Time[2] > 23) u8Time[2] = 0;
                }
                writeTime(00,u8Time[1],u8Time[2]);
            }
            
            delay_ms(10);
            // SD1106_printBigNum(u8Time[2]/10, 2);
            // SD1106_printBigNum(u8Time[2]%10, 19);
            // SD1106_printBigPoint(36);
            // SD1106_printBigNum(u8Time[1]/10, 43);
            // SD1106_printBigNum(u8Time[1]%10, 60);
            // SD1106_printBigPoint(77);
            // SD1106_printBigNum(0, 84);
            // SD1106_printBigNum(0, 101);

            SD1106_printBigNum(u8Time[2]/10, 25);
            SD1106_printBigNum(u8Time[2]%10, 42);
            SD1106_printBigPoint(59);
            SD1106_printBigNum(u8Time[1]/10, 66);
            SD1106_printBigNum(u8Time[1]%10, 83);
        }
    }
}

void Clock_setup(void)
{
	//KHAI BAO XUNG CLK
    CLK->ICKR = CLK_ICKR_RESET_VALUE;
    CLK->ECKR = CLK_ECKR_RESET_VALUE;
    CLK->SWR  = CLK_SWR_RESET_VALUE;
    CLK->SWCR = CLK_SWCR_RESET_VALUE;
    CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
    CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
    CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
    CLK->CSSR = CLK_CSSR_RESET_VALUE;
    CLK->CCOR = CLK_CCOR_RESET_VALUE;
    while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0) {}
    CLK->CCOR = CLK_CCOR_RESET_VALUE;
    CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
    CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;

    /* Clear High speed internal clock prescaler */
    CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);

    /* Set High speed internal clock prescaler */
    CLK->CKDIVR |= (uint8_t)0x00; /*!< High speed internal clock prescaler: 1 */
}


void GPIO_setup(void)
{
	///RESET CAC PORT
	GPIO_DeInit(GPIOD);
	GPIO_DeInit(GPIOC);
	GPIO_DeInit(GPIOA);
	GPIO_DeInit(GPIOE);
	GPIO_DeInit(GPIOB);   
	GPIO_DeInit(GPIOF);
	//KHAI BAO CAC CHAN VAO RA
	GPIO_Init(mode_PORT, mode_PIN, GPIO_MODE_IN_PU_IT);
    GPIO_Init(left_port, left_pin, GPIO_MODE_IN_PU_NO_IT);
    GPIO_Init(right_port, right_pin, GPIO_MODE_IN_PU_NO_IT);

	GPIO_Init(GPIOB, GPIO_PIN_4 | GPIO_PIN_5, GPIO_MODE_OUT_OD_HIZ_SLOW);
	GPIO_Init(GPIOC ,GPIO_PIN_4 ,GPIO_MODE_OUT_PP_LOW_SLOW);
    GPIO_WriteLow(GPIOC, GPIO_PIN_4);
}

void Exti_Config(void){
	/*ngat ngoai*/
	EXTI_DeInit();
	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOA, EXTI_SENSITIVITY_FALL_ONLY);
    EXTI_SetTLISensitivity(EXTI_TLISENSITIVITY_FALL_ONLY);
	enableInterrupts();
}
void readTime(void){
    uint8_t temp;
    data_read(ADDR_DS13, 0x00, 6, u8Time);
    for(uint8_t i=0; i<6; ++i){
        /*BCD to Decimal*/
        if((u8Time[i] >=0) && (u8Time[i] < 90) ){
            temp = (u8Time[i] >> 4) & 0x0F;
            u8Time[i] = u8Time[i] & 0x0F;
            u8Time[i] = (temp * 10) + u8Time[i];
        } else {
            u8Time[i] = 0;
        }
    }
}

// uint16_t readADC(void)
// {
//     //Start conversion
//     ADC1->CR1 |= ADC1_CR1_ADON;
//     while((uint8_t)(ADC1->CSR & ADC1_FLAG_EOC) == 0);
//     /* Clear EOC | AWD flag status */
//     ADC1->CSR &= (uint8_t) (~ADC1_FLAG_EOC);
//     // ADC1_ClearFlag(ADC1_FLAG_EOC);

//     uint16_t temph = 0;
//     uint8_t templ = 0;
//     /* Read LSB first */
//     templ = ADC1->DRL;
//     /* Then read MSB */
//     temph = ADC1->DRH;
    
//     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
//     return ((uint16_t)temph);
// }
void setchannel(uint16_t fre){
    fre = fre - 870;
    uint8_t high = (uint8_t) fre >> 2;
    uint8_t low = (uint8_t) ( (fre & 0b11) << 6) | 0b00010000;
    i2c_start();
    i2c_write(ADDR_5807M);
    i2c_write(0xC0);
    i2c_write(0x01);
    i2c_write(high);
    i2c_write(low);
    i2c_stop();
}

INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
    if (GPIO_ReadInputPin(mode_PORT, mode_PIN) == RESET){
        BEEP_Cmd(ENABLE);
        delay_ms(200);
        BEEP_Cmd(DISABLE);
        // delay_ms(100); 
        cnt_refesh = 0;
        cnt_autoOff = 0;
        mode++;
        if(mode > 2) mode = 0;
        delay_ms(200);
        if(GPIO_ReadInputPin(mode_PORT, mode_PIN) == RESET){
            delay_ms(400);
            if(GPIO_ReadInputPin(mode_PORT, mode_PIN) == RESET){
                delay_ms(400);
                while(GPIO_ReadInputPin(mode_PORT, mode_PIN) == RESET);
                mode = 0;
                GPIO_WriteReverse(switch_PORT, switch_PIN);
            }
            
        }
        
    }
}

INTERRUPT_HANDLER(ADC1_IRQHandler, 22){    
    
    /* Read LSB first */
    templ = ADC1->DRL;
    /* Then read MSB */
    temph = ADC1->DRH;
    
    temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t) 8 ));

    /* Clear EOC | AWD flag status */
    ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT_EOC);    
}


INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
{
    counter++;
	if (counter == 1000)
	{
		counter = 0;
		cnt_second++;
        cnt_autoOff++;
        if((cnt_second % 5) == 0){
            //Start conversion
            ADC1->CR1 |= ADC1_CR1_ADON;    
        }
		if (cnt_second > 59) 
		{
			cnt_second = 0;
			cnt_minute++;
			if (cnt_minute > 59) cnt_minute = 0;
		}
	}
	// xoa co update interrup
    TIM4->SR1 = (uint8_t)(~TIM4_IT_UPDATE);
}
