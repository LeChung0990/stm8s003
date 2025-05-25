                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.5.0 #9253 (Apr  3 2018) (Linux)
                                      4 ; This file was generated Tue Feb 11 21:09:30 2025
                                      5 ;--------------------------------------------------------
                                      6 	.module stm8s_gpio
                                      7 	.optsdcc -mstm8
                                      8 	
                                      9 ;--------------------------------------------------------
                                     10 ; Public variables in this module
                                     11 ;--------------------------------------------------------
                                     12 	.globl _GPIO_DeInit
                                     13 	.globl _GPIO_Init
                                     14 	.globl _GPIO_Write
                                     15 	.globl _GPIO_WriteHigh
                                     16 	.globl _GPIO_WriteLow
                                     17 	.globl _GPIO_WriteReverse
                                     18 	.globl _GPIO_ReadOutputData
                                     19 	.globl _GPIO_ReadInputData
                                     20 	.globl _GPIO_ReadInputPin
                                     21 	.globl _GPIO_ExternalPullUpConfig
                                     22 ;--------------------------------------------------------
                                     23 ; ram data
                                     24 ;--------------------------------------------------------
                                     25 	.area DATA
                                     26 ;--------------------------------------------------------
                                     27 ; ram data
                                     28 ;--------------------------------------------------------
                                     29 	.area INITIALIZED
                                     30 ;--------------------------------------------------------
                                     31 ; absolute external ram data
                                     32 ;--------------------------------------------------------
                                     33 	.area DABS (ABS)
                                     34 ;--------------------------------------------------------
                                     35 ; global & static initialisations
                                     36 ;--------------------------------------------------------
                                     37 	.area HOME
                                     38 	.area GSINIT
                                     39 	.area GSFINAL
                                     40 	.area GSINIT
                                     41 ;--------------------------------------------------------
                                     42 ; Home
                                     43 ;--------------------------------------------------------
                                     44 	.area HOME
                                     45 	.area HOME
                                     46 ;--------------------------------------------------------
                                     47 ; code
                                     48 ;--------------------------------------------------------
                                     49 	.area CODE
                                     50 ;	lib/src/stm8s_gpio.c: 53: void GPIO_DeInit(GPIO_TypeDef* GPIOx)
                                     51 ;	-----------------------------------------
                                     52 ;	 function GPIO_DeInit
                                     53 ;	-----------------------------------------
      0081ED                         54 _GPIO_DeInit:
      0081ED 52 02            [ 2]   55 	sub	sp, #2
                                     56 ;	lib/src/stm8s_gpio.c: 55: GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
      0081EF 16 05            [ 2]   57 	ldw	y, (0x05, sp)
      0081F1 17 01            [ 2]   58 	ldw	(0x01, sp), y
      0081F3 1E 01            [ 2]   59 	ldw	x, (0x01, sp)
      0081F5 7F               [ 1]   60 	clr	(x)
                                     61 ;	lib/src/stm8s_gpio.c: 56: GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
      0081F6 1E 01            [ 2]   62 	ldw	x, (0x01, sp)
      0081F8 5C               [ 2]   63 	incw	x
      0081F9 5C               [ 2]   64 	incw	x
      0081FA 7F               [ 1]   65 	clr	(x)
                                     66 ;	lib/src/stm8s_gpio.c: 57: GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
      0081FB 1E 01            [ 2]   67 	ldw	x, (0x01, sp)
      0081FD 1C 00 03         [ 2]   68 	addw	x, #0x0003
      008200 7F               [ 1]   69 	clr	(x)
                                     70 ;	lib/src/stm8s_gpio.c: 58: GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
      008201 1E 01            [ 2]   71 	ldw	x, (0x01, sp)
      008203 1C 00 04         [ 2]   72 	addw	x, #0x0004
      008206 7F               [ 1]   73 	clr	(x)
      008207 5B 02            [ 2]   74 	addw	sp, #2
      008209 81               [ 4]   75 	ret
                                     76 ;	lib/src/stm8s_gpio.c: 71: void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
                                     77 ;	-----------------------------------------
                                     78 ;	 function GPIO_Init
                                     79 ;	-----------------------------------------
      00820A                         80 _GPIO_Init:
      00820A 52 05            [ 2]   81 	sub	sp, #5
                                     82 ;	lib/src/stm8s_gpio.c: 81: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
      00820C 16 08            [ 2]   83 	ldw	y, (0x08, sp)
      00820E 17 03            [ 2]   84 	ldw	(0x03, sp), y
      008210 1E 03            [ 2]   85 	ldw	x, (0x03, sp)
      008212 1C 00 04         [ 2]   86 	addw	x, #0x0004
      008215 1F 01            [ 2]   87 	ldw	(0x01, sp), x
      008217 1E 01            [ 2]   88 	ldw	x, (0x01, sp)
      008219 F6               [ 1]   89 	ld	a, (x)
      00821A 95               [ 1]   90 	ld	xh, a
      00821B 7B 0A            [ 1]   91 	ld	a, (0x0a, sp)
      00821D 43               [ 1]   92 	cpl	a
      00821E 6B 05            [ 1]   93 	ld	(0x05, sp), a
      008220 9E               [ 1]   94 	ld	a, xh
      008221 14 05            [ 1]   95 	and	a, (0x05, sp)
      008223 1E 01            [ 2]   96 	ldw	x, (0x01, sp)
      008225 F7               [ 1]   97 	ld	(x), a
                                     98 ;	lib/src/stm8s_gpio.c: 98: GPIOx->DDR |= (uint8_t)GPIO_Pin;
      008226 1E 03            [ 2]   99 	ldw	x, (0x03, sp)
      008228 5C               [ 2]  100 	incw	x
      008229 5C               [ 2]  101 	incw	x
                                    102 ;	lib/src/stm8s_gpio.c: 87: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
      00822A 0D 0B            [ 1]  103 	tnz	(0x0b, sp)
      00822C 2A 20            [ 1]  104 	jrpl	00105$
                                    105 ;	lib/src/stm8s_gpio.c: 91: GPIOx->ODR |= (uint8_t)GPIO_Pin;
      00822E 16 03            [ 2]  106 	ldw	y, (0x03, sp)
      008230 90 F6            [ 1]  107 	ld	a, (y)
                                    108 ;	lib/src/stm8s_gpio.c: 89: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
      008232 88               [ 1]  109 	push	a
      008233 7B 0C            [ 1]  110 	ld	a, (0x0c, sp)
      008235 A5 10            [ 1]  111 	bcp	a, #0x10
      008237 84               [ 1]  112 	pop	a
      008238 27 08            [ 1]  113 	jreq	00102$
                                    114 ;	lib/src/stm8s_gpio.c: 91: GPIOx->ODR |= (uint8_t)GPIO_Pin;
      00823A 1A 0A            [ 1]  115 	or	a, (0x0a, sp)
      00823C 16 03            [ 2]  116 	ldw	y, (0x03, sp)
      00823E 90 F7            [ 1]  117 	ld	(y), a
      008240 20 06            [ 2]  118 	jra	00103$
      008242                        119 00102$:
                                    120 ;	lib/src/stm8s_gpio.c: 95: GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
      008242 14 05            [ 1]  121 	and	a, (0x05, sp)
      008244 16 03            [ 2]  122 	ldw	y, (0x03, sp)
      008246 90 F7            [ 1]  123 	ld	(y), a
      008248                        124 00103$:
                                    125 ;	lib/src/stm8s_gpio.c: 98: GPIOx->DDR |= (uint8_t)GPIO_Pin;
      008248 F6               [ 1]  126 	ld	a, (x)
      008249 1A 0A            [ 1]  127 	or	a, (0x0a, sp)
      00824B F7               [ 1]  128 	ld	(x), a
      00824C 20 04            [ 2]  129 	jra	00106$
      00824E                        130 00105$:
                                    131 ;	lib/src/stm8s_gpio.c: 103: GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
      00824E F6               [ 1]  132 	ld	a, (x)
      00824F 14 05            [ 1]  133 	and	a, (0x05, sp)
      008251 F7               [ 1]  134 	ld	(x), a
      008252                        135 00106$:
                                    136 ;	lib/src/stm8s_gpio.c: 112: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      008252 1E 03            [ 2]  137 	ldw	x, (0x03, sp)
      008254 1C 00 03         [ 2]  138 	addw	x, #0x0003
                                    139 ;	lib/src/stm8s_gpio.c: 110: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
      008257 7B 0B            [ 1]  140 	ld	a, (0x0b, sp)
      008259 A5 40            [ 1]  141 	bcp	a, #0x40
      00825B 27 06            [ 1]  142 	jreq	00108$
                                    143 ;	lib/src/stm8s_gpio.c: 112: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      00825D F6               [ 1]  144 	ld	a, (x)
      00825E 1A 0A            [ 1]  145 	or	a, (0x0a, sp)
      008260 F7               [ 1]  146 	ld	(x), a
      008261 20 04            [ 2]  147 	jra	00109$
      008263                        148 00108$:
                                    149 ;	lib/src/stm8s_gpio.c: 116: GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
      008263 F6               [ 1]  150 	ld	a, (x)
      008264 14 05            [ 1]  151 	and	a, (0x05, sp)
      008266 F7               [ 1]  152 	ld	(x), a
      008267                        153 00109$:
                                    154 ;	lib/src/stm8s_gpio.c: 123: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
      008267 7B 0B            [ 1]  155 	ld	a, (0x0b, sp)
      008269 A5 20            [ 1]  156 	bcp	a, #0x20
      00826B 27 0A            [ 1]  157 	jreq	00111$
                                    158 ;	lib/src/stm8s_gpio.c: 125: GPIOx->CR2 |= (uint8_t)GPIO_Pin;
      00826D 1E 01            [ 2]  159 	ldw	x, (0x01, sp)
      00826F F6               [ 1]  160 	ld	a, (x)
      008270 1A 0A            [ 1]  161 	or	a, (0x0a, sp)
      008272 1E 01            [ 2]  162 	ldw	x, (0x01, sp)
      008274 F7               [ 1]  163 	ld	(x), a
      008275 20 08            [ 2]  164 	jra	00113$
      008277                        165 00111$:
                                    166 ;	lib/src/stm8s_gpio.c: 129: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
      008277 1E 01            [ 2]  167 	ldw	x, (0x01, sp)
      008279 F6               [ 1]  168 	ld	a, (x)
      00827A 14 05            [ 1]  169 	and	a, (0x05, sp)
      00827C 1E 01            [ 2]  170 	ldw	x, (0x01, sp)
      00827E F7               [ 1]  171 	ld	(x), a
      00827F                        172 00113$:
      00827F 5B 05            [ 2]  173 	addw	sp, #5
      008281 81               [ 4]  174 	ret
                                    175 ;	lib/src/stm8s_gpio.c: 141: void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
                                    176 ;	-----------------------------------------
                                    177 ;	 function GPIO_Write
                                    178 ;	-----------------------------------------
      008282                        179 _GPIO_Write:
                                    180 ;	lib/src/stm8s_gpio.c: 143: GPIOx->ODR = PortVal;
      008282 1E 03            [ 2]  181 	ldw	x, (0x03, sp)
      008284 7B 05            [ 1]  182 	ld	a, (0x05, sp)
      008286 F7               [ 1]  183 	ld	(x), a
      008287 81               [ 4]  184 	ret
                                    185 ;	lib/src/stm8s_gpio.c: 154: void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    186 ;	-----------------------------------------
                                    187 ;	 function GPIO_WriteHigh
                                    188 ;	-----------------------------------------
      008288                        189 _GPIO_WriteHigh:
                                    190 ;	lib/src/stm8s_gpio.c: 156: GPIOx->ODR |= (uint8_t)PortPins;
      008288 1E 03            [ 2]  191 	ldw	x, (0x03, sp)
      00828A F6               [ 1]  192 	ld	a, (x)
      00828B 1A 05            [ 1]  193 	or	a, (0x05, sp)
      00828D F7               [ 1]  194 	ld	(x), a
      00828E 81               [ 4]  195 	ret
                                    196 ;	lib/src/stm8s_gpio.c: 167: void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    197 ;	-----------------------------------------
                                    198 ;	 function GPIO_WriteLow
                                    199 ;	-----------------------------------------
      00828F                        200 _GPIO_WriteLow:
      00828F 88               [ 1]  201 	push	a
                                    202 ;	lib/src/stm8s_gpio.c: 169: GPIOx->ODR &= (uint8_t)(~PortPins);
      008290 1E 04            [ 2]  203 	ldw	x, (0x04, sp)
      008292 F6               [ 1]  204 	ld	a, (x)
      008293 6B 01            [ 1]  205 	ld	(0x01, sp), a
      008295 7B 06            [ 1]  206 	ld	a, (0x06, sp)
      008297 43               [ 1]  207 	cpl	a
      008298 14 01            [ 1]  208 	and	a, (0x01, sp)
      00829A F7               [ 1]  209 	ld	(x), a
      00829B 84               [ 1]  210 	pop	a
      00829C 81               [ 4]  211 	ret
                                    212 ;	lib/src/stm8s_gpio.c: 180: void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    213 ;	-----------------------------------------
                                    214 ;	 function GPIO_WriteReverse
                                    215 ;	-----------------------------------------
      00829D                        216 _GPIO_WriteReverse:
                                    217 ;	lib/src/stm8s_gpio.c: 182: GPIOx->ODR ^= (uint8_t)PortPins;
      00829D 1E 03            [ 2]  218 	ldw	x, (0x03, sp)
      00829F F6               [ 1]  219 	ld	a, (x)
      0082A0 18 05            [ 1]  220 	xor	a, (0x05, sp)
      0082A2 F7               [ 1]  221 	ld	(x), a
      0082A3 81               [ 4]  222 	ret
                                    223 ;	lib/src/stm8s_gpio.c: 191: uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
                                    224 ;	-----------------------------------------
                                    225 ;	 function GPIO_ReadOutputData
                                    226 ;	-----------------------------------------
      0082A4                        227 _GPIO_ReadOutputData:
                                    228 ;	lib/src/stm8s_gpio.c: 193: return ((uint8_t)GPIOx->ODR);
      0082A4 1E 03            [ 2]  229 	ldw	x, (0x03, sp)
      0082A6 F6               [ 1]  230 	ld	a, (x)
      0082A7 81               [ 4]  231 	ret
                                    232 ;	lib/src/stm8s_gpio.c: 202: uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
                                    233 ;	-----------------------------------------
                                    234 ;	 function GPIO_ReadInputData
                                    235 ;	-----------------------------------------
      0082A8                        236 _GPIO_ReadInputData:
                                    237 ;	lib/src/stm8s_gpio.c: 204: return ((uint8_t)GPIOx->IDR);
      0082A8 1E 03            [ 2]  238 	ldw	x, (0x03, sp)
      0082AA E6 01            [ 1]  239 	ld	a, (0x1, x)
      0082AC 81               [ 4]  240 	ret
                                    241 ;	lib/src/stm8s_gpio.c: 213: BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
                                    242 ;	-----------------------------------------
                                    243 ;	 function GPIO_ReadInputPin
                                    244 ;	-----------------------------------------
      0082AD                        245 _GPIO_ReadInputPin:
                                    246 ;	lib/src/stm8s_gpio.c: 215: return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
      0082AD 1E 03            [ 2]  247 	ldw	x, (0x03, sp)
      0082AF E6 01            [ 1]  248 	ld	a, (0x1, x)
      0082B1 14 05            [ 1]  249 	and	a, (0x05, sp)
      0082B3 81               [ 4]  250 	ret
                                    251 ;	lib/src/stm8s_gpio.c: 225: void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
                                    252 ;	-----------------------------------------
                                    253 ;	 function GPIO_ExternalPullUpConfig
                                    254 ;	-----------------------------------------
      0082B4                        255 _GPIO_ExternalPullUpConfig:
      0082B4 88               [ 1]  256 	push	a
                                    257 ;	lib/src/stm8s_gpio.c: 233: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      0082B5 1E 04            [ 2]  258 	ldw	x, (0x04, sp)
      0082B7 1C 00 03         [ 2]  259 	addw	x, #0x0003
                                    260 ;	lib/src/stm8s_gpio.c: 231: if (NewState != DISABLE) /* External Pull-Up Set*/
      0082BA 0D 07            [ 1]  261 	tnz	(0x07, sp)
      0082BC 27 06            [ 1]  262 	jreq	00102$
                                    263 ;	lib/src/stm8s_gpio.c: 233: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      0082BE F6               [ 1]  264 	ld	a, (x)
      0082BF 1A 06            [ 1]  265 	or	a, (0x06, sp)
      0082C1 F7               [ 1]  266 	ld	(x), a
      0082C2 20 09            [ 2]  267 	jra	00104$
      0082C4                        268 00102$:
                                    269 ;	lib/src/stm8s_gpio.c: 236: GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
      0082C4 F6               [ 1]  270 	ld	a, (x)
      0082C5 6B 01            [ 1]  271 	ld	(0x01, sp), a
      0082C7 7B 06            [ 1]  272 	ld	a, (0x06, sp)
      0082C9 43               [ 1]  273 	cpl	a
      0082CA 14 01            [ 1]  274 	and	a, (0x01, sp)
      0082CC F7               [ 1]  275 	ld	(x), a
      0082CD                        276 00104$:
      0082CD 84               [ 1]  277 	pop	a
      0082CE 81               [ 4]  278 	ret
                                    279 	.area CODE
                                    280 	.area INITIALIZER
                                    281 	.area CABS (ABS)
