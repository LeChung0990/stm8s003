/*---------THU VIEN TU TAO ----------------*/
#include "mylibrary.h"



/*
--------------Ham Delay Timer4-----------
*/
void delay_msSetup(void)
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


/*
-----------------Ham truyen Data UART1----------------
*/
/*	pin 2  PD5/ AIN5/ UART1 data transmit
	pin 3 PD6/ AIN6/ UART1 data receive	*/
void UART1_Setup(void)
{
    UART1_Init(9600, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, 
	UART1_PARITY_NO, UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE);	
    /* Neu dung ngat: */
    // UART1_ITConfig(UART1_IT_RXNE_OR, ENABLE); 
	UART1_Cmd(ENABLE);
}
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
void UART1_newline(void)
{
    UART1_SendData8(0x0a);
    while(UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET);
}
char Serial_read_char(void)
{
    while (UART1_GetFlagStatus(UART1_FLAG_RXE) == RESET);
    UART1_ClearFlag(UART1_FLAG_RXNE);
    return (UART1_ReceiveData8());
}



/*
--------------------Ham I2C------------------
*/
void I2C_init(uint32_t I2C_CLOCK,uint8_t I2C_ADDR)
{
	uint8_t Input_Clock = 0x00;
	Input_Clock = CLK_GetClockFreq()/1000000;
	I2C_DeInit();
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
	I2C_Cmd(ENABLE);
	I2C_Init(I2C_CLOCK, I2C_ADDR, I2C_DUTYCYCLE_2, I2C_ACK_CURR, I2C_ADDMODE_7BIT, Input_Clock);
}
void I2C_start(void)
{
	//start i2c
	while(I2C_GetFlagStatus( I2C_FLAG_BUSBUSY)==SET);
	I2C_GenerateSTART(ENABLE);
	while(!I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT));
}
void I2C_address(uint8_t I2C_ADDR, uint8_t mode)
{
	//send oled address
  I2C_Send7bitAddress((uint8_t)I2C_ADDR,I2C_DIRECTION_TX);
 
  /* Test on EV6 and clear it */
  while(!I2C_CheckEvent( I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
 
  //command or data address register
  I2C_SendData(mode);
 
  /* Test on EV8 and clear it */
  while(!I2C_CheckEvent( I2C_EVENT_MASTER_BYTE_TRANSMITTED));
}
void I2C_write(uint8_t data)
{
	  /* write data */
    I2C_SendData(data);
  /* Test on EV8 and clear it */
    /* Wait till all data have been physically transferred on the bus */
    while(!I2C_GetFlagStatus( I2C_FLAG_TRANSFERFINISHED));
}
void I2C_stop(void)
{
	/* Send STOP condition */
    I2C_GenerateSTOP(ENABLE);
    /* Perform a read on SR1 and SR3 register to clear eventually pending flags */
    I2C->SR1;       I2C->SR3;
}