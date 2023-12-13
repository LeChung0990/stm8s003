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
	.globl _ADC1_Read
	.globl _ADC1_Init
	.globl _ADC1_DeInit
	.globl _updateEstimate
	.globl _SimpleKalmanFilter
	.globl _uart1_nline
	.globl _uart1_string
	.globl _uart1_number
	.globl _uart_init
	.globl _Timer4DelayMs
	.globl _Timer4Config
	.globl _fabsf
	.globl _adc_value
	.globl __kalman_gain
	.globl __last_estimate
	.globl __current_estimate
	.globl __q
	.globl __err_estimate
	.globl __err_measure
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
__err_measure::
	.ds 4
__err_estimate::
	.ds 4
__q::
	.ds 4
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
__current_estimate::
	.ds 4
__last_estimate::
	.ds 4
__kalman_gain::
	.ds 4
_adc_value::
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
;	main.c: 6: void Timer4Config(void){
;	-----------------------------------------
;	 function Timer4Config
;	-----------------------------------------
_Timer4Config:
;	main.c: 7: TIM4->PSCR = (uint8_t)0x07;
	mov	0x5347+0, #0x07
;	main.c: 8: TIM4->ARR = (uint8_t)125 - 1;
	mov	0x5348+0, #0x7c
;	main.c: 10: TIM4->CR1 |= TIM4_CR1_CEN;
	bset	0x5340, #0
;	main.c: 11: }
	ret
;	main.c: 12: void Timer4DelayMs(uint16_t u16Delay){
;	-----------------------------------------
;	 function Timer4DelayMs
;	-----------------------------------------
_Timer4DelayMs:
;	main.c: 13: while(u16Delay){
00104$:
	tnzw	x
	jrne	00130$
	ret
00130$:
;	main.c: 14: TIM4->CNTR = (uint8_t)0;
	mov	0x5346+0, #0x00
;	main.c: 16: TIM4->SR1 = (uint8_t)(~0x01);
	mov	0x5344+0, #0xfe
;	main.c: 17: while((TIM4->SR1 & (uint8_t)0x01) == RESET){}
00101$:
	btjf	0x5344, #0, 00101$
;	main.c: 18: --u16Delay;
	decw	x
	jra	00104$
;	main.c: 20: }
	ret
;	main.c: 21: void uart_init(void){
;	-----------------------------------------
;	 function uart_init
;	-----------------------------------------
_uart_init:
;	main.c: 24: UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  /* Clear the word length bit */
	bres	0x5234, #4
;	main.c: 25: UART1->CR1 |= (uint8_t)0x00; /* Set the word length bit, 8 Data bits */
	mov	0x5234, 0x5234
;	main.c: 26: UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  /* Clear the STOP bits */
	ld	a, 0x5236
	and	a, #0xcf
	ld	0x5236, a
;	main.c: 27: UART1->CR3 |= (uint8_t)0x00; /**< One stop bit is transmitted at the end of frame*/
	mov	0x5236, 0x5236
;	main.c: 29: UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  /* Clear the Parity Control bit */
	ld	a, 0x5234
	and	a, #0xf9
	ld	0x5234, a
;	main.c: 30: UART1->CR1 |= (uint8_t)0x00;  /* Set No Parity Control bit */
	mov	0x5234, 0x5234
;	main.c: 32: UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  /* Clear the LSB mantissa of UART1DIV  */
	ld	a, 0x5232
	mov	0x5232+0, #0x00
;	main.c: 33: UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);	/* Clear the MSB mantissa of UART1DIV  */
	ld	a, 0x5233
	and	a, #0x0f
	ld	0x5233, a
;	main.c: 34: UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  /* Clear the Fraction bits of UART1DIV */
	ld	a, 0x5233
	and	a, #0xf0
	ld	0x5233, a
;	main.c: 37: UART1->BRR2 = (uint8_t)0x03;
	mov	0x5233+0, #0x03
;	main.c: 38: UART1->BRR1 = (uint8_t)0x68;
	mov	0x5232+0, #0x68
;	main.c: 43: UART1->CR2 |= (uint8_t)UART1_CR2_TEN; /*Transmit Enable and Receive Enable*/ 
	bset	0x5235, #3
;	main.c: 44: UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
	bset	0x5235, #2
;	main.c: 45: UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); /*Sync mode Disable, SLK pin Disable*/
	bres	0x5236, #3
;	main.c: 46: UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); /* UART1 Enable */
	bres	0x5234, #5
;	main.c: 47: }
	ret
;	main.c: 48: void uart1_number(int number)
;	-----------------------------------------
;	 function uart1_number
;	-----------------------------------------
_uart1_number:
	sub	sp, #10
	ldw	(0x08, sp), x
;	main.c: 51: char digit[5] = "";
	clr	(0x03, sp)
	clr	(0x04, sp)
	clr	(0x05, sp)
	clr	(0x06, sp)
	clr	(0x07, sp)
;	main.c: 52: while(number != 0)
	clr	(0x0a, sp)
00101$:
	ldw	x, (0x08, sp)
	jreq	00117$
;	main.c: 54: digit[count] = number%10;   //lay chu so ngoai cung xxxx8;
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
;	main.c: 55: ++count;
	inc	(0x0a, sp)
;	main.c: 56: number = number/10;         //chia so number cho 10 de bo so ngoai cung xxxx
	push	#0x0a
	push	#0x00
	ldw	x, (0x0a, sp)
	call	__divsint
	ldw	(0x08, sp), x
	jra	00101$
;	main.c: 58: while (count!=0)
00117$:
00107$:
	tnz	(0x0a, sp)
	jreq	00110$
;	main.c: 60: UART1->DR = (digit[count - 1] + 0x30); // 0x30 = 48 ;
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
;	main.c: 61: while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET);
00104$:
	ld	a, 0x5230
	jrpl	00104$
;	main.c: 62: --count;
	dec	(0x0a, sp)
	jra	00107$
00110$:
;	main.c: 64: }
	addw	sp, #10
	ret
;	main.c: 82: void uart1_string(const char *cy)
;	-----------------------------------------
;	 function uart1_string
;	-----------------------------------------
_uart1_string:
;	main.c: 84: while(*cy)
00104$:
	ld	a, (x)
	jrne	00130$
	ret
00130$:
;	main.c: 86: UART1->DR = (*cy);
	ld	0x5231, a
;	main.c: 87: while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET){}
00101$:
	ld	a, 0x5230
	jrpl	00101$
;	main.c: 88: cy++;
	incw	x
	jra	00104$
;	main.c: 90: }
	ret
;	main.c: 91: void uart1_nline(void)
;	-----------------------------------------
;	 function uart1_nline
;	-----------------------------------------
_uart1_nline:
;	main.c: 93: UART1->DR = (0x0a);
	mov	0x5231+0, #0x0a
;	main.c: 94: while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET);
00101$:
	ld	a, 0x5230
	jrpl	00101$
;	main.c: 95: }
	ret
;	main.c: 103: void SimpleKalmanFilter(float mea_e, float est_e, float q)
;	-----------------------------------------
;	 function SimpleKalmanFilter
;	-----------------------------------------
_SimpleKalmanFilter:
;	main.c: 105: _err_measure=mea_e;
	ldw	x, (0x05, sp)
	ldw	y, (0x03, sp)
	ldw	__err_measure+2, x
	ldw	__err_measure+0, y
;	main.c: 106: _err_estimate=est_e;
	ldw	x, (0x09, sp)
	ldw	y, (0x07, sp)
	ldw	__err_estimate+2, x
	ldw	__err_estimate+0, y
;	main.c: 107: _q = q;
	ldw	x, (0x0d, sp)
	ldw	y, (0x0b, sp)
	ldw	__q+2, x
	ldw	__q+0, y
;	main.c: 108: }
	ldw	x, (1, sp)
	addw	sp, #14
	jp	(x)
;	main.c: 110: float updateEstimate(float mea)
;	-----------------------------------------
;	 function updateEstimate
;	-----------------------------------------
_updateEstimate:
	sub	sp, #4
;	main.c: 112: _kalman_gain = _err_estimate/(_err_estimate + _err_measure);
	push	__err_measure+3
	push	__err_measure+2
	push	__err_measure+1
	push	__err_measure+0
	push	__err_estimate+3
	push	__err_estimate+2
	push	__err_estimate+1
	push	__err_estimate+0
	call	___fsadd
	pushw	x
	pushw	y
	push	__err_estimate+3
	push	__err_estimate+2
	push	__err_estimate+1
	push	__err_estimate+0
	call	___fsdiv
	ldw	__kalman_gain+2, x
	ldw	__kalman_gain+0, y
;	main.c: 113: _current_estimate = _last_estimate + _kalman_gain * (mea - _last_estimate);
	push	__last_estimate+3
	push	__last_estimate+2
	push	__last_estimate+1
	push	__last_estimate+0
	ldw	x, (0x0d, sp)
	pushw	x
	ldw	x, (0x0d, sp)
	pushw	x
	call	___fssub
	pushw	x
	pushw	y
	push	__kalman_gain+3
	push	__kalman_gain+2
	push	__kalman_gain+1
	push	__kalman_gain+0
	call	___fsmul
	pushw	x
	pushw	y
	push	__last_estimate+3
	push	__last_estimate+2
	push	__last_estimate+1
	push	__last_estimate+0
	call	___fsadd
	ldw	__current_estimate+2, x
	ldw	__current_estimate+0, y
;	main.c: 114: _err_estimate =  (1.0 - _kalman_gain)*_err_estimate + fabsf(_last_estimate-_current_estimate)*_q;
	push	__kalman_gain+3
	push	__kalman_gain+2
	push	__kalman_gain+1
	push	__kalman_gain+0
	clrw	x
	pushw	x
	push	#0x80
	push	#0x3f
	call	___fssub
	push	__err_estimate+3
	push	__err_estimate+2
	push	__err_estimate+1
	push	__err_estimate+0
	pushw	x
	pushw	y
	call	___fsmul
	ldw	(0x03, sp), x
	ldw	(0x01, sp), y
	push	__current_estimate+3
	push	__current_estimate+2
	push	__current_estimate+1
	push	__current_estimate+0
	push	__last_estimate+3
	push	__last_estimate+2
	push	__last_estimate+1
	push	__last_estimate+0
	call	___fssub
	pushw	x
	pushw	y
	call	_fabsf
	push	__q+3
	push	__q+2
	push	__q+1
	push	__q+0
	pushw	x
	pushw	y
	call	___fsmul
	pushw	x
	pushw	y
	ldw	x, (0x07, sp)
	pushw	x
	ldw	x, (0x07, sp)
	pushw	x
	call	___fsadd
	ldw	__err_estimate+2, x
	ldw	__err_estimate+0, y
;	main.c: 115: _last_estimate=_current_estimate;
	ldw	x, __current_estimate+2
	ldw	y, __current_estimate+0
	ldw	__last_estimate+2, x
	ldw	__last_estimate+0, y
;	main.c: 117: return _current_estimate;
	ldw	x, __current_estimate+2
	ldw	y, __current_estimate+0
;	main.c: 118: }
	addw	sp, #4
	pushw	x
	ldw	x, (3, sp)
	ldw	(7, sp), x
	popw	x
	addw	sp, #4
	ret
;	main.c: 119: void ADC1_DeInit(void){
;	-----------------------------------------
;	 function ADC1_DeInit
;	-----------------------------------------
_ADC1_DeInit:
;	main.c: 120: ADC1->CSR  = ADC1_CSR_RESET_VALUE;
	mov	0x5400+0, #0x00
;	main.c: 121: ADC1->CR1  = ADC1_CR1_RESET_VALUE;
	mov	0x5401+0, #0x00
;	main.c: 122: ADC1->CR2  = ADC1_CR2_RESET_VALUE;
	mov	0x5402+0, #0x00
;	main.c: 123: ADC1->CR3  = ADC1_CR3_RESET_VALUE;
	mov	0x5403+0, #0x00
;	main.c: 124: ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
	mov	0x5406+0, #0x00
;	main.c: 125: ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
	mov	0x5407+0, #0x00
;	main.c: 126: ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
	mov	0x5408+0, #0xff
;	main.c: 127: ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
	mov	0x5409+0, #0x03
;	main.c: 128: ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
	mov	0x540a+0, #0x00
;	main.c: 129: ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
	mov	0x540b+0, #0x00
;	main.c: 130: ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
	mov	0x540e+0, #0x00
;	main.c: 131: ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
	mov	0x540f+0, #0x00
;	main.c: 132: }
	ret
;	main.c: 133: void ADC1_Init(void){
;	-----------------------------------------
;	 function ADC1_Init
;	-----------------------------------------
_ADC1_Init:
;	main.c: 135: ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
	ld	a, 0x5400
	and	a, #0xf0
	ld	0x5400, a
;	main.c: 137: ADC1->CSR |= (uint8_t)(0x04);
	bset	0x5400, #2
;	main.c: 140: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
	bres	0x5402, #3
;	main.c: 142: ADC1->CR2 |= (uint8_t)(0x08);
	bset	0x5402, #3
;	main.c: 145: ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
	bres	0x5401, #1
;	main.c: 148: ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
	ld	a, 0x5401
	and	a, #0x8f
	ld	0x5401, a
;	main.c: 150: ADC1->CR1 |= (uint8_t)0x70;  
	ld	a, 0x5401
	or	a, #0x70
	ld	0x5401, a
;	main.c: 152: ADC1->CR1 |= ADC1_CR1_ADON;
	bset	0x5401, #0
;	main.c: 154: }
	ret
;	main.c: 155: uint16_t ADC1_Read(void){
;	-----------------------------------------
;	 function ADC1_Read
;	-----------------------------------------
_ADC1_Read:
	sub	sp, #4
;	main.c: 157: ADC1->CR1 |= ADC1_CR1_ADON;
	bset	0x5401, #0
;	main.c: 159: while( (ADC1->CSR & ADC1_CSR_EOC) == RESET){}    
00101$:
	ld	a, 0x5400
	jrpl	00101$
;	main.c: 161: ADC1->CSR &= (uint8_t) (~ADC1_CSR_EOC);
	bres	0x5400, #7
;	main.c: 166: templ = ADC1->DRL;
	ld	a, 0x5405
	ld	xl, a
;	main.c: 168: temph = ADC1->DRH;
	ld	a, 0x5404
;	main.c: 169: temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
	clr	(0x02, sp)
	clr	(0x03, sp)
	or	a, (0x03, sp)
	rrwa	x
	or	a, (0x02, sp)
	ld	xl, a
;	main.c: 170: return ((uint16_t)temph);
;	main.c: 171: }
	addw	sp, #4
	ret
;	main.c: 175: void main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	main.c: 178: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
	ld	a, 0x50c6
	and	a, #0xe7
	ld	0x50c6, a
;	main.c: 179: CLK->CKDIVR |= (uint8_t)0x00;
	mov	0x50c6, 0x50c6
;	main.c: 180: Timer4Config();
	call	_Timer4Config
;	main.c: 181: uart_init();
	call	_uart_init
;	main.c: 182: SimpleKalmanFilter(10, 1, 0.05);
	push	#0xcd
	push	#0xcc
	push	#0x4c
	push	#0x3d
	clrw	x
	pushw	x
	push	#0x80
	push	#0x3f
	clrw	x
	pushw	x
	push	#0x20
	push	#0x41
	call	_SimpleKalmanFilter
;	main.c: 184: ADC1_DeInit();
	call	_ADC1_DeInit
;	main.c: 185: ADC1_Init();
	call	_ADC1_Init
;	main.c: 186: while(1) 
00102$:
;	main.c: 192: adc_value = ADC1_Read();
	call	_ADC1_Read
	ldw	_adc_value+0, x
;	main.c: 194: uart1_number(adc_value);
	ldw	x, _adc_value+0
	call	_uart1_number
;	main.c: 195: uart1_string(",");
	ldw	x, #(___str_1+0)
	call	_uart1_string
;	main.c: 196: a_kalman =(int) updateEstimate(adc_value);
	ldw	x, _adc_value+0
	call	___uint2fs
	pushw	x
	pushw	y
	call	_updateEstimate
	pushw	x
	pushw	y
	call	___fs2sint
;	main.c: 197: uart1_number(a_kalman);
	call	_uart1_number
;	main.c: 201: uart1_nline();
	call	_uart1_nline
	jra	00102$
;	main.c: 204: }
	ret
	.area CODE
	.area CONST
	.area CONST
___str_1:
	.ascii ","
	.db 0x00
	.area CODE
	.area INITIALIZER
__xinit___current_estimate:
	.byte #0x00, #0x00, #0x00, #0x00	;  0.000000e+00
__xinit___last_estimate:
	.byte #0x00, #0x00, #0x00, #0x00	;  0.000000e+00
__xinit___kalman_gain:
	.byte #0x00, #0x00, #0x00, #0x00	;  0.000000e+00
__xinit__adc_value:
	.dw #0x0000
	.area CABS (ABS)
