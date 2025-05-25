                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.5.0 #9253 (Apr  3 2018) (Linux)
                                      4 ; This file was generated Tue Feb 11 21:15:16 2025
                                      5 ;--------------------------------------------------------
                                      6 	.module stm8s_clk
                                      7 	.optsdcc -mstm8
                                      8 	
                                      9 ;--------------------------------------------------------
                                     10 ; Public variables in this module
                                     11 ;--------------------------------------------------------
                                     12 	.globl _CLKPrescTable
                                     13 	.globl _HSIDivExp
                                     14 	.globl _CLK_DeInit
                                     15 	.globl _CLK_FastHaltWakeUpCmd
                                     16 	.globl _CLK_HSECmd
                                     17 	.globl _CLK_HSICmd
                                     18 	.globl _CLK_LSICmd
                                     19 	.globl _CLK_CCOCmd
                                     20 	.globl _CLK_ClockSwitchCmd
                                     21 	.globl _CLK_SlowActiveHaltWakeUpCmd
                                     22 	.globl _CLK_PeripheralClockConfig
                                     23 	.globl _CLK_ClockSwitchConfig
                                     24 	.globl _CLK_HSIPrescalerConfig
                                     25 	.globl _CLK_CCOConfig
                                     26 	.globl _CLK_ITConfig
                                     27 	.globl _CLK_SYSCLKConfig
                                     28 	.globl _CLK_SWIMConfig
                                     29 	.globl _CLK_ClockSecuritySystemEnable
                                     30 	.globl _CLK_GetSYSCLKSource
                                     31 	.globl _CLK_GetClockFreq
                                     32 	.globl _CLK_AdjustHSICalibrationValue
                                     33 	.globl _CLK_SYSCLKEmergencyClear
                                     34 	.globl _CLK_GetFlagStatus
                                     35 	.globl _CLK_GetITStatus
                                     36 	.globl _CLK_ClearITPendingBit
                                     37 ;--------------------------------------------------------
                                     38 ; ram data
                                     39 ;--------------------------------------------------------
                                     40 	.area DATA
                                     41 ;--------------------------------------------------------
                                     42 ; ram data
                                     43 ;--------------------------------------------------------
                                     44 	.area INITIALIZED
                                     45 ;--------------------------------------------------------
                                     46 ; absolute external ram data
                                     47 ;--------------------------------------------------------
                                     48 	.area DABS (ABS)
                                     49 ;--------------------------------------------------------
                                     50 ; global & static initialisations
                                     51 ;--------------------------------------------------------
                                     52 	.area HOME
                                     53 	.area GSINIT
                                     54 	.area GSFINAL
                                     55 	.area GSINIT
                                     56 ;--------------------------------------------------------
                                     57 ; Home
                                     58 ;--------------------------------------------------------
                                     59 	.area HOME
                                     60 	.area HOME
                                     61 ;--------------------------------------------------------
                                     62 ; code
                                     63 ;--------------------------------------------------------
                                     64 	.area CODE
                                     65 ;	lib/src/stm8s_clk.c: 72: void CLK_DeInit(void)
                                     66 ;	-----------------------------------------
                                     67 ;	 function CLK_DeInit
                                     68 ;	-----------------------------------------
      0085B7                         69 _CLK_DeInit:
                                     70 ;	lib/src/stm8s_clk.c: 74: CLK->ICKR = CLK_ICKR_RESET_VALUE;
      0085B7 35 01 50 C0      [ 1]   71 	mov	0x50c0+0, #0x01
                                     72 ;	lib/src/stm8s_clk.c: 75: CLK->ECKR = CLK_ECKR_RESET_VALUE;
      0085BB 35 00 50 C1      [ 1]   73 	mov	0x50c1+0, #0x00
                                     74 ;	lib/src/stm8s_clk.c: 76: CLK->SWR  = CLK_SWR_RESET_VALUE;
      0085BF 35 E1 50 C4      [ 1]   75 	mov	0x50c4+0, #0xe1
                                     76 ;	lib/src/stm8s_clk.c: 77: CLK->SWCR = CLK_SWCR_RESET_VALUE;
      0085C3 35 00 50 C5      [ 1]   77 	mov	0x50c5+0, #0x00
                                     78 ;	lib/src/stm8s_clk.c: 78: CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
      0085C7 35 18 50 C6      [ 1]   79 	mov	0x50c6+0, #0x18
                                     80 ;	lib/src/stm8s_clk.c: 79: CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
      0085CB 35 FF 50 C7      [ 1]   81 	mov	0x50c7+0, #0xff
                                     82 ;	lib/src/stm8s_clk.c: 80: CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
      0085CF 35 FF 50 CA      [ 1]   83 	mov	0x50ca+0, #0xff
                                     84 ;	lib/src/stm8s_clk.c: 81: CLK->CSSR = CLK_CSSR_RESET_VALUE;
      0085D3 35 00 50 C8      [ 1]   85 	mov	0x50c8+0, #0x00
                                     86 ;	lib/src/stm8s_clk.c: 82: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      0085D7 35 00 50 C9      [ 1]   87 	mov	0x50c9+0, #0x00
                                     88 ;	lib/src/stm8s_clk.c: 83: while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
      0085DB                         89 00101$:
      0085DB AE 50 C9         [ 2]   90 	ldw	x, #0x50c9
      0085DE F6               [ 1]   91 	ld	a, (x)
      0085DF 44               [ 1]   92 	srl	a
      0085E0 25 F9            [ 1]   93 	jrc	00101$
                                     94 ;	lib/src/stm8s_clk.c: 85: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      0085E2 35 00 50 C9      [ 1]   95 	mov	0x50c9+0, #0x00
                                     96 ;	lib/src/stm8s_clk.c: 86: CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
      0085E6 35 00 50 CC      [ 1]   97 	mov	0x50cc+0, #0x00
                                     98 ;	lib/src/stm8s_clk.c: 87: CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
      0085EA 35 00 50 CD      [ 1]   99 	mov	0x50cd+0, #0x00
      0085EE 81               [ 4]  100 	ret
                                    101 ;	lib/src/stm8s_clk.c: 99: void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
                                    102 ;	-----------------------------------------
                                    103 ;	 function CLK_FastHaltWakeUpCmd
                                    104 ;	-----------------------------------------
      0085EF                        105 _CLK_FastHaltWakeUpCmd:
                                    106 ;	lib/src/stm8s_clk.c: 104: if (NewState != DISABLE)
      0085EF 0D 03            [ 1]  107 	tnz	(0x03, sp)
      0085F1 27 09            [ 1]  108 	jreq	00102$
                                    109 ;	lib/src/stm8s_clk.c: 107: CLK->ICKR |= CLK_ICKR_FHWU;
      0085F3 AE 50 C0         [ 2]  110 	ldw	x, #0x50c0
      0085F6 F6               [ 1]  111 	ld	a, (x)
      0085F7 AA 04            [ 1]  112 	or	a, #0x04
      0085F9 F7               [ 1]  113 	ld	(x), a
      0085FA 20 07            [ 2]  114 	jra	00104$
      0085FC                        115 00102$:
                                    116 ;	lib/src/stm8s_clk.c: 112: CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
      0085FC AE 50 C0         [ 2]  117 	ldw	x, #0x50c0
      0085FF F6               [ 1]  118 	ld	a, (x)
      008600 A4 FB            [ 1]  119 	and	a, #0xfb
      008602 F7               [ 1]  120 	ld	(x), a
      008603                        121 00104$:
      008603 81               [ 4]  122 	ret
                                    123 ;	lib/src/stm8s_clk.c: 121: void CLK_HSECmd(FunctionalState NewState)
                                    124 ;	-----------------------------------------
                                    125 ;	 function CLK_HSECmd
                                    126 ;	-----------------------------------------
      008604                        127 _CLK_HSECmd:
                                    128 ;	lib/src/stm8s_clk.c: 126: if (NewState != DISABLE)
      008604 0D 03            [ 1]  129 	tnz	(0x03, sp)
      008606 27 06            [ 1]  130 	jreq	00102$
                                    131 ;	lib/src/stm8s_clk.c: 129: CLK->ECKR |= CLK_ECKR_HSEEN;
      008608 72 10 50 C1      [ 1]  132 	bset	0x50c1, #0
      00860C 20 04            [ 2]  133 	jra	00104$
      00860E                        134 00102$:
                                    135 ;	lib/src/stm8s_clk.c: 134: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
      00860E 72 11 50 C1      [ 1]  136 	bres	0x50c1, #0
      008612                        137 00104$:
      008612 81               [ 4]  138 	ret
                                    139 ;	lib/src/stm8s_clk.c: 143: void CLK_HSICmd(FunctionalState NewState)
                                    140 ;	-----------------------------------------
                                    141 ;	 function CLK_HSICmd
                                    142 ;	-----------------------------------------
      008613                        143 _CLK_HSICmd:
                                    144 ;	lib/src/stm8s_clk.c: 148: if (NewState != DISABLE)
      008613 0D 03            [ 1]  145 	tnz	(0x03, sp)
      008615 27 06            [ 1]  146 	jreq	00102$
                                    147 ;	lib/src/stm8s_clk.c: 151: CLK->ICKR |= CLK_ICKR_HSIEN;
      008617 72 10 50 C0      [ 1]  148 	bset	0x50c0, #0
      00861B 20 04            [ 2]  149 	jra	00104$
      00861D                        150 00102$:
                                    151 ;	lib/src/stm8s_clk.c: 156: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
      00861D 72 11 50 C0      [ 1]  152 	bres	0x50c0, #0
      008621                        153 00104$:
      008621 81               [ 4]  154 	ret
                                    155 ;	lib/src/stm8s_clk.c: 166: void CLK_LSICmd(FunctionalState NewState)
                                    156 ;	-----------------------------------------
                                    157 ;	 function CLK_LSICmd
                                    158 ;	-----------------------------------------
      008622                        159 _CLK_LSICmd:
                                    160 ;	lib/src/stm8s_clk.c: 171: if (NewState != DISABLE)
      008622 0D 03            [ 1]  161 	tnz	(0x03, sp)
      008624 27 09            [ 1]  162 	jreq	00102$
                                    163 ;	lib/src/stm8s_clk.c: 174: CLK->ICKR |= CLK_ICKR_LSIEN;
      008626 AE 50 C0         [ 2]  164 	ldw	x, #0x50c0
      008629 F6               [ 1]  165 	ld	a, (x)
      00862A AA 08            [ 1]  166 	or	a, #0x08
      00862C F7               [ 1]  167 	ld	(x), a
      00862D 20 07            [ 2]  168 	jra	00104$
      00862F                        169 00102$:
                                    170 ;	lib/src/stm8s_clk.c: 179: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
      00862F AE 50 C0         [ 2]  171 	ldw	x, #0x50c0
      008632 F6               [ 1]  172 	ld	a, (x)
      008633 A4 F7            [ 1]  173 	and	a, #0xf7
      008635 F7               [ 1]  174 	ld	(x), a
      008636                        175 00104$:
      008636 81               [ 4]  176 	ret
                                    177 ;	lib/src/stm8s_clk.c: 189: void CLK_CCOCmd(FunctionalState NewState)
                                    178 ;	-----------------------------------------
                                    179 ;	 function CLK_CCOCmd
                                    180 ;	-----------------------------------------
      008637                        181 _CLK_CCOCmd:
                                    182 ;	lib/src/stm8s_clk.c: 194: if (NewState != DISABLE)
      008637 0D 03            [ 1]  183 	tnz	(0x03, sp)
      008639 27 06            [ 1]  184 	jreq	00102$
                                    185 ;	lib/src/stm8s_clk.c: 197: CLK->CCOR |= CLK_CCOR_CCOEN;
      00863B 72 10 50 C9      [ 1]  186 	bset	0x50c9, #0
      00863F 20 04            [ 2]  187 	jra	00104$
      008641                        188 00102$:
                                    189 ;	lib/src/stm8s_clk.c: 202: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
      008641 72 11 50 C9      [ 1]  190 	bres	0x50c9, #0
      008645                        191 00104$:
      008645 81               [ 4]  192 	ret
                                    193 ;	lib/src/stm8s_clk.c: 213: void CLK_ClockSwitchCmd(FunctionalState NewState)
                                    194 ;	-----------------------------------------
                                    195 ;	 function CLK_ClockSwitchCmd
                                    196 ;	-----------------------------------------
      008646                        197 _CLK_ClockSwitchCmd:
                                    198 ;	lib/src/stm8s_clk.c: 218: if (NewState != DISABLE )
      008646 0D 03            [ 1]  199 	tnz	(0x03, sp)
      008648 27 09            [ 1]  200 	jreq	00102$
                                    201 ;	lib/src/stm8s_clk.c: 221: CLK->SWCR |= CLK_SWCR_SWEN;
      00864A AE 50 C5         [ 2]  202 	ldw	x, #0x50c5
      00864D F6               [ 1]  203 	ld	a, (x)
      00864E AA 02            [ 1]  204 	or	a, #0x02
      008650 F7               [ 1]  205 	ld	(x), a
      008651 20 07            [ 2]  206 	jra	00104$
      008653                        207 00102$:
                                    208 ;	lib/src/stm8s_clk.c: 226: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
      008653 AE 50 C5         [ 2]  209 	ldw	x, #0x50c5
      008656 F6               [ 1]  210 	ld	a, (x)
      008657 A4 FD            [ 1]  211 	and	a, #0xfd
      008659 F7               [ 1]  212 	ld	(x), a
      00865A                        213 00104$:
      00865A 81               [ 4]  214 	ret
                                    215 ;	lib/src/stm8s_clk.c: 238: void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
                                    216 ;	-----------------------------------------
                                    217 ;	 function CLK_SlowActiveHaltWakeUpCmd
                                    218 ;	-----------------------------------------
      00865B                        219 _CLK_SlowActiveHaltWakeUpCmd:
                                    220 ;	lib/src/stm8s_clk.c: 243: if (NewState != DISABLE)
      00865B 0D 03            [ 1]  221 	tnz	(0x03, sp)
      00865D 27 09            [ 1]  222 	jreq	00102$
                                    223 ;	lib/src/stm8s_clk.c: 246: CLK->ICKR |= CLK_ICKR_SWUAH;
      00865F AE 50 C0         [ 2]  224 	ldw	x, #0x50c0
      008662 F6               [ 1]  225 	ld	a, (x)
      008663 AA 20            [ 1]  226 	or	a, #0x20
      008665 F7               [ 1]  227 	ld	(x), a
      008666 20 07            [ 2]  228 	jra	00104$
      008668                        229 00102$:
                                    230 ;	lib/src/stm8s_clk.c: 251: CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
      008668 AE 50 C0         [ 2]  231 	ldw	x, #0x50c0
      00866B F6               [ 1]  232 	ld	a, (x)
      00866C A4 DF            [ 1]  233 	and	a, #0xdf
      00866E F7               [ 1]  234 	ld	(x), a
      00866F                        235 00104$:
      00866F 81               [ 4]  236 	ret
                                    237 ;	lib/src/stm8s_clk.c: 263: void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
                                    238 ;	-----------------------------------------
                                    239 ;	 function CLK_PeripheralClockConfig
                                    240 ;	-----------------------------------------
      008670                        241 _CLK_PeripheralClockConfig:
      008670 52 02            [ 2]  242 	sub	sp, #2
                                    243 ;	lib/src/stm8s_clk.c: 274: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008672 7B 05            [ 1]  244 	ld	a, (0x05, sp)
      008674 A4 0F            [ 1]  245 	and	a, #0x0f
      008676 95               [ 1]  246 	ld	xh, a
      008677 A6 01            [ 1]  247 	ld	a, #0x01
      008679 6B 02            [ 1]  248 	ld	(0x02, sp), a
      00867B 9E               [ 1]  249 	ld	a, xh
      00867C 4D               [ 1]  250 	tnz	a
      00867D 27 05            [ 1]  251 	jreq	00125$
      00867F                        252 00124$:
      00867F 08 02            [ 1]  253 	sll	(0x02, sp)
      008681 4A               [ 1]  254 	dec	a
      008682 26 FB            [ 1]  255 	jrne	00124$
      008684                        256 00125$:
                                    257 ;	lib/src/stm8s_clk.c: 279: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      008684 7B 02            [ 1]  258 	ld	a, (0x02, sp)
      008686 43               [ 1]  259 	cpl	a
      008687 6B 01            [ 1]  260 	ld	(0x01, sp), a
                                    261 ;	lib/src/stm8s_clk.c: 269: if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
      008689 7B 05            [ 1]  262 	ld	a, (0x05, sp)
      00868B A5 10            [ 1]  263 	bcp	a, #0x10
      00868D 26 1C            [ 1]  264 	jrne	00108$
                                    265 ;	lib/src/stm8s_clk.c: 271: if (NewState != DISABLE)
      00868F 0D 06            [ 1]  266 	tnz	(0x06, sp)
      008691 27 0C            [ 1]  267 	jreq	00102$
                                    268 ;	lib/src/stm8s_clk.c: 274: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008693 AE 50 C7         [ 2]  269 	ldw	x, #0x50c7
      008696 F6               [ 1]  270 	ld	a, (x)
      008697 1A 02            [ 1]  271 	or	a, (0x02, sp)
      008699 AE 50 C7         [ 2]  272 	ldw	x, #0x50c7
      00869C F7               [ 1]  273 	ld	(x), a
      00869D 20 26            [ 2]  274 	jra	00110$
      00869F                        275 00102$:
                                    276 ;	lib/src/stm8s_clk.c: 279: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      00869F AE 50 C7         [ 2]  277 	ldw	x, #0x50c7
      0086A2 F6               [ 1]  278 	ld	a, (x)
      0086A3 14 01            [ 1]  279 	and	a, (0x01, sp)
      0086A5 AE 50 C7         [ 2]  280 	ldw	x, #0x50c7
      0086A8 F7               [ 1]  281 	ld	(x), a
      0086A9 20 1A            [ 2]  282 	jra	00110$
      0086AB                        283 00108$:
                                    284 ;	lib/src/stm8s_clk.c: 284: if (NewState != DISABLE)
      0086AB 0D 06            [ 1]  285 	tnz	(0x06, sp)
      0086AD 27 0C            [ 1]  286 	jreq	00105$
                                    287 ;	lib/src/stm8s_clk.c: 287: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      0086AF AE 50 CA         [ 2]  288 	ldw	x, #0x50ca
      0086B2 F6               [ 1]  289 	ld	a, (x)
      0086B3 1A 02            [ 1]  290 	or	a, (0x02, sp)
      0086B5 AE 50 CA         [ 2]  291 	ldw	x, #0x50ca
      0086B8 F7               [ 1]  292 	ld	(x), a
      0086B9 20 0A            [ 2]  293 	jra	00110$
      0086BB                        294 00105$:
                                    295 ;	lib/src/stm8s_clk.c: 292: CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      0086BB AE 50 CA         [ 2]  296 	ldw	x, #0x50ca
      0086BE F6               [ 1]  297 	ld	a, (x)
      0086BF 14 01            [ 1]  298 	and	a, (0x01, sp)
      0086C1 AE 50 CA         [ 2]  299 	ldw	x, #0x50ca
      0086C4 F7               [ 1]  300 	ld	(x), a
      0086C5                        301 00110$:
      0086C5 5B 02            [ 2]  302 	addw	sp, #2
      0086C7 81               [ 4]  303 	ret
                                    304 ;	lib/src/stm8s_clk.c: 309: ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
                                    305 ;	-----------------------------------------
                                    306 ;	 function CLK_ClockSwitchConfig
                                    307 ;	-----------------------------------------
      0086C8                        308 _CLK_ClockSwitchConfig:
      0086C8 52 02            [ 2]  309 	sub	sp, #2
                                    310 ;	lib/src/stm8s_clk.c: 322: clock_master = (CLK_Source_TypeDef)CLK->CMSR;
      0086CA AE 50 C3         [ 2]  311 	ldw	x, #0x50c3
      0086CD F6               [ 1]  312 	ld	a, (x)
      0086CE 6B 02            [ 1]  313 	ld	(0x02, sp), a
                                    314 ;	lib/src/stm8s_clk.c: 325: if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
      0086D0 7B 05            [ 1]  315 	ld	a, (0x05, sp)
      0086D2 A1 01            [ 1]  316 	cp	a, #0x01
      0086D4 26 40            [ 1]  317 	jrne	00122$
                                    318 ;	lib/src/stm8s_clk.c: 328: CLK->SWCR |= CLK_SWCR_SWEN;
      0086D6 AE 50 C5         [ 2]  319 	ldw	x, #0x50c5
      0086D9 F6               [ 1]  320 	ld	a, (x)
      0086DA AA 02            [ 1]  321 	or	a, #0x02
      0086DC F7               [ 1]  322 	ld	(x), a
                                    323 ;	lib/src/stm8s_clk.c: 331: if (ITState != DISABLE)
      0086DD 0D 07            [ 1]  324 	tnz	(0x07, sp)
      0086DF 27 09            [ 1]  325 	jreq	00102$
                                    326 ;	lib/src/stm8s_clk.c: 333: CLK->SWCR |= CLK_SWCR_SWIEN;
      0086E1 AE 50 C5         [ 2]  327 	ldw	x, #0x50c5
      0086E4 F6               [ 1]  328 	ld	a, (x)
      0086E5 AA 04            [ 1]  329 	or	a, #0x04
      0086E7 F7               [ 1]  330 	ld	(x), a
      0086E8 20 07            [ 2]  331 	jra	00103$
      0086EA                        332 00102$:
                                    333 ;	lib/src/stm8s_clk.c: 337: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
      0086EA AE 50 C5         [ 2]  334 	ldw	x, #0x50c5
      0086ED F6               [ 1]  335 	ld	a, (x)
      0086EE A4 FB            [ 1]  336 	and	a, #0xfb
      0086F0 F7               [ 1]  337 	ld	(x), a
      0086F1                        338 00103$:
                                    339 ;	lib/src/stm8s_clk.c: 341: CLK->SWR = (uint8_t)CLK_NewClock;
      0086F1 AE 50 C4         [ 2]  340 	ldw	x, #0x50c4
      0086F4 7B 06            [ 1]  341 	ld	a, (0x06, sp)
      0086F6 F7               [ 1]  342 	ld	(x), a
                                    343 ;	lib/src/stm8s_clk.c: 344: while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
      0086F7 AE FF FF         [ 2]  344 	ldw	x, #0xffff
      0086FA                        345 00105$:
      0086FA 90 AE 50 C5      [ 2]  346 	ldw	y, #0x50c5
      0086FE 90 F6            [ 1]  347 	ld	a, (y)
      008700 44               [ 1]  348 	srl	a
      008701 24 06            [ 1]  349 	jrnc	00107$
      008703 5D               [ 2]  350 	tnzw	x
      008704 27 03            [ 1]  351 	jreq	00107$
                                    352 ;	lib/src/stm8s_clk.c: 346: DownCounter--;
      008706 5A               [ 2]  353 	decw	x
      008707 20 F1            [ 2]  354 	jra	00105$
      008709                        355 00107$:
                                    356 ;	lib/src/stm8s_clk.c: 349: if(DownCounter != 0)
      008709 5D               [ 2]  357 	tnzw	x
      00870A 27 06            [ 1]  358 	jreq	00109$
                                    359 ;	lib/src/stm8s_clk.c: 351: Swif = SUCCESS;
      00870C A6 01            [ 1]  360 	ld	a, #0x01
      00870E 6B 01            [ 1]  361 	ld	(0x01, sp), a
      008710 20 43            [ 2]  362 	jra	00123$
      008712                        363 00109$:
                                    364 ;	lib/src/stm8s_clk.c: 355: Swif = ERROR;
      008712 0F 01            [ 1]  365 	clr	(0x01, sp)
      008714 20 3F            [ 2]  366 	jra	00123$
      008716                        367 00122$:
                                    368 ;	lib/src/stm8s_clk.c: 361: if (ITState != DISABLE)
      008716 0D 07            [ 1]  369 	tnz	(0x07, sp)
      008718 27 09            [ 1]  370 	jreq	00112$
                                    371 ;	lib/src/stm8s_clk.c: 363: CLK->SWCR |= CLK_SWCR_SWIEN;
      00871A AE 50 C5         [ 2]  372 	ldw	x, #0x50c5
      00871D F6               [ 1]  373 	ld	a, (x)
      00871E AA 04            [ 1]  374 	or	a, #0x04
      008720 F7               [ 1]  375 	ld	(x), a
      008721 20 07            [ 2]  376 	jra	00113$
      008723                        377 00112$:
                                    378 ;	lib/src/stm8s_clk.c: 367: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
      008723 AE 50 C5         [ 2]  379 	ldw	x, #0x50c5
      008726 F6               [ 1]  380 	ld	a, (x)
      008727 A4 FB            [ 1]  381 	and	a, #0xfb
      008729 F7               [ 1]  382 	ld	(x), a
      00872A                        383 00113$:
                                    384 ;	lib/src/stm8s_clk.c: 371: CLK->SWR = (uint8_t)CLK_NewClock;
      00872A AE 50 C4         [ 2]  385 	ldw	x, #0x50c4
      00872D 7B 06            [ 1]  386 	ld	a, (0x06, sp)
      00872F F7               [ 1]  387 	ld	(x), a
                                    388 ;	lib/src/stm8s_clk.c: 374: while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
      008730 AE FF FF         [ 2]  389 	ldw	x, #0xffff
      008733                        390 00115$:
      008733 90 AE 50 C5      [ 2]  391 	ldw	y, #0x50c5
      008737 90 F6            [ 1]  392 	ld	a, (y)
      008739 A5 08            [ 1]  393 	bcp	a, #0x08
      00873B 27 06            [ 1]  394 	jreq	00117$
      00873D 5D               [ 2]  395 	tnzw	x
      00873E 27 03            [ 1]  396 	jreq	00117$
                                    397 ;	lib/src/stm8s_clk.c: 376: DownCounter--;
      008740 5A               [ 2]  398 	decw	x
      008741 20 F0            [ 2]  399 	jra	00115$
      008743                        400 00117$:
                                    401 ;	lib/src/stm8s_clk.c: 379: if(DownCounter != 0)
      008743 5D               [ 2]  402 	tnzw	x
      008744 27 0D            [ 1]  403 	jreq	00119$
                                    404 ;	lib/src/stm8s_clk.c: 382: CLK->SWCR |= CLK_SWCR_SWEN;
      008746 AE 50 C5         [ 2]  405 	ldw	x, #0x50c5
      008749 F6               [ 1]  406 	ld	a, (x)
      00874A AA 02            [ 1]  407 	or	a, #0x02
      00874C F7               [ 1]  408 	ld	(x), a
                                    409 ;	lib/src/stm8s_clk.c: 383: Swif = SUCCESS;
      00874D A6 01            [ 1]  410 	ld	a, #0x01
      00874F 6B 01            [ 1]  411 	ld	(0x01, sp), a
      008751 20 02            [ 2]  412 	jra	00123$
      008753                        413 00119$:
                                    414 ;	lib/src/stm8s_clk.c: 387: Swif = ERROR;
      008753 0F 01            [ 1]  415 	clr	(0x01, sp)
      008755                        416 00123$:
                                    417 ;	lib/src/stm8s_clk.c: 390: if(Swif != ERROR)
      008755 0D 01            [ 1]  418 	tnz	(0x01, sp)
      008757 27 37            [ 1]  419 	jreq	00136$
                                    420 ;	lib/src/stm8s_clk.c: 393: if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
      008759 0D 08            [ 1]  421 	tnz	(0x08, sp)
      00875B 26 0F            [ 1]  422 	jrne	00132$
      00875D 7B 02            [ 1]  423 	ld	a, (0x02, sp)
      00875F A1 E1            [ 1]  424 	cp	a, #0xe1
      008761 26 09            [ 1]  425 	jrne	00132$
                                    426 ;	lib/src/stm8s_clk.c: 395: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
      008763 AE 50 C0         [ 2]  427 	ldw	x, #0x50c0
      008766 F6               [ 1]  428 	ld	a, (x)
      008767 A4 FE            [ 1]  429 	and	a, #0xfe
      008769 F7               [ 1]  430 	ld	(x), a
      00876A 20 24            [ 2]  431 	jra	00136$
      00876C                        432 00132$:
                                    433 ;	lib/src/stm8s_clk.c: 397: else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
      00876C 0D 08            [ 1]  434 	tnz	(0x08, sp)
      00876E 26 0F            [ 1]  435 	jrne	00128$
      008770 7B 02            [ 1]  436 	ld	a, (0x02, sp)
      008772 A1 D2            [ 1]  437 	cp	a, #0xd2
      008774 26 09            [ 1]  438 	jrne	00128$
                                    439 ;	lib/src/stm8s_clk.c: 399: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
      008776 AE 50 C0         [ 2]  440 	ldw	x, #0x50c0
      008779 F6               [ 1]  441 	ld	a, (x)
      00877A A4 F7            [ 1]  442 	and	a, #0xf7
      00877C F7               [ 1]  443 	ld	(x), a
      00877D 20 11            [ 2]  444 	jra	00136$
      00877F                        445 00128$:
                                    446 ;	lib/src/stm8s_clk.c: 401: else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
      00877F 0D 08            [ 1]  447 	tnz	(0x08, sp)
      008781 26 0D            [ 1]  448 	jrne	00136$
      008783 7B 02            [ 1]  449 	ld	a, (0x02, sp)
      008785 A1 B4            [ 1]  450 	cp	a, #0xb4
      008787 26 07            [ 1]  451 	jrne	00136$
                                    452 ;	lib/src/stm8s_clk.c: 403: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
      008789 AE 50 C1         [ 2]  453 	ldw	x, #0x50c1
      00878C F6               [ 1]  454 	ld	a, (x)
      00878D A4 FE            [ 1]  455 	and	a, #0xfe
      00878F F7               [ 1]  456 	ld	(x), a
      008790                        457 00136$:
                                    458 ;	lib/src/stm8s_clk.c: 406: return(Swif);
      008790 7B 01            [ 1]  459 	ld	a, (0x01, sp)
      008792 5B 02            [ 2]  460 	addw	sp, #2
      008794 81               [ 4]  461 	ret
                                    462 ;	lib/src/stm8s_clk.c: 415: void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
                                    463 ;	-----------------------------------------
                                    464 ;	 function CLK_HSIPrescalerConfig
                                    465 ;	-----------------------------------------
      008795                        466 _CLK_HSIPrescalerConfig:
                                    467 ;	lib/src/stm8s_clk.c: 421: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      008795 AE 50 C6         [ 2]  468 	ldw	x, #0x50c6
      008798 F6               [ 1]  469 	ld	a, (x)
      008799 A4 E7            [ 1]  470 	and	a, #0xe7
      00879B F7               [ 1]  471 	ld	(x), a
                                    472 ;	lib/src/stm8s_clk.c: 424: CLK->CKDIVR |= (uint8_t)HSIPrescaler;
      00879C AE 50 C6         [ 2]  473 	ldw	x, #0x50c6
      00879F F6               [ 1]  474 	ld	a, (x)
      0087A0 1A 03            [ 1]  475 	or	a, (0x03, sp)
      0087A2 AE 50 C6         [ 2]  476 	ldw	x, #0x50c6
      0087A5 F7               [ 1]  477 	ld	(x), a
      0087A6 81               [ 4]  478 	ret
                                    479 ;	lib/src/stm8s_clk.c: 436: void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
                                    480 ;	-----------------------------------------
                                    481 ;	 function CLK_CCOConfig
                                    482 ;	-----------------------------------------
      0087A7                        483 _CLK_CCOConfig:
                                    484 ;	lib/src/stm8s_clk.c: 442: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
      0087A7 AE 50 C9         [ 2]  485 	ldw	x, #0x50c9
      0087AA F6               [ 1]  486 	ld	a, (x)
      0087AB A4 E1            [ 1]  487 	and	a, #0xe1
      0087AD F7               [ 1]  488 	ld	(x), a
                                    489 ;	lib/src/stm8s_clk.c: 445: CLK->CCOR |= (uint8_t)CLK_CCO;
      0087AE AE 50 C9         [ 2]  490 	ldw	x, #0x50c9
      0087B1 F6               [ 1]  491 	ld	a, (x)
      0087B2 1A 03            [ 1]  492 	or	a, (0x03, sp)
      0087B4 AE 50 C9         [ 2]  493 	ldw	x, #0x50c9
      0087B7 F7               [ 1]  494 	ld	(x), a
                                    495 ;	lib/src/stm8s_clk.c: 448: CLK->CCOR |= CLK_CCOR_CCOEN;
      0087B8 72 10 50 C9      [ 1]  496 	bset	0x50c9, #0
      0087BC 81               [ 4]  497 	ret
                                    498 ;	lib/src/stm8s_clk.c: 459: void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
                                    499 ;	-----------------------------------------
                                    500 ;	 function CLK_ITConfig
                                    501 ;	-----------------------------------------
      0087BD                        502 _CLK_ITConfig:
      0087BD 88               [ 1]  503 	push	a
                                    504 ;	lib/src/stm8s_clk.c: 467: switch (CLK_IT)
      0087BE 7B 04            [ 1]  505 	ld	a, (0x04, sp)
      0087C0 A1 0C            [ 1]  506 	cp	a, #0x0c
      0087C2 26 06            [ 1]  507 	jrne	00135$
      0087C4 A6 01            [ 1]  508 	ld	a, #0x01
      0087C6 6B 01            [ 1]  509 	ld	(0x01, sp), a
      0087C8 20 02            [ 2]  510 	jra	00136$
      0087CA                        511 00135$:
      0087CA 0F 01            [ 1]  512 	clr	(0x01, sp)
      0087CC                        513 00136$:
      0087CC 7B 04            [ 1]  514 	ld	a, (0x04, sp)
      0087CE A1 1C            [ 1]  515 	cp	a, #0x1c
      0087D0 26 03            [ 1]  516 	jrne	00138$
      0087D2 A6 01            [ 1]  517 	ld	a, #0x01
      0087D4 21                     518 	.byte 0x21
      0087D5                        519 00138$:
      0087D5 4F               [ 1]  520 	clr	a
      0087D6                        521 00139$:
                                    522 ;	lib/src/stm8s_clk.c: 465: if (NewState != DISABLE)
      0087D6 0D 05            [ 1]  523 	tnz	(0x05, sp)
      0087D8 27 19            [ 1]  524 	jreq	00110$
                                    525 ;	lib/src/stm8s_clk.c: 467: switch (CLK_IT)
      0087DA 0D 01            [ 1]  526 	tnz	(0x01, sp)
      0087DC 26 0C            [ 1]  527 	jrne	00102$
      0087DE 4D               [ 1]  528 	tnz	a
      0087DF 27 29            [ 1]  529 	jreq	00112$
                                    530 ;	lib/src/stm8s_clk.c: 470: CLK->SWCR |= CLK_SWCR_SWIEN;
      0087E1 AE 50 C5         [ 2]  531 	ldw	x, #0x50c5
      0087E4 F6               [ 1]  532 	ld	a, (x)
      0087E5 AA 04            [ 1]  533 	or	a, #0x04
      0087E7 F7               [ 1]  534 	ld	(x), a
                                    535 ;	lib/src/stm8s_clk.c: 471: break;
      0087E8 20 20            [ 2]  536 	jra	00112$
                                    537 ;	lib/src/stm8s_clk.c: 472: case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
      0087EA                        538 00102$:
                                    539 ;	lib/src/stm8s_clk.c: 473: CLK->CSSR |= CLK_CSSR_CSSDIE;
      0087EA AE 50 C8         [ 2]  540 	ldw	x, #0x50c8
      0087ED F6               [ 1]  541 	ld	a, (x)
      0087EE AA 04            [ 1]  542 	or	a, #0x04
      0087F0 F7               [ 1]  543 	ld	(x), a
                                    544 ;	lib/src/stm8s_clk.c: 474: break;
      0087F1 20 17            [ 2]  545 	jra	00112$
                                    546 ;	lib/src/stm8s_clk.c: 477: }
      0087F3                        547 00110$:
                                    548 ;	lib/src/stm8s_clk.c: 481: switch (CLK_IT)
      0087F3 0D 01            [ 1]  549 	tnz	(0x01, sp)
      0087F5 26 0C            [ 1]  550 	jrne	00106$
      0087F7 4D               [ 1]  551 	tnz	a
      0087F8 27 10            [ 1]  552 	jreq	00112$
                                    553 ;	lib/src/stm8s_clk.c: 484: CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
      0087FA AE 50 C5         [ 2]  554 	ldw	x, #0x50c5
      0087FD F6               [ 1]  555 	ld	a, (x)
      0087FE A4 FB            [ 1]  556 	and	a, #0xfb
      008800 F7               [ 1]  557 	ld	(x), a
                                    558 ;	lib/src/stm8s_clk.c: 485: break;
      008801 20 07            [ 2]  559 	jra	00112$
                                    560 ;	lib/src/stm8s_clk.c: 486: case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
      008803                        561 00106$:
                                    562 ;	lib/src/stm8s_clk.c: 487: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
      008803 AE 50 C8         [ 2]  563 	ldw	x, #0x50c8
      008806 F6               [ 1]  564 	ld	a, (x)
      008807 A4 FB            [ 1]  565 	and	a, #0xfb
      008809 F7               [ 1]  566 	ld	(x), a
                                    567 ;	lib/src/stm8s_clk.c: 491: }
      00880A                        568 00112$:
      00880A 84               [ 1]  569 	pop	a
      00880B 81               [ 4]  570 	ret
                                    571 ;	lib/src/stm8s_clk.c: 500: void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
                                    572 ;	-----------------------------------------
                                    573 ;	 function CLK_SYSCLKConfig
                                    574 ;	-----------------------------------------
      00880C                        575 _CLK_SYSCLKConfig:
      00880C 52 02            [ 2]  576 	sub	sp, #2
                                    577 ;	lib/src/stm8s_clk.c: 505: if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
      00880E 0D 05            [ 1]  578 	tnz	(0x05, sp)
      008810 2B 19            [ 1]  579 	jrmi	00102$
                                    580 ;	lib/src/stm8s_clk.c: 507: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      008812 AE 50 C6         [ 2]  581 	ldw	x, #0x50c6
      008815 F6               [ 1]  582 	ld	a, (x)
      008816 A4 E7            [ 1]  583 	and	a, #0xe7
      008818 F7               [ 1]  584 	ld	(x), a
                                    585 ;	lib/src/stm8s_clk.c: 508: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
      008819 AE 50 C6         [ 2]  586 	ldw	x, #0x50c6
      00881C F6               [ 1]  587 	ld	a, (x)
      00881D 6B 02            [ 1]  588 	ld	(0x02, sp), a
      00881F 7B 05            [ 1]  589 	ld	a, (0x05, sp)
      008821 A4 18            [ 1]  590 	and	a, #0x18
      008823 1A 02            [ 1]  591 	or	a, (0x02, sp)
      008825 AE 50 C6         [ 2]  592 	ldw	x, #0x50c6
      008828 F7               [ 1]  593 	ld	(x), a
      008829 20 17            [ 2]  594 	jra	00104$
      00882B                        595 00102$:
                                    596 ;	lib/src/stm8s_clk.c: 512: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
      00882B AE 50 C6         [ 2]  597 	ldw	x, #0x50c6
      00882E F6               [ 1]  598 	ld	a, (x)
      00882F A4 F8            [ 1]  599 	and	a, #0xf8
      008831 F7               [ 1]  600 	ld	(x), a
                                    601 ;	lib/src/stm8s_clk.c: 513: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
      008832 AE 50 C6         [ 2]  602 	ldw	x, #0x50c6
      008835 F6               [ 1]  603 	ld	a, (x)
      008836 6B 01            [ 1]  604 	ld	(0x01, sp), a
      008838 7B 05            [ 1]  605 	ld	a, (0x05, sp)
      00883A A4 07            [ 1]  606 	and	a, #0x07
      00883C 1A 01            [ 1]  607 	or	a, (0x01, sp)
      00883E AE 50 C6         [ 2]  608 	ldw	x, #0x50c6
      008841 F7               [ 1]  609 	ld	(x), a
      008842                        610 00104$:
      008842 5B 02            [ 2]  611 	addw	sp, #2
      008844 81               [ 4]  612 	ret
                                    613 ;	lib/src/stm8s_clk.c: 523: void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
                                    614 ;	-----------------------------------------
                                    615 ;	 function CLK_SWIMConfig
                                    616 ;	-----------------------------------------
      008845                        617 _CLK_SWIMConfig:
                                    618 ;	lib/src/stm8s_clk.c: 528: if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
      008845 0D 03            [ 1]  619 	tnz	(0x03, sp)
      008847 27 06            [ 1]  620 	jreq	00102$
                                    621 ;	lib/src/stm8s_clk.c: 531: CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
      008849 72 10 50 CD      [ 1]  622 	bset	0x50cd, #0
      00884D 20 04            [ 2]  623 	jra	00104$
      00884F                        624 00102$:
                                    625 ;	lib/src/stm8s_clk.c: 536: CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
      00884F 72 11 50 CD      [ 1]  626 	bres	0x50cd, #0
      008853                        627 00104$:
      008853 81               [ 4]  628 	ret
                                    629 ;	lib/src/stm8s_clk.c: 547: void CLK_ClockSecuritySystemEnable(void)
                                    630 ;	-----------------------------------------
                                    631 ;	 function CLK_ClockSecuritySystemEnable
                                    632 ;	-----------------------------------------
      008854                        633 _CLK_ClockSecuritySystemEnable:
                                    634 ;	lib/src/stm8s_clk.c: 550: CLK->CSSR |= CLK_CSSR_CSSEN;
      008854 72 10 50 C8      [ 1]  635 	bset	0x50c8, #0
      008858 81               [ 4]  636 	ret
                                    637 ;	lib/src/stm8s_clk.c: 559: CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
                                    638 ;	-----------------------------------------
                                    639 ;	 function CLK_GetSYSCLKSource
                                    640 ;	-----------------------------------------
      008859                        641 _CLK_GetSYSCLKSource:
                                    642 ;	lib/src/stm8s_clk.c: 561: return((CLK_Source_TypeDef)CLK->CMSR);
      008859 AE 50 C3         [ 2]  643 	ldw	x, #0x50c3
      00885C F6               [ 1]  644 	ld	a, (x)
      00885D 81               [ 4]  645 	ret
                                    646 ;	lib/src/stm8s_clk.c: 569: uint32_t CLK_GetClockFreq(void)
                                    647 ;	-----------------------------------------
                                    648 ;	 function CLK_GetClockFreq
                                    649 ;	-----------------------------------------
      00885E                        650 _CLK_GetClockFreq:
      00885E 52 07            [ 2]  651 	sub	sp, #7
                                    652 ;	lib/src/stm8s_clk.c: 576: clocksource = (CLK_Source_TypeDef)CLK->CMSR;
      008860 AE 50 C3         [ 2]  653 	ldw	x, #0x50c3
      008863 F6               [ 1]  654 	ld	a, (x)
      008864 6B 05            [ 1]  655 	ld	(0x05, sp), a
                                    656 ;	lib/src/stm8s_clk.c: 578: if (clocksource == CLK_SOURCE_HSI)
      008866 7B 05            [ 1]  657 	ld	a, (0x05, sp)
      008868 A1 E1            [ 1]  658 	cp	a, #0xe1
      00886A 26 2A            [ 1]  659 	jrne	00105$
                                    660 ;	lib/src/stm8s_clk.c: 580: tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
      00886C AE 50 C6         [ 2]  661 	ldw	x, #0x50c6
      00886F F6               [ 1]  662 	ld	a, (x)
      008870 A4 18            [ 1]  663 	and	a, #0x18
                                    664 ;	lib/src/stm8s_clk.c: 581: tmp = (uint8_t)(tmp >> 3);
      008872 44               [ 1]  665 	srl	a
      008873 44               [ 1]  666 	srl	a
      008874 44               [ 1]  667 	srl	a
                                    668 ;	lib/src/stm8s_clk.c: 582: clockfrequency = HSI_VALUE >> HSIDivExp[tmp];
      008875 AE 89 4D         [ 2]  669 	ldw	x, #_HSIDivExp+0
      008878 1F 06            [ 2]  670 	ldw	(0x06, sp), x
      00887A 5F               [ 1]  671 	clrw	x
      00887B 97               [ 1]  672 	ld	xl, a
      00887C 72 FB 06         [ 2]  673 	addw	x, (0x06, sp)
      00887F F6               [ 1]  674 	ld	a, (x)
      008880 90 AE 24 00      [ 2]  675 	ldw	y, #0x2400
      008884 AE 00 F4         [ 2]  676 	ldw	x, #0x00f4
      008887 4D               [ 1]  677 	tnz	a
      008888 27 06            [ 1]  678 	jreq	00121$
      00888A                        679 00120$:
      00888A 54               [ 2]  680 	srlw	x
      00888B 90 56            [ 2]  681 	rrcw	y
      00888D 4A               [ 1]  682 	dec	a
      00888E 26 FA            [ 1]  683 	jrne	00120$
      008890                        684 00121$:
      008890 17 03            [ 2]  685 	ldw	(0x03, sp), y
      008892 1F 01            [ 2]  686 	ldw	(0x01, sp), x
      008894 20 1C            [ 2]  687 	jra	00106$
      008896                        688 00105$:
                                    689 ;	lib/src/stm8s_clk.c: 584: else if ( clocksource == CLK_SOURCE_LSI)
      008896 7B 05            [ 1]  690 	ld	a, (0x05, sp)
      008898 A1 D2            [ 1]  691 	cp	a, #0xd2
      00889A 26 0C            [ 1]  692 	jrne	00102$
                                    693 ;	lib/src/stm8s_clk.c: 586: clockfrequency = LSI_VALUE;
      00889C AE F4 00         [ 2]  694 	ldw	x, #0xf400
      00889F 1F 03            [ 2]  695 	ldw	(0x03, sp), x
      0088A1 AE 00 01         [ 2]  696 	ldw	x, #0x0001
      0088A4 1F 01            [ 2]  697 	ldw	(0x01, sp), x
      0088A6 20 0A            [ 2]  698 	jra	00106$
      0088A8                        699 00102$:
                                    700 ;	lib/src/stm8s_clk.c: 590: clockfrequency = HSE_VALUE;
      0088A8 AE 24 00         [ 2]  701 	ldw	x, #0x2400
      0088AB 1F 03            [ 2]  702 	ldw	(0x03, sp), x
      0088AD AE 00 F4         [ 2]  703 	ldw	x, #0x00f4
      0088B0 1F 01            [ 2]  704 	ldw	(0x01, sp), x
      0088B2                        705 00106$:
                                    706 ;	lib/src/stm8s_clk.c: 593: return((uint32_t)clockfrequency);
      0088B2 1E 03            [ 2]  707 	ldw	x, (0x03, sp)
      0088B4 16 01            [ 2]  708 	ldw	y, (0x01, sp)
      0088B6 5B 07            [ 2]  709 	addw	sp, #7
      0088B8 81               [ 4]  710 	ret
                                    711 ;	lib/src/stm8s_clk.c: 603: void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
                                    712 ;	-----------------------------------------
                                    713 ;	 function CLK_AdjustHSICalibrationValue
                                    714 ;	-----------------------------------------
      0088B9                        715 _CLK_AdjustHSICalibrationValue:
                                    716 ;	lib/src/stm8s_clk.c: 609: CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
      0088B9 AE 50 CC         [ 2]  717 	ldw	x, #0x50cc
      0088BC F6               [ 1]  718 	ld	a, (x)
      0088BD A4 F8            [ 1]  719 	and	a, #0xf8
      0088BF 1A 03            [ 1]  720 	or	a, (0x03, sp)
      0088C1 AE 50 CC         [ 2]  721 	ldw	x, #0x50cc
      0088C4 F7               [ 1]  722 	ld	(x), a
      0088C5 81               [ 4]  723 	ret
                                    724 ;	lib/src/stm8s_clk.c: 621: void CLK_SYSCLKEmergencyClear(void)
                                    725 ;	-----------------------------------------
                                    726 ;	 function CLK_SYSCLKEmergencyClear
                                    727 ;	-----------------------------------------
      0088C6                        728 _CLK_SYSCLKEmergencyClear:
                                    729 ;	lib/src/stm8s_clk.c: 623: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
      0088C6 72 11 50 C5      [ 1]  730 	bres	0x50c5, #0
      0088CA 81               [ 4]  731 	ret
                                    732 ;	lib/src/stm8s_clk.c: 633: FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
                                    733 ;	-----------------------------------------
                                    734 ;	 function CLK_GetFlagStatus
                                    735 ;	-----------------------------------------
      0088CB                        736 _CLK_GetFlagStatus:
                                    737 ;	lib/src/stm8s_clk.c: 643: statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
      0088CB 4F               [ 1]  738 	clr	a
      0088CC 97               [ 1]  739 	ld	xl, a
      0088CD 7B 03            [ 1]  740 	ld	a, (0x03, sp)
      0088CF 95               [ 1]  741 	ld	xh, a
                                    742 ;	lib/src/stm8s_clk.c: 646: if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
      0088D0 A3 01 00         [ 2]  743 	cpw	x, #0x0100
      0088D3 26 06            [ 1]  744 	jrne	00111$
                                    745 ;	lib/src/stm8s_clk.c: 648: tmpreg = CLK->ICKR;
      0088D5 AE 50 C0         [ 2]  746 	ldw	x, #0x50c0
      0088D8 F6               [ 1]  747 	ld	a, (x)
      0088D9 20 25            [ 2]  748 	jra	00112$
      0088DB                        749 00111$:
                                    750 ;	lib/src/stm8s_clk.c: 650: else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
      0088DB A3 02 00         [ 2]  751 	cpw	x, #0x0200
      0088DE 26 06            [ 1]  752 	jrne	00108$
                                    753 ;	lib/src/stm8s_clk.c: 652: tmpreg = CLK->ECKR;
      0088E0 AE 50 C1         [ 2]  754 	ldw	x, #0x50c1
      0088E3 F6               [ 1]  755 	ld	a, (x)
      0088E4 20 1A            [ 2]  756 	jra	00112$
      0088E6                        757 00108$:
                                    758 ;	lib/src/stm8s_clk.c: 654: else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
      0088E6 A3 03 00         [ 2]  759 	cpw	x, #0x0300
      0088E9 26 06            [ 1]  760 	jrne	00105$
                                    761 ;	lib/src/stm8s_clk.c: 656: tmpreg = CLK->SWCR;
      0088EB AE 50 C5         [ 2]  762 	ldw	x, #0x50c5
      0088EE F6               [ 1]  763 	ld	a, (x)
      0088EF 20 0F            [ 2]  764 	jra	00112$
      0088F1                        765 00105$:
                                    766 ;	lib/src/stm8s_clk.c: 658: else if (statusreg == 0x0400) /* The flag to check is in CSS register */
      0088F1 A3 04 00         [ 2]  767 	cpw	x, #0x0400
      0088F4 26 06            [ 1]  768 	jrne	00102$
                                    769 ;	lib/src/stm8s_clk.c: 660: tmpreg = CLK->CSSR;
      0088F6 AE 50 C8         [ 2]  770 	ldw	x, #0x50c8
      0088F9 F6               [ 1]  771 	ld	a, (x)
      0088FA 20 04            [ 2]  772 	jra	00112$
      0088FC                        773 00102$:
                                    774 ;	lib/src/stm8s_clk.c: 664: tmpreg = CLK->CCOR;
      0088FC AE 50 C9         [ 2]  775 	ldw	x, #0x50c9
      0088FF F6               [ 1]  776 	ld	a, (x)
      008900                        777 00112$:
                                    778 ;	lib/src/stm8s_clk.c: 667: if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
      008900 02               [ 1]  779 	rlwa	x
      008901 7B 04            [ 1]  780 	ld	a, (0x04, sp)
      008903 01               [ 1]  781 	rrwa	x
      008904 89               [ 2]  782 	pushw	x
      008905 14 01            [ 1]  783 	and	a, (1, sp)
      008907 85               [ 2]  784 	popw	x
      008908 4D               [ 1]  785 	tnz	a
      008909 27 03            [ 1]  786 	jreq	00114$
                                    787 ;	lib/src/stm8s_clk.c: 669: bitstatus = SET;
      00890B A6 01            [ 1]  788 	ld	a, #0x01
                                    789 ;	lib/src/stm8s_clk.c: 673: bitstatus = RESET;
      00890D 21                     790 	.byte 0x21
      00890E                        791 00114$:
      00890E 4F               [ 1]  792 	clr	a
      00890F                        793 00115$:
                                    794 ;	lib/src/stm8s_clk.c: 677: return((FlagStatus)bitstatus);
      00890F 81               [ 4]  795 	ret
                                    796 ;	lib/src/stm8s_clk.c: 686: ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
                                    797 ;	-----------------------------------------
                                    798 ;	 function CLK_GetITStatus
                                    799 ;	-----------------------------------------
      008910                        800 _CLK_GetITStatus:
                                    801 ;	lib/src/stm8s_clk.c: 693: if (CLK_IT == CLK_IT_SWIF)
      008910 7B 03            [ 1]  802 	ld	a, (0x03, sp)
      008912 A1 1C            [ 1]  803 	cp	a, #0x1c
      008914 26 11            [ 1]  804 	jrne	00108$
                                    805 ;	lib/src/stm8s_clk.c: 696: if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      008916 AE 50 C5         [ 2]  806 	ldw	x, #0x50c5
      008919 F6               [ 1]  807 	ld	a, (x)
      00891A 14 03            [ 1]  808 	and	a, (0x03, sp)
      00891C A1 0C            [ 1]  809 	cp	a, #0x0c
      00891E 26 04            [ 1]  810 	jrne	00102$
                                    811 ;	lib/src/stm8s_clk.c: 698: bitstatus = SET;
      008920 A6 01            [ 1]  812 	ld	a, #0x01
      008922 20 11            [ 2]  813 	jra	00109$
      008924                        814 00102$:
                                    815 ;	lib/src/stm8s_clk.c: 702: bitstatus = RESET;
      008924 4F               [ 1]  816 	clr	a
      008925 20 0E            [ 2]  817 	jra	00109$
      008927                        818 00108$:
                                    819 ;	lib/src/stm8s_clk.c: 708: if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      008927 AE 50 C8         [ 2]  820 	ldw	x, #0x50c8
      00892A F6               [ 1]  821 	ld	a, (x)
      00892B 14 03            [ 1]  822 	and	a, (0x03, sp)
      00892D A1 0C            [ 1]  823 	cp	a, #0x0c
      00892F 26 03            [ 1]  824 	jrne	00105$
                                    825 ;	lib/src/stm8s_clk.c: 710: bitstatus = SET;
      008931 A6 01            [ 1]  826 	ld	a, #0x01
                                    827 ;	lib/src/stm8s_clk.c: 714: bitstatus = RESET;
      008933 21                     828 	.byte 0x21
      008934                        829 00105$:
      008934 4F               [ 1]  830 	clr	a
      008935                        831 00109$:
                                    832 ;	lib/src/stm8s_clk.c: 719: return bitstatus;
      008935 81               [ 4]  833 	ret
                                    834 ;	lib/src/stm8s_clk.c: 728: void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
                                    835 ;	-----------------------------------------
                                    836 ;	 function CLK_ClearITPendingBit
                                    837 ;	-----------------------------------------
      008936                        838 _CLK_ClearITPendingBit:
                                    839 ;	lib/src/stm8s_clk.c: 733: if (CLK_IT == (uint8_t)CLK_IT_CSSD)
      008936 7B 03            [ 1]  840 	ld	a, (0x03, sp)
      008938 A1 0C            [ 1]  841 	cp	a, #0x0c
      00893A 26 09            [ 1]  842 	jrne	00102$
                                    843 ;	lib/src/stm8s_clk.c: 736: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
      00893C AE 50 C8         [ 2]  844 	ldw	x, #0x50c8
      00893F F6               [ 1]  845 	ld	a, (x)
      008940 A4 F7            [ 1]  846 	and	a, #0xf7
      008942 F7               [ 1]  847 	ld	(x), a
      008943 20 07            [ 2]  848 	jra	00104$
      008945                        849 00102$:
                                    850 ;	lib/src/stm8s_clk.c: 741: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
      008945 AE 50 C5         [ 2]  851 	ldw	x, #0x50c5
      008948 F6               [ 1]  852 	ld	a, (x)
      008949 A4 F7            [ 1]  853 	and	a, #0xf7
      00894B F7               [ 1]  854 	ld	(x), a
      00894C                        855 00104$:
      00894C 81               [ 4]  856 	ret
                                    857 	.area CODE
      00894D                        858 _HSIDivExp:
      00894D 00                     859 	.db #0x00	; 0
      00894E 01                     860 	.db #0x01	; 1
      00894F 02                     861 	.db #0x02	; 2
      008950 03                     862 	.db #0x03	; 3
      008951                        863 _CLKPrescTable:
      008951 01                     864 	.db #0x01	; 1
      008952 02                     865 	.db #0x02	; 2
      008953 04                     866 	.db #0x04	; 4
      008954 08                     867 	.db #0x08	; 8
      008955 0A                     868 	.db #0x0A	; 10
      008956 10                     869 	.db #0x10	; 16
      008957 14                     870 	.db #0x14	; 20
      008958 28                     871 	.db #0x28	; 40
                                    872 	.area INITIALIZER
                                    873 	.area CABS (ABS)
