;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Apr  3 2018) (Linux)
; This file was generated Tue Feb 11 21:09:31 2025
;--------------------------------------------------------
	.module one_wire
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _delay_us
	.globl _OneWireHigh
	.globl _OneWireRelease
	.globl _OneWireRead
	.globl _OneWireReset
	.globl _OneWireWriteBit
	.globl _OneWireReadBit
	.globl _OneWireWriteByte
	.globl _OneWireReadByte
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
;	lib/src/one-wire.c: 12: void OneWireHigh(){
;	-----------------------------------------
;	 function OneWireHigh
;	-----------------------------------------
_OneWireHigh:
;	lib/src/one-wire.c: 14: OW_OUT();
	ldw	x, #0x500c
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
;	lib/src/one-wire.c: 15: OW_PIN_OPEN_DRAIN();
	ldw	x, #0x500d
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	lib/src/one-wire.c: 17: OW_HIGH();
	ldw	x, #0x500a
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
	ret
;	lib/src/one-wire.c: 20: void OneWireRelease(){
;	-----------------------------------------
;	 function OneWireRelease
;	-----------------------------------------
_OneWireRelease:
;	lib/src/one-wire.c: 22: OW_OUT();
	ldw	x, #0x500c
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
;	lib/src/one-wire.c: 23: OW_PIN_OPEN_DRAIN();
	ldw	x, #0x500d
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	lib/src/one-wire.c: 25: OW_LOW();
	ldw	x, #0x500a
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
	ret
;	lib/src/one-wire.c: 28: unsigned char OneWireRead(){
;	-----------------------------------------
;	 function OneWireRead
;	-----------------------------------------
_OneWireRead:
;	lib/src/one-wire.c: 29: return OW_PIN_VALUE();
	ldw	x, #0x500b
	ld	a, (x)
	and	a, #0x10
	ret
;	lib/src/one-wire.c: 32: unsigned int OneWireReset(){
;	-----------------------------------------
;	 function OneWireReset
;	-----------------------------------------
_OneWireReset:
;	lib/src/one-wire.c: 35: OneWireRelease();
	call	_OneWireRelease
;	lib/src/one-wire.c: 36: delay_us(479); // 480uS Delay
	push	#0xdf
	push	#0x01
	call	_delay_us
	addw	sp, #2
;	lib/src/one-wire.c: 37: OneWireHigh();
	call	_OneWireHigh
;	lib/src/one-wire.c: 38: delay_us(69);  // wait 70 uS before reading
	push	#0x45
	push	#0x00
	call	_delay_us
	addw	sp, #2
;	lib/src/one-wire.c: 40: OW = OneWireRead(); // check for OneWire
	call	_OneWireRead
	clrw	x
	ld	xl, a
;	lib/src/one-wire.c: 41: delay_us(479);      // 480uS delay
	pushw	x
	push	#0xdf
	push	#0x01
	call	_delay_us
	addw	sp, #2
	call	_OneWireHigh
	popw	x
;	lib/src/one-wire.c: 43: return OW;
	ret
;	lib/src/one-wire.c: 47: void OneWireWriteBit(unsigned char b){
;	-----------------------------------------
;	 function OneWireWriteBit
;	-----------------------------------------
_OneWireWriteBit:
;	lib/src/one-wire.c: 48: if(b){
	tnz	(0x03, sp)
	jreq	00102$
;	lib/src/one-wire.c: 49: OneWireRelease();
	call	_OneWireRelease
;	lib/src/one-wire.c: 50: delay_us(5);  // wait 6uS
	push	#0x05
	push	#0x00
	call	_delay_us
	addw	sp, #2
;	lib/src/one-wire.c: 51: OneWireHigh();
	call	_OneWireHigh
;	lib/src/one-wire.c: 52: delay_us(63); // wait 64uS
	push	#0x3f
	push	#0x00
	call	_delay_us
	addw	sp, #2
	jra	00104$
00102$:
;	lib/src/one-wire.c: 55: OneWireRelease();
	call	_OneWireRelease
;	lib/src/one-wire.c: 56: delay_us(59); // wait 60uS
	push	#0x3b
	push	#0x00
	call	_delay_us
	addw	sp, #2
;	lib/src/one-wire.c: 57: OneWireHigh();
	call	_OneWireHigh
;	lib/src/one-wire.c: 58: delay_us(9); // wait 10uS
	push	#0x09
	push	#0x00
	call	_delay_us
	addw	sp, #2
00104$:
	ret
;	lib/src/one-wire.c: 64: unsigned char OneWireReadBit() {
;	-----------------------------------------
;	 function OneWireReadBit
;	-----------------------------------------
_OneWireReadBit:
;	lib/src/one-wire.c: 67: OneWireRelease();
	call	_OneWireRelease
;	lib/src/one-wire.c: 68: delay_us(5); // wait 6uS
	push	#0x05
	push	#0x00
	call	_delay_us
	addw	sp, #2
;	lib/src/one-wire.c: 69: OneWireHigh();
	call	_OneWireHigh
;	lib/src/one-wire.c: 70: delay_us(8); // wait 9uS
	push	#0x08
	push	#0x00
	call	_delay_us
	addw	sp, #2
;	lib/src/one-wire.c: 71: out = OneWireRead();
	call	_OneWireRead
;	lib/src/one-wire.c: 73: if(out) {
	tnz	a
	jreq	00102$
;	lib/src/one-wire.c: 74: out = 0x01;
	ld	a, #0x01
;	lib/src/one-wire.c: 78: out = 0x00;
	.byte 0x21
00102$:
	clr	a
00103$:
;	lib/src/one-wire.c: 82: delay_us(54); // wait 55uS
	push	a
	push	#0x36
	push	#0x00
	call	_delay_us
	addw	sp, #2
	pop	a
;	lib/src/one-wire.c: 83: return out;
	ret
;	lib/src/one-wire.c: 86: void OneWireWriteByte(unsigned char b) {
;	-----------------------------------------
;	 function OneWireWriteByte
;	-----------------------------------------
_OneWireWriteByte:
;	lib/src/one-wire.c: 89: for(i=0; i < 8; i++) {
	clrw	x
00102$:
;	lib/src/one-wire.c: 90: OneWireWriteBit(b & 0x01); // send LS bit first
	ld	a, (0x03, sp)
	and	a, #0x01
	pushw	x
	push	a
	call	_OneWireWriteBit
	pop	a
	popw	x
;	lib/src/one-wire.c: 91: b = b >> 1;
	ld	a, (0x03, sp)
	srl	a
	ld	(0x03, sp), a
;	lib/src/one-wire.c: 89: for(i=0; i < 8; i++) {
	incw	x
	cpw	x, #0x0008
	jrslt	00102$
	ret
;	lib/src/one-wire.c: 95: unsigned char OneWireReadByte(void){
;	-----------------------------------------
;	 function OneWireReadByte
;	-----------------------------------------
_OneWireReadByte:
	sub	sp, #2
;	lib/src/one-wire.c: 99: out = 0;
	clr	a
;	lib/src/one-wire.c: 100: for(i = 0; i < 8; i++){       // read in LS bit first
	ldw	x, #0x0008
	ldw	(0x01, sp), x
00106$:
;	lib/src/one-wire.c: 101: out = out >> 1;             // get out ready for next bit
	srl	a
;	lib/src/one-wire.c: 102: if(OneWireReadBit() & 0x01) // if its a one
	push	a
	call	_OneWireReadBit
	ld	xl, a
	pop	a
	srlw	x
	jrnc	00102$
;	lib/src/one-wire.c: 103: out = out | 0x80;         // place a 1
	or	a, #0x80
00102$:
	ldw	x, (0x01, sp)
	decw	x
	ldw	(0x01, sp), x
;	lib/src/one-wire.c: 100: for(i = 0; i < 8; i++){       // read in LS bit first
	tnzw	x
	jrne	00106$
;	lib/src/one-wire.c: 105: return out;
	addw	sp, #2
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
