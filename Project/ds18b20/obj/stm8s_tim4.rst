                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.5.0 #9253 (Apr  3 2018) (Linux)
                                      4 ; This file was generated Tue Feb 11 21:09:30 2025
                                      5 ;--------------------------------------------------------
                                      6 	.module stm8s_tim4
                                      7 	.optsdcc -mstm8
                                      8 	
                                      9 ;--------------------------------------------------------
                                     10 ; Public variables in this module
                                     11 ;--------------------------------------------------------
                                     12 	.globl _TIM4_DeInit
                                     13 	.globl _TIM4_TimeBaseInit
                                     14 	.globl _TIM4_Cmd
                                     15 	.globl _TIM4_ITConfig
                                     16 	.globl _TIM4_UpdateDisableConfig
                                     17 	.globl _TIM4_UpdateRequestConfig
                                     18 	.globl _TIM4_SelectOnePulseMode
                                     19 	.globl _TIM4_PrescalerConfig
                                     20 	.globl _TIM4_ARRPreloadConfig
                                     21 	.globl _TIM4_GenerateEvent
                                     22 	.globl _TIM4_SetCounter
                                     23 	.globl _TIM4_SetAutoreload
                                     24 	.globl _TIM4_GetCounter
                                     25 	.globl _TIM4_GetPrescaler
                                     26 	.globl _TIM4_GetFlagStatus
                                     27 	.globl _TIM4_ClearFlag
                                     28 	.globl _TIM4_GetITStatus
                                     29 	.globl _TIM4_ClearITPendingBit
                                     30 ;--------------------------------------------------------
                                     31 ; ram data
                                     32 ;--------------------------------------------------------
                                     33 	.area DATA
                                     34 ;--------------------------------------------------------
                                     35 ; ram data
                                     36 ;--------------------------------------------------------
                                     37 	.area INITIALIZED
                                     38 ;--------------------------------------------------------
                                     39 ; absolute external ram data
                                     40 ;--------------------------------------------------------
                                     41 	.area DABS (ABS)
                                     42 ;--------------------------------------------------------
                                     43 ; global & static initialisations
                                     44 ;--------------------------------------------------------
                                     45 	.area HOME
                                     46 	.area GSINIT
                                     47 	.area GSFINAL
                                     48 	.area GSINIT
                                     49 ;--------------------------------------------------------
                                     50 ; Home
                                     51 ;--------------------------------------------------------
                                     52 	.area HOME
                                     53 	.area HOME
                                     54 ;--------------------------------------------------------
                                     55 ; code
                                     56 ;--------------------------------------------------------
                                     57 	.area CODE
                                     58 ;	lib/src/stm8s_tim4.c: 49: void TIM4_DeInit(void)
                                     59 ;	-----------------------------------------
                                     60 ;	 function TIM4_DeInit
                                     61 ;	-----------------------------------------
      00813E                         62 _TIM4_DeInit:
                                     63 ;	lib/src/stm8s_tim4.c: 51: TIM4->CR1 = TIM4_CR1_RESET_VALUE;
      00813E 35 00 53 40      [ 1]   64 	mov	0x5340+0, #0x00
                                     65 ;	lib/src/stm8s_tim4.c: 52: TIM4->IER = TIM4_IER_RESET_VALUE;
      008142 35 00 53 43      [ 1]   66 	mov	0x5343+0, #0x00
                                     67 ;	lib/src/stm8s_tim4.c: 53: TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
      008146 35 00 53 46      [ 1]   68 	mov	0x5346+0, #0x00
                                     69 ;	lib/src/stm8s_tim4.c: 54: TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
      00814A 35 00 53 47      [ 1]   70 	mov	0x5347+0, #0x00
                                     71 ;	lib/src/stm8s_tim4.c: 55: TIM4->ARR = TIM4_ARR_RESET_VALUE;
      00814E 35 FF 53 48      [ 1]   72 	mov	0x5348+0, #0xff
                                     73 ;	lib/src/stm8s_tim4.c: 56: TIM4->SR1 = TIM4_SR1_RESET_VALUE;
      008152 35 00 53 44      [ 1]   74 	mov	0x5344+0, #0x00
      008156 81               [ 4]   75 	ret
                                     76 ;	lib/src/stm8s_tim4.c: 65: void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
                                     77 ;	-----------------------------------------
                                     78 ;	 function TIM4_TimeBaseInit
                                     79 ;	-----------------------------------------
      008157                         80 _TIM4_TimeBaseInit:
                                     81 ;	lib/src/stm8s_tim4.c: 70: TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
      008157 AE 53 47         [ 2]   82 	ldw	x, #0x5347
      00815A 7B 03            [ 1]   83 	ld	a, (0x03, sp)
      00815C F7               [ 1]   84 	ld	(x), a
                                     85 ;	lib/src/stm8s_tim4.c: 72: TIM4->ARR = (uint8_t)(TIM4_Period);
      00815D AE 53 48         [ 2]   86 	ldw	x, #0x5348
      008160 7B 04            [ 1]   87 	ld	a, (0x04, sp)
      008162 F7               [ 1]   88 	ld	(x), a
      008163 81               [ 4]   89 	ret
                                     90 ;	lib/src/stm8s_tim4.c: 81: void TIM4_Cmd(FunctionalState NewState)
                                     91 ;	-----------------------------------------
                                     92 ;	 function TIM4_Cmd
                                     93 ;	-----------------------------------------
      008164                         94 _TIM4_Cmd:
                                     95 ;	lib/src/stm8s_tim4.c: 87: if (NewState != DISABLE)
      008164 0D 03            [ 1]   96 	tnz	(0x03, sp)
      008166 27 06            [ 1]   97 	jreq	00102$
                                     98 ;	lib/src/stm8s_tim4.c: 89: TIM4->CR1 |= TIM4_CR1_CEN;
      008168 72 10 53 40      [ 1]   99 	bset	0x5340, #0
      00816C 20 04            [ 2]  100 	jra	00104$
      00816E                        101 00102$:
                                    102 ;	lib/src/stm8s_tim4.c: 93: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
      00816E 72 11 53 40      [ 1]  103 	bres	0x5340, #0
      008172                        104 00104$:
      008172 81               [ 4]  105 	ret
                                    106 ;	lib/src/stm8s_tim4.c: 107: void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
                                    107 ;	-----------------------------------------
                                    108 ;	 function TIM4_ITConfig
                                    109 ;	-----------------------------------------
      008173                        110 _TIM4_ITConfig:
      008173 88               [ 1]  111 	push	a
                                    112 ;	lib/src/stm8s_tim4.c: 113: if (NewState != DISABLE)
      008174 0D 05            [ 1]  113 	tnz	(0x05, sp)
      008176 27 0C            [ 1]  114 	jreq	00102$
                                    115 ;	lib/src/stm8s_tim4.c: 116: TIM4->IER |= (uint8_t)TIM4_IT;
      008178 AE 53 43         [ 2]  116 	ldw	x, #0x5343
      00817B F6               [ 1]  117 	ld	a, (x)
      00817C 1A 04            [ 1]  118 	or	a, (0x04, sp)
      00817E AE 53 43         [ 2]  119 	ldw	x, #0x5343
      008181 F7               [ 1]  120 	ld	(x), a
      008182 20 0F            [ 2]  121 	jra	00104$
      008184                        122 00102$:
                                    123 ;	lib/src/stm8s_tim4.c: 121: TIM4->IER &= (uint8_t)(~TIM4_IT);
      008184 AE 53 43         [ 2]  124 	ldw	x, #0x5343
      008187 F6               [ 1]  125 	ld	a, (x)
      008188 6B 01            [ 1]  126 	ld	(0x01, sp), a
      00818A 7B 04            [ 1]  127 	ld	a, (0x04, sp)
      00818C 43               [ 1]  128 	cpl	a
      00818D 14 01            [ 1]  129 	and	a, (0x01, sp)
      00818F AE 53 43         [ 2]  130 	ldw	x, #0x5343
      008192 F7               [ 1]  131 	ld	(x), a
      008193                        132 00104$:
      008193 84               [ 1]  133 	pop	a
      008194 81               [ 4]  134 	ret
                                    135 ;	lib/src/stm8s_tim4.c: 131: void TIM4_UpdateDisableConfig(FunctionalState NewState)
                                    136 ;	-----------------------------------------
                                    137 ;	 function TIM4_UpdateDisableConfig
                                    138 ;	-----------------------------------------
      008195                        139 _TIM4_UpdateDisableConfig:
                                    140 ;	lib/src/stm8s_tim4.c: 137: if (NewState != DISABLE)
      008195 0D 03            [ 1]  141 	tnz	(0x03, sp)
      008197 27 09            [ 1]  142 	jreq	00102$
                                    143 ;	lib/src/stm8s_tim4.c: 139: TIM4->CR1 |= TIM4_CR1_UDIS;
      008199 AE 53 40         [ 2]  144 	ldw	x, #0x5340
      00819C F6               [ 1]  145 	ld	a, (x)
      00819D AA 02            [ 1]  146 	or	a, #0x02
      00819F F7               [ 1]  147 	ld	(x), a
      0081A0 20 07            [ 2]  148 	jra	00104$
      0081A2                        149 00102$:
                                    150 ;	lib/src/stm8s_tim4.c: 143: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
      0081A2 AE 53 40         [ 2]  151 	ldw	x, #0x5340
      0081A5 F6               [ 1]  152 	ld	a, (x)
      0081A6 A4 FD            [ 1]  153 	and	a, #0xfd
      0081A8 F7               [ 1]  154 	ld	(x), a
      0081A9                        155 00104$:
      0081A9 81               [ 4]  156 	ret
                                    157 ;	lib/src/stm8s_tim4.c: 155: void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
                                    158 ;	-----------------------------------------
                                    159 ;	 function TIM4_UpdateRequestConfig
                                    160 ;	-----------------------------------------
      0081AA                        161 _TIM4_UpdateRequestConfig:
                                    162 ;	lib/src/stm8s_tim4.c: 161: if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
      0081AA 0D 03            [ 1]  163 	tnz	(0x03, sp)
      0081AC 27 09            [ 1]  164 	jreq	00102$
                                    165 ;	lib/src/stm8s_tim4.c: 163: TIM4->CR1 |= TIM4_CR1_URS;
      0081AE AE 53 40         [ 2]  166 	ldw	x, #0x5340
      0081B1 F6               [ 1]  167 	ld	a, (x)
      0081B2 AA 04            [ 1]  168 	or	a, #0x04
      0081B4 F7               [ 1]  169 	ld	(x), a
      0081B5 20 07            [ 2]  170 	jra	00104$
      0081B7                        171 00102$:
                                    172 ;	lib/src/stm8s_tim4.c: 167: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
      0081B7 AE 53 40         [ 2]  173 	ldw	x, #0x5340
      0081BA F6               [ 1]  174 	ld	a, (x)
      0081BB A4 FB            [ 1]  175 	and	a, #0xfb
      0081BD F7               [ 1]  176 	ld	(x), a
      0081BE                        177 00104$:
      0081BE 81               [ 4]  178 	ret
                                    179 ;	lib/src/stm8s_tim4.c: 179: void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
                                    180 ;	-----------------------------------------
                                    181 ;	 function TIM4_SelectOnePulseMode
                                    182 ;	-----------------------------------------
      0081BF                        183 _TIM4_SelectOnePulseMode:
                                    184 ;	lib/src/stm8s_tim4.c: 185: if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
      0081BF 0D 03            [ 1]  185 	tnz	(0x03, sp)
      0081C1 27 09            [ 1]  186 	jreq	00102$
                                    187 ;	lib/src/stm8s_tim4.c: 187: TIM4->CR1 |= TIM4_CR1_OPM;
      0081C3 AE 53 40         [ 2]  188 	ldw	x, #0x5340
      0081C6 F6               [ 1]  189 	ld	a, (x)
      0081C7 AA 08            [ 1]  190 	or	a, #0x08
      0081C9 F7               [ 1]  191 	ld	(x), a
      0081CA 20 07            [ 2]  192 	jra	00104$
      0081CC                        193 00102$:
                                    194 ;	lib/src/stm8s_tim4.c: 191: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
      0081CC AE 53 40         [ 2]  195 	ldw	x, #0x5340
      0081CF F6               [ 1]  196 	ld	a, (x)
      0081D0 A4 F7            [ 1]  197 	and	a, #0xf7
      0081D2 F7               [ 1]  198 	ld	(x), a
      0081D3                        199 00104$:
      0081D3 81               [ 4]  200 	ret
                                    201 ;	lib/src/stm8s_tim4.c: 215: void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
                                    202 ;	-----------------------------------------
                                    203 ;	 function TIM4_PrescalerConfig
                                    204 ;	-----------------------------------------
      0081D4                        205 _TIM4_PrescalerConfig:
                                    206 ;	lib/src/stm8s_tim4.c: 222: TIM4->PSCR = (uint8_t)Prescaler;
      0081D4 AE 53 47         [ 2]  207 	ldw	x, #0x5347
      0081D7 7B 03            [ 1]  208 	ld	a, (0x03, sp)
      0081D9 F7               [ 1]  209 	ld	(x), a
                                    210 ;	lib/src/stm8s_tim4.c: 225: TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
      0081DA AE 53 45         [ 2]  211 	ldw	x, #0x5345
      0081DD 7B 04            [ 1]  212 	ld	a, (0x04, sp)
      0081DF F7               [ 1]  213 	ld	(x), a
      0081E0 81               [ 4]  214 	ret
                                    215 ;	lib/src/stm8s_tim4.c: 234: void TIM4_ARRPreloadConfig(FunctionalState NewState)
                                    216 ;	-----------------------------------------
                                    217 ;	 function TIM4_ARRPreloadConfig
                                    218 ;	-----------------------------------------
      0081E1                        219 _TIM4_ARRPreloadConfig:
                                    220 ;	lib/src/stm8s_tim4.c: 240: if (NewState != DISABLE)
      0081E1 0D 03            [ 1]  221 	tnz	(0x03, sp)
      0081E3 27 06            [ 1]  222 	jreq	00102$
                                    223 ;	lib/src/stm8s_tim4.c: 242: TIM4->CR1 |= TIM4_CR1_ARPE;
      0081E5 72 1E 53 40      [ 1]  224 	bset	0x5340, #7
      0081E9 20 04            [ 2]  225 	jra	00104$
      0081EB                        226 00102$:
                                    227 ;	lib/src/stm8s_tim4.c: 246: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
      0081EB 72 1F 53 40      [ 1]  228 	bres	0x5340, #7
      0081EF                        229 00104$:
      0081EF 81               [ 4]  230 	ret
                                    231 ;	lib/src/stm8s_tim4.c: 257: void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
                                    232 ;	-----------------------------------------
                                    233 ;	 function TIM4_GenerateEvent
                                    234 ;	-----------------------------------------
      0081F0                        235 _TIM4_GenerateEvent:
                                    236 ;	lib/src/stm8s_tim4.c: 263: TIM4->EGR = (uint8_t)(TIM4_EventSource);
      0081F0 AE 53 45         [ 2]  237 	ldw	x, #0x5345
      0081F3 7B 03            [ 1]  238 	ld	a, (0x03, sp)
      0081F5 F7               [ 1]  239 	ld	(x), a
      0081F6 81               [ 4]  240 	ret
                                    241 ;	lib/src/stm8s_tim4.c: 272: void TIM4_SetCounter(uint8_t Counter)
                                    242 ;	-----------------------------------------
                                    243 ;	 function TIM4_SetCounter
                                    244 ;	-----------------------------------------
      0081F7                        245 _TIM4_SetCounter:
                                    246 ;	lib/src/stm8s_tim4.c: 275: TIM4->CNTR = (uint8_t)(Counter);
      0081F7 AE 53 46         [ 2]  247 	ldw	x, #0x5346
      0081FA 7B 03            [ 1]  248 	ld	a, (0x03, sp)
      0081FC F7               [ 1]  249 	ld	(x), a
      0081FD 81               [ 4]  250 	ret
                                    251 ;	lib/src/stm8s_tim4.c: 284: void TIM4_SetAutoreload(uint8_t Autoreload)
                                    252 ;	-----------------------------------------
                                    253 ;	 function TIM4_SetAutoreload
                                    254 ;	-----------------------------------------
      0081FE                        255 _TIM4_SetAutoreload:
                                    256 ;	lib/src/stm8s_tim4.c: 287: TIM4->ARR = (uint8_t)(Autoreload);
      0081FE AE 53 48         [ 2]  257 	ldw	x, #0x5348
      008201 7B 03            [ 1]  258 	ld	a, (0x03, sp)
      008203 F7               [ 1]  259 	ld	(x), a
      008204 81               [ 4]  260 	ret
                                    261 ;	lib/src/stm8s_tim4.c: 295: uint8_t TIM4_GetCounter(void)
                                    262 ;	-----------------------------------------
                                    263 ;	 function TIM4_GetCounter
                                    264 ;	-----------------------------------------
      008205                        265 _TIM4_GetCounter:
                                    266 ;	lib/src/stm8s_tim4.c: 298: return (uint8_t)(TIM4->CNTR);
      008205 AE 53 46         [ 2]  267 	ldw	x, #0x5346
      008208 F6               [ 1]  268 	ld	a, (x)
      008209 81               [ 4]  269 	ret
                                    270 ;	lib/src/stm8s_tim4.c: 306: TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
                                    271 ;	-----------------------------------------
                                    272 ;	 function TIM4_GetPrescaler
                                    273 ;	-----------------------------------------
      00820A                        274 _TIM4_GetPrescaler:
                                    275 ;	lib/src/stm8s_tim4.c: 309: return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
      00820A AE 53 47         [ 2]  276 	ldw	x, #0x5347
      00820D F6               [ 1]  277 	ld	a, (x)
      00820E 81               [ 4]  278 	ret
                                    279 ;	lib/src/stm8s_tim4.c: 319: FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
                                    280 ;	-----------------------------------------
                                    281 ;	 function TIM4_GetFlagStatus
                                    282 ;	-----------------------------------------
      00820F                        283 _TIM4_GetFlagStatus:
                                    284 ;	lib/src/stm8s_tim4.c: 326: if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
      00820F AE 53 44         [ 2]  285 	ldw	x, #0x5344
      008212 F6               [ 1]  286 	ld	a, (x)
      008213 14 03            [ 1]  287 	and	a, (0x03, sp)
      008215 4D               [ 1]  288 	tnz	a
      008216 27 03            [ 1]  289 	jreq	00102$
                                    290 ;	lib/src/stm8s_tim4.c: 328: bitstatus = SET;
      008218 A6 01            [ 1]  291 	ld	a, #0x01
                                    292 ;	lib/src/stm8s_tim4.c: 332: bitstatus = RESET;
      00821A 21                     293 	.byte 0x21
      00821B                        294 00102$:
      00821B 4F               [ 1]  295 	clr	a
      00821C                        296 00103$:
                                    297 ;	lib/src/stm8s_tim4.c: 334: return ((FlagStatus)bitstatus);
      00821C 81               [ 4]  298 	ret
                                    299 ;	lib/src/stm8s_tim4.c: 344: void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
                                    300 ;	-----------------------------------------
                                    301 ;	 function TIM4_ClearFlag
                                    302 ;	-----------------------------------------
      00821D                        303 _TIM4_ClearFlag:
                                    304 ;	lib/src/stm8s_tim4.c: 350: TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
      00821D 7B 03            [ 1]  305 	ld	a, (0x03, sp)
      00821F 43               [ 1]  306 	cpl	a
      008220 AE 53 44         [ 2]  307 	ldw	x, #0x5344
      008223 F7               [ 1]  308 	ld	(x), a
      008224 81               [ 4]  309 	ret
                                    310 ;	lib/src/stm8s_tim4.c: 360: ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
                                    311 ;	-----------------------------------------
                                    312 ;	 function TIM4_GetITStatus
                                    313 ;	-----------------------------------------
      008225                        314 _TIM4_GetITStatus:
      008225 88               [ 1]  315 	push	a
                                    316 ;	lib/src/stm8s_tim4.c: 369: itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
      008226 AE 53 44         [ 2]  317 	ldw	x, #0x5344
      008229 F6               [ 1]  318 	ld	a, (x)
      00822A 14 04            [ 1]  319 	and	a, (0x04, sp)
      00822C 6B 01            [ 1]  320 	ld	(0x01, sp), a
                                    321 ;	lib/src/stm8s_tim4.c: 371: itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
      00822E AE 53 43         [ 2]  322 	ldw	x, #0x5343
      008231 F6               [ 1]  323 	ld	a, (x)
      008232 14 04            [ 1]  324 	and	a, (0x04, sp)
                                    325 ;	lib/src/stm8s_tim4.c: 373: if ((itstatus != (uint8_t)RESET ) && (itenable != (uint8_t)RESET ))
      008234 0D 01            [ 1]  326 	tnz	(0x01, sp)
      008236 27 06            [ 1]  327 	jreq	00102$
      008238 4D               [ 1]  328 	tnz	a
      008239 27 03            [ 1]  329 	jreq	00102$
                                    330 ;	lib/src/stm8s_tim4.c: 375: bitstatus = (ITStatus)SET;
      00823B A6 01            [ 1]  331 	ld	a, #0x01
                                    332 ;	lib/src/stm8s_tim4.c: 379: bitstatus = (ITStatus)RESET;
      00823D 21                     333 	.byte 0x21
      00823E                        334 00102$:
      00823E 4F               [ 1]  335 	clr	a
      00823F                        336 00103$:
                                    337 ;	lib/src/stm8s_tim4.c: 381: return ((ITStatus)bitstatus);
      00823F 5B 01            [ 2]  338 	addw	sp, #1
      008241 81               [ 4]  339 	ret
                                    340 ;	lib/src/stm8s_tim4.c: 391: void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
                                    341 ;	-----------------------------------------
                                    342 ;	 function TIM4_ClearITPendingBit
                                    343 ;	-----------------------------------------
      008242                        344 _TIM4_ClearITPendingBit:
                                    345 ;	lib/src/stm8s_tim4.c: 397: TIM4->SR1 = (uint8_t)(~TIM4_IT);
      008242 7B 03            [ 1]  346 	ld	a, (0x03, sp)
      008244 43               [ 1]  347 	cpl	a
      008245 AE 53 44         [ 2]  348 	ldw	x, #0x5344
      008248 F7               [ 1]  349 	ld	(x), a
      008249 81               [ 4]  350 	ret
                                    351 	.area CODE
                                    352 	.area INITIALIZER
                                    353 	.area CABS (ABS)
