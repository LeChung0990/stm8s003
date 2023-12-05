                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.3.0 #14184 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_adc1
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _ADC1_DeInit
                                     12 	.globl _ADC1_Init
                                     13 	.globl _ADC1_Cmd
                                     14 	.globl _ADC1_ScanModeCmd
                                     15 	.globl _ADC1_DataBufferCmd
                                     16 	.globl _ADC1_ITConfig
                                     17 	.globl _ADC1_PrescalerConfig
                                     18 	.globl _ADC1_SchmittTriggerConfig
                                     19 	.globl _ADC1_ConversionConfig
                                     20 	.globl _ADC1_ExternalTriggerConfig
                                     21 	.globl _ADC1_StartConversion
                                     22 	.globl _ADC1_GetConversionValue
                                     23 	.globl _ADC1_AWDChannelConfig
                                     24 	.globl _ADC1_SetHighThreshold
                                     25 	.globl _ADC1_SetLowThreshold
                                     26 	.globl _ADC1_GetBufferValue
                                     27 	.globl _ADC1_GetAWDChannelStatus
                                     28 	.globl _ADC1_GetFlagStatus
                                     29 	.globl _ADC1_ClearFlag
                                     30 	.globl _ADC1_GetITStatus
                                     31 	.globl _ADC1_ClearITPendingBit
                                     32 ;--------------------------------------------------------
                                     33 ; ram data
                                     34 ;--------------------------------------------------------
                                     35 	.area DATA
                                     36 ;--------------------------------------------------------
                                     37 ; ram data
                                     38 ;--------------------------------------------------------
                                     39 	.area INITIALIZED
                                     40 ;--------------------------------------------------------
                                     41 ; absolute external ram data
                                     42 ;--------------------------------------------------------
                                     43 	.area DABS (ABS)
                                     44 
                                     45 ; default segment ordering for linker
                                     46 	.area HOME
                                     47 	.area GSINIT
                                     48 	.area GSFINAL
                                     49 	.area CONST
                                     50 	.area INITIALIZER
                                     51 	.area CODE
                                     52 
                                     53 ;--------------------------------------------------------
                                     54 ; global & static initialisations
                                     55 ;--------------------------------------------------------
                                     56 	.area HOME
                                     57 	.area GSINIT
                                     58 	.area GSFINAL
                                     59 	.area GSINIT
                                     60 ;--------------------------------------------------------
                                     61 ; Home
                                     62 ;--------------------------------------------------------
                                     63 	.area HOME
                                     64 	.area HOME
                                     65 ;--------------------------------------------------------
                                     66 ; code
                                     67 ;--------------------------------------------------------
                                     68 	.area CODE
                                     69 ;	lib/src/stm8s_adc1.c: 52: void ADC1_DeInit(void)
                                     70 ;	-----------------------------------------
                                     71 ;	 function ADC1_DeInit
                                     72 ;	-----------------------------------------
      008661                         73 _ADC1_DeInit:
                                     74 ;	lib/src/stm8s_adc1.c: 54: ADC1->CSR  = ADC1_CSR_RESET_VALUE;
      008661 35 00 54 00      [ 1]   75 	mov	0x5400+0, #0x00
                                     76 ;	lib/src/stm8s_adc1.c: 55: ADC1->CR1  = ADC1_CR1_RESET_VALUE;
      008665 35 00 54 01      [ 1]   77 	mov	0x5401+0, #0x00
                                     78 ;	lib/src/stm8s_adc1.c: 56: ADC1->CR2  = ADC1_CR2_RESET_VALUE;
      008669 35 00 54 02      [ 1]   79 	mov	0x5402+0, #0x00
                                     80 ;	lib/src/stm8s_adc1.c: 57: ADC1->CR3  = ADC1_CR3_RESET_VALUE;
      00866D 35 00 54 03      [ 1]   81 	mov	0x5403+0, #0x00
                                     82 ;	lib/src/stm8s_adc1.c: 58: ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
      008671 35 00 54 06      [ 1]   83 	mov	0x5406+0, #0x00
                                     84 ;	lib/src/stm8s_adc1.c: 59: ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
      008675 35 00 54 07      [ 1]   85 	mov	0x5407+0, #0x00
                                     86 ;	lib/src/stm8s_adc1.c: 60: ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
      008679 35 FF 54 08      [ 1]   87 	mov	0x5408+0, #0xff
                                     88 ;	lib/src/stm8s_adc1.c: 61: ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
      00867D 35 03 54 09      [ 1]   89 	mov	0x5409+0, #0x03
                                     90 ;	lib/src/stm8s_adc1.c: 62: ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
      008681 35 00 54 0A      [ 1]   91 	mov	0x540a+0, #0x00
                                     92 ;	lib/src/stm8s_adc1.c: 63: ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
      008685 35 00 54 0B      [ 1]   93 	mov	0x540b+0, #0x00
                                     94 ;	lib/src/stm8s_adc1.c: 64: ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
      008689 35 00 54 0E      [ 1]   95 	mov	0x540e+0, #0x00
                                     96 ;	lib/src/stm8s_adc1.c: 65: ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
      00868D 35 00 54 0F      [ 1]   97 	mov	0x540f+0, #0x00
                                     98 ;	lib/src/stm8s_adc1.c: 66: }
      008691 81               [ 4]   99 	ret
                                    100 ;	lib/src/stm8s_adc1.c: 88: void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
                                    101 ;	-----------------------------------------
                                    102 ;	 function ADC1_Init
                                    103 ;	-----------------------------------------
      008692                        104 _ADC1_Init:
      008692 97               [ 1]  105 	ld	xl, a
                                    106 ;	lib/src/stm8s_adc1.c: 103: ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
      008693 7B 07            [ 1]  107 	ld	a, (0x07, sp)
      008695 88               [ 1]  108 	push	a
      008696 7B 04            [ 1]  109 	ld	a, (0x04, sp)
      008698 88               [ 1]  110 	push	a
      008699 9F               [ 1]  111 	ld	a, xl
      00869A CD 87 B5         [ 4]  112 	call	_ADC1_ConversionConfig
                                    113 ;	lib/src/stm8s_adc1.c: 105: ADC1_PrescalerConfig(ADC1_PrescalerSelection);
      00869D 7B 04            [ 1]  114 	ld	a, (0x04, sp)
      00869F CD 87 26         [ 4]  115 	call	_ADC1_PrescalerConfig
                                    116 ;	lib/src/stm8s_adc1.c: 110: ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
      0086A2 7B 06            [ 1]  117 	ld	a, (0x06, sp)
      0086A4 88               [ 1]  118 	push	a
      0086A5 7B 06            [ 1]  119 	ld	a, (0x06, sp)
      0086A7 CD 87 EC         [ 4]  120 	call	_ADC1_ExternalTriggerConfig
                                    121 ;	lib/src/stm8s_adc1.c: 115: ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
      0086AA 7B 09            [ 1]  122 	ld	a, (0x09, sp)
      0086AC 88               [ 1]  123 	push	a
      0086AD 7B 09            [ 1]  124 	ld	a, (0x09, sp)
      0086AF CD 87 3B         [ 4]  125 	call	_ADC1_SchmittTriggerConfig
                                    126 ;	lib/src/stm8s_adc1.c: 118: ADC1->CR1 |= ADC1_CR1_ADON;
      0086B2 C6 54 01         [ 1]  127 	ld	a, 0x5401
      0086B5 AA 01            [ 1]  128 	or	a, #0x01
      0086B7 C7 54 01         [ 1]  129 	ld	0x5401, a
                                    130 ;	lib/src/stm8s_adc1.c: 119: }
      0086BA 1E 01            [ 2]  131 	ldw	x, (1, sp)
      0086BC 5B 09            [ 2]  132 	addw	sp, #9
      0086BE FC               [ 2]  133 	jp	(x)
                                    134 ;	lib/src/stm8s_adc1.c: 126: void ADC1_Cmd(FunctionalState NewState)
                                    135 ;	-----------------------------------------
                                    136 ;	 function ADC1_Cmd
                                    137 ;	-----------------------------------------
      0086BF                        138 _ADC1_Cmd:
      0086BF 88               [ 1]  139 	push	a
      0086C0 6B 01            [ 1]  140 	ld	(0x01, sp), a
                                    141 ;	lib/src/stm8s_adc1.c: 133: ADC1->CR1 |= ADC1_CR1_ADON;
      0086C2 C6 54 01         [ 1]  142 	ld	a, 0x5401
                                    143 ;	lib/src/stm8s_adc1.c: 131: if (NewState != DISABLE)
      0086C5 0D 01            [ 1]  144 	tnz	(0x01, sp)
      0086C7 27 07            [ 1]  145 	jreq	00102$
                                    146 ;	lib/src/stm8s_adc1.c: 133: ADC1->CR1 |= ADC1_CR1_ADON;
      0086C9 AA 01            [ 1]  147 	or	a, #0x01
      0086CB C7 54 01         [ 1]  148 	ld	0x5401, a
      0086CE 20 05            [ 2]  149 	jra	00104$
      0086D0                        150 00102$:
                                    151 ;	lib/src/stm8s_adc1.c: 137: ADC1->CR1 &= (uint8_t)(~ADC1_CR1_ADON);
      0086D0 A4 FE            [ 1]  152 	and	a, #0xfe
      0086D2 C7 54 01         [ 1]  153 	ld	0x5401, a
      0086D5                        154 00104$:
                                    155 ;	lib/src/stm8s_adc1.c: 139: }
      0086D5 84               [ 1]  156 	pop	a
      0086D6 81               [ 4]  157 	ret
                                    158 ;	lib/src/stm8s_adc1.c: 146: void ADC1_ScanModeCmd(FunctionalState NewState)
                                    159 ;	-----------------------------------------
                                    160 ;	 function ADC1_ScanModeCmd
                                    161 ;	-----------------------------------------
      0086D7                        162 _ADC1_ScanModeCmd:
      0086D7 88               [ 1]  163 	push	a
      0086D8 6B 01            [ 1]  164 	ld	(0x01, sp), a
                                    165 ;	lib/src/stm8s_adc1.c: 153: ADC1->CR2 |= ADC1_CR2_SCAN;
      0086DA C6 54 02         [ 1]  166 	ld	a, 0x5402
                                    167 ;	lib/src/stm8s_adc1.c: 151: if (NewState != DISABLE)
      0086DD 0D 01            [ 1]  168 	tnz	(0x01, sp)
      0086DF 27 07            [ 1]  169 	jreq	00102$
                                    170 ;	lib/src/stm8s_adc1.c: 153: ADC1->CR2 |= ADC1_CR2_SCAN;
      0086E1 AA 02            [ 1]  171 	or	a, #0x02
      0086E3 C7 54 02         [ 1]  172 	ld	0x5402, a
      0086E6 20 05            [ 2]  173 	jra	00104$
      0086E8                        174 00102$:
                                    175 ;	lib/src/stm8s_adc1.c: 157: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_SCAN);
      0086E8 A4 FD            [ 1]  176 	and	a, #0xfd
      0086EA C7 54 02         [ 1]  177 	ld	0x5402, a
      0086ED                        178 00104$:
                                    179 ;	lib/src/stm8s_adc1.c: 159: }
      0086ED 84               [ 1]  180 	pop	a
      0086EE 81               [ 4]  181 	ret
                                    182 ;	lib/src/stm8s_adc1.c: 166: void ADC1_DataBufferCmd(FunctionalState NewState)
                                    183 ;	-----------------------------------------
                                    184 ;	 function ADC1_DataBufferCmd
                                    185 ;	-----------------------------------------
      0086EF                        186 _ADC1_DataBufferCmd:
      0086EF 88               [ 1]  187 	push	a
      0086F0 6B 01            [ 1]  188 	ld	(0x01, sp), a
                                    189 ;	lib/src/stm8s_adc1.c: 173: ADC1->CR3 |= ADC1_CR3_DBUF;
      0086F2 C6 54 03         [ 1]  190 	ld	a, 0x5403
                                    191 ;	lib/src/stm8s_adc1.c: 171: if (NewState != DISABLE)
      0086F5 0D 01            [ 1]  192 	tnz	(0x01, sp)
      0086F7 27 07            [ 1]  193 	jreq	00102$
                                    194 ;	lib/src/stm8s_adc1.c: 173: ADC1->CR3 |= ADC1_CR3_DBUF;
      0086F9 AA 80            [ 1]  195 	or	a, #0x80
      0086FB C7 54 03         [ 1]  196 	ld	0x5403, a
      0086FE 20 05            [ 2]  197 	jra	00104$
      008700                        198 00102$:
                                    199 ;	lib/src/stm8s_adc1.c: 177: ADC1->CR3 &= (uint8_t)(~ADC1_CR3_DBUF);
      008700 A4 7F            [ 1]  200 	and	a, #0x7f
      008702 C7 54 03         [ 1]  201 	ld	0x5403, a
      008705                        202 00104$:
                                    203 ;	lib/src/stm8s_adc1.c: 179: }
      008705 84               [ 1]  204 	pop	a
      008706 81               [ 4]  205 	ret
                                    206 ;	lib/src/stm8s_adc1.c: 190: void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
                                    207 ;	-----------------------------------------
                                    208 ;	 function ADC1_ITConfig
                                    209 ;	-----------------------------------------
      008707                        210 _ADC1_ITConfig:
      008707 52 02            [ 2]  211 	sub	sp, #2
      008709 6B 02            [ 1]  212 	ld	(0x02, sp), a
                                    213 ;	lib/src/stm8s_adc1.c: 199: ADC1->CSR |= (uint8_t)ADC1_IT;
      00870B C6 54 00         [ 1]  214 	ld	a, 0x5400
      00870E 6B 01            [ 1]  215 	ld	(0x01, sp), a
                                    216 ;	lib/src/stm8s_adc1.c: 196: if (NewState != DISABLE)
      008710 0D 02            [ 1]  217 	tnz	(0x02, sp)
      008712 27 08            [ 1]  218 	jreq	00102$
                                    219 ;	lib/src/stm8s_adc1.c: 199: ADC1->CSR |= (uint8_t)ADC1_IT;
      008714 9F               [ 1]  220 	ld	a, xl
      008715 1A 01            [ 1]  221 	or	a, (0x01, sp)
      008717 C7 54 00         [ 1]  222 	ld	0x5400, a
      00871A 20 07            [ 2]  223 	jra	00104$
      00871C                        224 00102$:
                                    225 ;	lib/src/stm8s_adc1.c: 204: ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT);
      00871C 53               [ 2]  226 	cplw	x
      00871D 9F               [ 1]  227 	ld	a, xl
      00871E 14 01            [ 1]  228 	and	a, (0x01, sp)
      008720 C7 54 00         [ 1]  229 	ld	0x5400, a
      008723                        230 00104$:
                                    231 ;	lib/src/stm8s_adc1.c: 206: }
      008723 5B 02            [ 2]  232 	addw	sp, #2
      008725 81               [ 4]  233 	ret
                                    234 ;	lib/src/stm8s_adc1.c: 214: void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
                                    235 ;	-----------------------------------------
                                    236 ;	 function ADC1_PrescalerConfig
                                    237 ;	-----------------------------------------
      008726                        238 _ADC1_PrescalerConfig:
      008726 88               [ 1]  239 	push	a
      008727 6B 01            [ 1]  240 	ld	(0x01, sp), a
                                    241 ;	lib/src/stm8s_adc1.c: 220: ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
      008729 C6 54 01         [ 1]  242 	ld	a, 0x5401
      00872C A4 8F            [ 1]  243 	and	a, #0x8f
      00872E C7 54 01         [ 1]  244 	ld	0x5401, a
                                    245 ;	lib/src/stm8s_adc1.c: 222: ADC1->CR1 |= (uint8_t)(ADC1_Prescaler);
      008731 C6 54 01         [ 1]  246 	ld	a, 0x5401
      008734 1A 01            [ 1]  247 	or	a, (0x01, sp)
      008736 C7 54 01         [ 1]  248 	ld	0x5401, a
                                    249 ;	lib/src/stm8s_adc1.c: 223: }
      008739 84               [ 1]  250 	pop	a
      00873A 81               [ 4]  251 	ret
                                    252 ;	lib/src/stm8s_adc1.c: 233: void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
                                    253 ;	-----------------------------------------
                                    254 ;	 function ADC1_SchmittTriggerConfig
                                    255 ;	-----------------------------------------
      00873B                        256 _ADC1_SchmittTriggerConfig:
      00873B 88               [ 1]  257 	push	a
                                    258 ;	lib/src/stm8s_adc1.c: 239: if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
      00873C 97               [ 1]  259 	ld	xl, a
      00873D 4C               [ 1]  260 	inc	a
      00873E 26 21            [ 1]  261 	jrne	00114$
                                    262 ;	lib/src/stm8s_adc1.c: 243: ADC1->TDRL &= (uint8_t)0x0;
      008740 C6 54 07         [ 1]  263 	ld	a, 0x5407
                                    264 ;	lib/src/stm8s_adc1.c: 241: if (NewState != DISABLE)
      008743 0D 04            [ 1]  265 	tnz	(0x04, sp)
      008745 27 0D            [ 1]  266 	jreq	00102$
                                    267 ;	lib/src/stm8s_adc1.c: 243: ADC1->TDRL &= (uint8_t)0x0;
      008747 35 00 54 07      [ 1]  268 	mov	0x5407+0, #0x00
                                    269 ;	lib/src/stm8s_adc1.c: 244: ADC1->TDRH &= (uint8_t)0x0;
      00874B C6 54 06         [ 1]  270 	ld	a, 0x5406
      00874E 35 00 54 06      [ 1]  271 	mov	0x5406+0, #0x00
      008752 20 5D            [ 2]  272 	jra	00116$
      008754                        273 00102$:
                                    274 ;	lib/src/stm8s_adc1.c: 248: ADC1->TDRL |= (uint8_t)0xFF;
      008754 35 FF 54 07      [ 1]  275 	mov	0x5407+0, #0xff
                                    276 ;	lib/src/stm8s_adc1.c: 249: ADC1->TDRH |= (uint8_t)0xFF;
      008758 C6 54 06         [ 1]  277 	ld	a, 0x5406
      00875B 35 FF 54 06      [ 1]  278 	mov	0x5406+0, #0xff
      00875F 20 50            [ 2]  279 	jra	00116$
      008761                        280 00114$:
                                    281 ;	lib/src/stm8s_adc1.c: 252: else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
      008761 9F               [ 1]  282 	ld	a, xl
      008762 A1 08            [ 1]  283 	cp	a, #0x08
      008764 24 25            [ 1]  284 	jrnc	00111$
                                    285 ;	lib/src/stm8s_adc1.c: 243: ADC1->TDRL &= (uint8_t)0x0;
      008766 C6 54 07         [ 1]  286 	ld	a, 0x5407
      008769 6B 01            [ 1]  287 	ld	(0x01, sp), a
                                    288 ;	lib/src/stm8s_adc1.c: 256: ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
      00876B A6 01            [ 1]  289 	ld	a, #0x01
      00876D 88               [ 1]  290 	push	a
      00876E 9F               [ 1]  291 	ld	a, xl
      00876F 4D               [ 1]  292 	tnz	a
      008770 27 05            [ 1]  293 	jreq	00149$
      008772                        294 00148$:
      008772 08 01            [ 1]  295 	sll	(1, sp)
      008774 4A               [ 1]  296 	dec	a
      008775 26 FB            [ 1]  297 	jrne	00148$
      008777                        298 00149$:
      008777 84               [ 1]  299 	pop	a
                                    300 ;	lib/src/stm8s_adc1.c: 254: if (NewState != DISABLE)
      008778 0D 04            [ 1]  301 	tnz	(0x04, sp)
      00877A 27 08            [ 1]  302 	jreq	00105$
                                    303 ;	lib/src/stm8s_adc1.c: 256: ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
      00877C 43               [ 1]  304 	cpl	a
      00877D 14 01            [ 1]  305 	and	a, (0x01, sp)
      00877F C7 54 07         [ 1]  306 	ld	0x5407, a
      008782 20 2D            [ 2]  307 	jra	00116$
      008784                        308 00105$:
                                    309 ;	lib/src/stm8s_adc1.c: 260: ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
      008784 1A 01            [ 1]  310 	or	a, (0x01, sp)
      008786 C7 54 07         [ 1]  311 	ld	0x5407, a
      008789 20 26            [ 2]  312 	jra	00116$
      00878B                        313 00111$:
                                    314 ;	lib/src/stm8s_adc1.c: 244: ADC1->TDRH &= (uint8_t)0x0;
      00878B C6 54 06         [ 1]  315 	ld	a, 0x5406
      00878E 6B 01            [ 1]  316 	ld	(0x01, sp), a
                                    317 ;	lib/src/stm8s_adc1.c: 267: ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
      008790 1D 00 08         [ 2]  318 	subw	x, #8
      008793 A6 01            [ 1]  319 	ld	a, #0x01
      008795 88               [ 1]  320 	push	a
      008796 9F               [ 1]  321 	ld	a, xl
      008797 4D               [ 1]  322 	tnz	a
      008798 27 05            [ 1]  323 	jreq	00152$
      00879A                        324 00151$:
      00879A 08 01            [ 1]  325 	sll	(1, sp)
      00879C 4A               [ 1]  326 	dec	a
      00879D 26 FB            [ 1]  327 	jrne	00151$
      00879F                        328 00152$:
      00879F 84               [ 1]  329 	pop	a
                                    330 ;	lib/src/stm8s_adc1.c: 265: if (NewState != DISABLE)
      0087A0 0D 04            [ 1]  331 	tnz	(0x04, sp)
      0087A2 27 08            [ 1]  332 	jreq	00108$
                                    333 ;	lib/src/stm8s_adc1.c: 267: ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
      0087A4 43               [ 1]  334 	cpl	a
      0087A5 14 01            [ 1]  335 	and	a, (0x01, sp)
      0087A7 C7 54 06         [ 1]  336 	ld	0x5406, a
      0087AA 20 05            [ 2]  337 	jra	00116$
      0087AC                        338 00108$:
                                    339 ;	lib/src/stm8s_adc1.c: 271: ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
      0087AC 1A 01            [ 1]  340 	or	a, (0x01, sp)
      0087AE C7 54 06         [ 1]  341 	ld	0x5406, a
      0087B1                        342 00116$:
                                    343 ;	lib/src/stm8s_adc1.c: 274: }
      0087B1 84               [ 1]  344 	pop	a
      0087B2 85               [ 2]  345 	popw	x
      0087B3 84               [ 1]  346 	pop	a
      0087B4 FC               [ 2]  347 	jp	(x)
                                    348 ;	lib/src/stm8s_adc1.c: 286: void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
                                    349 ;	-----------------------------------------
                                    350 ;	 function ADC1_ConversionConfig
                                    351 ;	-----------------------------------------
      0087B5                        352 _ADC1_ConversionConfig:
      0087B5 88               [ 1]  353 	push	a
      0087B6 6B 01            [ 1]  354 	ld	(0x01, sp), a
                                    355 ;	lib/src/stm8s_adc1.c: 294: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
      0087B8 72 17 54 02      [ 1]  356 	bres	0x5402, #3
                                    357 ;	lib/src/stm8s_adc1.c: 296: ADC1->CR2 |= (uint8_t)(ADC1_Align);
      0087BC C6 54 02         [ 1]  358 	ld	a, 0x5402
      0087BF 1A 05            [ 1]  359 	or	a, (0x05, sp)
      0087C1 C7 54 02         [ 1]  360 	ld	0x5402, a
                                    361 ;	lib/src/stm8s_adc1.c: 301: ADC1->CR1 |= ADC1_CR1_CONT;
      0087C4 C6 54 01         [ 1]  362 	ld	a, 0x5401
                                    363 ;	lib/src/stm8s_adc1.c: 298: if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
      0087C7 0D 01            [ 1]  364 	tnz	(0x01, sp)
      0087C9 27 07            [ 1]  365 	jreq	00102$
                                    366 ;	lib/src/stm8s_adc1.c: 301: ADC1->CR1 |= ADC1_CR1_CONT;
      0087CB AA 02            [ 1]  367 	or	a, #0x02
      0087CD C7 54 01         [ 1]  368 	ld	0x5401, a
      0087D0 20 05            [ 2]  369 	jra	00103$
      0087D2                        370 00102$:
                                    371 ;	lib/src/stm8s_adc1.c: 306: ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
      0087D2 A4 FD            [ 1]  372 	and	a, #0xfd
      0087D4 C7 54 01         [ 1]  373 	ld	0x5401, a
      0087D7                        374 00103$:
                                    375 ;	lib/src/stm8s_adc1.c: 310: ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
      0087D7 C6 54 00         [ 1]  376 	ld	a, 0x5400
      0087DA A4 F0            [ 1]  377 	and	a, #0xf0
      0087DC C7 54 00         [ 1]  378 	ld	0x5400, a
                                    379 ;	lib/src/stm8s_adc1.c: 312: ADC1->CSR |= (uint8_t)(ADC1_Channel);
      0087DF C6 54 00         [ 1]  380 	ld	a, 0x5400
      0087E2 1A 04            [ 1]  381 	or	a, (0x04, sp)
      0087E4 C7 54 00         [ 1]  382 	ld	0x5400, a
                                    383 ;	lib/src/stm8s_adc1.c: 313: }
      0087E7 1E 02            [ 2]  384 	ldw	x, (2, sp)
      0087E9 5B 05            [ 2]  385 	addw	sp, #5
      0087EB FC               [ 2]  386 	jp	(x)
                                    387 ;	lib/src/stm8s_adc1.c: 325: void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
                                    388 ;	-----------------------------------------
                                    389 ;	 function ADC1_ExternalTriggerConfig
                                    390 ;	-----------------------------------------
      0087EC                        391 _ADC1_ExternalTriggerConfig:
      0087EC 88               [ 1]  392 	push	a
      0087ED 6B 01            [ 1]  393 	ld	(0x01, sp), a
                                    394 ;	lib/src/stm8s_adc1.c: 332: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
      0087EF C6 54 02         [ 1]  395 	ld	a, 0x5402
      0087F2 A4 CF            [ 1]  396 	and	a, #0xcf
      0087F4 C7 54 02         [ 1]  397 	ld	0x5402, a
      0087F7 C6 54 02         [ 1]  398 	ld	a, 0x5402
                                    399 ;	lib/src/stm8s_adc1.c: 334: if (NewState != DISABLE)
      0087FA 0D 04            [ 1]  400 	tnz	(0x04, sp)
      0087FC 27 07            [ 1]  401 	jreq	00102$
                                    402 ;	lib/src/stm8s_adc1.c: 337: ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
      0087FE AA 40            [ 1]  403 	or	a, #0x40
      008800 C7 54 02         [ 1]  404 	ld	0x5402, a
      008803 20 05            [ 2]  405 	jra	00103$
      008805                        406 00102$:
                                    407 ;	lib/src/stm8s_adc1.c: 342: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
      008805 A4 BF            [ 1]  408 	and	a, #0xbf
      008807 C7 54 02         [ 1]  409 	ld	0x5402, a
      00880A                        410 00103$:
                                    411 ;	lib/src/stm8s_adc1.c: 346: ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
      00880A C6 54 02         [ 1]  412 	ld	a, 0x5402
      00880D 1A 01            [ 1]  413 	or	a, (0x01, sp)
      00880F C7 54 02         [ 1]  414 	ld	0x5402, a
                                    415 ;	lib/src/stm8s_adc1.c: 347: }
      008812 84               [ 1]  416 	pop	a
      008813 85               [ 2]  417 	popw	x
      008814 84               [ 1]  418 	pop	a
      008815 FC               [ 2]  419 	jp	(x)
                                    420 ;	lib/src/stm8s_adc1.c: 358: void ADC1_StartConversion(void)
                                    421 ;	-----------------------------------------
                                    422 ;	 function ADC1_StartConversion
                                    423 ;	-----------------------------------------
      008816                        424 _ADC1_StartConversion:
                                    425 ;	lib/src/stm8s_adc1.c: 360: ADC1->CR1 |= ADC1_CR1_ADON;
      008816 72 10 54 01      [ 1]  426 	bset	0x5401, #0
                                    427 ;	lib/src/stm8s_adc1.c: 361: }
      00881A 81               [ 4]  428 	ret
                                    429 ;	lib/src/stm8s_adc1.c: 370: uint16_t ADC1_GetConversionValue(void)
                                    430 ;	-----------------------------------------
                                    431 ;	 function ADC1_GetConversionValue
                                    432 ;	-----------------------------------------
      00881B                        433 _ADC1_GetConversionValue:
      00881B 52 06            [ 2]  434 	sub	sp, #6
                                    435 ;	lib/src/stm8s_adc1.c: 375: if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
      00881D 72 07 54 02 14   [ 2]  436 	btjf	0x5402, #3, 00102$
                                    437 ;	lib/src/stm8s_adc1.c: 378: templ = ADC1->DRL;
      008822 C6 54 05         [ 1]  438 	ld	a, 0x5405
      008825 97               [ 1]  439 	ld	xl, a
                                    440 ;	lib/src/stm8s_adc1.c: 380: temph = ADC1->DRH;
      008826 C6 54 04         [ 1]  441 	ld	a, 0x5404
                                    442 ;	lib/src/stm8s_adc1.c: 382: temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
      008829 0F 02            [ 1]  443 	clr	(0x02, sp)
      00882B 0F 03            [ 1]  444 	clr	(0x03, sp)
      00882D 1A 03            [ 1]  445 	or	a, (0x03, sp)
      00882F 01               [ 1]  446 	rrwa	x
      008830 1A 02            [ 1]  447 	or	a, (0x02, sp)
      008832 6B 06            [ 1]  448 	ld	(0x06, sp), a
      008834 20 1D            [ 2]  449 	jra	00103$
      008836                        450 00102$:
                                    451 ;	lib/src/stm8s_adc1.c: 387: temph = ADC1->DRH;
      008836 C6 54 04         [ 1]  452 	ld	a, 0x5404
      008839 90 5F            [ 1]  453 	clrw	y
      00883B 90 97            [ 1]  454 	ld	yl, a
                                    455 ;	lib/src/stm8s_adc1.c: 389: templ = ADC1->DRL;
      00883D C6 54 05         [ 1]  456 	ld	a, 0x5405
                                    457 ;	lib/src/stm8s_adc1.c: 391: temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
      008840 5F               [ 1]  458 	clrw	x
      008841 97               [ 1]  459 	ld	xl, a
      008842 58               [ 2]  460 	sllw	x
      008843 58               [ 2]  461 	sllw	x
      008844 58               [ 2]  462 	sllw	x
      008845 58               [ 2]  463 	sllw	x
      008846 58               [ 2]  464 	sllw	x
      008847 58               [ 2]  465 	sllw	x
      008848 1F 03            [ 2]  466 	ldw	(0x03, sp), x
      00884A 7B 04            [ 1]  467 	ld	a, (0x04, sp)
      00884C 6B 06            [ 1]  468 	ld	(0x06, sp), a
      00884E 90 9F            [ 1]  469 	ld	a, yl
      008850 1A 03            [ 1]  470 	or	a, (0x03, sp)
      008852 95               [ 1]  471 	ld	xh, a
      008853                        472 00103$:
                                    473 ;	lib/src/stm8s_adc1.c: 394: return ((uint16_t)temph);
      008853 7B 06            [ 1]  474 	ld	a, (0x06, sp)
      008855 97               [ 1]  475 	ld	xl, a
                                    476 ;	lib/src/stm8s_adc1.c: 395: }
      008856 5B 06            [ 2]  477 	addw	sp, #6
      008858 81               [ 4]  478 	ret
                                    479 ;	lib/src/stm8s_adc1.c: 405: void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
                                    480 ;	-----------------------------------------
                                    481 ;	 function ADC1_AWDChannelConfig
                                    482 ;	-----------------------------------------
      008859                        483 _ADC1_AWDChannelConfig:
      008859 88               [ 1]  484 	push	a
                                    485 ;	lib/src/stm8s_adc1.c: 411: if (Channel < (uint8_t)8)
      00885A 97               [ 1]  486 	ld	xl, a
      00885B A1 08            [ 1]  487 	cp	a, #0x08
      00885D 24 25            [ 1]  488 	jrnc	00108$
                                    489 ;	lib/src/stm8s_adc1.c: 415: ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
      00885F C6 54 0F         [ 1]  490 	ld	a, 0x540f
      008862 6B 01            [ 1]  491 	ld	(0x01, sp), a
      008864 A6 01            [ 1]  492 	ld	a, #0x01
      008866 88               [ 1]  493 	push	a
      008867 9F               [ 1]  494 	ld	a, xl
      008868 4D               [ 1]  495 	tnz	a
      008869 27 05            [ 1]  496 	jreq	00129$
      00886B                        497 00128$:
      00886B 08 01            [ 1]  498 	sll	(1, sp)
      00886D 4A               [ 1]  499 	dec	a
      00886E 26 FB            [ 1]  500 	jrne	00128$
      008870                        501 00129$:
      008870 84               [ 1]  502 	pop	a
                                    503 ;	lib/src/stm8s_adc1.c: 413: if (NewState != DISABLE)
      008871 0D 04            [ 1]  504 	tnz	(0x04, sp)
      008873 27 07            [ 1]  505 	jreq	00102$
                                    506 ;	lib/src/stm8s_adc1.c: 415: ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
      008875 1A 01            [ 1]  507 	or	a, (0x01, sp)
      008877 C7 54 0F         [ 1]  508 	ld	0x540f, a
      00887A 20 2E            [ 2]  509 	jra	00110$
      00887C                        510 00102$:
                                    511 ;	lib/src/stm8s_adc1.c: 419: ADC1->AWCRL &= (uint8_t)~(uint8_t)((uint8_t)1 << Channel);
      00887C 43               [ 1]  512 	cpl	a
      00887D 14 01            [ 1]  513 	and	a, (0x01, sp)
      00887F C7 54 0F         [ 1]  514 	ld	0x540f, a
      008882 20 26            [ 2]  515 	jra	00110$
      008884                        516 00108$:
                                    517 ;	lib/src/stm8s_adc1.c: 426: ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
      008884 C6 54 0E         [ 1]  518 	ld	a, 0x540e
      008887 6B 01            [ 1]  519 	ld	(0x01, sp), a
      008889 1D 00 08         [ 2]  520 	subw	x, #8
      00888C A6 01            [ 1]  521 	ld	a, #0x01
      00888E 88               [ 1]  522 	push	a
      00888F 9F               [ 1]  523 	ld	a, xl
      008890 4D               [ 1]  524 	tnz	a
      008891 27 05            [ 1]  525 	jreq	00132$
      008893                        526 00131$:
      008893 08 01            [ 1]  527 	sll	(1, sp)
      008895 4A               [ 1]  528 	dec	a
      008896 26 FB            [ 1]  529 	jrne	00131$
      008898                        530 00132$:
      008898 84               [ 1]  531 	pop	a
                                    532 ;	lib/src/stm8s_adc1.c: 424: if (NewState != DISABLE)
      008899 0D 04            [ 1]  533 	tnz	(0x04, sp)
      00889B 27 07            [ 1]  534 	jreq	00105$
                                    535 ;	lib/src/stm8s_adc1.c: 426: ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
      00889D 1A 01            [ 1]  536 	or	a, (0x01, sp)
      00889F C7 54 0E         [ 1]  537 	ld	0x540e, a
      0088A2 20 06            [ 2]  538 	jra	00110$
      0088A4                        539 00105$:
                                    540 ;	lib/src/stm8s_adc1.c: 430: ADC1->AWCRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (uint8_t)(Channel - (uint8_t)8));
      0088A4 43               [ 1]  541 	cpl	a
      0088A5 14 01            [ 1]  542 	and	a, (0x01, sp)
      0088A7 C7 54 0E         [ 1]  543 	ld	0x540e, a
      0088AA                        544 00110$:
                                    545 ;	lib/src/stm8s_adc1.c: 433: }
      0088AA 84               [ 1]  546 	pop	a
      0088AB 85               [ 2]  547 	popw	x
      0088AC 84               [ 1]  548 	pop	a
      0088AD FC               [ 2]  549 	jp	(x)
                                    550 ;	lib/src/stm8s_adc1.c: 441: void ADC1_SetHighThreshold(uint16_t Threshold)
                                    551 ;	-----------------------------------------
                                    552 ;	 function ADC1_SetHighThreshold
                                    553 ;	-----------------------------------------
      0088AE                        554 _ADC1_SetHighThreshold:
                                    555 ;	lib/src/stm8s_adc1.c: 443: ADC1->HTRH = (uint8_t)(Threshold >> (uint8_t)2);
      0088AE 90 93            [ 1]  556 	ldw	y, x
      0088B0 54               [ 2]  557 	srlw	x
      0088B1 54               [ 2]  558 	srlw	x
      0088B2 9F               [ 1]  559 	ld	a, xl
      0088B3 C7 54 08         [ 1]  560 	ld	0x5408, a
                                    561 ;	lib/src/stm8s_adc1.c: 444: ADC1->HTRL = (uint8_t)Threshold;
      0088B6 90 9F            [ 1]  562 	ld	a, yl
      0088B8 C7 54 09         [ 1]  563 	ld	0x5409, a
                                    564 ;	lib/src/stm8s_adc1.c: 445: }
      0088BB 81               [ 4]  565 	ret
                                    566 ;	lib/src/stm8s_adc1.c: 453: void ADC1_SetLowThreshold(uint16_t Threshold)
                                    567 ;	-----------------------------------------
                                    568 ;	 function ADC1_SetLowThreshold
                                    569 ;	-----------------------------------------
      0088BC                        570 _ADC1_SetLowThreshold:
                                    571 ;	lib/src/stm8s_adc1.c: 455: ADC1->LTRL = (uint8_t)Threshold;
      0088BC 9F               [ 1]  572 	ld	a, xl
      0088BD C7 54 0B         [ 1]  573 	ld	0x540b, a
                                    574 ;	lib/src/stm8s_adc1.c: 456: ADC1->LTRH = (uint8_t)(Threshold >> (uint8_t)2);
      0088C0 54               [ 2]  575 	srlw	x
      0088C1 54               [ 2]  576 	srlw	x
      0088C2 9F               [ 1]  577 	ld	a, xl
      0088C3 C7 54 0A         [ 1]  578 	ld	0x540a, a
                                    579 ;	lib/src/stm8s_adc1.c: 457: }
      0088C6 81               [ 4]  580 	ret
                                    581 ;	lib/src/stm8s_adc1.c: 466: uint16_t ADC1_GetBufferValue(uint8_t Buffer)
                                    582 ;	-----------------------------------------
                                    583 ;	 function ADC1_GetBufferValue
                                    584 ;	-----------------------------------------
      0088C7                        585 _ADC1_GetBufferValue:
      0088C7 52 06            [ 2]  586 	sub	sp, #6
      0088C9 97               [ 1]  587 	ld	xl, a
                                    588 ;	lib/src/stm8s_adc1.c: 474: if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
      0088CA C6 54 02         [ 1]  589 	ld	a, 0x5402
      0088CD 6B 03            [ 1]  590 	ld	(0x03, sp), a
                                    591 ;	lib/src/stm8s_adc1.c: 477: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
      0088CF 58               [ 2]  592 	sllw	x
      0088D0 4F               [ 1]  593 	clr	a
      0088D1 95               [ 1]  594 	ld	xh, a
      0088D2 90 93            [ 1]  595 	ldw	y, x
      0088D4 72 A9 53 E1      [ 2]  596 	addw	y, #0x53e1
                                    597 ;	lib/src/stm8s_adc1.c: 479: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
      0088D8 1C 53 E0         [ 2]  598 	addw	x, #0x53e0
                                    599 ;	lib/src/stm8s_adc1.c: 477: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
                                    600 ;	lib/src/stm8s_adc1.c: 479: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
                                    601 ;	lib/src/stm8s_adc1.c: 477: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
      0088DB 90 F6            [ 1]  602 	ld	a, (y)
      0088DD 6B 06            [ 1]  603 	ld	(0x06, sp), a
                                    604 ;	lib/src/stm8s_adc1.c: 479: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
      0088DF F6               [ 1]  605 	ld	a, (x)
      0088E0 6B 05            [ 1]  606 	ld	(0x05, sp), a
      0088E2 0F 04            [ 1]  607 	clr	(0x04, sp)
                                    608 ;	lib/src/stm8s_adc1.c: 474: if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
      0088E4 7B 03            [ 1]  609 	ld	a, (0x03, sp)
      0088E6 A5 08            [ 1]  610 	bcp	a, #0x08
      0088E8 27 1A            [ 1]  611 	jreq	00102$
                                    612 ;	lib/src/stm8s_adc1.c: 477: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
                                    613 ;	lib/src/stm8s_adc1.c: 479: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
      0088EA 16 04            [ 2]  614 	ldw	y, (0x04, sp)
      0088EC 17 01            [ 2]  615 	ldw	(0x01, sp), y
                                    616 ;	lib/src/stm8s_adc1.c: 481: temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
      0088EE 7B 02            [ 1]  617 	ld	a, (0x02, sp)
      0088F0 6B 03            [ 1]  618 	ld	(0x03, sp), a
      0088F2 0F 04            [ 1]  619 	clr	(0x04, sp)
      0088F4 0F 05            [ 1]  620 	clr	(0x05, sp)
      0088F6 7B 06            [ 1]  621 	ld	a, (0x06, sp)
      0088F8 1A 04            [ 1]  622 	or	a, (0x04, sp)
      0088FA 6B 02            [ 1]  623 	ld	(0x02, sp), a
      0088FC 7B 05            [ 1]  624 	ld	a, (0x05, sp)
      0088FE 1A 03            [ 1]  625 	or	a, (0x03, sp)
      008900 6B 01            [ 1]  626 	ld	(0x01, sp), a
      008902 20 1C            [ 2]  627 	jra	00103$
      008904                        628 00102$:
                                    629 ;	lib/src/stm8s_adc1.c: 486: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
      008904 16 04            [ 2]  630 	ldw	y, (0x04, sp)
                                    631 ;	lib/src/stm8s_adc1.c: 488: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
      008906 7B 06            [ 1]  632 	ld	a, (0x06, sp)
                                    633 ;	lib/src/stm8s_adc1.c: 490: temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)(temph << 8));
      008908 5F               [ 1]  634 	clrw	x
      008909 97               [ 1]  635 	ld	xl, a
      00890A 58               [ 2]  636 	sllw	x
      00890B 58               [ 2]  637 	sllw	x
      00890C 58               [ 2]  638 	sllw	x
      00890D 58               [ 2]  639 	sllw	x
      00890E 58               [ 2]  640 	sllw	x
      00890F 58               [ 2]  641 	sllw	x
      008910 1F 03            [ 2]  642 	ldw	(0x03, sp), x
      008912 90 9F            [ 1]  643 	ld	a, yl
      008914 0F 06            [ 1]  644 	clr	(0x06, sp)
      008916 1A 03            [ 1]  645 	or	a, (0x03, sp)
      008918 6B 01            [ 1]  646 	ld	(0x01, sp), a
      00891A 7B 04            [ 1]  647 	ld	a, (0x04, sp)
      00891C 1A 06            [ 1]  648 	or	a, (0x06, sp)
      00891E 6B 02            [ 1]  649 	ld	(0x02, sp), a
      008920                        650 00103$:
                                    651 ;	lib/src/stm8s_adc1.c: 493: return ((uint16_t)temph);
      008920 1E 01            [ 2]  652 	ldw	x, (0x01, sp)
                                    653 ;	lib/src/stm8s_adc1.c: 494: }
      008922 5B 06            [ 2]  654 	addw	sp, #6
      008924 81               [ 4]  655 	ret
                                    656 ;	lib/src/stm8s_adc1.c: 502: FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
                                    657 ;	-----------------------------------------
                                    658 ;	 function ADC1_GetAWDChannelStatus
                                    659 ;	-----------------------------------------
      008925                        660 _ADC1_GetAWDChannelStatus:
      008925 88               [ 1]  661 	push	a
                                    662 ;	lib/src/stm8s_adc1.c: 509: if (Channel < (uint8_t)8)
      008926 97               [ 1]  663 	ld	xl, a
      008927 A1 08            [ 1]  664 	cp	a, #0x08
      008929 24 16            [ 1]  665 	jrnc	00102$
                                    666 ;	lib/src/stm8s_adc1.c: 511: status = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << Channel));
      00892B C6 54 0D         [ 1]  667 	ld	a, 0x540d
      00892E 88               [ 1]  668 	push	a
      00892F A6 01            [ 1]  669 	ld	a, #0x01
      008931 6B 02            [ 1]  670 	ld	(0x02, sp), a
      008933 9F               [ 1]  671 	ld	a, xl
      008934 4D               [ 1]  672 	tnz	a
      008935 27 05            [ 1]  673 	jreq	00113$
      008937                        674 00112$:
      008937 08 02            [ 1]  675 	sll	(0x02, sp)
      008939 4A               [ 1]  676 	dec	a
      00893A 26 FB            [ 1]  677 	jrne	00112$
      00893C                        678 00113$:
      00893C 84               [ 1]  679 	pop	a
      00893D 14 01            [ 1]  680 	and	a, (0x01, sp)
      00893F 20 17            [ 2]  681 	jra	00103$
      008941                        682 00102$:
                                    683 ;	lib/src/stm8s_adc1.c: 515: status = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8)));
      008941 C6 54 0C         [ 1]  684 	ld	a, 0x540c
      008944 6B 01            [ 1]  685 	ld	(0x01, sp), a
      008946 1D 00 08         [ 2]  686 	subw	x, #8
      008949 A6 01            [ 1]  687 	ld	a, #0x01
      00894B 88               [ 1]  688 	push	a
      00894C 9F               [ 1]  689 	ld	a, xl
      00894D 4D               [ 1]  690 	tnz	a
      00894E 27 05            [ 1]  691 	jreq	00115$
      008950                        692 00114$:
      008950 08 01            [ 1]  693 	sll	(1, sp)
      008952 4A               [ 1]  694 	dec	a
      008953 26 FB            [ 1]  695 	jrne	00114$
      008955                        696 00115$:
      008955 84               [ 1]  697 	pop	a
      008956 14 01            [ 1]  698 	and	a, (0x01, sp)
      008958                        699 00103$:
                                    700 ;	lib/src/stm8s_adc1.c: 518: return ((FlagStatus)status);
      008958 40               [ 1]  701 	neg	a
      008959 4F               [ 1]  702 	clr	a
      00895A 49               [ 1]  703 	rlc	a
                                    704 ;	lib/src/stm8s_adc1.c: 519: }
      00895B 5B 01            [ 2]  705 	addw	sp, #1
      00895D 81               [ 4]  706 	ret
                                    707 ;	lib/src/stm8s_adc1.c: 527: FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
                                    708 ;	-----------------------------------------
                                    709 ;	 function ADC1_GetFlagStatus
                                    710 ;	-----------------------------------------
      00895E                        711 _ADC1_GetFlagStatus:
      00895E 52 03            [ 2]  712 	sub	sp, #3
                                    713 ;	lib/src/stm8s_adc1.c: 535: if ((Flag & 0x0F) == 0x01)
      008960 6B 03            [ 1]  714 	ld	(0x03, sp), a
      008962 6B 02            [ 1]  715 	ld	(0x02, sp), a
      008964 0F 01            [ 1]  716 	clr	(0x01, sp)
      008966 5F               [ 1]  717 	clrw	x
      008967 7B 02            [ 1]  718 	ld	a, (0x02, sp)
      008969 A4 0F            [ 1]  719 	and	a, #0x0f
      00896B 97               [ 1]  720 	ld	xl, a
      00896C 5A               [ 2]  721 	decw	x
      00896D 26 07            [ 1]  722 	jrne	00108$
                                    723 ;	lib/src/stm8s_adc1.c: 538: flagstatus = (uint8_t)(ADC1->CR3 & ADC1_CR3_OVR);
      00896F C6 54 03         [ 1]  724 	ld	a, 0x5403
      008972 A4 40            [ 1]  725 	and	a, #0x40
      008974 20 48            [ 2]  726 	jra	00109$
      008976                        727 00108$:
                                    728 ;	lib/src/stm8s_adc1.c: 540: else if ((Flag & 0xF0) == 0x10)
      008976 5F               [ 1]  729 	clrw	x
      008977 7B 02            [ 1]  730 	ld	a, (0x02, sp)
      008979 A4 F0            [ 1]  731 	and	a, #0xf0
      00897B 97               [ 1]  732 	ld	xl, a
      00897C A3 00 10         [ 2]  733 	cpw	x, #0x0010
      00897F 26 38            [ 1]  734 	jrne	00105$
                                    735 ;	lib/src/stm8s_adc1.c: 543: temp = (uint8_t)(Flag & (uint8_t)0x0F);
      008981 7B 03            [ 1]  736 	ld	a, (0x03, sp)
      008983 A4 0F            [ 1]  737 	and	a, #0x0f
                                    738 ;	lib/src/stm8s_adc1.c: 544: if (temp < 8)
      008985 97               [ 1]  739 	ld	xl, a
      008986 A1 08            [ 1]  740 	cp	a, #0x08
      008988 24 16            [ 1]  741 	jrnc	00102$
                                    742 ;	lib/src/stm8s_adc1.c: 546: flagstatus = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
      00898A C6 54 0D         [ 1]  743 	ld	a, 0x540d
      00898D 6B 02            [ 1]  744 	ld	(0x02, sp), a
      00898F A6 01            [ 1]  745 	ld	a, #0x01
      008991 88               [ 1]  746 	push	a
      008992 9F               [ 1]  747 	ld	a, xl
      008993 4D               [ 1]  748 	tnz	a
      008994 27 05            [ 1]  749 	jreq	00135$
      008996                        750 00134$:
      008996 08 01            [ 1]  751 	sll	(1, sp)
      008998 4A               [ 1]  752 	dec	a
      008999 26 FB            [ 1]  753 	jrne	00134$
      00899B                        754 00135$:
      00899B 84               [ 1]  755 	pop	a
      00899C 14 02            [ 1]  756 	and	a, (0x02, sp)
      00899E 20 1E            [ 2]  757 	jra	00109$
      0089A0                        758 00102$:
                                    759 ;	lib/src/stm8s_adc1.c: 550: flagstatus = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
      0089A0 C6 54 0C         [ 1]  760 	ld	a, 0x540c
      0089A3 6B 02            [ 1]  761 	ld	(0x02, sp), a
      0089A5 1D 00 08         [ 2]  762 	subw	x, #8
      0089A8 A6 01            [ 1]  763 	ld	a, #0x01
      0089AA 88               [ 1]  764 	push	a
      0089AB 9F               [ 1]  765 	ld	a, xl
      0089AC 4D               [ 1]  766 	tnz	a
      0089AD 27 05            [ 1]  767 	jreq	00137$
      0089AF                        768 00136$:
      0089AF 08 01            [ 1]  769 	sll	(1, sp)
      0089B1 4A               [ 1]  770 	dec	a
      0089B2 26 FB            [ 1]  771 	jrne	00136$
      0089B4                        772 00137$:
      0089B4 84               [ 1]  773 	pop	a
      0089B5 14 02            [ 1]  774 	and	a, (0x02, sp)
      0089B7 20 05            [ 2]  775 	jra	00109$
      0089B9                        776 00105$:
                                    777 ;	lib/src/stm8s_adc1.c: 555: flagstatus = (uint8_t)(ADC1->CSR & Flag);
      0089B9 C6 54 00         [ 1]  778 	ld	a, 0x5400
      0089BC 14 03            [ 1]  779 	and	a, (0x03, sp)
      0089BE                        780 00109$:
                                    781 ;	lib/src/stm8s_adc1.c: 557: return ((FlagStatus)flagstatus);
      0089BE 40               [ 1]  782 	neg	a
      0089BF 4F               [ 1]  783 	clr	a
      0089C0 49               [ 1]  784 	rlc	a
                                    785 ;	lib/src/stm8s_adc1.c: 559: }
      0089C1 5B 03            [ 2]  786 	addw	sp, #3
      0089C3 81               [ 4]  787 	ret
                                    788 ;	lib/src/stm8s_adc1.c: 567: void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
                                    789 ;	-----------------------------------------
                                    790 ;	 function ADC1_ClearFlag
                                    791 ;	-----------------------------------------
      0089C4                        792 _ADC1_ClearFlag:
      0089C4 52 03            [ 2]  793 	sub	sp, #3
                                    794 ;	lib/src/stm8s_adc1.c: 574: if ((Flag & 0x0F) == 0x01)
      0089C6 6B 03            [ 1]  795 	ld	(0x03, sp), a
      0089C8 0F 01            [ 1]  796 	clr	(0x01, sp)
      0089CA 88               [ 1]  797 	push	a
      0089CB A4 0F            [ 1]  798 	and	a, #0x0f
      0089CD 97               [ 1]  799 	ld	xl, a
      0089CE 4F               [ 1]  800 	clr	a
      0089CF 95               [ 1]  801 	ld	xh, a
      0089D0 84               [ 1]  802 	pop	a
      0089D1 5A               [ 2]  803 	decw	x
      0089D2 26 06            [ 1]  804 	jrne	00108$
                                    805 ;	lib/src/stm8s_adc1.c: 577: ADC1->CR3 &= (uint8_t)(~ADC1_CR3_OVR);
      0089D4 72 1D 54 03      [ 1]  806 	bres	0x5403, #6
      0089D8 20 57            [ 2]  807 	jra	00110$
      0089DA                        808 00108$:
                                    809 ;	lib/src/stm8s_adc1.c: 579: else if ((Flag & 0xF0) == 0x10)
      0089DA A4 F0            [ 1]  810 	and	a, #0xf0
      0089DC 97               [ 1]  811 	ld	xl, a
      0089DD 4F               [ 1]  812 	clr	a
      0089DE 95               [ 1]  813 	ld	xh, a
      0089DF A3 00 10         [ 2]  814 	cpw	x, #0x0010
      0089E2 26 40            [ 1]  815 	jrne	00105$
                                    816 ;	lib/src/stm8s_adc1.c: 582: temp = (uint8_t)(Flag & (uint8_t)0x0F);
      0089E4 7B 03            [ 1]  817 	ld	a, (0x03, sp)
      0089E6 A4 0F            [ 1]  818 	and	a, #0x0f
                                    819 ;	lib/src/stm8s_adc1.c: 583: if (temp < 8)
      0089E8 97               [ 1]  820 	ld	xl, a
      0089E9 A1 08            [ 1]  821 	cp	a, #0x08
      0089EB 24 1A            [ 1]  822 	jrnc	00102$
                                    823 ;	lib/src/stm8s_adc1.c: 585: ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
      0089ED C6 54 0D         [ 1]  824 	ld	a, 0x540d
      0089F0 6B 02            [ 1]  825 	ld	(0x02, sp), a
      0089F2 A6 01            [ 1]  826 	ld	a, #0x01
      0089F4 88               [ 1]  827 	push	a
      0089F5 9F               [ 1]  828 	ld	a, xl
      0089F6 4D               [ 1]  829 	tnz	a
      0089F7 27 05            [ 1]  830 	jreq	00135$
      0089F9                        831 00134$:
      0089F9 08 01            [ 1]  832 	sll	(1, sp)
      0089FB 4A               [ 1]  833 	dec	a
      0089FC 26 FB            [ 1]  834 	jrne	00134$
      0089FE                        835 00135$:
      0089FE 84               [ 1]  836 	pop	a
      0089FF 43               [ 1]  837 	cpl	a
      008A00 14 02            [ 1]  838 	and	a, (0x02, sp)
      008A02 C7 54 0D         [ 1]  839 	ld	0x540d, a
      008A05 20 2A            [ 2]  840 	jra	00110$
      008A07                        841 00102$:
                                    842 ;	lib/src/stm8s_adc1.c: 589: ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
      008A07 C6 54 0C         [ 1]  843 	ld	a, 0x540c
      008A0A 6B 02            [ 1]  844 	ld	(0x02, sp), a
      008A0C 1D 00 08         [ 2]  845 	subw	x, #8
      008A0F A6 01            [ 1]  846 	ld	a, #0x01
      008A11 88               [ 1]  847 	push	a
      008A12 9F               [ 1]  848 	ld	a, xl
      008A13 4D               [ 1]  849 	tnz	a
      008A14 27 05            [ 1]  850 	jreq	00137$
      008A16                        851 00136$:
      008A16 08 01            [ 1]  852 	sll	(1, sp)
      008A18 4A               [ 1]  853 	dec	a
      008A19 26 FB            [ 1]  854 	jrne	00136$
      008A1B                        855 00137$:
      008A1B 84               [ 1]  856 	pop	a
      008A1C 43               [ 1]  857 	cpl	a
      008A1D 14 02            [ 1]  858 	and	a, (0x02, sp)
      008A1F C7 54 0C         [ 1]  859 	ld	0x540c, a
      008A22 20 0D            [ 2]  860 	jra	00110$
      008A24                        861 00105$:
                                    862 ;	lib/src/stm8s_adc1.c: 594: ADC1->CSR &= (uint8_t) (~Flag);
      008A24 C6 54 00         [ 1]  863 	ld	a, 0x5400
      008A27 6B 02            [ 1]  864 	ld	(0x02, sp), a
      008A29 7B 03            [ 1]  865 	ld	a, (0x03, sp)
      008A2B 43               [ 1]  866 	cpl	a
      008A2C 14 02            [ 1]  867 	and	a, (0x02, sp)
      008A2E C7 54 00         [ 1]  868 	ld	0x5400, a
      008A31                        869 00110$:
                                    870 ;	lib/src/stm8s_adc1.c: 596: }
      008A31 5B 03            [ 2]  871 	addw	sp, #3
      008A33 81               [ 4]  872 	ret
                                    873 ;	lib/src/stm8s_adc1.c: 616: ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
                                    874 ;	-----------------------------------------
                                    875 ;	 function ADC1_GetITStatus
                                    876 ;	-----------------------------------------
      008A34                        877 _ADC1_GetITStatus:
      008A34 88               [ 1]  878 	push	a
                                    879 ;	lib/src/stm8s_adc1.c: 624: if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
      008A35 90 5F            [ 1]  880 	clrw	y
      008A37 9F               [ 1]  881 	ld	a, xl
      008A38 A4 F0            [ 1]  882 	and	a, #0xf0
      008A3A 90 97            [ 1]  883 	ld	yl, a
      008A3C 90 A3 00 10      [ 2]  884 	cpw	y, #0x0010
      008A40 26 3D            [ 1]  885 	jrne	00105$
                                    886 ;	lib/src/stm8s_adc1.c: 627: temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
      008A42 9F               [ 1]  887 	ld	a, xl
      008A43 A4 0F            [ 1]  888 	and	a, #0x0f
                                    889 ;	lib/src/stm8s_adc1.c: 628: if (temp < 8)
      008A45 97               [ 1]  890 	ld	xl, a
      008A46 A1 08            [ 1]  891 	cp	a, #0x08
      008A48 24 19            [ 1]  892 	jrnc	00102$
                                    893 ;	lib/src/stm8s_adc1.c: 630: itstatus = (ITStatus)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
      008A4A C6 54 0D         [ 1]  894 	ld	a, 0x540d
      008A4D 88               [ 1]  895 	push	a
      008A4E A6 01            [ 1]  896 	ld	a, #0x01
      008A50 6B 02            [ 1]  897 	ld	(0x02, sp), a
      008A52 9F               [ 1]  898 	ld	a, xl
      008A53 4D               [ 1]  899 	tnz	a
      008A54 27 05            [ 1]  900 	jreq	00124$
      008A56                        901 00123$:
      008A56 08 02            [ 1]  902 	sll	(0x02, sp)
      008A58 4A               [ 1]  903 	dec	a
      008A59 26 FB            [ 1]  904 	jrne	00123$
      008A5B                        905 00124$:
      008A5B 84               [ 1]  906 	pop	a
      008A5C 14 01            [ 1]  907 	and	a, (0x01, sp)
      008A5E 40               [ 1]  908 	neg	a
      008A5F 4F               [ 1]  909 	clr	a
      008A60 49               [ 1]  910 	rlc	a
      008A61 20 26            [ 2]  911 	jra	00106$
      008A63                        912 00102$:
                                    913 ;	lib/src/stm8s_adc1.c: 634: itstatus = (ITStatus)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
      008A63 C6 54 0C         [ 1]  914 	ld	a, 0x540c
      008A66 6B 01            [ 1]  915 	ld	(0x01, sp), a
      008A68 1D 00 08         [ 2]  916 	subw	x, #8
      008A6B A6 01            [ 1]  917 	ld	a, #0x01
      008A6D 88               [ 1]  918 	push	a
      008A6E 9F               [ 1]  919 	ld	a, xl
      008A6F 4D               [ 1]  920 	tnz	a
      008A70 27 05            [ 1]  921 	jreq	00126$
      008A72                        922 00125$:
      008A72 08 01            [ 1]  923 	sll	(1, sp)
      008A74 4A               [ 1]  924 	dec	a
      008A75 26 FB            [ 1]  925 	jrne	00125$
      008A77                        926 00126$:
      008A77 84               [ 1]  927 	pop	a
      008A78 14 01            [ 1]  928 	and	a, (0x01, sp)
      008A7A 40               [ 1]  929 	neg	a
      008A7B 4F               [ 1]  930 	clr	a
      008A7C 49               [ 1]  931 	rlc	a
      008A7D 20 0A            [ 2]  932 	jra	00106$
      008A7F                        933 00105$:
                                    934 ;	lib/src/stm8s_adc1.c: 639: itstatus = (ITStatus)(ADC1->CSR & (uint8_t)ITPendingBit);
      008A7F C6 54 00         [ 1]  935 	ld	a, 0x5400
      008A82 89               [ 2]  936 	pushw	x
      008A83 14 02            [ 1]  937 	and	a, (2, sp)
      008A85 85               [ 2]  938 	popw	x
      008A86 40               [ 1]  939 	neg	a
      008A87 4F               [ 1]  940 	clr	a
      008A88 49               [ 1]  941 	rlc	a
      008A89                        942 00106$:
                                    943 ;	lib/src/stm8s_adc1.c: 641: return ((ITStatus)itstatus);
                                    944 ;	lib/src/stm8s_adc1.c: 642: }
      008A89 5B 01            [ 2]  945 	addw	sp, #1
      008A8B 81               [ 4]  946 	ret
                                    947 ;	lib/src/stm8s_adc1.c: 662: void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
                                    948 ;	-----------------------------------------
                                    949 ;	 function ADC1_ClearITPendingBit
                                    950 ;	-----------------------------------------
      008A8C                        951 _ADC1_ClearITPendingBit:
      008A8C 88               [ 1]  952 	push	a
                                    953 ;	lib/src/stm8s_adc1.c: 669: if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
      008A8D 90 5F            [ 1]  954 	clrw	y
      008A8F 9F               [ 1]  955 	ld	a, xl
      008A90 A4 F0            [ 1]  956 	and	a, #0xf0
      008A92 90 97            [ 1]  957 	ld	yl, a
      008A94 90 A3 00 10      [ 2]  958 	cpw	y, #0x0010
      008A98 26 3F            [ 1]  959 	jrne	00105$
                                    960 ;	lib/src/stm8s_adc1.c: 672: temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
      008A9A 9F               [ 1]  961 	ld	a, xl
      008A9B A4 0F            [ 1]  962 	and	a, #0x0f
                                    963 ;	lib/src/stm8s_adc1.c: 673: if (temp < 8)
      008A9D 97               [ 1]  964 	ld	xl, a
      008A9E A1 08            [ 1]  965 	cp	a, #0x08
      008AA0 24 1A            [ 1]  966 	jrnc	00102$
                                    967 ;	lib/src/stm8s_adc1.c: 675: ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
      008AA2 C6 54 0D         [ 1]  968 	ld	a, 0x540d
      008AA5 6B 01            [ 1]  969 	ld	(0x01, sp), a
      008AA7 A6 01            [ 1]  970 	ld	a, #0x01
      008AA9 88               [ 1]  971 	push	a
      008AAA 9F               [ 1]  972 	ld	a, xl
      008AAB 4D               [ 1]  973 	tnz	a
      008AAC 27 05            [ 1]  974 	jreq	00124$
      008AAE                        975 00123$:
      008AAE 08 01            [ 1]  976 	sll	(1, sp)
      008AB0 4A               [ 1]  977 	dec	a
      008AB1 26 FB            [ 1]  978 	jrne	00123$
      008AB3                        979 00124$:
      008AB3 84               [ 1]  980 	pop	a
      008AB4 43               [ 1]  981 	cpl	a
      008AB5 14 01            [ 1]  982 	and	a, (0x01, sp)
      008AB7 C7 54 0D         [ 1]  983 	ld	0x540d, a
      008ABA 20 29            [ 2]  984 	jra	00107$
      008ABC                        985 00102$:
                                    986 ;	lib/src/stm8s_adc1.c: 679: ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
      008ABC C6 54 0C         [ 1]  987 	ld	a, 0x540c
      008ABF 6B 01            [ 1]  988 	ld	(0x01, sp), a
      008AC1 1D 00 08         [ 2]  989 	subw	x, #8
      008AC4 A6 01            [ 1]  990 	ld	a, #0x01
      008AC6 88               [ 1]  991 	push	a
      008AC7 9F               [ 1]  992 	ld	a, xl
      008AC8 4D               [ 1]  993 	tnz	a
      008AC9 27 05            [ 1]  994 	jreq	00126$
      008ACB                        995 00125$:
      008ACB 08 01            [ 1]  996 	sll	(1, sp)
      008ACD 4A               [ 1]  997 	dec	a
      008ACE 26 FB            [ 1]  998 	jrne	00125$
      008AD0                        999 00126$:
      008AD0 84               [ 1] 1000 	pop	a
      008AD1 43               [ 1] 1001 	cpl	a
      008AD2 14 01            [ 1] 1002 	and	a, (0x01, sp)
      008AD4 C7 54 0C         [ 1] 1003 	ld	0x540c, a
      008AD7 20 0C            [ 2] 1004 	jra	00107$
      008AD9                       1005 00105$:
                                   1006 ;	lib/src/stm8s_adc1.c: 684: ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
      008AD9 C6 54 00         [ 1] 1007 	ld	a, 0x5400
      008ADC 6B 01            [ 1] 1008 	ld	(0x01, sp), a
      008ADE 53               [ 2] 1009 	cplw	x
      008ADF 9F               [ 1] 1010 	ld	a, xl
      008AE0 14 01            [ 1] 1011 	and	a, (0x01, sp)
      008AE2 C7 54 00         [ 1] 1012 	ld	0x5400, a
      008AE5                       1013 00107$:
                                   1014 ;	lib/src/stm8s_adc1.c: 686: }
      008AE5 84               [ 1] 1015 	pop	a
      008AE6 81               [ 4] 1016 	ret
                                   1017 	.area CODE
                                   1018 	.area CONST
                                   1019 	.area INITIALIZER
                                   1020 	.area CABS (ABS)
