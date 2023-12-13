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
      008281                         77 _CLK_DeInit:
                                     78 ;	lib/src/stm8s_clk.c: 74: CLK->ICKR = CLK_ICKR_RESET_VALUE;
      008281 35 01 50 C0      [ 1]   79 	mov	0x50c0+0, #0x01
                                     80 ;	lib/src/stm8s_clk.c: 75: CLK->ECKR = CLK_ECKR_RESET_VALUE;
      008285 35 00 50 C1      [ 1]   81 	mov	0x50c1+0, #0x00
                                     82 ;	lib/src/stm8s_clk.c: 76: CLK->SWR  = CLK_SWR_RESET_VALUE;
      008289 35 E1 50 C4      [ 1]   83 	mov	0x50c4+0, #0xe1
                                     84 ;	lib/src/stm8s_clk.c: 77: CLK->SWCR = CLK_SWCR_RESET_VALUE;
      00828D 35 00 50 C5      [ 1]   85 	mov	0x50c5+0, #0x00
                                     86 ;	lib/src/stm8s_clk.c: 78: CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
      008291 35 18 50 C6      [ 1]   87 	mov	0x50c6+0, #0x18
                                     88 ;	lib/src/stm8s_clk.c: 79: CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
      008295 35 FF 50 C7      [ 1]   89 	mov	0x50c7+0, #0xff
                                     90 ;	lib/src/stm8s_clk.c: 80: CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
      008299 35 FF 50 CA      [ 1]   91 	mov	0x50ca+0, #0xff
                                     92 ;	lib/src/stm8s_clk.c: 81: CLK->CSSR = CLK_CSSR_RESET_VALUE;
      00829D 35 00 50 C8      [ 1]   93 	mov	0x50c8+0, #0x00
                                     94 ;	lib/src/stm8s_clk.c: 82: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      0082A1 35 00 50 C9      [ 1]   95 	mov	0x50c9+0, #0x00
                                     96 ;	lib/src/stm8s_clk.c: 83: while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
      0082A5                         97 00101$:
      0082A5 72 00 50 C9 FB   [ 2]   98 	btjt	0x50c9, #0, 00101$
                                     99 ;	lib/src/stm8s_clk.c: 85: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      0082AA 35 00 50 C9      [ 1]  100 	mov	0x50c9+0, #0x00
                                    101 ;	lib/src/stm8s_clk.c: 86: CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
      0082AE 35 00 50 CC      [ 1]  102 	mov	0x50cc+0, #0x00
                                    103 ;	lib/src/stm8s_clk.c: 87: CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
      0082B2 35 00 50 CD      [ 1]  104 	mov	0x50cd+0, #0x00
                                    105 ;	lib/src/stm8s_clk.c: 88: }
      0082B6 81               [ 4]  106 	ret
                                    107 ;	lib/src/stm8s_clk.c: 99: void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
                                    108 ;	-----------------------------------------
                                    109 ;	 function CLK_FastHaltWakeUpCmd
                                    110 ;	-----------------------------------------
      0082B7                        111 _CLK_FastHaltWakeUpCmd:
      0082B7 88               [ 1]  112 	push	a
      0082B8 6B 01            [ 1]  113 	ld	(0x01, sp), a
                                    114 ;	lib/src/stm8s_clk.c: 107: CLK->ICKR |= CLK_ICKR_FHWU;
      0082BA C6 50 C0         [ 1]  115 	ld	a, 0x50c0
                                    116 ;	lib/src/stm8s_clk.c: 104: if (NewState != DISABLE)
      0082BD 0D 01            [ 1]  117 	tnz	(0x01, sp)
      0082BF 27 07            [ 1]  118 	jreq	00102$
                                    119 ;	lib/src/stm8s_clk.c: 107: CLK->ICKR |= CLK_ICKR_FHWU;
      0082C1 AA 04            [ 1]  120 	or	a, #0x04
      0082C3 C7 50 C0         [ 1]  121 	ld	0x50c0, a
      0082C6 20 05            [ 2]  122 	jra	00104$
      0082C8                        123 00102$:
                                    124 ;	lib/src/stm8s_clk.c: 112: CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
      0082C8 A4 FB            [ 1]  125 	and	a, #0xfb
      0082CA C7 50 C0         [ 1]  126 	ld	0x50c0, a
      0082CD                        127 00104$:
                                    128 ;	lib/src/stm8s_clk.c: 114: }
      0082CD 84               [ 1]  129 	pop	a
      0082CE 81               [ 4]  130 	ret
                                    131 ;	lib/src/stm8s_clk.c: 121: void CLK_HSECmd(FunctionalState NewState)
                                    132 ;	-----------------------------------------
                                    133 ;	 function CLK_HSECmd
                                    134 ;	-----------------------------------------
      0082CF                        135 _CLK_HSECmd:
      0082CF 88               [ 1]  136 	push	a
      0082D0 6B 01            [ 1]  137 	ld	(0x01, sp), a
                                    138 ;	lib/src/stm8s_clk.c: 129: CLK->ECKR |= CLK_ECKR_HSEEN;
      0082D2 C6 50 C1         [ 1]  139 	ld	a, 0x50c1
                                    140 ;	lib/src/stm8s_clk.c: 126: if (NewState != DISABLE)
      0082D5 0D 01            [ 1]  141 	tnz	(0x01, sp)
      0082D7 27 07            [ 1]  142 	jreq	00102$
                                    143 ;	lib/src/stm8s_clk.c: 129: CLK->ECKR |= CLK_ECKR_HSEEN;
      0082D9 AA 01            [ 1]  144 	or	a, #0x01
      0082DB C7 50 C1         [ 1]  145 	ld	0x50c1, a
      0082DE 20 05            [ 2]  146 	jra	00104$
      0082E0                        147 00102$:
                                    148 ;	lib/src/stm8s_clk.c: 134: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
      0082E0 A4 FE            [ 1]  149 	and	a, #0xfe
      0082E2 C7 50 C1         [ 1]  150 	ld	0x50c1, a
      0082E5                        151 00104$:
                                    152 ;	lib/src/stm8s_clk.c: 136: }
      0082E5 84               [ 1]  153 	pop	a
      0082E6 81               [ 4]  154 	ret
                                    155 ;	lib/src/stm8s_clk.c: 143: void CLK_HSICmd(FunctionalState NewState)
                                    156 ;	-----------------------------------------
                                    157 ;	 function CLK_HSICmd
                                    158 ;	-----------------------------------------
      0082E7                        159 _CLK_HSICmd:
      0082E7 88               [ 1]  160 	push	a
      0082E8 6B 01            [ 1]  161 	ld	(0x01, sp), a
                                    162 ;	lib/src/stm8s_clk.c: 151: CLK->ICKR |= CLK_ICKR_HSIEN;
      0082EA C6 50 C0         [ 1]  163 	ld	a, 0x50c0
                                    164 ;	lib/src/stm8s_clk.c: 148: if (NewState != DISABLE)
      0082ED 0D 01            [ 1]  165 	tnz	(0x01, sp)
      0082EF 27 07            [ 1]  166 	jreq	00102$
                                    167 ;	lib/src/stm8s_clk.c: 151: CLK->ICKR |= CLK_ICKR_HSIEN;
      0082F1 AA 01            [ 1]  168 	or	a, #0x01
      0082F3 C7 50 C0         [ 1]  169 	ld	0x50c0, a
      0082F6 20 05            [ 2]  170 	jra	00104$
      0082F8                        171 00102$:
                                    172 ;	lib/src/stm8s_clk.c: 156: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
      0082F8 A4 FE            [ 1]  173 	and	a, #0xfe
      0082FA C7 50 C0         [ 1]  174 	ld	0x50c0, a
      0082FD                        175 00104$:
                                    176 ;	lib/src/stm8s_clk.c: 158: }
      0082FD 84               [ 1]  177 	pop	a
      0082FE 81               [ 4]  178 	ret
                                    179 ;	lib/src/stm8s_clk.c: 166: void CLK_LSICmd(FunctionalState NewState)
                                    180 ;	-----------------------------------------
                                    181 ;	 function CLK_LSICmd
                                    182 ;	-----------------------------------------
      0082FF                        183 _CLK_LSICmd:
      0082FF 88               [ 1]  184 	push	a
      008300 6B 01            [ 1]  185 	ld	(0x01, sp), a
                                    186 ;	lib/src/stm8s_clk.c: 174: CLK->ICKR |= CLK_ICKR_LSIEN;
      008302 C6 50 C0         [ 1]  187 	ld	a, 0x50c0
                                    188 ;	lib/src/stm8s_clk.c: 171: if (NewState != DISABLE)
      008305 0D 01            [ 1]  189 	tnz	(0x01, sp)
      008307 27 07            [ 1]  190 	jreq	00102$
                                    191 ;	lib/src/stm8s_clk.c: 174: CLK->ICKR |= CLK_ICKR_LSIEN;
      008309 AA 08            [ 1]  192 	or	a, #0x08
      00830B C7 50 C0         [ 1]  193 	ld	0x50c0, a
      00830E 20 05            [ 2]  194 	jra	00104$
      008310                        195 00102$:
                                    196 ;	lib/src/stm8s_clk.c: 179: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
      008310 A4 F7            [ 1]  197 	and	a, #0xf7
      008312 C7 50 C0         [ 1]  198 	ld	0x50c0, a
      008315                        199 00104$:
                                    200 ;	lib/src/stm8s_clk.c: 181: }
      008315 84               [ 1]  201 	pop	a
      008316 81               [ 4]  202 	ret
                                    203 ;	lib/src/stm8s_clk.c: 189: void CLK_CCOCmd(FunctionalState NewState)
                                    204 ;	-----------------------------------------
                                    205 ;	 function CLK_CCOCmd
                                    206 ;	-----------------------------------------
      008317                        207 _CLK_CCOCmd:
      008317 88               [ 1]  208 	push	a
      008318 6B 01            [ 1]  209 	ld	(0x01, sp), a
                                    210 ;	lib/src/stm8s_clk.c: 197: CLK->CCOR |= CLK_CCOR_CCOEN;
      00831A C6 50 C9         [ 1]  211 	ld	a, 0x50c9
                                    212 ;	lib/src/stm8s_clk.c: 194: if (NewState != DISABLE)
      00831D 0D 01            [ 1]  213 	tnz	(0x01, sp)
      00831F 27 07            [ 1]  214 	jreq	00102$
                                    215 ;	lib/src/stm8s_clk.c: 197: CLK->CCOR |= CLK_CCOR_CCOEN;
      008321 AA 01            [ 1]  216 	or	a, #0x01
      008323 C7 50 C9         [ 1]  217 	ld	0x50c9, a
      008326 20 05            [ 2]  218 	jra	00104$
      008328                        219 00102$:
                                    220 ;	lib/src/stm8s_clk.c: 202: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
      008328 A4 FE            [ 1]  221 	and	a, #0xfe
      00832A C7 50 C9         [ 1]  222 	ld	0x50c9, a
      00832D                        223 00104$:
                                    224 ;	lib/src/stm8s_clk.c: 204: }
      00832D 84               [ 1]  225 	pop	a
      00832E 81               [ 4]  226 	ret
                                    227 ;	lib/src/stm8s_clk.c: 213: void CLK_ClockSwitchCmd(FunctionalState NewState)
                                    228 ;	-----------------------------------------
                                    229 ;	 function CLK_ClockSwitchCmd
                                    230 ;	-----------------------------------------
      00832F                        231 _CLK_ClockSwitchCmd:
      00832F 88               [ 1]  232 	push	a
      008330 6B 01            [ 1]  233 	ld	(0x01, sp), a
                                    234 ;	lib/src/stm8s_clk.c: 221: CLK->SWCR |= CLK_SWCR_SWEN;
      008332 C6 50 C5         [ 1]  235 	ld	a, 0x50c5
                                    236 ;	lib/src/stm8s_clk.c: 218: if (NewState != DISABLE )
      008335 0D 01            [ 1]  237 	tnz	(0x01, sp)
      008337 27 07            [ 1]  238 	jreq	00102$
                                    239 ;	lib/src/stm8s_clk.c: 221: CLK->SWCR |= CLK_SWCR_SWEN;
      008339 AA 02            [ 1]  240 	or	a, #0x02
      00833B C7 50 C5         [ 1]  241 	ld	0x50c5, a
      00833E 20 05            [ 2]  242 	jra	00104$
      008340                        243 00102$:
                                    244 ;	lib/src/stm8s_clk.c: 226: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
      008340 A4 FD            [ 1]  245 	and	a, #0xfd
      008342 C7 50 C5         [ 1]  246 	ld	0x50c5, a
      008345                        247 00104$:
                                    248 ;	lib/src/stm8s_clk.c: 228: }
      008345 84               [ 1]  249 	pop	a
      008346 81               [ 4]  250 	ret
                                    251 ;	lib/src/stm8s_clk.c: 238: void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
                                    252 ;	-----------------------------------------
                                    253 ;	 function CLK_SlowActiveHaltWakeUpCmd
                                    254 ;	-----------------------------------------
      008347                        255 _CLK_SlowActiveHaltWakeUpCmd:
      008347 88               [ 1]  256 	push	a
      008348 6B 01            [ 1]  257 	ld	(0x01, sp), a
                                    258 ;	lib/src/stm8s_clk.c: 246: CLK->ICKR |= CLK_ICKR_SWUAH;
      00834A C6 50 C0         [ 1]  259 	ld	a, 0x50c0
                                    260 ;	lib/src/stm8s_clk.c: 243: if (NewState != DISABLE)
      00834D 0D 01            [ 1]  261 	tnz	(0x01, sp)
      00834F 27 07            [ 1]  262 	jreq	00102$
                                    263 ;	lib/src/stm8s_clk.c: 246: CLK->ICKR |= CLK_ICKR_SWUAH;
      008351 AA 20            [ 1]  264 	or	a, #0x20
      008353 C7 50 C0         [ 1]  265 	ld	0x50c0, a
      008356 20 05            [ 2]  266 	jra	00104$
      008358                        267 00102$:
                                    268 ;	lib/src/stm8s_clk.c: 251: CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
      008358 A4 DF            [ 1]  269 	and	a, #0xdf
      00835A C7 50 C0         [ 1]  270 	ld	0x50c0, a
      00835D                        271 00104$:
                                    272 ;	lib/src/stm8s_clk.c: 253: }
      00835D 84               [ 1]  273 	pop	a
      00835E 81               [ 4]  274 	ret
                                    275 ;	lib/src/stm8s_clk.c: 263: void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
                                    276 ;	-----------------------------------------
                                    277 ;	 function CLK_PeripheralClockConfig
                                    278 ;	-----------------------------------------
      00835F                        279 _CLK_PeripheralClockConfig:
      00835F 52 02            [ 2]  280 	sub	sp, #2
                                    281 ;	lib/src/stm8s_clk.c: 274: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008361 97               [ 1]  282 	ld	xl, a
      008362 A4 0F            [ 1]  283 	and	a, #0x0f
      008364 88               [ 1]  284 	push	a
      008365 A6 01            [ 1]  285 	ld	a, #0x01
      008367 6B 02            [ 1]  286 	ld	(0x02, sp), a
      008369 84               [ 1]  287 	pop	a
      00836A 4D               [ 1]  288 	tnz	a
      00836B 27 05            [ 1]  289 	jreq	00128$
      00836D                        290 00127$:
      00836D 08 01            [ 1]  291 	sll	(0x01, sp)
      00836F 4A               [ 1]  292 	dec	a
      008370 26 FB            [ 1]  293 	jrne	00127$
      008372                        294 00128$:
                                    295 ;	lib/src/stm8s_clk.c: 279: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      008372 7B 01            [ 1]  296 	ld	a, (0x01, sp)
      008374 43               [ 1]  297 	cpl	a
      008375 6B 02            [ 1]  298 	ld	(0x02, sp), a
                                    299 ;	lib/src/stm8s_clk.c: 269: if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
      008377 9F               [ 1]  300 	ld	a, xl
      008378 A5 10            [ 1]  301 	bcp	a, #0x10
      00837A 26 15            [ 1]  302 	jrne	00108$
                                    303 ;	lib/src/stm8s_clk.c: 274: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      00837C C6 50 C7         [ 1]  304 	ld	a, 0x50c7
                                    305 ;	lib/src/stm8s_clk.c: 271: if (NewState != DISABLE)
      00837F 0D 05            [ 1]  306 	tnz	(0x05, sp)
      008381 27 07            [ 1]  307 	jreq	00102$
                                    308 ;	lib/src/stm8s_clk.c: 274: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008383 1A 01            [ 1]  309 	or	a, (0x01, sp)
      008385 C7 50 C7         [ 1]  310 	ld	0x50c7, a
      008388 20 1A            [ 2]  311 	jra	00110$
      00838A                        312 00102$:
                                    313 ;	lib/src/stm8s_clk.c: 279: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      00838A 14 02            [ 1]  314 	and	a, (0x02, sp)
      00838C C7 50 C7         [ 1]  315 	ld	0x50c7, a
      00838F 20 13            [ 2]  316 	jra	00110$
      008391                        317 00108$:
                                    318 ;	lib/src/stm8s_clk.c: 287: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008391 C6 50 CA         [ 1]  319 	ld	a, 0x50ca
                                    320 ;	lib/src/stm8s_clk.c: 284: if (NewState != DISABLE)
      008394 0D 05            [ 1]  321 	tnz	(0x05, sp)
      008396 27 07            [ 1]  322 	jreq	00105$
                                    323 ;	lib/src/stm8s_clk.c: 287: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008398 1A 01            [ 1]  324 	or	a, (0x01, sp)
      00839A C7 50 CA         [ 1]  325 	ld	0x50ca, a
      00839D 20 05            [ 2]  326 	jra	00110$
      00839F                        327 00105$:
                                    328 ;	lib/src/stm8s_clk.c: 292: CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      00839F 14 02            [ 1]  329 	and	a, (0x02, sp)
      0083A1 C7 50 CA         [ 1]  330 	ld	0x50ca, a
      0083A4                        331 00110$:
                                    332 ;	lib/src/stm8s_clk.c: 295: }
      0083A4 5B 02            [ 2]  333 	addw	sp, #2
      0083A6 85               [ 2]  334 	popw	x
      0083A7 84               [ 1]  335 	pop	a
      0083A8 FC               [ 2]  336 	jp	(x)
                                    337 ;	lib/src/stm8s_clk.c: 309: ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
                                    338 ;	-----------------------------------------
                                    339 ;	 function CLK_ClockSwitchConfig
                                    340 ;	-----------------------------------------
      0083A9                        341 _CLK_ClockSwitchConfig:
      0083A9 88               [ 1]  342 	push	a
      0083AA 6B 01            [ 1]  343 	ld	(0x01, sp), a
                                    344 ;	lib/src/stm8s_clk.c: 322: clock_master = (CLK_Source_TypeDef)CLK->CMSR;
      0083AC C6 50 C3         [ 1]  345 	ld	a, 0x50c3
      0083AF 90 97            [ 1]  346 	ld	yl, a
                                    347 ;	lib/src/stm8s_clk.c: 328: CLK->SWCR |= CLK_SWCR_SWEN;
      0083B1 C6 50 C5         [ 1]  348 	ld	a, 0x50c5
                                    349 ;	lib/src/stm8s_clk.c: 325: if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
      0083B4 0D 01            [ 1]  350 	tnz	(0x01, sp)
      0083B6 27 36            [ 1]  351 	jreq	00122$
                                    352 ;	lib/src/stm8s_clk.c: 328: CLK->SWCR |= CLK_SWCR_SWEN;
      0083B8 AA 02            [ 1]  353 	or	a, #0x02
      0083BA C7 50 C5         [ 1]  354 	ld	0x50c5, a
      0083BD C6 50 C5         [ 1]  355 	ld	a, 0x50c5
                                    356 ;	lib/src/stm8s_clk.c: 331: if (ITState != DISABLE)
      0083C0 0D 05            [ 1]  357 	tnz	(0x05, sp)
      0083C2 27 07            [ 1]  358 	jreq	00102$
                                    359 ;	lib/src/stm8s_clk.c: 333: CLK->SWCR |= CLK_SWCR_SWIEN;
      0083C4 AA 04            [ 1]  360 	or	a, #0x04
      0083C6 C7 50 C5         [ 1]  361 	ld	0x50c5, a
      0083C9 20 05            [ 2]  362 	jra	00103$
      0083CB                        363 00102$:
                                    364 ;	lib/src/stm8s_clk.c: 337: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
      0083CB A4 FB            [ 1]  365 	and	a, #0xfb
      0083CD C7 50 C5         [ 1]  366 	ld	0x50c5, a
      0083D0                        367 00103$:
                                    368 ;	lib/src/stm8s_clk.c: 341: CLK->SWR = (uint8_t)CLK_NewClock;
      0083D0 AE 50 C4         [ 2]  369 	ldw	x, #0x50c4
      0083D3 7B 04            [ 1]  370 	ld	a, (0x04, sp)
      0083D5 F7               [ 1]  371 	ld	(x), a
                                    372 ;	lib/src/stm8s_clk.c: 344: while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
      0083D6 5F               [ 1]  373 	clrw	x
      0083D7 5A               [ 2]  374 	decw	x
      0083D8                        375 00105$:
      0083D8 72 01 50 C5 06   [ 2]  376 	btjf	0x50c5, #0, 00107$
      0083DD 5D               [ 2]  377 	tnzw	x
      0083DE 27 03            [ 1]  378 	jreq	00107$
                                    379 ;	lib/src/stm8s_clk.c: 346: DownCounter--;
      0083E0 5A               [ 2]  380 	decw	x
      0083E1 20 F5            [ 2]  381 	jra	00105$
      0083E3                        382 00107$:
                                    383 ;	lib/src/stm8s_clk.c: 349: if(DownCounter != 0)
      0083E3 5D               [ 2]  384 	tnzw	x
      0083E4 27 05            [ 1]  385 	jreq	00109$
                                    386 ;	lib/src/stm8s_clk.c: 351: Swif = SUCCESS;
      0083E6 A6 01            [ 1]  387 	ld	a, #0x01
      0083E8 97               [ 1]  388 	ld	xl, a
      0083E9 20 32            [ 2]  389 	jra	00123$
      0083EB                        390 00109$:
                                    391 ;	lib/src/stm8s_clk.c: 355: Swif = ERROR;
      0083EB 5F               [ 1]  392 	clrw	x
      0083EC 20 2F            [ 2]  393 	jra	00123$
      0083EE                        394 00122$:
                                    395 ;	lib/src/stm8s_clk.c: 361: if (ITState != DISABLE)
      0083EE 0D 05            [ 1]  396 	tnz	(0x05, sp)
      0083F0 27 07            [ 1]  397 	jreq	00112$
                                    398 ;	lib/src/stm8s_clk.c: 363: CLK->SWCR |= CLK_SWCR_SWIEN;
      0083F2 AA 04            [ 1]  399 	or	a, #0x04
      0083F4 C7 50 C5         [ 1]  400 	ld	0x50c5, a
      0083F7 20 05            [ 2]  401 	jra	00113$
      0083F9                        402 00112$:
                                    403 ;	lib/src/stm8s_clk.c: 367: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
      0083F9 A4 FB            [ 1]  404 	and	a, #0xfb
      0083FB C7 50 C5         [ 1]  405 	ld	0x50c5, a
      0083FE                        406 00113$:
                                    407 ;	lib/src/stm8s_clk.c: 371: CLK->SWR = (uint8_t)CLK_NewClock;
      0083FE AE 50 C4         [ 2]  408 	ldw	x, #0x50c4
      008401 7B 04            [ 1]  409 	ld	a, (0x04, sp)
      008403 F7               [ 1]  410 	ld	(x), a
                                    411 ;	lib/src/stm8s_clk.c: 374: while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
      008404 5F               [ 1]  412 	clrw	x
      008405 5A               [ 2]  413 	decw	x
      008406                        414 00115$:
      008406 72 07 50 C5 06   [ 2]  415 	btjf	0x50c5, #3, 00117$
      00840B 5D               [ 2]  416 	tnzw	x
      00840C 27 03            [ 1]  417 	jreq	00117$
                                    418 ;	lib/src/stm8s_clk.c: 376: DownCounter--;
      00840E 5A               [ 2]  419 	decw	x
      00840F 20 F5            [ 2]  420 	jra	00115$
      008411                        421 00117$:
                                    422 ;	lib/src/stm8s_clk.c: 379: if(DownCounter != 0)
      008411 5D               [ 2]  423 	tnzw	x
      008412 27 08            [ 1]  424 	jreq	00119$
                                    425 ;	lib/src/stm8s_clk.c: 382: CLK->SWCR |= CLK_SWCR_SWEN;
      008414 72 12 50 C5      [ 1]  426 	bset	0x50c5, #1
                                    427 ;	lib/src/stm8s_clk.c: 383: Swif = SUCCESS;
      008418 A6 01            [ 1]  428 	ld	a, #0x01
      00841A 97               [ 1]  429 	ld	xl, a
                                    430 ;	lib/src/stm8s_clk.c: 387: Swif = ERROR;
      00841B 21                     431 	.byte 0x21
      00841C                        432 00119$:
      00841C 5F               [ 1]  433 	clrw	x
      00841D                        434 00123$:
                                    435 ;	lib/src/stm8s_clk.c: 390: if(Swif != ERROR)
      00841D 9F               [ 1]  436 	ld	a, xl
      00841E 4D               [ 1]  437 	tnz	a
      00841F 27 2E            [ 1]  438 	jreq	00136$
                                    439 ;	lib/src/stm8s_clk.c: 393: if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
      008421 0D 06            [ 1]  440 	tnz	(0x06, sp)
      008423 26 0C            [ 1]  441 	jrne	00132$
      008425 90 9F            [ 1]  442 	ld	a, yl
      008427 A1 E1            [ 1]  443 	cp	a, #0xe1
      008429 26 06            [ 1]  444 	jrne	00132$
                                    445 ;	lib/src/stm8s_clk.c: 395: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
      00842B 72 11 50 C0      [ 1]  446 	bres	0x50c0, #0
      00842F 20 1E            [ 2]  447 	jra	00136$
      008431                        448 00132$:
                                    449 ;	lib/src/stm8s_clk.c: 397: else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
      008431 0D 06            [ 1]  450 	tnz	(0x06, sp)
      008433 26 0C            [ 1]  451 	jrne	00128$
      008435 90 9F            [ 1]  452 	ld	a, yl
      008437 A1 D2            [ 1]  453 	cp	a, #0xd2
      008439 26 06            [ 1]  454 	jrne	00128$
                                    455 ;	lib/src/stm8s_clk.c: 399: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
      00843B 72 17 50 C0      [ 1]  456 	bres	0x50c0, #3
      00843F 20 0E            [ 2]  457 	jra	00136$
      008441                        458 00128$:
                                    459 ;	lib/src/stm8s_clk.c: 401: else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
      008441 0D 06            [ 1]  460 	tnz	(0x06, sp)
      008443 26 0A            [ 1]  461 	jrne	00136$
      008445 90 9F            [ 1]  462 	ld	a, yl
      008447 A1 B4            [ 1]  463 	cp	a, #0xb4
      008449 26 04            [ 1]  464 	jrne	00136$
                                    465 ;	lib/src/stm8s_clk.c: 403: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
      00844B 72 11 50 C1      [ 1]  466 	bres	0x50c1, #0
      00844F                        467 00136$:
                                    468 ;	lib/src/stm8s_clk.c: 406: return(Swif);
      00844F 9F               [ 1]  469 	ld	a, xl
                                    470 ;	lib/src/stm8s_clk.c: 407: }
      008450 1E 02            [ 2]  471 	ldw	x, (2, sp)
      008452 5B 06            [ 2]  472 	addw	sp, #6
      008454 FC               [ 2]  473 	jp	(x)
                                    474 ;	lib/src/stm8s_clk.c: 415: void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
                                    475 ;	-----------------------------------------
                                    476 ;	 function CLK_HSIPrescalerConfig
                                    477 ;	-----------------------------------------
      008455                        478 _CLK_HSIPrescalerConfig:
      008455 88               [ 1]  479 	push	a
      008456 6B 01            [ 1]  480 	ld	(0x01, sp), a
                                    481 ;	lib/src/stm8s_clk.c: 421: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      008458 C6 50 C6         [ 1]  482 	ld	a, 0x50c6
      00845B A4 E7            [ 1]  483 	and	a, #0xe7
      00845D C7 50 C6         [ 1]  484 	ld	0x50c6, a
                                    485 ;	lib/src/stm8s_clk.c: 424: CLK->CKDIVR |= (uint8_t)HSIPrescaler;
      008460 C6 50 C6         [ 1]  486 	ld	a, 0x50c6
      008463 1A 01            [ 1]  487 	or	a, (0x01, sp)
      008465 C7 50 C6         [ 1]  488 	ld	0x50c6, a
                                    489 ;	lib/src/stm8s_clk.c: 425: }
      008468 84               [ 1]  490 	pop	a
      008469 81               [ 4]  491 	ret
                                    492 ;	lib/src/stm8s_clk.c: 436: void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
                                    493 ;	-----------------------------------------
                                    494 ;	 function CLK_CCOConfig
                                    495 ;	-----------------------------------------
      00846A                        496 _CLK_CCOConfig:
      00846A 88               [ 1]  497 	push	a
      00846B 6B 01            [ 1]  498 	ld	(0x01, sp), a
                                    499 ;	lib/src/stm8s_clk.c: 442: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
      00846D C6 50 C9         [ 1]  500 	ld	a, 0x50c9
      008470 A4 E1            [ 1]  501 	and	a, #0xe1
      008472 C7 50 C9         [ 1]  502 	ld	0x50c9, a
                                    503 ;	lib/src/stm8s_clk.c: 445: CLK->CCOR |= (uint8_t)CLK_CCO;
      008475 C6 50 C9         [ 1]  504 	ld	a, 0x50c9
      008478 1A 01            [ 1]  505 	or	a, (0x01, sp)
      00847A C7 50 C9         [ 1]  506 	ld	0x50c9, a
                                    507 ;	lib/src/stm8s_clk.c: 448: CLK->CCOR |= CLK_CCOR_CCOEN;
      00847D 72 10 50 C9      [ 1]  508 	bset	0x50c9, #0
                                    509 ;	lib/src/stm8s_clk.c: 449: }
      008481 84               [ 1]  510 	pop	a
      008482 81               [ 4]  511 	ret
                                    512 ;	lib/src/stm8s_clk.c: 459: void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
                                    513 ;	-----------------------------------------
                                    514 ;	 function CLK_ITConfig
                                    515 ;	-----------------------------------------
      008483                        516 _CLK_ITConfig:
      008483 88               [ 1]  517 	push	a
                                    518 ;	lib/src/stm8s_clk.c: 467: switch (CLK_IT)
      008484 A1 0C            [ 1]  519 	cp	a, #0x0c
      008486 26 07            [ 1]  520 	jrne	00140$
      008488 88               [ 1]  521 	push	a
      008489 A6 01            [ 1]  522 	ld	a, #0x01
      00848B 6B 02            [ 1]  523 	ld	(0x02, sp), a
      00848D 84               [ 1]  524 	pop	a
      00848E C5                     525 	.byte 0xc5
      00848F                        526 00140$:
      00848F 0F 01            [ 1]  527 	clr	(0x01, sp)
      008491                        528 00141$:
      008491 A0 1C            [ 1]  529 	sub	a, #0x1c
      008493 26 02            [ 1]  530 	jrne	00143$
      008495 4C               [ 1]  531 	inc	a
      008496 21                     532 	.byte 0x21
      008497                        533 00143$:
      008497 4F               [ 1]  534 	clr	a
      008498                        535 00144$:
                                    536 ;	lib/src/stm8s_clk.c: 465: if (NewState != DISABLE)
      008498 0D 04            [ 1]  537 	tnz	(0x04, sp)
      00849A 27 1B            [ 1]  538 	jreq	00110$
                                    539 ;	lib/src/stm8s_clk.c: 467: switch (CLK_IT)
      00849C 0D 01            [ 1]  540 	tnz	(0x01, sp)
      00849E 26 0D            [ 1]  541 	jrne	00102$
      0084A0 4D               [ 1]  542 	tnz	a
      0084A1 27 2D            [ 1]  543 	jreq	00112$
                                    544 ;	lib/src/stm8s_clk.c: 470: CLK->SWCR |= CLK_SWCR_SWIEN;
      0084A3 C6 50 C5         [ 1]  545 	ld	a, 0x50c5
      0084A6 AA 04            [ 1]  546 	or	a, #0x04
      0084A8 C7 50 C5         [ 1]  547 	ld	0x50c5, a
                                    548 ;	lib/src/stm8s_clk.c: 471: break;
      0084AB 20 23            [ 2]  549 	jra	00112$
                                    550 ;	lib/src/stm8s_clk.c: 472: case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
      0084AD                        551 00102$:
                                    552 ;	lib/src/stm8s_clk.c: 473: CLK->CSSR |= CLK_CSSR_CSSDIE;
      0084AD C6 50 C8         [ 1]  553 	ld	a, 0x50c8
      0084B0 AA 04            [ 1]  554 	or	a, #0x04
      0084B2 C7 50 C8         [ 1]  555 	ld	0x50c8, a
                                    556 ;	lib/src/stm8s_clk.c: 474: break;
      0084B5 20 19            [ 2]  557 	jra	00112$
                                    558 ;	lib/src/stm8s_clk.c: 477: }
      0084B7                        559 00110$:
                                    560 ;	lib/src/stm8s_clk.c: 481: switch (CLK_IT)
      0084B7 0D 01            [ 1]  561 	tnz	(0x01, sp)
      0084B9 26 0D            [ 1]  562 	jrne	00106$
      0084BB 4D               [ 1]  563 	tnz	a
      0084BC 27 12            [ 1]  564 	jreq	00112$
                                    565 ;	lib/src/stm8s_clk.c: 484: CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
      0084BE C6 50 C5         [ 1]  566 	ld	a, 0x50c5
      0084C1 A4 FB            [ 1]  567 	and	a, #0xfb
      0084C3 C7 50 C5         [ 1]  568 	ld	0x50c5, a
                                    569 ;	lib/src/stm8s_clk.c: 485: break;
      0084C6 20 08            [ 2]  570 	jra	00112$
                                    571 ;	lib/src/stm8s_clk.c: 486: case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
      0084C8                        572 00106$:
                                    573 ;	lib/src/stm8s_clk.c: 487: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
      0084C8 C6 50 C8         [ 1]  574 	ld	a, 0x50c8
      0084CB A4 FB            [ 1]  575 	and	a, #0xfb
      0084CD C7 50 C8         [ 1]  576 	ld	0x50c8, a
                                    577 ;	lib/src/stm8s_clk.c: 491: }
      0084D0                        578 00112$:
                                    579 ;	lib/src/stm8s_clk.c: 493: }
      0084D0 84               [ 1]  580 	pop	a
      0084D1 85               [ 2]  581 	popw	x
      0084D2 84               [ 1]  582 	pop	a
      0084D3 FC               [ 2]  583 	jp	(x)
                                    584 ;	lib/src/stm8s_clk.c: 500: void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
                                    585 ;	-----------------------------------------
                                    586 ;	 function CLK_SYSCLKConfig
                                    587 ;	-----------------------------------------
      0084D4                        588 _CLK_SYSCLKConfig:
      0084D4 88               [ 1]  589 	push	a
      0084D5 95               [ 1]  590 	ld	xh, a
                                    591 ;	lib/src/stm8s_clk.c: 507: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      0084D6 C6 50 C6         [ 1]  592 	ld	a, 0x50c6
                                    593 ;	lib/src/stm8s_clk.c: 505: if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
      0084D9 5D               [ 2]  594 	tnzw	x
      0084DA 2B 14            [ 1]  595 	jrmi	00102$
                                    596 ;	lib/src/stm8s_clk.c: 507: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      0084DC A4 E7            [ 1]  597 	and	a, #0xe7
      0084DE C7 50 C6         [ 1]  598 	ld	0x50c6, a
                                    599 ;	lib/src/stm8s_clk.c: 508: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
      0084E1 C6 50 C6         [ 1]  600 	ld	a, 0x50c6
      0084E4 6B 01            [ 1]  601 	ld	(0x01, sp), a
      0084E6 9E               [ 1]  602 	ld	a, xh
      0084E7 A4 18            [ 1]  603 	and	a, #0x18
      0084E9 1A 01            [ 1]  604 	or	a, (0x01, sp)
      0084EB C7 50 C6         [ 1]  605 	ld	0x50c6, a
      0084EE 20 12            [ 2]  606 	jra	00104$
      0084F0                        607 00102$:
                                    608 ;	lib/src/stm8s_clk.c: 512: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
      0084F0 A4 F8            [ 1]  609 	and	a, #0xf8
      0084F2 C7 50 C6         [ 1]  610 	ld	0x50c6, a
                                    611 ;	lib/src/stm8s_clk.c: 513: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
      0084F5 C6 50 C6         [ 1]  612 	ld	a, 0x50c6
      0084F8 6B 01            [ 1]  613 	ld	(0x01, sp), a
      0084FA 9E               [ 1]  614 	ld	a, xh
      0084FB A4 07            [ 1]  615 	and	a, #0x07
      0084FD 1A 01            [ 1]  616 	or	a, (0x01, sp)
      0084FF C7 50 C6         [ 1]  617 	ld	0x50c6, a
      008502                        618 00104$:
                                    619 ;	lib/src/stm8s_clk.c: 515: }
      008502 84               [ 1]  620 	pop	a
      008503 81               [ 4]  621 	ret
                                    622 ;	lib/src/stm8s_clk.c: 523: void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
                                    623 ;	-----------------------------------------
                                    624 ;	 function CLK_SWIMConfig
                                    625 ;	-----------------------------------------
      008504                        626 _CLK_SWIMConfig:
      008504 88               [ 1]  627 	push	a
      008505 6B 01            [ 1]  628 	ld	(0x01, sp), a
                                    629 ;	lib/src/stm8s_clk.c: 531: CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
      008507 C6 50 CD         [ 1]  630 	ld	a, 0x50cd
                                    631 ;	lib/src/stm8s_clk.c: 528: if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
      00850A 0D 01            [ 1]  632 	tnz	(0x01, sp)
      00850C 27 07            [ 1]  633 	jreq	00102$
                                    634 ;	lib/src/stm8s_clk.c: 531: CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
      00850E AA 01            [ 1]  635 	or	a, #0x01
      008510 C7 50 CD         [ 1]  636 	ld	0x50cd, a
      008513 20 05            [ 2]  637 	jra	00104$
      008515                        638 00102$:
                                    639 ;	lib/src/stm8s_clk.c: 536: CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
      008515 A4 FE            [ 1]  640 	and	a, #0xfe
      008517 C7 50 CD         [ 1]  641 	ld	0x50cd, a
      00851A                        642 00104$:
                                    643 ;	lib/src/stm8s_clk.c: 538: }
      00851A 84               [ 1]  644 	pop	a
      00851B 81               [ 4]  645 	ret
                                    646 ;	lib/src/stm8s_clk.c: 547: void CLK_ClockSecuritySystemEnable(void)
                                    647 ;	-----------------------------------------
                                    648 ;	 function CLK_ClockSecuritySystemEnable
                                    649 ;	-----------------------------------------
      00851C                        650 _CLK_ClockSecuritySystemEnable:
                                    651 ;	lib/src/stm8s_clk.c: 550: CLK->CSSR |= CLK_CSSR_CSSEN;
      00851C 72 10 50 C8      [ 1]  652 	bset	0x50c8, #0
                                    653 ;	lib/src/stm8s_clk.c: 551: }
      008520 81               [ 4]  654 	ret
                                    655 ;	lib/src/stm8s_clk.c: 559: CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
                                    656 ;	-----------------------------------------
                                    657 ;	 function CLK_GetSYSCLKSource
                                    658 ;	-----------------------------------------
      008521                        659 _CLK_GetSYSCLKSource:
                                    660 ;	lib/src/stm8s_clk.c: 561: return((CLK_Source_TypeDef)CLK->CMSR);
      008521 C6 50 C3         [ 1]  661 	ld	a, 0x50c3
                                    662 ;	lib/src/stm8s_clk.c: 562: }
      008524 81               [ 4]  663 	ret
                                    664 ;	lib/src/stm8s_clk.c: 569: uint32_t CLK_GetClockFreq(void)
                                    665 ;	-----------------------------------------
                                    666 ;	 function CLK_GetClockFreq
                                    667 ;	-----------------------------------------
      008525                        668 _CLK_GetClockFreq:
      008525 52 04            [ 2]  669 	sub	sp, #4
                                    670 ;	lib/src/stm8s_clk.c: 576: clocksource = (CLK_Source_TypeDef)CLK->CMSR;
      008527 C6 50 C3         [ 1]  671 	ld	a, 0x50c3
                                    672 ;	lib/src/stm8s_clk.c: 578: if (clocksource == CLK_SOURCE_HSI)
      00852A 6B 04            [ 1]  673 	ld	(0x04, sp), a
      00852C A1 E1            [ 1]  674 	cp	a, #0xe1
      00852E 26 22            [ 1]  675 	jrne	00105$
                                    676 ;	lib/src/stm8s_clk.c: 580: tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
      008530 C6 50 C6         [ 1]  677 	ld	a, 0x50c6
      008533 A4 18            [ 1]  678 	and	a, #0x18
                                    679 ;	lib/src/stm8s_clk.c: 581: tmp = (uint8_t)(tmp >> 3);
      008535 44               [ 1]  680 	srl	a
      008536 44               [ 1]  681 	srl	a
      008537 44               [ 1]  682 	srl	a
                                    683 ;	lib/src/stm8s_clk.c: 582: clockfrequency = HSI_VALUE >> HSIDivExp[tmp];
      008538 5F               [ 1]  684 	clrw	x
      008539 97               [ 1]  685 	ld	xl, a
      00853A D6 80 2D         [ 1]  686 	ld	a, (_HSIDivExp+0, x)
      00853D AE 24 00         [ 2]  687 	ldw	x, #0x2400
      008540 1F 03            [ 2]  688 	ldw	(0x03, sp), x
      008542 AE 00 F4         [ 2]  689 	ldw	x, #0x00f4
      008545 4D               [ 1]  690 	tnz	a
      008546 27 21            [ 1]  691 	jreq	00106$
      008548                        692 00122$:
      008548 54               [ 2]  693 	srlw	x
      008549 06 03            [ 1]  694 	rrc	(0x03, sp)
      00854B 06 04            [ 1]  695 	rrc	(0x04, sp)
      00854D 4A               [ 1]  696 	dec	a
      00854E 26 F8            [ 1]  697 	jrne	00122$
      008550 20 17            [ 2]  698 	jra	00106$
      008552                        699 00105$:
                                    700 ;	lib/src/stm8s_clk.c: 584: else if ( clocksource == CLK_SOURCE_LSI)
      008552 7B 04            [ 1]  701 	ld	a, (0x04, sp)
      008554 A1 D2            [ 1]  702 	cp	a, #0xd2
      008556 26 09            [ 1]  703 	jrne	00102$
                                    704 ;	lib/src/stm8s_clk.c: 586: clockfrequency = LSI_VALUE;
      008558 AE F4 00         [ 2]  705 	ldw	x, #0xf400
      00855B 1F 03            [ 2]  706 	ldw	(0x03, sp), x
      00855D 5F               [ 1]  707 	clrw	x
      00855E 5C               [ 1]  708 	incw	x
      00855F 20 08            [ 2]  709 	jra	00106$
      008561                        710 00102$:
                                    711 ;	lib/src/stm8s_clk.c: 590: clockfrequency = HSE_VALUE;
      008561 AE 24 00         [ 2]  712 	ldw	x, #0x2400
      008564 1F 03            [ 2]  713 	ldw	(0x03, sp), x
      008566 AE 00 F4         [ 2]  714 	ldw	x, #0x00f4
      008569                        715 00106$:
                                    716 ;	lib/src/stm8s_clk.c: 593: return((uint32_t)clockfrequency);
      008569 51               [ 1]  717 	exgw	x, y
      00856A 1E 03            [ 2]  718 	ldw	x, (0x03, sp)
                                    719 ;	lib/src/stm8s_clk.c: 594: }
      00856C 5B 04            [ 2]  720 	addw	sp, #4
      00856E 81               [ 4]  721 	ret
                                    722 ;	lib/src/stm8s_clk.c: 603: void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
                                    723 ;	-----------------------------------------
                                    724 ;	 function CLK_AdjustHSICalibrationValue
                                    725 ;	-----------------------------------------
      00856F                        726 _CLK_AdjustHSICalibrationValue:
      00856F 88               [ 1]  727 	push	a
      008570 6B 01            [ 1]  728 	ld	(0x01, sp), a
                                    729 ;	lib/src/stm8s_clk.c: 609: CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
      008572 C6 50 CC         [ 1]  730 	ld	a, 0x50cc
      008575 A4 F8            [ 1]  731 	and	a, #0xf8
      008577 1A 01            [ 1]  732 	or	a, (0x01, sp)
      008579 C7 50 CC         [ 1]  733 	ld	0x50cc, a
                                    734 ;	lib/src/stm8s_clk.c: 610: }
      00857C 84               [ 1]  735 	pop	a
      00857D 81               [ 4]  736 	ret
                                    737 ;	lib/src/stm8s_clk.c: 621: void CLK_SYSCLKEmergencyClear(void)
                                    738 ;	-----------------------------------------
                                    739 ;	 function CLK_SYSCLKEmergencyClear
                                    740 ;	-----------------------------------------
      00857E                        741 _CLK_SYSCLKEmergencyClear:
                                    742 ;	lib/src/stm8s_clk.c: 623: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
      00857E 72 11 50 C5      [ 1]  743 	bres	0x50c5, #0
                                    744 ;	lib/src/stm8s_clk.c: 624: }
      008582 81               [ 4]  745 	ret
                                    746 ;	lib/src/stm8s_clk.c: 633: FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
                                    747 ;	-----------------------------------------
                                    748 ;	 function CLK_GetFlagStatus
                                    749 ;	-----------------------------------------
      008583                        750 _CLK_GetFlagStatus:
      008583 52 04            [ 2]  751 	sub	sp, #4
                                    752 ;	lib/src/stm8s_clk.c: 643: statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
      008585 1F 03            [ 2]  753 	ldw	(0x03, sp), x
      008587 4F               [ 1]  754 	clr	a
      008588 97               [ 1]  755 	ld	xl, a
                                    756 ;	lib/src/stm8s_clk.c: 646: if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
      008589 1F 01            [ 2]  757 	ldw	(0x01, sp), x
      00858B A3 01 00         [ 2]  758 	cpw	x, #0x0100
      00858E 26 05            [ 1]  759 	jrne	00111$
                                    760 ;	lib/src/stm8s_clk.c: 648: tmpreg = CLK->ICKR;
      008590 C6 50 C0         [ 1]  761 	ld	a, 0x50c0
      008593 20 27            [ 2]  762 	jra	00112$
      008595                        763 00111$:
                                    764 ;	lib/src/stm8s_clk.c: 650: else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
      008595 1E 01            [ 2]  765 	ldw	x, (0x01, sp)
      008597 A3 02 00         [ 2]  766 	cpw	x, #0x0200
      00859A 26 05            [ 1]  767 	jrne	00108$
                                    768 ;	lib/src/stm8s_clk.c: 652: tmpreg = CLK->ECKR;
      00859C C6 50 C1         [ 1]  769 	ld	a, 0x50c1
      00859F 20 1B            [ 2]  770 	jra	00112$
      0085A1                        771 00108$:
                                    772 ;	lib/src/stm8s_clk.c: 654: else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
      0085A1 1E 01            [ 2]  773 	ldw	x, (0x01, sp)
      0085A3 A3 03 00         [ 2]  774 	cpw	x, #0x0300
      0085A6 26 05            [ 1]  775 	jrne	00105$
                                    776 ;	lib/src/stm8s_clk.c: 656: tmpreg = CLK->SWCR;
      0085A8 C6 50 C5         [ 1]  777 	ld	a, 0x50c5
      0085AB 20 0F            [ 2]  778 	jra	00112$
      0085AD                        779 00105$:
                                    780 ;	lib/src/stm8s_clk.c: 658: else if (statusreg == 0x0400) /* The flag to check is in CSS register */
      0085AD 1E 01            [ 2]  781 	ldw	x, (0x01, sp)
      0085AF A3 04 00         [ 2]  782 	cpw	x, #0x0400
      0085B2 26 05            [ 1]  783 	jrne	00102$
                                    784 ;	lib/src/stm8s_clk.c: 660: tmpreg = CLK->CSSR;
      0085B4 C6 50 C8         [ 1]  785 	ld	a, 0x50c8
      0085B7 20 03            [ 2]  786 	jra	00112$
      0085B9                        787 00102$:
                                    788 ;	lib/src/stm8s_clk.c: 664: tmpreg = CLK->CCOR;
      0085B9 C6 50 C9         [ 1]  789 	ld	a, 0x50c9
      0085BC                        790 00112$:
                                    791 ;	lib/src/stm8s_clk.c: 667: if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
      0085BC 88               [ 1]  792 	push	a
      0085BD 7B 05            [ 1]  793 	ld	a, (0x05, sp)
      0085BF 6B 03            [ 1]  794 	ld	(0x03, sp), a
      0085C1 84               [ 1]  795 	pop	a
      0085C2 14 02            [ 1]  796 	and	a, (0x02, sp)
      0085C4 27 03            [ 1]  797 	jreq	00114$
                                    798 ;	lib/src/stm8s_clk.c: 669: bitstatus = SET;
      0085C6 A6 01            [ 1]  799 	ld	a, #0x01
                                    800 ;	lib/src/stm8s_clk.c: 673: bitstatus = RESET;
      0085C8 21                     801 	.byte 0x21
      0085C9                        802 00114$:
      0085C9 4F               [ 1]  803 	clr	a
      0085CA                        804 00115$:
                                    805 ;	lib/src/stm8s_clk.c: 677: return((FlagStatus)bitstatus);
                                    806 ;	lib/src/stm8s_clk.c: 678: }
      0085CA 5B 04            [ 2]  807 	addw	sp, #4
      0085CC 81               [ 4]  808 	ret
                                    809 ;	lib/src/stm8s_clk.c: 686: ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
                                    810 ;	-----------------------------------------
                                    811 ;	 function CLK_GetITStatus
                                    812 ;	-----------------------------------------
      0085CD                        813 _CLK_GetITStatus:
      0085CD 88               [ 1]  814 	push	a
                                    815 ;	lib/src/stm8s_clk.c: 693: if (CLK_IT == CLK_IT_SWIF)
      0085CE 6B 01            [ 1]  816 	ld	(0x01, sp), a
      0085D0 A1 1C            [ 1]  817 	cp	a, #0x1c
      0085D2 26 0F            [ 1]  818 	jrne	00108$
                                    819 ;	lib/src/stm8s_clk.c: 696: if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      0085D4 C6 50 C5         [ 1]  820 	ld	a, 0x50c5
      0085D7 14 01            [ 1]  821 	and	a, (0x01, sp)
                                    822 ;	lib/src/stm8s_clk.c: 698: bitstatus = SET;
      0085D9 A0 0C            [ 1]  823 	sub	a, #0x0c
      0085DB 26 03            [ 1]  824 	jrne	00102$
      0085DD 4C               [ 1]  825 	inc	a
      0085DE 20 0F            [ 2]  826 	jra	00109$
      0085E0                        827 00102$:
                                    828 ;	lib/src/stm8s_clk.c: 702: bitstatus = RESET;
      0085E0 4F               [ 1]  829 	clr	a
      0085E1 20 0C            [ 2]  830 	jra	00109$
      0085E3                        831 00108$:
                                    832 ;	lib/src/stm8s_clk.c: 708: if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      0085E3 C6 50 C8         [ 1]  833 	ld	a, 0x50c8
      0085E6 14 01            [ 1]  834 	and	a, (0x01, sp)
                                    835 ;	lib/src/stm8s_clk.c: 710: bitstatus = SET;
      0085E8 A0 0C            [ 1]  836 	sub	a, #0x0c
      0085EA 26 02            [ 1]  837 	jrne	00105$
      0085EC 4C               [ 1]  838 	inc	a
                                    839 ;	lib/src/stm8s_clk.c: 714: bitstatus = RESET;
      0085ED 21                     840 	.byte 0x21
      0085EE                        841 00105$:
      0085EE 4F               [ 1]  842 	clr	a
      0085EF                        843 00109$:
                                    844 ;	lib/src/stm8s_clk.c: 719: return bitstatus;
                                    845 ;	lib/src/stm8s_clk.c: 720: }
      0085EF 5B 01            [ 2]  846 	addw	sp, #1
      0085F1 81               [ 4]  847 	ret
                                    848 ;	lib/src/stm8s_clk.c: 728: void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
                                    849 ;	-----------------------------------------
                                    850 ;	 function CLK_ClearITPendingBit
                                    851 ;	-----------------------------------------
      0085F2                        852 _CLK_ClearITPendingBit:
                                    853 ;	lib/src/stm8s_clk.c: 733: if (CLK_IT == (uint8_t)CLK_IT_CSSD)
      0085F2 A1 0C            [ 1]  854 	cp	a, #0x0c
      0085F4 26 05            [ 1]  855 	jrne	00102$
                                    856 ;	lib/src/stm8s_clk.c: 736: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
      0085F6 72 17 50 C8      [ 1]  857 	bres	0x50c8, #3
      0085FA 81               [ 4]  858 	ret
      0085FB                        859 00102$:
                                    860 ;	lib/src/stm8s_clk.c: 741: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
      0085FB 72 17 50 C5      [ 1]  861 	bres	0x50c5, #3
                                    862 ;	lib/src/stm8s_clk.c: 744: }
      0085FF 81               [ 4]  863 	ret
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
