                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.3.0 #14184 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_tim2
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _TIM2_DeInit
                                     12 	.globl _TIM2_TimeBaseInit
                                     13 	.globl _TIM2_OC1Init
                                     14 	.globl _TIM2_OC2Init
                                     15 	.globl _TIM2_OC3Init
                                     16 	.globl _TIM2_ICInit
                                     17 	.globl _TIM2_PWMIConfig
                                     18 	.globl _TIM2_Cmd
                                     19 	.globl _TIM2_ITConfig
                                     20 	.globl _TIM2_UpdateDisableConfig
                                     21 	.globl _TIM2_UpdateRequestConfig
                                     22 	.globl _TIM2_SelectOnePulseMode
                                     23 	.globl _TIM2_PrescalerConfig
                                     24 	.globl _TIM2_ForcedOC1Config
                                     25 	.globl _TIM2_ForcedOC2Config
                                     26 	.globl _TIM2_ForcedOC3Config
                                     27 	.globl _TIM2_ARRPreloadConfig
                                     28 	.globl _TIM2_OC1PreloadConfig
                                     29 	.globl _TIM2_OC2PreloadConfig
                                     30 	.globl _TIM2_OC3PreloadConfig
                                     31 	.globl _TIM2_GenerateEvent
                                     32 	.globl _TIM2_OC1PolarityConfig
                                     33 	.globl _TIM2_OC2PolarityConfig
                                     34 	.globl _TIM2_OC3PolarityConfig
                                     35 	.globl _TIM2_CCxCmd
                                     36 	.globl _TIM2_SelectOCxM
                                     37 	.globl _TIM2_SetCounter
                                     38 	.globl _TIM2_SetAutoreload
                                     39 	.globl _TIM2_SetCompare1
                                     40 	.globl _TIM2_SetCompare2
                                     41 	.globl _TIM2_SetCompare3
                                     42 	.globl _TIM2_SetIC1Prescaler
                                     43 	.globl _TIM2_SetIC2Prescaler
                                     44 	.globl _TIM2_SetIC3Prescaler
                                     45 	.globl _TIM2_GetCapture1
                                     46 	.globl _TIM2_GetCapture2
                                     47 	.globl _TIM2_GetCapture3
                                     48 	.globl _TIM2_GetCounter
                                     49 	.globl _TIM2_GetPrescaler
                                     50 	.globl _TIM2_GetFlagStatus
                                     51 	.globl _TIM2_ClearFlag
                                     52 	.globl _TIM2_GetITStatus
                                     53 	.globl _TIM2_ClearITPendingBit
                                     54 ;--------------------------------------------------------
                                     55 ; ram data
                                     56 ;--------------------------------------------------------
                                     57 	.area DATA
                                     58 ;--------------------------------------------------------
                                     59 ; ram data
                                     60 ;--------------------------------------------------------
                                     61 	.area INITIALIZED
                                     62 ;--------------------------------------------------------
                                     63 ; absolute external ram data
                                     64 ;--------------------------------------------------------
                                     65 	.area DABS (ABS)
                                     66 
                                     67 ; default segment ordering for linker
                                     68 	.area HOME
                                     69 	.area GSINIT
                                     70 	.area GSFINAL
                                     71 	.area CONST
                                     72 	.area INITIALIZER
                                     73 	.area CODE
                                     74 
                                     75 ;--------------------------------------------------------
                                     76 ; global & static initialisations
                                     77 ;--------------------------------------------------------
                                     78 	.area HOME
                                     79 	.area GSINIT
                                     80 	.area GSFINAL
                                     81 	.area GSINIT
                                     82 ;--------------------------------------------------------
                                     83 ; Home
                                     84 ;--------------------------------------------------------
                                     85 	.area HOME
                                     86 	.area HOME
                                     87 ;--------------------------------------------------------
                                     88 ; code
                                     89 ;--------------------------------------------------------
                                     90 	.area CODE
                                     91 ;	lib/src/stm8s_tim2.c: 52: void TIM2_DeInit(void)
                                     92 ;	-----------------------------------------
                                     93 ;	 function TIM2_DeInit
                                     94 ;	-----------------------------------------
      008600                         95 _TIM2_DeInit:
                                     96 ;	lib/src/stm8s_tim2.c: 54: TIM2->CR1 = (uint8_t)TIM2_CR1_RESET_VALUE;
      008600 35 00 53 00      [ 1]   97 	mov	0x5300+0, #0x00
                                     98 ;	lib/src/stm8s_tim2.c: 55: TIM2->IER = (uint8_t)TIM2_IER_RESET_VALUE;
      008604 35 00 53 03      [ 1]   99 	mov	0x5303+0, #0x00
                                    100 ;	lib/src/stm8s_tim2.c: 56: TIM2->SR2 = (uint8_t)TIM2_SR2_RESET_VALUE;
      008608 35 00 53 05      [ 1]  101 	mov	0x5305+0, #0x00
                                    102 ;	lib/src/stm8s_tim2.c: 59: TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
      00860C 35 00 53 0A      [ 1]  103 	mov	0x530a+0, #0x00
                                    104 ;	lib/src/stm8s_tim2.c: 60: TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
      008610 35 00 53 0B      [ 1]  105 	mov	0x530b+0, #0x00
                                    106 ;	lib/src/stm8s_tim2.c: 64: TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
      008614 35 00 53 0A      [ 1]  107 	mov	0x530a+0, #0x00
                                    108 ;	lib/src/stm8s_tim2.c: 65: TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
      008618 35 00 53 0B      [ 1]  109 	mov	0x530b+0, #0x00
                                    110 ;	lib/src/stm8s_tim2.c: 66: TIM2->CCMR1 = (uint8_t)TIM2_CCMR1_RESET_VALUE;
      00861C 35 00 53 07      [ 1]  111 	mov	0x5307+0, #0x00
                                    112 ;	lib/src/stm8s_tim2.c: 67: TIM2->CCMR2 = (uint8_t)TIM2_CCMR2_RESET_VALUE;
      008620 35 00 53 08      [ 1]  113 	mov	0x5308+0, #0x00
                                    114 ;	lib/src/stm8s_tim2.c: 68: TIM2->CCMR3 = (uint8_t)TIM2_CCMR3_RESET_VALUE;
      008624 35 00 53 09      [ 1]  115 	mov	0x5309+0, #0x00
                                    116 ;	lib/src/stm8s_tim2.c: 69: TIM2->CNTRH = (uint8_t)TIM2_CNTRH_RESET_VALUE;
      008628 35 00 53 0C      [ 1]  117 	mov	0x530c+0, #0x00
                                    118 ;	lib/src/stm8s_tim2.c: 70: TIM2->CNTRL = (uint8_t)TIM2_CNTRL_RESET_VALUE;
      00862C 35 00 53 0D      [ 1]  119 	mov	0x530d+0, #0x00
                                    120 ;	lib/src/stm8s_tim2.c: 71: TIM2->PSCR = (uint8_t)TIM2_PSCR_RESET_VALUE;
      008630 35 00 53 0E      [ 1]  121 	mov	0x530e+0, #0x00
                                    122 ;	lib/src/stm8s_tim2.c: 72: TIM2->ARRH  = (uint8_t)TIM2_ARRH_RESET_VALUE;
      008634 35 FF 53 0F      [ 1]  123 	mov	0x530f+0, #0xff
                                    124 ;	lib/src/stm8s_tim2.c: 73: TIM2->ARRL  = (uint8_t)TIM2_ARRL_RESET_VALUE;
      008638 35 FF 53 10      [ 1]  125 	mov	0x5310+0, #0xff
                                    126 ;	lib/src/stm8s_tim2.c: 74: TIM2->CCR1H = (uint8_t)TIM2_CCR1H_RESET_VALUE;
      00863C 35 00 53 11      [ 1]  127 	mov	0x5311+0, #0x00
                                    128 ;	lib/src/stm8s_tim2.c: 75: TIM2->CCR1L = (uint8_t)TIM2_CCR1L_RESET_VALUE;
      008640 35 00 53 12      [ 1]  129 	mov	0x5312+0, #0x00
                                    130 ;	lib/src/stm8s_tim2.c: 76: TIM2->CCR2H = (uint8_t)TIM2_CCR2H_RESET_VALUE;
      008644 35 00 53 13      [ 1]  131 	mov	0x5313+0, #0x00
                                    132 ;	lib/src/stm8s_tim2.c: 77: TIM2->CCR2L = (uint8_t)TIM2_CCR2L_RESET_VALUE;
      008648 35 00 53 14      [ 1]  133 	mov	0x5314+0, #0x00
                                    134 ;	lib/src/stm8s_tim2.c: 78: TIM2->CCR3H = (uint8_t)TIM2_CCR3H_RESET_VALUE;
      00864C 35 00 53 15      [ 1]  135 	mov	0x5315+0, #0x00
                                    136 ;	lib/src/stm8s_tim2.c: 79: TIM2->CCR3L = (uint8_t)TIM2_CCR3L_RESET_VALUE;
      008650 35 00 53 16      [ 1]  137 	mov	0x5316+0, #0x00
                                    138 ;	lib/src/stm8s_tim2.c: 80: TIM2->SR1 = (uint8_t)TIM2_SR1_RESET_VALUE;
      008654 35 00 53 04      [ 1]  139 	mov	0x5304+0, #0x00
                                    140 ;	lib/src/stm8s_tim2.c: 81: }
      008658 81               [ 4]  141 	ret
                                    142 ;	lib/src/stm8s_tim2.c: 89: void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
                                    143 ;	-----------------------------------------
                                    144 ;	 function TIM2_TimeBaseInit
                                    145 ;	-----------------------------------------
      008659                        146 _TIM2_TimeBaseInit:
                                    147 ;	lib/src/stm8s_tim2.c: 93: TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
      008659 C7 53 0E         [ 1]  148 	ld	0x530e, a
                                    149 ;	lib/src/stm8s_tim2.c: 95: TIM2->ARRH = (uint8_t)(TIM2_Period >> 8);
      00865C 9E               [ 1]  150 	ld	a, xh
      00865D C7 53 0F         [ 1]  151 	ld	0x530f, a
                                    152 ;	lib/src/stm8s_tim2.c: 96: TIM2->ARRL = (uint8_t)(TIM2_Period);
      008660 9F               [ 1]  153 	ld	a, xl
      008661 C7 53 10         [ 1]  154 	ld	0x5310, a
                                    155 ;	lib/src/stm8s_tim2.c: 97: }
      008664 81               [ 4]  156 	ret
                                    157 ;	lib/src/stm8s_tim2.c: 108: void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
                                    158 ;	-----------------------------------------
                                    159 ;	 function TIM2_OC1Init
                                    160 ;	-----------------------------------------
      008665                        161 _TIM2_OC1Init:
      008665 52 03            [ 2]  162 	sub	sp, #3
      008667 6B 03            [ 1]  163 	ld	(0x03, sp), a
                                    164 ;	lib/src/stm8s_tim2.c: 119: TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC1E | TIM2_CCER1_CC1P));
      008669 C6 53 0A         [ 1]  165 	ld	a, 0x530a
      00866C A4 FC            [ 1]  166 	and	a, #0xfc
      00866E C7 53 0A         [ 1]  167 	ld	0x530a, a
                                    168 ;	lib/src/stm8s_tim2.c: 121: TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER1_CC1E ) |
      008671 C6 53 0A         [ 1]  169 	ld	a, 0x530a
      008674 6B 01            [ 1]  170 	ld	(0x01, sp), a
      008676 7B 06            [ 1]  171 	ld	a, (0x06, sp)
      008678 A4 01            [ 1]  172 	and	a, #0x01
      00867A 6B 02            [ 1]  173 	ld	(0x02, sp), a
                                    174 ;	lib/src/stm8s_tim2.c: 122: (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC1P));
      00867C 7B 09            [ 1]  175 	ld	a, (0x09, sp)
      00867E A4 02            [ 1]  176 	and	a, #0x02
      008680 1A 02            [ 1]  177 	or	a, (0x02, sp)
      008682 1A 01            [ 1]  178 	or	a, (0x01, sp)
      008684 C7 53 0A         [ 1]  179 	ld	0x530a, a
                                    180 ;	lib/src/stm8s_tim2.c: 125: TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM)) |
      008687 C6 53 07         [ 1]  181 	ld	a, 0x5307
      00868A A4 8F            [ 1]  182 	and	a, #0x8f
                                    183 ;	lib/src/stm8s_tim2.c: 126: (uint8_t)TIM2_OCMode);
      00868C 1A 03            [ 1]  184 	or	a, (0x03, sp)
      00868E C7 53 07         [ 1]  185 	ld	0x5307, a
                                    186 ;	lib/src/stm8s_tim2.c: 129: TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
      008691 7B 07            [ 1]  187 	ld	a, (0x07, sp)
      008693 C7 53 11         [ 1]  188 	ld	0x5311, a
                                    189 ;	lib/src/stm8s_tim2.c: 130: TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
      008696 7B 08            [ 1]  190 	ld	a, (0x08, sp)
      008698 C7 53 12         [ 1]  191 	ld	0x5312, a
                                    192 ;	lib/src/stm8s_tim2.c: 131: }
      00869B 1E 04            [ 2]  193 	ldw	x, (4, sp)
      00869D 5B 09            [ 2]  194 	addw	sp, #9
      00869F FC               [ 2]  195 	jp	(x)
                                    196 ;	lib/src/stm8s_tim2.c: 142: void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
                                    197 ;	-----------------------------------------
                                    198 ;	 function TIM2_OC2Init
                                    199 ;	-----------------------------------------
      0086A0                        200 _TIM2_OC2Init:
      0086A0 52 03            [ 2]  201 	sub	sp, #3
      0086A2 6B 03            [ 1]  202 	ld	(0x03, sp), a
                                    203 ;	lib/src/stm8s_tim2.c: 154: TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC2E |  TIM2_CCER1_CC2P ));
      0086A4 C6 53 0A         [ 1]  204 	ld	a, 0x530a
      0086A7 A4 CF            [ 1]  205 	and	a, #0xcf
      0086A9 C7 53 0A         [ 1]  206 	ld	0x530a, a
                                    207 ;	lib/src/stm8s_tim2.c: 156: TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState  & TIM2_CCER1_CC2E ) |
      0086AC C6 53 0A         [ 1]  208 	ld	a, 0x530a
      0086AF 6B 01            [ 1]  209 	ld	(0x01, sp), a
      0086B1 7B 06            [ 1]  210 	ld	a, (0x06, sp)
      0086B3 A4 10            [ 1]  211 	and	a, #0x10
      0086B5 6B 02            [ 1]  212 	ld	(0x02, sp), a
                                    213 ;	lib/src/stm8s_tim2.c: 157: (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC2P));
      0086B7 7B 09            [ 1]  214 	ld	a, (0x09, sp)
      0086B9 A4 20            [ 1]  215 	and	a, #0x20
      0086BB 1A 02            [ 1]  216 	or	a, (0x02, sp)
      0086BD 1A 01            [ 1]  217 	or	a, (0x01, sp)
      0086BF C7 53 0A         [ 1]  218 	ld	0x530a, a
                                    219 ;	lib/src/stm8s_tim2.c: 161: TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM)) |
      0086C2 C6 53 08         [ 1]  220 	ld	a, 0x5308
      0086C5 A4 8F            [ 1]  221 	and	a, #0x8f
                                    222 ;	lib/src/stm8s_tim2.c: 162: (uint8_t)TIM2_OCMode);
      0086C7 1A 03            [ 1]  223 	or	a, (0x03, sp)
      0086C9 C7 53 08         [ 1]  224 	ld	0x5308, a
                                    225 ;	lib/src/stm8s_tim2.c: 166: TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
      0086CC 7B 07            [ 1]  226 	ld	a, (0x07, sp)
      0086CE C7 53 13         [ 1]  227 	ld	0x5313, a
                                    228 ;	lib/src/stm8s_tim2.c: 167: TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
      0086D1 7B 08            [ 1]  229 	ld	a, (0x08, sp)
      0086D3 C7 53 14         [ 1]  230 	ld	0x5314, a
                                    231 ;	lib/src/stm8s_tim2.c: 168: }
      0086D6 1E 04            [ 2]  232 	ldw	x, (4, sp)
      0086D8 5B 09            [ 2]  233 	addw	sp, #9
      0086DA FC               [ 2]  234 	jp	(x)
                                    235 ;	lib/src/stm8s_tim2.c: 179: void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
                                    236 ;	-----------------------------------------
                                    237 ;	 function TIM2_OC3Init
                                    238 ;	-----------------------------------------
      0086DB                        239 _TIM2_OC3Init:
      0086DB 52 03            [ 2]  240 	sub	sp, #3
      0086DD 6B 03            [ 1]  241 	ld	(0x03, sp), a
                                    242 ;	lib/src/stm8s_tim2.c: 189: TIM2->CCER2 &= (uint8_t)(~( TIM2_CCER2_CC3E  | TIM2_CCER2_CC3P));
      0086DF C6 53 0B         [ 1]  243 	ld	a, 0x530b
      0086E2 A4 FC            [ 1]  244 	and	a, #0xfc
      0086E4 C7 53 0B         [ 1]  245 	ld	0x530b, a
                                    246 ;	lib/src/stm8s_tim2.c: 191: TIM2->CCER2 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER2_CC3E) |
      0086E7 C6 53 0B         [ 1]  247 	ld	a, 0x530b
      0086EA 6B 01            [ 1]  248 	ld	(0x01, sp), a
      0086EC 7B 06            [ 1]  249 	ld	a, (0x06, sp)
      0086EE A4 01            [ 1]  250 	and	a, #0x01
      0086F0 6B 02            [ 1]  251 	ld	(0x02, sp), a
                                    252 ;	lib/src/stm8s_tim2.c: 192: (uint8_t)(TIM2_OCPolarity & TIM2_CCER2_CC3P));
      0086F2 7B 09            [ 1]  253 	ld	a, (0x09, sp)
      0086F4 A4 02            [ 1]  254 	and	a, #0x02
      0086F6 1A 02            [ 1]  255 	or	a, (0x02, sp)
      0086F8 1A 01            [ 1]  256 	or	a, (0x01, sp)
      0086FA C7 53 0B         [ 1]  257 	ld	0x530b, a
                                    258 ;	lib/src/stm8s_tim2.c: 195: TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM)) |
      0086FD C6 53 09         [ 1]  259 	ld	a, 0x5309
      008700 A4 8F            [ 1]  260 	and	a, #0x8f
                                    261 ;	lib/src/stm8s_tim2.c: 196: (uint8_t)TIM2_OCMode);
      008702 1A 03            [ 1]  262 	or	a, (0x03, sp)
      008704 C7 53 09         [ 1]  263 	ld	0x5309, a
                                    264 ;	lib/src/stm8s_tim2.c: 199: TIM2->CCR3H = (uint8_t)(TIM2_Pulse >> 8);
      008707 7B 07            [ 1]  265 	ld	a, (0x07, sp)
      008709 C7 53 15         [ 1]  266 	ld	0x5315, a
                                    267 ;	lib/src/stm8s_tim2.c: 200: TIM2->CCR3L = (uint8_t)(TIM2_Pulse);
      00870C 7B 08            [ 1]  268 	ld	a, (0x08, sp)
      00870E C7 53 16         [ 1]  269 	ld	0x5316, a
                                    270 ;	lib/src/stm8s_tim2.c: 201: }
      008711 1E 04            [ 2]  271 	ldw	x, (4, sp)
      008713 5B 09            [ 2]  272 	addw	sp, #9
      008715 FC               [ 2]  273 	jp	(x)
                                    274 ;	lib/src/stm8s_tim2.c: 212: void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
                                    275 ;	-----------------------------------------
                                    276 ;	 function TIM2_ICInit
                                    277 ;	-----------------------------------------
      008716                        278 _TIM2_ICInit:
                                    279 ;	lib/src/stm8s_tim2.c: 225: if (TIM2_Channel == TIM2_CHANNEL_1)
      008716 4D               [ 1]  280 	tnz	a
      008717 26 16            [ 1]  281 	jrne	00105$
                                    282 ;	lib/src/stm8s_tim2.c: 228: TI1_Config((uint8_t)TIM2_ICPolarity,
      008719 7B 06            [ 1]  283 	ld	a, (0x06, sp)
      00871B 88               [ 1]  284 	push	a
      00871C 7B 05            [ 1]  285 	ld	a, (0x05, sp)
      00871E 88               [ 1]  286 	push	a
      00871F 7B 05            [ 1]  287 	ld	a, (0x05, sp)
      008721 CD 8A AD         [ 4]  288 	call	_TI1_Config
                                    289 ;	lib/src/stm8s_tim2.c: 233: TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
      008724 7B 05            [ 1]  290 	ld	a, (0x05, sp)
      008726 1E 01            [ 2]  291 	ldw	x, (1, sp)
      008728 1F 05            [ 2]  292 	ldw	(5, sp), x
      00872A 5B 04            [ 2]  293 	addw	sp, #4
      00872C CC 89 D9         [ 2]  294 	jp	_TIM2_SetIC1Prescaler
      00872F                        295 00105$:
                                    296 ;	lib/src/stm8s_tim2.c: 235: else if (TIM2_Channel == TIM2_CHANNEL_2)
      00872F 4A               [ 1]  297 	dec	a
      008730 26 16            [ 1]  298 	jrne	00102$
                                    299 ;	lib/src/stm8s_tim2.c: 238: TI2_Config((uint8_t)TIM2_ICPolarity,
      008732 7B 06            [ 1]  300 	ld	a, (0x06, sp)
      008734 88               [ 1]  301 	push	a
      008735 7B 05            [ 1]  302 	ld	a, (0x05, sp)
      008737 88               [ 1]  303 	push	a
      008738 7B 05            [ 1]  304 	ld	a, (0x05, sp)
      00873A CD 8A E8         [ 4]  305 	call	_TI2_Config
                                    306 ;	lib/src/stm8s_tim2.c: 243: TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
      00873D 7B 05            [ 1]  307 	ld	a, (0x05, sp)
      00873F 1E 01            [ 2]  308 	ldw	x, (1, sp)
      008741 1F 05            [ 2]  309 	ldw	(5, sp), x
      008743 5B 04            [ 2]  310 	addw	sp, #4
      008745 CC 89 E8         [ 2]  311 	jp	_TIM2_SetIC2Prescaler
      008748                        312 00102$:
                                    313 ;	lib/src/stm8s_tim2.c: 248: TI3_Config((uint8_t)TIM2_ICPolarity,
      008748 7B 06            [ 1]  314 	ld	a, (0x06, sp)
      00874A 88               [ 1]  315 	push	a
      00874B 7B 05            [ 1]  316 	ld	a, (0x05, sp)
      00874D 88               [ 1]  317 	push	a
      00874E 7B 05            [ 1]  318 	ld	a, (0x05, sp)
      008750 CD 8B 23         [ 4]  319 	call	_TI3_Config
                                    320 ;	lib/src/stm8s_tim2.c: 253: TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
      008753 7B 05            [ 1]  321 	ld	a, (0x05, sp)
      008755 1E 01            [ 2]  322 	ldw	x, (1, sp)
      008757 1F 05            [ 2]  323 	ldw	(5, sp), x
      008759 5B 04            [ 2]  324 	addw	sp, #4
                                    325 ;	lib/src/stm8s_tim2.c: 255: }
      00875B CC 89 F7         [ 2]  326 	jp	_TIM2_SetIC3Prescaler
                                    327 ;	lib/src/stm8s_tim2.c: 266: void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
                                    328 ;	-----------------------------------------
                                    329 ;	 function TIM2_PWMIConfig
                                    330 ;	-----------------------------------------
      00875E                        331 _TIM2_PWMIConfig:
      00875E 52 02            [ 2]  332 	sub	sp, #2
      008760 97               [ 1]  333 	ld	xl, a
                                    334 ;	lib/src/stm8s_tim2.c: 282: if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
      008761 7B 05            [ 1]  335 	ld	a, (0x05, sp)
      008763 A1 44            [ 1]  336 	cp	a, #0x44
      008765 27 05            [ 1]  337 	jreq	00102$
                                    338 ;	lib/src/stm8s_tim2.c: 284: icpolarity = (uint8_t)TIM2_ICPOLARITY_FALLING;
      008767 A6 44            [ 1]  339 	ld	a, #0x44
      008769 6B 01            [ 1]  340 	ld	(0x01, sp), a
                                    341 ;	lib/src/stm8s_tim2.c: 288: icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
      00876B C5                     342 	.byte 0xc5
      00876C                        343 00102$:
      00876C 0F 01            [ 1]  344 	clr	(0x01, sp)
      00876E                        345 00103$:
                                    346 ;	lib/src/stm8s_tim2.c: 292: if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
      00876E 7B 06            [ 1]  347 	ld	a, (0x06, sp)
      008770 4A               [ 1]  348 	dec	a
      008771 26 06            [ 1]  349 	jrne	00105$
                                    350 ;	lib/src/stm8s_tim2.c: 294: icselection = (uint8_t)TIM2_ICSELECTION_INDIRECTTI;
      008773 A6 02            [ 1]  351 	ld	a, #0x02
      008775 6B 02            [ 1]  352 	ld	(0x02, sp), a
      008777 20 04            [ 2]  353 	jra	00106$
      008779                        354 00105$:
                                    355 ;	lib/src/stm8s_tim2.c: 298: icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
      008779 A6 01            [ 1]  356 	ld	a, #0x01
      00877B 6B 02            [ 1]  357 	ld	(0x02, sp), a
      00877D                        358 00106$:
                                    359 ;	lib/src/stm8s_tim2.c: 301: if (TIM2_Channel == TIM2_CHANNEL_1)
      00877D 9F               [ 1]  360 	ld	a, xl
      00877E 4D               [ 1]  361 	tnz	a
      00877F 26 26            [ 1]  362 	jrne	00108$
                                    363 ;	lib/src/stm8s_tim2.c: 304: TI1_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
      008781 7B 08            [ 1]  364 	ld	a, (0x08, sp)
      008783 88               [ 1]  365 	push	a
      008784 7B 07            [ 1]  366 	ld	a, (0x07, sp)
      008786 88               [ 1]  367 	push	a
      008787 7B 07            [ 1]  368 	ld	a, (0x07, sp)
      008789 CD 8A AD         [ 4]  369 	call	_TI1_Config
                                    370 ;	lib/src/stm8s_tim2.c: 308: TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
      00878C 7B 07            [ 1]  371 	ld	a, (0x07, sp)
      00878E CD 89 D9         [ 4]  372 	call	_TIM2_SetIC1Prescaler
                                    373 ;	lib/src/stm8s_tim2.c: 311: TI2_Config(icpolarity, icselection, TIM2_ICFilter);
      008791 7B 08            [ 1]  374 	ld	a, (0x08, sp)
      008793 88               [ 1]  375 	push	a
      008794 7B 03            [ 1]  376 	ld	a, (0x03, sp)
      008796 88               [ 1]  377 	push	a
      008797 7B 03            [ 1]  378 	ld	a, (0x03, sp)
      008799 CD 8A E8         [ 4]  379 	call	_TI2_Config
                                    380 ;	lib/src/stm8s_tim2.c: 314: TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
      00879C 7B 07            [ 1]  381 	ld	a, (0x07, sp)
      00879E 1E 03            [ 2]  382 	ldw	x, (3, sp)
      0087A0 1F 07            [ 2]  383 	ldw	(7, sp), x
      0087A2 5B 06            [ 2]  384 	addw	sp, #6
      0087A4 CC 89 E8         [ 2]  385 	jp	_TIM2_SetIC2Prescaler
      0087A7                        386 00108$:
                                    387 ;	lib/src/stm8s_tim2.c: 319: TI2_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
      0087A7 7B 08            [ 1]  388 	ld	a, (0x08, sp)
      0087A9 88               [ 1]  389 	push	a
      0087AA 7B 07            [ 1]  390 	ld	a, (0x07, sp)
      0087AC 88               [ 1]  391 	push	a
      0087AD 7B 07            [ 1]  392 	ld	a, (0x07, sp)
      0087AF CD 8A E8         [ 4]  393 	call	_TI2_Config
                                    394 ;	lib/src/stm8s_tim2.c: 323: TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
      0087B2 7B 07            [ 1]  395 	ld	a, (0x07, sp)
      0087B4 CD 89 E8         [ 4]  396 	call	_TIM2_SetIC2Prescaler
                                    397 ;	lib/src/stm8s_tim2.c: 326: TI1_Config((uint8_t)icpolarity, icselection, (uint8_t)TIM2_ICFilter);
      0087B7 7B 08            [ 1]  398 	ld	a, (0x08, sp)
      0087B9 88               [ 1]  399 	push	a
      0087BA 7B 03            [ 1]  400 	ld	a, (0x03, sp)
      0087BC 88               [ 1]  401 	push	a
      0087BD 7B 03            [ 1]  402 	ld	a, (0x03, sp)
      0087BF CD 8A AD         [ 4]  403 	call	_TI1_Config
                                    404 ;	lib/src/stm8s_tim2.c: 329: TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
      0087C2 7B 07            [ 1]  405 	ld	a, (0x07, sp)
      0087C4 1E 03            [ 2]  406 	ldw	x, (3, sp)
      0087C6 1F 07            [ 2]  407 	ldw	(7, sp), x
      0087C8 5B 06            [ 2]  408 	addw	sp, #6
                                    409 ;	lib/src/stm8s_tim2.c: 331: }
      0087CA CC 89 D9         [ 2]  410 	jp	_TIM2_SetIC1Prescaler
                                    411 ;	lib/src/stm8s_tim2.c: 339: void TIM2_Cmd(FunctionalState NewState)
                                    412 ;	-----------------------------------------
                                    413 ;	 function TIM2_Cmd
                                    414 ;	-----------------------------------------
      0087CD                        415 _TIM2_Cmd:
      0087CD 88               [ 1]  416 	push	a
      0087CE 6B 01            [ 1]  417 	ld	(0x01, sp), a
                                    418 ;	lib/src/stm8s_tim2.c: 347: TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
      0087D0 C6 53 00         [ 1]  419 	ld	a, 0x5300
                                    420 ;	lib/src/stm8s_tim2.c: 345: if (NewState != DISABLE)
      0087D3 0D 01            [ 1]  421 	tnz	(0x01, sp)
      0087D5 27 07            [ 1]  422 	jreq	00102$
                                    423 ;	lib/src/stm8s_tim2.c: 347: TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
      0087D7 AA 01            [ 1]  424 	or	a, #0x01
      0087D9 C7 53 00         [ 1]  425 	ld	0x5300, a
      0087DC 20 05            [ 2]  426 	jra	00104$
      0087DE                        427 00102$:
                                    428 ;	lib/src/stm8s_tim2.c: 351: TIM2->CR1 &= (uint8_t)(~TIM2_CR1_CEN);
      0087DE A4 FE            [ 1]  429 	and	a, #0xfe
      0087E0 C7 53 00         [ 1]  430 	ld	0x5300, a
      0087E3                        431 00104$:
                                    432 ;	lib/src/stm8s_tim2.c: 353: }
      0087E3 84               [ 1]  433 	pop	a
      0087E4 81               [ 4]  434 	ret
                                    435 ;	lib/src/stm8s_tim2.c: 368: void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
                                    436 ;	-----------------------------------------
                                    437 ;	 function TIM2_ITConfig
                                    438 ;	-----------------------------------------
      0087E5                        439 _TIM2_ITConfig:
      0087E5 88               [ 1]  440 	push	a
                                    441 ;	lib/src/stm8s_tim2.c: 377: TIM2->IER |= (uint8_t)TIM2_IT;
      0087E6 AE 53 03         [ 2]  442 	ldw	x, #0x5303
      0087E9 88               [ 1]  443 	push	a
      0087EA F6               [ 1]  444 	ld	a, (x)
      0087EB 6B 02            [ 1]  445 	ld	(0x02, sp), a
      0087ED 84               [ 1]  446 	pop	a
                                    447 ;	lib/src/stm8s_tim2.c: 374: if (NewState != DISABLE)
      0087EE 0D 04            [ 1]  448 	tnz	(0x04, sp)
      0087F0 27 07            [ 1]  449 	jreq	00102$
                                    450 ;	lib/src/stm8s_tim2.c: 377: TIM2->IER |= (uint8_t)TIM2_IT;
      0087F2 1A 01            [ 1]  451 	or	a, (0x01, sp)
      0087F4 C7 53 03         [ 1]  452 	ld	0x5303, a
      0087F7 20 06            [ 2]  453 	jra	00104$
      0087F9                        454 00102$:
                                    455 ;	lib/src/stm8s_tim2.c: 382: TIM2->IER &= (uint8_t)(~TIM2_IT);
      0087F9 43               [ 1]  456 	cpl	a
      0087FA 14 01            [ 1]  457 	and	a, (0x01, sp)
      0087FC C7 53 03         [ 1]  458 	ld	0x5303, a
      0087FF                        459 00104$:
                                    460 ;	lib/src/stm8s_tim2.c: 384: }
      0087FF 84               [ 1]  461 	pop	a
      008800 85               [ 2]  462 	popw	x
      008801 84               [ 1]  463 	pop	a
      008802 FC               [ 2]  464 	jp	(x)
                                    465 ;	lib/src/stm8s_tim2.c: 392: void TIM2_UpdateDisableConfig(FunctionalState NewState)
                                    466 ;	-----------------------------------------
                                    467 ;	 function TIM2_UpdateDisableConfig
                                    468 ;	-----------------------------------------
      008803                        469 _TIM2_UpdateDisableConfig:
      008803 88               [ 1]  470 	push	a
      008804 6B 01            [ 1]  471 	ld	(0x01, sp), a
                                    472 ;	lib/src/stm8s_tim2.c: 400: TIM2->CR1 |= (uint8_t)TIM2_CR1_UDIS;
      008806 C6 53 00         [ 1]  473 	ld	a, 0x5300
                                    474 ;	lib/src/stm8s_tim2.c: 398: if (NewState != DISABLE)
      008809 0D 01            [ 1]  475 	tnz	(0x01, sp)
      00880B 27 07            [ 1]  476 	jreq	00102$
                                    477 ;	lib/src/stm8s_tim2.c: 400: TIM2->CR1 |= (uint8_t)TIM2_CR1_UDIS;
      00880D AA 02            [ 1]  478 	or	a, #0x02
      00880F C7 53 00         [ 1]  479 	ld	0x5300, a
      008812 20 05            [ 2]  480 	jra	00104$
      008814                        481 00102$:
                                    482 ;	lib/src/stm8s_tim2.c: 404: TIM2->CR1 &= (uint8_t)(~TIM2_CR1_UDIS);
      008814 A4 FD            [ 1]  483 	and	a, #0xfd
      008816 C7 53 00         [ 1]  484 	ld	0x5300, a
      008819                        485 00104$:
                                    486 ;	lib/src/stm8s_tim2.c: 406: }
      008819 84               [ 1]  487 	pop	a
      00881A 81               [ 4]  488 	ret
                                    489 ;	lib/src/stm8s_tim2.c: 416: void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
                                    490 ;	-----------------------------------------
                                    491 ;	 function TIM2_UpdateRequestConfig
                                    492 ;	-----------------------------------------
      00881B                        493 _TIM2_UpdateRequestConfig:
      00881B 88               [ 1]  494 	push	a
      00881C 6B 01            [ 1]  495 	ld	(0x01, sp), a
                                    496 ;	lib/src/stm8s_tim2.c: 424: TIM2->CR1 |= (uint8_t)TIM2_CR1_URS;
      00881E C6 53 00         [ 1]  497 	ld	a, 0x5300
                                    498 ;	lib/src/stm8s_tim2.c: 422: if (TIM2_UpdateSource != TIM2_UPDATESOURCE_GLOBAL)
      008821 0D 01            [ 1]  499 	tnz	(0x01, sp)
      008823 27 07            [ 1]  500 	jreq	00102$
                                    501 ;	lib/src/stm8s_tim2.c: 424: TIM2->CR1 |= (uint8_t)TIM2_CR1_URS;
      008825 AA 04            [ 1]  502 	or	a, #0x04
      008827 C7 53 00         [ 1]  503 	ld	0x5300, a
      00882A 20 05            [ 2]  504 	jra	00104$
      00882C                        505 00102$:
                                    506 ;	lib/src/stm8s_tim2.c: 428: TIM2->CR1 &= (uint8_t)(~TIM2_CR1_URS);
      00882C A4 FB            [ 1]  507 	and	a, #0xfb
      00882E C7 53 00         [ 1]  508 	ld	0x5300, a
      008831                        509 00104$:
                                    510 ;	lib/src/stm8s_tim2.c: 430: }
      008831 84               [ 1]  511 	pop	a
      008832 81               [ 4]  512 	ret
                                    513 ;	lib/src/stm8s_tim2.c: 440: void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
                                    514 ;	-----------------------------------------
                                    515 ;	 function TIM2_SelectOnePulseMode
                                    516 ;	-----------------------------------------
      008833                        517 _TIM2_SelectOnePulseMode:
      008833 88               [ 1]  518 	push	a
      008834 6B 01            [ 1]  519 	ld	(0x01, sp), a
                                    520 ;	lib/src/stm8s_tim2.c: 448: TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
      008836 C6 53 00         [ 1]  521 	ld	a, 0x5300
                                    522 ;	lib/src/stm8s_tim2.c: 446: if (TIM2_OPMode != TIM2_OPMODE_REPETITIVE)
      008839 0D 01            [ 1]  523 	tnz	(0x01, sp)
      00883B 27 07            [ 1]  524 	jreq	00102$
                                    525 ;	lib/src/stm8s_tim2.c: 448: TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
      00883D AA 08            [ 1]  526 	or	a, #0x08
      00883F C7 53 00         [ 1]  527 	ld	0x5300, a
      008842 20 05            [ 2]  528 	jra	00104$
      008844                        529 00102$:
                                    530 ;	lib/src/stm8s_tim2.c: 452: TIM2->CR1 &= (uint8_t)(~TIM2_CR1_OPM);
      008844 A4 F7            [ 1]  531 	and	a, #0xf7
      008846 C7 53 00         [ 1]  532 	ld	0x5300, a
      008849                        533 00104$:
                                    534 ;	lib/src/stm8s_tim2.c: 454: }
      008849 84               [ 1]  535 	pop	a
      00884A 81               [ 4]  536 	ret
                                    537 ;	lib/src/stm8s_tim2.c: 484: void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
                                    538 ;	-----------------------------------------
                                    539 ;	 function TIM2_PrescalerConfig
                                    540 ;	-----------------------------------------
      00884B                        541 _TIM2_PrescalerConfig:
                                    542 ;	lib/src/stm8s_tim2.c: 492: TIM2->PSCR = (uint8_t)Prescaler;
      00884B C7 53 0E         [ 1]  543 	ld	0x530e, a
                                    544 ;	lib/src/stm8s_tim2.c: 495: TIM2->EGR = (uint8_t)TIM2_PSCReloadMode;
      00884E 7B 03            [ 1]  545 	ld	a, (0x03, sp)
      008850 C7 53 06         [ 1]  546 	ld	0x5306, a
                                    547 ;	lib/src/stm8s_tim2.c: 496: }
      008853 85               [ 2]  548 	popw	x
      008854 84               [ 1]  549 	pop	a
      008855 FC               [ 2]  550 	jp	(x)
                                    551 ;	lib/src/stm8s_tim2.c: 507: void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
                                    552 ;	-----------------------------------------
                                    553 ;	 function TIM2_ForcedOC1Config
                                    554 ;	-----------------------------------------
      008856                        555 _TIM2_ForcedOC1Config:
      008856 88               [ 1]  556 	push	a
      008857 6B 01            [ 1]  557 	ld	(0x01, sp), a
                                    558 ;	lib/src/stm8s_tim2.c: 513: TIM2->CCMR1  =  (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
      008859 C6 53 07         [ 1]  559 	ld	a, 0x5307
      00885C A4 8F            [ 1]  560 	and	a, #0x8f
                                    561 ;	lib/src/stm8s_tim2.c: 514: | (uint8_t)TIM2_ForcedAction);
      00885E 1A 01            [ 1]  562 	or	a, (0x01, sp)
      008860 C7 53 07         [ 1]  563 	ld	0x5307, a
                                    564 ;	lib/src/stm8s_tim2.c: 515: }
      008863 84               [ 1]  565 	pop	a
      008864 81               [ 4]  566 	ret
                                    567 ;	lib/src/stm8s_tim2.c: 526: void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
                                    568 ;	-----------------------------------------
                                    569 ;	 function TIM2_ForcedOC2Config
                                    570 ;	-----------------------------------------
      008865                        571 _TIM2_ForcedOC2Config:
      008865 88               [ 1]  572 	push	a
      008866 6B 01            [ 1]  573 	ld	(0x01, sp), a
                                    574 ;	lib/src/stm8s_tim2.c: 532: TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
      008868 C6 53 08         [ 1]  575 	ld	a, 0x5308
      00886B A4 8F            [ 1]  576 	and	a, #0x8f
                                    577 ;	lib/src/stm8s_tim2.c: 533: | (uint8_t)TIM2_ForcedAction);
      00886D 1A 01            [ 1]  578 	or	a, (0x01, sp)
      00886F C7 53 08         [ 1]  579 	ld	0x5308, a
                                    580 ;	lib/src/stm8s_tim2.c: 534: }
      008872 84               [ 1]  581 	pop	a
      008873 81               [ 4]  582 	ret
                                    583 ;	lib/src/stm8s_tim2.c: 545: void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
                                    584 ;	-----------------------------------------
                                    585 ;	 function TIM2_ForcedOC3Config
                                    586 ;	-----------------------------------------
      008874                        587 _TIM2_ForcedOC3Config:
      008874 88               [ 1]  588 	push	a
      008875 6B 01            [ 1]  589 	ld	(0x01, sp), a
                                    590 ;	lib/src/stm8s_tim2.c: 551: TIM2->CCMR3  =  (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
      008877 C6 53 09         [ 1]  591 	ld	a, 0x5309
      00887A A4 8F            [ 1]  592 	and	a, #0x8f
                                    593 ;	lib/src/stm8s_tim2.c: 552: | (uint8_t)TIM2_ForcedAction);
      00887C 1A 01            [ 1]  594 	or	a, (0x01, sp)
      00887E C7 53 09         [ 1]  595 	ld	0x5309, a
                                    596 ;	lib/src/stm8s_tim2.c: 553: }
      008881 84               [ 1]  597 	pop	a
      008882 81               [ 4]  598 	ret
                                    599 ;	lib/src/stm8s_tim2.c: 561: void TIM2_ARRPreloadConfig(FunctionalState NewState)
                                    600 ;	-----------------------------------------
                                    601 ;	 function TIM2_ARRPreloadConfig
                                    602 ;	-----------------------------------------
      008883                        603 _TIM2_ARRPreloadConfig:
      008883 88               [ 1]  604 	push	a
      008884 6B 01            [ 1]  605 	ld	(0x01, sp), a
                                    606 ;	lib/src/stm8s_tim2.c: 569: TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
      008886 C6 53 00         [ 1]  607 	ld	a, 0x5300
                                    608 ;	lib/src/stm8s_tim2.c: 567: if (NewState != DISABLE)
      008889 0D 01            [ 1]  609 	tnz	(0x01, sp)
      00888B 27 07            [ 1]  610 	jreq	00102$
                                    611 ;	lib/src/stm8s_tim2.c: 569: TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
      00888D AA 80            [ 1]  612 	or	a, #0x80
      00888F C7 53 00         [ 1]  613 	ld	0x5300, a
      008892 20 05            [ 2]  614 	jra	00104$
      008894                        615 00102$:
                                    616 ;	lib/src/stm8s_tim2.c: 573: TIM2->CR1 &= (uint8_t)(~TIM2_CR1_ARPE);
      008894 A4 7F            [ 1]  617 	and	a, #0x7f
      008896 C7 53 00         [ 1]  618 	ld	0x5300, a
      008899                        619 00104$:
                                    620 ;	lib/src/stm8s_tim2.c: 575: }
      008899 84               [ 1]  621 	pop	a
      00889A 81               [ 4]  622 	ret
                                    623 ;	lib/src/stm8s_tim2.c: 583: void TIM2_OC1PreloadConfig(FunctionalState NewState)
                                    624 ;	-----------------------------------------
                                    625 ;	 function TIM2_OC1PreloadConfig
                                    626 ;	-----------------------------------------
      00889B                        627 _TIM2_OC1PreloadConfig:
      00889B 88               [ 1]  628 	push	a
      00889C 6B 01            [ 1]  629 	ld	(0x01, sp), a
                                    630 ;	lib/src/stm8s_tim2.c: 591: TIM2->CCMR1 |= (uint8_t)TIM2_CCMR_OCxPE;
      00889E C6 53 07         [ 1]  631 	ld	a, 0x5307
                                    632 ;	lib/src/stm8s_tim2.c: 589: if (NewState != DISABLE)
      0088A1 0D 01            [ 1]  633 	tnz	(0x01, sp)
      0088A3 27 07            [ 1]  634 	jreq	00102$
                                    635 ;	lib/src/stm8s_tim2.c: 591: TIM2->CCMR1 |= (uint8_t)TIM2_CCMR_OCxPE;
      0088A5 AA 08            [ 1]  636 	or	a, #0x08
      0088A7 C7 53 07         [ 1]  637 	ld	0x5307, a
      0088AA 20 05            [ 2]  638 	jra	00104$
      0088AC                        639 00102$:
                                    640 ;	lib/src/stm8s_tim2.c: 595: TIM2->CCMR1 &= (uint8_t)(~TIM2_CCMR_OCxPE);
      0088AC A4 F7            [ 1]  641 	and	a, #0xf7
      0088AE C7 53 07         [ 1]  642 	ld	0x5307, a
      0088B1                        643 00104$:
                                    644 ;	lib/src/stm8s_tim2.c: 597: }
      0088B1 84               [ 1]  645 	pop	a
      0088B2 81               [ 4]  646 	ret
                                    647 ;	lib/src/stm8s_tim2.c: 605: void TIM2_OC2PreloadConfig(FunctionalState NewState)
                                    648 ;	-----------------------------------------
                                    649 ;	 function TIM2_OC2PreloadConfig
                                    650 ;	-----------------------------------------
      0088B3                        651 _TIM2_OC2PreloadConfig:
      0088B3 88               [ 1]  652 	push	a
      0088B4 6B 01            [ 1]  653 	ld	(0x01, sp), a
                                    654 ;	lib/src/stm8s_tim2.c: 613: TIM2->CCMR2 |= (uint8_t)TIM2_CCMR_OCxPE;
      0088B6 C6 53 08         [ 1]  655 	ld	a, 0x5308
                                    656 ;	lib/src/stm8s_tim2.c: 611: if (NewState != DISABLE)
      0088B9 0D 01            [ 1]  657 	tnz	(0x01, sp)
      0088BB 27 07            [ 1]  658 	jreq	00102$
                                    659 ;	lib/src/stm8s_tim2.c: 613: TIM2->CCMR2 |= (uint8_t)TIM2_CCMR_OCxPE;
      0088BD AA 08            [ 1]  660 	or	a, #0x08
      0088BF C7 53 08         [ 1]  661 	ld	0x5308, a
      0088C2 20 05            [ 2]  662 	jra	00104$
      0088C4                        663 00102$:
                                    664 ;	lib/src/stm8s_tim2.c: 617: TIM2->CCMR2 &= (uint8_t)(~TIM2_CCMR_OCxPE);
      0088C4 A4 F7            [ 1]  665 	and	a, #0xf7
      0088C6 C7 53 08         [ 1]  666 	ld	0x5308, a
      0088C9                        667 00104$:
                                    668 ;	lib/src/stm8s_tim2.c: 619: }
      0088C9 84               [ 1]  669 	pop	a
      0088CA 81               [ 4]  670 	ret
                                    671 ;	lib/src/stm8s_tim2.c: 627: void TIM2_OC3PreloadConfig(FunctionalState NewState)
                                    672 ;	-----------------------------------------
                                    673 ;	 function TIM2_OC3PreloadConfig
                                    674 ;	-----------------------------------------
      0088CB                        675 _TIM2_OC3PreloadConfig:
      0088CB 88               [ 1]  676 	push	a
      0088CC 6B 01            [ 1]  677 	ld	(0x01, sp), a
                                    678 ;	lib/src/stm8s_tim2.c: 635: TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
      0088CE C6 53 09         [ 1]  679 	ld	a, 0x5309
                                    680 ;	lib/src/stm8s_tim2.c: 633: if (NewState != DISABLE)
      0088D1 0D 01            [ 1]  681 	tnz	(0x01, sp)
      0088D3 27 07            [ 1]  682 	jreq	00102$
                                    683 ;	lib/src/stm8s_tim2.c: 635: TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
      0088D5 AA 08            [ 1]  684 	or	a, #0x08
      0088D7 C7 53 09         [ 1]  685 	ld	0x5309, a
      0088DA 20 05            [ 2]  686 	jra	00104$
      0088DC                        687 00102$:
                                    688 ;	lib/src/stm8s_tim2.c: 639: TIM2->CCMR3 &= (uint8_t)(~TIM2_CCMR_OCxPE);
      0088DC A4 F7            [ 1]  689 	and	a, #0xf7
      0088DE C7 53 09         [ 1]  690 	ld	0x5309, a
      0088E1                        691 00104$:
                                    692 ;	lib/src/stm8s_tim2.c: 641: }
      0088E1 84               [ 1]  693 	pop	a
      0088E2 81               [ 4]  694 	ret
                                    695 ;	lib/src/stm8s_tim2.c: 653: void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
                                    696 ;	-----------------------------------------
                                    697 ;	 function TIM2_GenerateEvent
                                    698 ;	-----------------------------------------
      0088E3                        699 _TIM2_GenerateEvent:
                                    700 ;	lib/src/stm8s_tim2.c: 659: TIM2->EGR = (uint8_t)TIM2_EventSource;
      0088E3 C7 53 06         [ 1]  701 	ld	0x5306, a
                                    702 ;	lib/src/stm8s_tim2.c: 660: }
      0088E6 81               [ 4]  703 	ret
                                    704 ;	lib/src/stm8s_tim2.c: 670: void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
                                    705 ;	-----------------------------------------
                                    706 ;	 function TIM2_OC1PolarityConfig
                                    707 ;	-----------------------------------------
      0088E7                        708 _TIM2_OC1PolarityConfig:
      0088E7 88               [ 1]  709 	push	a
      0088E8 6B 01            [ 1]  710 	ld	(0x01, sp), a
                                    711 ;	lib/src/stm8s_tim2.c: 678: TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
      0088EA C6 53 0A         [ 1]  712 	ld	a, 0x530a
                                    713 ;	lib/src/stm8s_tim2.c: 676: if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
      0088ED 0D 01            [ 1]  714 	tnz	(0x01, sp)
      0088EF 27 07            [ 1]  715 	jreq	00102$
                                    716 ;	lib/src/stm8s_tim2.c: 678: TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
      0088F1 AA 02            [ 1]  717 	or	a, #0x02
      0088F3 C7 53 0A         [ 1]  718 	ld	0x530a, a
      0088F6 20 05            [ 2]  719 	jra	00104$
      0088F8                        720 00102$:
                                    721 ;	lib/src/stm8s_tim2.c: 682: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
      0088F8 A4 FD            [ 1]  722 	and	a, #0xfd
      0088FA C7 53 0A         [ 1]  723 	ld	0x530a, a
      0088FD                        724 00104$:
                                    725 ;	lib/src/stm8s_tim2.c: 684: }
      0088FD 84               [ 1]  726 	pop	a
      0088FE 81               [ 4]  727 	ret
                                    728 ;	lib/src/stm8s_tim2.c: 694: void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
                                    729 ;	-----------------------------------------
                                    730 ;	 function TIM2_OC2PolarityConfig
                                    731 ;	-----------------------------------------
      0088FF                        732 _TIM2_OC2PolarityConfig:
      0088FF 88               [ 1]  733 	push	a
      008900 6B 01            [ 1]  734 	ld	(0x01, sp), a
                                    735 ;	lib/src/stm8s_tim2.c: 702: TIM2->CCER1 |= TIM2_CCER1_CC2P;
      008902 C6 53 0A         [ 1]  736 	ld	a, 0x530a
                                    737 ;	lib/src/stm8s_tim2.c: 700: if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
      008905 0D 01            [ 1]  738 	tnz	(0x01, sp)
      008907 27 07            [ 1]  739 	jreq	00102$
                                    740 ;	lib/src/stm8s_tim2.c: 702: TIM2->CCER1 |= TIM2_CCER1_CC2P;
      008909 AA 20            [ 1]  741 	or	a, #0x20
      00890B C7 53 0A         [ 1]  742 	ld	0x530a, a
      00890E 20 05            [ 2]  743 	jra	00104$
      008910                        744 00102$:
                                    745 ;	lib/src/stm8s_tim2.c: 706: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
      008910 A4 DF            [ 1]  746 	and	a, #0xdf
      008912 C7 53 0A         [ 1]  747 	ld	0x530a, a
      008915                        748 00104$:
                                    749 ;	lib/src/stm8s_tim2.c: 708: }
      008915 84               [ 1]  750 	pop	a
      008916 81               [ 4]  751 	ret
                                    752 ;	lib/src/stm8s_tim2.c: 718: void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
                                    753 ;	-----------------------------------------
                                    754 ;	 function TIM2_OC3PolarityConfig
                                    755 ;	-----------------------------------------
      008917                        756 _TIM2_OC3PolarityConfig:
      008917 88               [ 1]  757 	push	a
      008918 6B 01            [ 1]  758 	ld	(0x01, sp), a
                                    759 ;	lib/src/stm8s_tim2.c: 726: TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
      00891A C6 53 0B         [ 1]  760 	ld	a, 0x530b
                                    761 ;	lib/src/stm8s_tim2.c: 724: if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
      00891D 0D 01            [ 1]  762 	tnz	(0x01, sp)
      00891F 27 07            [ 1]  763 	jreq	00102$
                                    764 ;	lib/src/stm8s_tim2.c: 726: TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
      008921 AA 02            [ 1]  765 	or	a, #0x02
      008923 C7 53 0B         [ 1]  766 	ld	0x530b, a
      008926 20 05            [ 2]  767 	jra	00104$
      008928                        768 00102$:
                                    769 ;	lib/src/stm8s_tim2.c: 730: TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
      008928 A4 FD            [ 1]  770 	and	a, #0xfd
      00892A C7 53 0B         [ 1]  771 	ld	0x530b, a
      00892D                        772 00104$:
                                    773 ;	lib/src/stm8s_tim2.c: 732: }
      00892D 84               [ 1]  774 	pop	a
      00892E 81               [ 4]  775 	ret
                                    776 ;	lib/src/stm8s_tim2.c: 745: void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
                                    777 ;	-----------------------------------------
                                    778 ;	 function TIM2_CCxCmd
                                    779 ;	-----------------------------------------
      00892F                        780 _TIM2_CCxCmd:
                                    781 ;	lib/src/stm8s_tim2.c: 751: if (TIM2_Channel == TIM2_CHANNEL_1)
      00892F 4D               [ 1]  782 	tnz	a
      008930 26 15            [ 1]  783 	jrne	00114$
                                    784 ;	lib/src/stm8s_tim2.c: 756: TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
      008932 C6 53 0A         [ 1]  785 	ld	a, 0x530a
                                    786 ;	lib/src/stm8s_tim2.c: 754: if (NewState != DISABLE)
      008935 0D 03            [ 1]  787 	tnz	(0x03, sp)
      008937 27 07            [ 1]  788 	jreq	00102$
                                    789 ;	lib/src/stm8s_tim2.c: 756: TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
      008939 AA 01            [ 1]  790 	or	a, #0x01
      00893B C7 53 0A         [ 1]  791 	ld	0x530a, a
      00893E 20 32            [ 2]  792 	jra	00116$
      008940                        793 00102$:
                                    794 ;	lib/src/stm8s_tim2.c: 760: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
      008940 A4 FE            [ 1]  795 	and	a, #0xfe
      008942 C7 53 0A         [ 1]  796 	ld	0x530a, a
      008945 20 2B            [ 2]  797 	jra	00116$
      008947                        798 00114$:
                                    799 ;	lib/src/stm8s_tim2.c: 764: else if (TIM2_Channel == TIM2_CHANNEL_2)
      008947 4A               [ 1]  800 	dec	a
      008948 26 15            [ 1]  801 	jrne	00111$
                                    802 ;	lib/src/stm8s_tim2.c: 756: TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
      00894A C6 53 0A         [ 1]  803 	ld	a, 0x530a
                                    804 ;	lib/src/stm8s_tim2.c: 767: if (NewState != DISABLE)
      00894D 0D 03            [ 1]  805 	tnz	(0x03, sp)
      00894F 27 07            [ 1]  806 	jreq	00105$
                                    807 ;	lib/src/stm8s_tim2.c: 769: TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
      008951 AA 10            [ 1]  808 	or	a, #0x10
      008953 C7 53 0A         [ 1]  809 	ld	0x530a, a
      008956 20 1A            [ 2]  810 	jra	00116$
      008958                        811 00105$:
                                    812 ;	lib/src/stm8s_tim2.c: 773: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
      008958 A4 EF            [ 1]  813 	and	a, #0xef
      00895A C7 53 0A         [ 1]  814 	ld	0x530a, a
      00895D 20 13            [ 2]  815 	jra	00116$
      00895F                        816 00111$:
                                    817 ;	lib/src/stm8s_tim2.c: 781: TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
      00895F C6 53 0B         [ 1]  818 	ld	a, 0x530b
                                    819 ;	lib/src/stm8s_tim2.c: 779: if (NewState != DISABLE)
      008962 0D 03            [ 1]  820 	tnz	(0x03, sp)
      008964 27 07            [ 1]  821 	jreq	00108$
                                    822 ;	lib/src/stm8s_tim2.c: 781: TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
      008966 AA 01            [ 1]  823 	or	a, #0x01
      008968 C7 53 0B         [ 1]  824 	ld	0x530b, a
      00896B 20 05            [ 2]  825 	jra	00116$
      00896D                        826 00108$:
                                    827 ;	lib/src/stm8s_tim2.c: 785: TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
      00896D A4 FE            [ 1]  828 	and	a, #0xfe
      00896F C7 53 0B         [ 1]  829 	ld	0x530b, a
      008972                        830 00116$:
                                    831 ;	lib/src/stm8s_tim2.c: 788: }
      008972 85               [ 2]  832 	popw	x
      008973 84               [ 1]  833 	pop	a
      008974 FC               [ 2]  834 	jp	(x)
                                    835 ;	lib/src/stm8s_tim2.c: 810: void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
                                    836 ;	-----------------------------------------
                                    837 ;	 function TIM2_SelectOCxM
                                    838 ;	-----------------------------------------
      008975                        839 _TIM2_SelectOCxM:
                                    840 ;	lib/src/stm8s_tim2.c: 816: if (TIM2_Channel == TIM2_CHANNEL_1)
      008975 4D               [ 1]  841 	tnz	a
      008976 26 10            [ 1]  842 	jrne	00105$
                                    843 ;	lib/src/stm8s_tim2.c: 819: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
      008978 72 11 53 0A      [ 1]  844 	bres	0x530a, #0
                                    845 ;	lib/src/stm8s_tim2.c: 822: TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
      00897C C6 53 07         [ 1]  846 	ld	a, 0x5307
      00897F A4 8F            [ 1]  847 	and	a, #0x8f
                                    848 ;	lib/src/stm8s_tim2.c: 823: | (uint8_t)TIM2_OCMode);
      008981 1A 03            [ 1]  849 	or	a, (0x03, sp)
      008983 C7 53 07         [ 1]  850 	ld	0x5307, a
      008986 20 21            [ 2]  851 	jra	00107$
      008988                        852 00105$:
                                    853 ;	lib/src/stm8s_tim2.c: 825: else if (TIM2_Channel == TIM2_CHANNEL_2)
      008988 4A               [ 1]  854 	dec	a
      008989 26 10            [ 1]  855 	jrne	00102$
                                    856 ;	lib/src/stm8s_tim2.c: 828: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
      00898B 72 19 53 0A      [ 1]  857 	bres	0x530a, #4
                                    858 ;	lib/src/stm8s_tim2.c: 831: TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
      00898F C6 53 08         [ 1]  859 	ld	a, 0x5308
      008992 A4 8F            [ 1]  860 	and	a, #0x8f
                                    861 ;	lib/src/stm8s_tim2.c: 832: | (uint8_t)TIM2_OCMode);
      008994 1A 03            [ 1]  862 	or	a, (0x03, sp)
      008996 C7 53 08         [ 1]  863 	ld	0x5308, a
      008999 20 0E            [ 2]  864 	jra	00107$
      00899B                        865 00102$:
                                    866 ;	lib/src/stm8s_tim2.c: 837: TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
      00899B 72 11 53 0B      [ 1]  867 	bres	0x530b, #0
                                    868 ;	lib/src/stm8s_tim2.c: 840: TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
      00899F C6 53 09         [ 1]  869 	ld	a, 0x5309
      0089A2 A4 8F            [ 1]  870 	and	a, #0x8f
                                    871 ;	lib/src/stm8s_tim2.c: 841: | (uint8_t)TIM2_OCMode);
      0089A4 1A 03            [ 1]  872 	or	a, (0x03, sp)
      0089A6 C7 53 09         [ 1]  873 	ld	0x5309, a
      0089A9                        874 00107$:
                                    875 ;	lib/src/stm8s_tim2.c: 843: }
      0089A9 85               [ 2]  876 	popw	x
      0089AA 84               [ 1]  877 	pop	a
      0089AB FC               [ 2]  878 	jp	(x)
                                    879 ;	lib/src/stm8s_tim2.c: 851: void TIM2_SetCounter(uint16_t Counter)
                                    880 ;	-----------------------------------------
                                    881 ;	 function TIM2_SetCounter
                                    882 ;	-----------------------------------------
      0089AC                        883 _TIM2_SetCounter:
                                    884 ;	lib/src/stm8s_tim2.c: 854: TIM2->CNTRH = (uint8_t)(Counter >> 8);
      0089AC 9E               [ 1]  885 	ld	a, xh
      0089AD C7 53 0C         [ 1]  886 	ld	0x530c, a
                                    887 ;	lib/src/stm8s_tim2.c: 855: TIM2->CNTRL = (uint8_t)(Counter);
      0089B0 9F               [ 1]  888 	ld	a, xl
      0089B1 C7 53 0D         [ 1]  889 	ld	0x530d, a
                                    890 ;	lib/src/stm8s_tim2.c: 856: }
      0089B4 81               [ 4]  891 	ret
                                    892 ;	lib/src/stm8s_tim2.c: 864: void TIM2_SetAutoreload(uint16_t Autoreload)
                                    893 ;	-----------------------------------------
                                    894 ;	 function TIM2_SetAutoreload
                                    895 ;	-----------------------------------------
      0089B5                        896 _TIM2_SetAutoreload:
                                    897 ;	lib/src/stm8s_tim2.c: 867: TIM2->ARRH = (uint8_t)(Autoreload >> 8);
      0089B5 9E               [ 1]  898 	ld	a, xh
      0089B6 C7 53 0F         [ 1]  899 	ld	0x530f, a
                                    900 ;	lib/src/stm8s_tim2.c: 868: TIM2->ARRL = (uint8_t)(Autoreload);
      0089B9 9F               [ 1]  901 	ld	a, xl
      0089BA C7 53 10         [ 1]  902 	ld	0x5310, a
                                    903 ;	lib/src/stm8s_tim2.c: 869: }
      0089BD 81               [ 4]  904 	ret
                                    905 ;	lib/src/stm8s_tim2.c: 877: void TIM2_SetCompare1(uint16_t Compare1)
                                    906 ;	-----------------------------------------
                                    907 ;	 function TIM2_SetCompare1
                                    908 ;	-----------------------------------------
      0089BE                        909 _TIM2_SetCompare1:
                                    910 ;	lib/src/stm8s_tim2.c: 880: TIM2->CCR1H = (uint8_t)(Compare1 >> 8);
      0089BE 9E               [ 1]  911 	ld	a, xh
      0089BF C7 53 11         [ 1]  912 	ld	0x5311, a
                                    913 ;	lib/src/stm8s_tim2.c: 881: TIM2->CCR1L = (uint8_t)(Compare1);
      0089C2 9F               [ 1]  914 	ld	a, xl
      0089C3 C7 53 12         [ 1]  915 	ld	0x5312, a
                                    916 ;	lib/src/stm8s_tim2.c: 882: }
      0089C6 81               [ 4]  917 	ret
                                    918 ;	lib/src/stm8s_tim2.c: 890: void TIM2_SetCompare2(uint16_t Compare2)
                                    919 ;	-----------------------------------------
                                    920 ;	 function TIM2_SetCompare2
                                    921 ;	-----------------------------------------
      0089C7                        922 _TIM2_SetCompare2:
                                    923 ;	lib/src/stm8s_tim2.c: 893: TIM2->CCR2H = (uint8_t)(Compare2 >> 8);
      0089C7 9E               [ 1]  924 	ld	a, xh
      0089C8 C7 53 13         [ 1]  925 	ld	0x5313, a
                                    926 ;	lib/src/stm8s_tim2.c: 894: TIM2->CCR2L = (uint8_t)(Compare2);
      0089CB 9F               [ 1]  927 	ld	a, xl
      0089CC C7 53 14         [ 1]  928 	ld	0x5314, a
                                    929 ;	lib/src/stm8s_tim2.c: 895: }
      0089CF 81               [ 4]  930 	ret
                                    931 ;	lib/src/stm8s_tim2.c: 903: void TIM2_SetCompare3(uint16_t Compare3)
                                    932 ;	-----------------------------------------
                                    933 ;	 function TIM2_SetCompare3
                                    934 ;	-----------------------------------------
      0089D0                        935 _TIM2_SetCompare3:
                                    936 ;	lib/src/stm8s_tim2.c: 906: TIM2->CCR3H = (uint8_t)(Compare3 >> 8);
      0089D0 9E               [ 1]  937 	ld	a, xh
      0089D1 C7 53 15         [ 1]  938 	ld	0x5315, a
                                    939 ;	lib/src/stm8s_tim2.c: 907: TIM2->CCR3L = (uint8_t)(Compare3);
      0089D4 9F               [ 1]  940 	ld	a, xl
      0089D5 C7 53 16         [ 1]  941 	ld	0x5316, a
                                    942 ;	lib/src/stm8s_tim2.c: 908: }
      0089D8 81               [ 4]  943 	ret
                                    944 ;	lib/src/stm8s_tim2.c: 920: void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
                                    945 ;	-----------------------------------------
                                    946 ;	 function TIM2_SetIC1Prescaler
                                    947 ;	-----------------------------------------
      0089D9                        948 _TIM2_SetIC1Prescaler:
      0089D9 88               [ 1]  949 	push	a
      0089DA 6B 01            [ 1]  950 	ld	(0x01, sp), a
                                    951 ;	lib/src/stm8s_tim2.c: 926: TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_ICxPSC))
      0089DC C6 53 07         [ 1]  952 	ld	a, 0x5307
      0089DF A4 F3            [ 1]  953 	and	a, #0xf3
                                    954 ;	lib/src/stm8s_tim2.c: 927: | (uint8_t)TIM2_IC1Prescaler);
      0089E1 1A 01            [ 1]  955 	or	a, (0x01, sp)
      0089E3 C7 53 07         [ 1]  956 	ld	0x5307, a
                                    957 ;	lib/src/stm8s_tim2.c: 928: }
      0089E6 84               [ 1]  958 	pop	a
      0089E7 81               [ 4]  959 	ret
                                    960 ;	lib/src/stm8s_tim2.c: 940: void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
                                    961 ;	-----------------------------------------
                                    962 ;	 function TIM2_SetIC2Prescaler
                                    963 ;	-----------------------------------------
      0089E8                        964 _TIM2_SetIC2Prescaler:
      0089E8 88               [ 1]  965 	push	a
      0089E9 6B 01            [ 1]  966 	ld	(0x01, sp), a
                                    967 ;	lib/src/stm8s_tim2.c: 946: TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_ICxPSC))
      0089EB C6 53 08         [ 1]  968 	ld	a, 0x5308
      0089EE A4 F3            [ 1]  969 	and	a, #0xf3
                                    970 ;	lib/src/stm8s_tim2.c: 947: | (uint8_t)TIM2_IC2Prescaler);
      0089F0 1A 01            [ 1]  971 	or	a, (0x01, sp)
      0089F2 C7 53 08         [ 1]  972 	ld	0x5308, a
                                    973 ;	lib/src/stm8s_tim2.c: 948: }
      0089F5 84               [ 1]  974 	pop	a
      0089F6 81               [ 4]  975 	ret
                                    976 ;	lib/src/stm8s_tim2.c: 960: void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
                                    977 ;	-----------------------------------------
                                    978 ;	 function TIM2_SetIC3Prescaler
                                    979 ;	-----------------------------------------
      0089F7                        980 _TIM2_SetIC3Prescaler:
      0089F7 88               [ 1]  981 	push	a
      0089F8 6B 01            [ 1]  982 	ld	(0x01, sp), a
                                    983 ;	lib/src/stm8s_tim2.c: 966: TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_ICxPSC))
      0089FA C6 53 09         [ 1]  984 	ld	a, 0x5309
      0089FD A4 F3            [ 1]  985 	and	a, #0xf3
                                    986 ;	lib/src/stm8s_tim2.c: 967: | (uint8_t)TIM2_IC3Prescaler);
      0089FF 1A 01            [ 1]  987 	or	a, (0x01, sp)
      008A01 C7 53 09         [ 1]  988 	ld	0x5309, a
                                    989 ;	lib/src/stm8s_tim2.c: 968: }
      008A04 84               [ 1]  990 	pop	a
      008A05 81               [ 4]  991 	ret
                                    992 ;	lib/src/stm8s_tim2.c: 975: uint16_t TIM2_GetCapture1(void)
                                    993 ;	-----------------------------------------
                                    994 ;	 function TIM2_GetCapture1
                                    995 ;	-----------------------------------------
      008A06                        996 _TIM2_GetCapture1:
      008A06 52 02            [ 2]  997 	sub	sp, #2
                                    998 ;	lib/src/stm8s_tim2.c: 981: tmpccr1h = TIM2->CCR1H;
      008A08 C6 53 11         [ 1]  999 	ld	a, 0x5311
      008A0B 95               [ 1] 1000 	ld	xh, a
                                   1001 ;	lib/src/stm8s_tim2.c: 982: tmpccr1l = TIM2->CCR1L;
      008A0C C6 53 12         [ 1] 1002 	ld	a, 0x5312
                                   1003 ;	lib/src/stm8s_tim2.c: 984: tmpccr1 = (uint16_t)(tmpccr1l);
      008A0F 6B 02            [ 1] 1004 	ld	(0x02, sp), a
      008A11 0F 01            [ 1] 1005 	clr	(0x01, sp)
                                   1006 ;	lib/src/stm8s_tim2.c: 985: tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
      008A13 7B 02            [ 1] 1007 	ld	a, (0x02, sp)
      008A15 02               [ 1] 1008 	rlwa	x
      008A16 1A 01            [ 1] 1009 	or	a, (0x01, sp)
                                   1010 ;	lib/src/stm8s_tim2.c: 987: return (uint16_t)tmpccr1;
      008A18 95               [ 1] 1011 	ld	xh, a
                                   1012 ;	lib/src/stm8s_tim2.c: 988: }
      008A19 5B 02            [ 2] 1013 	addw	sp, #2
      008A1B 81               [ 4] 1014 	ret
                                   1015 ;	lib/src/stm8s_tim2.c: 995: uint16_t TIM2_GetCapture2(void)
                                   1016 ;	-----------------------------------------
                                   1017 ;	 function TIM2_GetCapture2
                                   1018 ;	-----------------------------------------
      008A1C                       1019 _TIM2_GetCapture2:
      008A1C 52 02            [ 2] 1020 	sub	sp, #2
                                   1021 ;	lib/src/stm8s_tim2.c: 1001: tmpccr2h = TIM2->CCR2H;
      008A1E C6 53 13         [ 1] 1022 	ld	a, 0x5313
      008A21 95               [ 1] 1023 	ld	xh, a
                                   1024 ;	lib/src/stm8s_tim2.c: 1002: tmpccr2l = TIM2->CCR2L;
      008A22 C6 53 14         [ 1] 1025 	ld	a, 0x5314
                                   1026 ;	lib/src/stm8s_tim2.c: 1004: tmpccr2 = (uint16_t)(tmpccr2l);
      008A25 6B 02            [ 1] 1027 	ld	(0x02, sp), a
      008A27 0F 01            [ 1] 1028 	clr	(0x01, sp)
                                   1029 ;	lib/src/stm8s_tim2.c: 1005: tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
      008A29 7B 02            [ 1] 1030 	ld	a, (0x02, sp)
      008A2B 02               [ 1] 1031 	rlwa	x
      008A2C 1A 01            [ 1] 1032 	or	a, (0x01, sp)
                                   1033 ;	lib/src/stm8s_tim2.c: 1007: return (uint16_t)tmpccr2;
      008A2E 95               [ 1] 1034 	ld	xh, a
                                   1035 ;	lib/src/stm8s_tim2.c: 1008: }
      008A2F 5B 02            [ 2] 1036 	addw	sp, #2
      008A31 81               [ 4] 1037 	ret
                                   1038 ;	lib/src/stm8s_tim2.c: 1015: uint16_t TIM2_GetCapture3(void)
                                   1039 ;	-----------------------------------------
                                   1040 ;	 function TIM2_GetCapture3
                                   1041 ;	-----------------------------------------
      008A32                       1042 _TIM2_GetCapture3:
      008A32 52 02            [ 2] 1043 	sub	sp, #2
                                   1044 ;	lib/src/stm8s_tim2.c: 1021: tmpccr3h = TIM2->CCR3H;
      008A34 C6 53 15         [ 1] 1045 	ld	a, 0x5315
      008A37 95               [ 1] 1046 	ld	xh, a
                                   1047 ;	lib/src/stm8s_tim2.c: 1022: tmpccr3l = TIM2->CCR3L;
      008A38 C6 53 16         [ 1] 1048 	ld	a, 0x5316
                                   1049 ;	lib/src/stm8s_tim2.c: 1024: tmpccr3 = (uint16_t)(tmpccr3l);
      008A3B 6B 02            [ 1] 1050 	ld	(0x02, sp), a
      008A3D 0F 01            [ 1] 1051 	clr	(0x01, sp)
                                   1052 ;	lib/src/stm8s_tim2.c: 1025: tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
      008A3F 7B 02            [ 1] 1053 	ld	a, (0x02, sp)
      008A41 02               [ 1] 1054 	rlwa	x
      008A42 1A 01            [ 1] 1055 	or	a, (0x01, sp)
                                   1056 ;	lib/src/stm8s_tim2.c: 1027: return (uint16_t)tmpccr3;
      008A44 95               [ 1] 1057 	ld	xh, a
                                   1058 ;	lib/src/stm8s_tim2.c: 1028: }
      008A45 5B 02            [ 2] 1059 	addw	sp, #2
      008A47 81               [ 4] 1060 	ret
                                   1061 ;	lib/src/stm8s_tim2.c: 1035: uint16_t TIM2_GetCounter(void)
                                   1062 ;	-----------------------------------------
                                   1063 ;	 function TIM2_GetCounter
                                   1064 ;	-----------------------------------------
      008A48                       1065 _TIM2_GetCounter:
      008A48 52 04            [ 2] 1066 	sub	sp, #4
                                   1067 ;	lib/src/stm8s_tim2.c: 1039: tmpcntr =  ((uint16_t)TIM2->CNTRH << 8);
      008A4A C6 53 0C         [ 1] 1068 	ld	a, 0x530c
      008A4D 95               [ 1] 1069 	ld	xh, a
      008A4E 0F 02            [ 1] 1070 	clr	(0x02, sp)
                                   1071 ;	lib/src/stm8s_tim2.c: 1041: return (uint16_t)( tmpcntr| (uint16_t)(TIM2->CNTRL));
      008A50 C6 53 0D         [ 1] 1072 	ld	a, 0x530d
      008A53 0F 03            [ 1] 1073 	clr	(0x03, sp)
      008A55 1A 02            [ 1] 1074 	or	a, (0x02, sp)
      008A57 02               [ 1] 1075 	rlwa	x
      008A58 1A 03            [ 1] 1076 	or	a, (0x03, sp)
      008A5A 95               [ 1] 1077 	ld	xh, a
                                   1078 ;	lib/src/stm8s_tim2.c: 1042: }
      008A5B 5B 04            [ 2] 1079 	addw	sp, #4
      008A5D 81               [ 4] 1080 	ret
                                   1081 ;	lib/src/stm8s_tim2.c: 1049: TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
                                   1082 ;	-----------------------------------------
                                   1083 ;	 function TIM2_GetPrescaler
                                   1084 ;	-----------------------------------------
      008A5E                       1085 _TIM2_GetPrescaler:
                                   1086 ;	lib/src/stm8s_tim2.c: 1052: return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
      008A5E C6 53 0E         [ 1] 1087 	ld	a, 0x530e
                                   1088 ;	lib/src/stm8s_tim2.c: 1053: }
      008A61 81               [ 4] 1089 	ret
                                   1090 ;	lib/src/stm8s_tim2.c: 1068: FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
                                   1091 ;	-----------------------------------------
                                   1092 ;	 function TIM2_GetFlagStatus
                                   1093 ;	-----------------------------------------
      008A62                       1094 _TIM2_GetFlagStatus:
      008A62 88               [ 1] 1095 	push	a
                                   1096 ;	lib/src/stm8s_tim2.c: 1076: tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_FLAG);
      008A63 C6 53 04         [ 1] 1097 	ld	a, 0x5304
      008A66 6B 01            [ 1] 1098 	ld	(0x01, sp), a
      008A68 9F               [ 1] 1099 	ld	a, xl
      008A69 14 01            [ 1] 1100 	and	a, (0x01, sp)
      008A6B 6B 01            [ 1] 1101 	ld	(0x01, sp), a
                                   1102 ;	lib/src/stm8s_tim2.c: 1077: tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
                                   1103 ;	lib/src/stm8s_tim2.c: 1079: if ((tim2_flag_l | (uint8_t)(TIM2->SR2 & tim2_flag_h)) != (uint8_t)RESET )
      008A6D C6 53 05         [ 1] 1104 	ld	a, 0x5305
      008A70 89               [ 2] 1105 	pushw	x
      008A71 14 01            [ 1] 1106 	and	a, (1, sp)
      008A73 85               [ 2] 1107 	popw	x
      008A74 1A 01            [ 1] 1108 	or	a, (0x01, sp)
      008A76 27 03            [ 1] 1109 	jreq	00102$
                                   1110 ;	lib/src/stm8s_tim2.c: 1081: bitstatus = SET;
      008A78 A6 01            [ 1] 1111 	ld	a, #0x01
                                   1112 ;	lib/src/stm8s_tim2.c: 1085: bitstatus = RESET;
      008A7A 21                    1113 	.byte 0x21
      008A7B                       1114 00102$:
      008A7B 4F               [ 1] 1115 	clr	a
      008A7C                       1116 00103$:
                                   1117 ;	lib/src/stm8s_tim2.c: 1087: return (FlagStatus)bitstatus;
                                   1118 ;	lib/src/stm8s_tim2.c: 1088: }
      008A7C 5B 01            [ 2] 1119 	addw	sp, #1
      008A7E 81               [ 4] 1120 	ret
                                   1121 ;	lib/src/stm8s_tim2.c: 1103: void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
                                   1122 ;	-----------------------------------------
                                   1123 ;	 function TIM2_ClearFlag
                                   1124 ;	-----------------------------------------
      008A7F                       1125 _TIM2_ClearFlag:
                                   1126 ;	lib/src/stm8s_tim2.c: 1109: TIM2->SR1 = (uint8_t)(~((uint8_t)(TIM2_FLAG)));
      008A7F 9F               [ 1] 1127 	ld	a, xl
      008A80 43               [ 1] 1128 	cpl	a
      008A81 C7 53 04         [ 1] 1129 	ld	0x5304, a
                                   1130 ;	lib/src/stm8s_tim2.c: 1111: TIM2->SR2 = (uint8_t)(~((uint8_t)(TIM2_FLAG >> 8))); // [Roshan, 2015-Nov-09]
      008A84 9E               [ 1] 1131 	ld	a, xh
      008A85 43               [ 1] 1132 	cpl	a
      008A86 C7 53 05         [ 1] 1133 	ld	0x5305, a
                                   1134 ;	lib/src/stm8s_tim2.c: 1112: }
      008A89 81               [ 4] 1135 	ret
                                   1136 ;	lib/src/stm8s_tim2.c: 1124: ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
                                   1137 ;	-----------------------------------------
                                   1138 ;	 function TIM2_GetITStatus
                                   1139 ;	-----------------------------------------
      008A8A                       1140 _TIM2_GetITStatus:
      008A8A 52 02            [ 2] 1141 	sub	sp, #2
      008A8C 6B 02            [ 1] 1142 	ld	(0x02, sp), a
                                   1143 ;	lib/src/stm8s_tim2.c: 1132: TIM2_itStatus = (uint8_t)(TIM2->SR1 & TIM2_IT);
      008A8E C6 53 04         [ 1] 1144 	ld	a, 0x5304
      008A91 14 02            [ 1] 1145 	and	a, (0x02, sp)
      008A93 6B 01            [ 1] 1146 	ld	(0x01, sp), a
                                   1147 ;	lib/src/stm8s_tim2.c: 1134: TIM2_itEnable = (uint8_t)(TIM2->IER & TIM2_IT);
      008A95 C6 53 03         [ 1] 1148 	ld	a, 0x5303
      008A98 14 02            [ 1] 1149 	and	a, (0x02, sp)
                                   1150 ;	lib/src/stm8s_tim2.c: 1136: if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
      008A9A 0D 01            [ 1] 1151 	tnz	(0x01, sp)
      008A9C 27 06            [ 1] 1152 	jreq	00102$
      008A9E 4D               [ 1] 1153 	tnz	a
      008A9F 27 03            [ 1] 1154 	jreq	00102$
                                   1155 ;	lib/src/stm8s_tim2.c: 1138: bitstatus = SET;
      008AA1 A6 01            [ 1] 1156 	ld	a, #0x01
                                   1157 ;	lib/src/stm8s_tim2.c: 1142: bitstatus = RESET;
      008AA3 21                    1158 	.byte 0x21
      008AA4                       1159 00102$:
      008AA4 4F               [ 1] 1160 	clr	a
      008AA5                       1161 00103$:
                                   1162 ;	lib/src/stm8s_tim2.c: 1144: return (ITStatus)(bitstatus);
                                   1163 ;	lib/src/stm8s_tim2.c: 1145: }
      008AA5 5B 02            [ 2] 1164 	addw	sp, #2
      008AA7 81               [ 4] 1165 	ret
                                   1166 ;	lib/src/stm8s_tim2.c: 1157: void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
                                   1167 ;	-----------------------------------------
                                   1168 ;	 function TIM2_ClearITPendingBit
                                   1169 ;	-----------------------------------------
      008AA8                       1170 _TIM2_ClearITPendingBit:
                                   1171 ;	lib/src/stm8s_tim2.c: 1163: TIM2->SR1 = (uint8_t)(~TIM2_IT);
      008AA8 43               [ 1] 1172 	cpl	a
      008AA9 C7 53 04         [ 1] 1173 	ld	0x5304, a
                                   1174 ;	lib/src/stm8s_tim2.c: 1164: }
      008AAC 81               [ 4] 1175 	ret
                                   1176 ;	lib/src/stm8s_tim2.c: 1182: static void TI1_Config(uint8_t TIM2_ICPolarity,
                                   1177 ;	-----------------------------------------
                                   1178 ;	 function TI1_Config
                                   1179 ;	-----------------------------------------
      008AAD                       1180 _TI1_Config:
      008AAD 52 02            [ 2] 1181 	sub	sp, #2
      008AAF 6B 02            [ 1] 1182 	ld	(0x02, sp), a
                                   1183 ;	lib/src/stm8s_tim2.c: 1187: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
      008AB1 72 11 53 0A      [ 1] 1184 	bres	0x530a, #0
                                   1185 ;	lib/src/stm8s_tim2.c: 1190: TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
      008AB5 C6 53 07         [ 1] 1186 	ld	a, 0x5307
      008AB8 A4 0C            [ 1] 1187 	and	a, #0x0c
      008ABA 6B 01            [ 1] 1188 	ld	(0x01, sp), a
                                   1189 ;	lib/src/stm8s_tim2.c: 1191: | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
      008ABC 7B 06            [ 1] 1190 	ld	a, (0x06, sp)
      008ABE 4E               [ 1] 1191 	swap	a
      008ABF A4 F0            [ 1] 1192 	and	a, #0xf0
      008AC1 1A 05            [ 1] 1193 	or	a, (0x05, sp)
      008AC3 1A 01            [ 1] 1194 	or	a, (0x01, sp)
      008AC5 C7 53 07         [ 1] 1195 	ld	0x5307, a
                                   1196 ;	lib/src/stm8s_tim2.c: 1187: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
      008AC8 C6 53 0A         [ 1] 1197 	ld	a, 0x530a
                                   1198 ;	lib/src/stm8s_tim2.c: 1194: if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
      008ACB 0D 02            [ 1] 1199 	tnz	(0x02, sp)
      008ACD 27 07            [ 1] 1200 	jreq	00102$
                                   1201 ;	lib/src/stm8s_tim2.c: 1196: TIM2->CCER1 |= TIM2_CCER1_CC1P;
      008ACF AA 02            [ 1] 1202 	or	a, #0x02
      008AD1 C7 53 0A         [ 1] 1203 	ld	0x530a, a
      008AD4 20 05            [ 2] 1204 	jra	00103$
      008AD6                       1205 00102$:
                                   1206 ;	lib/src/stm8s_tim2.c: 1200: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
      008AD6 A4 FD            [ 1] 1207 	and	a, #0xfd
      008AD8 C7 53 0A         [ 1] 1208 	ld	0x530a, a
      008ADB                       1209 00103$:
                                   1210 ;	lib/src/stm8s_tim2.c: 1203: TIM2->CCER1 |= TIM2_CCER1_CC1E;
      008ADB C6 53 0A         [ 1] 1211 	ld	a, 0x530a
      008ADE AA 01            [ 1] 1212 	or	a, #0x01
      008AE0 C7 53 0A         [ 1] 1213 	ld	0x530a, a
                                   1214 ;	lib/src/stm8s_tim2.c: 1204: }
      008AE3 1E 03            [ 2] 1215 	ldw	x, (3, sp)
      008AE5 5B 06            [ 2] 1216 	addw	sp, #6
      008AE7 FC               [ 2] 1217 	jp	(x)
                                   1218 ;	lib/src/stm8s_tim2.c: 1222: static void TI2_Config(uint8_t TIM2_ICPolarity,
                                   1219 ;	-----------------------------------------
                                   1220 ;	 function TI2_Config
                                   1221 ;	-----------------------------------------
      008AE8                       1222 _TI2_Config:
      008AE8 52 02            [ 2] 1223 	sub	sp, #2
      008AEA 6B 02            [ 1] 1224 	ld	(0x02, sp), a
                                   1225 ;	lib/src/stm8s_tim2.c: 1227: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
      008AEC 72 19 53 0A      [ 1] 1226 	bres	0x530a, #4
                                   1227 ;	lib/src/stm8s_tim2.c: 1230: TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
      008AF0 C6 53 08         [ 1] 1228 	ld	a, 0x5308
      008AF3 A4 0C            [ 1] 1229 	and	a, #0x0c
      008AF5 6B 01            [ 1] 1230 	ld	(0x01, sp), a
                                   1231 ;	lib/src/stm8s_tim2.c: 1231: | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
      008AF7 7B 06            [ 1] 1232 	ld	a, (0x06, sp)
      008AF9 4E               [ 1] 1233 	swap	a
      008AFA A4 F0            [ 1] 1234 	and	a, #0xf0
      008AFC 1A 05            [ 1] 1235 	or	a, (0x05, sp)
      008AFE 1A 01            [ 1] 1236 	or	a, (0x01, sp)
      008B00 C7 53 08         [ 1] 1237 	ld	0x5308, a
                                   1238 ;	lib/src/stm8s_tim2.c: 1227: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
      008B03 C6 53 0A         [ 1] 1239 	ld	a, 0x530a
                                   1240 ;	lib/src/stm8s_tim2.c: 1235: if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
      008B06 0D 02            [ 1] 1241 	tnz	(0x02, sp)
      008B08 27 07            [ 1] 1242 	jreq	00102$
                                   1243 ;	lib/src/stm8s_tim2.c: 1237: TIM2->CCER1 |= TIM2_CCER1_CC2P;
      008B0A AA 20            [ 1] 1244 	or	a, #0x20
      008B0C C7 53 0A         [ 1] 1245 	ld	0x530a, a
      008B0F 20 05            [ 2] 1246 	jra	00103$
      008B11                       1247 00102$:
                                   1248 ;	lib/src/stm8s_tim2.c: 1241: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
      008B11 A4 DF            [ 1] 1249 	and	a, #0xdf
      008B13 C7 53 0A         [ 1] 1250 	ld	0x530a, a
      008B16                       1251 00103$:
                                   1252 ;	lib/src/stm8s_tim2.c: 1245: TIM2->CCER1 |= TIM2_CCER1_CC2E;
      008B16 C6 53 0A         [ 1] 1253 	ld	a, 0x530a
      008B19 AA 10            [ 1] 1254 	or	a, #0x10
      008B1B C7 53 0A         [ 1] 1255 	ld	0x530a, a
                                   1256 ;	lib/src/stm8s_tim2.c: 1246: }
      008B1E 1E 03            [ 2] 1257 	ldw	x, (3, sp)
      008B20 5B 06            [ 2] 1258 	addw	sp, #6
      008B22 FC               [ 2] 1259 	jp	(x)
                                   1260 ;	lib/src/stm8s_tim2.c: 1262: static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
                                   1261 ;	-----------------------------------------
                                   1262 ;	 function TI3_Config
                                   1263 ;	-----------------------------------------
      008B23                       1264 _TI3_Config:
      008B23 52 02            [ 2] 1265 	sub	sp, #2
      008B25 6B 02            [ 1] 1266 	ld	(0x02, sp), a
                                   1267 ;	lib/src/stm8s_tim2.c: 1266: TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
      008B27 72 11 53 0B      [ 1] 1268 	bres	0x530b, #0
                                   1269 ;	lib/src/stm8s_tim2.c: 1269: TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF)))
      008B2B C6 53 09         [ 1] 1270 	ld	a, 0x5309
      008B2E A4 0C            [ 1] 1271 	and	a, #0x0c
      008B30 6B 01            [ 1] 1272 	ld	(0x01, sp), a
                                   1273 ;	lib/src/stm8s_tim2.c: 1270: | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
      008B32 7B 06            [ 1] 1274 	ld	a, (0x06, sp)
      008B34 4E               [ 1] 1275 	swap	a
      008B35 A4 F0            [ 1] 1276 	and	a, #0xf0
      008B37 1A 05            [ 1] 1277 	or	a, (0x05, sp)
      008B39 1A 01            [ 1] 1278 	or	a, (0x01, sp)
      008B3B C7 53 09         [ 1] 1279 	ld	0x5309, a
                                   1280 ;	lib/src/stm8s_tim2.c: 1266: TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
      008B3E C6 53 0B         [ 1] 1281 	ld	a, 0x530b
                                   1282 ;	lib/src/stm8s_tim2.c: 1274: if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
      008B41 0D 02            [ 1] 1283 	tnz	(0x02, sp)
      008B43 27 07            [ 1] 1284 	jreq	00102$
                                   1285 ;	lib/src/stm8s_tim2.c: 1276: TIM2->CCER2 |= TIM2_CCER2_CC3P;
      008B45 AA 02            [ 1] 1286 	or	a, #0x02
      008B47 C7 53 0B         [ 1] 1287 	ld	0x530b, a
      008B4A 20 05            [ 2] 1288 	jra	00103$
      008B4C                       1289 00102$:
                                   1290 ;	lib/src/stm8s_tim2.c: 1280: TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
      008B4C A4 FD            [ 1] 1291 	and	a, #0xfd
      008B4E C7 53 0B         [ 1] 1292 	ld	0x530b, a
      008B51                       1293 00103$:
                                   1294 ;	lib/src/stm8s_tim2.c: 1283: TIM2->CCER2 |= TIM2_CCER2_CC3E;
      008B51 C6 53 0B         [ 1] 1295 	ld	a, 0x530b
      008B54 AA 01            [ 1] 1296 	or	a, #0x01
      008B56 C7 53 0B         [ 1] 1297 	ld	0x530b, a
                                   1298 ;	lib/src/stm8s_tim2.c: 1284: }
      008B59 1E 03            [ 2] 1299 	ldw	x, (3, sp)
      008B5B 5B 06            [ 2] 1300 	addw	sp, #6
      008B5D FC               [ 2] 1301 	jp	(x)
                                   1302 	.area CODE
                                   1303 	.area CONST
                                   1304 	.area INITIALIZER
                                   1305 	.area CABS (ABS)
