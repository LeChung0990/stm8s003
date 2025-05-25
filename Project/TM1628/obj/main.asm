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
	.globl _Read_EEPROM
	.globl _TM1628_DISPLAY_SEGMENTS
	.globl _TM1628_INIT
	.globl _delay_us
	.globl _delay_config
	.globl _TIM4_ClearITPendingBit
	.globl _GPIO_ReadInputPin
	.globl _GPIO_Init
	.globl _GPIO_DeInit
	.globl _counter
	.globl _second
	.globl _minute
	.globl _buffer
	.globl _i
	.globl _Clock_setup
	.globl _GPIO_setup
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_i::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
_buffer::
	.ds 14
_minute::
	.ds 1
_second::
	.ds 1
_counter::
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
;	main.c: 34: void main()
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	main.c: 36: Clock_setup();
	call	_Clock_setup
;	main.c: 37: GPIO_setup();
	call	_GPIO_setup
;	main.c: 38: delay_config();
	call	_delay_config
;	main.c: 41: TM1628_INIT(1,1);
	push	#0x01
	ld	a, #0x01
	call	_TM1628_INIT
;	main.c: 43: delay_us(1000);
	push	#0xe8
	push	#0x03
	clrw	x
	pushw	x
	call	_delay_us
;	main.c: 44: minute = Read_EEPROM(0x4000);
	push	#0x00
	push	#0x40
	clrw	x
	pushw	x
	call	_Read_EEPROM
	ld	_minute+0, a
;	main.c: 45: second = Read_EEPROM(0x4001);
	push	#0x01
	push	#0x40
	clrw	x
	pushw	x
	call	_Read_EEPROM
	ld	_second+0, a
;	main.c: 46: delay_us(1000);
	push	#0xe8
	push	#0x03
	clrw	x
	pushw	x
	call	_delay_us
;	main.c: 49: while (1)
00111$:
;	main.c: 51: if (GPIO_ReadInputPin(BUT_PORT, BUT_PIN) == RESET){
	ld	a, #0x08
	ldw	x, #0x5000
	call	_GPIO_ReadInputPin
	tnz	a
	jrne	00105$
;	main.c: 52: delay_us(1000000);
	push	#0x40
	push	#0x42
	push	#0x0f
	push	#0x00
	call	_delay_us
;	main.c: 53: while (GPIO_ReadInputPin(BUT_PORT, BUT_PIN) == RESET);
00101$:
	ld	a, #0x08
	ldw	x, #0x5000
	call	_GPIO_ReadInputPin
	tnz	a
	jreq	00101$
00105$:
;	main.c: 56: buffer[0] = minute / 10;
	ld	a, _minute+0
	clrw	x
	push	#0x0a
	push	#0x00
	ld	xl, a
	call	__divsint
	ld	a, xl
	ld	_buffer+0, a
;	main.c: 57: buffer[2] = minute % 10;
	clrw	x
	ld	a, _minute+0
	ld	xl, a
	push	#0x0a
	push	#0x00
	call	__modsint
	ld	a, xl
	ld	_buffer+2, a
;	main.c: 58: buffer[4] = second / 10;
	clrw	x
	ld	a, _second+0
	ld	xl, a
	push	#0x0a
	push	#0x00
	call	__divsint
	ld	a, xl
	ld	_buffer+4, a
;	main.c: 59: buffer[6] = second % 10;
	clrw	x
	ld	a, _second+0
	ld	xl, a
	push	#0x0a
	push	#0x00
	call	__modsint
	ld	a, xl
	ld	_buffer+6, a
;	main.c: 61: for(i=0; i< 14; ++i)
	clr	_i+0
00113$:
;	main.c: 63: if( second % 2 ){
	clrw	y
	ld	a, _second+0
	and	a, #0x01
	ld	yl, a
;	main.c: 64: TM1628_DISPLAY_SEGMENTS(i,buffer[i],1); 
	clrw	x
	ld	a, _i+0
	ld	xl, a
	ld	a, (_buffer+0, x)
;	main.c: 63: if( second % 2 ){
	tnzw	y
	jreq	00107$
;	main.c: 64: TM1628_DISPLAY_SEGMENTS(i,buffer[i],1); 
	push	#0x01
	push	a
	ld	a, _i+0
	call	_TM1628_DISPLAY_SEGMENTS
	jra	00114$
00107$:
;	main.c: 67: TM1628_DISPLAY_SEGMENTS(i,buffer[i],0); 
	push	#0x00
	push	a
	ld	a, _i+0
	call	_TM1628_DISPLAY_SEGMENTS
00114$:
;	main.c: 61: for(i=0; i< 14; ++i)
	inc	_i+0
	ld	a, _i+0
	cp	a, #0x0e
	jrc	00113$
;	main.c: 71: }
	jp	00111$
;	main.c: 73: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
;	-----------------------------------------
;	 function TIM4_UPD_OVF_IRQHandler
;	-----------------------------------------
_TIM4_UPD_OVF_IRQHandler:
	clr	a
	div	x, a
;	main.c: 75: counter++;
	ldw	x, _counter+0
	incw	x
;	main.c: 76: if (counter == 1000)
	ldw	_counter+0, x
	cpw	x, #0x03e8
	jrne	00106$
;	main.c: 78: counter = 0;
	clrw	x
	ldw	_counter+0, x
;	main.c: 79: second++;
	inc	_second+0
;	main.c: 80: if (second > 59) 
	ld	a, _second+0
	cp	a, #0x3b
	jrule	00106$
;	main.c: 82: second = 0;
	clr	_second+0
;	main.c: 83: minute++;
	inc	_minute+0
;	main.c: 84: if (minute > 59) minute = 0;
	ld	a, _minute+0
	cp	a, #0x3b
	jrule	00106$
	clr	_minute+0
00106$:
;	main.c: 88: TIM4_ClearITPendingBit(TIM4_IT_UPDATE); 
	ld	a, #0x01
	call	_TIM4_ClearITPendingBit
;	main.c: 89: }
	iret
;	main.c: 91: void Clock_setup(void)
;	-----------------------------------------
;	 function Clock_setup
;	-----------------------------------------
_Clock_setup:
;	main.c: 94: CLK->ICKR = CLK_ICKR_RESET_VALUE;
	mov	0x50c0+0, #0x01
;	main.c: 95: CLK->ECKR = CLK_ECKR_RESET_VALUE;
	mov	0x50c1+0, #0x00
;	main.c: 96: CLK->SWR  = CLK_SWR_RESET_VALUE;
	mov	0x50c4+0, #0xe1
;	main.c: 97: CLK->SWCR = CLK_SWCR_RESET_VALUE;
	mov	0x50c5+0, #0x00
;	main.c: 98: CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
	mov	0x50c6+0, #0x18
;	main.c: 99: CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
	mov	0x50c7+0, #0xff
;	main.c: 100: CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
	mov	0x50ca+0, #0xff
;	main.c: 101: CLK->CSSR = CLK_CSSR_RESET_VALUE;
	mov	0x50c8+0, #0x00
;	main.c: 102: CLK->CCOR = CLK_CCOR_RESET_VALUE;
	mov	0x50c9+0, #0x00
;	main.c: 103: while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0) {}
00101$:
	btjt	0x50c9, #0, 00101$
;	main.c: 104: CLK->CCOR = CLK_CCOR_RESET_VALUE;
	mov	0x50c9+0, #0x00
;	main.c: 105: CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
	mov	0x50cc+0, #0x00
;	main.c: 106: CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
	mov	0x50cd+0, #0x00
;	main.c: 109: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
	ld	a, 0x50c6
	and	a, #0xe7
	ld	0x50c6, a
;	main.c: 112: CLK->CKDIVR |= (uint8_t)0x00; /*!< High speed internal clock prescaler: 1 */
	mov	0x50c6, 0x50c6
;	main.c: 113: }
	ret
;	main.c: 116: void GPIO_setup(void)
;	-----------------------------------------
;	 function GPIO_setup
;	-----------------------------------------
_GPIO_setup:
;	main.c: 119: GPIO_DeInit(GPIOD);
	ldw	x, #0x500f
	call	_GPIO_DeInit
;	main.c: 120: GPIO_DeInit(GPIOC);
	ldw	x, #0x500a
	call	_GPIO_DeInit
;	main.c: 121: GPIO_DeInit(GPIOA);
	ldw	x, #0x5000
	call	_GPIO_DeInit
;	main.c: 122: GPIO_DeInit(GPIOE);
	ldw	x, #0x5014
	call	_GPIO_DeInit
;	main.c: 123: GPIO_DeInit(GPIOB);   
	ldw	x, #0x5005
	call	_GPIO_DeInit
;	main.c: 124: GPIO_DeInit(GPIOF);
	ldw	x, #0x5019
	call	_GPIO_DeInit
;	main.c: 126: GPIO_Init(BUT_PORT, BUT_PIN, GPIO_MODE_IN_PU_NO_IT);
	push	#0x40
	ld	a, #0x08
	ldw	x, #0x5000
	call	_GPIO_Init
;	main.c: 127: GPIO_Init(GPIOB, GPIO_PIN_4 | GPIO_PIN_5, GPIO_MODE_OUT_OD_HIZ_SLOW);
	push	#0x90
	ld	a, #0x30
	ldw	x, #0x5005
	call	_GPIO_Init
;	main.c: 128: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
__xinit__buffer:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
__xinit__minute:
	.db #0x00	; 0
__xinit__second:
	.db #0x00	; 0
__xinit__counter:
	.dw #0x0000
	.area CABS (ABS)
