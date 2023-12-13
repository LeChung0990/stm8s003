;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.0 #14184 (MINGW64)
;--------------------------------------------------------
	.module main
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _Timer4DelayMs
	.globl _Timer4Config
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
;	main.c: 11: void Timer4Config(void){
;	-----------------------------------------
;	 function Timer4Config
;	-----------------------------------------
_Timer4Config:
;	main.c: 12: TIM4->PSCR = (uint8_t)0x07;
	mov	0x5347+0, #0x07
;	main.c: 13: TIM4->ARR = (uint8_t)125 - 1;
	mov	0x5348+0, #0x7c
;	main.c: 15: TIM4->CR1 |= TIM4_CR1_CEN;
	bset	0x5340, #0
;	main.c: 16: }
	ret
;	main.c: 17: void Timer4DelayMs(uint16_t u16Delay){
;	-----------------------------------------
;	 function Timer4DelayMs
;	-----------------------------------------
_Timer4DelayMs:
;	main.c: 18: while(u16Delay){
00104$:
	tnzw	x
	jrne	00130$
	ret
00130$:
;	main.c: 19: TIM4->CNTR = (uint8_t)0;
	mov	0x5346+0, #0x00
;	main.c: 21: TIM4->SR1 = (uint8_t)(~0x01);
	mov	0x5344+0, #0xfe
;	main.c: 22: while((TIM4->SR1 & (uint8_t)0x01) == RESET){}
00101$:
	btjf	0x5344, #0, 00101$
;	main.c: 23: --u16Delay;
	decw	x
	jra	00104$
;	main.c: 25: }
	ret
;	main.c: 28: void main (void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	main.c: 32: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
	ld	a, 0x50c6
	and	a, #0xe7
	ld	0x50c6, a
;	main.c: 33: CLK->CKDIVR |= (uint8_t)CLK_PRESCALER_HSIDIV1;
	mov	0x50c6, 0x50c6
;	main.c: 35: LED_PORT->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
	mov	0x500f+0, #0x00
;	main.c: 36: LED_PORT->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
	mov	0x5011+0, #0x00
;	main.c: 37: LED_PORT->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
	mov	0x5012+0, #0x00
;	main.c: 38: LED_PORT->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
	mov	0x5013+0, #0x00
;	main.c: 40: LED_PORT->DDR |= (uint8_t)LED_PIN; /* Set Output mode */
	bset	0x5011, #3
;	main.c: 41: LED_PORT->ODR |= (uint8_t)LED_PIN; /* High level */
	bset	0x500f, #3
;	main.c: 42: LED_PORT->CR1 |= (uint8_t)LED_PIN; /* Pull-Up or Push-Pull */
	bset	0x5012, #3
;	main.c: 43: LED_PORT->CR2 |= (uint8_t)LED_PIN; /* Interrupt or Slow slope */
	bset	0x5013, #3
;	main.c: 44: Timer4Config();
	call	_Timer4Config
;	main.c: 50: while (1)
00102$:
;	main.c: 52: Timer4DelayMs(10);
	ldw	x, #0x000a
	call	_Timer4DelayMs
;	main.c: 53: LED_PORT->ODR ^= (uint8_t)LED_PIN;
	bcpl	0x500f, #3
	jra	00102$
;	main.c: 75: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
