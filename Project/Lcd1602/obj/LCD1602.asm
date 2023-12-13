;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.0 #14184 (MINGW64)
;--------------------------------------------------------
	.module LCD1602
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM4_ClearFlag
	.globl _TIM4_GetFlagStatus
	.globl _TIM4_SetCounter
	.globl _TIM4_Cmd
	.globl _TIM4_TimeBaseInit
	.globl _GPIO_WriteLow
	.globl _GPIO_WriteHigh
	.globl _GPIO_Init
	.globl _delay_ms
	.globl _lcd_init
	.globl _lcd_write
	.globl _lcd_puts
	.globl _lcd_clear
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
;	LCD1602.c: 3: void delay_ms(uint16_t u16Delay)
;	-----------------------------------------
;	 function delay_ms
;	-----------------------------------------
_delay_ms:
	sub	sp, #4
	ldw	(0x01, sp), x
;	LCD1602.c: 5: TIM4_TimeBaseInit(TIM4_PRESCALER_128, 125 - 1);
	push	#0x7c
	ld	a, #0x07
	call	_TIM4_TimeBaseInit
;	LCD1602.c: 6: TIM4_Cmd(ENABLE);
	ld	a, #0x01
	call	_TIM4_Cmd
;	LCD1602.c: 7: while (u16Delay) 
	ldw	y, (0x01, sp)
	ldw	(0x03, sp), y
00104$:
	ldw	x, (0x03, sp)
	jreq	00107$
;	LCD1602.c: 9: TIM4_SetCounter(0);
	clr	a
	call	_TIM4_SetCounter
;	LCD1602.c: 10: TIM4_ClearFlag(TIM4_FLAG_UPDATE);
	ld	a, #0x01
	call	_TIM4_ClearFlag
;	LCD1602.c: 11: while (TIM4_GetFlagStatus(TIM4_FLAG_UPDATE) == RESET) {}
00101$:
	ld	a, #0x01
	call	_TIM4_GetFlagStatus
	tnz	a
	jreq	00101$
;	LCD1602.c: 12: --u16Delay;
	ldw	x, (0x03, sp)
	decw	x
	ldw	(0x03, sp), x
	jra	00104$
00107$:
;	LCD1602.c: 14: }
	addw	sp, #4
	ret
;	LCD1602.c: 15: void lcd_init(void)
;	-----------------------------------------
;	 function lcd_init
;	-----------------------------------------
_lcd_init:
;	LCD1602.c: 18: GPIO_Init(GPIOA,(GPIO_Pin_TypeDef)(GPIO_PIN_1|GPIO_PIN_2),GPIO_MODE_OUT_PP_LOW_FAST);
	push	#0xe0
	ld	a, #0x06
	ldw	x, #0x5000
	call	_GPIO_Init
;	LCD1602.c: 19: GPIO_Init(GPIOD,(GPIO_Pin_TypeDef)(GPIO_PIN_6|GPIO_PIN_4|GPIO_PIN_3|GPIO_PIN_2),GPIO_MODE_OUT_PP_LOW_FAST);
	push	#0xe0
	ld	a, #0x5c
	ldw	x, #0x500f
	call	_GPIO_Init
;	LCD1602.c: 20: delay_ms(40);
	ldw	x, #0x0028
	call	_delay_ms
;	LCD1602.c: 22: PIN_LOW(D4_PORT, D4_PIN);
	ld	a, #0x04
	ldw	x, #0x500f
	call	_GPIO_WriteLow
;	LCD1602.c: 23: PIN_HIGH(D5_PORT,D5_PIN);
	ld	a, #0x08
	ldw	x, #0x500f
	call	_GPIO_WriteHigh
;	LCD1602.c: 24: PIN_LOW(D6_PORT,D6_PIN);
	ld	a, #0x10
	ldw	x, #0x500f
	call	_GPIO_WriteLow
;	LCD1602.c: 25: PIN_LOW(D7_PORT,D7_PIN);
	ld	a, #0x40
	ldw	x, #0x500f
	call	_GPIO_WriteLow
;	LCD1602.c: 26: PIN_LOW(RS_PORT,RS_PIN);
	ld	a, #0x02
	ldw	x, #0x5000
	call	_GPIO_WriteLow
;	LCD1602.c: 28: PIN_HIGH(EN_PORT,EN_PIN);
	ld	a, #0x04
	ldw	x, #0x5000
	call	_GPIO_WriteHigh
;	LCD1602.c: 29: PIN_LOW(EN_PORT,EN_PIN);
	ld	a, #0x04
	ldw	x, #0x5000
	call	_GPIO_WriteLow
;	LCD1602.c: 31: lcd_write(0,0x28);
	push	#0x28
	clr	a
	call	_lcd_write
;	LCD1602.c: 32: lcd_write(0,0x0c);
	push	#0x0c
	clr	a
	call	_lcd_write
;	LCD1602.c: 33: lcd_write(0,0x06);
	push	#0x06
	clr	a
	call	_lcd_write
;	LCD1602.c: 34: lcd_write(0,0x01);
	push	#0x01
	clr	a
	call	_lcd_write
;	LCD1602.c: 35: }
	ret
;	LCD1602.c: 37: void lcd_write(uint8_t type, uint8_t data)
;	-----------------------------------------
;	 function lcd_write
;	-----------------------------------------
_lcd_write:
	push	a
;	LCD1602.c: 39: delay_ms(2);
	push	a
	ldw	x, #0x0002
	call	_delay_ms
	pop	a
;	LCD1602.c: 40: if(type)
	tnz	a
	jreq	00102$
;	LCD1602.c: 42: PIN_HIGH(RS_PORT,RS_PIN);
	ld	a, #0x02
	ldw	x, #0x5000
	call	_GPIO_WriteHigh
	jra	00103$
00102$:
;	LCD1602.c: 45: PIN_LOW(RS_PORT,RS_PIN);
	ld	a, #0x02
	ldw	x, #0x5000
	call	_GPIO_WriteLow
00103$:
;	LCD1602.c: 49: if(data&0x80)
	ld	a, (0x04, sp)
	ld	(0x01, sp), a
	jrpl	00105$
;	LCD1602.c: 51: PIN_HIGH(D7_PORT,D7_PIN);
	ld	a, #0x40
	ldw	x, #0x500f
	call	_GPIO_WriteHigh
	jra	00106$
00105$:
;	LCD1602.c: 54: PIN_LOW(D7_PORT,D7_PIN);
	ld	a, #0x40
	ldw	x, #0x500f
	call	_GPIO_WriteLow
00106$:
;	LCD1602.c: 57: if(data&0x40)
	ld	a, (0x01, sp)
	bcp	a, #0x40
	jreq	00108$
;	LCD1602.c: 59: PIN_HIGH(D6_PORT,D6_PIN);
	ld	a, #0x10
	ldw	x, #0x500f
	call	_GPIO_WriteHigh
	jra	00109$
00108$:
;	LCD1602.c: 62: PIN_LOW(D6_PORT,D6_PIN);
	ld	a, #0x10
	ldw	x, #0x500f
	call	_GPIO_WriteLow
00109$:
;	LCD1602.c: 65: if(data&0x20)
	ld	a, (0x01, sp)
	bcp	a, #0x20
	jreq	00111$
;	LCD1602.c: 67: PIN_HIGH(D5_PORT,D5_PIN);
	ld	a, #0x08
	ldw	x, #0x500f
	call	_GPIO_WriteHigh
	jra	00112$
00111$:
;	LCD1602.c: 70: PIN_LOW(D5_PORT,D5_PIN);
	ld	a, #0x08
	ldw	x, #0x500f
	call	_GPIO_WriteLow
00112$:
;	LCD1602.c: 73: if(data&0x10)
	ld	a, (0x01, sp)
	bcp	a, #0x10
	jreq	00114$
;	LCD1602.c: 75: PIN_HIGH(D4_PORT,D4_PIN);
	ld	a, #0x04
	ldw	x, #0x500f
	call	_GPIO_WriteHigh
	jra	00115$
00114$:
;	LCD1602.c: 78: PIN_LOW(D4_PORT,D4_PIN);
	ld	a, #0x04
	ldw	x, #0x500f
	call	_GPIO_WriteLow
00115$:
;	LCD1602.c: 80: PIN_HIGH(EN_PORT,EN_PIN);
	ld	a, #0x04
	ldw	x, #0x5000
	call	_GPIO_WriteHigh
;	LCD1602.c: 81: PIN_LOW(EN_PORT,EN_PIN);
	ld	a, #0x04
	ldw	x, #0x5000
	call	_GPIO_WriteLow
;	LCD1602.c: 85: if(data&0x08)
	ld	a, (0x01, sp)
	bcp	a, #0x08
	jreq	00117$
;	LCD1602.c: 87: PIN_HIGH(D7_PORT,D7_PIN);
	ld	a, #0x40
	ldw	x, #0x500f
	call	_GPIO_WriteHigh
	jra	00118$
00117$:
;	LCD1602.c: 90: PIN_LOW(D7_PORT,D7_PIN);
	ld	a, #0x40
	ldw	x, #0x500f
	call	_GPIO_WriteLow
00118$:
;	LCD1602.c: 93: if(data&0x04)
	ld	a, (0x01, sp)
	bcp	a, #0x04
	jreq	00120$
;	LCD1602.c: 95: PIN_HIGH(D6_PORT,D6_PIN);
	ld	a, #0x10
	ldw	x, #0x500f
	call	_GPIO_WriteHigh
	jra	00121$
00120$:
;	LCD1602.c: 98: PIN_LOW(D6_PORT,D6_PIN);
	ld	a, #0x10
	ldw	x, #0x500f
	call	_GPIO_WriteLow
00121$:
;	LCD1602.c: 101: if(data&0x02)
	ld	a, (0x01, sp)
	bcp	a, #0x02
	jreq	00123$
;	LCD1602.c: 103: PIN_HIGH(D5_PORT,D5_PIN);
	ld	a, #0x08
	ldw	x, #0x500f
	call	_GPIO_WriteHigh
	jra	00124$
00123$:
;	LCD1602.c: 106: PIN_LOW(D5_PORT,D5_PIN);
	ld	a, #0x08
	ldw	x, #0x500f
	call	_GPIO_WriteLow
00124$:
;	LCD1602.c: 109: if(data&0x01)
	ld	a, (0x01, sp)
	srl	a
	jrnc	00126$
;	LCD1602.c: 111: PIN_HIGH(D4_PORT,D4_PIN);
	ld	a, #0x04
	ldw	x, #0x500f
	call	_GPIO_WriteHigh
	jra	00127$
00126$:
;	LCD1602.c: 114: PIN_LOW(D4_PORT,D4_PIN);
	ld	a, #0x04
	ldw	x, #0x500f
	call	_GPIO_WriteLow
00127$:
;	LCD1602.c: 116: PIN_HIGH(EN_PORT,EN_PIN);
	ld	a, #0x04
	ldw	x, #0x5000
	call	_GPIO_WriteHigh
;	LCD1602.c: 117: PIN_LOW(EN_PORT,EN_PIN);
	ld	a, #0x04
	ldw	x, #0x5000
	ldw	y, (2, sp)
	ldw	(3, sp), y
	addw	sp, #2
	jp	_GPIO_WriteLow
;	LCD1602.c: 118: }
	pop	a
	popw	x
	pop	a
	jp	(x)
;	LCD1602.c: 120: void lcd_puts(uint8_t x, uint8_t y, int8_t *string)
;	-----------------------------------------
;	 function lcd_puts
;	-----------------------------------------
_lcd_puts:
;	LCD1602.c: 125: lcd_write(0,0x80+0x00+y);
	exg	a, xl
	ld	a, (0x03, sp)
	exg	a, xl
;	LCD1602.c: 122: switch(x)
	cp	a, #0x00
	jreq	00101$
	dec	a
	jreq	00102$
	jra	00112$
;	LCD1602.c: 124: case 0: //Row 0
00101$:
;	LCD1602.c: 125: lcd_write(0,0x80+0x00+y);
	ld	a, xl
	add	a, #0x80
	push	a
	clr	a
	call	_lcd_write
;	LCD1602.c: 126: break;
	jra	00112$
;	LCD1602.c: 127: case 1: //Row 1
00102$:
;	LCD1602.c: 128: lcd_write(0,0x80+0x40+y);
	ld	a, xl
	add	a, #0xc0
	push	a
	clr	a
	call	_lcd_write
;	LCD1602.c: 131: while(*string)
00112$:
	ldw	x, (0x04, sp)
00104$:
	ld	a, (x)
	jreq	00107$
;	LCD1602.c: 133: lcd_write(1,*string);
	pushw	x
	push	a
	ld	a, #0x01
	call	_lcd_write
	popw	x
;	LCD1602.c: 134: string++;
	incw	x
	jra	00104$
00107$:
;	LCD1602.c: 136: }
	ldw	x, (1, sp)
	addw	sp, #5
	jp	(x)
;	LCD1602.c: 137: void lcd_clear(void)
;	-----------------------------------------
;	 function lcd_clear
;	-----------------------------------------
_lcd_clear:
;	LCD1602.c: 139: lcd_write(0,0x01);
	push	#0x01
	clr	a
	call	_lcd_write
;	LCD1602.c: 140: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
