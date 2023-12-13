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
                                     12 	.globl _Timer4DelayMs
                                     13 	.globl _Timer4Config
                                     14 ;--------------------------------------------------------
                                     15 ; ram data
                                     16 ;--------------------------------------------------------
                                     17 	.area DATA
                                     18 ;--------------------------------------------------------
                                     19 ; ram data
                                     20 ;--------------------------------------------------------
                                     21 	.area INITIALIZED
                                     22 ;--------------------------------------------------------
                                     23 ; Stack segment in internal ram
                                     24 ;--------------------------------------------------------
                                     25 	.area SSEG
      000001                         26 __start__stack:
      000001                         27 	.ds	1
                                     28 
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
                                     43 ; interrupt vector
                                     44 ;--------------------------------------------------------
                                     45 	.area HOME
      008000                         46 __interrupt_vect:
      008000 82 00 80 07             47 	int s_GSINIT ; reset
                                     48 ;--------------------------------------------------------
                                     49 ; global & static initialisations
                                     50 ;--------------------------------------------------------
                                     51 	.area HOME
                                     52 	.area GSINIT
                                     53 	.area GSFINAL
                                     54 	.area GSINIT
      008007 CD 80 8C         [ 4]   55 	call	___sdcc_external_startup
      00800A 4D               [ 1]   56 	tnz	a
      00800B 27 03            [ 1]   57 	jreq	__sdcc_init_data
      00800D CC 80 04         [ 2]   58 	jp	__sdcc_program_startup
      008010                         59 __sdcc_init_data:
                                     60 ; stm8_genXINIT() start
      008010 AE 00 00         [ 2]   61 	ldw x, #l_DATA
      008013 27 07            [ 1]   62 	jreq	00002$
      008015                         63 00001$:
      008015 72 4F 00 00      [ 1]   64 	clr (s_DATA - 1, x)
      008019 5A               [ 2]   65 	decw x
      00801A 26 F9            [ 1]   66 	jrne	00001$
      00801C                         67 00002$:
      00801C AE 00 00         [ 2]   68 	ldw	x, #l_INITIALIZER
      00801F 27 09            [ 1]   69 	jreq	00004$
      008021                         70 00003$:
      008021 D6 80 2C         [ 1]   71 	ld	a, (s_INITIALIZER - 1, x)
      008024 D7 00 00         [ 1]   72 	ld	(s_INITIALIZED - 1, x), a
      008027 5A               [ 2]   73 	decw	x
      008028 26 F7            [ 1]   74 	jrne	00003$
      00802A                         75 00004$:
                                     76 ; stm8_genXINIT() end
                                     77 	.area GSFINAL
      00802A CC 80 04         [ 2]   78 	jp	__sdcc_program_startup
                                     79 ;--------------------------------------------------------
                                     80 ; Home
                                     81 ;--------------------------------------------------------
                                     82 	.area HOME
                                     83 	.area HOME
      008004                         84 __sdcc_program_startup:
      008004 CC 80 4F         [ 2]   85 	jp	_main
                                     86 ;	return from main will return to caller
                                     87 ;--------------------------------------------------------
                                     88 ; code
                                     89 ;--------------------------------------------------------
                                     90 	.area CODE
                                     91 ;	main.c: 11: void Timer4Config(void){
                                     92 ;	-----------------------------------------
                                     93 ;	 function Timer4Config
                                     94 ;	-----------------------------------------
      00802D                         95 _Timer4Config:
                                     96 ;	main.c: 12: TIM4->PSCR = (uint8_t)0x07;
      00802D 35 07 53 47      [ 1]   97 	mov	0x5347+0, #0x07
                                     98 ;	main.c: 13: TIM4->ARR = (uint8_t)125 - 1;
      008031 35 7C 53 48      [ 1]   99 	mov	0x5348+0, #0x7c
                                    100 ;	main.c: 15: TIM4->CR1 |= TIM4_CR1_CEN;
      008035 72 10 53 40      [ 1]  101 	bset	0x5340, #0
                                    102 ;	main.c: 16: }
      008039 81               [ 4]  103 	ret
                                    104 ;	main.c: 17: void Timer4DelayMs(uint16_t u16Delay){
                                    105 ;	-----------------------------------------
                                    106 ;	 function Timer4DelayMs
                                    107 ;	-----------------------------------------
      00803A                        108 _Timer4DelayMs:
                                    109 ;	main.c: 18: while(u16Delay){
      00803A                        110 00104$:
      00803A 5D               [ 2]  111 	tnzw	x
      00803B 26 01            [ 1]  112 	jrne	00130$
      00803D 81               [ 4]  113 	ret
      00803E                        114 00130$:
                                    115 ;	main.c: 19: TIM4->CNTR = (uint8_t)0;
      00803E 35 00 53 46      [ 1]  116 	mov	0x5346+0, #0x00
                                    117 ;	main.c: 21: TIM4->SR1 = (uint8_t)(~0x01);
      008042 35 FE 53 44      [ 1]  118 	mov	0x5344+0, #0xfe
                                    119 ;	main.c: 22: while((TIM4->SR1 & (uint8_t)0x01) == RESET){}
      008046                        120 00101$:
      008046 72 01 53 44 FB   [ 2]  121 	btjf	0x5344, #0, 00101$
                                    122 ;	main.c: 23: --u16Delay;
      00804B 5A               [ 2]  123 	decw	x
      00804C 20 EC            [ 2]  124 	jra	00104$
                                    125 ;	main.c: 25: }
      00804E 81               [ 4]  126 	ret
                                    127 ;	main.c: 28: void main (void)
                                    128 ;	-----------------------------------------
                                    129 ;	 function main
                                    130 ;	-----------------------------------------
      00804F                        131 _main:
                                    132 ;	main.c: 32: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      00804F C6 50 C6         [ 1]  133 	ld	a, 0x50c6
      008052 A4 E7            [ 1]  134 	and	a, #0xe7
      008054 C7 50 C6         [ 1]  135 	ld	0x50c6, a
                                    136 ;	main.c: 33: CLK->CKDIVR |= (uint8_t)CLK_PRESCALER_HSIDIV1;
      008057 55 50 C6 50 C6   [ 1]  137 	mov	0x50c6, 0x50c6
                                    138 ;	main.c: 35: LED_PORT->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
      00805C 35 00 50 0F      [ 1]  139 	mov	0x500f+0, #0x00
                                    140 ;	main.c: 36: LED_PORT->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
      008060 35 00 50 11      [ 1]  141 	mov	0x5011+0, #0x00
                                    142 ;	main.c: 37: LED_PORT->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
      008064 35 00 50 12      [ 1]  143 	mov	0x5012+0, #0x00
                                    144 ;	main.c: 38: LED_PORT->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
      008068 35 00 50 13      [ 1]  145 	mov	0x5013+0, #0x00
                                    146 ;	main.c: 40: LED_PORT->DDR |= (uint8_t)LED_PIN; /* Set Output mode */
      00806C 72 16 50 11      [ 1]  147 	bset	0x5011, #3
                                    148 ;	main.c: 41: LED_PORT->ODR |= (uint8_t)LED_PIN; /* High level */
      008070 72 16 50 0F      [ 1]  149 	bset	0x500f, #3
                                    150 ;	main.c: 42: LED_PORT->CR1 |= (uint8_t)LED_PIN; /* Pull-Up or Push-Pull */
      008074 72 16 50 12      [ 1]  151 	bset	0x5012, #3
                                    152 ;	main.c: 43: LED_PORT->CR2 |= (uint8_t)LED_PIN; /* Interrupt or Slow slope */
      008078 72 16 50 13      [ 1]  153 	bset	0x5013, #3
                                    154 ;	main.c: 44: Timer4Config();
      00807C CD 80 2D         [ 4]  155 	call	_Timer4Config
                                    156 ;	main.c: 50: while (1)
      00807F                        157 00102$:
                                    158 ;	main.c: 52: Timer4DelayMs(10);
      00807F AE 00 0A         [ 2]  159 	ldw	x, #0x000a
      008082 CD 80 3A         [ 4]  160 	call	_Timer4DelayMs
                                    161 ;	main.c: 53: LED_PORT->ODR ^= (uint8_t)LED_PIN;
      008085 90 16 50 0F      [ 1]  162 	bcpl	0x500f, #3
      008089 20 F4            [ 2]  163 	jra	00102$
                                    164 ;	main.c: 75: }
      00808B 81               [ 4]  165 	ret
                                    166 	.area CODE
                                    167 	.area CONST
                                    168 	.area INITIALIZER
                                    169 	.area CABS (ABS)
