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
	.globl _I2C_GetFlagStatus
	.globl _I2C_CheckEvent
	.globl _I2C_SendData
	.globl _I2C_Send7bitAddress
	.globl _I2C_GenerateSTOP
	.globl _I2C_GenerateSTART
	.globl _I2C_Cmd
	.globl _I2C_Init
	.globl _I2C_DeInit
	.globl _CLK_GetClockFreq
	.globl _CLK_HSIPrescalerConfig
	.globl _CLK_PeripheralClockConfig
	.globl _I2C_init
	.globl _I2C_start
	.globl _I2C_address
	.globl _I2C_write
	.globl _I2C_stop
	.globl _OLED_init
	.globl _OLED_printC
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
;	main.c: 54: void main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	main.c: 56: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
	clr	a
	call	_CLK_HSIPrescalerConfig
;	main.c: 57: I2C_init();
	call	_I2C_init
;	main.c: 58: OLED_init();
	call	_OLED_init
;	main.c: 62: while(1) {
00103$:
;	main.c: 63: OLED_cursor(0,0);
	push	#0x00
	clr	a
	call	_OLED_cursor
;	main.c: 64: OLED_clear();
	call	_OLED_clear
;	main.c: 65: for (int i=13;i<23; i++)
	ldw	x, #0x000d
00106$:
	cpw	x, #0x0017
	jrsge	00101$
;	main.c: 67: OLED_printC(i);
	ld	a, xl
	pushw	x
	call	_OLED_printC
	popw	x
;	main.c: 65: for (int i=13;i<23; i++)
	incw	x
	jra	00106$
00101$:
;	main.c: 69: OLED_printC(21);
	ld	a, #0x15
	call	_OLED_printC
;	main.c: 70: OLED_printC(22);
	ld	a, #0x16
	call	_OLED_printC
;	main.c: 71: OLED_printC(16);
	ld	a, #0x10
	call	_OLED_printC
;	main.c: 72: OLED_printC(23);
	ld	a, #0x17
	call	_OLED_printC
;	main.c: 73: OLED_printC(14);
	ld	a, #0x0e
	call	_OLED_printC
;	main.c: 74: OLED_printC(21);
	ld	a, #0x15
	call	_OLED_printC
	jra	00103$
;	main.c: 77: }
	ret
;	main.c: 79: void I2C_init(void)
;	-----------------------------------------
;	 function I2C_init
;	-----------------------------------------
_I2C_init:
	push	a
;	main.c: 82: Input_Clock = CLK_GetClockFreq()/1000000;
	call	_CLK_GetClockFreq
	push	#0x40
	push	#0x42
	push	#0x0f
	push	#0x00
	pushw	x
	pushw	y
	call	__divulong
	addw	sp, #8
	ld	a, xl
	ld	(0x01, sp), a
;	main.c: 83: I2C_DeInit();
	call	_I2C_DeInit
;	main.c: 84: CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
	push	#0x01
	clr	a
	call	_CLK_PeripheralClockConfig
;	main.c: 85: I2C_Cmd( ENABLE);
	ld	a, #0x01
	call	_I2C_Cmd
;	main.c: 86: I2C_Init(DS1307_I2C_CLOCK, DS1307_I2C_ADDR, I2C_DUTYCYCLE_2, I2C_ACK_CURR, I2C_ADDMODE_7BIT, Input_Clock);
	ld	a, (0x01, sp)
	push	a
	push	#0x00
	push	#0x01
	push	#0x00
	push	#0x78
	push	#0x00
	push	#0xa0
	push	#0x86
	push	#0x01
	push	#0x00
	call	_I2C_Init
;	main.c: 87: }
	pop	a
	ret
;	main.c: 88: void I2C_start(void)
;	-----------------------------------------
;	 function I2C_start
;	-----------------------------------------
_I2C_start:
;	main.c: 91: while(I2C_GetFlagStatus( I2C_FLAG_BUSBUSY)==SET);
00101$:
	ldw	x, #0x0302
	call	_I2C_GetFlagStatus
	tnz	a
	jrne	00101$
;	main.c: 92: I2C_GenerateSTART(ENABLE);
	ld	a, #0x01
	call	_I2C_GenerateSTART
;	main.c: 93: while(!I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT));
00104$:
	ldw	x, #0x0301
	call	_I2C_CheckEvent
	tnz	a
	jreq	00104$
;	main.c: 94: }
	ret
;	main.c: 95: void I2C_address(uint8_t mode)
;	-----------------------------------------
;	 function I2C_address
;	-----------------------------------------
_I2C_address:
	push	a
	ld	(0x01, sp), a
;	main.c: 98: I2C_Send7bitAddress((uint8_t)DS1307_I2C_ADDR,I2C_DIRECTION_TX);
	push	#0x00
	ld	a, #0x78
	call	_I2C_Send7bitAddress
;	main.c: 101: while(!I2C_CheckEvent( I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
00101$:
	ldw	x, #0x0782
	call	_I2C_CheckEvent
	tnz	a
	jreq	00101$
;	main.c: 104: I2C_SendData(mode);
	ld	a, (0x01, sp)
	call	_I2C_SendData
;	main.c: 107: while(!I2C_CheckEvent( I2C_EVENT_MASTER_BYTE_TRANSMITTED));
00104$:
	ldw	x, #0x0784
	call	_I2C_CheckEvent
	tnz	a
	jreq	00104$
;	main.c: 108: }
	pop	a
	ret
;	main.c: 109: void I2C_write(uint8_t data)
;	-----------------------------------------
;	 function I2C_write
;	-----------------------------------------
_I2C_write:
;	main.c: 112: I2C_SendData(data);
	call	_I2C_SendData
;	main.c: 115: while(!I2C_GetFlagStatus( I2C_FLAG_TRANSFERFINISHED));
00101$:
	ldw	x, #0x0104
	call	_I2C_GetFlagStatus
	tnz	a
	jreq	00101$
;	main.c: 116: }
	ret
;	main.c: 117: void I2C_stop(void)
;	-----------------------------------------
;	 function I2C_stop
;	-----------------------------------------
_I2C_stop:
;	main.c: 120: I2C_GenerateSTOP(ENABLE);
	ld	a, #0x01
	call	_I2C_GenerateSTOP
;	main.c: 122: I2C->SR1;       I2C->SR3;
	ld	a, 0x5217
	ld	a, 0x5219
;	main.c: 123: }
	ret
;	main.c: 124: void OLED_init(void)
;	-----------------------------------------
;	 function OLED_init
;	-----------------------------------------
_OLED_init:
	push	a
;	main.c: 126: I2C_start();
	call	_I2C_start
;	main.c: 127: I2C_address(OLED_CMD_MODE);
	clr	a
	call	_I2C_address
;	main.c: 128: for (uint8_t i = 0;i < OLED_INIT_LEN;i++)
	clr	(0x01, sp)
00103$:
	ld	a, (0x01, sp)
	cp	a, #0x0c
	jrnc	00101$
;	main.c: 130: I2C_write(OLED_INIT_CMD[i]);
	clrw	x
	ld	a, (0x01, sp)
	ld	xl, a
	addw	x, #(_OLED_INIT_CMD+0)
	ld	a, (x)
	call	_I2C_write
;	main.c: 128: for (uint8_t i = 0;i < OLED_INIT_LEN;i++)
	inc	(0x01, sp)
	jra	00103$
00101$:
;	main.c: 132: I2C_stop();
	pop	a
	jp	_I2C_stop
;	main.c: 133: }
	pop	a
	ret
;	main.c: 134: void OLED_printC(char ch)
;	-----------------------------------------
;	 function OLED_printC
;	-----------------------------------------
_OLED_printC:
	sub	sp, #2
;	main.c: 136: uint16_t offset = ch;
	ld	(0x02, sp), a
	clr	(0x01, sp)
;	main.c: 137: offset += offset << 2;
	ldw	x, (0x01, sp)
	sllw	x
	sllw	x
	addw	x, (0x01, sp)
	ldw	(0x01, sp), x
;	main.c: 138: I2C_start();
	call	_I2C_start
;	main.c: 139: I2C_address(OLED_DAT_MODE);
	ld	a, #0x40
	call	_I2C_address
;	main.c: 140: I2C_write(0x00);
	clr	a
	call	_I2C_write
;	main.c: 141: for(uint8_t i = 5; i;i--){ I2C_write(OLED_FONT[offset++]); }
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
;	main.c: 142: I2C_stop();
	addw	sp, #2
;	main.c: 143: }
	jp	_I2C_stop
;	main.c: 144: void OLED_cursor(uint8_t xpos, uint8_t ypos)
;	-----------------------------------------
;	 function OLED_cursor
;	-----------------------------------------
_OLED_cursor:
	push	a
	ld	(0x01, sp), a
;	main.c: 146: I2C_start();
	call	_I2C_start
;	main.c: 147: I2C_address(OLED_CMD_MODE);
	clr	a
	call	_I2C_address
;	main.c: 148: I2C_write(xpos & 0x0F);
	ld	a, (0x01, sp)
	and	a, #0x0f
	call	_I2C_write
;	main.c: 149: I2C_write(0x10 | (xpos >> 4));
	ld	a, (0x01, sp)
	swap	a
	and	a, #0x0f
	or	a, #0x10
	call	_I2C_write
;	main.c: 150: I2C_write(0xB0 | (ypos & 0x07));
	ld	a, (0x04, sp)
	and	a, #0x07
	or	a, #0xb0
	call	_I2C_write
;	main.c: 151: I2C_stop();
	ldw	x, (2, sp)
	ldw	(3, sp), x
	addw	sp, #2
	jp	_I2C_stop
;	main.c: 152: }
	pop	a
	popw	x
	pop	a
	jp	(x)
;	main.c: 153: void OLED_clear(void)
;	-----------------------------------------
;	 function OLED_clear
;	-----------------------------------------
_OLED_clear:
;	main.c: 155: OLED_cursor(0,0);
	push	#0x00
	clr	a
	call	_OLED_cursor
;	main.c: 156: I2C_start();
	call	_I2C_start
;	main.c: 157: I2C_address(OLED_DAT_MODE);
	ld	a, #0x40
	call	_I2C_address
;	main.c: 158: for (uint16_t i=512;i;i--)
	ldw	x, #0x0200
00103$:
	tnzw	x
	jrne	00118$
	jp	_I2C_stop
00118$:
;	main.c: 160: I2C_write(0x00);
	pushw	x
	clr	a
	call	_I2C_write
	popw	x
;	main.c: 158: for (uint16_t i=512;i;i--)
	decw	x
;	main.c: 162: I2C_stop();
;	main.c: 163: }
	jra	00103$
	.area CODE
	.area CONST
_OLED_INIT_CMD:
	.db #0xa8	; 168
	.db #0x1f	; 31
	.db #0x22	; 34
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0xda	; 218
	.db #0x02	; 2
	.db #0x8d	; 141
	.db #0x14	; 20
	.db #0xaf	; 175
	.db #0xa1	; 161
	.db #0xc8	; 200
_OLED_FONT:
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
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x41	; 65	'A'
	.db #0x7f	; 127
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x22	; 34
	.db #0x1c	; 28
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x3f	; 63
	.db #0x3e	; 62
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x22	; 34
	.db #0x7f	; 127
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x7f	; 127
	.db #0x3e	; 62
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x3e	; 62
	.db #0x7c	; 124
	.db #0x12	; 18
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x7c	; 124
	.db #0x7f	; 127
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x7f	; 127
	.db #0x3e	; 62
	.db #0x41	; 65	'A'
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x7a	; 122	'z'
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x70	; 112	'p'
	.db #0x08	; 8
	.db #0x07	; 7
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.area INITIALIZER
	.area CABS (ABS)
