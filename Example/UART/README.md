# UART STM8S003F3P6
## Bài 1: Phần UART
Trên STM8S003F3P6 trang bị 1 bộ UART1, các chân TX RX nằm ngay chân 2 và 3 của chip như hình dưới:\
<span	style= "color : green ">
        pin 2  PD5/ AIN5/ UART1 data transmit 
        pin 3 PD6/ AIN6/ UART1 data receive	
    </span>
<img src="https://github.com/LeChung0990/LaptrinhSTM8S003/assets/126931730/4cfa34ea-545d-4e28-807e-48cca0331411" alt="..." width="400" />

**1. Hàm khởi tạo UART1**
```c
void UART1_Setup(void)
{
    UART1_Init(9600, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, 
	UART1_PARITY_NO, UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE);	
    /* Neu dung ngat: */
    // UART1_ITConfig(UART1_IT_RXNE_OR, ENABLE); 
	UART1_Cmd(ENABLE);
}
```
**2. Một số hàm truyền dùng UART :** 
**Hàm in một số hoặc 1 ký tự lên Serial Monitor**
```c
void UART1_number(uint8_t data)
{
	UART1_SendData8(48+data); //in số
    UART1_SenData8(data); //in ký tự trong bảng ASCII
	while(UART1_GetFlagStatus(UART1_FLAG_TXE)==0){}
	UART1_ClearFlag(UART1_FLAG_TXE);
}
```
**Hàm in số nguyên lên Serial Monitor**
```c
void UART1_number(int number)
{
    char count = 0;
    char digit[5] = "";
    while(number != 0)
    {
        digit[count] = number%10;  //lay chu so ngoai cung xxxx8;
        count++;
        number = number/10;  //chia so number cho 10 de bo so ngoai cung xxxx
    }
    while (count!=0)
    {
        UART1_SendData8(digit[count - 1] + 0x30); // 0x30 = 48 ;
        while(UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET);
        // UART1_ClearFlag(UART1_FLAG_TXE); //khong can xoa co TXE
        count--;
    }
}
```
**Hàm in chuỗi lên Serial Monitor**
```c
void UART1_String(const char *cy)
{
	while(*cy)
    {
        UART1_SendData8(*cy);
        while(UART1_GetFlagStatus(UART1_FLAG_TXE)==0){}
        // UART1_ClearFlag(UART1_FLAG_TXE); //khong can xoa co TXE
        cy++;
    }
}
```
**Hàm in ký tự xuống dòng**
```c
void UART1_newline(void)
{
    UART1_SendData8(0x0a);
    while(UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET);
}
```
**Hàm nhận ký tự từ Serial Monitor**
```c
char Serial_read_char(void)
{
    while (UART1_GetFlagStatus(UART1_FLAG_RXE) == RESET);
    UART1_ClearFlag(UART1_FLAG_RXNE);
    return (UART1_ReceiveData8());
}
 /*Chờ cờ RXE được set lên 1 để báo đã nhận dữ liệu và sau 
 đó xoá cờ để xác nhận đã nhận dữ liệu*/
```
Dưới đây là code mẫu truyền ký tự từ chip lên máy tính sử dụng thư viện  <span style = "color: red" > mylibrary.h  </span>
```c
#include "stm8s.h"
#include "mylibrary.h" //Su dung thu vien mylibrary
void main(void)
{
    /*------------Set internal clock 16Mhz----------*/
    CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
    /*-----Khoi tao ham Delay tu TIMER4 trong thu vien mylibrary -------------*/
    delay_msSetup();
    /*-------------Ham khoi tao UART1 trong thu vien mylibrary-------------*/
    UART1_Setup();
}
while(1) 
{
    /*---------In ra Terminal ky tu "chung"-------------*/
    UART1_String("chung");
    UART1_String("	");
    delay_ms(1000);
}
```
**Ví dụ 2: nhận ký tự "A" từ máy tính và gửi lại đúng ký tự "A" đó**
```c
while(1) {
    while(UART1_GetFlagStatus(UART1_FLAG_RXNE) == RESET);
    datareceive = UART1_ReceiveData8();
    if(datareceive == 65)
    {
        UART1_SendData8(datareceive);
        while(UART1_GetFlagStatus(UART1_FLAG_TXE)==0){}
        UART1_ClearFlag(UART1_FLAG_TXE);
        datareceive = 0;
    }
}
```
*Kết quả*
<img src="https://github.com/LeChung0990/LaptrinhSTM8S003/assets/126931730/640ba14c-4d1e-42fc-babc-83315824be51 " alt="..." width="400" />

* **Ví dụ 3: Đọc giá trị ADC tại chân PD2 và gửi giá trị lên máy tính**

```php
float volt = 0;
volatile uint16_t adc_value = 0;
void main(void)
{
    /*------------Khoi tao ADC1 toc do fADC1 = fcpu/8, Single conversion mode,  -------------*/
    ADC1_DeInit();
    ADC1_Init(ADC1_CONVERSIONMODE_SINGLE, ADC1_CHANNEL_3, ADC1_PRESSEL_FCPU_D8, 
    ADC1_EXTTRIG_TIM, DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL3, DISABLE);
    ADC1_Cmd(ENABLE);
}
while(1)
{
/*----- Read ADC Value----*/
    ADC1_StartConversion();
    while(ADC1_GetFlagStatus(ADC1_FLAG_EOC)==0){}
    ADC1_ClearFlag(ADC1_FLAG_EOC);
    adc_value = ADC1_GetConversionValue();
/*----- Print ADC Value to Terminal ---------*/
    UART1_number(adc_value);
    UART1_newline();
/*-------Print Voltage Value ---------------- */
    volt = (adc_value*5.14)/1024.0;
    UART1_number((int)volt/1); // in phan so nguyen
    UART1_String(".");
    UART1_number((int)(volt*100)%100); // in 2 so sau dau phay
}
```
#### Phần trên đã sử dụng cờ ngắt trong thanh ghi trạng thái UART_SR bây giờ sử dụng hàm ngắt


+ Video tham khảo trên youtube:
<https://www.youtube.com/watch?v=-xvYX0vSDRk&list=PLZgzYRCEZ0Uf16CM809-9CCRCajDsGrDO&index=6&t=607s>

<http://laptrinharmst.blogspot.com/2018/01/uart-trong-stm8s.html>

+ Các hàm được xây dựng dựa trên bài tham khảo này:
<https://circuitdigest.com/microcontroller-projects/serial-monitor-on-stm8s-using-cosmic-and-stvd>














