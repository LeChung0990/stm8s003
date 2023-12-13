#include "stm8s.h"
#include "stdio.h"
#include "stdlib.h"
#define BUT_PORT GPIOD
#define BUT_PIN (1 << 2)

#define TimeRun 40
uint8_t i;
uint8_t r, g, b;
uint8_t mode = 0;

void send_0(void)
{
    // GPIOD->ODR |= (uint8_t)(1 << 3);
    __asm__("bset 0x500f, #3");
    __asm__("nop\n nop\n nop\n nop\n nop\n");
    // GPIOD->ODR &= ~(uint8_t)(1 << 3);
    __asm__("bres 0x500f, #3");
    __asm__("nop\n nop\n nop\n nop\n nop\n nop\n nop\n nop\n nop\n nop\n");
}
void send_1(void)
{
    __asm__("bset 0x500f, #3");
    __asm__("nop\n nop\n nop\n nop\n nop\n nop\n nop\n nop\n nop\n nop\n nop\n nop\n");
    __asm__("bres 0x500f, #3");
    __asm__("nop\n nop\n nop\n");
}
void Color_byte(uint8_t data)
{
    for (uint8_t i = 0; i < 8; i++)
    {
        if (data & 0x80)
            send_1();
        else
            send_0();
        data <<= 1;
    }
}
void sendRGB(uint8_t Gbyte, uint8_t Rbyte, uint8_t Bbyte)
{
    Color_byte(Gbyte);
    Color_byte(Rbyte);
    Color_byte(Bbyte);
}
void number(uint8_t soLed, uint8_t Gbyte, uint8_t Rbyte, uint8_t Bbyte)
{
    switch (soLed)
    {
    case 1:
        sendRGB(Gbyte, Rbyte, Bbyte);
        break;
    case 2:
        sendRGB(Gbyte, Rbyte, Bbyte);
        sendRGB(Gbyte, Rbyte, Bbyte);
        break;
    case 3:
        sendRGB(Gbyte, Rbyte, Bbyte);
        sendRGB(Gbyte, Rbyte, Bbyte);
        sendRGB(Gbyte, Rbyte, Bbyte);
        break;
    case 4:
        sendRGB(Gbyte, Rbyte, Bbyte);
        sendRGB(Gbyte, Rbyte, Bbyte);
        sendRGB(Gbyte, Rbyte, Bbyte);
        sendRGB(Gbyte, Rbyte, Bbyte);
        break;
    case 5:
        sendRGB(Gbyte, Rbyte, Bbyte);
        sendRGB(Gbyte, Rbyte, Bbyte);
        sendRGB(Gbyte, Rbyte, Bbyte);
        sendRGB(Gbyte, Rbyte, Bbyte);
        sendRGB(Gbyte, Rbyte, Bbyte);
        break;
    case 6:
        sendRGB(Gbyte, Rbyte, Bbyte);
        sendRGB(Gbyte, Rbyte, Bbyte);
        sendRGB(Gbyte, Rbyte, Bbyte);
        sendRGB(Gbyte, Rbyte, Bbyte);
        sendRGB(Gbyte, Rbyte, Bbyte);
        sendRGB(Gbyte, Rbyte, Bbyte);
        break;
    case 7:
        sendRGB(Gbyte, Rbyte, Bbyte);
        sendRGB(Gbyte, Rbyte, Bbyte);
        sendRGB(Gbyte, Rbyte, Bbyte);
        sendRGB(Gbyte, Rbyte, Bbyte);
        sendRGB(Gbyte, Rbyte, Bbyte);
        sendRGB(Gbyte, Rbyte, Bbyte);
        sendRGB(Gbyte, Rbyte, Bbyte);
        break;
    case 8:
        sendRGB(Gbyte, Rbyte, Bbyte);
        sendRGB(Gbyte, Rbyte, Bbyte);
        sendRGB(Gbyte, Rbyte, Bbyte);
        sendRGB(Gbyte, Rbyte, Bbyte);
        sendRGB(Gbyte, Rbyte, Bbyte);
        sendRGB(Gbyte, Rbyte, Bbyte);
        sendRGB(Gbyte, Rbyte, Bbyte);
        sendRGB(Gbyte, Rbyte, Bbyte);
        break;
    default:
        break;
    }
}

void hieuung1(uint8_t r, uint8_t g, uint8_t b)
{
    uint8_t rev_r = 0, rev_g = 0, rev_b = 0;

    for (uint8_t i = 0; i < 8; i++)
        rev_r |= (((r >> (7 - i)) & 1) ? (1 << i) : 0);
    for (uint8_t i = 0; i < 8; i++)
        rev_g |= (((g >> (7 - i)) & 1) ? (1 << i) : 0);
    for (uint8_t i = 0; i < 8; i++)
        rev_b |= (((b >> (7 - i)) & 1) ? (1 << i) : 0);

    number(8, rev_r, rev_g, rev_b);
}

/*CODE THEO THANH GHI*/
void Timer4Config(void)
{
    TIM4->PSCR = (uint8_t)0x07;
    TIM4->ARR = (uint8_t)125 - 1;
    /*Enables the TIM4 peripheral*/
    TIM4->CR1 |= TIM4_CR1_CEN;
}
void Timer4DelayMs(uint16_t u16Delay)
{
    while (u16Delay)
    {
        TIM4->CNTR = (uint8_t)0;
        /* Clear the flags (rc_w0) clear this bit by writing 0*/
        TIM4->SR1 = (uint8_t)(~0x01);
        while ((TIM4->SR1 & (uint8_t)0x01) == RESET)
        {
        }
        --u16Delay;
    }
}
void clearLEDs(void)
{
    number(8, 0, 0, 0);
    Timer4DelayMs(50);
}

void ChayLed1(void)
{
    r = rand() % 256;
    g = rand() % 256;
    b = rand() % 256;
    for (i = 1; i < 9; i++)
    {

        number(i, g, r, b);
        Timer4DelayMs(TimeRun);
    }
}

void ChayLed2(void)
{

    for (i = 0; i < 255; i++)
    {
        number(8, i, 100, i);
        Timer4DelayMs(10);
    }

    for (i = 255; i > 0; i--)
    {
        number(8, i, 100, i);
        Timer4DelayMs(10);
    }
}
void ChayLED4(void)
{
    for (i = 1; i < 9; i++)
    {
        number(i, 255, 51, 255);
        Timer4DelayMs(TimeRun);
    }
}

void ChayLED5(void)
{
    r = rand() % 256;
    g = rand() % 256;
    b = rand() % 256;
    for (i = 8; i > 0; i--)
    {
        number(i - 1, 0, 0, 0);
        number(9 - i, g, r, b);
        Timer4DelayMs(100);
    }

    for (i = 1; i < 9; i++)
    {
        number(i, 0, 0, 0);
        Timer4DelayMs(100);
    }
}

void NhapNhay1(void)
{
    for (i = 0; i < 255; i++)
    {
        number(8, i, 100, i);
        Timer4DelayMs(10);
    }

    for (i = 255; i > 0; i--)
    {
        number(8, i, 100, i);
        Timer4DelayMs(10);
    }
}

void NhapNhayRED(void)
{
    for (i = 0; i < 255; i++)
    {
        number(8, 0, i, 0);
        Timer4DelayMs(1);
    }

    for (i = 255; i > 0; i--)
    {
        number(8, 0, i, 0);
        Timer4DelayMs(1);
    }
}

void HaiMau(void)
{
    number(4, 255, 51, 255);
    number(4, 60, 255, 60);
}

void Chay1LED(void)
{
    r = rand() % 256;
    g = rand() % 256;
    b = rand() % 256;
    for (i = 1; i < 9; i++)
    {
        number(i - 1, 0, 0, 0);
        number(2, g, r, b);
        number(7 - i, 0, 0, 0);
        Timer4DelayMs(100);
    }
}

void ChayLEDNgoaiTrong(void)
{
    r = rand() % 256;
    g = rand() % 256;
    b = rand() % 256;
    for (i = 1; i < 5; i++)
    {
        number(4 - i, 0, 0, 0);
        number(1, g, r, b);
        number(2 * (i - 1), 0, 0, 0);
        number(1, g, r, b);
        number(4 - i, 0, 0, 0);
        Timer4DelayMs(200);
    }
    for (i = 4; i > 0; i--)
    {
        number(4 - i, 0, 0, 0);
        number(1, g, r, b);
        number(2 * (i - 1), 0, 0, 0);
        number(1, g, r, b);
        number(4 - i, 0, 0, 0);
        Timer4DelayMs(200);
    }
}
/*----------------------MAIN FUNCTION--------------------------*/
int main(void)
{
    /*Using HSI clock 16Mhz*/
    // CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
    CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
    CLK->CKDIVR |= (uint8_t)0x00;

    GPIOD->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
    GPIOD->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
    GPIOD->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
    GPIOD->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */

    GPIOD->DDR |= (uint8_t)(1 << 3); /* Set Output mode */
    GPIOD->ODR |= (uint8_t)(1 << 3); /* High level */
    GPIOD->CR1 |= (uint8_t)(1 << 3); /* Pull-Up or Push-Pull */
    GPIOD->CR2 |= (uint8_t)(1 << 3); /* Output speed up to 10 MHz */

    // GPIOD->DDR &= ~(uint8_t)(1 << 2); /* Set Output mode */
    // GPIOD->IDR |= (uint8_t)(1 << 2);  /* High level */
    // GPIOD->CR1 |= (uint8_t)(1 << 2);  /* Pull-Up */
    // GPIOD->CR2 |= (uint8_t)(1 << 2);  /* External interrupt enabled */

    EXTI->CR1 = EXTI_CR1_RESET_VALUE;
    EXTI->CR2 = EXTI_CR2_RESET_VALUE;

    BUT_PORT->DDR &= (uint8_t)(~(BUT_PIN)); /* Set Input mode */
    BUT_PORT->CR1 |= (uint8_t)BUT_PIN;      /* Pull-Up  */
    BUT_PORT->CR2 |= (uint8_t)BUT_PIN;      /* External interrupt enabled */
    EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS); /*!< PORTD external interrupt sensitivity bits mask */
    EXTI->CR1 |= (uint8_t)((0x02) << 6);    /*!< Interrupt on Falling edge only */

    Timer4Config();
    enableInterrupts();
    // clearLEDs();

    //  number(0,0,0,0);
    //  number(1,10,10,10);
    //  number(6,0,0,0);
    //  number(1,10,10,10);
    //  number(0,0,0,0);
    while (1)
    {

        while (mode == 1)
        {

            for (i = 1; i < 9; i++)
            {
                number(i, 255, 0, 0);
                Timer4DelayMs(TimeRun);
            }
            for (i = 1; i < 9; i++)
            {
                number(i, 0, 255, 0);
                Timer4DelayMs(TimeRun);
            }

            for (i = 1; i < 9; i++)
            {
                number(i, 0, 0, 255);
                Timer4DelayMs(TimeRun);
            }

            for (i = 1; i < 9; i++)
            {
                number(i, 0, 255, 255);
                Timer4DelayMs(TimeRun);
            }
            for (i = 1; i < 9; i++)
            {
                number(i, 255, 0, 255);
                Timer4DelayMs(TimeRun);
            }

            for (i = 1; i < 9; i++)
            {
                number(i, 255, 255, 0);
                Timer4DelayMs(TimeRun);
            }
        }
        if (mode == 2)
        {
            ChayLED4();
        }
        while (mode == 3)
        {
            NhapNhay1();
        }
        while (mode == 4)
        {
            NhapNhayRED();
        }
        while (mode == 5)
        {
            ChayLED5();
        }

        while (mode == 6)
        {
            Chay1LED();
        }

        while (mode == 7)
        {
            ChayLEDNgoaiTrong();
        }
        while (mode == 8)
        {
            HaiMau();
            mode = 0;
        }
    }
}
INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
{
    if ((GPIOD->IDR & (1 << 2)) == RESET)
    {
        Timer4DelayMs(200);
        while ((GPIOD->IDR & (1 << 2)) == RESET)
            ;
        mode++;
        if (mode > 8)
            mode = 0;
    }
}

// for (i = 1; i < 9; i++)
// {
//     number(i, 0, 255, 255);
//     Timer4DelayMs(TimeRun);
// }
// for (i = 1; i < 9; i++)
// {
//     number(i, 255, 0, 255);
//     Timer4DelayMs(TimeRun);
// }

// for (i = 1; i < 9; i++)
// {
//     number(i, 255, 255, 0);
//     Timer4DelayMs(TimeRun);
// }

// for (i = 1; i < 9; i++)
// {
//     number(i, 255, 255, 255);
//     Timer4DelayMs(TimeRun);
// }
// for (i = 1; i < 9; i++)
// {
//     number(i, 255, 100, 35);
//     Timer4DelayMs(TimeRun);
// }