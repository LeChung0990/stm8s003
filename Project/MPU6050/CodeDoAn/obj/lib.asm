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
	.globl _uart_init
	.globl _uart1_number
	.globl _uart1_string
	.globl _uart1_nline
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
;	lib/src/lib.c: 3: void Timer4Config(void){
;	-----------------------------------------
;	 function Timer4Config
;	-----------------------------------------
_Timer4Config:
;	lib/src/lib.c: 4: TIM4->PSCR = (uint8_t)0x07;
	mov	0x5347+0, #0x07
;	lib/src/lib.c: 5: TIM4->ARR = (uint8_t)125 - 1;
	mov	0x5348+0, #0x7c
;	lib/src/lib.c: 7: TIM4->CR1 |= TIM4_CR1_CEN;
	bset	0x5340, #0
;	lib/src/lib.c: 8: }
	ret
;	lib/src/lib.c: 9: void Timer4DelayMs(uint16_t u16Delay){
;	-----------------------------------------
;	 function Timer4DelayMs
;	-----------------------------------------
_Timer4DelayMs:
;	lib/src/lib.c: 10: while(u16Delay){
00104$:
	tnzw	x
	jrne	00130$
	ret
00130$:
;	lib/src/lib.c: 11: TIM4->CNTR = (uint8_t)0;
	mov	0x5346+0, #0x00
;	lib/src/lib.c: 13: TIM4->SR1 = (uint8_t)(~0x01);
	mov	0x5344+0, #0xfe
;	lib/src/lib.c: 14: while((TIM4->SR1 & (uint8_t)0x01) == RESET){}
00101$:
	btjf	0x5344, #0, 00101$
;	lib/src/lib.c: 15: --u16Delay;
	decw	x
	jra	00104$
;	lib/src/lib.c: 17: }
	ret
;	lib/src/lib.c: 21: void I2C_init(void)
;	-----------------------------------------
;	 function I2C_init
;	-----------------------------------------
_I2C_init:
;	lib/src/lib.c: 23: I2C->CR1 = I2C_CR1_RESET_VALUE;
	mov	0x5210+0, #0x00
;	lib/src/lib.c: 24: I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ); /* Clear frequency bits */
	ld	a, 0x5212
	and	a, #0xc0
	ld	0x5212, a
;	lib/src/lib.c: 25: I2C->FREQR |= 16;	/*run 16mhz*/
	bset	0x5212, #4
;	lib/src/lib.c: 29: I2C->CR1 &= (uint8_t)(~I2C_CR1_PE); 
	bres	0x5210, #0
;	lib/src/lib.c: 31: I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
	ld	a, 0x521c
	and	a, #0x30
	ld	0x521c, a
;	lib/src/lib.c: 32: I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
	ld	a, 0x521b
	mov	0x521b+0, #0x00
;	lib/src/lib.c: 35: I2C->CCRL = 0x50; 		/*SCL clock is 100khz */
	mov	0x521b+0, #0x50
;	lib/src/lib.c: 36: I2C->CCRH = 0x00;
	mov	0x521c+0, #0x00
;	lib/src/lib.c: 39: I2C->TRISER = 17;
	mov	0x521d+0, #0x11
;	lib/src/lib.c: 44: I2C->OARH |=  (I2C_OARH_ADDCONF | (0x00));
	bset	0x5214, #6
;	lib/src/lib.c: 46: I2C->CR1 |= I2C_CR1_PE;
	bset	0x5210, #0
;	lib/src/lib.c: 47: }
	ret
;	lib/src/lib.c: 48: void I2C_start(void)
;	-----------------------------------------
;	 function I2C_start
;	-----------------------------------------
_I2C_start:
;	lib/src/lib.c: 51: while((I2C->SR3 & (uint8_t)0x02)==SET); /* Check busy flag */
00101$:
	ld	a, 0x5219
	and	a, #0x02
	dec	a
	jreq	00101$
;	lib/src/lib.c: 53: I2C->CR2 |= I2C_CR2_START; /* Generate a START condition */
	bset	0x5211, #0
;	lib/src/lib.c: 55: while((I2C->SR1 & I2C_SR1_SB) == 0);	
00104$:
	btjf	0x5217, #0, 00104$
;	lib/src/lib.c: 56: }
	ret
;	lib/src/lib.c: 57: void I2C_stop(void)
;	-----------------------------------------
;	 function I2C_stop
;	-----------------------------------------
_I2C_stop:
;	lib/src/lib.c: 59: I2C->CR2 |= I2C_CR2_STOP;	/* Generate a STOP condition */
	bset	0x5211, #1
;	lib/src/lib.c: 61: I2C->SR1;       I2C->SR3;
	ld	a, 0x5217
	ld	a, 0x5219
;	lib/src/lib.c: 62: }
	ret
;	lib/src/lib.c: 63: void I2C_address(uint8_t I2C_ADDR, I2C_Direction_TypeDef Direction)
;	-----------------------------------------
;	 function I2C_address
;	-----------------------------------------
_I2C_address:
	push	a
;	lib/src/lib.c: 65: I2C_ADDR &= (uint8_t)0xFE; /* Clear bit0 (direction) just in case */
	and	a, #0xfe
	ld	(0x01, sp), a
;	lib/src/lib.c: 66: I2C->DR = (uint8_t)(I2C_ADDR | (uint8_t)Direction); /* Send the Address + Direction */ 
	ld	a, (0x04, sp)
	or	a, (0x01, sp)
	ld	0x5216, a
;	lib/src/lib.c: 68: I2C->SR1;
	ld	a, 0x5217
;	lib/src/lib.c: 69: while((I2C->SR1 & I2C_SR1_ADDR)==0);
	ld	a,	#0x02
00112$:
	bcp	a,	0x5217
	jreq	00112$
;	lib/src/lib.c: 70: }
	pop	a
	popw	x
	pop	a
	jp	(x)
;	lib/src/lib.c: 71: void I2C_write(uint8_t data)
;	-----------------------------------------
;	 function I2C_write
;	-----------------------------------------
_I2C_write:
	push	a
	ld	(0x01, sp), a
;	lib/src/lib.c: 73: I2C->SR1;
	ld	a, 0x5217
;	lib/src/lib.c: 74: I2C->SR3;
	ld	a, 0x5219
;	lib/src/lib.c: 76: I2C->DR = data;
	ldw	x, #0x5216
	ld	a, (0x01, sp)
	ld	(x), a
;	lib/src/lib.c: 77: while((I2C->SR1 & I2C_SR1_TXE)==0);
00101$:
	ld	a, 0x5217
	jrpl	00101$
;	lib/src/lib.c: 78: }
	pop	a
	ret
;	lib/src/lib.c: 80: void uart_init(void){
;	-----------------------------------------
;	 function uart_init
;	-----------------------------------------
_uart_init:
;	lib/src/lib.c: 83: UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  /* Clear the word length bit */
	bres	0x5234, #4
;	lib/src/lib.c: 84: UART1->CR1 |= (uint8_t)0x00; /* Set the word length bit, 8 Data bits */
	mov	0x5234, 0x5234
;	lib/src/lib.c: 85: UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  /* Clear the STOP bits */
	ld	a, 0x5236
	and	a, #0xcf
	ld	0x5236, a
;	lib/src/lib.c: 86: UART1->CR3 |= (uint8_t)0x00; /**< One stop bit is transmitted at the end of frame*/
	mov	0x5236, 0x5236
;	lib/src/lib.c: 88: UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  /* Clear the Parity Control bit */
	ld	a, 0x5234
	and	a, #0xf9
	ld	0x5234, a
;	lib/src/lib.c: 89: UART1->CR1 |= (uint8_t)0x00;  /* Set No Parity Control bit */
	mov	0x5234, 0x5234
;	lib/src/lib.c: 91: UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  /* Clear the LSB mantissa of UART1DIV  */
	ld	a, 0x5232
	mov	0x5232+0, #0x00
;	lib/src/lib.c: 92: UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);	/* Clear the MSB mantissa of UART1DIV  */
	ld	a, 0x5233
	and	a, #0x0f
	ld	0x5233, a
;	lib/src/lib.c: 93: UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  /* Clear the Fraction bits of UART1DIV */
	ld	a, 0x5233
	and	a, #0xf0
	ld	0x5233, a
;	lib/src/lib.c: 96: UART1->BRR2 = (uint8_t)0x03;
	mov	0x5233+0, #0x03
;	lib/src/lib.c: 97: UART1->BRR1 = (uint8_t)0x68;
	mov	0x5232+0, #0x68
;	lib/src/lib.c: 102: UART1->CR2 |= (uint8_t)UART1_CR2_TEN; /*Transmit Enable and Receive Enable*/ 
	bset	0x5235, #3
;	lib/src/lib.c: 103: UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
	bset	0x5235, #2
;	lib/src/lib.c: 104: UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); /*Sync mode Disable, SLK pin Disable*/
	bres	0x5236, #3
;	lib/src/lib.c: 105: UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); /* UART1 Enable */
	bres	0x5234, #5
;	lib/src/lib.c: 106: }
	ret
;	lib/src/lib.c: 107: void uart1_number(int number)
;	-----------------------------------------
;	 function uart1_number
;	-----------------------------------------
_uart1_number:
	sub	sp, #10
	ldw	(0x08, sp), x
;	lib/src/lib.c: 110: char digit[5] = "";
	clr	(0x03, sp)
	clr	(0x04, sp)
	clr	(0x05, sp)
	clr	(0x06, sp)
	clr	(0x07, sp)
;	lib/src/lib.c: 111: while(number != 0)
	clr	(0x0a, sp)
00101$:
	ldw	x, (0x08, sp)
	jreq	00117$
;	lib/src/lib.c: 113: digit[count] = number%10;   //lay chu so ngoai cung xxxx8;
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
;	lib/src/lib.c: 114: ++count;
	inc	(0x0a, sp)
;	lib/src/lib.c: 115: number = number/10;         //chia so number cho 10 de bo so ngoai cung xxxx
	push	#0x0a
	push	#0x00
	ldw	x, (0x0a, sp)
	call	__divsint
	ldw	(0x08, sp), x
	jra	00101$
;	lib/src/lib.c: 117: while (count!=0)
00117$:
00107$:
	tnz	(0x0a, sp)
	jreq	00110$
;	lib/src/lib.c: 119: UART1->DR = (digit[count - 1] + 0x30); // 0x30 = 48 ;
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
	ld	0x5231, a
;	lib/src/lib.c: 120: while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET);
00104$:
	ld	a, 0x5230
	jrpl	00104$
;	lib/src/lib.c: 121: --count;
	dec	(0x0a, sp)
	jra	00107$
00110$:
;	lib/src/lib.c: 123: }
	addw	sp, #10
	ret
;	lib/src/lib.c: 124: void uart1_string(const char *cy)
;	-----------------------------------------
;	 function uart1_string
;	-----------------------------------------
_uart1_string:
;	lib/src/lib.c: 126: while(*cy)
00104$:
	ld	a, (x)
	jrne	00130$
	ret
00130$:
;	lib/src/lib.c: 128: UART1->DR = (*cy);
	ld	0x5231, a
;	lib/src/lib.c: 129: while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET){}
00101$:
	ld	a, 0x5230
	jrpl	00101$
;	lib/src/lib.c: 130: cy++;
	incw	x
	jra	00104$
;	lib/src/lib.c: 132: }
	ret
;	lib/src/lib.c: 133: void uart1_nline(void)
;	-----------------------------------------
;	 function uart1_nline
;	-----------------------------------------
_uart1_nline:
;	lib/src/lib.c: 135: UART1->DR = (0x0a);
	mov	0x5231+0, #0x0a
;	lib/src/lib.c: 136: while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET);
00101$:
	ld	a, 0x5230
	jrpl	00101$
;	lib/src/lib.c: 137: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
