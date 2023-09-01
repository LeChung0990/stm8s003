# Bước đầu lập trình STM8S003F3P6
**Các branch trong source code này phục vụ cho các project liên quan đến VĐK STM8** 

*Các branch là các bài code cơ bản trước khi tìm hiểu một vi điều khiển mới bao gồm GPIO, Timer, Ngắt ngoài, giao tiếp UART, I2C, SPI, ...*\
*Ngoài ra kèm theo code là tài liệu của chip và phần chạy code trong thực tế*
## 1. Các thư viện
```C
    #include <stdint.h>
    #include <stddef.h>
```
## 2. Set Clock cho STM8S003F3P6
```C
//sử dụng clock nội 16MHZ
CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
```
## 3. GPIO
```C
/*Khai bao chan noi den LED la output*/
GPIO_DeInit(GPIOD);
GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);
```

## 4. Code cho phần Timer
#### a. Dùng timer2 để tạo delay
```C
void main (void)
{
    CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
    GPIO_DeInit(GPIOD);
    GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_HIGH_FAST);
    /*TIMER2 dem len 15625 tick chiem thoi gian 500ms, 
    tuy nhien de chinh xac nen truyen vao 15624*/
    TIM2_TimeBaseInit(TIM2_PRESCALER_512, 15624);
    TIM2_ClearFlag(TIM2_FLAG_UPDATE);
    TIM2_ITConfig(TIM2_IT_UPDATE, ENABLE);
    enableInterrupts();
    TIM2_Cmd(ENABLE);
}
 //hàm ngắt
 INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 {
    GPIO_WriteReverse(GPIOD, GPIO_PIN_3);
    TIM2_ClearFlag(TIM2_FLAG_UPDATE);
 }
 ```
- Kết quả LED nháy tắt 500ms
Nếu không sử dụng hàm ngắt chúng ta kiểm tra cờ ngắt của timer2
 
 ```c
 void main (void)
 {
    TIM2_TimeBaseInit(TIM2_PRESCALER_512, 15624);
    TIM2_Cmd(ENABLE);
 }
void delay_ms(uint16_t delay)
{
    while(delay)
    {
        TIM2_SetCounter(0);
        TIM2_ClearFlag(TIM2_FLAG_UPDATE);
        while(TIM2_GetFlagStatus(TIM2_FLAG_UPDATE)== RESET){}
        --delay;
    }
}
 ```  
 
#### b.Dùng timer4 để tạo delay
```c
uint16_t i = 0;
void main (void)
{
    /*Thet lap ngat cho timer4*/
    TIM4_TimeBaseInit(TIM4_PRESCALER_128, 125 - 1);
    TIM4_SetCounter(0);
    TIM4_ClearFlag(TIM4_FLAG_UPDATE);
    TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
    enableInterrupts();
    TIM4_Cmd(ENABLE);
}

/*----------------Ngat timer4------------*/
 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 {
    TIM4_SetCounter(0);
    TIM4_ClearFlag(TIM4_FLAG_UPDATE);
    i++;
    if(i>500)
    {
      GPIO_WriteReverse(GPIOD, GPIO_PIN_3);
      i=0;
    }
 }  
```
Nếu không sử dụng hàm ngắt
```c
void main(void)
{
    TIM4_TimeBaseInit(TIM4_PRESCALER_128, 125 - 1);
    TIM4_Cmd(ENABLE);
}
void delay_ms(uint16_t u16Delay)
{
    while (u16Delay) {
        TIM4_SetCounter(0);
        TIM4_ClearFlag(TIM4_FLAG_UPDATE);
        while (TIM4_GetFlagStatus(TIM4_FLAG_UPDATE) == RESET) {}
        --u16Delay;
    }
}
```
## 5. Ngắt ngoài
```c
void main(void)
{
    /*ngat ngoai*/
    EXTI_DeInit();
    GPIO_Init(GPIOD, GPIO_PIN_4, GPIO_MODE_IN_PU_IT);
    EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOD, EXTI_SENSITIVITY_FALL_ONLY);
    enableInterrupts();
}
 /*-----------Ham ngat ngoai-------------*/
INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
{
  GPIO_WriteReverse(GPIOD, GPIO_PIN_3);
}
```
Hàm ngắt ngoài nhưng có chống dội nút nhấn
```php
/*---------Ngat ngoai tai chan PD4----------*/
INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
{
  if(GPIO_ReadInputPin(GPIOD, GPIO_PIN_4)==0)
  {
    delay_ms(100);
    while(GPIO_ReadInputPin(GPIOD, GPIO_PIN_4)==0){}
    GPIO_WriteReverse(GPIOD, GPIO_PIN_3);
    dem++;
    if (dem>9)dem=0;
  }
}
```

## 6. UART
Linh tham khảo
<https://circuitdigest.com/microcontroller-projects/serial-monitor-on-stm8s-using-cosmic-and-stvd>