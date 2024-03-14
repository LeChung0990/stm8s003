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
                                     11 	.globl _TIM4_UPD_OVF_IRQHandler
                                     12 	.globl _main
                                     13 	.globl _Timer4DelayMs
                                     14 	.globl _Timer4Config
                                     15 	.globl _TIM4_ClearFlag
                                     16 	.globl _TIM4_SetCounter
                                     17 	.globl _TIM4_ITConfig
                                     18 	.globl _TIM4_Cmd
                                     19 	.globl _TIM4_TimeBaseInit
                                     20 	.globl _GPIO_WriteReverse
                                     21 	.globl _GPIO_Init
                                     22 	.globl _GPIO_DeInit
                                     23 	.globl _CLK_HSIPrescalerConfig
                                     24 	.globl _i
                                     25 ;--------------------------------------------------------
                                     26 ; ram data
                                     27 ;--------------------------------------------------------
                                     28 	.area DATA
                                     29 ;--------------------------------------------------------
                                     30 ; ram data
                                     31 ;--------------------------------------------------------
                                     32 	.area INITIALIZED
      000001                         33 _i::
      000001                         34 	.ds 2
                                     35 ;--------------------------------------------------------
                                     36 ; Stack segment in internal ram
                                     37 ;--------------------------------------------------------
                                     38 	.area SSEG
      000003                         39 __start__stack:
      000003                         40 	.ds	1
                                     41 
                                     42 ;--------------------------------------------------------
                                     43 ; absolute external ram data
                                     44 ;--------------------------------------------------------
                                     45 	.area DABS (ABS)
                                     46 
                                     47 ; default segment ordering for linker
                                     48 	.area HOME
                                     49 	.area GSINIT
                                     50 	.area GSFINAL
                                     51 	.area CONST
                                     52 	.area INITIALIZER
                                     53 	.area CODE
                                     54 
                                     55 ;--------------------------------------------------------
                                     56 ; interrupt vector
                                     57 ;--------------------------------------------------------
                                     58 	.area HOME
      008000                         59 __interrupt_vect:
      008000 82 00 80 6B             60 	int s_GSINIT ; reset
      008004 82 00 00 00             61 	int 0x000000 ; trap
      008008 82 00 00 00             62 	int 0x000000 ; int0
      00800C 82 00 00 00             63 	int 0x000000 ; int1
      008010 82 00 00 00             64 	int 0x000000 ; int2
      008014 82 00 00 00             65 	int 0x000000 ; int3
      008018 82 00 00 00             66 	int 0x000000 ; int4
      00801C 82 00 00 00             67 	int 0x000000 ; int5
      008020 82 00 00 00             68 	int 0x000000 ; int6
      008024 82 00 00 00             69 	int 0x000000 ; int7
      008028 82 00 00 00             70 	int 0x000000 ; int8
      00802C 82 00 00 00             71 	int 0x000000 ; int9
      008030 82 00 00 00             72 	int 0x000000 ; int10
      008034 82 00 00 00             73 	int 0x000000 ; int11
      008038 82 00 00 00             74 	int 0x000000 ; int12
      00803C 82 00 00 00             75 	int 0x000000 ; int13
      008040 82 00 00 00             76 	int 0x000000 ; int14
      008044 82 00 00 00             77 	int 0x000000 ; int15
      008048 82 00 00 00             78 	int 0x000000 ; int16
      00804C 82 00 00 00             79 	int 0x000000 ; int17
      008050 82 00 00 00             80 	int 0x000000 ; int18
      008054 82 00 00 00             81 	int 0x000000 ; int19
      008058 82 00 00 00             82 	int 0x000000 ; int20
      00805C 82 00 00 00             83 	int 0x000000 ; int21
      008060 82 00 00 00             84 	int 0x000000 ; int22
      008064 82 00 80 F5             85 	int _TIM4_UPD_OVF_IRQHandler ; int23
                                     86 ;--------------------------------------------------------
                                     87 ; global & static initialisations
                                     88 ;--------------------------------------------------------
                                     89 	.area HOME
                                     90 	.area GSINIT
                                     91 	.area GSFINAL
                                     92 	.area GSINIT
      00806B CD 87 74         [ 4]   93 	call	___sdcc_external_startup
      00806E 4D               [ 1]   94 	tnz	a
      00806F 27 03            [ 1]   95 	jreq	__sdcc_init_data
      008071 CC 80 68         [ 2]   96 	jp	__sdcc_program_startup
      008074                         97 __sdcc_init_data:
                                     98 ; stm8_genXINIT() start
      008074 AE 00 00         [ 2]   99 	ldw x, #l_DATA
      008077 27 07            [ 1]  100 	jreq	00002$
      008079                        101 00001$:
      008079 72 4F 00 00      [ 1]  102 	clr (s_DATA - 1, x)
      00807D 5A               [ 2]  103 	decw x
      00807E 26 F9            [ 1]  104 	jrne	00001$
      008080                        105 00002$:
      008080 AE 00 02         [ 2]  106 	ldw	x, #l_INITIALIZER
      008083 27 09            [ 1]  107 	jreq	00004$
      008085                        108 00003$:
      008085 D6 80 9C         [ 1]  109 	ld	a, (s_INITIALIZER - 1, x)
      008088 D7 00 00         [ 1]  110 	ld	(s_INITIALIZED - 1, x), a
      00808B 5A               [ 2]  111 	decw	x
      00808C 26 F7            [ 1]  112 	jrne	00003$
      00808E                        113 00004$:
                                    114 ; stm8_genXINIT() end
                                    115 	.area GSFINAL
      00808E CC 80 68         [ 2]  116 	jp	__sdcc_program_startup
                                    117 ;--------------------------------------------------------
                                    118 ; Home
                                    119 ;--------------------------------------------------------
                                    120 	.area HOME
                                    121 	.area HOME
      008068                        122 __sdcc_program_startup:
      008068 CC 80 C1         [ 2]  123 	jp	_main
                                    124 ;	return from main will return to caller
                                    125 ;--------------------------------------------------------
                                    126 ; code
                                    127 ;--------------------------------------------------------
                                    128 	.area CODE
                                    129 ;	main.c: 6: void Timer4Config(void){
                                    130 ;	-----------------------------------------
                                    131 ;	 function Timer4Config
                                    132 ;	-----------------------------------------
      00809F                        133 _Timer4Config:
                                    134 ;	main.c: 7: TIM4->PSCR = (uint8_t)TIM4_PRESCALER_128;
      00809F 35 07 53 47      [ 1]  135 	mov	0x5347+0, #0x07
                                    136 ;	main.c: 8: TIM4->ARR = (uint8_t)125 - 1;
      0080A3 35 7C 53 48      [ 1]  137 	mov	0x5348+0, #0x7c
                                    138 ;	main.c: 10: TIM4->CR1 |= TIM4_CR1_CEN;
      0080A7 72 10 53 40      [ 1]  139 	bset	0x5340, #0
                                    140 ;	main.c: 11: }
      0080AB 81               [ 4]  141 	ret
                                    142 ;	main.c: 12: void Timer4DelayMs(uint16_t u16Delay){
                                    143 ;	-----------------------------------------
                                    144 ;	 function Timer4DelayMs
                                    145 ;	-----------------------------------------
      0080AC                        146 _Timer4DelayMs:
                                    147 ;	main.c: 13: while(u16Delay){
      0080AC                        148 00104$:
      0080AC 5D               [ 2]  149 	tnzw	x
      0080AD 26 01            [ 1]  150 	jrne	00130$
      0080AF 81               [ 4]  151 	ret
      0080B0                        152 00130$:
                                    153 ;	main.c: 14: TIM4->CNTR = (uint8_t)0;
      0080B0 35 00 53 46      [ 1]  154 	mov	0x5346+0, #0x00
                                    155 ;	main.c: 16: TIM4->SR1 = (uint8_t)(~0x01);
      0080B4 35 FE 53 44      [ 1]  156 	mov	0x5344+0, #0xfe
                                    157 ;	main.c: 17: while((TIM4->SR1 & (uint8_t)0x01) == RESET){}
      0080B8                        158 00101$:
      0080B8 72 01 53 44 FB   [ 2]  159 	btjf	0x5344, #0, 00101$
                                    160 ;	main.c: 18: --u16Delay;
      0080BD 5A               [ 2]  161 	decw	x
      0080BE 20 EC            [ 2]  162 	jra	00104$
                                    163 ;	main.c: 20: }
      0080C0 81               [ 4]  164 	ret
                                    165 ;	main.c: 22: void main (void)
                                    166 ;	-----------------------------------------
                                    167 ;	 function main
                                    168 ;	-----------------------------------------
      0080C1                        169 _main:
                                    170 ;	main.c: 24: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
      0080C1 4F               [ 1]  171 	clr	a
      0080C2 CD 84 D4         [ 4]  172 	call	_CLK_HSIPrescalerConfig
                                    173 ;	main.c: 25: GPIO_DeInit(GPIOD);
      0080C5 AE 50 0F         [ 2]  174 	ldw	x, #0x500f
      0080C8 CD 81 19         [ 4]  175 	call	_GPIO_DeInit
                                    176 ;	main.c: 26: GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_HIGH_FAST);
      0080CB 4B F0            [ 1]  177 	push	#0xf0
      0080CD A6 08            [ 1]  178 	ld	a, #0x08
      0080CF AE 50 0F         [ 2]  179 	ldw	x, #0x500f
      0080D2 CD 81 27         [ 4]  180 	call	_GPIO_Init
                                    181 ;	main.c: 29: TIM4_TimeBaseInit(TIM4_PRESCALER_128, 125 - 1);
      0080D5 4B 7C            [ 1]  182 	push	#0x7c
      0080D7 A6 07            [ 1]  183 	ld	a, #0x07
      0080D9 CD 82 04         [ 4]  184 	call	_TIM4_TimeBaseInit
                                    185 ;	main.c: 30: TIM4_SetCounter(0);
      0080DC 4F               [ 1]  186 	clr	a
      0080DD CD 82 B5         [ 4]  187 	call	_TIM4_SetCounter
                                    188 ;	main.c: 31: TIM4_ClearFlag(TIM4_FLAG_UPDATE);
      0080E0 A6 01            [ 1]  189 	ld	a, #0x01
      0080E2 CD 82 D5         [ 4]  190 	call	_TIM4_ClearFlag
                                    191 ;	main.c: 32: TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
      0080E5 4B 01            [ 1]  192 	push	#0x01
      0080E7 A6 01            [ 1]  193 	ld	a, #0x01
      0080E9 CD 82 28         [ 4]  194 	call	_TIM4_ITConfig
                                    195 ;	main.c: 33: enableInterrupts();
      0080EC 9A               [ 1]  196 	rim
                                    197 ;	main.c: 34: TIM4_Cmd(ENABLE);
      0080ED A6 01            [ 1]  198 	ld	a, #0x01
      0080EF CD 82 10         [ 4]  199 	call	_TIM4_Cmd
                                    200 ;	main.c: 36: while(1) 
      0080F2                        201 00102$:
      0080F2 20 FE            [ 2]  202 	jra	00102$
                                    203 ;	main.c: 39: }
      0080F4 81               [ 4]  204 	ret
                                    205 ;	main.c: 42: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
                                    206 ;	-----------------------------------------
                                    207 ;	 function TIM4_UPD_OVF_IRQHandler
                                    208 ;	-----------------------------------------
      0080F5                        209 _TIM4_UPD_OVF_IRQHandler:
      0080F5 4F               [ 1]  210 	clr	a
      0080F6 62               [ 2]  211 	div	x, a
                                    212 ;	main.c: 44: TIM4_SetCounter(0);
      0080F7 4F               [ 1]  213 	clr	a
      0080F8 CD 82 B5         [ 4]  214 	call	_TIM4_SetCounter
                                    215 ;	main.c: 45: TIM4_ClearFlag(TIM4_FLAG_UPDATE);
      0080FB A6 01            [ 1]  216 	ld	a, #0x01
      0080FD CD 82 D5         [ 4]  217 	call	_TIM4_ClearFlag
                                    218 ;	main.c: 46: i++;
      008100 CE 00 01         [ 2]  219 	ldw	x, _i+0
      008103 5C               [ 1]  220 	incw	x
                                    221 ;	main.c: 47: if(i>500)
      008104 CF 00 01         [ 2]  222 	ldw	_i+0, x
      008107 A3 01 F4         [ 2]  223 	cpw	x, #0x01f4
      00810A 23 0C            [ 2]  224 	jrule	00103$
                                    225 ;	main.c: 49: GPIO_WriteReverse(GPIOD, GPIO_PIN_3);
      00810C A6 08            [ 1]  226 	ld	a, #0x08
      00810E AE 50 0F         [ 2]  227 	ldw	x, #0x500f
      008111 CD 81 B6         [ 4]  228 	call	_GPIO_WriteReverse
                                    229 ;	main.c: 50: i=0;
      008114 5F               [ 1]  230 	clrw	x
      008115 CF 00 01         [ 2]  231 	ldw	_i+0, x
      008118                        232 00103$:
                                    233 ;	main.c: 52: }  
      008118 80               [11]  234 	iret
                                    235 	.area CODE
                                    236 	.area CONST
                                    237 	.area INITIALIZER
      00809D                        238 __xinit__i:
      00809D 00 00                  239 	.dw #0x0000
                                    240 	.area CABS (ABS)
