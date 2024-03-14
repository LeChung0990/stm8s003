#include "nRF24L01.h"

void SPI_Master_Init(SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler, 
    GPIO_TypeDef* CS_PORT,  GPIO_Pin_TypeDef CS_PIN )
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
    GPIO_Init(CS_PORT, (GPIO_Pin_TypeDef) (CS_PIN | GPIO_PIN_3), GPIO_MODE_OUT_PP_HIGH_FAST);
}

void SPI_TRansmit(unsigned char* send_data, unsigned char length){
    for(unsigned int i=0; i < length ; i++)
    {
        SPI_SendData(* (send_data + i));
        while( !SPI_GetFlagStatus(SPI_FLAG_TXE));
    }
}

void SPI_Receive(unsigned char* receive_data, unsigned char length)
{
    if(receive_data != NULL)
    {
        while( !SPI_GetFlagStatus(SPI_FLAG_RXNE));
        *(receive_data + i) = SPI_ReceiveData();
    }
}

// void SPI_Master_Tran_Receive(GPIO_TypeDef* CS_PORT, GPIO_Pin_TypeDef CS_PIN,
//     unsigned char* send_data, unsigned char* receive_data, uint16_t length )
// {
//     /*Wait until the transmitter buffer is empty*/
//     while(!SPI_GetFlagStatus(SPI_FLAG_TXE));
//     /*Empty receive buffer*/
//     if(SPI_GetFlagStatus(SPI_FLAG_RXNE))
//     {
//         unsigned char temp_data = SPI_ReceiveData();
//     }
//     /*Enable communication*/
//     GPIO_WriteLow(CS_PORT,CS_PIN);

//     for(uint16_t i=0; i < length; ++i)
//     {
//         SPI_SendData(* (send_data + i));
//         if(receive_data != NULL)
//         {
//             while( !SPI_GetFlagStatus(SPI_FLAG_RXNE));
//             *(receive_data + i) = SPI_ReceiveData();
//         } else {
//             while( !SPI_GetFlagStatus(SPI_FLAG_TXE));
//         }
//     }
//     /*Disable communication*/
//     GPIO_WriteHigh(CS_PORT, CS_PIN);
// }

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


/* Write a single byte to the particular register*/
void nRF24_WriteReg(unsigned char Reg, unsigned char Data)
{
    unsigned char buf[2];
    buf[0] = Reg | (1<<5);
    buf[1] = Data;
    /*PULL THE CS PIN LOW TO SELECT THE DEVICE*/
    CS_Select();

    SPI_TRansmit(buf, 2);
    /*Pull the CS HIGH to relase the device */
    CS_UnSelect();
}

/*write multiple bytes starting from a particular register*/
void nRF24_WriteRegMulti (unsigned char Reg, unsigned char *data, int size)
{
    unsigned char buf[2];
    buf[0] = Reg | (1<<5);
    // buf[1] = Data;

    /*PULL THE CS PIN LOW TO SELECT THE DEVICE*/
    CS_Select();

    SPI_TRansmit(buf, 1);
    SPI_TRansmit(data, size);
    /*Pull the CS HIGH to relase the device */
    CS_UnSelect();
}

unsigned char nRF24_ReadReg( unsigned char Reg)
{
    unsigned char data = 0;

    /*PULL THE CS PIN LOW TO SELECT THE DEVICE*/
    CS_Select();

    SPI_TRansmit(&Reg, 1);
    SPI_Receive(&data, 1);

    /*Pull the CS HIGH to relase the device */
    CS_UnSelect();

    return data;
}

/*Read multiple bytes form the register*/
unsigned char nRF24_ReadReg_Multi( unsigned char Reg, unsigned char *data, int size)
{
    /*PULL THE CS PIN LOW TO SELECT THE DEVICE*/
    CS_Select();

    SPI_TRansmit(Reg, 1);
    SPI_Receive(data, size);

    /*Pull the CS HIGH to relase the device */
    CS_UnSelect();

}

/*Send the command to the nRF*/
void nRF24_Cmd(unsigned char cmd)
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
void nRF24_TxMode(unsigned char *Address, unsigned char channel)
{
    CE_Disable();

    nRF24_WriteReg(RF_CH, channel); /*select channel*/

    nRF24_WriteRegMulti(TX_ADDR, Address, 5); /*Write the Tx Address*/

    /*power up the device*/
    unsigned char config = nRF24_ReadReg(CONFIG);
    config = config | (1<<1);
    nRF24_WriteReg(CONFIG, config);

    /*Enable the chip after configuring the device*/
    CE_Enable();

}

/*transmit the data*/
unsigned char nRF24_Transmit(unsigned char *data)
{
    unsigned char cmdtosend = 0;
    CS_Select(); /*select the device*/

    cmdtosend = W_TX_PAYLOAD;
    SPI_TRansmit(&cmdtosend, 1);

    /*send the payload*/
    SPI_TRansmit(data, 32);

    CS_UnSelect(); /*Unselect device*/

    delay_ms(1);

    unsigned char fifoStatus = nRF24_ReadReg(FIFO_STATUS);

    if( (fifoStatus & (1<<4)) && (fifoStatus & (1<<3)))
    {
        cmdtosend = FLUSH_TX;
        nRF24_Cmd(cmdtosend);
        return 1;
    }
    return 0;
}

void nRF24_RxMode (unsigned char *Address, unsigned char channel)
{
	CE_Disable();

    nRF24_WriteReg(RF_CH, channel); /*select channel*/
	
	//select data pipe 1
	uint8_t en_rxaddr = nRF24_ReadReg(EN_RXADDR);
	en_rxaddr = en_rxaddr | (1<<1);
	nRF24_WriteReg(EN_RXADDR, en_rxaddr); 
	
    nRF24_WriteRegMulti(RX_ADDR_P1, Address, 5); /*Write the Tx Address*/

    /*power up the device*/
    unsigned char config = nRF24_ReadReg(CONFIG);
    config = config | (1<<1);
    nRF24_WriteReg(CONFIG, config);

    /*Enable the chip after configuring the device*/
    CE_Enable();
}
