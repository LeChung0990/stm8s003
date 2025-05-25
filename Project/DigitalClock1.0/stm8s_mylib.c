#include "stm8s_mylib.h"

static uint8_t _config = TM1628_SET_DISPLAY_ON | TM1628_BRIGHTNESS_MAX;
static uint8_t _segments = 0xff;
static const uint8_t _digit2segments[10] =
{
	0x3F, // 0
	0x06, // 1
	0x5B, // 2
	0x4F, // 3
	0x66, // 4
	0x6D, // 5
	0x7D, // 6
	0x07, // 7
	0x7F, // 8
	0x6F  // 9
};

void delay_config(void){
	TIM4_DeInit();
	TIM4_TimeBaseInit(TIM4_PRESCALER_128, 125 - 1);
	TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
	TIM4_ClearFlag(TIM4_FLAG_UPDATE);
	TIM4_Cmd(DISABLE);
	enableInterrupts();
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

void delay_us(unsigned long int  us) {
  for(;us > 0; us--) nop();
}

void SEND_STOP(void)
{
	STB_1;
	DIO_0; TM_DELAY;  
	CLK_1; TM_DELAY;
	DIO_1; TM_DELAY;
}
void SEND_START(void)
{
	
	CLK_1; TM_DELAY;
	DIO_1; TM_DELAY;
	STB_0;
	DIO_0; TM_DELAY;
	CLK_0; TM_DELAY;
}

void SEND_WRITE(unsigned char data)
{
	unsigned char i;
	for (i = 0; i < 8; ++i)
	{
		if (data & 0x01) {DIO_1;}
		else {DIO_0;}
		TM_DELAY;	
		CLK_1;
		TM_DELAY;
		CLK_0;
		data >>= 1;
	}
	//CLK_1;
	//DIO_0;
}
void TM1628_SEND_COMMAND(const unsigned char value)
{
	SEND_START();
	SEND_WRITE(value);
	SEND_STOP();
	TM_DELAY;
}

void TM1628_SEND_CONFIG(const unsigned char enable, const unsigned char brightness)
{
	TM1628_SEND_COMMAND(TM1628_CMD_MODE_DIS_2);
	_config = (enable ? TM1628_SET_DISPLAY_ON : TM1628_SET_DISPLAY_OFF) |
		(brightness > TM1628_BRIGHTNESS_MAX ? TM1628_BRIGHTNESS_MAX : brightness);
	
	TM1628_SEND_COMMAND(TM1628_CMD_SET_DSIPLAY | _config);
	
}
void TM1628_INIT(unsigned char enable, const unsigned char brightness)
{	
	GPIO_Init(TM1628_PORT, DIO|SCLK|STB, GPIO_MODE_OUT_PP_HIGH_FAST);	

	TM1628_SEND_CONFIG(enable, brightness);
}
void TM1628_display_segments(const unsigned char position, const unsigned char digit, unsigned char dot)
{
	unsigned char segments ;
	if (digit < 10)
	{
		segments = _digit2segments[digit];
	} else
	{
		segments = 0x00;	
	}
	if ( (dot == 1 & (position == 2 )) | (dot == 2 & (position == 0 )) ) {
		segments = segments | 0x80;
	}
	TM1628_SEND_COMMAND(TM1628_CMD_SET_DATA | TM1628_SET_DATA_F_ADDR);
	SEND_START();
	SEND_WRITE(TM1628_CMD_SET_ADDR | position );
	SEND_WRITE(segments);
	SEND_STOP();
	TM_DELAY;
}


void I2C_init(void)
{
	I2C_DeInit();
	I2C_Init( 100000,0xD0,I2C_DUTYCYCLE_2 , I2C_ACK_CURR ,I2C_ADDMODE_7BIT ,16);
	I2C_Cmd(ENABLE);
}
void I2C_start(void)
{
	/* Check busy flag */
	while(I2C_GetFlagStatus(I2C_FLAG_BUSBUSY) == SET);
	/* Generate a START condition */
	I2C_GenerateSTART(ENABLE);
	/*Check --EV5 */
	while(I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT) == ERROR);

	//while((I2C->SR3 & (uint8_t)0x02)==SET); 
	//I2C->CR2 |= I2C_CR2_START; 
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


unsigned char decimal_to_bcd(unsigned char value)
{
	unsigned char hex;
	hex = (((value / 10) << 4) + (value % 10));
	return hex;
}
void WriteData(unsigned char AddressData, unsigned char Data)
{
	I2C_start();
	I2C_address((unsigned char)0xD0, I2C_DIRECTION_TX);
	I2C_write(AddressData);
	I2C_write(decimal_to_bcd(Data));
	I2C_stop();
}
unsigned char ReadData(unsigned char AddressData)
{
	unsigned char ResultData = 0;
	unsigned char temp;
	I2C_start();
	I2C_address((unsigned char)0xD0, I2C_DIRECTION_TX);
	I2C_write(AddressData);
	
	I2C_Re_start();
	I2C_address((unsigned char)0xD1, I2C_DIRECTION_RX);
	
	while(I2C_GetFlagStatus(I2C_FLAG_RXNOTEMPTY) ==RESET);
	ResultData  = I2C_ReceiveData();
	I2C_AcknowledgeConfig(I2C_ACK_NONE);    /*NACK*/
	I2C_stop();
	
	/*BCD to Decimal*/
	temp = (ResultData >> 4) & 0x0F;
	ResultData = ResultData & 0x0F;
	return ((temp*10)+ResultData);
}

/* ====================== UART1 ===================== */
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

void Write_EEPROM(uint32_t Address, unsigned char Data){
	FLASH_Unlock(FLASH_MEMTYPE_DATA);
	FLASH_ProgramByte(Address, Data);
	FLASH_Lock(FLASH_MEMTYPE_DATA);
}
unsigned char Read_EEPROM(uint32_t Address){
	unsigned char Data;
	Data = FLASH_ReadByte(Address);
	return Data;
}


