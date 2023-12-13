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
	.globl _UART1_String
	.globl _UART1_number
	.globl _UART1_Setup
	.globl _delay_ms
	.globl _delay_msSetup
	.globl _CLK_HSIPrescalerConfig
	.globl _adc_value
	.globl _volt
	.globl _datareceive
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
_datareceive::
	.ds 1
_volt::
	.ds 4
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
;	main.c: 6: void main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	main.c: 9: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
	clr	a
	call	_CLK_HSIPrescalerConfig
;	main.c: 14: delay_msSetup();
	call	_delay_msSetup
;	main.c: 16: UART1_Setup();
	call	_UART1_Setup
;	main.c: 26: while(1) 
00102$:
;	main.c: 37: UART1_String("chung");
	ldw	x, #(___str_0+0)
	call	_UART1_String
;	main.c: 39: UART1_number(987);
	ldw	x, #0x03db
	call	_UART1_number
;	main.c: 40: delay_ms(1000);
	ldw	x, #0x03e8
	call	_delay_ms
	jra	00102$
;	main.c: 66: }
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "chung"
	.db 0x00
	.area CODE
	.area INITIALIZER
__xinit__datareceive:
	.db #0x00	; 0
__xinit__volt:
	.byte #0x00, #0x00, #0x00, #0x00	;  0.000000e+00
__xinit__adc_value:
	.dw #0x0000
	.area CABS (ABS)
