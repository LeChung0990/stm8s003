;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.0 #14184 (MINGW64)
;--------------------------------------------------------
	.module main
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _EXTI_PORTD_IRQHandler
	.globl _main
	.globl _ChayLEDNgoaiTrong
	.globl _Chay1LED
	.globl _HaiMau
	.globl _NhapNhayRED
	.globl _NhapNhay1
	.globl _ChayLED5
	.globl _ChayLED4
	.globl _ChayLed2
	.globl _ChayLed1
	.globl _clearLEDs
	.globl _Timer4DelayMs
	.globl _Timer4Config
	.globl _hieuung1
	.globl _number
	.globl _sendRGB
	.globl _Color_byte
	.globl _send_1
	.globl _send_0
	.globl _rand
	.globl _mode
	.globl _b
	.globl _g
	.globl _r
	.globl _i
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_i::
	.ds 1
_r::
	.ds 1
_g::
	.ds 1
_b::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
_mode::
	.ds 1
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
	int 0x000000 ; trap
	int 0x000000 ; int0
	int 0x000000 ; int1
	int 0x000000 ; int2
	int 0x000000 ; int3
	int 0x000000 ; int4
	int 0x000000 ; int5
	int _EXTI_PORTD_IRQHandler ; int6
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
;	main.c: 12: void send_0(void)
;	-----------------------------------------
;	 function send_0
;	-----------------------------------------
_send_0:
;	main.c: 15: __asm__("bset 0x500f, #3");
	bset	0x500f, #3
;	main.c: 16: __asm__("nop\n nop\n nop\n nop\n nop\n");
	nop
	nop
	nop
	nop
	nop
;	main.c: 18: __asm__("bres 0x500f, #3");
	bres	0x500f, #3
;	main.c: 19: __asm__("nop\n nop\n nop\n nop\n nop\n nop\n nop\n nop\n nop\n nop\n");
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
;	main.c: 20: }
	ret
;	main.c: 21: void send_1(void)
;	-----------------------------------------
;	 function send_1
;	-----------------------------------------
_send_1:
;	main.c: 23: __asm__("bset 0x500f, #3");
	bset	0x500f, #3
;	main.c: 24: __asm__("nop\n nop\n nop\n nop\n nop\n nop\n nop\n nop\n nop\n nop\n nop\n nop\n");
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
;	main.c: 25: __asm__("bres 0x500f, #3");
	bres	0x500f, #3
;	main.c: 26: __asm__("nop\n nop\n nop\n");
	nop
	nop
	nop
;	main.c: 27: }
	ret
;	main.c: 28: void Color_byte(uint8_t data)
;	-----------------------------------------
;	 function Color_byte
;	-----------------------------------------
_Color_byte:
	push	a
;	main.c: 30: for (uint8_t i = 0; i < 8; i++)
	clr	(0x01, sp)
00106$:
	push	a
	ld	a, (0x02, sp)
	cp	a, #0x08
	pop	a
	jrnc	00108$
;	main.c: 32: if (data & 0x80)
	tnz	a
	jrpl	00102$
;	main.c: 33: send_1();
	push	a
	call	_send_1
	pop	a
	jra	00103$
00102$:
;	main.c: 35: send_0();
	push	a
	call	_send_0
	pop	a
00103$:
;	main.c: 36: data <<= 1;
	sll	a
;	main.c: 30: for (uint8_t i = 0; i < 8; i++)
	inc	(0x01, sp)
	jra	00106$
00108$:
;	main.c: 38: }
	pop	a
	ret
;	main.c: 39: void sendRGB(uint8_t Gbyte, uint8_t Rbyte, uint8_t Bbyte)
;	-----------------------------------------
;	 function sendRGB
;	-----------------------------------------
_sendRGB:
;	main.c: 41: Color_byte(Gbyte);
	call	_Color_byte
;	main.c: 42: Color_byte(Rbyte);
	ld	a, (0x03, sp)
	call	_Color_byte
;	main.c: 43: Color_byte(Bbyte);
	ld	a, (0x04, sp)
	ldw	x, (1, sp)
	ldw	(3, sp), x
	addw	sp, #2
;	main.c: 44: }
	jp	_Color_byte
;	main.c: 45: void number(uint8_t soLed, uint8_t Gbyte, uint8_t Rbyte, uint8_t Bbyte)
;	-----------------------------------------
;	 function number
;	-----------------------------------------
_number:
;	main.c: 47: switch (soLed)
	cp	a, #0x08
	jrule	00118$
	jp	00111$
00118$:
	clrw	x
	ld	xl, a
	sllw	x
	ldw	x, (#00119$, x)
	jp	(x)
00119$:
	.dw	#00111$
	.dw	#00101$
	.dw	#00102$
	.dw	#00103$
	.dw	#00104$
	.dw	#00105$
	.dw	#00106$
	.dw	#00107$
	.dw	#00108$
;	main.c: 49: case 1:
00101$:
;	main.c: 50: sendRGB(Gbyte, Rbyte, Bbyte);
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	call	_sendRGB
;	main.c: 51: break;
	jp	00111$
;	main.c: 52: case 2:
00102$:
;	main.c: 53: sendRGB(Gbyte, Rbyte, Bbyte);
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	call	_sendRGB
;	main.c: 54: sendRGB(Gbyte, Rbyte, Bbyte);
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	call	_sendRGB
;	main.c: 55: break;
	jp	00111$
;	main.c: 56: case 3:
00103$:
;	main.c: 57: sendRGB(Gbyte, Rbyte, Bbyte);
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	call	_sendRGB
;	main.c: 58: sendRGB(Gbyte, Rbyte, Bbyte);
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	call	_sendRGB
;	main.c: 59: sendRGB(Gbyte, Rbyte, Bbyte);
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	call	_sendRGB
;	main.c: 60: break;
	jp	00111$
;	main.c: 61: case 4:
00104$:
;	main.c: 62: sendRGB(Gbyte, Rbyte, Bbyte);
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	call	_sendRGB
;	main.c: 63: sendRGB(Gbyte, Rbyte, Bbyte);
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	call	_sendRGB
;	main.c: 64: sendRGB(Gbyte, Rbyte, Bbyte);
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	call	_sendRGB
;	main.c: 65: sendRGB(Gbyte, Rbyte, Bbyte);
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	call	_sendRGB
;	main.c: 66: break;
	jp	00111$
;	main.c: 67: case 5:
00105$:
;	main.c: 68: sendRGB(Gbyte, Rbyte, Bbyte);
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	call	_sendRGB
;	main.c: 69: sendRGB(Gbyte, Rbyte, Bbyte);
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	call	_sendRGB
;	main.c: 70: sendRGB(Gbyte, Rbyte, Bbyte);
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	call	_sendRGB
;	main.c: 71: sendRGB(Gbyte, Rbyte, Bbyte);
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	call	_sendRGB
;	main.c: 72: sendRGB(Gbyte, Rbyte, Bbyte);
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	call	_sendRGB
;	main.c: 73: break;
	jp	00111$
;	main.c: 74: case 6:
00106$:
;	main.c: 75: sendRGB(Gbyte, Rbyte, Bbyte);
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	call	_sendRGB
;	main.c: 76: sendRGB(Gbyte, Rbyte, Bbyte);
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	call	_sendRGB
;	main.c: 77: sendRGB(Gbyte, Rbyte, Bbyte);
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	call	_sendRGB
;	main.c: 78: sendRGB(Gbyte, Rbyte, Bbyte);
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	call	_sendRGB
;	main.c: 79: sendRGB(Gbyte, Rbyte, Bbyte);
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	call	_sendRGB
;	main.c: 80: sendRGB(Gbyte, Rbyte, Bbyte);
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	call	_sendRGB
;	main.c: 81: break;
	jp	00111$
;	main.c: 82: case 7:
00107$:
;	main.c: 83: sendRGB(Gbyte, Rbyte, Bbyte);
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	call	_sendRGB
;	main.c: 84: sendRGB(Gbyte, Rbyte, Bbyte);
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	call	_sendRGB
;	main.c: 85: sendRGB(Gbyte, Rbyte, Bbyte);
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	call	_sendRGB
;	main.c: 86: sendRGB(Gbyte, Rbyte, Bbyte);
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	call	_sendRGB
;	main.c: 87: sendRGB(Gbyte, Rbyte, Bbyte);
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	call	_sendRGB
;	main.c: 88: sendRGB(Gbyte, Rbyte, Bbyte);
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	call	_sendRGB
;	main.c: 89: sendRGB(Gbyte, Rbyte, Bbyte);
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	call	_sendRGB
;	main.c: 90: break;
	jra	00111$
;	main.c: 91: case 8:
00108$:
;	main.c: 92: sendRGB(Gbyte, Rbyte, Bbyte);
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	call	_sendRGB
;	main.c: 93: sendRGB(Gbyte, Rbyte, Bbyte);
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	call	_sendRGB
;	main.c: 94: sendRGB(Gbyte, Rbyte, Bbyte);
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	call	_sendRGB
;	main.c: 95: sendRGB(Gbyte, Rbyte, Bbyte);
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	call	_sendRGB
;	main.c: 96: sendRGB(Gbyte, Rbyte, Bbyte);
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	call	_sendRGB
;	main.c: 97: sendRGB(Gbyte, Rbyte, Bbyte);
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	call	_sendRGB
;	main.c: 98: sendRGB(Gbyte, Rbyte, Bbyte);
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	call	_sendRGB
;	main.c: 99: sendRGB(Gbyte, Rbyte, Bbyte);
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	call	_sendRGB
;	main.c: 103: }
00111$:
;	main.c: 104: }
	ldw	x, (1, sp)
	addw	sp, #5
	jp	(x)
;	main.c: 106: void hieuung1(uint8_t r, uint8_t g, uint8_t b)
;	-----------------------------------------
;	 function hieuung1
;	-----------------------------------------
_hieuung1:
	sub	sp, #5
	ld	(0x01, sp), a
;	main.c: 108: uint8_t rev_r = 0, rev_g = 0, rev_b = 0;
	clr	(0x02, sp)
	clr	(0x03, sp)
	clr	(0x04, sp)
;	main.c: 110: for (uint8_t i = 0; i < 8; i++)
	clr	(0x05, sp)
00105$:
	ld	a, (0x05, sp)
	cp	a, #0x08
	jrnc	00101$
;	main.c: 111: rev_r |= (((r >> (7 - i)) & 1) ? (1 << i) : 0);
	ld	a, #0x07
	sub	a, (0x05, sp)
	exg	a, xl
	ld	a, (0x01, sp)
	exg	a, xl
	tnz	a
	jreq	00171$
00170$:
	exg	a, xl
	srl	a
	exg	a, xl
	dec	a
	jrne	00170$
00171$:
	srlw	x
	jrnc	00115$
	ld	a, (0x05, sp)
	exg	a, xl
	ld	a, #0x01
	exg	a, xl
	tnz	a
	jreq	00174$
00173$:
	exg	a, xl
	sll	a
	exg	a, xl
	dec	a
	jrne	00173$
00174$:
	ld	a, xl
	rlc	a
	clr	a
	sbc	a, #0x00
	.byte 0x21
00115$:
	clrw	x
00116$:
	ld	a, xl
	or	a, (0x02, sp)
	ld	(0x02, sp), a
;	main.c: 110: for (uint8_t i = 0; i < 8; i++)
	inc	(0x05, sp)
	jra	00105$
00101$:
;	main.c: 112: for (uint8_t i = 0; i < 8; i++)
	clr	(0x05, sp)
00108$:
	ld	a, (0x05, sp)
	cp	a, #0x08
	jrnc	00102$
;	main.c: 113: rev_g |= (((g >> (7 - i)) & 1) ? (1 << i) : 0);
	ld	a, #0x07
	sub	a, (0x05, sp)
	exg	a, xl
	ld	a, (0x08, sp)
	exg	a, xl
	tnz	a
	jreq	00177$
00176$:
	exg	a, xl
	srl	a
	exg	a, xl
	dec	a
	jrne	00176$
00177$:
	srlw	x
	jrnc	00117$
	ld	a, (0x05, sp)
	exg	a, xl
	ld	a, #0x01
	exg	a, xl
	tnz	a
	jreq	00180$
00179$:
	exg	a, xl
	sll	a
	exg	a, xl
	dec	a
	jrne	00179$
00180$:
	ld	a, xl
	rlc	a
	clr	a
	sbc	a, #0x00
	.byte 0x21
00117$:
	clrw	x
00118$:
	ld	a, xl
	or	a, (0x03, sp)
	ld	(0x03, sp), a
;	main.c: 112: for (uint8_t i = 0; i < 8; i++)
	inc	(0x05, sp)
	jra	00108$
00102$:
;	main.c: 114: for (uint8_t i = 0; i < 8; i++)
	clr	(0x05, sp)
00111$:
	ld	a, (0x05, sp)
	cp	a, #0x08
	jrnc	00103$
;	main.c: 115: rev_b |= (((b >> (7 - i)) & 1) ? (1 << i) : 0);
	ld	a, #0x07
	sub	a, (0x05, sp)
	exg	a, xl
	ld	a, (0x09, sp)
	exg	a, xl
	tnz	a
	jreq	00183$
00182$:
	exg	a, xl
	srl	a
	exg	a, xl
	dec	a
	jrne	00182$
00183$:
	srlw	x
	jrnc	00119$
	ld	a, (0x05, sp)
	exg	a, xl
	ld	a, #0x01
	exg	a, xl
	tnz	a
	jreq	00186$
00185$:
	exg	a, xl
	sll	a
	exg	a, xl
	dec	a
	jrne	00185$
00186$:
	ld	a, xl
	rlc	a
	clr	a
	sbc	a, #0x00
	.byte 0x21
00119$:
	clrw	x
00120$:
	ld	a, xl
	or	a, (0x04, sp)
	ld	(0x04, sp), a
;	main.c: 114: for (uint8_t i = 0; i < 8; i++)
	inc	(0x05, sp)
	jra	00111$
00103$:
;	main.c: 117: number(8, rev_r, rev_g, rev_b);
	ld	a, (0x04, sp)
	push	a
	ld	a, (0x04, sp)
	push	a
	ld	a, (0x04, sp)
	push	a
	ld	a, #0x08
	call	_number
;	main.c: 118: }
	ldw	x, (6, sp)
	addw	sp, #9
	jp	(x)
;	main.c: 121: void Timer4Config(void)
;	-----------------------------------------
;	 function Timer4Config
;	-----------------------------------------
_Timer4Config:
;	main.c: 123: TIM4->PSCR = (uint8_t)0x07;
	mov	0x5347+0, #0x07
;	main.c: 124: TIM4->ARR = (uint8_t)125 - 1;
	mov	0x5348+0, #0x7c
;	main.c: 126: TIM4->CR1 |= TIM4_CR1_CEN;
	bset	0x5340, #0
;	main.c: 127: }
	ret
;	main.c: 128: void Timer4DelayMs(uint16_t u16Delay)
;	-----------------------------------------
;	 function Timer4DelayMs
;	-----------------------------------------
_Timer4DelayMs:
;	main.c: 130: while (u16Delay)
00104$:
	tnzw	x
	jrne	00130$
	ret
00130$:
;	main.c: 132: TIM4->CNTR = (uint8_t)0;
	mov	0x5346+0, #0x00
;	main.c: 134: TIM4->SR1 = (uint8_t)(~0x01);
	mov	0x5344+0, #0xfe
;	main.c: 135: while ((TIM4->SR1 & (uint8_t)0x01) == RESET)
00101$:
	btjf	0x5344, #0, 00101$
;	main.c: 138: --u16Delay;
	decw	x
	jra	00104$
;	main.c: 140: }
	ret
;	main.c: 141: void clearLEDs(void)
;	-----------------------------------------
;	 function clearLEDs
;	-----------------------------------------
_clearLEDs:
;	main.c: 143: number(8, 0, 0, 0);
	push	#0x00
	push	#0x00
	push	#0x00
	ld	a, #0x08
	call	_number
;	main.c: 144: Timer4DelayMs(50);
	ldw	x, #0x0032
;	main.c: 145: }
	jp	_Timer4DelayMs
;	main.c: 147: void ChayLed1(void)
;	-----------------------------------------
;	 function ChayLed1
;	-----------------------------------------
_ChayLed1:
;	main.c: 149: r = rand() % 256;
	call	_rand
	push	#0x00
	push	#0x01
	call	__modsint
	ld	a, xl
	ld	_r+0, a
;	main.c: 150: g = rand() % 256;
	call	_rand
	push	#0x00
	push	#0x01
	call	__modsint
	ld	a, xl
	ld	_g+0, a
;	main.c: 151: b = rand() % 256;
	call	_rand
	push	#0x00
	push	#0x01
	call	__modsint
	ld	a, xl
	ld	_b+0, a
;	main.c: 152: for (i = 1; i < 9; i++)
	mov	_i+0, #0x01
00102$:
;	main.c: 155: number(i, g, r, b);
	push	_b+0
	push	_r+0
	push	_g+0
	ld	a, _i+0
	call	_number
;	main.c: 156: Timer4DelayMs(TimeRun);
	ldw	x, #0x0028
	call	_Timer4DelayMs
;	main.c: 152: for (i = 1; i < 9; i++)
	inc	_i+0
	ld	a, _i+0
	cp	a, #0x09
	jrc	00102$
;	main.c: 158: }
	ret
;	main.c: 160: void ChayLed2(void)
;	-----------------------------------------
;	 function ChayLed2
;	-----------------------------------------
_ChayLed2:
;	main.c: 163: for (i = 0; i < 255; i++)
	clr	_i+0
00103$:
;	main.c: 165: number(8, i, 100, i);
	push	_i+0
	push	#0x64
	push	_i+0
	ld	a, #0x08
	call	_number
;	main.c: 166: Timer4DelayMs(10);
	ldw	x, #0x000a
	call	_Timer4DelayMs
;	main.c: 163: for (i = 0; i < 255; i++)
	inc	_i+0
	ld	a, _i+0
	cp	a, #0xff
	jrc	00103$
;	main.c: 169: for (i = 255; i > 0; i--)
	mov	_i+0, #0xff
00105$:
;	main.c: 171: number(8, i, 100, i);
	push	_i+0
	push	#0x64
	push	_i+0
	ld	a, #0x08
	call	_number
;	main.c: 172: Timer4DelayMs(10);
	ldw	x, #0x000a
	call	_Timer4DelayMs
;	main.c: 169: for (i = 255; i > 0; i--)
	dec	_i+0
	ld	a, _i+0
	jrne	00105$
;	main.c: 174: }
	ret
;	main.c: 175: void ChayLED4(void)
;	-----------------------------------------
;	 function ChayLED4
;	-----------------------------------------
_ChayLED4:
;	main.c: 177: for (i = 1; i < 9; i++)
	mov	_i+0, #0x01
00102$:
;	main.c: 179: number(i, 255, 51, 255);
	push	#0xff
	push	#0x33
	push	#0xff
	ld	a, _i+0
	call	_number
;	main.c: 180: Timer4DelayMs(TimeRun);
	ldw	x, #0x0028
	call	_Timer4DelayMs
;	main.c: 177: for (i = 1; i < 9; i++)
	inc	_i+0
	ld	a, _i+0
	cp	a, #0x09
	jrc	00102$
;	main.c: 182: }
	ret
;	main.c: 184: void ChayLED5(void)
;	-----------------------------------------
;	 function ChayLED5
;	-----------------------------------------
_ChayLED5:
	push	a
;	main.c: 186: r = rand() % 256;
	call	_rand
	push	#0x00
	push	#0x01
	call	__modsint
	ld	a, xl
	ld	_r+0, a
;	main.c: 187: g = rand() % 256;
	call	_rand
	push	#0x00
	push	#0x01
	call	__modsint
	ld	a, xl
	ld	_g+0, a
;	main.c: 188: b = rand() % 256;
	call	_rand
	push	#0x00
	push	#0x01
	call	__modsint
	ld	a, xl
	ld	_b+0, a
;	main.c: 189: for (i = 8; i > 0; i--)
	mov	_i+0, #0x08
00103$:
;	main.c: 191: number(i - 1, 0, 0, 0);
	ld	a, _i+0
	dec	a
	push	#0x00
	push	#0x00
	push	#0x00
	call	_number
;	main.c: 192: number(9 - i, g, r, b);
	ld	a, _i+0
	ld	(0x01, sp), a
	ld	a, #0x09
	sub	a, (0x01, sp)
	push	_b+0
	push	_r+0
	push	_g+0
	call	_number
;	main.c: 193: Timer4DelayMs(100);
	ldw	x, #0x0064
	call	_Timer4DelayMs
;	main.c: 189: for (i = 8; i > 0; i--)
	dec	_i+0
	ld	a, _i+0
	jrne	00103$
;	main.c: 196: for (i = 1; i < 9; i++)
	mov	_i+0, #0x01
00105$:
;	main.c: 198: number(i, 0, 0, 0);
	push	#0x00
	push	#0x00
	push	#0x00
	ld	a, _i+0
	call	_number
;	main.c: 199: Timer4DelayMs(100);
	ldw	x, #0x0064
	call	_Timer4DelayMs
;	main.c: 196: for (i = 1; i < 9; i++)
	inc	_i+0
	ld	a, _i+0
	cp	a, #0x09
	jrc	00105$
;	main.c: 201: }
	pop	a
	ret
;	main.c: 203: void NhapNhay1(void)
;	-----------------------------------------
;	 function NhapNhay1
;	-----------------------------------------
_NhapNhay1:
;	main.c: 205: for (i = 0; i < 255; i++)
	clr	_i+0
00103$:
;	main.c: 207: number(8, i, 100, i);
	push	_i+0
	push	#0x64
	push	_i+0
	ld	a, #0x08
	call	_number
;	main.c: 208: Timer4DelayMs(10);
	ldw	x, #0x000a
	call	_Timer4DelayMs
;	main.c: 205: for (i = 0; i < 255; i++)
	inc	_i+0
	ld	a, _i+0
	cp	a, #0xff
	jrc	00103$
;	main.c: 211: for (i = 255; i > 0; i--)
	mov	_i+0, #0xff
00105$:
;	main.c: 213: number(8, i, 100, i);
	push	_i+0
	push	#0x64
	push	_i+0
	ld	a, #0x08
	call	_number
;	main.c: 214: Timer4DelayMs(10);
	ldw	x, #0x000a
	call	_Timer4DelayMs
;	main.c: 211: for (i = 255; i > 0; i--)
	dec	_i+0
	ld	a, _i+0
	jrne	00105$
;	main.c: 216: }
	ret
;	main.c: 218: void NhapNhayRED(void)
;	-----------------------------------------
;	 function NhapNhayRED
;	-----------------------------------------
_NhapNhayRED:
;	main.c: 220: for (i = 0; i < 255; i++)
	clr	_i+0
00103$:
;	main.c: 222: number(8, 0, i, 0);
	push	#0x00
	push	_i+0
	push	#0x00
	ld	a, #0x08
	call	_number
;	main.c: 223: Timer4DelayMs(1);
	clrw	x
	incw	x
	call	_Timer4DelayMs
;	main.c: 220: for (i = 0; i < 255; i++)
	inc	_i+0
	ld	a, _i+0
	cp	a, #0xff
	jrc	00103$
;	main.c: 226: for (i = 255; i > 0; i--)
	mov	_i+0, #0xff
00105$:
;	main.c: 228: number(8, 0, i, 0);
	push	#0x00
	push	_i+0
	push	#0x00
	ld	a, #0x08
	call	_number
;	main.c: 229: Timer4DelayMs(1);
	clrw	x
	incw	x
	call	_Timer4DelayMs
;	main.c: 226: for (i = 255; i > 0; i--)
	dec	_i+0
	ld	a, _i+0
	jrne	00105$
;	main.c: 231: }
	ret
;	main.c: 233: void HaiMau(void)
;	-----------------------------------------
;	 function HaiMau
;	-----------------------------------------
_HaiMau:
;	main.c: 235: number(4, 255, 51, 255);
	push	#0xff
	push	#0x33
	push	#0xff
	ld	a, #0x04
	call	_number
;	main.c: 236: number(4, 60, 255, 60);
	push	#0x3c
	push	#0xff
	push	#0x3c
	ld	a, #0x04
	call	_number
;	main.c: 237: }
	ret
;	main.c: 239: void Chay1LED(void)
;	-----------------------------------------
;	 function Chay1LED
;	-----------------------------------------
_Chay1LED:
	push	a
;	main.c: 241: r = rand() % 256;
	call	_rand
	push	#0x00
	push	#0x01
	call	__modsint
	ld	a, xl
	ld	_r+0, a
;	main.c: 242: g = rand() % 256;
	call	_rand
	push	#0x00
	push	#0x01
	call	__modsint
	ld	a, xl
	ld	_g+0, a
;	main.c: 243: b = rand() % 256;
	call	_rand
	push	#0x00
	push	#0x01
	call	__modsint
	ld	a, xl
	ld	_b+0, a
;	main.c: 244: for (i = 1; i < 9; i++)
	mov	_i+0, #0x01
00102$:
;	main.c: 246: number(i - 1, 0, 0, 0);
	ld	a, _i+0
	dec	a
	push	#0x00
	push	#0x00
	push	#0x00
	call	_number
;	main.c: 247: number(2, g, r, b);
	push	_b+0
	push	_r+0
	push	_g+0
	ld	a, #0x02
	call	_number
;	main.c: 248: number(7 - i, 0, 0, 0);
	ld	a, _i+0
	ld	(0x01, sp), a
	ld	a, #0x07
	sub	a, (0x01, sp)
	push	#0x00
	push	#0x00
	push	#0x00
	call	_number
;	main.c: 249: Timer4DelayMs(100);
	ldw	x, #0x0064
	call	_Timer4DelayMs
;	main.c: 244: for (i = 1; i < 9; i++)
	inc	_i+0
	ld	a, _i+0
	cp	a, #0x09
	jrc	00102$
;	main.c: 251: }
	pop	a
	ret
;	main.c: 253: void ChayLEDNgoaiTrong(void)
;	-----------------------------------------
;	 function ChayLEDNgoaiTrong
;	-----------------------------------------
_ChayLEDNgoaiTrong:
	push	a
;	main.c: 255: r = rand() % 256;
	call	_rand
	push	#0x00
	push	#0x01
	call	__modsint
	ld	a, xl
	ld	_r+0, a
;	main.c: 256: g = rand() % 256;
	call	_rand
	push	#0x00
	push	#0x01
	call	__modsint
	ld	a, xl
	ld	_g+0, a
;	main.c: 257: b = rand() % 256;
	call	_rand
	push	#0x00
	push	#0x01
	call	__modsint
	ld	a, xl
	ld	_b+0, a
;	main.c: 258: for (i = 1; i < 5; i++)
	mov	_i+0, #0x01
00103$:
;	main.c: 260: number(4 - i, 0, 0, 0);
	ld	a, _i+0
	ld	(0x01, sp), a
	ld	a, #0x04
	sub	a, (0x01, sp)
	push	#0x00
	push	#0x00
	push	#0x00
	call	_number
;	main.c: 261: number(1, g, r, b);
	push	_b+0
	push	_r+0
	push	_g+0
	ld	a, #0x01
	call	_number
;	main.c: 262: number(2 * (i - 1), 0, 0, 0);
	ld	a, _i+0
	dec	a
	sll	a
	push	#0x00
	push	#0x00
	push	#0x00
	call	_number
;	main.c: 263: number(1, g, r, b);
	push	_b+0
	push	_r+0
	push	_g+0
	ld	a, #0x01
	call	_number
;	main.c: 264: number(4 - i, 0, 0, 0);
	ld	a, _i+0
	ld	(0x01, sp), a
	ld	a, #0x04
	sub	a, (0x01, sp)
	push	#0x00
	push	#0x00
	push	#0x00
	call	_number
;	main.c: 265: Timer4DelayMs(200);
	ldw	x, #0x00c8
	call	_Timer4DelayMs
;	main.c: 258: for (i = 1; i < 5; i++)
	inc	_i+0
	ld	a, _i+0
	cp	a, #0x05
	jrc	00103$
;	main.c: 267: for (i = 4; i > 0; i--)
	mov	_i+0, #0x04
00105$:
;	main.c: 269: number(4 - i, 0, 0, 0);
	ld	a, _i+0
	ld	(0x01, sp), a
	ld	a, #0x04
	sub	a, (0x01, sp)
	push	#0x00
	push	#0x00
	push	#0x00
	call	_number
;	main.c: 270: number(1, g, r, b);
	push	_b+0
	push	_r+0
	push	_g+0
	ld	a, #0x01
	call	_number
;	main.c: 271: number(2 * (i - 1), 0, 0, 0);
	ld	a, _i+0
	dec	a
	sll	a
	push	#0x00
	push	#0x00
	push	#0x00
	call	_number
;	main.c: 272: number(1, g, r, b);
	push	_b+0
	push	_r+0
	push	_g+0
	ld	a, #0x01
	call	_number
;	main.c: 273: number(4 - i, 0, 0, 0);
	ld	a, _i+0
	ld	(0x01, sp), a
	ld	a, #0x04
	sub	a, (0x01, sp)
	push	#0x00
	push	#0x00
	push	#0x00
	call	_number
;	main.c: 274: Timer4DelayMs(200);
	ldw	x, #0x00c8
	call	_Timer4DelayMs
;	main.c: 267: for (i = 4; i > 0; i--)
	dec	_i+0
	ld	a, _i+0
	jrne	00105$
;	main.c: 276: }
	pop	a
	ret
;	main.c: 278: int main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	main.c: 282: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
	ld	a, 0x50c6
	and	a, #0xe7
	ld	0x50c6, a
;	main.c: 283: CLK->CKDIVR |= (uint8_t)0x00;
	mov	0x50c6, 0x50c6
;	main.c: 285: GPIOD->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
	mov	0x500f+0, #0x00
;	main.c: 286: GPIOD->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
	mov	0x5011+0, #0x00
;	main.c: 287: GPIOD->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
	mov	0x5012+0, #0x00
;	main.c: 288: GPIOD->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
	mov	0x5013+0, #0x00
;	main.c: 290: GPIOD->DDR |= (uint8_t)(1 << 3); /* Set Output mode */
	bset	0x5011, #3
;	main.c: 291: GPIOD->ODR |= (uint8_t)(1 << 3); /* High level */
	bset	0x500f, #3
;	main.c: 292: GPIOD->CR1 |= (uint8_t)(1 << 3); /* Pull-Up or Push-Pull */
	bset	0x5012, #3
;	main.c: 293: GPIOD->CR2 |= (uint8_t)(1 << 3); /* Output speed up to 10 MHz */
	bset	0x5013, #3
;	main.c: 300: EXTI->CR1 = EXTI_CR1_RESET_VALUE;
	mov	0x50a0+0, #0x00
;	main.c: 301: EXTI->CR2 = EXTI_CR2_RESET_VALUE;
	mov	0x50a1+0, #0x00
;	main.c: 303: BUT_PORT->DDR &= (uint8_t)(~(BUT_PIN)); /* Set Input mode */
	bres	0x5011, #2
;	main.c: 304: BUT_PORT->CR1 |= (uint8_t)BUT_PIN;      /* Pull-Up  */
	bset	0x5012, #2
;	main.c: 305: BUT_PORT->CR2 |= (uint8_t)BUT_PIN;      /* External interrupt enabled */
	ld	a, 0x5013
	or	a, #0x04
	ld	0x5013, a
;	main.c: 306: EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS); /*!< PORTD external interrupt sensitivity bits mask */
	ld	a, 0x50a0
	and	a, #0x3f
	ld	0x50a0, a
;	main.c: 307: EXTI->CR1 |= (uint8_t)((0x02) << 6);    /*!< Interrupt on Falling edge only */
	ld	a, 0x50a0
	or	a, #0x80
	ld	0x50a0, a
;	main.c: 309: Timer4Config();
	call	_Timer4Config
;	main.c: 310: enableInterrupts();
	rim
;	main.c: 321: while (mode == 1)
00107$:
	ld	a, _mode+0
	dec	a
	jreq	00284$
	jp	00109$
00284$:
;	main.c: 324: for (i = 1; i < 9; i++)
	mov	_i+0, #0x01
00133$:
;	main.c: 326: number(i, 255, 0, 0);
	push	#0x00
	push	#0x00
	push	#0xff
	ld	a, _i+0
	call	_number
;	main.c: 327: Timer4DelayMs(TimeRun);
	ldw	x, #0x0028
	call	_Timer4DelayMs
;	main.c: 324: for (i = 1; i < 9; i++)
	inc	_i+0
	ld	a, _i+0
	cp	a, #0x09
	jrc	00133$
;	main.c: 329: for (i = 1; i < 9; i++)
	mov	_i+0, #0x01
00135$:
;	main.c: 331: number(i, 0, 255, 0);
	push	#0x00
	push	#0xff
	push	#0x00
	ld	a, _i+0
	call	_number
;	main.c: 332: Timer4DelayMs(TimeRun);
	ldw	x, #0x0028
	call	_Timer4DelayMs
;	main.c: 329: for (i = 1; i < 9; i++)
	inc	_i+0
	ld	a, _i+0
	cp	a, #0x09
	jrc	00135$
;	main.c: 335: for (i = 1; i < 9; i++)
	mov	_i+0, #0x01
00137$:
;	main.c: 337: number(i, 0, 0, 255);
	push	#0xff
	push	#0x00
	push	#0x00
	ld	a, _i+0
	call	_number
;	main.c: 338: Timer4DelayMs(TimeRun);
	ldw	x, #0x0028
	call	_Timer4DelayMs
;	main.c: 335: for (i = 1; i < 9; i++)
	inc	_i+0
	ld	a, _i+0
	cp	a, #0x09
	jrc	00137$
;	main.c: 341: for (i = 1; i < 9; i++)
	mov	_i+0, #0x01
00139$:
;	main.c: 343: number(i, 0, 255, 255);
	push	#0xff
	push	#0xff
	push	#0x00
	ld	a, _i+0
	call	_number
;	main.c: 344: Timer4DelayMs(TimeRun);
	ldw	x, #0x0028
	call	_Timer4DelayMs
;	main.c: 341: for (i = 1; i < 9; i++)
	inc	_i+0
	ld	a, _i+0
	cp	a, #0x09
	jrc	00139$
;	main.c: 346: for (i = 1; i < 9; i++)
	mov	_i+0, #0x01
00141$:
;	main.c: 348: number(i, 255, 0, 255);
	push	#0xff
	push	#0x00
	push	#0xff
	ld	a, _i+0
	call	_number
;	main.c: 349: Timer4DelayMs(TimeRun);
	ldw	x, #0x0028
	call	_Timer4DelayMs
;	main.c: 346: for (i = 1; i < 9; i++)
	inc	_i+0
	ld	a, _i+0
	cp	a, #0x09
	jrc	00141$
;	main.c: 352: for (i = 1; i < 9; i++)
	mov	_i+0, #0x01
00143$:
;	main.c: 354: number(i, 255, 255, 0);
	push	#0x00
	push	#0xff
	push	#0xff
	ld	a, _i+0
	call	_number
;	main.c: 355: Timer4DelayMs(TimeRun);
	ldw	x, #0x0028
	call	_Timer4DelayMs
;	main.c: 352: for (i = 1; i < 9; i++)
	inc	_i+0
	ld	a, _i+0
	cp	a, #0x09
	jrc	00143$
	jp	00107$
00109$:
;	main.c: 358: if (mode == 2)
	ld	a, _mode+0
	cp	a, #0x02
	jrne	00112$
;	main.c: 360: ChayLED4();
	call	_ChayLED4
;	main.c: 362: while (mode == 3)
00112$:
	ld	a, _mode+0
	cp	a, #0x03
	jrne	00115$
;	main.c: 364: NhapNhay1();
	call	_NhapNhay1
	jra	00112$
;	main.c: 366: while (mode == 4)
00115$:
	ld	a, _mode+0
	cp	a, #0x04
	jrne	00118$
;	main.c: 368: NhapNhayRED();
	call	_NhapNhayRED
	jra	00115$
;	main.c: 370: while (mode == 5)
00118$:
	ld	a, _mode+0
	cp	a, #0x05
	jrne	00121$
;	main.c: 372: ChayLED5();
	call	_ChayLED5
	jra	00118$
;	main.c: 375: while (mode == 6)
00121$:
	ld	a, _mode+0
	cp	a, #0x06
	jrne	00124$
;	main.c: 377: Chay1LED();
	call	_Chay1LED
	jra	00121$
;	main.c: 380: while (mode == 7)
00124$:
	ld	a, _mode+0
	cp	a, #0x07
	jrne	00127$
;	main.c: 382: ChayLEDNgoaiTrong();
	call	_ChayLEDNgoaiTrong
	jra	00124$
;	main.c: 384: while (mode == 8)
00127$:
	ld	a, _mode+0
	cp	a, #0x08
	jreq	00311$
	jp	00107$
00311$:
;	main.c: 386: HaiMau();
	call	_HaiMau
;	main.c: 387: mode = 0;
	clr	_mode+0
	jra	00127$
;	main.c: 390: }
	ret
;	main.c: 391: INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
;	-----------------------------------------
;	 function EXTI_PORTD_IRQHandler
;	-----------------------------------------
_EXTI_PORTD_IRQHandler:
;	main.c: 393: if ((GPIOD->IDR & (1 << 2)) == RESET)
	ld	a, 0x5010
	bcp	a, #0x04
	jrne	00108$
;	main.c: 395: Timer4DelayMs(200);
	ldw	x, #0x00c8
	call	_Timer4DelayMs
;	main.c: 396: while ((GPIOD->IDR & (1 << 2)) == RESET)
00101$:
	btjf	0x5010, #2, 00101$
;	main.c: 398: mode++;
	inc	_mode+0
;	main.c: 399: if (mode > 8)
	ld	a, _mode+0
	cp	a, #0x08
	jrule	00108$
;	main.c: 400: mode = 0;
	clr	_mode+0
00108$:
;	main.c: 402: }
	iret
	.area CODE
	.area CONST
	.area INITIALIZER
__xinit__mode:
	.db #0x00	; 0
	.area CABS (ABS)
