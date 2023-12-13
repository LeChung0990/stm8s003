/*---------THU VIEN TU TAO ----------------*/
#include "stm8s.h"
#include "mylibrary.h"
#include "stm8s_i2c.h"

void CLK_HSIConfig(void){
	/*Using HSI clock 16Mhz*/
	CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
	CLK->CKDIVR |= (uint8_t)CLK_PRESCALER_HSIDIV1;
}
void delay_nop_ms (int time_ms) {
	volatile long int x;
	for (x = 0; x < 1036*time_ms; ++x)
		__asm__("nop");
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
	assert_param(I2C_FLAG_BUSBUSY);
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
uint8_t I2C_ByteRead(uint8_t I2C_Slave_Address, uint8_t ReadAddr)
{
	uint8_t Data;
	I2C_start();
	I2C_address(I2C_Slave_Address, I2C_DIRECTION_TX);
	I2C_write(ReadAddr);
	I2C_stop();
	
	I2C_start();
	I2C_Slave_Address &= (uint8_t)0xFE; /* Clear bit0 (direction) just in case */
	I2C->DR = (uint8_t)(I2C_Slave_Address | (uint8_t)I2C_DIRECTION_RX); /* Send the Address + Direction */ 
	
	I2C->SR1;	I2C->SR3;
	while((I2C->SR1 & I2C_SR1_ADDR)==0);
	while((I2C->SR3 & (uint8_t)0x02)==SET); //**busy flag

	while((I2C->SR1 & I2C_SR1_RXNE)==0);
	Data = (uint8_t)I2C->DR; 
	I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);	/* Disable the acknowledgement */
	I2C_stop();
	return Data;
}

