#include "stm8s.h"
#include "stm8s_mylib.h"
#include "math.h"


/* Private define ------------------------------------------------------------*/
//===========================khai bao cac chan vao ra======================//
#define BUT_PORT  	GPIOA		
#define BUT_PIN  	GPIO_PIN_3	

#define	SETHOUR 1
#define SETMIN	2
#define	COUNT	3
#define SETDAY	6
#define	SETMON	7
#define ALHOUR  4
#define ALMIN	5


unsigned char i;
unsigned char buffer[14]= {0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00};
unsigned char minute = 0;
unsigned char second = 0;
unsigned int counter = 0;

//============ ================khai bao ham==============================================//
void Clock_setup(void);	//thiet lap F_Clock cho MCU
void GPIO_setup(void);	//thiet lap GPIO
void Exti_Config(void);
void SetChannel(uint8_t kenh);
uint16_t ReadDataChip(uint8_t Register);
void OLED_init(void);
//============================HAM MAIN=====================================================//
void main()
{
	Clock_setup();
	GPIO_setup();
	delay_config();
	// Exti_Config();

	TM1628_INIT(1,1);

	delay_us(1000);
	minute = Read_EEPROM(0x4000);
	second = Read_EEPROM(0x4001);
	delay_us(1000);
    

	while (1)
	{
		if (GPIO_ReadInputPin(BUT_PORT, BUT_PIN) == RESET){
            delay_us(1000000);
            while (GPIO_ReadInputPin(BUT_PORT, BUT_PIN) == RESET);
               
        }
        buffer[0] = minute / 10;
        buffer[2] = minute % 10;
        buffer[4] = second / 10;
        buffer[6] = second % 10;
		
		for(i=0; i< 14; ++i)
		{
			if( second % 2 ){
				TM1628_DISPLAY_SEGMENTS(i,buffer[i],1); 
			}
			else { 
				TM1628_DISPLAY_SEGMENTS(i,buffer[i],0); 
			}
		}
    }
}

INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
{
    counter++;
    if (counter == 1000)
    {	
        counter = 0;
        second++;
        if (second > 59) 
        {
            second = 0;
            minute++;
            if (minute > 59) minute = 0;
        }
    }
    // xoa co update interrup
    TIM4_ClearITPendingBit(TIM4_IT_UPDATE); 
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
	GPIO_Init(BUT_PORT, BUT_PIN, GPIO_MODE_IN_PU_NO_IT);
	GPIO_Init(GPIOB, GPIO_PIN_4 | GPIO_PIN_5, GPIO_MODE_OUT_OD_HIZ_SLOW);
}

// void Exti_Config(void){
// 	/*ngat ngoai*/
// 	EXTI_DeInit();
// 	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOD, EXTI_SENSITIVITY_FALL_ONLY);
// 	enableInterrupts();
// }

// INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
// {
//   /* In order to detect unexpected events during development,
//      it is recommended to set a breakpoint on the following instruction.
//   */
//   	if (GPIO_ReadInputPin(BUT_PORT1, BUT_PIN1) == RESET){
// 		BEEP_Cmd(ENABLE );
// 		delay_us(300000);
// 		BEEP_Cmd(DISABLE );
// 		//while (GPIO_ReadInputPin(BUT_PORT1, BUT_PIN1) == RESET){}
// 		mode++;
// 		if(mode > ALMIN) mode = 0;
// 		if(GPIO_ReadInputPin(BUT_PORT1, BUT_PIN1) == RESET){
// 			delay_us(900000);
// 			BEEP_Cmd(ENABLE );
// 			delay_us(300000);
// 			BEEP_Cmd(DISABLE );
// 			delay_us(900000);
// 			mode = SETDAY;
// 			if(GPIO_ReadInputPin(BUT_PORT1, BUT_PIN1) == RESET){
// 				BEEP_Cmd(ENABLE );
// 				delay_us(300000);
// 				BEEP_Cmd(DISABLE );
// 				delay_us(900000);
// 				mode = SETMON;
// 			}
			
// 		}
// 	}
// }

