;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.0 #14184 (MINGW64)
;--------------------------------------------------------
	.module stm8s_i2c
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _I2C_DeInit
	.globl _I2C_Init
	.globl _I2C_Cmd
	.globl _I2C_GeneralCallCmd
	.globl _I2C_GenerateSTART
	.globl _I2C_GenerateSTOP
	.globl _I2C_SoftwareResetCmd
	.globl _I2C_StretchClockCmd
	.globl _I2C_AcknowledgeConfig
	.globl _I2C_ITConfig
	.globl _I2C_FastModeDutyCycleConfig
	.globl _I2C_ReceiveData
	.globl _I2C_Send7bitAddress
	.globl _I2C_SendData
	.globl _I2C_CheckEvent
	.globl _I2C_GetLastEvent
	.globl _I2C_GetFlagStatus
	.globl _I2C_ClearFlag
	.globl _I2C_GetITStatus
	.globl _I2C_ClearITPendingBit
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
;	lib/src/stm8s_i2c.c: 67: void I2C_DeInit(void)
;	-----------------------------------------
;	 function I2C_DeInit
;	-----------------------------------------
_I2C_DeInit:
;	lib/src/stm8s_i2c.c: 69: I2C->CR1 = I2C_CR1_RESET_VALUE;
	mov	0x5210+0, #0x00
;	lib/src/stm8s_i2c.c: 70: I2C->CR2 = I2C_CR2_RESET_VALUE;
	mov	0x5211+0, #0x00
;	lib/src/stm8s_i2c.c: 71: I2C->FREQR = I2C_FREQR_RESET_VALUE;
	mov	0x5212+0, #0x00
;	lib/src/stm8s_i2c.c: 72: I2C->OARL = I2C_OARL_RESET_VALUE;
	mov	0x5213+0, #0x00
;	lib/src/stm8s_i2c.c: 73: I2C->OARH = I2C_OARH_RESET_VALUE;
	mov	0x5214+0, #0x00
;	lib/src/stm8s_i2c.c: 74: I2C->ITR = I2C_ITR_RESET_VALUE;
	mov	0x521a+0, #0x00
;	lib/src/stm8s_i2c.c: 75: I2C->CCRL = I2C_CCRL_RESET_VALUE;
	mov	0x521b+0, #0x00
;	lib/src/stm8s_i2c.c: 76: I2C->CCRH = I2C_CCRH_RESET_VALUE;
	mov	0x521c+0, #0x00
;	lib/src/stm8s_i2c.c: 77: I2C->TRISER = I2C_TRISER_RESET_VALUE;
	mov	0x521d+0, #0x02
;	lib/src/stm8s_i2c.c: 78: }
	ret
;	lib/src/stm8s_i2c.c: 96: void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
;	-----------------------------------------
;	 function I2C_Init
;	-----------------------------------------
_I2C_Init:
	sub	sp, #7
;	lib/src/stm8s_i2c.c: 102: uint8_t tmpccrh = 0;
	clr	(0x05, sp)
;	lib/src/stm8s_i2c.c: 115: I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
	ld	a, 0x5212
	and	a, #0xc0
	ld	0x5212, a
;	lib/src/stm8s_i2c.c: 117: I2C->FREQR |= InputClockFrequencyMHz;
	ld	a, 0x5212
	or	a, (0x13, sp)
	ld	0x5212, a
;	lib/src/stm8s_i2c.c: 121: I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
	bres	0x5210, #0
;	lib/src/stm8s_i2c.c: 124: I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
	ld	a, 0x521c
	and	a, #0x30
	ld	0x521c, a
;	lib/src/stm8s_i2c.c: 125: I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
	ld	a, 0x521b
	mov	0x521b+0, #0x00
;	lib/src/stm8s_i2c.c: 136: result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
	clrw	x
	ld	a, (0x13, sp)
	ld	xl, a
	clrw	y
	pushw	x
	pushw	y
	push	#0x40
	push	#0x42
	push	#0x0f
	push	#0x00
	call	__mullong
	addw	sp, #8
	ldw	(0x03, sp), x
	ldw	(0x01, sp), y
;	lib/src/stm8s_i2c.c: 128: if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
	ldw	x, #0x86a0
	cpw	x, (0x0c, sp)
	ld	a, #0x01
	sbc	a, (0x0b, sp)
	clr	a
	sbc	a, (0x0a, sp)
	jrnc	00109$
;	lib/src/stm8s_i2c.c: 131: tmpccrh = I2C_CCRH_FS;
	ld	a, #0x80
	ld	(0x05, sp), a
;	lib/src/stm8s_i2c.c: 133: if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
	tnz	(0x10, sp)
	jrne	00102$
;	lib/src/stm8s_i2c.c: 136: result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
	ldw	x, (0x0c, sp)
	pushw	x
	ldw	x, (0x0c, sp)
	pushw	x
	push	#0x03
	clrw	x
	pushw	x
	push	#0x00
	call	__mullong
	addw	sp, #8
	pushw	x
	pushw	y
	ldw	x, (0x07, sp)
	pushw	x
	ldw	x, (0x07, sp)
	pushw	x
	call	__divulong
	addw	sp, #8
	jra	00103$
00102$:
;	lib/src/stm8s_i2c.c: 141: result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
	ldw	x, (0x0c, sp)
	pushw	x
	ldw	x, (0x0c, sp)
	pushw	x
	push	#0x19
	clrw	x
	pushw	x
	push	#0x00
	call	__mullong
	addw	sp, #8
	ld	a, xl
	push	a
	ld	a, xh
	push	a
	pushw	y
	ldw	x, (0x07, sp)
	pushw	x
	ldw	x, (0x07, sp)
	pushw	x
	call	__divulong
	addw	sp, #8
;	lib/src/stm8s_i2c.c: 143: tmpccrh |= I2C_CCRH_DUTY;
	ld	a, #0xc0
	ld	(0x05, sp), a
00103$:
;	lib/src/stm8s_i2c.c: 147: if (result < (uint16_t)0x01)
	cpw	x, #0x0001
	jrnc	00105$
;	lib/src/stm8s_i2c.c: 150: result = (uint16_t)0x0001;
	clrw	x
	incw	x
00105$:
;	lib/src/stm8s_i2c.c: 156: tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
	ld	a, (0x13, sp)
	ld	(0x07, sp), a
	clr	(0x06, sp)
	pushw	x
	ldw	x, (0x08, sp)
	sllw	x
	addw	x, (0x08, sp)
	exgw	x, y
	push	#0x0a
	push	#0x00
	ldw	x, y
	call	__divsint
	ldw	y, x
	ld	a, xl
	popw	x
	inc	a
;	lib/src/stm8s_i2c.c: 157: I2C->TRISER = (uint8_t)tmpval;
	ld	0x521d, a
	jra	00110$
00109$:
;	lib/src/stm8s_i2c.c: 164: result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
	ldw	x, (0x0c, sp)
	ldw	y, (0x0a, sp)
	sllw	x
	rlcw	y
	pushw	x
	pushw	y
	ldw	x, (0x07, sp)
	pushw	x
	ldw	x, (0x07, sp)
	pushw	x
	call	__divulong
	addw	sp, #8
;	lib/src/stm8s_i2c.c: 167: if (result < (uint16_t)0x0004)
	cpw	x, #0x0004
	jrnc	00107$
;	lib/src/stm8s_i2c.c: 170: result = (uint16_t)0x0004;
	ldw	x, #0x0004
00107$:
;	lib/src/stm8s_i2c.c: 176: I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
	ld	a, (0x13, sp)
	inc	a
	ld	0x521d, a
00110$:
;	lib/src/stm8s_i2c.c: 181: I2C->CCRL = (uint8_t)result;
	ld	a, xl
	ld	0x521b, a
;	lib/src/stm8s_i2c.c: 182: I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
	ld	a, xh
	and	a, #0x0f
	or	a, (0x05, sp)
	ld	0x521c, a
;	lib/src/stm8s_i2c.c: 185: I2C->CR1 |= I2C_CR1_PE;
	bset	0x5210, #0
;	lib/src/stm8s_i2c.c: 188: I2C_AcknowledgeConfig(Ack);
	ld	a, (0x11, sp)
	call	_I2C_AcknowledgeConfig
;	lib/src/stm8s_i2c.c: 201: I2C->OARL = (uint8_t)(AddMode == I2C_ADDMODE_7BIT ? (OwnAddress<<1) : OwnAddress);
	tnz	(0x12, sp)
	jrne	00113$
	ld	a, (0x0f, sp)
	sll	a
	ld	xl, a
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	xh, a
	.byte 0xc5
00113$:
	ldw	x, (0x0e, sp)
00114$:
	ld	a, xl
	ld	0x5213, a
;	lib/src/stm8s_i2c.c: 202: I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
	ld	a, (0x12, sp)
	or	a, #0x40
	ld	(0x07, sp), a
;	lib/src/stm8s_i2c.c: 203: (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
	clr	a
	ld	xl, a
	ld	a, (0x0e, sp)
	and	a, #0x03
	ld	xh, a
	ld	a, #0x80
	div	x, a
	ld	a, xl
	or	a, (0x07, sp)
	ld	0x5214, a
;	lib/src/stm8s_i2c.c: 204: }
	ldw	x, (8, sp)
	addw	sp, #19
	jp	(x)
;	lib/src/stm8s_i2c.c: 212: void I2C_Cmd(FunctionalState NewState)
;	-----------------------------------------
;	 function I2C_Cmd
;	-----------------------------------------
_I2C_Cmd:
	push	a
	ld	(0x01, sp), a
;	lib/src/stm8s_i2c.c: 220: I2C->CR1 |= I2C_CR1_PE;
	ld	a, 0x5210
;	lib/src/stm8s_i2c.c: 217: if (NewState != DISABLE)
	tnz	(0x01, sp)
	jreq	00102$
;	lib/src/stm8s_i2c.c: 220: I2C->CR1 |= I2C_CR1_PE;
	or	a, #0x01
	ld	0x5210, a
	jra	00104$
00102$:
;	lib/src/stm8s_i2c.c: 225: I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
	and	a, #0xfe
	ld	0x5210, a
00104$:
;	lib/src/stm8s_i2c.c: 227: }
	pop	a
	ret
;	lib/src/stm8s_i2c.c: 235: void I2C_GeneralCallCmd(FunctionalState NewState)
;	-----------------------------------------
;	 function I2C_GeneralCallCmd
;	-----------------------------------------
_I2C_GeneralCallCmd:
	push	a
	ld	(0x01, sp), a
;	lib/src/stm8s_i2c.c: 243: I2C->CR1 |= I2C_CR1_ENGC;
	ld	a, 0x5210
;	lib/src/stm8s_i2c.c: 240: if (NewState != DISABLE)
	tnz	(0x01, sp)
	jreq	00102$
;	lib/src/stm8s_i2c.c: 243: I2C->CR1 |= I2C_CR1_ENGC;
	or	a, #0x40
	ld	0x5210, a
	jra	00104$
00102$:
;	lib/src/stm8s_i2c.c: 248: I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
	and	a, #0xbf
	ld	0x5210, a
00104$:
;	lib/src/stm8s_i2c.c: 250: }
	pop	a
	ret
;	lib/src/stm8s_i2c.c: 260: void I2C_GenerateSTART(FunctionalState NewState)
;	-----------------------------------------
;	 function I2C_GenerateSTART
;	-----------------------------------------
_I2C_GenerateSTART:
	push	a
	ld	(0x01, sp), a
;	lib/src/stm8s_i2c.c: 268: I2C->CR2 |= I2C_CR2_START;
	ld	a, 0x5211
;	lib/src/stm8s_i2c.c: 265: if (NewState != DISABLE)
	tnz	(0x01, sp)
	jreq	00102$
;	lib/src/stm8s_i2c.c: 268: I2C->CR2 |= I2C_CR2_START;
	or	a, #0x01
	ld	0x5211, a
	jra	00104$
00102$:
;	lib/src/stm8s_i2c.c: 273: I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
	and	a, #0xfe
	ld	0x5211, a
00104$:
;	lib/src/stm8s_i2c.c: 275: }
	pop	a
	ret
;	lib/src/stm8s_i2c.c: 283: void I2C_GenerateSTOP(FunctionalState NewState)
;	-----------------------------------------
;	 function I2C_GenerateSTOP
;	-----------------------------------------
_I2C_GenerateSTOP:
	push	a
	ld	(0x01, sp), a
;	lib/src/stm8s_i2c.c: 291: I2C->CR2 |= I2C_CR2_STOP;
	ld	a, 0x5211
;	lib/src/stm8s_i2c.c: 288: if (NewState != DISABLE)
	tnz	(0x01, sp)
	jreq	00102$
;	lib/src/stm8s_i2c.c: 291: I2C->CR2 |= I2C_CR2_STOP;
	or	a, #0x02
	ld	0x5211, a
	jra	00104$
00102$:
;	lib/src/stm8s_i2c.c: 296: I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
	and	a, #0xfd
	ld	0x5211, a
00104$:
;	lib/src/stm8s_i2c.c: 298: }
	pop	a
	ret
;	lib/src/stm8s_i2c.c: 306: void I2C_SoftwareResetCmd(FunctionalState NewState)
;	-----------------------------------------
;	 function I2C_SoftwareResetCmd
;	-----------------------------------------
_I2C_SoftwareResetCmd:
	push	a
	ld	(0x01, sp), a
;	lib/src/stm8s_i2c.c: 314: I2C->CR2 |= I2C_CR2_SWRST;
	ld	a, 0x5211
;	lib/src/stm8s_i2c.c: 311: if (NewState != DISABLE)
	tnz	(0x01, sp)
	jreq	00102$
;	lib/src/stm8s_i2c.c: 314: I2C->CR2 |= I2C_CR2_SWRST;
	or	a, #0x80
	ld	0x5211, a
	jra	00104$
00102$:
;	lib/src/stm8s_i2c.c: 319: I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
	and	a, #0x7f
	ld	0x5211, a
00104$:
;	lib/src/stm8s_i2c.c: 321: }
	pop	a
	ret
;	lib/src/stm8s_i2c.c: 330: void I2C_StretchClockCmd(FunctionalState NewState)
;	-----------------------------------------
;	 function I2C_StretchClockCmd
;	-----------------------------------------
_I2C_StretchClockCmd:
	push	a
	ld	(0x01, sp), a
;	lib/src/stm8s_i2c.c: 338: I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
	ld	a, 0x5210
;	lib/src/stm8s_i2c.c: 335: if (NewState != DISABLE)
	tnz	(0x01, sp)
	jreq	00102$
;	lib/src/stm8s_i2c.c: 338: I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
	and	a, #0x7f
	ld	0x5210, a
	jra	00104$
00102$:
;	lib/src/stm8s_i2c.c: 344: I2C->CR1 |= I2C_CR1_NOSTRETCH;
	or	a, #0x80
	ld	0x5210, a
00104$:
;	lib/src/stm8s_i2c.c: 346: }
	pop	a
	ret
;	lib/src/stm8s_i2c.c: 355: void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
;	-----------------------------------------
;	 function I2C_AcknowledgeConfig
;	-----------------------------------------
_I2C_AcknowledgeConfig:
	ld	xl, a
;	lib/src/stm8s_i2c.c: 363: I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
	ld	a, 0x5211
;	lib/src/stm8s_i2c.c: 360: if (Ack == I2C_ACK_NONE)
	exg	a, xl
	tnz	a
	exg	a, xl
	jrne	00105$
;	lib/src/stm8s_i2c.c: 363: I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
	and	a, #0xfb
	ld	0x5211, a
	ret
00105$:
;	lib/src/stm8s_i2c.c: 368: I2C->CR2 |= I2C_CR2_ACK;
	or	a, #0x04
	ld	0x5211, a
;	lib/src/stm8s_i2c.c: 363: I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
	ld	a, 0x5211
;	lib/src/stm8s_i2c.c: 370: if (Ack == I2C_ACK_CURR)
	push	a
	ld	a, xl
	dec	a
	pop	a
	jrne	00102$
;	lib/src/stm8s_i2c.c: 373: I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
	and	a, #0xf7
	ld	0x5211, a
	ret
00102$:
;	lib/src/stm8s_i2c.c: 378: I2C->CR2 |= I2C_CR2_POS;
	or	a, #0x08
	ld	0x5211, a
;	lib/src/stm8s_i2c.c: 381: }
	ret
;	lib/src/stm8s_i2c.c: 391: void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
;	-----------------------------------------
;	 function I2C_ITConfig
;	-----------------------------------------
_I2C_ITConfig:
	push	a
;	lib/src/stm8s_i2c.c: 400: I2C->ITR |= (uint8_t)I2C_IT;
	ldw	x, #0x521a
	push	a
	ld	a, (x)
	ld	(0x02, sp), a
	pop	a
;	lib/src/stm8s_i2c.c: 397: if (NewState != DISABLE)
	tnz	(0x04, sp)
	jreq	00102$
;	lib/src/stm8s_i2c.c: 400: I2C->ITR |= (uint8_t)I2C_IT;
	or	a, (0x01, sp)
	ld	0x521a, a
	jra	00104$
00102$:
;	lib/src/stm8s_i2c.c: 405: I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
	cpl	a
	and	a, (0x01, sp)
	ld	0x521a, a
00104$:
;	lib/src/stm8s_i2c.c: 407: }
	pop	a
	popw	x
	pop	a
	jp	(x)
;	lib/src/stm8s_i2c.c: 415: void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
;	-----------------------------------------
;	 function I2C_FastModeDutyCycleConfig
;	-----------------------------------------
_I2C_FastModeDutyCycleConfig:
	ld	xl, a
;	lib/src/stm8s_i2c.c: 423: I2C->CCRH |= I2C_CCRH_DUTY;
	ld	a, 0x521c
;	lib/src/stm8s_i2c.c: 420: if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
	push	a
	ld	a, xl
	cp	a, #0x40
	pop	a
	jrne	00102$
;	lib/src/stm8s_i2c.c: 423: I2C->CCRH |= I2C_CCRH_DUTY;
	or	a, #0x40
	ld	0x521c, a
	ret
00102$:
;	lib/src/stm8s_i2c.c: 428: I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
	and	a, #0xbf
	ld	0x521c, a
;	lib/src/stm8s_i2c.c: 430: }
	ret
;	lib/src/stm8s_i2c.c: 437: uint8_t I2C_ReceiveData(void)
;	-----------------------------------------
;	 function I2C_ReceiveData
;	-----------------------------------------
_I2C_ReceiveData:
;	lib/src/stm8s_i2c.c: 440: return ((uint8_t)I2C->DR);
	ld	a, 0x5216
;	lib/src/stm8s_i2c.c: 441: }
	ret
;	lib/src/stm8s_i2c.c: 450: void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
;	-----------------------------------------
;	 function I2C_Send7bitAddress
;	-----------------------------------------
_I2C_Send7bitAddress:
	push	a
;	lib/src/stm8s_i2c.c: 457: Address &= (uint8_t)0xFE;
	and	a, #0xfe
	ld	(0x01, sp), a
;	lib/src/stm8s_i2c.c: 460: I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
	ld	a, (0x04, sp)
	or	a, (0x01, sp)
	ld	0x5216, a
;	lib/src/stm8s_i2c.c: 461: }
	pop	a
	popw	x
	pop	a
	jp	(x)
;	lib/src/stm8s_i2c.c: 468: void I2C_SendData(uint8_t Data)
;	-----------------------------------------
;	 function I2C_SendData
;	-----------------------------------------
_I2C_SendData:
;	lib/src/stm8s_i2c.c: 471: I2C->DR = Data;
	ld	0x5216, a
;	lib/src/stm8s_i2c.c: 472: }
	ret
;	lib/src/stm8s_i2c.c: 588: ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
;	-----------------------------------------
;	 function I2C_CheckEvent
;	-----------------------------------------
_I2C_CheckEvent:
	sub	sp, #8
;	lib/src/stm8s_i2c.c: 590: __IO uint16_t lastevent = 0x00;
	clr	(0x02, sp)
	clr	(0x01, sp)
;	lib/src/stm8s_i2c.c: 598: if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
	ldw	(0x03, sp), x
	cpw	x, #0x0004
	jrne	00102$
;	lib/src/stm8s_i2c.c: 600: lastevent = I2C->SR2 & I2C_SR2_AF;
	ld	a, 0x5218
	and	a, #0x04
	clrw	x
	ld	xl, a
	ldw	(0x01, sp), x
	jra	00103$
00102$:
;	lib/src/stm8s_i2c.c: 604: flag1 = I2C->SR1;
	ld	a, 0x5217
	ld	xl, a
;	lib/src/stm8s_i2c.c: 605: flag2 = I2C->SR3;
	ld	a, 0x5219
;	lib/src/stm8s_i2c.c: 606: lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
	ld	xh, a
	clr	(0x06, sp)
	ld	a, xl
	clr	(0x07, sp)
	or	a, (0x06, sp)
	rlwa	x
	or	a, (0x07, sp)
	ld	xh, a
	ldw	(0x01, sp), x
00103$:
;	lib/src/stm8s_i2c.c: 609: if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
	ld	a, (0x02, sp)
	and	a, (0x04, sp)
	ld	xl, a
	ld	a, (0x01, sp)
	and	a, (0x03, sp)
	ld	xh, a
	cpw	x, (0x03, sp)
	jrne	00105$
;	lib/src/stm8s_i2c.c: 612: status = SUCCESS;
	ld	a, #0x01
;	lib/src/stm8s_i2c.c: 617: status = ERROR;
	.byte 0x21
00105$:
	clr	a
00106$:
;	lib/src/stm8s_i2c.c: 621: return status;
;	lib/src/stm8s_i2c.c: 622: }
	addw	sp, #8
	ret
;	lib/src/stm8s_i2c.c: 638: I2C_Event_TypeDef I2C_GetLastEvent(void)
;	-----------------------------------------
;	 function I2C_GetLastEvent
;	-----------------------------------------
_I2C_GetLastEvent:
	sub	sp, #4
;	lib/src/stm8s_i2c.c: 640: __IO uint16_t lastevent = 0;
	clrw	x
	ldw	(0x01, sp), x
;	lib/src/stm8s_i2c.c: 644: if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
	btjf	0x5218, #2, 00102$
;	lib/src/stm8s_i2c.c: 646: lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
	ldw	x, #0x0004
	ldw	(0x01, sp), x
	jra	00103$
00102$:
;	lib/src/stm8s_i2c.c: 651: flag1 = I2C->SR1;
	ld	a, 0x5217
	ld	(0x04, sp), a
	clr	(0x03, sp)
;	lib/src/stm8s_i2c.c: 652: flag2 = I2C->SR3;
	ld	a, 0x5219
;	lib/src/stm8s_i2c.c: 655: lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
	ld	xh, a
	ld	a, (0x04, sp)
	rlwa	x
	or	a, (0x03, sp)
	ld	xh, a
	ldw	(0x01, sp), x
00103$:
;	lib/src/stm8s_i2c.c: 658: return (I2C_Event_TypeDef)lastevent;
	ldw	x, (0x01, sp)
;	lib/src/stm8s_i2c.c: 659: }
	addw	sp, #4
	ret
;	lib/src/stm8s_i2c.c: 689: FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
;	-----------------------------------------
;	 function I2C_GetFlagStatus
;	-----------------------------------------
_I2C_GetFlagStatus:
	push	a
;	lib/src/stm8s_i2c.c: 691: uint8_t tempreg = 0;
	clr	(0x01, sp)
;	lib/src/stm8s_i2c.c: 699: regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
	ld	a, xh
;	lib/src/stm8s_i2c.c: 701: switch (regindex)
	cp	a, #0x01
	jreq	00101$
	cp	a, #0x02
	jreq	00102$
	cp	a, #0x03
	jreq	00103$
	jra	00105$
;	lib/src/stm8s_i2c.c: 704: case 0x01:
00101$:
;	lib/src/stm8s_i2c.c: 705: tempreg = (uint8_t)I2C->SR1;
	ld	a, 0x5217
	ld	(0x01, sp), a
;	lib/src/stm8s_i2c.c: 706: break;
	jra	00105$
;	lib/src/stm8s_i2c.c: 709: case 0x02:
00102$:
;	lib/src/stm8s_i2c.c: 710: tempreg = (uint8_t)I2C->SR2;
	ld	a, 0x5218
	ld	(0x01, sp), a
;	lib/src/stm8s_i2c.c: 711: break;
	jra	00105$
;	lib/src/stm8s_i2c.c: 714: case 0x03:
00103$:
;	lib/src/stm8s_i2c.c: 715: tempreg = (uint8_t)I2C->SR3;
	ld	a, 0x5219
	ld	(0x01, sp), a
;	lib/src/stm8s_i2c.c: 720: }
00105$:
;	lib/src/stm8s_i2c.c: 723: if ((tempreg & (uint8_t)I2C_Flag ) != 0)
	ld	a, xl
	and	a, (0x01, sp)
	jreq	00107$
;	lib/src/stm8s_i2c.c: 726: bitstatus = SET;
	ld	a, #0x01
;	lib/src/stm8s_i2c.c: 731: bitstatus = RESET;
	.byte 0x21
00107$:
	clr	a
00108$:
;	lib/src/stm8s_i2c.c: 734: return bitstatus;
;	lib/src/stm8s_i2c.c: 735: }
	addw	sp, #1
	ret
;	lib/src/stm8s_i2c.c: 769: void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
;	-----------------------------------------
;	 function I2C_ClearFlag
;	-----------------------------------------
_I2C_ClearFlag:
;	lib/src/stm8s_i2c.c: 776: flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
	clr	a
	ld	xh, a
;	lib/src/stm8s_i2c.c: 778: I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
	cplw	x
	ld	a, xl
	ld	0x5218, a
;	lib/src/stm8s_i2c.c: 779: }
	ret
;	lib/src/stm8s_i2c.c: 801: ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
;	-----------------------------------------
;	 function I2C_GetITStatus
;	-----------------------------------------
_I2C_GetITStatus:
	sub	sp, #4
	exgw	x, y
;	lib/src/stm8s_i2c.c: 804: __IO uint8_t enablestatus = 0;
	clr	(0x03, sp)
;	lib/src/stm8s_i2c.c: 810: tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
	ldw	x, y
	clr	(0x02, sp)
	ld	a, xh
	and	a, #0x07
	ld	(0x04, sp), a
;	lib/src/stm8s_i2c.c: 813: enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
	ld	a, 0x521a
	and	a, (0x04, sp)
	ld	(0x03, sp), a
;	lib/src/stm8s_i2c.c: 815: if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
	clr	a
	rlwa	x
	and	a, #0x30
;	lib/src/stm8s_i2c.c: 818: if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
	exg	a, yl
	ld	(0x04, sp), a
	exg	a, yl
;	lib/src/stm8s_i2c.c: 815: if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
	ld	xh, a
	cpw	x, #0x0100
	jrne	00110$
;	lib/src/stm8s_i2c.c: 818: if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
	ld	a, 0x5217
	and	a, (0x04, sp)
	jreq	00102$
	tnz	(0x03, sp)
	jreq	00102$
;	lib/src/stm8s_i2c.c: 821: bitstatus = SET;
	ld	a, #0x01
	jra	00111$
00102$:
;	lib/src/stm8s_i2c.c: 826: bitstatus = RESET;
	clr	a
	jra	00111$
00110$:
;	lib/src/stm8s_i2c.c: 832: if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
	ld	a, 0x5218
	and	a, (0x04, sp)
	jreq	00106$
	tnz	(0x03, sp)
	jreq	00106$
;	lib/src/stm8s_i2c.c: 835: bitstatus = SET;
	ld	a, #0x01
;	lib/src/stm8s_i2c.c: 840: bitstatus = RESET;
	.byte 0x21
00106$:
	clr	a
00111$:
;	lib/src/stm8s_i2c.c: 844: return  bitstatus;
;	lib/src/stm8s_i2c.c: 845: }
	addw	sp, #4
	ret
;	lib/src/stm8s_i2c.c: 881: void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
;	-----------------------------------------
;	 function I2C_ClearITPendingBit
;	-----------------------------------------
_I2C_ClearITPendingBit:
;	lib/src/stm8s_i2c.c: 889: flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
	clr	a
	ld	xh, a
;	lib/src/stm8s_i2c.c: 892: I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
	cplw	x
	ld	a, xl
	ld	0x5218, a
;	lib/src/stm8s_i2c.c: 893: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
