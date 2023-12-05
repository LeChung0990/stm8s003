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
	.globl _read_adc
	.globl _config
	.globl _TIM4_ClearFlag
	.globl _TIM4_GetFlagStatus
	.globl _TIM4_SetCounter
	.globl _TIM4_Cmd
	.globl _TIM4_TimeBaseInit
	.globl _GPIO_WriteLow
	.globl _GPIO_WriteHigh
	.globl _GPIO_Init
	.globl _CLK_HSIPrescalerConfig
	.globl _ADC1_ClearFlag
	.globl _ADC1_GetFlagStatus
	.globl _ADC1_GetConversionValue
	.globl _ADC1_StartConversion
	.globl _ADC1_Cmd
	.globl _ADC1_Init
	.globl _ADC1_DeInit
	.globl _adc_value
	.globl _delay_ms
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
_adc_value::
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
;	main.c: 5: void config(void)
;	-----------------------------------------
;	 function config
;	-----------------------------------------
_config:
;	main.c: 7: ADC1->CR1 |= (uint8_t)(ADC1_CSR_CH);
	ld	a, 0x5401
	or	a, #0x0f
	ld	0x5401, a
;	main.c: 8: ADC1->CR2 |= (uint8_t)(ADC1_CR2_ALIGN);
	bset	0x5402, #3
;	main.c: 9: ADC1->CR1 |= (uint8_t)(ADC1_CR1_ADON);
	bset	0x5401, #0
;	main.c: 10: }
	ret
;	main.c: 11: uint16_t read_adc(void)
;	-----------------------------------------
;	 function read_adc
;	-----------------------------------------
_read_adc:
;	main.c: 14: ADC1->CR1 |= (uint8_t)(ADC1_CR1_ADON);
	bset	0x5401, #0
;	main.c: 15: while(ADC1_GetFlagStatus(ADC1_FLAG_EOC)==0){}
00101$:
	ld	a, #0x80
	call	_ADC1_GetFlagStatus
	tnz	a
	jreq	00101$
;	main.c: 16: ADC1_ClearFlag(ADC1_FLAG_EOC);
	ld	a, #0x80
	call	_ADC1_ClearFlag
;	main.c: 17: value = ADC1_GetConversionValue();
	call	_ADC1_GetConversionValue
;	main.c: 18: return value;
;	main.c: 19: }
	ret
;	main.c: 20: void main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	main.c: 22: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
	clr	a
	call	_CLK_HSIPrescalerConfig
;	main.c: 24: TIM4_TimeBaseInit(TIM4_PRESCALER_128, 125 - 1);
	push	#0x7c
	ld	a, #0x07
	call	_TIM4_TimeBaseInit
;	main.c: 25: TIM4_Cmd(ENABLE);
	ld	a, #0x01
	call	_TIM4_Cmd
;	main.c: 27: GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_HIGH_FAST);
	push	#0xf0
	ld	a, #0x08
	ldw	x, #0x500f
	call	_GPIO_Init
;	main.c: 28: GPIO_Init(GPIOD, GPIO_PIN_2, GPIO_MODE_IN_FL_NO_IT);
	push	#0x00
	ld	a, #0x04
	ldw	x, #0x500f
	call	_GPIO_Init
;	main.c: 30: ADC1_DeInit();
	call	_ADC1_DeInit
;	main.c: 31: ADC1_Init(ADC1_CONVERSIONMODE_SINGLE, ADC1_CHANNEL_3, ADC1_PRESSEL_FCPU_D18, 
	push	#0x00
	push	#0x03
	push	#0x08
	push	#0x00
	push	#0x00
	push	#0x70
	push	#0x03
	clr	a
	call	_ADC1_Init
;	main.c: 33: ADC1_Cmd(ENABLE);
	ld	a, #0x01
	call	_ADC1_Cmd
;	main.c: 34: while(1) {
00108$:
;	main.c: 35: ADC1_StartConversion();
	call	_ADC1_StartConversion
;	main.c: 36: while(ADC1_GetFlagStatus(ADC1_FLAG_EOC)==0){}
00101$:
	ld	a, #0x80
	call	_ADC1_GetFlagStatus
	tnz	a
	jreq	00101$
;	main.c: 37: ADC1_ClearFlag(ADC1_FLAG_EOC);
	ld	a, #0x80
	call	_ADC1_ClearFlag
;	main.c: 38: adc_value = ADC1_GetConversionValue();
	call	_ADC1_GetConversionValue
	ldw	_adc_value+0, x
;	main.c: 39: if(adc_value > 1000)
	ldw	x, _adc_value+0
	cpw	x, #0x03e8
	jrule	00105$
;	main.c: 40: { GPIO_WriteHigh(GPIOD, GPIO_PIN_3);}
	ld	a, #0x08
	ldw	x, #0x500f
	call	_GPIO_WriteHigh
	jra	00106$
00105$:
;	main.c: 42: {GPIO_WriteLow(GPIOD, GPIO_PIN_3);}
	ld	a, #0x08
	ldw	x, #0x500f
	call	_GPIO_WriteLow
00106$:
;	main.c: 43: delay_ms(100);
	ldw	x, #0x0064
	call	_delay_ms
	jra	00108$
;	main.c: 45: }
	ret
;	main.c: 47: void delay_ms(uint16_t u16Delay)
;	-----------------------------------------
;	 function delay_ms
;	-----------------------------------------
_delay_ms:
	sub	sp, #2
;	main.c: 50: while (u16Delay) {
	ldw	(0x01, sp), x
00104$:
	ldw	x, (0x01, sp)
	jreq	00107$
;	main.c: 51: TIM4_SetCounter(0);
	clr	a
	call	_TIM4_SetCounter
;	main.c: 52: TIM4_ClearFlag(TIM4_FLAG_UPDATE);
	ld	a, #0x01
	call	_TIM4_ClearFlag
;	main.c: 53: while (TIM4_GetFlagStatus(TIM4_FLAG_UPDATE) == RESET) {
00101$:
	ld	a, #0x01
	call	_TIM4_GetFlagStatus
	tnz	a
	jreq	00101$
;	main.c: 55: --u16Delay;
	ldw	x, (0x01, sp)
	decw	x
	ldw	(0x01, sp), x
	jra	00104$
00107$:
;	main.c: 57: }
	addw	sp, #2
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
__xinit__adc_value:
	.dw #0x0000
	.area CABS (ABS)
