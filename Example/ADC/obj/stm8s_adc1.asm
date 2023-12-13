;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.0 #14184 (MINGW64)
;--------------------------------------------------------
	.module stm8s_adc1
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ADC1_DeInit
	.globl _ADC1_Init
	.globl _ADC1_Cmd
	.globl _ADC1_ScanModeCmd
	.globl _ADC1_DataBufferCmd
	.globl _ADC1_ITConfig
	.globl _ADC1_PrescalerConfig
	.globl _ADC1_SchmittTriggerConfig
	.globl _ADC1_ConversionConfig
	.globl _ADC1_ExternalTriggerConfig
	.globl _ADC1_StartConversion
	.globl _ADC1_GetConversionValue
	.globl _ADC1_AWDChannelConfig
	.globl _ADC1_SetHighThreshold
	.globl _ADC1_SetLowThreshold
	.globl _ADC1_GetBufferValue
	.globl _ADC1_GetAWDChannelStatus
	.globl _ADC1_GetFlagStatus
	.globl _ADC1_ClearFlag
	.globl _ADC1_GetITStatus
	.globl _ADC1_ClearITPendingBit
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
;	lib/src/stm8s_adc1.c: 52: void ADC1_DeInit(void)
;	-----------------------------------------
;	 function ADC1_DeInit
;	-----------------------------------------
_ADC1_DeInit:
;	lib/src/stm8s_adc1.c: 54: ADC1->CSR  = ADC1_CSR_RESET_VALUE;
	mov	0x5400+0, #0x00
;	lib/src/stm8s_adc1.c: 55: ADC1->CR1  = ADC1_CR1_RESET_VALUE;
	mov	0x5401+0, #0x00
;	lib/src/stm8s_adc1.c: 56: ADC1->CR2  = ADC1_CR2_RESET_VALUE;
	mov	0x5402+0, #0x00
;	lib/src/stm8s_adc1.c: 57: ADC1->CR3  = ADC1_CR3_RESET_VALUE;
	mov	0x5403+0, #0x00
;	lib/src/stm8s_adc1.c: 58: ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
	mov	0x5406+0, #0x00
;	lib/src/stm8s_adc1.c: 59: ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
	mov	0x5407+0, #0x00
;	lib/src/stm8s_adc1.c: 60: ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
	mov	0x5408+0, #0xff
;	lib/src/stm8s_adc1.c: 61: ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
	mov	0x5409+0, #0x03
;	lib/src/stm8s_adc1.c: 62: ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
	mov	0x540a+0, #0x00
;	lib/src/stm8s_adc1.c: 63: ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
	mov	0x540b+0, #0x00
;	lib/src/stm8s_adc1.c: 64: ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
	mov	0x540e+0, #0x00
;	lib/src/stm8s_adc1.c: 65: ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
	mov	0x540f+0, #0x00
;	lib/src/stm8s_adc1.c: 66: }
	ret
;	lib/src/stm8s_adc1.c: 88: void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
;	-----------------------------------------
;	 function ADC1_Init
;	-----------------------------------------
_ADC1_Init:
	ld	xl, a
;	lib/src/stm8s_adc1.c: 103: ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
	ld	a, (0x07, sp)
	push	a
	ld	a, (0x04, sp)
	push	a
	ld	a, xl
	call	_ADC1_ConversionConfig
;	lib/src/stm8s_adc1.c: 105: ADC1_PrescalerConfig(ADC1_PrescalerSelection);
	ld	a, (0x04, sp)
	call	_ADC1_PrescalerConfig
;	lib/src/stm8s_adc1.c: 110: ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
	ld	a, (0x06, sp)
	push	a
	ld	a, (0x06, sp)
	call	_ADC1_ExternalTriggerConfig
;	lib/src/stm8s_adc1.c: 115: ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
	ld	a, (0x09, sp)
	push	a
	ld	a, (0x09, sp)
	call	_ADC1_SchmittTriggerConfig
;	lib/src/stm8s_adc1.c: 118: ADC1->CR1 |= ADC1_CR1_ADON;
	ld	a, 0x5401
	or	a, #0x01
	ld	0x5401, a
;	lib/src/stm8s_adc1.c: 119: }
	ldw	x, (1, sp)
	addw	sp, #9
	jp	(x)
;	lib/src/stm8s_adc1.c: 126: void ADC1_Cmd(FunctionalState NewState)
;	-----------------------------------------
;	 function ADC1_Cmd
;	-----------------------------------------
_ADC1_Cmd:
	push	a
	ld	(0x01, sp), a
;	lib/src/stm8s_adc1.c: 133: ADC1->CR1 |= ADC1_CR1_ADON;
	ld	a, 0x5401
;	lib/src/stm8s_adc1.c: 131: if (NewState != DISABLE)
	tnz	(0x01, sp)
	jreq	00102$
;	lib/src/stm8s_adc1.c: 133: ADC1->CR1 |= ADC1_CR1_ADON;
	or	a, #0x01
	ld	0x5401, a
	jra	00104$
00102$:
;	lib/src/stm8s_adc1.c: 137: ADC1->CR1 &= (uint8_t)(~ADC1_CR1_ADON);
	and	a, #0xfe
	ld	0x5401, a
00104$:
;	lib/src/stm8s_adc1.c: 139: }
	pop	a
	ret
;	lib/src/stm8s_adc1.c: 146: void ADC1_ScanModeCmd(FunctionalState NewState)
;	-----------------------------------------
;	 function ADC1_ScanModeCmd
;	-----------------------------------------
_ADC1_ScanModeCmd:
	push	a
	ld	(0x01, sp), a
;	lib/src/stm8s_adc1.c: 153: ADC1->CR2 |= ADC1_CR2_SCAN;
	ld	a, 0x5402
;	lib/src/stm8s_adc1.c: 151: if (NewState != DISABLE)
	tnz	(0x01, sp)
	jreq	00102$
;	lib/src/stm8s_adc1.c: 153: ADC1->CR2 |= ADC1_CR2_SCAN;
	or	a, #0x02
	ld	0x5402, a
	jra	00104$
00102$:
;	lib/src/stm8s_adc1.c: 157: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_SCAN);
	and	a, #0xfd
	ld	0x5402, a
00104$:
;	lib/src/stm8s_adc1.c: 159: }
	pop	a
	ret
;	lib/src/stm8s_adc1.c: 166: void ADC1_DataBufferCmd(FunctionalState NewState)
;	-----------------------------------------
;	 function ADC1_DataBufferCmd
;	-----------------------------------------
_ADC1_DataBufferCmd:
	push	a
	ld	(0x01, sp), a
;	lib/src/stm8s_adc1.c: 173: ADC1->CR3 |= ADC1_CR3_DBUF;
	ld	a, 0x5403
;	lib/src/stm8s_adc1.c: 171: if (NewState != DISABLE)
	tnz	(0x01, sp)
	jreq	00102$
;	lib/src/stm8s_adc1.c: 173: ADC1->CR3 |= ADC1_CR3_DBUF;
	or	a, #0x80
	ld	0x5403, a
	jra	00104$
00102$:
;	lib/src/stm8s_adc1.c: 177: ADC1->CR3 &= (uint8_t)(~ADC1_CR3_DBUF);
	and	a, #0x7f
	ld	0x5403, a
00104$:
;	lib/src/stm8s_adc1.c: 179: }
	pop	a
	ret
;	lib/src/stm8s_adc1.c: 190: void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
;	-----------------------------------------
;	 function ADC1_ITConfig
;	-----------------------------------------
_ADC1_ITConfig:
	sub	sp, #2
	ld	(0x02, sp), a
;	lib/src/stm8s_adc1.c: 199: ADC1->CSR |= (uint8_t)ADC1_IT;
	ld	a, 0x5400
	ld	(0x01, sp), a
;	lib/src/stm8s_adc1.c: 196: if (NewState != DISABLE)
	tnz	(0x02, sp)
	jreq	00102$
;	lib/src/stm8s_adc1.c: 199: ADC1->CSR |= (uint8_t)ADC1_IT;
	ld	a, xl
	or	a, (0x01, sp)
	ld	0x5400, a
	jra	00104$
00102$:
;	lib/src/stm8s_adc1.c: 204: ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT);
	cplw	x
	ld	a, xl
	and	a, (0x01, sp)
	ld	0x5400, a
00104$:
;	lib/src/stm8s_adc1.c: 206: }
	addw	sp, #2
	ret
;	lib/src/stm8s_adc1.c: 214: void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
;	-----------------------------------------
;	 function ADC1_PrescalerConfig
;	-----------------------------------------
_ADC1_PrescalerConfig:
	push	a
	ld	(0x01, sp), a
;	lib/src/stm8s_adc1.c: 220: ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
	ld	a, 0x5401
	and	a, #0x8f
	ld	0x5401, a
;	lib/src/stm8s_adc1.c: 222: ADC1->CR1 |= (uint8_t)(ADC1_Prescaler);
	ld	a, 0x5401
	or	a, (0x01, sp)
	ld	0x5401, a
;	lib/src/stm8s_adc1.c: 223: }
	pop	a
	ret
;	lib/src/stm8s_adc1.c: 233: void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
;	-----------------------------------------
;	 function ADC1_SchmittTriggerConfig
;	-----------------------------------------
_ADC1_SchmittTriggerConfig:
	push	a
;	lib/src/stm8s_adc1.c: 239: if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
	ld	xl, a
	inc	a
	jrne	00114$
;	lib/src/stm8s_adc1.c: 243: ADC1->TDRL &= (uint8_t)0x0;
	ld	a, 0x5407
;	lib/src/stm8s_adc1.c: 241: if (NewState != DISABLE)
	tnz	(0x04, sp)
	jreq	00102$
;	lib/src/stm8s_adc1.c: 243: ADC1->TDRL &= (uint8_t)0x0;
	mov	0x5407+0, #0x00
;	lib/src/stm8s_adc1.c: 244: ADC1->TDRH &= (uint8_t)0x0;
	ld	a, 0x5406
	mov	0x5406+0, #0x00
	jra	00116$
00102$:
;	lib/src/stm8s_adc1.c: 248: ADC1->TDRL |= (uint8_t)0xFF;
	mov	0x5407+0, #0xff
;	lib/src/stm8s_adc1.c: 249: ADC1->TDRH |= (uint8_t)0xFF;
	ld	a, 0x5406
	mov	0x5406+0, #0xff
	jra	00116$
00114$:
;	lib/src/stm8s_adc1.c: 252: else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
	ld	a, xl
	cp	a, #0x08
	jrnc	00111$
;	lib/src/stm8s_adc1.c: 243: ADC1->TDRL &= (uint8_t)0x0;
	ld	a, 0x5407
	ld	(0x01, sp), a
;	lib/src/stm8s_adc1.c: 256: ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
	ld	a, #0x01
	push	a
	ld	a, xl
	tnz	a
	jreq	00149$
00148$:
	sll	(1, sp)
	dec	a
	jrne	00148$
00149$:
	pop	a
;	lib/src/stm8s_adc1.c: 254: if (NewState != DISABLE)
	tnz	(0x04, sp)
	jreq	00105$
;	lib/src/stm8s_adc1.c: 256: ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
	cpl	a
	and	a, (0x01, sp)
	ld	0x5407, a
	jra	00116$
00105$:
;	lib/src/stm8s_adc1.c: 260: ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
	or	a, (0x01, sp)
	ld	0x5407, a
	jra	00116$
00111$:
;	lib/src/stm8s_adc1.c: 244: ADC1->TDRH &= (uint8_t)0x0;
	ld	a, 0x5406
	ld	(0x01, sp), a
;	lib/src/stm8s_adc1.c: 267: ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
	subw	x, #8
	ld	a, #0x01
	push	a
	ld	a, xl
	tnz	a
	jreq	00152$
00151$:
	sll	(1, sp)
	dec	a
	jrne	00151$
00152$:
	pop	a
;	lib/src/stm8s_adc1.c: 265: if (NewState != DISABLE)
	tnz	(0x04, sp)
	jreq	00108$
;	lib/src/stm8s_adc1.c: 267: ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
	cpl	a
	and	a, (0x01, sp)
	ld	0x5406, a
	jra	00116$
00108$:
;	lib/src/stm8s_adc1.c: 271: ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
	or	a, (0x01, sp)
	ld	0x5406, a
00116$:
;	lib/src/stm8s_adc1.c: 274: }
	pop	a
	popw	x
	pop	a
	jp	(x)
;	lib/src/stm8s_adc1.c: 286: void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
;	-----------------------------------------
;	 function ADC1_ConversionConfig
;	-----------------------------------------
_ADC1_ConversionConfig:
	push	a
	ld	(0x01, sp), a
;	lib/src/stm8s_adc1.c: 294: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
	bres	0x5402, #3
;	lib/src/stm8s_adc1.c: 296: ADC1->CR2 |= (uint8_t)(ADC1_Align);
	ld	a, 0x5402
	or	a, (0x05, sp)
	ld	0x5402, a
;	lib/src/stm8s_adc1.c: 301: ADC1->CR1 |= ADC1_CR1_CONT;
	ld	a, 0x5401
;	lib/src/stm8s_adc1.c: 298: if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
	tnz	(0x01, sp)
	jreq	00102$
;	lib/src/stm8s_adc1.c: 301: ADC1->CR1 |= ADC1_CR1_CONT;
	or	a, #0x02
	ld	0x5401, a
	jra	00103$
00102$:
;	lib/src/stm8s_adc1.c: 306: ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
	and	a, #0xfd
	ld	0x5401, a
00103$:
;	lib/src/stm8s_adc1.c: 310: ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
	ld	a, 0x5400
	and	a, #0xf0
	ld	0x5400, a
;	lib/src/stm8s_adc1.c: 312: ADC1->CSR |= (uint8_t)(ADC1_Channel);
	ld	a, 0x5400
	or	a, (0x04, sp)
	ld	0x5400, a
;	lib/src/stm8s_adc1.c: 313: }
	ldw	x, (2, sp)
	addw	sp, #5
	jp	(x)
;	lib/src/stm8s_adc1.c: 325: void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
;	-----------------------------------------
;	 function ADC1_ExternalTriggerConfig
;	-----------------------------------------
_ADC1_ExternalTriggerConfig:
	push	a
	ld	(0x01, sp), a
;	lib/src/stm8s_adc1.c: 332: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
	ld	a, 0x5402
	and	a, #0xcf
	ld	0x5402, a
	ld	a, 0x5402
;	lib/src/stm8s_adc1.c: 334: if (NewState != DISABLE)
	tnz	(0x04, sp)
	jreq	00102$
;	lib/src/stm8s_adc1.c: 337: ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
	or	a, #0x40
	ld	0x5402, a
	jra	00103$
00102$:
;	lib/src/stm8s_adc1.c: 342: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
	and	a, #0xbf
	ld	0x5402, a
00103$:
;	lib/src/stm8s_adc1.c: 346: ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
	ld	a, 0x5402
	or	a, (0x01, sp)
	ld	0x5402, a
;	lib/src/stm8s_adc1.c: 347: }
	pop	a
	popw	x
	pop	a
	jp	(x)
;	lib/src/stm8s_adc1.c: 358: void ADC1_StartConversion(void)
;	-----------------------------------------
;	 function ADC1_StartConversion
;	-----------------------------------------
_ADC1_StartConversion:
;	lib/src/stm8s_adc1.c: 360: ADC1->CR1 |= ADC1_CR1_ADON;
	bset	0x5401, #0
;	lib/src/stm8s_adc1.c: 361: }
	ret
;	lib/src/stm8s_adc1.c: 370: uint16_t ADC1_GetConversionValue(void)
;	-----------------------------------------
;	 function ADC1_GetConversionValue
;	-----------------------------------------
_ADC1_GetConversionValue:
	sub	sp, #6
;	lib/src/stm8s_adc1.c: 375: if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
	btjf	0x5402, #3, 00102$
;	lib/src/stm8s_adc1.c: 378: templ = ADC1->DRL;
	ld	a, 0x5405
	ld	xl, a
;	lib/src/stm8s_adc1.c: 380: temph = ADC1->DRH;
	ld	a, 0x5404
;	lib/src/stm8s_adc1.c: 382: temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
	clr	(0x02, sp)
	clr	(0x03, sp)
	or	a, (0x03, sp)
	rrwa	x
	or	a, (0x02, sp)
	ld	(0x06, sp), a
	jra	00103$
00102$:
;	lib/src/stm8s_adc1.c: 387: temph = ADC1->DRH;
	ld	a, 0x5404
	clrw	y
	ld	yl, a
;	lib/src/stm8s_adc1.c: 389: templ = ADC1->DRL;
	ld	a, 0x5405
;	lib/src/stm8s_adc1.c: 391: temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
	clrw	x
	ld	xl, a
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	ldw	(0x03, sp), x
	ld	a, (0x04, sp)
	ld	(0x06, sp), a
	ld	a, yl
	or	a, (0x03, sp)
	ld	xh, a
00103$:
;	lib/src/stm8s_adc1.c: 394: return ((uint16_t)temph);
	ld	a, (0x06, sp)
	ld	xl, a
;	lib/src/stm8s_adc1.c: 395: }
	addw	sp, #6
	ret
;	lib/src/stm8s_adc1.c: 405: void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
;	-----------------------------------------
;	 function ADC1_AWDChannelConfig
;	-----------------------------------------
_ADC1_AWDChannelConfig:
	push	a
;	lib/src/stm8s_adc1.c: 411: if (Channel < (uint8_t)8)
	ld	xl, a
	cp	a, #0x08
	jrnc	00108$
;	lib/src/stm8s_adc1.c: 415: ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
	ld	a, 0x540f
	ld	(0x01, sp), a
	ld	a, #0x01
	push	a
	ld	a, xl
	tnz	a
	jreq	00129$
00128$:
	sll	(1, sp)
	dec	a
	jrne	00128$
00129$:
	pop	a
;	lib/src/stm8s_adc1.c: 413: if (NewState != DISABLE)
	tnz	(0x04, sp)
	jreq	00102$
;	lib/src/stm8s_adc1.c: 415: ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
	or	a, (0x01, sp)
	ld	0x540f, a
	jra	00110$
00102$:
;	lib/src/stm8s_adc1.c: 419: ADC1->AWCRL &= (uint8_t)~(uint8_t)((uint8_t)1 << Channel);
	cpl	a
	and	a, (0x01, sp)
	ld	0x540f, a
	jra	00110$
00108$:
;	lib/src/stm8s_adc1.c: 426: ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
	ld	a, 0x540e
	ld	(0x01, sp), a
	subw	x, #8
	ld	a, #0x01
	push	a
	ld	a, xl
	tnz	a
	jreq	00132$
00131$:
	sll	(1, sp)
	dec	a
	jrne	00131$
00132$:
	pop	a
;	lib/src/stm8s_adc1.c: 424: if (NewState != DISABLE)
	tnz	(0x04, sp)
	jreq	00105$
;	lib/src/stm8s_adc1.c: 426: ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
	or	a, (0x01, sp)
	ld	0x540e, a
	jra	00110$
00105$:
;	lib/src/stm8s_adc1.c: 430: ADC1->AWCRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (uint8_t)(Channel - (uint8_t)8));
	cpl	a
	and	a, (0x01, sp)
	ld	0x540e, a
00110$:
;	lib/src/stm8s_adc1.c: 433: }
	pop	a
	popw	x
	pop	a
	jp	(x)
;	lib/src/stm8s_adc1.c: 441: void ADC1_SetHighThreshold(uint16_t Threshold)
;	-----------------------------------------
;	 function ADC1_SetHighThreshold
;	-----------------------------------------
_ADC1_SetHighThreshold:
;	lib/src/stm8s_adc1.c: 443: ADC1->HTRH = (uint8_t)(Threshold >> (uint8_t)2);
	ldw	y, x
	srlw	x
	srlw	x
	ld	a, xl
	ld	0x5408, a
;	lib/src/stm8s_adc1.c: 444: ADC1->HTRL = (uint8_t)Threshold;
	ld	a, yl
	ld	0x5409, a
;	lib/src/stm8s_adc1.c: 445: }
	ret
;	lib/src/stm8s_adc1.c: 453: void ADC1_SetLowThreshold(uint16_t Threshold)
;	-----------------------------------------
;	 function ADC1_SetLowThreshold
;	-----------------------------------------
_ADC1_SetLowThreshold:
;	lib/src/stm8s_adc1.c: 455: ADC1->LTRL = (uint8_t)Threshold;
	ld	a, xl
	ld	0x540b, a
;	lib/src/stm8s_adc1.c: 456: ADC1->LTRH = (uint8_t)(Threshold >> (uint8_t)2);
	srlw	x
	srlw	x
	ld	a, xl
	ld	0x540a, a
;	lib/src/stm8s_adc1.c: 457: }
	ret
;	lib/src/stm8s_adc1.c: 466: uint16_t ADC1_GetBufferValue(uint8_t Buffer)
;	-----------------------------------------
;	 function ADC1_GetBufferValue
;	-----------------------------------------
_ADC1_GetBufferValue:
	sub	sp, #6
	ld	xl, a
;	lib/src/stm8s_adc1.c: 474: if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
	ld	a, 0x5402
	ld	(0x03, sp), a
;	lib/src/stm8s_adc1.c: 477: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
	sllw	x
	clr	a
	ld	xh, a
	ldw	y, x
	addw	y, #0x53e1
;	lib/src/stm8s_adc1.c: 479: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
	addw	x, #0x53e0
;	lib/src/stm8s_adc1.c: 477: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
;	lib/src/stm8s_adc1.c: 479: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
;	lib/src/stm8s_adc1.c: 477: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
	ld	a, (y)
	ld	(0x06, sp), a
;	lib/src/stm8s_adc1.c: 479: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
	ld	a, (x)
	ld	(0x05, sp), a
	clr	(0x04, sp)
;	lib/src/stm8s_adc1.c: 474: if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
	ld	a, (0x03, sp)
	bcp	a, #0x08
	jreq	00102$
;	lib/src/stm8s_adc1.c: 477: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
;	lib/src/stm8s_adc1.c: 479: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
	ldw	y, (0x04, sp)
	ldw	(0x01, sp), y
;	lib/src/stm8s_adc1.c: 481: temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
	ld	a, (0x02, sp)
	ld	(0x03, sp), a
	clr	(0x04, sp)
	clr	(0x05, sp)
	ld	a, (0x06, sp)
	or	a, (0x04, sp)
	ld	(0x02, sp), a
	ld	a, (0x05, sp)
	or	a, (0x03, sp)
	ld	(0x01, sp), a
	jra	00103$
00102$:
;	lib/src/stm8s_adc1.c: 486: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
	ldw	y, (0x04, sp)
;	lib/src/stm8s_adc1.c: 488: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
	ld	a, (0x06, sp)
;	lib/src/stm8s_adc1.c: 490: temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)(temph << 8));
	clrw	x
	ld	xl, a
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	ldw	(0x03, sp), x
	ld	a, yl
	clr	(0x06, sp)
	or	a, (0x03, sp)
	ld	(0x01, sp), a
	ld	a, (0x04, sp)
	or	a, (0x06, sp)
	ld	(0x02, sp), a
00103$:
;	lib/src/stm8s_adc1.c: 493: return ((uint16_t)temph);
	ldw	x, (0x01, sp)
;	lib/src/stm8s_adc1.c: 494: }
	addw	sp, #6
	ret
;	lib/src/stm8s_adc1.c: 502: FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
;	-----------------------------------------
;	 function ADC1_GetAWDChannelStatus
;	-----------------------------------------
_ADC1_GetAWDChannelStatus:
	push	a
;	lib/src/stm8s_adc1.c: 509: if (Channel < (uint8_t)8)
	ld	xl, a
	cp	a, #0x08
	jrnc	00102$
;	lib/src/stm8s_adc1.c: 511: status = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << Channel));
	ld	a, 0x540d
	push	a
	ld	a, #0x01
	ld	(0x02, sp), a
	ld	a, xl
	tnz	a
	jreq	00113$
00112$:
	sll	(0x02, sp)
	dec	a
	jrne	00112$
00113$:
	pop	a
	and	a, (0x01, sp)
	jra	00103$
00102$:
;	lib/src/stm8s_adc1.c: 515: status = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8)));
	ld	a, 0x540c
	ld	(0x01, sp), a
	subw	x, #8
	ld	a, #0x01
	push	a
	ld	a, xl
	tnz	a
	jreq	00115$
00114$:
	sll	(1, sp)
	dec	a
	jrne	00114$
00115$:
	pop	a
	and	a, (0x01, sp)
00103$:
;	lib/src/stm8s_adc1.c: 518: return ((FlagStatus)status);
	neg	a
	clr	a
	rlc	a
;	lib/src/stm8s_adc1.c: 519: }
	addw	sp, #1
	ret
;	lib/src/stm8s_adc1.c: 527: FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
;	-----------------------------------------
;	 function ADC1_GetFlagStatus
;	-----------------------------------------
_ADC1_GetFlagStatus:
	sub	sp, #3
;	lib/src/stm8s_adc1.c: 535: if ((Flag & 0x0F) == 0x01)
	ld	(0x03, sp), a
	ld	(0x02, sp), a
	clr	(0x01, sp)
	clrw	x
	ld	a, (0x02, sp)
	and	a, #0x0f
	ld	xl, a
	decw	x
	jrne	00108$
;	lib/src/stm8s_adc1.c: 538: flagstatus = (uint8_t)(ADC1->CR3 & ADC1_CR3_OVR);
	ld	a, 0x5403
	and	a, #0x40
	jra	00109$
00108$:
;	lib/src/stm8s_adc1.c: 540: else if ((Flag & 0xF0) == 0x10)
	clrw	x
	ld	a, (0x02, sp)
	and	a, #0xf0
	ld	xl, a
	cpw	x, #0x0010
	jrne	00105$
;	lib/src/stm8s_adc1.c: 543: temp = (uint8_t)(Flag & (uint8_t)0x0F);
	ld	a, (0x03, sp)
	and	a, #0x0f
;	lib/src/stm8s_adc1.c: 544: if (temp < 8)
	ld	xl, a
	cp	a, #0x08
	jrnc	00102$
;	lib/src/stm8s_adc1.c: 546: flagstatus = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
	ld	a, 0x540d
	ld	(0x02, sp), a
	ld	a, #0x01
	push	a
	ld	a, xl
	tnz	a
	jreq	00135$
00134$:
	sll	(1, sp)
	dec	a
	jrne	00134$
00135$:
	pop	a
	and	a, (0x02, sp)
	jra	00109$
00102$:
;	lib/src/stm8s_adc1.c: 550: flagstatus = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
	ld	a, 0x540c
	ld	(0x02, sp), a
	subw	x, #8
	ld	a, #0x01
	push	a
	ld	a, xl
	tnz	a
	jreq	00137$
00136$:
	sll	(1, sp)
	dec	a
	jrne	00136$
00137$:
	pop	a
	and	a, (0x02, sp)
	jra	00109$
00105$:
;	lib/src/stm8s_adc1.c: 555: flagstatus = (uint8_t)(ADC1->CSR & Flag);
	ld	a, 0x5400
	and	a, (0x03, sp)
00109$:
;	lib/src/stm8s_adc1.c: 557: return ((FlagStatus)flagstatus);
	neg	a
	clr	a
	rlc	a
;	lib/src/stm8s_adc1.c: 559: }
	addw	sp, #3
	ret
;	lib/src/stm8s_adc1.c: 567: void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
;	-----------------------------------------
;	 function ADC1_ClearFlag
;	-----------------------------------------
_ADC1_ClearFlag:
	sub	sp, #3
;	lib/src/stm8s_adc1.c: 574: if ((Flag & 0x0F) == 0x01)
	ld	(0x03, sp), a
	clr	(0x01, sp)
	push	a
	and	a, #0x0f
	ld	xl, a
	clr	a
	ld	xh, a
	pop	a
	decw	x
	jrne	00108$
;	lib/src/stm8s_adc1.c: 577: ADC1->CR3 &= (uint8_t)(~ADC1_CR3_OVR);
	bres	0x5403, #6
	jra	00110$
00108$:
;	lib/src/stm8s_adc1.c: 579: else if ((Flag & 0xF0) == 0x10)
	and	a, #0xf0
	ld	xl, a
	clr	a
	ld	xh, a
	cpw	x, #0x0010
	jrne	00105$
;	lib/src/stm8s_adc1.c: 582: temp = (uint8_t)(Flag & (uint8_t)0x0F);
	ld	a, (0x03, sp)
	and	a, #0x0f
;	lib/src/stm8s_adc1.c: 583: if (temp < 8)
	ld	xl, a
	cp	a, #0x08
	jrnc	00102$
;	lib/src/stm8s_adc1.c: 585: ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
	ld	a, 0x540d
	ld	(0x02, sp), a
	ld	a, #0x01
	push	a
	ld	a, xl
	tnz	a
	jreq	00135$
00134$:
	sll	(1, sp)
	dec	a
	jrne	00134$
00135$:
	pop	a
	cpl	a
	and	a, (0x02, sp)
	ld	0x540d, a
	jra	00110$
00102$:
;	lib/src/stm8s_adc1.c: 589: ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
	ld	a, 0x540c
	ld	(0x02, sp), a
	subw	x, #8
	ld	a, #0x01
	push	a
	ld	a, xl
	tnz	a
	jreq	00137$
00136$:
	sll	(1, sp)
	dec	a
	jrne	00136$
00137$:
	pop	a
	cpl	a
	and	a, (0x02, sp)
	ld	0x540c, a
	jra	00110$
00105$:
;	lib/src/stm8s_adc1.c: 594: ADC1->CSR &= (uint8_t) (~Flag);
	ld	a, 0x5400
	ld	(0x02, sp), a
	ld	a, (0x03, sp)
	cpl	a
	and	a, (0x02, sp)
	ld	0x5400, a
00110$:
;	lib/src/stm8s_adc1.c: 596: }
	addw	sp, #3
	ret
;	lib/src/stm8s_adc1.c: 616: ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
;	-----------------------------------------
;	 function ADC1_GetITStatus
;	-----------------------------------------
_ADC1_GetITStatus:
	push	a
;	lib/src/stm8s_adc1.c: 624: if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
	clrw	y
	ld	a, xl
	and	a, #0xf0
	ld	yl, a
	cpw	y, #0x0010
	jrne	00105$
;	lib/src/stm8s_adc1.c: 627: temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
	ld	a, xl
	and	a, #0x0f
;	lib/src/stm8s_adc1.c: 628: if (temp < 8)
	ld	xl, a
	cp	a, #0x08
	jrnc	00102$
;	lib/src/stm8s_adc1.c: 630: itstatus = (ITStatus)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
	ld	a, 0x540d
	push	a
	ld	a, #0x01
	ld	(0x02, sp), a
	ld	a, xl
	tnz	a
	jreq	00124$
00123$:
	sll	(0x02, sp)
	dec	a
	jrne	00123$
00124$:
	pop	a
	and	a, (0x01, sp)
	neg	a
	clr	a
	rlc	a
	jra	00106$
00102$:
;	lib/src/stm8s_adc1.c: 634: itstatus = (ITStatus)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
	ld	a, 0x540c
	ld	(0x01, sp), a
	subw	x, #8
	ld	a, #0x01
	push	a
	ld	a, xl
	tnz	a
	jreq	00126$
00125$:
	sll	(1, sp)
	dec	a
	jrne	00125$
00126$:
	pop	a
	and	a, (0x01, sp)
	neg	a
	clr	a
	rlc	a
	jra	00106$
00105$:
;	lib/src/stm8s_adc1.c: 639: itstatus = (ITStatus)(ADC1->CSR & (uint8_t)ITPendingBit);
	ld	a, 0x5400
	pushw	x
	and	a, (2, sp)
	popw	x
	neg	a
	clr	a
	rlc	a
00106$:
;	lib/src/stm8s_adc1.c: 641: return ((ITStatus)itstatus);
;	lib/src/stm8s_adc1.c: 642: }
	addw	sp, #1
	ret
;	lib/src/stm8s_adc1.c: 662: void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
;	-----------------------------------------
;	 function ADC1_ClearITPendingBit
;	-----------------------------------------
_ADC1_ClearITPendingBit:
	push	a
;	lib/src/stm8s_adc1.c: 669: if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
	clrw	y
	ld	a, xl
	and	a, #0xf0
	ld	yl, a
	cpw	y, #0x0010
	jrne	00105$
;	lib/src/stm8s_adc1.c: 672: temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
	ld	a, xl
	and	a, #0x0f
;	lib/src/stm8s_adc1.c: 673: if (temp < 8)
	ld	xl, a
	cp	a, #0x08
	jrnc	00102$
;	lib/src/stm8s_adc1.c: 675: ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
	ld	a, 0x540d
	ld	(0x01, sp), a
	ld	a, #0x01
	push	a
	ld	a, xl
	tnz	a
	jreq	00124$
00123$:
	sll	(1, sp)
	dec	a
	jrne	00123$
00124$:
	pop	a
	cpl	a
	and	a, (0x01, sp)
	ld	0x540d, a
	jra	00107$
00102$:
;	lib/src/stm8s_adc1.c: 679: ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
	ld	a, 0x540c
	ld	(0x01, sp), a
	subw	x, #8
	ld	a, #0x01
	push	a
	ld	a, xl
	tnz	a
	jreq	00126$
00125$:
	sll	(1, sp)
	dec	a
	jrne	00125$
00126$:
	pop	a
	cpl	a
	and	a, (0x01, sp)
	ld	0x540c, a
	jra	00107$
00105$:
;	lib/src/stm8s_adc1.c: 684: ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
	ld	a, 0x5400
	ld	(0x01, sp), a
	cplw	x
	ld	a, xl
	and	a, (0x01, sp)
	ld	0x5400, a
00107$:
;	lib/src/stm8s_adc1.c: 686: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
