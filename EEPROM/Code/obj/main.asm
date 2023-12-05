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
	.globl _Read_EEPROM
	.globl _Write_EEPROM
	.globl _TIM4_ClearFlag
	.globl _TIM4_GetFlagStatus
	.globl _TIM4_SetCounter
	.globl _TIM4_Cmd
	.globl _TIM4_TimeBaseInit
	.globl _GPIO_WriteLow
	.globl _GPIO_WriteHigh
	.globl _GPIO_Init
	.globl _GPIO_DeInit
	.globl _FLASH_ReadByte
	.globl _FLASH_ProgramByte
	.globl _FLASH_Lock
	.globl _FLASH_Unlock
	.globl _CLK_HSIPrescalerConfig
	.globl _delay_ms
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
;	main.c: 5: void Write_EEPROM(uint8_t Data){
;	-----------------------------------------
;	 function Write_EEPROM
;	-----------------------------------------
_Write_EEPROM:
;	main.c: 6: FLASH_Unlock(FLASH_MEMTYPE_DATA);
	push	a
	ld	a, #0xf7
	call	_FLASH_Unlock
	push	#0x00
	push	#0x40
	clrw	x
	pushw	x
	call	_FLASH_ProgramByte
;	main.c: 8: FLASH_Lock(FLASH_MEMTYPE_DATA);
	ld	a, #0xf7
;	main.c: 9: }
	jp	_FLASH_Lock
;	main.c: 10: uint8_t Read_EEPROM(uint32_t Address){
;	-----------------------------------------
;	 function Read_EEPROM
;	-----------------------------------------
_Read_EEPROM:
;	main.c: 12: Data = FLASH_ReadByte(Address);
	ldw	x, (0x05, sp)
	pushw	x
	ldw	x, (0x05, sp)
	pushw	x
	call	_FLASH_ReadByte
;	main.c: 13: return Data;
;	main.c: 14: }
	ldw	x, (1, sp)
	addw	sp, #6
	jp	(x)
;	main.c: 16: void main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	main.c: 19: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
	clr	a
	call	_CLK_HSIPrescalerConfig
;	main.c: 20: GPIO_DeInit(GPIOD); 	/*CLEAR REGISTER GPIO OR RESET VALUE*/
	ldw	x, #0x500f
	call	_GPIO_DeInit
;	main.c: 21: GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);
	push	#0xe0
	ld	a, #0x08
	ldw	x, #0x500f
	call	_GPIO_Init
;	main.c: 22: TIM4_TimeBaseInit(TIM4_PRESCALER_128, 63 - 1);
	push	#0x3e
	ld	a, #0x07
	call	_TIM4_TimeBaseInit
;	main.c: 23: TIM4_Cmd(ENABLE);
	ld	a, #0x01
	call	_TIM4_Cmd
;	main.c: 25: Write_EEPROM(0x82);
	ld	a, #0x82
	call	_Write_EEPROM
;	main.c: 26: while(1) {
00105$:
;	main.c: 27: if(Read_EEPROM(0x407F) == 255) GPIO_WriteHigh(GPIOD, GPIO_PIN_3);	/*Nhap nhay LED tai chan PD3*/
	push	#0x7f
	push	#0x40
	clrw	x
	pushw	x
	call	_Read_EEPROM
	inc	a
	jrne	00102$
	ld	a, #0x08
	ldw	x, #0x500f
	call	_GPIO_WriteHigh
	jra	00105$
00102$:
;	main.c: 28: else GPIO_WriteLow(GPIOD, GPIO_PIN_3);
	ld	a, #0x08
	ldw	x, #0x500f
	call	_GPIO_WriteLow
	jra	00105$
;	main.c: 30: }
	ret
;	main.c: 32: void delay_ms(uint16_t u16Delay)	//Ham delay dung timer4
;	-----------------------------------------
;	 function delay_ms
;	-----------------------------------------
_delay_ms:
	sub	sp, #2
;	main.c: 35: while (u16Delay) {
	ldw	(0x01, sp), x
00104$:
	ldw	x, (0x01, sp)
	jreq	00107$
;	main.c: 36: TIM4_SetCounter(0);
	clr	a
	call	_TIM4_SetCounter
;	main.c: 37: TIM4_ClearFlag(TIM4_FLAG_UPDATE);
	ld	a, #0x01
	call	_TIM4_ClearFlag
;	main.c: 38: while (TIM4_GetFlagStatus(TIM4_FLAG_UPDATE) == RESET) {
00101$:
	ld	a, #0x01
	call	_TIM4_GetFlagStatus
	tnz	a
	jreq	00101$
;	main.c: 40: --u16Delay;
	ldw	x, (0x01, sp)
	decw	x
	ldw	(0x01, sp), x
	jra	00104$
00107$:
;	main.c: 42: }
	addw	sp, #2
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
