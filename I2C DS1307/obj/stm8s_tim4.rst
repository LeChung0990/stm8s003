                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.3.0 #14184 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_tim4
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _TIM4_DeInit
                                     12 	.globl _TIM4_TimeBaseInit
                                     13 	.globl _TIM4_Cmd
                                     14 	.globl _TIM4_ITConfig
                                     15 	.globl _TIM4_UpdateDisableConfig
                                     16 	.globl _TIM4_UpdateRequestConfig
                                     17 	.globl _TIM4_SelectOnePulseMode
                                     18 	.globl _TIM4_PrescalerConfig
                                     19 	.globl _TIM4_ARRPreloadConfig
                                     20 	.globl _TIM4_GenerateEvent
                                     21 	.globl _TIM4_SetCounter
                                     22 	.globl _TIM4_SetAutoreload
                                     23 	.globl _TIM4_GetCounter
                                     24 	.globl _TIM4_GetPrescaler
                                     25 	.globl _TIM4_GetFlagStatus
                                     26 	.globl _TIM4_ClearFlag
                                     27 	.globl _TIM4_GetITStatus
                                     28 	.globl _TIM4_ClearITPendingBit
                                     29 ;--------------------------------------------------------
                                     30 ; ram data
                                     31 ;--------------------------------------------------------
                                     32 	.area DATA
                                     33 ;--------------------------------------------------------
                                     34 ; ram data
                                     35 ;--------------------------------------------------------
                                     36 	.area INITIALIZED
                                     37 ;--------------------------------------------------------
                                     38 ; absolute external ram data
                                     39 ;--------------------------------------------------------
                                     40 	.area DABS (ABS)
                                     41 
                                     42 ; default segment ordering for linker
                                     43 	.area HOME
                                     44 	.area GSINIT
                                     45 	.area GSFINAL
                                     46 	.area CONST
                                     47 	.area INITIALIZER
                                     48 	.area CODE
                                     49 
                                     50 ;--------------------------------------------------------
                                     51 ; global & static initialisations
                                     52 ;--------------------------------------------------------
                                     53 	.area HOME
                                     54 	.area GSINIT
                                     55 	.area GSFINAL
                                     56 	.area GSINIT
                                     57 ;--------------------------------------------------------
                                     58 ; Home
                                     59 ;--------------------------------------------------------
                                     60 	.area HOME
                                     61 	.area HOME
                                     62 ;--------------------------------------------------------
                                     63 ; code
                                     64 ;--------------------------------------------------------
                                     65 	.area CODE
                                     66 ;	lib/src/stm8s_tim4.c: 49: void TIM4_DeInit(void)
                                     67 ;	-----------------------------------------
                                     68 ;	 function TIM4_DeInit
                                     69 ;	-----------------------------------------
      008320                         70 _TIM4_DeInit:
                                     71 ;	lib/src/stm8s_tim4.c: 51: TIM4->CR1 = TIM4_CR1_RESET_VALUE;
      008320 35 00 53 40      [ 1]   72 	mov	0x5340+0, #0x00
                                     73 ;	lib/src/stm8s_tim4.c: 52: TIM4->IER = TIM4_IER_RESET_VALUE;
      008324 35 00 53 43      [ 1]   74 	mov	0x5343+0, #0x00
                                     75 ;	lib/src/stm8s_tim4.c: 53: TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
      008328 35 00 53 46      [ 1]   76 	mov	0x5346+0, #0x00
                                     77 ;	lib/src/stm8s_tim4.c: 54: TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
      00832C 35 00 53 47      [ 1]   78 	mov	0x5347+0, #0x00
                                     79 ;	lib/src/stm8s_tim4.c: 55: TIM4->ARR = TIM4_ARR_RESET_VALUE;
      008330 35 FF 53 48      [ 1]   80 	mov	0x5348+0, #0xff
                                     81 ;	lib/src/stm8s_tim4.c: 56: TIM4->SR1 = TIM4_SR1_RESET_VALUE;
      008334 35 00 53 44      [ 1]   82 	mov	0x5344+0, #0x00
                                     83 ;	lib/src/stm8s_tim4.c: 57: }
      008338 81               [ 4]   84 	ret
                                     85 ;	lib/src/stm8s_tim4.c: 65: void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
                                     86 ;	-----------------------------------------
                                     87 ;	 function TIM4_TimeBaseInit
                                     88 ;	-----------------------------------------
      008339                         89 _TIM4_TimeBaseInit:
                                     90 ;	lib/src/stm8s_tim4.c: 70: TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
      008339 C7 53 47         [ 1]   91 	ld	0x5347, a
                                     92 ;	lib/src/stm8s_tim4.c: 72: TIM4->ARR = (uint8_t)(TIM4_Period);
      00833C AE 53 48         [ 2]   93 	ldw	x, #0x5348
      00833F 7B 03            [ 1]   94 	ld	a, (0x03, sp)
      008341 F7               [ 1]   95 	ld	(x), a
                                     96 ;	lib/src/stm8s_tim4.c: 73: }
      008342 85               [ 2]   97 	popw	x
      008343 84               [ 1]   98 	pop	a
      008344 FC               [ 2]   99 	jp	(x)
                                    100 ;	lib/src/stm8s_tim4.c: 81: void TIM4_Cmd(FunctionalState NewState)
                                    101 ;	-----------------------------------------
                                    102 ;	 function TIM4_Cmd
                                    103 ;	-----------------------------------------
      008345                        104 _TIM4_Cmd:
      008345 88               [ 1]  105 	push	a
      008346 6B 01            [ 1]  106 	ld	(0x01, sp), a
                                    107 ;	lib/src/stm8s_tim4.c: 89: TIM4->CR1 |= TIM4_CR1_CEN;
      008348 C6 53 40         [ 1]  108 	ld	a, 0x5340
                                    109 ;	lib/src/stm8s_tim4.c: 87: if (NewState != DISABLE)
      00834B 0D 01            [ 1]  110 	tnz	(0x01, sp)
      00834D 27 07            [ 1]  111 	jreq	00102$
                                    112 ;	lib/src/stm8s_tim4.c: 89: TIM4->CR1 |= TIM4_CR1_CEN;
      00834F AA 01            [ 1]  113 	or	a, #0x01
      008351 C7 53 40         [ 1]  114 	ld	0x5340, a
      008354 20 05            [ 2]  115 	jra	00104$
      008356                        116 00102$:
                                    117 ;	lib/src/stm8s_tim4.c: 93: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
      008356 A4 FE            [ 1]  118 	and	a, #0xfe
      008358 C7 53 40         [ 1]  119 	ld	0x5340, a
      00835B                        120 00104$:
                                    121 ;	lib/src/stm8s_tim4.c: 95: }
      00835B 84               [ 1]  122 	pop	a
      00835C 81               [ 4]  123 	ret
                                    124 ;	lib/src/stm8s_tim4.c: 107: void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
                                    125 ;	-----------------------------------------
                                    126 ;	 function TIM4_ITConfig
                                    127 ;	-----------------------------------------
      00835D                        128 _TIM4_ITConfig:
      00835D 88               [ 1]  129 	push	a
      00835E 97               [ 1]  130 	ld	xl, a
                                    131 ;	lib/src/stm8s_tim4.c: 116: TIM4->IER |= (uint8_t)TIM4_IT;
      00835F C6 53 43         [ 1]  132 	ld	a, 0x5343
      008362 6B 01            [ 1]  133 	ld	(0x01, sp), a
                                    134 ;	lib/src/stm8s_tim4.c: 113: if (NewState != DISABLE)
      008364 0D 04            [ 1]  135 	tnz	(0x04, sp)
      008366 27 08            [ 1]  136 	jreq	00102$
                                    137 ;	lib/src/stm8s_tim4.c: 116: TIM4->IER |= (uint8_t)TIM4_IT;
      008368 9F               [ 1]  138 	ld	a, xl
      008369 1A 01            [ 1]  139 	or	a, (0x01, sp)
      00836B C7 53 43         [ 1]  140 	ld	0x5343, a
      00836E 20 07            [ 2]  141 	jra	00104$
      008370                        142 00102$:
                                    143 ;	lib/src/stm8s_tim4.c: 121: TIM4->IER &= (uint8_t)(~TIM4_IT);
      008370 9F               [ 1]  144 	ld	a, xl
      008371 43               [ 1]  145 	cpl	a
      008372 14 01            [ 1]  146 	and	a, (0x01, sp)
      008374 C7 53 43         [ 1]  147 	ld	0x5343, a
      008377                        148 00104$:
                                    149 ;	lib/src/stm8s_tim4.c: 123: }
      008377 84               [ 1]  150 	pop	a
      008378 85               [ 2]  151 	popw	x
      008379 84               [ 1]  152 	pop	a
      00837A FC               [ 2]  153 	jp	(x)
                                    154 ;	lib/src/stm8s_tim4.c: 131: void TIM4_UpdateDisableConfig(FunctionalState NewState)
                                    155 ;	-----------------------------------------
                                    156 ;	 function TIM4_UpdateDisableConfig
                                    157 ;	-----------------------------------------
      00837B                        158 _TIM4_UpdateDisableConfig:
      00837B 88               [ 1]  159 	push	a
      00837C 6B 01            [ 1]  160 	ld	(0x01, sp), a
                                    161 ;	lib/src/stm8s_tim4.c: 139: TIM4->CR1 |= TIM4_CR1_UDIS;
      00837E C6 53 40         [ 1]  162 	ld	a, 0x5340
                                    163 ;	lib/src/stm8s_tim4.c: 137: if (NewState != DISABLE)
      008381 0D 01            [ 1]  164 	tnz	(0x01, sp)
      008383 27 07            [ 1]  165 	jreq	00102$
                                    166 ;	lib/src/stm8s_tim4.c: 139: TIM4->CR1 |= TIM4_CR1_UDIS;
      008385 AA 02            [ 1]  167 	or	a, #0x02
      008387 C7 53 40         [ 1]  168 	ld	0x5340, a
      00838A 20 05            [ 2]  169 	jra	00104$
      00838C                        170 00102$:
                                    171 ;	lib/src/stm8s_tim4.c: 143: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
      00838C A4 FD            [ 1]  172 	and	a, #0xfd
      00838E C7 53 40         [ 1]  173 	ld	0x5340, a
      008391                        174 00104$:
                                    175 ;	lib/src/stm8s_tim4.c: 145: }
      008391 84               [ 1]  176 	pop	a
      008392 81               [ 4]  177 	ret
                                    178 ;	lib/src/stm8s_tim4.c: 155: void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
                                    179 ;	-----------------------------------------
                                    180 ;	 function TIM4_UpdateRequestConfig
                                    181 ;	-----------------------------------------
      008393                        182 _TIM4_UpdateRequestConfig:
      008393 88               [ 1]  183 	push	a
      008394 6B 01            [ 1]  184 	ld	(0x01, sp), a
                                    185 ;	lib/src/stm8s_tim4.c: 163: TIM4->CR1 |= TIM4_CR1_URS;
      008396 C6 53 40         [ 1]  186 	ld	a, 0x5340
                                    187 ;	lib/src/stm8s_tim4.c: 161: if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
      008399 0D 01            [ 1]  188 	tnz	(0x01, sp)
      00839B 27 07            [ 1]  189 	jreq	00102$
                                    190 ;	lib/src/stm8s_tim4.c: 163: TIM4->CR1 |= TIM4_CR1_URS;
      00839D AA 04            [ 1]  191 	or	a, #0x04
      00839F C7 53 40         [ 1]  192 	ld	0x5340, a
      0083A2 20 05            [ 2]  193 	jra	00104$
      0083A4                        194 00102$:
                                    195 ;	lib/src/stm8s_tim4.c: 167: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
      0083A4 A4 FB            [ 1]  196 	and	a, #0xfb
      0083A6 C7 53 40         [ 1]  197 	ld	0x5340, a
      0083A9                        198 00104$:
                                    199 ;	lib/src/stm8s_tim4.c: 169: }
      0083A9 84               [ 1]  200 	pop	a
      0083AA 81               [ 4]  201 	ret
                                    202 ;	lib/src/stm8s_tim4.c: 179: void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
                                    203 ;	-----------------------------------------
                                    204 ;	 function TIM4_SelectOnePulseMode
                                    205 ;	-----------------------------------------
      0083AB                        206 _TIM4_SelectOnePulseMode:
      0083AB 88               [ 1]  207 	push	a
      0083AC 6B 01            [ 1]  208 	ld	(0x01, sp), a
                                    209 ;	lib/src/stm8s_tim4.c: 187: TIM4->CR1 |= TIM4_CR1_OPM;
      0083AE C6 53 40         [ 1]  210 	ld	a, 0x5340
                                    211 ;	lib/src/stm8s_tim4.c: 185: if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
      0083B1 0D 01            [ 1]  212 	tnz	(0x01, sp)
      0083B3 27 07            [ 1]  213 	jreq	00102$
                                    214 ;	lib/src/stm8s_tim4.c: 187: TIM4->CR1 |= TIM4_CR1_OPM;
      0083B5 AA 08            [ 1]  215 	or	a, #0x08
      0083B7 C7 53 40         [ 1]  216 	ld	0x5340, a
      0083BA 20 05            [ 2]  217 	jra	00104$
      0083BC                        218 00102$:
                                    219 ;	lib/src/stm8s_tim4.c: 191: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
      0083BC A4 F7            [ 1]  220 	and	a, #0xf7
      0083BE C7 53 40         [ 1]  221 	ld	0x5340, a
      0083C1                        222 00104$:
                                    223 ;	lib/src/stm8s_tim4.c: 193: }
      0083C1 84               [ 1]  224 	pop	a
      0083C2 81               [ 4]  225 	ret
                                    226 ;	lib/src/stm8s_tim4.c: 215: void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
                                    227 ;	-----------------------------------------
                                    228 ;	 function TIM4_PrescalerConfig
                                    229 ;	-----------------------------------------
      0083C3                        230 _TIM4_PrescalerConfig:
                                    231 ;	lib/src/stm8s_tim4.c: 222: TIM4->PSCR = (uint8_t)Prescaler;
      0083C3 C7 53 47         [ 1]  232 	ld	0x5347, a
                                    233 ;	lib/src/stm8s_tim4.c: 225: TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
      0083C6 7B 03            [ 1]  234 	ld	a, (0x03, sp)
      0083C8 C7 53 45         [ 1]  235 	ld	0x5345, a
                                    236 ;	lib/src/stm8s_tim4.c: 226: }
      0083CB 85               [ 2]  237 	popw	x
      0083CC 84               [ 1]  238 	pop	a
      0083CD FC               [ 2]  239 	jp	(x)
                                    240 ;	lib/src/stm8s_tim4.c: 234: void TIM4_ARRPreloadConfig(FunctionalState NewState)
                                    241 ;	-----------------------------------------
                                    242 ;	 function TIM4_ARRPreloadConfig
                                    243 ;	-----------------------------------------
      0083CE                        244 _TIM4_ARRPreloadConfig:
      0083CE 88               [ 1]  245 	push	a
      0083CF 6B 01            [ 1]  246 	ld	(0x01, sp), a
                                    247 ;	lib/src/stm8s_tim4.c: 242: TIM4->CR1 |= TIM4_CR1_ARPE;
      0083D1 C6 53 40         [ 1]  248 	ld	a, 0x5340
                                    249 ;	lib/src/stm8s_tim4.c: 240: if (NewState != DISABLE)
      0083D4 0D 01            [ 1]  250 	tnz	(0x01, sp)
      0083D6 27 07            [ 1]  251 	jreq	00102$
                                    252 ;	lib/src/stm8s_tim4.c: 242: TIM4->CR1 |= TIM4_CR1_ARPE;
      0083D8 AA 80            [ 1]  253 	or	a, #0x80
      0083DA C7 53 40         [ 1]  254 	ld	0x5340, a
      0083DD 20 05            [ 2]  255 	jra	00104$
      0083DF                        256 00102$:
                                    257 ;	lib/src/stm8s_tim4.c: 246: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
      0083DF A4 7F            [ 1]  258 	and	a, #0x7f
      0083E1 C7 53 40         [ 1]  259 	ld	0x5340, a
      0083E4                        260 00104$:
                                    261 ;	lib/src/stm8s_tim4.c: 248: }
      0083E4 84               [ 1]  262 	pop	a
      0083E5 81               [ 4]  263 	ret
                                    264 ;	lib/src/stm8s_tim4.c: 257: void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
                                    265 ;	-----------------------------------------
                                    266 ;	 function TIM4_GenerateEvent
                                    267 ;	-----------------------------------------
      0083E6                        268 _TIM4_GenerateEvent:
                                    269 ;	lib/src/stm8s_tim4.c: 263: TIM4->EGR = (uint8_t)(TIM4_EventSource);
      0083E6 C7 53 45         [ 1]  270 	ld	0x5345, a
                                    271 ;	lib/src/stm8s_tim4.c: 264: }
      0083E9 81               [ 4]  272 	ret
                                    273 ;	lib/src/stm8s_tim4.c: 272: void TIM4_SetCounter(uint8_t Counter)
                                    274 ;	-----------------------------------------
                                    275 ;	 function TIM4_SetCounter
                                    276 ;	-----------------------------------------
      0083EA                        277 _TIM4_SetCounter:
                                    278 ;	lib/src/stm8s_tim4.c: 275: TIM4->CNTR = (uint8_t)(Counter);
      0083EA C7 53 46         [ 1]  279 	ld	0x5346, a
                                    280 ;	lib/src/stm8s_tim4.c: 276: }
      0083ED 81               [ 4]  281 	ret
                                    282 ;	lib/src/stm8s_tim4.c: 284: void TIM4_SetAutoreload(uint8_t Autoreload)
                                    283 ;	-----------------------------------------
                                    284 ;	 function TIM4_SetAutoreload
                                    285 ;	-----------------------------------------
      0083EE                        286 _TIM4_SetAutoreload:
                                    287 ;	lib/src/stm8s_tim4.c: 287: TIM4->ARR = (uint8_t)(Autoreload);
      0083EE C7 53 48         [ 1]  288 	ld	0x5348, a
                                    289 ;	lib/src/stm8s_tim4.c: 288: }
      0083F1 81               [ 4]  290 	ret
                                    291 ;	lib/src/stm8s_tim4.c: 295: uint8_t TIM4_GetCounter(void)
                                    292 ;	-----------------------------------------
                                    293 ;	 function TIM4_GetCounter
                                    294 ;	-----------------------------------------
      0083F2                        295 _TIM4_GetCounter:
                                    296 ;	lib/src/stm8s_tim4.c: 298: return (uint8_t)(TIM4->CNTR);
      0083F2 C6 53 46         [ 1]  297 	ld	a, 0x5346
                                    298 ;	lib/src/stm8s_tim4.c: 299: }
      0083F5 81               [ 4]  299 	ret
                                    300 ;	lib/src/stm8s_tim4.c: 306: TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
                                    301 ;	-----------------------------------------
                                    302 ;	 function TIM4_GetPrescaler
                                    303 ;	-----------------------------------------
      0083F6                        304 _TIM4_GetPrescaler:
                                    305 ;	lib/src/stm8s_tim4.c: 309: return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
      0083F6 C6 53 47         [ 1]  306 	ld	a, 0x5347
                                    307 ;	lib/src/stm8s_tim4.c: 310: }
      0083F9 81               [ 4]  308 	ret
                                    309 ;	lib/src/stm8s_tim4.c: 319: FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
                                    310 ;	-----------------------------------------
                                    311 ;	 function TIM4_GetFlagStatus
                                    312 ;	-----------------------------------------
      0083FA                        313 _TIM4_GetFlagStatus:
      0083FA 97               [ 1]  314 	ld	xl, a
                                    315 ;	lib/src/stm8s_tim4.c: 326: if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
      0083FB C6 53 44         [ 1]  316 	ld	a, 0x5344
      0083FE 89               [ 2]  317 	pushw	x
      0083FF 14 02            [ 1]  318 	and	a, (2, sp)
      008401 85               [ 2]  319 	popw	x
      008402 4D               [ 1]  320 	tnz	a
      008403 27 03            [ 1]  321 	jreq	00102$
                                    322 ;	lib/src/stm8s_tim4.c: 328: bitstatus = SET;
      008405 A6 01            [ 1]  323 	ld	a, #0x01
      008407 81               [ 4]  324 	ret
      008408                        325 00102$:
                                    326 ;	lib/src/stm8s_tim4.c: 332: bitstatus = RESET;
      008408 4F               [ 1]  327 	clr	a
                                    328 ;	lib/src/stm8s_tim4.c: 334: return ((FlagStatus)bitstatus);
                                    329 ;	lib/src/stm8s_tim4.c: 335: }
      008409 81               [ 4]  330 	ret
                                    331 ;	lib/src/stm8s_tim4.c: 344: void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
                                    332 ;	-----------------------------------------
                                    333 ;	 function TIM4_ClearFlag
                                    334 ;	-----------------------------------------
      00840A                        335 _TIM4_ClearFlag:
                                    336 ;	lib/src/stm8s_tim4.c: 350: TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
      00840A 43               [ 1]  337 	cpl	a
      00840B C7 53 44         [ 1]  338 	ld	0x5344, a
                                    339 ;	lib/src/stm8s_tim4.c: 351: }
      00840E 81               [ 4]  340 	ret
                                    341 ;	lib/src/stm8s_tim4.c: 360: ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
                                    342 ;	-----------------------------------------
                                    343 ;	 function TIM4_GetITStatus
                                    344 ;	-----------------------------------------
      00840F                        345 _TIM4_GetITStatus:
      00840F 52 02            [ 2]  346 	sub	sp, #2
      008411 97               [ 1]  347 	ld	xl, a
                                    348 ;	lib/src/stm8s_tim4.c: 369: itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
      008412 C6 53 44         [ 1]  349 	ld	a, 0x5344
      008415 41               [ 1]  350 	exg	a, xl
      008416 6B 01            [ 1]  351 	ld	(0x01, sp), a
      008418 41               [ 1]  352 	exg	a, xl
      008419 14 01            [ 1]  353 	and	a, (0x01, sp)
      00841B 6B 02            [ 1]  354 	ld	(0x02, sp), a
                                    355 ;	lib/src/stm8s_tim4.c: 371: itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
      00841D C6 53 43         [ 1]  356 	ld	a, 0x5343
      008420 14 01            [ 1]  357 	and	a, (0x01, sp)
                                    358 ;	lib/src/stm8s_tim4.c: 373: if ((itstatus != (uint8_t)RESET ) && (itenable != (uint8_t)RESET ))
      008422 0D 02            [ 1]  359 	tnz	(0x02, sp)
      008424 27 06            [ 1]  360 	jreq	00102$
      008426 4D               [ 1]  361 	tnz	a
      008427 27 03            [ 1]  362 	jreq	00102$
                                    363 ;	lib/src/stm8s_tim4.c: 375: bitstatus = (ITStatus)SET;
      008429 A6 01            [ 1]  364 	ld	a, #0x01
                                    365 ;	lib/src/stm8s_tim4.c: 379: bitstatus = (ITStatus)RESET;
      00842B 21                     366 	.byte 0x21
      00842C                        367 00102$:
      00842C 4F               [ 1]  368 	clr	a
      00842D                        369 00103$:
                                    370 ;	lib/src/stm8s_tim4.c: 381: return ((ITStatus)bitstatus);
                                    371 ;	lib/src/stm8s_tim4.c: 382: }
      00842D 5B 02            [ 2]  372 	addw	sp, #2
      00842F 81               [ 4]  373 	ret
                                    374 ;	lib/src/stm8s_tim4.c: 391: void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
                                    375 ;	-----------------------------------------
                                    376 ;	 function TIM4_ClearITPendingBit
                                    377 ;	-----------------------------------------
      008430                        378 _TIM4_ClearITPendingBit:
                                    379 ;	lib/src/stm8s_tim4.c: 397: TIM4->SR1 = (uint8_t)(~TIM4_IT);
      008430 43               [ 1]  380 	cpl	a
      008431 C7 53 44         [ 1]  381 	ld	0x5344, a
                                    382 ;	lib/src/stm8s_tim4.c: 398: }
      008434 81               [ 4]  383 	ret
                                    384 	.area CODE
                                    385 	.area CONST
                                    386 	.area INITIALIZER
                                    387 	.area CABS (ABS)
