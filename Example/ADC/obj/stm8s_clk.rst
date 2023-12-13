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
      0082E2                         77 _CLK_DeInit:
                                     78 ;	lib/src/stm8s_clk.c: 74: CLK->ICKR = CLK_ICKR_RESET_VALUE;
      0082E2 35 01 50 C0      [ 1]   79 	mov	0x50c0+0, #0x01
                                     80 ;	lib/src/stm8s_clk.c: 75: CLK->ECKR = CLK_ECKR_RESET_VALUE;
      0082E6 35 00 50 C1      [ 1]   81 	mov	0x50c1+0, #0x00
                                     82 ;	lib/src/stm8s_clk.c: 76: CLK->SWR  = CLK_SWR_RESET_VALUE;
      0082EA 35 E1 50 C4      [ 1]   83 	mov	0x50c4+0, #0xe1
                                     84 ;	lib/src/stm8s_clk.c: 77: CLK->SWCR = CLK_SWCR_RESET_VALUE;
      0082EE 35 00 50 C5      [ 1]   85 	mov	0x50c5+0, #0x00
                                     86 ;	lib/src/stm8s_clk.c: 78: CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
      0082F2 35 18 50 C6      [ 1]   87 	mov	0x50c6+0, #0x18
                                     88 ;	lib/src/stm8s_clk.c: 79: CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
      0082F6 35 FF 50 C7      [ 1]   89 	mov	0x50c7+0, #0xff
                                     90 ;	lib/src/stm8s_clk.c: 80: CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
      0082FA 35 FF 50 CA      [ 1]   91 	mov	0x50ca+0, #0xff
                                     92 ;	lib/src/stm8s_clk.c: 81: CLK->CSSR = CLK_CSSR_RESET_VALUE;
      0082FE 35 00 50 C8      [ 1]   93 	mov	0x50c8+0, #0x00
                                     94 ;	lib/src/stm8s_clk.c: 82: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      008302 35 00 50 C9      [ 1]   95 	mov	0x50c9+0, #0x00
                                     96 ;	lib/src/stm8s_clk.c: 83: while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
      008306                         97 00101$:
      008306 72 00 50 C9 FB   [ 2]   98 	btjt	0x50c9, #0, 00101$
                                     99 ;	lib/src/stm8s_clk.c: 85: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      00830B 35 00 50 C9      [ 1]  100 	mov	0x50c9+0, #0x00
                                    101 ;	lib/src/stm8s_clk.c: 86: CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
      00830F 35 00 50 CC      [ 1]  102 	mov	0x50cc+0, #0x00
                                    103 ;	lib/src/stm8s_clk.c: 87: CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
      008313 35 00 50 CD      [ 1]  104 	mov	0x50cd+0, #0x00
                                    105 ;	lib/src/stm8s_clk.c: 88: }
      008317 81               [ 4]  106 	ret
                                    107 ;	lib/src/stm8s_clk.c: 99: void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
                                    108 ;	-----------------------------------------
                                    109 ;	 function CLK_FastHaltWakeUpCmd
                                    110 ;	-----------------------------------------
      008318                        111 _CLK_FastHaltWakeUpCmd:
      008318 88               [ 1]  112 	push	a
      008319 6B 01            [ 1]  113 	ld	(0x01, sp), a
                                    114 ;	lib/src/stm8s_clk.c: 107: CLK->ICKR |= CLK_ICKR_FHWU;
      00831B C6 50 C0         [ 1]  115 	ld	a, 0x50c0
                                    116 ;	lib/src/stm8s_clk.c: 104: if (NewState != DISABLE)
      00831E 0D 01            [ 1]  117 	tnz	(0x01, sp)
      008320 27 07            [ 1]  118 	jreq	00102$
                                    119 ;	lib/src/stm8s_clk.c: 107: CLK->ICKR |= CLK_ICKR_FHWU;
      008322 AA 04            [ 1]  120 	or	a, #0x04
      008324 C7 50 C0         [ 1]  121 	ld	0x50c0, a
      008327 20 05            [ 2]  122 	jra	00104$
      008329                        123 00102$:
                                    124 ;	lib/src/stm8s_clk.c: 112: CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
      008329 A4 FB            [ 1]  125 	and	a, #0xfb
      00832B C7 50 C0         [ 1]  126 	ld	0x50c0, a
      00832E                        127 00104$:
                                    128 ;	lib/src/stm8s_clk.c: 114: }
      00832E 84               [ 1]  129 	pop	a
      00832F 81               [ 4]  130 	ret
                                    131 ;	lib/src/stm8s_clk.c: 121: void CLK_HSECmd(FunctionalState NewState)
                                    132 ;	-----------------------------------------
                                    133 ;	 function CLK_HSECmd
                                    134 ;	-----------------------------------------
      008330                        135 _CLK_HSECmd:
      008330 88               [ 1]  136 	push	a
      008331 6B 01            [ 1]  137 	ld	(0x01, sp), a
                                    138 ;	lib/src/stm8s_clk.c: 129: CLK->ECKR |= CLK_ECKR_HSEEN;
      008333 C6 50 C1         [ 1]  139 	ld	a, 0x50c1
                                    140 ;	lib/src/stm8s_clk.c: 126: if (NewState != DISABLE)
      008336 0D 01            [ 1]  141 	tnz	(0x01, sp)
      008338 27 07            [ 1]  142 	jreq	00102$
                                    143 ;	lib/src/stm8s_clk.c: 129: CLK->ECKR |= CLK_ECKR_HSEEN;
      00833A AA 01            [ 1]  144 	or	a, #0x01
      00833C C7 50 C1         [ 1]  145 	ld	0x50c1, a
      00833F 20 05            [ 2]  146 	jra	00104$
      008341                        147 00102$:
                                    148 ;	lib/src/stm8s_clk.c: 134: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
      008341 A4 FE            [ 1]  149 	and	a, #0xfe
      008343 C7 50 C1         [ 1]  150 	ld	0x50c1, a
      008346                        151 00104$:
                                    152 ;	lib/src/stm8s_clk.c: 136: }
      008346 84               [ 1]  153 	pop	a
      008347 81               [ 4]  154 	ret
                                    155 ;	lib/src/stm8s_clk.c: 143: void CLK_HSICmd(FunctionalState NewState)
                                    156 ;	-----------------------------------------
                                    157 ;	 function CLK_HSICmd
                                    158 ;	-----------------------------------------
      008348                        159 _CLK_HSICmd:
      008348 88               [ 1]  160 	push	a
      008349 6B 01            [ 1]  161 	ld	(0x01, sp), a
                                    162 ;	lib/src/stm8s_clk.c: 151: CLK->ICKR |= CLK_ICKR_HSIEN;
      00834B C6 50 C0         [ 1]  163 	ld	a, 0x50c0
                                    164 ;	lib/src/stm8s_clk.c: 148: if (NewState != DISABLE)
      00834E 0D 01            [ 1]  165 	tnz	(0x01, sp)
      008350 27 07            [ 1]  166 	jreq	00102$
                                    167 ;	lib/src/stm8s_clk.c: 151: CLK->ICKR |= CLK_ICKR_HSIEN;
      008352 AA 01            [ 1]  168 	or	a, #0x01
      008354 C7 50 C0         [ 1]  169 	ld	0x50c0, a
      008357 20 05            [ 2]  170 	jra	00104$
      008359                        171 00102$:
                                    172 ;	lib/src/stm8s_clk.c: 156: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
      008359 A4 FE            [ 1]  173 	and	a, #0xfe
      00835B C7 50 C0         [ 1]  174 	ld	0x50c0, a
      00835E                        175 00104$:
                                    176 ;	lib/src/stm8s_clk.c: 158: }
      00835E 84               [ 1]  177 	pop	a
      00835F 81               [ 4]  178 	ret
                                    179 ;	lib/src/stm8s_clk.c: 166: void CLK_LSICmd(FunctionalState NewState)
                                    180 ;	-----------------------------------------
                                    181 ;	 function CLK_LSICmd
                                    182 ;	-----------------------------------------
      008360                        183 _CLK_LSICmd:
      008360 88               [ 1]  184 	push	a
      008361 6B 01            [ 1]  185 	ld	(0x01, sp), a
                                    186 ;	lib/src/stm8s_clk.c: 174: CLK->ICKR |= CLK_ICKR_LSIEN;
      008363 C6 50 C0         [ 1]  187 	ld	a, 0x50c0
                                    188 ;	lib/src/stm8s_clk.c: 171: if (NewState != DISABLE)
      008366 0D 01            [ 1]  189 	tnz	(0x01, sp)
      008368 27 07            [ 1]  190 	jreq	00102$
                                    191 ;	lib/src/stm8s_clk.c: 174: CLK->ICKR |= CLK_ICKR_LSIEN;
      00836A AA 08            [ 1]  192 	or	a, #0x08
      00836C C7 50 C0         [ 1]  193 	ld	0x50c0, a
      00836F 20 05            [ 2]  194 	jra	00104$
      008371                        195 00102$:
                                    196 ;	lib/src/stm8s_clk.c: 179: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
      008371 A4 F7            [ 1]  197 	and	a, #0xf7
      008373 C7 50 C0         [ 1]  198 	ld	0x50c0, a
      008376                        199 00104$:
                                    200 ;	lib/src/stm8s_clk.c: 181: }
      008376 84               [ 1]  201 	pop	a
      008377 81               [ 4]  202 	ret
                                    203 ;	lib/src/stm8s_clk.c: 189: void CLK_CCOCmd(FunctionalState NewState)
                                    204 ;	-----------------------------------------
                                    205 ;	 function CLK_CCOCmd
                                    206 ;	-----------------------------------------
      008378                        207 _CLK_CCOCmd:
      008378 88               [ 1]  208 	push	a
      008379 6B 01            [ 1]  209 	ld	(0x01, sp), a
                                    210 ;	lib/src/stm8s_clk.c: 197: CLK->CCOR |= CLK_CCOR_CCOEN;
      00837B C6 50 C9         [ 1]  211 	ld	a, 0x50c9
                                    212 ;	lib/src/stm8s_clk.c: 194: if (NewState != DISABLE)
      00837E 0D 01            [ 1]  213 	tnz	(0x01, sp)
      008380 27 07            [ 1]  214 	jreq	00102$
                                    215 ;	lib/src/stm8s_clk.c: 197: CLK->CCOR |= CLK_CCOR_CCOEN;
      008382 AA 01            [ 1]  216 	or	a, #0x01
      008384 C7 50 C9         [ 1]  217 	ld	0x50c9, a
      008387 20 05            [ 2]  218 	jra	00104$
      008389                        219 00102$:
                                    220 ;	lib/src/stm8s_clk.c: 202: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
      008389 A4 FE            [ 1]  221 	and	a, #0xfe
      00838B C7 50 C9         [ 1]  222 	ld	0x50c9, a
      00838E                        223 00104$:
                                    224 ;	lib/src/stm8s_clk.c: 204: }
      00838E 84               [ 1]  225 	pop	a
      00838F 81               [ 4]  226 	ret
                                    227 ;	lib/src/stm8s_clk.c: 213: void CLK_ClockSwitchCmd(FunctionalState NewState)
                                    228 ;	-----------------------------------------
                                    229 ;	 function CLK_ClockSwitchCmd
                                    230 ;	-----------------------------------------
      008390                        231 _CLK_ClockSwitchCmd:
      008390 88               [ 1]  232 	push	a
      008391 6B 01            [ 1]  233 	ld	(0x01, sp), a
                                    234 ;	lib/src/stm8s_clk.c: 221: CLK->SWCR |= CLK_SWCR_SWEN;
      008393 C6 50 C5         [ 1]  235 	ld	a, 0x50c5
                                    236 ;	lib/src/stm8s_clk.c: 218: if (NewState != DISABLE )
      008396 0D 01            [ 1]  237 	tnz	(0x01, sp)
      008398 27 07            [ 1]  238 	jreq	00102$
                                    239 ;	lib/src/stm8s_clk.c: 221: CLK->SWCR |= CLK_SWCR_SWEN;
      00839A AA 02            [ 1]  240 	or	a, #0x02
      00839C C7 50 C5         [ 1]  241 	ld	0x50c5, a
      00839F 20 05            [ 2]  242 	jra	00104$
      0083A1                        243 00102$:
                                    244 ;	lib/src/stm8s_clk.c: 226: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
      0083A1 A4 FD            [ 1]  245 	and	a, #0xfd
      0083A3 C7 50 C5         [ 1]  246 	ld	0x50c5, a
      0083A6                        247 00104$:
                                    248 ;	lib/src/stm8s_clk.c: 228: }
      0083A6 84               [ 1]  249 	pop	a
      0083A7 81               [ 4]  250 	ret
                                    251 ;	lib/src/stm8s_clk.c: 238: void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
                                    252 ;	-----------------------------------------
                                    253 ;	 function CLK_SlowActiveHaltWakeUpCmd
                                    254 ;	-----------------------------------------
      0083A8                        255 _CLK_SlowActiveHaltWakeUpCmd:
      0083A8 88               [ 1]  256 	push	a
      0083A9 6B 01            [ 1]  257 	ld	(0x01, sp), a
                                    258 ;	lib/src/stm8s_clk.c: 246: CLK->ICKR |= CLK_ICKR_SWUAH;
      0083AB C6 50 C0         [ 1]  259 	ld	a, 0x50c0
                                    260 ;	lib/src/stm8s_clk.c: 243: if (NewState != DISABLE)
      0083AE 0D 01            [ 1]  261 	tnz	(0x01, sp)
      0083B0 27 07            [ 1]  262 	jreq	00102$
                                    263 ;	lib/src/stm8s_clk.c: 246: CLK->ICKR |= CLK_ICKR_SWUAH;
      0083B2 AA 20            [ 1]  264 	or	a, #0x20
      0083B4 C7 50 C0         [ 1]  265 	ld	0x50c0, a
      0083B7 20 05            [ 2]  266 	jra	00104$
      0083B9                        267 00102$:
                                    268 ;	lib/src/stm8s_clk.c: 251: CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
      0083B9 A4 DF            [ 1]  269 	and	a, #0xdf
      0083BB C7 50 C0         [ 1]  270 	ld	0x50c0, a
      0083BE                        271 00104$:
                                    272 ;	lib/src/stm8s_clk.c: 253: }
      0083BE 84               [ 1]  273 	pop	a
      0083BF 81               [ 4]  274 	ret
                                    275 ;	lib/src/stm8s_clk.c: 263: void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
                                    276 ;	-----------------------------------------
                                    277 ;	 function CLK_PeripheralClockConfig
                                    278 ;	-----------------------------------------
      0083C0                        279 _CLK_PeripheralClockConfig:
      0083C0 52 02            [ 2]  280 	sub	sp, #2
                                    281 ;	lib/src/stm8s_clk.c: 274: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      0083C2 97               [ 1]  282 	ld	xl, a
      0083C3 A4 0F            [ 1]  283 	and	a, #0x0f
      0083C5 88               [ 1]  284 	push	a
      0083C6 A6 01            [ 1]  285 	ld	a, #0x01
      0083C8 6B 02            [ 1]  286 	ld	(0x02, sp), a
      0083CA 84               [ 1]  287 	pop	a
      0083CB 4D               [ 1]  288 	tnz	a
      0083CC 27 05            [ 1]  289 	jreq	00128$
      0083CE                        290 00127$:
      0083CE 08 01            [ 1]  291 	sll	(0x01, sp)
      0083D0 4A               [ 1]  292 	dec	a
      0083D1 26 FB            [ 1]  293 	jrne	00127$
      0083D3                        294 00128$:
                                    295 ;	lib/src/stm8s_clk.c: 279: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      0083D3 7B 01            [ 1]  296 	ld	a, (0x01, sp)
      0083D5 43               [ 1]  297 	cpl	a
      0083D6 6B 02            [ 1]  298 	ld	(0x02, sp), a
                                    299 ;	lib/src/stm8s_clk.c: 269: if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
      0083D8 9F               [ 1]  300 	ld	a, xl
      0083D9 A5 10            [ 1]  301 	bcp	a, #0x10
      0083DB 26 15            [ 1]  302 	jrne	00108$
                                    303 ;	lib/src/stm8s_clk.c: 274: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      0083DD C6 50 C7         [ 1]  304 	ld	a, 0x50c7
                                    305 ;	lib/src/stm8s_clk.c: 271: if (NewState != DISABLE)
      0083E0 0D 05            [ 1]  306 	tnz	(0x05, sp)
      0083E2 27 07            [ 1]  307 	jreq	00102$
                                    308 ;	lib/src/stm8s_clk.c: 274: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      0083E4 1A 01            [ 1]  309 	or	a, (0x01, sp)
      0083E6 C7 50 C7         [ 1]  310 	ld	0x50c7, a
      0083E9 20 1A            [ 2]  311 	jra	00110$
      0083EB                        312 00102$:
                                    313 ;	lib/src/stm8s_clk.c: 279: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      0083EB 14 02            [ 1]  314 	and	a, (0x02, sp)
      0083ED C7 50 C7         [ 1]  315 	ld	0x50c7, a
      0083F0 20 13            [ 2]  316 	jra	00110$
      0083F2                        317 00108$:
                                    318 ;	lib/src/stm8s_clk.c: 287: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      0083F2 C6 50 CA         [ 1]  319 	ld	a, 0x50ca
                                    320 ;	lib/src/stm8s_clk.c: 284: if (NewState != DISABLE)
      0083F5 0D 05            [ 1]  321 	tnz	(0x05, sp)
      0083F7 27 07            [ 1]  322 	jreq	00105$
                                    323 ;	lib/src/stm8s_clk.c: 287: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      0083F9 1A 01            [ 1]  324 	or	a, (0x01, sp)
      0083FB C7 50 CA         [ 1]  325 	ld	0x50ca, a
      0083FE 20 05            [ 2]  326 	jra	00110$
      008400                        327 00105$:
                                    328 ;	lib/src/stm8s_clk.c: 292: CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      008400 14 02            [ 1]  329 	and	a, (0x02, sp)
      008402 C7 50 CA         [ 1]  330 	ld	0x50ca, a
      008405                        331 00110$:
                                    332 ;	lib/src/stm8s_clk.c: 295: }
      008405 5B 02            [ 2]  333 	addw	sp, #2
      008407 85               [ 2]  334 	popw	x
      008408 84               [ 1]  335 	pop	a
      008409 FC               [ 2]  336 	jp	(x)
                                    337 ;	lib/src/stm8s_clk.c: 309: ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
                                    338 ;	-----------------------------------------
                                    339 ;	 function CLK_ClockSwitchConfig
                                    340 ;	-----------------------------------------
      00840A                        341 _CLK_ClockSwitchConfig:
      00840A 88               [ 1]  342 	push	a
      00840B 6B 01            [ 1]  343 	ld	(0x01, sp), a
                                    344 ;	lib/src/stm8s_clk.c: 322: clock_master = (CLK_Source_TypeDef)CLK->CMSR;
      00840D C6 50 C3         [ 1]  345 	ld	a, 0x50c3
      008410 90 97            [ 1]  346 	ld	yl, a
                                    347 ;	lib/src/stm8s_clk.c: 328: CLK->SWCR |= CLK_SWCR_SWEN;
      008412 C6 50 C5         [ 1]  348 	ld	a, 0x50c5
                                    349 ;	lib/src/stm8s_clk.c: 325: if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
      008415 0D 01            [ 1]  350 	tnz	(0x01, sp)
      008417 27 36            [ 1]  351 	jreq	00122$
                                    352 ;	lib/src/stm8s_clk.c: 328: CLK->SWCR |= CLK_SWCR_SWEN;
      008419 AA 02            [ 1]  353 	or	a, #0x02
      00841B C7 50 C5         [ 1]  354 	ld	0x50c5, a
      00841E C6 50 C5         [ 1]  355 	ld	a, 0x50c5
                                    356 ;	lib/src/stm8s_clk.c: 331: if (ITState != DISABLE)
      008421 0D 05            [ 1]  357 	tnz	(0x05, sp)
      008423 27 07            [ 1]  358 	jreq	00102$
                                    359 ;	lib/src/stm8s_clk.c: 333: CLK->SWCR |= CLK_SWCR_SWIEN;
      008425 AA 04            [ 1]  360 	or	a, #0x04
      008427 C7 50 C5         [ 1]  361 	ld	0x50c5, a
      00842A 20 05            [ 2]  362 	jra	00103$
      00842C                        363 00102$:
                                    364 ;	lib/src/stm8s_clk.c: 337: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
      00842C A4 FB            [ 1]  365 	and	a, #0xfb
      00842E C7 50 C5         [ 1]  366 	ld	0x50c5, a
      008431                        367 00103$:
                                    368 ;	lib/src/stm8s_clk.c: 341: CLK->SWR = (uint8_t)CLK_NewClock;
      008431 AE 50 C4         [ 2]  369 	ldw	x, #0x50c4
      008434 7B 04            [ 1]  370 	ld	a, (0x04, sp)
      008436 F7               [ 1]  371 	ld	(x), a
                                    372 ;	lib/src/stm8s_clk.c: 344: while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
      008437 5F               [ 1]  373 	clrw	x
      008438 5A               [ 2]  374 	decw	x
      008439                        375 00105$:
      008439 72 01 50 C5 06   [ 2]  376 	btjf	0x50c5, #0, 00107$
      00843E 5D               [ 2]  377 	tnzw	x
      00843F 27 03            [ 1]  378 	jreq	00107$
                                    379 ;	lib/src/stm8s_clk.c: 346: DownCounter--;
      008441 5A               [ 2]  380 	decw	x
      008442 20 F5            [ 2]  381 	jra	00105$
      008444                        382 00107$:
                                    383 ;	lib/src/stm8s_clk.c: 349: if(DownCounter != 0)
      008444 5D               [ 2]  384 	tnzw	x
      008445 27 05            [ 1]  385 	jreq	00109$
                                    386 ;	lib/src/stm8s_clk.c: 351: Swif = SUCCESS;
      008447 A6 01            [ 1]  387 	ld	a, #0x01
      008449 97               [ 1]  388 	ld	xl, a
      00844A 20 32            [ 2]  389 	jra	00123$
      00844C                        390 00109$:
                                    391 ;	lib/src/stm8s_clk.c: 355: Swif = ERROR;
      00844C 5F               [ 1]  392 	clrw	x
      00844D 20 2F            [ 2]  393 	jra	00123$
      00844F                        394 00122$:
                                    395 ;	lib/src/stm8s_clk.c: 361: if (ITState != DISABLE)
      00844F 0D 05            [ 1]  396 	tnz	(0x05, sp)
      008451 27 07            [ 1]  397 	jreq	00112$
                                    398 ;	lib/src/stm8s_clk.c: 363: CLK->SWCR |= CLK_SWCR_SWIEN;
      008453 AA 04            [ 1]  399 	or	a, #0x04
      008455 C7 50 C5         [ 1]  400 	ld	0x50c5, a
      008458 20 05            [ 2]  401 	jra	00113$
      00845A                        402 00112$:
                                    403 ;	lib/src/stm8s_clk.c: 367: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
      00845A A4 FB            [ 1]  404 	and	a, #0xfb
      00845C C7 50 C5         [ 1]  405 	ld	0x50c5, a
      00845F                        406 00113$:
                                    407 ;	lib/src/stm8s_clk.c: 371: CLK->SWR = (uint8_t)CLK_NewClock;
      00845F AE 50 C4         [ 2]  408 	ldw	x, #0x50c4
      008462 7B 04            [ 1]  409 	ld	a, (0x04, sp)
      008464 F7               [ 1]  410 	ld	(x), a
                                    411 ;	lib/src/stm8s_clk.c: 374: while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
      008465 5F               [ 1]  412 	clrw	x
      008466 5A               [ 2]  413 	decw	x
      008467                        414 00115$:
      008467 72 07 50 C5 06   [ 2]  415 	btjf	0x50c5, #3, 00117$
      00846C 5D               [ 2]  416 	tnzw	x
      00846D 27 03            [ 1]  417 	jreq	00117$
                                    418 ;	lib/src/stm8s_clk.c: 376: DownCounter--;
      00846F 5A               [ 2]  419 	decw	x
      008470 20 F5            [ 2]  420 	jra	00115$
      008472                        421 00117$:
                                    422 ;	lib/src/stm8s_clk.c: 379: if(DownCounter != 0)
      008472 5D               [ 2]  423 	tnzw	x
      008473 27 08            [ 1]  424 	jreq	00119$
                                    425 ;	lib/src/stm8s_clk.c: 382: CLK->SWCR |= CLK_SWCR_SWEN;
      008475 72 12 50 C5      [ 1]  426 	bset	0x50c5, #1
                                    427 ;	lib/src/stm8s_clk.c: 383: Swif = SUCCESS;
      008479 A6 01            [ 1]  428 	ld	a, #0x01
      00847B 97               [ 1]  429 	ld	xl, a
                                    430 ;	lib/src/stm8s_clk.c: 387: Swif = ERROR;
      00847C 21                     431 	.byte 0x21
      00847D                        432 00119$:
      00847D 5F               [ 1]  433 	clrw	x
      00847E                        434 00123$:
                                    435 ;	lib/src/stm8s_clk.c: 390: if(Swif != ERROR)
      00847E 9F               [ 1]  436 	ld	a, xl
      00847F 4D               [ 1]  437 	tnz	a
      008480 27 2E            [ 1]  438 	jreq	00136$
                                    439 ;	lib/src/stm8s_clk.c: 393: if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
      008482 0D 06            [ 1]  440 	tnz	(0x06, sp)
      008484 26 0C            [ 1]  441 	jrne	00132$
      008486 90 9F            [ 1]  442 	ld	a, yl
      008488 A1 E1            [ 1]  443 	cp	a, #0xe1
      00848A 26 06            [ 1]  444 	jrne	00132$
                                    445 ;	lib/src/stm8s_clk.c: 395: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
      00848C 72 11 50 C0      [ 1]  446 	bres	0x50c0, #0
      008490 20 1E            [ 2]  447 	jra	00136$
      008492                        448 00132$:
                                    449 ;	lib/src/stm8s_clk.c: 397: else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
      008492 0D 06            [ 1]  450 	tnz	(0x06, sp)
      008494 26 0C            [ 1]  451 	jrne	00128$
      008496 90 9F            [ 1]  452 	ld	a, yl
      008498 A1 D2            [ 1]  453 	cp	a, #0xd2
      00849A 26 06            [ 1]  454 	jrne	00128$
                                    455 ;	lib/src/stm8s_clk.c: 399: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
      00849C 72 17 50 C0      [ 1]  456 	bres	0x50c0, #3
      0084A0 20 0E            [ 2]  457 	jra	00136$
      0084A2                        458 00128$:
                                    459 ;	lib/src/stm8s_clk.c: 401: else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
      0084A2 0D 06            [ 1]  460 	tnz	(0x06, sp)
      0084A4 26 0A            [ 1]  461 	jrne	00136$
      0084A6 90 9F            [ 1]  462 	ld	a, yl
      0084A8 A1 B4            [ 1]  463 	cp	a, #0xb4
      0084AA 26 04            [ 1]  464 	jrne	00136$
                                    465 ;	lib/src/stm8s_clk.c: 403: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
      0084AC 72 11 50 C1      [ 1]  466 	bres	0x50c1, #0
      0084B0                        467 00136$:
                                    468 ;	lib/src/stm8s_clk.c: 406: return(Swif);
      0084B0 9F               [ 1]  469 	ld	a, xl
                                    470 ;	lib/src/stm8s_clk.c: 407: }
      0084B1 1E 02            [ 2]  471 	ldw	x, (2, sp)
      0084B3 5B 06            [ 2]  472 	addw	sp, #6
      0084B5 FC               [ 2]  473 	jp	(x)
                                    474 ;	lib/src/stm8s_clk.c: 415: void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
                                    475 ;	-----------------------------------------
                                    476 ;	 function CLK_HSIPrescalerConfig
                                    477 ;	-----------------------------------------
      0084B6                        478 _CLK_HSIPrescalerConfig:
      0084B6 88               [ 1]  479 	push	a
      0084B7 6B 01            [ 1]  480 	ld	(0x01, sp), a
                                    481 ;	lib/src/stm8s_clk.c: 421: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      0084B9 C6 50 C6         [ 1]  482 	ld	a, 0x50c6
      0084BC A4 E7            [ 1]  483 	and	a, #0xe7
      0084BE C7 50 C6         [ 1]  484 	ld	0x50c6, a
                                    485 ;	lib/src/stm8s_clk.c: 424: CLK->CKDIVR |= (uint8_t)HSIPrescaler;
      0084C1 C6 50 C6         [ 1]  486 	ld	a, 0x50c6
      0084C4 1A 01            [ 1]  487 	or	a, (0x01, sp)
      0084C6 C7 50 C6         [ 1]  488 	ld	0x50c6, a
                                    489 ;	lib/src/stm8s_clk.c: 425: }
      0084C9 84               [ 1]  490 	pop	a
      0084CA 81               [ 4]  491 	ret
                                    492 ;	lib/src/stm8s_clk.c: 436: void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
                                    493 ;	-----------------------------------------
                                    494 ;	 function CLK_CCOConfig
                                    495 ;	-----------------------------------------
      0084CB                        496 _CLK_CCOConfig:
      0084CB 88               [ 1]  497 	push	a
      0084CC 6B 01            [ 1]  498 	ld	(0x01, sp), a
                                    499 ;	lib/src/stm8s_clk.c: 442: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
      0084CE C6 50 C9         [ 1]  500 	ld	a, 0x50c9
      0084D1 A4 E1            [ 1]  501 	and	a, #0xe1
      0084D3 C7 50 C9         [ 1]  502 	ld	0x50c9, a
                                    503 ;	lib/src/stm8s_clk.c: 445: CLK->CCOR |= (uint8_t)CLK_CCO;
      0084D6 C6 50 C9         [ 1]  504 	ld	a, 0x50c9
      0084D9 1A 01            [ 1]  505 	or	a, (0x01, sp)
      0084DB C7 50 C9         [ 1]  506 	ld	0x50c9, a
                                    507 ;	lib/src/stm8s_clk.c: 448: CLK->CCOR |= CLK_CCOR_CCOEN;
      0084DE 72 10 50 C9      [ 1]  508 	bset	0x50c9, #0
                                    509 ;	lib/src/stm8s_clk.c: 449: }
      0084E2 84               [ 1]  510 	pop	a
      0084E3 81               [ 4]  511 	ret
                                    512 ;	lib/src/stm8s_clk.c: 459: void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
                                    513 ;	-----------------------------------------
                                    514 ;	 function CLK_ITConfig
                                    515 ;	-----------------------------------------
      0084E4                        516 _CLK_ITConfig:
      0084E4 88               [ 1]  517 	push	a
                                    518 ;	lib/src/stm8s_clk.c: 467: switch (CLK_IT)
      0084E5 A1 0C            [ 1]  519 	cp	a, #0x0c
      0084E7 26 07            [ 1]  520 	jrne	00140$
      0084E9 88               [ 1]  521 	push	a
      0084EA A6 01            [ 1]  522 	ld	a, #0x01
      0084EC 6B 02            [ 1]  523 	ld	(0x02, sp), a
      0084EE 84               [ 1]  524 	pop	a
      0084EF C5                     525 	.byte 0xc5
      0084F0                        526 00140$:
      0084F0 0F 01            [ 1]  527 	clr	(0x01, sp)
      0084F2                        528 00141$:
      0084F2 A0 1C            [ 1]  529 	sub	a, #0x1c
      0084F4 26 02            [ 1]  530 	jrne	00143$
      0084F6 4C               [ 1]  531 	inc	a
      0084F7 21                     532 	.byte 0x21
      0084F8                        533 00143$:
      0084F8 4F               [ 1]  534 	clr	a
      0084F9                        535 00144$:
                                    536 ;	lib/src/stm8s_clk.c: 465: if (NewState != DISABLE)
      0084F9 0D 04            [ 1]  537 	tnz	(0x04, sp)
      0084FB 27 1B            [ 1]  538 	jreq	00110$
                                    539 ;	lib/src/stm8s_clk.c: 467: switch (CLK_IT)
      0084FD 0D 01            [ 1]  540 	tnz	(0x01, sp)
      0084FF 26 0D            [ 1]  541 	jrne	00102$
      008501 4D               [ 1]  542 	tnz	a
      008502 27 2D            [ 1]  543 	jreq	00112$
                                    544 ;	lib/src/stm8s_clk.c: 470: CLK->SWCR |= CLK_SWCR_SWIEN;
      008504 C6 50 C5         [ 1]  545 	ld	a, 0x50c5
      008507 AA 04            [ 1]  546 	or	a, #0x04
      008509 C7 50 C5         [ 1]  547 	ld	0x50c5, a
                                    548 ;	lib/src/stm8s_clk.c: 471: break;
      00850C 20 23            [ 2]  549 	jra	00112$
                                    550 ;	lib/src/stm8s_clk.c: 472: case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
      00850E                        551 00102$:
                                    552 ;	lib/src/stm8s_clk.c: 473: CLK->CSSR |= CLK_CSSR_CSSDIE;
      00850E C6 50 C8         [ 1]  553 	ld	a, 0x50c8
      008511 AA 04            [ 1]  554 	or	a, #0x04
      008513 C7 50 C8         [ 1]  555 	ld	0x50c8, a
                                    556 ;	lib/src/stm8s_clk.c: 474: break;
      008516 20 19            [ 2]  557 	jra	00112$
                                    558 ;	lib/src/stm8s_clk.c: 477: }
      008518                        559 00110$:
                                    560 ;	lib/src/stm8s_clk.c: 481: switch (CLK_IT)
      008518 0D 01            [ 1]  561 	tnz	(0x01, sp)
      00851A 26 0D            [ 1]  562 	jrne	00106$
      00851C 4D               [ 1]  563 	tnz	a
      00851D 27 12            [ 1]  564 	jreq	00112$
                                    565 ;	lib/src/stm8s_clk.c: 484: CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
      00851F C6 50 C5         [ 1]  566 	ld	a, 0x50c5
      008522 A4 FB            [ 1]  567 	and	a, #0xfb
      008524 C7 50 C5         [ 1]  568 	ld	0x50c5, a
                                    569 ;	lib/src/stm8s_clk.c: 485: break;
      008527 20 08            [ 2]  570 	jra	00112$
                                    571 ;	lib/src/stm8s_clk.c: 486: case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
      008529                        572 00106$:
                                    573 ;	lib/src/stm8s_clk.c: 487: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
      008529 C6 50 C8         [ 1]  574 	ld	a, 0x50c8
      00852C A4 FB            [ 1]  575 	and	a, #0xfb
      00852E C7 50 C8         [ 1]  576 	ld	0x50c8, a
                                    577 ;	lib/src/stm8s_clk.c: 491: }
      008531                        578 00112$:
                                    579 ;	lib/src/stm8s_clk.c: 493: }
      008531 84               [ 1]  580 	pop	a
      008532 85               [ 2]  581 	popw	x
      008533 84               [ 1]  582 	pop	a
      008534 FC               [ 2]  583 	jp	(x)
                                    584 ;	lib/src/stm8s_clk.c: 500: void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
                                    585 ;	-----------------------------------------
                                    586 ;	 function CLK_SYSCLKConfig
                                    587 ;	-----------------------------------------
      008535                        588 _CLK_SYSCLKConfig:
      008535 88               [ 1]  589 	push	a
      008536 95               [ 1]  590 	ld	xh, a
                                    591 ;	lib/src/stm8s_clk.c: 507: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      008537 C6 50 C6         [ 1]  592 	ld	a, 0x50c6
                                    593 ;	lib/src/stm8s_clk.c: 505: if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
      00853A 5D               [ 2]  594 	tnzw	x
      00853B 2B 14            [ 1]  595 	jrmi	00102$
                                    596 ;	lib/src/stm8s_clk.c: 507: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      00853D A4 E7            [ 1]  597 	and	a, #0xe7
      00853F C7 50 C6         [ 1]  598 	ld	0x50c6, a
                                    599 ;	lib/src/stm8s_clk.c: 508: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
      008542 C6 50 C6         [ 1]  600 	ld	a, 0x50c6
      008545 6B 01            [ 1]  601 	ld	(0x01, sp), a
      008547 9E               [ 1]  602 	ld	a, xh
      008548 A4 18            [ 1]  603 	and	a, #0x18
      00854A 1A 01            [ 1]  604 	or	a, (0x01, sp)
      00854C C7 50 C6         [ 1]  605 	ld	0x50c6, a
      00854F 20 12            [ 2]  606 	jra	00104$
      008551                        607 00102$:
                                    608 ;	lib/src/stm8s_clk.c: 512: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
      008551 A4 F8            [ 1]  609 	and	a, #0xf8
      008553 C7 50 C6         [ 1]  610 	ld	0x50c6, a
                                    611 ;	lib/src/stm8s_clk.c: 513: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
      008556 C6 50 C6         [ 1]  612 	ld	a, 0x50c6
      008559 6B 01            [ 1]  613 	ld	(0x01, sp), a
      00855B 9E               [ 1]  614 	ld	a, xh
      00855C A4 07            [ 1]  615 	and	a, #0x07
      00855E 1A 01            [ 1]  616 	or	a, (0x01, sp)
      008560 C7 50 C6         [ 1]  617 	ld	0x50c6, a
      008563                        618 00104$:
                                    619 ;	lib/src/stm8s_clk.c: 515: }
      008563 84               [ 1]  620 	pop	a
      008564 81               [ 4]  621 	ret
                                    622 ;	lib/src/stm8s_clk.c: 523: void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
                                    623 ;	-----------------------------------------
                                    624 ;	 function CLK_SWIMConfig
                                    625 ;	-----------------------------------------
      008565                        626 _CLK_SWIMConfig:
      008565 88               [ 1]  627 	push	a
      008566 6B 01            [ 1]  628 	ld	(0x01, sp), a
                                    629 ;	lib/src/stm8s_clk.c: 531: CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
      008568 C6 50 CD         [ 1]  630 	ld	a, 0x50cd
                                    631 ;	lib/src/stm8s_clk.c: 528: if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
      00856B 0D 01            [ 1]  632 	tnz	(0x01, sp)
      00856D 27 07            [ 1]  633 	jreq	00102$
                                    634 ;	lib/src/stm8s_clk.c: 531: CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
      00856F AA 01            [ 1]  635 	or	a, #0x01
      008571 C7 50 CD         [ 1]  636 	ld	0x50cd, a
      008574 20 05            [ 2]  637 	jra	00104$
      008576                        638 00102$:
                                    639 ;	lib/src/stm8s_clk.c: 536: CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
      008576 A4 FE            [ 1]  640 	and	a, #0xfe
      008578 C7 50 CD         [ 1]  641 	ld	0x50cd, a
      00857B                        642 00104$:
                                    643 ;	lib/src/stm8s_clk.c: 538: }
      00857B 84               [ 1]  644 	pop	a
      00857C 81               [ 4]  645 	ret
                                    646 ;	lib/src/stm8s_clk.c: 547: void CLK_ClockSecuritySystemEnable(void)
                                    647 ;	-----------------------------------------
                                    648 ;	 function CLK_ClockSecuritySystemEnable
                                    649 ;	-----------------------------------------
      00857D                        650 _CLK_ClockSecuritySystemEnable:
                                    651 ;	lib/src/stm8s_clk.c: 550: CLK->CSSR |= CLK_CSSR_CSSEN;
      00857D 72 10 50 C8      [ 1]  652 	bset	0x50c8, #0
                                    653 ;	lib/src/stm8s_clk.c: 551: }
      008581 81               [ 4]  654 	ret
                                    655 ;	lib/src/stm8s_clk.c: 559: CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
                                    656 ;	-----------------------------------------
                                    657 ;	 function CLK_GetSYSCLKSource
                                    658 ;	-----------------------------------------
      008582                        659 _CLK_GetSYSCLKSource:
                                    660 ;	lib/src/stm8s_clk.c: 561: return((CLK_Source_TypeDef)CLK->CMSR);
      008582 C6 50 C3         [ 1]  661 	ld	a, 0x50c3
                                    662 ;	lib/src/stm8s_clk.c: 562: }
      008585 81               [ 4]  663 	ret
                                    664 ;	lib/src/stm8s_clk.c: 569: uint32_t CLK_GetClockFreq(void)
                                    665 ;	-----------------------------------------
                                    666 ;	 function CLK_GetClockFreq
                                    667 ;	-----------------------------------------
      008586                        668 _CLK_GetClockFreq:
      008586 52 04            [ 2]  669 	sub	sp, #4
                                    670 ;	lib/src/stm8s_clk.c: 576: clocksource = (CLK_Source_TypeDef)CLK->CMSR;
      008588 C6 50 C3         [ 1]  671 	ld	a, 0x50c3
                                    672 ;	lib/src/stm8s_clk.c: 578: if (clocksource == CLK_SOURCE_HSI)
      00858B 6B 04            [ 1]  673 	ld	(0x04, sp), a
      00858D A1 E1            [ 1]  674 	cp	a, #0xe1
      00858F 26 22            [ 1]  675 	jrne	00105$
                                    676 ;	lib/src/stm8s_clk.c: 580: tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
      008591 C6 50 C6         [ 1]  677 	ld	a, 0x50c6
      008594 A4 18            [ 1]  678 	and	a, #0x18
                                    679 ;	lib/src/stm8s_clk.c: 581: tmp = (uint8_t)(tmp >> 3);
      008596 44               [ 1]  680 	srl	a
      008597 44               [ 1]  681 	srl	a
      008598 44               [ 1]  682 	srl	a
                                    683 ;	lib/src/stm8s_clk.c: 582: clockfrequency = HSI_VALUE >> HSIDivExp[tmp];
      008599 5F               [ 1]  684 	clrw	x
      00859A 97               [ 1]  685 	ld	xl, a
      00859B D6 80 2D         [ 1]  686 	ld	a, (_HSIDivExp+0, x)
      00859E AE 24 00         [ 2]  687 	ldw	x, #0x2400
      0085A1 1F 03            [ 2]  688 	ldw	(0x03, sp), x
      0085A3 AE 00 F4         [ 2]  689 	ldw	x, #0x00f4
      0085A6 4D               [ 1]  690 	tnz	a
      0085A7 27 21            [ 1]  691 	jreq	00106$
      0085A9                        692 00122$:
      0085A9 54               [ 2]  693 	srlw	x
      0085AA 06 03            [ 1]  694 	rrc	(0x03, sp)
      0085AC 06 04            [ 1]  695 	rrc	(0x04, sp)
      0085AE 4A               [ 1]  696 	dec	a
      0085AF 26 F8            [ 1]  697 	jrne	00122$
      0085B1 20 17            [ 2]  698 	jra	00106$
      0085B3                        699 00105$:
                                    700 ;	lib/src/stm8s_clk.c: 584: else if ( clocksource == CLK_SOURCE_LSI)
      0085B3 7B 04            [ 1]  701 	ld	a, (0x04, sp)
      0085B5 A1 D2            [ 1]  702 	cp	a, #0xd2
      0085B7 26 09            [ 1]  703 	jrne	00102$
                                    704 ;	lib/src/stm8s_clk.c: 586: clockfrequency = LSI_VALUE;
      0085B9 AE F4 00         [ 2]  705 	ldw	x, #0xf400
      0085BC 1F 03            [ 2]  706 	ldw	(0x03, sp), x
      0085BE 5F               [ 1]  707 	clrw	x
      0085BF 5C               [ 1]  708 	incw	x
      0085C0 20 08            [ 2]  709 	jra	00106$
      0085C2                        710 00102$:
                                    711 ;	lib/src/stm8s_clk.c: 590: clockfrequency = HSE_VALUE;
      0085C2 AE 24 00         [ 2]  712 	ldw	x, #0x2400
      0085C5 1F 03            [ 2]  713 	ldw	(0x03, sp), x
      0085C7 AE 00 F4         [ 2]  714 	ldw	x, #0x00f4
      0085CA                        715 00106$:
                                    716 ;	lib/src/stm8s_clk.c: 593: return((uint32_t)clockfrequency);
      0085CA 51               [ 1]  717 	exgw	x, y
      0085CB 1E 03            [ 2]  718 	ldw	x, (0x03, sp)
                                    719 ;	lib/src/stm8s_clk.c: 594: }
      0085CD 5B 04            [ 2]  720 	addw	sp, #4
      0085CF 81               [ 4]  721 	ret
                                    722 ;	lib/src/stm8s_clk.c: 603: void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
                                    723 ;	-----------------------------------------
                                    724 ;	 function CLK_AdjustHSICalibrationValue
                                    725 ;	-----------------------------------------
      0085D0                        726 _CLK_AdjustHSICalibrationValue:
      0085D0 88               [ 1]  727 	push	a
      0085D1 6B 01            [ 1]  728 	ld	(0x01, sp), a
                                    729 ;	lib/src/stm8s_clk.c: 609: CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
      0085D3 C6 50 CC         [ 1]  730 	ld	a, 0x50cc
      0085D6 A4 F8            [ 1]  731 	and	a, #0xf8
      0085D8 1A 01            [ 1]  732 	or	a, (0x01, sp)
      0085DA C7 50 CC         [ 1]  733 	ld	0x50cc, a
                                    734 ;	lib/src/stm8s_clk.c: 610: }
      0085DD 84               [ 1]  735 	pop	a
      0085DE 81               [ 4]  736 	ret
                                    737 ;	lib/src/stm8s_clk.c: 621: void CLK_SYSCLKEmergencyClear(void)
                                    738 ;	-----------------------------------------
                                    739 ;	 function CLK_SYSCLKEmergencyClear
                                    740 ;	-----------------------------------------
      0085DF                        741 _CLK_SYSCLKEmergencyClear:
                                    742 ;	lib/src/stm8s_clk.c: 623: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
      0085DF 72 11 50 C5      [ 1]  743 	bres	0x50c5, #0
                                    744 ;	lib/src/stm8s_clk.c: 624: }
      0085E3 81               [ 4]  745 	ret
                                    746 ;	lib/src/stm8s_clk.c: 633: FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
                                    747 ;	-----------------------------------------
                                    748 ;	 function CLK_GetFlagStatus
                                    749 ;	-----------------------------------------
      0085E4                        750 _CLK_GetFlagStatus:
      0085E4 52 04            [ 2]  751 	sub	sp, #4
                                    752 ;	lib/src/stm8s_clk.c: 643: statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
      0085E6 1F 03            [ 2]  753 	ldw	(0x03, sp), x
      0085E8 4F               [ 1]  754 	clr	a
      0085E9 97               [ 1]  755 	ld	xl, a
                                    756 ;	lib/src/stm8s_clk.c: 646: if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
      0085EA 1F 01            [ 2]  757 	ldw	(0x01, sp), x
      0085EC A3 01 00         [ 2]  758 	cpw	x, #0x0100
      0085EF 26 05            [ 1]  759 	jrne	00111$
                                    760 ;	lib/src/stm8s_clk.c: 648: tmpreg = CLK->ICKR;
      0085F1 C6 50 C0         [ 1]  761 	ld	a, 0x50c0
      0085F4 20 27            [ 2]  762 	jra	00112$
      0085F6                        763 00111$:
                                    764 ;	lib/src/stm8s_clk.c: 650: else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
      0085F6 1E 01            [ 2]  765 	ldw	x, (0x01, sp)
      0085F8 A3 02 00         [ 2]  766 	cpw	x, #0x0200
      0085FB 26 05            [ 1]  767 	jrne	00108$
                                    768 ;	lib/src/stm8s_clk.c: 652: tmpreg = CLK->ECKR;
      0085FD C6 50 C1         [ 1]  769 	ld	a, 0x50c1
      008600 20 1B            [ 2]  770 	jra	00112$
      008602                        771 00108$:
                                    772 ;	lib/src/stm8s_clk.c: 654: else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
      008602 1E 01            [ 2]  773 	ldw	x, (0x01, sp)
      008604 A3 03 00         [ 2]  774 	cpw	x, #0x0300
      008607 26 05            [ 1]  775 	jrne	00105$
                                    776 ;	lib/src/stm8s_clk.c: 656: tmpreg = CLK->SWCR;
      008609 C6 50 C5         [ 1]  777 	ld	a, 0x50c5
      00860C 20 0F            [ 2]  778 	jra	00112$
      00860E                        779 00105$:
                                    780 ;	lib/src/stm8s_clk.c: 658: else if (statusreg == 0x0400) /* The flag to check is in CSS register */
      00860E 1E 01            [ 2]  781 	ldw	x, (0x01, sp)
      008610 A3 04 00         [ 2]  782 	cpw	x, #0x0400
      008613 26 05            [ 1]  783 	jrne	00102$
                                    784 ;	lib/src/stm8s_clk.c: 660: tmpreg = CLK->CSSR;
      008615 C6 50 C8         [ 1]  785 	ld	a, 0x50c8
      008618 20 03            [ 2]  786 	jra	00112$
      00861A                        787 00102$:
                                    788 ;	lib/src/stm8s_clk.c: 664: tmpreg = CLK->CCOR;
      00861A C6 50 C9         [ 1]  789 	ld	a, 0x50c9
      00861D                        790 00112$:
                                    791 ;	lib/src/stm8s_clk.c: 667: if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
      00861D 88               [ 1]  792 	push	a
      00861E 7B 05            [ 1]  793 	ld	a, (0x05, sp)
      008620 6B 03            [ 1]  794 	ld	(0x03, sp), a
      008622 84               [ 1]  795 	pop	a
      008623 14 02            [ 1]  796 	and	a, (0x02, sp)
      008625 27 03            [ 1]  797 	jreq	00114$
                                    798 ;	lib/src/stm8s_clk.c: 669: bitstatus = SET;
      008627 A6 01            [ 1]  799 	ld	a, #0x01
                                    800 ;	lib/src/stm8s_clk.c: 673: bitstatus = RESET;
      008629 21                     801 	.byte 0x21
      00862A                        802 00114$:
      00862A 4F               [ 1]  803 	clr	a
      00862B                        804 00115$:
                                    805 ;	lib/src/stm8s_clk.c: 677: return((FlagStatus)bitstatus);
                                    806 ;	lib/src/stm8s_clk.c: 678: }
      00862B 5B 04            [ 2]  807 	addw	sp, #4
      00862D 81               [ 4]  808 	ret
                                    809 ;	lib/src/stm8s_clk.c: 686: ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
                                    810 ;	-----------------------------------------
                                    811 ;	 function CLK_GetITStatus
                                    812 ;	-----------------------------------------
      00862E                        813 _CLK_GetITStatus:
      00862E 88               [ 1]  814 	push	a
                                    815 ;	lib/src/stm8s_clk.c: 693: if (CLK_IT == CLK_IT_SWIF)
      00862F 6B 01            [ 1]  816 	ld	(0x01, sp), a
      008631 A1 1C            [ 1]  817 	cp	a, #0x1c
      008633 26 0F            [ 1]  818 	jrne	00108$
                                    819 ;	lib/src/stm8s_clk.c: 696: if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      008635 C6 50 C5         [ 1]  820 	ld	a, 0x50c5
      008638 14 01            [ 1]  821 	and	a, (0x01, sp)
                                    822 ;	lib/src/stm8s_clk.c: 698: bitstatus = SET;
      00863A A0 0C            [ 1]  823 	sub	a, #0x0c
      00863C 26 03            [ 1]  824 	jrne	00102$
      00863E 4C               [ 1]  825 	inc	a
      00863F 20 0F            [ 2]  826 	jra	00109$
      008641                        827 00102$:
                                    828 ;	lib/src/stm8s_clk.c: 702: bitstatus = RESET;
      008641 4F               [ 1]  829 	clr	a
      008642 20 0C            [ 2]  830 	jra	00109$
      008644                        831 00108$:
                                    832 ;	lib/src/stm8s_clk.c: 708: if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      008644 C6 50 C8         [ 1]  833 	ld	a, 0x50c8
      008647 14 01            [ 1]  834 	and	a, (0x01, sp)
                                    835 ;	lib/src/stm8s_clk.c: 710: bitstatus = SET;
      008649 A0 0C            [ 1]  836 	sub	a, #0x0c
      00864B 26 02            [ 1]  837 	jrne	00105$
      00864D 4C               [ 1]  838 	inc	a
                                    839 ;	lib/src/stm8s_clk.c: 714: bitstatus = RESET;
      00864E 21                     840 	.byte 0x21
      00864F                        841 00105$:
      00864F 4F               [ 1]  842 	clr	a
      008650                        843 00109$:
                                    844 ;	lib/src/stm8s_clk.c: 719: return bitstatus;
                                    845 ;	lib/src/stm8s_clk.c: 720: }
      008650 5B 01            [ 2]  846 	addw	sp, #1
      008652 81               [ 4]  847 	ret
                                    848 ;	lib/src/stm8s_clk.c: 728: void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
                                    849 ;	-----------------------------------------
                                    850 ;	 function CLK_ClearITPendingBit
                                    851 ;	-----------------------------------------
      008653                        852 _CLK_ClearITPendingBit:
                                    853 ;	lib/src/stm8s_clk.c: 733: if (CLK_IT == (uint8_t)CLK_IT_CSSD)
      008653 A1 0C            [ 1]  854 	cp	a, #0x0c
      008655 26 05            [ 1]  855 	jrne	00102$
                                    856 ;	lib/src/stm8s_clk.c: 736: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
      008657 72 17 50 C8      [ 1]  857 	bres	0x50c8, #3
      00865B 81               [ 4]  858 	ret
      00865C                        859 00102$:
                                    860 ;	lib/src/stm8s_clk.c: 741: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
      00865C 72 17 50 C5      [ 1]  861 	bres	0x50c5, #3
                                    862 ;	lib/src/stm8s_clk.c: 744: }
      008660 81               [ 4]  863 	ret
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
