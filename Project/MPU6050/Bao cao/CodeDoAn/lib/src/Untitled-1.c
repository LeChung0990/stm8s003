void I2C_init(void){
    I2C_DeInit();
    I2C_Init( 100000,0x68, 
                 I2C_DUTYCYCLE_2 , I2C_ACK_CURR , 
                I2C_ADDMODE_7BIT ,  16 )
}
void I2C_start(void){
    while(I2C_GetFlagStatus(I2C_FLAG_BUSBUSY) ==SET);
    I2C_GenerateSTART(ENABLE);
    while(I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT) == ERROR);
}
void I2C_Re_start(void){
    //while(I2C_GetFlagStatus(I2C_FLAG_BUSBUSY) ==SET);
    I2C_GenerateSTART(ENABLE);
    I2C_AcknowledgeConfig(I2C_ACK_CURR);
    while(I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT) == ERROR);
}
void I2C_stop(void){
    I2C_GenerateSTOP(ENABLE);
}

void I2C_address(uint8_t I2C_ADDR, I2C_Direction_TypeDef Direction){
    I2C_Send7bitAddress(I2C_ADDR, Direction );
     while(I2C_CheckEvent(I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED) == ERROR);

}

void I2C_write(uint8_t data)
{
    I2C_SendData(data);
	/* Write data and test on EV8 and clear it */
     while(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTING)== ERROR);
}

void I2C_Read_MPU6050(uint8_t a){
    uint8_t I2C_Slave_Address = (uint8_t)0x68 << 1; /*MPU6050 Address*/
    I2C_start();
    I2C_address(I2C_Slave_Address, I2C_DIRECTION_TX);
    I2C_write(0x3B);

    I2C_Re_start();
    I2C_address(I2C_Slave_Address, I2C_DIRECTION_RX);
    while(I2C_GetFlagStatus(I2C_FLAG_BUSBUSY) ==SET);

    while(I2C_GetFlagStatus(I2C_FLAG_RXNOTEMPTY) ==RESET);
    AccXLSB  = I2C_ReceiveData();
    I2C_AcknowledgeConfig(I2C_ACK_CURR);

    while(I2C_GetFlagStatus(I2C_FLAG_RXNOTEMPTY) ==RESET);
    AccXMSB  = I2C_ReceiveData();
    I2C_AcknowledgeConfig(I2C_ACK_NONE);    /*NACK*/

    I2C_stop();
    
}
