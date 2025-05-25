;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Apr  3 2018) (Linux)
; This file was generated Fri Mar 21 14:40:27 2025
;--------------------------------------------------------
	.module lib
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _fabsf
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
	ret
;	lib/src/lib.c: 9: void Timer4DelayMs(uint16_t u16Delay){
;	-----------------------------------------
;	 function Timer4DelayMs
;	-----------------------------------------
_Timer4DelayMs:
;	lib/src/lib.c: 10: while(u16Delay){
	ldw	x, (0x03, sp)
00104$:
	tnzw	x
	jreq	00107$
;	lib/src/lib.c: 11: TIM4->CNTR = (uint8_t)0;
	mov	0x5346+0, #0x00
;	lib/src/lib.c: 13: TIM4->SR1 = (uint8_t)(~0x01);
	mov	0x5344+0, #0xfe
;	lib/src/lib.c: 14: while((TIM4->SR1 & (uint8_t)0x01) == RESET){}
00101$:
	ldw	y, #0x5344
	ld	a, (y)
	srl	a
	jrnc	00101$
;	lib/src/lib.c: 15: --u16Delay;
	decw	x
	jra	00104$
00107$:
	ret
;	lib/src/lib.c: 21: void I2C_init(void)
;	-----------------------------------------
;	 function I2C_init
;	-----------------------------------------
_I2C_init:
;	lib/src/lib.c: 23: I2C->CR1 = I2C_CR1_RESET_VALUE;
	mov	0x5210+0, #0x00
;	lib/src/lib.c: 24: I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ); /* Clear frequency bits */
	ldw	x, #0x5212
	ld	a, (x)
	and	a, #0xc0
	ld	(x), a
;	lib/src/lib.c: 25: I2C->FREQR |= 16;	/*run 16mhz*/
	ldw	x, #0x5212
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
;	lib/src/lib.c: 29: I2C->CR1 &= (uint8_t)(~I2C_CR1_PE); 
	bres	0x5210, #0
;	lib/src/lib.c: 31: I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
	ldw	x, #0x521c
	ld	a, (x)
	and	a, #0x30
	ld	(x), a
;	lib/src/lib.c: 32: I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
	ldw	x, #0x521b
	ld	a, (x)
	mov	0x521b+0, #0x00
;	lib/src/lib.c: 35: I2C->CCRL = 0x50; 		/*SCL clock is 100khz */
	mov	0x521b+0, #0x50
;	lib/src/lib.c: 36: I2C->CCRH = 0x00;
	mov	0x521c+0, #0x00
;	lib/src/lib.c: 39: I2C->TRISER = 17;
	mov	0x521d+0, #0x11
;	lib/src/lib.c: 44: I2C->OARH |=  (I2C_OARH_ADDCONF | (0x00));
	ldw	x, #0x5214
	ld	a, (x)
	or	a, #0x40
	ld	(x), a
;	lib/src/lib.c: 46: I2C->CR1 |= I2C_CR1_PE;
	bset	0x5210, #0
	ret
;	lib/src/lib.c: 48: void I2C_start(void)
;	-----------------------------------------
;	 function I2C_start
;	-----------------------------------------
_I2C_start:
;	lib/src/lib.c: 51: while((I2C->SR3 & (uint8_t)0x02)==SET); /* Check busy flag */
00101$:
	ldw	x, #0x5219
	ld	a, (x)
	and	a, #0x02
	cp	a, #0x01
	jreq	00101$
;	lib/src/lib.c: 53: I2C->CR2 |= I2C_CR2_START; /* Generate a START condition */
	bset	0x5211, #0
;	lib/src/lib.c: 55: while((I2C->SR1 & I2C_SR1_SB) == 0);	
00104$:
	ldw	x, #0x5217
	ld	a, (x)
	srl	a
	jrnc	00104$
	ret
;	lib/src/lib.c: 57: void I2C_stop(void)
;	-----------------------------------------
;	 function I2C_stop
;	-----------------------------------------
_I2C_stop:
;	lib/src/lib.c: 59: I2C->CR2 |= I2C_CR2_STOP;	/* Generate a STOP condition */
	ldw	x, #0x5211
	ld	a, (x)
	or	a, #0x02
	ld	(x), a
;	lib/src/lib.c: 61: I2C->SR1;       I2C->SR3;
	ldw	x, #0x5217
	ld	a, (x)
	ldw	x, #0x5219
	ld	a, (x)
	ret
;	lib/src/lib.c: 63: void I2C_address(uint8_t I2C_ADDR, I2C_Direction_TypeDef Direction)
;	-----------------------------------------
;	 function I2C_address
;	-----------------------------------------
_I2C_address:
;	lib/src/lib.c: 65: I2C_ADDR &= (uint8_t)0xFE; /* Clear bit0 (direction) just in case */
	ld	a, (0x03, sp)
	and	a, #0xfe
	ld	(0x03, sp), a
;	lib/src/lib.c: 66: I2C->DR = (uint8_t)(I2C_ADDR | (uint8_t)Direction); /* Send the Address + Direction */ 
	ld	a, (0x03, sp)
	or	a, (0x04, sp)
	ldw	x, #0x5216
	ld	(x), a
;	lib/src/lib.c: 68: I2C->SR1;
	ldw	x, #0x5217
	ld	a, (x)
;	lib/src/lib.c: 69: while((I2C->SR1 & I2C_SR1_ADDR)==0);
00101$:
	ldw	x, #0x5217
	ld	a, (x)
	bcp	a, #0x02
	jreq	00101$
	ret
;	lib/src/lib.c: 71: void I2C_write(uint8_t data)
;	-----------------------------------------
;	 function I2C_write
;	-----------------------------------------
_I2C_write:
;	lib/src/lib.c: 73: I2C->SR1;
	ldw	x, #0x5217
	ld	a, (x)
;	lib/src/lib.c: 74: I2C->SR3;
	ldw	x, #0x5219
	ld	a, (x)
;	lib/src/lib.c: 76: I2C->DR = data;
	ldw	x, #0x5216
	ld	a, (0x03, sp)
	ld	(x), a
;	lib/src/lib.c: 77: while((I2C->SR1 & I2C_SR1_TXE)==0);
00101$:
	ldw	x, #0x5217
	ld	a, (x)
	tnz	a
	jrpl	00101$
	ret
;	lib/src/lib.c: 80: void uart_init(void){
;	-----------------------------------------
;	 function uart_init
;	-----------------------------------------
_uart_init:
;	lib/src/lib.c: 83: UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  /* Clear the word length bit */
	ldw	x, #0x5234
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	lib/src/lib.c: 84: UART1->CR1 |= (uint8_t)0x00; /* Set the word length bit, 8 Data bits */
	ldw	x, #0x5234
	ld	a, (x)
	ldw	x, #0x5234
	ld	(x), a
;	lib/src/lib.c: 85: UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  /* Clear the STOP bits */
	ldw	x, #0x5236
	ld	a, (x)
	and	a, #0xcf
	ld	(x), a
;	lib/src/lib.c: 86: UART1->CR3 |= (uint8_t)0x00; /**< One stop bit is transmitted at the end of frame*/
	ldw	x, #0x5236
	ld	a, (x)
	ldw	x, #0x5236
	ld	(x), a
;	lib/src/lib.c: 88: UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  /* Clear the Parity Control bit */
	ldw	x, #0x5234
	ld	a, (x)
	and	a, #0xf9
	ld	(x), a
;	lib/src/lib.c: 89: UART1->CR1 |= (uint8_t)0x00;  /* Set No Parity Control bit */
	ldw	x, #0x5234
	ld	a, (x)
	ldw	x, #0x5234
	ld	(x), a
;	lib/src/lib.c: 91: UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  /* Clear the LSB mantissa of UART1DIV  */
	ldw	x, #0x5232
	ld	a, (x)
	mov	0x5232+0, #0x00
;	lib/src/lib.c: 92: UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);	/* Clear the MSB mantissa of UART1DIV  */
	ldw	x, #0x5233
	ld	a, (x)
	and	a, #0x0f
	ld	(x), a
;	lib/src/lib.c: 93: UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  /* Clear the Fraction bits of UART1DIV */
	ldw	x, #0x5233
	ld	a, (x)
	and	a, #0xf0
	ld	(x), a
;	lib/src/lib.c: 103: UART1->BRR2 = (uint8_t)0x06;
	mov	0x5233+0, #0x06
;	lib/src/lib.c: 104: UART1->BRR1 = (uint8_t)0x11;
	mov	0x5232+0, #0x11
;	lib/src/lib.c: 106: UART1->CR2 |= (uint8_t)UART1_CR2_TEN; /*Transmit Enable and Receive Enable*/ 
	ldw	x, #0x5235
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
;	lib/src/lib.c: 107: UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
	ldw	x, #0x5235
	ld	a, (x)
	or	a, #0x04
	ld	(x), a
;	lib/src/lib.c: 108: UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); /*Sync mode Disable, SLK pin Disable*/
	ldw	x, #0x5236
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
;	lib/src/lib.c: 109: UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); /* UART1 Enable */
	ldw	x, #0x5234
	ld	a, (x)
	and	a, #0xdf
	ld	(x), a
	ret
;	lib/src/lib.c: 111: void uart1_number(int number)
;	-----------------------------------------
;	 function uart1_number
;	-----------------------------------------
_uart1_number:
	sub	sp, #12
;	lib/src/lib.c: 113: char count = 0;
	clr	(0x06, sp)
;	lib/src/lib.c: 114: char digit[5] = "";
	ldw	x, sp
	incw	x
	ldw	(0x07, sp), x
	ldw	x, (0x07, sp)
	clr	(x)
	ldw	x, (0x07, sp)
	incw	x
	clr	(x)
	ldw	x, (0x07, sp)
	incw	x
	incw	x
	clr	(x)
	ldw	x, (0x07, sp)
	addw	x, #0x0003
	clr	(x)
	ldw	x, (0x07, sp)
	addw	x, #0x0004
	clr	(x)
;	lib/src/lib.c: 115: if(number == 0){
	ldw	x, (0x0f, sp)
	jrne	00102$
;	lib/src/lib.c: 116: count = 1;
	ld	a, #0x01
	ld	(0x06, sp), a
;	lib/src/lib.c: 117: digit[0] = 0;
	ldw	x, (0x07, sp)
	clr	(x)
00102$:
;	lib/src/lib.c: 119: if(number < 0){
	tnz	(0x0f, sp)
	jrpl	00119$
;	lib/src/lib.c: 120: number = fabsf(number);
	ldw	x, (0x0f, sp)
	pushw	x
	call	___sint2fs
	addw	sp, #2
	pushw	x
	pushw	y
	call	_fabsf
	addw	sp, #4
	pushw	x
	pushw	y
	call	___fs2sint
	addw	sp, #4
	ldw	(0x0f, sp), x
;	lib/src/lib.c: 123: while(number != 0)
00119$:
	ld	a, (0x06, sp)
	ld	(0x0c, sp), a
00105$:
	ldw	x, (0x0f, sp)
	jreq	00123$
;	lib/src/lib.c: 125: digit[count] = number%10;   //lay chu so ngoai cung xxxx8;
	clrw	x
	ld	a, (0x0c, sp)
	ld	xl, a
	addw	x, (0x07, sp)
	ldw	(0x0a, sp), x
	push	#0x0a
	push	#0x00
	ldw	x, (0x11, sp)
	pushw	x
	call	__modsint
	addw	sp, #4
	ld	a, xl
	ldw	x, (0x0a, sp)
	ld	(x), a
;	lib/src/lib.c: 126: ++count;
	inc	(0x0c, sp)
;	lib/src/lib.c: 127: number = number/10;         //chia so number cho 10 de bo so ngoai cung xxxx
	push	#0x0a
	push	#0x00
	ldw	x, (0x11, sp)
	pushw	x
	call	__divsint
	addw	sp, #4
	ldw	(0x0f, sp), x
	jra	00105$
;	lib/src/lib.c: 129: while (count!=0)
00123$:
	ld	a, (0x0c, sp)
00111$:
	tnz	a
	jreq	00114$
;	lib/src/lib.c: 131: UART1->DR = (digit[count - 1] + 0x30); // 0x30 = 48 ;
	dec	a
	ld	(0x09, sp), a
	clrw	x
	ld	a, (0x09, sp)
	ld	xl, a
	addw	x, (0x07, sp)
	ld	a, (x)
	add	a, #0x30
	ldw	x, #0x5231
	ld	(x), a
;	lib/src/lib.c: 132: while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET);
00108$:
	ldw	x, #0x5230
	ld	a, (x)
	tnz	a
	jrpl	00108$
;	lib/src/lib.c: 133: --count;
	ld	a, (0x09, sp)
	jra	00111$
00114$:
	addw	sp, #12
	ret
;	lib/src/lib.c: 136: void uart1_string(const char *cy)
;	-----------------------------------------
;	 function uart1_string
;	-----------------------------------------
_uart1_string:
;	lib/src/lib.c: 138: while(*cy)
	ldw	y, (0x03, sp)
00104$:
	ld	a, (y)
	tnz	a
	jreq	00107$
;	lib/src/lib.c: 140: UART1->DR = (*cy);
	ldw	x, #0x5231
	ld	(x), a
;	lib/src/lib.c: 141: while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET){}
00101$:
	ldw	x, #0x5230
	ld	a, (x)
	tnz	a
	jrpl	00101$
;	lib/src/lib.c: 142: cy++;
	incw	y
	jra	00104$
00107$:
	ret
;	lib/src/lib.c: 145: void uart1_nline(void)
;	-----------------------------------------
;	 function uart1_nline
;	-----------------------------------------
_uart1_nline:
;	lib/src/lib.c: 147: UART1->DR = (0x0a);
	mov	0x5231+0, #0x0a
;	lib/src/lib.c: 148: while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET);
00101$:
	ldw	x, #0x5230
	ld	a, (x)
	tnz	a
	jrpl	00101$
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
