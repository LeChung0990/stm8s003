                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.3.0 #14184 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_gpio
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _GPIO_DeInit
                                     12 	.globl _GPIO_Init
                                     13 	.globl _GPIO_Write
                                     14 	.globl _GPIO_WriteHigh
                                     15 	.globl _GPIO_WriteLow
                                     16 	.globl _GPIO_WriteReverse
                                     17 	.globl _GPIO_ReadOutputData
                                     18 	.globl _GPIO_ReadInputData
                                     19 	.globl _GPIO_ReadInputPin
                                     20 	.globl _GPIO_ExternalPullUpConfig
                                     21 ;--------------------------------------------------------
                                     22 ; ram data
                                     23 ;--------------------------------------------------------
                                     24 	.area DATA
                                     25 ;--------------------------------------------------------
                                     26 ; ram data
                                     27 ;--------------------------------------------------------
                                     28 	.area INITIALIZED
                                     29 ;--------------------------------------------------------
                                     30 ; absolute external ram data
                                     31 ;--------------------------------------------------------
                                     32 	.area DABS (ABS)
                                     33 
                                     34 ; default segment ordering for linker
                                     35 	.area HOME
                                     36 	.area GSINIT
                                     37 	.area GSFINAL
                                     38 	.area CONST
                                     39 	.area INITIALIZER
                                     40 	.area CODE
                                     41 
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
                                     58 ;	lib/src/stm8s_gpio.c: 53: void GPIO_DeInit(GPIO_TypeDef* GPIOx)
                                     59 ;	-----------------------------------------
                                     60 ;	 function GPIO_DeInit
                                     61 ;	-----------------------------------------
      00830F                         62 _GPIO_DeInit:
      00830F 51               [ 1]   63 	exgw	x, y
                                     64 ;	lib/src/stm8s_gpio.c: 55: GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
      008310 90 7F            [ 1]   65 	clr	(y)
                                     66 ;	lib/src/stm8s_gpio.c: 56: GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
      008312 93               [ 1]   67 	ldw	x, y
      008313 5C               [ 1]   68 	incw	x
      008314 5C               [ 1]   69 	incw	x
      008315 7F               [ 1]   70 	clr	(x)
                                     71 ;	lib/src/stm8s_gpio.c: 57: GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
      008316 93               [ 1]   72 	ldw	x, y
      008317 6F 03            [ 1]   73 	clr	(0x0003, x)
                                     74 ;	lib/src/stm8s_gpio.c: 58: GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
      008319 93               [ 1]   75 	ldw	x, y
      00831A 6F 04            [ 1]   76 	clr	(0x0004, x)
                                     77 ;	lib/src/stm8s_gpio.c: 59: }
      00831C 81               [ 4]   78 	ret
                                     79 ;	lib/src/stm8s_gpio.c: 71: void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
                                     80 ;	-----------------------------------------
                                     81 ;	 function GPIO_Init
                                     82 ;	-----------------------------------------
      00831D                         83 _GPIO_Init:
      00831D 52 06            [ 2]   84 	sub	sp, #6
      00831F 51               [ 1]   85 	exgw	x, y
      008320 6B 06            [ 1]   86 	ld	(0x06, sp), a
                                     87 ;	lib/src/stm8s_gpio.c: 81: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
      008322 93               [ 1]   88 	ldw	x, y
      008323 1C 00 04         [ 2]   89 	addw	x, #0x0004
      008326 1F 01            [ 2]   90 	ldw	(0x01, sp), x
      008328 F6               [ 1]   91 	ld	a, (x)
      008329 88               [ 1]   92 	push	a
      00832A 7B 07            [ 1]   93 	ld	a, (0x07, sp)
      00832C 43               [ 1]   94 	cpl	a
      00832D 6B 04            [ 1]   95 	ld	(0x04, sp), a
      00832F 84               [ 1]   96 	pop	a
      008330 14 03            [ 1]   97 	and	a, (0x03, sp)
      008332 1E 01            [ 2]   98 	ldw	x, (0x01, sp)
      008334 F7               [ 1]   99 	ld	(x), a
                                    100 ;	lib/src/stm8s_gpio.c: 98: GPIOx->DDR |= (uint8_t)GPIO_Pin;
      008335 93               [ 1]  101 	ldw	x, y
      008336 5C               [ 1]  102 	incw	x
      008337 5C               [ 1]  103 	incw	x
      008338 1F 04            [ 2]  104 	ldw	(0x04, sp), x
                                    105 ;	lib/src/stm8s_gpio.c: 87: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
      00833A 0D 09            [ 1]  106 	tnz	(0x09, sp)
      00833C 2A 1E            [ 1]  107 	jrpl	00105$
                                    108 ;	lib/src/stm8s_gpio.c: 91: GPIOx->ODR |= (uint8_t)GPIO_Pin;
      00833E 90 F6            [ 1]  109 	ld	a, (y)
                                    110 ;	lib/src/stm8s_gpio.c: 89: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
      008340 88               [ 1]  111 	push	a
      008341 7B 0A            [ 1]  112 	ld	a, (0x0a, sp)
      008343 A5 10            [ 1]  113 	bcp	a, #0x10
      008345 84               [ 1]  114 	pop	a
      008346 27 06            [ 1]  115 	jreq	00102$
                                    116 ;	lib/src/stm8s_gpio.c: 91: GPIOx->ODR |= (uint8_t)GPIO_Pin;
      008348 1A 06            [ 1]  117 	or	a, (0x06, sp)
      00834A 90 F7            [ 1]  118 	ld	(y), a
      00834C 20 04            [ 2]  119 	jra	00103$
      00834E                        120 00102$:
                                    121 ;	lib/src/stm8s_gpio.c: 95: GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
      00834E 14 03            [ 1]  122 	and	a, (0x03, sp)
      008350 90 F7            [ 1]  123 	ld	(y), a
      008352                        124 00103$:
                                    125 ;	lib/src/stm8s_gpio.c: 98: GPIOx->DDR |= (uint8_t)GPIO_Pin;
      008352 1E 04            [ 2]  126 	ldw	x, (0x04, sp)
      008354 F6               [ 1]  127 	ld	a, (x)
      008355 1A 06            [ 1]  128 	or	a, (0x06, sp)
      008357 1E 04            [ 2]  129 	ldw	x, (0x04, sp)
      008359 F7               [ 1]  130 	ld	(x), a
      00835A 20 08            [ 2]  131 	jra	00106$
      00835C                        132 00105$:
                                    133 ;	lib/src/stm8s_gpio.c: 103: GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
      00835C 1E 04            [ 2]  134 	ldw	x, (0x04, sp)
      00835E F6               [ 1]  135 	ld	a, (x)
      00835F 14 03            [ 1]  136 	and	a, (0x03, sp)
      008361 1E 04            [ 2]  137 	ldw	x, (0x04, sp)
      008363 F7               [ 1]  138 	ld	(x), a
      008364                        139 00106$:
                                    140 ;	lib/src/stm8s_gpio.c: 112: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      008364 93               [ 1]  141 	ldw	x, y
      008365 1C 00 03         [ 2]  142 	addw	x, #0x0003
      008368 F6               [ 1]  143 	ld	a, (x)
                                    144 ;	lib/src/stm8s_gpio.c: 110: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
      008369 88               [ 1]  145 	push	a
      00836A 7B 0A            [ 1]  146 	ld	a, (0x0a, sp)
      00836C A5 40            [ 1]  147 	bcp	a, #0x40
      00836E 84               [ 1]  148 	pop	a
      00836F 27 05            [ 1]  149 	jreq	00108$
                                    150 ;	lib/src/stm8s_gpio.c: 112: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      008371 1A 06            [ 1]  151 	or	a, (0x06, sp)
      008373 F7               [ 1]  152 	ld	(x), a
      008374 20 03            [ 2]  153 	jra	00109$
      008376                        154 00108$:
                                    155 ;	lib/src/stm8s_gpio.c: 116: GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
      008376 14 03            [ 1]  156 	and	a, (0x03, sp)
      008378 F7               [ 1]  157 	ld	(x), a
      008379                        158 00109$:
                                    159 ;	lib/src/stm8s_gpio.c: 81: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
      008379 1E 01            [ 2]  160 	ldw	x, (0x01, sp)
      00837B F6               [ 1]  161 	ld	a, (x)
                                    162 ;	lib/src/stm8s_gpio.c: 123: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
      00837C 88               [ 1]  163 	push	a
      00837D 7B 0A            [ 1]  164 	ld	a, (0x0a, sp)
      00837F A5 20            [ 1]  165 	bcp	a, #0x20
      008381 84               [ 1]  166 	pop	a
      008382 27 07            [ 1]  167 	jreq	00111$
                                    168 ;	lib/src/stm8s_gpio.c: 125: GPIOx->CR2 |= (uint8_t)GPIO_Pin;
      008384 1A 06            [ 1]  169 	or	a, (0x06, sp)
      008386 1E 01            [ 2]  170 	ldw	x, (0x01, sp)
      008388 F7               [ 1]  171 	ld	(x), a
      008389 20 05            [ 2]  172 	jra	00113$
      00838B                        173 00111$:
                                    174 ;	lib/src/stm8s_gpio.c: 129: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
      00838B 14 03            [ 1]  175 	and	a, (0x03, sp)
      00838D 1E 01            [ 2]  176 	ldw	x, (0x01, sp)
      00838F F7               [ 1]  177 	ld	(x), a
      008390                        178 00113$:
                                    179 ;	lib/src/stm8s_gpio.c: 131: }
      008390 5B 06            [ 2]  180 	addw	sp, #6
      008392 85               [ 2]  181 	popw	x
      008393 84               [ 1]  182 	pop	a
      008394 FC               [ 2]  183 	jp	(x)
                                    184 ;	lib/src/stm8s_gpio.c: 141: void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
                                    185 ;	-----------------------------------------
                                    186 ;	 function GPIO_Write
                                    187 ;	-----------------------------------------
      008395                        188 _GPIO_Write:
                                    189 ;	lib/src/stm8s_gpio.c: 143: GPIOx->ODR = PortVal;
      008395 F7               [ 1]  190 	ld	(x), a
                                    191 ;	lib/src/stm8s_gpio.c: 144: }
      008396 81               [ 4]  192 	ret
                                    193 ;	lib/src/stm8s_gpio.c: 154: void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    194 ;	-----------------------------------------
                                    195 ;	 function GPIO_WriteHigh
                                    196 ;	-----------------------------------------
      008397                        197 _GPIO_WriteHigh:
      008397 88               [ 1]  198 	push	a
      008398 6B 01            [ 1]  199 	ld	(0x01, sp), a
                                    200 ;	lib/src/stm8s_gpio.c: 156: GPIOx->ODR |= (uint8_t)PortPins;
      00839A F6               [ 1]  201 	ld	a, (x)
      00839B 1A 01            [ 1]  202 	or	a, (0x01, sp)
      00839D F7               [ 1]  203 	ld	(x), a
                                    204 ;	lib/src/stm8s_gpio.c: 157: }
      00839E 84               [ 1]  205 	pop	a
      00839F 81               [ 4]  206 	ret
                                    207 ;	lib/src/stm8s_gpio.c: 167: void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    208 ;	-----------------------------------------
                                    209 ;	 function GPIO_WriteLow
                                    210 ;	-----------------------------------------
      0083A0                        211 _GPIO_WriteLow:
      0083A0 88               [ 1]  212 	push	a
                                    213 ;	lib/src/stm8s_gpio.c: 169: GPIOx->ODR &= (uint8_t)(~PortPins);
      0083A1 88               [ 1]  214 	push	a
      0083A2 F6               [ 1]  215 	ld	a, (x)
      0083A3 6B 02            [ 1]  216 	ld	(0x02, sp), a
      0083A5 84               [ 1]  217 	pop	a
      0083A6 43               [ 1]  218 	cpl	a
      0083A7 14 01            [ 1]  219 	and	a, (0x01, sp)
      0083A9 F7               [ 1]  220 	ld	(x), a
                                    221 ;	lib/src/stm8s_gpio.c: 170: }
      0083AA 84               [ 1]  222 	pop	a
      0083AB 81               [ 4]  223 	ret
                                    224 ;	lib/src/stm8s_gpio.c: 180: void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    225 ;	-----------------------------------------
                                    226 ;	 function GPIO_WriteReverse
                                    227 ;	-----------------------------------------
      0083AC                        228 _GPIO_WriteReverse:
      0083AC 88               [ 1]  229 	push	a
      0083AD 6B 01            [ 1]  230 	ld	(0x01, sp), a
                                    231 ;	lib/src/stm8s_gpio.c: 182: GPIOx->ODR ^= (uint8_t)PortPins;
      0083AF F6               [ 1]  232 	ld	a, (x)
      0083B0 18 01            [ 1]  233 	xor	a, (0x01, sp)
      0083B2 F7               [ 1]  234 	ld	(x), a
                                    235 ;	lib/src/stm8s_gpio.c: 183: }
      0083B3 84               [ 1]  236 	pop	a
      0083B4 81               [ 4]  237 	ret
                                    238 ;	lib/src/stm8s_gpio.c: 191: uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
                                    239 ;	-----------------------------------------
                                    240 ;	 function GPIO_ReadOutputData
                                    241 ;	-----------------------------------------
      0083B5                        242 _GPIO_ReadOutputData:
                                    243 ;	lib/src/stm8s_gpio.c: 193: return ((uint8_t)GPIOx->ODR);
      0083B5 F6               [ 1]  244 	ld	a, (x)
                                    245 ;	lib/src/stm8s_gpio.c: 194: }
      0083B6 81               [ 4]  246 	ret
                                    247 ;	lib/src/stm8s_gpio.c: 202: uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
                                    248 ;	-----------------------------------------
                                    249 ;	 function GPIO_ReadInputData
                                    250 ;	-----------------------------------------
      0083B7                        251 _GPIO_ReadInputData:
                                    252 ;	lib/src/stm8s_gpio.c: 204: return ((uint8_t)GPIOx->IDR);
      0083B7 E6 01            [ 1]  253 	ld	a, (0x1, x)
                                    254 ;	lib/src/stm8s_gpio.c: 205: }
      0083B9 81               [ 4]  255 	ret
                                    256 ;	lib/src/stm8s_gpio.c: 213: BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
                                    257 ;	-----------------------------------------
                                    258 ;	 function GPIO_ReadInputPin
                                    259 ;	-----------------------------------------
      0083BA                        260 _GPIO_ReadInputPin:
      0083BA 88               [ 1]  261 	push	a
      0083BB 6B 01            [ 1]  262 	ld	(0x01, sp), a
                                    263 ;	lib/src/stm8s_gpio.c: 215: return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
      0083BD E6 01            [ 1]  264 	ld	a, (0x1, x)
      0083BF 14 01            [ 1]  265 	and	a, (0x01, sp)
      0083C1 40               [ 1]  266 	neg	a
      0083C2 4F               [ 1]  267 	clr	a
      0083C3 49               [ 1]  268 	rlc	a
                                    269 ;	lib/src/stm8s_gpio.c: 216: }
      0083C4 5B 01            [ 2]  270 	addw	sp, #1
      0083C6 81               [ 4]  271 	ret
                                    272 ;	lib/src/stm8s_gpio.c: 225: void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
                                    273 ;	-----------------------------------------
                                    274 ;	 function GPIO_ExternalPullUpConfig
                                    275 ;	-----------------------------------------
      0083C7                        276 _GPIO_ExternalPullUpConfig:
      0083C7 88               [ 1]  277 	push	a
                                    278 ;	lib/src/stm8s_gpio.c: 233: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      0083C8 1C 00 03         [ 2]  279 	addw	x, #0x0003
      0083CB 88               [ 1]  280 	push	a
      0083CC F6               [ 1]  281 	ld	a, (x)
      0083CD 6B 02            [ 1]  282 	ld	(0x02, sp), a
      0083CF 84               [ 1]  283 	pop	a
                                    284 ;	lib/src/stm8s_gpio.c: 231: if (NewState != DISABLE) /* External Pull-Up Set*/
      0083D0 0D 04            [ 1]  285 	tnz	(0x04, sp)
      0083D2 27 05            [ 1]  286 	jreq	00102$
                                    287 ;	lib/src/stm8s_gpio.c: 233: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      0083D4 1A 01            [ 1]  288 	or	a, (0x01, sp)
      0083D6 F7               [ 1]  289 	ld	(x), a
      0083D7 20 04            [ 2]  290 	jra	00104$
      0083D9                        291 00102$:
                                    292 ;	lib/src/stm8s_gpio.c: 236: GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
      0083D9 43               [ 1]  293 	cpl	a
      0083DA 14 01            [ 1]  294 	and	a, (0x01, sp)
      0083DC F7               [ 1]  295 	ld	(x), a
      0083DD                        296 00104$:
                                    297 ;	lib/src/stm8s_gpio.c: 238: }
      0083DD 84               [ 1]  298 	pop	a
      0083DE 85               [ 2]  299 	popw	x
      0083DF 84               [ 1]  300 	pop	a
      0083E0 FC               [ 2]  301 	jp	(x)
                                    302 	.area CODE
                                    303 	.area CONST
                                    304 	.area INITIALIZER
                                    305 	.area CABS (ABS)
