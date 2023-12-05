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
      00823C                         77 _CLK_DeInit:
                                     78 ;	lib/src/stm8s_clk.c: 74: CLK->ICKR = CLK_ICKR_RESET_VALUE;
      00823C 35 01 50 C0      [ 1]   79 	mov	0x50c0+0, #0x01
                                     80 ;	lib/src/stm8s_clk.c: 75: CLK->ECKR = CLK_ECKR_RESET_VALUE;
      008240 35 00 50 C1      [ 1]   81 	mov	0x50c1+0, #0x00
                                     82 ;	lib/src/stm8s_clk.c: 76: CLK->SWR  = CLK_SWR_RESET_VALUE;
      008244 35 E1 50 C4      [ 1]   83 	mov	0x50c4+0, #0xe1
                                     84 ;	lib/src/stm8s_clk.c: 77: CLK->SWCR = CLK_SWCR_RESET_VALUE;
      008248 35 00 50 C5      [ 1]   85 	mov	0x50c5+0, #0x00
                                     86 ;	lib/src/stm8s_clk.c: 78: CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
      00824C 35 18 50 C6      [ 1]   87 	mov	0x50c6+0, #0x18
                                     88 ;	lib/src/stm8s_clk.c: 79: CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
      008250 35 FF 50 C7      [ 1]   89 	mov	0x50c7+0, #0xff
                                     90 ;	lib/src/stm8s_clk.c: 80: CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
      008254 35 FF 50 CA      [ 1]   91 	mov	0x50ca+0, #0xff
                                     92 ;	lib/src/stm8s_clk.c: 81: CLK->CSSR = CLK_CSSR_RESET_VALUE;
      008258 35 00 50 C8      [ 1]   93 	mov	0x50c8+0, #0x00
                                     94 ;	lib/src/stm8s_clk.c: 82: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      00825C 35 00 50 C9      [ 1]   95 	mov	0x50c9+0, #0x00
                                     96 ;	lib/src/stm8s_clk.c: 83: while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
      008260                         97 00101$:
      008260 72 00 50 C9 FB   [ 2]   98 	btjt	0x50c9, #0, 00101$
                                     99 ;	lib/src/stm8s_clk.c: 85: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      008265 35 00 50 C9      [ 1]  100 	mov	0x50c9+0, #0x00
                                    101 ;	lib/src/stm8s_clk.c: 86: CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
      008269 35 00 50 CC      [ 1]  102 	mov	0x50cc+0, #0x00
                                    103 ;	lib/src/stm8s_clk.c: 87: CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
      00826D 35 00 50 CD      [ 1]  104 	mov	0x50cd+0, #0x00
                                    105 ;	lib/src/stm8s_clk.c: 88: }
      008271 81               [ 4]  106 	ret
                                    107 ;	lib/src/stm8s_clk.c: 99: void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
                                    108 ;	-----------------------------------------
                                    109 ;	 function CLK_FastHaltWakeUpCmd
                                    110 ;	-----------------------------------------
      008272                        111 _CLK_FastHaltWakeUpCmd:
      008272 88               [ 1]  112 	push	a
      008273 6B 01            [ 1]  113 	ld	(0x01, sp), a
                                    114 ;	lib/src/stm8s_clk.c: 107: CLK->ICKR |= CLK_ICKR_FHWU;
      008275 C6 50 C0         [ 1]  115 	ld	a, 0x50c0
                                    116 ;	lib/src/stm8s_clk.c: 104: if (NewState != DISABLE)
      008278 0D 01            [ 1]  117 	tnz	(0x01, sp)
      00827A 27 07            [ 1]  118 	jreq	00102$
                                    119 ;	lib/src/stm8s_clk.c: 107: CLK->ICKR |= CLK_ICKR_FHWU;
      00827C AA 04            [ 1]  120 	or	a, #0x04
      00827E C7 50 C0         [ 1]  121 	ld	0x50c0, a
      008281 20 05            [ 2]  122 	jra	00104$
      008283                        123 00102$:
                                    124 ;	lib/src/stm8s_clk.c: 112: CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
      008283 A4 FB            [ 1]  125 	and	a, #0xfb
      008285 C7 50 C0         [ 1]  126 	ld	0x50c0, a
      008288                        127 00104$:
                                    128 ;	lib/src/stm8s_clk.c: 114: }
      008288 84               [ 1]  129 	pop	a
      008289 81               [ 4]  130 	ret
                                    131 ;	lib/src/stm8s_clk.c: 121: void CLK_HSECmd(FunctionalState NewState)
                                    132 ;	-----------------------------------------
                                    133 ;	 function CLK_HSECmd
                                    134 ;	-----------------------------------------
      00828A                        135 _CLK_HSECmd:
      00828A 88               [ 1]  136 	push	a
      00828B 6B 01            [ 1]  137 	ld	(0x01, sp), a
                                    138 ;	lib/src/stm8s_clk.c: 129: CLK->ECKR |= CLK_ECKR_HSEEN;
      00828D C6 50 C1         [ 1]  139 	ld	a, 0x50c1
                                    140 ;	lib/src/stm8s_clk.c: 126: if (NewState != DISABLE)
      008290 0D 01            [ 1]  141 	tnz	(0x01, sp)
      008292 27 07            [ 1]  142 	jreq	00102$
                                    143 ;	lib/src/stm8s_clk.c: 129: CLK->ECKR |= CLK_ECKR_HSEEN;
      008294 AA 01            [ 1]  144 	or	a, #0x01
      008296 C7 50 C1         [ 1]  145 	ld	0x50c1, a
      008299 20 05            [ 2]  146 	jra	00104$
      00829B                        147 00102$:
                                    148 ;	lib/src/stm8s_clk.c: 134: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
      00829B A4 FE            [ 1]  149 	and	a, #0xfe
      00829D C7 50 C1         [ 1]  150 	ld	0x50c1, a
      0082A0                        151 00104$:
                                    152 ;	lib/src/stm8s_clk.c: 136: }
      0082A0 84               [ 1]  153 	pop	a
      0082A1 81               [ 4]  154 	ret
                                    155 ;	lib/src/stm8s_clk.c: 143: void CLK_HSICmd(FunctionalState NewState)
                                    156 ;	-----------------------------------------
                                    157 ;	 function CLK_HSICmd
                                    158 ;	-----------------------------------------
      0082A2                        159 _CLK_HSICmd:
      0082A2 88               [ 1]  160 	push	a
      0082A3 6B 01            [ 1]  161 	ld	(0x01, sp), a
                                    162 ;	lib/src/stm8s_clk.c: 151: CLK->ICKR |= CLK_ICKR_HSIEN;
      0082A5 C6 50 C0         [ 1]  163 	ld	a, 0x50c0
                                    164 ;	lib/src/stm8s_clk.c: 148: if (NewState != DISABLE)
      0082A8 0D 01            [ 1]  165 	tnz	(0x01, sp)
      0082AA 27 07            [ 1]  166 	jreq	00102$
                                    167 ;	lib/src/stm8s_clk.c: 151: CLK->ICKR |= CLK_ICKR_HSIEN;
      0082AC AA 01            [ 1]  168 	or	a, #0x01
      0082AE C7 50 C0         [ 1]  169 	ld	0x50c0, a
      0082B1 20 05            [ 2]  170 	jra	00104$
      0082B3                        171 00102$:
                                    172 ;	lib/src/stm8s_clk.c: 156: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
      0082B3 A4 FE            [ 1]  173 	and	a, #0xfe
      0082B5 C7 50 C0         [ 1]  174 	ld	0x50c0, a
      0082B8                        175 00104$:
                                    176 ;	lib/src/stm8s_clk.c: 158: }
      0082B8 84               [ 1]  177 	pop	a
      0082B9 81               [ 4]  178 	ret
                                    179 ;	lib/src/stm8s_clk.c: 166: void CLK_LSICmd(FunctionalState NewState)
                                    180 ;	-----------------------------------------
                                    181 ;	 function CLK_LSICmd
                                    182 ;	-----------------------------------------
      0082BA                        183 _CLK_LSICmd:
      0082BA 88               [ 1]  184 	push	a
      0082BB 6B 01            [ 1]  185 	ld	(0x01, sp), a
                                    186 ;	lib/src/stm8s_clk.c: 174: CLK->ICKR |= CLK_ICKR_LSIEN;
      0082BD C6 50 C0         [ 1]  187 	ld	a, 0x50c0
                                    188 ;	lib/src/stm8s_clk.c: 171: if (NewState != DISABLE)
      0082C0 0D 01            [ 1]  189 	tnz	(0x01, sp)
      0082C2 27 07            [ 1]  190 	jreq	00102$
                                    191 ;	lib/src/stm8s_clk.c: 174: CLK->ICKR |= CLK_ICKR_LSIEN;
      0082C4 AA 08            [ 1]  192 	or	a, #0x08
      0082C6 C7 50 C0         [ 1]  193 	ld	0x50c0, a
      0082C9 20 05            [ 2]  194 	jra	00104$
      0082CB                        195 00102$:
                                    196 ;	lib/src/stm8s_clk.c: 179: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
      0082CB A4 F7            [ 1]  197 	and	a, #0xf7
      0082CD C7 50 C0         [ 1]  198 	ld	0x50c0, a
      0082D0                        199 00104$:
                                    200 ;	lib/src/stm8s_clk.c: 181: }
      0082D0 84               [ 1]  201 	pop	a
      0082D1 81               [ 4]  202 	ret
                                    203 ;	lib/src/stm8s_clk.c: 189: void CLK_CCOCmd(FunctionalState NewState)
                                    204 ;	-----------------------------------------
                                    205 ;	 function CLK_CCOCmd
                                    206 ;	-----------------------------------------
      0082D2                        207 _CLK_CCOCmd:
      0082D2 88               [ 1]  208 	push	a
      0082D3 6B 01            [ 1]  209 	ld	(0x01, sp), a
                                    210 ;	lib/src/stm8s_clk.c: 197: CLK->CCOR |= CLK_CCOR_CCOEN;
      0082D5 C6 50 C9         [ 1]  211 	ld	a, 0x50c9
                                    212 ;	lib/src/stm8s_clk.c: 194: if (NewState != DISABLE)
      0082D8 0D 01            [ 1]  213 	tnz	(0x01, sp)
      0082DA 27 07            [ 1]  214 	jreq	00102$
                                    215 ;	lib/src/stm8s_clk.c: 197: CLK->CCOR |= CLK_CCOR_CCOEN;
      0082DC AA 01            [ 1]  216 	or	a, #0x01
      0082DE C7 50 C9         [ 1]  217 	ld	0x50c9, a
      0082E1 20 05            [ 2]  218 	jra	00104$
      0082E3                        219 00102$:
                                    220 ;	lib/src/stm8s_clk.c: 202: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
      0082E3 A4 FE            [ 1]  221 	and	a, #0xfe
      0082E5 C7 50 C9         [ 1]  222 	ld	0x50c9, a
      0082E8                        223 00104$:
                                    224 ;	lib/src/stm8s_clk.c: 204: }
      0082E8 84               [ 1]  225 	pop	a
      0082E9 81               [ 4]  226 	ret
                                    227 ;	lib/src/stm8s_clk.c: 213: void CLK_ClockSwitchCmd(FunctionalState NewState)
                                    228 ;	-----------------------------------------
                                    229 ;	 function CLK_ClockSwitchCmd
                                    230 ;	-----------------------------------------
      0082EA                        231 _CLK_ClockSwitchCmd:
      0082EA 88               [ 1]  232 	push	a
      0082EB 6B 01            [ 1]  233 	ld	(0x01, sp), a
                                    234 ;	lib/src/stm8s_clk.c: 221: CLK->SWCR |= CLK_SWCR_SWEN;
      0082ED C6 50 C5         [ 1]  235 	ld	a, 0x50c5
                                    236 ;	lib/src/stm8s_clk.c: 218: if (NewState != DISABLE )
      0082F0 0D 01            [ 1]  237 	tnz	(0x01, sp)
      0082F2 27 07            [ 1]  238 	jreq	00102$
                                    239 ;	lib/src/stm8s_clk.c: 221: CLK->SWCR |= CLK_SWCR_SWEN;
      0082F4 AA 02            [ 1]  240 	or	a, #0x02
      0082F6 C7 50 C5         [ 1]  241 	ld	0x50c5, a
      0082F9 20 05            [ 2]  242 	jra	00104$
      0082FB                        243 00102$:
                                    244 ;	lib/src/stm8s_clk.c: 226: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
      0082FB A4 FD            [ 1]  245 	and	a, #0xfd
      0082FD C7 50 C5         [ 1]  246 	ld	0x50c5, a
      008300                        247 00104$:
                                    248 ;	lib/src/stm8s_clk.c: 228: }
      008300 84               [ 1]  249 	pop	a
      008301 81               [ 4]  250 	ret
                                    251 ;	lib/src/stm8s_clk.c: 238: void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
                                    252 ;	-----------------------------------------
                                    253 ;	 function CLK_SlowActiveHaltWakeUpCmd
                                    254 ;	-----------------------------------------
      008302                        255 _CLK_SlowActiveHaltWakeUpCmd:
      008302 88               [ 1]  256 	push	a
      008303 6B 01            [ 1]  257 	ld	(0x01, sp), a
                                    258 ;	lib/src/stm8s_clk.c: 246: CLK->ICKR |= CLK_ICKR_SWUAH;
      008305 C6 50 C0         [ 1]  259 	ld	a, 0x50c0
                                    260 ;	lib/src/stm8s_clk.c: 243: if (NewState != DISABLE)
      008308 0D 01            [ 1]  261 	tnz	(0x01, sp)
      00830A 27 07            [ 1]  262 	jreq	00102$
                                    263 ;	lib/src/stm8s_clk.c: 246: CLK->ICKR |= CLK_ICKR_SWUAH;
      00830C AA 20            [ 1]  264 	or	a, #0x20
      00830E C7 50 C0         [ 1]  265 	ld	0x50c0, a
      008311 20 05            [ 2]  266 	jra	00104$
      008313                        267 00102$:
                                    268 ;	lib/src/stm8s_clk.c: 251: CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
      008313 A4 DF            [ 1]  269 	and	a, #0xdf
      008315 C7 50 C0         [ 1]  270 	ld	0x50c0, a
      008318                        271 00104$:
                                    272 ;	lib/src/stm8s_clk.c: 253: }
      008318 84               [ 1]  273 	pop	a
      008319 81               [ 4]  274 	ret
                                    275 ;	lib/src/stm8s_clk.c: 263: void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
                                    276 ;	-----------------------------------------
                                    277 ;	 function CLK_PeripheralClockConfig
                                    278 ;	-----------------------------------------
      00831A                        279 _CLK_PeripheralClockConfig:
      00831A 52 02            [ 2]  280 	sub	sp, #2
                                    281 ;	lib/src/stm8s_clk.c: 274: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      00831C 97               [ 1]  282 	ld	xl, a
      00831D A4 0F            [ 1]  283 	and	a, #0x0f
      00831F 88               [ 1]  284 	push	a
      008320 A6 01            [ 1]  285 	ld	a, #0x01
      008322 6B 02            [ 1]  286 	ld	(0x02, sp), a
      008324 84               [ 1]  287 	pop	a
      008325 4D               [ 1]  288 	tnz	a
      008326 27 05            [ 1]  289 	jreq	00128$
      008328                        290 00127$:
      008328 08 01            [ 1]  291 	sll	(0x01, sp)
      00832A 4A               [ 1]  292 	dec	a
      00832B 26 FB            [ 1]  293 	jrne	00127$
      00832D                        294 00128$:
                                    295 ;	lib/src/stm8s_clk.c: 279: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      00832D 7B 01            [ 1]  296 	ld	a, (0x01, sp)
      00832F 43               [ 1]  297 	cpl	a
      008330 6B 02            [ 1]  298 	ld	(0x02, sp), a
                                    299 ;	lib/src/stm8s_clk.c: 269: if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
      008332 9F               [ 1]  300 	ld	a, xl
      008333 A5 10            [ 1]  301 	bcp	a, #0x10
      008335 26 15            [ 1]  302 	jrne	00108$
                                    303 ;	lib/src/stm8s_clk.c: 274: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008337 C6 50 C7         [ 1]  304 	ld	a, 0x50c7
                                    305 ;	lib/src/stm8s_clk.c: 271: if (NewState != DISABLE)
      00833A 0D 05            [ 1]  306 	tnz	(0x05, sp)
      00833C 27 07            [ 1]  307 	jreq	00102$
                                    308 ;	lib/src/stm8s_clk.c: 274: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      00833E 1A 01            [ 1]  309 	or	a, (0x01, sp)
      008340 C7 50 C7         [ 1]  310 	ld	0x50c7, a
      008343 20 1A            [ 2]  311 	jra	00110$
      008345                        312 00102$:
                                    313 ;	lib/src/stm8s_clk.c: 279: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      008345 14 02            [ 1]  314 	and	a, (0x02, sp)
      008347 C7 50 C7         [ 1]  315 	ld	0x50c7, a
      00834A 20 13            [ 2]  316 	jra	00110$
      00834C                        317 00108$:
                                    318 ;	lib/src/stm8s_clk.c: 287: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      00834C C6 50 CA         [ 1]  319 	ld	a, 0x50ca
                                    320 ;	lib/src/stm8s_clk.c: 284: if (NewState != DISABLE)
      00834F 0D 05            [ 1]  321 	tnz	(0x05, sp)
      008351 27 07            [ 1]  322 	jreq	00105$
                                    323 ;	lib/src/stm8s_clk.c: 287: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008353 1A 01            [ 1]  324 	or	a, (0x01, sp)
      008355 C7 50 CA         [ 1]  325 	ld	0x50ca, a
      008358 20 05            [ 2]  326 	jra	00110$
      00835A                        327 00105$:
                                    328 ;	lib/src/stm8s_clk.c: 292: CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      00835A 14 02            [ 1]  329 	and	a, (0x02, sp)
      00835C C7 50 CA         [ 1]  330 	ld	0x50ca, a
      00835F                        331 00110$:
                                    332 ;	lib/src/stm8s_clk.c: 295: }
      00835F 5B 02            [ 2]  333 	addw	sp, #2
      008361 85               [ 2]  334 	popw	x
      008362 84               [ 1]  335 	pop	a
      008363 FC               [ 2]  336 	jp	(x)
                                    337 ;	lib/src/stm8s_clk.c: 309: ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
                                    338 ;	-----------------------------------------
                                    339 ;	 function CLK_ClockSwitchConfig
                                    340 ;	-----------------------------------------
      008364                        341 _CLK_ClockSwitchConfig:
      008364 88               [ 1]  342 	push	a
      008365 6B 01            [ 1]  343 	ld	(0x01, sp), a
                                    344 ;	lib/src/stm8s_clk.c: 322: clock_master = (CLK_Source_TypeDef)CLK->CMSR;
      008367 C6 50 C3         [ 1]  345 	ld	a, 0x50c3
      00836A 90 97            [ 1]  346 	ld	yl, a
                                    347 ;	lib/src/stm8s_clk.c: 328: CLK->SWCR |= CLK_SWCR_SWEN;
      00836C C6 50 C5         [ 1]  348 	ld	a, 0x50c5
                                    349 ;	lib/src/stm8s_clk.c: 325: if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
      00836F 0D 01            [ 1]  350 	tnz	(0x01, sp)
      008371 27 36            [ 1]  351 	jreq	00122$
                                    352 ;	lib/src/stm8s_clk.c: 328: CLK->SWCR |= CLK_SWCR_SWEN;
      008373 AA 02            [ 1]  353 	or	a, #0x02
      008375 C7 50 C5         [ 1]  354 	ld	0x50c5, a
      008378 C6 50 C5         [ 1]  355 	ld	a, 0x50c5
                                    356 ;	lib/src/stm8s_clk.c: 331: if (ITState != DISABLE)
      00837B 0D 05            [ 1]  357 	tnz	(0x05, sp)
      00837D 27 07            [ 1]  358 	jreq	00102$
                                    359 ;	lib/src/stm8s_clk.c: 333: CLK->SWCR |= CLK_SWCR_SWIEN;
      00837F AA 04            [ 1]  360 	or	a, #0x04
      008381 C7 50 C5         [ 1]  361 	ld	0x50c5, a
      008384 20 05            [ 2]  362 	jra	00103$
      008386                        363 00102$:
                                    364 ;	lib/src/stm8s_clk.c: 337: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
      008386 A4 FB            [ 1]  365 	and	a, #0xfb
      008388 C7 50 C5         [ 1]  366 	ld	0x50c5, a
      00838B                        367 00103$:
                                    368 ;	lib/src/stm8s_clk.c: 341: CLK->SWR = (uint8_t)CLK_NewClock;
      00838B AE 50 C4         [ 2]  369 	ldw	x, #0x50c4
      00838E 7B 04            [ 1]  370 	ld	a, (0x04, sp)
      008390 F7               [ 1]  371 	ld	(x), a
                                    372 ;	lib/src/stm8s_clk.c: 344: while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
      008391 5F               [ 1]  373 	clrw	x
      008392 5A               [ 2]  374 	decw	x
      008393                        375 00105$:
      008393 72 01 50 C5 06   [ 2]  376 	btjf	0x50c5, #0, 00107$
      008398 5D               [ 2]  377 	tnzw	x
      008399 27 03            [ 1]  378 	jreq	00107$
                                    379 ;	lib/src/stm8s_clk.c: 346: DownCounter--;
      00839B 5A               [ 2]  380 	decw	x
      00839C 20 F5            [ 2]  381 	jra	00105$
      00839E                        382 00107$:
                                    383 ;	lib/src/stm8s_clk.c: 349: if(DownCounter != 0)
      00839E 5D               [ 2]  384 	tnzw	x
      00839F 27 05            [ 1]  385 	jreq	00109$
                                    386 ;	lib/src/stm8s_clk.c: 351: Swif = SUCCESS;
      0083A1 A6 01            [ 1]  387 	ld	a, #0x01
      0083A3 97               [ 1]  388 	ld	xl, a
      0083A4 20 32            [ 2]  389 	jra	00123$
      0083A6                        390 00109$:
                                    391 ;	lib/src/stm8s_clk.c: 355: Swif = ERROR;
      0083A6 5F               [ 1]  392 	clrw	x
      0083A7 20 2F            [ 2]  393 	jra	00123$
      0083A9                        394 00122$:
                                    395 ;	lib/src/stm8s_clk.c: 361: if (ITState != DISABLE)
      0083A9 0D 05            [ 1]  396 	tnz	(0x05, sp)
      0083AB 27 07            [ 1]  397 	jreq	00112$
                                    398 ;	lib/src/stm8s_clk.c: 363: CLK->SWCR |= CLK_SWCR_SWIEN;
      0083AD AA 04            [ 1]  399 	or	a, #0x04
      0083AF C7 50 C5         [ 1]  400 	ld	0x50c5, a
      0083B2 20 05            [ 2]  401 	jra	00113$
      0083B4                        402 00112$:
                                    403 ;	lib/src/stm8s_clk.c: 367: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
      0083B4 A4 FB            [ 1]  404 	and	a, #0xfb
      0083B6 C7 50 C5         [ 1]  405 	ld	0x50c5, a
      0083B9                        406 00113$:
                                    407 ;	lib/src/stm8s_clk.c: 371: CLK->SWR = (uint8_t)CLK_NewClock;
      0083B9 AE 50 C4         [ 2]  408 	ldw	x, #0x50c4
      0083BC 7B 04            [ 1]  409 	ld	a, (0x04, sp)
      0083BE F7               [ 1]  410 	ld	(x), a
                                    411 ;	lib/src/stm8s_clk.c: 374: while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
      0083BF 5F               [ 1]  412 	clrw	x
      0083C0 5A               [ 2]  413 	decw	x
      0083C1                        414 00115$:
      0083C1 72 07 50 C5 06   [ 2]  415 	btjf	0x50c5, #3, 00117$
      0083C6 5D               [ 2]  416 	tnzw	x
      0083C7 27 03            [ 1]  417 	jreq	00117$
                                    418 ;	lib/src/stm8s_clk.c: 376: DownCounter--;
      0083C9 5A               [ 2]  419 	decw	x
      0083CA 20 F5            [ 2]  420 	jra	00115$
      0083CC                        421 00117$:
                                    422 ;	lib/src/stm8s_clk.c: 379: if(DownCounter != 0)
      0083CC 5D               [ 2]  423 	tnzw	x
      0083CD 27 08            [ 1]  424 	jreq	00119$
                                    425 ;	lib/src/stm8s_clk.c: 382: CLK->SWCR |= CLK_SWCR_SWEN;
      0083CF 72 12 50 C5      [ 1]  426 	bset	0x50c5, #1
                                    427 ;	lib/src/stm8s_clk.c: 383: Swif = SUCCESS;
      0083D3 A6 01            [ 1]  428 	ld	a, #0x01
      0083D5 97               [ 1]  429 	ld	xl, a
                                    430 ;	lib/src/stm8s_clk.c: 387: Swif = ERROR;
      0083D6 21                     431 	.byte 0x21
      0083D7                        432 00119$:
      0083D7 5F               [ 1]  433 	clrw	x
      0083D8                        434 00123$:
                                    435 ;	lib/src/stm8s_clk.c: 390: if(Swif != ERROR)
      0083D8 9F               [ 1]  436 	ld	a, xl
      0083D9 4D               [ 1]  437 	tnz	a
      0083DA 27 2E            [ 1]  438 	jreq	00136$
                                    439 ;	lib/src/stm8s_clk.c: 393: if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
      0083DC 0D 06            [ 1]  440 	tnz	(0x06, sp)
      0083DE 26 0C            [ 1]  441 	jrne	00132$
      0083E0 90 9F            [ 1]  442 	ld	a, yl
      0083E2 A1 E1            [ 1]  443 	cp	a, #0xe1
      0083E4 26 06            [ 1]  444 	jrne	00132$
                                    445 ;	lib/src/stm8s_clk.c: 395: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
      0083E6 72 11 50 C0      [ 1]  446 	bres	0x50c0, #0
      0083EA 20 1E            [ 2]  447 	jra	00136$
      0083EC                        448 00132$:
                                    449 ;	lib/src/stm8s_clk.c: 397: else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
      0083EC 0D 06            [ 1]  450 	tnz	(0x06, sp)
      0083EE 26 0C            [ 1]  451 	jrne	00128$
      0083F0 90 9F            [ 1]  452 	ld	a, yl
      0083F2 A1 D2            [ 1]  453 	cp	a, #0xd2
      0083F4 26 06            [ 1]  454 	jrne	00128$
                                    455 ;	lib/src/stm8s_clk.c: 399: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
      0083F6 72 17 50 C0      [ 1]  456 	bres	0x50c0, #3
      0083FA 20 0E            [ 2]  457 	jra	00136$
      0083FC                        458 00128$:
                                    459 ;	lib/src/stm8s_clk.c: 401: else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
      0083FC 0D 06            [ 1]  460 	tnz	(0x06, sp)
      0083FE 26 0A            [ 1]  461 	jrne	00136$
      008400 90 9F            [ 1]  462 	ld	a, yl
      008402 A1 B4            [ 1]  463 	cp	a, #0xb4
      008404 26 04            [ 1]  464 	jrne	00136$
                                    465 ;	lib/src/stm8s_clk.c: 403: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
      008406 72 11 50 C1      [ 1]  466 	bres	0x50c1, #0
      00840A                        467 00136$:
                                    468 ;	lib/src/stm8s_clk.c: 406: return(Swif);
      00840A 9F               [ 1]  469 	ld	a, xl
                                    470 ;	lib/src/stm8s_clk.c: 407: }
      00840B 1E 02            [ 2]  471 	ldw	x, (2, sp)
      00840D 5B 06            [ 2]  472 	addw	sp, #6
      00840F FC               [ 2]  473 	jp	(x)
                                    474 ;	lib/src/stm8s_clk.c: 415: void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
                                    475 ;	-----------------------------------------
                                    476 ;	 function CLK_HSIPrescalerConfig
                                    477 ;	-----------------------------------------
      008410                        478 _CLK_HSIPrescalerConfig:
      008410 88               [ 1]  479 	push	a
      008411 6B 01            [ 1]  480 	ld	(0x01, sp), a
                                    481 ;	lib/src/stm8s_clk.c: 421: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      008413 C6 50 C6         [ 1]  482 	ld	a, 0x50c6
      008416 A4 E7            [ 1]  483 	and	a, #0xe7
      008418 C7 50 C6         [ 1]  484 	ld	0x50c6, a
                                    485 ;	lib/src/stm8s_clk.c: 424: CLK->CKDIVR |= (uint8_t)HSIPrescaler;
      00841B C6 50 C6         [ 1]  486 	ld	a, 0x50c6
      00841E 1A 01            [ 1]  487 	or	a, (0x01, sp)
      008420 C7 50 C6         [ 1]  488 	ld	0x50c6, a
                                    489 ;	lib/src/stm8s_clk.c: 425: }
      008423 84               [ 1]  490 	pop	a
      008424 81               [ 4]  491 	ret
                                    492 ;	lib/src/stm8s_clk.c: 436: void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
                                    493 ;	-----------------------------------------
                                    494 ;	 function CLK_CCOConfig
                                    495 ;	-----------------------------------------
      008425                        496 _CLK_CCOConfig:
      008425 88               [ 1]  497 	push	a
      008426 6B 01            [ 1]  498 	ld	(0x01, sp), a
                                    499 ;	lib/src/stm8s_clk.c: 442: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
      008428 C6 50 C9         [ 1]  500 	ld	a, 0x50c9
      00842B A4 E1            [ 1]  501 	and	a, #0xe1
      00842D C7 50 C9         [ 1]  502 	ld	0x50c9, a
                                    503 ;	lib/src/stm8s_clk.c: 445: CLK->CCOR |= (uint8_t)CLK_CCO;
      008430 C6 50 C9         [ 1]  504 	ld	a, 0x50c9
      008433 1A 01            [ 1]  505 	or	a, (0x01, sp)
      008435 C7 50 C9         [ 1]  506 	ld	0x50c9, a
                                    507 ;	lib/src/stm8s_clk.c: 448: CLK->CCOR |= CLK_CCOR_CCOEN;
      008438 72 10 50 C9      [ 1]  508 	bset	0x50c9, #0
                                    509 ;	lib/src/stm8s_clk.c: 449: }
      00843C 84               [ 1]  510 	pop	a
      00843D 81               [ 4]  511 	ret
                                    512 ;	lib/src/stm8s_clk.c: 459: void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
                                    513 ;	-----------------------------------------
                                    514 ;	 function CLK_ITConfig
                                    515 ;	-----------------------------------------
      00843E                        516 _CLK_ITConfig:
      00843E 88               [ 1]  517 	push	a
                                    518 ;	lib/src/stm8s_clk.c: 467: switch (CLK_IT)
      00843F A1 0C            [ 1]  519 	cp	a, #0x0c
      008441 26 07            [ 1]  520 	jrne	00140$
      008443 88               [ 1]  521 	push	a
      008444 A6 01            [ 1]  522 	ld	a, #0x01
      008446 6B 02            [ 1]  523 	ld	(0x02, sp), a
      008448 84               [ 1]  524 	pop	a
      008449 C5                     525 	.byte 0xc5
      00844A                        526 00140$:
      00844A 0F 01            [ 1]  527 	clr	(0x01, sp)
      00844C                        528 00141$:
      00844C A0 1C            [ 1]  529 	sub	a, #0x1c
      00844E 26 02            [ 1]  530 	jrne	00143$
      008450 4C               [ 1]  531 	inc	a
      008451 21                     532 	.byte 0x21
      008452                        533 00143$:
      008452 4F               [ 1]  534 	clr	a
      008453                        535 00144$:
                                    536 ;	lib/src/stm8s_clk.c: 465: if (NewState != DISABLE)
      008453 0D 04            [ 1]  537 	tnz	(0x04, sp)
      008455 27 1B            [ 1]  538 	jreq	00110$
                                    539 ;	lib/src/stm8s_clk.c: 467: switch (CLK_IT)
      008457 0D 01            [ 1]  540 	tnz	(0x01, sp)
      008459 26 0D            [ 1]  541 	jrne	00102$
      00845B 4D               [ 1]  542 	tnz	a
      00845C 27 2D            [ 1]  543 	jreq	00112$
                                    544 ;	lib/src/stm8s_clk.c: 470: CLK->SWCR |= CLK_SWCR_SWIEN;
      00845E C6 50 C5         [ 1]  545 	ld	a, 0x50c5
      008461 AA 04            [ 1]  546 	or	a, #0x04
      008463 C7 50 C5         [ 1]  547 	ld	0x50c5, a
                                    548 ;	lib/src/stm8s_clk.c: 471: break;
      008466 20 23            [ 2]  549 	jra	00112$
                                    550 ;	lib/src/stm8s_clk.c: 472: case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
      008468                        551 00102$:
                                    552 ;	lib/src/stm8s_clk.c: 473: CLK->CSSR |= CLK_CSSR_CSSDIE;
      008468 C6 50 C8         [ 1]  553 	ld	a, 0x50c8
      00846B AA 04            [ 1]  554 	or	a, #0x04
      00846D C7 50 C8         [ 1]  555 	ld	0x50c8, a
                                    556 ;	lib/src/stm8s_clk.c: 474: break;
      008470 20 19            [ 2]  557 	jra	00112$
                                    558 ;	lib/src/stm8s_clk.c: 477: }
      008472                        559 00110$:
                                    560 ;	lib/src/stm8s_clk.c: 481: switch (CLK_IT)
      008472 0D 01            [ 1]  561 	tnz	(0x01, sp)
      008474 26 0D            [ 1]  562 	jrne	00106$
      008476 4D               [ 1]  563 	tnz	a
      008477 27 12            [ 1]  564 	jreq	00112$
                                    565 ;	lib/src/stm8s_clk.c: 484: CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
      008479 C6 50 C5         [ 1]  566 	ld	a, 0x50c5
      00847C A4 FB            [ 1]  567 	and	a, #0xfb
      00847E C7 50 C5         [ 1]  568 	ld	0x50c5, a
                                    569 ;	lib/src/stm8s_clk.c: 485: break;
      008481 20 08            [ 2]  570 	jra	00112$
                                    571 ;	lib/src/stm8s_clk.c: 486: case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
      008483                        572 00106$:
                                    573 ;	lib/src/stm8s_clk.c: 487: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
      008483 C6 50 C8         [ 1]  574 	ld	a, 0x50c8
      008486 A4 FB            [ 1]  575 	and	a, #0xfb
      008488 C7 50 C8         [ 1]  576 	ld	0x50c8, a
                                    577 ;	lib/src/stm8s_clk.c: 491: }
      00848B                        578 00112$:
                                    579 ;	lib/src/stm8s_clk.c: 493: }
      00848B 84               [ 1]  580 	pop	a
      00848C 85               [ 2]  581 	popw	x
      00848D 84               [ 1]  582 	pop	a
      00848E FC               [ 2]  583 	jp	(x)
                                    584 ;	lib/src/stm8s_clk.c: 500: void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
                                    585 ;	-----------------------------------------
                                    586 ;	 function CLK_SYSCLKConfig
                                    587 ;	-----------------------------------------
      00848F                        588 _CLK_SYSCLKConfig:
      00848F 88               [ 1]  589 	push	a
      008490 95               [ 1]  590 	ld	xh, a
                                    591 ;	lib/src/stm8s_clk.c: 507: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      008491 C6 50 C6         [ 1]  592 	ld	a, 0x50c6
                                    593 ;	lib/src/stm8s_clk.c: 505: if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
      008494 5D               [ 2]  594 	tnzw	x
      008495 2B 14            [ 1]  595 	jrmi	00102$
                                    596 ;	lib/src/stm8s_clk.c: 507: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      008497 A4 E7            [ 1]  597 	and	a, #0xe7
      008499 C7 50 C6         [ 1]  598 	ld	0x50c6, a
                                    599 ;	lib/src/stm8s_clk.c: 508: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
      00849C C6 50 C6         [ 1]  600 	ld	a, 0x50c6
      00849F 6B 01            [ 1]  601 	ld	(0x01, sp), a
      0084A1 9E               [ 1]  602 	ld	a, xh
      0084A2 A4 18            [ 1]  603 	and	a, #0x18
      0084A4 1A 01            [ 1]  604 	or	a, (0x01, sp)
      0084A6 C7 50 C6         [ 1]  605 	ld	0x50c6, a
      0084A9 20 12            [ 2]  606 	jra	00104$
      0084AB                        607 00102$:
                                    608 ;	lib/src/stm8s_clk.c: 512: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
      0084AB A4 F8            [ 1]  609 	and	a, #0xf8
      0084AD C7 50 C6         [ 1]  610 	ld	0x50c6, a
                                    611 ;	lib/src/stm8s_clk.c: 513: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
      0084B0 C6 50 C6         [ 1]  612 	ld	a, 0x50c6
      0084B3 6B 01            [ 1]  613 	ld	(0x01, sp), a
      0084B5 9E               [ 1]  614 	ld	a, xh
      0084B6 A4 07            [ 1]  615 	and	a, #0x07
      0084B8 1A 01            [ 1]  616 	or	a, (0x01, sp)
      0084BA C7 50 C6         [ 1]  617 	ld	0x50c6, a
      0084BD                        618 00104$:
                                    619 ;	lib/src/stm8s_clk.c: 515: }
      0084BD 84               [ 1]  620 	pop	a
      0084BE 81               [ 4]  621 	ret
                                    622 ;	lib/src/stm8s_clk.c: 523: void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
                                    623 ;	-----------------------------------------
                                    624 ;	 function CLK_SWIMConfig
                                    625 ;	-----------------------------------------
      0084BF                        626 _CLK_SWIMConfig:
      0084BF 88               [ 1]  627 	push	a
      0084C0 6B 01            [ 1]  628 	ld	(0x01, sp), a
                                    629 ;	lib/src/stm8s_clk.c: 531: CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
      0084C2 C6 50 CD         [ 1]  630 	ld	a, 0x50cd
                                    631 ;	lib/src/stm8s_clk.c: 528: if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
      0084C5 0D 01            [ 1]  632 	tnz	(0x01, sp)
      0084C7 27 07            [ 1]  633 	jreq	00102$
                                    634 ;	lib/src/stm8s_clk.c: 531: CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
      0084C9 AA 01            [ 1]  635 	or	a, #0x01
      0084CB C7 50 CD         [ 1]  636 	ld	0x50cd, a
      0084CE 20 05            [ 2]  637 	jra	00104$
      0084D0                        638 00102$:
                                    639 ;	lib/src/stm8s_clk.c: 536: CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
      0084D0 A4 FE            [ 1]  640 	and	a, #0xfe
      0084D2 C7 50 CD         [ 1]  641 	ld	0x50cd, a
      0084D5                        642 00104$:
                                    643 ;	lib/src/stm8s_clk.c: 538: }
      0084D5 84               [ 1]  644 	pop	a
      0084D6 81               [ 4]  645 	ret
                                    646 ;	lib/src/stm8s_clk.c: 547: void CLK_ClockSecuritySystemEnable(void)
                                    647 ;	-----------------------------------------
                                    648 ;	 function CLK_ClockSecuritySystemEnable
                                    649 ;	-----------------------------------------
      0084D7                        650 _CLK_ClockSecuritySystemEnable:
                                    651 ;	lib/src/stm8s_clk.c: 550: CLK->CSSR |= CLK_CSSR_CSSEN;
      0084D7 72 10 50 C8      [ 1]  652 	bset	0x50c8, #0
                                    653 ;	lib/src/stm8s_clk.c: 551: }
      0084DB 81               [ 4]  654 	ret
                                    655 ;	lib/src/stm8s_clk.c: 559: CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
                                    656 ;	-----------------------------------------
                                    657 ;	 function CLK_GetSYSCLKSource
                                    658 ;	-----------------------------------------
      0084DC                        659 _CLK_GetSYSCLKSource:
                                    660 ;	lib/src/stm8s_clk.c: 561: return((CLK_Source_TypeDef)CLK->CMSR);
      0084DC C6 50 C3         [ 1]  661 	ld	a, 0x50c3
                                    662 ;	lib/src/stm8s_clk.c: 562: }
      0084DF 81               [ 4]  663 	ret
                                    664 ;	lib/src/stm8s_clk.c: 569: uint32_t CLK_GetClockFreq(void)
                                    665 ;	-----------------------------------------
                                    666 ;	 function CLK_GetClockFreq
                                    667 ;	-----------------------------------------
      0084E0                        668 _CLK_GetClockFreq:
      0084E0 52 04            [ 2]  669 	sub	sp, #4
                                    670 ;	lib/src/stm8s_clk.c: 576: clocksource = (CLK_Source_TypeDef)CLK->CMSR;
      0084E2 C6 50 C3         [ 1]  671 	ld	a, 0x50c3
                                    672 ;	lib/src/stm8s_clk.c: 578: if (clocksource == CLK_SOURCE_HSI)
      0084E5 6B 04            [ 1]  673 	ld	(0x04, sp), a
      0084E7 A1 E1            [ 1]  674 	cp	a, #0xe1
      0084E9 26 22            [ 1]  675 	jrne	00105$
                                    676 ;	lib/src/stm8s_clk.c: 580: tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
      0084EB C6 50 C6         [ 1]  677 	ld	a, 0x50c6
      0084EE A4 18            [ 1]  678 	and	a, #0x18
                                    679 ;	lib/src/stm8s_clk.c: 581: tmp = (uint8_t)(tmp >> 3);
      0084F0 44               [ 1]  680 	srl	a
      0084F1 44               [ 1]  681 	srl	a
      0084F2 44               [ 1]  682 	srl	a
                                    683 ;	lib/src/stm8s_clk.c: 582: clockfrequency = HSI_VALUE >> HSIDivExp[tmp];
      0084F3 5F               [ 1]  684 	clrw	x
      0084F4 97               [ 1]  685 	ld	xl, a
      0084F5 D6 80 33         [ 1]  686 	ld	a, (_HSIDivExp+0, x)
      0084F8 AE 24 00         [ 2]  687 	ldw	x, #0x2400
      0084FB 1F 03            [ 2]  688 	ldw	(0x03, sp), x
      0084FD AE 00 F4         [ 2]  689 	ldw	x, #0x00f4
      008500 4D               [ 1]  690 	tnz	a
      008501 27 21            [ 1]  691 	jreq	00106$
      008503                        692 00122$:
      008503 54               [ 2]  693 	srlw	x
      008504 06 03            [ 1]  694 	rrc	(0x03, sp)
      008506 06 04            [ 1]  695 	rrc	(0x04, sp)
      008508 4A               [ 1]  696 	dec	a
      008509 26 F8            [ 1]  697 	jrne	00122$
      00850B 20 17            [ 2]  698 	jra	00106$
      00850D                        699 00105$:
                                    700 ;	lib/src/stm8s_clk.c: 584: else if ( clocksource == CLK_SOURCE_LSI)
      00850D 7B 04            [ 1]  701 	ld	a, (0x04, sp)
      00850F A1 D2            [ 1]  702 	cp	a, #0xd2
      008511 26 09            [ 1]  703 	jrne	00102$
                                    704 ;	lib/src/stm8s_clk.c: 586: clockfrequency = LSI_VALUE;
      008513 AE F4 00         [ 2]  705 	ldw	x, #0xf400
      008516 1F 03            [ 2]  706 	ldw	(0x03, sp), x
      008518 5F               [ 1]  707 	clrw	x
      008519 5C               [ 1]  708 	incw	x
      00851A 20 08            [ 2]  709 	jra	00106$
      00851C                        710 00102$:
                                    711 ;	lib/src/stm8s_clk.c: 590: clockfrequency = HSE_VALUE;
      00851C AE 24 00         [ 2]  712 	ldw	x, #0x2400
      00851F 1F 03            [ 2]  713 	ldw	(0x03, sp), x
      008521 AE 00 F4         [ 2]  714 	ldw	x, #0x00f4
      008524                        715 00106$:
                                    716 ;	lib/src/stm8s_clk.c: 593: return((uint32_t)clockfrequency);
      008524 51               [ 1]  717 	exgw	x, y
      008525 1E 03            [ 2]  718 	ldw	x, (0x03, sp)
                                    719 ;	lib/src/stm8s_clk.c: 594: }
      008527 5B 04            [ 2]  720 	addw	sp, #4
      008529 81               [ 4]  721 	ret
                                    722 ;	lib/src/stm8s_clk.c: 603: void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
                                    723 ;	-----------------------------------------
                                    724 ;	 function CLK_AdjustHSICalibrationValue
                                    725 ;	-----------------------------------------
      00852A                        726 _CLK_AdjustHSICalibrationValue:
      00852A 88               [ 1]  727 	push	a
      00852B 6B 01            [ 1]  728 	ld	(0x01, sp), a
                                    729 ;	lib/src/stm8s_clk.c: 609: CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
      00852D C6 50 CC         [ 1]  730 	ld	a, 0x50cc
      008530 A4 F8            [ 1]  731 	and	a, #0xf8
      008532 1A 01            [ 1]  732 	or	a, (0x01, sp)
      008534 C7 50 CC         [ 1]  733 	ld	0x50cc, a
                                    734 ;	lib/src/stm8s_clk.c: 610: }
      008537 84               [ 1]  735 	pop	a
      008538 81               [ 4]  736 	ret
                                    737 ;	lib/src/stm8s_clk.c: 621: void CLK_SYSCLKEmergencyClear(void)
                                    738 ;	-----------------------------------------
                                    739 ;	 function CLK_SYSCLKEmergencyClear
                                    740 ;	-----------------------------------------
      008539                        741 _CLK_SYSCLKEmergencyClear:
                                    742 ;	lib/src/stm8s_clk.c: 623: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
      008539 72 11 50 C5      [ 1]  743 	bres	0x50c5, #0
                                    744 ;	lib/src/stm8s_clk.c: 624: }
      00853D 81               [ 4]  745 	ret
                                    746 ;	lib/src/stm8s_clk.c: 633: FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
                                    747 ;	-----------------------------------------
                                    748 ;	 function CLK_GetFlagStatus
                                    749 ;	-----------------------------------------
      00853E                        750 _CLK_GetFlagStatus:
      00853E 52 04            [ 2]  751 	sub	sp, #4
                                    752 ;	lib/src/stm8s_clk.c: 643: statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
      008540 1F 03            [ 2]  753 	ldw	(0x03, sp), x
      008542 4F               [ 1]  754 	clr	a
      008543 97               [ 1]  755 	ld	xl, a
                                    756 ;	lib/src/stm8s_clk.c: 646: if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
      008544 1F 01            [ 2]  757 	ldw	(0x01, sp), x
      008546 A3 01 00         [ 2]  758 	cpw	x, #0x0100
      008549 26 05            [ 1]  759 	jrne	00111$
                                    760 ;	lib/src/stm8s_clk.c: 648: tmpreg = CLK->ICKR;
      00854B C6 50 C0         [ 1]  761 	ld	a, 0x50c0
      00854E 20 27            [ 2]  762 	jra	00112$
      008550                        763 00111$:
                                    764 ;	lib/src/stm8s_clk.c: 650: else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
      008550 1E 01            [ 2]  765 	ldw	x, (0x01, sp)
      008552 A3 02 00         [ 2]  766 	cpw	x, #0x0200
      008555 26 05            [ 1]  767 	jrne	00108$
                                    768 ;	lib/src/stm8s_clk.c: 652: tmpreg = CLK->ECKR;
      008557 C6 50 C1         [ 1]  769 	ld	a, 0x50c1
      00855A 20 1B            [ 2]  770 	jra	00112$
      00855C                        771 00108$:
                                    772 ;	lib/src/stm8s_clk.c: 654: else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
      00855C 1E 01            [ 2]  773 	ldw	x, (0x01, sp)
      00855E A3 03 00         [ 2]  774 	cpw	x, #0x0300
      008561 26 05            [ 1]  775 	jrne	00105$
                                    776 ;	lib/src/stm8s_clk.c: 656: tmpreg = CLK->SWCR;
      008563 C6 50 C5         [ 1]  777 	ld	a, 0x50c5
      008566 20 0F            [ 2]  778 	jra	00112$
      008568                        779 00105$:
                                    780 ;	lib/src/stm8s_clk.c: 658: else if (statusreg == 0x0400) /* The flag to check is in CSS register */
      008568 1E 01            [ 2]  781 	ldw	x, (0x01, sp)
      00856A A3 04 00         [ 2]  782 	cpw	x, #0x0400
      00856D 26 05            [ 1]  783 	jrne	00102$
                                    784 ;	lib/src/stm8s_clk.c: 660: tmpreg = CLK->CSSR;
      00856F C6 50 C8         [ 1]  785 	ld	a, 0x50c8
      008572 20 03            [ 2]  786 	jra	00112$
      008574                        787 00102$:
                                    788 ;	lib/src/stm8s_clk.c: 664: tmpreg = CLK->CCOR;
      008574 C6 50 C9         [ 1]  789 	ld	a, 0x50c9
      008577                        790 00112$:
                                    791 ;	lib/src/stm8s_clk.c: 667: if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
      008577 88               [ 1]  792 	push	a
      008578 7B 05            [ 1]  793 	ld	a, (0x05, sp)
      00857A 6B 03            [ 1]  794 	ld	(0x03, sp), a
      00857C 84               [ 1]  795 	pop	a
      00857D 14 02            [ 1]  796 	and	a, (0x02, sp)
      00857F 27 03            [ 1]  797 	jreq	00114$
                                    798 ;	lib/src/stm8s_clk.c: 669: bitstatus = SET;
      008581 A6 01            [ 1]  799 	ld	a, #0x01
                                    800 ;	lib/src/stm8s_clk.c: 673: bitstatus = RESET;
      008583 21                     801 	.byte 0x21
      008584                        802 00114$:
      008584 4F               [ 1]  803 	clr	a
      008585                        804 00115$:
                                    805 ;	lib/src/stm8s_clk.c: 677: return((FlagStatus)bitstatus);
                                    806 ;	lib/src/stm8s_clk.c: 678: }
      008585 5B 04            [ 2]  807 	addw	sp, #4
      008587 81               [ 4]  808 	ret
                                    809 ;	lib/src/stm8s_clk.c: 686: ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
                                    810 ;	-----------------------------------------
                                    811 ;	 function CLK_GetITStatus
                                    812 ;	-----------------------------------------
      008588                        813 _CLK_GetITStatus:
      008588 88               [ 1]  814 	push	a
                                    815 ;	lib/src/stm8s_clk.c: 693: if (CLK_IT == CLK_IT_SWIF)
      008589 6B 01            [ 1]  816 	ld	(0x01, sp), a
      00858B A1 1C            [ 1]  817 	cp	a, #0x1c
      00858D 26 0F            [ 1]  818 	jrne	00108$
                                    819 ;	lib/src/stm8s_clk.c: 696: if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      00858F C6 50 C5         [ 1]  820 	ld	a, 0x50c5
      008592 14 01            [ 1]  821 	and	a, (0x01, sp)
                                    822 ;	lib/src/stm8s_clk.c: 698: bitstatus = SET;
      008594 A0 0C            [ 1]  823 	sub	a, #0x0c
      008596 26 03            [ 1]  824 	jrne	00102$
      008598 4C               [ 1]  825 	inc	a
      008599 20 0F            [ 2]  826 	jra	00109$
      00859B                        827 00102$:
                                    828 ;	lib/src/stm8s_clk.c: 702: bitstatus = RESET;
      00859B 4F               [ 1]  829 	clr	a
      00859C 20 0C            [ 2]  830 	jra	00109$
      00859E                        831 00108$:
                                    832 ;	lib/src/stm8s_clk.c: 708: if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      00859E C6 50 C8         [ 1]  833 	ld	a, 0x50c8
      0085A1 14 01            [ 1]  834 	and	a, (0x01, sp)
                                    835 ;	lib/src/stm8s_clk.c: 710: bitstatus = SET;
      0085A3 A0 0C            [ 1]  836 	sub	a, #0x0c
      0085A5 26 02            [ 1]  837 	jrne	00105$
      0085A7 4C               [ 1]  838 	inc	a
                                    839 ;	lib/src/stm8s_clk.c: 714: bitstatus = RESET;
      0085A8 21                     840 	.byte 0x21
      0085A9                        841 00105$:
      0085A9 4F               [ 1]  842 	clr	a
      0085AA                        843 00109$:
                                    844 ;	lib/src/stm8s_clk.c: 719: return bitstatus;
                                    845 ;	lib/src/stm8s_clk.c: 720: }
      0085AA 5B 01            [ 2]  846 	addw	sp, #1
      0085AC 81               [ 4]  847 	ret
                                    848 ;	lib/src/stm8s_clk.c: 728: void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
                                    849 ;	-----------------------------------------
                                    850 ;	 function CLK_ClearITPendingBit
                                    851 ;	-----------------------------------------
      0085AD                        852 _CLK_ClearITPendingBit:
                                    853 ;	lib/src/stm8s_clk.c: 733: if (CLK_IT == (uint8_t)CLK_IT_CSSD)
      0085AD A1 0C            [ 1]  854 	cp	a, #0x0c
      0085AF 26 05            [ 1]  855 	jrne	00102$
                                    856 ;	lib/src/stm8s_clk.c: 736: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
      0085B1 72 17 50 C8      [ 1]  857 	bres	0x50c8, #3
      0085B5 81               [ 4]  858 	ret
      0085B6                        859 00102$:
                                    860 ;	lib/src/stm8s_clk.c: 741: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
      0085B6 72 17 50 C5      [ 1]  861 	bres	0x50c5, #3
                                    862 ;	lib/src/stm8s_clk.c: 744: }
      0085BA 81               [ 4]  863 	ret
                                    864 	.area CODE
                                    865 	.area CONST
      008033                        866 _HSIDivExp:
      008033 00                     867 	.db #0x00	; 0
      008034 01                     868 	.db #0x01	; 1
      008035 02                     869 	.db #0x02	; 2
      008036 03                     870 	.db #0x03	; 3
      008037                        871 _CLKPrescTable:
      008037 01                     872 	.db #0x01	; 1
      008038 02                     873 	.db #0x02	; 2
      008039 04                     874 	.db #0x04	; 4
      00803A 08                     875 	.db #0x08	; 8
      00803B 0A                     876 	.db #0x0a	; 10
      00803C 10                     877 	.db #0x10	; 16
      00803D 14                     878 	.db #0x14	; 20
      00803E 28                     879 	.db #0x28	; 40
                                    880 	.area INITIALIZER
                                    881 	.area CABS (ABS)
