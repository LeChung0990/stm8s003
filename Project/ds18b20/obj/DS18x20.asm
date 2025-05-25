;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Apr  3 2018) (Linux)
; This file was generated Tue Feb 11 21:24:25 2025
;--------------------------------------------------------
	.module DS18x20
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _OneWireReadByte
	.globl _OneWireWriteByte
	.globl _OneWireReset
	.globl _DS18x20_ReadTemp
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
;	lib/src/DS18x20.c: 18: float DS18x20_ReadTemp(void) {
;	-----------------------------------------
;	 function DS18x20_ReadTemp
;	-----------------------------------------
_DS18x20_ReadTemp:
	sub	sp, #5
;	lib/src/DS18x20.c: 22: OneWireReset();                       // Reset Pulse
	call	_OneWireReset
;	lib/src/DS18x20.c: 23: OneWireWriteByte(SKIP_ROM);           // Issue skip ROM command (CCh)
	push	#0xcc
	call	_OneWireWriteByte
	pop	a
;	lib/src/DS18x20.c: 24: OneWireWriteByte(CONVERT_T);          // Convert T command (44h)
	push	#0x44
	call	_OneWireWriteByte
	pop	a
;	lib/src/DS18x20.c: 25: while(!OW_PIN_VALUE());               // DQ will hold line low while making measurement
00101$:
	ldw	x, #0x500b
	ld	a, (x)
	bcp	a, #0x10
	jreq	00101$
;	lib/src/DS18x20.c: 26: OneWireReset();                       // Start new command sequence
	call	_OneWireReset
;	lib/src/DS18x20.c: 27: OneWireWriteByte(SKIP_ROM);           // Issue skip ROM command
	push	#0xcc
	call	_OneWireWriteByte
	pop	a
;	lib/src/DS18x20.c: 28: OneWireWriteByte(READ_SCRATCHPAD);    // Read Scratchpad (BEh) - 15 bits
	push	#0xbe
	call	_OneWireWriteByte
	pop	a
;	lib/src/DS18x20.c: 29: LSB = OneWireReadByte();
	call	_OneWireReadByte
	ld	(0x01, sp), a
;	lib/src/DS18x20.c: 30: MSB = OneWireReadByte();
	call	_OneWireReadByte
;	lib/src/DS18x20.c: 31: OneWireReset();                       // Stop Reading
	push	a
	call	_OneWireReset
	pop	a
;	lib/src/DS18x20.c: 32: return (float) (((MSB << 8) | LSB)/ 16.0);
	ld	xh, a
	clr	a
	clr	(0x05, sp)
	ld	a, (0x01, sp)
	clr	(0x02, sp)
	or	a, (0x05, sp)
	rlwa	x
	or	a, (0x02, sp)
	ld	xh, a
	pushw	x
	call	___sint2fs
	addw	sp, #2
	push	#0x00
	push	#0x00
	push	#0x80
	push	#0x41
	pushw	x
	pushw	y
	call	___fsdiv
	addw	sp, #13
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
