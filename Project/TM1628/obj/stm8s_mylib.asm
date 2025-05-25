;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.0 #14184 (MINGW64)
;--------------------------------------------------------
	.module stm8s_mylib
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TM1628_SEND_CONFIG
	.globl _TM1628_SEND_COMMAND
	.globl _SEND_WRITE
	.globl _SEND_START
	.globl _SEND_STOP
	.globl _TIM4_ClearFlag
	.globl _TIM4_GetFlagStatus
	.globl _TIM4_SetCounter
	.globl _TIM4_ITConfig
	.globl _TIM4_Cmd
	.globl _TIM4_TimeBaseInit
	.globl _TIM4_DeInit
	.globl _GPIO_WriteLow
	.globl _GPIO_WriteHigh
	.globl _GPIO_Init
	.globl _delay_config
	.globl _delay_ms
	.globl _delay_us
	.globl _TM1628_INIT
	.globl _TM1628_DISPLAY_SEGMENTS
	.globl _Write_EEPROM
	.globl _Read_EEPROM
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
__config:
	.ds 1
__segments:
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
;	lib/src/stm8s_mylib.c: 24: void delay_config(void){
;	-----------------------------------------
;	 function delay_config
;	-----------------------------------------
_delay_config:
;	lib/src/stm8s_mylib.c: 25: TIM4_DeInit();
	call	_TIM4_DeInit
;	lib/src/stm8s_mylib.c: 26: TIM4_TimeBaseInit(TIM4_PRESCALER_128, 125 - 1);
	push	#0x7c
	ld	a, #0x07
	call	_TIM4_TimeBaseInit
;	lib/src/stm8s_mylib.c: 27: TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
	push	#0x01
	ld	a, #0x01
	call	_TIM4_ITConfig
;	lib/src/stm8s_mylib.c: 28: TIM4_ClearFlag(TIM4_FLAG_UPDATE);
	ld	a, #0x01
	call	_TIM4_ClearFlag
;	lib/src/stm8s_mylib.c: 29: TIM4_Cmd(DISABLE);
	clr	a
	call	_TIM4_Cmd
;	lib/src/stm8s_mylib.c: 30: enableInterrupts();
	rim
;	lib/src/stm8s_mylib.c: 31: }
	ret
;	lib/src/stm8s_mylib.c: 32: void delay_ms(unsigned int  u16Delay)
;	-----------------------------------------
;	 function delay_ms
;	-----------------------------------------
_delay_ms:
	sub	sp, #2
;	lib/src/stm8s_mylib.c: 34: while (u16Delay) {
	ldw	(0x01, sp), x
00104$:
	ldw	x, (0x01, sp)
	jreq	00107$
;	lib/src/stm8s_mylib.c: 35: TIM4_SetCounter(0);
	clr	a
	call	_TIM4_SetCounter
;	lib/src/stm8s_mylib.c: 36: TIM4_ClearFlag(TIM4_FLAG_UPDATE);
	ld	a, #0x01
	call	_TIM4_ClearFlag
;	lib/src/stm8s_mylib.c: 37: while (TIM4_GetFlagStatus(TIM4_FLAG_UPDATE) == RESET) {
00101$:
	ld	a, #0x01
	call	_TIM4_GetFlagStatus
	tnz	a
	jreq	00101$
;	lib/src/stm8s_mylib.c: 39: --u16Delay;
	ldw	x, (0x01, sp)
	decw	x
	ldw	(0x01, sp), x
	jra	00104$
00107$:
;	lib/src/stm8s_mylib.c: 41: }
	addw	sp, #2
	ret
;	lib/src/stm8s_mylib.c: 43: void delay_us(unsigned long int  us) {
;	-----------------------------------------
;	 function delay_us
;	-----------------------------------------
_delay_us:
;	lib/src/stm8s_mylib.c: 44: for(;us > 0; us--) nop();
	ldw	x, (0x05, sp)
	ldw	y, (0x03, sp)
00103$:
	tnzw	x
	jrne	00120$
	tnzw	y
	jreq	00105$
00120$:
	nop
	subw	x, #0x0001
	jrnc	00103$
	decw	y
	jra	00103$
00105$:
;	lib/src/stm8s_mylib.c: 45: }
	ldw	x, (1, sp)
	addw	sp, #6
	jp	(x)
;	lib/src/stm8s_mylib.c: 47: void SEND_STOP(void)
;	-----------------------------------------
;	 function SEND_STOP
;	-----------------------------------------
_SEND_STOP:
;	lib/src/stm8s_mylib.c: 49: STB_1;
	ld	a, #0x08
	ldw	x, #0x5000
	call	_GPIO_WriteHigh
;	lib/src/stm8s_mylib.c: 50: DIO_0; TM_DELAY;  
	ld	a, #0x20
	ldw	x, #0x500f
	call	_GPIO_WriteLow
	push	#0x64
	clrw	x
	pushw	x
	push	#0x00
	call	_delay_us
;	lib/src/stm8s_mylib.c: 51: CLK_1; TM_DELAY;
	ld	a, #0x40
	ldw	x, #0x500f
	call	_GPIO_WriteHigh
	push	#0x64
	clrw	x
	pushw	x
	push	#0x00
	call	_delay_us
;	lib/src/stm8s_mylib.c: 52: DIO_1; TM_DELAY;
	ld	a, #0x20
	ldw	x, #0x500f
	call	_GPIO_WriteHigh
	push	#0x64
	clrw	x
	pushw	x
	push	#0x00
	call	_delay_us
;	lib/src/stm8s_mylib.c: 53: }
	ret
;	lib/src/stm8s_mylib.c: 54: void SEND_START(void)
;	-----------------------------------------
;	 function SEND_START
;	-----------------------------------------
_SEND_START:
;	lib/src/stm8s_mylib.c: 57: CLK_1; TM_DELAY;
	ld	a, #0x40
	ldw	x, #0x500f
	call	_GPIO_WriteHigh
	push	#0x64
	clrw	x
	pushw	x
	push	#0x00
	call	_delay_us
;	lib/src/stm8s_mylib.c: 58: DIO_1; TM_DELAY;
	ld	a, #0x20
	ldw	x, #0x500f
	call	_GPIO_WriteHigh
	push	#0x64
	clrw	x
	pushw	x
	push	#0x00
	call	_delay_us
;	lib/src/stm8s_mylib.c: 59: STB_0;
	ld	a, #0x08
	ldw	x, #0x5000
	call	_GPIO_WriteLow
;	lib/src/stm8s_mylib.c: 60: DIO_0; TM_DELAY;
	ld	a, #0x20
	ldw	x, #0x500f
	call	_GPIO_WriteLow
	push	#0x64
	clrw	x
	pushw	x
	push	#0x00
	call	_delay_us
;	lib/src/stm8s_mylib.c: 61: CLK_0; TM_DELAY;
	ld	a, #0x40
	ldw	x, #0x500f
	call	_GPIO_WriteLow
	push	#0x64
	clrw	x
	pushw	x
	push	#0x00
	call	_delay_us
;	lib/src/stm8s_mylib.c: 62: }
	ret
;	lib/src/stm8s_mylib.c: 64: void SEND_WRITE(unsigned char data)
;	-----------------------------------------
;	 function SEND_WRITE
;	-----------------------------------------
_SEND_WRITE:
	sub	sp, #2
	ld	(0x01, sp), a
;	lib/src/stm8s_mylib.c: 67: for (i = 0; i < 8; ++i)
	clr	(0x02, sp)
00105$:
;	lib/src/stm8s_mylib.c: 69: if (data & 0x01) {DIO_1;}
	ld	a, (0x01, sp)
	srl	a
	jrnc	00102$
	ld	a, #0x20
	ldw	x, #0x500f
	call	_GPIO_WriteHigh
	jra	00103$
00102$:
;	lib/src/stm8s_mylib.c: 70: else {DIO_0;}
	ld	a, #0x20
	ldw	x, #0x500f
	call	_GPIO_WriteLow
00103$:
;	lib/src/stm8s_mylib.c: 71: TM_DELAY;	
	push	#0x64
	clrw	x
	pushw	x
	push	#0x00
	call	_delay_us
;	lib/src/stm8s_mylib.c: 72: CLK_1;
	ld	a, #0x40
	ldw	x, #0x500f
	call	_GPIO_WriteHigh
;	lib/src/stm8s_mylib.c: 73: TM_DELAY;
	push	#0x64
	clrw	x
	pushw	x
	push	#0x00
	call	_delay_us
;	lib/src/stm8s_mylib.c: 74: CLK_0;
	ld	a, #0x40
	ldw	x, #0x500f
	call	_GPIO_WriteLow
;	lib/src/stm8s_mylib.c: 75: data >>= 1;
	srl	(0x01, sp)
;	lib/src/stm8s_mylib.c: 67: for (i = 0; i < 8; ++i)
	inc	(0x02, sp)
	ld	a, (0x02, sp)
	cp	a, #0x08
	jrc	00105$
;	lib/src/stm8s_mylib.c: 77: }
	addw	sp, #2
	ret
;	lib/src/stm8s_mylib.c: 78: void TM1628_SEND_COMMAND(const unsigned char value)
;	-----------------------------------------
;	 function TM1628_SEND_COMMAND
;	-----------------------------------------
_TM1628_SEND_COMMAND:
;	lib/src/stm8s_mylib.c: 80: SEND_START();
	push	a
	call	_SEND_START
	pop	a
;	lib/src/stm8s_mylib.c: 81: SEND_WRITE(value);
	call	_SEND_WRITE
;	lib/src/stm8s_mylib.c: 82: SEND_STOP();
	call	_SEND_STOP
;	lib/src/stm8s_mylib.c: 83: TM_DELAY;
	push	#0x64
	clrw	x
	pushw	x
	push	#0x00
	call	_delay_us
;	lib/src/stm8s_mylib.c: 84: }
	ret
;	lib/src/stm8s_mylib.c: 86: void TM1628_SEND_CONFIG(const unsigned char enable, const unsigned char brightness)
;	-----------------------------------------
;	 function TM1628_SEND_CONFIG
;	-----------------------------------------
_TM1628_SEND_CONFIG:
	sub	sp, #2
;	lib/src/stm8s_mylib.c: 88: TM1628_SEND_COMMAND(TM1628_CMD_MODE_DIS_2);
	push	a
	ld	a, #0x03
	call	_TM1628_SEND_COMMAND
	pop	a
;	lib/src/stm8s_mylib.c: 89: _config = (enable ? TM1628_SET_DISPLAY_ON : TM1628_SET_DISPLAY_OFF) |
	tnz	a
	jreq	00103$
	ldw	x, #0x0008
	.byte 0x21
00103$:
	clrw	x
00104$:
;	lib/src/stm8s_mylib.c: 90: (brightness > TM1628_BRIGHTNESS_MAX ? TM1628_BRIGHTNESS_MAX : brightness);
	ld	a, (0x05, sp)
	cp	a, #0x07
	jrule	00105$
	ld	a, #0x07
	clr	(0x01, sp)
	jra	00106$
00105$:
	ld	a, (0x05, sp)
	clr	(0x01, sp)
00106$:
	pushw	x
	or	a, (2, sp)
	popw	x
;	lib/src/stm8s_mylib.c: 92: TM1628_SEND_COMMAND(TM1628_CMD_SET_DSIPLAY | _config);
	ld	__config+0, a
	or	a, #0x80
	ldw	x, (3, sp)
	ldw	(4, sp), x
	addw	sp, #3
;	lib/src/stm8s_mylib.c: 94: }
	jp	_TM1628_SEND_COMMAND
	pop	a
	jp	(x)
;	lib/src/stm8s_mylib.c: 95: void TM1628_INIT(unsigned char enable, const unsigned char brightness)
;	-----------------------------------------
;	 function TM1628_INIT
;	-----------------------------------------
_TM1628_INIT:
	push	a
	ld	(0x01, sp), a
;	lib/src/stm8s_mylib.c: 97: GPIO_Init(GPIOA, STB, GPIO_MODE_OUT_PP_HIGH_FAST);	
	push	#0xf0
	ld	a, #0x08
	ldw	x, #0x5000
	call	_GPIO_Init
;	lib/src/stm8s_mylib.c: 98: GPIO_Init(GPIOD, DIO|SCLK, GPIO_MODE_OUT_PP_HIGH_FAST);
	push	#0xf0
	ld	a, #0x60
	ldw	x, #0x500f
	call	_GPIO_Init
;	lib/src/stm8s_mylib.c: 100: TM1628_SEND_CONFIG(enable, brightness);
	ld	a, (0x04, sp)
	push	a
	ld	a, (0x02, sp)
	call	_TM1628_SEND_CONFIG
;	lib/src/stm8s_mylib.c: 101: }
	pop	a
	popw	x
	pop	a
	jp	(x)
;	lib/src/stm8s_mylib.c: 102: void TM1628_DISPLAY_SEGMENTS(const unsigned char position, const unsigned char digit, unsigned char dot)
;	-----------------------------------------
;	 function TM1628_DISPLAY_SEGMENTS
;	-----------------------------------------
_TM1628_DISPLAY_SEGMENTS:
	sub	sp, #4
	ld	(0x03, sp), a
;	lib/src/stm8s_mylib.c: 105: if (digit < 15)
	ld	a, (0x07, sp)
	cp	a, #0x0f
	jrnc	00102$
;	lib/src/stm8s_mylib.c: 107: segments = _digit2segments[digit];
	clrw	x
	ld	a, (0x07, sp)
	ld	xl, a
	ld	a, (__digit2segments+0, x)
	ld	(0x04, sp), a
;	lib/src/stm8s_mylib.c: 110: segments = 0x00;	
	.byte 0xc5
00102$:
	clr	(0x04, sp)
00103$:
;	lib/src/stm8s_mylib.c: 112: if ( (dot == 1 & (position == 2 )) | (dot == 2 & (position == 0 )) ) {
	ld	a, (0x08, sp)
	dec	a
	jrne	00120$
	ld	a, #0x01
	ld	(0x02, sp), a
	.byte 0xc5
00120$:
	clr	(0x02, sp)
00121$:
	ld	a, (0x03, sp)
	sub	a, #0x02
	jrne	00123$
	inc	a
	.byte 0x21
00123$:
	clr	a
00124$:
	and	a, (0x02, sp)
	ld	(0x01, sp), a
	ld	a, (0x08, sp)
	sub	a, #0x02
	jrne	00126$
	inc	a
	ld	(0x02, sp), a
	.byte 0xc5
00126$:
	clr	(0x02, sp)
00127$:
	ld	a, (0x03, sp)
	sub	a, #0x00
	jrne	00129$
	inc	a
	.byte 0x21
00129$:
	clr	a
00130$:
	and	a, (0x02, sp)
	or	a, (0x01, sp)
	jreq	00105$
;	lib/src/stm8s_mylib.c: 113: segments = segments | 0x80;
	sll	(0x04, sp)
	scf
	rrc	(0x04, sp)
00105$:
;	lib/src/stm8s_mylib.c: 115: TM1628_SEND_COMMAND(TM1628_CMD_SET_DATA | TM1628_SET_DATA_F_ADDR);
	ld	a, #0x44
	call	_TM1628_SEND_COMMAND
;	lib/src/stm8s_mylib.c: 116: SEND_START();
	call	_SEND_START
;	lib/src/stm8s_mylib.c: 117: SEND_WRITE(TM1628_CMD_SET_ADDR | position );
	ld	a, (0x03, sp)
	or	a, #0xc0
	call	_SEND_WRITE
;	lib/src/stm8s_mylib.c: 118: SEND_WRITE(segments);
	ld	a, (0x04, sp)
	call	_SEND_WRITE
;	lib/src/stm8s_mylib.c: 119: SEND_STOP();
	call	_SEND_STOP
;	lib/src/stm8s_mylib.c: 120: TM_DELAY;
	push	#0x64
	clrw	x
	pushw	x
	push	#0x00
	call	_delay_us
;	lib/src/stm8s_mylib.c: 121: }
	ldw	x, (5, sp)
	addw	sp, #8
	jp	(x)
;	lib/src/stm8s_mylib.c: 122: void Write_EEPROM(uint32_t Address, unsigned char Data){
;	-----------------------------------------
;	 function Write_EEPROM
;	-----------------------------------------
_Write_EEPROM:
;	lib/src/stm8s_mylib.c: 124: FLASH->DUKR = (uint8_t)0xAE ; /*!< Second RASS key */ /* Warning: keys are reversed on data memory !!! */ 
	mov	0x5064+0, #0xae
;	lib/src/stm8s_mylib.c: 125: FLASH->DUKR = (uint8_t)0x56 ;  /*!< First RASS key */
	mov	0x5064+0, #0x56
;	lib/src/stm8s_mylib.c: 127: *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
	ldw	x, (0x05, sp)
	ld	a, (0x07, sp)
	ld	(x), a
;	lib/src/stm8s_mylib.c: 130: FLASH->IAPSR &= (uint8_t)0xF7; /*!< Data EEPROM memory */
	ld	a, 0x505f
	and	a, #0xf7
	ld	0x505f, a
;	lib/src/stm8s_mylib.c: 131: }
	ldw	x, (1, sp)
	addw	sp, #7
	jp	(x)
;	lib/src/stm8s_mylib.c: 132: uint8_t Read_EEPROM(uint32_t Address){
;	-----------------------------------------
;	 function Read_EEPROM
;	-----------------------------------------
_Read_EEPROM:
;	lib/src/stm8s_mylib.c: 133: return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address);
	ldw	x, (0x05, sp)
	ld	a, (x)
;	lib/src/stm8s_mylib.c: 134: }
	ldw	x, (1, sp)
	addw	sp, #6
	jp	(x)
	.area CODE
	.area CONST
__digit2segments:
	.db #0x3f	; 63
	.db #0x06	; 6
	.db #0x5b	; 91
	.db #0x4f	; 79	'O'
	.db #0x66	; 102	'f'
	.db #0x6d	; 109	'm'
	.db #0x7d	; 125
	.db #0x07	; 7
	.db #0x7f	; 127
	.db #0x6f	; 111	'o'
	.db #0x77	; 119	'w'
	.db #0x38	; 56	'8'
	.db #0x74	; 116	't'
	.db #0x54	; 84	'T'
	.db #0x5e	; 94
	.area INITIALIZER
__xinit___config:
	.db #0x0f	; 15
__xinit___segments:
	.db #0xff	; 255
	.area CABS (ABS)
