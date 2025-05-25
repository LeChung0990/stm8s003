                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.3.0 #14184 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_exti
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _EXTI_DeInit
                                     12 	.globl _EXTI_SetExtIntSensitivity
                                     13 	.globl _EXTI_SetTLISensitivity
                                     14 	.globl _EXTI_GetExtIntSensitivity
                                     15 	.globl _EXTI_GetTLISensitivity
                                     16 ;--------------------------------------------------------
                                     17 ; ram data
                                     18 ;--------------------------------------------------------
                                     19 	.area DATA
                                     20 ;--------------------------------------------------------
                                     21 ; ram data
                                     22 ;--------------------------------------------------------
                                     23 	.area INITIALIZED
                                     24 ;--------------------------------------------------------
                                     25 ; absolute external ram data
                                     26 ;--------------------------------------------------------
                                     27 	.area DABS (ABS)
                                     28 
                                     29 ; default segment ordering for linker
                                     30 	.area HOME
                                     31 	.area GSINIT
                                     32 	.area GSFINAL
                                     33 	.area CONST
                                     34 	.area INITIALIZER
                                     35 	.area CODE
                                     36 
                                     37 ;--------------------------------------------------------
                                     38 ; global & static initialisations
                                     39 ;--------------------------------------------------------
                                     40 	.area HOME
                                     41 	.area GSINIT
                                     42 	.area GSFINAL
                                     43 	.area GSINIT
                                     44 ;--------------------------------------------------------
                                     45 ; Home
                                     46 ;--------------------------------------------------------
                                     47 	.area HOME
                                     48 	.area HOME
                                     49 ;--------------------------------------------------------
                                     50 ; code
                                     51 ;--------------------------------------------------------
                                     52 	.area CODE
                                     53 ;	lib/src/stm8s_exti.c: 53: void EXTI_DeInit(void)
                                     54 ;	-----------------------------------------
                                     55 ;	 function EXTI_DeInit
                                     56 ;	-----------------------------------------
      009AD8                         57 _EXTI_DeInit:
                                     58 ;	lib/src/stm8s_exti.c: 55: EXTI->CR1 = EXTI_CR1_RESET_VALUE;
      009AD8 35 00 50 A0      [ 1]   59 	mov	0x50a0+0, #0x00
                                     60 ;	lib/src/stm8s_exti.c: 56: EXTI->CR2 = EXTI_CR2_RESET_VALUE;
      009ADC 35 00 50 A1      [ 1]   61 	mov	0x50a1+0, #0x00
                                     62 ;	lib/src/stm8s_exti.c: 57: }
      009AE0 81               [ 4]   63 	ret
                                     64 ;	lib/src/stm8s_exti.c: 70: void EXTI_SetExtIntSensitivity(EXTI_Port_TypeDef Port, EXTI_Sensitivity_TypeDef SensitivityValue)
                                     65 ;	-----------------------------------------
                                     66 ;	 function EXTI_SetExtIntSensitivity
                                     67 ;	-----------------------------------------
      009AE1                         68 _EXTI_SetExtIntSensitivity:
      009AE1 88               [ 1]   69 	push	a
                                     70 ;	lib/src/stm8s_exti.c: 77: switch (Port)
      009AE2 A1 04            [ 1]   71 	cp	a, #0x04
      009AE4 23 03            [ 2]   72 	jrule	00115$
      009AE6 CC 9B 6B         [ 2]   73 	jp	00108$
      009AE9                         74 00115$:
                                     75 ;	lib/src/stm8s_exti.c: 85: EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
      009AE9 61               [ 1]   76 	exg	a, yl
      009AEA 7B 04            [ 1]   77 	ld	a, (0x04, sp)
      009AEC 61               [ 1]   78 	exg	a, yl
                                     79 ;	lib/src/stm8s_exti.c: 77: switch (Port)
      009AED 5F               [ 1]   80 	clrw	x
      009AEE 97               [ 1]   81 	ld	xl, a
      009AEF 58               [ 2]   82 	sllw	x
      009AF0 DE 9A F4         [ 2]   83 	ldw	x, (#00116$, x)
      009AF3 FC               [ 2]   84 	jp	(x)
      009AF4                         85 00116$:
      009AF4 9A FE                   86 	.dw	#00101$
      009AF6 9B 10                   87 	.dw	#00102$
      009AF8 9B 27                   88 	.dw	#00103$
      009AFA 9B 40                   89 	.dw	#00104$
      009AFC 9B 5B                   90 	.dw	#00105$
                                     91 ;	lib/src/stm8s_exti.c: 79: case EXTI_PORT_GPIOA:
      009AFE                         92 00101$:
                                     93 ;	lib/src/stm8s_exti.c: 80: EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PAIS);
      009AFE C6 50 A0         [ 1]   94 	ld	a, 0x50a0
      009B01 A4 FC            [ 1]   95 	and	a, #0xfc
      009B03 C7 50 A0         [ 1]   96 	ld	0x50a0, a
                                     97 ;	lib/src/stm8s_exti.c: 81: EXTI->CR1 |= (uint8_t)(SensitivityValue);
      009B06 C6 50 A0         [ 1]   98 	ld	a, 0x50a0
      009B09 1A 04            [ 1]   99 	or	a, (0x04, sp)
      009B0B C7 50 A0         [ 1]  100 	ld	0x50a0, a
                                    101 ;	lib/src/stm8s_exti.c: 82: break;
      009B0E 20 5B            [ 2]  102 	jra	00108$
                                    103 ;	lib/src/stm8s_exti.c: 83: case EXTI_PORT_GPIOB:
      009B10                        104 00102$:
                                    105 ;	lib/src/stm8s_exti.c: 84: EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PBIS);
      009B10 C6 50 A0         [ 1]  106 	ld	a, 0x50a0
      009B13 A4 F3            [ 1]  107 	and	a, #0xf3
      009B15 C7 50 A0         [ 1]  108 	ld	0x50a0, a
                                    109 ;	lib/src/stm8s_exti.c: 85: EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
      009B18 C6 50 A0         [ 1]  110 	ld	a, 0x50a0
      009B1B 93               [ 1]  111 	ldw	x, y
      009B1C 58               [ 2]  112 	sllw	x
      009B1D 58               [ 2]  113 	sllw	x
      009B1E 89               [ 2]  114 	pushw	x
      009B1F 1A 02            [ 1]  115 	or	a, (2, sp)
      009B21 85               [ 2]  116 	popw	x
      009B22 C7 50 A0         [ 1]  117 	ld	0x50a0, a
                                    118 ;	lib/src/stm8s_exti.c: 86: break;
      009B25 20 44            [ 2]  119 	jra	00108$
                                    120 ;	lib/src/stm8s_exti.c: 87: case EXTI_PORT_GPIOC:
      009B27                        121 00103$:
                                    122 ;	lib/src/stm8s_exti.c: 88: EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PCIS);
      009B27 C6 50 A0         [ 1]  123 	ld	a, 0x50a0
      009B2A A4 CF            [ 1]  124 	and	a, #0xcf
      009B2C C7 50 A0         [ 1]  125 	ld	0x50a0, a
                                    126 ;	lib/src/stm8s_exti.c: 89: EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 4);
      009B2F C6 50 A0         [ 1]  127 	ld	a, 0x50a0
      009B32 6B 01            [ 1]  128 	ld	(0x01, sp), a
      009B34 90 9F            [ 1]  129 	ld	a, yl
      009B36 4E               [ 1]  130 	swap	a
      009B37 A4 F0            [ 1]  131 	and	a, #0xf0
      009B39 1A 01            [ 1]  132 	or	a, (0x01, sp)
      009B3B C7 50 A0         [ 1]  133 	ld	0x50a0, a
                                    134 ;	lib/src/stm8s_exti.c: 90: break;
      009B3E 20 2B            [ 2]  135 	jra	00108$
                                    136 ;	lib/src/stm8s_exti.c: 91: case EXTI_PORT_GPIOD:
      009B40                        137 00104$:
                                    138 ;	lib/src/stm8s_exti.c: 92: EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS);
      009B40 C6 50 A0         [ 1]  139 	ld	a, 0x50a0
      009B43 A4 3F            [ 1]  140 	and	a, #0x3f
      009B45 C7 50 A0         [ 1]  141 	ld	0x50a0, a
                                    142 ;	lib/src/stm8s_exti.c: 93: EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 6);
      009B48 C6 50 A0         [ 1]  143 	ld	a, 0x50a0
      009B4B 6B 01            [ 1]  144 	ld	(0x01, sp), a
      009B4D 90 9F            [ 1]  145 	ld	a, yl
      009B4F 4E               [ 1]  146 	swap	a
      009B50 A4 F0            [ 1]  147 	and	a, #0xf0
      009B52 48               [ 1]  148 	sll	a
      009B53 48               [ 1]  149 	sll	a
      009B54 1A 01            [ 1]  150 	or	a, (0x01, sp)
      009B56 C7 50 A0         [ 1]  151 	ld	0x50a0, a
                                    152 ;	lib/src/stm8s_exti.c: 94: break;
      009B59 20 10            [ 2]  153 	jra	00108$
                                    154 ;	lib/src/stm8s_exti.c: 95: case EXTI_PORT_GPIOE:
      009B5B                        155 00105$:
                                    156 ;	lib/src/stm8s_exti.c: 96: EXTI->CR2 &= (uint8_t)(~EXTI_CR2_PEIS);
      009B5B C6 50 A1         [ 1]  157 	ld	a, 0x50a1
      009B5E A4 FC            [ 1]  158 	and	a, #0xfc
      009B60 C7 50 A1         [ 1]  159 	ld	0x50a1, a
                                    160 ;	lib/src/stm8s_exti.c: 97: EXTI->CR2 |= (uint8_t)(SensitivityValue);
      009B63 C6 50 A1         [ 1]  161 	ld	a, 0x50a1
      009B66 1A 04            [ 1]  162 	or	a, (0x04, sp)
      009B68 C7 50 A1         [ 1]  163 	ld	0x50a1, a
                                    164 ;	lib/src/stm8s_exti.c: 101: }
      009B6B                        165 00108$:
                                    166 ;	lib/src/stm8s_exti.c: 102: }
      009B6B 84               [ 1]  167 	pop	a
      009B6C 85               [ 2]  168 	popw	x
      009B6D 84               [ 1]  169 	pop	a
      009B6E FC               [ 2]  170 	jp	(x)
                                    171 ;	lib/src/stm8s_exti.c: 111: void EXTI_SetTLISensitivity(EXTI_TLISensitivity_TypeDef SensitivityValue)
                                    172 ;	-----------------------------------------
                                    173 ;	 function EXTI_SetTLISensitivity
                                    174 ;	-----------------------------------------
      009B6F                        175 _EXTI_SetTLISensitivity:
      009B6F 88               [ 1]  176 	push	a
      009B70 6B 01            [ 1]  177 	ld	(0x01, sp), a
                                    178 ;	lib/src/stm8s_exti.c: 117: EXTI->CR2 &= (uint8_t)(~EXTI_CR2_TLIS);
      009B72 C6 50 A1         [ 1]  179 	ld	a, 0x50a1
      009B75 A4 FB            [ 1]  180 	and	a, #0xfb
      009B77 C7 50 A1         [ 1]  181 	ld	0x50a1, a
                                    182 ;	lib/src/stm8s_exti.c: 118: EXTI->CR2 |= (uint8_t)(SensitivityValue);
      009B7A C6 50 A1         [ 1]  183 	ld	a, 0x50a1
      009B7D 1A 01            [ 1]  184 	or	a, (0x01, sp)
      009B7F C7 50 A1         [ 1]  185 	ld	0x50a1, a
                                    186 ;	lib/src/stm8s_exti.c: 119: }
      009B82 84               [ 1]  187 	pop	a
      009B83 81               [ 4]  188 	ret
                                    189 ;	lib/src/stm8s_exti.c: 126: EXTI_Sensitivity_TypeDef EXTI_GetExtIntSensitivity(EXTI_Port_TypeDef Port)
                                    190 ;	-----------------------------------------
                                    191 ;	 function EXTI_GetExtIntSensitivity
                                    192 ;	-----------------------------------------
      009B84                        193 _EXTI_GetExtIntSensitivity:
      009B84 97               [ 1]  194 	ld	xl, a
                                    195 ;	lib/src/stm8s_exti.c: 128: uint8_t value = 0;
      009B85 4F               [ 1]  196 	clr	a
                                    197 ;	lib/src/stm8s_exti.c: 133: switch (Port)
      009B86 88               [ 1]  198 	push	a
      009B87 9F               [ 1]  199 	ld	a, xl
      009B88 A1 04            [ 1]  200 	cp	a, #0x04
      009B8A 84               [ 1]  201 	pop	a
      009B8B 23 01            [ 2]  202 	jrule	00115$
      009B8D 81               [ 4]  203 	ret
      009B8E                        204 00115$:
      009B8E 4F               [ 1]  205 	clr	a
      009B8F 95               [ 1]  206 	ld	xh, a
      009B90 58               [ 2]  207 	sllw	x
      009B91 DE 9B 95         [ 2]  208 	ldw	x, (#00116$, x)
      009B94 FC               [ 2]  209 	jp	(x)
      009B95                        210 00116$:
      009B95 9B 9F                  211 	.dw	#00101$
      009B97 9B A5                  212 	.dw	#00102$
      009B99 9B AD                  213 	.dw	#00103$
      009B9B 9B B6                  214 	.dw	#00104$
      009B9D 9B C1                  215 	.dw	#00105$
                                    216 ;	lib/src/stm8s_exti.c: 135: case EXTI_PORT_GPIOA:
      009B9F                        217 00101$:
                                    218 ;	lib/src/stm8s_exti.c: 136: value = (uint8_t)(EXTI->CR1 & EXTI_CR1_PAIS);
      009B9F C6 50 A0         [ 1]  219 	ld	a, 0x50a0
      009BA2 A4 03            [ 1]  220 	and	a, #0x03
                                    221 ;	lib/src/stm8s_exti.c: 137: break;
      009BA4 81               [ 4]  222 	ret
                                    223 ;	lib/src/stm8s_exti.c: 138: case EXTI_PORT_GPIOB:
      009BA5                        224 00102$:
                                    225 ;	lib/src/stm8s_exti.c: 139: value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PBIS) >> 2);
      009BA5 C6 50 A0         [ 1]  226 	ld	a, 0x50a0
      009BA8 A4 0C            [ 1]  227 	and	a, #0x0c
      009BAA 44               [ 1]  228 	srl	a
      009BAB 44               [ 1]  229 	srl	a
                                    230 ;	lib/src/stm8s_exti.c: 140: break;
      009BAC 81               [ 4]  231 	ret
                                    232 ;	lib/src/stm8s_exti.c: 141: case EXTI_PORT_GPIOC:
      009BAD                        233 00103$:
                                    234 ;	lib/src/stm8s_exti.c: 142: value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PCIS) >> 4);
      009BAD C6 50 A0         [ 1]  235 	ld	a, 0x50a0
      009BB0 A4 30            [ 1]  236 	and	a, #0x30
      009BB2 4E               [ 1]  237 	swap	a
      009BB3 A4 0F            [ 1]  238 	and	a, #0x0f
                                    239 ;	lib/src/stm8s_exti.c: 143: break;
      009BB5 81               [ 4]  240 	ret
                                    241 ;	lib/src/stm8s_exti.c: 144: case EXTI_PORT_GPIOD:
      009BB6                        242 00104$:
                                    243 ;	lib/src/stm8s_exti.c: 145: value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PDIS) >> 6);
      009BB6 C6 50 A0         [ 1]  244 	ld	a, 0x50a0
      009BB9 A4 C0            [ 1]  245 	and	a, #0xc0
      009BBB 4E               [ 1]  246 	swap	a
      009BBC A4 0F            [ 1]  247 	and	a, #0x0f
      009BBE 44               [ 1]  248 	srl	a
      009BBF 44               [ 1]  249 	srl	a
                                    250 ;	lib/src/stm8s_exti.c: 146: break;
      009BC0 81               [ 4]  251 	ret
                                    252 ;	lib/src/stm8s_exti.c: 147: case EXTI_PORT_GPIOE:
      009BC1                        253 00105$:
                                    254 ;	lib/src/stm8s_exti.c: 148: value = (uint8_t)(EXTI->CR2 & EXTI_CR2_PEIS);
      009BC1 C6 50 A1         [ 1]  255 	ld	a, 0x50a1
      009BC4 A4 03            [ 1]  256 	and	a, #0x03
                                    257 ;	lib/src/stm8s_exti.c: 152: }
                                    258 ;	lib/src/stm8s_exti.c: 154: return((EXTI_Sensitivity_TypeDef)value);
                                    259 ;	lib/src/stm8s_exti.c: 155: }
      009BC6 81               [ 4]  260 	ret
                                    261 ;	lib/src/stm8s_exti.c: 162: EXTI_TLISensitivity_TypeDef EXTI_GetTLISensitivity(void)
                                    262 ;	-----------------------------------------
                                    263 ;	 function EXTI_GetTLISensitivity
                                    264 ;	-----------------------------------------
      009BC7                        265 _EXTI_GetTLISensitivity:
                                    266 ;	lib/src/stm8s_exti.c: 167: value = (uint8_t)(EXTI->CR2 & EXTI_CR2_TLIS);
      009BC7 C6 50 A1         [ 1]  267 	ld	a, 0x50a1
      009BCA A4 04            [ 1]  268 	and	a, #0x04
                                    269 ;	lib/src/stm8s_exti.c: 169: return((EXTI_TLISensitivity_TypeDef)value);
                                    270 ;	lib/src/stm8s_exti.c: 170: }
      009BCC 81               [ 4]  271 	ret
                                    272 	.area CODE
                                    273 	.area CONST
                                    274 	.area INITIALIZER
                                    275 	.area CABS (ABS)
