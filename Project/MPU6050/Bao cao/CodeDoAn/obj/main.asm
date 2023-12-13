;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.0 #14184 (MINGW64)
;--------------------------------------------------------
	.module main
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _OLED_FONT
	.globl _OLED_INIT_CMD
	.globl _main
	.globl _sqrtf
	.globl _uart1_number
	.globl _uart_init
	.globl _I2C_write
	.globl _I2C_address
	.globl _I2C_stop
	.globl _I2C_start
	.globl _I2C_init
	.globl _Timer4DelayMs
	.globl _Timer4Config
	.globl _Mode
	.globl _Threshold
	.globl _Steps
	.globl _SumValue
	.globl _LastSteps
	.globl _Distance
	.globl _Value
	.globl _LastValue
	.globl _CurrentValue
	.globl _AccZMSB
	.globl _AccZLSB
	.globl _AccYMSB
	.globl _AccYLSB
	.globl _AccXMSB
	.globl _AccXLSB
	.globl _AccZ
	.globl _AccY
	.globl _AccX
	.globl _OLED_init
	.globl _OLED_printP
	.globl _OLED_printNum
	.globl _OLED_printOneNumber
	.globl _OLED_cursor
	.globl _OLED_clear
	.globl _initMPU6050
	.globl _getMPU6050
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_AccX::
	.ds 4
_AccY::
	.ds 4
_AccZ::
	.ds 4
_AccXLSB::
	.ds 2
_AccXMSB::
	.ds 2
_AccYLSB::
	.ds 2
_AccYMSB::
	.ds 2
_AccZLSB::
	.ds 2
_AccZMSB::
	.ds 2
_CurrentValue::
	.ds 4
_LastValue::
	.ds 4
_Value::
	.ds 4
_Distance::
	.ds 4
_LastSteps::
	.ds 1
_SumValue::
	.ds 4
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
_Steps::
	.ds 1
_Threshold::
	.ds 4
_Mode::
	.ds 1
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
;	main.c: 116: void main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	sub	sp, #5
;	main.c: 119: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
	ld	a, 0x50c6
	and	a, #0xe7
	ld	0x50c6, a
;	main.c: 120: CLK->CKDIVR |= (uint8_t)0x00;
	mov	0x50c6, 0x50c6
;	main.c: 123: GPIOB->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
	mov	0x5005+0, #0x00
;	main.c: 124: GPIOB->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
	mov	0x5007+0, #0x00
;	main.c: 125: GPIOB->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
	mov	0x5008+0, #0x00
;	main.c: 126: GPIOB->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
	mov	0x5009+0, #0x00
;	main.c: 128: GPIOA->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
	mov	0x5000+0, #0x00
;	main.c: 129: GPIOA->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
	mov	0x5002+0, #0x00
;	main.c: 130: GPIOA->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
	mov	0x5003+0, #0x00
;	main.c: 131: GPIOA->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
	mov	0x5004+0, #0x00
;	main.c: 133: GPIOC->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
	mov	0x500a+0, #0x00
;	main.c: 134: GPIOC->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
	mov	0x500c+0, #0x00
;	main.c: 135: GPIOC->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
	mov	0x500d+0, #0x00
;	main.c: 136: GPIOC->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
	mov	0x500e+0, #0x00
;	main.c: 139: GPIOB->DDR |= (uint8_t)(1 << 4);
	bset	0x5007, #4
;	main.c: 140: GPIOB->ODR |= (uint8_t)(1 << 4);
	bset	0x5005, #4
;	main.c: 141: GPIOB->CR1 &= ~(uint8_t)(1 << 4); /*OPEN DRAIN*/
	bres	0x5008, #4
;	main.c: 142: GPIOB->CR2 &= ~(uint8_t)(1 << 4); /*Output Speed Up to 2Mhz*/
	bres	0x5009, #4
;	main.c: 145: GPIOB->DDR |= (uint8_t)(1 << 5);
	bset	0x5007, #5
;	main.c: 146: GPIOB->ODR |= (uint8_t)(1 << 5);
	bset	0x5005, #5
;	main.c: 147: GPIOB->CR1 &= ~(uint8_t)(1 << 5); /*OPEN DRAIN*/
	bres	0x5008, #5
;	main.c: 148: GPIOB->CR2 &= ~(uint8_t)(1 << 5); /*Output Speed Up to 2Mhz*/
	bres	0x5009, #5
;	main.c: 151: GPIOA->DDR &= ~(uint8_t)(1 << 3);
	bres	0x5002, #3
;	main.c: 152: GPIOA->IDR |= (uint8_t)(1 << 3);
	bset	0x5001, #3
;	main.c: 153: GPIOA->CR1 |= (uint8_t)(1 << 3);  /*PULL UP*/
	bset	0x5003, #3
;	main.c: 154: GPIOA->CR2 &= ~(uint8_t)(1 << 3); /*External interrupt disabled*/
	bres	0x5004, #3
;	main.c: 157: GPIOC->DDR &= ~(uint8_t)(1 << 3);
	bres	0x500c, #3
;	main.c: 158: GPIOC->IDR |= (uint8_t)(1 << 3);
	bset	0x500b, #3
;	main.c: 159: GPIOC->CR1 |= (uint8_t)(1 << 3);  /*PULL UP*/
	bset	0x500d, #3
;	main.c: 160: GPIOC->CR2 &= ~(uint8_t)(1 << 3); /*External interrupt disabled*/
	bres	0x500e, #3
;	main.c: 163: GPIOC->DDR |= (uint8_t)(1 << 4);
	bset	0x500c, #4
;	main.c: 164: GPIOC->ODR &= ~(uint8_t)(1 << 4);
	bres	0x500a, #4
;	main.c: 165: GPIOC->CR1 |= (uint8_t)(1 << 4);  /*PULL PUSH*/
	bset	0x500d, #4
;	main.c: 166: GPIOC->CR2 &= ~(uint8_t)(1 << 4); /*Output Speed Up to 2Mhz*/
	bres	0x500e, #4
;	main.c: 168: uart_init();
	call	_uart_init
;	main.c: 169: Timer4Config();
	call	_Timer4Config
;	main.c: 170: I2C_init();
	call	_I2C_init
;	main.c: 195: initMPU6050();
	call	_initMPU6050
;	main.c: 196: Timer4DelayMs(10);
	ldw	x, #0x000a
	call	_Timer4DelayMs
;	main.c: 198: for (uint8_t a = 0; a < 20; a++)
	clr	(0x05, sp)
00106$:
	ld	a, (0x05, sp)
	cp	a, #0x14
	jrc	00126$
	jp	00101$
00126$:
;	main.c: 200: getMPU6050();
	call	_getMPU6050
;	main.c: 201: CurrentValue = sqrtf((AccX * AccX) + (AccY * AccY));
	push	_AccX+3
	push	_AccX+2
	push	_AccX+1
	push	_AccX+0
	push	_AccX+3
	push	_AccX+2
	push	_AccX+1
	push	_AccX+0
	call	___fsmul
	ldw	(0x03, sp), x
	ldw	(0x01, sp), y
	push	_AccY+3
	push	_AccY+2
	push	_AccY+1
	push	_AccY+0
	push	_AccY+3
	push	_AccY+2
	push	_AccY+1
	push	_AccY+0
	call	___fsmul
	pushw	x
	pushw	y
	ldw	x, (0x07, sp)
	pushw	x
	ldw	x, (0x07, sp)
	pushw	x
	call	___fsadd
	pushw	x
	pushw	y
	call	_sqrtf
	ldw	_CurrentValue+2, x
	ldw	_CurrentValue+0, y
;	main.c: 202: LastValue = LastValue + CurrentValue;
	push	_CurrentValue+3
	push	_CurrentValue+2
	push	_CurrentValue+1
	push	_CurrentValue+0
	push	_LastValue+3
	push	_LastValue+2
	push	_LastValue+1
	push	_LastValue+0
	call	___fsadd
	ldw	_LastValue+2, x
	ldw	_LastValue+0, y
;	main.c: 198: for (uint8_t a = 0; a < 20; a++)
	inc	(0x05, sp)
	jp	00106$
00101$:
;	main.c: 204: uart1_number((int)LastValue);
	push	_LastValue+3
	push	_LastValue+2
	push	_LastValue+1
	push	_LastValue+0
	call	___fs2sint
	call	_uart1_number
;	main.c: 205: while (1)
00103$:
	jra	00103$
;	main.c: 269: }
	addw	sp, #5
	ret
;	main.c: 272: void OLED_init(void)
;	-----------------------------------------
;	 function OLED_init
;	-----------------------------------------
_OLED_init:
	push	a
;	main.c: 274: I2C_start();
	call	_I2C_start
;	main.c: 275: I2C_address(OLED_I2C_ADDR, I2C_DIRECTION_TX);
	push	#0x00
	ld	a, #0x78
	call	_I2C_address
;	main.c: 276: I2C_write(OLED_CMD_MODE);
	clr	a
	call	_I2C_write
;	main.c: 277: for (uint8_t i = 0; i < 12; i++)
	clr	(0x01, sp)
00103$:
	ld	a, (0x01, sp)
	cp	a, #0x0c
	jrnc	00101$
;	main.c: 279: I2C_write(OLED_INIT_CMD[i]);
	clrw	x
	ld	a, (0x01, sp)
	ld	xl, a
	addw	x, #(_OLED_INIT_CMD+0)
	ld	a, (x)
	call	_I2C_write
;	main.c: 277: for (uint8_t i = 0; i < 12; i++)
	inc	(0x01, sp)
	jra	00103$
00101$:
;	main.c: 281: I2C_stop();
	pop	a
	jp	_I2C_stop
;	main.c: 282: }
	pop	a
	ret
;	main.c: 283: void OLED_printP(const char *p)
;	-----------------------------------------
;	 function OLED_printP
;	-----------------------------------------
_OLED_printP:
	sub	sp, #7
	ldw	(0x03, sp), x
;	main.c: 285: I2C_start();
	call	_I2C_start
;	main.c: 286: I2C_address(OLED_I2C_ADDR, I2C_DIRECTION_TX);
	push	#0x00
	ld	a, #0x78
	call	_I2C_address
;	main.c: 287: I2C_write(OLED_DAT_MODE);
	ld	a, #0x40
	call	_I2C_write
;	main.c: 288: while (*p)
	ldw	y, (0x03, sp)
	ldw	(0x05, sp), y
00102$:
	ldw	x, (0x05, sp)
	ld	a, (x)
	ld	(0x07, sp), a
	jreq	00104$
;	main.c: 290: uint16_t offset = *p - 32;
	ld	a, (0x07, sp)
	clrw	x
	ld	xl, a
	subw	x, #0x0020
;	main.c: 291: offset += offset << 2;
	ldw	(0x01, sp), x
	sllw	x
	sllw	x
	addw	x, (0x01, sp)
;	main.c: 292: I2C_write(0x00);
	pushw	x
	clr	a
	call	_I2C_write
	popw	x
;	main.c: 293: for (uint8_t i = 5; i; i--)
	ld	a, #0x05
	ld	(0x07, sp), a
00106$:
	tnz	(0x07, sp)
	jreq	00101$
;	main.c: 295: I2C_write(OLED_FONT[offset++]);
	ldw	y, x
	addw	y, #(_OLED_FONT+0)
	incw	x
	ld	a, (y)
	pushw	x
	call	_I2C_write
	popw	x
;	main.c: 293: for (uint8_t i = 5; i; i--)
	dec	(0x07, sp)
	jra	00106$
00101$:
;	main.c: 297: p++;
	ldw	x, (0x05, sp)
	incw	x
	ldw	(0x05, sp), x
	jra	00102$
00104$:
;	main.c: 299: I2C_stop();
	addw	sp, #7
;	main.c: 300: }
	jp	_I2C_stop
;	main.c: 301: void OLED_printNum(uint16_t num)
;	-----------------------------------------
;	 function OLED_printNum
;	-----------------------------------------
_OLED_printNum:
	sub	sp, #13
	ldw	(0x0a, sp), x
;	main.c: 303: uint8_t mang[] = {0, 0, 0, 0, 0};
	clr	(0x05, sp)
	clr	(0x06, sp)
	clr	(0x07, sp)
	clr	(0x08, sp)
	clr	(0x09, sp)
;	main.c: 304: uint8_t count = 0;
	clr	a
;	main.c: 305: if (num == 0)
	ldw	x, (0x0a, sp)
	jrne	00117$
;	main.c: 307: mang[0] = 0;
	clr	(0x05, sp)
;	main.c: 308: count = 1;
	ld	a, #0x01
;	main.c: 310: while (num != 0)
00117$:
	ld	(0x0d, sp), a
00103$:
	ldw	x, (0x0a, sp)
	jreq	00105$
;	main.c: 312: mang[count] = num % 10;
	clrw	x
	ld	a, (0x0d, sp)
	ld	xl, a
	pushw	x
	ldw	x, sp
	addw	x, #7
	addw	x, (1, sp)
	ldw	(0x03, sp), x
	addw	sp, #2
	ldw	y, (0x0a, sp)
	ldw	(0x03, sp), y
	ldw	x, y
	ldw	y, #0x000a
	divw	x, y
	ld	a, yl
	ldw	x, (0x01, sp)
	ld	(x), a
;	main.c: 313: num = num / 10;
	ldw	x, (0x03, sp)
	ldw	y, #0x000a
	divw	x, y
	ldw	(0x0a, sp), x
;	main.c: 314: ++count;
	inc	(0x0d, sp)
	jra	00103$
00105$:
;	main.c: 316: I2C_start();
	call	_I2C_start
;	main.c: 317: I2C_address(OLED_I2C_ADDR, I2C_DIRECTION_TX);
	push	#0x00
	ld	a, #0x78
	call	_I2C_address
;	main.c: 318: I2C_write(OLED_DAT_MODE);
	ld	a, #0x40
	call	_I2C_write
;	main.c: 319: while (count != 0)
	ld	a, (0x0d, sp)
	ld	(0x0c, sp), a
00107$:
	tnz	(0x0c, sp)
	jreq	00109$
;	main.c: 321: uint16_t offset = mang[count - 1] + 16;
	ld	a, (0x0c, sp)
	dec	a
	ld	(0x04, sp), a
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	(0x03, sp), a
	ldw	x, sp
	addw	x, #5
	addw	x, (0x03, sp)
	ld	a, (x)
	clrw	x
	ld	xl, a
	addw	x, #0x0010
;	main.c: 322: offset += offset << 2;
	ldw	(0x03, sp), x
	sllw	x
	sllw	x
	addw	x, (0x03, sp)
;	main.c: 323: I2C_write(0x00);
	pushw	x
	clr	a
	call	_I2C_write
	popw	x
;	main.c: 324: for (uint8_t i = 5; i; i--)
	ld	a, #0x05
	ld	(0x0d, sp), a
00111$:
	tnz	(0x0d, sp)
	jreq	00106$
;	main.c: 326: I2C_write(OLED_FONT[offset++]);
	ldw	y, x
	addw	y, #(_OLED_FONT+0)
	incw	x
	ld	a, (y)
	pushw	x
	call	_I2C_write
	popw	x
;	main.c: 324: for (uint8_t i = 5; i; i--)
	dec	(0x0d, sp)
	jra	00111$
00106$:
;	main.c: 328: --count;
	dec	(0x0c, sp)
	jra	00107$
00109$:
;	main.c: 330: I2C_stop();
	call	_I2C_stop
;	main.c: 331: }
	addw	sp, #13
	ret
;	main.c: 332: void OLED_printOneNumber(uint8_t num)
;	-----------------------------------------
;	 function OLED_printOneNumber
;	-----------------------------------------
_OLED_printOneNumber:
	sub	sp, #2
;	main.c: 334: uint16_t offset = num + 16;
	clrw	x
	ld	xl, a
	addw	x, #0x0010
;	main.c: 335: offset += offset << 2;
	ldw	(0x01, sp), x
	sllw	x
	sllw	x
	addw	x, (0x01, sp)
	ldw	(0x01, sp), x
;	main.c: 336: I2C_start();
	call	_I2C_start
;	main.c: 337: I2C_address(OLED_I2C_ADDR, OLED_DAT_MODE);
	push	#0x01
	ld	a, #0x78
	call	_I2C_address
;	main.c: 338: I2C_write(0x00);
	clr	a
	call	_I2C_write
;	main.c: 339: for (uint8_t i = 5; i; i--)
	ldw	x, (0x01, sp)
	ld	a, #0x05
	ld	(0x02, sp), a
00103$:
	tnz	(0x02, sp)
	jreq	00101$
;	main.c: 341: I2C_write(OLED_FONT[offset++]);
	ldw	y, x
	addw	y, #(_OLED_FONT+0)
	incw	x
	ld	a, (y)
	pushw	x
	call	_I2C_write
	popw	x
;	main.c: 339: for (uint8_t i = 5; i; i--)
	dec	(0x02, sp)
	jra	00103$
00101$:
;	main.c: 343: I2C_stop();
	addw	sp, #2
;	main.c: 344: }
	jp	_I2C_stop
;	main.c: 345: void OLED_cursor(uint8_t xpos, uint8_t ypos)
;	-----------------------------------------
;	 function OLED_cursor
;	-----------------------------------------
_OLED_cursor:
	push	a
	ld	(0x01, sp), a
;	main.c: 347: I2C_start();
	call	_I2C_start
;	main.c: 348: I2C_address(OLED_I2C_ADDR, I2C_DIRECTION_TX);
	push	#0x00
	ld	a, #0x78
	call	_I2C_address
;	main.c: 349: I2C_write(OLED_CMD_MODE);
	clr	a
	call	_I2C_write
;	main.c: 350: I2C_write(xpos & 0x0F);
	ld	a, (0x01, sp)
	and	a, #0x0f
	call	_I2C_write
;	main.c: 351: I2C_write(0x10 | (xpos >> 4));
	ld	a, (0x01, sp)
	swap	a
	and	a, #0x0f
	or	a, #0x10
	call	_I2C_write
;	main.c: 352: I2C_write(0xB0 | (ypos & 0x07));
	ld	a, (0x04, sp)
	and	a, #0x07
	or	a, #0xb0
	call	_I2C_write
;	main.c: 353: I2C_stop();
	ldw	x, (2, sp)
	ldw	(3, sp), x
	addw	sp, #2
	jp	_I2C_stop
;	main.c: 354: }
	pop	a
	popw	x
	pop	a
	jp	(x)
;	main.c: 355: void OLED_clear(void)
;	-----------------------------------------
;	 function OLED_clear
;	-----------------------------------------
_OLED_clear:
;	main.c: 357: OLED_cursor(0, 0);
	push	#0x00
	clr	a
	call	_OLED_cursor
;	main.c: 358: I2C_start();
	call	_I2C_start
;	main.c: 359: I2C_address(OLED_I2C_ADDR, I2C_DIRECTION_TX);
	push	#0x00
	ld	a, #0x78
	call	_I2C_address
;	main.c: 360: I2C_write(OLED_DAT_MODE);
	ld	a, #0x40
	call	_I2C_write
;	main.c: 361: for (uint16_t i = 0; i < 512; i++)
	clrw	x
00103$:
	ldw	y, x
	cpw	y, #0x0200
	jrc	00118$
	jp	_I2C_stop
00118$:
;	main.c: 363: I2C_write(0x00);
	pushw	x
	clr	a
	call	_I2C_write
	popw	x
;	main.c: 361: for (uint16_t i = 0; i < 512; i++)
	incw	x
;	main.c: 365: I2C_stop();
;	main.c: 366: }
	jra	00103$
;	main.c: 369: void initMPU6050(void)
;	-----------------------------------------
;	 function initMPU6050
;	-----------------------------------------
_initMPU6050:
;	main.c: 371: I2C_start();	/*Disable SLEEP Mode*/
	call	_I2C_start
;	main.c: 372: I2C_address((uint8_t)0x68 << 1, I2C_DIRECTION_TX);
	push	#0x00
	ld	a, #0xd0
	call	_I2C_address
;	main.c: 373: I2C_write(0x6B);
	ld	a, #0x6b
	call	_I2C_write
;	main.c: 374: I2C_write(0x00);
	clr	a
	call	_I2C_write
;	main.c: 375: I2C_stop();
	call	_I2C_stop
;	main.c: 376: Timer4DelayMs(100);
	ldw	x, #0x0064
	call	_Timer4DelayMs
;	main.c: 378: I2C_start();	/*Enable Low Pass Filter*/
	call	_I2C_start
;	main.c: 379: I2C_address((uint8_t)0x68 << 1, I2C_DIRECTION_TX);
	push	#0x00
	ld	a, #0xd0
	call	_I2C_address
;	main.c: 380: I2C_write(0x1A);
	ld	a, #0x1a
	call	_I2C_write
;	main.c: 381: I2C_write(0x05);
	ld	a, #0x05
	call	_I2C_write
;	main.c: 382: I2C_stop();
	call	_I2C_stop
;	main.c: 383: Timer4DelayMs(100);
	ldw	x, #0x0064
	call	_Timer4DelayMs
;	main.c: 385: I2C_start();
	call	_I2C_start
;	main.c: 386: I2C_address((uint8_t)0x68 << 1, I2C_DIRECTION_TX);
	push	#0x00
	ld	a, #0xd0
	call	_I2C_address
;	main.c: 387: I2C_write(0x1B);
	ld	a, #0x1b
	call	_I2C_write
;	main.c: 388: I2C_write(0x00); // 250 do/s
	clr	a
	call	_I2C_write
;	main.c: 389: I2C_stop();
	call	_I2C_stop
;	main.c: 390: Timer4DelayMs(100);
	ldw	x, #0x0064
	call	_Timer4DelayMs
;	main.c: 392: I2C_start(); /*Accelerometer Configuration*/
	call	_I2C_start
;	main.c: 393: I2C_address((uint8_t)0x68 << 1, I2C_DIRECTION_TX);
	push	#0x00
	ld	a, #0xd0
	call	_I2C_address
;	main.c: 394: I2C_write(0x1C);
	ld	a, #0x1c
	call	_I2C_write
;	main.c: 395: I2C_write(0x10); //+-8g
	ld	a, #0x10
	call	_I2C_write
;	main.c: 396: I2C_stop();
;	main.c: 397: }
	jp	_I2C_stop
;	main.c: 398: void getMPU6050(void)
;	-----------------------------------------
;	 function getMPU6050
;	-----------------------------------------
_getMPU6050:
	sub	sp, #2
;	main.c: 402: I2C_start();
	call	_I2C_start
;	main.c: 403: I2C_address(I2C_Slave_Address, I2C_DIRECTION_TX);
	push	#0x00
	ld	a, #0xd0
	call	_I2C_address
;	main.c: 404: I2C_write(0x3B);
	ld	a, #0x3b
	call	_I2C_write
;	main.c: 406: I2C->CR2 |= I2C_CR2_START | I2C_CR2_ACK; /* Generate a START condition and Acknowledge Enable */
	ld	a, 0x5211
	or	a, #0x05
	ld	0x5211, a
;	main.c: 407: while ((I2C->SR1 & I2C_SR1_SB) == 0)
00101$:
	btjf	0x5217, #0, 00101$
;	main.c: 410: I2C->DR = (uint8_t)(I2C_Slave_Address | (uint8_t)I2C_DIRECTION_RX); /* Send the Address + Direction */
	mov	0x5216+0, #0xd1
;	main.c: 412: I2C->SR1;
	ld	a, 0x5217
;	main.c: 413: I2C->SR3;
	ld	a, 0x5219
;	main.c: 414: while ((I2C->SR1 & I2C_SR1_ADDR) == 0)
00104$:
	btjf	0x5217, #1, 00104$
;	main.c: 416: while ((I2C->SR3 & (uint8_t)0x02) == SET)
00107$:
	ld	a, 0x5219
	and	a, #0x02
	dec	a
	jreq	00107$
;	main.c: 419: while ((I2C->SR1 & I2C_SR1_RXNE) == 0)
00110$:
	btjf	0x5217, #6, 00110$
;	main.c: 421: AccXLSB = (uint8_t)I2C->DR;
	ld	a, 0x5216
	clrw	x
	ld	xl, a
	ldw	_AccXLSB+0, x
;	main.c: 422: I2C->CR2 |= (uint8_t)(I2C_CR2_ACK); /* Enable the acknowledgement */
	bset	0x5211, #2
;	main.c: 424: while ((I2C->SR1 & I2C_SR1_RXNE) == 0)
00113$:
	btjf	0x5217, #6, 00113$
;	main.c: 426: AccXMSB = (uint8_t)I2C->DR;
	ld	a, 0x5216
	clrw	x
	ld	xl, a
	ldw	_AccXMSB+0, x
;	main.c: 427: I2C->CR2 |= (uint8_t)(I2C_CR2_ACK); /* Enable the acknowledgement */
	bset	0x5211, #2
;	main.c: 429: while ((I2C->SR1 & I2C_SR1_RXNE) == 0)
00116$:
	btjf	0x5217, #6, 00116$
;	main.c: 431: AccYLSB = (uint8_t)I2C->DR;
	ld	a, 0x5216
	clrw	x
	ld	xl, a
	ldw	_AccYLSB+0, x
;	main.c: 432: I2C->CR2 |= (uint8_t)(I2C_CR2_ACK); /* Enable the acknowledgement */
	bset	0x5211, #2
;	main.c: 434: while ((I2C->SR1 & I2C_SR1_RXNE) == 0)
00119$:
	btjf	0x5217, #6, 00119$
;	main.c: 436: AccYMSB = (uint8_t)I2C->DR;
	ld	a, 0x5216
	clrw	x
	ld	xl, a
	ldw	_AccYMSB+0, x
;	main.c: 437: I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK); /* Enable the acknowledgement */
	bres	0x5211, #2
;	main.c: 439: I2C_stop();
	call	_I2C_stop
;	main.c: 441: AccXLSB = (AccXLSB << 8) | AccXMSB; /*16 bit , 0-65535*/ /*0-1g, 0-9.8m/s^2*/
	ld	a, _AccXLSB+1
	clr	(0x02, sp)
	or	a, _AccXMSB+0
	ld	xh, a
	ld	a, (0x02, sp)
	or	a, _AccXMSB+1
	ld	xl, a
	ldw	_AccXLSB+0, x
;	main.c: 442: AccYLSB = (AccYLSB << 8) | AccYMSB;
	ld	a, _AccYLSB+1
	clr	(0x02, sp)
	or	a, _AccYMSB+0
	ld	xh, a
	ld	a, (0x02, sp)
	or	a, _AccYMSB+1
	ld	xl, a
	ldw	_AccYLSB+0, x
;	main.c: 444: AccX = (float)AccXLSB / 4096.0 - 0.04;
	ldw	x, _AccXLSB+0
	call	___sint2fs
	push	#0x00
	push	#0x00
	push	#0x80
	push	#0x45
	pushw	x
	pushw	y
	call	___fsdiv
	push	#0x0a
	push	#0xd7
	push	#0x23
	push	#0x3d
	pushw	x
	pushw	y
	call	___fssub
	ldw	_AccX+2, x
	ldw	_AccX+0, y
;	main.c: 445: AccY = (float)AccYLSB / 4096.0 + 0.01;
	ldw	x, _AccYLSB+0
	call	___sint2fs
	push	#0x00
	push	#0x00
	push	#0x80
	push	#0x45
	pushw	x
	pushw	y
	call	___fsdiv
	push	#0x0a
	push	#0xd7
	push	#0x23
	push	#0x3c
	pushw	x
	pushw	y
	call	___fsadd
	ldw	_AccY+2, x
	ldw	_AccY+0, y
;	main.c: 446: }
	addw	sp, #2
	ret
	.area CODE
	.area CONST
_OLED_INIT_CMD:
	.db #0xa8	; 168
	.db #0x1f	; 31
	.db #0x22	; 34
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0xda	; 218
	.db #0x02	; 2
	.db #0x8d	; 141
	.db #0x14	; 20
	.db #0xaf	; 175
	.db #0xa1	; 161
	.db #0xc8	; 200
_OLED_FONT:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x7f	; 127
	.db #0x14	; 20
	.db #0x7f	; 127
	.db #0x14	; 20
	.db #0x24	; 36
	.db #0x2a	; 42
	.db #0x7f	; 127
	.db #0x2a	; 42
	.db #0x12	; 18
	.db #0x62	; 98	'b'
	.db #0x64	; 100	'd'
	.db #0x08	; 8
	.db #0x13	; 19
	.db #0x23	; 35
	.db #0x36	; 54	'6'
	.db #0x49	; 73	'I'
	.db #0x55	; 85	'U'
	.db #0x22	; 34
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x22	; 34
	.db #0x41	; 65	'A'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x22	; 34
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x08	; 8
	.db #0x3e	; 62
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x3e	; 62
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xa0	; 160
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x3e	; 62
	.db #0x51	; 81	'Q'
	.db #0x49	; 73	'I'
	.db #0x45	; 69	'E'
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x61	; 97	'a'
	.db #0x51	; 81	'Q'
	.db #0x49	; 73	'I'
	.db #0x46	; 70	'F'
	.db #0x21	; 33
	.db #0x41	; 65	'A'
	.db #0x45	; 69	'E'
	.db #0x4b	; 75	'K'
	.db #0x31	; 49	'1'
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x12	; 18
	.db #0x7f	; 127
	.db #0x10	; 16
	.db #0x27	; 39
	.db #0x45	; 69	'E'
	.db #0x45	; 69	'E'
	.db #0x45	; 69	'E'
	.db #0x39	; 57	'9'
	.db #0x3c	; 60
	.db #0x4a	; 74	'J'
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x30	; 48	'0'
	.db #0x01	; 1
	.db #0x71	; 113	'q'
	.db #0x09	; 9
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x36	; 54	'6'
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x36	; 54	'6'
	.db #0x06	; 6
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x29	; 41
	.db #0x1e	; 30
	.db #0x00	; 0
	.db #0x36	; 54	'6'
	.db #0x36	; 54	'6'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x56	; 86	'V'
	.db #0x36	; 54	'6'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x22	; 34
	.db #0x41	; 65	'A'
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x22	; 34
	.db #0x14	; 20
	.db #0x08	; 8
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x51	; 81	'Q'
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x32	; 50	'2'
	.db #0x49	; 73	'I'
	.db #0x59	; 89	'Y'
	.db #0x51	; 81	'Q'
	.db #0x3e	; 62
	.db #0x7c	; 124
	.db #0x12	; 18
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x7c	; 124
	.db #0x7f	; 127
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x36	; 54	'6'
	.db #0x3e	; 62
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x22	; 34
	.db #0x7f	; 127
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x22	; 34
	.db #0x1c	; 28
	.db #0x7f	; 127
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x41	; 65	'A'
	.db #0x7f	; 127
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0x3e	; 62
	.db #0x41	; 65	'A'
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x7a	; 122	'z'
	.db #0x7f	; 127
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x7f	; 127
	.db #0x41	; 65	'A'
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x41	; 65	'A'
	.db #0x3f	; 63
	.db #0x01	; 1
	.db #0x7f	; 127
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x22	; 34
	.db #0x41	; 65	'A'
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x02	; 2
	.db #0x0c	; 12
	.db #0x02	; 2
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x7f	; 127
	.db #0x3e	; 62
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x3e	; 62
	.db #0x7f	; 127
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x3e	; 62
	.db #0x41	; 65	'A'
	.db #0x51	; 81	'Q'
	.db #0x21	; 33
	.db #0x5e	; 94
	.db #0x7f	; 127
	.db #0x09	; 9
	.db #0x19	; 25
	.db #0x29	; 41
	.db #0x46	; 70	'F'
	.db #0x46	; 70	'F'
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x31	; 49	'1'
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x7f	; 127
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0x38	; 56	'8'
	.db #0x40	; 64
	.db #0x3f	; 63
	.db #0x63	; 99	'c'
	.db #0x14	; 20
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x63	; 99	'c'
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x70	; 112	'p'
	.db #0x08	; 8
	.db #0x07	; 7
	.db #0x61	; 97	'a'
	.db #0x51	; 81	'Q'
	.db #0x49	; 73	'I'
	.db #0x45	; 69	'E'
	.db #0x43	; 67	'C'
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x00	; 0
	.area INITIALIZER
__xinit__Steps:
	.db #0x00	; 0
__xinit__Threshold:
	.byte #0x40, #0xa0, #0x00, #0x00	;  5.000000e+00
__xinit__Mode:
	.db #0x00	; 0
	.area CABS (ABS)
