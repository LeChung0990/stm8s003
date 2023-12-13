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
                                     12 	.globl _TIM4_ClearFlag
                                     13 	.globl _TIM4_GetFlagStatus
                                     14 	.globl _TIM4_SetCounter
                                     15 	.globl _TIM2_OC1PreloadConfig
                                     16 	.globl _TIM2_ARRPreloadConfig
                                     17 	.globl _TIM2_Cmd
                                     18 	.globl _TIM2_OC1Init
                                     19 	.globl _TIM2_TimeBaseInit
                                     20 	.globl _GPIO_Init
                                     21 	.globl _GPIO_DeInit
                                     22 	.globl _CLK_HSIPrescalerConfig
                                     23 	.globl _delay_ms
                                     24 ;--------------------------------------------------------
                                     25 ; ram data
                                     26 ;--------------------------------------------------------
                                     27 	.area DATA
                                     28 ;--------------------------------------------------------
                                     29 ; ram data
                                     30 ;--------------------------------------------------------
                                     31 	.area INITIALIZED
                                     32 ;--------------------------------------------------------
                                     33 ; Stack segment in internal ram
                                     34 ;--------------------------------------------------------
                                     35 	.area SSEG
      000001                         36 __start__stack:
      000001                         37 	.ds	1
                                     38 
                                     39 ;--------------------------------------------------------
                                     40 ; absolute external ram data
                                     41 ;--------------------------------------------------------
                                     42 	.area DABS (ABS)
                                     43 
                                     44 ; default segment ordering for linker
                                     45 	.area HOME
                                     46 	.area GSINIT
                                     47 	.area GSFINAL
                                     48 	.area CONST
                                     49 	.area INITIALIZER
                                     50 	.area CODE
                                     51 
                                     52 ;--------------------------------------------------------
                                     53 ; interrupt vector
                                     54 ;--------------------------------------------------------
                                     55 	.area HOME
      008000                         56 __interrupt_vect:
      008000 82 00 80 07             57 	int s_GSINIT ; reset
                                     58 ;--------------------------------------------------------
                                     59 ; global & static initialisations
                                     60 ;--------------------------------------------------------
                                     61 	.area HOME
                                     62 	.area GSINIT
                                     63 	.area GSFINAL
                                     64 	.area GSINIT
      008007 CD 8B 5E         [ 4]   65 	call	___sdcc_external_startup
      00800A 4D               [ 1]   66 	tnz	a
      00800B 27 03            [ 1]   67 	jreq	__sdcc_init_data
      00800D CC 80 04         [ 2]   68 	jp	__sdcc_program_startup
      008010                         69 __sdcc_init_data:
                                     70 ; stm8_genXINIT() start
      008010 AE 00 00         [ 2]   71 	ldw x, #l_DATA
      008013 27 07            [ 1]   72 	jreq	00002$
      008015                         73 00001$:
      008015 72 4F 00 00      [ 1]   74 	clr (s_DATA - 1, x)
      008019 5A               [ 2]   75 	decw x
      00801A 26 F9            [ 1]   76 	jrne	00001$
      00801C                         77 00002$:
      00801C AE 00 00         [ 2]   78 	ldw	x, #l_INITIALIZER
      00801F 27 09            [ 1]   79 	jreq	00004$
      008021                         80 00003$:
      008021 D6 80 38         [ 1]   81 	ld	a, (s_INITIALIZER - 1, x)
      008024 D7 00 00         [ 1]   82 	ld	(s_INITIALIZED - 1, x), a
      008027 5A               [ 2]   83 	decw	x
      008028 26 F7            [ 1]   84 	jrne	00003$
      00802A                         85 00004$:
                                     86 ; stm8_genXINIT() end
                                     87 	.area GSFINAL
      00802A CC 80 04         [ 2]   88 	jp	__sdcc_program_startup
                                     89 ;--------------------------------------------------------
                                     90 ; Home
                                     91 ;--------------------------------------------------------
                                     92 	.area HOME
                                     93 	.area HOME
      008004                         94 __sdcc_program_startup:
      008004 CC 80 5D         [ 2]   95 	jp	_main
                                     96 ;	return from main will return to caller
                                     97 ;--------------------------------------------------------
                                     98 ; code
                                     99 ;--------------------------------------------------------
                                    100 	.area CODE
                                    101 ;	main.c: 5: static void TIM2_Config(void)
                                    102 ;	-----------------------------------------
                                    103 ;	 function TIM2_Config
                                    104 ;	-----------------------------------------
      008039                        105 _TIM2_Config:
                                    106 ;	main.c: 7: TIM2_TimeBaseInit(TIM2_PRESCALER_8, 1250);
      008039 AE 04 E2         [ 2]  107 	ldw	x, #0x04e2
      00803C A6 03            [ 1]  108 	ld	a, #0x03
      00803E CD 86 59         [ 4]  109 	call	_TIM2_TimeBaseInit
                                    110 ;	main.c: 8: TIM2_OC1Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE, 125 ,TIM2_OCPOLARITY_HIGH);
      008041 4B 00            [ 1]  111 	push	#0x00
      008043 4B 7D            [ 1]  112 	push	#0x7d
      008045 4B 00            [ 1]  113 	push	#0x00
      008047 4B 11            [ 1]  114 	push	#0x11
      008049 A6 60            [ 1]  115 	ld	a, #0x60
      00804B CD 86 65         [ 4]  116 	call	_TIM2_OC1Init
                                    117 ;	main.c: 9: TIM2_OC1PreloadConfig(ENABLE);
      00804E A6 01            [ 1]  118 	ld	a, #0x01
      008050 CD 88 9B         [ 4]  119 	call	_TIM2_OC1PreloadConfig
                                    120 ;	main.c: 10: TIM2_ARRPreloadConfig(ENABLE);
      008053 A6 01            [ 1]  121 	ld	a, #0x01
      008055 CD 88 83         [ 4]  122 	call	_TIM2_ARRPreloadConfig
                                    123 ;	main.c: 12: TIM2_Cmd(ENABLE);
      008058 A6 01            [ 1]  124 	ld	a, #0x01
                                    125 ;	main.c: 13: }
      00805A CC 87 CD         [ 2]  126 	jp	_TIM2_Cmd
                                    127 ;	main.c: 16: void main(void)
                                    128 ;	-----------------------------------------
                                    129 ;	 function main
                                    130 ;	-----------------------------------------
      00805D                        131 _main:
                                    132 ;	main.c: 19: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
      00805D 4F               [ 1]  133 	clr	a
      00805E CD 84 55         [ 4]  134 	call	_CLK_HSIPrescalerConfig
                                    135 ;	main.c: 20: GPIO_DeInit(GPIOD); 	/*CLEAR REGISTER GPIO OR RESET VALUE*/
      008061 AE 50 0F         [ 2]  136 	ldw	x, #0x500f
      008064 CD 80 9A         [ 4]  137 	call	_GPIO_DeInit
                                    138 ;	main.c: 21: GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);
      008067 4B E0            [ 1]  139 	push	#0xe0
      008069 A6 08            [ 1]  140 	ld	a, #0x08
      00806B AE 50 0F         [ 2]  141 	ldw	x, #0x500f
      00806E CD 80 A8         [ 4]  142 	call	_GPIO_Init
                                    143 ;	main.c: 25: TIM2_Config();
      008071 CD 80 39         [ 4]  144 	call	_TIM2_Config
                                    145 ;	main.c: 26: while(1) {
      008074                        146 00102$:
      008074 20 FE            [ 2]  147 	jra	00102$
                                    148 ;	main.c: 30: }
      008076 81               [ 4]  149 	ret
                                    150 ;	main.c: 32: void delay_ms(uint16_t u16Delay)	//Ham delay dung timer4
                                    151 ;	-----------------------------------------
                                    152 ;	 function delay_ms
                                    153 ;	-----------------------------------------
      008077                        154 _delay_ms:
      008077 52 02            [ 2]  155 	sub	sp, #2
                                    156 ;	main.c: 35: while (u16Delay) {
      008079 1F 01            [ 2]  157 	ldw	(0x01, sp), x
      00807B                        158 00104$:
      00807B 1E 01            [ 2]  159 	ldw	x, (0x01, sp)
      00807D 27 18            [ 1]  160 	jreq	00107$
                                    161 ;	main.c: 36: TIM4_SetCounter(0);
      00807F 4F               [ 1]  162 	clr	a
      008080 CD 82 36         [ 4]  163 	call	_TIM4_SetCounter
                                    164 ;	main.c: 37: TIM4_ClearFlag(TIM4_FLAG_UPDATE);
      008083 A6 01            [ 1]  165 	ld	a, #0x01
      008085 CD 82 56         [ 4]  166 	call	_TIM4_ClearFlag
                                    167 ;	main.c: 38: while (TIM4_GetFlagStatus(TIM4_FLAG_UPDATE) == RESET) {
      008088                        168 00101$:
      008088 A6 01            [ 1]  169 	ld	a, #0x01
      00808A CD 82 46         [ 4]  170 	call	_TIM4_GetFlagStatus
      00808D 4D               [ 1]  171 	tnz	a
      00808E 27 F8            [ 1]  172 	jreq	00101$
                                    173 ;	main.c: 40: --u16Delay;
      008090 1E 01            [ 2]  174 	ldw	x, (0x01, sp)
      008092 5A               [ 2]  175 	decw	x
      008093 1F 01            [ 2]  176 	ldw	(0x01, sp), x
      008095 20 E4            [ 2]  177 	jra	00104$
      008097                        178 00107$:
                                    179 ;	main.c: 42: }
      008097 5B 02            [ 2]  180 	addw	sp, #2
      008099 81               [ 4]  181 	ret
                                    182 	.area CODE
                                    183 	.area CONST
                                    184 	.area INITIALIZER
                                    185 	.area CABS (ABS)
