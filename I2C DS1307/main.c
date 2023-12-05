#include "stm8s.h"
#include "stdio.h"
#define DS1307_I2C_CLOCK        100000
#define DS1307_I2C_ADDR        	0x78
#define OLED_CMD_MODE   0x00                  // set command mode
#define OLED_DAT_MODE   0x40                  // set data mode
#define OLED_INIT_LEN   12
const uint8_t OLED_INIT_CMD[] = {
	0xA8, 0x1F,       // set multiplex (HEIGHT-1): 0x1F for 128x32, 0x3F for 128x64
	0x22, 0x00, 0x03, // set min and max page
	0x20, 0x00,       // set horizontal memory addressing mode
	0xDA, 0x02,       // set COM pins hardware configuration to sequential
	0x8D, 0x14,       // enable charge pump
	0xAF,             // switch on OLED
	0xA1, 0xC8        // flip the screen
};
// standard ASCII 5x8 font (adapted from Neven Boyanov and Stephen Denne)
const uint8_t OLED_FONT[]= {
	0x3E, 0x51, 0x49, 0x45, 0x3E, // 0 0
	0x00, 0x42, 0x7F, 0x40, 0x00, // 1 1
	0x42, 0x61, 0x51, 0x49, 0x46, // 2 2
	0x21, 0x41, 0x45, 0x4B, 0x31, // 3 3
	0x18, 0x14, 0x12, 0x7F, 0x10, // 4 4
	0x27, 0x45, 0x45, 0x45, 0x39, // 5 5
	0x3C, 0x4A, 0x49, 0x49, 0x30, // 6 6
	0x01, 0x71, 0x09, 0x05, 0x03, // 7 7
	0x36, 0x49, 0x49, 0x49, 0x36, // 8 8
	0x06, 0x49, 0x49, 0x29, 0x1E, // 9 9
	0x7F, 0x09, 0x19, 0x29, 0x46, // R 10
	0x46, 0x49, 0x49, 0x49, 0x31, // S 11
	0x00, 0x60, 0x60, 0x00, 0x00, // . 12
	0x7F, 0x40, 0x40, 0x40, 0x40, // L 44
	0x7F, 0x49, 0x49, 0x49, 0x41, // E 37
	0x7F, 0x41, 0x41, 0x22, 0x1C, // D 36
	0x3F, 0x40, 0x40, 0x40, 0x3F, // U 53
	0x3E, 0x41, 0x41, 0x41, 0x22, // C 35
	0x7F, 0x08, 0x08, 0x08, 0x7F, // H 40
	0x3E, 0x41, 0x41, 0x41, 0x3E, // O 47
	0x7C, 0x12, 0x11, 0x12, 0x7C, // A 33
	0x7F, 0x04, 0x08, 0x10, 0x7F, // N 46
	0x3E, 0x41, 0x49, 0x49, 0x7A, // G 39
	0x07, 0x08, 0x70, 0x08, 0x07, // Y 57
	0x40, 0x40, 0x40, 0x40, 0x40  // _ 63
};
void I2C_init(void);
void I2C_start(void);
void I2C_address(uint8_t mode);
void I2C_write(uint8_t data);
void I2C_stop(void);
void OLED_init(void);
void OLED_printC(char ch);
void OLED_cursor(uint8_t xpos, uint8_t ypos);
void OLED_clear(void);
void main(void)
{
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
	I2C_init();
	OLED_init();
	
	// OLED_printC(13);
	
    while(1) {
	OLED_cursor(0,0);
	OLED_clear();
	for (int i=13;i<23; i++)
	{
		OLED_printC(i);
	}
	OLED_printC(21);
	OLED_printC(22);
	OLED_printC(16);
	OLED_printC(23);
	OLED_printC(14);
	OLED_printC(21);
	
    }
}

void I2C_init(void)
{
	uint8_t Input_Clock = 0x00;
	Input_Clock = CLK_GetClockFreq()/1000000;
	I2C_DeInit();
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
	I2C_Cmd( ENABLE);
	I2C_Init(DS1307_I2C_CLOCK, DS1307_I2C_ADDR, I2C_DUTYCYCLE_2, I2C_ACK_CURR, I2C_ADDMODE_7BIT, Input_Clock);
}
void I2C_start(void)
{
	//start i2c
	while(I2C_GetFlagStatus( I2C_FLAG_BUSBUSY)==SET);
	I2C_GenerateSTART(ENABLE);
	while(!I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT));
}
void I2C_address(uint8_t mode)
{
	//send oled address
  I2C_Send7bitAddress((uint8_t)DS1307_I2C_ADDR,I2C_DIRECTION_TX);
 
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
void OLED_init(void)
{
	I2C_start();
	I2C_address(OLED_CMD_MODE);
	for (uint8_t i = 0;i < OLED_INIT_LEN;i++)
	{
		I2C_write(OLED_INIT_CMD[i]);
	}
	I2C_stop();
}
void OLED_printC(char ch)
{
	uint16_t offset = ch;
	offset += offset << 2;
	I2C_start();
	I2C_address(OLED_DAT_MODE);
	I2C_write(0x00);
	for(uint8_t i = 5; i;i--){ I2C_write(OLED_FONT[offset++]); }
	I2C_stop();
}
void OLED_cursor(uint8_t xpos, uint8_t ypos)
{
	I2C_start();
	I2C_address(OLED_CMD_MODE);
	I2C_write(xpos & 0x0F);
	I2C_write(0x10 | (xpos >> 4));
	I2C_write(0xB0 | (ypos & 0x07));
	I2C_stop();
}
void OLED_clear(void)
{
	OLED_cursor(0,0);
	I2C_start();
	I2C_address(OLED_DAT_MODE);
	for (uint16_t i=512;i;i--)
	{
		I2C_write(0x00);
	}
	I2C_stop();
}