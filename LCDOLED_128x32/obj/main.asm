;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.0 #14184 (MINGW64)
;--------------------------------------------------------
	.module main
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Message2
	.globl _Message1
	.globl _OLED_FONT
	.globl _OLED_INIT_CMD
	.globl _main
	.globl _Read_EEPROM
	.globl _Write_EEPROM
	.globl _I2C_write
	.globl _I2C_address
	.globl _I2C_stop
	.globl _I2C_start
	.globl _I2C_init
	.globl _Timer4DelayMs
	.globl _Timer4Config
	.globl _Flag
	.globl _Data
	.globl _OLED_init
	.globl _OLED_printP
	.globl _OLED_printNum
	.globl _OLED_printFloat
	.globl _OLED_printOneNumber
	.globl _OLED_cursor
	.globl _OLED_clear
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_Data::
	.ds 1
_Flag::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
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
;	main.c: 151: void Write_EEPROM(uint8_t Data){
;	-----------------------------------------
;	 function Write_EEPROM
;	-----------------------------------------
_Write_EEPROM:
	push	a
	ld	(0x01, sp), a
;	main.c: 153: if( (FLASH->IAPSR &= (uint8_t)FLASH_IAPSR_DUL)== RESET){
	ld	a, 0x505f
	and	a, #0x08
	ld	0x505f, a
	tnz	a
	jrne	00102$
;	main.c: 154: FLASH->DUKR = 0xAE; /* Warning: keys are reversed on data memory !!! */
	mov	0x5064+0, #0xae
;	main.c: 155: FLASH->DUKR = 0x56;
	mov	0x5064+0, #0x56
00102$:
;	main.c: 159: *(PointerAttr uint8_t*) (MemoryAddressCast)0X4000 = Data;
	ldw	x, #0x4000
	ld	a, (0x01, sp)
	ld	(x), a
;	main.c: 162: FLASH->IAPSR &= (uint8_t)0xF7;
	bres	0x505f, #3
;	main.c: 163: }
	pop	a
	ret
;	main.c: 164: uint8_t Read_EEPROM(uint32_t Address){
;	-----------------------------------------
;	 function Read_EEPROM
;	-----------------------------------------
_Read_EEPROM:
;	main.c: 171: Data = (*(PointerAttr uint8_t *) (MemoryAddressCast)Address);
	ldw	x, (0x05, sp)
	ld	a, (x)
;	main.c: 174: return Data;
;	main.c: 175: }
	ldw	x, (1, sp)
	addw	sp, #6
	jp	(x)
;	main.c: 178: void main (void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	main.c: 181: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
	ld	a, 0x50c6
	and	a, #0xe7
	ld	0x50c6, a
;	main.c: 182: CLK->CKDIVR |= (uint8_t)0x00;
	mov	0x50c6, 0x50c6
;	main.c: 184: GPIOB->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
	mov	0x5005+0, #0x00
;	main.c: 185: GPIOB->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
	mov	0x5007+0, #0x00
;	main.c: 186: GPIOB->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
	mov	0x5008+0, #0x00
;	main.c: 187: GPIOB->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
	mov	0x5009+0, #0x00
;	main.c: 189: GPIOD->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
	mov	0x500f+0, #0x00
;	main.c: 190: GPIOD->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
	mov	0x5011+0, #0x00
;	main.c: 191: GPIOD->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
	mov	0x5012+0, #0x00
;	main.c: 192: GPIOD->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
	mov	0x5013+0, #0x00
;	main.c: 195: GPIOB->DDR |= (uint8_t)(1<<4);
	bset	0x5007, #4
;	main.c: 196: GPIOB->ODR |= (uint8_t)(1<<4);
	bset	0x5005, #4
;	main.c: 197: GPIOB->CR1 &= ~(uint8_t)(1<<4);		/*OPEN DRAIN*/
	bres	0x5008, #4
;	main.c: 198: GPIOB->CR2 &= ~(uint8_t)(1<<4);		/*Output Speed Up to 2Mhz*/
	bres	0x5009, #4
;	main.c: 201: GPIOB->DDR |= (uint8_t)(1<<5);
	bset	0x5007, #5
;	main.c: 202: GPIOB->ODR |= (uint8_t)(1<<5);
	bset	0x5005, #5
;	main.c: 203: GPIOB->CR1 &= ~(uint8_t)(1<<5);		/*OPEN DRAIN*/
	bres	0x5008, #5
;	main.c: 204: GPIOB->CR2 &= ~(uint8_t)(1<<5);		/*Output Speed Up to 2Mhz*/
	bres	0x5009, #5
;	main.c: 207: GPIOD->DDR &= ~(uint8_t)(1<<3);
	bres	0x5011, #3
;	main.c: 208: GPIOD->IDR |= (uint8_t)(1<<3);
	bset	0x5010, #3
;	main.c: 209: GPIOD->CR1 |= (uint8_t)(1<<3);		/*PULL UP*/
	bset	0x5012, #3
;	main.c: 210: GPIOD->CR2 &= ~(uint8_t)(1<<3);		/*DISABLE INTERRUPT*/
	bres	0x5013, #3
;	main.c: 212: Timer4Config();
	call	_Timer4Config
;	main.c: 213: I2C_init();
	call	_I2C_init
;	main.c: 214: OLED_init();
	call	_OLED_init
;	main.c: 215: OLED_cursor(0,0);
	push	#0x00
	clr	a
	call	_OLED_cursor
;	main.c: 216: OLED_printP(Message1);
	ldw	x, #(_Message1+0)
	call	_OLED_printP
;	main.c: 217: Timer4DelayMs(2000);
	ldw	x, #0x07d0
	call	_Timer4DelayMs
;	main.c: 218: OLED_clear();
	call	_OLED_clear
;	main.c: 223: while (1)
00104$:
;	main.c: 226: if( (GPIOD->IDR & (1<<3)) == RESET){
	ld	a, 0x5010
	bcp	a, #0x08
	jrne	00102$
;	main.c: 227: OLED_cursor(10,0);
	push	#0x00
	ld	a, #0x0a
	call	_OLED_cursor
;	main.c: 228: OLED_printP("GHI");
	ldw	x, #(___str_0+0)
	call	_OLED_printP
;	main.c: 229: Write_EEPROM(82);
	ld	a, #0x52
	call	_Write_EEPROM
00102$:
;	main.c: 232: Data = Read_EEPROM(0x4000);
	push	#0x00
	push	#0x40
	clrw	x
	pushw	x
	call	_Read_EEPROM
	ld	_Data+0, a
;	main.c: 233: OLED_cursor(0,2);
	push	#0x02
	clr	a
	call	_OLED_cursor
;	main.c: 234: OLED_printNum(Data);
	ld	a, _Data+0
	clrw	x
	ld	xl, a
	call	_OLED_printNum
	jra	00104$
;	main.c: 241: }
	ret
;	main.c: 243: void OLED_init(void) {
;	-----------------------------------------
;	 function OLED_init
;	-----------------------------------------
_OLED_init:
	push	a
;	main.c: 244: I2C_start();
	call	_I2C_start
;	main.c: 245: I2C_address(OLED_I2C_ADDR, I2C_DIRECTION_TX);
	push	#0x00
	ld	a, #0x78
	call	_I2C_address
;	main.c: 246: I2C_write(OLED_CMD_MODE);
	clr	a
	call	_I2C_write
;	main.c: 247: for (uint8_t i = 0;i < 12;i++)
	clr	(0x01, sp)
00103$:
	ld	a, (0x01, sp)
	cp	a, #0x0c
	jrnc	00101$
;	main.c: 249: I2C_write(OLED_INIT_CMD[i]);
	clrw	x
	ld	a, (0x01, sp)
	ld	xl, a
	addw	x, #(_OLED_INIT_CMD+0)
	ld	a, (x)
	call	_I2C_write
;	main.c: 247: for (uint8_t i = 0;i < 12;i++)
	inc	(0x01, sp)
	jra	00103$
00101$:
;	main.c: 251: I2C_stop();
	pop	a
	jp	_I2C_stop
;	main.c: 252: }
	pop	a
	ret
;	main.c: 253: void OLED_printP(const char *p)
;	-----------------------------------------
;	 function OLED_printP
;	-----------------------------------------
_OLED_printP:
	sub	sp, #7
	ldw	(0x03, sp), x
;	main.c: 255: I2C_start();
	call	_I2C_start
;	main.c: 256: I2C_address(OLED_I2C_ADDR,I2C_DIRECTION_TX);
	push	#0x00
	ld	a, #0x78
	call	_I2C_address
;	main.c: 257: I2C_write(OLED_DAT_MODE);
	ld	a, #0x40
	call	_I2C_write
;	main.c: 258: while (*p)
	ldw	y, (0x03, sp)
	ldw	(0x05, sp), y
00102$:
	ldw	x, (0x05, sp)
	ld	a, (x)
	ld	(0x07, sp), a
	jreq	00104$
;	main.c: 260: uint16_t offset = *p - 32;
	ld	a, (0x07, sp)
	clrw	x
	ld	xl, a
	subw	x, #0x0020
;	main.c: 261: offset += offset << 2;
	ldw	(0x01, sp), x
	sllw	x
	sllw	x
	addw	x, (0x01, sp)
;	main.c: 262: I2C_write(0x00);
	pushw	x
	clr	a
	call	_I2C_write
	popw	x
;	main.c: 263: for(uint8_t i = 5; i;i--){ I2C_write(OLED_FONT[offset++]); }
	ld	a, #0x05
	ld	(0x07, sp), a
00106$:
	tnz	(0x07, sp)
	jreq	00101$
	ldw	y, x
	addw	y, #(_OLED_FONT+0)
	incw	x
	ld	a, (y)
	pushw	x
	call	_I2C_write
	popw	x
	dec	(0x07, sp)
	jra	00106$
00101$:
;	main.c: 264: p++;
	ldw	x, (0x05, sp)
	incw	x
	ldw	(0x05, sp), x
	jra	00102$
00104$:
;	main.c: 266: I2C_stop();
	addw	sp, #7
;	main.c: 267: }
	jp	_I2C_stop
;	main.c: 268: void OLED_printNum(uint16_t num){
;	-----------------------------------------
;	 function OLED_printNum
;	-----------------------------------------
_OLED_printNum:
	sub	sp, #13
	ldw	(0x0a, sp), x
;	main.c: 269: uint8_t mang[] = {0,0,0,0,0};
	clr	(0x05, sp)
	clr	(0x06, sp)
	clr	(0x07, sp)
	clr	(0x08, sp)
	clr	(0x09, sp)
;	main.c: 271: while(num != 0){
	clr	(0x0d, sp)
00101$:
	ldw	x, (0x0a, sp)
	jreq	00103$
;	main.c: 272: mang[count] = num%10;
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
;	main.c: 273: num = num /10;
	ldw	x, (0x03, sp)
	ldw	y, #0x000a
	divw	x, y
	ldw	(0x0a, sp), x
;	main.c: 274: ++count;
	inc	(0x0d, sp)
	jra	00101$
00103$:
;	main.c: 276: I2C_start();
	call	_I2C_start
;	main.c: 277: I2C_address(OLED_I2C_ADDR,I2C_DIRECTION_TX);
	push	#0x00
	ld	a, #0x78
	call	_I2C_address
;	main.c: 278: I2C_write(OLED_DAT_MODE);
	ld	a, #0x40
	call	_I2C_write
;	main.c: 279: while(count != 0){
	ld	a, (0x0d, sp)
	ld	(0x0c, sp), a
00105$:
	tnz	(0x0c, sp)
	jreq	00107$
;	main.c: 280: uint16_t offset = mang[count-1] + 16;
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
;	main.c: 281: offset += offset << 2;
	ldw	(0x03, sp), x
	sllw	x
	sllw	x
	addw	x, (0x03, sp)
;	main.c: 282: I2C_write(0x00);
	pushw	x
	clr	a
	call	_I2C_write
	popw	x
;	main.c: 283: for(uint8_t i = 5; i;i--){ I2C_write(OLED_FONT[offset++]); }
	ld	a, #0x05
	ld	(0x0d, sp), a
00109$:
	tnz	(0x0d, sp)
	jreq	00104$
	ldw	y, x
	addw	y, #(_OLED_FONT+0)
	incw	x
	ld	a, (y)
	pushw	x
	call	_I2C_write
	popw	x
	dec	(0x0d, sp)
	jra	00109$
00104$:
;	main.c: 284: --count;
	dec	(0x0c, sp)
	jra	00105$
00107$:
;	main.c: 286: I2C_stop();		
	call	_I2C_stop
;	main.c: 287: }
	addw	sp, #13
	ret
;	main.c: 288: void OLED_printFloat(float num){
;	-----------------------------------------
;	 function OLED_printFloat
;	-----------------------------------------
_OLED_printFloat:
	sub	sp, #11
;	main.c: 289: uint16_t num2 = num * 100;
	ldw	x, (0x10, sp)
	pushw	x
	ldw	x, (0x10, sp)
	pushw	x
	clrw	x
	pushw	x
	push	#0xc8
	push	#0x42
	call	___fsmul
	pushw	x
	pushw	y
	call	___fs2uint
	ldw	(0x01, sp), x
;	main.c: 290: uint8_t mang[] = {0,0,0,0,0};
	clr	(0x05, sp)
	clr	(0x06, sp)
	clr	(0x07, sp)
	clr	(0x08, sp)
	clr	(0x09, sp)
;	main.c: 291: uint8_t count = 0;
	clr	(0x0b, sp)
;	main.c: 292: while(count<5){
00103$:
	ld	a, (0x0b, sp)
	cp	a, #0x05
	jrnc	00105$
;	main.c: 293: mang[count] = (uint8_t)num2%10;
	clrw	x
	ld	a, (0x0b, sp)
	ld	xl, a
	pushw	x
	ldw	x, sp
	addw	x, #7
	addw	x, (1, sp)
	ldw	(0x05, sp), x
	addw	sp, #2
	ld	a, (0x02, sp)
	clrw	x
	push	#0x0a
	push	#0x00
	ld	xl, a
	call	__modsint
	ld	a, xl
	ldw	x, (0x03, sp)
	ld	(x), a
;	main.c: 294: num2 = num2 /10;
	ldw	x, (0x01, sp)
	ldw	y, #0x000a
	divw	x, y
	ldw	(0x01, sp), x
;	main.c: 295: ++count;
	inc	(0x0b, sp)
;	main.c: 296: if(count==2) {mang[2]= 48; ++count;}
	ld	a, (0x0b, sp)
	cp	a, #0x02
	jrne	00103$
	ld	a, #0x30
	ld	(0x07, sp), a
	inc	(0x0b, sp)
	jra	00103$
00105$:
;	main.c: 298: I2C_start();
	call	_I2C_start
;	main.c: 299: I2C_address(OLED_I2C_ADDR,I2C_DIRECTION_TX);
	push	#0x00
	ld	a, #0x78
	call	_I2C_address
;	main.c: 300: I2C_write(OLED_DAT_MODE);
	ld	a, #0x40
	call	_I2C_write
;	main.c: 301: while(count != 0){
	ld	a, (0x0b, sp)
	ld	(0x0a, sp), a
00107$:
	tnz	(0x0a, sp)
	jreq	00109$
;	main.c: 302: uint16_t offset = mang[count-1] + 16;
	ld	a, (0x0a, sp)
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
;	main.c: 303: offset += offset << 2;
	ldw	(0x03, sp), x
	sllw	x
	sllw	x
	addw	x, (0x03, sp)
;	main.c: 304: I2C_write(0x00);
	pushw	x
	clr	a
	call	_I2C_write
	popw	x
;	main.c: 305: for(uint8_t i = 5; i;i--){ I2C_write(OLED_FONT[offset++]); }
	ld	a, #0x05
	ld	(0x0b, sp), a
00111$:
	tnz	(0x0b, sp)
	jreq	00106$
	ldw	y, x
	addw	y, #(_OLED_FONT+0)
	incw	x
	ld	a, (y)
	pushw	x
	call	_I2C_write
	popw	x
	dec	(0x0b, sp)
	jra	00111$
00106$:
;	main.c: 306: --count;
	dec	(0x0a, sp)
	jra	00107$
00109$:
;	main.c: 308: I2C_stop();		
	call	_I2C_stop
;	main.c: 310: }
	ldw	x, (12, sp)
	addw	sp, #17
	jp	(x)
;	main.c: 311: void OLED_printOneNumber(uint8_t num)
;	-----------------------------------------
;	 function OLED_printOneNumber
;	-----------------------------------------
_OLED_printOneNumber:
	sub	sp, #2
;	main.c: 313: uint16_t offset = num + 16;
	clrw	x
	ld	xl, a
	addw	x, #0x0010
;	main.c: 314: offset += offset << 2;
	ldw	(0x01, sp), x
	sllw	x
	sllw	x
	addw	x, (0x01, sp)
	ldw	(0x01, sp), x
;	main.c: 315: I2C_start();
	call	_I2C_start
;	main.c: 316: I2C_address(OLED_I2C_ADDR, OLED_DAT_MODE);
	push	#0x01
	ld	a, #0x78
	call	_I2C_address
;	main.c: 317: I2C_write(0x00);
	clr	a
	call	_I2C_write
;	main.c: 318: for(uint8_t i = 5; i;i--){ I2C_write(OLED_FONT[offset++]); }
	ldw	x, (0x01, sp)
	ld	a, #0x05
	ld	(0x02, sp), a
00103$:
	tnz	(0x02, sp)
	jreq	00101$
	ldw	y, x
	addw	y, #(_OLED_FONT+0)
	incw	x
	ld	a, (y)
	pushw	x
	call	_I2C_write
	popw	x
	dec	(0x02, sp)
	jra	00103$
00101$:
;	main.c: 319: I2C_stop();
	addw	sp, #2
;	main.c: 320: }
	jp	_I2C_stop
;	main.c: 321: void OLED_cursor(uint8_t xpos, uint8_t ypos)
;	-----------------------------------------
;	 function OLED_cursor
;	-----------------------------------------
_OLED_cursor:
	push	a
	ld	(0x01, sp), a
;	main.c: 323: I2C_start();
	call	_I2C_start
;	main.c: 324: I2C_address(OLED_I2C_ADDR, I2C_DIRECTION_TX);
	push	#0x00
	ld	a, #0x78
	call	_I2C_address
;	main.c: 325: I2C_write(OLED_CMD_MODE);
	clr	a
	call	_I2C_write
;	main.c: 326: I2C_write(xpos & 0x0F);
	ld	a, (0x01, sp)
	and	a, #0x0f
	call	_I2C_write
;	main.c: 327: I2C_write(0x10 | (xpos >> 4));
	ld	a, (0x01, sp)
	swap	a
	and	a, #0x0f
	or	a, #0x10
	call	_I2C_write
;	main.c: 328: I2C_write(0xB0 | (ypos & 0x07));
	ld	a, (0x04, sp)
	and	a, #0x07
	or	a, #0xb0
	call	_I2C_write
;	main.c: 329: I2C_stop();
	ldw	x, (2, sp)
	ldw	(3, sp), x
	addw	sp, #2
	jp	_I2C_stop
;	main.c: 330: }
	pop	a
	popw	x
	pop	a
	jp	(x)
;	main.c: 331: void OLED_clear(void)
;	-----------------------------------------
;	 function OLED_clear
;	-----------------------------------------
_OLED_clear:
;	main.c: 333: OLED_cursor(0,0);
	push	#0x00
	clr	a
	call	_OLED_cursor
;	main.c: 334: I2C_start();
	call	_I2C_start
;	main.c: 335: I2C_address(OLED_I2C_ADDR, I2C_DIRECTION_TX);
	push	#0x00
	ld	a, #0x78
	call	_I2C_address
;	main.c: 336: I2C_write(OLED_DAT_MODE);
	ld	a, #0x40
	call	_I2C_write
;	main.c: 337: for (uint16_t i=0;i<512;i++)
	clrw	x
00103$:
	ldw	y, x
	cpw	y, #0x0200
	jrc	00118$
	jp	_I2C_stop
00118$:
;	main.c: 339: I2C_write(0x00);
	pushw	x
	clr	a
	call	_I2C_write
	popw	x
;	main.c: 337: for (uint16_t i=0;i<512;i++)
	incw	x
;	main.c: 341: I2C_stop();
;	main.c: 342: }
	jra	00103$
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
_Message1:
	.ascii "DO AN"
	.db 0x00
_Message2:
	.ascii "SO BUOC="
	.db 0x00
	.area CONST
___str_0:
	.ascii "GHI"
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
