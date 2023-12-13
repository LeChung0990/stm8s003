;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.0 #14184 (MINGW64)
;--------------------------------------------------------
	.module main
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _OLED_FONT
	.globl _OLED_INIT_CMD
	.globl _main
	.globl _I2C_stop
	.globl _I2C_write
	.globl _I2C_address
	.globl _I2C_start
	.globl _I2C_init
	.globl _delay_ms
	.globl _delay_msSetup
	.globl _GPIO_Init
	.globl _GPIO_DeInit
	.globl _CLK_HSIPrescalerConfig
	.globl _a
	.globl _ketqua
	.globl _i
	.globl _nut
	.globl _dem
	.globl _OLED_init
	.globl _OLED_printOneNumber
	.globl _OLED_printP
	.globl _OLED_cursor
	.globl _OLED_clear
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
_dem::
	.ds 1
_nut::
	.ds 1
_i::
	.ds 2
_ketqua::
	.ds 1
_a::
	.ds 6
;--------------------------------------------------------
; Stack segment in internal ram
;--------------------------------------------------------
	.area SSEG
__start__stack:
	.ds	1

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
; interrupt vector
;--------------------------------------------------------
	.area HOME
__interrupt_vect:
	int s_GSINIT ; reset
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
	call	___sdcc_external_startup
	tnz	a
	jreq	__sdcc_init_data
	jp	__sdcc_program_startup
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
;	main.c: 99: void main (void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	main.c: 101: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
	clr	a
	call	_CLK_HSIPrescalerConfig
;	main.c: 102: GPIO_DeInit(GPIOB);
	ldw	x, #0x5005
	call	_GPIO_DeInit
;	main.c: 103: GPIO_Init(GPIOB, GPIO_PIN_4, GPIO_MODE_OUT_OD_HIZ_SLOW);
	push	#0x90
	ld	a, #0x10
	ldw	x, #0x5005
	call	_GPIO_Init
;	main.c: 104: GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_OUT_OD_HIZ_SLOW);
	push	#0x90
	ld	a, #0x20
	ldw	x, #0x5005
	call	_GPIO_Init
;	main.c: 106: I2C_init(I2C_CLOCK, OLED_I2C_ADDR);
	push	#0x78
	push	#0xa0
	push	#0x86
	push	#0x01
	push	#0x00
	call	_I2C_init
;	main.c: 107: delay_msSetup();
	call	_delay_msSetup
;	main.c: 108: OLED_init();
	call	_OLED_init
;	main.c: 127: OLED_cursor(0,0);
	push	#0x00
	clr	a
	call	_OLED_cursor
;	main.c: 128: OLED_printP(a);
	ldw	x, #(_a+0)
	call	_OLED_printP
;	main.c: 129: OLED_cursor(0,2);
	push	#0x02
	clr	a
	call	_OLED_cursor
;	main.c: 130: OLED_printP(a);
	ldw	x, #(_a+0)
	call	_OLED_printP
;	main.c: 131: delay_ms(10);
	ldw	x, #0x000a
	call	_delay_ms
;	main.c: 132: OLED_clear();
	call	_OLED_clear
;	main.c: 133: while(1) 
00102$:
;	main.c: 135: OLED_cursor(0,0);
	push	#0x00
	clr	a
	call	_OLED_cursor
;	main.c: 136: OLED_printP(a);
	ldw	x, #(_a+0)
	call	_OLED_printP
;	main.c: 137: delay_ms(1000);
	ldw	x, #0x03e8
	call	_delay_ms
;	main.c: 138: OLED_clear();
	call	_OLED_clear
	jra	00102$
;	main.c: 154: }
	ret
;	main.c: 193: void OLED_init(void)
;	-----------------------------------------
;	 function OLED_init
;	-----------------------------------------
_OLED_init:
	push	a
;	main.c: 195: I2C_start();
	call	_I2C_start
;	main.c: 196: I2C_address(OLED_I2C_ADDR, OLED_CMD_MODE);
	push	#0x00
	ld	a, #0x78
	call	_I2C_address
;	main.c: 197: for (uint8_t i = 0;i < 12;i++)
	clr	(0x01, sp)
00103$:
	ld	a, (0x01, sp)
	cp	a, #0x0c
	jrnc	00101$
;	main.c: 199: I2C_write(OLED_INIT_CMD[i]);
	clrw	x
	ld	a, (0x01, sp)
	ld	xl, a
	addw	x, #(_OLED_INIT_CMD+0)
	ld	a, (x)
	call	_I2C_write
;	main.c: 197: for (uint8_t i = 0;i < 12;i++)
	inc	(0x01, sp)
	jra	00103$
00101$:
;	main.c: 201: I2C_stop();
	pop	a
	jp	_I2C_stop
;	main.c: 202: }
	pop	a
	ret
;	main.c: 203: void OLED_printOneNumber(uint8_t num)
;	-----------------------------------------
;	 function OLED_printOneNumber
;	-----------------------------------------
_OLED_printOneNumber:
	sub	sp, #2
;	main.c: 205: uint16_t offset = num + 16;
	clrw	x
	ld	xl, a
	addw	x, #0x0010
;	main.c: 206: offset += offset << 2;
	ldw	(0x01, sp), x
	sllw	x
	sllw	x
	addw	x, (0x01, sp)
	ldw	(0x01, sp), x
;	main.c: 207: I2C_start();
	call	_I2C_start
;	main.c: 208: I2C_address(OLED_I2C_ADDR, OLED_DAT_MODE);
	push	#0x40
	ld	a, #0x78
	call	_I2C_address
;	main.c: 209: I2C_write(0x00);
	clr	a
	call	_I2C_write
;	main.c: 210: for(uint8_t i = 5; i;i--){ I2C_write(OLED_FONT[offset++]); }
	ldw	x, (0x01, sp)
	ld	a, #0x05
	ld	(0x02, sp), a
00103$:
	tnz	(0x02, sp)
	jreq	00101$
	ldw	y, x
	addw	y, #(_OLED_FONT+0)
	incw	x
	ld	a, (y)
	pushw	x
	call	_I2C_write
	popw	x
	dec	(0x02, sp)
	jra	00103$
00101$:
;	main.c: 211: I2C_stop();
	addw	sp, #2
;	main.c: 212: }
	jp	_I2C_stop
;	main.c: 213: void OLED_printP(const char *p)
;	-----------------------------------------
;	 function OLED_printP
;	-----------------------------------------
_OLED_printP:
	sub	sp, #7
	ldw	(0x03, sp), x
;	main.c: 215: I2C_start();
	call	_I2C_start
;	main.c: 216: I2C_address(OLED_I2C_ADDR, OLED_DAT_MODE);
	push	#0x40
	ld	a, #0x78
	call	_I2C_address
;	main.c: 217: while (*p)
	ldw	y, (0x03, sp)
	ldw	(0x05, sp), y
00102$:
	ldw	x, (0x05, sp)
	ld	a, (x)
	ld	(0x07, sp), a
	jreq	00104$
;	main.c: 219: uint16_t offset = *p - 32;
	ld	a, (0x07, sp)
	clrw	x
	ld	xl, a
	subw	x, #0x0020
;	main.c: 220: offset += offset << 2;
	ldw	(0x01, sp), x
	sllw	x
	sllw	x
	addw	x, (0x01, sp)
;	main.c: 221: I2C_write(0x00);
	pushw	x
	clr	a
	call	_I2C_write
	popw	x
;	main.c: 222: for(uint8_t i = 5; i;i--){ I2C_write(OLED_FONT[offset++]); }
	ld	a, #0x05
	ld	(0x07, sp), a
00106$:
	tnz	(0x07, sp)
	jreq	00101$
	ldw	y, x
	addw	y, #(_OLED_FONT+0)
	incw	x
	ld	a, (y)
	pushw	x
	call	_I2C_write
	popw	x
	dec	(0x07, sp)
	jra	00106$
00101$:
;	main.c: 223: p++;
	ldw	x, (0x05, sp)
	incw	x
	ldw	(0x05, sp), x
	jra	00102$
00104$:
;	main.c: 225: I2C_stop();
	addw	sp, #7
;	main.c: 226: }
	jp	_I2C_stop
;	main.c: 227: void OLED_cursor(uint8_t xpos, uint8_t ypos)
;	-----------------------------------------
;	 function OLED_cursor
;	-----------------------------------------
_OLED_cursor:
	push	a
	ld	(0x01, sp), a
;	main.c: 229: I2C_start();
	call	_I2C_start
;	main.c: 230: I2C_address(OLED_I2C_ADDR, OLED_CMD_MODE);
	push	#0x00
	ld	a, #0x78
	call	_I2C_address
;	main.c: 231: I2C_write(xpos & 0x0F);
	ld	a, (0x01, sp)
	and	a, #0x0f
	call	_I2C_write
;	main.c: 232: I2C_write(0x10 | (xpos >> 4));
	ld	a, (0x01, sp)
	swap	a
	and	a, #0x0f
	or	a, #0x10
	call	_I2C_write
;	main.c: 233: I2C_write(0xB0 | (ypos & 0x07));
	ld	a, (0x04, sp)
	and	a, #0x07
	or	a, #0xb0
	call	_I2C_write
;	main.c: 234: I2C_stop();
	ldw	x, (2, sp)
	ldw	(3, sp), x
	addw	sp, #2
	jp	_I2C_stop
;	main.c: 235: }
	pop	a
	popw	x
	pop	a
	jp	(x)
;	main.c: 236: void OLED_clear(void)
;	-----------------------------------------
;	 function OLED_clear
;	-----------------------------------------
_OLED_clear:
;	main.c: 238: OLED_cursor(0,0);
	push	#0x00
	clr	a
	call	_OLED_cursor
;	main.c: 239: I2C_start();
	call	_I2C_start
;	main.c: 240: I2C_address(OLED_I2C_ADDR, OLED_DAT_MODE);
	push	#0x40
	ld	a, #0x78
	call	_I2C_address
;	main.c: 241: for (uint16_t i=0;i<512;i++)
	clrw	x
00103$:
	ldw	y, x
	cpw	y, #0x0200
	jrc	00118$
	jp	_I2C_stop
00118$:
;	main.c: 243: I2C_write(0x00);
	pushw	x
	clr	a
	call	_I2C_write
	popw	x
;	main.c: 241: for (uint16_t i=0;i<512;i++)
	incw	x
;	main.c: 245: I2C_stop();
;	main.c: 246: }
	jra	00103$
	.area CODE
	.area CONST
_OLED_INIT_CMD:
	.db #0xa8	; 168
	.db #0x1f	; 31
	.db #0xd3	; 211
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0xda	; 218
	.db #0x12	; 18
	.db #0x8d	; 141
	.db #0x10	; 16
	.db #0xaf	; 175
	.db #0xa1	; 161
	.db #0xc8	; 200
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
	.area INITIALIZER
__xinit__dem:
	.db #0x00	; 0
__xinit__nut:
	.db #0x00	; 0
__xinit__i:
	.dw #0x0000
__xinit__ketqua:
	.db #0x00	; 0
__xinit__a:
	.ascii "CHUNG"
	.db 0x00
	.area CABS (ABS)
