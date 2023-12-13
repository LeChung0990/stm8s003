;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.0 #14184 (MINGW64)
;--------------------------------------------------------
	.module 74HC595
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _SEG_SELECT
	.globl _SEG_MAP
	.globl _data
	.globl _strobe
	.globl _shcp
	.globl _delay_us
	.globl _GPIO_WriteLow
	.globl _GPIO_WriteHigh
	.globl _GPIO_Init
	.globl _HC595_Init
	.globl _ONE7SEG
	.globl _FOUR7SEG
	.globl _HIENTHI
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
;	74HC595.c: 7: void delay_us(unsigned int  value)
;	-----------------------------------------
;	 function delay_us
;	-----------------------------------------
_delay_us:
;	74HC595.c: 11: while(loops)
00101$:
	tnzw	x
	jrne	00117$
	ret
00117$:
;	74HC595.c: 13: nop();
	nop
;	74HC595.c: 14: loops--;
	decw	x
	jra	00101$
;	74HC595.c: 16: }
	ret
;	74HC595.c: 18: void HC595_Init(void)
;	-----------------------------------------
;	 function HC595_Init
;	-----------------------------------------
_HC595_Init:
;	74HC595.c: 20: GPIO_Init(SH_PORT,(GPIO_Pin_TypeDef)(SH_PIN|DATA_PIN|ST_PIN),GPIO_MODE_OUT_PP_LOW_FAST);
	push	#0xe0
	ld	a, #0xe0
	ldw	x, #0x500a
	call	_GPIO_Init
;	74HC595.c: 21: }
	ret
;	74HC595.c: 23: void shcp(void)
;	-----------------------------------------
;	 function shcp
;	-----------------------------------------
_shcp:
;	74HC595.c: 25: PIN_HIGH(SH_PORT, SH_PIN);
	ld	a, #0x80
	ldw	x, #0x500a
	call	_GPIO_WriteHigh
;	74HC595.c: 27: PIN_LOW(SH_PORT, SH_PIN);
	ld	a, #0x80
	ldw	x, #0x500a
;	74HC595.c: 29: }
	jp	_GPIO_WriteLow
;	74HC595.c: 31: void strobe(void)
;	-----------------------------------------
;	 function strobe
;	-----------------------------------------
_strobe:
;	74HC595.c: 34: PIN_HIGH(ST_PORT, ST_PIN);
	ld	a, #0x40
	ldw	x, #0x500a
	call	_GPIO_WriteHigh
;	74HC595.c: 35: delay_us(300);
	ldw	x, #0x012c
	call	_delay_us
;	74HC595.c: 36: PIN_LOW(ST_PORT, ST_PIN);
	ld	a, #0x40
	ldw	x, #0x500a
;	74HC595.c: 37: }
	jp	_GPIO_WriteLow
;	74HC595.c: 40: void data(uint8_t data)
;	-----------------------------------------
;	 function data
;	-----------------------------------------
_data:
	sub	sp, #2
	ld	(0x01, sp), a
;	74HC595.c: 43: for (uint8_t i = 0 ; i < 8; i++)
	clr	(0x02, sp)
00106$:
	ld	a, (0x02, sp)
	cp	a, #0x08
	jrnc	00108$
;	74HC595.c: 45: t = data & 0x01;     //Dich du lieu de lay tung bit trong 8 bit
	ld	a, (0x01, sp)
;	74HC595.c: 46: if (t == 1) {               //Xuat bit 0 hoac 1 ra chan Data
	bcp	a, #0x01
	jreq	00102$
;	74HC595.c: 47: PIN_HIGH(DATA_PORT, DATA_PIN);
	ld	a, #0x20
	ldw	x, #0x500a
	call	_GPIO_WriteHigh
	jra	00103$
00102$:
;	74HC595.c: 50: PIN_LOW(DATA_PORT, DATA_PIN);
	ld	a, #0x20
	ldw	x, #0x500a
	call	_GPIO_WriteLow
00103$:
;	74HC595.c: 52: shcp();                     //CHO 1 XUNG CHAN SH_CP DE XUAT 1 BIT RA CHAN DS
	call	_shcp
;	74HC595.c: 53: data = data >> 1;
	srl	(0x01, sp)
;	74HC595.c: 43: for (uint8_t i = 0 ; i < 8; i++)
	inc	(0x02, sp)
	jra	00106$
00108$:
;	74HC595.c: 55: }
	addw	sp, #2
	ret
;	74HC595.c: 56: void ONE7SEG(uint8_t Value)
;	-----------------------------------------
;	 function ONE7SEG
;	-----------------------------------------
_ONE7SEG:
;	74HC595.c: 58: data(Value);
	call	_data
;	74HC595.c: 59: strobe();
;	74HC595.c: 60: }
	jp	_strobe
;	74HC595.c: 62: void FOUR7SEG(uint8_t Digit, uint8_t Value) {
;	-----------------------------------------
;	 function FOUR7SEG
;	-----------------------------------------
_FOUR7SEG:
;	74HC595.c: 63: data(Value);
	push	a
	ld	a, (0x04, sp)
	call	_data
	pop	a
;	74HC595.c: 64: data(Digit);		//Dich data so sau do moi dich ma Digit
	call	_data
;	74HC595.c: 65: strobe();
	ldw	x, (1, sp)
	ldw	(2, sp), x
	pop	a
;	74HC595.c: 66: }
	jp	_strobe
	pop	a
	jp	(x)
;	74HC595.c: 68: void HIENTHI(int so)
;	-----------------------------------------
;	 function HIENTHI
;	-----------------------------------------
_HIENTHI:
;	74HC595.c: 73: FOUR7SEG(SEG_SELECT[3], SEG_MAP[(so / 1) % 10]);
	push	#0x0a
	push	#0x00
	call	__modsint
	addw	x, #(_SEG_MAP+0)
	ld	a, (x)
	ld	xl, a
	ld	a, _SEG_SELECT+3
	pushw	x
	addw	sp, #1
	call	_FOUR7SEG
;	74HC595.c: 74: }
	ret
	.area CODE
	.area CONST
_SEG_MAP:
	.db #0x3f	; 63
	.db #0x06	; 6
	.db #0x5b	; 91
	.db #0x4f	; 79	'O'
	.db #0x66	; 102	'f'
	.db #0x6d	; 109	'm'
	.db #0x7d	; 125
	.db #0x07	; 7
	.db #0x7f	; 127
	.db #0x6f	; 111	'o'
_SEG_SELECT:
	.db #0xf7	; 247
	.db #0xfb	; 251
	.db #0xfd	; 253
	.db #0xfe	; 254
	.area INITIALIZER
	.area CABS (ABS)
