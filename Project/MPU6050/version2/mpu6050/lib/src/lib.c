#include "lib.h"

void Timer4Config(void){
  TIM4->PSCR = (uint8_t)0x07;
  TIM4->ARR = (uint8_t)125 - 1;
  /*Enables the TIM4 peripheral*/
  TIM4->CR1 |= TIM4_CR1_CEN;
}
void Timer4DelayMs(uint16_t u16Delay){
  while(u16Delay){
    TIM4->CNTR = (uint8_t)0;
    /* Clear the flags (rc_w0) clear this bit by writing 0*/
    TIM4->SR1 = (uint8_t)(~0x01);
    while((TIM4->SR1 & (uint8_t)0x01) == RESET){}
    --u16Delay;
  }
}
/*==========================================================
-----------------Ham I2C------------
=============================================================*/
void I2C_init(void)
{
	I2C->CR1 = I2C_CR1_RESET_VALUE;
	I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ); /* Clear frequency bits */
	I2C->FREQR |= 16;	/*run 16mhz*/

	/*---------------------- I2C CCR Configuration --------------------*/
	/* Disable I2C to configure TRISER */
	I2C->CR1 &= (uint8_t)(~I2C_CR1_PE); 
	/* Clear CCRH & CCRL */
	I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
	I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
	/*  I2C running is standard mode. */
	//I2C->CCRL = 0xA0;		/*SCL clock is 50khz */
	I2C->CCRL = 0x50; 		/*SCL clock is 100khz */
	I2C->CCRH = 0x00;
	/* In standard mode, the maximum allowed SCL rise time is 1000 ns, I2C_FREQR=16, 
	-> t_master=1/16=62500us=62.5ns -> TRISE[5:0] = 1000ns/62.5ns + 1 = 17 			*/
	I2C->TRISER = 17;
	
	/*---------------------- I2C OAR Configuration --------------------*/
	/*  7 bit address mode: ADDMODE = 0, ADDCONF = 1, set Slave Address */
	// I2C->OARL = I2C_ADDR << 1;
	I2C->OARH |=  (I2C_OARH_ADDCONF | (0x00));
	/* Enable I2C */
  	I2C->CR1 |= I2C_CR1_PE;
}
void I2C_start(void)
{
	// assert_param(I2C_FLAG_BUSBUSY);
	while((I2C->SR3 & (uint8_t)0x02)==SET); /* Check busy flag */
	
	I2C->CR2 |= I2C_CR2_START; /* Generate a START condition */
	/*Check --EV5 */
	while((I2C->SR1 & I2C_SR1_SB) == 0);	
}
void I2C_stop(void)
{
	I2C->CR2 |= I2C_CR2_STOP;	/* Generate a STOP condition */
	/* Perform a read on SR1 and SR3 register to clear eventually pending flags */
	I2C->SR1;       I2C->SR3;
}
void I2C_address(uint8_t I2C_ADDR, I2C_Direction_TypeDef Direction)
{
	I2C_ADDR &= (uint8_t)0xFE; /* Clear bit0 (direction) just in case */
	I2C->DR = (uint8_t)(I2C_ADDR | (uint8_t)Direction); /* Send the Address + Direction */ 
  	/* Test on EV6 and clear it */
	I2C->SR1;
	while((I2C->SR1 & I2C_SR1_ADDR)==0);
}
void I2C_write(uint8_t data)
{
	I2C->SR1;
	I2C->SR3;
	/* Write data and test on EV8 and clear it */
	I2C->DR = data;
	while((I2C->SR1 & I2C_SR1_TXE)==0);
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

	// /*Set baudrate = 9600, BRR1 = 0x68, BRR2 = 0x03*/
	UART1->BRR2 = (uint8_t)0x03;
	UART1->BRR1 = (uint8_t)0x68;
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
