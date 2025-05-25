#include "stm8s.h"
#include "stdio.h"
#include "stdint.h"
// #include "stm8s_tim4.h"
#include "stm8s_gpio.h"
#include "tim.h"
#include "tm1637.h"
// #include "DS18x20.h"
#include "one-wire.h"
#include "stm8s_clk.h"

#define LED_PORT GPIOB
#define LED_PIN GPIO_PIN_5


/* ROM COMMANDS */
#define SEARCH_ROM         (u8)0XF0
#define READ_ROM           (u8)0x33
#define MATCH_ROM          (u8)0x55
#define SKIP_ROM           (u8)0xCC
#define ALARM_SEARCH       (u8)0XEC
/* FUNCTION COMMANDS */
#define CONVERT_T          (u8)0x44
#define WRITE_SCRATCHPAD   (u8)0x4E
#define READ_SCRATCHPAD    (u8)0xBE
#define COPY_SCRATCHPAD    (u8)0X48
#define RECALL_EE          (u8)0XB8
#define READ_POWER_SUPPLY  (u8)0XB4


float temp;
uint8_t chuc;
uint8_t donvi;
uint8_t tramtp;
uint8_t chuctp;

void DS18x20_ReadTemp(void) {
  unsigned char LSB;
  unsigned char MSB;

  OneWireReset();                       // Reset Pulse
  OneWireWriteByte(SKIP_ROM);           // Issue skip ROM command (CCh)
  OneWireWriteByte(CONVERT_T);          // Convert T command (44h)
  while(!OW_PIN_VALUE());               // DQ will hold line low while making measurement
  OneWireReset();                       // Start new command sequence
  OneWireWriteByte(SKIP_ROM);           // Issue skip ROM command
  OneWireWriteByte(READ_SCRATCHPAD);    // Read Scratchpad (BEh) - 15 bits
  LSB = OneWireReadByte();
  MSB = OneWireReadByte();
  OneWireReset();                       // Stop Reading
  
  temp = (((MSB << 8) | LSB)/ 16.0);
}


void main(void)
{
  /*Using HSI clock 8Mhz*/
  CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV2);
  // CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
  // CLK->CKDIVR |= (uint8_t)CLK_PRESCALER_HSIDIV1;

  GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_OUT_OD_LOW_FAST);

  // Timer4Config();
  TM1637_INIT(1, 1);
  TM1637_clear();

  while (1)
  {
    // delay_us(65530);
    LED_PORT->ODR ^= (uint8_t)LED_PIN;
    DS18x20_ReadTemp();
    delay_us(65000);
    chuc = (uint8_t) (temp / 10.0) % 10;
    donvi = (uint8_t) (temp / 1.0) % 10;
    chuctp = (uint8_t) (temp * 10.0) % 10;
    tramtp = (uint8_t) (temp * 100.0) % 10;
    TM1637_DISPLAY_DIGIT(0x00, chuc);
    TM1637_DISPLAY_DIGIT(0x01, donvi);
    TM1637_DISPLAY_DIGIT(0x02, chuctp);
    TM1637_DISPLAY_DIGIT(0x03, tramtp);

    /*Nhan Nut Dao trang thai LED*/
    // if(GPIO_ReadInputPin(BUT_PORT, BUT_PIN)== RESET){
    //     mydelay(200000);
    //     while(GPIO_ReadInputPin(BUT_PORT, BUT_PIN)== RESET);
    //     GPIO_WriteReverse(LED_PORT, LED_PIN);
    // }

    /*Nhan nut led sang, tha ra LED tat*/
    // if(GPIO_ReadInputPin(BUT_PORT, BUT_PIN)== RESET){
    //     mydelay(200000);
    //     if(GPIO_ReadInputPin(BUT_PORT, BUT_PIN)== RESET){
    //         // GPIO_WriteHigh(LED_PORT, LED_PIN);
    //         GPIO_WriteLow(LED_PORT, LED_PIN);
    //     }
    //     else{
    //         // GPIO_WriteLow(LED_PORT, LED_PIN);
    //         GPIO_WriteHigh(LED_PORT, LED_PIN);
    //     }
    // }
  }
}
