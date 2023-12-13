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
      008057                         62 _GPIO_DeInit:
      008057 51               [ 1]   63 	exgw	x, y
                                     64 ;	lib/src/stm8s_gpio.c: 55: GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
      008058 90 7F            [ 1]   65 	clr	(y)
                                     66 ;	lib/src/stm8s_gpio.c: 56: GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
      00805A 93               [ 1]   67 	ldw	x, y
      00805B 5C               [ 1]   68 	incw	x
      00805C 5C               [ 1]   69 	incw	x
      00805D 7F               [ 1]   70 	clr	(x)
                                     71 ;	lib/src/stm8s_gpio.c: 57: GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
      00805E 93               [ 1]   72 	ldw	x, y
      00805F 6F 03            [ 1]   73 	clr	(0x0003, x)
                                     74 ;	lib/src/stm8s_gpio.c: 58: GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
      008061 93               [ 1]   75 	ldw	x, y
      008062 6F 04            [ 1]   76 	clr	(0x0004, x)
                                     77 ;	lib/src/stm8s_gpio.c: 59: }
      008064 81               [ 4]   78 	ret
                                     79 ;	lib/src/stm8s_gpio.c: 71: void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
                                     80 ;	-----------------------------------------
                                     81 ;	 function GPIO_Init
                                     82 ;	-----------------------------------------
      008065                         83 _GPIO_Init:
      008065 52 06            [ 2]   84 	sub	sp, #6
      008067 51               [ 1]   85 	exgw	x, y
      008068 6B 06            [ 1]   86 	ld	(0x06, sp), a
                                     87 ;	lib/src/stm8s_gpio.c: 81: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
      00806A 93               [ 1]   88 	ldw	x, y
      00806B 1C 00 04         [ 2]   89 	addw	x, #0x0004
      00806E 1F 01            [ 2]   90 	ldw	(0x01, sp), x
      008070 F6               [ 1]   91 	ld	a, (x)
      008071 88               [ 1]   92 	push	a
      008072 7B 07            [ 1]   93 	ld	a, (0x07, sp)
      008074 43               [ 1]   94 	cpl	a
      008075 6B 04            [ 1]   95 	ld	(0x04, sp), a
      008077 84               [ 1]   96 	pop	a
      008078 14 03            [ 1]   97 	and	a, (0x03, sp)
      00807A 1E 01            [ 2]   98 	ldw	x, (0x01, sp)
      00807C F7               [ 1]   99 	ld	(x), a
                                    100 ;	lib/src/stm8s_gpio.c: 98: GPIOx->DDR |= (uint8_t)GPIO_Pin;
      00807D 93               [ 1]  101 	ldw	x, y
      00807E 5C               [ 1]  102 	incw	x
      00807F 5C               [ 1]  103 	incw	x
      008080 1F 04            [ 2]  104 	ldw	(0x04, sp), x
                                    105 ;	lib/src/stm8s_gpio.c: 87: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
      008082 0D 09            [ 1]  106 	tnz	(0x09, sp)
      008084 2A 1E            [ 1]  107 	jrpl	00105$
                                    108 ;	lib/src/stm8s_gpio.c: 91: GPIOx->ODR |= (uint8_t)GPIO_Pin;
      008086 90 F6            [ 1]  109 	ld	a, (y)
                                    110 ;	lib/src/stm8s_gpio.c: 89: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
      008088 88               [ 1]  111 	push	a
      008089 7B 0A            [ 1]  112 	ld	a, (0x0a, sp)
      00808B A5 10            [ 1]  113 	bcp	a, #0x10
      00808D 84               [ 1]  114 	pop	a
      00808E 27 06            [ 1]  115 	jreq	00102$
                                    116 ;	lib/src/stm8s_gpio.c: 91: GPIOx->ODR |= (uint8_t)GPIO_Pin;
      008090 1A 06            [ 1]  117 	or	a, (0x06, sp)
      008092 90 F7            [ 1]  118 	ld	(y), a
      008094 20 04            [ 2]  119 	jra	00103$
      008096                        120 00102$:
                                    121 ;	lib/src/stm8s_gpio.c: 95: GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
      008096 14 03            [ 1]  122 	and	a, (0x03, sp)
      008098 90 F7            [ 1]  123 	ld	(y), a
      00809A                        124 00103$:
                                    125 ;	lib/src/stm8s_gpio.c: 98: GPIOx->DDR |= (uint8_t)GPIO_Pin;
      00809A 1E 04            [ 2]  126 	ldw	x, (0x04, sp)
      00809C F6               [ 1]  127 	ld	a, (x)
      00809D 1A 06            [ 1]  128 	or	a, (0x06, sp)
      00809F 1E 04            [ 2]  129 	ldw	x, (0x04, sp)
      0080A1 F7               [ 1]  130 	ld	(x), a
      0080A2 20 08            [ 2]  131 	jra	00106$
      0080A4                        132 00105$:
                                    133 ;	lib/src/stm8s_gpio.c: 103: GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
      0080A4 1E 04            [ 2]  134 	ldw	x, (0x04, sp)
      0080A6 F6               [ 1]  135 	ld	a, (x)
      0080A7 14 03            [ 1]  136 	and	a, (0x03, sp)
      0080A9 1E 04            [ 2]  137 	ldw	x, (0x04, sp)
      0080AB F7               [ 1]  138 	ld	(x), a
      0080AC                        139 00106$:
                                    140 ;	lib/src/stm8s_gpio.c: 112: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      0080AC 93               [ 1]  141 	ldw	x, y
      0080AD 1C 00 03         [ 2]  142 	addw	x, #0x0003
      0080B0 F6               [ 1]  143 	ld	a, (x)
                                    144 ;	lib/src/stm8s_gpio.c: 110: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
      0080B1 88               [ 1]  145 	push	a
      0080B2 7B 0A            [ 1]  146 	ld	a, (0x0a, sp)
      0080B4 A5 40            [ 1]  147 	bcp	a, #0x40
      0080B6 84               [ 1]  148 	pop	a
      0080B7 27 05            [ 1]  149 	jreq	00108$
                                    150 ;	lib/src/stm8s_gpio.c: 112: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      0080B9 1A 06            [ 1]  151 	or	a, (0x06, sp)
      0080BB F7               [ 1]  152 	ld	(x), a
      0080BC 20 03            [ 2]  153 	jra	00109$
      0080BE                        154 00108$:
                                    155 ;	lib/src/stm8s_gpio.c: 116: GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
      0080BE 14 03            [ 1]  156 	and	a, (0x03, sp)
      0080C0 F7               [ 1]  157 	ld	(x), a
      0080C1                        158 00109$:
                                    159 ;	lib/src/stm8s_gpio.c: 81: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
      0080C1 1E 01            [ 2]  160 	ldw	x, (0x01, sp)
      0080C3 F6               [ 1]  161 	ld	a, (x)
                                    162 ;	lib/src/stm8s_gpio.c: 123: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
      0080C4 88               [ 1]  163 	push	a
      0080C5 7B 0A            [ 1]  164 	ld	a, (0x0a, sp)
      0080C7 A5 20            [ 1]  165 	bcp	a, #0x20
      0080C9 84               [ 1]  166 	pop	a
      0080CA 27 07            [ 1]  167 	jreq	00111$
                                    168 ;	lib/src/stm8s_gpio.c: 125: GPIOx->CR2 |= (uint8_t)GPIO_Pin;
      0080CC 1A 06            [ 1]  169 	or	a, (0x06, sp)
      0080CE 1E 01            [ 2]  170 	ldw	x, (0x01, sp)
      0080D0 F7               [ 1]  171 	ld	(x), a
      0080D1 20 05            [ 2]  172 	jra	00113$
      0080D3                        173 00111$:
                                    174 ;	lib/src/stm8s_gpio.c: 129: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
      0080D3 14 03            [ 1]  175 	and	a, (0x03, sp)
      0080D5 1E 01            [ 2]  176 	ldw	x, (0x01, sp)
      0080D7 F7               [ 1]  177 	ld	(x), a
      0080D8                        178 00113$:
                                    179 ;	lib/src/stm8s_gpio.c: 131: }
      0080D8 5B 06            [ 2]  180 	addw	sp, #6
      0080DA 85               [ 2]  181 	popw	x
      0080DB 84               [ 1]  182 	pop	a
      0080DC FC               [ 2]  183 	jp	(x)
                                    184 ;	lib/src/stm8s_gpio.c: 141: void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
                                    185 ;	-----------------------------------------
                                    186 ;	 function GPIO_Write
                                    187 ;	-----------------------------------------
      0080DD                        188 _GPIO_Write:
                                    189 ;	lib/src/stm8s_gpio.c: 143: GPIOx->ODR = PortVal;
      0080DD F7               [ 1]  190 	ld	(x), a
                                    191 ;	lib/src/stm8s_gpio.c: 144: }
      0080DE 81               [ 4]  192 	ret
                                    193 ;	lib/src/stm8s_gpio.c: 154: void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    194 ;	-----------------------------------------
                                    195 ;	 function GPIO_WriteHigh
                                    196 ;	-----------------------------------------
      0080DF                        197 _GPIO_WriteHigh:
      0080DF 88               [ 1]  198 	push	a
      0080E0 6B 01            [ 1]  199 	ld	(0x01, sp), a
                                    200 ;	lib/src/stm8s_gpio.c: 156: GPIOx->ODR |= (uint8_t)PortPins;
      0080E2 F6               [ 1]  201 	ld	a, (x)
      0080E3 1A 01            [ 1]  202 	or	a, (0x01, sp)
      0080E5 F7               [ 1]  203 	ld	(x), a
                                    204 ;	lib/src/stm8s_gpio.c: 157: }
      0080E6 84               [ 1]  205 	pop	a
      0080E7 81               [ 4]  206 	ret
                                    207 ;	lib/src/stm8s_gpio.c: 167: void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    208 ;	-----------------------------------------
                                    209 ;	 function GPIO_WriteLow
                                    210 ;	-----------------------------------------
      0080E8                        211 _GPIO_WriteLow:
      0080E8 88               [ 1]  212 	push	a
                                    213 ;	lib/src/stm8s_gpio.c: 169: GPIOx->ODR &= (uint8_t)(~PortPins);
      0080E9 88               [ 1]  214 	push	a
      0080EA F6               [ 1]  215 	ld	a, (x)
      0080EB 6B 02            [ 1]  216 	ld	(0x02, sp), a
      0080ED 84               [ 1]  217 	pop	a
      0080EE 43               [ 1]  218 	cpl	a
      0080EF 14 01            [ 1]  219 	and	a, (0x01, sp)
      0080F1 F7               [ 1]  220 	ld	(x), a
                                    221 ;	lib/src/stm8s_gpio.c: 170: }
      0080F2 84               [ 1]  222 	pop	a
      0080F3 81               [ 4]  223 	ret
                                    224 ;	lib/src/stm8s_gpio.c: 180: void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    225 ;	-----------------------------------------
                                    226 ;	 function GPIO_WriteReverse
                                    227 ;	-----------------------------------------
      0080F4                        228 _GPIO_WriteReverse:
      0080F4 88               [ 1]  229 	push	a
      0080F5 6B 01            [ 1]  230 	ld	(0x01, sp), a
                                    231 ;	lib/src/stm8s_gpio.c: 182: GPIOx->ODR ^= (uint8_t)PortPins;
      0080F7 F6               [ 1]  232 	ld	a, (x)
      0080F8 18 01            [ 1]  233 	xor	a, (0x01, sp)
      0080FA F7               [ 1]  234 	ld	(x), a
                                    235 ;	lib/src/stm8s_gpio.c: 183: }
      0080FB 84               [ 1]  236 	pop	a
      0080FC 81               [ 4]  237 	ret
                                    238 ;	lib/src/stm8s_gpio.c: 191: uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
                                    239 ;	-----------------------------------------
                                    240 ;	 function GPIO_ReadOutputData
                                    241 ;	-----------------------------------------
      0080FD                        242 _GPIO_ReadOutputData:
                                    243 ;	lib/src/stm8s_gpio.c: 193: return ((uint8_t)GPIOx->ODR);
      0080FD F6               [ 1]  244 	ld	a, (x)
                                    245 ;	lib/src/stm8s_gpio.c: 194: }
      0080FE 81               [ 4]  246 	ret
                                    247 ;	lib/src/stm8s_gpio.c: 202: uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
                                    248 ;	-----------------------------------------
                                    249 ;	 function GPIO_ReadInputData
                                    250 ;	-----------------------------------------
      0080FF                        251 _GPIO_ReadInputData:
                                    252 ;	lib/src/stm8s_gpio.c: 204: return ((uint8_t)GPIOx->IDR);
      0080FF E6 01            [ 1]  253 	ld	a, (0x1, x)
                                    254 ;	lib/src/stm8s_gpio.c: 205: }
      008101 81               [ 4]  255 	ret
                                    256 ;	lib/src/stm8s_gpio.c: 213: BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
                                    257 ;	-----------------------------------------
                                    258 ;	 function GPIO_ReadInputPin
                                    259 ;	-----------------------------------------
      008102                        260 _GPIO_ReadInputPin:
      008102 88               [ 1]  261 	push	a
      008103 6B 01            [ 1]  262 	ld	(0x01, sp), a
                                    263 ;	lib/src/stm8s_gpio.c: 215: return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
      008105 E6 01            [ 1]  264 	ld	a, (0x1, x)
      008107 14 01            [ 1]  265 	and	a, (0x01, sp)
      008109 40               [ 1]  266 	neg	a
      00810A 4F               [ 1]  267 	clr	a
      00810B 49               [ 1]  268 	rlc	a
                                    269 ;	lib/src/stm8s_gpio.c: 216: }
      00810C 5B 01            [ 2]  270 	addw	sp, #1
      00810E 81               [ 4]  271 	ret
                                    272 ;	lib/src/stm8s_gpio.c: 225: void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
                                    273 ;	-----------------------------------------
                                    274 ;	 function GPIO_ExternalPullUpConfig
                                    275 ;	-----------------------------------------
      00810F                        276 _GPIO_ExternalPullUpConfig:
      00810F 88               [ 1]  277 	push	a
                                    278 ;	lib/src/stm8s_gpio.c: 233: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      008110 1C 00 03         [ 2]  279 	addw	x, #0x0003
      008113 88               [ 1]  280 	push	a
      008114 F6               [ 1]  281 	ld	a, (x)
      008115 6B 02            [ 1]  282 	ld	(0x02, sp), a
      008117 84               [ 1]  283 	pop	a
                                    284 ;	lib/src/stm8s_gpio.c: 231: if (NewState != DISABLE) /* External Pull-Up Set*/
      008118 0D 04            [ 1]  285 	tnz	(0x04, sp)
      00811A 27 05            [ 1]  286 	jreq	00102$
                                    287 ;	lib/src/stm8s_gpio.c: 233: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      00811C 1A 01            [ 1]  288 	or	a, (0x01, sp)
      00811E F7               [ 1]  289 	ld	(x), a
      00811F 20 04            [ 2]  290 	jra	00104$
      008121                        291 00102$:
                                    292 ;	lib/src/stm8s_gpio.c: 236: GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
      008121 43               [ 1]  293 	cpl	a
      008122 14 01            [ 1]  294 	and	a, (0x01, sp)
      008124 F7               [ 1]  295 	ld	(x), a
      008125                        296 00104$:
                                    297 ;	lib/src/stm8s_gpio.c: 238: }
      008125 84               [ 1]  298 	pop	a
      008126 85               [ 2]  299 	popw	x
      008127 84               [ 1]  300 	pop	a
      008128 FC               [ 2]  301 	jp	(x)
                                    302 	.area CODE
                                    303 	.area CONST
                                    304 	.area INITIALIZER
                                    305 	.area CABS (ABS)
