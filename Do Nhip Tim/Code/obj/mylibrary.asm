;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.0 #14184 (MINGW64)
;--------------------------------------------------------
	.module mylibrary
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _UART1_ClearFlag
	.globl _UART1_GetFlagStatus
	.globl _UART1_SendData8
	.globl _UART1_Cmd
	.globl _UART1_Init
	.globl _TIM4_ClearFlag
	.globl _TIM4_GetFlagStatus
	.globl _TIM4_SetCounter
	.globl _TIM4_Cmd
	.globl _TIM4_TimeBaseInit
	.globl _I2C_GetFlagStatus
	.globl _I2C_CheckEvent
	.globl _I2C_SendData
	.globl _I2C_Send7bitAddress
	.globl _I2C_GenerateSTOP
	.globl _I2C_GenerateSTART
	.globl _I2C_Cmd
	.globl _I2C_Init
	.globl _I2C_DeInit
	.globl _CLK_GetClockFreq
	.globl _CLK_PeripheralClockConfig
	.globl _delay_msSetup
	.globl _delay_ms
	.globl _UART1_Setup
	.globl _UART1_number
	.globl _UART1_String
	.globl _I2C_init
	.globl _I2C_start
	.globl _I2C_address
	.globl _I2C_write
	.globl _I2C_stop
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
;	mylibrary.c: 24: UART1_Init(9600, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, 
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
;	mylibrary.c: 26: UART1_Cmd(ENABLE);
	ld	a, #0x01
;	mylibrary.c: 27: }
	jp	_UART1_Cmd
;	mylibrary.c: 28: void UART1_number(uint8_t data)
;	-----------------------------------------
;	 function UART1_number
;	-----------------------------------------
_UART1_number:
;	mylibrary.c: 30: UART1_SendData8(48+data);
	add	a, #0x30
	call	_UART1_SendData8
;	mylibrary.c: 31: while(UART1_GetFlagStatus(UART1_FLAG_TXE)==0){}
00101$:
	ldw	x, #0x0080
	call	_UART1_GetFlagStatus
	tnz	a
	jreq	00101$
;	mylibrary.c: 32: UART1_ClearFlag(UART1_FLAG_TXE);
	ldw	x, #0x0080
;	mylibrary.c: 33: }
	jp	_UART1_ClearFlag
;	mylibrary.c: 34: void UART1_String(const char *cy)
;	-----------------------------------------
;	 function UART1_String
;	-----------------------------------------
_UART1_String:
	sub	sp, #2
;	mylibrary.c: 36: while(*cy)
	ldw	(0x01, sp), x
00104$:
	ldw	x, (0x01, sp)
	ld	a, (x)
	jreq	00107$
;	mylibrary.c: 38: UART1_SendData8(*cy);
	call	_UART1_SendData8
;	mylibrary.c: 39: while(UART1_GetFlagStatus(UART1_FLAG_TXE)==0){}
00101$:
	ldw	x, #0x0080
	call	_UART1_GetFlagStatus
	tnz	a
	jreq	00101$
;	mylibrary.c: 40: UART1_ClearFlag(UART1_FLAG_TXE);
	ldw	x, #0x0080
	call	_UART1_ClearFlag
;	mylibrary.c: 41: cy++;
	ldw	x, (0x01, sp)
	incw	x
	ldw	(0x01, sp), x
	jra	00104$
00107$:
;	mylibrary.c: 43: }
	addw	sp, #2
	ret
;	mylibrary.c: 48: void I2C_init(uint32_t I2C_CLOCK,uint8_t I2C_ADDR)
;	-----------------------------------------
;	 function I2C_init
;	-----------------------------------------
_I2C_init:
	push	a
;	mylibrary.c: 51: Input_Clock = CLK_GetClockFreq()/1000000;
	call	_CLK_GetClockFreq
	push	#0x40
	push	#0x42
	push	#0x0f
	push	#0x00
	pushw	x
	pushw	y
	call	__divulong
	addw	sp, #8
	ld	a, xl
	ld	(0x01, sp), a
;	mylibrary.c: 52: I2C_DeInit();
	call	_I2C_DeInit
;	mylibrary.c: 53: CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
	push	#0x01
	clr	a
	call	_CLK_PeripheralClockConfig
;	mylibrary.c: 54: I2C_Cmd(ENABLE);
	ld	a, #0x01
	call	_I2C_Cmd
;	mylibrary.c: 55: I2C_Init(I2C_CLOCK, I2C_ADDR, I2C_DUTYCYCLE_2, I2C_ACK_CURR, I2C_ADDMODE_7BIT, Input_Clock);
	clrw	x
	ld	a, (0x08, sp)
	ld	xl, a
	ld	a, (0x01, sp)
	push	a
	push	#0x00
	push	#0x01
	push	#0x00
	pushw	x
	ldw	x, (0x0c, sp)
	pushw	x
	ldw	x, (0x0c, sp)
	pushw	x
	call	_I2C_Init
;	mylibrary.c: 56: }
	ldw	x, (2, sp)
	addw	sp, #8
	jp	(x)
;	mylibrary.c: 57: void I2C_start(void)
;	-----------------------------------------
;	 function I2C_start
;	-----------------------------------------
_I2C_start:
;	mylibrary.c: 60: while(I2C_GetFlagStatus( I2C_FLAG_BUSBUSY)==SET);
00101$:
	ldw	x, #0x0302
	call	_I2C_GetFlagStatus
	tnz	a
	jrne	00101$
;	mylibrary.c: 61: I2C_GenerateSTART(ENABLE);
	ld	a, #0x01
	call	_I2C_GenerateSTART
;	mylibrary.c: 62: while(!I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT));
00104$:
	ldw	x, #0x0301
	call	_I2C_CheckEvent
	tnz	a
	jreq	00104$
;	mylibrary.c: 63: }
	ret
;	mylibrary.c: 64: void I2C_address(uint8_t I2C_ADDR, uint8_t mode)
;	-----------------------------------------
;	 function I2C_address
;	-----------------------------------------
_I2C_address:
;	mylibrary.c: 67: I2C_Send7bitAddress((uint8_t)I2C_ADDR,I2C_DIRECTION_TX);
	push	#0x00
	call	_I2C_Send7bitAddress
;	mylibrary.c: 70: while(!I2C_CheckEvent( I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
00101$:
	ldw	x, #0x0782
	call	_I2C_CheckEvent
	tnz	a
	jreq	00101$
;	mylibrary.c: 73: I2C_SendData(mode);
	ld	a, (0x03, sp)
	call	_I2C_SendData
;	mylibrary.c: 76: while(!I2C_CheckEvent( I2C_EVENT_MASTER_BYTE_TRANSMITTED));
00104$:
	ldw	x, #0x0784
	call	_I2C_CheckEvent
	tnz	a
	jreq	00104$
;	mylibrary.c: 77: }
	popw	x
	pop	a
	jp	(x)
;	mylibrary.c: 78: void I2C_write(uint8_t data)
;	-----------------------------------------
;	 function I2C_write
;	-----------------------------------------
_I2C_write:
;	mylibrary.c: 81: I2C_SendData(data);
	call	_I2C_SendData
;	mylibrary.c: 84: while(!I2C_GetFlagStatus( I2C_FLAG_TRANSFERFINISHED));
00101$:
	ldw	x, #0x0104
	call	_I2C_GetFlagStatus
	tnz	a
	jreq	00101$
;	mylibrary.c: 85: }
	ret
;	mylibrary.c: 86: void I2C_stop(void)
;	-----------------------------------------
;	 function I2C_stop
;	-----------------------------------------
_I2C_stop:
;	mylibrary.c: 89: I2C_GenerateSTOP(ENABLE);
	ld	a, #0x01
	call	_I2C_GenerateSTOP
;	mylibrary.c: 91: I2C->SR1;       I2C->SR3;
	ld	a, 0x5217
	ld	a, 0x5219
;	mylibrary.c: 92: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
