                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.5.0 #9253 (Apr  3 2018) (Linux)
                                      4 ; This file was generated Fri Mar 21 14:40:27 2025
                                      5 ;--------------------------------------------------------
                                      6 	.module lib
                                      7 	.optsdcc -mstm8
                                      8 	
                                      9 ;--------------------------------------------------------
                                     10 ; Public variables in this module
                                     11 ;--------------------------------------------------------
                                     12 	.globl _fabsf
                                     13 	.globl _Timer4Config
                                     14 	.globl _Timer4DelayMs
                                     15 	.globl _I2C_init
                                     16 	.globl _I2C_start
                                     17 	.globl _I2C_stop
                                     18 	.globl _I2C_address
                                     19 	.globl _I2C_write
                                     20 	.globl _uart_init
                                     21 	.globl _uart1_number
                                     22 	.globl _uart1_string
                                     23 	.globl _uart1_nline
                                     24 ;--------------------------------------------------------
                                     25 ; ram data
                                     26 ;--------------------------------------------------------
                                     27 	.area DATA
                                     28 ;--------------------------------------------------------
                                     29 ; ram data
                                     30 ;--------------------------------------------------------
                                     31 	.area INITIALIZED
                                     32 ;--------------------------------------------------------
                                     33 ; absolute external ram data
                                     34 ;--------------------------------------------------------
                                     35 	.area DABS (ABS)
                                     36 ;--------------------------------------------------------
                                     37 ; global & static initialisations
                                     38 ;--------------------------------------------------------
                                     39 	.area HOME
                                     40 	.area GSINIT
                                     41 	.area GSFINAL
                                     42 	.area GSINIT
                                     43 ;--------------------------------------------------------
                                     44 ; Home
                                     45 ;--------------------------------------------------------
                                     46 	.area HOME
                                     47 	.area HOME
                                     48 ;--------------------------------------------------------
                                     49 ; code
                                     50 ;--------------------------------------------------------
                                     51 	.area CODE
                                     52 ;	lib/src/lib.c: 3: void Timer4Config(void){
                                     53 ;	-----------------------------------------
                                     54 ;	 function Timer4Config
                                     55 ;	-----------------------------------------
      0085E8                         56 _Timer4Config:
                                     57 ;	lib/src/lib.c: 4: TIM4->PSCR = (uint8_t)0x07;
      0085E8 35 07 53 47      [ 1]   58 	mov	0x5347+0, #0x07
                                     59 ;	lib/src/lib.c: 5: TIM4->ARR = (uint8_t)125 - 1;
      0085EC 35 7C 53 48      [ 1]   60 	mov	0x5348+0, #0x7c
                                     61 ;	lib/src/lib.c: 7: TIM4->CR1 |= TIM4_CR1_CEN;
      0085F0 72 10 53 40      [ 1]   62 	bset	0x5340, #0
      0085F4 81               [ 4]   63 	ret
                                     64 ;	lib/src/lib.c: 9: void Timer4DelayMs(uint16_t u16Delay){
                                     65 ;	-----------------------------------------
                                     66 ;	 function Timer4DelayMs
                                     67 ;	-----------------------------------------
      0085F5                         68 _Timer4DelayMs:
                                     69 ;	lib/src/lib.c: 10: while(u16Delay){
      0085F5 1E 03            [ 2]   70 	ldw	x, (0x03, sp)
      0085F7                         71 00104$:
      0085F7 5D               [ 2]   72 	tnzw	x
      0085F8 27 14            [ 1]   73 	jreq	00107$
                                     74 ;	lib/src/lib.c: 11: TIM4->CNTR = (uint8_t)0;
      0085FA 35 00 53 46      [ 1]   75 	mov	0x5346+0, #0x00
                                     76 ;	lib/src/lib.c: 13: TIM4->SR1 = (uint8_t)(~0x01);
      0085FE 35 FE 53 44      [ 1]   77 	mov	0x5344+0, #0xfe
                                     78 ;	lib/src/lib.c: 14: while((TIM4->SR1 & (uint8_t)0x01) == RESET){}
      008602                         79 00101$:
      008602 90 AE 53 44      [ 2]   80 	ldw	y, #0x5344
      008606 90 F6            [ 1]   81 	ld	a, (y)
      008608 44               [ 1]   82 	srl	a
      008609 24 F7            [ 1]   83 	jrnc	00101$
                                     84 ;	lib/src/lib.c: 15: --u16Delay;
      00860B 5A               [ 2]   85 	decw	x
      00860C 20 E9            [ 2]   86 	jra	00104$
      00860E                         87 00107$:
      00860E 81               [ 4]   88 	ret
                                     89 ;	lib/src/lib.c: 21: void I2C_init(void)
                                     90 ;	-----------------------------------------
                                     91 ;	 function I2C_init
                                     92 ;	-----------------------------------------
      00860F                         93 _I2C_init:
                                     94 ;	lib/src/lib.c: 23: I2C->CR1 = I2C_CR1_RESET_VALUE;
      00860F 35 00 52 10      [ 1]   95 	mov	0x5210+0, #0x00
                                     96 ;	lib/src/lib.c: 24: I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ); /* Clear frequency bits */
      008613 AE 52 12         [ 2]   97 	ldw	x, #0x5212
      008616 F6               [ 1]   98 	ld	a, (x)
      008617 A4 C0            [ 1]   99 	and	a, #0xc0
      008619 F7               [ 1]  100 	ld	(x), a
                                    101 ;	lib/src/lib.c: 25: I2C->FREQR |= 16;	/*run 16mhz*/
      00861A AE 52 12         [ 2]  102 	ldw	x, #0x5212
      00861D F6               [ 1]  103 	ld	a, (x)
      00861E AA 10            [ 1]  104 	or	a, #0x10
      008620 F7               [ 1]  105 	ld	(x), a
                                    106 ;	lib/src/lib.c: 29: I2C->CR1 &= (uint8_t)(~I2C_CR1_PE); 
      008621 72 11 52 10      [ 1]  107 	bres	0x5210, #0
                                    108 ;	lib/src/lib.c: 31: I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
      008625 AE 52 1C         [ 2]  109 	ldw	x, #0x521c
      008628 F6               [ 1]  110 	ld	a, (x)
      008629 A4 30            [ 1]  111 	and	a, #0x30
      00862B F7               [ 1]  112 	ld	(x), a
                                    113 ;	lib/src/lib.c: 32: I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
      00862C AE 52 1B         [ 2]  114 	ldw	x, #0x521b
      00862F F6               [ 1]  115 	ld	a, (x)
      008630 35 00 52 1B      [ 1]  116 	mov	0x521b+0, #0x00
                                    117 ;	lib/src/lib.c: 35: I2C->CCRL = 0x50; 		/*SCL clock is 100khz */
      008634 35 50 52 1B      [ 1]  118 	mov	0x521b+0, #0x50
                                    119 ;	lib/src/lib.c: 36: I2C->CCRH = 0x00;
      008638 35 00 52 1C      [ 1]  120 	mov	0x521c+0, #0x00
                                    121 ;	lib/src/lib.c: 39: I2C->TRISER = 17;
      00863C 35 11 52 1D      [ 1]  122 	mov	0x521d+0, #0x11
                                    123 ;	lib/src/lib.c: 44: I2C->OARH |=  (I2C_OARH_ADDCONF | (0x00));
      008640 AE 52 14         [ 2]  124 	ldw	x, #0x5214
      008643 F6               [ 1]  125 	ld	a, (x)
      008644 AA 40            [ 1]  126 	or	a, #0x40
      008646 F7               [ 1]  127 	ld	(x), a
                                    128 ;	lib/src/lib.c: 46: I2C->CR1 |= I2C_CR1_PE;
      008647 72 10 52 10      [ 1]  129 	bset	0x5210, #0
      00864B 81               [ 4]  130 	ret
                                    131 ;	lib/src/lib.c: 48: void I2C_start(void)
                                    132 ;	-----------------------------------------
                                    133 ;	 function I2C_start
                                    134 ;	-----------------------------------------
      00864C                        135 _I2C_start:
                                    136 ;	lib/src/lib.c: 51: while((I2C->SR3 & (uint8_t)0x02)==SET); /* Check busy flag */
      00864C                        137 00101$:
      00864C AE 52 19         [ 2]  138 	ldw	x, #0x5219
      00864F F6               [ 1]  139 	ld	a, (x)
      008650 A4 02            [ 1]  140 	and	a, #0x02
      008652 A1 01            [ 1]  141 	cp	a, #0x01
      008654 27 F6            [ 1]  142 	jreq	00101$
                                    143 ;	lib/src/lib.c: 53: I2C->CR2 |= I2C_CR2_START; /* Generate a START condition */
      008656 72 10 52 11      [ 1]  144 	bset	0x5211, #0
                                    145 ;	lib/src/lib.c: 55: while((I2C->SR1 & I2C_SR1_SB) == 0);	
      00865A                        146 00104$:
      00865A AE 52 17         [ 2]  147 	ldw	x, #0x5217
      00865D F6               [ 1]  148 	ld	a, (x)
      00865E 44               [ 1]  149 	srl	a
      00865F 24 F9            [ 1]  150 	jrnc	00104$
      008661 81               [ 4]  151 	ret
                                    152 ;	lib/src/lib.c: 57: void I2C_stop(void)
                                    153 ;	-----------------------------------------
                                    154 ;	 function I2C_stop
                                    155 ;	-----------------------------------------
      008662                        156 _I2C_stop:
                                    157 ;	lib/src/lib.c: 59: I2C->CR2 |= I2C_CR2_STOP;	/* Generate a STOP condition */
      008662 AE 52 11         [ 2]  158 	ldw	x, #0x5211
      008665 F6               [ 1]  159 	ld	a, (x)
      008666 AA 02            [ 1]  160 	or	a, #0x02
      008668 F7               [ 1]  161 	ld	(x), a
                                    162 ;	lib/src/lib.c: 61: I2C->SR1;       I2C->SR3;
      008669 AE 52 17         [ 2]  163 	ldw	x, #0x5217
      00866C F6               [ 1]  164 	ld	a, (x)
      00866D AE 52 19         [ 2]  165 	ldw	x, #0x5219
      008670 F6               [ 1]  166 	ld	a, (x)
      008671 81               [ 4]  167 	ret
                                    168 ;	lib/src/lib.c: 63: void I2C_address(uint8_t I2C_ADDR, I2C_Direction_TypeDef Direction)
                                    169 ;	-----------------------------------------
                                    170 ;	 function I2C_address
                                    171 ;	-----------------------------------------
      008672                        172 _I2C_address:
                                    173 ;	lib/src/lib.c: 65: I2C_ADDR &= (uint8_t)0xFE; /* Clear bit0 (direction) just in case */
      008672 7B 03            [ 1]  174 	ld	a, (0x03, sp)
      008674 A4 FE            [ 1]  175 	and	a, #0xfe
      008676 6B 03            [ 1]  176 	ld	(0x03, sp), a
                                    177 ;	lib/src/lib.c: 66: I2C->DR = (uint8_t)(I2C_ADDR | (uint8_t)Direction); /* Send the Address + Direction */ 
      008678 7B 03            [ 1]  178 	ld	a, (0x03, sp)
      00867A 1A 04            [ 1]  179 	or	a, (0x04, sp)
      00867C AE 52 16         [ 2]  180 	ldw	x, #0x5216
      00867F F7               [ 1]  181 	ld	(x), a
                                    182 ;	lib/src/lib.c: 68: I2C->SR1;
      008680 AE 52 17         [ 2]  183 	ldw	x, #0x5217
      008683 F6               [ 1]  184 	ld	a, (x)
                                    185 ;	lib/src/lib.c: 69: while((I2C->SR1 & I2C_SR1_ADDR)==0);
      008684                        186 00101$:
      008684 AE 52 17         [ 2]  187 	ldw	x, #0x5217
      008687 F6               [ 1]  188 	ld	a, (x)
      008688 A5 02            [ 1]  189 	bcp	a, #0x02
      00868A 27 F8            [ 1]  190 	jreq	00101$
      00868C 81               [ 4]  191 	ret
                                    192 ;	lib/src/lib.c: 71: void I2C_write(uint8_t data)
                                    193 ;	-----------------------------------------
                                    194 ;	 function I2C_write
                                    195 ;	-----------------------------------------
      00868D                        196 _I2C_write:
                                    197 ;	lib/src/lib.c: 73: I2C->SR1;
      00868D AE 52 17         [ 2]  198 	ldw	x, #0x5217
      008690 F6               [ 1]  199 	ld	a, (x)
                                    200 ;	lib/src/lib.c: 74: I2C->SR3;
      008691 AE 52 19         [ 2]  201 	ldw	x, #0x5219
      008694 F6               [ 1]  202 	ld	a, (x)
                                    203 ;	lib/src/lib.c: 76: I2C->DR = data;
      008695 AE 52 16         [ 2]  204 	ldw	x, #0x5216
      008698 7B 03            [ 1]  205 	ld	a, (0x03, sp)
      00869A F7               [ 1]  206 	ld	(x), a
                                    207 ;	lib/src/lib.c: 77: while((I2C->SR1 & I2C_SR1_TXE)==0);
      00869B                        208 00101$:
      00869B AE 52 17         [ 2]  209 	ldw	x, #0x5217
      00869E F6               [ 1]  210 	ld	a, (x)
      00869F 4D               [ 1]  211 	tnz	a
      0086A0 2A F9            [ 1]  212 	jrpl	00101$
      0086A2 81               [ 4]  213 	ret
                                    214 ;	lib/src/lib.c: 80: void uart_init(void){
                                    215 ;	-----------------------------------------
                                    216 ;	 function uart_init
                                    217 ;	-----------------------------------------
      0086A3                        218 _uart_init:
                                    219 ;	lib/src/lib.c: 83: UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  /* Clear the word length bit */
      0086A3 AE 52 34         [ 2]  220 	ldw	x, #0x5234
      0086A6 F6               [ 1]  221 	ld	a, (x)
      0086A7 A4 EF            [ 1]  222 	and	a, #0xef
      0086A9 F7               [ 1]  223 	ld	(x), a
                                    224 ;	lib/src/lib.c: 84: UART1->CR1 |= (uint8_t)0x00; /* Set the word length bit, 8 Data bits */
      0086AA AE 52 34         [ 2]  225 	ldw	x, #0x5234
      0086AD F6               [ 1]  226 	ld	a, (x)
      0086AE AE 52 34         [ 2]  227 	ldw	x, #0x5234
      0086B1 F7               [ 1]  228 	ld	(x), a
                                    229 ;	lib/src/lib.c: 85: UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  /* Clear the STOP bits */
      0086B2 AE 52 36         [ 2]  230 	ldw	x, #0x5236
      0086B5 F6               [ 1]  231 	ld	a, (x)
      0086B6 A4 CF            [ 1]  232 	and	a, #0xcf
      0086B8 F7               [ 1]  233 	ld	(x), a
                                    234 ;	lib/src/lib.c: 86: UART1->CR3 |= (uint8_t)0x00; /**< One stop bit is transmitted at the end of frame*/
      0086B9 AE 52 36         [ 2]  235 	ldw	x, #0x5236
      0086BC F6               [ 1]  236 	ld	a, (x)
      0086BD AE 52 36         [ 2]  237 	ldw	x, #0x5236
      0086C0 F7               [ 1]  238 	ld	(x), a
                                    239 ;	lib/src/lib.c: 88: UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  /* Clear the Parity Control bit */
      0086C1 AE 52 34         [ 2]  240 	ldw	x, #0x5234
      0086C4 F6               [ 1]  241 	ld	a, (x)
      0086C5 A4 F9            [ 1]  242 	and	a, #0xf9
      0086C7 F7               [ 1]  243 	ld	(x), a
                                    244 ;	lib/src/lib.c: 89: UART1->CR1 |= (uint8_t)0x00;  /* Set No Parity Control bit */
      0086C8 AE 52 34         [ 2]  245 	ldw	x, #0x5234
      0086CB F6               [ 1]  246 	ld	a, (x)
      0086CC AE 52 34         [ 2]  247 	ldw	x, #0x5234
      0086CF F7               [ 1]  248 	ld	(x), a
                                    249 ;	lib/src/lib.c: 91: UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  /* Clear the LSB mantissa of UART1DIV  */
      0086D0 AE 52 32         [ 2]  250 	ldw	x, #0x5232
      0086D3 F6               [ 1]  251 	ld	a, (x)
      0086D4 35 00 52 32      [ 1]  252 	mov	0x5232+0, #0x00
                                    253 ;	lib/src/lib.c: 92: UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);	/* Clear the MSB mantissa of UART1DIV  */
      0086D8 AE 52 33         [ 2]  254 	ldw	x, #0x5233
      0086DB F6               [ 1]  255 	ld	a, (x)
      0086DC A4 0F            [ 1]  256 	and	a, #0x0f
      0086DE F7               [ 1]  257 	ld	(x), a
                                    258 ;	lib/src/lib.c: 93: UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  /* Clear the Fraction bits of UART1DIV */
      0086DF AE 52 33         [ 2]  259 	ldw	x, #0x5233
      0086E2 F6               [ 1]  260 	ld	a, (x)
      0086E3 A4 F0            [ 1]  261 	and	a, #0xf0
      0086E5 F7               [ 1]  262 	ld	(x), a
                                    263 ;	lib/src/lib.c: 103: UART1->BRR2 = (uint8_t)0x06;
      0086E6 35 06 52 33      [ 1]  264 	mov	0x5233+0, #0x06
                                    265 ;	lib/src/lib.c: 104: UART1->BRR1 = (uint8_t)0x11;
      0086EA 35 11 52 32      [ 1]  266 	mov	0x5232+0, #0x11
                                    267 ;	lib/src/lib.c: 106: UART1->CR2 |= (uint8_t)UART1_CR2_TEN; /*Transmit Enable and Receive Enable*/ 
      0086EE AE 52 35         [ 2]  268 	ldw	x, #0x5235
      0086F1 F6               [ 1]  269 	ld	a, (x)
      0086F2 AA 08            [ 1]  270 	or	a, #0x08
      0086F4 F7               [ 1]  271 	ld	(x), a
                                    272 ;	lib/src/lib.c: 107: UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
      0086F5 AE 52 35         [ 2]  273 	ldw	x, #0x5235
      0086F8 F6               [ 1]  274 	ld	a, (x)
      0086F9 AA 04            [ 1]  275 	or	a, #0x04
      0086FB F7               [ 1]  276 	ld	(x), a
                                    277 ;	lib/src/lib.c: 108: UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); /*Sync mode Disable, SLK pin Disable*/
      0086FC AE 52 36         [ 2]  278 	ldw	x, #0x5236
      0086FF F6               [ 1]  279 	ld	a, (x)
      008700 A4 F7            [ 1]  280 	and	a, #0xf7
      008702 F7               [ 1]  281 	ld	(x), a
                                    282 ;	lib/src/lib.c: 109: UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); /* UART1 Enable */
      008703 AE 52 34         [ 2]  283 	ldw	x, #0x5234
      008706 F6               [ 1]  284 	ld	a, (x)
      008707 A4 DF            [ 1]  285 	and	a, #0xdf
      008709 F7               [ 1]  286 	ld	(x), a
      00870A 81               [ 4]  287 	ret
                                    288 ;	lib/src/lib.c: 111: void uart1_number(int number)
                                    289 ;	-----------------------------------------
                                    290 ;	 function uart1_number
                                    291 ;	-----------------------------------------
      00870B                        292 _uart1_number:
      00870B 52 0C            [ 2]  293 	sub	sp, #12
                                    294 ;	lib/src/lib.c: 113: char count = 0;
      00870D 0F 06            [ 1]  295 	clr	(0x06, sp)
                                    296 ;	lib/src/lib.c: 114: char digit[5] = "";
      00870F 96               [ 1]  297 	ldw	x, sp
      008710 5C               [ 2]  298 	incw	x
      008711 1F 07            [ 2]  299 	ldw	(0x07, sp), x
      008713 1E 07            [ 2]  300 	ldw	x, (0x07, sp)
      008715 7F               [ 1]  301 	clr	(x)
      008716 1E 07            [ 2]  302 	ldw	x, (0x07, sp)
      008718 5C               [ 2]  303 	incw	x
      008719 7F               [ 1]  304 	clr	(x)
      00871A 1E 07            [ 2]  305 	ldw	x, (0x07, sp)
      00871C 5C               [ 2]  306 	incw	x
      00871D 5C               [ 2]  307 	incw	x
      00871E 7F               [ 1]  308 	clr	(x)
      00871F 1E 07            [ 2]  309 	ldw	x, (0x07, sp)
      008721 1C 00 03         [ 2]  310 	addw	x, #0x0003
      008724 7F               [ 1]  311 	clr	(x)
      008725 1E 07            [ 2]  312 	ldw	x, (0x07, sp)
      008727 1C 00 04         [ 2]  313 	addw	x, #0x0004
      00872A 7F               [ 1]  314 	clr	(x)
                                    315 ;	lib/src/lib.c: 115: if(number == 0){
      00872B 1E 0F            [ 2]  316 	ldw	x, (0x0f, sp)
      00872D 26 07            [ 1]  317 	jrne	00102$
                                    318 ;	lib/src/lib.c: 116: count = 1;
      00872F A6 01            [ 1]  319 	ld	a, #0x01
      008731 6B 06            [ 1]  320 	ld	(0x06, sp), a
                                    321 ;	lib/src/lib.c: 117: digit[0] = 0;
      008733 1E 07            [ 2]  322 	ldw	x, (0x07, sp)
      008735 7F               [ 1]  323 	clr	(x)
      008736                        324 00102$:
                                    325 ;	lib/src/lib.c: 119: if(number < 0){
      008736 0D 0F            [ 1]  326 	tnz	(0x0f, sp)
      008738 2A 1A            [ 1]  327 	jrpl	00119$
                                    328 ;	lib/src/lib.c: 120: number = fabsf(number);
      00873A 1E 0F            [ 2]  329 	ldw	x, (0x0f, sp)
      00873C 89               [ 2]  330 	pushw	x
      00873D CD 91 AC         [ 4]  331 	call	___sint2fs
      008740 5B 02            [ 2]  332 	addw	sp, #2
      008742 89               [ 2]  333 	pushw	x
      008743 90 89            [ 2]  334 	pushw	y
      008745 CD 90 A3         [ 4]  335 	call	_fabsf
      008748 5B 04            [ 2]  336 	addw	sp, #4
      00874A 89               [ 2]  337 	pushw	x
      00874B 90 89            [ 2]  338 	pushw	y
      00874D CD 91 6E         [ 4]  339 	call	___fs2sint
      008750 5B 04            [ 2]  340 	addw	sp, #4
      008752 1F 0F            [ 2]  341 	ldw	(0x0f, sp), x
                                    342 ;	lib/src/lib.c: 123: while(number != 0)
      008754                        343 00119$:
      008754 7B 06            [ 1]  344 	ld	a, (0x06, sp)
      008756 6B 0C            [ 1]  345 	ld	(0x0c, sp), a
      008758                        346 00105$:
      008758 1E 0F            [ 2]  347 	ldw	x, (0x0f, sp)
      00875A 27 2B            [ 1]  348 	jreq	00123$
                                    349 ;	lib/src/lib.c: 125: digit[count] = number%10;   //lay chu so ngoai cung xxxx8;
      00875C 5F               [ 1]  350 	clrw	x
      00875D 7B 0C            [ 1]  351 	ld	a, (0x0c, sp)
      00875F 97               [ 1]  352 	ld	xl, a
      008760 72 FB 07         [ 2]  353 	addw	x, (0x07, sp)
      008763 1F 0A            [ 2]  354 	ldw	(0x0a, sp), x
      008765 4B 0A            [ 1]  355 	push	#0x0a
      008767 4B 00            [ 1]  356 	push	#0x00
      008769 1E 11            [ 2]  357 	ldw	x, (0x11, sp)
      00876B 89               [ 2]  358 	pushw	x
      00876C CD 95 51         [ 4]  359 	call	__modsint
      00876F 5B 04            [ 2]  360 	addw	sp, #4
      008771 9F               [ 1]  361 	ld	a, xl
      008772 1E 0A            [ 2]  362 	ldw	x, (0x0a, sp)
      008774 F7               [ 1]  363 	ld	(x), a
                                    364 ;	lib/src/lib.c: 126: ++count;
      008775 0C 0C            [ 1]  365 	inc	(0x0c, sp)
                                    366 ;	lib/src/lib.c: 127: number = number/10;         //chia so number cho 10 de bo so ngoai cung xxxx
      008777 4B 0A            [ 1]  367 	push	#0x0a
      008779 4B 00            [ 1]  368 	push	#0x00
      00877B 1E 11            [ 2]  369 	ldw	x, (0x11, sp)
      00877D 89               [ 2]  370 	pushw	x
      00877E CD 95 67         [ 4]  371 	call	__divsint
      008781 5B 04            [ 2]  372 	addw	sp, #4
      008783 1F 0F            [ 2]  373 	ldw	(0x0f, sp), x
      008785 20 D1            [ 2]  374 	jra	00105$
                                    375 ;	lib/src/lib.c: 129: while (count!=0)
      008787                        376 00123$:
      008787 7B 0C            [ 1]  377 	ld	a, (0x0c, sp)
      008789                        378 00111$:
      008789 4D               [ 1]  379 	tnz	a
      00878A 27 1C            [ 1]  380 	jreq	00114$
                                    381 ;	lib/src/lib.c: 131: UART1->DR = (digit[count - 1] + 0x30); // 0x30 = 48 ;
      00878C 4A               [ 1]  382 	dec	a
      00878D 6B 09            [ 1]  383 	ld	(0x09, sp), a
      00878F 5F               [ 1]  384 	clrw	x
      008790 7B 09            [ 1]  385 	ld	a, (0x09, sp)
      008792 97               [ 1]  386 	ld	xl, a
      008793 72 FB 07         [ 2]  387 	addw	x, (0x07, sp)
      008796 F6               [ 1]  388 	ld	a, (x)
      008797 AB 30            [ 1]  389 	add	a, #0x30
      008799 AE 52 31         [ 2]  390 	ldw	x, #0x5231
      00879C F7               [ 1]  391 	ld	(x), a
                                    392 ;	lib/src/lib.c: 132: while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET);
      00879D                        393 00108$:
      00879D AE 52 30         [ 2]  394 	ldw	x, #0x5230
      0087A0 F6               [ 1]  395 	ld	a, (x)
      0087A1 4D               [ 1]  396 	tnz	a
      0087A2 2A F9            [ 1]  397 	jrpl	00108$
                                    398 ;	lib/src/lib.c: 133: --count;
      0087A4 7B 09            [ 1]  399 	ld	a, (0x09, sp)
      0087A6 20 E1            [ 2]  400 	jra	00111$
      0087A8                        401 00114$:
      0087A8 5B 0C            [ 2]  402 	addw	sp, #12
      0087AA 81               [ 4]  403 	ret
                                    404 ;	lib/src/lib.c: 136: void uart1_string(const char *cy)
                                    405 ;	-----------------------------------------
                                    406 ;	 function uart1_string
                                    407 ;	-----------------------------------------
      0087AB                        408 _uart1_string:
                                    409 ;	lib/src/lib.c: 138: while(*cy)
      0087AB 16 03            [ 2]  410 	ldw	y, (0x03, sp)
      0087AD                        411 00104$:
      0087AD 90 F6            [ 1]  412 	ld	a, (y)
      0087AF 4D               [ 1]  413 	tnz	a
      0087B0 27 0F            [ 1]  414 	jreq	00107$
                                    415 ;	lib/src/lib.c: 140: UART1->DR = (*cy);
      0087B2 AE 52 31         [ 2]  416 	ldw	x, #0x5231
      0087B5 F7               [ 1]  417 	ld	(x), a
                                    418 ;	lib/src/lib.c: 141: while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET){}
      0087B6                        419 00101$:
      0087B6 AE 52 30         [ 2]  420 	ldw	x, #0x5230
      0087B9 F6               [ 1]  421 	ld	a, (x)
      0087BA 4D               [ 1]  422 	tnz	a
      0087BB 2A F9            [ 1]  423 	jrpl	00101$
                                    424 ;	lib/src/lib.c: 142: cy++;
      0087BD 90 5C            [ 2]  425 	incw	y
      0087BF 20 EC            [ 2]  426 	jra	00104$
      0087C1                        427 00107$:
      0087C1 81               [ 4]  428 	ret
                                    429 ;	lib/src/lib.c: 145: void uart1_nline(void)
                                    430 ;	-----------------------------------------
                                    431 ;	 function uart1_nline
                                    432 ;	-----------------------------------------
      0087C2                        433 _uart1_nline:
                                    434 ;	lib/src/lib.c: 147: UART1->DR = (0x0a);
      0087C2 35 0A 52 31      [ 1]  435 	mov	0x5231+0, #0x0a
                                    436 ;	lib/src/lib.c: 148: while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET);
      0087C6                        437 00101$:
      0087C6 AE 52 30         [ 2]  438 	ldw	x, #0x5230
      0087C9 F6               [ 1]  439 	ld	a, (x)
      0087CA 4D               [ 1]  440 	tnz	a
      0087CB 2A F9            [ 1]  441 	jrpl	00101$
      0087CD 81               [ 4]  442 	ret
                                    443 	.area CODE
                                    444 	.area INITIALIZER
                                    445 	.area CABS (ABS)
