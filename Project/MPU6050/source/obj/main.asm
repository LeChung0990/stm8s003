;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Apr  3 2018) (Linux)
; This file was generated Fri Mar 21 15:18:47 2025
;--------------------------------------------------------
	.module main
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _OLED_FONT
	.globl _OLED_INIT_CMD
	.globl _main
	.globl _fabsf
	.globl _uart1_string
	.globl _uart1_number
	.globl _uart_init
	.globl _I2C_write
	.globl _I2C_address
	.globl _I2C_stop
	.globl _I2C_start
	.globl _I2C_init
	.globl _Timer4DelayMs
	.globl _Timer4Config
	.globl _Mode
	.globl _Threshold
	.globl _Steps
	.globl _a
	.globl _SumValue
	.globl _LastSteps
	.globl _Distance
	.globl _Value
	.globl _LastValue
	.globl _CurrentValue
	.globl _AccZMSB
	.globl _AccZLSB
	.globl _AccYMSB
	.globl _AccYLSB
	.globl _AccXMSB
	.globl _AccXLSB
	.globl _AccZ
	.globl _AccY
	.globl _AccX
	.globl _initMPU6050
	.globl _getMPU6050
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_AccX::
	.ds 4
_AccY::
	.ds 4
_AccZ::
	.ds 4
_AccXLSB::
	.ds 2
_AccXMSB::
	.ds 2
_AccYLSB::
	.ds 2
_AccYMSB::
	.ds 2
_AccZLSB::
	.ds 2
_AccZMSB::
	.ds 2
_CurrentValue::
	.ds 4
_LastValue::
	.ds 4
_Value::
	.ds 4
_Distance::
	.ds 4
_LastSteps::
	.ds 1
_SumValue::
	.ds 4
_a::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
_Steps::
	.ds 1
_Threshold::
	.ds 4
_Mode::
	.ds 1
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)
;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME
__interrupt_vect:
	int s_GSINIT ;reset
	int 0x0000 ;trap
	int 0x0000 ;int0
	int 0x0000 ;int1
	int 0x0000 ;int2
	int 0x0000 ;int3
	int 0x0000 ;int4
	int 0x0000 ;int5
	int 0x0000 ;int6
	int 0x0000 ;int7
	int 0x0000 ;int8
	int 0x0000 ;int9
	int 0x0000 ;int10
	int 0x0000 ;int11
	int 0x0000 ;int12
	int 0x0000 ;int13
	int 0x0000 ;int14
	int 0x0000 ;int15
	int 0x0000 ;int16
	int 0x0000 ;int17
	int 0x0000 ;int18
	int 0x0000 ;int19
	int 0x0000 ;int20
	int 0x0000 ;int21
	int 0x0000 ;int22
	int 0x0000 ;int23
	int 0x0000 ;int24
	int 0x0000 ;int25
	int 0x0000 ;int26
	int 0x0000 ;int27
	int 0x0000 ;int28
	int 0x0000 ;int29
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
__sdcc_gs_init_startup:
__sdcc_init_data:
; stm8_genXINIT() start
	ldw x, #l_DATA
	jreq	00002$
00001$:
	clr (s_DATA - 1, x)
	decw x
	jrne	00001$
00002$:
	ldw	x, #l_INITIALIZER
	jreq	00004$
00003$:
	ld	a, (s_INITIALIZER - 1, x)
	ld	(s_INITIALIZED - 1, x), a
	decw	x
	jrne	00003$
00004$:
; stm8_genXINIT() end
	.area GSFINAL
	jp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
__sdcc_program_startup:
	jp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	main.c: 118: void main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	pushw	x
;	main.c: 121: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
	ldw	x, #0x50c6
	ld	a, (x)
	and	a, #0xe7
	ld	(x), a
;	main.c: 122: CLK->CKDIVR |= (uint8_t)0x00;
	ldw	x, #0x50c6
	ld	a, (x)
	ldw	x, #0x50c6
	ld	(x), a
;	main.c: 125: GPIOB->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
	mov	0x5005+0, #0x00
;	main.c: 126: GPIOB->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
	mov	0x5007+0, #0x00
;	main.c: 127: GPIOB->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
	mov	0x5008+0, #0x00
;	main.c: 128: GPIOB->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
	mov	0x5009+0, #0x00
;	main.c: 130: GPIOA->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
	mov	0x5000+0, #0x00
;	main.c: 131: GPIOA->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
	mov	0x5002+0, #0x00
;	main.c: 132: GPIOA->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
	mov	0x5003+0, #0x00
;	main.c: 133: GPIOA->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
	mov	0x5004+0, #0x00
;	main.c: 135: GPIOC->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
	mov	0x500a+0, #0x00
;	main.c: 136: GPIOC->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
	mov	0x500c+0, #0x00
;	main.c: 137: GPIOC->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
	mov	0x500d+0, #0x00
;	main.c: 138: GPIOC->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
	mov	0x500e+0, #0x00
;	main.c: 141: GPIOB->DDR |= (uint8_t)(1 << 4);
	ldw	x, #0x5007
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
;	main.c: 142: GPIOB->ODR |= (uint8_t)(1 << 4);
	ldw	x, #0x5005
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
;	main.c: 143: GPIOB->CR1 &= ~(uint8_t)(1 << 4); /*OPEN DRAIN*/
	ldw	x, #0x5008
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	main.c: 144: GPIOB->CR2 &= ~(uint8_t)(1 << 4); /*Output Speed Up to 2Mhz*/
	ldw	x, #0x5009
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	main.c: 147: GPIOB->DDR |= (uint8_t)(1 << 5);
	ldw	x, #0x5007
	ld	a, (x)
	or	a, #0x20
	ld	(x), a
;	main.c: 148: GPIOB->ODR |= (uint8_t)(1 << 5);
	ldw	x, #0x5005
	ld	a, (x)
	or	a, #0x20
	ld	(x), a
;	main.c: 149: GPIOB->CR1 &= ~(uint8_t)(1 << 5); /*OPEN DRAIN*/
	ldw	x, #0x5008
	ld	a, (x)
	and	a, #0xdf
	ld	(x), a
;	main.c: 150: GPIOB->CR2 &= ~(uint8_t)(1 << 5); /*Output Speed Up to 2Mhz*/
	ldw	x, #0x5009
	ld	a, (x)
	and	a, #0xdf
	ld	(x), a
;	main.c: 153: GPIOA->DDR &= ~(uint8_t)(1 << 3);
	ldw	x, #0x5002
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
;	main.c: 154: GPIOA->IDR |= (uint8_t)(1 << 3);
	ldw	x, #0x5001
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
;	main.c: 155: GPIOA->CR1 |= (uint8_t)(1 << 3);  /*PULL UP*/
	ldw	x, #0x5003
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
;	main.c: 156: GPIOA->CR2 &= ~(uint8_t)(1 << 3); /*External interrupt disabled*/
	ldw	x, #0x5004
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
;	main.c: 159: GPIOC->DDR &= ~(uint8_t)(1 << 3);
	ldw	x, #0x500c
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
;	main.c: 160: GPIOC->IDR |= (uint8_t)(1 << 3);
	ldw	x, #0x500b
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
;	main.c: 161: GPIOC->CR1 |= (uint8_t)(1 << 3);  /*PULL UP*/
	ldw	x, #0x500d
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
;	main.c: 162: GPIOC->CR2 &= ~(uint8_t)(1 << 3); /*External interrupt disabled*/
	ldw	x, #0x500e
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
;	main.c: 165: GPIOC->DDR |= (uint8_t)(1 << 4);
	ldw	x, #0x500c
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
;	main.c: 166: GPIOC->ODR &= ~(uint8_t)(1 << 4);
	ldw	x, #0x500a
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	main.c: 167: GPIOC->CR1 |= (uint8_t)(1 << 4);  /*PULL PUSH*/
	ldw	x, #0x500d
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
;	main.c: 168: GPIOC->CR2 &= ~(uint8_t)(1 << 4); /*Output Speed Up to 2Mhz*/
	ldw	x, #0x500e
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	main.c: 170: uart_init();    //baudrate 57600
	call	_uart_init
;	main.c: 171: Timer4Config();
	call	_Timer4Config
;	main.c: 172: I2C_init();
	call	_I2C_init
;	main.c: 173: Timer4DelayMs(100);
	push	#0x64
	push	#0x00
	call	_Timer4DelayMs
	popw	x
;	main.c: 182: initMPU6050();  //init MPU6050
	call	_initMPU6050
;	main.c: 183: Timer4DelayMs(200);
	push	#0xc8
	push	#0x00
	call	_Timer4DelayMs
	popw	x
;	main.c: 185: while (1)
00102$:
;	main.c: 188: getMPU6050();
	call	_getMPU6050
;	main.c: 189: AccX *= 100.0;
	ldw	x, _AccX+2
	pushw	x
	ldw	x, _AccX+0
	pushw	x
	clrw	x
	pushw	x
	push	#0xc8
	push	#0x42
	call	___fsmul
	addw	sp, #8
	ldw	_AccX+2, x
	ldw	_AccX+0, y
;	main.c: 190: AccY *= 100.0;
	ldw	x, _AccY+2
	pushw	x
	ldw	x, _AccY+0
	pushw	x
	clrw	x
	pushw	x
	push	#0xc8
	push	#0x42
	call	___fsmul
	addw	sp, #8
	ldw	_AccY+2, x
	ldw	_AccY+0, y
;	main.c: 191: AccX = fabsf(AccX);
	ldw	x, _AccX+2
	pushw	x
	ldw	x, _AccX+0
	pushw	x
	call	_fabsf
	addw	sp, #4
	ldw	_AccX+2, x
	ldw	_AccX+0, y
;	main.c: 192: AccY = fabsf(AccY);
	ldw	x, _AccY+2
	pushw	x
	ldw	x, _AccY+0
	pushw	x
	call	_fabsf
	addw	sp, #4
	ldw	_AccY+2, x
	ldw	_AccY+0, y
;	main.c: 194: uart1_string(" Acceleration X [g]*100 =  ");
	ldw	x, #___str_0+0
	pushw	x
	call	_uart1_string
	popw	x
;	main.c: 195: uart1_number((int)AccX);
	ldw	x, _AccX+2
	pushw	x
	ldw	x, _AccX+0
	pushw	x
	call	___fs2sint
	addw	sp, #4
	pushw	x
	call	_uart1_number
	popw	x
;	main.c: 196: uart1_string(" | ");
	ldw	x, #___str_1+0
	ldw	(0x01, sp), x
	ldw	x, (0x01, sp)
	pushw	x
	call	_uart1_string
	popw	x
;	main.c: 197: uart1_string(" Acceleration Y [g]*100 =  ");
	ldw	x, #___str_2+0
	pushw	x
	call	_uart1_string
	popw	x
;	main.c: 198: uart1_number((int)AccY);
	ldw	x, _AccY+2
	pushw	x
	ldw	x, _AccY+0
	pushw	x
	call	___fs2sint
	addw	sp, #4
	pushw	x
	call	_uart1_number
	popw	x
;	main.c: 199: uart1_string(" | ");
	ldw	x, (0x01, sp)
	pushw	x
	call	_uart1_string
	popw	x
;	main.c: 200: uart1_string("                                   ");
	ldw	x, #___str_3+0
	pushw	x
	call	_uart1_string
	popw	x
;	main.c: 201: Timer4DelayMs(500);
	push	#0xf4
	push	#0x01
	call	_Timer4DelayMs
	popw	x
	jp	00102$
	popw	x
	ret
;	main.c: 307: void initMPU6050(void)
;	-----------------------------------------
;	 function initMPU6050
;	-----------------------------------------
_initMPU6050:
;	main.c: 309: I2C_start();	/*Disable SLEEP Mode*/
	call	_I2C_start
;	main.c: 310: I2C_address((uint8_t)0x68 << 1, I2C_DIRECTION_TX);
	push	#0x00
	push	#0xd0
	call	_I2C_address
	popw	x
;	main.c: 311: I2C_write(0x6B);
	push	#0x6b
	call	_I2C_write
	pop	a
;	main.c: 312: I2C_write(0x00);
	push	#0x00
	call	_I2C_write
	pop	a
;	main.c: 313: I2C_stop();
	call	_I2C_stop
;	main.c: 314: Timer4DelayMs(100);
	push	#0x64
	push	#0x00
	call	_Timer4DelayMs
	popw	x
;	main.c: 316: I2C_start();	/*Enable Low Pass Filter*/
	call	_I2C_start
;	main.c: 317: I2C_address((uint8_t)0x68 << 1, I2C_DIRECTION_TX);
	push	#0x00
	push	#0xd0
	call	_I2C_address
	popw	x
;	main.c: 318: I2C_write(0x1A);
	push	#0x1a
	call	_I2C_write
	pop	a
;	main.c: 319: I2C_write(0x05);
	push	#0x05
	call	_I2C_write
	pop	a
;	main.c: 320: I2C_stop();
	call	_I2C_stop
;	main.c: 321: Timer4DelayMs(100);
	push	#0x64
	push	#0x00
	call	_Timer4DelayMs
	popw	x
;	main.c: 323: I2C_start();
	call	_I2C_start
;	main.c: 324: I2C_address((uint8_t)0x68 << 1, I2C_DIRECTION_TX);
	push	#0x00
	push	#0xd0
	call	_I2C_address
	popw	x
;	main.c: 325: I2C_write(0x1B);
	push	#0x1b
	call	_I2C_write
	pop	a
;	main.c: 326: I2C_write(0x00); // 250 do/s
	push	#0x00
	call	_I2C_write
	pop	a
;	main.c: 327: I2C_stop();
	call	_I2C_stop
;	main.c: 328: Timer4DelayMs(100);
	push	#0x64
	push	#0x00
	call	_Timer4DelayMs
	popw	x
;	main.c: 330: I2C_start(); /*Accelerometer Configuration*/
	call	_I2C_start
;	main.c: 331: I2C_address((uint8_t)0x68 << 1, I2C_DIRECTION_TX);
	push	#0x00
	push	#0xd0
	call	_I2C_address
	popw	x
;	main.c: 332: I2C_write(0x1C);
	push	#0x1c
	call	_I2C_write
	pop	a
;	main.c: 333: I2C_write(0x10); //+-8g
	push	#0x10
	call	_I2C_write
	pop	a
;	main.c: 334: I2C_stop();
	jp	_I2C_stop
;	main.c: 336: void getMPU6050(void)
;	-----------------------------------------
;	 function getMPU6050
;	-----------------------------------------
_getMPU6050:
;	main.c: 340: I2C_start();
	call	_I2C_start
;	main.c: 341: I2C_address(I2C_Slave_Address, I2C_DIRECTION_TX);
	push	#0x00
	push	#0xd0
	call	_I2C_address
	popw	x
;	main.c: 342: I2C_write(0x3B);
	push	#0x3b
	call	_I2C_write
	pop	a
;	main.c: 344: I2C->CR2 |= I2C_CR2_START | I2C_CR2_ACK; /* Generate a START condition and Acknowledge Enable */
	ldw	x, #0x5211
	ld	a, (x)
	or	a, #0x05
	ld	(x), a
;	main.c: 345: while ((I2C->SR1 & I2C_SR1_SB) == 0);	/*Check --EV5 */
00101$:
	ldw	x, #0x5217
	ld	a, (x)
	srl	a
	jrnc	00101$
;	main.c: 347: I2C->DR = (uint8_t)(I2C_Slave_Address | (uint8_t)I2C_DIRECTION_RX); /* Send the Address + Direction */
	mov	0x5216+0, #0xd1
;	main.c: 349: I2C->SR1;
	ldw	x, #0x5217
	ld	a, (x)
;	main.c: 350: I2C->SR3;
	ldw	x, #0x5219
	ld	a, (x)
;	main.c: 351: while ((I2C->SR1 & I2C_SR1_ADDR) == 0);
00104$:
	ldw	x, #0x5217
	ld	a, (x)
	bcp	a, #0x02
	jreq	00104$
;	main.c: 352: while ((I2C->SR3 & (uint8_t)0x02) == SET); /*check busy flag */
00107$:
	ldw	x, #0x5219
	ld	a, (x)
	and	a, #0x02
	cp	a, #0x01
	jreq	00107$
;	main.c: 354: while ((I2C->SR1 & I2C_SR1_RXNE) == 0);
00110$:
	ldw	x, #0x5217
	ld	a, (x)
	bcp	a, #0x40
	jreq	00110$
;	main.c: 355: AccXLSB = (uint8_t)I2C->DR;
	ldw	x, #0x5216
	ld	a, (x)
	clrw	x
	ld	xl, a
	ldw	_AccXLSB+0, x
;	main.c: 356: I2C->CR2 |= (uint8_t)(I2C_CR2_ACK); /* Enable the acknowledgement */
	ldw	x, #0x5211
	ld	a, (x)
	or	a, #0x04
	ld	(x), a
;	main.c: 358: while ((I2C->SR1 & I2C_SR1_RXNE) == 0);
00113$:
	ldw	x, #0x5217
	ld	a, (x)
	bcp	a, #0x40
	jreq	00113$
;	main.c: 359: AccXMSB = (uint8_t)I2C->DR;
	ldw	x, #0x5216
	ld	a, (x)
	clrw	x
	ld	xl, a
	ldw	_AccXMSB+0, x
;	main.c: 360: I2C->CR2 |= (uint8_t)(I2C_CR2_ACK); /* Enable the acknowledgement */
	ldw	x, #0x5211
	ld	a, (x)
	or	a, #0x04
	ld	(x), a
;	main.c: 362: while ((I2C->SR1 & I2C_SR1_RXNE) == 0);
00116$:
	ldw	x, #0x5217
	ld	a, (x)
	bcp	a, #0x40
	jreq	00116$
;	main.c: 363: AccYLSB = (uint8_t)I2C->DR;
	ldw	x, #0x5216
	ld	a, (x)
	clrw	x
	ld	xl, a
	ldw	_AccYLSB+0, x
;	main.c: 364: I2C->CR2 |= (uint8_t)(I2C_CR2_ACK); /* Enable the acknowledgement */
	ldw	x, #0x5211
	ld	a, (x)
	or	a, #0x04
	ld	(x), a
;	main.c: 366: while ((I2C->SR1 & I2C_SR1_RXNE) == 0);
00119$:
	ldw	x, #0x5217
	ld	a, (x)
	bcp	a, #0x40
	jreq	00119$
;	main.c: 367: AccYMSB = (uint8_t)I2C->DR;
	ldw	x, #0x5216
	ld	a, (x)
	clrw	x
	ld	xl, a
	ldw	_AccYMSB+0, x
;	main.c: 368: I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK); /* Enable the acknowledgement */
	ldw	x, #0x5211
	ld	a, (x)
	and	a, #0xfb
	ld	(x), a
;	main.c: 370: I2C_stop();
	call	_I2C_stop
;	main.c: 372: AccXLSB = (AccXLSB << 8) | AccXMSB; /*16 bit , 0-65535*/ /*0-1g, 0-9.8m/s^2*/
	ld	a, _AccXLSB+1
	ld	xh, a
	clr	a
	or	a, _AccXMSB+1
	rlwa	x
	or	a, _AccXMSB+0
	ld	xh, a
	ldw	_AccXLSB+0, x
;	main.c: 373: AccYLSB = (AccYLSB << 8) | AccYMSB;
	ld	a, _AccYLSB+1
	ld	xh, a
	clr	a
	or	a, _AccYMSB+1
	rlwa	x
	or	a, _AccYMSB+0
	ld	xh, a
	ldw	_AccYLSB+0, x
;	main.c: 375: AccX = (float)AccXLSB / 4096.0 - 0.04;
	ldw	x, _AccXLSB+0
	pushw	x
	call	___sint2fs
	addw	sp, #2
	push	#0x00
	push	#0x00
	push	#0x80
	push	#0x45
	pushw	x
	pushw	y
	call	___fsdiv
	addw	sp, #8
	push	#0x0a
	push	#0xd7
	push	#0x23
	push	#0x3d
	pushw	x
	pushw	y
	call	___fssub
	addw	sp, #8
	ldw	_AccX+2, x
	ldw	_AccX+0, y
;	main.c: 376: AccY = (float)AccYLSB / 4096.0 + 0.01;
	ldw	x, _AccYLSB+0
	pushw	x
	call	___sint2fs
	addw	sp, #2
	push	#0x00
	push	#0x00
	push	#0x80
	push	#0x45
	pushw	x
	pushw	y
	call	___fsdiv
	addw	sp, #8
	push	#0x0a
	push	#0xd7
	push	#0x23
	push	#0x3c
	pushw	x
	pushw	y
	call	___fsadd
	addw	sp, #8
	ldw	_AccY+2, x
	ldw	_AccY+0, y
	ret
	.area CODE
_OLED_INIT_CMD:
	.db #0xA8	; 168
	.db #0x1F	; 31
	.db #0x22	; 34
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0xDA	; 218
	.db #0x02	; 2
	.db #0x8D	; 141
	.db #0x14	; 20
	.db #0xAF	; 175
	.db #0xA1	; 161
	.db #0xC8	; 200
_OLED_FONT:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2F	; 47
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x7F	; 127
	.db #0x14	; 20
	.db #0x7F	; 127
	.db #0x14	; 20
	.db #0x24	; 36
	.db #0x2A	; 42
	.db #0x7F	; 127
	.db #0x2A	; 42
	.db #0x12	; 18
	.db #0x62	; 98	'b'
	.db #0x64	; 100	'd'
	.db #0x08	; 8
	.db #0x13	; 19
	.db #0x23	; 35
	.db #0x36	; 54	'6'
	.db #0x49	; 73	'I'
	.db #0x55	; 85	'U'
	.db #0x22	; 34
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1C	; 28
	.db #0x22	; 34
	.db #0x41	; 65	'A'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x22	; 34
	.db #0x1C	; 28
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x08	; 8
	.db #0x3E	; 62
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x3E	; 62
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xA0	; 160
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x3E	; 62
	.db #0x51	; 81	'Q'
	.db #0x49	; 73	'I'
	.db #0x45	; 69	'E'
	.db #0x3E	; 62
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x7F	; 127
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x61	; 97	'a'
	.db #0x51	; 81	'Q'
	.db #0x49	; 73	'I'
	.db #0x46	; 70	'F'
	.db #0x21	; 33
	.db #0x41	; 65	'A'
	.db #0x45	; 69	'E'
	.db #0x4B	; 75	'K'
	.db #0x31	; 49	'1'
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x12	; 18
	.db #0x7F	; 127
	.db #0x10	; 16
	.db #0x27	; 39
	.db #0x45	; 69	'E'
	.db #0x45	; 69	'E'
	.db #0x45	; 69	'E'
	.db #0x39	; 57	'9'
	.db #0x3C	; 60
	.db #0x4A	; 74	'J'
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x30	; 48	'0'
	.db #0x01	; 1
	.db #0x71	; 113	'q'
	.db #0x09	; 9
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x36	; 54	'6'
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x36	; 54	'6'
	.db #0x06	; 6
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x29	; 41
	.db #0x1E	; 30
	.db #0x00	; 0
	.db #0x36	; 54	'6'
	.db #0x36	; 54	'6'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x56	; 86	'V'
	.db #0x36	; 54	'6'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x22	; 34
	.db #0x41	; 65	'A'
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x22	; 34
	.db #0x14	; 20
	.db #0x08	; 8
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x51	; 81	'Q'
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x32	; 50	'2'
	.db #0x49	; 73	'I'
	.db #0x59	; 89	'Y'
	.db #0x51	; 81	'Q'
	.db #0x3E	; 62
	.db #0x7C	; 124
	.db #0x12	; 18
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x7C	; 124
	.db #0x7F	; 127
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x36	; 54	'6'
	.db #0x3E	; 62
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x22	; 34
	.db #0x7F	; 127
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x22	; 34
	.db #0x1C	; 28
	.db #0x7F	; 127
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x41	; 65	'A'
	.db #0x7F	; 127
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0x3E	; 62
	.db #0x41	; 65	'A'
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x7A	; 122	'z'
	.db #0x7F	; 127
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x7F	; 127
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x7F	; 127
	.db #0x41	; 65	'A'
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x41	; 65	'A'
	.db #0x3F	; 63
	.db #0x01	; 1
	.db #0x7F	; 127
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x22	; 34
	.db #0x41	; 65	'A'
	.db #0x7F	; 127
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x7F	; 127
	.db #0x02	; 2
	.db #0x0C	; 12
	.db #0x02	; 2
	.db #0x7F	; 127
	.db #0x7F	; 127
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x7F	; 127
	.db #0x3E	; 62
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x3E	; 62
	.db #0x7F	; 127
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x3E	; 62
	.db #0x41	; 65	'A'
	.db #0x51	; 81	'Q'
	.db #0x21	; 33
	.db #0x5E	; 94
	.db #0x7F	; 127
	.db #0x09	; 9
	.db #0x19	; 25
	.db #0x29	; 41
	.db #0x46	; 70	'F'
	.db #0x46	; 70	'F'
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x31	; 49	'1'
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x7F	; 127
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x3F	; 63
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x3F	; 63
	.db #0x1F	; 31
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x1F	; 31
	.db #0x3F	; 63
	.db #0x40	; 64
	.db #0x38	; 56	'8'
	.db #0x40	; 64
	.db #0x3F	; 63
	.db #0x63	; 99	'c'
	.db #0x14	; 20
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x63	; 99	'c'
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x70	; 112	'p'
	.db #0x08	; 8
	.db #0x07	; 7
	.db #0x61	; 97	'a'
	.db #0x51	; 81	'Q'
	.db #0x49	; 73	'I'
	.db #0x45	; 69	'E'
	.db #0x43	; 67	'C'
	.db #0x00	; 0
	.db #0x7F	; 127
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x7F	; 127
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x00	; 0
___str_0:
	.ascii " Acceleration X [g]*100 =  "
	.db 0x00
___str_1:
	.ascii " | "
	.db 0x00
___str_2:
	.ascii " Acceleration Y [g]*100 =  "
	.db 0x00
___str_3:
	.ascii "                                   "
	.db 0x00
	.area INITIALIZER
__xinit__Steps:
	.db #0x00	; 0
__xinit__Threshold:
	.byte #0x40,#0xA0,#0x00,#0x00	;  5.000000e+00
__xinit__Mode:
	.db #0x00	; 0
	.area CABS (ABS)
