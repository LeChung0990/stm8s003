/*
#define PC3 CE
#define PC4 CSN
#define PC5 CLK
#define PC6 MOSI
#define PC7 MISO
*/
#include "stm8s.h" 
#include "stm8s_spi.h"
#include "stm8s_delay.h"

#define CE_PORT 	GPIOC
#define CE_PIN 		GPIO_PIN_3

#define CSN_PORT 	GPIOC
#define CSN_PIN 	GPIO_PIN_4


/*MEMORY MAP*/
#define	CONFIG		0x00
#define	EN_AA		0x01
#define EN_RXADDR	0x02
#define SETUP_AW	0x03
#define SETUP_RETR	0x04
#define RF_CH		0x05
#define RF_SETUP	0x06
#define STATUS 		0x07
#define	OBSERVE_TX 	0x08
#define	CD 			0x09
#define	RX_ADDR_P0 	0x0A
#define	RX_ADDR_P1 	0x0B
#define	RX_ADDR_P2 	0x0C
#define	RX_ADDR_P3 	0x0D
#define	RX_ADDR_P4 	0x0E
#define	RX_ADDR_P5 	0x0F
#define	TX_ADDR 	0x10
#define	RX_PW_P0 	0x11
#define	RX_PW_P1 	0x12
#define	RX_PW_P2 	0x13
#define	RX_PW_P3 	0x14
#define	RX_PW_P4 	0x15
#define	RX_PW_P5 	0x16
#define	FIFO_STATUS 0x17
#define	DYNPD		0x1C
#define	FEATURE 	0x1D

/*Instruction */
#define R_REGISTER 		0x00
#define W_REGISTER 		0x20
#define	REGISTER_MARK	0x1F
#define	ACTIVATE		0x50
#define	R_RX_PL_WID 	0x60
#define	R_RX_PAYLOAD	0x61
#define	W_TX_PAYLOAD 	0xA0
#define	W_ACK_PAYLOAD 	0xA8
#define	FLUSH_TX 		0xE1
#define	FLUSH_RX 		0xE2
#define	REUSE_TX_PL 	0xE3
#define	NOP				0xFF

void SPI_Master_Init(SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler);
void SPI_TRansmit(uint8_t* send_data, uint8_t length);
void SPI_Receive(uint8_t* receive_data, uint8_t length);
void nRF24_WriteReg(uint8_t Reg, uint8_t Data);
void nRF24_WriteRegMulti (uint8_t Reg, uint8_t *data, int size);
uint8_t nRF24_ReadReg( uint8_t Reg);
uint8_t nRF24_ReadReg_Multi( uint8_t Reg, uint8_t *data, uint8_t size);
void nRF24_Cmd(uint8_t cmd);
void nRF24_Init(void);
void nRF24_TxMode(uint8_t *Address, uint8_t channel);
uint8_t nRF24_Transmit(uint8_t *data);
