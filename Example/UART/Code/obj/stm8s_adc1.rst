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
      008A26                         73 _ADC1_DeInit:
                                     74 ;	lib/src/stm8s_adc1.c: 54: ADC1->CSR  = ADC1_CSR_RESET_VALUE;
      008A26 35 00 54 00      [ 1]   75 	mov	0x5400+0, #0x00
                                     76 ;	lib/src/stm8s_adc1.c: 55: ADC1->CR1  = ADC1_CR1_RESET_VALUE;
      008A2A 35 00 54 01      [ 1]   77 	mov	0x5401+0, #0x00
                                     78 ;	lib/src/stm8s_adc1.c: 56: ADC1->CR2  = ADC1_CR2_RESET_VALUE;
      008A2E 35 00 54 02      [ 1]   79 	mov	0x5402+0, #0x00
                                     80 ;	lib/src/stm8s_adc1.c: 57: ADC1->CR3  = ADC1_CR3_RESET_VALUE;
      008A32 35 00 54 03      [ 1]   81 	mov	0x5403+0, #0x00
                                     82 ;	lib/src/stm8s_adc1.c: 58: ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
      008A36 35 00 54 06      [ 1]   83 	mov	0x5406+0, #0x00
                                     84 ;	lib/src/stm8s_adc1.c: 59: ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
      008A3A 35 00 54 07      [ 1]   85 	mov	0x5407+0, #0x00
                                     86 ;	lib/src/stm8s_adc1.c: 60: ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
      008A3E 35 FF 54 08      [ 1]   87 	mov	0x5408+0, #0xff
                                     88 ;	lib/src/stm8s_adc1.c: 61: ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
      008A42 35 03 54 09      [ 1]   89 	mov	0x5409+0, #0x03
                                     90 ;	lib/src/stm8s_adc1.c: 62: ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
      008A46 35 00 54 0A      [ 1]   91 	mov	0x540a+0, #0x00
                                     92 ;	lib/src/stm8s_adc1.c: 63: ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
      008A4A 35 00 54 0B      [ 1]   93 	mov	0x540b+0, #0x00
                                     94 ;	lib/src/stm8s_adc1.c: 64: ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
      008A4E 35 00 54 0E      [ 1]   95 	mov	0x540e+0, #0x00
                                     96 ;	lib/src/stm8s_adc1.c: 65: ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
      008A52 35 00 54 0F      [ 1]   97 	mov	0x540f+0, #0x00
                                     98 ;	lib/src/stm8s_adc1.c: 66: }
      008A56 81               [ 4]   99 	ret
                                    100 ;	lib/src/stm8s_adc1.c: 88: void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
                                    101 ;	-----------------------------------------
                                    102 ;	 function ADC1_Init
                                    103 ;	-----------------------------------------
      008A57                        104 _ADC1_Init:
      008A57 97               [ 1]  105 	ld	xl, a
                                    106 ;	lib/src/stm8s_adc1.c: 103: ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
      008A58 7B 07            [ 1]  107 	ld	a, (0x07, sp)
      008A5A 88               [ 1]  108 	push	a
      008A5B 7B 04            [ 1]  109 	ld	a, (0x04, sp)
      008A5D 88               [ 1]  110 	push	a
      008A5E 9F               [ 1]  111 	ld	a, xl
      008A5F CD 8B 7A         [ 4]  112 	call	_ADC1_ConversionConfig
                                    113 ;	lib/src/stm8s_adc1.c: 105: ADC1_PrescalerConfig(ADC1_PrescalerSelection);
      008A62 7B 04            [ 1]  114 	ld	a, (0x04, sp)
      008A64 CD 8A EB         [ 4]  115 	call	_ADC1_PrescalerConfig
                                    116 ;	lib/src/stm8s_adc1.c: 110: ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
      008A67 7B 06            [ 1]  117 	ld	a, (0x06, sp)
      008A69 88               [ 1]  118 	push	a
      008A6A 7B 06            [ 1]  119 	ld	a, (0x06, sp)
      008A6C CD 8B B1         [ 4]  120 	call	_ADC1_ExternalTriggerConfig
                                    121 ;	lib/src/stm8s_adc1.c: 115: ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
      008A6F 7B 09            [ 1]  122 	ld	a, (0x09, sp)
      008A71 88               [ 1]  123 	push	a
      008A72 7B 09            [ 1]  124 	ld	a, (0x09, sp)
      008A74 CD 8B 00         [ 4]  125 	call	_ADC1_SchmittTriggerConfig
                                    126 ;	lib/src/stm8s_adc1.c: 118: ADC1->CR1 |= ADC1_CR1_ADON;
      008A77 C6 54 01         [ 1]  127 	ld	a, 0x5401
      008A7A AA 01            [ 1]  128 	or	a, #0x01
      008A7C C7 54 01         [ 1]  129 	ld	0x5401, a
                                    130 ;	lib/src/stm8s_adc1.c: 119: }
      008A7F 1E 01            [ 2]  131 	ldw	x, (1, sp)
      008A81 5B 09            [ 2]  132 	addw	sp, #9
      008A83 FC               [ 2]  133 	jp	(x)
                                    134 ;	lib/src/stm8s_adc1.c: 126: void ADC1_Cmd(FunctionalState NewState)
                                    135 ;	-----------------------------------------
                                    136 ;	 function ADC1_Cmd
                                    137 ;	-----------------------------------------
      008A84                        138 _ADC1_Cmd:
      008A84 88               [ 1]  139 	push	a
      008A85 6B 01            [ 1]  140 	ld	(0x01, sp), a
                                    141 ;	lib/src/stm8s_adc1.c: 133: ADC1->CR1 |= ADC1_CR1_ADON;
      008A87 C6 54 01         [ 1]  142 	ld	a, 0x5401
                                    143 ;	lib/src/stm8s_adc1.c: 131: if (NewState != DISABLE)
      008A8A 0D 01            [ 1]  144 	tnz	(0x01, sp)
      008A8C 27 07            [ 1]  145 	jreq	00102$
                                    146 ;	lib/src/stm8s_adc1.c: 133: ADC1->CR1 |= ADC1_CR1_ADON;
      008A8E AA 01            [ 1]  147 	or	a, #0x01
      008A90 C7 54 01         [ 1]  148 	ld	0x5401, a
      008A93 20 05            [ 2]  149 	jra	00104$
      008A95                        150 00102$:
                                    151 ;	lib/src/stm8s_adc1.c: 137: ADC1->CR1 &= (uint8_t)(~ADC1_CR1_ADON);
      008A95 A4 FE            [ 1]  152 	and	a, #0xfe
      008A97 C7 54 01         [ 1]  153 	ld	0x5401, a
      008A9A                        154 00104$:
                                    155 ;	lib/src/stm8s_adc1.c: 139: }
      008A9A 84               [ 1]  156 	pop	a
      008A9B 81               [ 4]  157 	ret
                                    158 ;	lib/src/stm8s_adc1.c: 146: void ADC1_ScanModeCmd(FunctionalState NewState)
                                    159 ;	-----------------------------------------
                                    160 ;	 function ADC1_ScanModeCmd
                                    161 ;	-----------------------------------------
      008A9C                        162 _ADC1_ScanModeCmd:
      008A9C 88               [ 1]  163 	push	a
      008A9D 6B 01            [ 1]  164 	ld	(0x01, sp), a
                                    165 ;	lib/src/stm8s_adc1.c: 153: ADC1->CR2 |= ADC1_CR2_SCAN;
      008A9F C6 54 02         [ 1]  166 	ld	a, 0x5402
                                    167 ;	lib/src/stm8s_adc1.c: 151: if (NewState != DISABLE)
      008AA2 0D 01            [ 1]  168 	tnz	(0x01, sp)
      008AA4 27 07            [ 1]  169 	jreq	00102$
                                    170 ;	lib/src/stm8s_adc1.c: 153: ADC1->CR2 |= ADC1_CR2_SCAN;
      008AA6 AA 02            [ 1]  171 	or	a, #0x02
      008AA8 C7 54 02         [ 1]  172 	ld	0x5402, a
      008AAB 20 05            [ 2]  173 	jra	00104$
      008AAD                        174 00102$:
                                    175 ;	lib/src/stm8s_adc1.c: 157: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_SCAN);
      008AAD A4 FD            [ 1]  176 	and	a, #0xfd
      008AAF C7 54 02         [ 1]  177 	ld	0x5402, a
      008AB2                        178 00104$:
                                    179 ;	lib/src/stm8s_adc1.c: 159: }
      008AB2 84               [ 1]  180 	pop	a
      008AB3 81               [ 4]  181 	ret
                                    182 ;	lib/src/stm8s_adc1.c: 166: void ADC1_DataBufferCmd(FunctionalState NewState)
                                    183 ;	-----------------------------------------
                                    184 ;	 function ADC1_DataBufferCmd
                                    185 ;	-----------------------------------------
      008AB4                        186 _ADC1_DataBufferCmd:
      008AB4 88               [ 1]  187 	push	a
      008AB5 6B 01            [ 1]  188 	ld	(0x01, sp), a
                                    189 ;	lib/src/stm8s_adc1.c: 173: ADC1->CR3 |= ADC1_CR3_DBUF;
      008AB7 C6 54 03         [ 1]  190 	ld	a, 0x5403
                                    191 ;	lib/src/stm8s_adc1.c: 171: if (NewState != DISABLE)
      008ABA 0D 01            [ 1]  192 	tnz	(0x01, sp)
      008ABC 27 07            [ 1]  193 	jreq	00102$
                                    194 ;	lib/src/stm8s_adc1.c: 173: ADC1->CR3 |= ADC1_CR3_DBUF;
      008ABE AA 80            [ 1]  195 	or	a, #0x80
      008AC0 C7 54 03         [ 1]  196 	ld	0x5403, a
      008AC3 20 05            [ 2]  197 	jra	00104$
      008AC5                        198 00102$:
                                    199 ;	lib/src/stm8s_adc1.c: 177: ADC1->CR3 &= (uint8_t)(~ADC1_CR3_DBUF);
      008AC5 A4 7F            [ 1]  200 	and	a, #0x7f
      008AC7 C7 54 03         [ 1]  201 	ld	0x5403, a
      008ACA                        202 00104$:
                                    203 ;	lib/src/stm8s_adc1.c: 179: }
      008ACA 84               [ 1]  204 	pop	a
      008ACB 81               [ 4]  205 	ret
                                    206 ;	lib/src/stm8s_adc1.c: 190: void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
                                    207 ;	-----------------------------------------
                                    208 ;	 function ADC1_ITConfig
                                    209 ;	-----------------------------------------
      008ACC                        210 _ADC1_ITConfig:
      008ACC 52 02            [ 2]  211 	sub	sp, #2
      008ACE 6B 02            [ 1]  212 	ld	(0x02, sp), a
                                    213 ;	lib/src/stm8s_adc1.c: 199: ADC1->CSR |= (uint8_t)ADC1_IT;
      008AD0 C6 54 00         [ 1]  214 	ld	a, 0x5400
      008AD3 6B 01            [ 1]  215 	ld	(0x01, sp), a
                                    216 ;	lib/src/stm8s_adc1.c: 196: if (NewState != DISABLE)
      008AD5 0D 02            [ 1]  217 	tnz	(0x02, sp)
      008AD7 27 08            [ 1]  218 	jreq	00102$
                                    219 ;	lib/src/stm8s_adc1.c: 199: ADC1->CSR |= (uint8_t)ADC1_IT;
      008AD9 9F               [ 1]  220 	ld	a, xl
      008ADA 1A 01            [ 1]  221 	or	a, (0x01, sp)
      008ADC C7 54 00         [ 1]  222 	ld	0x5400, a
      008ADF 20 07            [ 2]  223 	jra	00104$
      008AE1                        224 00102$:
                                    225 ;	lib/src/stm8s_adc1.c: 204: ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT);
      008AE1 53               [ 2]  226 	cplw	x
      008AE2 9F               [ 1]  227 	ld	a, xl
      008AE3 14 01            [ 1]  228 	and	a, (0x01, sp)
      008AE5 C7 54 00         [ 1]  229 	ld	0x5400, a
      008AE8                        230 00104$:
                                    231 ;	lib/src/stm8s_adc1.c: 206: }
      008AE8 5B 02            [ 2]  232 	addw	sp, #2
      008AEA 81               [ 4]  233 	ret
                                    234 ;	lib/src/stm8s_adc1.c: 214: void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
                                    235 ;	-----------------------------------------
                                    236 ;	 function ADC1_PrescalerConfig
                                    237 ;	-----------------------------------------
      008AEB                        238 _ADC1_PrescalerConfig:
      008AEB 88               [ 1]  239 	push	a
      008AEC 6B 01            [ 1]  240 	ld	(0x01, sp), a
                                    241 ;	lib/src/stm8s_adc1.c: 220: ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
      008AEE C6 54 01         [ 1]  242 	ld	a, 0x5401
      008AF1 A4 8F            [ 1]  243 	and	a, #0x8f
      008AF3 C7 54 01         [ 1]  244 	ld	0x5401, a
                                    245 ;	lib/src/stm8s_adc1.c: 222: ADC1->CR1 |= (uint8_t)(ADC1_Prescaler);
      008AF6 C6 54 01         [ 1]  246 	ld	a, 0x5401
      008AF9 1A 01            [ 1]  247 	or	a, (0x01, sp)
      008AFB C7 54 01         [ 1]  248 	ld	0x5401, a
                                    249 ;	lib/src/stm8s_adc1.c: 223: }
      008AFE 84               [ 1]  250 	pop	a
      008AFF 81               [ 4]  251 	ret
                                    252 ;	lib/src/stm8s_adc1.c: 233: void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
                                    253 ;	-----------------------------------------
                                    254 ;	 function ADC1_SchmittTriggerConfig
                                    255 ;	-----------------------------------------
      008B00                        256 _ADC1_SchmittTriggerConfig:
      008B00 88               [ 1]  257 	push	a
                                    258 ;	lib/src/stm8s_adc1.c: 239: if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
      008B01 97               [ 1]  259 	ld	xl, a
      008B02 4C               [ 1]  260 	inc	a
      008B03 26 21            [ 1]  261 	jrne	00114$
                                    262 ;	lib/src/stm8s_adc1.c: 243: ADC1->TDRL &= (uint8_t)0x0;
      008B05 C6 54 07         [ 1]  263 	ld	a, 0x5407
                                    264 ;	lib/src/stm8s_adc1.c: 241: if (NewState != DISABLE)
      008B08 0D 04            [ 1]  265 	tnz	(0x04, sp)
      008B0A 27 0D            [ 1]  266 	jreq	00102$
                                    267 ;	lib/src/stm8s_adc1.c: 243: ADC1->TDRL &= (uint8_t)0x0;
      008B0C 35 00 54 07      [ 1]  268 	mov	0x5407+0, #0x00
                                    269 ;	lib/src/stm8s_adc1.c: 244: ADC1->TDRH &= (uint8_t)0x0;
      008B10 C6 54 06         [ 1]  270 	ld	a, 0x5406
      008B13 35 00 54 06      [ 1]  271 	mov	0x5406+0, #0x00
      008B17 20 5D            [ 2]  272 	jra	00116$
      008B19                        273 00102$:
                                    274 ;	lib/src/stm8s_adc1.c: 248: ADC1->TDRL |= (uint8_t)0xFF;
      008B19 35 FF 54 07      [ 1]  275 	mov	0x5407+0, #0xff
                                    276 ;	lib/src/stm8s_adc1.c: 249: ADC1->TDRH |= (uint8_t)0xFF;
      008B1D C6 54 06         [ 1]  277 	ld	a, 0x5406
      008B20 35 FF 54 06      [ 1]  278 	mov	0x5406+0, #0xff
      008B24 20 50            [ 2]  279 	jra	00116$
      008B26                        280 00114$:
                                    281 ;	lib/src/stm8s_adc1.c: 252: else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
      008B26 9F               [ 1]  282 	ld	a, xl
      008B27 A1 08            [ 1]  283 	cp	a, #0x08
      008B29 24 25            [ 1]  284 	jrnc	00111$
                                    285 ;	lib/src/stm8s_adc1.c: 243: ADC1->TDRL &= (uint8_t)0x0;
      008B2B C6 54 07         [ 1]  286 	ld	a, 0x5407
      008B2E 6B 01            [ 1]  287 	ld	(0x01, sp), a
                                    288 ;	lib/src/stm8s_adc1.c: 256: ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
      008B30 A6 01            [ 1]  289 	ld	a, #0x01
      008B32 88               [ 1]  290 	push	a
      008B33 9F               [ 1]  291 	ld	a, xl
      008B34 4D               [ 1]  292 	tnz	a
      008B35 27 05            [ 1]  293 	jreq	00149$
      008B37                        294 00148$:
      008B37 08 01            [ 1]  295 	sll	(1, sp)
      008B39 4A               [ 1]  296 	dec	a
      008B3A 26 FB            [ 1]  297 	jrne	00148$
      008B3C                        298 00149$:
      008B3C 84               [ 1]  299 	pop	a
                                    300 ;	lib/src/stm8s_adc1.c: 254: if (NewState != DISABLE)
      008B3D 0D 04            [ 1]  301 	tnz	(0x04, sp)
      008B3F 27 08            [ 1]  302 	jreq	00105$
                                    303 ;	lib/src/stm8s_adc1.c: 256: ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
      008B41 43               [ 1]  304 	cpl	a
      008B42 14 01            [ 1]  305 	and	a, (0x01, sp)
      008B44 C7 54 07         [ 1]  306 	ld	0x5407, a
      008B47 20 2D            [ 2]  307 	jra	00116$
      008B49                        308 00105$:
                                    309 ;	lib/src/stm8s_adc1.c: 260: ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
      008B49 1A 01            [ 1]  310 	or	a, (0x01, sp)
      008B4B C7 54 07         [ 1]  311 	ld	0x5407, a
      008B4E 20 26            [ 2]  312 	jra	00116$
      008B50                        313 00111$:
                                    314 ;	lib/src/stm8s_adc1.c: 244: ADC1->TDRH &= (uint8_t)0x0;
      008B50 C6 54 06         [ 1]  315 	ld	a, 0x5406
      008B53 6B 01            [ 1]  316 	ld	(0x01, sp), a
                                    317 ;	lib/src/stm8s_adc1.c: 267: ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
      008B55 1D 00 08         [ 2]  318 	subw	x, #8
      008B58 A6 01            [ 1]  319 	ld	a, #0x01
      008B5A 88               [ 1]  320 	push	a
      008B5B 9F               [ 1]  321 	ld	a, xl
      008B5C 4D               [ 1]  322 	tnz	a
      008B5D 27 05            [ 1]  323 	jreq	00152$
      008B5F                        324 00151$:
      008B5F 08 01            [ 1]  325 	sll	(1, sp)
      008B61 4A               [ 1]  326 	dec	a
      008B62 26 FB            [ 1]  327 	jrne	00151$
      008B64                        328 00152$:
      008B64 84               [ 1]  329 	pop	a
                                    330 ;	lib/src/stm8s_adc1.c: 265: if (NewState != DISABLE)
      008B65 0D 04            [ 1]  331 	tnz	(0x04, sp)
      008B67 27 08            [ 1]  332 	jreq	00108$
                                    333 ;	lib/src/stm8s_adc1.c: 267: ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
      008B69 43               [ 1]  334 	cpl	a
      008B6A 14 01            [ 1]  335 	and	a, (0x01, sp)
      008B6C C7 54 06         [ 1]  336 	ld	0x5406, a
      008B6F 20 05            [ 2]  337 	jra	00116$
      008B71                        338 00108$:
                                    339 ;	lib/src/stm8s_adc1.c: 271: ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
      008B71 1A 01            [ 1]  340 	or	a, (0x01, sp)
      008B73 C7 54 06         [ 1]  341 	ld	0x5406, a
      008B76                        342 00116$:
                                    343 ;	lib/src/stm8s_adc1.c: 274: }
      008B76 84               [ 1]  344 	pop	a
      008B77 85               [ 2]  345 	popw	x
      008B78 84               [ 1]  346 	pop	a
      008B79 FC               [ 2]  347 	jp	(x)
                                    348 ;	lib/src/stm8s_adc1.c: 286: void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
                                    349 ;	-----------------------------------------
                                    350 ;	 function ADC1_ConversionConfig
                                    351 ;	-----------------------------------------
      008B7A                        352 _ADC1_ConversionConfig:
      008B7A 88               [ 1]  353 	push	a
      008B7B 6B 01            [ 1]  354 	ld	(0x01, sp), a
                                    355 ;	lib/src/stm8s_adc1.c: 294: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
      008B7D 72 17 54 02      [ 1]  356 	bres	0x5402, #3
                                    357 ;	lib/src/stm8s_adc1.c: 296: ADC1->CR2 |= (uint8_t)(ADC1_Align);
      008B81 C6 54 02         [ 1]  358 	ld	a, 0x5402
      008B84 1A 05            [ 1]  359 	or	a, (0x05, sp)
      008B86 C7 54 02         [ 1]  360 	ld	0x5402, a
                                    361 ;	lib/src/stm8s_adc1.c: 301: ADC1->CR1 |= ADC1_CR1_CONT;
      008B89 C6 54 01         [ 1]  362 	ld	a, 0x5401
                                    363 ;	lib/src/stm8s_adc1.c: 298: if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
      008B8C 0D 01            [ 1]  364 	tnz	(0x01, sp)
      008B8E 27 07            [ 1]  365 	jreq	00102$
                                    366 ;	lib/src/stm8s_adc1.c: 301: ADC1->CR1 |= ADC1_CR1_CONT;
      008B90 AA 02            [ 1]  367 	or	a, #0x02
      008B92 C7 54 01         [ 1]  368 	ld	0x5401, a
      008B95 20 05            [ 2]  369 	jra	00103$
      008B97                        370 00102$:
                                    371 ;	lib/src/stm8s_adc1.c: 306: ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
      008B97 A4 FD            [ 1]  372 	and	a, #0xfd
      008B99 C7 54 01         [ 1]  373 	ld	0x5401, a
      008B9C                        374 00103$:
                                    375 ;	lib/src/stm8s_adc1.c: 310: ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
      008B9C C6 54 00         [ 1]  376 	ld	a, 0x5400
      008B9F A4 F0            [ 1]  377 	and	a, #0xf0
      008BA1 C7 54 00         [ 1]  378 	ld	0x5400, a
                                    379 ;	lib/src/stm8s_adc1.c: 312: ADC1->CSR |= (uint8_t)(ADC1_Channel);
      008BA4 C6 54 00         [ 1]  380 	ld	a, 0x5400
      008BA7 1A 04            [ 1]  381 	or	a, (0x04, sp)
      008BA9 C7 54 00         [ 1]  382 	ld	0x5400, a
                                    383 ;	lib/src/stm8s_adc1.c: 313: }
      008BAC 1E 02            [ 2]  384 	ldw	x, (2, sp)
      008BAE 5B 05            [ 2]  385 	addw	sp, #5
      008BB0 FC               [ 2]  386 	jp	(x)
                                    387 ;	lib/src/stm8s_adc1.c: 325: void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
                                    388 ;	-----------------------------------------
                                    389 ;	 function ADC1_ExternalTriggerConfig
                                    390 ;	-----------------------------------------
      008BB1                        391 _ADC1_ExternalTriggerConfig:
      008BB1 88               [ 1]  392 	push	a
      008BB2 6B 01            [ 1]  393 	ld	(0x01, sp), a
                                    394 ;	lib/src/stm8s_adc1.c: 332: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
      008BB4 C6 54 02         [ 1]  395 	ld	a, 0x5402
      008BB7 A4 CF            [ 1]  396 	and	a, #0xcf
      008BB9 C7 54 02         [ 1]  397 	ld	0x5402, a
      008BBC C6 54 02         [ 1]  398 	ld	a, 0x5402
                                    399 ;	lib/src/stm8s_adc1.c: 334: if (NewState != DISABLE)
      008BBF 0D 04            [ 1]  400 	tnz	(0x04, sp)
      008BC1 27 07            [ 1]  401 	jreq	00102$
                                    402 ;	lib/src/stm8s_adc1.c: 337: ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
      008BC3 AA 40            [ 1]  403 	or	a, #0x40
      008BC5 C7 54 02         [ 1]  404 	ld	0x5402, a
      008BC8 20 05            [ 2]  405 	jra	00103$
      008BCA                        406 00102$:
                                    407 ;	lib/src/stm8s_adc1.c: 342: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
      008BCA A4 BF            [ 1]  408 	and	a, #0xbf
      008BCC C7 54 02         [ 1]  409 	ld	0x5402, a
      008BCF                        410 00103$:
                                    411 ;	lib/src/stm8s_adc1.c: 346: ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
      008BCF C6 54 02         [ 1]  412 	ld	a, 0x5402
      008BD2 1A 01            [ 1]  413 	or	a, (0x01, sp)
      008BD4 C7 54 02         [ 1]  414 	ld	0x5402, a
                                    415 ;	lib/src/stm8s_adc1.c: 347: }
      008BD7 84               [ 1]  416 	pop	a
      008BD8 85               [ 2]  417 	popw	x
      008BD9 84               [ 1]  418 	pop	a
      008BDA FC               [ 2]  419 	jp	(x)
                                    420 ;	lib/src/stm8s_adc1.c: 358: void ADC1_StartConversion(void)
                                    421 ;	-----------------------------------------
                                    422 ;	 function ADC1_StartConversion
                                    423 ;	-----------------------------------------
      008BDB                        424 _ADC1_StartConversion:
                                    425 ;	lib/src/stm8s_adc1.c: 360: ADC1->CR1 |= ADC1_CR1_ADON;
      008BDB 72 10 54 01      [ 1]  426 	bset	0x5401, #0
                                    427 ;	lib/src/stm8s_adc1.c: 361: }
      008BDF 81               [ 4]  428 	ret
                                    429 ;	lib/src/stm8s_adc1.c: 370: uint16_t ADC1_GetConversionValue(void)
                                    430 ;	-----------------------------------------
                                    431 ;	 function ADC1_GetConversionValue
                                    432 ;	-----------------------------------------
      008BE0                        433 _ADC1_GetConversionValue:
      008BE0 52 06            [ 2]  434 	sub	sp, #6
                                    435 ;	lib/src/stm8s_adc1.c: 375: if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
      008BE2 72 07 54 02 14   [ 2]  436 	btjf	0x5402, #3, 00102$
                                    437 ;	lib/src/stm8s_adc1.c: 378: templ = ADC1->DRL;
      008BE7 C6 54 05         [ 1]  438 	ld	a, 0x5405
      008BEA 97               [ 1]  439 	ld	xl, a
                                    440 ;	lib/src/stm8s_adc1.c: 380: temph = ADC1->DRH;
      008BEB C6 54 04         [ 1]  441 	ld	a, 0x5404
                                    442 ;	lib/src/stm8s_adc1.c: 382: temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
      008BEE 0F 02            [ 1]  443 	clr	(0x02, sp)
      008BF0 0F 03            [ 1]  444 	clr	(0x03, sp)
      008BF2 1A 03            [ 1]  445 	or	a, (0x03, sp)
      008BF4 01               [ 1]  446 	rrwa	x
      008BF5 1A 02            [ 1]  447 	or	a, (0x02, sp)
      008BF7 6B 06            [ 1]  448 	ld	(0x06, sp), a
      008BF9 20 1D            [ 2]  449 	jra	00103$
      008BFB                        450 00102$:
                                    451 ;	lib/src/stm8s_adc1.c: 387: temph = ADC1->DRH;
      008BFB C6 54 04         [ 1]  452 	ld	a, 0x5404
      008BFE 90 5F            [ 1]  453 	clrw	y
      008C00 90 97            [ 1]  454 	ld	yl, a
                                    455 ;	lib/src/stm8s_adc1.c: 389: templ = ADC1->DRL;
      008C02 C6 54 05         [ 1]  456 	ld	a, 0x5405
                                    457 ;	lib/src/stm8s_adc1.c: 391: temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
      008C05 5F               [ 1]  458 	clrw	x
      008C06 97               [ 1]  459 	ld	xl, a
      008C07 58               [ 2]  460 	sllw	x
      008C08 58               [ 2]  461 	sllw	x
      008C09 58               [ 2]  462 	sllw	x
      008C0A 58               [ 2]  463 	sllw	x
      008C0B 58               [ 2]  464 	sllw	x
      008C0C 58               [ 2]  465 	sllw	x
      008C0D 1F 03            [ 2]  466 	ldw	(0x03, sp), x
      008C0F 7B 04            [ 1]  467 	ld	a, (0x04, sp)
      008C11 6B 06            [ 1]  468 	ld	(0x06, sp), a
      008C13 90 9F            [ 1]  469 	ld	a, yl
      008C15 1A 03            [ 1]  470 	or	a, (0x03, sp)
      008C17 95               [ 1]  471 	ld	xh, a
      008C18                        472 00103$:
                                    473 ;	lib/src/stm8s_adc1.c: 394: return ((uint16_t)temph);
      008C18 7B 06            [ 1]  474 	ld	a, (0x06, sp)
      008C1A 97               [ 1]  475 	ld	xl, a
                                    476 ;	lib/src/stm8s_adc1.c: 395: }
      008C1B 5B 06            [ 2]  477 	addw	sp, #6
      008C1D 81               [ 4]  478 	ret
                                    479 ;	lib/src/stm8s_adc1.c: 405: void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
                                    480 ;	-----------------------------------------
                                    481 ;	 function ADC1_AWDChannelConfig
                                    482 ;	-----------------------------------------
      008C1E                        483 _ADC1_AWDChannelConfig:
      008C1E 88               [ 1]  484 	push	a
                                    485 ;	lib/src/stm8s_adc1.c: 411: if (Channel < (uint8_t)8)
      008C1F 97               [ 1]  486 	ld	xl, a
      008C20 A1 08            [ 1]  487 	cp	a, #0x08
      008C22 24 25            [ 1]  488 	jrnc	00108$
                                    489 ;	lib/src/stm8s_adc1.c: 415: ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
      008C24 C6 54 0F         [ 1]  490 	ld	a, 0x540f
      008C27 6B 01            [ 1]  491 	ld	(0x01, sp), a
      008C29 A6 01            [ 1]  492 	ld	a, #0x01
      008C2B 88               [ 1]  493 	push	a
      008C2C 9F               [ 1]  494 	ld	a, xl
      008C2D 4D               [ 1]  495 	tnz	a
      008C2E 27 05            [ 1]  496 	jreq	00129$
      008C30                        497 00128$:
      008C30 08 01            [ 1]  498 	sll	(1, sp)
      008C32 4A               [ 1]  499 	dec	a
      008C33 26 FB            [ 1]  500 	jrne	00128$
      008C35                        501 00129$:
      008C35 84               [ 1]  502 	pop	a
                                    503 ;	lib/src/stm8s_adc1.c: 413: if (NewState != DISABLE)
      008C36 0D 04            [ 1]  504 	tnz	(0x04, sp)
      008C38 27 07            [ 1]  505 	jreq	00102$
                                    506 ;	lib/src/stm8s_adc1.c: 415: ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
      008C3A 1A 01            [ 1]  507 	or	a, (0x01, sp)
      008C3C C7 54 0F         [ 1]  508 	ld	0x540f, a
      008C3F 20 2E            [ 2]  509 	jra	00110$
      008C41                        510 00102$:
                                    511 ;	lib/src/stm8s_adc1.c: 419: ADC1->AWCRL &= (uint8_t)~(uint8_t)((uint8_t)1 << Channel);
      008C41 43               [ 1]  512 	cpl	a
      008C42 14 01            [ 1]  513 	and	a, (0x01, sp)
      008C44 C7 54 0F         [ 1]  514 	ld	0x540f, a
      008C47 20 26            [ 2]  515 	jra	00110$
      008C49                        516 00108$:
                                    517 ;	lib/src/stm8s_adc1.c: 426: ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
      008C49 C6 54 0E         [ 1]  518 	ld	a, 0x540e
      008C4C 6B 01            [ 1]  519 	ld	(0x01, sp), a
      008C4E 1D 00 08         [ 2]  520 	subw	x, #8
      008C51 A6 01            [ 1]  521 	ld	a, #0x01
      008C53 88               [ 1]  522 	push	a
      008C54 9F               [ 1]  523 	ld	a, xl
      008C55 4D               [ 1]  524 	tnz	a
      008C56 27 05            [ 1]  525 	jreq	00132$
      008C58                        526 00131$:
      008C58 08 01            [ 1]  527 	sll	(1, sp)
      008C5A 4A               [ 1]  528 	dec	a
      008C5B 26 FB            [ 1]  529 	jrne	00131$
      008C5D                        530 00132$:
      008C5D 84               [ 1]  531 	pop	a
                                    532 ;	lib/src/stm8s_adc1.c: 424: if (NewState != DISABLE)
      008C5E 0D 04            [ 1]  533 	tnz	(0x04, sp)
      008C60 27 07            [ 1]  534 	jreq	00105$
                                    535 ;	lib/src/stm8s_adc1.c: 426: ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
      008C62 1A 01            [ 1]  536 	or	a, (0x01, sp)
      008C64 C7 54 0E         [ 1]  537 	ld	0x540e, a
      008C67 20 06            [ 2]  538 	jra	00110$
      008C69                        539 00105$:
                                    540 ;	lib/src/stm8s_adc1.c: 430: ADC1->AWCRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (uint8_t)(Channel - (uint8_t)8));
      008C69 43               [ 1]  541 	cpl	a
      008C6A 14 01            [ 1]  542 	and	a, (0x01, sp)
      008C6C C7 54 0E         [ 1]  543 	ld	0x540e, a
      008C6F                        544 00110$:
                                    545 ;	lib/src/stm8s_adc1.c: 433: }
      008C6F 84               [ 1]  546 	pop	a
      008C70 85               [ 2]  547 	popw	x
      008C71 84               [ 1]  548 	pop	a
      008C72 FC               [ 2]  549 	jp	(x)
                                    550 ;	lib/src/stm8s_adc1.c: 441: void ADC1_SetHighThreshold(uint16_t Threshold)
                                    551 ;	-----------------------------------------
                                    552 ;	 function ADC1_SetHighThreshold
                                    553 ;	-----------------------------------------
      008C73                        554 _ADC1_SetHighThreshold:
                                    555 ;	lib/src/stm8s_adc1.c: 443: ADC1->HTRH = (uint8_t)(Threshold >> (uint8_t)2);
      008C73 90 93            [ 1]  556 	ldw	y, x
      008C75 54               [ 2]  557 	srlw	x
      008C76 54               [ 2]  558 	srlw	x
      008C77 9F               [ 1]  559 	ld	a, xl
      008C78 C7 54 08         [ 1]  560 	ld	0x5408, a
                                    561 ;	lib/src/stm8s_adc1.c: 444: ADC1->HTRL = (uint8_t)Threshold;
      008C7B 90 9F            [ 1]  562 	ld	a, yl
      008C7D C7 54 09         [ 1]  563 	ld	0x5409, a
                                    564 ;	lib/src/stm8s_adc1.c: 445: }
      008C80 81               [ 4]  565 	ret
                                    566 ;	lib/src/stm8s_adc1.c: 453: void ADC1_SetLowThreshold(uint16_t Threshold)
                                    567 ;	-----------------------------------------
                                    568 ;	 function ADC1_SetLowThreshold
                                    569 ;	-----------------------------------------
      008C81                        570 _ADC1_SetLowThreshold:
                                    571 ;	lib/src/stm8s_adc1.c: 455: ADC1->LTRL = (uint8_t)Threshold;
      008C81 9F               [ 1]  572 	ld	a, xl
      008C82 C7 54 0B         [ 1]  573 	ld	0x540b, a
                                    574 ;	lib/src/stm8s_adc1.c: 456: ADC1->LTRH = (uint8_t)(Threshold >> (uint8_t)2);
      008C85 54               [ 2]  575 	srlw	x
      008C86 54               [ 2]  576 	srlw	x
      008C87 9F               [ 1]  577 	ld	a, xl
      008C88 C7 54 0A         [ 1]  578 	ld	0x540a, a
                                    579 ;	lib/src/stm8s_adc1.c: 457: }
      008C8B 81               [ 4]  580 	ret
                                    581 ;	lib/src/stm8s_adc1.c: 466: uint16_t ADC1_GetBufferValue(uint8_t Buffer)
                                    582 ;	-----------------------------------------
                                    583 ;	 function ADC1_GetBufferValue
                                    584 ;	-----------------------------------------
      008C8C                        585 _ADC1_GetBufferValue:
      008C8C 52 06            [ 2]  586 	sub	sp, #6
      008C8E 97               [ 1]  587 	ld	xl, a
                                    588 ;	lib/src/stm8s_adc1.c: 474: if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
      008C8F C6 54 02         [ 1]  589 	ld	a, 0x5402
      008C92 6B 03            [ 1]  590 	ld	(0x03, sp), a
                                    591 ;	lib/src/stm8s_adc1.c: 477: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
      008C94 58               [ 2]  592 	sllw	x
      008C95 4F               [ 1]  593 	clr	a
      008C96 95               [ 1]  594 	ld	xh, a
      008C97 90 93            [ 1]  595 	ldw	y, x
      008C99 72 A9 53 E1      [ 2]  596 	addw	y, #0x53e1
                                    597 ;	lib/src/stm8s_adc1.c: 479: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
      008C9D 1C 53 E0         [ 2]  598 	addw	x, #0x53e0
                                    599 ;	lib/src/stm8s_adc1.c: 477: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
                                    600 ;	lib/src/stm8s_adc1.c: 479: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
                                    601 ;	lib/src/stm8s_adc1.c: 477: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
      008CA0 90 F6            [ 1]  602 	ld	a, (y)
      008CA2 6B 06            [ 1]  603 	ld	(0x06, sp), a
                                    604 ;	lib/src/stm8s_adc1.c: 479: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
      008CA4 F6               [ 1]  605 	ld	a, (x)
      008CA5 6B 05            [ 1]  606 	ld	(0x05, sp), a
      008CA7 0F 04            [ 1]  607 	clr	(0x04, sp)
                                    608 ;	lib/src/stm8s_adc1.c: 474: if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
      008CA9 7B 03            [ 1]  609 	ld	a, (0x03, sp)
      008CAB A5 08            [ 1]  610 	bcp	a, #0x08
      008CAD 27 1A            [ 1]  611 	jreq	00102$
                                    612 ;	lib/src/stm8s_adc1.c: 477: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
                                    613 ;	lib/src/stm8s_adc1.c: 479: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
      008CAF 16 04            [ 2]  614 	ldw	y, (0x04, sp)
      008CB1 17 01            [ 2]  615 	ldw	(0x01, sp), y
                                    616 ;	lib/src/stm8s_adc1.c: 481: temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
      008CB3 7B 02            [ 1]  617 	ld	a, (0x02, sp)
      008CB5 6B 03            [ 1]  618 	ld	(0x03, sp), a
      008CB7 0F 04            [ 1]  619 	clr	(0x04, sp)
      008CB9 0F 05            [ 1]  620 	clr	(0x05, sp)
      008CBB 7B 06            [ 1]  621 	ld	a, (0x06, sp)
      008CBD 1A 04            [ 1]  622 	or	a, (0x04, sp)
      008CBF 6B 02            [ 1]  623 	ld	(0x02, sp), a
      008CC1 7B 05            [ 1]  624 	ld	a, (0x05, sp)
      008CC3 1A 03            [ 1]  625 	or	a, (0x03, sp)
      008CC5 6B 01            [ 1]  626 	ld	(0x01, sp), a
      008CC7 20 1C            [ 2]  627 	jra	00103$
      008CC9                        628 00102$:
                                    629 ;	lib/src/stm8s_adc1.c: 486: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
      008CC9 16 04            [ 2]  630 	ldw	y, (0x04, sp)
                                    631 ;	lib/src/stm8s_adc1.c: 488: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
      008CCB 7B 06            [ 1]  632 	ld	a, (0x06, sp)
                                    633 ;	lib/src/stm8s_adc1.c: 490: temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)(temph << 8));
      008CCD 5F               [ 1]  634 	clrw	x
      008CCE 97               [ 1]  635 	ld	xl, a
      008CCF 58               [ 2]  636 	sllw	x
      008CD0 58               [ 2]  637 	sllw	x
      008CD1 58               [ 2]  638 	sllw	x
      008CD2 58               [ 2]  639 	sllw	x
      008CD3 58               [ 2]  640 	sllw	x
      008CD4 58               [ 2]  641 	sllw	x
      008CD5 1F 03            [ 2]  642 	ldw	(0x03, sp), x
      008CD7 90 9F            [ 1]  643 	ld	a, yl
      008CD9 0F 06            [ 1]  644 	clr	(0x06, sp)
      008CDB 1A 03            [ 1]  645 	or	a, (0x03, sp)
      008CDD 6B 01            [ 1]  646 	ld	(0x01, sp), a
      008CDF 7B 04            [ 1]  647 	ld	a, (0x04, sp)
      008CE1 1A 06            [ 1]  648 	or	a, (0x06, sp)
      008CE3 6B 02            [ 1]  649 	ld	(0x02, sp), a
      008CE5                        650 00103$:
                                    651 ;	lib/src/stm8s_adc1.c: 493: return ((uint16_t)temph);
      008CE5 1E 01            [ 2]  652 	ldw	x, (0x01, sp)
                                    653 ;	lib/src/stm8s_adc1.c: 494: }
      008CE7 5B 06            [ 2]  654 	addw	sp, #6
      008CE9 81               [ 4]  655 	ret
                                    656 ;	lib/src/stm8s_adc1.c: 502: FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
                                    657 ;	-----------------------------------------
                                    658 ;	 function ADC1_GetAWDChannelStatus
                                    659 ;	-----------------------------------------
      008CEA                        660 _ADC1_GetAWDChannelStatus:
      008CEA 88               [ 1]  661 	push	a
                                    662 ;	lib/src/stm8s_adc1.c: 509: if (Channel < (uint8_t)8)
      008CEB 97               [ 1]  663 	ld	xl, a
      008CEC A1 08            [ 1]  664 	cp	a, #0x08
      008CEE 24 16            [ 1]  665 	jrnc	00102$
                                    666 ;	lib/src/stm8s_adc1.c: 511: status = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << Channel));
      008CF0 C6 54 0D         [ 1]  667 	ld	a, 0x540d
      008CF3 88               [ 1]  668 	push	a
      008CF4 A6 01            [ 1]  669 	ld	a, #0x01
      008CF6 6B 02            [ 1]  670 	ld	(0x02, sp), a
      008CF8 9F               [ 1]  671 	ld	a, xl
      008CF9 4D               [ 1]  672 	tnz	a
      008CFA 27 05            [ 1]  673 	jreq	00113$
      008CFC                        674 00112$:
      008CFC 08 02            [ 1]  675 	sll	(0x02, sp)
      008CFE 4A               [ 1]  676 	dec	a
      008CFF 26 FB            [ 1]  677 	jrne	00112$
      008D01                        678 00113$:
      008D01 84               [ 1]  679 	pop	a
      008D02 14 01            [ 1]  680 	and	a, (0x01, sp)
      008D04 20 17            [ 2]  681 	jra	00103$
      008D06                        682 00102$:
                                    683 ;	lib/src/stm8s_adc1.c: 515: status = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8)));
      008D06 C6 54 0C         [ 1]  684 	ld	a, 0x540c
      008D09 6B 01            [ 1]  685 	ld	(0x01, sp), a
      008D0B 1D 00 08         [ 2]  686 	subw	x, #8
      008D0E A6 01            [ 1]  687 	ld	a, #0x01
      008D10 88               [ 1]  688 	push	a
      008D11 9F               [ 1]  689 	ld	a, xl
      008D12 4D               [ 1]  690 	tnz	a
      008D13 27 05            [ 1]  691 	jreq	00115$
      008D15                        692 00114$:
      008D15 08 01            [ 1]  693 	sll	(1, sp)
      008D17 4A               [ 1]  694 	dec	a
      008D18 26 FB            [ 1]  695 	jrne	00114$
      008D1A                        696 00115$:
      008D1A 84               [ 1]  697 	pop	a
      008D1B 14 01            [ 1]  698 	and	a, (0x01, sp)
      008D1D                        699 00103$:
                                    700 ;	lib/src/stm8s_adc1.c: 518: return ((FlagStatus)status);
      008D1D 40               [ 1]  701 	neg	a
      008D1E 4F               [ 1]  702 	clr	a
      008D1F 49               [ 1]  703 	rlc	a
                                    704 ;	lib/src/stm8s_adc1.c: 519: }
      008D20 5B 01            [ 2]  705 	addw	sp, #1
      008D22 81               [ 4]  706 	ret
                                    707 ;	lib/src/stm8s_adc1.c: 527: FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
                                    708 ;	-----------------------------------------
                                    709 ;	 function ADC1_GetFlagStatus
                                    710 ;	-----------------------------------------
      008D23                        711 _ADC1_GetFlagStatus:
      008D23 52 03            [ 2]  712 	sub	sp, #3
                                    713 ;	lib/src/stm8s_adc1.c: 535: if ((Flag & 0x0F) == 0x01)
      008D25 6B 03            [ 1]  714 	ld	(0x03, sp), a
      008D27 6B 02            [ 1]  715 	ld	(0x02, sp), a
      008D29 0F 01            [ 1]  716 	clr	(0x01, sp)
      008D2B 5F               [ 1]  717 	clrw	x
      008D2C 7B 02            [ 1]  718 	ld	a, (0x02, sp)
      008D2E A4 0F            [ 1]  719 	and	a, #0x0f
      008D30 97               [ 1]  720 	ld	xl, a
      008D31 5A               [ 2]  721 	decw	x
      008D32 26 07            [ 1]  722 	jrne	00108$
                                    723 ;	lib/src/stm8s_adc1.c: 538: flagstatus = (uint8_t)(ADC1->CR3 & ADC1_CR3_OVR);
      008D34 C6 54 03         [ 1]  724 	ld	a, 0x5403
      008D37 A4 40            [ 1]  725 	and	a, #0x40
      008D39 20 48            [ 2]  726 	jra	00109$
      008D3B                        727 00108$:
                                    728 ;	lib/src/stm8s_adc1.c: 540: else if ((Flag & 0xF0) == 0x10)
      008D3B 5F               [ 1]  729 	clrw	x
      008D3C 7B 02            [ 1]  730 	ld	a, (0x02, sp)
      008D3E A4 F0            [ 1]  731 	and	a, #0xf0
      008D40 97               [ 1]  732 	ld	xl, a
      008D41 A3 00 10         [ 2]  733 	cpw	x, #0x0010
      008D44 26 38            [ 1]  734 	jrne	00105$
                                    735 ;	lib/src/stm8s_adc1.c: 543: temp = (uint8_t)(Flag & (uint8_t)0x0F);
      008D46 7B 03            [ 1]  736 	ld	a, (0x03, sp)
      008D48 A4 0F            [ 1]  737 	and	a, #0x0f
                                    738 ;	lib/src/stm8s_adc1.c: 544: if (temp < 8)
      008D4A 97               [ 1]  739 	ld	xl, a
      008D4B A1 08            [ 1]  740 	cp	a, #0x08
      008D4D 24 16            [ 1]  741 	jrnc	00102$
                                    742 ;	lib/src/stm8s_adc1.c: 546: flagstatus = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
      008D4F C6 54 0D         [ 1]  743 	ld	a, 0x540d
      008D52 6B 02            [ 1]  744 	ld	(0x02, sp), a
      008D54 A6 01            [ 1]  745 	ld	a, #0x01
      008D56 88               [ 1]  746 	push	a
      008D57 9F               [ 1]  747 	ld	a, xl
      008D58 4D               [ 1]  748 	tnz	a
      008D59 27 05            [ 1]  749 	jreq	00135$
      008D5B                        750 00134$:
      008D5B 08 01            [ 1]  751 	sll	(1, sp)
      008D5D 4A               [ 1]  752 	dec	a
      008D5E 26 FB            [ 1]  753 	jrne	00134$
      008D60                        754 00135$:
      008D60 84               [ 1]  755 	pop	a
      008D61 14 02            [ 1]  756 	and	a, (0x02, sp)
      008D63 20 1E            [ 2]  757 	jra	00109$
      008D65                        758 00102$:
                                    759 ;	lib/src/stm8s_adc1.c: 550: flagstatus = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
      008D65 C6 54 0C         [ 1]  760 	ld	a, 0x540c
      008D68 6B 02            [ 1]  761 	ld	(0x02, sp), a
      008D6A 1D 00 08         [ 2]  762 	subw	x, #8
      008D6D A6 01            [ 1]  763 	ld	a, #0x01
      008D6F 88               [ 1]  764 	push	a
      008D70 9F               [ 1]  765 	ld	a, xl
      008D71 4D               [ 1]  766 	tnz	a
      008D72 27 05            [ 1]  767 	jreq	00137$
      008D74                        768 00136$:
      008D74 08 01            [ 1]  769 	sll	(1, sp)
      008D76 4A               [ 1]  770 	dec	a
      008D77 26 FB            [ 1]  771 	jrne	00136$
      008D79                        772 00137$:
      008D79 84               [ 1]  773 	pop	a
      008D7A 14 02            [ 1]  774 	and	a, (0x02, sp)
      008D7C 20 05            [ 2]  775 	jra	00109$
      008D7E                        776 00105$:
                                    777 ;	lib/src/stm8s_adc1.c: 555: flagstatus = (uint8_t)(ADC1->CSR & Flag);
      008D7E C6 54 00         [ 1]  778 	ld	a, 0x5400
      008D81 14 03            [ 1]  779 	and	a, (0x03, sp)
      008D83                        780 00109$:
                                    781 ;	lib/src/stm8s_adc1.c: 557: return ((FlagStatus)flagstatus);
      008D83 40               [ 1]  782 	neg	a
      008D84 4F               [ 1]  783 	clr	a
      008D85 49               [ 1]  784 	rlc	a
                                    785 ;	lib/src/stm8s_adc1.c: 559: }
      008D86 5B 03            [ 2]  786 	addw	sp, #3
      008D88 81               [ 4]  787 	ret
                                    788 ;	lib/src/stm8s_adc1.c: 567: void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
                                    789 ;	-----------------------------------------
                                    790 ;	 function ADC1_ClearFlag
                                    791 ;	-----------------------------------------
      008D89                        792 _ADC1_ClearFlag:
      008D89 52 03            [ 2]  793 	sub	sp, #3
                                    794 ;	lib/src/stm8s_adc1.c: 574: if ((Flag & 0x0F) == 0x01)
      008D8B 6B 03            [ 1]  795 	ld	(0x03, sp), a
      008D8D 0F 01            [ 1]  796 	clr	(0x01, sp)
      008D8F 88               [ 1]  797 	push	a
      008D90 A4 0F            [ 1]  798 	and	a, #0x0f
      008D92 97               [ 1]  799 	ld	xl, a
      008D93 4F               [ 1]  800 	clr	a
      008D94 95               [ 1]  801 	ld	xh, a
      008D95 84               [ 1]  802 	pop	a
      008D96 5A               [ 2]  803 	decw	x
      008D97 26 06            [ 1]  804 	jrne	00108$
                                    805 ;	lib/src/stm8s_adc1.c: 577: ADC1->CR3 &= (uint8_t)(~ADC1_CR3_OVR);
      008D99 72 1D 54 03      [ 1]  806 	bres	0x5403, #6
      008D9D 20 57            [ 2]  807 	jra	00110$
      008D9F                        808 00108$:
                                    809 ;	lib/src/stm8s_adc1.c: 579: else if ((Flag & 0xF0) == 0x10)
      008D9F A4 F0            [ 1]  810 	and	a, #0xf0
      008DA1 97               [ 1]  811 	ld	xl, a
      008DA2 4F               [ 1]  812 	clr	a
      008DA3 95               [ 1]  813 	ld	xh, a
      008DA4 A3 00 10         [ 2]  814 	cpw	x, #0x0010
      008DA7 26 40            [ 1]  815 	jrne	00105$
                                    816 ;	lib/src/stm8s_adc1.c: 582: temp = (uint8_t)(Flag & (uint8_t)0x0F);
      008DA9 7B 03            [ 1]  817 	ld	a, (0x03, sp)
      008DAB A4 0F            [ 1]  818 	and	a, #0x0f
                                    819 ;	lib/src/stm8s_adc1.c: 583: if (temp < 8)
      008DAD 97               [ 1]  820 	ld	xl, a
      008DAE A1 08            [ 1]  821 	cp	a, #0x08
      008DB0 24 1A            [ 1]  822 	jrnc	00102$
                                    823 ;	lib/src/stm8s_adc1.c: 585: ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
      008DB2 C6 54 0D         [ 1]  824 	ld	a, 0x540d
      008DB5 6B 02            [ 1]  825 	ld	(0x02, sp), a
      008DB7 A6 01            [ 1]  826 	ld	a, #0x01
      008DB9 88               [ 1]  827 	push	a
      008DBA 9F               [ 1]  828 	ld	a, xl
      008DBB 4D               [ 1]  829 	tnz	a
      008DBC 27 05            [ 1]  830 	jreq	00135$
      008DBE                        831 00134$:
      008DBE 08 01            [ 1]  832 	sll	(1, sp)
      008DC0 4A               [ 1]  833 	dec	a
      008DC1 26 FB            [ 1]  834 	jrne	00134$
      008DC3                        835 00135$:
      008DC3 84               [ 1]  836 	pop	a
      008DC4 43               [ 1]  837 	cpl	a
      008DC5 14 02            [ 1]  838 	and	a, (0x02, sp)
      008DC7 C7 54 0D         [ 1]  839 	ld	0x540d, a
      008DCA 20 2A            [ 2]  840 	jra	00110$
      008DCC                        841 00102$:
                                    842 ;	lib/src/stm8s_adc1.c: 589: ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
      008DCC C6 54 0C         [ 1]  843 	ld	a, 0x540c
      008DCF 6B 02            [ 1]  844 	ld	(0x02, sp), a
      008DD1 1D 00 08         [ 2]  845 	subw	x, #8
      008DD4 A6 01            [ 1]  846 	ld	a, #0x01
      008DD6 88               [ 1]  847 	push	a
      008DD7 9F               [ 1]  848 	ld	a, xl
      008DD8 4D               [ 1]  849 	tnz	a
      008DD9 27 05            [ 1]  850 	jreq	00137$
      008DDB                        851 00136$:
      008DDB 08 01            [ 1]  852 	sll	(1, sp)
      008DDD 4A               [ 1]  853 	dec	a
      008DDE 26 FB            [ 1]  854 	jrne	00136$
      008DE0                        855 00137$:
      008DE0 84               [ 1]  856 	pop	a
      008DE1 43               [ 1]  857 	cpl	a
      008DE2 14 02            [ 1]  858 	and	a, (0x02, sp)
      008DE4 C7 54 0C         [ 1]  859 	ld	0x540c, a
      008DE7 20 0D            [ 2]  860 	jra	00110$
      008DE9                        861 00105$:
                                    862 ;	lib/src/stm8s_adc1.c: 594: ADC1->CSR &= (uint8_t) (~Flag);
      008DE9 C6 54 00         [ 1]  863 	ld	a, 0x5400
      008DEC 6B 02            [ 1]  864 	ld	(0x02, sp), a
      008DEE 7B 03            [ 1]  865 	ld	a, (0x03, sp)
      008DF0 43               [ 1]  866 	cpl	a
      008DF1 14 02            [ 1]  867 	and	a, (0x02, sp)
      008DF3 C7 54 00         [ 1]  868 	ld	0x5400, a
      008DF6                        869 00110$:
                                    870 ;	lib/src/stm8s_adc1.c: 596: }
      008DF6 5B 03            [ 2]  871 	addw	sp, #3
      008DF8 81               [ 4]  872 	ret
                                    873 ;	lib/src/stm8s_adc1.c: 616: ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
                                    874 ;	-----------------------------------------
                                    875 ;	 function ADC1_GetITStatus
                                    876 ;	-----------------------------------------
      008DF9                        877 _ADC1_GetITStatus:
      008DF9 88               [ 1]  878 	push	a
                                    879 ;	lib/src/stm8s_adc1.c: 624: if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
      008DFA 90 5F            [ 1]  880 	clrw	y
      008DFC 9F               [ 1]  881 	ld	a, xl
      008DFD A4 F0            [ 1]  882 	and	a, #0xf0
      008DFF 90 97            [ 1]  883 	ld	yl, a
      008E01 90 A3 00 10      [ 2]  884 	cpw	y, #0x0010
      008E05 26 3D            [ 1]  885 	jrne	00105$
                                    886 ;	lib/src/stm8s_adc1.c: 627: temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
      008E07 9F               [ 1]  887 	ld	a, xl
      008E08 A4 0F            [ 1]  888 	and	a, #0x0f
                                    889 ;	lib/src/stm8s_adc1.c: 628: if (temp < 8)
      008E0A 97               [ 1]  890 	ld	xl, a
      008E0B A1 08            [ 1]  891 	cp	a, #0x08
      008E0D 24 19            [ 1]  892 	jrnc	00102$
                                    893 ;	lib/src/stm8s_adc1.c: 630: itstatus = (ITStatus)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
      008E0F C6 54 0D         [ 1]  894 	ld	a, 0x540d
      008E12 88               [ 1]  895 	push	a
      008E13 A6 01            [ 1]  896 	ld	a, #0x01
      008E15 6B 02            [ 1]  897 	ld	(0x02, sp), a
      008E17 9F               [ 1]  898 	ld	a, xl
      008E18 4D               [ 1]  899 	tnz	a
      008E19 27 05            [ 1]  900 	jreq	00124$
      008E1B                        901 00123$:
      008E1B 08 02            [ 1]  902 	sll	(0x02, sp)
      008E1D 4A               [ 1]  903 	dec	a
      008E1E 26 FB            [ 1]  904 	jrne	00123$
      008E20                        905 00124$:
      008E20 84               [ 1]  906 	pop	a
      008E21 14 01            [ 1]  907 	and	a, (0x01, sp)
      008E23 40               [ 1]  908 	neg	a
      008E24 4F               [ 1]  909 	clr	a
      008E25 49               [ 1]  910 	rlc	a
      008E26 20 26            [ 2]  911 	jra	00106$
      008E28                        912 00102$:
                                    913 ;	lib/src/stm8s_adc1.c: 634: itstatus = (ITStatus)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
      008E28 C6 54 0C         [ 1]  914 	ld	a, 0x540c
      008E2B 6B 01            [ 1]  915 	ld	(0x01, sp), a
      008E2D 1D 00 08         [ 2]  916 	subw	x, #8
      008E30 A6 01            [ 1]  917 	ld	a, #0x01
      008E32 88               [ 1]  918 	push	a
      008E33 9F               [ 1]  919 	ld	a, xl
      008E34 4D               [ 1]  920 	tnz	a
      008E35 27 05            [ 1]  921 	jreq	00126$
      008E37                        922 00125$:
      008E37 08 01            [ 1]  923 	sll	(1, sp)
      008E39 4A               [ 1]  924 	dec	a
      008E3A 26 FB            [ 1]  925 	jrne	00125$
      008E3C                        926 00126$:
      008E3C 84               [ 1]  927 	pop	a
      008E3D 14 01            [ 1]  928 	and	a, (0x01, sp)
      008E3F 40               [ 1]  929 	neg	a
      008E40 4F               [ 1]  930 	clr	a
      008E41 49               [ 1]  931 	rlc	a
      008E42 20 0A            [ 2]  932 	jra	00106$
      008E44                        933 00105$:
                                    934 ;	lib/src/stm8s_adc1.c: 639: itstatus = (ITStatus)(ADC1->CSR & (uint8_t)ITPendingBit);
      008E44 C6 54 00         [ 1]  935 	ld	a, 0x5400
      008E47 89               [ 2]  936 	pushw	x
      008E48 14 02            [ 1]  937 	and	a, (2, sp)
      008E4A 85               [ 2]  938 	popw	x
      008E4B 40               [ 1]  939 	neg	a
      008E4C 4F               [ 1]  940 	clr	a
      008E4D 49               [ 1]  941 	rlc	a
      008E4E                        942 00106$:
                                    943 ;	lib/src/stm8s_adc1.c: 641: return ((ITStatus)itstatus);
                                    944 ;	lib/src/stm8s_adc1.c: 642: }
      008E4E 5B 01            [ 2]  945 	addw	sp, #1
      008E50 81               [ 4]  946 	ret
                                    947 ;	lib/src/stm8s_adc1.c: 662: void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
                                    948 ;	-----------------------------------------
                                    949 ;	 function ADC1_ClearITPendingBit
                                    950 ;	-----------------------------------------
      008E51                        951 _ADC1_ClearITPendingBit:
      008E51 88               [ 1]  952 	push	a
                                    953 ;	lib/src/stm8s_adc1.c: 669: if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
      008E52 90 5F            [ 1]  954 	clrw	y
      008E54 9F               [ 1]  955 	ld	a, xl
      008E55 A4 F0            [ 1]  956 	and	a, #0xf0
      008E57 90 97            [ 1]  957 	ld	yl, a
      008E59 90 A3 00 10      [ 2]  958 	cpw	y, #0x0010
      008E5D 26 3F            [ 1]  959 	jrne	00105$
                                    960 ;	lib/src/stm8s_adc1.c: 672: temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
      008E5F 9F               [ 1]  961 	ld	a, xl
      008E60 A4 0F            [ 1]  962 	and	a, #0x0f
                                    963 ;	lib/src/stm8s_adc1.c: 673: if (temp < 8)
      008E62 97               [ 1]  964 	ld	xl, a
      008E63 A1 08            [ 1]  965 	cp	a, #0x08
      008E65 24 1A            [ 1]  966 	jrnc	00102$
                                    967 ;	lib/src/stm8s_adc1.c: 675: ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
      008E67 C6 54 0D         [ 1]  968 	ld	a, 0x540d
      008E6A 6B 01            [ 1]  969 	ld	(0x01, sp), a
      008E6C A6 01            [ 1]  970 	ld	a, #0x01
      008E6E 88               [ 1]  971 	push	a
      008E6F 9F               [ 1]  972 	ld	a, xl
      008E70 4D               [ 1]  973 	tnz	a
      008E71 27 05            [ 1]  974 	jreq	00124$
      008E73                        975 00123$:
      008E73 08 01            [ 1]  976 	sll	(1, sp)
      008E75 4A               [ 1]  977 	dec	a
      008E76 26 FB            [ 1]  978 	jrne	00123$
      008E78                        979 00124$:
      008E78 84               [ 1]  980 	pop	a
      008E79 43               [ 1]  981 	cpl	a
      008E7A 14 01            [ 1]  982 	and	a, (0x01, sp)
      008E7C C7 54 0D         [ 1]  983 	ld	0x540d, a
      008E7F 20 29            [ 2]  984 	jra	00107$
      008E81                        985 00102$:
                                    986 ;	lib/src/stm8s_adc1.c: 679: ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
      008E81 C6 54 0C         [ 1]  987 	ld	a, 0x540c
      008E84 6B 01            [ 1]  988 	ld	(0x01, sp), a
      008E86 1D 00 08         [ 2]  989 	subw	x, #8
      008E89 A6 01            [ 1]  990 	ld	a, #0x01
      008E8B 88               [ 1]  991 	push	a
      008E8C 9F               [ 1]  992 	ld	a, xl
      008E8D 4D               [ 1]  993 	tnz	a
      008E8E 27 05            [ 1]  994 	jreq	00126$
      008E90                        995 00125$:
      008E90 08 01            [ 1]  996 	sll	(1, sp)
      008E92 4A               [ 1]  997 	dec	a
      008E93 26 FB            [ 1]  998 	jrne	00125$
      008E95                        999 00126$:
      008E95 84               [ 1] 1000 	pop	a
      008E96 43               [ 1] 1001 	cpl	a
      008E97 14 01            [ 1] 1002 	and	a, (0x01, sp)
      008E99 C7 54 0C         [ 1] 1003 	ld	0x540c, a
      008E9C 20 0C            [ 2] 1004 	jra	00107$
      008E9E                       1005 00105$:
                                   1006 ;	lib/src/stm8s_adc1.c: 684: ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
      008E9E C6 54 00         [ 1] 1007 	ld	a, 0x5400
      008EA1 6B 01            [ 1] 1008 	ld	(0x01, sp), a
      008EA3 53               [ 2] 1009 	cplw	x
      008EA4 9F               [ 1] 1010 	ld	a, xl
      008EA5 14 01            [ 1] 1011 	and	a, (0x01, sp)
      008EA7 C7 54 00         [ 1] 1012 	ld	0x5400, a
      008EAA                       1013 00107$:
                                   1014 ;	lib/src/stm8s_adc1.c: 686: }
      008EAA 84               [ 1] 1015 	pop	a
      008EAB 81               [ 4] 1016 	ret
                                   1017 	.area CODE
                                   1018 	.area CONST
                                   1019 	.area INITIALIZER
                                   1020 	.area CABS (ABS)
