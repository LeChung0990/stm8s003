#include "stm8s_mylib.h"

void delay_config(void){
	TIM4_TimeBaseInit(TIM4_PRESCALER_128, 125 - 1);
	TIM4_Cmd(ENABLE);
}
void delay_ms(unsigned int  u16Delay)
{
	while (u16Delay) {
		TIM4_SetCounter(0);
		TIM4_ClearFlag(TIM4_FLAG_UPDATE);
		while (TIM4_GetFlagStatus(TIM4_FLAG_UPDATE) == RESET) {
		}
		--u16Delay;
	}
}
void I2C_init(void)
{
	I2C_DeInit();
	I2C_Init( 100000,0x68,I2C_DUTYCYCLE_2 , I2C_ACK_CURR ,I2C_ADDMODE_7BIT ,16);
	I2C_Cmd(ENABLE);
}
void I2C_start(void)
{

	while(I2C_GetFlagStatus(I2C_FLAG_BUSBUSY) == SET);
	I2C_GenerateSTART(ENABLE);
	while(I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT) == ERROR);

	

	//while((I2C->SR3 & (uint8_t)0x02)==SET); /* Check busy flag */
	//I2C->CR2 |= I2C_CR2_START; /* Generate a START condition */
	/*Check --EV5 */
	//while((I2C->SR1 & I2C_SR1_SB) == 0);	



}
void I2C_Re_start(void)
{
	//while(I2C_GetFlagStatus(I2C_FLAG_BUSBUSY) ==SET);
	I2C_GenerateSTART(ENABLE);
	I2C_AcknowledgeConfig(I2C_ACK_CURR);
	while(I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT) == ERROR);
}
void I2C_stop(void)
{

	I2C_GenerateSTOP(ENABLE);


	//I2C->CR2 |= I2C_CR2_STOP;	/* Generate a STOP condition */
	/* Perform a read on SR1 and SR3 register to clear eventually pending flags */
	//I2C->SR1;       I2C->SR3;
	
}
void I2C_address(uint8_t I2C_ADDR, I2C_Direction_TypeDef Direction)
{
	
	I2C_Send7bitAddress(I2C_ADDR, Direction );
	while(I2C_CheckEvent(I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED) == ERROR);


	//I2C_ADDR &= (uint8_t)0xFE; /* Clear bit0 (direction) just in case */
	//I2C->DR = (uint8_t)(I2C_ADDR | (uint8_t)Direction); /* Send the Address + Direction */ 
	/* Test on EV6 and clear it */
	//I2C->SR1;
	//while((I2C->SR1 & I2C_SR1_ADDR)==0);
}
void I2C_write(uint8_t data)
{
	

	I2C_SendData(data);
	/* Write data and test on EV8 and clear it */
	while(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTING)== ERROR);

	
	//I2C->SR1;
	//I2C->SR3;
	/* Write data and test on EV8 and clear it */
	//I2C->DR = data;
	//while((I2C->SR1 & I2C_SR1_TXE)==0);

}
uint16_t I2C_Read_MPU6050(void)
{
	int16_t AccXLSB, AccXMSB ;
	uint8_t I2C_Slave_Address = (uint8_t)0x68 << 1; /*MPU6050 Address*/
	I2C_start();
	I2C_address(I2C_Slave_Address, I2C_DIRECTION_TX);
	I2C_write(0x3B);
	
	I2C_Re_start();
	I2C_address(I2C_Slave_Address, I2C_DIRECTION_RX);
	
	while(I2C_GetFlagStatus(I2C_FLAG_RXNOTEMPTY) ==RESET);
	AccXLSB  = I2C_ReceiveData();
	I2C_AcknowledgeConfig(I2C_ACK_CURR);	

	while(I2C_GetFlagStatus(I2C_FLAG_RXNOTEMPTY) ==RESET);
	AccXMSB  = I2C_ReceiveData();
	I2C_AcknowledgeConfig(I2C_ACK_NONE);    /*NACK*/	

	I2C_stop();
	
	AccXLSB = (AccXLSB << 8) | AccXMSB;
	return AccXLSB;
}

uint8_t I2C_Read_Eeprom(void)
{
	uint8_t Result;
	uint8_t I2C_Slave_Address = (uint8_t)0xA0; /*MPU6050 Address*/
	I2C_start();
	I2C_address(I2C_Slave_Address, I2C_DIRECTION_TX);
	I2C_write(0x09);	/*Read Data from 0x09 Address*/
	
	
	I2C_Re_start();
	I2C_address(0xA1, I2C_DIRECTION_RX);
	while(I2C_GetFlagStatus(I2C_FLAG_BUSBUSY) ==SET);
	
	//while(I2C_GetFlagStatus(I2C_FLAG_RXNOTEMPTY) ==RESET);
	//Result  = I2C_ReceiveData();
	//I2C_AcknowledgeConfig(I2C_ACK_CURR);
	
	while(I2C_GetFlagStatus(I2C_FLAG_RXNOTEMPTY) ==RESET);
	Result  = I2C_ReceiveData();
	I2C_AcknowledgeConfig(I2C_ACK_NONE);    /*NACK*/
	
	I2C_stop();
	return Result;
}

void initMPU6050(void)
{
	I2C_start();	/*Disable SLEEP Mode*/
	I2C_address((uint8_t)0x68 << 1, I2C_DIRECTION_TX);
	I2C_write(0x6B);
	I2C_write(0x00);
	I2C_stop();
	delay_ms(100);

	I2C_start();	/*Enable Low Pass Filter*/
	I2C_address((uint8_t)0x68 << 1, I2C_DIRECTION_TX);
	I2C_write(0x1A);
	I2C_write(0x05);
	I2C_stop();
	delay_ms(100);

	I2C_start();
	I2C_address((uint8_t)0x68 << 1, I2C_DIRECTION_TX);
	I2C_write(0x1B);
	I2C_write(0x00); // 250 do/s
	I2C_stop();
	delay_ms(100);

	I2C_start(); /*Accelerometer Configuration*/
	I2C_address((uint8_t)0x68 << 1, I2C_DIRECTION_TX);
	I2C_write(0x1C);
	I2C_write(0x10); //+-8g
	I2C_stop();
}

void uart_init(void){
	uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
	
	UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  /* Clear the word length bit */
	UART1->CR1 |= (uint8_t)0x00; /* Set the word length bit, 8 Data bits */
	UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  /* Clear the STOP bits */
	UART1->CR3 |= (uint8_t)0x00; /**< One stop bit is transmitted at the end of frame*/
	
	UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  /* Clear the Parity Control bit */
	UART1->CR1 |= (uint8_t)0x00;  /* Set No Parity Control bit */
	
	UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  /* Clear the LSB mantissa of UART1DIV  */
	UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);	/* Clear the MSB mantissa of UART1DIV  */
	UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  /* Clear the Fraction bits of UART1DIV */

	/*Set baudrate = 9600, BRR1 = 0x68, BRR2 = 0x03*/
	//UART1->BRR2 = (uint8_t)0x03;
	//UART1->BRR1 = (uint8_t)0x68;
	
	/*Set baudrate = 19200, BRR1 = 0x34, BRR2 = 0x01 in datasheet*/
	UART1->BRR2 = (uint8_t)0x01;
	UART1->BRR1 = (uint8_t)0x34;
	
	/*Set baudrate = 57600, BRR1 = 0x11, BRR2 = 0x06 in datasheet*/
	// UART1->BRR2 = (uint8_t)0x06;
	// UART1->BRR1 = (uint8_t)0x11;
	
	UART1->CR2 |= (uint8_t)UART1_CR2_TEN; /*Transmit Enable and Receive Enable*/ 
	UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
	UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); /*Sync mode Disable, SLK pin Disable*/
	UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); /* UART1 Enable */
}

void uart1_number(int number)
{
    char count = 0;
    char digit[5] = "";
    while(number != 0)
    {
        digit[count] = number%10;   //lay chu so ngoai cung xxxx8;
        ++count;
        number = number/10;         //chia so number cho 10 de bo so ngoai cung xxxx
    }
    while (count!=0)
    {
        UART1->DR = (digit[count - 1] + 0x30); // 0x30 = 48 ;
		while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET);
        --count;
    }
}
void uart1_string(const char *cy)
{
	while(*cy)
    {
        UART1->DR = (*cy);
        while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET){}
        cy++;
    }
}
void uart1_nline(void)
{
    UART1->DR = (0x0a);
    while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET);
}

