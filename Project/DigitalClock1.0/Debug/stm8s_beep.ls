   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  44                     ; 54 void BEEP_DeInit(void)
  44                     ; 55 {
  46                     	switch	.text
  47  0000               _BEEP_DeInit:
  51                     ; 56   BEEP->CSR = BEEP_CSR_RESET_VALUE;
  53  0000 351f50f3      	mov	20723,#31
  54                     ; 57 }
  57  0004 81            	ret
 122                     ; 67 void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
 122                     ; 68 {
 123                     	switch	.text
 124  0005               _BEEP_Init:
 126  0005 88            	push	a
 127       00000000      OFST:	set	0
 130                     ; 70   assert_param(IS_BEEP_FREQUENCY_OK(BEEP_Frequency));
 132                     ; 73   if ((BEEP->CSR & BEEP_CSR_BEEPDIV) == BEEP_CSR_BEEPDIV)
 134  0006 c650f3        	ld	a,20723
 135  0009 a41f          	and	a,#31
 136  000b a11f          	cp	a,#31
 137  000d 2610          	jrne	L15
 138                     ; 75     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 140  000f c650f3        	ld	a,20723
 141  0012 a4e0          	and	a,#224
 142  0014 c750f3        	ld	20723,a
 143                     ; 76     BEEP->CSR |= BEEP_CALIBRATION_DEFAULT;
 145  0017 c650f3        	ld	a,20723
 146  001a aa0b          	or	a,#11
 147  001c c750f3        	ld	20723,a
 148  001f               L15:
 149                     ; 80   BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPSEL);
 151  001f c650f3        	ld	a,20723
 152  0022 a43f          	and	a,#63
 153  0024 c750f3        	ld	20723,a
 154                     ; 81   BEEP->CSR |= (uint8_t)(BEEP_Frequency);
 156  0027 c650f3        	ld	a,20723
 157  002a 1a01          	or	a,(OFST+1,sp)
 158  002c c750f3        	ld	20723,a
 159                     ; 82 }
 162  002f 84            	pop	a
 163  0030 81            	ret
 218                     ; 91 void BEEP_Cmd(FunctionalState NewState)
 218                     ; 92 {
 219                     	switch	.text
 220  0031               _BEEP_Cmd:
 224                     ; 93   if (NewState != DISABLE)
 226  0031 4d            	tnz	a
 227  0032 2706          	jreq	L101
 228                     ; 96     BEEP->CSR |= BEEP_CSR_BEEPEN;
 230  0034 721a50f3      	bset	20723,#5
 232  0038 2004          	jra	L301
 233  003a               L101:
 234                     ; 101     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPEN);
 236  003a 721b50f3      	bres	20723,#5
 237  003e               L301:
 238                     ; 103 }
 241  003e 81            	ret
 294                     .const:	section	.text
 295  0000               L41:
 296  0000 000003e8      	dc.l	1000
 297                     ; 118 void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
 297                     ; 119 {
 298                     	switch	.text
 299  003f               _BEEP_LSICalibrationConfig:
 301  003f 5206          	subw	sp,#6
 302       00000006      OFST:	set	6
 305                     ; 124   assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
 307                     ; 126   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 309  0041 96            	ldw	x,sp
 310  0042 1c0009        	addw	x,#OFST+3
 311  0045 cd0000        	call	c_ltor
 313  0048 ae0000        	ldw	x,#L41
 314  004b cd0000        	call	c_ludv
 316  004e be02          	ldw	x,c_lreg+2
 317  0050 1f03          	ldw	(OFST-3,sp),x
 318                     ; 130   BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 320  0052 c650f3        	ld	a,20723
 321  0055 a4e0          	and	a,#224
 322  0057 c750f3        	ld	20723,a
 323                     ; 132   A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
 325  005a 1e03          	ldw	x,(OFST-3,sp)
 326  005c 54            	srlw	x
 327  005d 54            	srlw	x
 328  005e 54            	srlw	x
 329  005f 1f05          	ldw	(OFST-1,sp),x
 330                     ; 134   if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
 332  0061 1e05          	ldw	x,(OFST-1,sp)
 333  0063 58            	sllw	x
 334  0064 58            	sllw	x
 335  0065 58            	sllw	x
 336  0066 1f01          	ldw	(OFST-5,sp),x
 337  0068 1e03          	ldw	x,(OFST-3,sp)
 338  006a 72f001        	subw	x,(OFST-5,sp)
 339  006d 1605          	ldw	y,(OFST-1,sp)
 340  006f 9058          	sllw	y
 341  0071 905c          	incw	y
 342  0073 cd0000        	call	c_imul
 344  0076 1605          	ldw	y,(OFST-1,sp)
 345  0078 9058          	sllw	y
 346  007a 9058          	sllw	y
 347  007c 9058          	sllw	y
 348  007e bf00          	ldw	c_x,x
 349  0080 90b300        	cpw	y,c_x
 350  0083 250c          	jrult	L331
 351                     ; 136     BEEP->CSR |= (uint8_t)(A - 2U);
 353  0085 7b06          	ld	a,(OFST+0,sp)
 354  0087 a002          	sub	a,#2
 355  0089 ca50f3        	or	a,20723
 356  008c c750f3        	ld	20723,a
 358  008f 2009          	jra	L531
 359  0091               L331:
 360                     ; 140     BEEP->CSR |= (uint8_t)(A - 1U);
 362  0091 7b06          	ld	a,(OFST+0,sp)
 363  0093 4a            	dec	a
 364  0094 ca50f3        	or	a,20723
 365  0097 c750f3        	ld	20723,a
 366  009a               L531:
 367                     ; 142 }
 370  009a 5b06          	addw	sp,#6
 371  009c 81            	ret
 384                     	xdef	_BEEP_LSICalibrationConfig
 385                     	xdef	_BEEP_Cmd
 386                     	xdef	_BEEP_Init
 387                     	xdef	_BEEP_DeInit
 388                     	xref.b	c_lreg
 389                     	xref.b	c_x
 408                     	xref	c_imul
 409                     	xref	c_ludv
 410                     	xref	c_ltor
 411                     	end
