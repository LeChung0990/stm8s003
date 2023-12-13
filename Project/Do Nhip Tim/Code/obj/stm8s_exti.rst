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
      008875                         57 _EXTI_DeInit:
                                     58 ;	lib/src/stm8s_exti.c: 55: EXTI->CR1 = EXTI_CR1_RESET_VALUE;
      008875 35 00 50 A0      [ 1]   59 	mov	0x50a0+0, #0x00
                                     60 ;	lib/src/stm8s_exti.c: 56: EXTI->CR2 = EXTI_CR2_RESET_VALUE;
      008879 35 00 50 A1      [ 1]   61 	mov	0x50a1+0, #0x00
                                     62 ;	lib/src/stm8s_exti.c: 57: }
      00887D 81               [ 4]   63 	ret
                                     64 ;	lib/src/stm8s_exti.c: 70: void EXTI_SetExtIntSensitivity(EXTI_Port_TypeDef Port, EXTI_Sensitivity_TypeDef SensitivityValue)
                                     65 ;	-----------------------------------------
                                     66 ;	 function EXTI_SetExtIntSensitivity
                                     67 ;	-----------------------------------------
      00887E                         68 _EXTI_SetExtIntSensitivity:
      00887E 88               [ 1]   69 	push	a
                                     70 ;	lib/src/stm8s_exti.c: 77: switch (Port)
      00887F A1 04            [ 1]   71 	cp	a, #0x04
      008881 23 03            [ 2]   72 	jrule	00115$
      008883 CC 89 08         [ 2]   73 	jp	00108$
      008886                         74 00115$:
                                     75 ;	lib/src/stm8s_exti.c: 85: EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
      008886 61               [ 1]   76 	exg	a, yl
      008887 7B 04            [ 1]   77 	ld	a, (0x04, sp)
      008889 61               [ 1]   78 	exg	a, yl
                                     79 ;	lib/src/stm8s_exti.c: 77: switch (Port)
      00888A 5F               [ 1]   80 	clrw	x
      00888B 97               [ 1]   81 	ld	xl, a
      00888C 58               [ 2]   82 	sllw	x
      00888D DE 88 91         [ 2]   83 	ldw	x, (#00116$, x)
      008890 FC               [ 2]   84 	jp	(x)
      008891                         85 00116$:
      008891 88 9B                   86 	.dw	#00101$
      008893 88 AD                   87 	.dw	#00102$
      008895 88 C4                   88 	.dw	#00103$
      008897 88 DD                   89 	.dw	#00104$
      008899 88 F8                   90 	.dw	#00105$
                                     91 ;	lib/src/stm8s_exti.c: 79: case EXTI_PORT_GPIOA:
      00889B                         92 00101$:
                                     93 ;	lib/src/stm8s_exti.c: 80: EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PAIS);
      00889B C6 50 A0         [ 1]   94 	ld	a, 0x50a0
      00889E A4 FC            [ 1]   95 	and	a, #0xfc
      0088A0 C7 50 A0         [ 1]   96 	ld	0x50a0, a
                                     97 ;	lib/src/stm8s_exti.c: 81: EXTI->CR1 |= (uint8_t)(SensitivityValue);
      0088A3 C6 50 A0         [ 1]   98 	ld	a, 0x50a0
      0088A6 1A 04            [ 1]   99 	or	a, (0x04, sp)
      0088A8 C7 50 A0         [ 1]  100 	ld	0x50a0, a
                                    101 ;	lib/src/stm8s_exti.c: 82: break;
      0088AB 20 5B            [ 2]  102 	jra	00108$
                                    103 ;	lib/src/stm8s_exti.c: 83: case EXTI_PORT_GPIOB:
      0088AD                        104 00102$:
                                    105 ;	lib/src/stm8s_exti.c: 84: EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PBIS);
      0088AD C6 50 A0         [ 1]  106 	ld	a, 0x50a0
      0088B0 A4 F3            [ 1]  107 	and	a, #0xf3
      0088B2 C7 50 A0         [ 1]  108 	ld	0x50a0, a
                                    109 ;	lib/src/stm8s_exti.c: 85: EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
      0088B5 C6 50 A0         [ 1]  110 	ld	a, 0x50a0
      0088B8 93               [ 1]  111 	ldw	x, y
      0088B9 58               [ 2]  112 	sllw	x
      0088BA 58               [ 2]  113 	sllw	x
      0088BB 89               [ 2]  114 	pushw	x
      0088BC 1A 02            [ 1]  115 	or	a, (2, sp)
      0088BE 85               [ 2]  116 	popw	x
      0088BF C7 50 A0         [ 1]  117 	ld	0x50a0, a
                                    118 ;	lib/src/stm8s_exti.c: 86: break;
      0088C2 20 44            [ 2]  119 	jra	00108$
                                    120 ;	lib/src/stm8s_exti.c: 87: case EXTI_PORT_GPIOC:
      0088C4                        121 00103$:
                                    122 ;	lib/src/stm8s_exti.c: 88: EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PCIS);
      0088C4 C6 50 A0         [ 1]  123 	ld	a, 0x50a0
      0088C7 A4 CF            [ 1]  124 	and	a, #0xcf
      0088C9 C7 50 A0         [ 1]  125 	ld	0x50a0, a
                                    126 ;	lib/src/stm8s_exti.c: 89: EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 4);
      0088CC C6 50 A0         [ 1]  127 	ld	a, 0x50a0
      0088CF 6B 01            [ 1]  128 	ld	(0x01, sp), a
      0088D1 90 9F            [ 1]  129 	ld	a, yl
      0088D3 4E               [ 1]  130 	swap	a
      0088D4 A4 F0            [ 1]  131 	and	a, #0xf0
      0088D6 1A 01            [ 1]  132 	or	a, (0x01, sp)
      0088D8 C7 50 A0         [ 1]  133 	ld	0x50a0, a
                                    134 ;	lib/src/stm8s_exti.c: 90: break;
      0088DB 20 2B            [ 2]  135 	jra	00108$
                                    136 ;	lib/src/stm8s_exti.c: 91: case EXTI_PORT_GPIOD:
      0088DD                        137 00104$:
                                    138 ;	lib/src/stm8s_exti.c: 92: EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS);
      0088DD C6 50 A0         [ 1]  139 	ld	a, 0x50a0
      0088E0 A4 3F            [ 1]  140 	and	a, #0x3f
      0088E2 C7 50 A0         [ 1]  141 	ld	0x50a0, a
                                    142 ;	lib/src/stm8s_exti.c: 93: EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 6);
      0088E5 C6 50 A0         [ 1]  143 	ld	a, 0x50a0
      0088E8 6B 01            [ 1]  144 	ld	(0x01, sp), a
      0088EA 90 9F            [ 1]  145 	ld	a, yl
      0088EC 4E               [ 1]  146 	swap	a
      0088ED A4 F0            [ 1]  147 	and	a, #0xf0
      0088EF 48               [ 1]  148 	sll	a
      0088F0 48               [ 1]  149 	sll	a
      0088F1 1A 01            [ 1]  150 	or	a, (0x01, sp)
      0088F3 C7 50 A0         [ 1]  151 	ld	0x50a0, a
                                    152 ;	lib/src/stm8s_exti.c: 94: break;
      0088F6 20 10            [ 2]  153 	jra	00108$
                                    154 ;	lib/src/stm8s_exti.c: 95: case EXTI_PORT_GPIOE:
      0088F8                        155 00105$:
                                    156 ;	lib/src/stm8s_exti.c: 96: EXTI->CR2 &= (uint8_t)(~EXTI_CR2_PEIS);
      0088F8 C6 50 A1         [ 1]  157 	ld	a, 0x50a1
      0088FB A4 FC            [ 1]  158 	and	a, #0xfc
      0088FD C7 50 A1         [ 1]  159 	ld	0x50a1, a
                                    160 ;	lib/src/stm8s_exti.c: 97: EXTI->CR2 |= (uint8_t)(SensitivityValue);
      008900 C6 50 A1         [ 1]  161 	ld	a, 0x50a1
      008903 1A 04            [ 1]  162 	or	a, (0x04, sp)
      008905 C7 50 A1         [ 1]  163 	ld	0x50a1, a
                                    164 ;	lib/src/stm8s_exti.c: 101: }
      008908                        165 00108$:
                                    166 ;	lib/src/stm8s_exti.c: 102: }
      008908 84               [ 1]  167 	pop	a
      008909 85               [ 2]  168 	popw	x
      00890A 84               [ 1]  169 	pop	a
      00890B FC               [ 2]  170 	jp	(x)
                                    171 ;	lib/src/stm8s_exti.c: 111: void EXTI_SetTLISensitivity(EXTI_TLISensitivity_TypeDef SensitivityValue)
                                    172 ;	-----------------------------------------
                                    173 ;	 function EXTI_SetTLISensitivity
                                    174 ;	-----------------------------------------
      00890C                        175 _EXTI_SetTLISensitivity:
      00890C 88               [ 1]  176 	push	a
      00890D 6B 01            [ 1]  177 	ld	(0x01, sp), a
                                    178 ;	lib/src/stm8s_exti.c: 117: EXTI->CR2 &= (uint8_t)(~EXTI_CR2_TLIS);
      00890F C6 50 A1         [ 1]  179 	ld	a, 0x50a1
      008912 A4 FB            [ 1]  180 	and	a, #0xfb
      008914 C7 50 A1         [ 1]  181 	ld	0x50a1, a
                                    182 ;	lib/src/stm8s_exti.c: 118: EXTI->CR2 |= (uint8_t)(SensitivityValue);
      008917 C6 50 A1         [ 1]  183 	ld	a, 0x50a1
      00891A 1A 01            [ 1]  184 	or	a, (0x01, sp)
      00891C C7 50 A1         [ 1]  185 	ld	0x50a1, a
                                    186 ;	lib/src/stm8s_exti.c: 119: }
      00891F 84               [ 1]  187 	pop	a
      008920 81               [ 4]  188 	ret
                                    189 ;	lib/src/stm8s_exti.c: 126: EXTI_Sensitivity_TypeDef EXTI_GetExtIntSensitivity(EXTI_Port_TypeDef Port)
                                    190 ;	-----------------------------------------
                                    191 ;	 function EXTI_GetExtIntSensitivity
                                    192 ;	-----------------------------------------
      008921                        193 _EXTI_GetExtIntSensitivity:
      008921 97               [ 1]  194 	ld	xl, a
                                    195 ;	lib/src/stm8s_exti.c: 128: uint8_t value = 0;
      008922 4F               [ 1]  196 	clr	a
                                    197 ;	lib/src/stm8s_exti.c: 133: switch (Port)
      008923 88               [ 1]  198 	push	a
      008924 9F               [ 1]  199 	ld	a, xl
      008925 A1 04            [ 1]  200 	cp	a, #0x04
      008927 84               [ 1]  201 	pop	a
      008928 23 01            [ 2]  202 	jrule	00115$
      00892A 81               [ 4]  203 	ret
      00892B                        204 00115$:
      00892B 4F               [ 1]  205 	clr	a
      00892C 95               [ 1]  206 	ld	xh, a
      00892D 58               [ 2]  207 	sllw	x
      00892E DE 89 32         [ 2]  208 	ldw	x, (#00116$, x)
      008931 FC               [ 2]  209 	jp	(x)
      008932                        210 00116$:
      008932 89 3C                  211 	.dw	#00101$
      008934 89 42                  212 	.dw	#00102$
      008936 89 4A                  213 	.dw	#00103$
      008938 89 53                  214 	.dw	#00104$
      00893A 89 5E                  215 	.dw	#00105$
                                    216 ;	lib/src/stm8s_exti.c: 135: case EXTI_PORT_GPIOA:
      00893C                        217 00101$:
                                    218 ;	lib/src/stm8s_exti.c: 136: value = (uint8_t)(EXTI->CR1 & EXTI_CR1_PAIS);
      00893C C6 50 A0         [ 1]  219 	ld	a, 0x50a0
      00893F A4 03            [ 1]  220 	and	a, #0x03
                                    221 ;	lib/src/stm8s_exti.c: 137: break;
      008941 81               [ 4]  222 	ret
                                    223 ;	lib/src/stm8s_exti.c: 138: case EXTI_PORT_GPIOB:
      008942                        224 00102$:
                                    225 ;	lib/src/stm8s_exti.c: 139: value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PBIS) >> 2);
      008942 C6 50 A0         [ 1]  226 	ld	a, 0x50a0
      008945 A4 0C            [ 1]  227 	and	a, #0x0c
      008947 44               [ 1]  228 	srl	a
      008948 44               [ 1]  229 	srl	a
                                    230 ;	lib/src/stm8s_exti.c: 140: break;
      008949 81               [ 4]  231 	ret
                                    232 ;	lib/src/stm8s_exti.c: 141: case EXTI_PORT_GPIOC:
      00894A                        233 00103$:
                                    234 ;	lib/src/stm8s_exti.c: 142: value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PCIS) >> 4);
      00894A C6 50 A0         [ 1]  235 	ld	a, 0x50a0
      00894D A4 30            [ 1]  236 	and	a, #0x30
      00894F 4E               [ 1]  237 	swap	a
      008950 A4 0F            [ 1]  238 	and	a, #0x0f
                                    239 ;	lib/src/stm8s_exti.c: 143: break;
      008952 81               [ 4]  240 	ret
                                    241 ;	lib/src/stm8s_exti.c: 144: case EXTI_PORT_GPIOD:
      008953                        242 00104$:
                                    243 ;	lib/src/stm8s_exti.c: 145: value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PDIS) >> 6);
      008953 C6 50 A0         [ 1]  244 	ld	a, 0x50a0
      008956 A4 C0            [ 1]  245 	and	a, #0xc0
      008958 4E               [ 1]  246 	swap	a
      008959 A4 0F            [ 1]  247 	and	a, #0x0f
      00895B 44               [ 1]  248 	srl	a
      00895C 44               [ 1]  249 	srl	a
                                    250 ;	lib/src/stm8s_exti.c: 146: break;
      00895D 81               [ 4]  251 	ret
                                    252 ;	lib/src/stm8s_exti.c: 147: case EXTI_PORT_GPIOE:
      00895E                        253 00105$:
                                    254 ;	lib/src/stm8s_exti.c: 148: value = (uint8_t)(EXTI->CR2 & EXTI_CR2_PEIS);
      00895E C6 50 A1         [ 1]  255 	ld	a, 0x50a1
      008961 A4 03            [ 1]  256 	and	a, #0x03
                                    257 ;	lib/src/stm8s_exti.c: 152: }
                                    258 ;	lib/src/stm8s_exti.c: 154: return((EXTI_Sensitivity_TypeDef)value);
                                    259 ;	lib/src/stm8s_exti.c: 155: }
      008963 81               [ 4]  260 	ret
                                    261 ;	lib/src/stm8s_exti.c: 162: EXTI_TLISensitivity_TypeDef EXTI_GetTLISensitivity(void)
                                    262 ;	-----------------------------------------
                                    263 ;	 function EXTI_GetTLISensitivity
                                    264 ;	-----------------------------------------
      008964                        265 _EXTI_GetTLISensitivity:
                                    266 ;	lib/src/stm8s_exti.c: 167: value = (uint8_t)(EXTI->CR2 & EXTI_CR2_TLIS);
      008964 C6 50 A1         [ 1]  267 	ld	a, 0x50a1
      008967 A4 04            [ 1]  268 	and	a, #0x04
                                    269 ;	lib/src/stm8s_exti.c: 169: return((EXTI_TLISensitivity_TypeDef)value);
                                    270 ;	lib/src/stm8s_exti.c: 170: }
      008969 81               [ 4]  271 	ret
                                    272 	.area CODE
                                    273 	.area CONST
                                    274 	.area INITIALIZER
                                    275 	.area CABS (ABS)
