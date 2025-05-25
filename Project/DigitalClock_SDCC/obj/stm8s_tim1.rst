                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.3.0 #14184 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_tim1
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _TIM1_DeInit
                                     12 	.globl _TIM1_TimeBaseInit
                                     13 	.globl _TIM1_OC1Init
                                     14 	.globl _TIM1_OC2Init
                                     15 	.globl _TIM1_OC3Init
                                     16 	.globl _TIM1_OC4Init
                                     17 	.globl _TIM1_BDTRConfig
                                     18 	.globl _TIM1_ICInit
                                     19 	.globl _TIM1_PWMIConfig
                                     20 	.globl _TIM1_Cmd
                                     21 	.globl _TIM1_CtrlPWMOutputs
                                     22 	.globl _TIM1_ITConfig
                                     23 	.globl _TIM1_InternalClockConfig
                                     24 	.globl _TIM1_ETRClockMode1Config
                                     25 	.globl _TIM1_ETRClockMode2Config
                                     26 	.globl _TIM1_ETRConfig
                                     27 	.globl _TIM1_TIxExternalClockConfig
                                     28 	.globl _TIM1_SelectInputTrigger
                                     29 	.globl _TIM1_UpdateDisableConfig
                                     30 	.globl _TIM1_UpdateRequestConfig
                                     31 	.globl _TIM1_SelectHallSensor
                                     32 	.globl _TIM1_SelectOnePulseMode
                                     33 	.globl _TIM1_SelectOutputTrigger
                                     34 	.globl _TIM1_SelectSlaveMode
                                     35 	.globl _TIM1_SelectMasterSlaveMode
                                     36 	.globl _TIM1_EncoderInterfaceConfig
                                     37 	.globl _TIM1_PrescalerConfig
                                     38 	.globl _TIM1_CounterModeConfig
                                     39 	.globl _TIM1_ForcedOC1Config
                                     40 	.globl _TIM1_ForcedOC2Config
                                     41 	.globl _TIM1_ForcedOC3Config
                                     42 	.globl _TIM1_ForcedOC4Config
                                     43 	.globl _TIM1_ARRPreloadConfig
                                     44 	.globl _TIM1_SelectCOM
                                     45 	.globl _TIM1_CCPreloadControl
                                     46 	.globl _TIM1_OC1PreloadConfig
                                     47 	.globl _TIM1_OC2PreloadConfig
                                     48 	.globl _TIM1_OC3PreloadConfig
                                     49 	.globl _TIM1_OC4PreloadConfig
                                     50 	.globl _TIM1_OC1FastConfig
                                     51 	.globl _TIM1_OC2FastConfig
                                     52 	.globl _TIM1_OC3FastConfig
                                     53 	.globl _TIM1_OC4FastConfig
                                     54 	.globl _TIM1_GenerateEvent
                                     55 	.globl _TIM1_OC1PolarityConfig
                                     56 	.globl _TIM1_OC1NPolarityConfig
                                     57 	.globl _TIM1_OC2PolarityConfig
                                     58 	.globl _TIM1_OC2NPolarityConfig
                                     59 	.globl _TIM1_OC3PolarityConfig
                                     60 	.globl _TIM1_OC3NPolarityConfig
                                     61 	.globl _TIM1_OC4PolarityConfig
                                     62 	.globl _TIM1_CCxCmd
                                     63 	.globl _TIM1_CCxNCmd
                                     64 	.globl _TIM1_SelectOCxM
                                     65 	.globl _TIM1_SetCounter
                                     66 	.globl _TIM1_SetAutoreload
                                     67 	.globl _TIM1_SetCompare1
                                     68 	.globl _TIM1_SetCompare2
                                     69 	.globl _TIM1_SetCompare3
                                     70 	.globl _TIM1_SetCompare4
                                     71 	.globl _TIM1_SetIC1Prescaler
                                     72 	.globl _TIM1_SetIC2Prescaler
                                     73 	.globl _TIM1_SetIC3Prescaler
                                     74 	.globl _TIM1_SetIC4Prescaler
                                     75 	.globl _TIM1_GetCapture1
                                     76 	.globl _TIM1_GetCapture2
                                     77 	.globl _TIM1_GetCapture3
                                     78 	.globl _TIM1_GetCapture4
                                     79 	.globl _TIM1_GetCounter
                                     80 	.globl _TIM1_GetPrescaler
                                     81 	.globl _TIM1_GetFlagStatus
                                     82 	.globl _TIM1_ClearFlag
                                     83 	.globl _TIM1_GetITStatus
                                     84 	.globl _TIM1_ClearITPendingBit
                                     85 ;--------------------------------------------------------
                                     86 ; ram data
                                     87 ;--------------------------------------------------------
                                     88 	.area DATA
                                     89 ;--------------------------------------------------------
                                     90 ; ram data
                                     91 ;--------------------------------------------------------
                                     92 	.area INITIALIZED
                                     93 ;--------------------------------------------------------
                                     94 ; absolute external ram data
                                     95 ;--------------------------------------------------------
                                     96 	.area DABS (ABS)
                                     97 
                                     98 ; default segment ordering for linker
                                     99 	.area HOME
                                    100 	.area GSINIT
                                    101 	.area GSFINAL
                                    102 	.area CONST
                                    103 	.area INITIALIZER
                                    104 	.area CODE
                                    105 
                                    106 ;--------------------------------------------------------
                                    107 ; global & static initialisations
                                    108 ;--------------------------------------------------------
                                    109 	.area HOME
                                    110 	.area GSINIT
                                    111 	.area GSFINAL
                                    112 	.area GSINIT
                                    113 ;--------------------------------------------------------
                                    114 ; Home
                                    115 ;--------------------------------------------------------
                                    116 	.area HOME
                                    117 	.area HOME
                                    118 ;--------------------------------------------------------
                                    119 ; code
                                    120 ;--------------------------------------------------------
                                    121 	.area CODE
                                    122 ;	lib/src/stm8s_tim1.c: 58: void TIM1_DeInit(void)
                                    123 ;	-----------------------------------------
                                    124 ;	 function TIM1_DeInit
                                    125 ;	-----------------------------------------
      009A51                        126 _TIM1_DeInit:
                                    127 ;	lib/src/stm8s_tim1.c: 60: TIM1->CR1  = TIM1_CR1_RESET_VALUE;
      009A51 35 00 52 50      [ 1]  128 	mov	0x5250+0, #0x00
                                    129 ;	lib/src/stm8s_tim1.c: 61: TIM1->CR2  = TIM1_CR2_RESET_VALUE;
      009A55 35 00 52 51      [ 1]  130 	mov	0x5251+0, #0x00
                                    131 ;	lib/src/stm8s_tim1.c: 62: TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
      009A59 35 00 52 52      [ 1]  132 	mov	0x5252+0, #0x00
                                    133 ;	lib/src/stm8s_tim1.c: 63: TIM1->ETR  = TIM1_ETR_RESET_VALUE;
      009A5D 35 00 52 53      [ 1]  134 	mov	0x5253+0, #0x00
                                    135 ;	lib/src/stm8s_tim1.c: 64: TIM1->IER  = TIM1_IER_RESET_VALUE;
      009A61 35 00 52 54      [ 1]  136 	mov	0x5254+0, #0x00
                                    137 ;	lib/src/stm8s_tim1.c: 65: TIM1->SR2  = TIM1_SR2_RESET_VALUE;
      009A65 35 00 52 56      [ 1]  138 	mov	0x5256+0, #0x00
                                    139 ;	lib/src/stm8s_tim1.c: 67: TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
      009A69 35 00 52 5C      [ 1]  140 	mov	0x525c+0, #0x00
                                    141 ;	lib/src/stm8s_tim1.c: 68: TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
      009A6D 35 00 52 5D      [ 1]  142 	mov	0x525d+0, #0x00
                                    143 ;	lib/src/stm8s_tim1.c: 70: TIM1->CCMR1 = 0x01;
      009A71 35 01 52 58      [ 1]  144 	mov	0x5258+0, #0x01
                                    145 ;	lib/src/stm8s_tim1.c: 71: TIM1->CCMR2 = 0x01;
      009A75 35 01 52 59      [ 1]  146 	mov	0x5259+0, #0x01
                                    147 ;	lib/src/stm8s_tim1.c: 72: TIM1->CCMR3 = 0x01;
      009A79 35 01 52 5A      [ 1]  148 	mov	0x525a+0, #0x01
                                    149 ;	lib/src/stm8s_tim1.c: 73: TIM1->CCMR4 = 0x01;
      009A7D 35 01 52 5B      [ 1]  150 	mov	0x525b+0, #0x01
                                    151 ;	lib/src/stm8s_tim1.c: 75: TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
      009A81 35 00 52 5C      [ 1]  152 	mov	0x525c+0, #0x00
                                    153 ;	lib/src/stm8s_tim1.c: 76: TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
      009A85 35 00 52 5D      [ 1]  154 	mov	0x525d+0, #0x00
                                    155 ;	lib/src/stm8s_tim1.c: 77: TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
      009A89 35 00 52 58      [ 1]  156 	mov	0x5258+0, #0x00
                                    157 ;	lib/src/stm8s_tim1.c: 78: TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
      009A8D 35 00 52 59      [ 1]  158 	mov	0x5259+0, #0x00
                                    159 ;	lib/src/stm8s_tim1.c: 79: TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
      009A91 35 00 52 5A      [ 1]  160 	mov	0x525a+0, #0x00
                                    161 ;	lib/src/stm8s_tim1.c: 80: TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
      009A95 35 00 52 5B      [ 1]  162 	mov	0x525b+0, #0x00
                                    163 ;	lib/src/stm8s_tim1.c: 81: TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
      009A99 35 00 52 5E      [ 1]  164 	mov	0x525e+0, #0x00
                                    165 ;	lib/src/stm8s_tim1.c: 82: TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
      009A9D 35 00 52 5F      [ 1]  166 	mov	0x525f+0, #0x00
                                    167 ;	lib/src/stm8s_tim1.c: 83: TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
      009AA1 35 00 52 60      [ 1]  168 	mov	0x5260+0, #0x00
                                    169 ;	lib/src/stm8s_tim1.c: 84: TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
      009AA5 35 00 52 61      [ 1]  170 	mov	0x5261+0, #0x00
                                    171 ;	lib/src/stm8s_tim1.c: 85: TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
      009AA9 35 FF 52 62      [ 1]  172 	mov	0x5262+0, #0xff
                                    173 ;	lib/src/stm8s_tim1.c: 86: TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
      009AAD 35 FF 52 63      [ 1]  174 	mov	0x5263+0, #0xff
                                    175 ;	lib/src/stm8s_tim1.c: 87: TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
      009AB1 35 00 52 65      [ 1]  176 	mov	0x5265+0, #0x00
                                    177 ;	lib/src/stm8s_tim1.c: 88: TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
      009AB5 35 00 52 66      [ 1]  178 	mov	0x5266+0, #0x00
                                    179 ;	lib/src/stm8s_tim1.c: 89: TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
      009AB9 35 00 52 67      [ 1]  180 	mov	0x5267+0, #0x00
                                    181 ;	lib/src/stm8s_tim1.c: 90: TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
      009ABD 35 00 52 68      [ 1]  182 	mov	0x5268+0, #0x00
                                    183 ;	lib/src/stm8s_tim1.c: 91: TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
      009AC1 35 00 52 69      [ 1]  184 	mov	0x5269+0, #0x00
                                    185 ;	lib/src/stm8s_tim1.c: 92: TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
      009AC5 35 00 52 6A      [ 1]  186 	mov	0x526a+0, #0x00
                                    187 ;	lib/src/stm8s_tim1.c: 93: TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
      009AC9 35 00 52 6B      [ 1]  188 	mov	0x526b+0, #0x00
                                    189 ;	lib/src/stm8s_tim1.c: 94: TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
      009ACD 35 00 52 6C      [ 1]  190 	mov	0x526c+0, #0x00
                                    191 ;	lib/src/stm8s_tim1.c: 95: TIM1->OISR  = TIM1_OISR_RESET_VALUE;
      009AD1 35 00 52 6F      [ 1]  192 	mov	0x526f+0, #0x00
                                    193 ;	lib/src/stm8s_tim1.c: 96: TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
      009AD5 35 01 52 57      [ 1]  194 	mov	0x5257+0, #0x01
                                    195 ;	lib/src/stm8s_tim1.c: 97: TIM1->DTR   = TIM1_DTR_RESET_VALUE;
      009AD9 35 00 52 6E      [ 1]  196 	mov	0x526e+0, #0x00
                                    197 ;	lib/src/stm8s_tim1.c: 98: TIM1->BKR   = TIM1_BKR_RESET_VALUE;
      009ADD 35 00 52 6D      [ 1]  198 	mov	0x526d+0, #0x00
                                    199 ;	lib/src/stm8s_tim1.c: 99: TIM1->RCR   = TIM1_RCR_RESET_VALUE;
      009AE1 35 00 52 64      [ 1]  200 	mov	0x5264+0, #0x00
                                    201 ;	lib/src/stm8s_tim1.c: 100: TIM1->SR1   = TIM1_SR1_RESET_VALUE;
      009AE5 35 00 52 55      [ 1]  202 	mov	0x5255+0, #0x00
                                    203 ;	lib/src/stm8s_tim1.c: 101: }
      009AE9 81               [ 4]  204 	ret
                                    205 ;	lib/src/stm8s_tim1.c: 111: void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
                                    206 ;	-----------------------------------------
                                    207 ;	 function TIM1_TimeBaseInit
                                    208 ;	-----------------------------------------
      009AEA                        209 _TIM1_TimeBaseInit:
      009AEA 88               [ 1]  210 	push	a
      009AEB 6B 01            [ 1]  211 	ld	(0x01, sp), a
                                    212 ;	lib/src/stm8s_tim1.c: 120: TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
      009AED 7B 04            [ 1]  213 	ld	a, (0x04, sp)
      009AEF C7 52 62         [ 1]  214 	ld	0x5262, a
                                    215 ;	lib/src/stm8s_tim1.c: 121: TIM1->ARRL = (uint8_t)(TIM1_Period);
      009AF2 7B 05            [ 1]  216 	ld	a, (0x05, sp)
      009AF4 C7 52 63         [ 1]  217 	ld	0x5263, a
                                    218 ;	lib/src/stm8s_tim1.c: 124: TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
      009AF7 9E               [ 1]  219 	ld	a, xh
      009AF8 C7 52 60         [ 1]  220 	ld	0x5260, a
                                    221 ;	lib/src/stm8s_tim1.c: 125: TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
      009AFB 9F               [ 1]  222 	ld	a, xl
      009AFC C7 52 61         [ 1]  223 	ld	0x5261, a
                                    224 ;	lib/src/stm8s_tim1.c: 128: TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
      009AFF C6 52 50         [ 1]  225 	ld	a, 0x5250
      009B02 A4 8F            [ 1]  226 	and	a, #0x8f
                                    227 ;	lib/src/stm8s_tim1.c: 129: | (uint8_t)(TIM1_CounterMode));
      009B04 1A 01            [ 1]  228 	or	a, (0x01, sp)
      009B06 C7 52 50         [ 1]  229 	ld	0x5250, a
                                    230 ;	lib/src/stm8s_tim1.c: 132: TIM1->RCR = TIM1_RepetitionCounter;
      009B09 AE 52 64         [ 2]  231 	ldw	x, #0x5264
      009B0C 7B 06            [ 1]  232 	ld	a, (0x06, sp)
      009B0E F7               [ 1]  233 	ld	(x), a
                                    234 ;	lib/src/stm8s_tim1.c: 133: }
      009B0F 1E 02            [ 2]  235 	ldw	x, (2, sp)
      009B11 5B 06            [ 2]  236 	addw	sp, #6
      009B13 FC               [ 2]  237 	jp	(x)
                                    238 ;	lib/src/stm8s_tim1.c: 154: void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
                                    239 ;	-----------------------------------------
                                    240 ;	 function TIM1_OC1Init
                                    241 ;	-----------------------------------------
      009B14                        242 _TIM1_OC1Init:
      009B14 52 04            [ 2]  243 	sub	sp, #4
      009B16 6B 04            [ 1]  244 	ld	(0x04, sp), a
                                    245 ;	lib/src/stm8s_tim1.c: 174: TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE 
      009B18 C6 52 5C         [ 1]  246 	ld	a, 0x525c
      009B1B A4 F0            [ 1]  247 	and	a, #0xf0
      009B1D C7 52 5C         [ 1]  248 	ld	0x525c, a
                                    249 ;	lib/src/stm8s_tim1.c: 178: TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
      009B20 C6 52 5C         [ 1]  250 	ld	a, 0x525c
      009B23 6B 01            [ 1]  251 	ld	(0x01, sp), a
      009B25 7B 07            [ 1]  252 	ld	a, (0x07, sp)
      009B27 A4 01            [ 1]  253 	and	a, #0x01
      009B29 6B 03            [ 1]  254 	ld	(0x03, sp), a
                                    255 ;	lib/src/stm8s_tim1.c: 179: | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
      009B2B 7B 08            [ 1]  256 	ld	a, (0x08, sp)
      009B2D A4 04            [ 1]  257 	and	a, #0x04
      009B2F 1A 03            [ 1]  258 	or	a, (0x03, sp)
      009B31 6B 02            [ 1]  259 	ld	(0x02, sp), a
                                    260 ;	lib/src/stm8s_tim1.c: 180: | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
      009B33 7B 0B            [ 1]  261 	ld	a, (0x0b, sp)
      009B35 A4 02            [ 1]  262 	and	a, #0x02
      009B37 6B 03            [ 1]  263 	ld	(0x03, sp), a
                                    264 ;	lib/src/stm8s_tim1.c: 181: | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
      009B39 7B 0C            [ 1]  265 	ld	a, (0x0c, sp)
      009B3B A4 08            [ 1]  266 	and	a, #0x08
      009B3D 1A 03            [ 1]  267 	or	a, (0x03, sp)
      009B3F 1A 02            [ 1]  268 	or	a, (0x02, sp)
      009B41 1A 01            [ 1]  269 	or	a, (0x01, sp)
      009B43 C7 52 5C         [ 1]  270 	ld	0x525c, a
                                    271 ;	lib/src/stm8s_tim1.c: 184: TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | 
      009B46 C6 52 58         [ 1]  272 	ld	a, 0x5258
      009B49 A4 8F            [ 1]  273 	and	a, #0x8f
                                    274 ;	lib/src/stm8s_tim1.c: 185: (uint8_t)TIM1_OCMode);
      009B4B 1A 04            [ 1]  275 	or	a, (0x04, sp)
      009B4D C7 52 58         [ 1]  276 	ld	0x5258, a
                                    277 ;	lib/src/stm8s_tim1.c: 188: TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
      009B50 C6 52 6F         [ 1]  278 	ld	a, 0x526f
      009B53 A4 FC            [ 1]  279 	and	a, #0xfc
      009B55 C7 52 6F         [ 1]  280 	ld	0x526f, a
                                    281 ;	lib/src/stm8s_tim1.c: 190: TIM1->OISR |= (uint8_t)((uint8_t)( TIM1_OCIdleState & TIM1_OISR_OIS1 ) | 
      009B58 C6 52 6F         [ 1]  282 	ld	a, 0x526f
      009B5B 6B 02            [ 1]  283 	ld	(0x02, sp), a
      009B5D 7B 0D            [ 1]  284 	ld	a, (0x0d, sp)
      009B5F A4 01            [ 1]  285 	and	a, #0x01
      009B61 6B 03            [ 1]  286 	ld	(0x03, sp), a
                                    287 ;	lib/src/stm8s_tim1.c: 191: (uint8_t)( TIM1_OCNIdleState & TIM1_OISR_OIS1N ));
      009B63 7B 0E            [ 1]  288 	ld	a, (0x0e, sp)
      009B65 A4 02            [ 1]  289 	and	a, #0x02
      009B67 1A 03            [ 1]  290 	or	a, (0x03, sp)
      009B69 1A 02            [ 1]  291 	or	a, (0x02, sp)
      009B6B C7 52 6F         [ 1]  292 	ld	0x526f, a
                                    293 ;	lib/src/stm8s_tim1.c: 194: TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
      009B6E 7B 09            [ 1]  294 	ld	a, (0x09, sp)
      009B70 C7 52 65         [ 1]  295 	ld	0x5265, a
                                    296 ;	lib/src/stm8s_tim1.c: 195: TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
      009B73 7B 0A            [ 1]  297 	ld	a, (0x0a, sp)
      009B75 C7 52 66         [ 1]  298 	ld	0x5266, a
                                    299 ;	lib/src/stm8s_tim1.c: 196: }
      009B78 1E 05            [ 2]  300 	ldw	x, (5, sp)
      009B7A 5B 0E            [ 2]  301 	addw	sp, #14
      009B7C FC               [ 2]  302 	jp	(x)
                                    303 ;	lib/src/stm8s_tim1.c: 217: void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
                                    304 ;	-----------------------------------------
                                    305 ;	 function TIM1_OC2Init
                                    306 ;	-----------------------------------------
      009B7D                        307 _TIM1_OC2Init:
      009B7D 52 04            [ 2]  308 	sub	sp, #4
      009B7F 6B 04            [ 1]  309 	ld	(0x04, sp), a
                                    310 ;	lib/src/stm8s_tim1.c: 237: TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
      009B81 C6 52 5C         [ 1]  311 	ld	a, 0x525c
      009B84 A4 0F            [ 1]  312 	and	a, #0x0f
      009B86 C7 52 5C         [ 1]  313 	ld	0x525c, a
                                    314 ;	lib/src/stm8s_tim1.c: 242: TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
      009B89 C6 52 5C         [ 1]  315 	ld	a, 0x525c
      009B8C 6B 01            [ 1]  316 	ld	(0x01, sp), a
      009B8E 7B 07            [ 1]  317 	ld	a, (0x07, sp)
      009B90 A4 10            [ 1]  318 	and	a, #0x10
      009B92 6B 03            [ 1]  319 	ld	(0x03, sp), a
                                    320 ;	lib/src/stm8s_tim1.c: 243: (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
      009B94 7B 08            [ 1]  321 	ld	a, (0x08, sp)
      009B96 A4 40            [ 1]  322 	and	a, #0x40
      009B98 1A 03            [ 1]  323 	or	a, (0x03, sp)
      009B9A 6B 02            [ 1]  324 	ld	(0x02, sp), a
                                    325 ;	lib/src/stm8s_tim1.c: 244: (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
      009B9C 7B 0B            [ 1]  326 	ld	a, (0x0b, sp)
      009B9E A4 20            [ 1]  327 	and	a, #0x20
      009BA0 6B 03            [ 1]  328 	ld	(0x03, sp), a
                                    329 ;	lib/src/stm8s_tim1.c: 245: (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
      009BA2 7B 0C            [ 1]  330 	ld	a, (0x0c, sp)
      009BA4 A4 80            [ 1]  331 	and	a, #0x80
      009BA6 1A 03            [ 1]  332 	or	a, (0x03, sp)
      009BA8 1A 02            [ 1]  333 	or	a, (0x02, sp)
      009BAA 1A 01            [ 1]  334 	or	a, (0x01, sp)
      009BAC C7 52 5C         [ 1]  335 	ld	0x525c, a
                                    336 ;	lib/src/stm8s_tim1.c: 248: TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
      009BAF C6 52 59         [ 1]  337 	ld	a, 0x5259
      009BB2 A4 8F            [ 1]  338 	and	a, #0x8f
                                    339 ;	lib/src/stm8s_tim1.c: 249: (uint8_t)TIM1_OCMode);
      009BB4 1A 04            [ 1]  340 	or	a, (0x04, sp)
      009BB6 C7 52 59         [ 1]  341 	ld	0x5259, a
                                    342 ;	lib/src/stm8s_tim1.c: 252: TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
      009BB9 C6 52 6F         [ 1]  343 	ld	a, 0x526f
      009BBC A4 F3            [ 1]  344 	and	a, #0xf3
      009BBE C7 52 6F         [ 1]  345 	ld	0x526f, a
                                    346 ;	lib/src/stm8s_tim1.c: 254: TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
      009BC1 C6 52 6F         [ 1]  347 	ld	a, 0x526f
      009BC4 6B 02            [ 1]  348 	ld	(0x02, sp), a
      009BC6 7B 0D            [ 1]  349 	ld	a, (0x0d, sp)
      009BC8 A4 04            [ 1]  350 	and	a, #0x04
      009BCA 6B 03            [ 1]  351 	ld	(0x03, sp), a
                                    352 ;	lib/src/stm8s_tim1.c: 255: (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
      009BCC 7B 0E            [ 1]  353 	ld	a, (0x0e, sp)
      009BCE A4 08            [ 1]  354 	and	a, #0x08
      009BD0 1A 03            [ 1]  355 	or	a, (0x03, sp)
      009BD2 1A 02            [ 1]  356 	or	a, (0x02, sp)
      009BD4 C7 52 6F         [ 1]  357 	ld	0x526f, a
                                    358 ;	lib/src/stm8s_tim1.c: 258: TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
      009BD7 7B 09            [ 1]  359 	ld	a, (0x09, sp)
      009BD9 C7 52 67         [ 1]  360 	ld	0x5267, a
                                    361 ;	lib/src/stm8s_tim1.c: 259: TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
      009BDC 7B 0A            [ 1]  362 	ld	a, (0x0a, sp)
      009BDE C7 52 68         [ 1]  363 	ld	0x5268, a
                                    364 ;	lib/src/stm8s_tim1.c: 260: }
      009BE1 1E 05            [ 2]  365 	ldw	x, (5, sp)
      009BE3 5B 0E            [ 2]  366 	addw	sp, #14
      009BE5 FC               [ 2]  367 	jp	(x)
                                    368 ;	lib/src/stm8s_tim1.c: 281: void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
                                    369 ;	-----------------------------------------
                                    370 ;	 function TIM1_OC3Init
                                    371 ;	-----------------------------------------
      009BE6                        372 _TIM1_OC3Init:
      009BE6 52 04            [ 2]  373 	sub	sp, #4
      009BE8 6B 04            [ 1]  374 	ld	(0x04, sp), a
                                    375 ;	lib/src/stm8s_tim1.c: 301: TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | 
      009BEA C6 52 5D         [ 1]  376 	ld	a, 0x525d
      009BED A4 F0            [ 1]  377 	and	a, #0xf0
      009BEF C7 52 5D         [ 1]  378 	ld	0x525d, a
                                    379 ;	lib/src/stm8s_tim1.c: 305: TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState  & TIM1_CCER2_CC3E   ) |
      009BF2 C6 52 5D         [ 1]  380 	ld	a, 0x525d
      009BF5 6B 01            [ 1]  381 	ld	(0x01, sp), a
      009BF7 7B 07            [ 1]  382 	ld	a, (0x07, sp)
      009BF9 A4 01            [ 1]  383 	and	a, #0x01
      009BFB 6B 03            [ 1]  384 	ld	(0x03, sp), a
                                    385 ;	lib/src/stm8s_tim1.c: 306: (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE  )) | 
      009BFD 7B 08            [ 1]  386 	ld	a, (0x08, sp)
      009BFF A4 04            [ 1]  387 	and	a, #0x04
      009C01 1A 03            [ 1]  388 	or	a, (0x03, sp)
      009C03 6B 02            [ 1]  389 	ld	(0x02, sp), a
                                    390 ;	lib/src/stm8s_tim1.c: 307: (uint8_t)((uint8_t)(TIM1_OCPolarity   & TIM1_CCER2_CC3P   ) | 
      009C05 7B 0B            [ 1]  391 	ld	a, (0x0b, sp)
      009C07 A4 02            [ 1]  392 	and	a, #0x02
      009C09 6B 03            [ 1]  393 	ld	(0x03, sp), a
                                    394 ;	lib/src/stm8s_tim1.c: 308: (uint8_t)(TIM1_OCNPolarity  & TIM1_CCER2_CC3NP  )));
      009C0B 7B 0C            [ 1]  395 	ld	a, (0x0c, sp)
      009C0D A4 08            [ 1]  396 	and	a, #0x08
      009C0F 1A 03            [ 1]  397 	or	a, (0x03, sp)
      009C11 1A 02            [ 1]  398 	or	a, (0x02, sp)
      009C13 1A 01            [ 1]  399 	or	a, (0x01, sp)
      009C15 C7 52 5D         [ 1]  400 	ld	0x525d, a
                                    401 ;	lib/src/stm8s_tim1.c: 311: TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | 
      009C18 C6 52 5A         [ 1]  402 	ld	a, 0x525a
      009C1B A4 8F            [ 1]  403 	and	a, #0x8f
                                    404 ;	lib/src/stm8s_tim1.c: 312: (uint8_t)TIM1_OCMode);
      009C1D 1A 04            [ 1]  405 	or	a, (0x04, sp)
      009C1F C7 52 5A         [ 1]  406 	ld	0x525a, a
                                    407 ;	lib/src/stm8s_tim1.c: 315: TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
      009C22 C6 52 6F         [ 1]  408 	ld	a, 0x526f
      009C25 A4 CF            [ 1]  409 	and	a, #0xcf
      009C27 C7 52 6F         [ 1]  410 	ld	0x526f, a
                                    411 ;	lib/src/stm8s_tim1.c: 317: TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | 
      009C2A C6 52 6F         [ 1]  412 	ld	a, 0x526f
      009C2D 6B 02            [ 1]  413 	ld	(0x02, sp), a
      009C2F 7B 0D            [ 1]  414 	ld	a, (0x0d, sp)
      009C31 A4 10            [ 1]  415 	and	a, #0x10
      009C33 6B 03            [ 1]  416 	ld	(0x03, sp), a
                                    417 ;	lib/src/stm8s_tim1.c: 318: (uint8_t)(TIM1_OISR_OIS3N & TIM1_OCNIdleState));
      009C35 7B 0E            [ 1]  418 	ld	a, (0x0e, sp)
      009C37 A4 20            [ 1]  419 	and	a, #0x20
      009C39 1A 03            [ 1]  420 	or	a, (0x03, sp)
      009C3B 1A 02            [ 1]  421 	or	a, (0x02, sp)
      009C3D C7 52 6F         [ 1]  422 	ld	0x526f, a
                                    423 ;	lib/src/stm8s_tim1.c: 321: TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
      009C40 7B 09            [ 1]  424 	ld	a, (0x09, sp)
      009C42 C7 52 69         [ 1]  425 	ld	0x5269, a
                                    426 ;	lib/src/stm8s_tim1.c: 322: TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
      009C45 7B 0A            [ 1]  427 	ld	a, (0x0a, sp)
      009C47 C7 52 6A         [ 1]  428 	ld	0x526a, a
                                    429 ;	lib/src/stm8s_tim1.c: 323: }
      009C4A 1E 05            [ 2]  430 	ldw	x, (5, sp)
      009C4C 5B 0E            [ 2]  431 	addw	sp, #14
      009C4E FC               [ 2]  432 	jp	(x)
                                    433 ;	lib/src/stm8s_tim1.c: 338: void TIM1_OC4Init(TIM1_OCMode_TypeDef TIM1_OCMode,
                                    434 ;	-----------------------------------------
                                    435 ;	 function TIM1_OC4Init
                                    436 ;	-----------------------------------------
      009C4F                        437 _TIM1_OC4Init:
      009C4F 52 03            [ 2]  438 	sub	sp, #3
      009C51 6B 03            [ 1]  439 	ld	(0x03, sp), a
                                    440 ;	lib/src/stm8s_tim1.c: 351: TIM1->CCER2 &= (uint8_t)(~(TIM1_CCER2_CC4E | TIM1_CCER2_CC4P));
      009C53 C6 52 5D         [ 1]  441 	ld	a, 0x525d
      009C56 A4 CF            [ 1]  442 	and	a, #0xcf
      009C58 C7 52 5D         [ 1]  443 	ld	0x525d, a
                                    444 ;	lib/src/stm8s_tim1.c: 353: TIM1->CCER2 |= (uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC4E ) |  
      009C5B C6 52 5D         [ 1]  445 	ld	a, 0x525d
      009C5E 6B 01            [ 1]  446 	ld	(0x01, sp), a
      009C60 7B 06            [ 1]  447 	ld	a, (0x06, sp)
      009C62 A4 10            [ 1]  448 	and	a, #0x10
      009C64 6B 02            [ 1]  449 	ld	(0x02, sp), a
                                    450 ;	lib/src/stm8s_tim1.c: 354: (uint8_t)(TIM1_OCPolarity  & TIM1_CCER2_CC4P ));
      009C66 7B 09            [ 1]  451 	ld	a, (0x09, sp)
      009C68 A4 20            [ 1]  452 	and	a, #0x20
      009C6A 1A 02            [ 1]  453 	or	a, (0x02, sp)
      009C6C 1A 01            [ 1]  454 	or	a, (0x01, sp)
      009C6E C7 52 5D         [ 1]  455 	ld	0x525d, a
                                    456 ;	lib/src/stm8s_tim1.c: 357: TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) | 
      009C71 C6 52 5B         [ 1]  457 	ld	a, 0x525b
      009C74 A4 8F            [ 1]  458 	and	a, #0x8f
      009C76 1A 03            [ 1]  459 	or	a, (0x03, sp)
      009C78 C7 52 5B         [ 1]  460 	ld	0x525b, a
                                    461 ;	lib/src/stm8s_tim1.c: 363: TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
      009C7B C6 52 6F         [ 1]  462 	ld	a, 0x526f
                                    463 ;	lib/src/stm8s_tim1.c: 361: if (TIM1_OCIdleState != TIM1_OCIDLESTATE_RESET)
      009C7E 0D 0A            [ 1]  464 	tnz	(0x0a, sp)
      009C80 27 07            [ 1]  465 	jreq	00102$
                                    466 ;	lib/src/stm8s_tim1.c: 363: TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
      009C82 AA DF            [ 1]  467 	or	a, #0xdf
      009C84 C7 52 6F         [ 1]  468 	ld	0x526f, a
      009C87 20 05            [ 2]  469 	jra	00103$
      009C89                        470 00102$:
                                    471 ;	lib/src/stm8s_tim1.c: 367: TIM1->OISR &= (uint8_t)(~TIM1_OISR_OIS4);
      009C89 A4 BF            [ 1]  472 	and	a, #0xbf
      009C8B C7 52 6F         [ 1]  473 	ld	0x526f, a
      009C8E                        474 00103$:
                                    475 ;	lib/src/stm8s_tim1.c: 371: TIM1->CCR4H = (uint8_t)(TIM1_Pulse >> 8);
      009C8E 7B 07            [ 1]  476 	ld	a, (0x07, sp)
      009C90 C7 52 6B         [ 1]  477 	ld	0x526b, a
                                    478 ;	lib/src/stm8s_tim1.c: 372: TIM1->CCR4L = (uint8_t)(TIM1_Pulse);
      009C93 7B 08            [ 1]  479 	ld	a, (0x08, sp)
      009C95 C7 52 6C         [ 1]  480 	ld	0x526c, a
                                    481 ;	lib/src/stm8s_tim1.c: 373: }
      009C98 1E 04            [ 2]  482 	ldw	x, (4, sp)
      009C9A 5B 0A            [ 2]  483 	addw	sp, #10
      009C9C FC               [ 2]  484 	jp	(x)
                                    485 ;	lib/src/stm8s_tim1.c: 388: void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
                                    486 ;	-----------------------------------------
                                    487 ;	 function TIM1_BDTRConfig
                                    488 ;	-----------------------------------------
      009C9D                        489 _TIM1_BDTRConfig:
      009C9D 88               [ 1]  490 	push	a
                                    491 ;	lib/src/stm8s_tim1.c: 402: TIM1->DTR = (uint8_t)(TIM1_DeadTime);
      009C9E AE 52 6E         [ 2]  492 	ldw	x, #0x526e
      009CA1 88               [ 1]  493 	push	a
      009CA2 7B 06            [ 1]  494 	ld	a, (0x06, sp)
      009CA4 F7               [ 1]  495 	ld	(x), a
      009CA5 84               [ 1]  496 	pop	a
                                    497 ;	lib/src/stm8s_tim1.c: 406: TIM1->BKR  =  (uint8_t)((uint8_t)(TIM1_OSSIState | (uint8_t)TIM1_LockLevel)  | 
      009CA6 1A 04            [ 1]  498 	or	a, (0x04, sp)
      009CA8 6B 01            [ 1]  499 	ld	(0x01, sp), a
                                    500 ;	lib/src/stm8s_tim1.c: 407: (uint8_t)((uint8_t)(TIM1_Break | (uint8_t)TIM1_BreakPolarity)  | 
      009CAA 7B 06            [ 1]  501 	ld	a, (0x06, sp)
      009CAC 1A 07            [ 1]  502 	or	a, (0x07, sp)
                                    503 ;	lib/src/stm8s_tim1.c: 408: (uint8_t)TIM1_AutomaticOutput));
      009CAE 1A 08            [ 1]  504 	or	a, (0x08, sp)
      009CB0 1A 01            [ 1]  505 	or	a, (0x01, sp)
      009CB2 C7 52 6D         [ 1]  506 	ld	0x526d, a
                                    507 ;	lib/src/stm8s_tim1.c: 409: }
      009CB5 1E 02            [ 2]  508 	ldw	x, (2, sp)
      009CB7 5B 08            [ 2]  509 	addw	sp, #8
      009CB9 FC               [ 2]  510 	jp	(x)
                                    511 ;	lib/src/stm8s_tim1.c: 423: void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
                                    512 ;	-----------------------------------------
                                    513 ;	 function TIM1_ICInit
                                    514 ;	-----------------------------------------
      009CBA                        515 _TIM1_ICInit:
                                    516 ;	lib/src/stm8s_tim1.c: 439: TI1_Config((uint8_t)TIM1_ICPolarity,
      009CBA 41               [ 1]  517 	exg	a, xl
      009CBB 7B 03            [ 1]  518 	ld	a, (0x03, sp)
      009CBD 41               [ 1]  519 	exg	a, xl
                                    520 ;	lib/src/stm8s_tim1.c: 436: if (TIM1_Channel == TIM1_CHANNEL_1)
      009CBE 4D               [ 1]  521 	tnz	a
      009CBF 26 15            [ 1]  522 	jrne	00108$
                                    523 ;	lib/src/stm8s_tim1.c: 439: TI1_Config((uint8_t)TIM1_ICPolarity,
      009CC1 7B 06            [ 1]  524 	ld	a, (0x06, sp)
      009CC3 88               [ 1]  525 	push	a
      009CC4 7B 05            [ 1]  526 	ld	a, (0x05, sp)
      009CC6 88               [ 1]  527 	push	a
      009CC7 9F               [ 1]  528 	ld	a, xl
      009CC8 CD A3 9D         [ 4]  529 	call	_TI1_Config
                                    530 ;	lib/src/stm8s_tim1.c: 443: TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
      009CCB 7B 05            [ 1]  531 	ld	a, (0x05, sp)
      009CCD 1E 01            [ 2]  532 	ldw	x, (1, sp)
      009CCF 1F 05            [ 2]  533 	ldw	(5, sp), x
      009CD1 5B 04            [ 2]  534 	addw	sp, #4
      009CD3 CC A2 90         [ 2]  535 	jp	_TIM1_SetIC1Prescaler
      009CD6                        536 00108$:
                                    537 ;	lib/src/stm8s_tim1.c: 445: else if (TIM1_Channel == TIM1_CHANNEL_2)
      009CD6 A1 01            [ 1]  538 	cp	a, #0x01
      009CD8 26 15            [ 1]  539 	jrne	00105$
                                    540 ;	lib/src/stm8s_tim1.c: 448: TI2_Config((uint8_t)TIM1_ICPolarity,
      009CDA 7B 06            [ 1]  541 	ld	a, (0x06, sp)
      009CDC 88               [ 1]  542 	push	a
      009CDD 7B 05            [ 1]  543 	ld	a, (0x05, sp)
      009CDF 88               [ 1]  544 	push	a
      009CE0 9F               [ 1]  545 	ld	a, xl
      009CE1 CD A3 D8         [ 4]  546 	call	_TI2_Config
                                    547 ;	lib/src/stm8s_tim1.c: 452: TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
      009CE4 7B 05            [ 1]  548 	ld	a, (0x05, sp)
      009CE6 1E 01            [ 2]  549 	ldw	x, (1, sp)
      009CE8 1F 05            [ 2]  550 	ldw	(5, sp), x
      009CEA 5B 04            [ 2]  551 	addw	sp, #4
      009CEC CC A2 9F         [ 2]  552 	jp	_TIM1_SetIC2Prescaler
      009CEF                        553 00105$:
                                    554 ;	lib/src/stm8s_tim1.c: 454: else if (TIM1_Channel == TIM1_CHANNEL_3)
      009CEF A1 02            [ 1]  555 	cp	a, #0x02
      009CF1 26 15            [ 1]  556 	jrne	00102$
                                    557 ;	lib/src/stm8s_tim1.c: 457: TI3_Config((uint8_t)TIM1_ICPolarity,
      009CF3 7B 06            [ 1]  558 	ld	a, (0x06, sp)
      009CF5 88               [ 1]  559 	push	a
      009CF6 7B 05            [ 1]  560 	ld	a, (0x05, sp)
      009CF8 88               [ 1]  561 	push	a
      009CF9 9F               [ 1]  562 	ld	a, xl
      009CFA CD A4 13         [ 4]  563 	call	_TI3_Config
                                    564 ;	lib/src/stm8s_tim1.c: 461: TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
      009CFD 7B 05            [ 1]  565 	ld	a, (0x05, sp)
      009CFF 1E 01            [ 2]  566 	ldw	x, (1, sp)
      009D01 1F 05            [ 2]  567 	ldw	(5, sp), x
      009D03 5B 04            [ 2]  568 	addw	sp, #4
      009D05 CC A2 AE         [ 2]  569 	jp	_TIM1_SetIC3Prescaler
      009D08                        570 00102$:
                                    571 ;	lib/src/stm8s_tim1.c: 466: TI4_Config((uint8_t)TIM1_ICPolarity,
      009D08 7B 06            [ 1]  572 	ld	a, (0x06, sp)
      009D0A 88               [ 1]  573 	push	a
      009D0B 7B 05            [ 1]  574 	ld	a, (0x05, sp)
      009D0D 88               [ 1]  575 	push	a
      009D0E 9F               [ 1]  576 	ld	a, xl
      009D0F CD A4 52         [ 4]  577 	call	_TI4_Config
                                    578 ;	lib/src/stm8s_tim1.c: 470: TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
      009D12 7B 05            [ 1]  579 	ld	a, (0x05, sp)
      009D14 1E 01            [ 2]  580 	ldw	x, (1, sp)
      009D16 1F 05            [ 2]  581 	ldw	(5, sp), x
      009D18 5B 04            [ 2]  582 	addw	sp, #4
                                    583 ;	lib/src/stm8s_tim1.c: 472: }
      009D1A CC A2 BD         [ 2]  584 	jp	_TIM1_SetIC4Prescaler
                                    585 ;	lib/src/stm8s_tim1.c: 488: void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
                                    586 ;	-----------------------------------------
                                    587 ;	 function TIM1_PWMIConfig
                                    588 ;	-----------------------------------------
      009D1D                        589 _TIM1_PWMIConfig:
      009D1D 52 02            [ 2]  590 	sub	sp, #2
      009D1F 97               [ 1]  591 	ld	xl, a
                                    592 ;	lib/src/stm8s_tim1.c: 504: if (TIM1_ICPolarity != TIM1_ICPOLARITY_FALLING)
      009D20 0D 05            [ 1]  593 	tnz	(0x05, sp)
      009D22 26 05            [ 1]  594 	jrne	00102$
                                    595 ;	lib/src/stm8s_tim1.c: 506: icpolarity = TIM1_ICPOLARITY_FALLING;
      009D24 A6 01            [ 1]  596 	ld	a, #0x01
      009D26 6B 01            [ 1]  597 	ld	(0x01, sp), a
                                    598 ;	lib/src/stm8s_tim1.c: 510: icpolarity = TIM1_ICPOLARITY_RISING;
      009D28 C5                     599 	.byte 0xc5
      009D29                        600 00102$:
      009D29 0F 01            [ 1]  601 	clr	(0x01, sp)
      009D2B                        602 00103$:
                                    603 ;	lib/src/stm8s_tim1.c: 514: if (TIM1_ICSelection == TIM1_ICSELECTION_DIRECTTI)
      009D2B 7B 06            [ 1]  604 	ld	a, (0x06, sp)
      009D2D 4A               [ 1]  605 	dec	a
      009D2E 26 06            [ 1]  606 	jrne	00105$
                                    607 ;	lib/src/stm8s_tim1.c: 516: icselection = TIM1_ICSELECTION_INDIRECTTI;
      009D30 A6 02            [ 1]  608 	ld	a, #0x02
      009D32 6B 02            [ 1]  609 	ld	(0x02, sp), a
      009D34 20 04            [ 2]  610 	jra	00106$
      009D36                        611 00105$:
                                    612 ;	lib/src/stm8s_tim1.c: 520: icselection = TIM1_ICSELECTION_DIRECTTI;
      009D36 A6 01            [ 1]  613 	ld	a, #0x01
      009D38 6B 02            [ 1]  614 	ld	(0x02, sp), a
      009D3A                        615 00106$:
                                    616 ;	lib/src/stm8s_tim1.c: 526: TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
      009D3A 7B 05            [ 1]  617 	ld	a, (0x05, sp)
      009D3C 95               [ 1]  618 	ld	xh, a
                                    619 ;	lib/src/stm8s_tim1.c: 523: if (TIM1_Channel == TIM1_CHANNEL_1)
      009D3D 9F               [ 1]  620 	ld	a, xl
      009D3E 4D               [ 1]  621 	tnz	a
      009D3F 26 25            [ 1]  622 	jrne	00108$
                                    623 ;	lib/src/stm8s_tim1.c: 526: TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
      009D41 7B 08            [ 1]  624 	ld	a, (0x08, sp)
      009D43 88               [ 1]  625 	push	a
      009D44 7B 07            [ 1]  626 	ld	a, (0x07, sp)
      009D46 88               [ 1]  627 	push	a
      009D47 9E               [ 1]  628 	ld	a, xh
      009D48 CD A3 9D         [ 4]  629 	call	_TI1_Config
                                    630 ;	lib/src/stm8s_tim1.c: 530: TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
      009D4B 7B 07            [ 1]  631 	ld	a, (0x07, sp)
      009D4D CD A2 90         [ 4]  632 	call	_TIM1_SetIC1Prescaler
                                    633 ;	lib/src/stm8s_tim1.c: 533: TI2_Config(icpolarity, icselection, TIM1_ICFilter);
      009D50 7B 08            [ 1]  634 	ld	a, (0x08, sp)
      009D52 88               [ 1]  635 	push	a
      009D53 7B 03            [ 1]  636 	ld	a, (0x03, sp)
      009D55 88               [ 1]  637 	push	a
      009D56 7B 03            [ 1]  638 	ld	a, (0x03, sp)
      009D58 CD A3 D8         [ 4]  639 	call	_TI2_Config
                                    640 ;	lib/src/stm8s_tim1.c: 536: TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
      009D5B 7B 07            [ 1]  641 	ld	a, (0x07, sp)
      009D5D 1E 03            [ 2]  642 	ldw	x, (3, sp)
      009D5F 1F 07            [ 2]  643 	ldw	(7, sp), x
      009D61 5B 06            [ 2]  644 	addw	sp, #6
      009D63 CC A2 9F         [ 2]  645 	jp	_TIM1_SetIC2Prescaler
      009D66                        646 00108$:
                                    647 ;	lib/src/stm8s_tim1.c: 541: TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
      009D66 7B 08            [ 1]  648 	ld	a, (0x08, sp)
      009D68 88               [ 1]  649 	push	a
      009D69 7B 07            [ 1]  650 	ld	a, (0x07, sp)
      009D6B 88               [ 1]  651 	push	a
      009D6C 9E               [ 1]  652 	ld	a, xh
      009D6D CD A3 D8         [ 4]  653 	call	_TI2_Config
                                    654 ;	lib/src/stm8s_tim1.c: 545: TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
      009D70 7B 07            [ 1]  655 	ld	a, (0x07, sp)
      009D72 CD A2 9F         [ 4]  656 	call	_TIM1_SetIC2Prescaler
                                    657 ;	lib/src/stm8s_tim1.c: 548: TI1_Config(icpolarity, icselection, TIM1_ICFilter);
      009D75 7B 08            [ 1]  658 	ld	a, (0x08, sp)
      009D77 88               [ 1]  659 	push	a
      009D78 7B 03            [ 1]  660 	ld	a, (0x03, sp)
      009D7A 88               [ 1]  661 	push	a
      009D7B 7B 03            [ 1]  662 	ld	a, (0x03, sp)
      009D7D CD A3 9D         [ 4]  663 	call	_TI1_Config
                                    664 ;	lib/src/stm8s_tim1.c: 551: TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
      009D80 7B 07            [ 1]  665 	ld	a, (0x07, sp)
      009D82 1E 03            [ 2]  666 	ldw	x, (3, sp)
      009D84 1F 07            [ 2]  667 	ldw	(7, sp), x
      009D86 5B 06            [ 2]  668 	addw	sp, #6
                                    669 ;	lib/src/stm8s_tim1.c: 553: }
      009D88 CC A2 90         [ 2]  670 	jp	_TIM1_SetIC1Prescaler
                                    671 ;	lib/src/stm8s_tim1.c: 561: void TIM1_Cmd(FunctionalState NewState)
                                    672 ;	-----------------------------------------
                                    673 ;	 function TIM1_Cmd
                                    674 ;	-----------------------------------------
      009D8B                        675 _TIM1_Cmd:
      009D8B 88               [ 1]  676 	push	a
      009D8C 6B 01            [ 1]  677 	ld	(0x01, sp), a
                                    678 ;	lib/src/stm8s_tim1.c: 569: TIM1->CR1 |= TIM1_CR1_CEN;
      009D8E C6 52 50         [ 1]  679 	ld	a, 0x5250
                                    680 ;	lib/src/stm8s_tim1.c: 567: if (NewState != DISABLE)
      009D91 0D 01            [ 1]  681 	tnz	(0x01, sp)
      009D93 27 07            [ 1]  682 	jreq	00102$
                                    683 ;	lib/src/stm8s_tim1.c: 569: TIM1->CR1 |= TIM1_CR1_CEN;
      009D95 AA 01            [ 1]  684 	or	a, #0x01
      009D97 C7 52 50         [ 1]  685 	ld	0x5250, a
      009D9A 20 05            [ 2]  686 	jra	00104$
      009D9C                        687 00102$:
                                    688 ;	lib/src/stm8s_tim1.c: 573: TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
      009D9C A4 FE            [ 1]  689 	and	a, #0xfe
      009D9E C7 52 50         [ 1]  690 	ld	0x5250, a
      009DA1                        691 00104$:
                                    692 ;	lib/src/stm8s_tim1.c: 575: }
      009DA1 84               [ 1]  693 	pop	a
      009DA2 81               [ 4]  694 	ret
                                    695 ;	lib/src/stm8s_tim1.c: 583: void TIM1_CtrlPWMOutputs(FunctionalState NewState)
                                    696 ;	-----------------------------------------
                                    697 ;	 function TIM1_CtrlPWMOutputs
                                    698 ;	-----------------------------------------
      009DA3                        699 _TIM1_CtrlPWMOutputs:
      009DA3 88               [ 1]  700 	push	a
      009DA4 6B 01            [ 1]  701 	ld	(0x01, sp), a
                                    702 ;	lib/src/stm8s_tim1.c: 592: TIM1->BKR |= TIM1_BKR_MOE;
      009DA6 C6 52 6D         [ 1]  703 	ld	a, 0x526d
                                    704 ;	lib/src/stm8s_tim1.c: 590: if (NewState != DISABLE)
      009DA9 0D 01            [ 1]  705 	tnz	(0x01, sp)
      009DAB 27 07            [ 1]  706 	jreq	00102$
                                    707 ;	lib/src/stm8s_tim1.c: 592: TIM1->BKR |= TIM1_BKR_MOE;
      009DAD AA 80            [ 1]  708 	or	a, #0x80
      009DAF C7 52 6D         [ 1]  709 	ld	0x526d, a
      009DB2 20 05            [ 2]  710 	jra	00104$
      009DB4                        711 00102$:
                                    712 ;	lib/src/stm8s_tim1.c: 596: TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
      009DB4 A4 7F            [ 1]  713 	and	a, #0x7f
      009DB6 C7 52 6D         [ 1]  714 	ld	0x526d, a
      009DB9                        715 00104$:
                                    716 ;	lib/src/stm8s_tim1.c: 598: }
      009DB9 84               [ 1]  717 	pop	a
      009DBA 81               [ 4]  718 	ret
                                    719 ;	lib/src/stm8s_tim1.c: 617: void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
                                    720 ;	-----------------------------------------
                                    721 ;	 function TIM1_ITConfig
                                    722 ;	-----------------------------------------
      009DBB                        723 _TIM1_ITConfig:
      009DBB 88               [ 1]  724 	push	a
                                    725 ;	lib/src/stm8s_tim1.c: 626: TIM1->IER |= (uint8_t)TIM1_IT;
      009DBC AE 52 54         [ 2]  726 	ldw	x, #0x5254
      009DBF 88               [ 1]  727 	push	a
      009DC0 F6               [ 1]  728 	ld	a, (x)
      009DC1 6B 02            [ 1]  729 	ld	(0x02, sp), a
      009DC3 84               [ 1]  730 	pop	a
                                    731 ;	lib/src/stm8s_tim1.c: 623: if (NewState != DISABLE)
      009DC4 0D 04            [ 1]  732 	tnz	(0x04, sp)
      009DC6 27 07            [ 1]  733 	jreq	00102$
                                    734 ;	lib/src/stm8s_tim1.c: 626: TIM1->IER |= (uint8_t)TIM1_IT;
      009DC8 1A 01            [ 1]  735 	or	a, (0x01, sp)
      009DCA C7 52 54         [ 1]  736 	ld	0x5254, a
      009DCD 20 06            [ 2]  737 	jra	00104$
      009DCF                        738 00102$:
                                    739 ;	lib/src/stm8s_tim1.c: 631: TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
      009DCF 43               [ 1]  740 	cpl	a
      009DD0 14 01            [ 1]  741 	and	a, (0x01, sp)
      009DD2 C7 52 54         [ 1]  742 	ld	0x5254, a
      009DD5                        743 00104$:
                                    744 ;	lib/src/stm8s_tim1.c: 633: }
      009DD5 84               [ 1]  745 	pop	a
      009DD6 85               [ 2]  746 	popw	x
      009DD7 84               [ 1]  747 	pop	a
      009DD8 FC               [ 2]  748 	jp	(x)
                                    749 ;	lib/src/stm8s_tim1.c: 640: void TIM1_InternalClockConfig(void)
                                    750 ;	-----------------------------------------
                                    751 ;	 function TIM1_InternalClockConfig
                                    752 ;	-----------------------------------------
      009DD9                        753 _TIM1_InternalClockConfig:
                                    754 ;	lib/src/stm8s_tim1.c: 643: TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
      009DD9 C6 52 52         [ 1]  755 	ld	a, 0x5252
      009DDC A4 F8            [ 1]  756 	and	a, #0xf8
      009DDE C7 52 52         [ 1]  757 	ld	0x5252, a
                                    758 ;	lib/src/stm8s_tim1.c: 644: }
      009DE1 81               [ 4]  759 	ret
                                    760 ;	lib/src/stm8s_tim1.c: 662: void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
                                    761 ;	-----------------------------------------
                                    762 ;	 function TIM1_ETRClockMode1Config
                                    763 ;	-----------------------------------------
      009DE2                        764 _TIM1_ETRClockMode1Config:
      009DE2 97               [ 1]  765 	ld	xl, a
                                    766 ;	lib/src/stm8s_tim1.c: 671: TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
      009DE3 7B 04            [ 1]  767 	ld	a, (0x04, sp)
      009DE5 88               [ 1]  768 	push	a
      009DE6 7B 04            [ 1]  769 	ld	a, (0x04, sp)
      009DE8 88               [ 1]  770 	push	a
      009DE9 9F               [ 1]  771 	ld	a, xl
      009DEA CD 9E 14         [ 4]  772 	call	_TIM1_ETRConfig
                                    773 ;	lib/src/stm8s_tim1.c: 674: TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(uint8_t)(TIM1_SMCR_SMS | TIM1_SMCR_TS )))
      009DED C6 52 52         [ 1]  774 	ld	a, 0x5252
      009DF0 A4 88            [ 1]  775 	and	a, #0x88
      009DF2 AA 77            [ 1]  776 	or	a, #0x77
      009DF4 C7 52 52         [ 1]  777 	ld	0x5252, a
                                    778 ;	lib/src/stm8s_tim1.c: 676: }
      009DF7 1E 01            [ 2]  779 	ldw	x, (1, sp)
      009DF9 5B 04            [ 2]  780 	addw	sp, #4
      009DFB FC               [ 2]  781 	jp	(x)
                                    782 ;	lib/src/stm8s_tim1.c: 694: void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
                                    783 ;	-----------------------------------------
                                    784 ;	 function TIM1_ETRClockMode2Config
                                    785 ;	-----------------------------------------
      009DFC                        786 _TIM1_ETRClockMode2Config:
      009DFC 97               [ 1]  787 	ld	xl, a
                                    788 ;	lib/src/stm8s_tim1.c: 703: TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
      009DFD 7B 04            [ 1]  789 	ld	a, (0x04, sp)
      009DFF 88               [ 1]  790 	push	a
      009E00 7B 04            [ 1]  791 	ld	a, (0x04, sp)
      009E02 88               [ 1]  792 	push	a
      009E03 9F               [ 1]  793 	ld	a, xl
      009E04 CD 9E 14         [ 4]  794 	call	_TIM1_ETRConfig
                                    795 ;	lib/src/stm8s_tim1.c: 706: TIM1->ETR |= TIM1_ETR_ECE;
      009E07 C6 52 53         [ 1]  796 	ld	a, 0x5253
      009E0A AA 40            [ 1]  797 	or	a, #0x40
      009E0C C7 52 53         [ 1]  798 	ld	0x5253, a
                                    799 ;	lib/src/stm8s_tim1.c: 707: }
      009E0F 1E 01            [ 2]  800 	ldw	x, (1, sp)
      009E11 5B 04            [ 2]  801 	addw	sp, #4
      009E13 FC               [ 2]  802 	jp	(x)
                                    803 ;	lib/src/stm8s_tim1.c: 725: void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
                                    804 ;	-----------------------------------------
                                    805 ;	 function TIM1_ETRConfig
                                    806 ;	-----------------------------------------
      009E14                        807 _TIM1_ETRConfig:
      009E14 88               [ 1]  808 	push	a
      009E15 97               [ 1]  809 	ld	xl, a
                                    810 ;	lib/src/stm8s_tim1.c: 732: TIM1->ETR |= (uint8_t)((uint8_t)(TIM1_ExtTRGPrescaler | (uint8_t)TIM1_ExtTRGPolarity )|
      009E16 C6 52 53         [ 1]  811 	ld	a, 0x5253
      009E19 6B 01            [ 1]  812 	ld	(0x01, sp), a
      009E1B 9F               [ 1]  813 	ld	a, xl
      009E1C 1A 04            [ 1]  814 	or	a, (0x04, sp)
                                    815 ;	lib/src/stm8s_tim1.c: 733: (uint8_t)ExtTRGFilter );
      009E1E 1A 05            [ 1]  816 	or	a, (0x05, sp)
      009E20 1A 01            [ 1]  817 	or	a, (0x01, sp)
      009E22 C7 52 53         [ 1]  818 	ld	0x5253, a
                                    819 ;	lib/src/stm8s_tim1.c: 734: }
      009E25 1E 02            [ 2]  820 	ldw	x, (2, sp)
      009E27 5B 05            [ 2]  821 	addw	sp, #5
      009E29 FC               [ 2]  822 	jp	(x)
                                    823 ;	lib/src/stm8s_tim1.c: 751: void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
                                    824 ;	-----------------------------------------
                                    825 ;	 function TIM1_TIxExternalClockConfig
                                    826 ;	-----------------------------------------
      009E2A                        827 _TIM1_TIxExternalClockConfig:
      009E2A 88               [ 1]  828 	push	a
      009E2B 6B 01            [ 1]  829 	ld	(0x01, sp), a
                                    830 ;	lib/src/stm8s_tim1.c: 763: TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
      009E2D 7B 04            [ 1]  831 	ld	a, (0x04, sp)
      009E2F 97               [ 1]  832 	ld	xl, a
                                    833 ;	lib/src/stm8s_tim1.c: 761: if (TIM1_TIxExternalCLKSource == TIM1_TIXEXTERNALCLK1SOURCE_TI2)
      009E30 7B 01            [ 1]  834 	ld	a, (0x01, sp)
      009E32 A1 60            [ 1]  835 	cp	a, #0x60
      009E34 26 0B            [ 1]  836 	jrne	00102$
                                    837 ;	lib/src/stm8s_tim1.c: 763: TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
      009E36 7B 05            [ 1]  838 	ld	a, (0x05, sp)
      009E38 88               [ 1]  839 	push	a
      009E39 4B 01            [ 1]  840 	push	#0x01
      009E3B 9F               [ 1]  841 	ld	a, xl
      009E3C CD A3 D8         [ 4]  842 	call	_TI2_Config
      009E3F 20 09            [ 2]  843 	jra	00103$
      009E41                        844 00102$:
                                    845 ;	lib/src/stm8s_tim1.c: 767: TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
      009E41 7B 05            [ 1]  846 	ld	a, (0x05, sp)
      009E43 88               [ 1]  847 	push	a
      009E44 4B 01            [ 1]  848 	push	#0x01
      009E46 9F               [ 1]  849 	ld	a, xl
      009E47 CD A3 9D         [ 4]  850 	call	_TI1_Config
      009E4A                        851 00103$:
                                    852 ;	lib/src/stm8s_tim1.c: 771: TIM1_SelectInputTrigger((TIM1_TS_TypeDef)TIM1_TIxExternalCLKSource);
      009E4A 7B 01            [ 1]  853 	ld	a, (0x01, sp)
      009E4C CD 9E 5C         [ 4]  854 	call	_TIM1_SelectInputTrigger
                                    855 ;	lib/src/stm8s_tim1.c: 774: TIM1->SMCR |= (uint8_t)(TIM1_SLAVEMODE_EXTERNAL1);
      009E4F C6 52 52         [ 1]  856 	ld	a, 0x5252
      009E52 AA 07            [ 1]  857 	or	a, #0x07
      009E54 C7 52 52         [ 1]  858 	ld	0x5252, a
                                    859 ;	lib/src/stm8s_tim1.c: 775: }
      009E57 1E 02            [ 2]  860 	ldw	x, (2, sp)
      009E59 5B 05            [ 2]  861 	addw	sp, #5
      009E5B FC               [ 2]  862 	jp	(x)
                                    863 ;	lib/src/stm8s_tim1.c: 787: void TIM1_SelectInputTrigger(TIM1_TS_TypeDef TIM1_InputTriggerSource)
                                    864 ;	-----------------------------------------
                                    865 ;	 function TIM1_SelectInputTrigger
                                    866 ;	-----------------------------------------
      009E5C                        867 _TIM1_SelectInputTrigger:
      009E5C 88               [ 1]  868 	push	a
      009E5D 6B 01            [ 1]  869 	ld	(0x01, sp), a
                                    870 ;	lib/src/stm8s_tim1.c: 793: TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
      009E5F C6 52 52         [ 1]  871 	ld	a, 0x5252
      009E62 A4 8F            [ 1]  872 	and	a, #0x8f
      009E64 1A 01            [ 1]  873 	or	a, (0x01, sp)
      009E66 C7 52 52         [ 1]  874 	ld	0x5252, a
                                    875 ;	lib/src/stm8s_tim1.c: 794: }
      009E69 84               [ 1]  876 	pop	a
      009E6A 81               [ 4]  877 	ret
                                    878 ;	lib/src/stm8s_tim1.c: 803: void TIM1_UpdateDisableConfig(FunctionalState NewState)
                                    879 ;	-----------------------------------------
                                    880 ;	 function TIM1_UpdateDisableConfig
                                    881 ;	-----------------------------------------
      009E6B                        882 _TIM1_UpdateDisableConfig:
      009E6B 88               [ 1]  883 	push	a
      009E6C 6B 01            [ 1]  884 	ld	(0x01, sp), a
                                    885 ;	lib/src/stm8s_tim1.c: 811: TIM1->CR1 |= TIM1_CR1_UDIS;
      009E6E C6 52 50         [ 1]  886 	ld	a, 0x5250
                                    887 ;	lib/src/stm8s_tim1.c: 809: if (NewState != DISABLE)
      009E71 0D 01            [ 1]  888 	tnz	(0x01, sp)
      009E73 27 07            [ 1]  889 	jreq	00102$
                                    890 ;	lib/src/stm8s_tim1.c: 811: TIM1->CR1 |= TIM1_CR1_UDIS;
      009E75 AA 02            [ 1]  891 	or	a, #0x02
      009E77 C7 52 50         [ 1]  892 	ld	0x5250, a
      009E7A 20 05            [ 2]  893 	jra	00104$
      009E7C                        894 00102$:
                                    895 ;	lib/src/stm8s_tim1.c: 815: TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
      009E7C A4 FD            [ 1]  896 	and	a, #0xfd
      009E7E C7 52 50         [ 1]  897 	ld	0x5250, a
      009E81                        898 00104$:
                                    899 ;	lib/src/stm8s_tim1.c: 817: }
      009E81 84               [ 1]  900 	pop	a
      009E82 81               [ 4]  901 	ret
                                    902 ;	lib/src/stm8s_tim1.c: 827: void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
                                    903 ;	-----------------------------------------
                                    904 ;	 function TIM1_UpdateRequestConfig
                                    905 ;	-----------------------------------------
      009E83                        906 _TIM1_UpdateRequestConfig:
      009E83 88               [ 1]  907 	push	a
      009E84 6B 01            [ 1]  908 	ld	(0x01, sp), a
                                    909 ;	lib/src/stm8s_tim1.c: 835: TIM1->CR1 |= TIM1_CR1_URS;
      009E86 C6 52 50         [ 1]  910 	ld	a, 0x5250
                                    911 ;	lib/src/stm8s_tim1.c: 833: if (TIM1_UpdateSource != TIM1_UPDATESOURCE_GLOBAL)
      009E89 0D 01            [ 1]  912 	tnz	(0x01, sp)
      009E8B 27 07            [ 1]  913 	jreq	00102$
                                    914 ;	lib/src/stm8s_tim1.c: 835: TIM1->CR1 |= TIM1_CR1_URS;
      009E8D AA 04            [ 1]  915 	or	a, #0x04
      009E8F C7 52 50         [ 1]  916 	ld	0x5250, a
      009E92 20 05            [ 2]  917 	jra	00104$
      009E94                        918 00102$:
                                    919 ;	lib/src/stm8s_tim1.c: 839: TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
      009E94 A4 FB            [ 1]  920 	and	a, #0xfb
      009E96 C7 52 50         [ 1]  921 	ld	0x5250, a
      009E99                        922 00104$:
                                    923 ;	lib/src/stm8s_tim1.c: 841: }
      009E99 84               [ 1]  924 	pop	a
      009E9A 81               [ 4]  925 	ret
                                    926 ;	lib/src/stm8s_tim1.c: 849: void TIM1_SelectHallSensor(FunctionalState NewState)
                                    927 ;	-----------------------------------------
                                    928 ;	 function TIM1_SelectHallSensor
                                    929 ;	-----------------------------------------
      009E9B                        930 _TIM1_SelectHallSensor:
      009E9B 88               [ 1]  931 	push	a
      009E9C 6B 01            [ 1]  932 	ld	(0x01, sp), a
                                    933 ;	lib/src/stm8s_tim1.c: 857: TIM1->CR2 |= TIM1_CR2_TI1S;
      009E9E C6 52 51         [ 1]  934 	ld	a, 0x5251
                                    935 ;	lib/src/stm8s_tim1.c: 855: if (NewState != DISABLE)
      009EA1 0D 01            [ 1]  936 	tnz	(0x01, sp)
      009EA3 27 07            [ 1]  937 	jreq	00102$
                                    938 ;	lib/src/stm8s_tim1.c: 857: TIM1->CR2 |= TIM1_CR2_TI1S;
      009EA5 AA 80            [ 1]  939 	or	a, #0x80
      009EA7 C7 52 51         [ 1]  940 	ld	0x5251, a
      009EAA 20 05            [ 2]  941 	jra	00104$
      009EAC                        942 00102$:
                                    943 ;	lib/src/stm8s_tim1.c: 861: TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
      009EAC A4 7F            [ 1]  944 	and	a, #0x7f
      009EAE C7 52 51         [ 1]  945 	ld	0x5251, a
      009EB1                        946 00104$:
                                    947 ;	lib/src/stm8s_tim1.c: 863: }
      009EB1 84               [ 1]  948 	pop	a
      009EB2 81               [ 4]  949 	ret
                                    950 ;	lib/src/stm8s_tim1.c: 873: void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
                                    951 ;	-----------------------------------------
                                    952 ;	 function TIM1_SelectOnePulseMode
                                    953 ;	-----------------------------------------
      009EB3                        954 _TIM1_SelectOnePulseMode:
      009EB3 88               [ 1]  955 	push	a
      009EB4 6B 01            [ 1]  956 	ld	(0x01, sp), a
                                    957 ;	lib/src/stm8s_tim1.c: 881: TIM1->CR1 |= TIM1_CR1_OPM;
      009EB6 C6 52 50         [ 1]  958 	ld	a, 0x5250
                                    959 ;	lib/src/stm8s_tim1.c: 879: if (TIM1_OPMode != TIM1_OPMODE_REPETITIVE)
      009EB9 0D 01            [ 1]  960 	tnz	(0x01, sp)
      009EBB 27 07            [ 1]  961 	jreq	00102$
                                    962 ;	lib/src/stm8s_tim1.c: 881: TIM1->CR1 |= TIM1_CR1_OPM;
      009EBD AA 08            [ 1]  963 	or	a, #0x08
      009EBF C7 52 50         [ 1]  964 	ld	0x5250, a
      009EC2 20 05            [ 2]  965 	jra	00104$
      009EC4                        966 00102$:
                                    967 ;	lib/src/stm8s_tim1.c: 885: TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
      009EC4 A4 F7            [ 1]  968 	and	a, #0xf7
      009EC6 C7 52 50         [ 1]  969 	ld	0x5250, a
      009EC9                        970 00104$:
                                    971 ;	lib/src/stm8s_tim1.c: 888: }
      009EC9 84               [ 1]  972 	pop	a
      009ECA 81               [ 4]  973 	ret
                                    974 ;	lib/src/stm8s_tim1.c: 903: void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
                                    975 ;	-----------------------------------------
                                    976 ;	 function TIM1_SelectOutputTrigger
                                    977 ;	-----------------------------------------
      009ECB                        978 _TIM1_SelectOutputTrigger:
      009ECB 88               [ 1]  979 	push	a
      009ECC 6B 01            [ 1]  980 	ld	(0x01, sp), a
                                    981 ;	lib/src/stm8s_tim1.c: 909: TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | 
      009ECE C6 52 51         [ 1]  982 	ld	a, 0x5251
      009ED1 A4 8F            [ 1]  983 	and	a, #0x8f
                                    984 ;	lib/src/stm8s_tim1.c: 910: (uint8_t) TIM1_TRGOSource);
      009ED3 1A 01            [ 1]  985 	or	a, (0x01, sp)
      009ED5 C7 52 51         [ 1]  986 	ld	0x5251, a
                                    987 ;	lib/src/stm8s_tim1.c: 911: }
      009ED8 84               [ 1]  988 	pop	a
      009ED9 81               [ 4]  989 	ret
                                    990 ;	lib/src/stm8s_tim1.c: 923: void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
                                    991 ;	-----------------------------------------
                                    992 ;	 function TIM1_SelectSlaveMode
                                    993 ;	-----------------------------------------
      009EDA                        994 _TIM1_SelectSlaveMode:
      009EDA 88               [ 1]  995 	push	a
      009EDB 6B 01            [ 1]  996 	ld	(0x01, sp), a
                                    997 ;	lib/src/stm8s_tim1.c: 929: TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) |
      009EDD C6 52 52         [ 1]  998 	ld	a, 0x5252
      009EE0 A4 F8            [ 1]  999 	and	a, #0xf8
                                   1000 ;	lib/src/stm8s_tim1.c: 930: (uint8_t)TIM1_SlaveMode);
      009EE2 1A 01            [ 1] 1001 	or	a, (0x01, sp)
      009EE4 C7 52 52         [ 1] 1002 	ld	0x5252, a
                                   1003 ;	lib/src/stm8s_tim1.c: 931: }
      009EE7 84               [ 1] 1004 	pop	a
      009EE8 81               [ 4] 1005 	ret
                                   1006 ;	lib/src/stm8s_tim1.c: 939: void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
                                   1007 ;	-----------------------------------------
                                   1008 ;	 function TIM1_SelectMasterSlaveMode
                                   1009 ;	-----------------------------------------
      009EE9                       1010 _TIM1_SelectMasterSlaveMode:
      009EE9 88               [ 1] 1011 	push	a
      009EEA 6B 01            [ 1] 1012 	ld	(0x01, sp), a
                                   1013 ;	lib/src/stm8s_tim1.c: 947: TIM1->SMCR |= TIM1_SMCR_MSM;
      009EEC C6 52 52         [ 1] 1014 	ld	a, 0x5252
                                   1015 ;	lib/src/stm8s_tim1.c: 945: if (NewState != DISABLE)
      009EEF 0D 01            [ 1] 1016 	tnz	(0x01, sp)
      009EF1 27 07            [ 1] 1017 	jreq	00102$
                                   1018 ;	lib/src/stm8s_tim1.c: 947: TIM1->SMCR |= TIM1_SMCR_MSM;
      009EF3 AA 80            [ 1] 1019 	or	a, #0x80
      009EF5 C7 52 52         [ 1] 1020 	ld	0x5252, a
      009EF8 20 05            [ 2] 1021 	jra	00104$
      009EFA                       1022 00102$:
                                   1023 ;	lib/src/stm8s_tim1.c: 951: TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
      009EFA A4 7F            [ 1] 1024 	and	a, #0x7f
      009EFC C7 52 52         [ 1] 1025 	ld	0x5252, a
      009EFF                       1026 00104$:
                                   1027 ;	lib/src/stm8s_tim1.c: 953: }
      009EFF 84               [ 1] 1028 	pop	a
      009F00 81               [ 4] 1029 	ret
                                   1030 ;	lib/src/stm8s_tim1.c: 975: void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
                                   1031 ;	-----------------------------------------
                                   1032 ;	 function TIM1_EncoderInterfaceConfig
                                   1033 ;	-----------------------------------------
      009F01                       1034 _TIM1_EncoderInterfaceConfig:
      009F01 88               [ 1] 1035 	push	a
      009F02 6B 01            [ 1] 1036 	ld	(0x01, sp), a
                                   1037 ;	lib/src/stm8s_tim1.c: 987: TIM1->CCER1 |= TIM1_CCER1_CC1P;
      009F04 C6 52 5C         [ 1] 1038 	ld	a, 0x525c
                                   1039 ;	lib/src/stm8s_tim1.c: 985: if (TIM1_IC1Polarity != TIM1_ICPOLARITY_RISING)
      009F07 0D 04            [ 1] 1040 	tnz	(0x04, sp)
      009F09 27 07            [ 1] 1041 	jreq	00102$
                                   1042 ;	lib/src/stm8s_tim1.c: 987: TIM1->CCER1 |= TIM1_CCER1_CC1P;
      009F0B AA 02            [ 1] 1043 	or	a, #0x02
      009F0D C7 52 5C         [ 1] 1044 	ld	0x525c, a
      009F10 20 05            [ 2] 1045 	jra	00103$
      009F12                       1046 00102$:
                                   1047 ;	lib/src/stm8s_tim1.c: 991: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
      009F12 A4 FD            [ 1] 1048 	and	a, #0xfd
      009F14 C7 52 5C         [ 1] 1049 	ld	0x525c, a
      009F17                       1050 00103$:
                                   1051 ;	lib/src/stm8s_tim1.c: 987: TIM1->CCER1 |= TIM1_CCER1_CC1P;
      009F17 C6 52 5C         [ 1] 1052 	ld	a, 0x525c
                                   1053 ;	lib/src/stm8s_tim1.c: 994: if (TIM1_IC2Polarity != TIM1_ICPOLARITY_RISING)
      009F1A 0D 05            [ 1] 1054 	tnz	(0x05, sp)
      009F1C 27 07            [ 1] 1055 	jreq	00105$
                                   1056 ;	lib/src/stm8s_tim1.c: 996: TIM1->CCER1 |= TIM1_CCER1_CC2P;
      009F1E AA 20            [ 1] 1057 	or	a, #0x20
      009F20 C7 52 5C         [ 1] 1058 	ld	0x525c, a
      009F23 20 05            [ 2] 1059 	jra	00106$
      009F25                       1060 00105$:
                                   1061 ;	lib/src/stm8s_tim1.c: 1000: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
      009F25 A4 DF            [ 1] 1062 	and	a, #0xdf
      009F27 C7 52 5C         [ 1] 1063 	ld	0x525c, a
      009F2A                       1064 00106$:
                                   1065 ;	lib/src/stm8s_tim1.c: 1003: TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS))
      009F2A C6 52 52         [ 1] 1066 	ld	a, 0x5252
      009F2D A4 F0            [ 1] 1067 	and	a, #0xf0
                                   1068 ;	lib/src/stm8s_tim1.c: 1004: | (uint8_t) TIM1_EncoderMode);
      009F2F 1A 01            [ 1] 1069 	or	a, (0x01, sp)
      009F31 C7 52 52         [ 1] 1070 	ld	0x5252, a
                                   1071 ;	lib/src/stm8s_tim1.c: 1007: TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS)) 
      009F34 C6 52 58         [ 1] 1072 	ld	a, 0x5258
      009F37 A4 FC            [ 1] 1073 	and	a, #0xfc
      009F39 AA 01            [ 1] 1074 	or	a, #0x01
      009F3B C7 52 58         [ 1] 1075 	ld	0x5258, a
                                   1076 ;	lib/src/stm8s_tim1.c: 1009: TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS))
      009F3E C6 52 59         [ 1] 1077 	ld	a, 0x5259
      009F41 A4 FC            [ 1] 1078 	and	a, #0xfc
      009F43 AA 01            [ 1] 1079 	or	a, #0x01
      009F45 C7 52 59         [ 1] 1080 	ld	0x5259, a
                                   1081 ;	lib/src/stm8s_tim1.c: 1011: }
      009F48 1E 02            [ 2] 1082 	ldw	x, (2, sp)
      009F4A 5B 05            [ 2] 1083 	addw	sp, #5
      009F4C FC               [ 2] 1084 	jp	(x)
                                   1085 ;	lib/src/stm8s_tim1.c: 1023: void TIM1_PrescalerConfig(uint16_t Prescaler,
                                   1086 ;	-----------------------------------------
                                   1087 ;	 function TIM1_PrescalerConfig
                                   1088 ;	-----------------------------------------
      009F4D                       1089 _TIM1_PrescalerConfig:
      009F4D 88               [ 1] 1090 	push	a
      009F4E 6B 01            [ 1] 1091 	ld	(0x01, sp), a
                                   1092 ;	lib/src/stm8s_tim1.c: 1030: TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
      009F50 9E               [ 1] 1093 	ld	a, xh
      009F51 C7 52 60         [ 1] 1094 	ld	0x5260, a
                                   1095 ;	lib/src/stm8s_tim1.c: 1031: TIM1->PSCRL = (uint8_t)(Prescaler);
      009F54 9F               [ 1] 1096 	ld	a, xl
      009F55 C7 52 61         [ 1] 1097 	ld	0x5261, a
                                   1098 ;	lib/src/stm8s_tim1.c: 1034: TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
      009F58 7B 01            [ 1] 1099 	ld	a, (0x01, sp)
      009F5A C7 52 57         [ 1] 1100 	ld	0x5257, a
                                   1101 ;	lib/src/stm8s_tim1.c: 1035: }
      009F5D 84               [ 1] 1102 	pop	a
      009F5E 81               [ 4] 1103 	ret
                                   1104 ;	lib/src/stm8s_tim1.c: 1048: void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
                                   1105 ;	-----------------------------------------
                                   1106 ;	 function TIM1_CounterModeConfig
                                   1107 ;	-----------------------------------------
      009F5F                       1108 _TIM1_CounterModeConfig:
      009F5F 88               [ 1] 1109 	push	a
      009F60 6B 01            [ 1] 1110 	ld	(0x01, sp), a
                                   1111 ;	lib/src/stm8s_tim1.c: 1055: TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
      009F62 C6 52 50         [ 1] 1112 	ld	a, 0x5250
      009F65 A4 8F            [ 1] 1113 	and	a, #0x8f
                                   1114 ;	lib/src/stm8s_tim1.c: 1056: | (uint8_t)TIM1_CounterMode);
      009F67 1A 01            [ 1] 1115 	or	a, (0x01, sp)
      009F69 C7 52 50         [ 1] 1116 	ld	0x5250, a
                                   1117 ;	lib/src/stm8s_tim1.c: 1057: }
      009F6C 84               [ 1] 1118 	pop	a
      009F6D 81               [ 4] 1119 	ret
                                   1120 ;	lib/src/stm8s_tim1.c: 1067: void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
                                   1121 ;	-----------------------------------------
                                   1122 ;	 function TIM1_ForcedOC1Config
                                   1123 ;	-----------------------------------------
      009F6E                       1124 _TIM1_ForcedOC1Config:
      009F6E 88               [ 1] 1125 	push	a
      009F6F 6B 01            [ 1] 1126 	ld	(0x01, sp), a
                                   1127 ;	lib/src/stm8s_tim1.c: 1073: TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))|
      009F71 C6 52 58         [ 1] 1128 	ld	a, 0x5258
      009F74 A4 8F            [ 1] 1129 	and	a, #0x8f
                                   1130 ;	lib/src/stm8s_tim1.c: 1074: (uint8_t)TIM1_ForcedAction);
      009F76 1A 01            [ 1] 1131 	or	a, (0x01, sp)
      009F78 C7 52 58         [ 1] 1132 	ld	0x5258, a
                                   1133 ;	lib/src/stm8s_tim1.c: 1075: }
      009F7B 84               [ 1] 1134 	pop	a
      009F7C 81               [ 4] 1135 	ret
                                   1136 ;	lib/src/stm8s_tim1.c: 1085: void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
                                   1137 ;	-----------------------------------------
                                   1138 ;	 function TIM1_ForcedOC2Config
                                   1139 ;	-----------------------------------------
      009F7D                       1140 _TIM1_ForcedOC2Config:
      009F7D 88               [ 1] 1141 	push	a
      009F7E 6B 01            [ 1] 1142 	ld	(0x01, sp), a
                                   1143 ;	lib/src/stm8s_tim1.c: 1091: TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
      009F80 C6 52 59         [ 1] 1144 	ld	a, 0x5259
      009F83 A4 8F            [ 1] 1145 	and	a, #0x8f
                                   1146 ;	lib/src/stm8s_tim1.c: 1092: | (uint8_t)TIM1_ForcedAction);
      009F85 1A 01            [ 1] 1147 	or	a, (0x01, sp)
      009F87 C7 52 59         [ 1] 1148 	ld	0x5259, a
                                   1149 ;	lib/src/stm8s_tim1.c: 1093: }
      009F8A 84               [ 1] 1150 	pop	a
      009F8B 81               [ 4] 1151 	ret
                                   1152 ;	lib/src/stm8s_tim1.c: 1104: void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
                                   1153 ;	-----------------------------------------
                                   1154 ;	 function TIM1_ForcedOC3Config
                                   1155 ;	-----------------------------------------
      009F8C                       1156 _TIM1_ForcedOC3Config:
      009F8C 88               [ 1] 1157 	push	a
      009F8D 6B 01            [ 1] 1158 	ld	(0x01, sp), a
                                   1159 ;	lib/src/stm8s_tim1.c: 1110: TIM1->CCMR3  =  (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM))  
      009F8F C6 52 5A         [ 1] 1160 	ld	a, 0x525a
      009F92 A4 8F            [ 1] 1161 	and	a, #0x8f
                                   1162 ;	lib/src/stm8s_tim1.c: 1111: | (uint8_t)TIM1_ForcedAction);
      009F94 1A 01            [ 1] 1163 	or	a, (0x01, sp)
      009F96 C7 52 5A         [ 1] 1164 	ld	0x525a, a
                                   1165 ;	lib/src/stm8s_tim1.c: 1112: }
      009F99 84               [ 1] 1166 	pop	a
      009F9A 81               [ 4] 1167 	ret
                                   1168 ;	lib/src/stm8s_tim1.c: 1123: void TIM1_ForcedOC4Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
                                   1169 ;	-----------------------------------------
                                   1170 ;	 function TIM1_ForcedOC4Config
                                   1171 ;	-----------------------------------------
      009F9B                       1172 _TIM1_ForcedOC4Config:
      009F9B 88               [ 1] 1173 	push	a
      009F9C 6B 01            [ 1] 1174 	ld	(0x01, sp), a
                                   1175 ;	lib/src/stm8s_tim1.c: 1129: TIM1->CCMR4  =  (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
      009F9E C6 52 5B         [ 1] 1176 	ld	a, 0x525b
      009FA1 A4 8F            [ 1] 1177 	and	a, #0x8f
                                   1178 ;	lib/src/stm8s_tim1.c: 1130: | (uint8_t)TIM1_ForcedAction);
      009FA3 1A 01            [ 1] 1179 	or	a, (0x01, sp)
      009FA5 C7 52 5B         [ 1] 1180 	ld	0x525b, a
                                   1181 ;	lib/src/stm8s_tim1.c: 1131: }
      009FA8 84               [ 1] 1182 	pop	a
      009FA9 81               [ 4] 1183 	ret
                                   1184 ;	lib/src/stm8s_tim1.c: 1139: void TIM1_ARRPreloadConfig(FunctionalState NewState)
                                   1185 ;	-----------------------------------------
                                   1186 ;	 function TIM1_ARRPreloadConfig
                                   1187 ;	-----------------------------------------
      009FAA                       1188 _TIM1_ARRPreloadConfig:
      009FAA 88               [ 1] 1189 	push	a
      009FAB 6B 01            [ 1] 1190 	ld	(0x01, sp), a
                                   1191 ;	lib/src/stm8s_tim1.c: 1147: TIM1->CR1 |= TIM1_CR1_ARPE;
      009FAD C6 52 50         [ 1] 1192 	ld	a, 0x5250
                                   1193 ;	lib/src/stm8s_tim1.c: 1145: if (NewState != DISABLE)
      009FB0 0D 01            [ 1] 1194 	tnz	(0x01, sp)
      009FB2 27 07            [ 1] 1195 	jreq	00102$
                                   1196 ;	lib/src/stm8s_tim1.c: 1147: TIM1->CR1 |= TIM1_CR1_ARPE;
      009FB4 AA 80            [ 1] 1197 	or	a, #0x80
      009FB6 C7 52 50         [ 1] 1198 	ld	0x5250, a
      009FB9 20 05            [ 2] 1199 	jra	00104$
      009FBB                       1200 00102$:
                                   1201 ;	lib/src/stm8s_tim1.c: 1151: TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
      009FBB A4 7F            [ 1] 1202 	and	a, #0x7f
      009FBD C7 52 50         [ 1] 1203 	ld	0x5250, a
      009FC0                       1204 00104$:
                                   1205 ;	lib/src/stm8s_tim1.c: 1153: }
      009FC0 84               [ 1] 1206 	pop	a
      009FC1 81               [ 4] 1207 	ret
                                   1208 ;	lib/src/stm8s_tim1.c: 1161: void TIM1_SelectCOM(FunctionalState NewState)
                                   1209 ;	-----------------------------------------
                                   1210 ;	 function TIM1_SelectCOM
                                   1211 ;	-----------------------------------------
      009FC2                       1212 _TIM1_SelectCOM:
      009FC2 88               [ 1] 1213 	push	a
      009FC3 6B 01            [ 1] 1214 	ld	(0x01, sp), a
                                   1215 ;	lib/src/stm8s_tim1.c: 1169: TIM1->CR2 |= TIM1_CR2_COMS;
      009FC5 C6 52 51         [ 1] 1216 	ld	a, 0x5251
                                   1217 ;	lib/src/stm8s_tim1.c: 1167: if (NewState != DISABLE)
      009FC8 0D 01            [ 1] 1218 	tnz	(0x01, sp)
      009FCA 27 07            [ 1] 1219 	jreq	00102$
                                   1220 ;	lib/src/stm8s_tim1.c: 1169: TIM1->CR2 |= TIM1_CR2_COMS;
      009FCC AA 04            [ 1] 1221 	or	a, #0x04
      009FCE C7 52 51         [ 1] 1222 	ld	0x5251, a
      009FD1 20 05            [ 2] 1223 	jra	00104$
      009FD3                       1224 00102$:
                                   1225 ;	lib/src/stm8s_tim1.c: 1173: TIM1->CR2 &= (uint8_t)(~TIM1_CR2_COMS);
      009FD3 A4 FB            [ 1] 1226 	and	a, #0xfb
      009FD5 C7 52 51         [ 1] 1227 	ld	0x5251, a
      009FD8                       1228 00104$:
                                   1229 ;	lib/src/stm8s_tim1.c: 1175: }
      009FD8 84               [ 1] 1230 	pop	a
      009FD9 81               [ 4] 1231 	ret
                                   1232 ;	lib/src/stm8s_tim1.c: 1183: void TIM1_CCPreloadControl(FunctionalState NewState)
                                   1233 ;	-----------------------------------------
                                   1234 ;	 function TIM1_CCPreloadControl
                                   1235 ;	-----------------------------------------
      009FDA                       1236 _TIM1_CCPreloadControl:
      009FDA 88               [ 1] 1237 	push	a
      009FDB 6B 01            [ 1] 1238 	ld	(0x01, sp), a
                                   1239 ;	lib/src/stm8s_tim1.c: 1191: TIM1->CR2 |= TIM1_CR2_CCPC;
      009FDD C6 52 51         [ 1] 1240 	ld	a, 0x5251
                                   1241 ;	lib/src/stm8s_tim1.c: 1189: if (NewState != DISABLE)
      009FE0 0D 01            [ 1] 1242 	tnz	(0x01, sp)
      009FE2 27 07            [ 1] 1243 	jreq	00102$
                                   1244 ;	lib/src/stm8s_tim1.c: 1191: TIM1->CR2 |= TIM1_CR2_CCPC;
      009FE4 AA 01            [ 1] 1245 	or	a, #0x01
      009FE6 C7 52 51         [ 1] 1246 	ld	0x5251, a
      009FE9 20 05            [ 2] 1247 	jra	00104$
      009FEB                       1248 00102$:
                                   1249 ;	lib/src/stm8s_tim1.c: 1195: TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
      009FEB A4 FE            [ 1] 1250 	and	a, #0xfe
      009FED C7 52 51         [ 1] 1251 	ld	0x5251, a
      009FF0                       1252 00104$:
                                   1253 ;	lib/src/stm8s_tim1.c: 1197: }
      009FF0 84               [ 1] 1254 	pop	a
      009FF1 81               [ 4] 1255 	ret
                                   1256 ;	lib/src/stm8s_tim1.c: 1205: void TIM1_OC1PreloadConfig(FunctionalState NewState)
                                   1257 ;	-----------------------------------------
                                   1258 ;	 function TIM1_OC1PreloadConfig
                                   1259 ;	-----------------------------------------
      009FF2                       1260 _TIM1_OC1PreloadConfig:
      009FF2 88               [ 1] 1261 	push	a
      009FF3 6B 01            [ 1] 1262 	ld	(0x01, sp), a
                                   1263 ;	lib/src/stm8s_tim1.c: 1213: TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
      009FF5 C6 52 58         [ 1] 1264 	ld	a, 0x5258
                                   1265 ;	lib/src/stm8s_tim1.c: 1211: if (NewState != DISABLE)
      009FF8 0D 01            [ 1] 1266 	tnz	(0x01, sp)
      009FFA 27 07            [ 1] 1267 	jreq	00102$
                                   1268 ;	lib/src/stm8s_tim1.c: 1213: TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
      009FFC AA 08            [ 1] 1269 	or	a, #0x08
      009FFE C7 52 58         [ 1] 1270 	ld	0x5258, a
      00A001 20 05            [ 2] 1271 	jra	00104$
      00A003                       1272 00102$:
                                   1273 ;	lib/src/stm8s_tim1.c: 1217: TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
      00A003 A4 F7            [ 1] 1274 	and	a, #0xf7
      00A005 C7 52 58         [ 1] 1275 	ld	0x5258, a
      00A008                       1276 00104$:
                                   1277 ;	lib/src/stm8s_tim1.c: 1219: }
      00A008 84               [ 1] 1278 	pop	a
      00A009 81               [ 4] 1279 	ret
                                   1280 ;	lib/src/stm8s_tim1.c: 1227: void TIM1_OC2PreloadConfig(FunctionalState NewState)
                                   1281 ;	-----------------------------------------
                                   1282 ;	 function TIM1_OC2PreloadConfig
                                   1283 ;	-----------------------------------------
      00A00A                       1284 _TIM1_OC2PreloadConfig:
      00A00A 88               [ 1] 1285 	push	a
      00A00B 6B 01            [ 1] 1286 	ld	(0x01, sp), a
                                   1287 ;	lib/src/stm8s_tim1.c: 1235: TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
      00A00D C6 52 59         [ 1] 1288 	ld	a, 0x5259
                                   1289 ;	lib/src/stm8s_tim1.c: 1233: if (NewState != DISABLE)
      00A010 0D 01            [ 1] 1290 	tnz	(0x01, sp)
      00A012 27 07            [ 1] 1291 	jreq	00102$
                                   1292 ;	lib/src/stm8s_tim1.c: 1235: TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
      00A014 AA 08            [ 1] 1293 	or	a, #0x08
      00A016 C7 52 59         [ 1] 1294 	ld	0x5259, a
      00A019 20 05            [ 2] 1295 	jra	00104$
      00A01B                       1296 00102$:
                                   1297 ;	lib/src/stm8s_tim1.c: 1239: TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
      00A01B A4 F7            [ 1] 1298 	and	a, #0xf7
      00A01D C7 52 59         [ 1] 1299 	ld	0x5259, a
      00A020                       1300 00104$:
                                   1301 ;	lib/src/stm8s_tim1.c: 1241: }
      00A020 84               [ 1] 1302 	pop	a
      00A021 81               [ 4] 1303 	ret
                                   1304 ;	lib/src/stm8s_tim1.c: 1249: void TIM1_OC3PreloadConfig(FunctionalState NewState)
                                   1305 ;	-----------------------------------------
                                   1306 ;	 function TIM1_OC3PreloadConfig
                                   1307 ;	-----------------------------------------
      00A022                       1308 _TIM1_OC3PreloadConfig:
      00A022 88               [ 1] 1309 	push	a
      00A023 6B 01            [ 1] 1310 	ld	(0x01, sp), a
                                   1311 ;	lib/src/stm8s_tim1.c: 1257: TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
      00A025 C6 52 5A         [ 1] 1312 	ld	a, 0x525a
                                   1313 ;	lib/src/stm8s_tim1.c: 1255: if (NewState != DISABLE)
      00A028 0D 01            [ 1] 1314 	tnz	(0x01, sp)
      00A02A 27 07            [ 1] 1315 	jreq	00102$
                                   1316 ;	lib/src/stm8s_tim1.c: 1257: TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
      00A02C AA 08            [ 1] 1317 	or	a, #0x08
      00A02E C7 52 5A         [ 1] 1318 	ld	0x525a, a
      00A031 20 05            [ 2] 1319 	jra	00104$
      00A033                       1320 00102$:
                                   1321 ;	lib/src/stm8s_tim1.c: 1261: TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
      00A033 A4 F7            [ 1] 1322 	and	a, #0xf7
      00A035 C7 52 5A         [ 1] 1323 	ld	0x525a, a
      00A038                       1324 00104$:
                                   1325 ;	lib/src/stm8s_tim1.c: 1263: }
      00A038 84               [ 1] 1326 	pop	a
      00A039 81               [ 4] 1327 	ret
                                   1328 ;	lib/src/stm8s_tim1.c: 1271: void TIM1_OC4PreloadConfig(FunctionalState NewState)
                                   1329 ;	-----------------------------------------
                                   1330 ;	 function TIM1_OC4PreloadConfig
                                   1331 ;	-----------------------------------------
      00A03A                       1332 _TIM1_OC4PreloadConfig:
      00A03A 88               [ 1] 1333 	push	a
      00A03B 6B 01            [ 1] 1334 	ld	(0x01, sp), a
                                   1335 ;	lib/src/stm8s_tim1.c: 1279: TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
      00A03D C6 52 5B         [ 1] 1336 	ld	a, 0x525b
                                   1337 ;	lib/src/stm8s_tim1.c: 1277: if (NewState != DISABLE)
      00A040 0D 01            [ 1] 1338 	tnz	(0x01, sp)
      00A042 27 07            [ 1] 1339 	jreq	00102$
                                   1340 ;	lib/src/stm8s_tim1.c: 1279: TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
      00A044 AA 08            [ 1] 1341 	or	a, #0x08
      00A046 C7 52 5B         [ 1] 1342 	ld	0x525b, a
      00A049 20 05            [ 2] 1343 	jra	00104$
      00A04B                       1344 00102$:
                                   1345 ;	lib/src/stm8s_tim1.c: 1283: TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
      00A04B A4 F7            [ 1] 1346 	and	a, #0xf7
      00A04D C7 52 5B         [ 1] 1347 	ld	0x525b, a
      00A050                       1348 00104$:
                                   1349 ;	lib/src/stm8s_tim1.c: 1285: }
      00A050 84               [ 1] 1350 	pop	a
      00A051 81               [ 4] 1351 	ret
                                   1352 ;	lib/src/stm8s_tim1.c: 1293: void TIM1_OC1FastConfig(FunctionalState NewState)
                                   1353 ;	-----------------------------------------
                                   1354 ;	 function TIM1_OC1FastConfig
                                   1355 ;	-----------------------------------------
      00A052                       1356 _TIM1_OC1FastConfig:
      00A052 88               [ 1] 1357 	push	a
      00A053 6B 01            [ 1] 1358 	ld	(0x01, sp), a
                                   1359 ;	lib/src/stm8s_tim1.c: 1301: TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
      00A055 C6 52 58         [ 1] 1360 	ld	a, 0x5258
                                   1361 ;	lib/src/stm8s_tim1.c: 1299: if (NewState != DISABLE)
      00A058 0D 01            [ 1] 1362 	tnz	(0x01, sp)
      00A05A 27 07            [ 1] 1363 	jreq	00102$
                                   1364 ;	lib/src/stm8s_tim1.c: 1301: TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
      00A05C AA 04            [ 1] 1365 	or	a, #0x04
      00A05E C7 52 58         [ 1] 1366 	ld	0x5258, a
      00A061 20 05            [ 2] 1367 	jra	00104$
      00A063                       1368 00102$:
                                   1369 ;	lib/src/stm8s_tim1.c: 1305: TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
      00A063 A4 FB            [ 1] 1370 	and	a, #0xfb
      00A065 C7 52 58         [ 1] 1371 	ld	0x5258, a
      00A068                       1372 00104$:
                                   1373 ;	lib/src/stm8s_tim1.c: 1307: }
      00A068 84               [ 1] 1374 	pop	a
      00A069 81               [ 4] 1375 	ret
                                   1376 ;	lib/src/stm8s_tim1.c: 1315: void TIM1_OC2FastConfig(FunctionalState NewState)
                                   1377 ;	-----------------------------------------
                                   1378 ;	 function TIM1_OC2FastConfig
                                   1379 ;	-----------------------------------------
      00A06A                       1380 _TIM1_OC2FastConfig:
      00A06A 88               [ 1] 1381 	push	a
      00A06B 6B 01            [ 1] 1382 	ld	(0x01, sp), a
                                   1383 ;	lib/src/stm8s_tim1.c: 1323: TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
      00A06D C6 52 59         [ 1] 1384 	ld	a, 0x5259
                                   1385 ;	lib/src/stm8s_tim1.c: 1321: if (NewState != DISABLE)
      00A070 0D 01            [ 1] 1386 	tnz	(0x01, sp)
      00A072 27 07            [ 1] 1387 	jreq	00102$
                                   1388 ;	lib/src/stm8s_tim1.c: 1323: TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
      00A074 AA 04            [ 1] 1389 	or	a, #0x04
      00A076 C7 52 59         [ 1] 1390 	ld	0x5259, a
      00A079 20 05            [ 2] 1391 	jra	00104$
      00A07B                       1392 00102$:
                                   1393 ;	lib/src/stm8s_tim1.c: 1327: TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
      00A07B A4 FB            [ 1] 1394 	and	a, #0xfb
      00A07D C7 52 59         [ 1] 1395 	ld	0x5259, a
      00A080                       1396 00104$:
                                   1397 ;	lib/src/stm8s_tim1.c: 1329: }
      00A080 84               [ 1] 1398 	pop	a
      00A081 81               [ 4] 1399 	ret
                                   1400 ;	lib/src/stm8s_tim1.c: 1337: void TIM1_OC3FastConfig(FunctionalState NewState)
                                   1401 ;	-----------------------------------------
                                   1402 ;	 function TIM1_OC3FastConfig
                                   1403 ;	-----------------------------------------
      00A082                       1404 _TIM1_OC3FastConfig:
      00A082 88               [ 1] 1405 	push	a
      00A083 6B 01            [ 1] 1406 	ld	(0x01, sp), a
                                   1407 ;	lib/src/stm8s_tim1.c: 1345: TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
      00A085 C6 52 5A         [ 1] 1408 	ld	a, 0x525a
                                   1409 ;	lib/src/stm8s_tim1.c: 1343: if (NewState != DISABLE)
      00A088 0D 01            [ 1] 1410 	tnz	(0x01, sp)
      00A08A 27 07            [ 1] 1411 	jreq	00102$
                                   1412 ;	lib/src/stm8s_tim1.c: 1345: TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
      00A08C AA 04            [ 1] 1413 	or	a, #0x04
      00A08E C7 52 5A         [ 1] 1414 	ld	0x525a, a
      00A091 20 05            [ 2] 1415 	jra	00104$
      00A093                       1416 00102$:
                                   1417 ;	lib/src/stm8s_tim1.c: 1349: TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
      00A093 A4 FB            [ 1] 1418 	and	a, #0xfb
      00A095 C7 52 5A         [ 1] 1419 	ld	0x525a, a
      00A098                       1420 00104$:
                                   1421 ;	lib/src/stm8s_tim1.c: 1351: }
      00A098 84               [ 1] 1422 	pop	a
      00A099 81               [ 4] 1423 	ret
                                   1424 ;	lib/src/stm8s_tim1.c: 1359: void TIM1_OC4FastConfig(FunctionalState NewState)
                                   1425 ;	-----------------------------------------
                                   1426 ;	 function TIM1_OC4FastConfig
                                   1427 ;	-----------------------------------------
      00A09A                       1428 _TIM1_OC4FastConfig:
      00A09A 88               [ 1] 1429 	push	a
      00A09B 6B 01            [ 1] 1430 	ld	(0x01, sp), a
                                   1431 ;	lib/src/stm8s_tim1.c: 1367: TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
      00A09D C6 52 5B         [ 1] 1432 	ld	a, 0x525b
                                   1433 ;	lib/src/stm8s_tim1.c: 1365: if (NewState != DISABLE)
      00A0A0 0D 01            [ 1] 1434 	tnz	(0x01, sp)
      00A0A2 27 07            [ 1] 1435 	jreq	00102$
                                   1436 ;	lib/src/stm8s_tim1.c: 1367: TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
      00A0A4 AA 04            [ 1] 1437 	or	a, #0x04
      00A0A6 C7 52 5B         [ 1] 1438 	ld	0x525b, a
      00A0A9 20 05            [ 2] 1439 	jra	00104$
      00A0AB                       1440 00102$:
                                   1441 ;	lib/src/stm8s_tim1.c: 1371: TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxFE);
      00A0AB A4 FB            [ 1] 1442 	and	a, #0xfb
      00A0AD C7 52 5B         [ 1] 1443 	ld	0x525b, a
      00A0B0                       1444 00104$:
                                   1445 ;	lib/src/stm8s_tim1.c: 1373: }
      00A0B0 84               [ 1] 1446 	pop	a
      00A0B1 81               [ 4] 1447 	ret
                                   1448 ;	lib/src/stm8s_tim1.c: 1389: void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
                                   1449 ;	-----------------------------------------
                                   1450 ;	 function TIM1_GenerateEvent
                                   1451 ;	-----------------------------------------
      00A0B2                       1452 _TIM1_GenerateEvent:
                                   1453 ;	lib/src/stm8s_tim1.c: 1395: TIM1->EGR = (uint8_t)TIM1_EventSource;
      00A0B2 C7 52 57         [ 1] 1454 	ld	0x5257, a
                                   1455 ;	lib/src/stm8s_tim1.c: 1396: }
      00A0B5 81               [ 4] 1456 	ret
                                   1457 ;	lib/src/stm8s_tim1.c: 1406: void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
                                   1458 ;	-----------------------------------------
                                   1459 ;	 function TIM1_OC1PolarityConfig
                                   1460 ;	-----------------------------------------
      00A0B6                       1461 _TIM1_OC1PolarityConfig:
      00A0B6 88               [ 1] 1462 	push	a
      00A0B7 6B 01            [ 1] 1463 	ld	(0x01, sp), a
                                   1464 ;	lib/src/stm8s_tim1.c: 1414: TIM1->CCER1 |= TIM1_CCER1_CC1P;
      00A0B9 C6 52 5C         [ 1] 1465 	ld	a, 0x525c
                                   1466 ;	lib/src/stm8s_tim1.c: 1412: if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
      00A0BC 0D 01            [ 1] 1467 	tnz	(0x01, sp)
      00A0BE 27 07            [ 1] 1468 	jreq	00102$
                                   1469 ;	lib/src/stm8s_tim1.c: 1414: TIM1->CCER1 |= TIM1_CCER1_CC1P;
      00A0C0 AA 02            [ 1] 1470 	or	a, #0x02
      00A0C2 C7 52 5C         [ 1] 1471 	ld	0x525c, a
      00A0C5 20 05            [ 2] 1472 	jra	00104$
      00A0C7                       1473 00102$:
                                   1474 ;	lib/src/stm8s_tim1.c: 1418: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
      00A0C7 A4 FD            [ 1] 1475 	and	a, #0xfd
      00A0C9 C7 52 5C         [ 1] 1476 	ld	0x525c, a
      00A0CC                       1477 00104$:
                                   1478 ;	lib/src/stm8s_tim1.c: 1420: }
      00A0CC 84               [ 1] 1479 	pop	a
      00A0CD 81               [ 4] 1480 	ret
                                   1481 ;	lib/src/stm8s_tim1.c: 1430: void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
                                   1482 ;	-----------------------------------------
                                   1483 ;	 function TIM1_OC1NPolarityConfig
                                   1484 ;	-----------------------------------------
      00A0CE                       1485 _TIM1_OC1NPolarityConfig:
      00A0CE 88               [ 1] 1486 	push	a
      00A0CF 6B 01            [ 1] 1487 	ld	(0x01, sp), a
                                   1488 ;	lib/src/stm8s_tim1.c: 1438: TIM1->CCER1 |= TIM1_CCER1_CC1NP;
      00A0D1 C6 52 5C         [ 1] 1489 	ld	a, 0x525c
                                   1490 ;	lib/src/stm8s_tim1.c: 1436: if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
      00A0D4 0D 01            [ 1] 1491 	tnz	(0x01, sp)
      00A0D6 27 07            [ 1] 1492 	jreq	00102$
                                   1493 ;	lib/src/stm8s_tim1.c: 1438: TIM1->CCER1 |= TIM1_CCER1_CC1NP;
      00A0D8 AA 08            [ 1] 1494 	or	a, #0x08
      00A0DA C7 52 5C         [ 1] 1495 	ld	0x525c, a
      00A0DD 20 05            [ 2] 1496 	jra	00104$
      00A0DF                       1497 00102$:
                                   1498 ;	lib/src/stm8s_tim1.c: 1442: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
      00A0DF A4 F7            [ 1] 1499 	and	a, #0xf7
      00A0E1 C7 52 5C         [ 1] 1500 	ld	0x525c, a
      00A0E4                       1501 00104$:
                                   1502 ;	lib/src/stm8s_tim1.c: 1444: }
      00A0E4 84               [ 1] 1503 	pop	a
      00A0E5 81               [ 4] 1504 	ret
                                   1505 ;	lib/src/stm8s_tim1.c: 1454: void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
                                   1506 ;	-----------------------------------------
                                   1507 ;	 function TIM1_OC2PolarityConfig
                                   1508 ;	-----------------------------------------
      00A0E6                       1509 _TIM1_OC2PolarityConfig:
      00A0E6 88               [ 1] 1510 	push	a
      00A0E7 6B 01            [ 1] 1511 	ld	(0x01, sp), a
                                   1512 ;	lib/src/stm8s_tim1.c: 1463: TIM1->CCER1 |= TIM1_CCER1_CC2P;
      00A0E9 C6 52 5C         [ 1] 1513 	ld	a, 0x525c
                                   1514 ;	lib/src/stm8s_tim1.c: 1461: if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
      00A0EC 0D 01            [ 1] 1515 	tnz	(0x01, sp)
      00A0EE 27 07            [ 1] 1516 	jreq	00102$
                                   1517 ;	lib/src/stm8s_tim1.c: 1463: TIM1->CCER1 |= TIM1_CCER1_CC2P;
      00A0F0 AA 20            [ 1] 1518 	or	a, #0x20
      00A0F2 C7 52 5C         [ 1] 1519 	ld	0x525c, a
      00A0F5 20 05            [ 2] 1520 	jra	00104$
      00A0F7                       1521 00102$:
                                   1522 ;	lib/src/stm8s_tim1.c: 1467: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
      00A0F7 A4 DF            [ 1] 1523 	and	a, #0xdf
      00A0F9 C7 52 5C         [ 1] 1524 	ld	0x525c, a
      00A0FC                       1525 00104$:
                                   1526 ;	lib/src/stm8s_tim1.c: 1469: }
      00A0FC 84               [ 1] 1527 	pop	a
      00A0FD 81               [ 4] 1528 	ret
                                   1529 ;	lib/src/stm8s_tim1.c: 1479: void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
                                   1530 ;	-----------------------------------------
                                   1531 ;	 function TIM1_OC2NPolarityConfig
                                   1532 ;	-----------------------------------------
      00A0FE                       1533 _TIM1_OC2NPolarityConfig:
      00A0FE 88               [ 1] 1534 	push	a
      00A0FF 6B 01            [ 1] 1535 	ld	(0x01, sp), a
                                   1536 ;	lib/src/stm8s_tim1.c: 1487: TIM1->CCER1 |= TIM1_CCER1_CC2NP;
      00A101 C6 52 5C         [ 1] 1537 	ld	a, 0x525c
                                   1538 ;	lib/src/stm8s_tim1.c: 1485: if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
      00A104 0D 01            [ 1] 1539 	tnz	(0x01, sp)
      00A106 27 07            [ 1] 1540 	jreq	00102$
                                   1541 ;	lib/src/stm8s_tim1.c: 1487: TIM1->CCER1 |= TIM1_CCER1_CC2NP;
      00A108 AA 80            [ 1] 1542 	or	a, #0x80
      00A10A C7 52 5C         [ 1] 1543 	ld	0x525c, a
      00A10D 20 05            [ 2] 1544 	jra	00104$
      00A10F                       1545 00102$:
                                   1546 ;	lib/src/stm8s_tim1.c: 1491: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
      00A10F A4 7F            [ 1] 1547 	and	a, #0x7f
      00A111 C7 52 5C         [ 1] 1548 	ld	0x525c, a
      00A114                       1549 00104$:
                                   1550 ;	lib/src/stm8s_tim1.c: 1493: }
      00A114 84               [ 1] 1551 	pop	a
      00A115 81               [ 4] 1552 	ret
                                   1553 ;	lib/src/stm8s_tim1.c: 1503: void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
                                   1554 ;	-----------------------------------------
                                   1555 ;	 function TIM1_OC3PolarityConfig
                                   1556 ;	-----------------------------------------
      00A116                       1557 _TIM1_OC3PolarityConfig:
      00A116 88               [ 1] 1558 	push	a
      00A117 6B 01            [ 1] 1559 	ld	(0x01, sp), a
                                   1560 ;	lib/src/stm8s_tim1.c: 1511: TIM1->CCER2 |= TIM1_CCER2_CC3P;
      00A119 C6 52 5D         [ 1] 1561 	ld	a, 0x525d
                                   1562 ;	lib/src/stm8s_tim1.c: 1509: if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
      00A11C 0D 01            [ 1] 1563 	tnz	(0x01, sp)
      00A11E 27 07            [ 1] 1564 	jreq	00102$
                                   1565 ;	lib/src/stm8s_tim1.c: 1511: TIM1->CCER2 |= TIM1_CCER2_CC3P;
      00A120 AA 02            [ 1] 1566 	or	a, #0x02
      00A122 C7 52 5D         [ 1] 1567 	ld	0x525d, a
      00A125 20 05            [ 2] 1568 	jra	00104$
      00A127                       1569 00102$:
                                   1570 ;	lib/src/stm8s_tim1.c: 1515: TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
      00A127 A4 FD            [ 1] 1571 	and	a, #0xfd
      00A129 C7 52 5D         [ 1] 1572 	ld	0x525d, a
      00A12C                       1573 00104$:
                                   1574 ;	lib/src/stm8s_tim1.c: 1517: }
      00A12C 84               [ 1] 1575 	pop	a
      00A12D 81               [ 4] 1576 	ret
                                   1577 ;	lib/src/stm8s_tim1.c: 1528: void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
                                   1578 ;	-----------------------------------------
                                   1579 ;	 function TIM1_OC3NPolarityConfig
                                   1580 ;	-----------------------------------------
      00A12E                       1581 _TIM1_OC3NPolarityConfig:
      00A12E 88               [ 1] 1582 	push	a
      00A12F 6B 01            [ 1] 1583 	ld	(0x01, sp), a
                                   1584 ;	lib/src/stm8s_tim1.c: 1536: TIM1->CCER2 |= TIM1_CCER2_CC3NP;
      00A131 C6 52 5D         [ 1] 1585 	ld	a, 0x525d
                                   1586 ;	lib/src/stm8s_tim1.c: 1534: if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
      00A134 0D 01            [ 1] 1587 	tnz	(0x01, sp)
      00A136 27 07            [ 1] 1588 	jreq	00102$
                                   1589 ;	lib/src/stm8s_tim1.c: 1536: TIM1->CCER2 |= TIM1_CCER2_CC3NP;
      00A138 AA 08            [ 1] 1590 	or	a, #0x08
      00A13A C7 52 5D         [ 1] 1591 	ld	0x525d, a
      00A13D 20 05            [ 2] 1592 	jra	00104$
      00A13F                       1593 00102$:
                                   1594 ;	lib/src/stm8s_tim1.c: 1540: TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
      00A13F A4 F7            [ 1] 1595 	and	a, #0xf7
      00A141 C7 52 5D         [ 1] 1596 	ld	0x525d, a
      00A144                       1597 00104$:
                                   1598 ;	lib/src/stm8s_tim1.c: 1542: }
      00A144 84               [ 1] 1599 	pop	a
      00A145 81               [ 4] 1600 	ret
                                   1601 ;	lib/src/stm8s_tim1.c: 1552: void TIM1_OC4PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
                                   1602 ;	-----------------------------------------
                                   1603 ;	 function TIM1_OC4PolarityConfig
                                   1604 ;	-----------------------------------------
      00A146                       1605 _TIM1_OC4PolarityConfig:
      00A146 88               [ 1] 1606 	push	a
      00A147 6B 01            [ 1] 1607 	ld	(0x01, sp), a
                                   1608 ;	lib/src/stm8s_tim1.c: 1560: TIM1->CCER2 |= TIM1_CCER2_CC4P;
      00A149 C6 52 5D         [ 1] 1609 	ld	a, 0x525d
                                   1610 ;	lib/src/stm8s_tim1.c: 1558: if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
      00A14C 0D 01            [ 1] 1611 	tnz	(0x01, sp)
      00A14E 27 07            [ 1] 1612 	jreq	00102$
                                   1613 ;	lib/src/stm8s_tim1.c: 1560: TIM1->CCER2 |= TIM1_CCER2_CC4P;
      00A150 AA 20            [ 1] 1614 	or	a, #0x20
      00A152 C7 52 5D         [ 1] 1615 	ld	0x525d, a
      00A155 20 05            [ 2] 1616 	jra	00104$
      00A157                       1617 00102$:
                                   1618 ;	lib/src/stm8s_tim1.c: 1564: TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
      00A157 A4 DF            [ 1] 1619 	and	a, #0xdf
      00A159 C7 52 5D         [ 1] 1620 	ld	0x525d, a
      00A15C                       1621 00104$:
                                   1622 ;	lib/src/stm8s_tim1.c: 1566: }
      00A15C 84               [ 1] 1623 	pop	a
      00A15D 81               [ 4] 1624 	ret
                                   1625 ;	lib/src/stm8s_tim1.c: 1580: void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
                                   1626 ;	-----------------------------------------
                                   1627 ;	 function TIM1_CCxCmd
                                   1628 ;	-----------------------------------------
      00A15E                       1629 _TIM1_CCxCmd:
                                   1630 ;	lib/src/stm8s_tim1.c: 1586: if (TIM1_Channel == TIM1_CHANNEL_1)
      00A15E 97               [ 1] 1631 	ld	xl, a
      00A15F 4D               [ 1] 1632 	tnz	a
      00A160 26 15            [ 1] 1633 	jrne	00120$
                                   1634 ;	lib/src/stm8s_tim1.c: 1591: TIM1->CCER1 |= TIM1_CCER1_CC1E;
      00A162 C6 52 5C         [ 1] 1635 	ld	a, 0x525c
                                   1636 ;	lib/src/stm8s_tim1.c: 1589: if (NewState != DISABLE)
      00A165 0D 03            [ 1] 1637 	tnz	(0x03, sp)
      00A167 27 07            [ 1] 1638 	jreq	00102$
                                   1639 ;	lib/src/stm8s_tim1.c: 1591: TIM1->CCER1 |= TIM1_CCER1_CC1E;
      00A169 AA 01            [ 1] 1640 	or	a, #0x01
      00A16B C7 52 5C         [ 1] 1641 	ld	0x525c, a
      00A16E 20 4C            [ 2] 1642 	jra	00122$
      00A170                       1643 00102$:
                                   1644 ;	lib/src/stm8s_tim1.c: 1595: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
      00A170 A4 FE            [ 1] 1645 	and	a, #0xfe
      00A172 C7 52 5C         [ 1] 1646 	ld	0x525c, a
      00A175 20 45            [ 2] 1647 	jra	00122$
      00A177                       1648 00120$:
                                   1649 ;	lib/src/stm8s_tim1.c: 1599: else if (TIM1_Channel == TIM1_CHANNEL_2)
      00A177 9F               [ 1] 1650 	ld	a, xl
      00A178 4A               [ 1] 1651 	dec	a
      00A179 26 15            [ 1] 1652 	jrne	00117$
                                   1653 ;	lib/src/stm8s_tim1.c: 1591: TIM1->CCER1 |= TIM1_CCER1_CC1E;
      00A17B C6 52 5C         [ 1] 1654 	ld	a, 0x525c
                                   1655 ;	lib/src/stm8s_tim1.c: 1602: if (NewState != DISABLE)
      00A17E 0D 03            [ 1] 1656 	tnz	(0x03, sp)
      00A180 27 07            [ 1] 1657 	jreq	00105$
                                   1658 ;	lib/src/stm8s_tim1.c: 1604: TIM1->CCER1 |= TIM1_CCER1_CC2E;
      00A182 AA 10            [ 1] 1659 	or	a, #0x10
      00A184 C7 52 5C         [ 1] 1660 	ld	0x525c, a
      00A187 20 33            [ 2] 1661 	jra	00122$
      00A189                       1662 00105$:
                                   1663 ;	lib/src/stm8s_tim1.c: 1608: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
      00A189 A4 EF            [ 1] 1664 	and	a, #0xef
      00A18B C7 52 5C         [ 1] 1665 	ld	0x525c, a
      00A18E 20 2C            [ 2] 1666 	jra	00122$
      00A190                       1667 00117$:
                                   1668 ;	lib/src/stm8s_tim1.c: 1616: TIM1->CCER2 |= TIM1_CCER2_CC3E;
      00A190 C6 52 5D         [ 1] 1669 	ld	a, 0x525d
                                   1670 ;	lib/src/stm8s_tim1.c: 1611: else if (TIM1_Channel == TIM1_CHANNEL_3)
      00A193 88               [ 1] 1671 	push	a
      00A194 9F               [ 1] 1672 	ld	a, xl
      00A195 A1 02            [ 1] 1673 	cp	a, #0x02
      00A197 84               [ 1] 1674 	pop	a
      00A198 26 12            [ 1] 1675 	jrne	00114$
                                   1676 ;	lib/src/stm8s_tim1.c: 1614: if (NewState != DISABLE)
      00A19A 0D 03            [ 1] 1677 	tnz	(0x03, sp)
      00A19C 27 07            [ 1] 1678 	jreq	00108$
                                   1679 ;	lib/src/stm8s_tim1.c: 1616: TIM1->CCER2 |= TIM1_CCER2_CC3E;
      00A19E AA 01            [ 1] 1680 	or	a, #0x01
      00A1A0 C7 52 5D         [ 1] 1681 	ld	0x525d, a
      00A1A3 20 17            [ 2] 1682 	jra	00122$
      00A1A5                       1683 00108$:
                                   1684 ;	lib/src/stm8s_tim1.c: 1620: TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
      00A1A5 A4 FE            [ 1] 1685 	and	a, #0xfe
      00A1A7 C7 52 5D         [ 1] 1686 	ld	0x525d, a
      00A1AA 20 10            [ 2] 1687 	jra	00122$
      00A1AC                       1688 00114$:
                                   1689 ;	lib/src/stm8s_tim1.c: 1626: if (NewState != DISABLE)
      00A1AC 0D 03            [ 1] 1690 	tnz	(0x03, sp)
      00A1AE 27 07            [ 1] 1691 	jreq	00111$
                                   1692 ;	lib/src/stm8s_tim1.c: 1628: TIM1->CCER2 |= TIM1_CCER2_CC4E;
      00A1B0 AA 10            [ 1] 1693 	or	a, #0x10
      00A1B2 C7 52 5D         [ 1] 1694 	ld	0x525d, a
      00A1B5 20 05            [ 2] 1695 	jra	00122$
      00A1B7                       1696 00111$:
                                   1697 ;	lib/src/stm8s_tim1.c: 1632: TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
      00A1B7 A4 EF            [ 1] 1698 	and	a, #0xef
      00A1B9 C7 52 5D         [ 1] 1699 	ld	0x525d, a
      00A1BC                       1700 00122$:
                                   1701 ;	lib/src/stm8s_tim1.c: 1635: }
      00A1BC 85               [ 2] 1702 	popw	x
      00A1BD 84               [ 1] 1703 	pop	a
      00A1BE FC               [ 2] 1704 	jp	(x)
                                   1705 ;	lib/src/stm8s_tim1.c: 1648: void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
                                   1706 ;	-----------------------------------------
                                   1707 ;	 function TIM1_CCxNCmd
                                   1708 ;	-----------------------------------------
      00A1BF                       1709 _TIM1_CCxNCmd:
                                   1710 ;	lib/src/stm8s_tim1.c: 1654: if (TIM1_Channel == TIM1_CHANNEL_1)
      00A1BF 4D               [ 1] 1711 	tnz	a
      00A1C0 26 15            [ 1] 1712 	jrne	00114$
                                   1713 ;	lib/src/stm8s_tim1.c: 1659: TIM1->CCER1 |= TIM1_CCER1_CC1NE;
      00A1C2 C6 52 5C         [ 1] 1714 	ld	a, 0x525c
                                   1715 ;	lib/src/stm8s_tim1.c: 1657: if (NewState != DISABLE)
      00A1C5 0D 03            [ 1] 1716 	tnz	(0x03, sp)
      00A1C7 27 07            [ 1] 1717 	jreq	00102$
                                   1718 ;	lib/src/stm8s_tim1.c: 1659: TIM1->CCER1 |= TIM1_CCER1_CC1NE;
      00A1C9 AA 04            [ 1] 1719 	or	a, #0x04
      00A1CB C7 52 5C         [ 1] 1720 	ld	0x525c, a
      00A1CE 20 32            [ 2] 1721 	jra	00116$
      00A1D0                       1722 00102$:
                                   1723 ;	lib/src/stm8s_tim1.c: 1663: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
      00A1D0 A4 FB            [ 1] 1724 	and	a, #0xfb
      00A1D2 C7 52 5C         [ 1] 1725 	ld	0x525c, a
      00A1D5 20 2B            [ 2] 1726 	jra	00116$
      00A1D7                       1727 00114$:
                                   1728 ;	lib/src/stm8s_tim1.c: 1666: else if (TIM1_Channel == TIM1_CHANNEL_2)
      00A1D7 4A               [ 1] 1729 	dec	a
      00A1D8 26 15            [ 1] 1730 	jrne	00111$
                                   1731 ;	lib/src/stm8s_tim1.c: 1659: TIM1->CCER1 |= TIM1_CCER1_CC1NE;
      00A1DA C6 52 5C         [ 1] 1732 	ld	a, 0x525c
                                   1733 ;	lib/src/stm8s_tim1.c: 1669: if (NewState != DISABLE)
      00A1DD 0D 03            [ 1] 1734 	tnz	(0x03, sp)
      00A1DF 27 07            [ 1] 1735 	jreq	00105$
                                   1736 ;	lib/src/stm8s_tim1.c: 1671: TIM1->CCER1 |= TIM1_CCER1_CC2NE;
      00A1E1 AA 40            [ 1] 1737 	or	a, #0x40
      00A1E3 C7 52 5C         [ 1] 1738 	ld	0x525c, a
      00A1E6 20 1A            [ 2] 1739 	jra	00116$
      00A1E8                       1740 00105$:
                                   1741 ;	lib/src/stm8s_tim1.c: 1675: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
      00A1E8 A4 BF            [ 1] 1742 	and	a, #0xbf
      00A1EA C7 52 5C         [ 1] 1743 	ld	0x525c, a
      00A1ED 20 13            [ 2] 1744 	jra	00116$
      00A1EF                       1745 00111$:
                                   1746 ;	lib/src/stm8s_tim1.c: 1683: TIM1->CCER2 |= TIM1_CCER2_CC3NE;
      00A1EF C6 52 5D         [ 1] 1747 	ld	a, 0x525d
                                   1748 ;	lib/src/stm8s_tim1.c: 1681: if (NewState != DISABLE)
      00A1F2 0D 03            [ 1] 1749 	tnz	(0x03, sp)
      00A1F4 27 07            [ 1] 1750 	jreq	00108$
                                   1751 ;	lib/src/stm8s_tim1.c: 1683: TIM1->CCER2 |= TIM1_CCER2_CC3NE;
      00A1F6 AA 04            [ 1] 1752 	or	a, #0x04
      00A1F8 C7 52 5D         [ 1] 1753 	ld	0x525d, a
      00A1FB 20 05            [ 2] 1754 	jra	00116$
      00A1FD                       1755 00108$:
                                   1756 ;	lib/src/stm8s_tim1.c: 1687: TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
      00A1FD A4 FB            [ 1] 1757 	and	a, #0xfb
      00A1FF C7 52 5D         [ 1] 1758 	ld	0x525d, a
      00A202                       1759 00116$:
                                   1760 ;	lib/src/stm8s_tim1.c: 1690: }
      00A202 85               [ 2] 1761 	popw	x
      00A203 84               [ 1] 1762 	pop	a
      00A204 FC               [ 2] 1763 	jp	(x)
                                   1764 ;	lib/src/stm8s_tim1.c: 1713: void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
                                   1765 ;	-----------------------------------------
                                   1766 ;	 function TIM1_SelectOCxM
                                   1767 ;	-----------------------------------------
      00A205                       1768 _TIM1_SelectOCxM:
                                   1769 ;	lib/src/stm8s_tim1.c: 1719: if (TIM1_Channel == TIM1_CHANNEL_1)
      00A205 97               [ 1] 1770 	ld	xl, a
      00A206 4D               [ 1] 1771 	tnz	a
      00A207 26 10            [ 1] 1772 	jrne	00108$
                                   1773 ;	lib/src/stm8s_tim1.c: 1722: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
      00A209 72 11 52 5C      [ 1] 1774 	bres	0x525c, #0
                                   1775 ;	lib/src/stm8s_tim1.c: 1725: TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) 
      00A20D C6 52 58         [ 1] 1776 	ld	a, 0x5258
      00A210 A4 8F            [ 1] 1777 	and	a, #0x8f
                                   1778 ;	lib/src/stm8s_tim1.c: 1726: | (uint8_t)TIM1_OCMode);
      00A212 1A 03            [ 1] 1779 	or	a, (0x03, sp)
      00A214 C7 52 58         [ 1] 1780 	ld	0x5258, a
      00A217 20 3E            [ 2] 1781 	jra	00110$
      00A219                       1782 00108$:
                                   1783 ;	lib/src/stm8s_tim1.c: 1728: else if (TIM1_Channel == TIM1_CHANNEL_2)
      00A219 9F               [ 1] 1784 	ld	a, xl
      00A21A 4A               [ 1] 1785 	dec	a
      00A21B 26 10            [ 1] 1786 	jrne	00105$
                                   1787 ;	lib/src/stm8s_tim1.c: 1731: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
      00A21D 72 19 52 5C      [ 1] 1788 	bres	0x525c, #4
                                   1789 ;	lib/src/stm8s_tim1.c: 1734: TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
      00A221 C6 52 59         [ 1] 1790 	ld	a, 0x5259
      00A224 A4 8F            [ 1] 1791 	and	a, #0x8f
                                   1792 ;	lib/src/stm8s_tim1.c: 1735: | (uint8_t)TIM1_OCMode);
      00A226 1A 03            [ 1] 1793 	or	a, (0x03, sp)
      00A228 C7 52 59         [ 1] 1794 	ld	0x5259, a
      00A22B 20 2A            [ 2] 1795 	jra	00110$
      00A22D                       1796 00105$:
                                   1797 ;	lib/src/stm8s_tim1.c: 1740: TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
      00A22D C6 52 5D         [ 1] 1798 	ld	a, 0x525d
                                   1799 ;	lib/src/stm8s_tim1.c: 1737: else if (TIM1_Channel == TIM1_CHANNEL_3)
      00A230 88               [ 1] 1800 	push	a
      00A231 9F               [ 1] 1801 	ld	a, xl
      00A232 A1 02            [ 1] 1802 	cp	a, #0x02
      00A234 84               [ 1] 1803 	pop	a
      00A235 26 11            [ 1] 1804 	jrne	00102$
                                   1805 ;	lib/src/stm8s_tim1.c: 1740: TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
      00A237 A4 FE            [ 1] 1806 	and	a, #0xfe
      00A239 C7 52 5D         [ 1] 1807 	ld	0x525d, a
                                   1808 ;	lib/src/stm8s_tim1.c: 1743: TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) 
      00A23C C6 52 5A         [ 1] 1809 	ld	a, 0x525a
      00A23F A4 8F            [ 1] 1810 	and	a, #0x8f
                                   1811 ;	lib/src/stm8s_tim1.c: 1744: | (uint8_t)TIM1_OCMode);
      00A241 1A 03            [ 1] 1812 	or	a, (0x03, sp)
      00A243 C7 52 5A         [ 1] 1813 	ld	0x525a, a
      00A246 20 0F            [ 2] 1814 	jra	00110$
      00A248                       1815 00102$:
                                   1816 ;	lib/src/stm8s_tim1.c: 1749: TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
      00A248 A4 EF            [ 1] 1817 	and	a, #0xef
      00A24A C7 52 5D         [ 1] 1818 	ld	0x525d, a
                                   1819 ;	lib/src/stm8s_tim1.c: 1752: TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
      00A24D C6 52 5B         [ 1] 1820 	ld	a, 0x525b
      00A250 A4 8F            [ 1] 1821 	and	a, #0x8f
                                   1822 ;	lib/src/stm8s_tim1.c: 1753: | (uint8_t)TIM1_OCMode);
      00A252 1A 03            [ 1] 1823 	or	a, (0x03, sp)
      00A254 C7 52 5B         [ 1] 1824 	ld	0x525b, a
      00A257                       1825 00110$:
                                   1826 ;	lib/src/stm8s_tim1.c: 1755: }
      00A257 85               [ 2] 1827 	popw	x
      00A258 84               [ 1] 1828 	pop	a
      00A259 FC               [ 2] 1829 	jp	(x)
                                   1830 ;	lib/src/stm8s_tim1.c: 1763: void TIM1_SetCounter(uint16_t Counter)
                                   1831 ;	-----------------------------------------
                                   1832 ;	 function TIM1_SetCounter
                                   1833 ;	-----------------------------------------
      00A25A                       1834 _TIM1_SetCounter:
                                   1835 ;	lib/src/stm8s_tim1.c: 1766: TIM1->CNTRH = (uint8_t)(Counter >> 8);
      00A25A 9E               [ 1] 1836 	ld	a, xh
      00A25B C7 52 5E         [ 1] 1837 	ld	0x525e, a
                                   1838 ;	lib/src/stm8s_tim1.c: 1767: TIM1->CNTRL = (uint8_t)(Counter);
      00A25E 9F               [ 1] 1839 	ld	a, xl
      00A25F C7 52 5F         [ 1] 1840 	ld	0x525f, a
                                   1841 ;	lib/src/stm8s_tim1.c: 1768: }
      00A262 81               [ 4] 1842 	ret
                                   1843 ;	lib/src/stm8s_tim1.c: 1776: void TIM1_SetAutoreload(uint16_t Autoreload)
                                   1844 ;	-----------------------------------------
                                   1845 ;	 function TIM1_SetAutoreload
                                   1846 ;	-----------------------------------------
      00A263                       1847 _TIM1_SetAutoreload:
                                   1848 ;	lib/src/stm8s_tim1.c: 1779: TIM1->ARRH = (uint8_t)(Autoreload >> 8);
      00A263 9E               [ 1] 1849 	ld	a, xh
      00A264 C7 52 62         [ 1] 1850 	ld	0x5262, a
                                   1851 ;	lib/src/stm8s_tim1.c: 1780: TIM1->ARRL = (uint8_t)(Autoreload);
      00A267 9F               [ 1] 1852 	ld	a, xl
      00A268 C7 52 63         [ 1] 1853 	ld	0x5263, a
                                   1854 ;	lib/src/stm8s_tim1.c: 1781: }
      00A26B 81               [ 4] 1855 	ret
                                   1856 ;	lib/src/stm8s_tim1.c: 1789: void TIM1_SetCompare1(uint16_t Compare1)
                                   1857 ;	-----------------------------------------
                                   1858 ;	 function TIM1_SetCompare1
                                   1859 ;	-----------------------------------------
      00A26C                       1860 _TIM1_SetCompare1:
                                   1861 ;	lib/src/stm8s_tim1.c: 1792: TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
      00A26C 9E               [ 1] 1862 	ld	a, xh
      00A26D C7 52 65         [ 1] 1863 	ld	0x5265, a
                                   1864 ;	lib/src/stm8s_tim1.c: 1793: TIM1->CCR1L = (uint8_t)(Compare1);
      00A270 9F               [ 1] 1865 	ld	a, xl
      00A271 C7 52 66         [ 1] 1866 	ld	0x5266, a
                                   1867 ;	lib/src/stm8s_tim1.c: 1794: }
      00A274 81               [ 4] 1868 	ret
                                   1869 ;	lib/src/stm8s_tim1.c: 1802: void TIM1_SetCompare2(uint16_t Compare2)
                                   1870 ;	-----------------------------------------
                                   1871 ;	 function TIM1_SetCompare2
                                   1872 ;	-----------------------------------------
      00A275                       1873 _TIM1_SetCompare2:
                                   1874 ;	lib/src/stm8s_tim1.c: 1805: TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
      00A275 9E               [ 1] 1875 	ld	a, xh
      00A276 C7 52 67         [ 1] 1876 	ld	0x5267, a
                                   1877 ;	lib/src/stm8s_tim1.c: 1806: TIM1->CCR2L = (uint8_t)(Compare2);
      00A279 9F               [ 1] 1878 	ld	a, xl
      00A27A C7 52 68         [ 1] 1879 	ld	0x5268, a
                                   1880 ;	lib/src/stm8s_tim1.c: 1807: }
      00A27D 81               [ 4] 1881 	ret
                                   1882 ;	lib/src/stm8s_tim1.c: 1815: void TIM1_SetCompare3(uint16_t Compare3)
                                   1883 ;	-----------------------------------------
                                   1884 ;	 function TIM1_SetCompare3
                                   1885 ;	-----------------------------------------
      00A27E                       1886 _TIM1_SetCompare3:
                                   1887 ;	lib/src/stm8s_tim1.c: 1818: TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
      00A27E 9E               [ 1] 1888 	ld	a, xh
      00A27F C7 52 69         [ 1] 1889 	ld	0x5269, a
                                   1890 ;	lib/src/stm8s_tim1.c: 1819: TIM1->CCR3L = (uint8_t)(Compare3);
      00A282 9F               [ 1] 1891 	ld	a, xl
      00A283 C7 52 6A         [ 1] 1892 	ld	0x526a, a
                                   1893 ;	lib/src/stm8s_tim1.c: 1820: }
      00A286 81               [ 4] 1894 	ret
                                   1895 ;	lib/src/stm8s_tim1.c: 1828: void TIM1_SetCompare4(uint16_t Compare4)
                                   1896 ;	-----------------------------------------
                                   1897 ;	 function TIM1_SetCompare4
                                   1898 ;	-----------------------------------------
      00A287                       1899 _TIM1_SetCompare4:
                                   1900 ;	lib/src/stm8s_tim1.c: 1831: TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
      00A287 9E               [ 1] 1901 	ld	a, xh
      00A288 C7 52 6B         [ 1] 1902 	ld	0x526b, a
                                   1903 ;	lib/src/stm8s_tim1.c: 1832: TIM1->CCR4L = (uint8_t)(Compare4);
      00A28B 9F               [ 1] 1904 	ld	a, xl
      00A28C C7 52 6C         [ 1] 1905 	ld	0x526c, a
                                   1906 ;	lib/src/stm8s_tim1.c: 1833: }
      00A28F 81               [ 4] 1907 	ret
                                   1908 ;	lib/src/stm8s_tim1.c: 1845: void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
                                   1909 ;	-----------------------------------------
                                   1910 ;	 function TIM1_SetIC1Prescaler
                                   1911 ;	-----------------------------------------
      00A290                       1912 _TIM1_SetIC1Prescaler:
      00A290 88               [ 1] 1913 	push	a
      00A291 6B 01            [ 1] 1914 	ld	(0x01, sp), a
                                   1915 ;	lib/src/stm8s_tim1.c: 1851: TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) 
      00A293 C6 52 58         [ 1] 1916 	ld	a, 0x5258
      00A296 A4 F3            [ 1] 1917 	and	a, #0xf3
                                   1918 ;	lib/src/stm8s_tim1.c: 1852: | (uint8_t)TIM1_IC1Prescaler);
      00A298 1A 01            [ 1] 1919 	or	a, (0x01, sp)
      00A29A C7 52 58         [ 1] 1920 	ld	0x5258, a
                                   1921 ;	lib/src/stm8s_tim1.c: 1853: }
      00A29D 84               [ 1] 1922 	pop	a
      00A29E 81               [ 4] 1923 	ret
                                   1924 ;	lib/src/stm8s_tim1.c: 1865: void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
                                   1925 ;	-----------------------------------------
                                   1926 ;	 function TIM1_SetIC2Prescaler
                                   1927 ;	-----------------------------------------
      00A29F                       1928 _TIM1_SetIC2Prescaler:
      00A29F 88               [ 1] 1929 	push	a
      00A2A0 6B 01            [ 1] 1930 	ld	(0x01, sp), a
                                   1931 ;	lib/src/stm8s_tim1.c: 1872: TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC))
      00A2A2 C6 52 59         [ 1] 1932 	ld	a, 0x5259
      00A2A5 A4 F3            [ 1] 1933 	and	a, #0xf3
                                   1934 ;	lib/src/stm8s_tim1.c: 1873: | (uint8_t)TIM1_IC2Prescaler);
      00A2A7 1A 01            [ 1] 1935 	or	a, (0x01, sp)
      00A2A9 C7 52 59         [ 1] 1936 	ld	0x5259, a
                                   1937 ;	lib/src/stm8s_tim1.c: 1874: }
      00A2AC 84               [ 1] 1938 	pop	a
      00A2AD 81               [ 4] 1939 	ret
                                   1940 ;	lib/src/stm8s_tim1.c: 1886: void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
                                   1941 ;	-----------------------------------------
                                   1942 ;	 function TIM1_SetIC3Prescaler
                                   1943 ;	-----------------------------------------
      00A2AE                       1944 _TIM1_SetIC3Prescaler:
      00A2AE 88               [ 1] 1945 	push	a
      00A2AF 6B 01            [ 1] 1946 	ld	(0x01, sp), a
                                   1947 ;	lib/src/stm8s_tim1.c: 1893: TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | 
      00A2B1 C6 52 5A         [ 1] 1948 	ld	a, 0x525a
      00A2B4 A4 F3            [ 1] 1949 	and	a, #0xf3
                                   1950 ;	lib/src/stm8s_tim1.c: 1894: (uint8_t)TIM1_IC3Prescaler);
      00A2B6 1A 01            [ 1] 1951 	or	a, (0x01, sp)
      00A2B8 C7 52 5A         [ 1] 1952 	ld	0x525a, a
                                   1953 ;	lib/src/stm8s_tim1.c: 1895: }
      00A2BB 84               [ 1] 1954 	pop	a
      00A2BC 81               [ 4] 1955 	ret
                                   1956 ;	lib/src/stm8s_tim1.c: 1907: void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
                                   1957 ;	-----------------------------------------
                                   1958 ;	 function TIM1_SetIC4Prescaler
                                   1959 ;	-----------------------------------------
      00A2BD                       1960 _TIM1_SetIC4Prescaler:
      00A2BD 88               [ 1] 1961 	push	a
      00A2BE 6B 01            [ 1] 1962 	ld	(0x01, sp), a
                                   1963 ;	lib/src/stm8s_tim1.c: 1914: TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) |
      00A2C0 C6 52 5B         [ 1] 1964 	ld	a, 0x525b
      00A2C3 A4 F3            [ 1] 1965 	and	a, #0xf3
                                   1966 ;	lib/src/stm8s_tim1.c: 1915: (uint8_t)TIM1_IC4Prescaler);
      00A2C5 1A 01            [ 1] 1967 	or	a, (0x01, sp)
      00A2C7 C7 52 5B         [ 1] 1968 	ld	0x525b, a
                                   1969 ;	lib/src/stm8s_tim1.c: 1916: }
      00A2CA 84               [ 1] 1970 	pop	a
      00A2CB 81               [ 4] 1971 	ret
                                   1972 ;	lib/src/stm8s_tim1.c: 1923: uint16_t TIM1_GetCapture1(void)
                                   1973 ;	-----------------------------------------
                                   1974 ;	 function TIM1_GetCapture1
                                   1975 ;	-----------------------------------------
      00A2CC                       1976 _TIM1_GetCapture1:
      00A2CC 52 02            [ 2] 1977 	sub	sp, #2
                                   1978 ;	lib/src/stm8s_tim1.c: 1930: tmpccr1h = TIM1->CCR1H;
      00A2CE C6 52 65         [ 1] 1979 	ld	a, 0x5265
      00A2D1 95               [ 1] 1980 	ld	xh, a
                                   1981 ;	lib/src/stm8s_tim1.c: 1931: tmpccr1l = TIM1->CCR1L;
      00A2D2 C6 52 66         [ 1] 1982 	ld	a, 0x5266
                                   1983 ;	lib/src/stm8s_tim1.c: 1933: tmpccr1 = (uint16_t)(tmpccr1l);
      00A2D5 6B 02            [ 1] 1984 	ld	(0x02, sp), a
      00A2D7 0F 01            [ 1] 1985 	clr	(0x01, sp)
                                   1986 ;	lib/src/stm8s_tim1.c: 1934: tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
      00A2D9 7B 02            [ 1] 1987 	ld	a, (0x02, sp)
      00A2DB 02               [ 1] 1988 	rlwa	x
      00A2DC 1A 01            [ 1] 1989 	or	a, (0x01, sp)
                                   1990 ;	lib/src/stm8s_tim1.c: 1936: return (uint16_t)tmpccr1;
      00A2DE 95               [ 1] 1991 	ld	xh, a
                                   1992 ;	lib/src/stm8s_tim1.c: 1937: }
      00A2DF 5B 02            [ 2] 1993 	addw	sp, #2
      00A2E1 81               [ 4] 1994 	ret
                                   1995 ;	lib/src/stm8s_tim1.c: 1944: uint16_t TIM1_GetCapture2(void)
                                   1996 ;	-----------------------------------------
                                   1997 ;	 function TIM1_GetCapture2
                                   1998 ;	-----------------------------------------
      00A2E2                       1999 _TIM1_GetCapture2:
      00A2E2 52 02            [ 2] 2000 	sub	sp, #2
                                   2001 ;	lib/src/stm8s_tim1.c: 1951: tmpccr2h = TIM1->CCR2H;
      00A2E4 C6 52 67         [ 1] 2002 	ld	a, 0x5267
      00A2E7 95               [ 1] 2003 	ld	xh, a
                                   2004 ;	lib/src/stm8s_tim1.c: 1952: tmpccr2l = TIM1->CCR2L;
      00A2E8 C6 52 68         [ 1] 2005 	ld	a, 0x5268
                                   2006 ;	lib/src/stm8s_tim1.c: 1954: tmpccr2 = (uint16_t)(tmpccr2l);
      00A2EB 6B 02            [ 1] 2007 	ld	(0x02, sp), a
      00A2ED 0F 01            [ 1] 2008 	clr	(0x01, sp)
                                   2009 ;	lib/src/stm8s_tim1.c: 1955: tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
      00A2EF 7B 02            [ 1] 2010 	ld	a, (0x02, sp)
      00A2F1 02               [ 1] 2011 	rlwa	x
      00A2F2 1A 01            [ 1] 2012 	or	a, (0x01, sp)
                                   2013 ;	lib/src/stm8s_tim1.c: 1957: return (uint16_t)tmpccr2;
      00A2F4 95               [ 1] 2014 	ld	xh, a
                                   2015 ;	lib/src/stm8s_tim1.c: 1958: }
      00A2F5 5B 02            [ 2] 2016 	addw	sp, #2
      00A2F7 81               [ 4] 2017 	ret
                                   2018 ;	lib/src/stm8s_tim1.c: 1965: uint16_t TIM1_GetCapture3(void)
                                   2019 ;	-----------------------------------------
                                   2020 ;	 function TIM1_GetCapture3
                                   2021 ;	-----------------------------------------
      00A2F8                       2022 _TIM1_GetCapture3:
      00A2F8 52 02            [ 2] 2023 	sub	sp, #2
                                   2024 ;	lib/src/stm8s_tim1.c: 1971: tmpccr3h = TIM1->CCR3H;
      00A2FA C6 52 69         [ 1] 2025 	ld	a, 0x5269
      00A2FD 95               [ 1] 2026 	ld	xh, a
                                   2027 ;	lib/src/stm8s_tim1.c: 1972: tmpccr3l = TIM1->CCR3L;
      00A2FE C6 52 6A         [ 1] 2028 	ld	a, 0x526a
                                   2029 ;	lib/src/stm8s_tim1.c: 1974: tmpccr3 = (uint16_t)(tmpccr3l);
      00A301 6B 02            [ 1] 2030 	ld	(0x02, sp), a
      00A303 0F 01            [ 1] 2031 	clr	(0x01, sp)
                                   2032 ;	lib/src/stm8s_tim1.c: 1975: tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
      00A305 7B 02            [ 1] 2033 	ld	a, (0x02, sp)
      00A307 02               [ 1] 2034 	rlwa	x
      00A308 1A 01            [ 1] 2035 	or	a, (0x01, sp)
                                   2036 ;	lib/src/stm8s_tim1.c: 1977: return (uint16_t)tmpccr3;
      00A30A 95               [ 1] 2037 	ld	xh, a
                                   2038 ;	lib/src/stm8s_tim1.c: 1978: }
      00A30B 5B 02            [ 2] 2039 	addw	sp, #2
      00A30D 81               [ 4] 2040 	ret
                                   2041 ;	lib/src/stm8s_tim1.c: 1985: uint16_t TIM1_GetCapture4(void)
                                   2042 ;	-----------------------------------------
                                   2043 ;	 function TIM1_GetCapture4
                                   2044 ;	-----------------------------------------
      00A30E                       2045 _TIM1_GetCapture4:
      00A30E 52 02            [ 2] 2046 	sub	sp, #2
                                   2047 ;	lib/src/stm8s_tim1.c: 1991: tmpccr4h = TIM1->CCR4H;
      00A310 C6 52 6B         [ 1] 2048 	ld	a, 0x526b
      00A313 95               [ 1] 2049 	ld	xh, a
                                   2050 ;	lib/src/stm8s_tim1.c: 1992: tmpccr4l = TIM1->CCR4L;
      00A314 C6 52 6C         [ 1] 2051 	ld	a, 0x526c
                                   2052 ;	lib/src/stm8s_tim1.c: 1994: tmpccr4 = (uint16_t)(tmpccr4l);
      00A317 6B 02            [ 1] 2053 	ld	(0x02, sp), a
      00A319 0F 01            [ 1] 2054 	clr	(0x01, sp)
                                   2055 ;	lib/src/stm8s_tim1.c: 1995: tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
      00A31B 7B 02            [ 1] 2056 	ld	a, (0x02, sp)
      00A31D 02               [ 1] 2057 	rlwa	x
      00A31E 1A 01            [ 1] 2058 	or	a, (0x01, sp)
                                   2059 ;	lib/src/stm8s_tim1.c: 1997: return (uint16_t)tmpccr4;
      00A320 95               [ 1] 2060 	ld	xh, a
                                   2061 ;	lib/src/stm8s_tim1.c: 1998: }
      00A321 5B 02            [ 2] 2062 	addw	sp, #2
      00A323 81               [ 4] 2063 	ret
                                   2064 ;	lib/src/stm8s_tim1.c: 2005: uint16_t TIM1_GetCounter(void)
                                   2065 ;	-----------------------------------------
                                   2066 ;	 function TIM1_GetCounter
                                   2067 ;	-----------------------------------------
      00A324                       2068 _TIM1_GetCounter:
      00A324 52 04            [ 2] 2069 	sub	sp, #4
                                   2070 ;	lib/src/stm8s_tim1.c: 2009: tmpcntr = ((uint16_t)TIM1->CNTRH << 8);
      00A326 C6 52 5E         [ 1] 2071 	ld	a, 0x525e
      00A329 95               [ 1] 2072 	ld	xh, a
      00A32A 0F 02            [ 1] 2073 	clr	(0x02, sp)
                                   2074 ;	lib/src/stm8s_tim1.c: 2012: return (uint16_t)(tmpcntr | (uint16_t)(TIM1->CNTRL));
      00A32C C6 52 5F         [ 1] 2075 	ld	a, 0x525f
      00A32F 0F 03            [ 1] 2076 	clr	(0x03, sp)
      00A331 1A 02            [ 1] 2077 	or	a, (0x02, sp)
      00A333 02               [ 1] 2078 	rlwa	x
      00A334 1A 03            [ 1] 2079 	or	a, (0x03, sp)
      00A336 95               [ 1] 2080 	ld	xh, a
                                   2081 ;	lib/src/stm8s_tim1.c: 2013: }
      00A337 5B 04            [ 2] 2082 	addw	sp, #4
      00A339 81               [ 4] 2083 	ret
                                   2084 ;	lib/src/stm8s_tim1.c: 2020: uint16_t TIM1_GetPrescaler(void)
                                   2085 ;	-----------------------------------------
                                   2086 ;	 function TIM1_GetPrescaler
                                   2087 ;	-----------------------------------------
      00A33A                       2088 _TIM1_GetPrescaler:
      00A33A 52 04            [ 2] 2089 	sub	sp, #4
                                   2090 ;	lib/src/stm8s_tim1.c: 2024: temp = ((uint16_t)TIM1->PSCRH << 8);
      00A33C C6 52 60         [ 1] 2091 	ld	a, 0x5260
      00A33F 95               [ 1] 2092 	ld	xh, a
      00A340 0F 02            [ 1] 2093 	clr	(0x02, sp)
                                   2094 ;	lib/src/stm8s_tim1.c: 2027: return (uint16_t)( temp | (uint16_t)(TIM1->PSCRL));
      00A342 C6 52 61         [ 1] 2095 	ld	a, 0x5261
      00A345 0F 03            [ 1] 2096 	clr	(0x03, sp)
      00A347 1A 02            [ 1] 2097 	or	a, (0x02, sp)
      00A349 02               [ 1] 2098 	rlwa	x
      00A34A 1A 03            [ 1] 2099 	or	a, (0x03, sp)
      00A34C 95               [ 1] 2100 	ld	xh, a
                                   2101 ;	lib/src/stm8s_tim1.c: 2028: }
      00A34D 5B 04            [ 2] 2102 	addw	sp, #4
      00A34F 81               [ 4] 2103 	ret
                                   2104 ;	lib/src/stm8s_tim1.c: 2048: FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
                                   2105 ;	-----------------------------------------
                                   2106 ;	 function TIM1_GetFlagStatus
                                   2107 ;	-----------------------------------------
      00A350                       2108 _TIM1_GetFlagStatus:
      00A350 88               [ 1] 2109 	push	a
                                   2110 ;	lib/src/stm8s_tim1.c: 2056: tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
      00A351 C6 52 55         [ 1] 2111 	ld	a, 0x5255
      00A354 6B 01            [ 1] 2112 	ld	(0x01, sp), a
      00A356 9F               [ 1] 2113 	ld	a, xl
      00A357 14 01            [ 1] 2114 	and	a, (0x01, sp)
      00A359 6B 01            [ 1] 2115 	ld	(0x01, sp), a
                                   2116 ;	lib/src/stm8s_tim1.c: 2057: tim1_flag_h = (uint8_t)((uint16_t)TIM1_FLAG >> 8);
                                   2117 ;	lib/src/stm8s_tim1.c: 2059: if ((tim1_flag_l | (uint8_t)(TIM1->SR2 & tim1_flag_h)) != 0)
      00A35B C6 52 56         [ 1] 2118 	ld	a, 0x5256
      00A35E 89               [ 2] 2119 	pushw	x
      00A35F 14 01            [ 1] 2120 	and	a, (1, sp)
      00A361 85               [ 2] 2121 	popw	x
      00A362 1A 01            [ 1] 2122 	or	a, (0x01, sp)
      00A364 27 03            [ 1] 2123 	jreq	00102$
                                   2124 ;	lib/src/stm8s_tim1.c: 2061: bitstatus = SET;
      00A366 A6 01            [ 1] 2125 	ld	a, #0x01
                                   2126 ;	lib/src/stm8s_tim1.c: 2065: bitstatus = RESET;
      00A368 21                    2127 	.byte 0x21
      00A369                       2128 00102$:
      00A369 4F               [ 1] 2129 	clr	a
      00A36A                       2130 00103$:
                                   2131 ;	lib/src/stm8s_tim1.c: 2067: return (FlagStatus)(bitstatus);
                                   2132 ;	lib/src/stm8s_tim1.c: 2068: }
      00A36A 5B 01            [ 2] 2133 	addw	sp, #1
      00A36C 81               [ 4] 2134 	ret
                                   2135 ;	lib/src/stm8s_tim1.c: 2088: void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
                                   2136 ;	-----------------------------------------
                                   2137 ;	 function TIM1_ClearFlag
                                   2138 ;	-----------------------------------------
      00A36D                       2139 _TIM1_ClearFlag:
                                   2140 ;	lib/src/stm8s_tim1.c: 2094: TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
      00A36D 9F               [ 1] 2141 	ld	a, xl
      00A36E 43               [ 1] 2142 	cpl	a
      00A36F C7 52 55         [ 1] 2143 	ld	0x5255, a
                                   2144 ;	lib/src/stm8s_tim1.c: 2095: TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
      00A372 9E               [ 1] 2145 	ld	a, xh
      00A373 43               [ 1] 2146 	cpl	a
      00A374 A4 1E            [ 1] 2147 	and	a, #0x1e
      00A376 C7 52 56         [ 1] 2148 	ld	0x5256, a
                                   2149 ;	lib/src/stm8s_tim1.c: 2097: }
      00A379 81               [ 4] 2150 	ret
                                   2151 ;	lib/src/stm8s_tim1.c: 2113: ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
                                   2152 ;	-----------------------------------------
                                   2153 ;	 function TIM1_GetITStatus
                                   2154 ;	-----------------------------------------
      00A37A                       2155 _TIM1_GetITStatus:
      00A37A 52 02            [ 2] 2156 	sub	sp, #2
      00A37C 6B 02            [ 1] 2157 	ld	(0x02, sp), a
                                   2158 ;	lib/src/stm8s_tim1.c: 2121: TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
      00A37E C6 52 55         [ 1] 2159 	ld	a, 0x5255
      00A381 14 02            [ 1] 2160 	and	a, (0x02, sp)
      00A383 6B 01            [ 1] 2161 	ld	(0x01, sp), a
                                   2162 ;	lib/src/stm8s_tim1.c: 2123: TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
      00A385 C6 52 54         [ 1] 2163 	ld	a, 0x5254
      00A388 14 02            [ 1] 2164 	and	a, (0x02, sp)
                                   2165 ;	lib/src/stm8s_tim1.c: 2125: if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
      00A38A 0D 01            [ 1] 2166 	tnz	(0x01, sp)
      00A38C 27 06            [ 1] 2167 	jreq	00102$
      00A38E 4D               [ 1] 2168 	tnz	a
      00A38F 27 03            [ 1] 2169 	jreq	00102$
                                   2170 ;	lib/src/stm8s_tim1.c: 2127: bitstatus = SET;
      00A391 A6 01            [ 1] 2171 	ld	a, #0x01
                                   2172 ;	lib/src/stm8s_tim1.c: 2131: bitstatus = RESET;
      00A393 21                    2173 	.byte 0x21
      00A394                       2174 00102$:
      00A394 4F               [ 1] 2175 	clr	a
      00A395                       2176 00103$:
                                   2177 ;	lib/src/stm8s_tim1.c: 2133: return (ITStatus)(bitstatus);
                                   2178 ;	lib/src/stm8s_tim1.c: 2134: }
      00A395 5B 02            [ 2] 2179 	addw	sp, #2
      00A397 81               [ 4] 2180 	ret
                                   2181 ;	lib/src/stm8s_tim1.c: 2150: void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
                                   2182 ;	-----------------------------------------
                                   2183 ;	 function TIM1_ClearITPendingBit
                                   2184 ;	-----------------------------------------
      00A398                       2185 _TIM1_ClearITPendingBit:
                                   2186 ;	lib/src/stm8s_tim1.c: 2156: TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
      00A398 43               [ 1] 2187 	cpl	a
      00A399 C7 52 55         [ 1] 2188 	ld	0x5255, a
                                   2189 ;	lib/src/stm8s_tim1.c: 2157: }
      00A39C 81               [ 4] 2190 	ret
                                   2191 ;	lib/src/stm8s_tim1.c: 2175: static void TI1_Config(uint8_t TIM1_ICPolarity,
                                   2192 ;	-----------------------------------------
                                   2193 ;	 function TI1_Config
                                   2194 ;	-----------------------------------------
      00A39D                       2195 _TI1_Config:
      00A39D 52 02            [ 2] 2196 	sub	sp, #2
      00A39F 6B 02            [ 1] 2197 	ld	(0x02, sp), a
                                   2198 ;	lib/src/stm8s_tim1.c: 2180: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
      00A3A1 72 11 52 5C      [ 1] 2199 	bres	0x525c, #0
                                   2200 ;	lib/src/stm8s_tim1.c: 2183: TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) | 
      00A3A5 C6 52 58         [ 1] 2201 	ld	a, 0x5258
      00A3A8 A4 0C            [ 1] 2202 	and	a, #0x0c
      00A3AA 6B 01            [ 1] 2203 	ld	(0x01, sp), a
                                   2204 ;	lib/src/stm8s_tim1.c: 2184: (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
      00A3AC 7B 06            [ 1] 2205 	ld	a, (0x06, sp)
      00A3AE 4E               [ 1] 2206 	swap	a
      00A3AF A4 F0            [ 1] 2207 	and	a, #0xf0
      00A3B1 1A 05            [ 1] 2208 	or	a, (0x05, sp)
      00A3B3 1A 01            [ 1] 2209 	or	a, (0x01, sp)
      00A3B5 C7 52 58         [ 1] 2210 	ld	0x5258, a
                                   2211 ;	lib/src/stm8s_tim1.c: 2180: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
      00A3B8 C6 52 5C         [ 1] 2212 	ld	a, 0x525c
                                   2213 ;	lib/src/stm8s_tim1.c: 2187: if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
      00A3BB 0D 02            [ 1] 2214 	tnz	(0x02, sp)
      00A3BD 27 07            [ 1] 2215 	jreq	00102$
                                   2216 ;	lib/src/stm8s_tim1.c: 2189: TIM1->CCER1 |= TIM1_CCER1_CC1P;
      00A3BF AA 02            [ 1] 2217 	or	a, #0x02
      00A3C1 C7 52 5C         [ 1] 2218 	ld	0x525c, a
      00A3C4 20 05            [ 2] 2219 	jra	00103$
      00A3C6                       2220 00102$:
                                   2221 ;	lib/src/stm8s_tim1.c: 2193: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
      00A3C6 A4 FD            [ 1] 2222 	and	a, #0xfd
      00A3C8 C7 52 5C         [ 1] 2223 	ld	0x525c, a
      00A3CB                       2224 00103$:
                                   2225 ;	lib/src/stm8s_tim1.c: 2197: TIM1->CCER1 |=  TIM1_CCER1_CC1E;
      00A3CB C6 52 5C         [ 1] 2226 	ld	a, 0x525c
      00A3CE AA 01            [ 1] 2227 	or	a, #0x01
      00A3D0 C7 52 5C         [ 1] 2228 	ld	0x525c, a
                                   2229 ;	lib/src/stm8s_tim1.c: 2198: }
      00A3D3 1E 03            [ 2] 2230 	ldw	x, (3, sp)
      00A3D5 5B 06            [ 2] 2231 	addw	sp, #6
      00A3D7 FC               [ 2] 2232 	jp	(x)
                                   2233 ;	lib/src/stm8s_tim1.c: 2216: static void TI2_Config(uint8_t TIM1_ICPolarity,
                                   2234 ;	-----------------------------------------
                                   2235 ;	 function TI2_Config
                                   2236 ;	-----------------------------------------
      00A3D8                       2237 _TI2_Config:
      00A3D8 52 02            [ 2] 2238 	sub	sp, #2
      00A3DA 6B 02            [ 1] 2239 	ld	(0x02, sp), a
                                   2240 ;	lib/src/stm8s_tim1.c: 2221: TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
      00A3DC 72 19 52 5C      [ 1] 2241 	bres	0x525c, #4
                                   2242 ;	lib/src/stm8s_tim1.c: 2224: TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) 
      00A3E0 C6 52 59         [ 1] 2243 	ld	a, 0x5259
      00A3E3 A4 0C            [ 1] 2244 	and	a, #0x0c
      00A3E5 6B 01            [ 1] 2245 	ld	(0x01, sp), a
                                   2246 ;	lib/src/stm8s_tim1.c: 2225: | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
      00A3E7 7B 06            [ 1] 2247 	ld	a, (0x06, sp)
      00A3E9 4E               [ 1] 2248 	swap	a
      00A3EA A4 F0            [ 1] 2249 	and	a, #0xf0
      00A3EC 1A 05            [ 1] 2250 	or	a, (0x05, sp)
      00A3EE 1A 01            [ 1] 2251 	or	a, (0x01, sp)
      00A3F0 C7 52 59         [ 1] 2252 	ld	0x5259, a
                                   2253 ;	lib/src/stm8s_tim1.c: 2221: TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
      00A3F3 C6 52 5C         [ 1] 2254 	ld	a, 0x525c
                                   2255 ;	lib/src/stm8s_tim1.c: 2227: if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
      00A3F6 0D 02            [ 1] 2256 	tnz	(0x02, sp)
      00A3F8 27 07            [ 1] 2257 	jreq	00102$
                                   2258 ;	lib/src/stm8s_tim1.c: 2229: TIM1->CCER1 |= TIM1_CCER1_CC2P;
      00A3FA AA 20            [ 1] 2259 	or	a, #0x20
      00A3FC C7 52 5C         [ 1] 2260 	ld	0x525c, a
      00A3FF 20 05            [ 2] 2261 	jra	00103$
      00A401                       2262 00102$:
                                   2263 ;	lib/src/stm8s_tim1.c: 2233: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
      00A401 A4 DF            [ 1] 2264 	and	a, #0xdf
      00A403 C7 52 5C         [ 1] 2265 	ld	0x525c, a
      00A406                       2266 00103$:
                                   2267 ;	lib/src/stm8s_tim1.c: 2236: TIM1->CCER1 |=  TIM1_CCER1_CC2E;
      00A406 C6 52 5C         [ 1] 2268 	ld	a, 0x525c
      00A409 AA 10            [ 1] 2269 	or	a, #0x10
      00A40B C7 52 5C         [ 1] 2270 	ld	0x525c, a
                                   2271 ;	lib/src/stm8s_tim1.c: 2237: }
      00A40E 1E 03            [ 2] 2272 	ldw	x, (3, sp)
      00A410 5B 06            [ 2] 2273 	addw	sp, #6
      00A412 FC               [ 2] 2274 	jp	(x)
                                   2275 ;	lib/src/stm8s_tim1.c: 2255: static void TI3_Config(uint8_t TIM1_ICPolarity,
                                   2276 ;	-----------------------------------------
                                   2277 ;	 function TI3_Config
                                   2278 ;	-----------------------------------------
      00A413                       2279 _TI3_Config:
      00A413 52 02            [ 2] 2280 	sub	sp, #2
      00A415 6B 02            [ 1] 2281 	ld	(0x02, sp), a
                                   2282 ;	lib/src/stm8s_tim1.c: 2260: TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
      00A417 C6 52 5D         [ 1] 2283 	ld	a, 0x525d
      00A41A A4 FE            [ 1] 2284 	and	a, #0xfe
      00A41C C7 52 5D         [ 1] 2285 	ld	0x525d, a
                                   2286 ;	lib/src/stm8s_tim1.c: 2263: TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF))) 
      00A41F C6 52 5A         [ 1] 2287 	ld	a, 0x525a
      00A422 A4 0C            [ 1] 2288 	and	a, #0x0c
      00A424 6B 01            [ 1] 2289 	ld	(0x01, sp), a
                                   2290 ;	lib/src/stm8s_tim1.c: 2264: | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
      00A426 7B 06            [ 1] 2291 	ld	a, (0x06, sp)
      00A428 4E               [ 1] 2292 	swap	a
      00A429 A4 F0            [ 1] 2293 	and	a, #0xf0
      00A42B 1A 05            [ 1] 2294 	or	a, (0x05, sp)
      00A42D 1A 01            [ 1] 2295 	or	a, (0x01, sp)
      00A42F C7 52 5A         [ 1] 2296 	ld	0x525a, a
                                   2297 ;	lib/src/stm8s_tim1.c: 2260: TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
      00A432 C6 52 5D         [ 1] 2298 	ld	a, 0x525d
                                   2299 ;	lib/src/stm8s_tim1.c: 2267: if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
      00A435 0D 02            [ 1] 2300 	tnz	(0x02, sp)
      00A437 27 07            [ 1] 2301 	jreq	00102$
                                   2302 ;	lib/src/stm8s_tim1.c: 2269: TIM1->CCER2 |= TIM1_CCER2_CC3P;
      00A439 AA 02            [ 1] 2303 	or	a, #0x02
      00A43B C7 52 5D         [ 1] 2304 	ld	0x525d, a
      00A43E 20 05            [ 2] 2305 	jra	00103$
      00A440                       2306 00102$:
                                   2307 ;	lib/src/stm8s_tim1.c: 2273: TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
      00A440 A4 FD            [ 1] 2308 	and	a, #0xfd
      00A442 C7 52 5D         [ 1] 2309 	ld	0x525d, a
      00A445                       2310 00103$:
                                   2311 ;	lib/src/stm8s_tim1.c: 2276: TIM1->CCER2 |=  TIM1_CCER2_CC3E;
      00A445 C6 52 5D         [ 1] 2312 	ld	a, 0x525d
      00A448 AA 01            [ 1] 2313 	or	a, #0x01
      00A44A C7 52 5D         [ 1] 2314 	ld	0x525d, a
                                   2315 ;	lib/src/stm8s_tim1.c: 2277: }
      00A44D 1E 03            [ 2] 2316 	ldw	x, (3, sp)
      00A44F 5B 06            [ 2] 2317 	addw	sp, #6
      00A451 FC               [ 2] 2318 	jp	(x)
                                   2319 ;	lib/src/stm8s_tim1.c: 2295: static void TI4_Config(uint8_t TIM1_ICPolarity,
                                   2320 ;	-----------------------------------------
                                   2321 ;	 function TI4_Config
                                   2322 ;	-----------------------------------------
      00A452                       2323 _TI4_Config:
      00A452 52 02            [ 2] 2324 	sub	sp, #2
      00A454 6B 02            [ 1] 2325 	ld	(0x02, sp), a
                                   2326 ;	lib/src/stm8s_tim1.c: 2300: TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
      00A456 72 19 52 5D      [ 1] 2327 	bres	0x525d, #4
                                   2328 ;	lib/src/stm8s_tim1.c: 2303: TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF )))
      00A45A C6 52 5B         [ 1] 2329 	ld	a, 0x525b
      00A45D A4 0C            [ 1] 2330 	and	a, #0x0c
      00A45F 6B 01            [ 1] 2331 	ld	(0x01, sp), a
                                   2332 ;	lib/src/stm8s_tim1.c: 2304: | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
      00A461 7B 06            [ 1] 2333 	ld	a, (0x06, sp)
      00A463 4E               [ 1] 2334 	swap	a
      00A464 A4 F0            [ 1] 2335 	and	a, #0xf0
      00A466 1A 05            [ 1] 2336 	or	a, (0x05, sp)
      00A468 1A 01            [ 1] 2337 	or	a, (0x01, sp)
      00A46A C7 52 5B         [ 1] 2338 	ld	0x525b, a
                                   2339 ;	lib/src/stm8s_tim1.c: 2300: TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
      00A46D C6 52 5D         [ 1] 2340 	ld	a, 0x525d
                                   2341 ;	lib/src/stm8s_tim1.c: 2307: if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
      00A470 0D 02            [ 1] 2342 	tnz	(0x02, sp)
      00A472 27 07            [ 1] 2343 	jreq	00102$
                                   2344 ;	lib/src/stm8s_tim1.c: 2309: TIM1->CCER2 |= TIM1_CCER2_CC4P;
      00A474 AA 20            [ 1] 2345 	or	a, #0x20
      00A476 C7 52 5D         [ 1] 2346 	ld	0x525d, a
      00A479 20 05            [ 2] 2347 	jra	00103$
      00A47B                       2348 00102$:
                                   2349 ;	lib/src/stm8s_tim1.c: 2313: TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
      00A47B A4 DF            [ 1] 2350 	and	a, #0xdf
      00A47D C7 52 5D         [ 1] 2351 	ld	0x525d, a
      00A480                       2352 00103$:
                                   2353 ;	lib/src/stm8s_tim1.c: 2317: TIM1->CCER2 |=  TIM1_CCER2_CC4E;
      00A480 C6 52 5D         [ 1] 2354 	ld	a, 0x525d
      00A483 AA 10            [ 1] 2355 	or	a, #0x10
      00A485 C7 52 5D         [ 1] 2356 	ld	0x525d, a
                                   2357 ;	lib/src/stm8s_tim1.c: 2318: }
      00A488 1E 03            [ 2] 2358 	ldw	x, (3, sp)
      00A48A 5B 06            [ 2] 2359 	addw	sp, #6
      00A48C FC               [ 2] 2360 	jp	(x)
                                   2361 	.area CODE
                                   2362 	.area CONST
                                   2363 	.area INITIALIZER
                                   2364 	.area CABS (ABS)
