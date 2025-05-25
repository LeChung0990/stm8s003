#include "stm8s.h" 
#include "stm8s_gpio.h"
// #include "stm8s_exti.h"
#include "stm8s_tim4.h"
#include "stm8s_adc1.h"

/*=============I2C define==========================================*/
#define SDA_0   GPIOB->ODR &= (uint8_t)(~GPIO_PIN_5)
#define SDA_1   GPIOB->ODR |= (uint8_t)GPIO_PIN_5
#define SCL_0   GPIOB->ODR &= (uint8_t)(~GPIO_PIN_4)
#define SCL_1   GPIOB->ODR |= (uint8_t)GPIO_PIN_4
#define SDA_VAL ((BitStatus)(GPIOB->IDR & (uint8_t)GPIO_PIN_5))
#define DELAYI2C    delay_us(3)


/*==============DS1307 define=====================================*/
#define ADDR_DS13	0xD0

/*==============RDA5807M define====================================*/
#define ADDR_5807M	0x20	// Chip RDA5807M Address

/*==============OLED SD1106 define=================================*/
#define OLED_ADDR       0x78                 // OLED write address 

//Dia chi 0x78 khi chan D/C (pin 15) tren man hinh keo xuong GND
//Dia chi 0x7A khi chan D/C noi len VCC
#define OLED_CMD_MODE   0x80                  // set command mode
#define OLED_DAT_MODE   0x40                  // set data mode
#define OLED_INIT_LEN_HOR   12
#define OLED_INIT_LEN_VER   15                    // 15: no screen flip, 17: screen flip


/*-----------------------SD1106-----------------------*/
#define CHARGEPUMP 0x8D
#define COLUMNADDR 0x21
#define COMSCANDEC 0xC8
#define COMSCANINC 0xC0
#define DISPLAYALLON 0xA5
#define DISPLAYALLON_RESUME 0xA4
#define DISPLAYOFF 0xAE
#define DISPLAYON 0xAF
#define EXTERNALVCC 0x1
#define INVERTDISPLAY 0xA7
#define MEMORYMODE 0x20
#define NORMALDISPLAY 0xA6
#define PAGEADDR 0x22
#define PAGESTARTADDRESS 0xB0
#define SEGREMAP 0xA1
#define SETCOMPINS 0xDA
#define SETCONTRAST 0x81
#define SETDISPLAYCLOCKDIV 0xD5
#define SETDISPLAYOFFSET 0xD3
#define SETHIGHCOLUMN 0x10
#define SETLOWCOLUMN 0x00
#define SETMULTIPLEX 0xA8
#define SETPRECHARGE 0xD9
#define SETSEGMENTREMAP 0xA1
#define SETSTARTLINE 0x40
#define SETVCOMDETECT 0xDB
#define SWITCHCAPVCC 0x2
#define READMODIFYWRITE 0xe0
#define END 0xee
#define DISPLAY_WIDTH 128
#define DISPLAY_HEIGHT 64




void Tim4_config(void);
void configADC(void);
void delay_us(unsigned long int  us);
void delay_ms(unsigned int  u16Delay);
void BEEP_config(void);
void BEEP_Cmd(FunctionalState NewState);

void i2c_init(void);
void i2c_start(void);
void i2c_stop(void);
uint8_t i2c_write(uint8_t u8Data);
uint8_t i2c_read(uint8_t Ack);
uint8_t data_write(uint8_t address, uint8_t addressData, uint8_t num, uint8_t *data);
uint8_t data_read(uint8_t address, uint8_t addressData, uint8_t num, uint8_t *data);

uint8_t decimal_to_bcd(uint8_t value);
void writeTime(uint8_t giay, uint8_t phut, uint8_t gio);
void writeDay(uint8_t date, uint8_t month);
// void readTime(void);

// void WriteData(unsigned char AddressData, unsigned char Data);
// uint8_t ReadData(unsigned char AddressData);

void Write_EEPROM(uint32_t Address, unsigned char Data);
uint8_t Read_EEPROM(uint32_t Address);

// void SetChannel(uint8_t kenh);
// uint16_t ReadDataChip(uint8_t Register);

void SD1106_sendCom(uint8_t command);
void SD1106_sendInitCom(void);
void SD1106_clear(void);

void SD1106_setContranst(char constrast);
void SD1106_resetDis(void);
void SD1106_flipScreen(void);
void SD1106_printP(char* p, uint8_t PAGES, uint8_t Column);
void SD1106_print_one_num(uint8_t so, uint8_t PAGES, uint8_t Column);
void SD1106_printNum(unsigned int Number, uint8_t PAGES,  uint8_t Column);
void SD1106_printBigNum(uint8_t Num, uint8_t Column);
void SD1106_printBigPoint(uint8_t Column);
void SD1106_printBigLine(uint8_t Column);
void SD1106_CUS_PRINT(void);
void print_levelBAT(uint8_t levelBAT );
void print_rssi(void);
void station_chanel(void);
void clock_icon_ds(void);