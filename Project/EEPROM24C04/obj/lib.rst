                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.3.0 #14184 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module lib
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _Timer4Config
                                     12 	.globl _Timer4DelayMs
                                     13 	.globl _I2C_init
                                     14 	.globl _I2C_start
                                     15 	.globl _I2C_stop
                                     16 	.globl _I2C_address
                                     17 	.globl _I2C_write
                                     18 	.globl _uart_init
                                     19 	.globl _uart1_number
                                     20 	.globl _uart1_string
                                     21 	.globl _uart1_nline
                                     22 ;--------------------------------------------------------
                                     23 ; ram data
                                     24 ;--------------------------------------------------------
                                     25 	.area DATA
                                     26 ;--------------------------------------------------------
                                     27 ; ram data
                                     28 ;--------------------------------------------------------
                                     29 	.area INITIALIZED
                                     30 ;--------------------------------------------------------
                                     31 ; absolute external ram data
                                     32 ;--------------------------------------------------------
                                     33 	.area DABS (ABS)
                                     34 
                                     35 ; default segment ordering for linker
                                     36 	.area HOME
                                     37 	.area GSINIT
                                     38 	.area GSFINAL
                                     39 	.area CONST
                                     40 	.area INITIALIZER
                                     41 	.area CODE
                                     42 
                                     43 ;--------------------------------------------------------
                                     44 ; global & static initialisations
                                     45 ;--------------------------------------------------------
                                     46 	.area HOME
                                     47 	.area GSINIT
                                     48 	.area GSFINAL
                                     49 	.area GSINIT
                                     50 ;--------------------------------------------------------
                                     51 ; Home
                                     52 ;--------------------------------------------------------
                                     53 	.area HOME
                                     54 	.area HOME
                                     55 ;--------------------------------------------------------
                                     56 ; code
                                     57 ;--------------------------------------------------------
                                     58 	.area CODE
                                     59 ;	lib/src/lib.c: 3: void Timer4Config(void){
                                     60 ;	-----------------------------------------
                                     61 ;	 function Timer4Config
                                     62 ;	-----------------------------------------
      0085F5                         63 _Timer4Config:
                                     64 ;	lib/src/lib.c: 4: TIM4->PSCR = (uint8_t)0x07;
      0085F5 35 07 53 47      [ 1]   65 	mov	0x5347+0, #0x07
                                     66 ;	lib/src/lib.c: 5: TIM4->ARR = (uint8_t)125 - 1;
      0085F9 35 7C 53 48      [ 1]   67 	mov	0x5348+0, #0x7c
                                     68 ;	lib/src/lib.c: 7: TIM4->CR1 |= TIM4_CR1_CEN;
      0085FD 72 10 53 40      [ 1]   69 	bset	0x5340, #0
                                     70 ;	lib/src/lib.c: 8: }
      008601 81               [ 4]   71 	ret
                                     72 ;	lib/src/lib.c: 9: void Timer4DelayMs(uint16_t u16Delay){
                                     73 ;	-----------------------------------------
                                     74 ;	 function Timer4DelayMs
                                     75 ;	-----------------------------------------
      008602                         76 _Timer4DelayMs:
                                     77 ;	lib/src/lib.c: 10: while(u16Delay){
      008602                         78 00104$:
      008602 5D               [ 2]   79 	tnzw	x
      008603 26 01            [ 1]   80 	jrne	00130$
      008605 81               [ 4]   81 	ret
      008606                         82 00130$:
                                     83 ;	lib/src/lib.c: 11: TIM4->CNTR = (uint8_t)0;
      008606 35 00 53 46      [ 1]   84 	mov	0x5346+0, #0x00
                                     85 ;	lib/src/lib.c: 13: TIM4->SR1 = (uint8_t)(~0x01);
      00860A 35 FE 53 44      [ 1]   86 	mov	0x5344+0, #0xfe
                                     87 ;	lib/src/lib.c: 14: while((TIM4->SR1 & (uint8_t)0x01) == RESET){}
      00860E                         88 00101$:
      00860E 72 01 53 44 FB   [ 2]   89 	btjf	0x5344, #0, 00101$
                                     90 ;	lib/src/lib.c: 15: --u16Delay;
      008613 5A               [ 2]   91 	decw	x
      008614 20 EC            [ 2]   92 	jra	00104$
                                     93 ;	lib/src/lib.c: 17: }
      008616 81               [ 4]   94 	ret
                                     95 ;	lib/src/lib.c: 21: void I2C_init(void)
                                     96 ;	-----------------------------------------
                                     97 ;	 function I2C_init
                                     98 ;	-----------------------------------------
      008617                         99 _I2C_init:
                                    100 ;	lib/src/lib.c: 23: I2C->CR1 = I2C_CR1_RESET_VALUE;
      008617 35 00 52 10      [ 1]  101 	mov	0x5210+0, #0x00
                                    102 ;	lib/src/lib.c: 24: I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ); /* Clear frequency bits */
      00861B C6 52 12         [ 1]  103 	ld	a, 0x5212
      00861E A4 C0            [ 1]  104 	and	a, #0xc0
      008620 C7 52 12         [ 1]  105 	ld	0x5212, a
                                    106 ;	lib/src/lib.c: 25: I2C->FREQR |= 16;	/*run 16mhz*/
      008623 72 18 52 12      [ 1]  107 	bset	0x5212, #4
                                    108 ;	lib/src/lib.c: 29: I2C->CR1 &= (uint8_t)(~I2C_CR1_PE); 
      008627 72 11 52 10      [ 1]  109 	bres	0x5210, #0
                                    110 ;	lib/src/lib.c: 31: I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
      00862B C6 52 1C         [ 1]  111 	ld	a, 0x521c
      00862E A4 30            [ 1]  112 	and	a, #0x30
      008630 C7 52 1C         [ 1]  113 	ld	0x521c, a
                                    114 ;	lib/src/lib.c: 32: I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
      008633 C6 52 1B         [ 1]  115 	ld	a, 0x521b
      008636 35 00 52 1B      [ 1]  116 	mov	0x521b+0, #0x00
                                    117 ;	lib/src/lib.c: 35: I2C->CCRL = 0x50; 		/*SCL clock is 100khz */
      00863A 35 50 52 1B      [ 1]  118 	mov	0x521b+0, #0x50
                                    119 ;	lib/src/lib.c: 36: I2C->CCRH = 0x00;
      00863E 35 00 52 1C      [ 1]  120 	mov	0x521c+0, #0x00
                                    121 ;	lib/src/lib.c: 39: I2C->TRISER = 17;
      008642 35 11 52 1D      [ 1]  122 	mov	0x521d+0, #0x11
                                    123 ;	lib/src/lib.c: 44: I2C->OARH |=  (I2C_OARH_ADDCONF | (0x00));
      008646 72 1C 52 14      [ 1]  124 	bset	0x5214, #6
                                    125 ;	lib/src/lib.c: 46: I2C->CR1 |= I2C_CR1_PE;
      00864A 72 10 52 10      [ 1]  126 	bset	0x5210, #0
                                    127 ;	lib/src/lib.c: 47: }
      00864E 81               [ 4]  128 	ret
                                    129 ;	lib/src/lib.c: 48: void I2C_start(void)
                                    130 ;	-----------------------------------------
                                    131 ;	 function I2C_start
                                    132 ;	-----------------------------------------
      00864F                        133 _I2C_start:
                                    134 ;	lib/src/lib.c: 51: while((I2C->SR3 & (uint8_t)0x02)==SET); /* Check busy flag */
      00864F                        135 00101$:
      00864F C6 52 19         [ 1]  136 	ld	a, 0x5219
      008652 A4 02            [ 1]  137 	and	a, #0x02
      008654 4A               [ 1]  138 	dec	a
      008655 27 F8            [ 1]  139 	jreq	00101$
                                    140 ;	lib/src/lib.c: 53: I2C->CR2 |= I2C_CR2_START; /* Generate a START condition */
      008657 72 10 52 11      [ 1]  141 	bset	0x5211, #0
                                    142 ;	lib/src/lib.c: 55: while((I2C->SR1 & I2C_SR1_SB) == 0);	
      00865B                        143 00104$:
      00865B 72 01 52 17 FB   [ 2]  144 	btjf	0x5217, #0, 00104$
                                    145 ;	lib/src/lib.c: 56: }
      008660 81               [ 4]  146 	ret
                                    147 ;	lib/src/lib.c: 57: void I2C_stop(void)
                                    148 ;	-----------------------------------------
                                    149 ;	 function I2C_stop
                                    150 ;	-----------------------------------------
      008661                        151 _I2C_stop:
                                    152 ;	lib/src/lib.c: 59: I2C->CR2 |= I2C_CR2_STOP;	/* Generate a STOP condition */
      008661 72 12 52 11      [ 1]  153 	bset	0x5211, #1
                                    154 ;	lib/src/lib.c: 61: I2C->SR1;       I2C->SR3;
      008665 C6 52 17         [ 1]  155 	ld	a, 0x5217
      008668 C6 52 19         [ 1]  156 	ld	a, 0x5219
                                    157 ;	lib/src/lib.c: 62: }
      00866B 81               [ 4]  158 	ret
                                    159 ;	lib/src/lib.c: 63: void I2C_address(uint8_t I2C_ADDR, I2C_Direction_TypeDef Direction)
                                    160 ;	-----------------------------------------
                                    161 ;	 function I2C_address
                                    162 ;	-----------------------------------------
      00866C                        163 _I2C_address:
      00866C 88               [ 1]  164 	push	a
                                    165 ;	lib/src/lib.c: 65: I2C_ADDR &= (uint8_t)0xFE; /* Clear bit0 (direction) just in case */
      00866D A4 FE            [ 1]  166 	and	a, #0xfe
      00866F 6B 01            [ 1]  167 	ld	(0x01, sp), a
                                    168 ;	lib/src/lib.c: 66: I2C->DR = (uint8_t)(I2C_ADDR | (uint8_t)Direction); /* Send the Address + Direction */ 
      008671 7B 04            [ 1]  169 	ld	a, (0x04, sp)
      008673 1A 01            [ 1]  170 	or	a, (0x01, sp)
      008675 C7 52 16         [ 1]  171 	ld	0x5216, a
                                    172 ;	lib/src/lib.c: 68: I2C->SR1;
      008678 C6 52 17         [ 1]  173 	ld	a, 0x5217
                                    174 ;	lib/src/lib.c: 69: while((I2C->SR1 & I2C_SR1_ADDR)==0);
      00867B A6 02            [ 1]  175 	ld	a,	#0x02
      00867D                        176 00112$:
      00867D C5 52 17         [ 1]  177 	bcp	a,	0x5217
      008680 27 FB            [ 1]  178 	jreq	00112$
                                    179 ;	lib/src/lib.c: 70: }
      008682 84               [ 1]  180 	pop	a
      008683 85               [ 2]  181 	popw	x
      008684 84               [ 1]  182 	pop	a
      008685 FC               [ 2]  183 	jp	(x)
                                    184 ;	lib/src/lib.c: 71: void I2C_write(uint8_t data)
                                    185 ;	-----------------------------------------
                                    186 ;	 function I2C_write
                                    187 ;	-----------------------------------------
      008686                        188 _I2C_write:
      008686 88               [ 1]  189 	push	a
      008687 6B 01            [ 1]  190 	ld	(0x01, sp), a
                                    191 ;	lib/src/lib.c: 73: I2C->SR1;
      008689 C6 52 17         [ 1]  192 	ld	a, 0x5217
                                    193 ;	lib/src/lib.c: 74: I2C->SR3;
      00868C C6 52 19         [ 1]  194 	ld	a, 0x5219
                                    195 ;	lib/src/lib.c: 76: I2C->DR = data;
      00868F AE 52 16         [ 2]  196 	ldw	x, #0x5216
      008692 7B 01            [ 1]  197 	ld	a, (0x01, sp)
      008694 F7               [ 1]  198 	ld	(x), a
                                    199 ;	lib/src/lib.c: 77: while((I2C->SR1 & I2C_SR1_TXE)==0);
      008695                        200 00101$:
      008695 C6 52 17         [ 1]  201 	ld	a, 0x5217
      008698 2A FB            [ 1]  202 	jrpl	00101$
                                    203 ;	lib/src/lib.c: 78: }
      00869A 84               [ 1]  204 	pop	a
      00869B 81               [ 4]  205 	ret
                                    206 ;	lib/src/lib.c: 80: void uart_init(void){
                                    207 ;	-----------------------------------------
                                    208 ;	 function uart_init
                                    209 ;	-----------------------------------------
      00869C                        210 _uart_init:
                                    211 ;	lib/src/lib.c: 83: UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  /* Clear the word length bit */
      00869C 72 19 52 34      [ 1]  212 	bres	0x5234, #4
                                    213 ;	lib/src/lib.c: 84: UART1->CR1 |= (uint8_t)0x00; /* Set the word length bit, 8 Data bits */
      0086A0 55 52 34 52 34   [ 1]  214 	mov	0x5234, 0x5234
                                    215 ;	lib/src/lib.c: 85: UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  /* Clear the STOP bits */
      0086A5 C6 52 36         [ 1]  216 	ld	a, 0x5236
      0086A8 A4 CF            [ 1]  217 	and	a, #0xcf
      0086AA C7 52 36         [ 1]  218 	ld	0x5236, a
                                    219 ;	lib/src/lib.c: 86: UART1->CR3 |= (uint8_t)0x00; /**< One stop bit is transmitted at the end of frame*/
      0086AD 55 52 36 52 36   [ 1]  220 	mov	0x5236, 0x5236
                                    221 ;	lib/src/lib.c: 88: UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  /* Clear the Parity Control bit */
      0086B2 C6 52 34         [ 1]  222 	ld	a, 0x5234
      0086B5 A4 F9            [ 1]  223 	and	a, #0xf9
      0086B7 C7 52 34         [ 1]  224 	ld	0x5234, a
                                    225 ;	lib/src/lib.c: 89: UART1->CR1 |= (uint8_t)0x00;  /* Set No Parity Control bit */
      0086BA 55 52 34 52 34   [ 1]  226 	mov	0x5234, 0x5234
                                    227 ;	lib/src/lib.c: 91: UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  /* Clear the LSB mantissa of UART1DIV  */
      0086BF C6 52 32         [ 1]  228 	ld	a, 0x5232
      0086C2 35 00 52 32      [ 1]  229 	mov	0x5232+0, #0x00
                                    230 ;	lib/src/lib.c: 92: UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);	/* Clear the MSB mantissa of UART1DIV  */
      0086C6 C6 52 33         [ 1]  231 	ld	a, 0x5233
      0086C9 A4 0F            [ 1]  232 	and	a, #0x0f
      0086CB C7 52 33         [ 1]  233 	ld	0x5233, a
                                    234 ;	lib/src/lib.c: 93: UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  /* Clear the Fraction bits of UART1DIV */
      0086CE C6 52 33         [ 1]  235 	ld	a, 0x5233
      0086D1 A4 F0            [ 1]  236 	and	a, #0xf0
      0086D3 C7 52 33         [ 1]  237 	ld	0x5233, a
                                    238 ;	lib/src/lib.c: 96: UART1->BRR2 = (uint8_t)0x03;
      0086D6 35 03 52 33      [ 1]  239 	mov	0x5233+0, #0x03
                                    240 ;	lib/src/lib.c: 97: UART1->BRR1 = (uint8_t)0x68;
      0086DA 35 68 52 32      [ 1]  241 	mov	0x5232+0, #0x68
                                    242 ;	lib/src/lib.c: 102: UART1->CR2 |= (uint8_t)UART1_CR2_TEN; /*Transmit Enable and Receive Enable*/ 
      0086DE 72 16 52 35      [ 1]  243 	bset	0x5235, #3
                                    244 ;	lib/src/lib.c: 103: UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
      0086E2 72 14 52 35      [ 1]  245 	bset	0x5235, #2
                                    246 ;	lib/src/lib.c: 104: UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); /*Sync mode Disable, SLK pin Disable*/
      0086E6 72 17 52 36      [ 1]  247 	bres	0x5236, #3
                                    248 ;	lib/src/lib.c: 105: UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); /* UART1 Enable */
      0086EA 72 1B 52 34      [ 1]  249 	bres	0x5234, #5
                                    250 ;	lib/src/lib.c: 106: }
      0086EE 81               [ 4]  251 	ret
                                    252 ;	lib/src/lib.c: 107: void uart1_number(int number)
                                    253 ;	-----------------------------------------
                                    254 ;	 function uart1_number
                                    255 ;	-----------------------------------------
      0086EF                        256 _uart1_number:
      0086EF 52 0A            [ 2]  257 	sub	sp, #10
      0086F1 1F 08            [ 2]  258 	ldw	(0x08, sp), x
                                    259 ;	lib/src/lib.c: 110: char digit[5] = "";
      0086F3 0F 03            [ 1]  260 	clr	(0x03, sp)
      0086F5 0F 04            [ 1]  261 	clr	(0x04, sp)
      0086F7 0F 05            [ 1]  262 	clr	(0x05, sp)
      0086F9 0F 06            [ 1]  263 	clr	(0x06, sp)
      0086FB 0F 07            [ 1]  264 	clr	(0x07, sp)
                                    265 ;	lib/src/lib.c: 111: while(number != 0)
      0086FD 0F 0A            [ 1]  266 	clr	(0x0a, sp)
      0086FF                        267 00101$:
      0086FF 1E 08            [ 2]  268 	ldw	x, (0x08, sp)
      008701 27 2C            [ 1]  269 	jreq	00117$
                                    270 ;	lib/src/lib.c: 113: digit[count] = number%10;   //lay chu so ngoai cung xxxx8;
      008703 5F               [ 1]  271 	clrw	x
      008704 7B 0A            [ 1]  272 	ld	a, (0x0a, sp)
      008706 97               [ 1]  273 	ld	xl, a
      008707 89               [ 2]  274 	pushw	x
      008708 96               [ 1]  275 	ldw	x, sp
      008709 1C 00 05         [ 2]  276 	addw	x, #5
      00870C 72 FB 01         [ 2]  277 	addw	x, (1, sp)
      00870F 1F 03            [ 2]  278 	ldw	(0x03, sp), x
      008711 5B 02            [ 2]  279 	addw	sp, #2
      008713 4B 0A            [ 1]  280 	push	#0x0a
      008715 4B 00            [ 1]  281 	push	#0x00
      008717 1E 0A            [ 2]  282 	ldw	x, (0x0a, sp)
      008719 CD 90 3B         [ 4]  283 	call	__modsint
      00871C 9F               [ 1]  284 	ld	a, xl
      00871D 1E 01            [ 2]  285 	ldw	x, (0x01, sp)
      00871F F7               [ 1]  286 	ld	(x), a
                                    287 ;	lib/src/lib.c: 114: ++count;
      008720 0C 0A            [ 1]  288 	inc	(0x0a, sp)
                                    289 ;	lib/src/lib.c: 115: number = number/10;         //chia so number cho 10 de bo so ngoai cung xxxx
      008722 4B 0A            [ 1]  290 	push	#0x0a
      008724 4B 00            [ 1]  291 	push	#0x00
      008726 1E 0A            [ 2]  292 	ldw	x, (0x0a, sp)
      008728 CD 90 53         [ 4]  293 	call	__divsint
      00872B 1F 08            [ 2]  294 	ldw	(0x08, sp), x
      00872D 20 D0            [ 2]  295 	jra	00101$
                                    296 ;	lib/src/lib.c: 117: while (count!=0)
      00872F                        297 00117$:
      00872F                        298 00107$:
      00872F 0D 0A            [ 1]  299 	tnz	(0x0a, sp)
      008731 27 21            [ 1]  300 	jreq	00110$
                                    301 ;	lib/src/lib.c: 119: UART1->DR = (digit[count - 1] + 0x30); // 0x30 = 48 ;
      008733 7B 0A            [ 1]  302 	ld	a, (0x0a, sp)
      008735 4A               [ 1]  303 	dec	a
      008736 6B 02            [ 1]  304 	ld	(0x02, sp), a
      008738 49               [ 1]  305 	rlc	a
      008739 4F               [ 1]  306 	clr	a
      00873A A2 00            [ 1]  307 	sbc	a, #0x00
      00873C 6B 01            [ 1]  308 	ld	(0x01, sp), a
      00873E 96               [ 1]  309 	ldw	x, sp
      00873F 1C 00 03         [ 2]  310 	addw	x, #3
      008742 72 FB 01         [ 2]  311 	addw	x, (0x01, sp)
      008745 F6               [ 1]  312 	ld	a, (x)
      008746 AB 30            [ 1]  313 	add	a, #0x30
      008748 C7 52 31         [ 1]  314 	ld	0x5231, a
                                    315 ;	lib/src/lib.c: 120: while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET);
      00874B                        316 00104$:
      00874B C6 52 30         [ 1]  317 	ld	a, 0x5230
      00874E 2A FB            [ 1]  318 	jrpl	00104$
                                    319 ;	lib/src/lib.c: 121: --count;
      008750 0A 0A            [ 1]  320 	dec	(0x0a, sp)
      008752 20 DB            [ 2]  321 	jra	00107$
      008754                        322 00110$:
                                    323 ;	lib/src/lib.c: 123: }
      008754 5B 0A            [ 2]  324 	addw	sp, #10
      008756 81               [ 4]  325 	ret
                                    326 ;	lib/src/lib.c: 124: void uart1_string(const char *cy)
                                    327 ;	-----------------------------------------
                                    328 ;	 function uart1_string
                                    329 ;	-----------------------------------------
      008757                        330 _uart1_string:
                                    331 ;	lib/src/lib.c: 126: while(*cy)
      008757                        332 00104$:
      008757 F6               [ 1]  333 	ld	a, (x)
      008758 26 01            [ 1]  334 	jrne	00130$
      00875A 81               [ 4]  335 	ret
      00875B                        336 00130$:
                                    337 ;	lib/src/lib.c: 128: UART1->DR = (*cy);
      00875B C7 52 31         [ 1]  338 	ld	0x5231, a
                                    339 ;	lib/src/lib.c: 129: while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET){}
      00875E                        340 00101$:
      00875E C6 52 30         [ 1]  341 	ld	a, 0x5230
      008761 2A FB            [ 1]  342 	jrpl	00101$
                                    343 ;	lib/src/lib.c: 130: cy++;
      008763 5C               [ 1]  344 	incw	x
      008764 20 F1            [ 2]  345 	jra	00104$
                                    346 ;	lib/src/lib.c: 132: }
      008766 81               [ 4]  347 	ret
                                    348 ;	lib/src/lib.c: 133: void uart1_nline(void)
                                    349 ;	-----------------------------------------
                                    350 ;	 function uart1_nline
                                    351 ;	-----------------------------------------
      008767                        352 _uart1_nline:
                                    353 ;	lib/src/lib.c: 135: UART1->DR = (0x0a);
      008767 35 0A 52 31      [ 1]  354 	mov	0x5231+0, #0x0a
                                    355 ;	lib/src/lib.c: 136: while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET);
      00876B                        356 00101$:
      00876B C6 52 30         [ 1]  357 	ld	a, 0x5230
      00876E 2A FB            [ 1]  358 	jrpl	00101$
                                    359 ;	lib/src/lib.c: 137: }
      008770 81               [ 4]  360 	ret
                                    361 	.area CODE
                                    362 	.area CONST
                                    363 	.area INITIALIZER
                                    364 	.area CABS (ABS)
