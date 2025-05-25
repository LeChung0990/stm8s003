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
      008654                         57 _EXTI_DeInit:
                                     58 ;	lib/src/stm8s_exti.c: 55: EXTI->CR1 = EXTI_CR1_RESET_VALUE;
      008654 35 00 50 A0      [ 1]   59 	mov	0x50a0+0, #0x00
                                     60 ;	lib/src/stm8s_exti.c: 56: EXTI->CR2 = EXTI_CR2_RESET_VALUE;
      008658 35 00 50 A1      [ 1]   61 	mov	0x50a1+0, #0x00
                                     62 ;	lib/src/stm8s_exti.c: 57: }
      00865C 81               [ 4]   63 	ret
                                     64 ;	lib/src/stm8s_exti.c: 70: void EXTI_SetExtIntSensitivity(EXTI_Port_TypeDef Port, EXTI_Sensitivity_TypeDef SensitivityValue)
                                     65 ;	-----------------------------------------
                                     66 ;	 function EXTI_SetExtIntSensitivity
                                     67 ;	-----------------------------------------
      00865D                         68 _EXTI_SetExtIntSensitivity:
      00865D 88               [ 1]   69 	push	a
                                     70 ;	lib/src/stm8s_exti.c: 77: switch (Port)
      00865E A1 04            [ 1]   71 	cp	a, #0x04
      008660 23 03            [ 2]   72 	jrule	00115$
      008662 CC 86 E7         [ 2]   73 	jp	00108$
      008665                         74 00115$:
                                     75 ;	lib/src/stm8s_exti.c: 85: EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
      008665 61               [ 1]   76 	exg	a, yl
      008666 7B 04            [ 1]   77 	ld	a, (0x04, sp)
      008668 61               [ 1]   78 	exg	a, yl
                                     79 ;	lib/src/stm8s_exti.c: 77: switch (Port)
      008669 5F               [ 1]   80 	clrw	x
      00866A 97               [ 1]   81 	ld	xl, a
      00866B 58               [ 2]   82 	sllw	x
      00866C DE 86 70         [ 2]   83 	ldw	x, (#00116$, x)
      00866F FC               [ 2]   84 	jp	(x)
      008670                         85 00116$:
      008670 86 7A                   86 	.dw	#00101$
      008672 86 8C                   87 	.dw	#00102$
      008674 86 A3                   88 	.dw	#00103$
      008676 86 BC                   89 	.dw	#00104$
      008678 86 D7                   90 	.dw	#00105$
                                     91 ;	lib/src/stm8s_exti.c: 79: case EXTI_PORT_GPIOA:
      00867A                         92 00101$:
                                     93 ;	lib/src/stm8s_exti.c: 80: EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PAIS);
      00867A C6 50 A0         [ 1]   94 	ld	a, 0x50a0
      00867D A4 FC            [ 1]   95 	and	a, #0xfc
      00867F C7 50 A0         [ 1]   96 	ld	0x50a0, a
                                     97 ;	lib/src/stm8s_exti.c: 81: EXTI->CR1 |= (uint8_t)(SensitivityValue);
      008682 C6 50 A0         [ 1]   98 	ld	a, 0x50a0
      008685 1A 04            [ 1]   99 	or	a, (0x04, sp)
      008687 C7 50 A0         [ 1]  100 	ld	0x50a0, a
                                    101 ;	lib/src/stm8s_exti.c: 82: break;
      00868A 20 5B            [ 2]  102 	jra	00108$
                                    103 ;	lib/src/stm8s_exti.c: 83: case EXTI_PORT_GPIOB:
      00868C                        104 00102$:
                                    105 ;	lib/src/stm8s_exti.c: 84: EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PBIS);
      00868C C6 50 A0         [ 1]  106 	ld	a, 0x50a0
      00868F A4 F3            [ 1]  107 	and	a, #0xf3
      008691 C7 50 A0         [ 1]  108 	ld	0x50a0, a
                                    109 ;	lib/src/stm8s_exti.c: 85: EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
      008694 C6 50 A0         [ 1]  110 	ld	a, 0x50a0
      008697 93               [ 1]  111 	ldw	x, y
      008698 58               [ 2]  112 	sllw	x
      008699 58               [ 2]  113 	sllw	x
      00869A 89               [ 2]  114 	pushw	x
      00869B 1A 02            [ 1]  115 	or	a, (2, sp)
      00869D 85               [ 2]  116 	popw	x
      00869E C7 50 A0         [ 1]  117 	ld	0x50a0, a
                                    118 ;	lib/src/stm8s_exti.c: 86: break;
      0086A1 20 44            [ 2]  119 	jra	00108$
                                    120 ;	lib/src/stm8s_exti.c: 87: case EXTI_PORT_GPIOC:
      0086A3                        121 00103$:
                                    122 ;	lib/src/stm8s_exti.c: 88: EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PCIS);
      0086A3 C6 50 A0         [ 1]  123 	ld	a, 0x50a0
      0086A6 A4 CF            [ 1]  124 	and	a, #0xcf
      0086A8 C7 50 A0         [ 1]  125 	ld	0x50a0, a
                                    126 ;	lib/src/stm8s_exti.c: 89: EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 4);
      0086AB C6 50 A0         [ 1]  127 	ld	a, 0x50a0
      0086AE 6B 01            [ 1]  128 	ld	(0x01, sp), a
      0086B0 90 9F            [ 1]  129 	ld	a, yl
      0086B2 4E               [ 1]  130 	swap	a
      0086B3 A4 F0            [ 1]  131 	and	a, #0xf0
      0086B5 1A 01            [ 1]  132 	or	a, (0x01, sp)
      0086B7 C7 50 A0         [ 1]  133 	ld	0x50a0, a
                                    134 ;	lib/src/stm8s_exti.c: 90: break;
      0086BA 20 2B            [ 2]  135 	jra	00108$
                                    136 ;	lib/src/stm8s_exti.c: 91: case EXTI_PORT_GPIOD:
      0086BC                        137 00104$:
                                    138 ;	lib/src/stm8s_exti.c: 92: EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS);
      0086BC C6 50 A0         [ 1]  139 	ld	a, 0x50a0
      0086BF A4 3F            [ 1]  140 	and	a, #0x3f
      0086C1 C7 50 A0         [ 1]  141 	ld	0x50a0, a
                                    142 ;	lib/src/stm8s_exti.c: 93: EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 6);
      0086C4 C6 50 A0         [ 1]  143 	ld	a, 0x50a0
      0086C7 6B 01            [ 1]  144 	ld	(0x01, sp), a
      0086C9 90 9F            [ 1]  145 	ld	a, yl
      0086CB 4E               [ 1]  146 	swap	a
      0086CC A4 F0            [ 1]  147 	and	a, #0xf0
      0086CE 48               [ 1]  148 	sll	a
      0086CF 48               [ 1]  149 	sll	a
      0086D0 1A 01            [ 1]  150 	or	a, (0x01, sp)
      0086D2 C7 50 A0         [ 1]  151 	ld	0x50a0, a
                                    152 ;	lib/src/stm8s_exti.c: 94: break;
      0086D5 20 10            [ 2]  153 	jra	00108$
                                    154 ;	lib/src/stm8s_exti.c: 95: case EXTI_PORT_GPIOE:
      0086D7                        155 00105$:
                                    156 ;	lib/src/stm8s_exti.c: 96: EXTI->CR2 &= (uint8_t)(~EXTI_CR2_PEIS);
      0086D7 C6 50 A1         [ 1]  157 	ld	a, 0x50a1
      0086DA A4 FC            [ 1]  158 	and	a, #0xfc
      0086DC C7 50 A1         [ 1]  159 	ld	0x50a1, a
                                    160 ;	lib/src/stm8s_exti.c: 97: EXTI->CR2 |= (uint8_t)(SensitivityValue);
      0086DF C6 50 A1         [ 1]  161 	ld	a, 0x50a1
      0086E2 1A 04            [ 1]  162 	or	a, (0x04, sp)
      0086E4 C7 50 A1         [ 1]  163 	ld	0x50a1, a
                                    164 ;	lib/src/stm8s_exti.c: 101: }
      0086E7                        165 00108$:
                                    166 ;	lib/src/stm8s_exti.c: 102: }
      0086E7 84               [ 1]  167 	pop	a
      0086E8 85               [ 2]  168 	popw	x
      0086E9 84               [ 1]  169 	pop	a
      0086EA FC               [ 2]  170 	jp	(x)
                                    171 ;	lib/src/stm8s_exti.c: 111: void EXTI_SetTLISensitivity(EXTI_TLISensitivity_TypeDef SensitivityValue)
                                    172 ;	-----------------------------------------
                                    173 ;	 function EXTI_SetTLISensitivity
                                    174 ;	-----------------------------------------
      0086EB                        175 _EXTI_SetTLISensitivity:
      0086EB 88               [ 1]  176 	push	a
      0086EC 6B 01            [ 1]  177 	ld	(0x01, sp), a
                                    178 ;	lib/src/stm8s_exti.c: 117: EXTI->CR2 &= (uint8_t)(~EXTI_CR2_TLIS);
      0086EE C6 50 A1         [ 1]  179 	ld	a, 0x50a1
      0086F1 A4 FB            [ 1]  180 	and	a, #0xfb
      0086F3 C7 50 A1         [ 1]  181 	ld	0x50a1, a
                                    182 ;	lib/src/stm8s_exti.c: 118: EXTI->CR2 |= (uint8_t)(SensitivityValue);
      0086F6 C6 50 A1         [ 1]  183 	ld	a, 0x50a1
      0086F9 1A 01            [ 1]  184 	or	a, (0x01, sp)
      0086FB C7 50 A1         [ 1]  185 	ld	0x50a1, a
                                    186 ;	lib/src/stm8s_exti.c: 119: }
      0086FE 84               [ 1]  187 	pop	a
      0086FF 81               [ 4]  188 	ret
                                    189 ;	lib/src/stm8s_exti.c: 126: EXTI_Sensitivity_TypeDef EXTI_GetExtIntSensitivity(EXTI_Port_TypeDef Port)
                                    190 ;	-----------------------------------------
                                    191 ;	 function EXTI_GetExtIntSensitivity
                                    192 ;	-----------------------------------------
      008700                        193 _EXTI_GetExtIntSensitivity:
      008700 97               [ 1]  194 	ld	xl, a
                                    195 ;	lib/src/stm8s_exti.c: 128: uint8_t value = 0;
      008701 4F               [ 1]  196 	clr	a
                                    197 ;	lib/src/stm8s_exti.c: 133: switch (Port)
      008702 88               [ 1]  198 	push	a
      008703 9F               [ 1]  199 	ld	a, xl
      008704 A1 04            [ 1]  200 	cp	a, #0x04
      008706 84               [ 1]  201 	pop	a
      008707 23 01            [ 2]  202 	jrule	00115$
      008709 81               [ 4]  203 	ret
      00870A                        204 00115$:
      00870A 4F               [ 1]  205 	clr	a
      00870B 95               [ 1]  206 	ld	xh, a
      00870C 58               [ 2]  207 	sllw	x
      00870D DE 87 11         [ 2]  208 	ldw	x, (#00116$, x)
      008710 FC               [ 2]  209 	jp	(x)
      008711                        210 00116$:
      008711 87 1B                  211 	.dw	#00101$
      008713 87 21                  212 	.dw	#00102$
      008715 87 29                  213 	.dw	#00103$
      008717 87 32                  214 	.dw	#00104$
      008719 87 3D                  215 	.dw	#00105$
                                    216 ;	lib/src/stm8s_exti.c: 135: case EXTI_PORT_GPIOA:
      00871B                        217 00101$:
                                    218 ;	lib/src/stm8s_exti.c: 136: value = (uint8_t)(EXTI->CR1 & EXTI_CR1_PAIS);
      00871B C6 50 A0         [ 1]  219 	ld	a, 0x50a0
      00871E A4 03            [ 1]  220 	and	a, #0x03
                                    221 ;	lib/src/stm8s_exti.c: 137: break;
      008720 81               [ 4]  222 	ret
                                    223 ;	lib/src/stm8s_exti.c: 138: case EXTI_PORT_GPIOB:
      008721                        224 00102$:
                                    225 ;	lib/src/stm8s_exti.c: 139: value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PBIS) >> 2);
      008721 C6 50 A0         [ 1]  226 	ld	a, 0x50a0
      008724 A4 0C            [ 1]  227 	and	a, #0x0c
      008726 44               [ 1]  228 	srl	a
      008727 44               [ 1]  229 	srl	a
                                    230 ;	lib/src/stm8s_exti.c: 140: break;
      008728 81               [ 4]  231 	ret
                                    232 ;	lib/src/stm8s_exti.c: 141: case EXTI_PORT_GPIOC:
      008729                        233 00103$:
                                    234 ;	lib/src/stm8s_exti.c: 142: value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PCIS) >> 4);
      008729 C6 50 A0         [ 1]  235 	ld	a, 0x50a0
      00872C A4 30            [ 1]  236 	and	a, #0x30
      00872E 4E               [ 1]  237 	swap	a
      00872F A4 0F            [ 1]  238 	and	a, #0x0f
                                    239 ;	lib/src/stm8s_exti.c: 143: break;
      008731 81               [ 4]  240 	ret
                                    241 ;	lib/src/stm8s_exti.c: 144: case EXTI_PORT_GPIOD:
      008732                        242 00104$:
                                    243 ;	lib/src/stm8s_exti.c: 145: value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PDIS) >> 6);
      008732 C6 50 A0         [ 1]  244 	ld	a, 0x50a0
      008735 A4 C0            [ 1]  245 	and	a, #0xc0
      008737 4E               [ 1]  246 	swap	a
      008738 A4 0F            [ 1]  247 	and	a, #0x0f
      00873A 44               [ 1]  248 	srl	a
      00873B 44               [ 1]  249 	srl	a
                                    250 ;	lib/src/stm8s_exti.c: 146: break;
      00873C 81               [ 4]  251 	ret
                                    252 ;	lib/src/stm8s_exti.c: 147: case EXTI_PORT_GPIOE:
      00873D                        253 00105$:
                                    254 ;	lib/src/stm8s_exti.c: 148: value = (uint8_t)(EXTI->CR2 & EXTI_CR2_PEIS);
      00873D C6 50 A1         [ 1]  255 	ld	a, 0x50a1
      008740 A4 03            [ 1]  256 	and	a, #0x03
                                    257 ;	lib/src/stm8s_exti.c: 152: }
                                    258 ;	lib/src/stm8s_exti.c: 154: return((EXTI_Sensitivity_TypeDef)value);
                                    259 ;	lib/src/stm8s_exti.c: 155: }
      008742 81               [ 4]  260 	ret
                                    261 ;	lib/src/stm8s_exti.c: 162: EXTI_TLISensitivity_TypeDef EXTI_GetTLISensitivity(void)
                                    262 ;	-----------------------------------------
                                    263 ;	 function EXTI_GetTLISensitivity
                                    264 ;	-----------------------------------------
      008743                        265 _EXTI_GetTLISensitivity:
                                    266 ;	lib/src/stm8s_exti.c: 167: value = (uint8_t)(EXTI->CR2 & EXTI_CR2_TLIS);
      008743 C6 50 A1         [ 1]  267 	ld	a, 0x50a1
      008746 A4 04            [ 1]  268 	and	a, #0x04
                                    269 ;	lib/src/stm8s_exti.c: 169: return((EXTI_TLISensitivity_TypeDef)value);
                                    270 ;	lib/src/stm8s_exti.c: 170: }
      008748 81               [ 4]  271 	ret
                                    272 	.area CODE
                                    273 	.area CONST
                                    274 	.area INITIALIZER
                                    275 	.area CABS (ABS)
