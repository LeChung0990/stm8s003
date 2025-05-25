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
                                     15 	.globl _TIM4_Cmd
                                     16 	.globl _TIM4_TimeBaseInit
                                     17 	.globl _GPIO_WriteReverse
                                     18 	.globl _GPIO_Init
                                     19 	.globl _GPIO_DeInit
                                     20 	.globl _CLK_HSIPrescalerConfig
                                     21 	.globl _delay_ms
                                     22 ;--------------------------------------------------------
                                     23 ; ram data
                                     24 ;--------------------------------------------------------
                                     25 	.area DATA
                                     26 ;--------------------------------------------------------
                                     27 ; ram data
                                     28 ;--------------------------------------------------------
                                     29 	.area INITIALIZED
                                     30 ;--------------------------------------------------------
                                     31 ; Stack segment in internal ram
                                     32 ;--------------------------------------------------------
                                     33 	.area SSEG
      000001                         34 __start__stack:
      000001                         35 	.ds	1
                                     36 
                                     37 ;--------------------------------------------------------
                                     38 ; absolute external ram data
                                     39 ;--------------------------------------------------------
                                     40 	.area DABS (ABS)
                                     41 
                                     42 ; default segment ordering for linker
                                     43 	.area HOME
                                     44 	.area GSINIT
                                     45 	.area GSFINAL
                                     46 	.area CONST
                                     47 	.area INITIALIZER
                                     48 	.area CODE
                                     49 
                                     50 ;--------------------------------------------------------
                                     51 ; interrupt vector
                                     52 ;--------------------------------------------------------
                                     53 	.area HOME
      008000                         54 __interrupt_vect:
      008000 82 00 80 07             55 	int s_GSINIT ; reset
                                     56 ;--------------------------------------------------------
                                     57 ; global & static initialisations
                                     58 ;--------------------------------------------------------
                                     59 	.area HOME
                                     60 	.area GSINIT
                                     61 	.area GSFINAL
                                     62 	.area GSINIT
      008007 CD 85 F3         [ 4]   63 	call	___sdcc_external_startup
      00800A 4D               [ 1]   64 	tnz	a
      00800B 27 03            [ 1]   65 	jreq	__sdcc_init_data
      00800D CC 80 04         [ 2]   66 	jp	__sdcc_program_startup
      008010                         67 __sdcc_init_data:
                                     68 ; stm8_genXINIT() start
      008010 AE 00 00         [ 2]   69 	ldw x, #l_DATA
      008013 27 07            [ 1]   70 	jreq	00002$
      008015                         71 00001$:
      008015 72 4F 00 00      [ 1]   72 	clr (s_DATA - 1, x)
      008019 5A               [ 2]   73 	decw x
      00801A 26 F9            [ 1]   74 	jrne	00001$
      00801C                         75 00002$:
      00801C AE 00 00         [ 2]   76 	ldw	x, #l_INITIALIZER
      00801F 27 09            [ 1]   77 	jreq	00004$
      008021                         78 00003$:
      008021 D6 80 38         [ 1]   79 	ld	a, (s_INITIALIZER - 1, x)
      008024 D7 00 00         [ 1]   80 	ld	(s_INITIALIZED - 1, x), a
      008027 5A               [ 2]   81 	decw	x
      008028 26 F7            [ 1]   82 	jrne	00003$
      00802A                         83 00004$:
                                     84 ; stm8_genXINIT() end
                                     85 	.area GSFINAL
      00802A CC 80 04         [ 2]   86 	jp	__sdcc_program_startup
                                     87 ;--------------------------------------------------------
                                     88 ; Home
                                     89 ;--------------------------------------------------------
                                     90 	.area HOME
                                     91 	.area HOME
      008004                         92 __sdcc_program_startup:
      008004 CC 80 39         [ 2]   93 	jp	_main
                                     94 ;	return from main will return to caller
                                     95 ;--------------------------------------------------------
                                     96 ; code
                                     97 ;--------------------------------------------------------
                                     98 	.area CODE
                                     99 ;	main.c: 4: void main(void)
                                    100 ;	-----------------------------------------
                                    101 ;	 function main
                                    102 ;	-----------------------------------------
      008039                        103 _main:
                                    104 ;	main.c: 7: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
      008039 4F               [ 1]  105 	clr	a
      00803A CD 84 48         [ 4]  106 	call	_CLK_HSIPrescalerConfig
                                    107 ;	main.c: 8: GPIO_DeInit(GPIOB); 	/*CLEAR REGISTER GPIO OR RESET VALUE*/
      00803D AE 50 05         [ 2]  108 	ldw	x, #0x5005
      008040 CD 80 8D         [ 4]  109 	call	_GPIO_DeInit
                                    110 ;	main.c: 9: GPIO_Init(GPIOA, GPIO_PIN_3, GPIO_MODE_OUT_OD_LOW_SLOW);
      008043 4B 80            [ 1]  111 	push	#0x80
      008045 A6 08            [ 1]  112 	ld	a, #0x08
      008047 AE 50 00         [ 2]  113 	ldw	x, #0x5000
      00804A CD 80 9B         [ 4]  114 	call	_GPIO_Init
                                    115 ;	main.c: 10: TIM4_TimeBaseInit(TIM4_PRESCALER_128, 63 - 1);
      00804D 4B 3E            [ 1]  116 	push	#0x3e
      00804F A6 07            [ 1]  117 	ld	a, #0x07
      008051 CD 81 78         [ 4]  118 	call	_TIM4_TimeBaseInit
                                    119 ;	main.c: 11: TIM4_Cmd(ENABLE);
      008054 A6 01            [ 1]  120 	ld	a, #0x01
      008056 CD 81 84         [ 4]  121 	call	_TIM4_Cmd
                                    122 ;	main.c: 13: while(1) {
      008059                        123 00102$:
                                    124 ;	main.c: 14: delay_ms(400);
      008059 AE 01 90         [ 2]  125 	ldw	x, #0x0190
      00805C CD 80 6A         [ 4]  126 	call	_delay_ms
                                    127 ;	main.c: 15: GPIO_WriteReverse(GPIOA, GPIO_PIN_3);	/*Nhap nhay LED tai chan PA3*/
      00805F A6 08            [ 1]  128 	ld	a, #0x08
      008061 AE 50 00         [ 2]  129 	ldw	x, #0x5000
      008064 CD 81 2A         [ 4]  130 	call	_GPIO_WriteReverse
      008067 20 F0            [ 2]  131 	jra	00102$
                                    132 ;	main.c: 17: }
      008069 81               [ 4]  133 	ret
                                    134 ;	main.c: 19: void delay_ms(uint16_t u16Delay)	//Ham delay dung timer4
                                    135 ;	-----------------------------------------
                                    136 ;	 function delay_ms
                                    137 ;	-----------------------------------------
      00806A                        138 _delay_ms:
      00806A 52 02            [ 2]  139 	sub	sp, #2
                                    140 ;	main.c: 22: while (u16Delay) {
      00806C 1F 01            [ 2]  141 	ldw	(0x01, sp), x
      00806E                        142 00104$:
      00806E 1E 01            [ 2]  143 	ldw	x, (0x01, sp)
      008070 27 18            [ 1]  144 	jreq	00107$
                                    145 ;	main.c: 23: TIM4_SetCounter(0);
      008072 4F               [ 1]  146 	clr	a
      008073 CD 82 29         [ 4]  147 	call	_TIM4_SetCounter
                                    148 ;	main.c: 24: TIM4_ClearFlag(TIM4_FLAG_UPDATE);
      008076 A6 01            [ 1]  149 	ld	a, #0x01
      008078 CD 82 49         [ 4]  150 	call	_TIM4_ClearFlag
                                    151 ;	main.c: 25: while (TIM4_GetFlagStatus(TIM4_FLAG_UPDATE) == RESET) {
      00807B                        152 00101$:
      00807B A6 01            [ 1]  153 	ld	a, #0x01
      00807D CD 82 39         [ 4]  154 	call	_TIM4_GetFlagStatus
      008080 4D               [ 1]  155 	tnz	a
      008081 27 F8            [ 1]  156 	jreq	00101$
                                    157 ;	main.c: 27: --u16Delay;
      008083 1E 01            [ 2]  158 	ldw	x, (0x01, sp)
      008085 5A               [ 2]  159 	decw	x
      008086 1F 01            [ 2]  160 	ldw	(0x01, sp), x
      008088 20 E4            [ 2]  161 	jra	00104$
      00808A                        162 00107$:
                                    163 ;	main.c: 29: }
      00808A 5B 02            [ 2]  164 	addw	sp, #2
      00808C 81               [ 4]  165 	ret
                                    166 	.area CODE
                                    167 	.area CONST
                                    168 	.area INITIALIZER
                                    169 	.area CABS (ABS)
