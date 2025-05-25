;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.0 #14184 (MINGW64)
;--------------------------------------------------------
	.module stm8s_exti
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _EXTI_DeInit
	.globl _EXTI_SetExtIntSensitivity
	.globl _EXTI_SetTLISensitivity
	.globl _EXTI_GetExtIntSensitivity
	.globl _EXTI_GetTLISensitivity
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
;	lib/src/stm8s_exti.c: 53: void EXTI_DeInit(void)
;	-----------------------------------------
;	 function EXTI_DeInit
;	-----------------------------------------
_EXTI_DeInit:
;	lib/src/stm8s_exti.c: 55: EXTI->CR1 = EXTI_CR1_RESET_VALUE;
	mov	0x50a0+0, #0x00
;	lib/src/stm8s_exti.c: 56: EXTI->CR2 = EXTI_CR2_RESET_VALUE;
	mov	0x50a1+0, #0x00
;	lib/src/stm8s_exti.c: 57: }
	ret
;	lib/src/stm8s_exti.c: 70: void EXTI_SetExtIntSensitivity(EXTI_Port_TypeDef Port, EXTI_Sensitivity_TypeDef SensitivityValue)
;	-----------------------------------------
;	 function EXTI_SetExtIntSensitivity
;	-----------------------------------------
_EXTI_SetExtIntSensitivity:
	push	a
;	lib/src/stm8s_exti.c: 77: switch (Port)
	cp	a, #0x04
	jrule	00115$
	jp	00108$
00115$:
;	lib/src/stm8s_exti.c: 85: EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
	exg	a, yl
	ld	a, (0x04, sp)
	exg	a, yl
;	lib/src/stm8s_exti.c: 77: switch (Port)
	clrw	x
	ld	xl, a
	sllw	x
	ldw	x, (#00116$, x)
	jp	(x)
00116$:
	.dw	#00101$
	.dw	#00102$
	.dw	#00103$
	.dw	#00104$
	.dw	#00105$
;	lib/src/stm8s_exti.c: 79: case EXTI_PORT_GPIOA:
00101$:
;	lib/src/stm8s_exti.c: 80: EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PAIS);
	ld	a, 0x50a0
	and	a, #0xfc
	ld	0x50a0, a
;	lib/src/stm8s_exti.c: 81: EXTI->CR1 |= (uint8_t)(SensitivityValue);
	ld	a, 0x50a0
	or	a, (0x04, sp)
	ld	0x50a0, a
;	lib/src/stm8s_exti.c: 82: break;
	jra	00108$
;	lib/src/stm8s_exti.c: 83: case EXTI_PORT_GPIOB:
00102$:
;	lib/src/stm8s_exti.c: 84: EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PBIS);
	ld	a, 0x50a0
	and	a, #0xf3
	ld	0x50a0, a
;	lib/src/stm8s_exti.c: 85: EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
	ld	a, 0x50a0
	ldw	x, y
	sllw	x
	sllw	x
	pushw	x
	or	a, (2, sp)
	popw	x
	ld	0x50a0, a
;	lib/src/stm8s_exti.c: 86: break;
	jra	00108$
;	lib/src/stm8s_exti.c: 87: case EXTI_PORT_GPIOC:
00103$:
;	lib/src/stm8s_exti.c: 88: EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PCIS);
	ld	a, 0x50a0
	and	a, #0xcf
	ld	0x50a0, a
;	lib/src/stm8s_exti.c: 89: EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 4);
	ld	a, 0x50a0
	ld	(0x01, sp), a
	ld	a, yl
	swap	a
	and	a, #0xf0
	or	a, (0x01, sp)
	ld	0x50a0, a
;	lib/src/stm8s_exti.c: 90: break;
	jra	00108$
;	lib/src/stm8s_exti.c: 91: case EXTI_PORT_GPIOD:
00104$:
;	lib/src/stm8s_exti.c: 92: EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS);
	ld	a, 0x50a0
	and	a, #0x3f
	ld	0x50a0, a
;	lib/src/stm8s_exti.c: 93: EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 6);
	ld	a, 0x50a0
	ld	(0x01, sp), a
	ld	a, yl
	swap	a
	and	a, #0xf0
	sll	a
	sll	a
	or	a, (0x01, sp)
	ld	0x50a0, a
;	lib/src/stm8s_exti.c: 94: break;
	jra	00108$
;	lib/src/stm8s_exti.c: 95: case EXTI_PORT_GPIOE:
00105$:
;	lib/src/stm8s_exti.c: 96: EXTI->CR2 &= (uint8_t)(~EXTI_CR2_PEIS);
	ld	a, 0x50a1
	and	a, #0xfc
	ld	0x50a1, a
;	lib/src/stm8s_exti.c: 97: EXTI->CR2 |= (uint8_t)(SensitivityValue);
	ld	a, 0x50a1
	or	a, (0x04, sp)
	ld	0x50a1, a
;	lib/src/stm8s_exti.c: 101: }
00108$:
;	lib/src/stm8s_exti.c: 102: }
	pop	a
	popw	x
	pop	a
	jp	(x)
;	lib/src/stm8s_exti.c: 111: void EXTI_SetTLISensitivity(EXTI_TLISensitivity_TypeDef SensitivityValue)
;	-----------------------------------------
;	 function EXTI_SetTLISensitivity
;	-----------------------------------------
_EXTI_SetTLISensitivity:
	push	a
	ld	(0x01, sp), a
;	lib/src/stm8s_exti.c: 117: EXTI->CR2 &= (uint8_t)(~EXTI_CR2_TLIS);
	ld	a, 0x50a1
	and	a, #0xfb
	ld	0x50a1, a
;	lib/src/stm8s_exti.c: 118: EXTI->CR2 |= (uint8_t)(SensitivityValue);
	ld	a, 0x50a1
	or	a, (0x01, sp)
	ld	0x50a1, a
;	lib/src/stm8s_exti.c: 119: }
	pop	a
	ret
;	lib/src/stm8s_exti.c: 126: EXTI_Sensitivity_TypeDef EXTI_GetExtIntSensitivity(EXTI_Port_TypeDef Port)
;	-----------------------------------------
;	 function EXTI_GetExtIntSensitivity
;	-----------------------------------------
_EXTI_GetExtIntSensitivity:
	ld	xl, a
;	lib/src/stm8s_exti.c: 128: uint8_t value = 0;
	clr	a
;	lib/src/stm8s_exti.c: 133: switch (Port)
	push	a
	ld	a, xl
	cp	a, #0x04
	pop	a
	jrule	00115$
	ret
00115$:
	clr	a
	ld	xh, a
	sllw	x
	ldw	x, (#00116$, x)
	jp	(x)
00116$:
	.dw	#00101$
	.dw	#00102$
	.dw	#00103$
	.dw	#00104$
	.dw	#00105$
;	lib/src/stm8s_exti.c: 135: case EXTI_PORT_GPIOA:
00101$:
;	lib/src/stm8s_exti.c: 136: value = (uint8_t)(EXTI->CR1 & EXTI_CR1_PAIS);
	ld	a, 0x50a0
	and	a, #0x03
;	lib/src/stm8s_exti.c: 137: break;
	ret
;	lib/src/stm8s_exti.c: 138: case EXTI_PORT_GPIOB:
00102$:
;	lib/src/stm8s_exti.c: 139: value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PBIS) >> 2);
	ld	a, 0x50a0
	and	a, #0x0c
	srl	a
	srl	a
;	lib/src/stm8s_exti.c: 140: break;
	ret
;	lib/src/stm8s_exti.c: 141: case EXTI_PORT_GPIOC:
00103$:
;	lib/src/stm8s_exti.c: 142: value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PCIS) >> 4);
	ld	a, 0x50a0
	and	a, #0x30
	swap	a
	and	a, #0x0f
;	lib/src/stm8s_exti.c: 143: break;
	ret
;	lib/src/stm8s_exti.c: 144: case EXTI_PORT_GPIOD:
00104$:
;	lib/src/stm8s_exti.c: 145: value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PDIS) >> 6);
	ld	a, 0x50a0
	and	a, #0xc0
	swap	a
	and	a, #0x0f
	srl	a
	srl	a
;	lib/src/stm8s_exti.c: 146: break;
	ret
;	lib/src/stm8s_exti.c: 147: case EXTI_PORT_GPIOE:
00105$:
;	lib/src/stm8s_exti.c: 148: value = (uint8_t)(EXTI->CR2 & EXTI_CR2_PEIS);
	ld	a, 0x50a1
	and	a, #0x03
;	lib/src/stm8s_exti.c: 152: }
;	lib/src/stm8s_exti.c: 154: return((EXTI_Sensitivity_TypeDef)value);
;	lib/src/stm8s_exti.c: 155: }
	ret
;	lib/src/stm8s_exti.c: 162: EXTI_TLISensitivity_TypeDef EXTI_GetTLISensitivity(void)
;	-----------------------------------------
;	 function EXTI_GetTLISensitivity
;	-----------------------------------------
_EXTI_GetTLISensitivity:
;	lib/src/stm8s_exti.c: 167: value = (uint8_t)(EXTI->CR2 & EXTI_CR2_TLIS);
	ld	a, 0x50a1
	and	a, #0x04
;	lib/src/stm8s_exti.c: 169: return((EXTI_TLISensitivity_TypeDef)value);
;	lib/src/stm8s_exti.c: 170: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
