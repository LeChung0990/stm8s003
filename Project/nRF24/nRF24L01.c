#include "nRF24L01.h"

void SPI_Master_Init(SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler)
{
    /*Enable  SPI Clock*/
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, ENABLE);
    /*Set the MOSI, MISO, CLK, at high level*/
    GPIO_ExternalPullUpConfig(GPIOC, (GPIO_Pin_TypeDef)(GPIO_PIN_5 | GPIO_PIN_6 | GPIO_PIN_7), ENABLE);
    /*Init SPI*/
    SPI_Init(SPI_FIRSTBIT_MSB, 
        BaudRatePrescaler,
        SPI_MODE_MASTER,
        SPI_CLOCKPOLARITY_LOW,
        SPI_CLOCKPHASE_1EDGE,
        SPI_DATADIRECTION_1LINE_TX,
        SPI_NSS_SOFT,0x07);
    /*Enable SPI*/
    SPI_Cmd(ENABLE);
    GPIO_Init(CE_PORT, (GPIO_Pin_TypeDef) (CE_PIN | CSN_PIN), GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_WriteHigh(CSN_PORT, CSN_PIN);
}
void CS_Select(void){
    GPIO_WriteLow(CSN_PORT, CSN_PIN);
}

void CS_UnSelect(void){
    GPIO_WriteHigh(CSN_PORT, CSN_PIN);
}

void CE_Enable(void){
    GPIO_WriteHigh(CE_PORT, CE_PIN);
}

void CE_Disable(void){
    GPIO_WriteLow(CE_PORT, CE_PIN);
}

void SPI_TRansmit(uint8_t* send_data, uint8_t length)
{
  uint8_t i;
  for (i=0; i<length; ++i)
  {
	SPI_SendData(* (send_data + i));
	while( !SPI_GetFlagStatus(SPI_FLAG_TXE));
  }
}

void SPI_Receive(uint8_t* receive_data, uint8_t length)
{
  uint8_t i;
  for (i=0; i<length; ++i)
  {
    if(receive_data != RESET)
    {
        while( !SPI_GetFlagStatus(SPI_FLAG_RXNE));
        *(receive_data + i) = SPI_ReceiveData();
    }
  }
}


/* Write a single byte to the particular register*/
void nRF24_WriteReg(uint8_t Reg, uint8_t Data)
{
    uint8_t buf[2];
    buf[0] = Reg | (1<<5);
    buf[1] = Data;
    /*PULL THE CS PIN LOW TO SELECT THE DEVICE*/
    CS_Select();

    SPI_TRansmit(buf, 2);
    /*Pull the CS HIGH to relase the device */
    CS_UnSelect();
}

/*write multiple bytes starting from a particular register*/
void nRF24_WriteRegMulti (uint8_t Reg, uint8_t *data, int size)
{
    uint8_t buf[2];
    buf[0] = Reg | (1<<5);
    // buf[1] = Data;

    /*PULL THE CS PIN LOW TO SELECT THE DEVICE*/
    CS_Select();

    SPI_TRansmit(buf, 1);
    SPI_TRansmit(data, size);
    /*Pull the CS HIGH to relase the device */
    CS_UnSelect();
}

uint8_t nRF24_ReadReg( uint8_t Reg)
{
    uint8_t data = 0;

    /*PULL THE CS PIN LOW TO SELECT THE DEVICE*/
    CS_Select();

    SPI_TRansmit(&Reg, 1);
    SPI_Receive(&data, 1);

    /*Pull the CS HIGH to relase the device */
    CS_UnSelect();

    return data;
}

/*Read multiple bytes form the register*/
uint8_t nRF24_ReadReg_Multi( uint8_t Reg, uint8_t *data, uint8_t size)
{
    /*PULL THE CS PIN LOW TO SELECT THE DEVICE*/
    CS_Select();

    SPI_TRansmit(&Reg, 1);
    SPI_Receive(data, size);

    /*Pull the CS HIGH to relase the device */
    CS_UnSelect();

}

/*Send the command to the nRF*/
void nRF24_Cmd(uint8_t cmd)
{
    /*PULL THE CS PIN LOW TO SELECT THE DEVICE*/
    CS_Select();

    SPI_TRansmit(&cmd, 1);
    /*Pull the CS HIGH to relase the device */
    CS_UnSelect();
}

void nRF24_Init(void)
{
    /*disable the chip before configuring the device */
    CE_Disable();
    CS_UnSelect();

    nRF24_WriteReg(CONFIG, 0); /*will be configured later*/
    
    nRF24_WriteReg(EN_AA, 0); /*NO AUTO ACK*/

    nRF24_WriteReg(EN_RXADDR, 0); /*NOT ENABLING ANY DATA PIPE RIGHT NOW*/

    nRF24_WriteReg(SETUP_AW, 0x03); /*5 Byte for TX/RX address*/

    nRF24_WriteReg(SETUP_RETR, 0); /*No Retransmission*/

    nRF24_WriteReg(RF_CH, 0); /*will be setup during TX or RX*/

    nRF24_WriteReg(RF_SETUP, 0x0E); /*Power = 0dB, data rate = 2Mbps*/

    /*Enable the chip after configuring the device*/
    CE_Enable();
    CS_Select();
}

/*Set up the Tx mode*/
void nRF24_TxMode(uint8_t *Address, uint8_t channel)
{
	uint8_t config;
    CE_Disable();

    nRF24_WriteReg(RF_CH, channel); /*select channel*/

    nRF24_WriteRegMulti(TX_ADDR, Address, 5); /*Write the Tx Address*/

    /*power up the device*/
    config = nRF24_ReadReg(CONFIG);
    config = config | (1<<1);
    nRF24_WriteReg(CONFIG, config);

    /*Enable the chip after configuring the device*/
    CE_Enable();

}

/*transmit the data*/
uint8_t nRF24_Transmit(uint8_t *data)
{
	uint8_t cmdtosend = 0;
	uint8_t fifoStatus;
	CS_Select(); /*select the device*/
  
	cmdtosend = W_TX_PAYLOAD;
	SPI_TRansmit(&cmdtosend, 1);

    /*send the payload*/
    SPI_TRansmit(data, 32);

    CS_UnSelect(); /*Unselect device*/

    delay_ms(1);

    fifoStatus = nRF24_ReadReg(FIFO_STATUS);

    if( (fifoStatus & (1<<4)) && (fifoStatus & (1<<3)))
    {
        cmdtosend = FLUSH_TX;
        nRF24_Cmd(cmdtosend);
        return 1;
    }
    return 0;
}

