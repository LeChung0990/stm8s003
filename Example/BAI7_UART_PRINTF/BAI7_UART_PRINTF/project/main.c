/**
  ******************************************************************************
  * @file    Project/main.c 
  * @author  MCD Application Team
  * @version V2.2.0
  * @date    30-September-2014
  * @brief   Main program body
   ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; COPYRIGHT 2014 STMicroelectronics</center></h2>
  *
  * Licensed under MCD-ST Liberty SW License Agreement V2, (the "License");
  * You may not use this file except in compliance with the License.
  * You may obtain a copy of the License at:
  *
  *        http://www.st.com/software_license_agreement_liberty_v2
  *
  * Unless required by applicable law or agreed to in writing, software 
  * distributed under the License is distributed on an "AS IS" BASIS, 
  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  * See the License for the specific language governing permissions and
  * limitations under the License.
  *
  ******************************************************************************
  */ 


/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"
#include "stdio.h"

#define PUTCHAR_PROTOTYPE char putchar (char c)

PUTCHAR_PROTOTYPE
{
  /* Write a character to the UART1 */
  UART1_SendData8(c);
  /* Loop until the end of transmission */
  while (UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET);

  return (c);
}



/* Private defines -----------------------------------------------------------*/
uint16_t data_re=10;
/* Private function prototypes -----------------------------------------------*/
void Delay_us(uint32_t time_delay);
void Delay_ms(uint32_t time_delay);
void CLK_Cofiguration(void);
void GPIO_Configuration(void);
void UART_Configuration(void);
void UARTPrintf(char *message);
/* Private functions ---------------------------------------------------------*/



void main(void)
{
 
	CLK_Cofiguration();
	GPIO_Configuration();
	UART_Configuration();
  
  while (1)
  {
		
		//printf("chao cac ban \r\n");
		printf("chao cac ban %d \r\n",data_re);
		Delay_ms(500);
		
  }
  
}

void CLK_Cofiguration(void)
{
CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
}

void GPIO_Configuration(void)
{
  GPIO_DeInit(GPIOD); // reset trang thai cho tat ca port D
	GPIO_DeInit(GPIOA); // reset trang thai cho tat ca port D
	GPIO_Init(GPIOD,GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST); //cau hinh chan PD2 cua portD voi mode push pull toc do 2Mhz
	GPIO_Init(GPIOD,GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);//cau hinh chan PD3 cua portD voi mode push pull toc do 2Mhz
	GPIO_Init(GPIOA,GPIO_PIN_3, GPIO_MODE_IN_PU_NO_IT); 	// cau hinh chan PA3 la chan input, dien tro keo len, k ngat
}
void Delay_us(uint32_t time_delay)
{
while(time_delay--)
{
}
}

void Delay_ms(uint32_t time_delay)
{
while(time_delay--)
{
  Delay_us(200);
}
}
void UART_Configuration(void)
{
		UART1_DeInit();																																	// reset lai toan bo thanh ghi trong uart
		UART1_Init((u32)9600, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, UART1_PARITY_NO, 	 
             UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE);									// cai dat toc do baund la 9600, 1bit stop, k su dung nit chan le, khong su dung chan clock, su dung ca 2 chan Tx,Rx
		UART1_Cmd(ENABLE);																															// cho phep chay UART.
	
}


#ifdef USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param file: pointer to the source file name
  * @param line: assert_param error line source number
  * @retval : None
  */
void assert_failed(u8* file, u32 line)
{ 
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {
  }
}
#endif


/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
