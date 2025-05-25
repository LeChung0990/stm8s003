;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Apr  3 2018) (Linux)
; This file was generated Tue Feb 11 21:31:46 2025
;--------------------------------------------------------
	.module main
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _DS18x20_ReadTemp
	.globl _OneWireReadByte
	.globl _OneWireWriteByte
	.globl _OneWireReset
	.globl _TM1637_clear
	.globl _TM1637_DISPLAY_DIGIT
	.globl _TM1637_INIT
	.globl _delay_us
	.globl _GPIO_Init
	.globl _CLK_HSIPrescalerConfig
	.globl _chuctp
	.globl _tramtp
	.globl _donvi
	.globl _chuc
	.globl _temp
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_temp::
	.ds 4
_chuc::
	.ds 1
_donvi::
	.ds 1
_tramtp::
	.ds 1
_chuctp::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
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
;	main.c: 37: void DS18x20_ReadTemp(void) {
;	-----------------------------------------
;	 function DS18x20_ReadTemp
;	-----------------------------------------
_DS18x20_ReadTemp:
	sub	sp, #5
;	main.c: 41: OneWireReset();                       // Reset Pulse
	call	_OneWireReset
;	main.c: 42: OneWireWriteByte(SKIP_ROM);           // Issue skip ROM command (CCh)
	push	#0xcc
	call	_OneWireWriteByte
	pop	a
;	main.c: 43: OneWireWriteByte(CONVERT_T);          // Convert T command (44h)
	push	#0x44
	call	_OneWireWriteByte
	pop	a
;	main.c: 44: while(!OW_PIN_VALUE());               // DQ will hold line low while making measurement
00101$:
	ldw	x, #0x500b
	ld	a, (x)
	bcp	a, #0x10
	jreq	00101$
;	main.c: 45: OneWireReset();                       // Start new command sequence
	call	_OneWireReset
;	main.c: 46: OneWireWriteByte(SKIP_ROM);           // Issue skip ROM command
	push	#0xcc
	call	_OneWireWriteByte
	pop	a
;	main.c: 47: OneWireWriteByte(READ_SCRATCHPAD);    // Read Scratchpad (BEh) - 15 bits
	push	#0xbe
	call	_OneWireWriteByte
	pop	a
;	main.c: 48: LSB = OneWireReadByte();
	call	_OneWireReadByte
	ld	(0x01, sp), a
;	main.c: 49: MSB = OneWireReadByte();
	call	_OneWireReadByte
;	main.c: 50: OneWireReset();                       // Stop Reading
	push	a
	call	_OneWireReset
	pop	a
;	main.c: 52: temp = (((MSB << 8) | LSB)/ 16.0);
	ld	xh, a
	clr	a
	clr	(0x05, sp)
	ld	a, (0x01, sp)
	clr	(0x02, sp)
	or	a, (0x05, sp)
	rlwa	x
	or	a, (0x02, sp)
	ld	xh, a
	pushw	x
	call	___sint2fs
	addw	sp, #2
	push	#0x00
	push	#0x00
	push	#0x80
	push	#0x41
	pushw	x
	pushw	y
	call	___fsdiv
	addw	sp, #8
	ldw	_temp+2, x
	ldw	_temp+0, y
	addw	sp, #5
	ret
;	main.c: 56: void main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	main.c: 59: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV2);
	push	#0x08
	call	_CLK_HSIPrescalerConfig
	pop	a
;	main.c: 63: GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_OUT_OD_LOW_FAST);
	push	#0xa0
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 66: TM1637_INIT(1, 1);
	push	#0x01
	push	#0x01
	call	_TM1637_INIT
	addw	sp, #2
;	main.c: 67: TM1637_clear();
	call	_TM1637_clear
;	main.c: 69: while (1)
00102$:
;	main.c: 72: LED_PORT->ODR ^= (uint8_t)LED_PIN;
	ldw	x, #0x5005
	ld	a, (x)
	xor	a, #0x20
	ld	(x), a
;	main.c: 73: DS18x20_ReadTemp();
	call	_DS18x20_ReadTemp
;	main.c: 74: delay_us(65000);
	push	#0xe8
	push	#0xfd
	call	_delay_us
	addw	sp, #2
;	main.c: 75: chuc = (uint8_t) (temp / 10.0) % 10;
	clrw	x
	pushw	x
	push	#0x20
	push	#0x41
	push	_temp+3
	push	_temp+2
	push	_temp+1
	push	_temp+0
	call	___fsdiv
	addw	sp, #8
	pushw	x
	pushw	y
	call	___fs2uchar
	addw	sp, #4
	clrw	x
	ld	xl, a
	ld	a, #0x0a
	div	x, a
	ld	_chuc+0, a
;	main.c: 76: donvi = (uint8_t) (temp / 1.0) % 10;
	ldw	y, _temp+2
	ldw	x, _temp+0
	pushw	y
	pushw	x
	call	___fs2uchar
	addw	sp, #4
	clrw	x
	ld	xl, a
	ld	a, #0x0a
	div	x, a
	ld	_donvi+0, a
;	main.c: 77: chuctp = (uint8_t) (temp * 10.0) % 10;
	push	_temp+3
	push	_temp+2
	push	_temp+1
	push	_temp+0
	clrw	x
	pushw	x
	push	#0x20
	push	#0x41
	call	___fsmul
	addw	sp, #8
	pushw	x
	pushw	y
	call	___fs2uchar
	addw	sp, #4
	clrw	x
	ld	xl, a
	ld	a, #0x0a
	div	x, a
	ld	_chuctp+0, a
;	main.c: 78: tramtp = (uint8_t) (temp * 100.0) % 10;
	push	_temp+3
	push	_temp+2
	push	_temp+1
	push	_temp+0
	clrw	x
	pushw	x
	push	#0xc8
	push	#0x42
	call	___fsmul
	addw	sp, #8
	pushw	x
	pushw	y
	call	___fs2uchar
	addw	sp, #4
	clrw	x
	ld	xl, a
	ld	a, #0x0a
	div	x, a
	ld	_tramtp+0, a
;	main.c: 79: TM1637_DISPLAY_DIGIT(0x00, chuc);
	push	_chuc+0
	push	#0x00
	call	_TM1637_DISPLAY_DIGIT
	addw	sp, #2
;	main.c: 80: TM1637_DISPLAY_DIGIT(0x01, donvi);
	push	_donvi+0
	push	#0x01
	call	_TM1637_DISPLAY_DIGIT
	addw	sp, #2
;	main.c: 81: TM1637_DISPLAY_DIGIT(0x02, chuctp);
	push	_chuctp+0
	push	#0x02
	call	_TM1637_DISPLAY_DIGIT
	addw	sp, #2
;	main.c: 82: TM1637_DISPLAY_DIGIT(0x03, tramtp);
	push	_tramtp+0
	push	#0x03
	call	_TM1637_DISPLAY_DIGIT
	addw	sp, #2
	jp	00102$
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
