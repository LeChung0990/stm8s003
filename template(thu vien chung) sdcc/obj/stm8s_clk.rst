                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.3.0 #14184 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_clk
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _CLKPrescTable
                                     12 	.globl _HSIDivExp
                                     13 	.globl _CLK_DeInit
                                     14 	.globl _CLK_FastHaltWakeUpCmd
                                     15 	.globl _CLK_HSECmd
                                     16 	.globl _CLK_HSICmd
                                     17 	.globl _CLK_LSICmd
                                     18 	.globl _CLK_CCOCmd
                                     19 	.globl _CLK_ClockSwitchCmd
                                     20 	.globl _CLK_SlowActiveHaltWakeUpCmd
                                     21 	.globl _CLK_PeripheralClockConfig
                                     22 	.globl _CLK_ClockSwitchConfig
                                     23 	.globl _CLK_HSIPrescalerConfig
                                     24 	.globl _CLK_CCOConfig
                                     25 	.globl _CLK_ITConfig
                                     26 	.globl _CLK_SYSCLKConfig
                                     27 	.globl _CLK_SWIMConfig
                                     28 	.globl _CLK_ClockSecuritySystemEnable
                                     29 	.globl _CLK_GetSYSCLKSource
                                     30 	.globl _CLK_GetClockFreq
                                     31 	.globl _CLK_AdjustHSICalibrationValue
                                     32 	.globl _CLK_SYSCLKEmergencyClear
                                     33 	.globl _CLK_GetFlagStatus
                                     34 	.globl _CLK_GetITStatus
                                     35 	.globl _CLK_ClearITPendingBit
                                     36 ;--------------------------------------------------------
                                     37 ; ram data
                                     38 ;--------------------------------------------------------
                                     39 	.area DATA
                                     40 ;--------------------------------------------------------
                                     41 ; ram data
                                     42 ;--------------------------------------------------------
                                     43 	.area INITIALIZED
                                     44 ;--------------------------------------------------------
                                     45 ; absolute external ram data
                                     46 ;--------------------------------------------------------
                                     47 	.area DABS (ABS)
                                     48 
                                     49 ; default segment ordering for linker
                                     50 	.area HOME
                                     51 	.area GSINIT
                                     52 	.area GSFINAL
                                     53 	.area CONST
                                     54 	.area INITIALIZER
                                     55 	.area CODE
                                     56 
                                     57 ;--------------------------------------------------------
                                     58 ; global & static initialisations
                                     59 ;--------------------------------------------------------
                                     60 	.area HOME
                                     61 	.area GSINIT
                                     62 	.area GSFINAL
                                     63 	.area GSINIT
                                     64 ;--------------------------------------------------------
                                     65 ; Home
                                     66 ;--------------------------------------------------------
                                     67 	.area HOME
                                     68 	.area HOME
                                     69 ;--------------------------------------------------------
                                     70 ; code
                                     71 ;--------------------------------------------------------
                                     72 	.area CODE
                                     73 ;	lib/src/stm8s_clk.c: 72: void CLK_DeInit(void)
                                     74 ;	-----------------------------------------
                                     75 ;	 function CLK_DeInit
                                     76 ;	-----------------------------------------
      008273                         77 _CLK_DeInit:
                                     78 ;	lib/src/stm8s_clk.c: 74: CLK->ICKR = CLK_ICKR_RESET_VALUE;
      008273 35 01 50 C0      [ 1]   79 	mov	0x50c0+0, #0x01
                                     80 ;	lib/src/stm8s_clk.c: 75: CLK->ECKR = CLK_ECKR_RESET_VALUE;
      008277 35 00 50 C1      [ 1]   81 	mov	0x50c1+0, #0x00
                                     82 ;	lib/src/stm8s_clk.c: 76: CLK->SWR  = CLK_SWR_RESET_VALUE;
      00827B 35 E1 50 C4      [ 1]   83 	mov	0x50c4+0, #0xe1
                                     84 ;	lib/src/stm8s_clk.c: 77: CLK->SWCR = CLK_SWCR_RESET_VALUE;
      00827F 35 00 50 C5      [ 1]   85 	mov	0x50c5+0, #0x00
                                     86 ;	lib/src/stm8s_clk.c: 78: CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
      008283 35 18 50 C6      [ 1]   87 	mov	0x50c6+0, #0x18
                                     88 ;	lib/src/stm8s_clk.c: 79: CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
      008287 35 FF 50 C7      [ 1]   89 	mov	0x50c7+0, #0xff
                                     90 ;	lib/src/stm8s_clk.c: 80: CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
      00828B 35 FF 50 CA      [ 1]   91 	mov	0x50ca+0, #0xff
                                     92 ;	lib/src/stm8s_clk.c: 81: CLK->CSSR = CLK_CSSR_RESET_VALUE;
      00828F 35 00 50 C8      [ 1]   93 	mov	0x50c8+0, #0x00
                                     94 ;	lib/src/stm8s_clk.c: 82: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      008293 35 00 50 C9      [ 1]   95 	mov	0x50c9+0, #0x00
                                     96 ;	lib/src/stm8s_clk.c: 83: while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
      008297                         97 00101$:
      008297 72 00 50 C9 FB   [ 2]   98 	btjt	0x50c9, #0, 00101$
                                     99 ;	lib/src/stm8s_clk.c: 85: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      00829C 35 00 50 C9      [ 1]  100 	mov	0x50c9+0, #0x00
                                    101 ;	lib/src/stm8s_clk.c: 86: CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
      0082A0 35 00 50 CC      [ 1]  102 	mov	0x50cc+0, #0x00
                                    103 ;	lib/src/stm8s_clk.c: 87: CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
      0082A4 35 00 50 CD      [ 1]  104 	mov	0x50cd+0, #0x00
                                    105 ;	lib/src/stm8s_clk.c: 88: }
      0082A8 81               [ 4]  106 	ret
                                    107 ;	lib/src/stm8s_clk.c: 99: void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
                                    108 ;	-----------------------------------------
                                    109 ;	 function CLK_FastHaltWakeUpCmd
                                    110 ;	-----------------------------------------
      0082A9                        111 _CLK_FastHaltWakeUpCmd:
      0082A9 88               [ 1]  112 	push	a
      0082AA 6B 01            [ 1]  113 	ld	(0x01, sp), a
                                    114 ;	lib/src/stm8s_clk.c: 107: CLK->ICKR |= CLK_ICKR_FHWU;
      0082AC C6 50 C0         [ 1]  115 	ld	a, 0x50c0
                                    116 ;	lib/src/stm8s_clk.c: 104: if (NewState != DISABLE)
      0082AF 0D 01            [ 1]  117 	tnz	(0x01, sp)
      0082B1 27 07            [ 1]  118 	jreq	00102$
                                    119 ;	lib/src/stm8s_clk.c: 107: CLK->ICKR |= CLK_ICKR_FHWU;
      0082B3 AA 04            [ 1]  120 	or	a, #0x04
      0082B5 C7 50 C0         [ 1]  121 	ld	0x50c0, a
      0082B8 20 05            [ 2]  122 	jra	00104$
      0082BA                        123 00102$:
                                    124 ;	lib/src/stm8s_clk.c: 112: CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
      0082BA A4 FB            [ 1]  125 	and	a, #0xfb
      0082BC C7 50 C0         [ 1]  126 	ld	0x50c0, a
      0082BF                        127 00104$:
                                    128 ;	lib/src/stm8s_clk.c: 114: }
      0082BF 84               [ 1]  129 	pop	a
      0082C0 81               [ 4]  130 	ret
                                    131 ;	lib/src/stm8s_clk.c: 121: void CLK_HSECmd(FunctionalState NewState)
                                    132 ;	-----------------------------------------
                                    133 ;	 function CLK_HSECmd
                                    134 ;	-----------------------------------------
      0082C1                        135 _CLK_HSECmd:
      0082C1 88               [ 1]  136 	push	a
      0082C2 6B 01            [ 1]  137 	ld	(0x01, sp), a
                                    138 ;	lib/src/stm8s_clk.c: 129: CLK->ECKR |= CLK_ECKR_HSEEN;
      0082C4 C6 50 C1         [ 1]  139 	ld	a, 0x50c1
                                    140 ;	lib/src/stm8s_clk.c: 126: if (NewState != DISABLE)
      0082C7 0D 01            [ 1]  141 	tnz	(0x01, sp)
      0082C9 27 07            [ 1]  142 	jreq	00102$
                                    143 ;	lib/src/stm8s_clk.c: 129: CLK->ECKR |= CLK_ECKR_HSEEN;
      0082CB AA 01            [ 1]  144 	or	a, #0x01
      0082CD C7 50 C1         [ 1]  145 	ld	0x50c1, a
      0082D0 20 05            [ 2]  146 	jra	00104$
      0082D2                        147 00102$:
                                    148 ;	lib/src/stm8s_clk.c: 134: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
      0082D2 A4 FE            [ 1]  149 	and	a, #0xfe
      0082D4 C7 50 C1         [ 1]  150 	ld	0x50c1, a
      0082D7                        151 00104$:
                                    152 ;	lib/src/stm8s_clk.c: 136: }
      0082D7 84               [ 1]  153 	pop	a
      0082D8 81               [ 4]  154 	ret
                                    155 ;	lib/src/stm8s_clk.c: 143: void CLK_HSICmd(FunctionalState NewState)
                                    156 ;	-----------------------------------------
                                    157 ;	 function CLK_HSICmd
                                    158 ;	-----------------------------------------
      0082D9                        159 _CLK_HSICmd:
      0082D9 88               [ 1]  160 	push	a
      0082DA 6B 01            [ 1]  161 	ld	(0x01, sp), a
                                    162 ;	lib/src/stm8s_clk.c: 151: CLK->ICKR |= CLK_ICKR_HSIEN;
      0082DC C6 50 C0         [ 1]  163 	ld	a, 0x50c0
                                    164 ;	lib/src/stm8s_clk.c: 148: if (NewState != DISABLE)
      0082DF 0D 01            [ 1]  165 	tnz	(0x01, sp)
      0082E1 27 07            [ 1]  166 	jreq	00102$
                                    167 ;	lib/src/stm8s_clk.c: 151: CLK->ICKR |= CLK_ICKR_HSIEN;
      0082E3 AA 01            [ 1]  168 	or	a, #0x01
      0082E5 C7 50 C0         [ 1]  169 	ld	0x50c0, a
      0082E8 20 05            [ 2]  170 	jra	00104$
      0082EA                        171 00102$:
                                    172 ;	lib/src/stm8s_clk.c: 156: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
      0082EA A4 FE            [ 1]  173 	and	a, #0xfe
      0082EC C7 50 C0         [ 1]  174 	ld	0x50c0, a
      0082EF                        175 00104$:
                                    176 ;	lib/src/stm8s_clk.c: 158: }
      0082EF 84               [ 1]  177 	pop	a
      0082F0 81               [ 4]  178 	ret
                                    179 ;	lib/src/stm8s_clk.c: 166: void CLK_LSICmd(FunctionalState NewState)
                                    180 ;	-----------------------------------------
                                    181 ;	 function CLK_LSICmd
                                    182 ;	-----------------------------------------
      0082F1                        183 _CLK_LSICmd:
      0082F1 88               [ 1]  184 	push	a
      0082F2 6B 01            [ 1]  185 	ld	(0x01, sp), a
                                    186 ;	lib/src/stm8s_clk.c: 174: CLK->ICKR |= CLK_ICKR_LSIEN;
      0082F4 C6 50 C0         [ 1]  187 	ld	a, 0x50c0
                                    188 ;	lib/src/stm8s_clk.c: 171: if (NewState != DISABLE)
      0082F7 0D 01            [ 1]  189 	tnz	(0x01, sp)
      0082F9 27 07            [ 1]  190 	jreq	00102$
                                    191 ;	lib/src/stm8s_clk.c: 174: CLK->ICKR |= CLK_ICKR_LSIEN;
      0082FB AA 08            [ 1]  192 	or	a, #0x08
      0082FD C7 50 C0         [ 1]  193 	ld	0x50c0, a
      008300 20 05            [ 2]  194 	jra	00104$
      008302                        195 00102$:
                                    196 ;	lib/src/stm8s_clk.c: 179: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
      008302 A4 F7            [ 1]  197 	and	a, #0xf7
      008304 C7 50 C0         [ 1]  198 	ld	0x50c0, a
      008307                        199 00104$:
                                    200 ;	lib/src/stm8s_clk.c: 181: }
      008307 84               [ 1]  201 	pop	a
      008308 81               [ 4]  202 	ret
                                    203 ;	lib/src/stm8s_clk.c: 189: void CLK_CCOCmd(FunctionalState NewState)
                                    204 ;	-----------------------------------------
                                    205 ;	 function CLK_CCOCmd
                                    206 ;	-----------------------------------------
      008309                        207 _CLK_CCOCmd:
      008309 88               [ 1]  208 	push	a
      00830A 6B 01            [ 1]  209 	ld	(0x01, sp), a
                                    210 ;	lib/src/stm8s_clk.c: 197: CLK->CCOR |= CLK_CCOR_CCOEN;
      00830C C6 50 C9         [ 1]  211 	ld	a, 0x50c9
                                    212 ;	lib/src/stm8s_clk.c: 194: if (NewState != DISABLE)
      00830F 0D 01            [ 1]  213 	tnz	(0x01, sp)
      008311 27 07            [ 1]  214 	jreq	00102$
                                    215 ;	lib/src/stm8s_clk.c: 197: CLK->CCOR |= CLK_CCOR_CCOEN;
      008313 AA 01            [ 1]  216 	or	a, #0x01
      008315 C7 50 C9         [ 1]  217 	ld	0x50c9, a
      008318 20 05            [ 2]  218 	jra	00104$
      00831A                        219 00102$:
                                    220 ;	lib/src/stm8s_clk.c: 202: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
      00831A A4 FE            [ 1]  221 	and	a, #0xfe
      00831C C7 50 C9         [ 1]  222 	ld	0x50c9, a
      00831F                        223 00104$:
                                    224 ;	lib/src/stm8s_clk.c: 204: }
      00831F 84               [ 1]  225 	pop	a
      008320 81               [ 4]  226 	ret
                                    227 ;	lib/src/stm8s_clk.c: 213: void CLK_ClockSwitchCmd(FunctionalState NewState)
                                    228 ;	-----------------------------------------
                                    229 ;	 function CLK_ClockSwitchCmd
                                    230 ;	-----------------------------------------
      008321                        231 _CLK_ClockSwitchCmd:
      008321 88               [ 1]  232 	push	a
      008322 6B 01            [ 1]  233 	ld	(0x01, sp), a
                                    234 ;	lib/src/stm8s_clk.c: 221: CLK->SWCR |= CLK_SWCR_SWEN;
      008324 C6 50 C5         [ 1]  235 	ld	a, 0x50c5
                                    236 ;	lib/src/stm8s_clk.c: 218: if (NewState != DISABLE )
      008327 0D 01            [ 1]  237 	tnz	(0x01, sp)
      008329 27 07            [ 1]  238 	jreq	00102$
                                    239 ;	lib/src/stm8s_clk.c: 221: CLK->SWCR |= CLK_SWCR_SWEN;
      00832B AA 02            [ 1]  240 	or	a, #0x02
      00832D C7 50 C5         [ 1]  241 	ld	0x50c5, a
      008330 20 05            [ 2]  242 	jra	00104$
      008332                        243 00102$:
                                    244 ;	lib/src/stm8s_clk.c: 226: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
      008332 A4 FD            [ 1]  245 	and	a, #0xfd
      008334 C7 50 C5         [ 1]  246 	ld	0x50c5, a
      008337                        247 00104$:
                                    248 ;	lib/src/stm8s_clk.c: 228: }
      008337 84               [ 1]  249 	pop	a
      008338 81               [ 4]  250 	ret
                                    251 ;	lib/src/stm8s_clk.c: 238: void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
                                    252 ;	-----------------------------------------
                                    253 ;	 function CLK_SlowActiveHaltWakeUpCmd
                                    254 ;	-----------------------------------------
      008339                        255 _CLK_SlowActiveHaltWakeUpCmd:
      008339 88               [ 1]  256 	push	a
      00833A 6B 01            [ 1]  257 	ld	(0x01, sp), a
                                    258 ;	lib/src/stm8s_clk.c: 246: CLK->ICKR |= CLK_ICKR_SWUAH;
      00833C C6 50 C0         [ 1]  259 	ld	a, 0x50c0
                                    260 ;	lib/src/stm8s_clk.c: 243: if (NewState != DISABLE)
      00833F 0D 01            [ 1]  261 	tnz	(0x01, sp)
      008341 27 07            [ 1]  262 	jreq	00102$
                                    263 ;	lib/src/stm8s_clk.c: 246: CLK->ICKR |= CLK_ICKR_SWUAH;
      008343 AA 20            [ 1]  264 	or	a, #0x20
      008345 C7 50 C0         [ 1]  265 	ld	0x50c0, a
      008348 20 05            [ 2]  266 	jra	00104$
      00834A                        267 00102$:
                                    268 ;	lib/src/stm8s_clk.c: 251: CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
      00834A A4 DF            [ 1]  269 	and	a, #0xdf
      00834C C7 50 C0         [ 1]  270 	ld	0x50c0, a
      00834F                        271 00104$:
                                    272 ;	lib/src/stm8s_clk.c: 253: }
      00834F 84               [ 1]  273 	pop	a
      008350 81               [ 4]  274 	ret
                                    275 ;	lib/src/stm8s_clk.c: 263: void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
                                    276 ;	-----------------------------------------
                                    277 ;	 function CLK_PeripheralClockConfig
                                    278 ;	-----------------------------------------
      008351                        279 _CLK_PeripheralClockConfig:
      008351 52 02            [ 2]  280 	sub	sp, #2
                                    281 ;	lib/src/stm8s_clk.c: 274: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008353 97               [ 1]  282 	ld	xl, a
      008354 A4 0F            [ 1]  283 	and	a, #0x0f
      008356 88               [ 1]  284 	push	a
      008357 A6 01            [ 1]  285 	ld	a, #0x01
      008359 6B 02            [ 1]  286 	ld	(0x02, sp), a
      00835B 84               [ 1]  287 	pop	a
      00835C 4D               [ 1]  288 	tnz	a
      00835D 27 05            [ 1]  289 	jreq	00128$
      00835F                        290 00127$:
      00835F 08 01            [ 1]  291 	sll	(0x01, sp)
      008361 4A               [ 1]  292 	dec	a
      008362 26 FB            [ 1]  293 	jrne	00127$
      008364                        294 00128$:
                                    295 ;	lib/src/stm8s_clk.c: 279: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      008364 7B 01            [ 1]  296 	ld	a, (0x01, sp)
      008366 43               [ 1]  297 	cpl	a
      008367 6B 02            [ 1]  298 	ld	(0x02, sp), a
                                    299 ;	lib/src/stm8s_clk.c: 269: if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
      008369 9F               [ 1]  300 	ld	a, xl
      00836A A5 10            [ 1]  301 	bcp	a, #0x10
      00836C 26 15            [ 1]  302 	jrne	00108$
                                    303 ;	lib/src/stm8s_clk.c: 274: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      00836E C6 50 C7         [ 1]  304 	ld	a, 0x50c7
                                    305 ;	lib/src/stm8s_clk.c: 271: if (NewState != DISABLE)
      008371 0D 05            [ 1]  306 	tnz	(0x05, sp)
      008373 27 07            [ 1]  307 	jreq	00102$
                                    308 ;	lib/src/stm8s_clk.c: 274: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008375 1A 01            [ 1]  309 	or	a, (0x01, sp)
      008377 C7 50 C7         [ 1]  310 	ld	0x50c7, a
      00837A 20 1A            [ 2]  311 	jra	00110$
      00837C                        312 00102$:
                                    313 ;	lib/src/stm8s_clk.c: 279: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      00837C 14 02            [ 1]  314 	and	a, (0x02, sp)
      00837E C7 50 C7         [ 1]  315 	ld	0x50c7, a
      008381 20 13            [ 2]  316 	jra	00110$
      008383                        317 00108$:
                                    318 ;	lib/src/stm8s_clk.c: 287: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008383 C6 50 CA         [ 1]  319 	ld	a, 0x50ca
                                    320 ;	lib/src/stm8s_clk.c: 284: if (NewState != DISABLE)
      008386 0D 05            [ 1]  321 	tnz	(0x05, sp)
      008388 27 07            [ 1]  322 	jreq	00105$
                                    323 ;	lib/src/stm8s_clk.c: 287: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      00838A 1A 01            [ 1]  324 	or	a, (0x01, sp)
      00838C C7 50 CA         [ 1]  325 	ld	0x50ca, a
      00838F 20 05            [ 2]  326 	jra	00110$
      008391                        327 00105$:
                                    328 ;	lib/src/stm8s_clk.c: 292: CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      008391 14 02            [ 1]  329 	and	a, (0x02, sp)
      008393 C7 50 CA         [ 1]  330 	ld	0x50ca, a
      008396                        331 00110$:
                                    332 ;	lib/src/stm8s_clk.c: 295: }
      008396 5B 02            [ 2]  333 	addw	sp, #2
      008398 85               [ 2]  334 	popw	x
      008399 84               [ 1]  335 	pop	a
      00839A FC               [ 2]  336 	jp	(x)
                                    337 ;	lib/src/stm8s_clk.c: 309: ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
                                    338 ;	-----------------------------------------
                                    339 ;	 function CLK_ClockSwitchConfig
                                    340 ;	-----------------------------------------
      00839B                        341 _CLK_ClockSwitchConfig:
      00839B 88               [ 1]  342 	push	a
      00839C 6B 01            [ 1]  343 	ld	(0x01, sp), a
                                    344 ;	lib/src/stm8s_clk.c: 322: clock_master = (CLK_Source_TypeDef)CLK->CMSR;
      00839E C6 50 C3         [ 1]  345 	ld	a, 0x50c3
      0083A1 90 97            [ 1]  346 	ld	yl, a
                                    347 ;	lib/src/stm8s_clk.c: 328: CLK->SWCR |= CLK_SWCR_SWEN;
      0083A3 C6 50 C5         [ 1]  348 	ld	a, 0x50c5
                                    349 ;	lib/src/stm8s_clk.c: 325: if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
      0083A6 0D 01            [ 1]  350 	tnz	(0x01, sp)
      0083A8 27 36            [ 1]  351 	jreq	00122$
                                    352 ;	lib/src/stm8s_clk.c: 328: CLK->SWCR |= CLK_SWCR_SWEN;
      0083AA AA 02            [ 1]  353 	or	a, #0x02
      0083AC C7 50 C5         [ 1]  354 	ld	0x50c5, a
      0083AF C6 50 C5         [ 1]  355 	ld	a, 0x50c5
                                    356 ;	lib/src/stm8s_clk.c: 331: if (ITState != DISABLE)
      0083B2 0D 05            [ 1]  357 	tnz	(0x05, sp)
      0083B4 27 07            [ 1]  358 	jreq	00102$
                                    359 ;	lib/src/stm8s_clk.c: 333: CLK->SWCR |= CLK_SWCR_SWIEN;
      0083B6 AA 04            [ 1]  360 	or	a, #0x04
      0083B8 C7 50 C5         [ 1]  361 	ld	0x50c5, a
      0083BB 20 05            [ 2]  362 	jra	00103$
      0083BD                        363 00102$:
                                    364 ;	lib/src/stm8s_clk.c: 337: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
      0083BD A4 FB            [ 1]  365 	and	a, #0xfb
      0083BF C7 50 C5         [ 1]  366 	ld	0x50c5, a
      0083C2                        367 00103$:
                                    368 ;	lib/src/stm8s_clk.c: 341: CLK->SWR = (uint8_t)CLK_NewClock;
      0083C2 AE 50 C4         [ 2]  369 	ldw	x, #0x50c4
      0083C5 7B 04            [ 1]  370 	ld	a, (0x04, sp)
      0083C7 F7               [ 1]  371 	ld	(x), a
                                    372 ;	lib/src/stm8s_clk.c: 344: while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
      0083C8 5F               [ 1]  373 	clrw	x
      0083C9 5A               [ 2]  374 	decw	x
      0083CA                        375 00105$:
      0083CA 72 01 50 C5 06   [ 2]  376 	btjf	0x50c5, #0, 00107$
      0083CF 5D               [ 2]  377 	tnzw	x
      0083D0 27 03            [ 1]  378 	jreq	00107$
                                    379 ;	lib/src/stm8s_clk.c: 346: DownCounter--;
      0083D2 5A               [ 2]  380 	decw	x
      0083D3 20 F5            [ 2]  381 	jra	00105$
      0083D5                        382 00107$:
                                    383 ;	lib/src/stm8s_clk.c: 349: if(DownCounter != 0)
      0083D5 5D               [ 2]  384 	tnzw	x
      0083D6 27 05            [ 1]  385 	jreq	00109$
                                    386 ;	lib/src/stm8s_clk.c: 351: Swif = SUCCESS;
      0083D8 A6 01            [ 1]  387 	ld	a, #0x01
      0083DA 97               [ 1]  388 	ld	xl, a
      0083DB 20 32            [ 2]  389 	jra	00123$
      0083DD                        390 00109$:
                                    391 ;	lib/src/stm8s_clk.c: 355: Swif = ERROR;
      0083DD 5F               [ 1]  392 	clrw	x
      0083DE 20 2F            [ 2]  393 	jra	00123$
      0083E0                        394 00122$:
                                    395 ;	lib/src/stm8s_clk.c: 361: if (ITState != DISABLE)
      0083E0 0D 05            [ 1]  396 	tnz	(0x05, sp)
      0083E2 27 07            [ 1]  397 	jreq	00112$
                                    398 ;	lib/src/stm8s_clk.c: 363: CLK->SWCR |= CLK_SWCR_SWIEN;
      0083E4 AA 04            [ 1]  399 	or	a, #0x04
      0083E6 C7 50 C5         [ 1]  400 	ld	0x50c5, a
      0083E9 20 05            [ 2]  401 	jra	00113$
      0083EB                        402 00112$:
                                    403 ;	lib/src/stm8s_clk.c: 367: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
      0083EB A4 FB            [ 1]  404 	and	a, #0xfb
      0083ED C7 50 C5         [ 1]  405 	ld	0x50c5, a
      0083F0                        406 00113$:
                                    407 ;	lib/src/stm8s_clk.c: 371: CLK->SWR = (uint8_t)CLK_NewClock;
      0083F0 AE 50 C4         [ 2]  408 	ldw	x, #0x50c4
      0083F3 7B 04            [ 1]  409 	ld	a, (0x04, sp)
      0083F5 F7               [ 1]  410 	ld	(x), a
                                    411 ;	lib/src/stm8s_clk.c: 374: while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
      0083F6 5F               [ 1]  412 	clrw	x
      0083F7 5A               [ 2]  413 	decw	x
      0083F8                        414 00115$:
      0083F8 72 07 50 C5 06   [ 2]  415 	btjf	0x50c5, #3, 00117$
      0083FD 5D               [ 2]  416 	tnzw	x
      0083FE 27 03            [ 1]  417 	jreq	00117$
                                    418 ;	lib/src/stm8s_clk.c: 376: DownCounter--;
      008400 5A               [ 2]  419 	decw	x
      008401 20 F5            [ 2]  420 	jra	00115$
      008403                        421 00117$:
                                    422 ;	lib/src/stm8s_clk.c: 379: if(DownCounter != 0)
      008403 5D               [ 2]  423 	tnzw	x
      008404 27 08            [ 1]  424 	jreq	00119$
                                    425 ;	lib/src/stm8s_clk.c: 382: CLK->SWCR |= CLK_SWCR_SWEN;
      008406 72 12 50 C5      [ 1]  426 	bset	0x50c5, #1
                                    427 ;	lib/src/stm8s_clk.c: 383: Swif = SUCCESS;
      00840A A6 01            [ 1]  428 	ld	a, #0x01
      00840C 97               [ 1]  429 	ld	xl, a
                                    430 ;	lib/src/stm8s_clk.c: 387: Swif = ERROR;
      00840D 21                     431 	.byte 0x21
      00840E                        432 00119$:
      00840E 5F               [ 1]  433 	clrw	x
      00840F                        434 00123$:
                                    435 ;	lib/src/stm8s_clk.c: 390: if(Swif != ERROR)
      00840F 9F               [ 1]  436 	ld	a, xl
      008410 4D               [ 1]  437 	tnz	a
      008411 27 2E            [ 1]  438 	jreq	00136$
                                    439 ;	lib/src/stm8s_clk.c: 393: if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
      008413 0D 06            [ 1]  440 	tnz	(0x06, sp)
      008415 26 0C            [ 1]  441 	jrne	00132$
      008417 90 9F            [ 1]  442 	ld	a, yl
      008419 A1 E1            [ 1]  443 	cp	a, #0xe1
      00841B 26 06            [ 1]  444 	jrne	00132$
                                    445 ;	lib/src/stm8s_clk.c: 395: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
      00841D 72 11 50 C0      [ 1]  446 	bres	0x50c0, #0
      008421 20 1E            [ 2]  447 	jra	00136$
      008423                        448 00132$:
                                    449 ;	lib/src/stm8s_clk.c: 397: else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
      008423 0D 06            [ 1]  450 	tnz	(0x06, sp)
      008425 26 0C            [ 1]  451 	jrne	00128$
      008427 90 9F            [ 1]  452 	ld	a, yl
      008429 A1 D2            [ 1]  453 	cp	a, #0xd2
      00842B 26 06            [ 1]  454 	jrne	00128$
                                    455 ;	lib/src/stm8s_clk.c: 399: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
      00842D 72 17 50 C0      [ 1]  456 	bres	0x50c0, #3
      008431 20 0E            [ 2]  457 	jra	00136$
      008433                        458 00128$:
                                    459 ;	lib/src/stm8s_clk.c: 401: else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
      008433 0D 06            [ 1]  460 	tnz	(0x06, sp)
      008435 26 0A            [ 1]  461 	jrne	00136$
      008437 90 9F            [ 1]  462 	ld	a, yl
      008439 A1 B4            [ 1]  463 	cp	a, #0xb4
      00843B 26 04            [ 1]  464 	jrne	00136$
                                    465 ;	lib/src/stm8s_clk.c: 403: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
      00843D 72 11 50 C1      [ 1]  466 	bres	0x50c1, #0
      008441                        467 00136$:
                                    468 ;	lib/src/stm8s_clk.c: 406: return(Swif);
      008441 9F               [ 1]  469 	ld	a, xl
                                    470 ;	lib/src/stm8s_clk.c: 407: }
      008442 1E 02            [ 2]  471 	ldw	x, (2, sp)
      008444 5B 06            [ 2]  472 	addw	sp, #6
      008446 FC               [ 2]  473 	jp	(x)
                                    474 ;	lib/src/stm8s_clk.c: 415: void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
                                    475 ;	-----------------------------------------
                                    476 ;	 function CLK_HSIPrescalerConfig
                                    477 ;	-----------------------------------------
      008447                        478 _CLK_HSIPrescalerConfig:
      008447 88               [ 1]  479 	push	a
      008448 6B 01            [ 1]  480 	ld	(0x01, sp), a
                                    481 ;	lib/src/stm8s_clk.c: 421: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      00844A C6 50 C6         [ 1]  482 	ld	a, 0x50c6
      00844D A4 E7            [ 1]  483 	and	a, #0xe7
      00844F C7 50 C6         [ 1]  484 	ld	0x50c6, a
                                    485 ;	lib/src/stm8s_clk.c: 424: CLK->CKDIVR |= (uint8_t)HSIPrescaler;
      008452 C6 50 C6         [ 1]  486 	ld	a, 0x50c6
      008455 1A 01            [ 1]  487 	or	a, (0x01, sp)
      008457 C7 50 C6         [ 1]  488 	ld	0x50c6, a
                                    489 ;	lib/src/stm8s_clk.c: 425: }
      00845A 84               [ 1]  490 	pop	a
      00845B 81               [ 4]  491 	ret
                                    492 ;	lib/src/stm8s_clk.c: 436: void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
                                    493 ;	-----------------------------------------
                                    494 ;	 function CLK_CCOConfig
                                    495 ;	-----------------------------------------
      00845C                        496 _CLK_CCOConfig:
      00845C 88               [ 1]  497 	push	a
      00845D 6B 01            [ 1]  498 	ld	(0x01, sp), a
                                    499 ;	lib/src/stm8s_clk.c: 442: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
      00845F C6 50 C9         [ 1]  500 	ld	a, 0x50c9
      008462 A4 E1            [ 1]  501 	and	a, #0xe1
      008464 C7 50 C9         [ 1]  502 	ld	0x50c9, a
                                    503 ;	lib/src/stm8s_clk.c: 445: CLK->CCOR |= (uint8_t)CLK_CCO;
      008467 C6 50 C9         [ 1]  504 	ld	a, 0x50c9
      00846A 1A 01            [ 1]  505 	or	a, (0x01, sp)
      00846C C7 50 C9         [ 1]  506 	ld	0x50c9, a
                                    507 ;	lib/src/stm8s_clk.c: 448: CLK->CCOR |= CLK_CCOR_CCOEN;
      00846F 72 10 50 C9      [ 1]  508 	bset	0x50c9, #0
                                    509 ;	lib/src/stm8s_clk.c: 449: }
      008473 84               [ 1]  510 	pop	a
      008474 81               [ 4]  511 	ret
                                    512 ;	lib/src/stm8s_clk.c: 459: void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
                                    513 ;	-----------------------------------------
                                    514 ;	 function CLK_ITConfig
                                    515 ;	-----------------------------------------
      008475                        516 _CLK_ITConfig:
      008475 88               [ 1]  517 	push	a
                                    518 ;	lib/src/stm8s_clk.c: 467: switch (CLK_IT)
      008476 A1 0C            [ 1]  519 	cp	a, #0x0c
      008478 26 07            [ 1]  520 	jrne	00140$
      00847A 88               [ 1]  521 	push	a
      00847B A6 01            [ 1]  522 	ld	a, #0x01
      00847D 6B 02            [ 1]  523 	ld	(0x02, sp), a
      00847F 84               [ 1]  524 	pop	a
      008480 C5                     525 	.byte 0xc5
      008481                        526 00140$:
      008481 0F 01            [ 1]  527 	clr	(0x01, sp)
      008483                        528 00141$:
      008483 A0 1C            [ 1]  529 	sub	a, #0x1c
      008485 26 02            [ 1]  530 	jrne	00143$
      008487 4C               [ 1]  531 	inc	a
      008488 21                     532 	.byte 0x21
      008489                        533 00143$:
      008489 4F               [ 1]  534 	clr	a
      00848A                        535 00144$:
                                    536 ;	lib/src/stm8s_clk.c: 465: if (NewState != DISABLE)
      00848A 0D 04            [ 1]  537 	tnz	(0x04, sp)
      00848C 27 1B            [ 1]  538 	jreq	00110$
                                    539 ;	lib/src/stm8s_clk.c: 467: switch (CLK_IT)
      00848E 0D 01            [ 1]  540 	tnz	(0x01, sp)
      008490 26 0D            [ 1]  541 	jrne	00102$
      008492 4D               [ 1]  542 	tnz	a
      008493 27 2D            [ 1]  543 	jreq	00112$
                                    544 ;	lib/src/stm8s_clk.c: 470: CLK->SWCR |= CLK_SWCR_SWIEN;
      008495 C6 50 C5         [ 1]  545 	ld	a, 0x50c5
      008498 AA 04            [ 1]  546 	or	a, #0x04
      00849A C7 50 C5         [ 1]  547 	ld	0x50c5, a
                                    548 ;	lib/src/stm8s_clk.c: 471: break;
      00849D 20 23            [ 2]  549 	jra	00112$
                                    550 ;	lib/src/stm8s_clk.c: 472: case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
      00849F                        551 00102$:
                                    552 ;	lib/src/stm8s_clk.c: 473: CLK->CSSR |= CLK_CSSR_CSSDIE;
      00849F C6 50 C8         [ 1]  553 	ld	a, 0x50c8
      0084A2 AA 04            [ 1]  554 	or	a, #0x04
      0084A4 C7 50 C8         [ 1]  555 	ld	0x50c8, a
                                    556 ;	lib/src/stm8s_clk.c: 474: break;
      0084A7 20 19            [ 2]  557 	jra	00112$
                                    558 ;	lib/src/stm8s_clk.c: 477: }
      0084A9                        559 00110$:
                                    560 ;	lib/src/stm8s_clk.c: 481: switch (CLK_IT)
      0084A9 0D 01            [ 1]  561 	tnz	(0x01, sp)
      0084AB 26 0D            [ 1]  562 	jrne	00106$
      0084AD 4D               [ 1]  563 	tnz	a
      0084AE 27 12            [ 1]  564 	jreq	00112$
                                    565 ;	lib/src/stm8s_clk.c: 484: CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
      0084B0 C6 50 C5         [ 1]  566 	ld	a, 0x50c5
      0084B3 A4 FB            [ 1]  567 	and	a, #0xfb
      0084B5 C7 50 C5         [ 1]  568 	ld	0x50c5, a
                                    569 ;	lib/src/stm8s_clk.c: 485: break;
      0084B8 20 08            [ 2]  570 	jra	00112$
                                    571 ;	lib/src/stm8s_clk.c: 486: case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
      0084BA                        572 00106$:
                                    573 ;	lib/src/stm8s_clk.c: 487: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
      0084BA C6 50 C8         [ 1]  574 	ld	a, 0x50c8
      0084BD A4 FB            [ 1]  575 	and	a, #0xfb
      0084BF C7 50 C8         [ 1]  576 	ld	0x50c8, a
                                    577 ;	lib/src/stm8s_clk.c: 491: }
      0084C2                        578 00112$:
                                    579 ;	lib/src/stm8s_clk.c: 493: }
      0084C2 84               [ 1]  580 	pop	a
      0084C3 85               [ 2]  581 	popw	x
      0084C4 84               [ 1]  582 	pop	a
      0084C5 FC               [ 2]  583 	jp	(x)
                                    584 ;	lib/src/stm8s_clk.c: 500: void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
                                    585 ;	-----------------------------------------
                                    586 ;	 function CLK_SYSCLKConfig
                                    587 ;	-----------------------------------------
      0084C6                        588 _CLK_SYSCLKConfig:
      0084C6 88               [ 1]  589 	push	a
      0084C7 95               [ 1]  590 	ld	xh, a
                                    591 ;	lib/src/stm8s_clk.c: 507: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      0084C8 C6 50 C6         [ 1]  592 	ld	a, 0x50c6
                                    593 ;	lib/src/stm8s_clk.c: 505: if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
      0084CB 5D               [ 2]  594 	tnzw	x
      0084CC 2B 14            [ 1]  595 	jrmi	00102$
                                    596 ;	lib/src/stm8s_clk.c: 507: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      0084CE A4 E7            [ 1]  597 	and	a, #0xe7
      0084D0 C7 50 C6         [ 1]  598 	ld	0x50c6, a
                                    599 ;	lib/src/stm8s_clk.c: 508: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
      0084D3 C6 50 C6         [ 1]  600 	ld	a, 0x50c6
      0084D6 6B 01            [ 1]  601 	ld	(0x01, sp), a
      0084D8 9E               [ 1]  602 	ld	a, xh
      0084D9 A4 18            [ 1]  603 	and	a, #0x18
      0084DB 1A 01            [ 1]  604 	or	a, (0x01, sp)
      0084DD C7 50 C6         [ 1]  605 	ld	0x50c6, a
      0084E0 20 12            [ 2]  606 	jra	00104$
      0084E2                        607 00102$:
                                    608 ;	lib/src/stm8s_clk.c: 512: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
      0084E2 A4 F8            [ 1]  609 	and	a, #0xf8
      0084E4 C7 50 C6         [ 1]  610 	ld	0x50c6, a
                                    611 ;	lib/src/stm8s_clk.c: 513: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
      0084E7 C6 50 C6         [ 1]  612 	ld	a, 0x50c6
      0084EA 6B 01            [ 1]  613 	ld	(0x01, sp), a
      0084EC 9E               [ 1]  614 	ld	a, xh
      0084ED A4 07            [ 1]  615 	and	a, #0x07
      0084EF 1A 01            [ 1]  616 	or	a, (0x01, sp)
      0084F1 C7 50 C6         [ 1]  617 	ld	0x50c6, a
      0084F4                        618 00104$:
                                    619 ;	lib/src/stm8s_clk.c: 515: }
      0084F4 84               [ 1]  620 	pop	a
      0084F5 81               [ 4]  621 	ret
                                    622 ;	lib/src/stm8s_clk.c: 523: void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
                                    623 ;	-----------------------------------------
                                    624 ;	 function CLK_SWIMConfig
                                    625 ;	-----------------------------------------
      0084F6                        626 _CLK_SWIMConfig:
      0084F6 88               [ 1]  627 	push	a
      0084F7 6B 01            [ 1]  628 	ld	(0x01, sp), a
                                    629 ;	lib/src/stm8s_clk.c: 531: CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
      0084F9 C6 50 CD         [ 1]  630 	ld	a, 0x50cd
                                    631 ;	lib/src/stm8s_clk.c: 528: if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
      0084FC 0D 01            [ 1]  632 	tnz	(0x01, sp)
      0084FE 27 07            [ 1]  633 	jreq	00102$
                                    634 ;	lib/src/stm8s_clk.c: 531: CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
      008500 AA 01            [ 1]  635 	or	a, #0x01
      008502 C7 50 CD         [ 1]  636 	ld	0x50cd, a
      008505 20 05            [ 2]  637 	jra	00104$
      008507                        638 00102$:
                                    639 ;	lib/src/stm8s_clk.c: 536: CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
      008507 A4 FE            [ 1]  640 	and	a, #0xfe
      008509 C7 50 CD         [ 1]  641 	ld	0x50cd, a
      00850C                        642 00104$:
                                    643 ;	lib/src/stm8s_clk.c: 538: }
      00850C 84               [ 1]  644 	pop	a
      00850D 81               [ 4]  645 	ret
                                    646 ;	lib/src/stm8s_clk.c: 547: void CLK_ClockSecuritySystemEnable(void)
                                    647 ;	-----------------------------------------
                                    648 ;	 function CLK_ClockSecuritySystemEnable
                                    649 ;	-----------------------------------------
      00850E                        650 _CLK_ClockSecuritySystemEnable:
                                    651 ;	lib/src/stm8s_clk.c: 550: CLK->CSSR |= CLK_CSSR_CSSEN;
      00850E 72 10 50 C8      [ 1]  652 	bset	0x50c8, #0
                                    653 ;	lib/src/stm8s_clk.c: 551: }
      008512 81               [ 4]  654 	ret
                                    655 ;	lib/src/stm8s_clk.c: 559: CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
                                    656 ;	-----------------------------------------
                                    657 ;	 function CLK_GetSYSCLKSource
                                    658 ;	-----------------------------------------
      008513                        659 _CLK_GetSYSCLKSource:
                                    660 ;	lib/src/stm8s_clk.c: 561: return((CLK_Source_TypeDef)CLK->CMSR);
      008513 C6 50 C3         [ 1]  661 	ld	a, 0x50c3
                                    662 ;	lib/src/stm8s_clk.c: 562: }
      008516 81               [ 4]  663 	ret
                                    664 ;	lib/src/stm8s_clk.c: 569: uint32_t CLK_GetClockFreq(void)
                                    665 ;	-----------------------------------------
                                    666 ;	 function CLK_GetClockFreq
                                    667 ;	-----------------------------------------
      008517                        668 _CLK_GetClockFreq:
      008517 52 04            [ 2]  669 	sub	sp, #4
                                    670 ;	lib/src/stm8s_clk.c: 576: clocksource = (CLK_Source_TypeDef)CLK->CMSR;
      008519 C6 50 C3         [ 1]  671 	ld	a, 0x50c3
                                    672 ;	lib/src/stm8s_clk.c: 578: if (clocksource == CLK_SOURCE_HSI)
      00851C 6B 04            [ 1]  673 	ld	(0x04, sp), a
      00851E A1 E1            [ 1]  674 	cp	a, #0xe1
      008520 26 22            [ 1]  675 	jrne	00105$
                                    676 ;	lib/src/stm8s_clk.c: 580: tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
      008522 C6 50 C6         [ 1]  677 	ld	a, 0x50c6
      008525 A4 18            [ 1]  678 	and	a, #0x18
                                    679 ;	lib/src/stm8s_clk.c: 581: tmp = (uint8_t)(tmp >> 3);
      008527 44               [ 1]  680 	srl	a
      008528 44               [ 1]  681 	srl	a
      008529 44               [ 1]  682 	srl	a
                                    683 ;	lib/src/stm8s_clk.c: 582: clockfrequency = HSI_VALUE >> HSIDivExp[tmp];
      00852A 5F               [ 1]  684 	clrw	x
      00852B 97               [ 1]  685 	ld	xl, a
      00852C D6 80 2D         [ 1]  686 	ld	a, (_HSIDivExp+0, x)
      00852F AE 24 00         [ 2]  687 	ldw	x, #0x2400
      008532 1F 03            [ 2]  688 	ldw	(0x03, sp), x
      008534 AE 00 F4         [ 2]  689 	ldw	x, #0x00f4
      008537 4D               [ 1]  690 	tnz	a
      008538 27 21            [ 1]  691 	jreq	00106$
      00853A                        692 00122$:
      00853A 54               [ 2]  693 	srlw	x
      00853B 06 03            [ 1]  694 	rrc	(0x03, sp)
      00853D 06 04            [ 1]  695 	rrc	(0x04, sp)
      00853F 4A               [ 1]  696 	dec	a
      008540 26 F8            [ 1]  697 	jrne	00122$
      008542 20 17            [ 2]  698 	jra	00106$
      008544                        699 00105$:
                                    700 ;	lib/src/stm8s_clk.c: 584: else if ( clocksource == CLK_SOURCE_LSI)
      008544 7B 04            [ 1]  701 	ld	a, (0x04, sp)
      008546 A1 D2            [ 1]  702 	cp	a, #0xd2
      008548 26 09            [ 1]  703 	jrne	00102$
                                    704 ;	lib/src/stm8s_clk.c: 586: clockfrequency = LSI_VALUE;
      00854A AE F4 00         [ 2]  705 	ldw	x, #0xf400
      00854D 1F 03            [ 2]  706 	ldw	(0x03, sp), x
      00854F 5F               [ 1]  707 	clrw	x
      008550 5C               [ 1]  708 	incw	x
      008551 20 08            [ 2]  709 	jra	00106$
      008553                        710 00102$:
                                    711 ;	lib/src/stm8s_clk.c: 590: clockfrequency = HSE_VALUE;
      008553 AE 24 00         [ 2]  712 	ldw	x, #0x2400
      008556 1F 03            [ 2]  713 	ldw	(0x03, sp), x
      008558 AE 00 F4         [ 2]  714 	ldw	x, #0x00f4
      00855B                        715 00106$:
                                    716 ;	lib/src/stm8s_clk.c: 593: return((uint32_t)clockfrequency);
      00855B 51               [ 1]  717 	exgw	x, y
      00855C 1E 03            [ 2]  718 	ldw	x, (0x03, sp)
                                    719 ;	lib/src/stm8s_clk.c: 594: }
      00855E 5B 04            [ 2]  720 	addw	sp, #4
      008560 81               [ 4]  721 	ret
                                    722 ;	lib/src/stm8s_clk.c: 603: void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
                                    723 ;	-----------------------------------------
                                    724 ;	 function CLK_AdjustHSICalibrationValue
                                    725 ;	-----------------------------------------
      008561                        726 _CLK_AdjustHSICalibrationValue:
      008561 88               [ 1]  727 	push	a
      008562 6B 01            [ 1]  728 	ld	(0x01, sp), a
                                    729 ;	lib/src/stm8s_clk.c: 609: CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
      008564 C6 50 CC         [ 1]  730 	ld	a, 0x50cc
      008567 A4 F8            [ 1]  731 	and	a, #0xf8
      008569 1A 01            [ 1]  732 	or	a, (0x01, sp)
      00856B C7 50 CC         [ 1]  733 	ld	0x50cc, a
                                    734 ;	lib/src/stm8s_clk.c: 610: }
      00856E 84               [ 1]  735 	pop	a
      00856F 81               [ 4]  736 	ret
                                    737 ;	lib/src/stm8s_clk.c: 621: void CLK_SYSCLKEmergencyClear(void)
                                    738 ;	-----------------------------------------
                                    739 ;	 function CLK_SYSCLKEmergencyClear
                                    740 ;	-----------------------------------------
      008570                        741 _CLK_SYSCLKEmergencyClear:
                                    742 ;	lib/src/stm8s_clk.c: 623: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
      008570 72 11 50 C5      [ 1]  743 	bres	0x50c5, #0
                                    744 ;	lib/src/stm8s_clk.c: 624: }
      008574 81               [ 4]  745 	ret
                                    746 ;	lib/src/stm8s_clk.c: 633: FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
                                    747 ;	-----------------------------------------
                                    748 ;	 function CLK_GetFlagStatus
                                    749 ;	-----------------------------------------
      008575                        750 _CLK_GetFlagStatus:
      008575 52 04            [ 2]  751 	sub	sp, #4
                                    752 ;	lib/src/stm8s_clk.c: 643: statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
      008577 1F 03            [ 2]  753 	ldw	(0x03, sp), x
      008579 4F               [ 1]  754 	clr	a
      00857A 97               [ 1]  755 	ld	xl, a
                                    756 ;	lib/src/stm8s_clk.c: 646: if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
      00857B 1F 01            [ 2]  757 	ldw	(0x01, sp), x
      00857D A3 01 00         [ 2]  758 	cpw	x, #0x0100
      008580 26 05            [ 1]  759 	jrne	00111$
                                    760 ;	lib/src/stm8s_clk.c: 648: tmpreg = CLK->ICKR;
      008582 C6 50 C0         [ 1]  761 	ld	a, 0x50c0
      008585 20 27            [ 2]  762 	jra	00112$
      008587                        763 00111$:
                                    764 ;	lib/src/stm8s_clk.c: 650: else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
      008587 1E 01            [ 2]  765 	ldw	x, (0x01, sp)
      008589 A3 02 00         [ 2]  766 	cpw	x, #0x0200
      00858C 26 05            [ 1]  767 	jrne	00108$
                                    768 ;	lib/src/stm8s_clk.c: 652: tmpreg = CLK->ECKR;
      00858E C6 50 C1         [ 1]  769 	ld	a, 0x50c1
      008591 20 1B            [ 2]  770 	jra	00112$
      008593                        771 00108$:
                                    772 ;	lib/src/stm8s_clk.c: 654: else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
      008593 1E 01            [ 2]  773 	ldw	x, (0x01, sp)
      008595 A3 03 00         [ 2]  774 	cpw	x, #0x0300
      008598 26 05            [ 1]  775 	jrne	00105$
                                    776 ;	lib/src/stm8s_clk.c: 656: tmpreg = CLK->SWCR;
      00859A C6 50 C5         [ 1]  777 	ld	a, 0x50c5
      00859D 20 0F            [ 2]  778 	jra	00112$
      00859F                        779 00105$:
                                    780 ;	lib/src/stm8s_clk.c: 658: else if (statusreg == 0x0400) /* The flag to check is in CSS register */
      00859F 1E 01            [ 2]  781 	ldw	x, (0x01, sp)
      0085A1 A3 04 00         [ 2]  782 	cpw	x, #0x0400
      0085A4 26 05            [ 1]  783 	jrne	00102$
                                    784 ;	lib/src/stm8s_clk.c: 660: tmpreg = CLK->CSSR;
      0085A6 C6 50 C8         [ 1]  785 	ld	a, 0x50c8
      0085A9 20 03            [ 2]  786 	jra	00112$
      0085AB                        787 00102$:
                                    788 ;	lib/src/stm8s_clk.c: 664: tmpreg = CLK->CCOR;
      0085AB C6 50 C9         [ 1]  789 	ld	a, 0x50c9
      0085AE                        790 00112$:
                                    791 ;	lib/src/stm8s_clk.c: 667: if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
      0085AE 88               [ 1]  792 	push	a
      0085AF 7B 05            [ 1]  793 	ld	a, (0x05, sp)
      0085B1 6B 03            [ 1]  794 	ld	(0x03, sp), a
      0085B3 84               [ 1]  795 	pop	a
      0085B4 14 02            [ 1]  796 	and	a, (0x02, sp)
      0085B6 27 03            [ 1]  797 	jreq	00114$
                                    798 ;	lib/src/stm8s_clk.c: 669: bitstatus = SET;
      0085B8 A6 01            [ 1]  799 	ld	a, #0x01
                                    800 ;	lib/src/stm8s_clk.c: 673: bitstatus = RESET;
      0085BA 21                     801 	.byte 0x21
      0085BB                        802 00114$:
      0085BB 4F               [ 1]  803 	clr	a
      0085BC                        804 00115$:
                                    805 ;	lib/src/stm8s_clk.c: 677: return((FlagStatus)bitstatus);
                                    806 ;	lib/src/stm8s_clk.c: 678: }
      0085BC 5B 04            [ 2]  807 	addw	sp, #4
      0085BE 81               [ 4]  808 	ret
                                    809 ;	lib/src/stm8s_clk.c: 686: ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
                                    810 ;	-----------------------------------------
                                    811 ;	 function CLK_GetITStatus
                                    812 ;	-----------------------------------------
      0085BF                        813 _CLK_GetITStatus:
      0085BF 88               [ 1]  814 	push	a
                                    815 ;	lib/src/stm8s_clk.c: 693: if (CLK_IT == CLK_IT_SWIF)
      0085C0 6B 01            [ 1]  816 	ld	(0x01, sp), a
      0085C2 A1 1C            [ 1]  817 	cp	a, #0x1c
      0085C4 26 0F            [ 1]  818 	jrne	00108$
                                    819 ;	lib/src/stm8s_clk.c: 696: if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      0085C6 C6 50 C5         [ 1]  820 	ld	a, 0x50c5
      0085C9 14 01            [ 1]  821 	and	a, (0x01, sp)
                                    822 ;	lib/src/stm8s_clk.c: 698: bitstatus = SET;
      0085CB A0 0C            [ 1]  823 	sub	a, #0x0c
      0085CD 26 03            [ 1]  824 	jrne	00102$
      0085CF 4C               [ 1]  825 	inc	a
      0085D0 20 0F            [ 2]  826 	jra	00109$
      0085D2                        827 00102$:
                                    828 ;	lib/src/stm8s_clk.c: 702: bitstatus = RESET;
      0085D2 4F               [ 1]  829 	clr	a
      0085D3 20 0C            [ 2]  830 	jra	00109$
      0085D5                        831 00108$:
                                    832 ;	lib/src/stm8s_clk.c: 708: if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      0085D5 C6 50 C8         [ 1]  833 	ld	a, 0x50c8
      0085D8 14 01            [ 1]  834 	and	a, (0x01, sp)
                                    835 ;	lib/src/stm8s_clk.c: 710: bitstatus = SET;
      0085DA A0 0C            [ 1]  836 	sub	a, #0x0c
      0085DC 26 02            [ 1]  837 	jrne	00105$
      0085DE 4C               [ 1]  838 	inc	a
                                    839 ;	lib/src/stm8s_clk.c: 714: bitstatus = RESET;
      0085DF 21                     840 	.byte 0x21
      0085E0                        841 00105$:
      0085E0 4F               [ 1]  842 	clr	a
      0085E1                        843 00109$:
                                    844 ;	lib/src/stm8s_clk.c: 719: return bitstatus;
                                    845 ;	lib/src/stm8s_clk.c: 720: }
      0085E1 5B 01            [ 2]  846 	addw	sp, #1
      0085E3 81               [ 4]  847 	ret
                                    848 ;	lib/src/stm8s_clk.c: 728: void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
                                    849 ;	-----------------------------------------
                                    850 ;	 function CLK_ClearITPendingBit
                                    851 ;	-----------------------------------------
      0085E4                        852 _CLK_ClearITPendingBit:
                                    853 ;	lib/src/stm8s_clk.c: 733: if (CLK_IT == (uint8_t)CLK_IT_CSSD)
      0085E4 A1 0C            [ 1]  854 	cp	a, #0x0c
      0085E6 26 05            [ 1]  855 	jrne	00102$
                                    856 ;	lib/src/stm8s_clk.c: 736: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
      0085E8 72 17 50 C8      [ 1]  857 	bres	0x50c8, #3
      0085EC 81               [ 4]  858 	ret
      0085ED                        859 00102$:
                                    860 ;	lib/src/stm8s_clk.c: 741: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
      0085ED 72 17 50 C5      [ 1]  861 	bres	0x50c5, #3
                                    862 ;	lib/src/stm8s_clk.c: 744: }
      0085F1 81               [ 4]  863 	ret
                                    864 	.area CODE
                                    865 	.area CONST
      00802D                        866 _HSIDivExp:
      00802D 00                     867 	.db #0x00	; 0
      00802E 01                     868 	.db #0x01	; 1
      00802F 02                     869 	.db #0x02	; 2
      008030 03                     870 	.db #0x03	; 3
      008031                        871 _CLKPrescTable:
      008031 01                     872 	.db #0x01	; 1
      008032 02                     873 	.db #0x02	; 2
      008033 04                     874 	.db #0x04	; 4
      008034 08                     875 	.db #0x08	; 8
      008035 0A                     876 	.db #0x0a	; 10
      008036 10                     877 	.db #0x10	; 16
      008037 14                     878 	.db #0x14	; 20
      008038 28                     879 	.db #0x28	; 40
                                    880 	.area INITIALIZER
                                    881 	.area CABS (ABS)
