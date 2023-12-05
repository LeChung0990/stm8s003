#ifndef __USART_H
#define __USART_H 050620141
#include "main.h"
#define BUFFER_USART_SIZE       100
#ifdef __STM8S_UART1_H
#define UART_R_RXNE_vector              UART1_R_RXNE_vector
#define UART_GetFlagStatus              UART1_GetFlagStatus
#define UART_ClearFlag                  UART1_ClearFlag
#define UART_FLAG_RXNE                  UART1_FLAG_RXNE
#define UART_FLAG_IDLE                  UART1_FLAG_IDLE
#define UART                            UART1
#define UART_DeInit                     UART1_DeInit
#define UART_Init                       UART1_Init
#define UART_ITConfig                   UART1_ITConfig
#define UART_Cmd                        UART1_Cmd
#define UART_WORDLENGTH_8D              UART1_WORDLENGTH_8D
#define UART_STOPBITS_1                 UART1_STOPBITS_1
#define UART_PARITY_NO                  UART1_PARITY_NO
#define UART_SYNCMODE_CLOCK_DISABLE     UART1_SYNCMODE_CLOCK_DISABLE
#define UART_MODE_TXRX_ENABLE           UART1_MODE_TXRX_ENABLE
#define UART_IT_RXNE                    UART1_IT_RXNE
#define UART_IT_IDLE                    UART1_IT_IDLE
#define UART_SendData8                  UART1_SendData8
#define UART_FLAG_TC                    UART1_FLAG_TC
   #else
   #ifdef  __STM8S_UART2_H
#define UART_R_RXNE_vector              UART2_R_RXNE_vector
#define UART_GetFlagStatus              UART2_GetFlagStatus
#define UART_ClearFlag                  UART2_ClearFlag
#define UART_FLAG_RXNE                  UART2_FLAG_RXNE
#define UART_FLAG_IDLE                  UART2_FLAG_IDLE
#define UART                            UART2
#define UART_DeInit                     UART2_DeInit
#define UART_Init                       UART2_Init
#define UART_ITConfig                   UART2_ITConfig
#define UART_Cmd                        UART2_Cmd
#define UART_WORDLENGTH_8D              UART2_WORDLENGTH_8D
#define UART_STOPBITS_1                 UART2_STOPBITS_1
#define UART_PARITY_NO                  UART2_PARITY_NO
#define UART_SYNCMODE_CLOCK_DISABLE     UART2_SYNCMODE_CLOCK_DISABLE
#define UART_MODE_TXRX_ENABLE           UART2_MODE_TXRX_ENABLE
#define UART_IT_RXNE                    UART2_IT_RXNE
#define UART_IT_IDLE                    UART2_IT_IDLE
#define UART_SendData8                  UART2_SendData8
#define UART_FLAG_TC                    UART2_FLAG_TC
       #else
       #ifdef  __STM8S_UART3_H
#define UART_R_RXNE_vector              UART3_R_RXNE_vector
#define UART_GetFlagStatus              UART3_GetFlagStatus
#define UART_ClearFlag                  UART3_ClearFlag
#define UART_FLAG_RXNE                  UART3_FLAG_RXNE
#define UART_FLAG_IDLE                  UART3_FLAG_IDLE
#define UART                            UART3
#define UART_DeInit                     UART3_DeInit
#define UART_Init                       UART3_Init
#define UART_ITConfig                   UART3_ITConfig
#define UART_Cmd                        UART3_Cmd
#define UART_WORDLENGTH_8D              UART3_WORDLENGTH_8D
#define UART_STOPBITS_1                 UART3_STOPBITS_1
#define UART_PARITY_NO                  UART3_PARITY_NO
#define UART_SYNCMODE_CLOCK_DISABLE     UART3_SYNCMODE_CLOCK_DISABLE
#define UART_MODE_TXRX_ENABLE           UART3_MODE_TXRX_ENABLE
#define UART_IT_RXNE                    UART3_IT_RXNE
#define UART_IT_IDLE                    UART3_IT_IDLE
#define UART_SendData8                  UART3_SendData8
#define UART_FLAG_TC                    UART3_FLAG_TC
       #endif
   #endif
#endif
void USART_Init(uint32_t BaudRate);
void USART_PutChar(char c);
void USART_PutString(char* str);
void USART_PutStringFlash(const char* str);
void USART_PutBuffer(uint8_t* Buffer,uint16_t Length);
#endif