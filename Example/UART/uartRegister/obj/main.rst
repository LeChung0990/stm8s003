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
                                     12 	.globl _ADC1_Read
                                     13 	.globl _ADC1_Init
                                     14 	.globl _ADC1_DeInit
                                     15 	.globl _updateEstimate
                                     16 	.globl _SimpleKalmanFilter
                                     17 	.globl _uart1_nline
                                     18 	.globl _uart1_string
                                     19 	.globl _uart1_number
                                     20 	.globl _uart_init
                                     21 	.globl _Timer4DelayMs
                                     22 	.globl _Timer4Config
                                     23 	.globl _fabsf
                                     24 	.globl _adc_value
                                     25 	.globl __kalman_gain
                                     26 	.globl __last_estimate
                                     27 	.globl __current_estimate
                                     28 	.globl __q
                                     29 	.globl __err_estimate
                                     30 	.globl __err_measure
                                     31 ;--------------------------------------------------------
                                     32 ; ram data
                                     33 ;--------------------------------------------------------
                                     34 	.area DATA
      000001                         35 __err_measure::
      000001                         36 	.ds 4
      000005                         37 __err_estimate::
      000005                         38 	.ds 4
      000009                         39 __q::
      000009                         40 	.ds 4
                                     41 ;--------------------------------------------------------
                                     42 ; ram data
                                     43 ;--------------------------------------------------------
                                     44 	.area INITIALIZED
      00000D                         45 __current_estimate::
      00000D                         46 	.ds 4
      000011                         47 __last_estimate::
      000011                         48 	.ds 4
      000015                         49 __kalman_gain::
      000015                         50 	.ds 4
      000019                         51 _adc_value::
      000019                         52 	.ds 2
                                     53 ;--------------------------------------------------------
                                     54 ; Stack segment in internal ram
                                     55 ;--------------------------------------------------------
                                     56 	.area SSEG
      00001B                         57 __start__stack:
      00001B                         58 	.ds	1
                                     59 
                                     60 ;--------------------------------------------------------
                                     61 ; absolute external ram data
                                     62 ;--------------------------------------------------------
                                     63 	.area DABS (ABS)
                                     64 
                                     65 ; default segment ordering for linker
                                     66 	.area HOME
                                     67 	.area GSINIT
                                     68 	.area GSFINAL
                                     69 	.area CONST
                                     70 	.area INITIALIZER
                                     71 	.area CODE
                                     72 
                                     73 ;--------------------------------------------------------
                                     74 ; interrupt vector
                                     75 ;--------------------------------------------------------
                                     76 	.area HOME
      008000                         77 __interrupt_vect:
      008000 82 00 80 07             78 	int s_GSINIT ; reset
                                     79 ;--------------------------------------------------------
                                     80 ; global & static initialisations
                                     81 ;--------------------------------------------------------
                                     82 	.area HOME
                                     83 	.area GSINIT
                                     84 	.area GSFINAL
                                     85 	.area GSINIT
      008007 CD 87 BB         [ 4]   86 	call	___sdcc_external_startup
      00800A 4D               [ 1]   87 	tnz	a
      00800B 27 03            [ 1]   88 	jreq	__sdcc_init_data
      00800D CC 80 04         [ 2]   89 	jp	__sdcc_program_startup
      008010                         90 __sdcc_init_data:
                                     91 ; stm8_genXINIT() start
      008010 AE 00 0C         [ 2]   92 	ldw x, #l_DATA
      008013 27 07            [ 1]   93 	jreq	00002$
      008015                         94 00001$:
      008015 72 4F 00 00      [ 1]   95 	clr (s_DATA - 1, x)
      008019 5A               [ 2]   96 	decw x
      00801A 26 F9            [ 1]   97 	jrne	00001$
      00801C                         98 00002$:
      00801C AE 00 0E         [ 2]   99 	ldw	x, #l_INITIALIZER
      00801F 27 09            [ 1]  100 	jreq	00004$
      008021                        101 00003$:
      008021 D6 80 2E         [ 1]  102 	ld	a, (s_INITIALIZER - 1, x)
      008024 D7 00 0C         [ 1]  103 	ld	(s_INITIALIZED - 1, x), a
      008027 5A               [ 2]  104 	decw	x
      008028 26 F7            [ 1]  105 	jrne	00003$
      00802A                        106 00004$:
                                    107 ; stm8_genXINIT() end
                                    108 	.area GSFINAL
      00802A CC 80 04         [ 2]  109 	jp	__sdcc_program_startup
                                    110 ;--------------------------------------------------------
                                    111 ; Home
                                    112 ;--------------------------------------------------------
                                    113 	.area HOME
                                    114 	.area HOME
      008004                        115 __sdcc_program_startup:
      008004 CC 82 E2         [ 2]  116 	jp	_main
                                    117 ;	return from main will return to caller
                                    118 ;--------------------------------------------------------
                                    119 ; code
                                    120 ;--------------------------------------------------------
                                    121 	.area CODE
                                    122 ;	main.c: 6: void Timer4Config(void){
                                    123 ;	-----------------------------------------
                                    124 ;	 function Timer4Config
                                    125 ;	-----------------------------------------
      00803D                        126 _Timer4Config:
                                    127 ;	main.c: 7: TIM4->PSCR = (uint8_t)0x07;
      00803D 35 07 53 47      [ 1]  128 	mov	0x5347+0, #0x07
                                    129 ;	main.c: 8: TIM4->ARR = (uint8_t)125 - 1;
      008041 35 7C 53 48      [ 1]  130 	mov	0x5348+0, #0x7c
                                    131 ;	main.c: 10: TIM4->CR1 |= TIM4_CR1_CEN;
      008045 72 10 53 40      [ 1]  132 	bset	0x5340, #0
                                    133 ;	main.c: 11: }
      008049 81               [ 4]  134 	ret
                                    135 ;	main.c: 12: void Timer4DelayMs(uint16_t u16Delay){
                                    136 ;	-----------------------------------------
                                    137 ;	 function Timer4DelayMs
                                    138 ;	-----------------------------------------
      00804A                        139 _Timer4DelayMs:
                                    140 ;	main.c: 13: while(u16Delay){
      00804A                        141 00104$:
      00804A 5D               [ 2]  142 	tnzw	x
      00804B 26 01            [ 1]  143 	jrne	00130$
      00804D 81               [ 4]  144 	ret
      00804E                        145 00130$:
                                    146 ;	main.c: 14: TIM4->CNTR = (uint8_t)0;
      00804E 35 00 53 46      [ 1]  147 	mov	0x5346+0, #0x00
                                    148 ;	main.c: 16: TIM4->SR1 = (uint8_t)(~0x01);
      008052 35 FE 53 44      [ 1]  149 	mov	0x5344+0, #0xfe
                                    150 ;	main.c: 17: while((TIM4->SR1 & (uint8_t)0x01) == RESET){}
      008056                        151 00101$:
      008056 72 01 53 44 FB   [ 2]  152 	btjf	0x5344, #0, 00101$
                                    153 ;	main.c: 18: --u16Delay;
      00805B 5A               [ 2]  154 	decw	x
      00805C 20 EC            [ 2]  155 	jra	00104$
                                    156 ;	main.c: 20: }
      00805E 81               [ 4]  157 	ret
                                    158 ;	main.c: 21: void uart_init(void){
                                    159 ;	-----------------------------------------
                                    160 ;	 function uart_init
                                    161 ;	-----------------------------------------
      00805F                        162 _uart_init:
                                    163 ;	main.c: 24: UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  /* Clear the word length bit */
      00805F 72 19 52 34      [ 1]  164 	bres	0x5234, #4
                                    165 ;	main.c: 25: UART1->CR1 |= (uint8_t)0x00; /* Set the word length bit, 8 Data bits */
      008063 55 52 34 52 34   [ 1]  166 	mov	0x5234, 0x5234
                                    167 ;	main.c: 26: UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  /* Clear the STOP bits */
      008068 C6 52 36         [ 1]  168 	ld	a, 0x5236
      00806B A4 CF            [ 1]  169 	and	a, #0xcf
      00806D C7 52 36         [ 1]  170 	ld	0x5236, a
                                    171 ;	main.c: 27: UART1->CR3 |= (uint8_t)0x00; /**< One stop bit is transmitted at the end of frame*/
      008070 55 52 36 52 36   [ 1]  172 	mov	0x5236, 0x5236
                                    173 ;	main.c: 29: UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  /* Clear the Parity Control bit */
      008075 C6 52 34         [ 1]  174 	ld	a, 0x5234
      008078 A4 F9            [ 1]  175 	and	a, #0xf9
      00807A C7 52 34         [ 1]  176 	ld	0x5234, a
                                    177 ;	main.c: 30: UART1->CR1 |= (uint8_t)0x00;  /* Set No Parity Control bit */
      00807D 55 52 34 52 34   [ 1]  178 	mov	0x5234, 0x5234
                                    179 ;	main.c: 32: UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  /* Clear the LSB mantissa of UART1DIV  */
      008082 C6 52 32         [ 1]  180 	ld	a, 0x5232
      008085 35 00 52 32      [ 1]  181 	mov	0x5232+0, #0x00
                                    182 ;	main.c: 33: UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);	/* Clear the MSB mantissa of UART1DIV  */
      008089 C6 52 33         [ 1]  183 	ld	a, 0x5233
      00808C A4 0F            [ 1]  184 	and	a, #0x0f
      00808E C7 52 33         [ 1]  185 	ld	0x5233, a
                                    186 ;	main.c: 34: UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  /* Clear the Fraction bits of UART1DIV */
      008091 C6 52 33         [ 1]  187 	ld	a, 0x5233
      008094 A4 F0            [ 1]  188 	and	a, #0xf0
      008096 C7 52 33         [ 1]  189 	ld	0x5233, a
                                    190 ;	main.c: 37: UART1->BRR2 = (uint8_t)0x03;
      008099 35 03 52 33      [ 1]  191 	mov	0x5233+0, #0x03
                                    192 ;	main.c: 38: UART1->BRR1 = (uint8_t)0x68;
      00809D 35 68 52 32      [ 1]  193 	mov	0x5232+0, #0x68
                                    194 ;	main.c: 43: UART1->CR2 |= (uint8_t)UART1_CR2_TEN; /*Transmit Enable and Receive Enable*/ 
      0080A1 72 16 52 35      [ 1]  195 	bset	0x5235, #3
                                    196 ;	main.c: 44: UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
      0080A5 72 14 52 35      [ 1]  197 	bset	0x5235, #2
                                    198 ;	main.c: 45: UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); /*Sync mode Disable, SLK pin Disable*/
      0080A9 72 17 52 36      [ 1]  199 	bres	0x5236, #3
                                    200 ;	main.c: 46: UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); /* UART1 Enable */
      0080AD 72 1B 52 34      [ 1]  201 	bres	0x5234, #5
                                    202 ;	main.c: 47: }
      0080B1 81               [ 4]  203 	ret
                                    204 ;	main.c: 48: void uart1_number(int number)
                                    205 ;	-----------------------------------------
                                    206 ;	 function uart1_number
                                    207 ;	-----------------------------------------
      0080B2                        208 _uart1_number:
      0080B2 52 0A            [ 2]  209 	sub	sp, #10
      0080B4 1F 08            [ 2]  210 	ldw	(0x08, sp), x
                                    211 ;	main.c: 51: char digit[5] = "";
      0080B6 0F 03            [ 1]  212 	clr	(0x03, sp)
      0080B8 0F 04            [ 1]  213 	clr	(0x04, sp)
      0080BA 0F 05            [ 1]  214 	clr	(0x05, sp)
      0080BC 0F 06            [ 1]  215 	clr	(0x06, sp)
      0080BE 0F 07            [ 1]  216 	clr	(0x07, sp)
                                    217 ;	main.c: 52: while(number != 0)
      0080C0 0F 0A            [ 1]  218 	clr	(0x0a, sp)
      0080C2                        219 00101$:
      0080C2 1E 08            [ 2]  220 	ldw	x, (0x08, sp)
      0080C4 27 2C            [ 1]  221 	jreq	00117$
                                    222 ;	main.c: 54: digit[count] = number%10;   //lay chu so ngoai cung xxxx8;
      0080C6 5F               [ 1]  223 	clrw	x
      0080C7 7B 0A            [ 1]  224 	ld	a, (0x0a, sp)
      0080C9 97               [ 1]  225 	ld	xl, a
      0080CA 89               [ 2]  226 	pushw	x
      0080CB 96               [ 1]  227 	ldw	x, sp
      0080CC 1C 00 05         [ 2]  228 	addw	x, #5
      0080CF 72 FB 01         [ 2]  229 	addw	x, (1, sp)
      0080D2 1F 03            [ 2]  230 	ldw	(0x03, sp), x
      0080D4 5B 02            [ 2]  231 	addw	sp, #2
      0080D6 4B 0A            [ 1]  232 	push	#0x0a
      0080D8 4B 00            [ 1]  233 	push	#0x00
      0080DA 1E 0A            [ 2]  234 	ldw	x, (0x0a, sp)
      0080DC CD 89 BB         [ 4]  235 	call	__modsint
      0080DF 9F               [ 1]  236 	ld	a, xl
      0080E0 1E 01            [ 2]  237 	ldw	x, (0x01, sp)
      0080E2 F7               [ 1]  238 	ld	(x), a
                                    239 ;	main.c: 55: ++count;
      0080E3 0C 0A            [ 1]  240 	inc	(0x0a, sp)
                                    241 ;	main.c: 56: number = number/10;         //chia so number cho 10 de bo so ngoai cung xxxx
      0080E5 4B 0A            [ 1]  242 	push	#0x0a
      0080E7 4B 00            [ 1]  243 	push	#0x00
      0080E9 1E 0A            [ 2]  244 	ldw	x, (0x0a, sp)
      0080EB CD 89 D3         [ 4]  245 	call	__divsint
      0080EE 1F 08            [ 2]  246 	ldw	(0x08, sp), x
      0080F0 20 D0            [ 2]  247 	jra	00101$
                                    248 ;	main.c: 58: while (count!=0)
      0080F2                        249 00117$:
      0080F2                        250 00107$:
      0080F2 0D 0A            [ 1]  251 	tnz	(0x0a, sp)
      0080F4 27 21            [ 1]  252 	jreq	00110$
                                    253 ;	main.c: 60: UART1->DR = (digit[count - 1] + 0x30); // 0x30 = 48 ;
      0080F6 7B 0A            [ 1]  254 	ld	a, (0x0a, sp)
      0080F8 4A               [ 1]  255 	dec	a
      0080F9 6B 02            [ 1]  256 	ld	(0x02, sp), a
      0080FB 49               [ 1]  257 	rlc	a
      0080FC 4F               [ 1]  258 	clr	a
      0080FD A2 00            [ 1]  259 	sbc	a, #0x00
      0080FF 6B 01            [ 1]  260 	ld	(0x01, sp), a
      008101 96               [ 1]  261 	ldw	x, sp
      008102 1C 00 03         [ 2]  262 	addw	x, #3
      008105 72 FB 01         [ 2]  263 	addw	x, (0x01, sp)
      008108 F6               [ 1]  264 	ld	a, (x)
      008109 AB 30            [ 1]  265 	add	a, #0x30
      00810B C7 52 31         [ 1]  266 	ld	0x5231, a
                                    267 ;	main.c: 61: while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET);
      00810E                        268 00104$:
      00810E C6 52 30         [ 1]  269 	ld	a, 0x5230
      008111 2A FB            [ 1]  270 	jrpl	00104$
                                    271 ;	main.c: 62: --count;
      008113 0A 0A            [ 1]  272 	dec	(0x0a, sp)
      008115 20 DB            [ 2]  273 	jra	00107$
      008117                        274 00110$:
                                    275 ;	main.c: 64: }
      008117 5B 0A            [ 2]  276 	addw	sp, #10
      008119 81               [ 4]  277 	ret
                                    278 ;	main.c: 82: void uart1_string(const char *cy)
                                    279 ;	-----------------------------------------
                                    280 ;	 function uart1_string
                                    281 ;	-----------------------------------------
      00811A                        282 _uart1_string:
                                    283 ;	main.c: 84: while(*cy)
      00811A                        284 00104$:
      00811A F6               [ 1]  285 	ld	a, (x)
      00811B 26 01            [ 1]  286 	jrne	00130$
      00811D 81               [ 4]  287 	ret
      00811E                        288 00130$:
                                    289 ;	main.c: 86: UART1->DR = (*cy);
      00811E C7 52 31         [ 1]  290 	ld	0x5231, a
                                    291 ;	main.c: 87: while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET){}
      008121                        292 00101$:
      008121 C6 52 30         [ 1]  293 	ld	a, 0x5230
      008124 2A FB            [ 1]  294 	jrpl	00101$
                                    295 ;	main.c: 88: cy++;
      008126 5C               [ 1]  296 	incw	x
      008127 20 F1            [ 2]  297 	jra	00104$
                                    298 ;	main.c: 90: }
      008129 81               [ 4]  299 	ret
                                    300 ;	main.c: 91: void uart1_nline(void)
                                    301 ;	-----------------------------------------
                                    302 ;	 function uart1_nline
                                    303 ;	-----------------------------------------
      00812A                        304 _uart1_nline:
                                    305 ;	main.c: 93: UART1->DR = (0x0a);
      00812A 35 0A 52 31      [ 1]  306 	mov	0x5231+0, #0x0a
                                    307 ;	main.c: 94: while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET);
      00812E                        308 00101$:
      00812E C6 52 30         [ 1]  309 	ld	a, 0x5230
      008131 2A FB            [ 1]  310 	jrpl	00101$
                                    311 ;	main.c: 95: }
      008133 81               [ 4]  312 	ret
                                    313 ;	main.c: 103: void SimpleKalmanFilter(float mea_e, float est_e, float q)
                                    314 ;	-----------------------------------------
                                    315 ;	 function SimpleKalmanFilter
                                    316 ;	-----------------------------------------
      008134                        317 _SimpleKalmanFilter:
                                    318 ;	main.c: 105: _err_measure=mea_e;
      008134 1E 05            [ 2]  319 	ldw	x, (0x05, sp)
      008136 16 03            [ 2]  320 	ldw	y, (0x03, sp)
      008138 CF 00 03         [ 2]  321 	ldw	__err_measure+2, x
      00813B 90 CF 00 01      [ 2]  322 	ldw	__err_measure+0, y
                                    323 ;	main.c: 106: _err_estimate=est_e;
      00813F 1E 09            [ 2]  324 	ldw	x, (0x09, sp)
      008141 16 07            [ 2]  325 	ldw	y, (0x07, sp)
      008143 CF 00 07         [ 2]  326 	ldw	__err_estimate+2, x
      008146 90 CF 00 05      [ 2]  327 	ldw	__err_estimate+0, y
                                    328 ;	main.c: 107: _q = q;
      00814A 1E 0D            [ 2]  329 	ldw	x, (0x0d, sp)
      00814C 16 0B            [ 2]  330 	ldw	y, (0x0b, sp)
      00814E CF 00 0B         [ 2]  331 	ldw	__q+2, x
      008151 90 CF 00 09      [ 2]  332 	ldw	__q+0, y
                                    333 ;	main.c: 108: }
      008155 1E 01            [ 2]  334 	ldw	x, (1, sp)
      008157 5B 0E            [ 2]  335 	addw	sp, #14
      008159 FC               [ 2]  336 	jp	(x)
                                    337 ;	main.c: 110: float updateEstimate(float mea)
                                    338 ;	-----------------------------------------
                                    339 ;	 function updateEstimate
                                    340 ;	-----------------------------------------
      00815A                        341 _updateEstimate:
      00815A 52 04            [ 2]  342 	sub	sp, #4
                                    343 ;	main.c: 112: _kalman_gain = _err_estimate/(_err_estimate + _err_measure);
      00815C 3B 00 04         [ 1]  344 	push	__err_measure+3
      00815F 3B 00 03         [ 1]  345 	push	__err_measure+2
      008162 3B 00 02         [ 1]  346 	push	__err_measure+1
      008165 3B 00 01         [ 1]  347 	push	__err_measure+0
      008168 3B 00 08         [ 1]  348 	push	__err_estimate+3
      00816B 3B 00 07         [ 1]  349 	push	__err_estimate+2
      00816E 3B 00 06         [ 1]  350 	push	__err_estimate+1
      008171 3B 00 05         [ 1]  351 	push	__err_estimate+0
      008174 CD 85 22         [ 4]  352 	call	___fsadd
      008177 89               [ 2]  353 	pushw	x
      008178 90 89            [ 2]  354 	pushw	y
      00817A 3B 00 08         [ 1]  355 	push	__err_estimate+3
      00817D 3B 00 07         [ 1]  356 	push	__err_estimate+2
      008180 3B 00 06         [ 1]  357 	push	__err_estimate+1
      008183 3B 00 05         [ 1]  358 	push	__err_estimate+0
      008186 CD 89 42         [ 4]  359 	call	___fsdiv
      008189 CF 00 17         [ 2]  360 	ldw	__kalman_gain+2, x
      00818C 90 CF 00 15      [ 2]  361 	ldw	__kalman_gain+0, y
                                    362 ;	main.c: 113: _current_estimate = _last_estimate + _kalman_gain * (mea - _last_estimate);
      008190 3B 00 14         [ 1]  363 	push	__last_estimate+3
      008193 3B 00 13         [ 1]  364 	push	__last_estimate+2
      008196 3B 00 12         [ 1]  365 	push	__last_estimate+1
      008199 3B 00 11         [ 1]  366 	push	__last_estimate+0
      00819C 1E 0D            [ 2]  367 	ldw	x, (0x0d, sp)
      00819E 89               [ 2]  368 	pushw	x
      00819F 1E 0D            [ 2]  369 	ldw	x, (0x0d, sp)
      0081A1 89               [ 2]  370 	pushw	x
      0081A2 CD 83 3F         [ 4]  371 	call	___fssub
      0081A5 89               [ 2]  372 	pushw	x
      0081A6 90 89            [ 2]  373 	pushw	y
      0081A8 3B 00 18         [ 1]  374 	push	__kalman_gain+3
      0081AB 3B 00 17         [ 1]  375 	push	__kalman_gain+2
      0081AE 3B 00 16         [ 1]  376 	push	__kalman_gain+1
      0081B1 3B 00 15         [ 1]  377 	push	__kalman_gain+0
      0081B4 CD 83 68         [ 4]  378 	call	___fsmul
      0081B7 89               [ 2]  379 	pushw	x
      0081B8 90 89            [ 2]  380 	pushw	y
      0081BA 3B 00 14         [ 1]  381 	push	__last_estimate+3
      0081BD 3B 00 13         [ 1]  382 	push	__last_estimate+2
      0081C0 3B 00 12         [ 1]  383 	push	__last_estimate+1
      0081C3 3B 00 11         [ 1]  384 	push	__last_estimate+0
      0081C6 CD 85 22         [ 4]  385 	call	___fsadd
      0081C9 CF 00 0F         [ 2]  386 	ldw	__current_estimate+2, x
      0081CC 90 CF 00 0D      [ 2]  387 	ldw	__current_estimate+0, y
                                    388 ;	main.c: 114: _err_estimate =  (1.0 - _kalman_gain)*_err_estimate + fabsf(_last_estimate-_current_estimate)*_q;
      0081D0 3B 00 18         [ 1]  389 	push	__kalman_gain+3
      0081D3 3B 00 17         [ 1]  390 	push	__kalman_gain+2
      0081D6 3B 00 16         [ 1]  391 	push	__kalman_gain+1
      0081D9 3B 00 15         [ 1]  392 	push	__kalman_gain+0
      0081DC 5F               [ 1]  393 	clrw	x
      0081DD 89               [ 2]  394 	pushw	x
      0081DE 4B 80            [ 1]  395 	push	#0x80
      0081E0 4B 3F            [ 1]  396 	push	#0x3f
      0081E2 CD 83 3F         [ 4]  397 	call	___fssub
      0081E5 3B 00 08         [ 1]  398 	push	__err_estimate+3
      0081E8 3B 00 07         [ 1]  399 	push	__err_estimate+2
      0081EB 3B 00 06         [ 1]  400 	push	__err_estimate+1
      0081EE 3B 00 05         [ 1]  401 	push	__err_estimate+0
      0081F1 89               [ 2]  402 	pushw	x
      0081F2 90 89            [ 2]  403 	pushw	y
      0081F4 CD 83 68         [ 4]  404 	call	___fsmul
      0081F7 1F 03            [ 2]  405 	ldw	(0x03, sp), x
      0081F9 17 01            [ 2]  406 	ldw	(0x01, sp), y
      0081FB 3B 00 10         [ 1]  407 	push	__current_estimate+3
      0081FE 3B 00 0F         [ 1]  408 	push	__current_estimate+2
      008201 3B 00 0E         [ 1]  409 	push	__current_estimate+1
      008204 3B 00 0D         [ 1]  410 	push	__current_estimate+0
      008207 3B 00 14         [ 1]  411 	push	__last_estimate+3
      00820A 3B 00 13         [ 1]  412 	push	__last_estimate+2
      00820D 3B 00 12         [ 1]  413 	push	__last_estimate+1
      008210 3B 00 11         [ 1]  414 	push	__last_estimate+0
      008213 CD 83 3F         [ 4]  415 	call	___fssub
      008216 89               [ 2]  416 	pushw	x
      008217 90 89            [ 2]  417 	pushw	y
      008219 CD 87 4D         [ 4]  418 	call	_fabsf
      00821C 3B 00 0C         [ 1]  419 	push	__q+3
      00821F 3B 00 0B         [ 1]  420 	push	__q+2
      008222 3B 00 0A         [ 1]  421 	push	__q+1
      008225 3B 00 09         [ 1]  422 	push	__q+0
      008228 89               [ 2]  423 	pushw	x
      008229 90 89            [ 2]  424 	pushw	y
      00822B CD 83 68         [ 4]  425 	call	___fsmul
      00822E 89               [ 2]  426 	pushw	x
      00822F 90 89            [ 2]  427 	pushw	y
      008231 1E 07            [ 2]  428 	ldw	x, (0x07, sp)
      008233 89               [ 2]  429 	pushw	x
      008234 1E 07            [ 2]  430 	ldw	x, (0x07, sp)
      008236 89               [ 2]  431 	pushw	x
      008237 CD 85 22         [ 4]  432 	call	___fsadd
      00823A CF 00 07         [ 2]  433 	ldw	__err_estimate+2, x
      00823D 90 CF 00 05      [ 2]  434 	ldw	__err_estimate+0, y
                                    435 ;	main.c: 115: _last_estimate=_current_estimate;
      008241 CE 00 0F         [ 2]  436 	ldw	x, __current_estimate+2
      008244 90 CE 00 0D      [ 2]  437 	ldw	y, __current_estimate+0
      008248 CF 00 13         [ 2]  438 	ldw	__last_estimate+2, x
      00824B 90 CF 00 11      [ 2]  439 	ldw	__last_estimate+0, y
                                    440 ;	main.c: 117: return _current_estimate;
      00824F CE 00 0F         [ 2]  441 	ldw	x, __current_estimate+2
      008252 90 CE 00 0D      [ 2]  442 	ldw	y, __current_estimate+0
                                    443 ;	main.c: 118: }
      008256 5B 04            [ 2]  444 	addw	sp, #4
      008258 89               [ 2]  445 	pushw	x
      008259 1E 03            [ 2]  446 	ldw	x, (3, sp)
      00825B 1F 07            [ 2]  447 	ldw	(7, sp), x
      00825D 85               [ 2]  448 	popw	x
      00825E 5B 04            [ 2]  449 	addw	sp, #4
      008260 81               [ 4]  450 	ret
                                    451 ;	main.c: 119: void ADC1_DeInit(void){
                                    452 ;	-----------------------------------------
                                    453 ;	 function ADC1_DeInit
                                    454 ;	-----------------------------------------
      008261                        455 _ADC1_DeInit:
                                    456 ;	main.c: 120: ADC1->CSR  = ADC1_CSR_RESET_VALUE;
      008261 35 00 54 00      [ 1]  457 	mov	0x5400+0, #0x00
                                    458 ;	main.c: 121: ADC1->CR1  = ADC1_CR1_RESET_VALUE;
      008265 35 00 54 01      [ 1]  459 	mov	0x5401+0, #0x00
                                    460 ;	main.c: 122: ADC1->CR2  = ADC1_CR2_RESET_VALUE;
      008269 35 00 54 02      [ 1]  461 	mov	0x5402+0, #0x00
                                    462 ;	main.c: 123: ADC1->CR3  = ADC1_CR3_RESET_VALUE;
      00826D 35 00 54 03      [ 1]  463 	mov	0x5403+0, #0x00
                                    464 ;	main.c: 124: ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
      008271 35 00 54 06      [ 1]  465 	mov	0x5406+0, #0x00
                                    466 ;	main.c: 125: ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
      008275 35 00 54 07      [ 1]  467 	mov	0x5407+0, #0x00
                                    468 ;	main.c: 126: ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
      008279 35 FF 54 08      [ 1]  469 	mov	0x5408+0, #0xff
                                    470 ;	main.c: 127: ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
      00827D 35 03 54 09      [ 1]  471 	mov	0x5409+0, #0x03
                                    472 ;	main.c: 128: ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
      008281 35 00 54 0A      [ 1]  473 	mov	0x540a+0, #0x00
                                    474 ;	main.c: 129: ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
      008285 35 00 54 0B      [ 1]  475 	mov	0x540b+0, #0x00
                                    476 ;	main.c: 130: ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
      008289 35 00 54 0E      [ 1]  477 	mov	0x540e+0, #0x00
                                    478 ;	main.c: 131: ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
      00828D 35 00 54 0F      [ 1]  479 	mov	0x540f+0, #0x00
                                    480 ;	main.c: 132: }
      008291 81               [ 4]  481 	ret
                                    482 ;	main.c: 133: void ADC1_Init(void){
                                    483 ;	-----------------------------------------
                                    484 ;	 function ADC1_Init
                                    485 ;	-----------------------------------------
      008292                        486 _ADC1_Init:
                                    487 ;	main.c: 135: ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
      008292 C6 54 00         [ 1]  488 	ld	a, 0x5400
      008295 A4 F0            [ 1]  489 	and	a, #0xf0
      008297 C7 54 00         [ 1]  490 	ld	0x5400, a
                                    491 ;	main.c: 137: ADC1->CSR |= (uint8_t)(0x04);
      00829A 72 14 54 00      [ 1]  492 	bset	0x5400, #2
                                    493 ;	main.c: 140: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
      00829E 72 17 54 02      [ 1]  494 	bres	0x5402, #3
                                    495 ;	main.c: 142: ADC1->CR2 |= (uint8_t)(0x08);
      0082A2 72 16 54 02      [ 1]  496 	bset	0x5402, #3
                                    497 ;	main.c: 145: ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
      0082A6 72 13 54 01      [ 1]  498 	bres	0x5401, #1
                                    499 ;	main.c: 148: ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
      0082AA C6 54 01         [ 1]  500 	ld	a, 0x5401
      0082AD A4 8F            [ 1]  501 	and	a, #0x8f
      0082AF C7 54 01         [ 1]  502 	ld	0x5401, a
                                    503 ;	main.c: 150: ADC1->CR1 |= (uint8_t)0x70;  
      0082B2 C6 54 01         [ 1]  504 	ld	a, 0x5401
      0082B5 AA 70            [ 1]  505 	or	a, #0x70
      0082B7 C7 54 01         [ 1]  506 	ld	0x5401, a
                                    507 ;	main.c: 152: ADC1->CR1 |= ADC1_CR1_ADON;
      0082BA 72 10 54 01      [ 1]  508 	bset	0x5401, #0
                                    509 ;	main.c: 154: }
      0082BE 81               [ 4]  510 	ret
                                    511 ;	main.c: 155: uint16_t ADC1_Read(void){
                                    512 ;	-----------------------------------------
                                    513 ;	 function ADC1_Read
                                    514 ;	-----------------------------------------
      0082BF                        515 _ADC1_Read:
      0082BF 52 04            [ 2]  516 	sub	sp, #4
                                    517 ;	main.c: 157: ADC1->CR1 |= ADC1_CR1_ADON;
      0082C1 72 10 54 01      [ 1]  518 	bset	0x5401, #0
                                    519 ;	main.c: 159: while( (ADC1->CSR & ADC1_CSR_EOC) == RESET){}    
      0082C5                        520 00101$:
      0082C5 C6 54 00         [ 1]  521 	ld	a, 0x5400
      0082C8 2A FB            [ 1]  522 	jrpl	00101$
                                    523 ;	main.c: 161: ADC1->CSR &= (uint8_t) (~ADC1_CSR_EOC);
      0082CA 72 1F 54 00      [ 1]  524 	bres	0x5400, #7
                                    525 ;	main.c: 166: templ = ADC1->DRL;
      0082CE C6 54 05         [ 1]  526 	ld	a, 0x5405
      0082D1 97               [ 1]  527 	ld	xl, a
                                    528 ;	main.c: 168: temph = ADC1->DRH;
      0082D2 C6 54 04         [ 1]  529 	ld	a, 0x5404
                                    530 ;	main.c: 169: temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
      0082D5 0F 02            [ 1]  531 	clr	(0x02, sp)
      0082D7 0F 03            [ 1]  532 	clr	(0x03, sp)
      0082D9 1A 03            [ 1]  533 	or	a, (0x03, sp)
      0082DB 01               [ 1]  534 	rrwa	x
      0082DC 1A 02            [ 1]  535 	or	a, (0x02, sp)
      0082DE 97               [ 1]  536 	ld	xl, a
                                    537 ;	main.c: 170: return ((uint16_t)temph);
                                    538 ;	main.c: 171: }
      0082DF 5B 04            [ 2]  539 	addw	sp, #4
      0082E1 81               [ 4]  540 	ret
                                    541 ;	main.c: 175: void main(void)
                                    542 ;	-----------------------------------------
                                    543 ;	 function main
                                    544 ;	-----------------------------------------
      0082E2                        545 _main:
                                    546 ;	main.c: 178: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      0082E2 C6 50 C6         [ 1]  547 	ld	a, 0x50c6
      0082E5 A4 E7            [ 1]  548 	and	a, #0xe7
      0082E7 C7 50 C6         [ 1]  549 	ld	0x50c6, a
                                    550 ;	main.c: 179: CLK->CKDIVR |= (uint8_t)0x00;
      0082EA 55 50 C6 50 C6   [ 1]  551 	mov	0x50c6, 0x50c6
                                    552 ;	main.c: 180: Timer4Config();
      0082EF CD 80 3D         [ 4]  553 	call	_Timer4Config
                                    554 ;	main.c: 181: uart_init();
      0082F2 CD 80 5F         [ 4]  555 	call	_uart_init
                                    556 ;	main.c: 182: SimpleKalmanFilter(10, 1, 0.05);
      0082F5 4B CD            [ 1]  557 	push	#0xcd
      0082F7 4B CC            [ 1]  558 	push	#0xcc
      0082F9 4B 4C            [ 1]  559 	push	#0x4c
      0082FB 4B 3D            [ 1]  560 	push	#0x3d
      0082FD 5F               [ 1]  561 	clrw	x
      0082FE 89               [ 2]  562 	pushw	x
      0082FF 4B 80            [ 1]  563 	push	#0x80
      008301 4B 3F            [ 1]  564 	push	#0x3f
      008303 5F               [ 1]  565 	clrw	x
      008304 89               [ 2]  566 	pushw	x
      008305 4B 20            [ 1]  567 	push	#0x20
      008307 4B 41            [ 1]  568 	push	#0x41
      008309 CD 81 34         [ 4]  569 	call	_SimpleKalmanFilter
                                    570 ;	main.c: 184: ADC1_DeInit();
      00830C CD 82 61         [ 4]  571 	call	_ADC1_DeInit
                                    572 ;	main.c: 185: ADC1_Init();
      00830F CD 82 92         [ 4]  573 	call	_ADC1_Init
                                    574 ;	main.c: 186: while(1) 
      008312                        575 00102$:
                                    576 ;	main.c: 192: adc_value = ADC1_Read();
      008312 CD 82 BF         [ 4]  577 	call	_ADC1_Read
      008315 CF 00 19         [ 2]  578 	ldw	_adc_value+0, x
                                    579 ;	main.c: 194: uart1_number(adc_value);
      008318 CE 00 19         [ 2]  580 	ldw	x, _adc_value+0
      00831B CD 80 B2         [ 4]  581 	call	_uart1_number
                                    582 ;	main.c: 195: uart1_string(",");
      00831E AE 80 2D         [ 2]  583 	ldw	x, #(___str_1+0)
      008321 CD 81 1A         [ 4]  584 	call	_uart1_string
                                    585 ;	main.c: 196: a_kalman =(int) updateEstimate(adc_value);
      008324 CE 00 19         [ 2]  586 	ldw	x, _adc_value+0
      008327 CD 87 B0         [ 4]  587 	call	___uint2fs
      00832A 89               [ 2]  588 	pushw	x
      00832B 90 89            [ 2]  589 	pushw	y
      00832D CD 81 5A         [ 4]  590 	call	_updateEstimate
      008330 89               [ 2]  591 	pushw	x
      008331 90 89            [ 2]  592 	pushw	y
      008333 CD 87 70         [ 4]  593 	call	___fs2sint
                                    594 ;	main.c: 197: uart1_number(a_kalman);
      008336 CD 80 B2         [ 4]  595 	call	_uart1_number
                                    596 ;	main.c: 201: uart1_nline();
      008339 CD 81 2A         [ 4]  597 	call	_uart1_nline
      00833C 20 D4            [ 2]  598 	jra	00102$
                                    599 ;	main.c: 204: }
      00833E 81               [ 4]  600 	ret
                                    601 	.area CODE
                                    602 	.area CONST
                                    603 	.area CONST
      00802D                        604 ___str_1:
      00802D 2C                     605 	.ascii ","
      00802E 00                     606 	.db 0x00
                                    607 	.area CODE
                                    608 	.area INITIALIZER
      00802F                        609 __xinit___current_estimate:
      00802F 00 00 00 00            610 	.byte #0x00, #0x00, #0x00, #0x00	;  0.000000e+00
      008033                        611 __xinit___last_estimate:
      008033 00 00 00 00            612 	.byte #0x00, #0x00, #0x00, #0x00	;  0.000000e+00
      008037                        613 __xinit___kalman_gain:
      008037 00 00 00 00            614 	.byte #0x00, #0x00, #0x00, #0x00	;  0.000000e+00
      00803B                        615 __xinit__adc_value:
      00803B 00 00                  616 	.dw #0x0000
                                    617 	.area CABS (ABS)
