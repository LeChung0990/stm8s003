;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.0 #14184 (MINGW64)
;--------------------------------------------------------
	.module lib
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Timer4Config
	.globl _Timer4DelayMs
	.globl _I2C_init
	.globl _I2C_start
	.globl _I2C_stop
	.globl _I2C_address
	.globl _I2C_write
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
;	lib/src/lib.c: 2: void Timer4Config(void){
;	-----------------------------------------
;	 function Timer4Config
;	-----------------------------------------
_Timer4Config:
;	lib/src/lib.c: 3: TIM4->PSCR = (uint8_t)0x07;
	mov	0x5347+0, #0x07
;	lib/src/lib.c: 4: TIM4->ARR = (uint8_t)125 - 1;
	mov	0x5348+0, #0x7c
;	lib/src/lib.c: 6: TIM4->CR1 |= TIM4_CR1_CEN;
	bset	0x5340, #0
;	lib/src/lib.c: 7: }
	ret
;	lib/src/lib.c: 8: void Timer4DelayMs(uint16_t u16Delay){
;	-----------------------------------------
;	 function Timer4DelayMs
;	-----------------------------------------
_Timer4DelayMs:
;	lib/src/lib.c: 9: while(u16Delay){
00104$:
	tnzw	x
	jrne	00130$
	ret
00130$:
;	lib/src/lib.c: 10: TIM4->CNTR = (uint8_t)0;
	mov	0x5346+0, #0x00
;	lib/src/lib.c: 12: TIM4->SR1 = (uint8_t)(~0x01);
	mov	0x5344+0, #0xfe
;	lib/src/lib.c: 13: while((TIM4->SR1 & (uint8_t)0x01) == RESET){}
00101$:
	btjf	0x5344, #0, 00101$
;	lib/src/lib.c: 14: --u16Delay;
	decw	x
	jra	00104$
;	lib/src/lib.c: 16: }
	ret
;	lib/src/lib.c: 18: void I2C_init(void)
;	-----------------------------------------
;	 function I2C_init
;	-----------------------------------------
_I2C_init:
;	lib/src/lib.c: 20: I2C->CR1 = I2C_CR1_RESET_VALUE;
	mov	0x5210+0, #0x00
;	lib/src/lib.c: 21: I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ); /* Clear frequency bits */
	ld	a, 0x5212
	and	a, #0xc0
	ld	0x5212, a
;	lib/src/lib.c: 22: I2C->FREQR |= 16;	/*run 16mhz*/
	bset	0x5212, #4
;	lib/src/lib.c: 26: I2C->CR1 &= (uint8_t)(~I2C_CR1_PE); 
	bres	0x5210, #0
;	lib/src/lib.c: 28: I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
	ld	a, 0x521c
	and	a, #0x30
	ld	0x521c, a
;	lib/src/lib.c: 29: I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
	ld	a, 0x521b
	mov	0x521b+0, #0x00
;	lib/src/lib.c: 32: I2C->CCRL = 0x50; 		/*SCL clock is 100khz */
	mov	0x521b+0, #0x50
;	lib/src/lib.c: 33: I2C->CCRH = 0x00;
	mov	0x521c+0, #0x00
;	lib/src/lib.c: 36: I2C->TRISER = 17;
	mov	0x521d+0, #0x11
;	lib/src/lib.c: 41: I2C->OARH |=  (I2C_OARH_ADDCONF | (0x00));
	bset	0x5214, #6
;	lib/src/lib.c: 43: I2C->CR1 |= I2C_CR1_PE;
	bset	0x5210, #0
;	lib/src/lib.c: 44: }
	ret
;	lib/src/lib.c: 45: void I2C_start(void)
;	-----------------------------------------
;	 function I2C_start
;	-----------------------------------------
_I2C_start:
;	lib/src/lib.c: 48: while((I2C->SR3 & (uint8_t)0x02)==SET); /* Check busy flag */
00101$:
	ld	a, 0x5219
	and	a, #0x02
	dec	a
	jreq	00101$
;	lib/src/lib.c: 50: I2C->CR2 |= I2C_CR2_START; /* Generate a START condition */
	bset	0x5211, #0
;	lib/src/lib.c: 52: while((I2C->SR1 & I2C_SR1_SB) == 0);	
00104$:
	btjf	0x5217, #0, 00104$
;	lib/src/lib.c: 53: }
	ret
;	lib/src/lib.c: 54: void I2C_stop(void)
;	-----------------------------------------
;	 function I2C_stop
;	-----------------------------------------
_I2C_stop:
;	lib/src/lib.c: 56: I2C->CR2 |= I2C_CR2_STOP;	/* Generate a STOP condition */
	bset	0x5211, #1
;	lib/src/lib.c: 58: I2C->SR1;       I2C->SR3;
	ld	a, 0x5217
	ld	a, 0x5219
;	lib/src/lib.c: 59: }
	ret
;	lib/src/lib.c: 60: void I2C_address(uint8_t I2C_ADDR, I2C_Direction_TypeDef Direction)
;	-----------------------------------------
;	 function I2C_address
;	-----------------------------------------
_I2C_address:
	push	a
;	lib/src/lib.c: 62: I2C_ADDR &= (uint8_t)0xFE; /* Clear bit0 (direction) just in case */
	and	a, #0xfe
	ld	(0x01, sp), a
;	lib/src/lib.c: 63: I2C->DR = (uint8_t)(I2C_ADDR | (uint8_t)Direction); /* Send the Address + Direction */ 
	ld	a, (0x04, sp)
	or	a, (0x01, sp)
	ld	0x5216, a
;	lib/src/lib.c: 65: I2C->SR1;
	ld	a, 0x5217
;	lib/src/lib.c: 66: while((I2C->SR1 & I2C_SR1_ADDR)==0);
	ld	a,	#0x02
00112$:
	bcp	a,	0x5217
	jreq	00112$
;	lib/src/lib.c: 67: }
	pop	a
	popw	x
	pop	a
	jp	(x)
;	lib/src/lib.c: 68: void I2C_write(uint8_t data)
;	-----------------------------------------
;	 function I2C_write
;	-----------------------------------------
_I2C_write:
	push	a
	ld	(0x01, sp), a
;	lib/src/lib.c: 70: I2C->SR1;
	ld	a, 0x5217
;	lib/src/lib.c: 71: I2C->SR3;
	ld	a, 0x5219
;	lib/src/lib.c: 73: I2C->DR = data;
	ldw	x, #0x5216
	ld	a, (0x01, sp)
	ld	(x), a
;	lib/src/lib.c: 74: while((I2C->SR1 & I2C_SR1_TXE)==0);
00101$:
	ld	a, 0x5217
	jrpl	00101$
;	lib/src/lib.c: 75: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
