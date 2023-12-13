#include "stm8s.h"
#include "stdio.h"
#include "stdint.h"
#include "lib.h"
// #include "math.h"

#define LED_PORT    GPIOD
#define LED_PIN     (1<<3)
#define BUT_PORT    GPIOD
#define BUT_PIN     (1<<4)
// uint32_t clk=0;

// float AccX, AccY, AccZ;
// float AccX_Kalman, AccY_Kalman, AccZ_Kalman;
// int16_t AccXLSB, AccXMSB, AccYLSB, AccYMSB, AccZLSB, AccZMSB;
// float AngleRoll, AnglePitch;
// float Sensor;

/*==========================================================
-----------------OLED LCD SSD1306------------
=============================================================*/
#define OLED_I2C_ADDR	0x78
#define OLED_CMD_MODE   0x00	// set command mode
#define OLED_DAT_MODE   0x40    // set data mode

const uint8_t OLED_INIT_CMD[] = {
	0xA8, 0x1F,       // set multiplex (HEIGHT-1): 0x1F for 128x32, 0x3F for 128x64
	0x22, 0x00, 0x03, // set min and max page
	0x20, 0x00,       // set horizontal memory addressing mode
	0xDA, 0x02,       // set COM pins hardware configuration to sequential
	0x8D, 0x14,       // enable charge pump
	0xAF,             // switch on OLED
	0xA1, 0xC8        // flip the screen
};
const uint8_t OLED_FONT[]= {
	0x00, 0x00, 0x00, 0x00, 0x00, //   0
	0x00, 0x00, 0x2f, 0x00, 0x00, // ! 1
	0x00, 0x07, 0x00, 0x07, 0x00, // " 2
	0x14, 0x7f, 0x14, 0x7f, 0x14, // # 3
	0x24, 0x2a, 0x7f, 0x2a, 0x12, // $ 4
	0x62, 0x64, 0x08, 0x13, 0x23, // % 5
	0x36, 0x49, 0x55, 0x22, 0x50, // & 6
	0x00, 0x05, 0x03, 0x00, 0x00, // ' 7
	0x00, 0x1c, 0x22, 0x41, 0x00, // ( 8
	0x00, 0x41, 0x22, 0x1c, 0x00, // ) 9
	0x14, 0x08, 0x3E, 0x08, 0x14, // * 10
	0x08, 0x08, 0x3E, 0x08, 0x08, // + 11
	0x00, 0x00, 0xA0, 0x60, 0x00, // , 12
	0x08, 0x08, 0x08, 0x08, 0x08, // - 13
	0x00, 0x60, 0x60, 0x00, 0x00, // . 14
	0x20, 0x10, 0x08, 0x04, 0x02, // / 15
	0x3E, 0x51, 0x49, 0x45, 0x3E, // 0 16
	0x00, 0x42, 0x7F, 0x40, 0x00, // 1 17
	0x42, 0x61, 0x51, 0x49, 0x46, // 2 18
	0x21, 0x41, 0x45, 0x4B, 0x31, // 3 19
	0x18, 0x14, 0x12, 0x7F, 0x10, // 4 20
	0x27, 0x45, 0x45, 0x45, 0x39, // 5 21
	0x3C, 0x4A, 0x49, 0x49, 0x30, // 6 22
	0x01, 0x71, 0x09, 0x05, 0x03, // 7 23
	0x36, 0x49, 0x49, 0x49, 0x36, // 8 24
	0x06, 0x49, 0x49, 0x29, 0x1E, // 9 25
	0x00, 0x36, 0x36, 0x00, 0x00, // : 26
	0x00, 0x56, 0x36, 0x00, 0x00, // ; 27
	0x08, 0x14, 0x22, 0x41, 0x00, // < 28
	0x14, 0x14, 0x14, 0x14, 0x14, // = 29
	0x00, 0x41, 0x22, 0x14, 0x08, // > 30
	0x02, 0x01, 0x51, 0x09, 0x06, // ? 31
	0x32, 0x49, 0x59, 0x51, 0x3E, // @ 32
	0x7C, 0x12, 0x11, 0x12, 0x7C, // A 33
	0x7F, 0x49, 0x49, 0x49, 0x36, // B 34
	0x3E, 0x41, 0x41, 0x41, 0x22, // C 35
	0x7F, 0x41, 0x41, 0x22, 0x1C, // D 36
	0x7F, 0x49, 0x49, 0x49, 0x41, // E 37
	0x7F, 0x09, 0x09, 0x09, 0x01, // F 38
	0x3E, 0x41, 0x49, 0x49, 0x7A, // G 39
	0x7F, 0x08, 0x08, 0x08, 0x7F, // H 40
	0x00, 0x41, 0x7F, 0x41, 0x00, // I 41
	0x20, 0x40, 0x41, 0x3F, 0x01, // J 42
	0x7F, 0x08, 0x14, 0x22, 0x41, // K 43
	0x7F, 0x40, 0x40, 0x40, 0x40, // L 44
	0x7F, 0x02, 0x0C, 0x02, 0x7F, // M 45
	0x7F, 0x04, 0x08, 0x10, 0x7F, // N 46
	0x3E, 0x41, 0x41, 0x41, 0x3E, // O 47
	0x7F, 0x09, 0x09, 0x09, 0x06, // P 48
	0x3E, 0x41, 0x51, 0x21, 0x5E, // Q 49
	0x7F, 0x09, 0x19, 0x29, 0x46, // R 50
	0x46, 0x49, 0x49, 0x49, 0x31, // S 51
	0x01, 0x01, 0x7F, 0x01, 0x01, // T 52
	0x3F, 0x40, 0x40, 0x40, 0x3F, // U 53
	0x1F, 0x20, 0x40, 0x20, 0x1F, // V 54
	0x3F, 0x40, 0x38, 0x40, 0x3F, // W 55
	0x63, 0x14, 0x08, 0x14, 0x63, // X 56
	0x07, 0x08, 0x70, 0x08, 0x07, // Y 57
	0x61, 0x51, 0x49, 0x45, 0x43, // Z 58
	0x00, 0x7F, 0x41, 0x41, 0x00, // [ 59
	0x02, 0x04, 0x08, 0x10, 0x20, // \ 60
	0x00, 0x41, 0x41, 0x7F, 0x00, // ] 61
	0x04, 0x02, 0x01, 0x02, 0x04, // ^ 62
	0x40, 0x40, 0x40, 0x40, 0x40,  // _ 63
	0x00, 0x60, 0x60, 0x00, 0x00 // . 64
};

void OLED_init(void);
void OLED_printP(const char *p);
void OLED_printNum(uint16_t num);
void OLED_printOneNumber(uint8_t num);
void OLED_printNumber(float ch);
void OLED_printFloat(float num);
void OLED_cursor(uint8_t xpos, uint8_t ypos);
void OLED_clear(void);
// void initMPU6050(void);
// void getMPU6050(void);

// float _err_measure;
// float _err_estimate;
// float _q;
// float _current_estimate = 0;
// float _last_estimate = 0;
// float _kalman_gain = 0;

// void SimpleKalmanFilter(float mea_e, float est_e, float q)
// {
//   _err_measure=mea_e;
//   _err_estimate=est_e;
//   _q = q;
// }

// float updateEstimate(float mea)
// {
//   _kalman_gain = _err_estimate/(_err_estimate + _err_measure);
//   _current_estimate = _last_estimate + _kalman_gain * (mea - _last_estimate);
//   _err_estimate =  (1.0f - _kalman_gain)*_err_estimate + fabsf(_last_estimate-_current_estimate)*_q;
//   _last_estimate=_current_estimate;

//   return _current_estimate;
// }


/*==========================================================
-----------------MAIN FUNCTION------------
=============================================================*/
// float vectorprevious;

// float vector;

// float totalvector;

// int Steps = 0;
const char Message1[] = "DO AN";
const char Message2[] = "SO BUOC=";
void Write_EEPROM(uint32_t Address, uint8_t Data){
	// FLASH_Unlock(FLASH_MEMTYPE_DATA);
	if( (FLASH->IAPSR &= (uint8_t)FLASH_IAPSR_DUL)== RESET){
		FLASH->DUKR = 0xAE; /* Warning: keys are reversed on data memory !!! */
		FLASH->DUKR = 0x56;
	}

	// FLASH_ProgramByte(0x4000, Data);
	*(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
	// FLASH_Lock(FLASH_MEMTYPE_DATA);
	  /* Lock memory */
  FLASH->IAPSR &= (uint8_t)0xF7;
}
uint8_t Read_EEPROM(uint32_t Address){
	uint8_t Data;
	// Data = FLASH_ReadByte(Address);
	// 	if( (FLASH->IAPSR &= (uint8_t)FLASH_IAPSR_DUL)== RESET){
	// 	FLASH->DUKR = 0xAE; /* Warning: keys are reversed on data memory !!! */
	// 	FLASH->DUKR = 0x56;
	// }
	Data = (*(PointerAttr uint8_t *) (MemoryAddressCast)Address);
		  /* Lock memory */
//   FLASH->IAPSR &= (uint8_t)0xF7;
	return Data;
}
uint8_t Data;
uint8_t Flag;
void main (void)
{
    /*Using HSI clock 16Mhz*/
    CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
    CLK->CKDIVR |= (uint8_t)0x00;

	GPIOB->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
	GPIOB->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
	GPIOB->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
	GPIOB->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */

	GPIOD->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
	GPIOD->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
	GPIOD->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
	GPIOD->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */

	/*Pin B4 SCL*/
	GPIOB->DDR |= (uint8_t)(1<<4);
	GPIOB->ODR |= (uint8_t)(1<<4);
	GPIOB->CR1 &= ~(uint8_t)(1<<4);		/*OPEN DRAIN*/
	GPIOB->CR2 &= ~(uint8_t)(1<<4);		/*Output Speed Up to 2Mhz*/

	/*Pin B5 SDA*/
	GPIOB->DDR |= (uint8_t)(1<<5);
	GPIOB->ODR |= (uint8_t)(1<<5);
	GPIOB->CR1 &= ~(uint8_t)(1<<5);		/*OPEN DRAIN*/
	GPIOB->CR2 &= ~(uint8_t)(1<<5);		/*Output Speed Up to 2Mhz*/

	/*PD3 INPUT BUTTON*/
	GPIOD->DDR &= ~(uint8_t)(1<<3);
	GPIOD->IDR |= (uint8_t)(1<<3);
	GPIOD->CR1 |= (uint8_t)(1<<3);		/*PULL UP*/
	GPIOD->CR2 &= ~(uint8_t)(1<<3);		/*DISABLE INTERRUPT*/

	Timer4Config();
    I2C_init();
	OLED_init();
	OLED_cursor(0,0);
	OLED_printP(Message1);
	Timer4DelayMs(2000);
	OLED_clear();

	// Write_EEPROM(82);

	
    while (1)
    {
		
		if( (GPIOD->IDR & (1<<3)) == RESET){
			OLED_cursor(10,0);
			OLED_printP("GHI");
			Write_EEPROM(82);
		}

		Data = Read_EEPROM(0x4000);
		OLED_cursor(0,2);
		OLED_printNum(Data);
		// Timer4DelayMs(3000);
		// OLED_cursor(64,1);
		// OLED_printP("TEST");
		// Timer4DelayMs(3000);
		// OLED_clear();
    }
}

void OLED_init(void) {
	I2C_start();
	I2C_address(OLED_I2C_ADDR, I2C_DIRECTION_TX);
	I2C_write(OLED_CMD_MODE);
	for (uint8_t i = 0;i < 12;i++)
	{
		I2C_write(OLED_INIT_CMD[i]);
	}
	I2C_stop();
}
void OLED_printP(const char *p)
{
	I2C_start();
	I2C_address(OLED_I2C_ADDR,I2C_DIRECTION_TX);
	I2C_write(OLED_DAT_MODE);
	while (*p)
	{
		uint16_t offset = *p - 32;
		offset += offset << 2;
		I2C_write(0x00);
		for(uint8_t i = 5; i;i--){ I2C_write(OLED_FONT[offset++]); }
		p++;
	}
	I2C_stop();
}
void OLED_printNum(uint16_t num){
	uint8_t mang[] = {0,0,0,0,0};
	uint8_t count = 0;
	while(num != 0){
		mang[count] = num%10;
		num = num /10;
		++count;
	}
	I2C_start();
	I2C_address(OLED_I2C_ADDR,I2C_DIRECTION_TX);
	I2C_write(OLED_DAT_MODE);
	while(count != 0){
		uint16_t offset = mang[count-1] + 16;
		offset += offset << 2;
		I2C_write(0x00);
		for(uint8_t i = 5; i;i--){ I2C_write(OLED_FONT[offset++]); }
		--count;
	}
	I2C_stop();		
}
void OLED_printFloat(float num){
	uint16_t num2 = num * 100;
	uint8_t mang[] = {0,0,0,0,0};
	uint8_t count = 0;
	while(count<5){
		mang[count] = (uint8_t)num2%10;
		num2 = num2 /10;
		++count;
		if(count==2) {mang[2]= 48; ++count;}
	}
	I2C_start();
	I2C_address(OLED_I2C_ADDR,I2C_DIRECTION_TX);
	I2C_write(OLED_DAT_MODE);
	while(count != 0){
		uint16_t offset = mang[count-1] + 16;
		offset += offset << 2;
		I2C_write(0x00);
		for(uint8_t i = 5; i;i--){ I2C_write(OLED_FONT[offset++]); }
		--count;
	}
	I2C_stop();		

}
void OLED_printOneNumber(uint8_t num)
{
	uint16_t offset = num + 16;
	offset += offset << 2;
	I2C_start();
	I2C_address(OLED_I2C_ADDR, OLED_DAT_MODE);
	I2C_write(0x00);
	for(uint8_t i = 5; i;i--){ I2C_write(OLED_FONT[offset++]); }
	I2C_stop();
}
void OLED_cursor(uint8_t xpos, uint8_t ypos)
{
	I2C_start();
	I2C_address(OLED_I2C_ADDR, I2C_DIRECTION_TX);
	I2C_write(OLED_CMD_MODE);
	I2C_write(xpos & 0x0F);
	I2C_write(0x10 | (xpos >> 4));
	I2C_write(0xB0 | (ypos & 0x07));
	I2C_stop();
}
void OLED_clear(void)
{
	OLED_cursor(0,0);
	I2C_start();
	I2C_address(OLED_I2C_ADDR, I2C_DIRECTION_TX);
	I2C_write(OLED_DAT_MODE);
	for (uint16_t i=0;i<512;i++)
	{
		I2C_write(0x00);
	}
	I2C_stop();
}

// void initMPU6050(void){
// 	I2C_start();
// 	I2C_address((uint8_t)0x68<<1, I2C_DIRECTION_TX);
// 	I2C_write(0x6B);
// 	I2C_write(0x00);
// 	I2C_stop();
// 	delay_nop_ms(100);
	
// 	I2C_start();
// 	I2C_address ((uint8_t)0x68<<1, I2C_DIRECTION_TX);
// 	I2C_write(0x1A);
// 	I2C_write(0x05);
// 	I2C_stop();
// 	delay_nop_ms(100);

// 	I2C_start();
// 	I2C_address ((uint8_t)0x68<<1, I2C_DIRECTION_TX);
// 	I2C_write(0x1B);
// 	I2C_write(0x00); //250 do/s
// 	I2C_stop();
// 	delay_nop_ms(100);
	
// 	I2C_start();
// 	I2C_address ((uint8_t)0x68<<1, I2C_DIRECTION_TX);
// 	I2C_write(0x1C); 
// 	I2C_write(0x10); //
// 	I2C_stop();
	
// }
// void getMPU6050(void){

// 	uint8_t I2C_Slave_Address = (uint8_t)0x68<<1;	/*MPU6050 Address*/
// 	I2C_start();
// 	I2C_address(I2C_Slave_Address, I2C_DIRECTION_TX);
// 	I2C_write(0x3B);

// 	I2C->CR2 |= I2C_CR2_START| I2C_CR2_ACK;	/* Generate a START condition and Acknowledge Enable */
// 	while((I2C->SR1 & I2C_SR1_SB) == 0);	/*Check --EV5 */
// 	I2C_Slave_Address &= (uint8_t)0xFE; 	/* Clear bit0 (direction) just in case */
// 	I2C->DR = (uint8_t)(I2C_Slave_Address | (uint8_t)I2C_DIRECTION_RX); /* Send the Address + Direction */ 

// 	I2C->SR1;	I2C->SR3;
// 	while((I2C->SR1 & I2C_SR1_ADDR)==0);
// 	while((I2C->SR3 & (uint8_t)0x02)==SET);	/*check busy flag */

// 	while((I2C->SR1 & I2C_SR1_RXNE)==0);
// 	 AccXLSB = (uint8_t)I2C->DR; 
// 	I2C->CR2 |= (uint8_t)(I2C_CR2_ACK);		/* Enable the acknowledgement */

// 	while((I2C->SR1 & I2C_SR1_RXNE)==0);
// 		AccXMSB = (uint8_t)I2C->DR; 
// 	I2C->CR2 |= (uint8_t)(I2C_CR2_ACK);		/* Enable the acknowledgement */
	
// 	while((I2C->SR1 & I2C_SR1_RXNE)==0);
// 	 AccYLSB = (uint8_t)I2C->DR; 
// 	I2C->CR2 |= (uint8_t)(I2C_CR2_ACK);		/* Enable the acknowledgement */
	
// 	while((I2C->SR1 & I2C_SR1_RXNE)==0);
// 		AccYMSB = (uint8_t)I2C->DR; 
// 	I2C->CR2 |= (uint8_t)(I2C_CR2_ACK);		/* Enable the acknowledgement */
	
// 	while((I2C->SR1 & I2C_SR1_RXNE)==0);
// 	 AccZLSB = (uint8_t)I2C->DR; 
// 	I2C->CR2 |= (uint8_t)(I2C_CR2_ACK);		/* Enable the acknowledgement */
	
// 	while((I2C->SR1 & I2C_SR1_RXNE)==0);
// 		AccZMSB |= (uint8_t)I2C->DR; 
// 	I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);	/* Disable the acknowledgement */
	
// 	I2C_stop();
	
// 	AccXLSB = (AccXLSB << 8)|AccXMSB;
// 	AccYLSB = (AccYLSB << 8)|AccYMSB;
// 	AccZLSB = (AccZLSB << 8)|AccZMSB;

// 	AccX_Kalman = updateEstimate((float)AccXLSB);
// 	AccY_Kalman = updateEstimate((float)AccYLSB);
// 	AccZ_Kalman = updateEstimate((float)AccZLSB);

// 	AccX = (float) AccX_Kalman/4096.0 - 0.04;
// 	AccY = (float) AccY_Kalman/4096.0 + 0.01;
// 	AccZ = (float) AccZ_Kalman/4096.0 - 0.02;

	
// 	// Sensor = sqrtf( (AccX*AccX) + (AccY*AccY) + (AccZ*AccZ) );
// 	// AngleRoll = atanf(AccY/sqrtf(AccX*AccX + AccZ*AccZ))*1/(3.142/180);
// 	// AnglePitch = atanf(AccX/sqrtf(AccY*AccY + AccZ*AccZ))*1/(3.142/180);
// }

