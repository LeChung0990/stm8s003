;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.0 #14184 (MINGW64)
;--------------------------------------------------------
	.module stm8s_mylib
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _clock_icon
	.globl _station_icon
	.globl _rssi
	.globl _levelBAT_Tb
	.globl _levelBAT_full
	.globl _mixigamingLogo
	.globl _lacoVietNam
	.globl _Tim4_config
	.globl _configADC
	.globl _delay_us
	.globl _delay_ms
	.globl _BEEP_config
	.globl _BEEP_Cmd
	.globl _i2c_init
	.globl _i2c_start
	.globl _i2c_stop
	.globl _i2c_write
	.globl _i2c_read
	.globl _data_write
	.globl _data_read
	.globl _decimal_to_bcd
	.globl _writeTime
	.globl _writeDay
	.globl _Write_EEPROM
	.globl _Read_EEPROM
	.globl _SD1106_sendCom
	.globl _SD1106_sendInitCom
	.globl _SD1106_clear
	.globl _SD1106_CUS_PRINT
	.globl _print_levelBAT
	.globl _print_rssi
	.globl _station_chanel
	.globl _clock_icon_ds
	.globl _SD1106_setContranst
	.globl _SD1106_resetDis
	.globl _SD1106_flipScreen
	.globl _SD1106_printP
	.globl _SD1106_print_one_num
	.globl _SD1106_printNum
	.globl _SD1106_printBigNum
	.globl _SD1106_printBigPoint
	.globl _SD1106_printBigLine
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)

; default segment ordering for linker
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area CONST
	.area INITIALIZER
	.area CODE

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	lib/src/stm8s_mylib.c: 207: void Tim4_config(void){
;	-----------------------------------------
;	 function Tim4_config
;	-----------------------------------------
_Tim4_config:
;	lib/src/stm8s_mylib.c: 208: TIM4->PSCR = (uint8_t)TIM4_PRESCALER_128;
	mov	0x5347+0, #0x07
;	lib/src/stm8s_mylib.c: 209: TIM4->ARR = (uint8_t)125 - 1;
	mov	0x5348+0, #0x7c
;	lib/src/stm8s_mylib.c: 212: TIM4->IER |= (uint8_t)TIM4_IT_UPDATE;
	bset	0x5343, #0
;	lib/src/stm8s_mylib.c: 215: TIM4->SR1 = (uint8_t)(~TIM4_FLAG_UPDATE);
	mov	0x5344+0, #0xfe
;	lib/src/stm8s_mylib.c: 218: TIM4->CR1 |= TIM4_CR1_CEN;
	ld	a, 0x5340
	or	a, #0x01
	ld	0x5340, a
;	lib/src/stm8s_mylib.c: 220: enableInterrupts(); 
	rim
;	lib/src/stm8s_mylib.c: 221: }
	ret
;	lib/src/stm8s_mylib.c: 222: void configADC(void){
;	-----------------------------------------
;	 function configADC
;	-----------------------------------------
_configADC:
;	lib/src/stm8s_mylib.c: 223: ADC1->CSR  = ADC1_CSR_RESET_VALUE;
	mov	0x5400+0, #0x00
;	lib/src/stm8s_mylib.c: 224: ADC1->CR1  = ADC1_CR1_RESET_VALUE;
	mov	0x5401+0, #0x00
;	lib/src/stm8s_mylib.c: 225: ADC1->CR2  = ADC1_CR2_RESET_VALUE;
	mov	0x5402+0, #0x00
;	lib/src/stm8s_mylib.c: 226: ADC1->CR3  = ADC1_CR3_RESET_VALUE;
	mov	0x5403+0, #0x00
;	lib/src/stm8s_mylib.c: 227: ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
	mov	0x5406+0, #0x00
;	lib/src/stm8s_mylib.c: 228: ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
	mov	0x5407+0, #0x00
;	lib/src/stm8s_mylib.c: 229: ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
	mov	0x5408+0, #0xff
;	lib/src/stm8s_mylib.c: 230: ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
	mov	0x5409+0, #0x03
;	lib/src/stm8s_mylib.c: 231: ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
	mov	0x540a+0, #0x00
;	lib/src/stm8s_mylib.c: 232: ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
	mov	0x540b+0, #0x00
;	lib/src/stm8s_mylib.c: 233: ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
	mov	0x540e+0, #0x00
;	lib/src/stm8s_mylib.c: 234: ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
	mov	0x540f+0, #0x00
;	lib/src/stm8s_mylib.c: 236: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
	bres	0x5402, #3
;	lib/src/stm8s_mylib.c: 238: ADC1->CR2 |= (uint8_t)(ADC1_ALIGN_RIGHT);
	bset	0x5402, #3
;	lib/src/stm8s_mylib.c: 240: ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
	bres	0x5401, #1
;	lib/src/stm8s_mylib.c: 243: ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
	ld	a, 0x5400
	and	a, #0xf0
	ld	0x5400, a
;	lib/src/stm8s_mylib.c: 245: ADC1->CSR |= (uint8_t)(ADC1_CHANNEL_4);
	bset	0x5400, #2
;	lib/src/stm8s_mylib.c: 248: ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
	ld	a, 0x5401
	and	a, #0x8f
	ld	0x5401, a
;	lib/src/stm8s_mylib.c: 250: ADC1->CR1 |= (uint8_t)(ADC1_PRESSEL_FCPU_D18);
	ld	a, 0x5401
	or	a, #0x70
	ld	0x5401, a
;	lib/src/stm8s_mylib.c: 254: ADC1->CSR |= (uint8_t)ADC1_IT_EOCIE;
	bset	0x5400, #5
;	lib/src/stm8s_mylib.c: 257: ADC1->CR1 |=  ADC1_CR1_ADON;
	bset	0x5401, #0
;	lib/src/stm8s_mylib.c: 258: }
	ret
;	lib/src/stm8s_mylib.c: 259: void delay_us(unsigned long int  us) {
;	-----------------------------------------
;	 function delay_us
;	-----------------------------------------
_delay_us:
;	lib/src/stm8s_mylib.c: 260: for(;us > 0; us--) nop();
	ldw	x, (0x05, sp)
	ldw	y, (0x03, sp)
00103$:
	tnzw	x
	jrne	00120$
	tnzw	y
	jreq	00105$
00120$:
	nop
	subw	x, #0x0001
	jrnc	00103$
	decw	y
	jra	00103$
00105$:
;	lib/src/stm8s_mylib.c: 261: }
	ldw	x, (1, sp)
	addw	sp, #6
	jp	(x)
;	lib/src/stm8s_mylib.c: 262: void delay_ms(unsigned int  u16Delay)
;	-----------------------------------------
;	 function delay_ms
;	-----------------------------------------
_delay_ms:
00103$:
;	lib/src/stm8s_mylib.c: 264: for(; u16Delay > 0; u16Delay--) delay_us(1000);
	tnzw	x
	jrne	00120$
	ret
00120$:
	pushw	x
	push	#0xe8
	push	#0x03
	push	#0x00
	push	#0x00
	call	_delay_us
	popw	x
	decw	x
	jra	00103$
;	lib/src/stm8s_mylib.c: 265: }
	ret
;	lib/src/stm8s_mylib.c: 266: void BEEP_config(void){
;	-----------------------------------------
;	 function BEEP_config
;	-----------------------------------------
_BEEP_config:
;	lib/src/stm8s_mylib.c: 268: BEEP->CSR = BEEP_CSR_RESET_VALUE;
	mov	0x50f3+0, #0x1f
;	lib/src/stm8s_mylib.c: 270: if ((BEEP->CSR & BEEP_CSR_BEEPDIV) == BEEP_CSR_BEEPDIV)
	ld	a, 0x50f3
	cpl	a
	bcp	a, #0x1f
	jrne	00102$
;	lib/src/stm8s_mylib.c: 272: BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
	ld	a, 0x50f3
	and	a, #0xe0
	ld	0x50f3, a
;	lib/src/stm8s_mylib.c: 273: BEEP->CSR |= 0x0B; /*!< Default value when calibration is not done */
	ld	a, 0x50f3
	or	a, #0x0b
	ld	0x50f3, a
00102$:
;	lib/src/stm8s_mylib.c: 276: BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPSEL);
	ld	a, 0x50f3
	and	a, #0x3f
	ld	0x50f3, a
;	lib/src/stm8s_mylib.c: 277: BEEP->CSR |= (uint8_t)(0x80); /*!< Beep signal output frequency equals to 4 KHz */
	bset	0x50f3, #7
;	lib/src/stm8s_mylib.c: 283: BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPEN);
	bres	0x50f3, #5
;	lib/src/stm8s_mylib.c: 284: }
	ret
;	lib/src/stm8s_mylib.c: 285: void BEEP_Cmd(FunctionalState NewState)
;	-----------------------------------------
;	 function BEEP_Cmd
;	-----------------------------------------
_BEEP_Cmd:
	push	a
	ld	(0x01, sp), a
;	lib/src/stm8s_mylib.c: 290: BEEP->CSR |= BEEP_CSR_BEEPEN;
	ld	a, 0x50f3
;	lib/src/stm8s_mylib.c: 287: if (NewState != DISABLE)
	tnz	(0x01, sp)
	jreq	00102$
;	lib/src/stm8s_mylib.c: 290: BEEP->CSR |= BEEP_CSR_BEEPEN;
	or	a, #0x20
	ld	0x50f3, a
	jra	00104$
00102$:
;	lib/src/stm8s_mylib.c: 295: BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPEN);
	and	a, #0xdf
	ld	0x50f3, a
00104$:
;	lib/src/stm8s_mylib.c: 297: }
	pop	a
	ret
;	lib/src/stm8s_mylib.c: 298: void i2c_init(void)
;	-----------------------------------------
;	 function i2c_init
;	-----------------------------------------
_i2c_init:
;	lib/src/stm8s_mylib.c: 304: SDA_1;
	bset	0x5005, #5
;	lib/src/stm8s_mylib.c: 305: SCL_1;
	bset	0x5005, #4
;	lib/src/stm8s_mylib.c: 306: }
	ret
;	lib/src/stm8s_mylib.c: 307: void i2c_start(void)
;	-----------------------------------------
;	 function i2c_start
;	-----------------------------------------
_i2c_start:
;	lib/src/stm8s_mylib.c: 316: SCL_1;
	bset	0x5005, #4
;	lib/src/stm8s_mylib.c: 317: DELAYI2C;
	push	#0x03
	clrw	x
	pushw	x
	push	#0x00
	call	_delay_us
;	lib/src/stm8s_mylib.c: 318: SDA_1;
	bset	0x5005, #5
;	lib/src/stm8s_mylib.c: 319: DELAYI2C;
	push	#0x03
	clrw	x
	pushw	x
	push	#0x00
	call	_delay_us
;	lib/src/stm8s_mylib.c: 320: SDA_0;
	bres	0x5005, #5
;	lib/src/stm8s_mylib.c: 321: DELAYI2C;
	push	#0x03
	clrw	x
	pushw	x
	push	#0x00
	call	_delay_us
;	lib/src/stm8s_mylib.c: 322: SCL_0;
	bres	0x5005, #4
;	lib/src/stm8s_mylib.c: 323: DELAYI2C;
	push	#0x03
	clrw	x
	pushw	x
	push	#0x00
	call	_delay_us
;	lib/src/stm8s_mylib.c: 325: }
	ret
;	lib/src/stm8s_mylib.c: 326: void i2c_stop(void)
;	-----------------------------------------
;	 function i2c_stop
;	-----------------------------------------
_i2c_stop:
;	lib/src/stm8s_mylib.c: 330: SDA_0;
	bres	0x5005, #5
;	lib/src/stm8s_mylib.c: 331: DELAYI2C;
	push	#0x03
	clrw	x
	pushw	x
	push	#0x00
	call	_delay_us
;	lib/src/stm8s_mylib.c: 332: SCL_1;
	bset	0x5005, #4
;	lib/src/stm8s_mylib.c: 333: DELAYI2C;
	push	#0x03
	clrw	x
	pushw	x
	push	#0x00
	call	_delay_us
;	lib/src/stm8s_mylib.c: 334: SDA_1;
	bset	0x5005, #5
;	lib/src/stm8s_mylib.c: 335: DELAYI2C;
	push	#0x03
	clrw	x
	pushw	x
	push	#0x00
	call	_delay_us
;	lib/src/stm8s_mylib.c: 336: }
	ret
;	lib/src/stm8s_mylib.c: 337: uint8_t i2c_write(uint8_t u8Data)
;	-----------------------------------------
;	 function i2c_write
;	-----------------------------------------
_i2c_write:
	sub	sp, #2
	ld	(0x01, sp), a
;	lib/src/stm8s_mylib.c: 345: for (i = 0; i < 8; ++i) {
	clr	(0x02, sp)
00108$:
;	lib/src/stm8s_mylib.c: 347: SDA_1;
	ld	a, 0x5005
;	lib/src/stm8s_mylib.c: 346: if (u8Data & 0x80) {
	tnz	(0x01, sp)
	jrpl	00102$
;	lib/src/stm8s_mylib.c: 347: SDA_1;
	or	a, #0x20
	ld	0x5005, a
	jra	00103$
00102$:
;	lib/src/stm8s_mylib.c: 349: SDA_0;
	and	a, #0xdf
	ld	0x5005, a
00103$:
;	lib/src/stm8s_mylib.c: 351: DELAYI2C;
	push	#0x03
	clrw	x
	pushw	x
	push	#0x00
	call	_delay_us
;	lib/src/stm8s_mylib.c: 352: SCL_1;
	bset	0x5005, #4
;	lib/src/stm8s_mylib.c: 353: DELAYI2C;
	push	#0x03
	clrw	x
	pushw	x
	push	#0x00
	call	_delay_us
;	lib/src/stm8s_mylib.c: 354: SCL_0;
	bres	0x5005, #4
;	lib/src/stm8s_mylib.c: 356: u8Data <<= 1;
	sll	(0x01, sp)
;	lib/src/stm8s_mylib.c: 345: for (i = 0; i < 8; ++i) {
	inc	(0x02, sp)
	ld	a, (0x02, sp)
	cp	a, #0x08
	jrc	00108$
;	lib/src/stm8s_mylib.c: 359: SDA_0;
	bres	0x5005, #5
;	lib/src/stm8s_mylib.c: 360: DELAYI2C;
	push	#0x03
	clrw	x
	pushw	x
	push	#0x00
	call	_delay_us
;	lib/src/stm8s_mylib.c: 362: SCL_1;
	bset	0x5005, #4
;	lib/src/stm8s_mylib.c: 363: DELAYI2C;
	push	#0x03
	clrw	x
	pushw	x
	push	#0x00
	call	_delay_us
;	lib/src/stm8s_mylib.c: 364: SCL_0;
	bres	0x5005, #4
;	lib/src/stm8s_mylib.c: 365: DELAYI2C;
	push	#0x03
	clrw	x
	pushw	x
	push	#0x00
	call	_delay_us
;	lib/src/stm8s_mylib.c: 366: SDA_1;
	bset	0x5005, #5
;	lib/src/stm8s_mylib.c: 367: if (SDA_VAL) {
	btjf	0x5006, #5, 00106$
;	lib/src/stm8s_mylib.c: 368: u8Ret = 0;
	clr	a
;	lib/src/stm8s_mylib.c: 370: u8Ret = 1;
	.byte 0xc5
00106$:
	ld	a, #0x01
00107$:
;	lib/src/stm8s_mylib.c: 372: DELAYI2C;
	push	a
	push	#0x03
	clrw	x
	pushw	x
	push	#0x00
	call	_delay_us
	pop	a
;	lib/src/stm8s_mylib.c: 373: return u8Ret;
;	lib/src/stm8s_mylib.c: 374: }
	addw	sp, #2
	ret
;	lib/src/stm8s_mylib.c: 375: uint8_t i2c_read(uint8_t Ack)
;	-----------------------------------------
;	 function i2c_read
;	-----------------------------------------
_i2c_read:
	sub	sp, #3
	ld	(0x01, sp), a
;	lib/src/stm8s_mylib.c: 377: uint8_t u8DataRead = 0;
	clr	(0x02, sp)
;	lib/src/stm8s_mylib.c: 379: SDA_1;
	bset	0x5005, #5
;	lib/src/stm8s_mylib.c: 380: for (i = 0; i < 8; ++i)
	clr	(0x03, sp)
00107$:
;	lib/src/stm8s_mylib.c: 382: u8DataRead = u8DataRead << 1;
	sll	(0x02, sp)
;	lib/src/stm8s_mylib.c: 383: SCL_1;
	bset	0x5005, #4
;	lib/src/stm8s_mylib.c: 384: DELAYI2C;
	push	#0x03
	clrw	x
	pushw	x
	push	#0x00
	call	_delay_us
;	lib/src/stm8s_mylib.c: 385: if (SDA_VAL)
	btjf	0x5006, #5, 00102$
;	lib/src/stm8s_mylib.c: 387: u8DataRead = u8DataRead | 0x01;
	srl	(0x02, sp)
	scf
	rlc	(0x02, sp)
00102$:
;	lib/src/stm8s_mylib.c: 389: DELAYI2C;
	push	#0x03
	clrw	x
	pushw	x
	push	#0x00
	call	_delay_us
;	lib/src/stm8s_mylib.c: 390: SCL_0;
	bres	0x5005, #4
;	lib/src/stm8s_mylib.c: 391: DELAYI2C;
	push	#0x03
	clrw	x
	pushw	x
	push	#0x00
	call	_delay_us
;	lib/src/stm8s_mylib.c: 380: for (i = 0; i < 8; ++i)
	inc	(0x03, sp)
	ld	a, (0x03, sp)
	cp	a, #0x08
	jrc	00107$
;	lib/src/stm8s_mylib.c: 379: SDA_1;
	ld	a, 0x5005
;	lib/src/stm8s_mylib.c: 394: if(Ack){
	tnz	(0x01, sp)
	jreq	00105$
;	lib/src/stm8s_mylib.c: 395: SDA_0;
	and	a, #0xdf
	ld	0x5005, a
	jra	00106$
00105$:
;	lib/src/stm8s_mylib.c: 397: SDA_1;
	or	a, #0x20
	ld	0x5005, a
00106$:
;	lib/src/stm8s_mylib.c: 399: DELAYI2C;
	push	#0x03
	clrw	x
	pushw	x
	push	#0x00
	call	_delay_us
;	lib/src/stm8s_mylib.c: 401: SCL_1;
	bset	0x5005, #4
;	lib/src/stm8s_mylib.c: 402: DELAYI2C;
	push	#0x03
	clrw	x
	pushw	x
	push	#0x00
	call	_delay_us
;	lib/src/stm8s_mylib.c: 403: SCL_0;
	bres	0x5005, #4
;	lib/src/stm8s_mylib.c: 404: DELAYI2C;
	push	#0x03
	clrw	x
	pushw	x
	push	#0x00
	call	_delay_us
;	lib/src/stm8s_mylib.c: 405: return u8DataRead;
	ld	a, (0x02, sp)
;	lib/src/stm8s_mylib.c: 406: }
	addw	sp, #3
	ret
;	lib/src/stm8s_mylib.c: 407: uint8_t data_write(uint8_t address, uint8_t addressData, uint8_t num, uint8_t *data)
;	-----------------------------------------
;	 function data_write
;	-----------------------------------------
_data_write:
	sub	sp, #3
	ld	(0x01, sp), a
;	lib/src/stm8s_mylib.c: 410: for(i=0; i< num; ++i)
	ld	a, (0x06, sp)
	ld	(0x02, sp), a
	clr	(0x03, sp)
00103$:
	ld	a, (0x03, sp)
	cp	a, (0x07, sp)
	jrnc	00101$
;	lib/src/stm8s_mylib.c: 412: i2c_start();
	call	_i2c_start
;	lib/src/stm8s_mylib.c: 413: i2c_write(address);
	ld	a, (0x01, sp)
	call	_i2c_write
;	lib/src/stm8s_mylib.c: 414: i2c_write(addressData++);
	ld	a, (0x02, sp)
	inc	(0x02, sp)
	call	_i2c_write
;	lib/src/stm8s_mylib.c: 415: i2c_write(data[i]);
	clrw	x
	ld	a, (0x03, sp)
	ld	xl, a
	addw	x, (0x08, sp)
	ld	a, (x)
	call	_i2c_write
;	lib/src/stm8s_mylib.c: 416: i2c_stop();
	call	_i2c_stop
;	lib/src/stm8s_mylib.c: 417: delay_us(1000);
	push	#0xe8
	push	#0x03
	clrw	x
	pushw	x
	call	_delay_us
;	lib/src/stm8s_mylib.c: 410: for(i=0; i< num; ++i)
	inc	(0x03, sp)
	jra	00103$
00101$:
;	lib/src/stm8s_mylib.c: 419: return 1;
	ld	a, #0x01
;	lib/src/stm8s_mylib.c: 420: }
	ldw	x, (4, sp)
	addw	sp, #9
	jp	(x)
;	lib/src/stm8s_mylib.c: 421: uint8_t data_read(uint8_t address, uint8_t addressData, uint8_t num, uint8_t *data)
;	-----------------------------------------
;	 function data_read
;	-----------------------------------------
_data_read:
	sub	sp, #4
	ld	(0x03, sp), a
;	lib/src/stm8s_mylib.c: 424: i2c_start();
	call	_i2c_start
;	lib/src/stm8s_mylib.c: 425: i2c_write(address);
	ld	a, (0x03, sp)
	call	_i2c_write
;	lib/src/stm8s_mylib.c: 426: i2c_write(addressData);
	ld	a, (0x07, sp)
	call	_i2c_write
;	lib/src/stm8s_mylib.c: 428: i2c_start();
	call	_i2c_start
;	lib/src/stm8s_mylib.c: 429: i2c_write(address | 0x01);
	ld	a, (0x03, sp)
	or	a, #0x01
	call	_i2c_write
;	lib/src/stm8s_mylib.c: 430: for(i=0; i< num - 1; ++i)
	clr	(0x04, sp)
00103$:
	clrw	x
	ld	a, (0x08, sp)
	ld	xl, a
	decw	x
	ldw	(0x01, sp), x
	clrw	y
	ld	a, (0x04, sp)
	ld	yl, a
;	lib/src/stm8s_mylib.c: 432: data[i] = i2c_read(1);
	clrw	x
	ld	a, (0x04, sp)
	ld	xl, a
	addw	x, (0x09, sp)
;	lib/src/stm8s_mylib.c: 430: for(i=0; i< num - 1; ++i)
	exgw	x, y
	cpw	x, (0x01, sp)
	exgw	x, y
	jrsge	00101$
;	lib/src/stm8s_mylib.c: 432: data[i] = i2c_read(1);
	pushw	x
	ld	a, #0x01
	call	_i2c_read
	popw	x
	ld	(x), a
;	lib/src/stm8s_mylib.c: 430: for(i=0; i< num - 1; ++i)
	inc	(0x04, sp)
	jra	00103$
00101$:
;	lib/src/stm8s_mylib.c: 434: data[i] = i2c_read(0);
	pushw	x
	clr	a
	call	_i2c_read
	popw	x
	ld	(x), a
;	lib/src/stm8s_mylib.c: 435: i2c_stop();
	call	_i2c_stop
;	lib/src/stm8s_mylib.c: 436: return 1;
	ld	a, #0x01
;	lib/src/stm8s_mylib.c: 437: }
	ldw	x, (5, sp)
	addw	sp, #10
	jp	(x)
;	lib/src/stm8s_mylib.c: 438: uint8_t decimal_to_bcd(uint8_t value)
;	-----------------------------------------
;	 function decimal_to_bcd
;	-----------------------------------------
_decimal_to_bcd:
	push	a
;	lib/src/stm8s_mylib.c: 441: hex = (((value / 10) << 4) + (value % 10));
	clrw	x
	ld	xl, a
	pushw	x
	push	#0x0a
	push	#0x00
	call	__divsint
	ld	a, xl
	popw	x
	swap	a
	and	a, #0xf0
	ld	(0x01, sp), a
	push	#0x0a
	push	#0x00
	call	__modsint
	ld	a, xl
	add	a, (0x01, sp)
;	lib/src/stm8s_mylib.c: 442: return hex;
;	lib/src/stm8s_mylib.c: 443: }
	addw	sp, #1
	ret
;	lib/src/stm8s_mylib.c: 444: void writeTime(uint8_t giay, uint8_t phut, uint8_t gio){
;	-----------------------------------------
;	 function writeTime
;	-----------------------------------------
_writeTime:
	sub	sp, #3
;	lib/src/stm8s_mylib.c: 446: u8Data[0] = decimal_to_bcd(giay);
	call	_decimal_to_bcd
	ld	(0x01, sp), a
;	lib/src/stm8s_mylib.c: 447: u8Data[1] = decimal_to_bcd(phut);
	ld	a, (0x06, sp)
	call	_decimal_to_bcd
	ld	(0x02, sp), a
;	lib/src/stm8s_mylib.c: 448: u8Data[2] = decimal_to_bcd(gio);
	ld	a, (0x07, sp)
	call	_decimal_to_bcd
	ld	(0x03, sp), a
;	lib/src/stm8s_mylib.c: 449: data_write(ADDR_DS13, 0x00, 3, u8Data);
	ldw	x, sp
	incw	x
	pushw	x
	push	#0x03
	push	#0x00
	ld	a, #0xd0
	call	_data_write
;	lib/src/stm8s_mylib.c: 450: }
	ldw	x, (4, sp)
	addw	sp, #7
	jp	(x)
;	lib/src/stm8s_mylib.c: 451: void writeDay(uint8_t date, uint8_t month){
;	-----------------------------------------
;	 function writeDay
;	-----------------------------------------
_writeDay:
	sub	sp, #2
;	lib/src/stm8s_mylib.c: 453: u8Data[0] = decimal_to_bcd(date);
	call	_decimal_to_bcd
	ld	(0x01, sp), a
;	lib/src/stm8s_mylib.c: 454: u8Data[1] = decimal_to_bcd(month);
	ld	a, (0x05, sp)
	call	_decimal_to_bcd
	ld	(0x02, sp), a
;	lib/src/stm8s_mylib.c: 455: data_write(ADDR_DS13, 0x04, 2, u8Data);
	ldw	x, sp
	incw	x
	pushw	x
	push	#0x02
	push	#0x04
	ld	a, #0xd0
	call	_data_write
;	lib/src/stm8s_mylib.c: 456: }
	addw	sp, #2
	popw	x
	pop	a
	jp	(x)
;	lib/src/stm8s_mylib.c: 457: void Write_EEPROM(uint32_t Address, unsigned char Data){
;	-----------------------------------------
;	 function Write_EEPROM
;	-----------------------------------------
_Write_EEPROM:
;	lib/src/stm8s_mylib.c: 459: FLASH->DUKR = (uint8_t)0xAE ; /*!< Second RASS key */ /* Warning: keys are reversed on data memory !!! */ 
	mov	0x5064+0, #0xae
;	lib/src/stm8s_mylib.c: 460: FLASH->DUKR = (uint8_t)0x56 ;  /*!< First RASS key */
	mov	0x5064+0, #0x56
;	lib/src/stm8s_mylib.c: 462: *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
	ldw	x, (0x05, sp)
	ld	a, (0x07, sp)
	ld	(x), a
;	lib/src/stm8s_mylib.c: 465: FLASH->IAPSR &= (uint8_t)0xF7; /*!< Data EEPROM memory */
	ld	a, 0x505f
	and	a, #0xf7
	ld	0x505f, a
;	lib/src/stm8s_mylib.c: 466: }
	ldw	x, (1, sp)
	addw	sp, #7
	jp	(x)
;	lib/src/stm8s_mylib.c: 467: uint8_t Read_EEPROM(uint32_t Address){
;	-----------------------------------------
;	 function Read_EEPROM
;	-----------------------------------------
_Read_EEPROM:
;	lib/src/stm8s_mylib.c: 468: return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address);
	ldw	x, (0x05, sp)
	ld	a, (x)
;	lib/src/stm8s_mylib.c: 469: }
	ldw	x, (1, sp)
	addw	sp, #6
	jp	(x)
;	lib/src/stm8s_mylib.c: 470: void SD1106_sendCom(uint8_t command){
;	-----------------------------------------
;	 function SD1106_sendCom
;	-----------------------------------------
_SD1106_sendCom:
	push	a
	ld	(0x01, sp), a
;	lib/src/stm8s_mylib.c: 471: i2c_start();                // initialize I2C first
	call	_i2c_start
;	lib/src/stm8s_mylib.c: 472: i2c_write(OLED_ADDR);
	ld	a, #0x78
	call	_i2c_write
;	lib/src/stm8s_mylib.c: 473: i2c_write(OLED_CMD_MODE);   // set command mode
	ld	a, #0x80
	call	_i2c_write
;	lib/src/stm8s_mylib.c: 474: i2c_write(command);         // send the command bytes
	ld	a, (0x01, sp)
	call	_i2c_write
;	lib/src/stm8s_mylib.c: 475: i2c_stop();  
	pop	a
	jp	_i2c_stop
;	lib/src/stm8s_mylib.c: 477: }
	pop	a
	ret
;	lib/src/stm8s_mylib.c: 478: void SD1106_sendInitCom(void){
;	-----------------------------------------
;	 function SD1106_sendInitCom
;	-----------------------------------------
_SD1106_sendInitCom:
;	lib/src/stm8s_mylib.c: 479: SD1106_sendCom(DISPLAYOFF);
	ld	a, #0xae
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 480: SD1106_sendCom(NORMALDISPLAY);
	ld	a, #0xa6
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 481: SD1106_sendCom(SETDISPLAYCLOCKDIV);
	ld	a, #0xd5
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 482: SD1106_sendCom(0x80);
	ld	a, #0x80
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 483: SD1106_sendCom(SETMULTIPLEX);
	ld	a, #0xa8
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 484: SD1106_sendCom(0x3f);   //0x3F
	ld	a, #0x3f
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 485: SD1106_sendCom(SETDISPLAYOFFSET);
	ld	a, #0xd3
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 486: SD1106_sendCom(0x00);
	clr	a
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 487: SD1106_sendCom(SETSTARTLINE | 0x00);
	ld	a, #0x40
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 488: SD1106_sendCom(CHARGEPUMP);
	ld	a, #0x8d
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 489: SD1106_sendCom(0x14);
	ld	a, #0x14
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 490: SD1106_sendCom(MEMORYMODE);
	ld	a, #0x20
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 491: SD1106_sendCom(0x00);
	clr	a
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 492: SD1106_sendCom(SEGREMAP);   //A0: le phai, A1: le trai
	ld	a, #0xa1
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 493: SD1106_sendCom(COMSCANDEC); //0xC8: scan from COM(n-1) to COM0 : hien thi o tren, 0xC0 scan from COM0 to COM(n-1) : hien thi o duoi
	ld	a, #0xc8
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 494: SD1106_sendCom(SETCOMPINS);
	ld	a, #0xda
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 495: SD1106_sendCom(0x12); //0x12
	ld	a, #0x12
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 496: SD1106_sendCom(SETCONTRAST);
	ld	a, #0x81
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 497: SD1106_sendCom(0xcf);
	ld	a, #0xcf
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 498: SD1106_sendCom(SETPRECHARGE);
	ld	a, #0xd9
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 499: SD1106_sendCom(0xF1);
	ld	a, #0xf1
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 500: SD1106_sendCom(SETVCOMDETECT);
	ld	a, #0xdb
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 501: SD1106_sendCom(0x40);
	ld	a, #0x40
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 502: SD1106_sendCom(DISPLAYALLON_RESUME);
	ld	a, #0xa4
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 503: SD1106_sendCom(NORMALDISPLAY);
	ld	a, #0xa6
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 504: SD1106_sendCom(0x2E);   //stop scroll
	ld	a, #0x2e
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 505: SD1106_sendCom(DISPLAYON);
	ld	a, #0xaf
;	lib/src/stm8s_mylib.c: 506: }
	jp	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 507: void SD1106_clear(void)
;	-----------------------------------------
;	 function SD1106_clear
;	-----------------------------------------
_SD1106_clear:
	sub	sp, #2
;	lib/src/stm8s_mylib.c: 509: for (uint8_t page = 0; page<8; page++){
	clr	(0x01, sp)
00111$:
	ld	a, (0x01, sp)
	cp	a, #0x08
	jrnc	00113$
;	lib/src/stm8s_mylib.c: 510: SD1106_sendCom(PAGESTARTADDRESS | page);
	ld	a, (0x01, sp)
	or	a, #0xb0
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 511: SD1106_sendCom(SETLOWCOLUMN | 2);
	ld	a, #0x02
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 512: SD1106_sendCom(SETHIGHCOLUMN | 0);
	ld	a, #0x10
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 514: for(uint8_t y=0; y<16; y++){
	clr	(0x02, sp)
00108$:
	ld	a, (0x02, sp)
	cp	a, #0x10
	jrnc	00112$
;	lib/src/stm8s_mylib.c: 515: i2c_start();  
	call	_i2c_start
;	lib/src/stm8s_mylib.c: 516: i2c_write(OLED_ADDR);
	ld	a, #0x78
	call	_i2c_write
;	lib/src/stm8s_mylib.c: 517: i2c_write(OLED_DAT_MODE);
	ld	a, #0x40
	call	_i2c_write
;	lib/src/stm8s_mylib.c: 518: for (uint8_t w=0; w<8; w++) {
	clr	a
00105$:
	cp	a, #0x08
	jrnc	00101$
;	lib/src/stm8s_mylib.c: 519: i2c_write(0x00); 
	push	a
	clr	a
	call	_i2c_write
	pop	a
;	lib/src/stm8s_mylib.c: 518: for (uint8_t w=0; w<8; w++) {
	inc	a
	jra	00105$
00101$:
;	lib/src/stm8s_mylib.c: 521: i2c_stop();
	call	_i2c_stop
;	lib/src/stm8s_mylib.c: 514: for(uint8_t y=0; y<16; y++){
	inc	(0x02, sp)
	jra	00108$
00112$:
;	lib/src/stm8s_mylib.c: 509: for (uint8_t page = 0; page<8; page++){
	inc	(0x01, sp)
	jra	00111$
00113$:
;	lib/src/stm8s_mylib.c: 525: }
	addw	sp, #2
	ret
;	lib/src/stm8s_mylib.c: 526: void SD1106_CUS_PRINT(void){
;	-----------------------------------------
;	 function SD1106_CUS_PRINT
;	-----------------------------------------
_SD1106_CUS_PRINT:
	sub	sp, #7
;	lib/src/stm8s_mylib.c: 532: for(uint8_t i=0; i<8;++i){
	clr	(0x05, sp)
00109$:
	ld	a, (0x05, sp)
	cp	a, #0x08
	jrnc	00102$
;	lib/src/stm8s_mylib.c: 533: SD1106_sendCom(PAGESTARTADDRESS | i);
	ld	a, (0x05, sp)
	or	a, #0xb0
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 534: SD1106_sendCom(SETLOWCOLUMN | 2);
	ld	a, #0x02
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 535: SD1106_sendCom(SETHIGHCOLUMN | 0);
	ld	a, #0x10
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 537: i2c_start();  
	call	_i2c_start
;	lib/src/stm8s_mylib.c: 538: i2c_write(OLED_ADDR);
	ld	a, #0x78
	call	_i2c_write
;	lib/src/stm8s_mylib.c: 539: i2c_write(OLED_DAT_MODE);
	ld	a, #0x40
	call	_i2c_write
;	lib/src/stm8s_mylib.c: 540: for (uint16_t w=i*128; w < (i+1)*128 ; w++) {
	ld	a, (0x05, sp)
	ld	(0x02, sp), a
	clr	(0x01, sp)
	ldw	x, (0x01, sp)
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	ldw	(0x06, sp), x
00106$:
	ldw	x, (0x01, sp)
	incw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	ldw	y, (0x06, sp)
	ldw	(0x03, sp), x
	ldw	x, y
	cpw	x, (0x03, sp)
	jrnc	00101$
;	lib/src/stm8s_mylib.c: 541: i2c_write(lacoVietNam[w]); 
	ldw	x, (0x06, sp)
	addw	x, #(_lacoVietNam+0)
	ldw	(0x03, sp), x
	ld	a, (x)
	call	_i2c_write
;	lib/src/stm8s_mylib.c: 540: for (uint16_t w=i*128; w < (i+1)*128 ; w++) {
	ldw	x, (0x06, sp)
	incw	x
	ldw	(0x06, sp), x
	jra	00106$
00101$:
;	lib/src/stm8s_mylib.c: 543: i2c_stop();  
	call	_i2c_stop
;	lib/src/stm8s_mylib.c: 532: for(uint8_t i=0; i<8;++i){
	inc	(0x05, sp)
	jra	00109$
00102$:
;	lib/src/stm8s_mylib.c: 546: delay_ms(2000);
	ldw	x, #0x07d0
	call	_delay_ms
;	lib/src/stm8s_mylib.c: 547: SD1106_clear();
	call	_SD1106_clear
;	lib/src/stm8s_mylib.c: 549: for(uint8_t i=0; i<8;++i){
	clr	(0x05, sp)
00115$:
	ld	a, (0x05, sp)
	cp	a, #0x08
	jrnc	00104$
;	lib/src/stm8s_mylib.c: 550: SD1106_sendCom(PAGESTARTADDRESS | i);
	ld	a, (0x05, sp)
	or	a, #0xb0
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 551: SD1106_sendCom(SETLOWCOLUMN | (32 & 0xf));
	clr	a
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 552: SD1106_sendCom(SETHIGHCOLUMN | ( (32 >> 4) & 0xf) );
	ld	a, #0x12
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 556: i2c_start();  
	call	_i2c_start
;	lib/src/stm8s_mylib.c: 557: i2c_write(OLED_ADDR);
	ld	a, #0x78
	call	_i2c_write
;	lib/src/stm8s_mylib.c: 558: i2c_write(OLED_DAT_MODE);
	ld	a, #0x40
	call	_i2c_write
;	lib/src/stm8s_mylib.c: 559: for (uint16_t w=i*64; w < (i+1)*64 ; w++) {
	ld	a, (0x05, sp)
	ld	(0x02, sp), a
	clr	(0x01, sp)
	ldw	x, (0x01, sp)
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	ldw	(0x06, sp), x
00112$:
	ldw	x, (0x01, sp)
	incw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	ldw	y, (0x06, sp)
	ldw	(0x03, sp), x
	ldw	x, y
	cpw	x, (0x03, sp)
	jrnc	00103$
;	lib/src/stm8s_mylib.c: 560: i2c_write(mixigamingLogo[w]); 
	ldw	x, (0x06, sp)
	ld	a, (_mixigamingLogo+0, x)
	call	_i2c_write
;	lib/src/stm8s_mylib.c: 559: for (uint16_t w=i*64; w < (i+1)*64 ; w++) {
	ldw	x, (0x06, sp)
	incw	x
	ldw	(0x06, sp), x
	jra	00112$
00103$:
;	lib/src/stm8s_mylib.c: 562: i2c_stop();   
	call	_i2c_stop
;	lib/src/stm8s_mylib.c: 549: for(uint8_t i=0; i<8;++i){
	inc	(0x05, sp)
	jra	00115$
00104$:
;	lib/src/stm8s_mylib.c: 565: delay_ms(1000);
	ldw	x, #0x03e8
	call	_delay_ms
;	lib/src/stm8s_mylib.c: 566: SD1106_clear();
	addw	sp, #7
;	lib/src/stm8s_mylib.c: 568: }
	jp	_SD1106_clear
;	lib/src/stm8s_mylib.c: 569: void print_levelBAT(uint8_t levelBAT ){
;	-----------------------------------------
;	 function print_levelBAT
;	-----------------------------------------
_print_levelBAT:
	sub	sp, #2
	ld	(0x01, sp), a
;	lib/src/stm8s_mylib.c: 570: SD1106_sendCom(PAGESTARTADDRESS | 0);
	ld	a, #0xb0
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 571: SD1106_sendCom(SETLOWCOLUMN | (80 & 0xf));
	clr	a
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 572: SD1106_sendCom(SETHIGHCOLUMN | ( (80 >> 4) & 0xf) );
	ld	a, #0x15
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 574: i2c_start();  
	call	_i2c_start
;	lib/src/stm8s_mylib.c: 575: i2c_write(OLED_ADDR);
	ld	a, #0x78
	call	_i2c_write
;	lib/src/stm8s_mylib.c: 576: i2c_write(OLED_DAT_MODE);
	ld	a, #0x40
	call	_i2c_write
;	lib/src/stm8s_mylib.c: 577: if(levelBAT >= 38){
	ld	a, (0x01, sp)
	cp	a, #0x26
	jrc	00118$
;	lib/src/stm8s_mylib.c: 578: for (uint8_t w=0; w<sizeof(levelBAT_full); w++) {
	clr	(0x02, sp)
00107$:
	ld	a, (0x02, sp)
	cp	a, #0x10
	jrnc	00105$
;	lib/src/stm8s_mylib.c: 579: i2c_write(levelBAT_full[w]); 
	clrw	x
	ld	a, (0x02, sp)
	ld	xl, a
	addw	x, #(_levelBAT_full+0)
	ld	a, (x)
	call	_i2c_write
;	lib/src/stm8s_mylib.c: 578: for (uint8_t w=0; w<sizeof(levelBAT_full); w++) {
	inc	(0x02, sp)
	jra	00107$
;	lib/src/stm8s_mylib.c: 582: for (uint8_t w=0; w<sizeof(levelBAT_Tb); w++) {
00118$:
	clr	(0x02, sp)
00110$:
	ld	a, (0x02, sp)
	cp	a, #0x10
	jrnc	00105$
;	lib/src/stm8s_mylib.c: 583: i2c_write(levelBAT_Tb[w]); 
	clrw	x
	ld	a, (0x02, sp)
	ld	xl, a
	addw	x, #(_levelBAT_Tb+0)
	ld	a, (x)
	call	_i2c_write
;	lib/src/stm8s_mylib.c: 582: for (uint8_t w=0; w<sizeof(levelBAT_Tb); w++) {
	inc	(0x02, sp)
	jra	00110$
00105$:
;	lib/src/stm8s_mylib.c: 586: i2c_stop();
	addw	sp, #2
;	lib/src/stm8s_mylib.c: 587: }
	jp	_i2c_stop
;	lib/src/stm8s_mylib.c: 588: void print_rssi(void){
;	-----------------------------------------
;	 function print_rssi
;	-----------------------------------------
_print_rssi:
	push	a
;	lib/src/stm8s_mylib.c: 589: SD1106_sendCom(PAGESTARTADDRESS | 0);
	ld	a, #0xb0
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 590: SD1106_sendCom(SETLOWCOLUMN | 2);
	ld	a, #0x02
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 591: SD1106_sendCom(SETHIGHCOLUMN | 0);
	ld	a, #0x10
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 593: i2c_start();  
	call	_i2c_start
;	lib/src/stm8s_mylib.c: 594: i2c_write(OLED_ADDR);
	ld	a, #0x78
	call	_i2c_write
;	lib/src/stm8s_mylib.c: 595: i2c_write(OLED_DAT_MODE);
	ld	a, #0x40
	call	_i2c_write
;	lib/src/stm8s_mylib.c: 596: for (uint8_t w=0; w<sizeof(rssi); w++) {
	clr	(0x01, sp)
00103$:
	ld	a, (0x01, sp)
	cp	a, #0x10
	jrnc	00105$
;	lib/src/stm8s_mylib.c: 597: i2c_write(rssi[w]); 
	clrw	x
	ld	a, (0x01, sp)
	ld	xl, a
	ld	a, (_rssi+0, x)
	call	_i2c_write
;	lib/src/stm8s_mylib.c: 596: for (uint8_t w=0; w<sizeof(rssi); w++) {
	inc	(0x01, sp)
	jra	00103$
00105$:
;	lib/src/stm8s_mylib.c: 599: }
	pop	a
	ret
;	lib/src/stm8s_mylib.c: 600: void station_chanel(void){
;	-----------------------------------------
;	 function station_chanel
;	-----------------------------------------
_station_chanel:
	push	a
;	lib/src/stm8s_mylib.c: 601: SD1106_sendCom(PAGESTARTADDRESS | 1);
	ld	a, #0xb1
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 602: SD1106_sendCom(SETLOWCOLUMN | 2);
	ld	a, #0x02
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 603: SD1106_sendCom(SETHIGHCOLUMN | 0);
	ld	a, #0x10
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 605: i2c_start();  
	call	_i2c_start
;	lib/src/stm8s_mylib.c: 606: i2c_write(OLED_ADDR);
	ld	a, #0x78
	call	_i2c_write
;	lib/src/stm8s_mylib.c: 607: i2c_write(OLED_DAT_MODE);
	ld	a, #0x40
	call	_i2c_write
;	lib/src/stm8s_mylib.c: 608: for (uint8_t w=0; w<sizeof(station_icon); w++) {
	clr	(0x01, sp)
00103$:
	ld	a, (0x01, sp)
	cp	a, #0x10
	jrnc	00105$
;	lib/src/stm8s_mylib.c: 609: i2c_write(station_icon[w]); 
	clrw	x
	ld	a, (0x01, sp)
	ld	xl, a
	ld	a, (_station_icon+0, x)
	call	_i2c_write
;	lib/src/stm8s_mylib.c: 608: for (uint8_t w=0; w<sizeof(station_icon); w++) {
	inc	(0x01, sp)
	jra	00103$
00105$:
;	lib/src/stm8s_mylib.c: 611: }
	pop	a
	ret
;	lib/src/stm8s_mylib.c: 612: void clock_icon_ds(void){
;	-----------------------------------------
;	 function clock_icon_ds
;	-----------------------------------------
_clock_icon_ds:
	push	a
;	lib/src/stm8s_mylib.c: 613: SD1106_sendCom(PAGESTARTADDRESS | 1);
	ld	a, #0xb1
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 614: SD1106_sendCom(SETLOWCOLUMN | (80 & 0xf));
	clr	a
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 615: SD1106_sendCom(SETHIGHCOLUMN | ( (80 >> 4) & 0xf) );
	ld	a, #0x15
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 617: i2c_start();  
	call	_i2c_start
;	lib/src/stm8s_mylib.c: 618: i2c_write(OLED_ADDR);
	ld	a, #0x78
	call	_i2c_write
;	lib/src/stm8s_mylib.c: 619: i2c_write(OLED_DAT_MODE);
	ld	a, #0x40
	call	_i2c_write
;	lib/src/stm8s_mylib.c: 620: for (uint8_t w=0; w<sizeof(clock_icon); w++) {
	clr	(0x01, sp)
00103$:
	ld	a, (0x01, sp)
	cp	a, #0x10
	jrnc	00105$
;	lib/src/stm8s_mylib.c: 621: i2c_write(clock_icon[w]); 
	clrw	x
	ld	a, (0x01, sp)
	ld	xl, a
	ld	a, (_clock_icon+0, x)
	call	_i2c_write
;	lib/src/stm8s_mylib.c: 620: for (uint8_t w=0; w<sizeof(clock_icon); w++) {
	inc	(0x01, sp)
	jra	00103$
00105$:
;	lib/src/stm8s_mylib.c: 623: }
	pop	a
	ret
;	lib/src/stm8s_mylib.c: 624: void SD1106_setContranst(char constrast)
;	-----------------------------------------
;	 function SD1106_setContranst
;	-----------------------------------------
_SD1106_setContranst:
;	lib/src/stm8s_mylib.c: 626: SD1106_sendCom(0x81);
	push	a
	ld	a, #0x81
	call	_SD1106_sendCom
	pop	a
;	lib/src/stm8s_mylib.c: 627: SD1106_sendCom(constrast);
;	lib/src/stm8s_mylib.c: 628: }
	jp	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 629: void SD1106_resetDis(void)
;	-----------------------------------------
;	 function SD1106_resetDis
;	-----------------------------------------
_SD1106_resetDis:
;	lib/src/stm8s_mylib.c: 631: SD1106_sendCom(0xAE);   //OLED Off
	ld	a, #0xae
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 632: SD1106_clear();
	call	_SD1106_clear
;	lib/src/stm8s_mylib.c: 633: SD1106_sendCom(0xAF);   ////OLED On
	ld	a, #0xaf
;	lib/src/stm8s_mylib.c: 634: }
	jp	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 635: void SD1106_flipScreen(void)
;	-----------------------------------------
;	 function SD1106_flipScreen
;	-----------------------------------------
_SD1106_flipScreen:
;	lib/src/stm8s_mylib.c: 637: SD1106_sendCom(0xA0);   //le trai hay phai
	ld	a, #0xa0
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 638: SD1106_sendCom(SETCOMPINS);
	ld	a, #0xda
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 639: SD1106_sendCom(0x22);
	ld	a, #0x22
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 640: SD1106_sendCom(COMSCANINC);
	ld	a, #0xc0
;	lib/src/stm8s_mylib.c: 641: }
	jp	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 643: void SD1106_printP(char* p, uint8_t PAGES, uint8_t Column)
;	-----------------------------------------
;	 function SD1106_printP
;	-----------------------------------------
_SD1106_printP:
	sub	sp, #7
	ldw	(0x03, sp), x
;	lib/src/stm8s_mylib.c: 645: SD1106_sendCom(PAGESTARTADDRESS | PAGES);
	or	a, #0xb0
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 646: SD1106_sendCom(SETLOWCOLUMN | (Column & 0xf));
	ld	a, (0x0a, sp)
	ld	(0x07, sp), a
	and	a, #0x0f
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 647: SD1106_sendCom(SETHIGHCOLUMN | ( (Column >> 4) & 0xf) );
	ld	a, (0x07, sp)
	swap	a
	and	a, #15
	or	a, #0x10
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 648: i2c_start();  
	call	_i2c_start
;	lib/src/stm8s_mylib.c: 649: i2c_write(OLED_ADDR);
	ld	a, #0x78
	call	_i2c_write
;	lib/src/stm8s_mylib.c: 650: i2c_write(OLED_DAT_MODE);
	ld	a, #0x40
	call	_i2c_write
;	lib/src/stm8s_mylib.c: 651: while(*p){
	ldw	y, (0x03, sp)
	ldw	(0x05, sp), y
00102$:
	ldw	x, (0x05, sp)
	ld	a, (x)
	ld	(0x07, sp), a
	jreq	00104$
;	lib/src/stm8s_mylib.c: 652: uint16_t offset = *p - 32;
	ld	a, (0x07, sp)
	clrw	x
	ld	xl, a
	subw	x, #0x0020
;	lib/src/stm8s_mylib.c: 653: offset += (offset << 2) ;
	ldw	(0x01, sp), x
	sllw	x
	sllw	x
	addw	x, (0x01, sp)
;	lib/src/stm8s_mylib.c: 654: i2c_write(0x00);   
	pushw	x
	clr	a
	call	_i2c_write
	popw	x
;	lib/src/stm8s_mylib.c: 655: for (uint8_t w=0; w<5; w++) {
	clr	(0x07, sp)
00106$:
	ld	a, (0x07, sp)
	cp	a, #0x05
	jrnc	00101$
;	lib/src/stm8s_mylib.c: 656: i2c_write(OLED_FONT[offset++]); 
	ldw	y, x
	addw	y, #(_OLED_FONT+0)
	incw	x
	ld	a, (y)
	pushw	x
	call	_i2c_write
	popw	x
;	lib/src/stm8s_mylib.c: 655: for (uint8_t w=0; w<5; w++) {
	inc	(0x07, sp)
	jra	00106$
00101$:
;	lib/src/stm8s_mylib.c: 658: p++;    
	ldw	x, (0x05, sp)
	incw	x
	ldw	(0x05, sp), x
	jra	00102$
00104$:
;	lib/src/stm8s_mylib.c: 660: i2c_stop();
	ldw	x, (8, sp)
	ldw	(9, sp), x
	addw	sp, #8
;	lib/src/stm8s_mylib.c: 661: }
	jp	_i2c_stop
	pop	a
	jp	(x)
;	lib/src/stm8s_mylib.c: 662: void SD1106_print_one_num(uint8_t so, uint8_t PAGES, uint8_t Column)
;	-----------------------------------------
;	 function SD1106_print_one_num
;	-----------------------------------------
_SD1106_print_one_num:
	sub	sp, #4
	ld	(0x03, sp), a
;	lib/src/stm8s_mylib.c: 664: SD1106_sendCom(PAGESTARTADDRESS | PAGES);
	ld	a, (0x07, sp)
	or	a, #0xb0
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 665: SD1106_sendCom(SETLOWCOLUMN | (Column & 0xf));
	ld	a, (0x08, sp)
	ld	(0x04, sp), a
	and	a, #0x0f
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 666: SD1106_sendCom(SETHIGHCOLUMN | ( (Column >> 4) & 0xf) );
	ld	a, (0x04, sp)
	swap	a
	and	a, #15
	or	a, #0x10
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 667: i2c_start();
	call	_i2c_start
;	lib/src/stm8s_mylib.c: 668: i2c_write(OLED_ADDR);					// start transmission to OLED
	ld	a, #0x78
	call	_i2c_write
;	lib/src/stm8s_mylib.c: 669: i2c_write(OLED_DAT_MODE);
	ld	a, #0x40
	call	_i2c_write
;	lib/src/stm8s_mylib.c: 670: uint16_t offset = so + 16;					
	ld	a, (0x03, sp)
	clrw	x
	ld	xl, a
	addw	x, #0x0010
;	lib/src/stm8s_mylib.c: 671: offset += offset << 2;					// -> offset = so * 5
	ldw	(0x01, sp), x
	sllw	x
	sllw	x
	addw	x, (0x01, sp)
;	lib/src/stm8s_mylib.c: 672: i2c_write(0x00);                       // print spacing between characters
	pushw	x
	clr	a
	call	_i2c_write
	popw	x
;	lib/src/stm8s_mylib.c: 673: for(uint8_t i=5; i; i--) i2c_write(OLED_FONT[offset++]); // print character
	ld	a, #0x05
	ld	(0x04, sp), a
00103$:
	tnz	(0x04, sp)
	jreq	00101$
	ldw	y, x
	addw	y, #(_OLED_FONT+0)
	incw	x
	ld	a, (y)
	pushw	x
	call	_i2c_write
	popw	x
	dec	(0x04, sp)
	jra	00103$
00101$:
;	lib/src/stm8s_mylib.c: 674: i2c_stop();
	ldw	x, (5, sp)
	ldw	(7, sp), x
	addw	sp, #6
;	lib/src/stm8s_mylib.c: 675: }
	jp	_i2c_stop
;	lib/src/stm8s_mylib.c: 676: void SD1106_printNum(unsigned int Number, uint8_t PAGES,  uint8_t Column)
;	-----------------------------------------
;	 function SD1106_printNum
;	-----------------------------------------
_SD1106_printNum:
	sub	sp, #12
	ldw	(0x09, sp), x
	ld	(0x08, sp), a
;	lib/src/stm8s_mylib.c: 678: unsigned char mang[] = {0, 0, 0, 0, 0};
	clr	(0x03, sp)
	clr	(0x04, sp)
	clr	(0x05, sp)
	clr	(0x06, sp)
	clr	(0x07, sp)
;	lib/src/stm8s_mylib.c: 679: unsigned char count = 0;
	clr	a
;	lib/src/stm8s_mylib.c: 681: if (Number == 0)   //In ra so 0 khi Number = 0
	ldw	x, (0x09, sp)
	jrne	00117$
;	lib/src/stm8s_mylib.c: 683: mang[0] = 0;
	clr	(0x03, sp)
;	lib/src/stm8s_mylib.c: 684: count = 1;
	ld	a, #0x01
;	lib/src/stm8s_mylib.c: 686: while (Number != 0)
00117$:
	ld	(0x0c, sp), a
00103$:
	ldw	x, (0x09, sp)
	jreq	00105$
;	lib/src/stm8s_mylib.c: 688: mang[count] = Number % 10;
	clrw	x
	ld	a, (0x0c, sp)
	ld	xl, a
	pushw	x
	ldw	x, sp
	addw	x, #5
	addw	x, (1, sp)
	ldw	(0x03, sp), x
	addw	sp, #2
	ldw	x, (0x09, sp)
	ldw	y, #0x000a
	divw	x, y
	ld	a, yl
	ldw	x, (0x01, sp)
	ld	(x), a
;	lib/src/stm8s_mylib.c: 689: Number = Number / 10;
	ldw	x, (0x09, sp)
	ldw	y, #0x000a
	divw	x, y
	ldw	(0x09, sp), x
;	lib/src/stm8s_mylib.c: 690: ++count;
	inc	(0x0c, sp)
	jra	00103$
00105$:
;	lib/src/stm8s_mylib.c: 692: SD1106_sendCom(PAGESTARTADDRESS | PAGES);
	ld	a, (0x08, sp)
	or	a, #0xb0
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 693: SD1106_sendCom(SETLOWCOLUMN | (Column & 0xf));
	ld	a, (0x0f, sp)
	ld	(0x0b, sp), a
	and	a, #0x0f
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 694: SD1106_sendCom(SETHIGHCOLUMN | ( (Column >> 4) & 0xf) );
	ld	a, (0x0b, sp)
	swap	a
	and	a, #15
	or	a, #0x10
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 695: i2c_start();
	call	_i2c_start
;	lib/src/stm8s_mylib.c: 696: i2c_write(OLED_ADDR);					// start transmission to OLED
	ld	a, #0x78
	call	_i2c_write
;	lib/src/stm8s_mylib.c: 697: i2c_write(OLED_DAT_MODE);
	ld	a, #0x40
	call	_i2c_write
;	lib/src/stm8s_mylib.c: 698: while (count != 0)
	ld	a, (0x0c, sp)
	ld	(0x0b, sp), a
00107$:
	tnz	(0x0b, sp)
	jreq	00109$
;	lib/src/stm8s_mylib.c: 700: offset = mang[count - 1] + 16;
	ld	a, (0x0b, sp)
	dec	a
	ld	(0x02, sp), a
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	(0x01, sp), a
	ldw	x, sp
	addw	x, #3
	addw	x, (0x01, sp)
	ld	a, (x)
	clrw	x
	ld	xl, a
	addw	x, #0x0010
;	lib/src/stm8s_mylib.c: 701: offset += offset << 2;
	ldw	(0x01, sp), x
	sllw	x
	sllw	x
	addw	x, (0x01, sp)
;	lib/src/stm8s_mylib.c: 702: i2c_write(0x00);
	pushw	x
	clr	a
	call	_i2c_write
	popw	x
;	lib/src/stm8s_mylib.c: 703: for (unsigned char i = 5; i; i--)
	ld	a, #0x05
	ld	(0x0c, sp), a
00111$:
	tnz	(0x0c, sp)
	jreq	00106$
;	lib/src/stm8s_mylib.c: 705: i2c_write(OLED_FONT[offset++]);
	ldw	y, x
	addw	y, #(_OLED_FONT+0)
	incw	x
	ld	a, (y)
	pushw	x
	call	_i2c_write
	popw	x
;	lib/src/stm8s_mylib.c: 703: for (unsigned char i = 5; i; i--)
	dec	(0x0c, sp)
	jra	00111$
00106$:
;	lib/src/stm8s_mylib.c: 707: --count;
	dec	(0x0b, sp)
	jra	00107$
00109$:
;	lib/src/stm8s_mylib.c: 709: i2c_stop();
	call	_i2c_stop
;	lib/src/stm8s_mylib.c: 710: }
	addw	sp, #12
	popw	x
	pop	a
	jp	(x)
;	lib/src/stm8s_mylib.c: 711: void SD1106_printBigNum(uint8_t Num, uint8_t Column){
;	-----------------------------------------
;	 function SD1106_printBigNum
;	-----------------------------------------
_SD1106_printBigNum:
	sub	sp, #8
;	lib/src/stm8s_mylib.c: 712: uint16_t offset = (Num << 2) + Num;			
	ld	(0x08, sp), a
	clr	(0x07, sp)
	ldw	x, (0x07, sp)
	sllw	x
	sllw	x
	addw	x, (0x07, sp)
;	lib/src/stm8s_mylib.c: 713: for(uint8_t i=3;  i< 8; ++i){
	ld	a, (0x0b, sp)
	push	a
	and	a, #0x0f
	ld	(0x02, sp), a
	pop	a
	swap	a
	and	a, #15
	or	a, #0x10
	ld	(0x02, sp), a
	ldw	(0x05, sp), x
	ld	a, #0x03
	ld	(0x07, sp), a
00118$:
	ld	a, (0x07, sp)
	cp	a, #0x08
	jrnc	00120$
;	lib/src/stm8s_mylib.c: 714: SD1106_sendCom(PAGESTARTADDRESS | i);
	ld	a, (0x07, sp)
	or	a, #0xb0
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 715: SD1106_sendCom(SETLOWCOLUMN | (Column & 0xf));
	ld	a, (0x01, sp)
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 716: SD1106_sendCom(SETHIGHCOLUMN | ( (Column >> 4) & 0xf) );
	ld	a, (0x02, sp)
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 717: i2c_start();
	call	_i2c_start
;	lib/src/stm8s_mylib.c: 718: i2c_write(OLED_ADDR);					// start transmission to OLED
	ld	a, #0x78
	call	_i2c_write
;	lib/src/stm8s_mylib.c: 719: i2c_write(OLED_DAT_MODE);
	ld	a, #0x40
	call	_i2c_write
;	lib/src/stm8s_mylib.c: 720: for(uint8_t z=0; z<3; ++z){
	ldw	x, (0x05, sp)
	addw	x, #(_OLED_FONT_BIG+0)
	ldw	(0x03, sp), x
	clr	(0x08, sp)
00115$:
	ld	a, (0x08, sp)
	cp	a, #0x03
	jrnc	00106$
;	lib/src/stm8s_mylib.c: 721: if( ((OLED_FONT_BIG[offset]) >> (2 - z)) & 0b1 ) {
	ldw	x, (0x03, sp)
	ld	a, (x)
	ld	xl, a
	ld	a, #0x02
	sub	a, (0x08, sp)
	jreq	00174$
00173$:
	exg	a, xl
	srl	a
	exg	a, xl
	dec	a
	jrne	00173$
00174$:
	srlw	x
	jrnc	00128$
;	lib/src/stm8s_mylib.c: 722: for(uint8_t t=5; t; t--) i2c_write(0xff); // print character
	ld	a, #0x05
00109$:
	tnz	a
	jreq	00116$
	push	a
	ld	a, #0xff
	call	_i2c_write
	pop	a
	dec	a
	jra	00109$
;	lib/src/stm8s_mylib.c: 724: for(uint8_t t=5; t; t--) i2c_write(0x00); // print character
00128$:
	ld	a, #0x05
00112$:
	tnz	a
	jreq	00116$
	push	a
	clr	a
	call	_i2c_write
	pop	a
	dec	a
	jra	00112$
00116$:
;	lib/src/stm8s_mylib.c: 720: for(uint8_t z=0; z<3; ++z){
	inc	(0x08, sp)
	jra	00115$
00106$:
;	lib/src/stm8s_mylib.c: 728: offset++;
	ldw	x, (0x05, sp)
	incw	x
	ldw	(0x05, sp), x
;	lib/src/stm8s_mylib.c: 729: i2c_stop();
	call	_i2c_stop
;	lib/src/stm8s_mylib.c: 713: for(uint8_t i=3;  i< 8; ++i){
	inc	(0x07, sp)
	jra	00118$
00120$:
;	lib/src/stm8s_mylib.c: 731: }
	addw	sp, #8
	popw	x
	pop	a
	jp	(x)
;	lib/src/stm8s_mylib.c: 732: void SD1106_printBigPoint(uint8_t Column){		
;	-----------------------------------------
;	 function SD1106_printBigPoint
;	-----------------------------------------
_SD1106_printBigPoint:
	sub	sp, #4
;	lib/src/stm8s_mylib.c: 733: for(uint8_t i=3;  i< 8; ++i){
	push	a
	and	a, #0x0f
	ld	(0x02, sp), a
	pop	a
	swap	a
	and	a, #15
	or	a, #0x10
	ld	(0x02, sp), a
	ld	a, #0x03
	ld	(0x04, sp), a
00114$:
	ld	a, (0x04, sp)
	cp	a, #0x08
	jrnc	00116$
;	lib/src/stm8s_mylib.c: 734: SD1106_sendCom(PAGESTARTADDRESS | i);
	ld	a, (0x04, sp)
	or	a, #0xb0
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 735: SD1106_sendCom(SETLOWCOLUMN | (Column & 0xf));
	ld	a, (0x01, sp)
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 736: SD1106_sendCom(SETHIGHCOLUMN | ( (Column >> 4) & 0xf) );
	ld	a, (0x02, sp)
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 737: i2c_start();
	call	_i2c_start
;	lib/src/stm8s_mylib.c: 738: i2c_write(OLED_ADDR);					// start transmission to OLED
	ld	a, #0x78
	call	_i2c_write
;	lib/src/stm8s_mylib.c: 739: i2c_write(OLED_DAT_MODE);
	ld	a, #0x40
	call	_i2c_write
;	lib/src/stm8s_mylib.c: 741: if(i == 4 | i == 6){
	ld	a, (0x04, sp)
	sub	a, #0x04
	jrne	00158$
	inc	a
	ld	(0x03, sp), a
	.byte 0xc5
00158$:
	clr	(0x03, sp)
00159$:
	ld	a, (0x04, sp)
	sub	a, #0x06
	jrne	00161$
	inc	a
	.byte 0x21
00161$:
	clr	a
00162$:
	or	a, (0x03, sp)
	jreq	00123$
;	lib/src/stm8s_mylib.c: 742: for(uint8_t t=5; t; t--) i2c_write(0xff); // print character
	ld	a, #0x05
00108$:
	tnz	a
	jreq	00105$
	push	a
	ld	a, #0xff
	call	_i2c_write
	pop	a
	dec	a
	jra	00108$
;	lib/src/stm8s_mylib.c: 744: for(uint8_t t=5; t; t--) i2c_write(0x00); // print character
00123$:
	ld	a, #0x05
00111$:
	tnz	a
	jreq	00105$
	push	a
	clr	a
	call	_i2c_write
	pop	a
	dec	a
	jra	00111$
00105$:
;	lib/src/stm8s_mylib.c: 746: i2c_stop();
	call	_i2c_stop
;	lib/src/stm8s_mylib.c: 733: for(uint8_t i=3;  i< 8; ++i){
	inc	(0x04, sp)
	jra	00114$
00116$:
;	lib/src/stm8s_mylib.c: 748: }
	addw	sp, #4
	ret
;	lib/src/stm8s_mylib.c: 750: void SD1106_printBigLine(uint8_t Column){		
;	-----------------------------------------
;	 function SD1106_printBigLine
;	-----------------------------------------
_SD1106_printBigLine:
	sub	sp, #3
;	lib/src/stm8s_mylib.c: 751: for(uint8_t i=3;  i< 8; ++i){
	push	a
	and	a, #0x0f
	ld	(0x02, sp), a
	pop	a
	swap	a
	and	a, #15
	or	a, #0x10
	ld	(0x02, sp), a
	ld	a, #0x03
	ld	(0x03, sp), a
00114$:
	ld	a, (0x03, sp)
	cp	a, #0x08
	jrnc	00116$
;	lib/src/stm8s_mylib.c: 752: SD1106_sendCom(PAGESTARTADDRESS | i);
	ld	a, (0x03, sp)
	or	a, #0xb0
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 753: SD1106_sendCom(SETLOWCOLUMN | (Column & 0xf));
	ld	a, (0x01, sp)
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 754: SD1106_sendCom(SETHIGHCOLUMN | ( (Column >> 4) & 0xf) );
	ld	a, (0x02, sp)
	call	_SD1106_sendCom
;	lib/src/stm8s_mylib.c: 755: i2c_start();
	call	_i2c_start
;	lib/src/stm8s_mylib.c: 756: i2c_write(OLED_ADDR);					// start transmission to OLED
	ld	a, #0x78
	call	_i2c_write
;	lib/src/stm8s_mylib.c: 757: i2c_write(OLED_DAT_MODE);
	ld	a, #0x40
	call	_i2c_write
;	lib/src/stm8s_mylib.c: 759: if(i == 5){
	ld	a, (0x03, sp)
	cp	a, #0x05
	jrne	00123$
;	lib/src/stm8s_mylib.c: 760: for(uint8_t t=5; t; t--) i2c_write(0xff); // print character
	ld	a, #0x05
00108$:
	tnz	a
	jreq	00105$
	push	a
	ld	a, #0xff
	call	_i2c_write
	pop	a
	dec	a
	jra	00108$
;	lib/src/stm8s_mylib.c: 762: for(uint8_t t=5; t; t--) i2c_write(0x00); // print character
00123$:
	ld	a, #0x05
00111$:
	tnz	a
	jreq	00105$
	push	a
	clr	a
	call	_i2c_write
	pop	a
	dec	a
	jra	00111$
00105$:
;	lib/src/stm8s_mylib.c: 764: i2c_stop();
	call	_i2c_stop
;	lib/src/stm8s_mylib.c: 751: for(uint8_t i=3;  i< 8; ++i){
	inc	(0x03, sp)
	jra	00114$
00116$:
;	lib/src/stm8s_mylib.c: 766: }
	addw	sp, #3
	ret
	.area CODE
	.area CONST
_OLED_FONT:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x7f	; 127
	.db #0x14	; 20
	.db #0x7f	; 127
	.db #0x14	; 20
	.db #0x24	; 36
	.db #0x2a	; 42
	.db #0x7f	; 127
	.db #0x2a	; 42
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
	.db #0x1c	; 28
	.db #0x22	; 34
	.db #0x41	; 65	'A'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x22	; 34
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x08	; 8
	.db #0x3e	; 62
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x3e	; 62
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xa0	; 160
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
	.db #0x3e	; 62
	.db #0x51	; 81	'Q'
	.db #0x49	; 73	'I'
	.db #0x45	; 69	'E'
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x7f	; 127
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
	.db #0x4b	; 75	'K'
	.db #0x31	; 49	'1'
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x12	; 18
	.db #0x7f	; 127
	.db #0x10	; 16
	.db #0x27	; 39
	.db #0x45	; 69	'E'
	.db #0x45	; 69	'E'
	.db #0x45	; 69	'E'
	.db #0x39	; 57	'9'
	.db #0x3c	; 60
	.db #0x4a	; 74	'J'
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
	.db #0x1e	; 30
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
	.db #0x3e	; 62
	.db #0x7c	; 124
	.db #0x12	; 18
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x7c	; 124
	.db #0x7f	; 127
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x36	; 54	'6'
	.db #0x3e	; 62
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x22	; 34
	.db #0x7f	; 127
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x22	; 34
	.db #0x1c	; 28
	.db #0x7f	; 127
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x41	; 65	'A'
	.db #0x7f	; 127
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0x3e	; 62
	.db #0x41	; 65	'A'
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x7a	; 122	'z'
	.db #0x7f	; 127
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x7f	; 127
	.db #0x41	; 65	'A'
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x41	; 65	'A'
	.db #0x3f	; 63
	.db #0x01	; 1
	.db #0x7f	; 127
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x22	; 34
	.db #0x41	; 65	'A'
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x02	; 2
	.db #0x0c	; 12
	.db #0x02	; 2
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x7f	; 127
	.db #0x3e	; 62
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x3e	; 62
	.db #0x7f	; 127
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x3e	; 62
	.db #0x41	; 65	'A'
	.db #0x51	; 81	'Q'
	.db #0x21	; 33
	.db #0x5e	; 94
	.db #0x7f	; 127
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
	.db #0x7f	; 127
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0x38	; 56	'8'
	.db #0x40	; 64
	.db #0x3f	; 63
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
	.db #0x7f	; 127
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
	.db #0x7f	; 127
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
_OLED_FONT_BIG:
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x07	; 7
_lacoVietNam:
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x1f	; 31
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x1f	; 31
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xf3	; 243
	.db #0xf3	; 243
	.db #0xe3	; 227
	.db #0xe3	; 227
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xe3	; 227
	.db #0xe3	; 227
	.db #0xf3	; 243
	.db #0xf3	; 243
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0x7e	; 126
	.db #0x1c	; 28
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x1c	; 28
	.db #0x7e	; 126
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0x8f	; 143
	.db #0xc3	; 195
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xc3	; 195
	.db #0x8f	; 143
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
_mixigamingLogo:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xd0	; 208
	.db #0xc8	; 200
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfa	; 250
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xe4	; 228
	.db #0xf8	; 248
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xf0	; 240
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x20	; 32
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xf0	; 240
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xe7	; 231
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x83	; 131
	.db #0xc3	; 195
	.db #0x63	; 99	'c'
	.db #0x33	; 51	'3'
	.db #0x37	; 55	'7'
	.db #0x17	; 23
	.db #0x97	; 151
	.db #0xf7	; 247
	.db #0xf3	; 243
	.db #0xe3	; 227
	.db #0xe3	; 227
	.db #0xc3	; 195
	.db #0x83	; 131
	.db #0xc3	; 195
	.db #0x63	; 99	'c'
	.db #0x33	; 51	'3'
	.db #0x1b	; 27
	.db #0x09	; 9
	.db #0xed	; 237
	.db #0xfd	; 253
	.db #0xfd	; 253
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0x19	; 25
	.db #0x71	; 113	'q'
	.db #0xe1	; 225
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x6e	; 110	'n'
	.db #0x9c	; 156
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x08	; 8
	.db #0x1b	; 27
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x39	; 57	'9'
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc3	; 195
	.db #0xc7	; 199
	.db #0x4f	; 79	'O'
	.db #0x67	; 103	'g'
	.db #0x33	; 51	'3'
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0xc1	; 193
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x83	; 131
	.db #0xc3	; 195
	.db #0xc1	; 193
	.db #0x60	; 96
	.db #0x38	; 56	'8'
	.db #0x0f	; 15
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x3f	; 63
	.db #0xf1	; 241
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0xf8	; 248
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xf0	; 240
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x1c	; 28
	.db #0x70	; 112	'p'
	.db #0xe0	; 224
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x0c	; 12
	.db #0x18	; 24
	.db #0x30	; 48	'0'
	.db #0x60	; 96
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x60	; 96
	.db #0x30	; 48	'0'
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xc3	; 195
	.db #0xe0	; 224
	.db #0x70	; 112	'p'
	.db #0x38	; 56	'8'
	.db #0x0e	; 14
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x0c	; 12
	.db #0x08	; 8
	.db #0x18	; 24
	.db #0x10	; 16
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x20	; 32
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x40	; 64
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x43	; 67	'C'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x62	; 98	'b'
	.db #0x62	; 98	'b'
	.db #0x63	; 99	'c'
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x30	; 48	'0'
	.db #0x10	; 16
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x08	; 8
	.db #0x0c	; 12
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_levelBAT_full:
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xbd	; 189
	.db #0xbd	; 189
	.db #0xbd	; 189
	.db #0x81	; 129
	.db #0xbd	; 189
	.db #0xbd	; 189
	.db #0xbd	; 189
	.db #0x81	; 129
	.db #0xbd	; 189
	.db #0xbd	; 189
	.db #0xbd	; 189
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x18	; 24
_levelBAT_Tb:
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xbd	; 189
	.db #0xbd	; 189
	.db #0xbd	; 189
	.db #0x81	; 129
	.db #0xbd	; 189
	.db #0xbd	; 189
	.db #0xbd	; 189
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x18	; 24
_rssi:
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0xfe	; 254
_station_icon:
	.db #0xfe	; 254
	.db #0x82	; 130
	.db #0xba	; 186
	.db #0x82	; 130
	.db #0xba	; 186
	.db #0x82	; 130
	.db #0xba	; 186
	.db #0x82	; 130
	.db #0xba	; 186
	.db #0xaa	; 170
	.db #0xaa	; 170
	.db #0xaa	; 170
	.db #0xaa	; 170
	.db #0xba	; 186
	.db #0x82	; 130
	.db #0xfe	; 254
_clock_icon:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x82	; 130
	.db #0x82	; 130
	.db #0x9a	; 154
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.area INITIALIZER
	.area CABS (ABS)
