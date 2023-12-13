#include "mylibrary.h"

/*------------Ham Delay Timer4-----------*/
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

/*-----------Ham truyen Data UART1-------------*/
/*	pin 2  PD5/ AIN5/ UART1 data transmit
	pin 3 PD6/ AIN6/ UART1 data receive	*/
void UART1_Setup(void)
{
    UART1_Init(9600, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, 
	UART1_PARITY_NO, UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE);	
	UART1_Cmd(ENABLE);
}
void UART1_number(uint8_t data)
{
	UART1_SendData8(48+data);
	while(UART1_GetFlagStatus(UART1_FLAG_TXE)==0){}
	UART1_ClearFlag(UART1_FLAG_TXE);
}
void UART1_String(const char *cy)
{
	while(*cy)
    {
        UART1_SendData8(*cy);
        while(UART1_GetFlagStatus(UART1_FLAG_TXE)==0){}
        UART1_ClearFlag(UART1_FLAG_TXE);
        cy++;
    }
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
