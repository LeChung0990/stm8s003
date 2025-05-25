;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Apr  3 2018) (Linux)
; This file was generated Tue Feb 11 21:25:57 2025
;--------------------------------------------------------
	.module tm1637
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __digit2segments
	.globl _SEND_WRITE
	.globl _SEND_START
	.globl _SEND_STOP
	.globl _delay_us
	.globl _GPIO_WriteLow
	.globl _GPIO_WriteHigh
	.globl _GPIO_Init
	.globl _TM1637_SEND_COMMAND
	.globl _TM1637_SEND_CONFIG
	.globl _TM1637_INIT
	.globl _TM1637_display_segments
	.globl _TM1637_DISPLAY_DIGIT
	.globl _TM1637_clear
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
__config:
	.ds 1
__segments:
	.ds 1
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)
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
;	lib/src/tm1637.c: 42: void SEND_STOP(void)
;	-----------------------------------------
;	 function SEND_STOP
;	-----------------------------------------
_SEND_STOP:
;	lib/src/tm1637.c: 44: DIO_0; I2C_DELAY;  
	push	#0x80
	push	#0x0a
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
	push	#0x02
	push	#0x00
	call	_delay_us
	addw	sp, #2
;	lib/src/tm1637.c: 45: CLK_1; I2C_DELAY;
	push	#0x40
	push	#0x0a
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
	push	#0x02
	push	#0x00
	call	_delay_us
	addw	sp, #2
;	lib/src/tm1637.c: 46: DIO_1; I2C_DELAY;
	push	#0x80
	push	#0x0a
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
	push	#0x02
	push	#0x00
	call	_delay_us
	addw	sp, #2
	ret
;	lib/src/tm1637.c: 48: void SEND_START(void)
;	-----------------------------------------
;	 function SEND_START
;	-----------------------------------------
_SEND_START:
;	lib/src/tm1637.c: 50: CLK_1; I2C_DELAY;
	push	#0x40
	push	#0x0a
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
	push	#0x02
	push	#0x00
	call	_delay_us
	addw	sp, #2
;	lib/src/tm1637.c: 51: DIO_1; I2C_DELAY;
	push	#0x80
	push	#0x0a
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
	push	#0x02
	push	#0x00
	call	_delay_us
	addw	sp, #2
;	lib/src/tm1637.c: 52: DIO_0; I2C_DELAY;
	push	#0x80
	push	#0x0a
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
	push	#0x02
	push	#0x00
	call	_delay_us
	addw	sp, #2
;	lib/src/tm1637.c: 53: CLK_0; I2C_DELAY;
	push	#0x40
	push	#0x0a
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
	push	#0x02
	push	#0x00
	call	_delay_us
	addw	sp, #2
	ret
;	lib/src/tm1637.c: 55: uint8_t SEND_WRITE(uint8_t data)
;	-----------------------------------------
;	 function SEND_WRITE
;	-----------------------------------------
_SEND_WRITE:
	push	a
;	lib/src/tm1637.c: 59: for (i = 0; i < 8; ++i)
	clr	(0x01, sp)
00108$:
;	lib/src/tm1637.c: 61: if (data & 0x01) {DIO_1;}
	ld	a, (0x04, sp)
	srl	a
	jrnc	00102$
	push	#0x80
	push	#0x0a
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
	jra	00103$
00102$:
;	lib/src/tm1637.c: 62: else {DIO_0;}
	push	#0x80
	push	#0x0a
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
00103$:
;	lib/src/tm1637.c: 63: I2C_DELAY;	
	push	#0x02
	push	#0x00
	call	_delay_us
	addw	sp, #2
;	lib/src/tm1637.c: 64: CLK_1;
	push	#0x40
	push	#0x0a
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	lib/src/tm1637.c: 65: I2C_DELAY;
	push	#0x02
	push	#0x00
	call	_delay_us
	addw	sp, #2
;	lib/src/tm1637.c: 66: CLK_0;
	push	#0x40
	push	#0x0a
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	lib/src/tm1637.c: 67: data >>= 1;	//1.37u
	srl	(0x04, sp)
;	lib/src/tm1637.c: 59: for (i = 0; i < 8; ++i)
	inc	(0x01, sp)
	ld	a, (0x01, sp)
	cp	a, #0x08
	jrc	00108$
;	lib/src/tm1637.c: 70: DIO_0;
	push	#0x80
	push	#0x0a
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	lib/src/tm1637.c: 71: I2C_DELAY;
	push	#0x02
	push	#0x00
	call	_delay_us
	addw	sp, #2
;	lib/src/tm1637.c: 73: CLK_1;
	push	#0x40
	push	#0x0a
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	lib/src/tm1637.c: 74: I2C_DELAY;
	push	#0x02
	push	#0x00
	call	_delay_us
	addw	sp, #2
;	lib/src/tm1637.c: 75: CLK_0;
	push	#0x40
	push	#0x0a
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	lib/src/tm1637.c: 76: I2C_DELAY;
	push	#0x02
	push	#0x00
	call	_delay_us
	addw	sp, #2
;	lib/src/tm1637.c: 83: I2C_DELAY;
	push	#0x02
	push	#0x00
	call	_delay_us
	addw	sp, #2
;	lib/src/tm1637.c: 85: return result;
	clr	a
	addw	sp, #1
	ret
;	lib/src/tm1637.c: 88: void TM1637_SEND_COMMAND(const uint8_t value)
;	-----------------------------------------
;	 function TM1637_SEND_COMMAND
;	-----------------------------------------
_TM1637_SEND_COMMAND:
;	lib/src/tm1637.c: 90: SEND_START();
	call	_SEND_START
;	lib/src/tm1637.c: 91: SEND_WRITE(value);
	ld	a, (0x03, sp)
	push	a
	call	_SEND_WRITE
	pop	a
;	lib/src/tm1637.c: 92: SEND_STOP();
	jp	_SEND_STOP
;	lib/src/tm1637.c: 95: void TM1637_SEND_CONFIG(const uint8_t enable, const uint8_t brightness)
;	-----------------------------------------
;	 function TM1637_SEND_CONFIG
;	-----------------------------------------
_TM1637_SEND_CONFIG:
	push	a
;	lib/src/tm1637.c: 98: _config = (enable ? TM1637_SET_DISPLAY_ON : TM1637_SET_DISPLAY_OFF) |
	tnz	(0x04, sp)
	jreq	00103$
	ld	a, #0x08
	ld	(0x01, sp), a
	jra	00104$
00103$:
	clr	(0x01, sp)
00104$:
;	lib/src/tm1637.c: 99: (brightness > TM1637_BRIGHTNESS_MAX ? TM1637_BRIGHTNESS_MAX : brightness);
	ld	a, (0x05, sp)
	cp	a, #0x07
	jrule	00105$
	ld	a, #0x07
	jra	00106$
00105$:
	ld	a, (0x05, sp)
00106$:
	or	a, (0x01, sp)
;	lib/src/tm1637.c: 101: TM1637_SEND_COMMAND(TM1637_CMD_SET_DSIPLAY | _config);
	ld	__config+0, a
	or	a, #0x80
	push	a
	call	_TM1637_SEND_COMMAND
	pop	a
	pop	a
	ret
;	lib/src/tm1637.c: 104: void TM1637_INIT(uint8_t enable, const uint8_t brightness)
;	-----------------------------------------
;	 function TM1637_INIT
;	-----------------------------------------
_TM1637_INIT:
;	lib/src/tm1637.c: 106: GPIO_Init(GPIOC, PIN_CLK | PIN_DIO, GPIO_MODE_OUT_OD_HIZ_FAST);
	push	#0xb0
	push	#0xc0
	push	#0x0a
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	lib/src/tm1637.c: 111: TM1637_SEND_CONFIG(enable, brightness);
	ld	a, (0x04, sp)
	push	a
	ld	a, (0x04, sp)
	push	a
	call	_TM1637_SEND_CONFIG
	addw	sp, #2
	ret
;	lib/src/tm1637.c: 113: void TM1637_display_segments(const uint8_t position, const uint8_t segments)
;	-----------------------------------------
;	 function TM1637_display_segments
;	-----------------------------------------
_TM1637_display_segments:
;	lib/src/tm1637.c: 115: TM1637_SEND_COMMAND(TM1637_CMD_SET_DATA | TM1637_SET_DATA_F_ADDR);
	push	#0x44
	call	_TM1637_SEND_COMMAND
	pop	a
;	lib/src/tm1637.c: 116: SEND_START();
	call	_SEND_START
;	lib/src/tm1637.c: 117: SEND_WRITE(TM1637_CMD_SET_ADDR | (position & (TM1637_POSITION_MAX - 1)));
	ld	a, (0x03, sp)
	and	a, #0x03
	or	a, #0xc0
	push	a
	call	_SEND_WRITE
	pop	a
;	lib/src/tm1637.c: 118: SEND_WRITE(segments);
	ld	a, (0x04, sp)
	push	a
	call	_SEND_WRITE
	pop	a
;	lib/src/tm1637.c: 119: SEND_STOP();
	jp	_SEND_STOP
;	lib/src/tm1637.c: 123: void TM1637_DISPLAY_DIGIT(const uint8_t position, const uint8_t digit)
;	-----------------------------------------
;	 function TM1637_DISPLAY_DIGIT
;	-----------------------------------------
_TM1637_DISPLAY_DIGIT:
	push	a
;	lib/src/tm1637.c: 126: if (digit < 10)
	ld	a, (0x05, sp)
	cp	a, #0x0a
	jrnc	00102$
;	lib/src/tm1637.c: 128: segments = _digit2segments[digit];
	ldw	x, #__digit2segments+0
	ld	a, xl
	add	a, (0x05, sp)
	rlwa	x
	adc	a, #0x00
	ld	xh, a
	ld	a, (x)
;	lib/src/tm1637.c: 131: segments = 0x00;	
	.byte 0x21
00102$:
	clr	a
00103$:
;	lib/src/tm1637.c: 133: if (position == 1) {
	push	a
	ld	a, (0x05, sp)
	cp	a, #0x01
	pop	a
	jrne	00105$
;	lib/src/tm1637.c: 134: segments = segments | (_segments & 0x80);
	push	a
	ld	a, __segments+0
	and	a, #0x80
	ld	(0x02, sp), a
	pop	a
	or	a, (0x01, sp)
;	lib/src/tm1637.c: 135: _segments = segments;
	ld	__segments+0, a
00105$:
;	lib/src/tm1637.c: 137: TM1637_display_segments(position, segments);
	push	a
	ld	a, (0x05, sp)
	push	a
	call	_TM1637_display_segments
	addw	sp, #3
	ret
;	lib/src/tm1637.c: 140: void TM1637_clear(void)
;	-----------------------------------------
;	 function TM1637_clear
;	-----------------------------------------
_TM1637_clear:
;	lib/src/tm1637.c: 144: for (i = 0; i < TM1637_POSITION_MAX; ++i) {
	clr	a
00102$:
;	lib/src/tm1637.c: 145: TM1637_display_segments(i, 0x00);
	push	a
	push	#0x00
	push	a
	call	_TM1637_display_segments
	addw	sp, #2
	pop	a
;	lib/src/tm1637.c: 144: for (i = 0; i < TM1637_POSITION_MAX; ++i) {
	inc	a
	cp	a, #0x04
	jrc	00102$
	ret
	.area CODE
__digit2segments:
	.db #0x3F	; 63
	.db #0x06	; 6
	.db #0x5B	; 91
	.db #0x4F	; 79	'O'
	.db #0x66	; 102	'f'
	.db #0x6D	; 109	'm'
	.db #0x7D	; 125
	.db #0x07	; 7
	.db #0x7F	; 127
	.db #0x6F	; 111	'o'
	.area INITIALIZER
__xinit___config:
	.db #0x0F	; 15
__xinit___segments:
	.db #0xFF	; 255
	.area CABS (ABS)
