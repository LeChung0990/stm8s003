;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.0 #14184 (MINGW64)
;--------------------------------------------------------
	.module main
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM4_UPD_OVF_IRQHandler
	.globl _main
	.globl _Timer4DelayMs
	.globl _Timer4Config
	.globl _TIM4_ClearFlag
	.globl _TIM4_SetCounter
	.globl _TIM4_ITConfig
	.globl _TIM4_Cmd
	.globl _TIM4_TimeBaseInit
	.globl _GPIO_WriteReverse
	.globl _GPIO_Init
	.globl _GPIO_DeInit
	.globl _CLK_HSIPrescalerConfig
	.globl _i
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
_i::
	.ds 2
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
	int 0x000000 ; int6
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
	int _TIM4_UPD_OVF_IRQHandler ; int23
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
;	main.c: 6: void Timer4Config(void){
;	-----------------------------------------
;	 function Timer4Config
;	-----------------------------------------
_Timer4Config:
;	main.c: 7: TIM4->PSCR = (uint8_t)TIM4_PRESCALER_128;
	mov	0x5347+0, #0x07
;	main.c: 8: TIM4->ARR = (uint8_t)125 - 1;
	mov	0x5348+0, #0x7c
;	main.c: 10: TIM4->CR1 |= TIM4_CR1_CEN;
	bset	0x5340, #0
;	main.c: 11: }
	ret
;	main.c: 12: void Timer4DelayMs(uint16_t u16Delay){
;	-----------------------------------------
;	 function Timer4DelayMs
;	-----------------------------------------
_Timer4DelayMs:
;	main.c: 13: while(u16Delay){
00104$:
	tnzw	x
	jrne	00130$
	ret
00130$:
;	main.c: 14: TIM4->CNTR = (uint8_t)0;
	mov	0x5346+0, #0x00
;	main.c: 16: TIM4->SR1 = (uint8_t)(~0x01);
	mov	0x5344+0, #0xfe
;	main.c: 17: while((TIM4->SR1 & (uint8_t)0x01) == RESET){}
00101$:
	btjf	0x5344, #0, 00101$
;	main.c: 18: --u16Delay;
	decw	x
	jra	00104$
;	main.c: 20: }
	ret
;	main.c: 22: void main (void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	main.c: 24: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
	clr	a
	call	_CLK_HSIPrescalerConfig
;	main.c: 25: GPIO_DeInit(GPIOD);
	ldw	x, #0x500f
	call	_GPIO_DeInit
;	main.c: 26: GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_HIGH_FAST);
	push	#0xf0
	ld	a, #0x08
	ldw	x, #0x500f
	call	_GPIO_Init
;	main.c: 29: TIM4_TimeBaseInit(TIM4_PRESCALER_128, 125 - 1);
	push	#0x7c
	ld	a, #0x07
	call	_TIM4_TimeBaseInit
;	main.c: 30: TIM4_SetCounter(0);
	clr	a
	call	_TIM4_SetCounter
;	main.c: 31: TIM4_ClearFlag(TIM4_FLAG_UPDATE);
	ld	a, #0x01
	call	_TIM4_ClearFlag
;	main.c: 32: TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
	push	#0x01
	ld	a, #0x01
	call	_TIM4_ITConfig
;	main.c: 33: enableInterrupts();
	rim
;	main.c: 34: TIM4_Cmd(ENABLE);
	ld	a, #0x01
	call	_TIM4_Cmd
;	main.c: 36: while(1) 
00102$:
	jra	00102$
;	main.c: 39: }
	ret
;	main.c: 42: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
;	-----------------------------------------
;	 function TIM4_UPD_OVF_IRQHandler
;	-----------------------------------------
_TIM4_UPD_OVF_IRQHandler:
	clr	a
	div	x, a
;	main.c: 44: TIM4_SetCounter(0);
	clr	a
	call	_TIM4_SetCounter
;	main.c: 45: TIM4_ClearFlag(TIM4_FLAG_UPDATE);
	ld	a, #0x01
	call	_TIM4_ClearFlag
;	main.c: 46: i++;
	ldw	x, _i+0
	incw	x
;	main.c: 47: if(i>500)
	ldw	_i+0, x
	cpw	x, #0x01f4
	jrule	00103$
;	main.c: 49: GPIO_WriteReverse(GPIOD, GPIO_PIN_3);
	ld	a, #0x08
	ldw	x, #0x500f
	call	_GPIO_WriteReverse
;	main.c: 50: i=0;
	clrw	x
	ldw	_i+0, x
00103$:
;	main.c: 52: }  
	iret
	.area CODE
	.area CONST
	.area INITIALIZER
__xinit__i:
	.dw #0x0000
	.area CABS (ABS)
