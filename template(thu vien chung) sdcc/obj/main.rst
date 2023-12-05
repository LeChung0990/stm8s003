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
      008007 CD 85 F2         [ 4]   63 	call	___sdcc_external_startup
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
      00803A CD 84 47         [ 4]  106 	call	_CLK_HSIPrescalerConfig
                                    107 ;	main.c: 8: GPIO_DeInit(GPIOD); 	/*CLEAR REGISTER GPIO OR RESET VALUE*/
      00803D AE 50 0F         [ 2]  108 	ldw	x, #0x500f
      008040 CD 80 8C         [ 4]  109 	call	_GPIO_DeInit
                                    110 ;	main.c: 9: GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);
      008043 4B E0            [ 1]  111 	push	#0xe0
      008045 A6 08            [ 1]  112 	ld	a, #0x08
      008047 AE 50 0F         [ 2]  113 	ldw	x, #0x500f
      00804A CD 80 9A         [ 4]  114 	call	_GPIO_Init
                                    115 ;	main.c: 10: TIM4_TimeBaseInit(TIM4_PRESCALER_128, 63 - 1);
      00804D 4B 3E            [ 1]  116 	push	#0x3e
      00804F A6 07            [ 1]  117 	ld	a, #0x07
      008051 CD 81 77         [ 4]  118 	call	_TIM4_TimeBaseInit
                                    119 ;	main.c: 11: TIM4_Cmd(ENABLE);
      008054 A6 01            [ 1]  120 	ld	a, #0x01
      008056 CD 81 83         [ 4]  121 	call	_TIM4_Cmd
                                    122 ;	main.c: 13: while(1) {
      008059                        123 00102$:
                                    124 ;	main.c: 14: delay_ms(1);
      008059 5F               [ 1]  125 	clrw	x
      00805A 5C               [ 1]  126 	incw	x
      00805B CD 80 69         [ 4]  127 	call	_delay_ms
                                    128 ;	main.c: 15: GPIO_WriteReverse(GPIOD, GPIO_PIN_3);	/*Nhap nhay LED tai chan PD3*/
      00805E A6 08            [ 1]  129 	ld	a, #0x08
      008060 AE 50 0F         [ 2]  130 	ldw	x, #0x500f
      008063 CD 81 29         [ 4]  131 	call	_GPIO_WriteReverse
      008066 20 F1            [ 2]  132 	jra	00102$
                                    133 ;	main.c: 17: }
      008068 81               [ 4]  134 	ret
                                    135 ;	main.c: 19: void delay_ms(uint16_t u16Delay)	//Ham delay dung timer4
                                    136 ;	-----------------------------------------
                                    137 ;	 function delay_ms
                                    138 ;	-----------------------------------------
      008069                        139 _delay_ms:
      008069 52 02            [ 2]  140 	sub	sp, #2
                                    141 ;	main.c: 22: while (u16Delay) {
      00806B 1F 01            [ 2]  142 	ldw	(0x01, sp), x
      00806D                        143 00104$:
      00806D 1E 01            [ 2]  144 	ldw	x, (0x01, sp)
      00806F 27 18            [ 1]  145 	jreq	00107$
                                    146 ;	main.c: 23: TIM4_SetCounter(0);
      008071 4F               [ 1]  147 	clr	a
      008072 CD 82 28         [ 4]  148 	call	_TIM4_SetCounter
                                    149 ;	main.c: 24: TIM4_ClearFlag(TIM4_FLAG_UPDATE);
      008075 A6 01            [ 1]  150 	ld	a, #0x01
      008077 CD 82 48         [ 4]  151 	call	_TIM4_ClearFlag
                                    152 ;	main.c: 25: while (TIM4_GetFlagStatus(TIM4_FLAG_UPDATE) == RESET) {
      00807A                        153 00101$:
      00807A A6 01            [ 1]  154 	ld	a, #0x01
      00807C CD 82 38         [ 4]  155 	call	_TIM4_GetFlagStatus
      00807F 4D               [ 1]  156 	tnz	a
      008080 27 F8            [ 1]  157 	jreq	00101$
                                    158 ;	main.c: 27: --u16Delay;
      008082 1E 01            [ 2]  159 	ldw	x, (0x01, sp)
      008084 5A               [ 2]  160 	decw	x
      008085 1F 01            [ 2]  161 	ldw	(0x01, sp), x
      008087 20 E4            [ 2]  162 	jra	00104$
      008089                        163 00107$:
                                    164 ;	main.c: 29: }
      008089 5B 02            [ 2]  165 	addw	sp, #2
      00808B 81               [ 4]  166 	ret
                                    167 	.area CODE
                                    168 	.area CONST
                                    169 	.area INITIALIZER
                                    170 	.area CABS (ABS)
