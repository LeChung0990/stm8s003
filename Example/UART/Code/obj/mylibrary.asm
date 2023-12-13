;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.0 #14184 (MINGW64)
;--------------------------------------------------------
	.module mylibrary
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _UART1_receive
	.globl _UART1_GetFlagStatus
	.globl _UART1_SendData8
	.globl _UART1_Cmd
	.globl _UART1_Init
	.globl _UART1_DeInit
	.globl _TIM4_ClearFlag
	.globl _TIM4_GetFlagStatus
	.globl _TIM4_SetCounter
	.globl _TIM4_Cmd
	.globl _TIM4_TimeBaseInit
	.globl _data
	.globl _delay_msSetup
	.globl _delay_ms
	.globl _UART1_Setup
	.globl _UART1_number
	.globl _UART1_String
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
_data::
	.ds 1
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
;	mylibrary.c: 4: void delay_msSetup(void)
;	-----------------------------------------
;	 function delay_msSetup
;	-----------------------------------------
_delay_msSetup:
;	mylibrary.c: 6: TIM4_TimeBaseInit(TIM4_PRESCALER_128, 125 - 1);
	push	#0x7c
	ld	a, #0x07
	call	_TIM4_TimeBaseInit
;	mylibrary.c: 7: TIM4_Cmd(ENABLE);
	ld	a, #0x01
;	mylibrary.c: 8: }
	jp	_TIM4_Cmd
;	mylibrary.c: 9: void delay_ms(uint16_t u16Delay)
;	-----------------------------------------
;	 function delay_ms
;	-----------------------------------------
_delay_ms:
	sub	sp, #2
;	mylibrary.c: 11: while (u16Delay) {
	ldw	(0x01, sp), x
00104$:
	ldw	x, (0x01, sp)
	jreq	00107$
;	mylibrary.c: 12: TIM4_SetCounter(0);
	clr	a
	call	_TIM4_SetCounter
;	mylibrary.c: 13: TIM4_ClearFlag(TIM4_FLAG_UPDATE);
	ld	a, #0x01
	call	_TIM4_ClearFlag
;	mylibrary.c: 14: while (TIM4_GetFlagStatus(TIM4_FLAG_UPDATE) == RESET) {}
00101$:
	ld	a, #0x01
	call	_TIM4_GetFlagStatus
	tnz	a
	jreq	00101$
;	mylibrary.c: 15: --u16Delay;
	ldw	x, (0x01, sp)
	decw	x
	ldw	(0x01, sp), x
	jra	00104$
00107$:
;	mylibrary.c: 17: }
	addw	sp, #2
	ret
;	mylibrary.c: 22: void UART1_Setup(void)
;	-----------------------------------------
;	 function UART1_Setup
;	-----------------------------------------
_UART1_Setup:
;	mylibrary.c: 24: UART1_DeInit();
	call	_UART1_DeInit
;	mylibrary.c: 25: UART1_Init(9600, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, 
	push	#0x0c
	push	#0x80
	push	#0x00
	push	#0x00
	push	#0x00
	push	#0x80
	push	#0x25
	clrw	x
	pushw	x
	call	_UART1_Init
;	mylibrary.c: 28: UART1_Cmd(ENABLE);
	ld	a, #0x01
;	mylibrary.c: 29: }
	jp	_UART1_Cmd
;	mylibrary.c: 30: void UART1_number(int number)
;	-----------------------------------------
;	 function UART1_number
;	-----------------------------------------
_UART1_number:
	sub	sp, #10
	ldw	(0x08, sp), x
;	mylibrary.c: 33: char digit[5] = "";
	clr	(0x03, sp)
	clr	(0x04, sp)
	clr	(0x05, sp)
	clr	(0x06, sp)
	clr	(0x07, sp)
;	mylibrary.c: 34: while(number != 0)
	clr	(0x0a, sp)
00101$:
	ldw	x, (0x08, sp)
	jreq	00117$
;	mylibrary.c: 36: digit[count] = number%10;   //lay chu so ngoai cung xxxx8;
	clrw	x
	ld	a, (0x0a, sp)
	ld	xl, a
	pushw	x
	ldw	x, sp
	addw	x, #5
	addw	x, (1, sp)
	ldw	(0x03, sp), x
	addw	sp, #2
	push	#0x0a
	push	#0x00
	ldw	x, (0x0a, sp)
	call	__modsint
	ld	a, xl
	ldw	x, (0x01, sp)
	ld	(x), a
;	mylibrary.c: 37: count++;
	inc	(0x0a, sp)
;	mylibrary.c: 38: number = number/10;         //chia so number cho 10 de bo so ngoai cung xxxx
	push	#0x0a
	push	#0x00
	ldw	x, (0x0a, sp)
	call	__divsint
	ldw	(0x08, sp), x
	jra	00101$
;	mylibrary.c: 40: while (count!=0)
00117$:
00107$:
	tnz	(0x0a, sp)
	jreq	00110$
;	mylibrary.c: 42: UART1_SendData8(digit[count - 1] + 0x30); // 0x30 = 48 ;
	ld	a, (0x0a, sp)
	dec	a
	ld	(0x02, sp), a
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	(0x01, sp), a
	ldw	x, sp
	addw	x, #3
	addw	x, (0x01, sp)
	ld	a, (x)
	add	a, #0x30
	call	_UART1_SendData8
;	mylibrary.c: 43: while(UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET);
00104$:
	ldw	x, #0x0080
	call	_UART1_GetFlagStatus
	tnz	a
	jreq	00104$
;	mylibrary.c: 45: count--;
	dec	(0x0a, sp)
	jra	00107$
00110$:
;	mylibrary.c: 47: }
	addw	sp, #10
	ret
;	mylibrary.c: 48: char UART1_receive()
;	-----------------------------------------
;	 function UART1_receive
;	-----------------------------------------
_UART1_receive:
;	mylibrary.c: 53: return data;
	ld	a, _data+0
;	mylibrary.c: 54: }
	ret
;	mylibrary.c: 55: void UART1_String(const char *cy)
;	-----------------------------------------
;	 function UART1_String
;	-----------------------------------------
_UART1_String:
;	mylibrary.c: 57: while(*cy)
00104$:
	ld	a, (x)
	jrne	00130$
	ret
00130$:
;	mylibrary.c: 59: UART1_SendData8(*cy);
	pushw	x
	call	_UART1_SendData8
	popw	x
;	mylibrary.c: 60: while(UART1_GetFlagStatus(UART1_FLAG_TXE)==0){}
00101$:
	pushw	x
	ldw	x, #0x0080
	call	_UART1_GetFlagStatus
	popw	x
	tnz	a
	jreq	00101$
;	mylibrary.c: 62: cy++;
	incw	x
	jra	00104$
;	mylibrary.c: 64: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
__xinit__data:
	.db #0x00	; 0
	.area CABS (ABS)
