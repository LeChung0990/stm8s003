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
	.globl _tim4_isr
	.globl _mydelay
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
	int 0x000000 ; trap
	int 0x000000 ; int0
	int 0x000000 ; int1
	int 0x000000 ; int2
	int 0x000000 ; int3
	int 0x000000 ; int4
	int 0x000000 ; int5
	int _EXTI_PORTD_IRQHandler ; int6
	int 0x000000 ; int7
	int 0x000000 ; int8
	int 0x000000 ; int9
	int 0x000000 ; int10
	int 0x000000 ; int11
	int 0x000000 ; int12
	int 0x000000 ; int13
	int 0x000000 ; int14
	int 0x000000 ; int15
	int 0x000000 ; int16
	int 0x000000 ; int17
	int 0x000000 ; int18
	int 0x000000 ; int19
	int 0x000000 ; int20
	int 0x000000 ; int21
	int 0x000000 ; int22
	int _tim4_isr ; int23
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
	.area RAM_SEG
;	main.c: 18: void mydelay(uint32_t time){
;	-----------------------------------------
;	 function mydelay
;	-----------------------------------------
_mydelay:
	sub	sp, #4
;	main.c: 19: while(time--);
	ldw	x, (0x09, sp)
	ldw	y, (0x07, sp)
00101$:
	ldw	(0x03, sp), x
	ldw	(0x01, sp), y
	subw	x, #0x0001
	jrnc	00112$
	decw	y
00112$:
	tnz	(0x04, sp)
	jrne	00101$
	tnz	(0x03, sp)
	jrne	00101$
	tnz	(0x02, sp)
	jrne	00101$
	tnz	(0x01, sp)
	jrne	00101$
;	main.c: 20: }
	ldw	x, (5, sp)
	addw	sp, #10
	jp	(x)
;	main.c: 22: void tim4_isr() __interrupt(23) __naked {
;	-----------------------------------------
;	 function tim4_isr
;	-----------------------------------------
_tim4_isr:
;	naked function: no prologue.
;	main.c: 23: __asm__("jp 0x8464");
	jp	0x8464
;	main.c: 24: }
;	main.c: 25: void main (void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	main.c: 29: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
	ld	a, 0x50c6
	and	a, #0xe7
	ld	0x50c6, a
;	main.c: 30: CLK->CKDIVR |= (uint8_t)0x00;
	mov	0x50c6, 0x50c6
;	main.c: 32: LED_PORT->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
	mov	0x500f+0, #0x00
;	main.c: 33: LED_PORT->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
	mov	0x5011+0, #0x00
;	main.c: 34: LED_PORT->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
	mov	0x5012+0, #0x00
;	main.c: 35: LED_PORT->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
	mov	0x5013+0, #0x00
;	main.c: 37: LED_PORT->DDR |= (uint8_t)LED_PIN; /* Set Output mode */
	bset	0x5011, #3
;	main.c: 38: LED_PORT->ODR |= (uint8_t)LED_PIN; /* High level */
	bset	0x500f, #3
;	main.c: 39: LED_PORT->CR1 |= (uint8_t)LED_PIN; /* Pull-Up or Push-Pull */
	bset	0x5012, #3
;	main.c: 40: LED_PORT->CR2 |= (uint8_t)LED_PIN; /* Interrupt or Slow slope */
	bset	0x5013, #3
;	main.c: 57: while (1)
;	main.c: 59: LED_PORT->ODR ^= (uint8_t)LED_PIN;
	ld	a, 0x500f
	xor	a, #0x08
	ld	0x500f, a
;	main.c: 60: for (int x = 0; x < 10; ++x) __asm__("nop");
	clrw	x
00106$:
	cpw	x, #0x000a
	jrslt	00126$
	jp	0x8400
00126$:
	nop
	incw	x
;	main.c: 62: __asm__("jp 0x8400");
	jra	00106$
;	main.c: 87: }
	ret
;	main.c: 100: INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
;	-----------------------------------------
;	 function EXTI_PORTD_IRQHandler
;	-----------------------------------------
_EXTI_PORTD_IRQHandler:
;	main.c: 102: LED_PORT->ODR ^= (uint8_t)LED_PIN;
	bcpl	0x500f, #3
;	main.c: 103: }
	iret
	.area RAM_SEG
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
