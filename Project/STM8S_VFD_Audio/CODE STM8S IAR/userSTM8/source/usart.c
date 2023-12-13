#include "usart.h"
#if(__USART_H!=050620141)
#error Sai file usart.h
#endif
#define LENGHT_BUFFER_UART        100
uint8_t str[20],*s;
uint16_t a;
static uint16_t NumberByteInBuffer=0;
static uint16_t IndexByteInBuffer=0;
static uint8_t  BufferUart[LENGHT_BUFFER_UART];
//cac bien luu tru thong so bo dem du lieu
void USART_Init(uint32_t BaudRate)
{
    UART_DeInit();
    UART_Init(BaudRate,  UART_WORDLENGTH_8D, 
                      UART_STOPBITS_1, 
                      UART_PARITY_NO, 
                      UART_SYNCMODE_CLOCK_DISABLE, 
                      UART_MODE_TXRX_ENABLE);
    UART_ITConfig(UART_IT_RXNE,ENABLE);
    UART_ITConfig(UART_IT_IDLE,ENABLE);
    UART_Cmd(ENABLE);
}
void USART_PutChar(char c)
{
    UART_SendData8(c);
    while(UART_GetFlagStatus(UART_FLAG_TC)==RESET);

}
void USART_PutString(char* str)
{
    while(*str)
    {
       USART_PutChar(*str);
       str++;
    }
}
void USART_PutBuffer(uint8_t* Buffer,uint16_t Length)
{
  uint16_t i;
  for(i=0;i<Length;i++)
  {
    USART_PutChar(Buffer[i]); 
  }
}
#pragma vector = UART_R_RXNE_vector
__interrupt void NgatNhanUsart(void)
{
    if(UART_GetFlagStatus(UART_FLAG_RXNE)!=RESET)
    {
      UART_ClearFlag(UART_FLAG_RXNE);
      BufferUart[IndexByteInBuffer++] = (uint8_t)(UART->DR);      
    }
    if(UART_GetFlagStatus(UART_FLAG_IDLE)!=RESET)
    {
      UART->SR;
      UART->DR;
      NumberByteInBuffer = IndexByteInBuffer;
      IndexByteInBuffer=0;
    }    
}
