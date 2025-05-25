#include "stm8s.h" 

// TM1628
#define	TM1628_BRIGHTNESS_MAX	(7)
#define	TM1628_POSITION_MAX		(4)

// TM1628 commands
#define	TM1628_CMD_SET_DATA		0x40
#define	TM1628_CMD_SET_ADDR		0xC0
#define	TM1628_CMD_SET_DSIPLAY	0x80
//TM1628 Display Mode Setting Command
#define TM1628_CMD_MODE_DIS_1	0x02
#define TM1628_CMD_MODE_DIS_2	0x03
// TM1628 data settings (use bitwise OR to contruct complete command)
#define	TM1628_SET_DATA_WRITE		0x00 // write data to the display register
#define	TM1628_SET_DATA_READ		0x02 // read the key scan data
#define	TM1628_SET_DATA_A_ADDR		0x00 // automatic address increment
#define	TM1628_SET_DATA_F_ADDR		0x04 // fixed address
#define	TM1628_SET_DATA_M_NORM		0x00 // normal mode
#define	TM1628_SET_DATA_M_TEST		0x08 // test mode

// TM1628 display control command set (use bitwise OR to consruct complete command)
#define	TM1628_SET_DISPLAY_OFF		0x00 // off
#define	TM1628_SET_DISPLAY_ON		0x08 // on

// #define TM1628_PORT	GPIOD
// #define	DIO			GPIO_PIN_4	//PC4- DIO - PD5
#define DIO         GPIO_PIN_5  // DIO - PD5
// #define SCLK		    GPIO_PIN_5	//PC5 - SCLK - PD6
#define SCLK		GPIO_PIN_6	//SCLK - PD6	
// #define	STB	        GPIO_PIN_6	//PC6 - STB  - PA3
#define	STB			GPIO_PIN_3	//STB  - PA3

#define TM_DELAY	delay_us(100);
#define CLK_1 		GPIO_WriteHigh(GPIOD, SCLK)
#define CLK_0  		GPIO_WriteLow(GPIOD, SCLK)      
#define DIO_1 		GPIO_WriteHigh(GPIOD, DIO)
#define DIO_0  		GPIO_WriteLow(GPIOD, DIO)
#define STB_1		GPIO_WriteHigh(GPIOA, STB)
#define STB_0		GPIO_WriteLow(GPIOA, STB)

void delay_config(void);
void delay_ms(unsigned int  u16Delay);
void delay_us(unsigned long int  us);

void TM1628_INIT(unsigned char enable, const unsigned char brightness);
void TM1628_DISPLAY_SEGMENTS(const unsigned char position, const unsigned char digit, unsigned char dot);

void Write_EEPROM(uint32_t Address, unsigned char Data);
uint8_t Read_EEPROM(uint32_t Address);
