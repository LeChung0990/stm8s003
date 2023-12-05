                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.3.0 #14184 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module main
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _main
                                     12 	.globl _read_adc
                                     13 	.globl _config
                                     14 	.globl _TIM4_ClearFlag
                                     15 	.globl _TIM4_GetFlagStatus
                                     16 	.globl _TIM4_SetCounter
                                     17 	.globl _TIM4_Cmd
                                     18 	.globl _TIM4_TimeBaseInit
                                     19 	.globl _GPIO_WriteLow
                                     20 	.globl _GPIO_WriteHigh
                                     21 	.globl _GPIO_Init
                                     22 	.globl _CLK_HSIPrescalerConfig
                                     23 	.globl _ADC1_ClearFlag
                                     24 	.globl _ADC1_GetFlagStatus
                                     25 	.globl _ADC1_GetConversionValue
                                     26 	.globl _ADC1_StartConversion
                                     27 	.globl _ADC1_Cmd
                                     28 	.globl _ADC1_Init
                                     29 	.globl _ADC1_DeInit
                                     30 	.globl _adc_value
                                     31 	.globl _delay_ms
                                     32 ;--------------------------------------------------------
                                     33 ; ram data
                                     34 ;--------------------------------------------------------
                                     35 	.area DATA
                                     36 ;--------------------------------------------------------
                                     37 ; ram data
                                     38 ;--------------------------------------------------------
                                     39 	.area INITIALIZED
      000001                         40 _adc_value::
      000001                         41 	.ds 2
                                     42 ;--------------------------------------------------------
                                     43 ; Stack segment in internal ram
                                     44 ;--------------------------------------------------------
                                     45 	.area SSEG
      000003                         46 __start__stack:
      000003                         47 	.ds	1
                                     48 
                                     49 ;--------------------------------------------------------
                                     50 ; absolute external ram data
                                     51 ;--------------------------------------------------------
                                     52 	.area DABS (ABS)
                                     53 
                                     54 ; default segment ordering for linker
                                     55 	.area HOME
                                     56 	.area GSINIT
                                     57 	.area GSFINAL
                                     58 	.area CONST
                                     59 	.area INITIALIZER
                                     60 	.area CODE
                                     61 
                                     62 ;--------------------------------------------------------
                                     63 ; interrupt vector
                                     64 ;--------------------------------------------------------
                                     65 	.area HOME
      008000                         66 __interrupt_vect:
      008000 82 00 80 07             67 	int s_GSINIT ; reset
                                     68 ;--------------------------------------------------------
                                     69 ; global & static initialisations
                                     70 ;--------------------------------------------------------
                                     71 	.area HOME
                                     72 	.area GSINIT
                                     73 	.area GSFINAL
                                     74 	.area GSINIT
      008007 CD 8A E7         [ 4]   75 	call	___sdcc_external_startup
      00800A 4D               [ 1]   76 	tnz	a
      00800B 27 03            [ 1]   77 	jreq	__sdcc_init_data
      00800D CC 80 04         [ 2]   78 	jp	__sdcc_program_startup
      008010                         79 __sdcc_init_data:
                                     80 ; stm8_genXINIT() start
      008010 AE 00 00         [ 2]   81 	ldw x, #l_DATA
      008013 27 07            [ 1]   82 	jreq	00002$
      008015                         83 00001$:
      008015 72 4F 00 00      [ 1]   84 	clr (s_DATA - 1, x)
      008019 5A               [ 2]   85 	decw x
      00801A 26 F9            [ 1]   86 	jrne	00001$
      00801C                         87 00002$:
      00801C AE 00 02         [ 2]   88 	ldw	x, #l_INITIALIZER
      00801F 27 09            [ 1]   89 	jreq	00004$
      008021                         90 00003$:
      008021 D6 80 38         [ 1]   91 	ld	a, (s_INITIALIZER - 1, x)
      008024 D7 00 00         [ 1]   92 	ld	(s_INITIALIZED - 1, x), a
      008027 5A               [ 2]   93 	decw	x
      008028 26 F7            [ 1]   94 	jrne	00003$
      00802A                         95 00004$:
                                     96 ; stm8_genXINIT() end
                                     97 	.area GSFINAL
      00802A CC 80 04         [ 2]   98 	jp	__sdcc_program_startup
                                     99 ;--------------------------------------------------------
                                    100 ; Home
                                    101 ;--------------------------------------------------------
                                    102 	.area HOME
                                    103 	.area HOME
      008004                        104 __sdcc_program_startup:
      008004 CC 80 61         [ 2]  105 	jp	_main
                                    106 ;	return from main will return to caller
                                    107 ;--------------------------------------------------------
                                    108 ; code
                                    109 ;--------------------------------------------------------
                                    110 	.area CODE
                                    111 ;	main.c: 5: void config(void)
                                    112 ;	-----------------------------------------
                                    113 ;	 function config
                                    114 ;	-----------------------------------------
      00803B                        115 _config:
                                    116 ;	main.c: 7: ADC1->CR1 |= (uint8_t)(ADC1_CSR_CH);
      00803B C6 54 01         [ 1]  117 	ld	a, 0x5401
      00803E AA 0F            [ 1]  118 	or	a, #0x0f
      008040 C7 54 01         [ 1]  119 	ld	0x5401, a
                                    120 ;	main.c: 8: ADC1->CR2 |= (uint8_t)(ADC1_CR2_ALIGN);
      008043 72 16 54 02      [ 1]  121 	bset	0x5402, #3
                                    122 ;	main.c: 9: ADC1->CR1 |= (uint8_t)(ADC1_CR1_ADON);
      008047 72 10 54 01      [ 1]  123 	bset	0x5401, #0
                                    124 ;	main.c: 10: }
      00804B 81               [ 4]  125 	ret
                                    126 ;	main.c: 11: uint16_t read_adc(void)
                                    127 ;	-----------------------------------------
                                    128 ;	 function read_adc
                                    129 ;	-----------------------------------------
      00804C                        130 _read_adc:
                                    131 ;	main.c: 14: ADC1->CR1 |= (uint8_t)(ADC1_CR1_ADON);
      00804C 72 10 54 01      [ 1]  132 	bset	0x5401, #0
                                    133 ;	main.c: 15: while(ADC1_GetFlagStatus(ADC1_FLAG_EOC)==0){}
      008050                        134 00101$:
      008050 A6 80            [ 1]  135 	ld	a, #0x80
      008052 CD 89 5E         [ 4]  136 	call	_ADC1_GetFlagStatus
      008055 4D               [ 1]  137 	tnz	a
      008056 27 F8            [ 1]  138 	jreq	00101$
                                    139 ;	main.c: 16: ADC1_ClearFlag(ADC1_FLAG_EOC);
      008058 A6 80            [ 1]  140 	ld	a, #0x80
      00805A CD 89 C4         [ 4]  141 	call	_ADC1_ClearFlag
                                    142 ;	main.c: 17: value = ADC1_GetConversionValue();
      00805D CD 88 1B         [ 4]  143 	call	_ADC1_GetConversionValue
                                    144 ;	main.c: 18: return value;
                                    145 ;	main.c: 19: }
      008060 81               [ 4]  146 	ret
                                    147 ;	main.c: 20: void main(void)
                                    148 ;	-----------------------------------------
                                    149 ;	 function main
                                    150 ;	-----------------------------------------
      008061                        151 _main:
                                    152 ;	main.c: 22: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
      008061 4F               [ 1]  153 	clr	a
      008062 CD 84 B6         [ 4]  154 	call	_CLK_HSIPrescalerConfig
                                    155 ;	main.c: 24: TIM4_TimeBaseInit(TIM4_PRESCALER_128, 125 - 1);
      008065 4B 7C            [ 1]  156 	push	#0x7c
      008067 A6 07            [ 1]  157 	ld	a, #0x07
      008069 CD 81 E6         [ 4]  158 	call	_TIM4_TimeBaseInit
                                    159 ;	main.c: 25: TIM4_Cmd(ENABLE);
      00806C A6 01            [ 1]  160 	ld	a, #0x01
      00806E CD 81 F2         [ 4]  161 	call	_TIM4_Cmd
                                    162 ;	main.c: 27: GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_HIGH_FAST);
      008071 4B F0            [ 1]  163 	push	#0xf0
      008073 A6 08            [ 1]  164 	ld	a, #0x08
      008075 AE 50 0F         [ 2]  165 	ldw	x, #0x500f
      008078 CD 81 09         [ 4]  166 	call	_GPIO_Init
                                    167 ;	main.c: 28: GPIO_Init(GPIOD, GPIO_PIN_2, GPIO_MODE_IN_FL_NO_IT);
      00807B 4B 00            [ 1]  168 	push	#0x00
      00807D A6 04            [ 1]  169 	ld	a, #0x04
      00807F AE 50 0F         [ 2]  170 	ldw	x, #0x500f
      008082 CD 81 09         [ 4]  171 	call	_GPIO_Init
                                    172 ;	main.c: 30: ADC1_DeInit();
      008085 CD 86 61         [ 4]  173 	call	_ADC1_DeInit
                                    174 ;	main.c: 31: ADC1_Init(ADC1_CONVERSIONMODE_SINGLE, ADC1_CHANNEL_3, ADC1_PRESSEL_FCPU_D18, 
      008088 4B 00            [ 1]  175 	push	#0x00
      00808A 4B 03            [ 1]  176 	push	#0x03
      00808C 4B 08            [ 1]  177 	push	#0x08
      00808E 4B 00            [ 1]  178 	push	#0x00
      008090 4B 00            [ 1]  179 	push	#0x00
      008092 4B 70            [ 1]  180 	push	#0x70
      008094 4B 03            [ 1]  181 	push	#0x03
      008096 4F               [ 1]  182 	clr	a
      008097 CD 86 92         [ 4]  183 	call	_ADC1_Init
                                    184 ;	main.c: 33: ADC1_Cmd(ENABLE);
      00809A A6 01            [ 1]  185 	ld	a, #0x01
      00809C CD 86 BF         [ 4]  186 	call	_ADC1_Cmd
                                    187 ;	main.c: 34: while(1) {
      00809F                        188 00108$:
                                    189 ;	main.c: 35: ADC1_StartConversion();
      00809F CD 88 16         [ 4]  190 	call	_ADC1_StartConversion
                                    191 ;	main.c: 36: while(ADC1_GetFlagStatus(ADC1_FLAG_EOC)==0){}
      0080A2                        192 00101$:
      0080A2 A6 80            [ 1]  193 	ld	a, #0x80
      0080A4 CD 89 5E         [ 4]  194 	call	_ADC1_GetFlagStatus
      0080A7 4D               [ 1]  195 	tnz	a
      0080A8 27 F8            [ 1]  196 	jreq	00101$
                                    197 ;	main.c: 37: ADC1_ClearFlag(ADC1_FLAG_EOC);
      0080AA A6 80            [ 1]  198 	ld	a, #0x80
      0080AC CD 89 C4         [ 4]  199 	call	_ADC1_ClearFlag
                                    200 ;	main.c: 38: adc_value = ADC1_GetConversionValue();
      0080AF CD 88 1B         [ 4]  201 	call	_ADC1_GetConversionValue
      0080B2 CF 00 01         [ 2]  202 	ldw	_adc_value+0, x
                                    203 ;	main.c: 39: if(adc_value > 1000)
      0080B5 CE 00 01         [ 2]  204 	ldw	x, _adc_value+0
      0080B8 A3 03 E8         [ 2]  205 	cpw	x, #0x03e8
      0080BB 23 0A            [ 2]  206 	jrule	00105$
                                    207 ;	main.c: 40: { GPIO_WriteHigh(GPIOD, GPIO_PIN_3);}
      0080BD A6 08            [ 1]  208 	ld	a, #0x08
      0080BF AE 50 0F         [ 2]  209 	ldw	x, #0x500f
      0080C2 CD 81 83         [ 4]  210 	call	_GPIO_WriteHigh
      0080C5 20 08            [ 2]  211 	jra	00106$
      0080C7                        212 00105$:
                                    213 ;	main.c: 42: {GPIO_WriteLow(GPIOD, GPIO_PIN_3);}
      0080C7 A6 08            [ 1]  214 	ld	a, #0x08
      0080C9 AE 50 0F         [ 2]  215 	ldw	x, #0x500f
      0080CC CD 81 8C         [ 4]  216 	call	_GPIO_WriteLow
      0080CF                        217 00106$:
                                    218 ;	main.c: 43: delay_ms(100);
      0080CF AE 00 64         [ 2]  219 	ldw	x, #0x0064
      0080D2 CD 80 D8         [ 4]  220 	call	_delay_ms
      0080D5 20 C8            [ 2]  221 	jra	00108$
                                    222 ;	main.c: 45: }
      0080D7 81               [ 4]  223 	ret
                                    224 ;	main.c: 47: void delay_ms(uint16_t u16Delay)
                                    225 ;	-----------------------------------------
                                    226 ;	 function delay_ms
                                    227 ;	-----------------------------------------
      0080D8                        228 _delay_ms:
      0080D8 52 02            [ 2]  229 	sub	sp, #2
                                    230 ;	main.c: 50: while (u16Delay) {
      0080DA 1F 01            [ 2]  231 	ldw	(0x01, sp), x
      0080DC                        232 00104$:
      0080DC 1E 01            [ 2]  233 	ldw	x, (0x01, sp)
      0080DE 27 18            [ 1]  234 	jreq	00107$
                                    235 ;	main.c: 51: TIM4_SetCounter(0);
      0080E0 4F               [ 1]  236 	clr	a
      0080E1 CD 82 97         [ 4]  237 	call	_TIM4_SetCounter
                                    238 ;	main.c: 52: TIM4_ClearFlag(TIM4_FLAG_UPDATE);
      0080E4 A6 01            [ 1]  239 	ld	a, #0x01
      0080E6 CD 82 B7         [ 4]  240 	call	_TIM4_ClearFlag
                                    241 ;	main.c: 53: while (TIM4_GetFlagStatus(TIM4_FLAG_UPDATE) == RESET) {
      0080E9                        242 00101$:
      0080E9 A6 01            [ 1]  243 	ld	a, #0x01
      0080EB CD 82 A7         [ 4]  244 	call	_TIM4_GetFlagStatus
      0080EE 4D               [ 1]  245 	tnz	a
      0080EF 27 F8            [ 1]  246 	jreq	00101$
                                    247 ;	main.c: 55: --u16Delay;
      0080F1 1E 01            [ 2]  248 	ldw	x, (0x01, sp)
      0080F3 5A               [ 2]  249 	decw	x
      0080F4 1F 01            [ 2]  250 	ldw	(0x01, sp), x
      0080F6 20 E4            [ 2]  251 	jra	00104$
      0080F8                        252 00107$:
                                    253 ;	main.c: 57: }
      0080F8 5B 02            [ 2]  254 	addw	sp, #2
      0080FA 81               [ 4]  255 	ret
                                    256 	.area CODE
                                    257 	.area CONST
                                    258 	.area INITIALIZER
      008039                        259 __xinit__adc_value:
      008039 00 00                  260 	.dw #0x0000
                                    261 	.area CABS (ABS)
