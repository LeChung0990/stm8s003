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
      008597                         56 _Timer4Config:
                                     57 ;	lib/src/lib.c: 4: TIM4->PSCR = (uint8_t)0x07;
      008597 35 07 53 47      [ 1]   58 	mov	0x5347+0, #0x07
                                     59 ;	lib/src/lib.c: 5: TIM4->ARR = (uint8_t)125 - 1;
      00859B 35 7C 53 48      [ 1]   60 	mov	0x5348+0, #0x7c
                                     61 ;	lib/src/lib.c: 7: TIM4->CR1 |= TIM4_CR1_CEN;
      00859F 72 10 53 40      [ 1]   62 	bset	0x5340, #0
      0085A3 81               [ 4]   63 	ret
                                     64 ;	lib/src/lib.c: 9: void Timer4DelayMs(uint16_t u16Delay){
                                     65 ;	-----------------------------------------
                                     66 ;	 function Timer4DelayMs
                                     67 ;	-----------------------------------------
      0085A4                         68 _Timer4DelayMs:
                                     69 ;	lib/src/lib.c: 10: while(u16Delay){
      0085A4 1E 03            [ 2]   70 	ldw	x, (0x03, sp)
      0085A6                         71 00104$:
      0085A6 5D               [ 2]   72 	tnzw	x
      0085A7 27 14            [ 1]   73 	jreq	00107$
                                     74 ;	lib/src/lib.c: 11: TIM4->CNTR = (uint8_t)0;
      0085A9 35 00 53 46      [ 1]   75 	mov	0x5346+0, #0x00
                                     76 ;	lib/src/lib.c: 13: TIM4->SR1 = (uint8_t)(~0x01);
      0085AD 35 FE 53 44      [ 1]   77 	mov	0x5344+0, #0xfe
                                     78 ;	lib/src/lib.c: 14: while((TIM4->SR1 & (uint8_t)0x01) == RESET){}
      0085B1                         79 00101$:
      0085B1 90 AE 53 44      [ 2]   80 	ldw	y, #0x5344
      0085B5 90 F6            [ 1]   81 	ld	a, (y)
      0085B7 44               [ 1]   82 	srl	a
      0085B8 24 F7            [ 1]   83 	jrnc	00101$
                                     84 ;	lib/src/lib.c: 15: --u16Delay;
      0085BA 5A               [ 2]   85 	decw	x
      0085BB 20 E9            [ 2]   86 	jra	00104$
      0085BD                         87 00107$:
      0085BD 81               [ 4]   88 	ret
                                     89 ;	lib/src/lib.c: 21: void I2C_init(void)
                                     90 ;	-----------------------------------------
                                     91 ;	 function I2C_init
                                     92 ;	-----------------------------------------
      0085BE                         93 _I2C_init:
                                     94 ;	lib/src/lib.c: 23: I2C->CR1 = I2C_CR1_RESET_VALUE;
      0085BE 35 00 52 10      [ 1]   95 	mov	0x5210+0, #0x00
                                     96 ;	lib/src/lib.c: 24: I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ); /* Clear frequency bits */
      0085C2 AE 52 12         [ 2]   97 	ldw	x, #0x5212
      0085C5 F6               [ 1]   98 	ld	a, (x)
      0085C6 A4 C0            [ 1]   99 	and	a, #0xc0
      0085C8 F7               [ 1]  100 	ld	(x), a
                                    101 ;	lib/src/lib.c: 25: I2C->FREQR |= 16;	/*run 16mhz*/
      0085C9 AE 52 12         [ 2]  102 	ldw	x, #0x5212
      0085CC F6               [ 1]  103 	ld	a, (x)
      0085CD AA 10            [ 1]  104 	or	a, #0x10
      0085CF F7               [ 1]  105 	ld	(x), a
                                    106 ;	lib/src/lib.c: 29: I2C->CR1 &= (uint8_t)(~I2C_CR1_PE); 
      0085D0 72 11 52 10      [ 1]  107 	bres	0x5210, #0
                                    108 ;	lib/src/lib.c: 31: I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
      0085D4 AE 52 1C         [ 2]  109 	ldw	x, #0x521c
      0085D7 F6               [ 1]  110 	ld	a, (x)
      0085D8 A4 30            [ 1]  111 	and	a, #0x30
      0085DA F7               [ 1]  112 	ld	(x), a
                                    113 ;	lib/src/lib.c: 32: I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
      0085DB AE 52 1B         [ 2]  114 	ldw	x, #0x521b
      0085DE F6               [ 1]  115 	ld	a, (x)
      0085DF 35 00 52 1B      [ 1]  116 	mov	0x521b+0, #0x00
                                    117 ;	lib/src/lib.c: 35: I2C->CCRL = 0x50; 		/*SCL clock is 100khz */
      0085E3 35 50 52 1B      [ 1]  118 	mov	0x521b+0, #0x50
                                    119 ;	lib/src/lib.c: 36: I2C->CCRH = 0x00;
      0085E7 35 00 52 1C      [ 1]  120 	mov	0x521c+0, #0x00
                                    121 ;	lib/src/lib.c: 39: I2C->TRISER = 17;
      0085EB 35 11 52 1D      [ 1]  122 	mov	0x521d+0, #0x11
                                    123 ;	lib/src/lib.c: 44: I2C->OARH |=  (I2C_OARH_ADDCONF | (0x00));
      0085EF AE 52 14         [ 2]  124 	ldw	x, #0x5214
      0085F2 F6               [ 1]  125 	ld	a, (x)
      0085F3 AA 40            [ 1]  126 	or	a, #0x40
      0085F5 F7               [ 1]  127 	ld	(x), a
                                    128 ;	lib/src/lib.c: 46: I2C->CR1 |= I2C_CR1_PE;
      0085F6 72 10 52 10      [ 1]  129 	bset	0x5210, #0
      0085FA 81               [ 4]  130 	ret
                                    131 ;	lib/src/lib.c: 48: void I2C_start(void)
                                    132 ;	-----------------------------------------
                                    133 ;	 function I2C_start
                                    134 ;	-----------------------------------------
      0085FB                        135 _I2C_start:
                                    136 ;	lib/src/lib.c: 51: while((I2C->SR3 & (uint8_t)0x02)==SET); /* Check busy flag */
      0085FB                        137 00101$:
      0085FB AE 52 19         [ 2]  138 	ldw	x, #0x5219
      0085FE F6               [ 1]  139 	ld	a, (x)
      0085FF A4 02            [ 1]  140 	and	a, #0x02
      008601 A1 01            [ 1]  141 	cp	a, #0x01
      008603 27 F6            [ 1]  142 	jreq	00101$
                                    143 ;	lib/src/lib.c: 53: I2C->CR2 |= I2C_CR2_START; /* Generate a START condition */
      008605 72 10 52 11      [ 1]  144 	bset	0x5211, #0
                                    145 ;	lib/src/lib.c: 55: while((I2C->SR1 & I2C_SR1_SB) == 0);	
      008609                        146 00104$:
      008609 AE 52 17         [ 2]  147 	ldw	x, #0x5217
      00860C F6               [ 1]  148 	ld	a, (x)
      00860D 44               [ 1]  149 	srl	a
      00860E 24 F9            [ 1]  150 	jrnc	00104$
      008610 81               [ 4]  151 	ret
                                    152 ;	lib/src/lib.c: 57: void I2C_stop(void)
                                    153 ;	-----------------------------------------
                                    154 ;	 function I2C_stop
                                    155 ;	-----------------------------------------
      008611                        156 _I2C_stop:
                                    157 ;	lib/src/lib.c: 59: I2C->CR2 |= I2C_CR2_STOP;	/* Generate a STOP condition */
      008611 AE 52 11         [ 2]  158 	ldw	x, #0x5211
      008614 F6               [ 1]  159 	ld	a, (x)
      008615 AA 02            [ 1]  160 	or	a, #0x02
      008617 F7               [ 1]  161 	ld	(x), a
                                    162 ;	lib/src/lib.c: 61: I2C->SR1;       I2C->SR3;
      008618 AE 52 17         [ 2]  163 	ldw	x, #0x5217
      00861B F6               [ 1]  164 	ld	a, (x)
      00861C AE 52 19         [ 2]  165 	ldw	x, #0x5219
      00861F F6               [ 1]  166 	ld	a, (x)
      008620 81               [ 4]  167 	ret
                                    168 ;	lib/src/lib.c: 63: void I2C_address(uint8_t I2C_ADDR, I2C_Direction_TypeDef Direction)
                                    169 ;	-----------------------------------------
                                    170 ;	 function I2C_address
                                    171 ;	-----------------------------------------
      008621                        172 _I2C_address:
                                    173 ;	lib/src/lib.c: 65: I2C_ADDR &= (uint8_t)0xFE; /* Clear bit0 (direction) just in case */
      008621 7B 03            [ 1]  174 	ld	a, (0x03, sp)
      008623 A4 FE            [ 1]  175 	and	a, #0xfe
      008625 6B 03            [ 1]  176 	ld	(0x03, sp), a
                                    177 ;	lib/src/lib.c: 66: I2C->DR = (uint8_t)(I2C_ADDR | (uint8_t)Direction); /* Send the Address + Direction */ 
      008627 7B 03            [ 1]  178 	ld	a, (0x03, sp)
      008629 1A 04            [ 1]  179 	or	a, (0x04, sp)
      00862B AE 52 16         [ 2]  180 	ldw	x, #0x5216
      00862E F7               [ 1]  181 	ld	(x), a
                                    182 ;	lib/src/lib.c: 68: I2C->SR1;
      00862F AE 52 17         [ 2]  183 	ldw	x, #0x5217
      008632 F6               [ 1]  184 	ld	a, (x)
                                    185 ;	lib/src/lib.c: 69: while((I2C->SR1 & I2C_SR1_ADDR)==0);
      008633                        186 00101$:
      008633 AE 52 17         [ 2]  187 	ldw	x, #0x5217
      008636 F6               [ 1]  188 	ld	a, (x)
      008637 A5 02            [ 1]  189 	bcp	a, #0x02
      008639 27 F8            [ 1]  190 	jreq	00101$
      00863B 81               [ 4]  191 	ret
                                    192 ;	lib/src/lib.c: 71: void I2C_write(uint8_t data)
                                    193 ;	-----------------------------------------
                                    194 ;	 function I2C_write
                                    195 ;	-----------------------------------------
      00863C                        196 _I2C_write:
                                    197 ;	lib/src/lib.c: 73: I2C->SR1;
      00863C AE 52 17         [ 2]  198 	ldw	x, #0x5217
      00863F F6               [ 1]  199 	ld	a, (x)
                                    200 ;	lib/src/lib.c: 74: I2C->SR3;
      008640 AE 52 19         [ 2]  201 	ldw	x, #0x5219
      008643 F6               [ 1]  202 	ld	a, (x)
                                    203 ;	lib/src/lib.c: 76: I2C->DR = data;
      008644 AE 52 16         [ 2]  204 	ldw	x, #0x5216
      008647 7B 03            [ 1]  205 	ld	a, (0x03, sp)
      008649 F7               [ 1]  206 	ld	(x), a
                                    207 ;	lib/src/lib.c: 77: while((I2C->SR1 & I2C_SR1_TXE)==0);
      00864A                        208 00101$:
      00864A AE 52 17         [ 2]  209 	ldw	x, #0x5217
      00864D F6               [ 1]  210 	ld	a, (x)
      00864E 4D               [ 1]  211 	tnz	a
      00864F 2A F9            [ 1]  212 	jrpl	00101$
      008651 81               [ 4]  213 	ret
                                    214 ;	lib/src/lib.c: 80: void uart_init(void){
                                    215 ;	-----------------------------------------
                                    216 ;	 function uart_init
                                    217 ;	-----------------------------------------
      008652                        218 _uart_init:
                                    219 ;	lib/src/lib.c: 83: UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  /* Clear the word length bit */
      008652 AE 52 34         [ 2]  220 	ldw	x, #0x5234
      008655 F6               [ 1]  221 	ld	a, (x)
      008656 A4 EF            [ 1]  222 	and	a, #0xef
      008658 F7               [ 1]  223 	ld	(x), a
                                    224 ;	lib/src/lib.c: 84: UART1->CR1 |= (uint8_t)0x00; /* Set the word length bit, 8 Data bits */
      008659 AE 52 34         [ 2]  225 	ldw	x, #0x5234
      00865C F6               [ 1]  226 	ld	a, (x)
      00865D AE 52 34         [ 2]  227 	ldw	x, #0x5234
      008660 F7               [ 1]  228 	ld	(x), a
                                    229 ;	lib/src/lib.c: 85: UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  /* Clear the STOP bits */
      008661 AE 52 36         [ 2]  230 	ldw	x, #0x5236
      008664 F6               [ 1]  231 	ld	a, (x)
      008665 A4 CF            [ 1]  232 	and	a, #0xcf
      008667 F7               [ 1]  233 	ld	(x), a
                                    234 ;	lib/src/lib.c: 86: UART1->CR3 |= (uint8_t)0x00; /**< One stop bit is transmitted at the end of frame*/
      008668 AE 52 36         [ 2]  235 	ldw	x, #0x5236
      00866B F6               [ 1]  236 	ld	a, (x)
      00866C AE 52 36         [ 2]  237 	ldw	x, #0x5236
      00866F F7               [ 1]  238 	ld	(x), a
                                    239 ;	lib/src/lib.c: 88: UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  /* Clear the Parity Control bit */
      008670 AE 52 34         [ 2]  240 	ldw	x, #0x5234
      008673 F6               [ 1]  241 	ld	a, (x)
      008674 A4 F9            [ 1]  242 	and	a, #0xf9
      008676 F7               [ 1]  243 	ld	(x), a
                                    244 ;	lib/src/lib.c: 89: UART1->CR1 |= (uint8_t)0x00;  /* Set No Parity Control bit */
      008677 AE 52 34         [ 2]  245 	ldw	x, #0x5234
      00867A F6               [ 1]  246 	ld	a, (x)
      00867B AE 52 34         [ 2]  247 	ldw	x, #0x5234
      00867E F7               [ 1]  248 	ld	(x), a
                                    249 ;	lib/src/lib.c: 91: UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  /* Clear the LSB mantissa of UART1DIV  */
      00867F AE 52 32         [ 2]  250 	ldw	x, #0x5232
      008682 F6               [ 1]  251 	ld	a, (x)
      008683 35 00 52 32      [ 1]  252 	mov	0x5232+0, #0x00
                                    253 ;	lib/src/lib.c: 92: UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);	/* Clear the MSB mantissa of UART1DIV  */
      008687 AE 52 33         [ 2]  254 	ldw	x, #0x5233
      00868A F6               [ 1]  255 	ld	a, (x)
      00868B A4 0F            [ 1]  256 	and	a, #0x0f
      00868D F7               [ 1]  257 	ld	(x), a
                                    258 ;	lib/src/lib.c: 93: UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  /* Clear the Fraction bits of UART1DIV */
      00868E AE 52 33         [ 2]  259 	ldw	x, #0x5233
      008691 F6               [ 1]  260 	ld	a, (x)
      008692 A4 F0            [ 1]  261 	and	a, #0xf0
      008694 F7               [ 1]  262 	ld	(x), a
                                    263 ;	lib/src/lib.c: 103: UART1->BRR2 = (uint8_t)0x06;
      008695 35 06 52 33      [ 1]  264 	mov	0x5233+0, #0x06
                                    265 ;	lib/src/lib.c: 104: UART1->BRR1 = (uint8_t)0x11;
      008699 35 11 52 32      [ 1]  266 	mov	0x5232+0, #0x11
                                    267 ;	lib/src/lib.c: 106: UART1->CR2 |= (uint8_t)UART1_CR2_TEN; /*Transmit Enable and Receive Enable*/ 
      00869D AE 52 35         [ 2]  268 	ldw	x, #0x5235
      0086A0 F6               [ 1]  269 	ld	a, (x)
      0086A1 AA 08            [ 1]  270 	or	a, #0x08
      0086A3 F7               [ 1]  271 	ld	(x), a
                                    272 ;	lib/src/lib.c: 107: UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
      0086A4 AE 52 35         [ 2]  273 	ldw	x, #0x5235
      0086A7 F6               [ 1]  274 	ld	a, (x)
      0086A8 AA 04            [ 1]  275 	or	a, #0x04
      0086AA F7               [ 1]  276 	ld	(x), a
                                    277 ;	lib/src/lib.c: 108: UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); /*Sync mode Disable, SLK pin Disable*/
      0086AB AE 52 36         [ 2]  278 	ldw	x, #0x5236
      0086AE F6               [ 1]  279 	ld	a, (x)
      0086AF A4 F7            [ 1]  280 	and	a, #0xf7
      0086B1 F7               [ 1]  281 	ld	(x), a
                                    282 ;	lib/src/lib.c: 109: UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); /* UART1 Enable */
      0086B2 AE 52 34         [ 2]  283 	ldw	x, #0x5234
      0086B5 F6               [ 1]  284 	ld	a, (x)
      0086B6 A4 DF            [ 1]  285 	and	a, #0xdf
      0086B8 F7               [ 1]  286 	ld	(x), a
      0086B9 81               [ 4]  287 	ret
                                    288 ;	lib/src/lib.c: 111: void uart1_number(int number)
                                    289 ;	-----------------------------------------
                                    290 ;	 function uart1_number
                                    291 ;	-----------------------------------------
      0086BA                        292 _uart1_number:
      0086BA 52 0C            [ 2]  293 	sub	sp, #12
                                    294 ;	lib/src/lib.c: 113: char count = 0;
      0086BC 0F 06            [ 1]  295 	clr	(0x06, sp)
                                    296 ;	lib/src/lib.c: 114: char digit[5] = "";
      0086BE 96               [ 1]  297 	ldw	x, sp
      0086BF 5C               [ 2]  298 	incw	x
      0086C0 1F 07            [ 2]  299 	ldw	(0x07, sp), x
      0086C2 1E 07            [ 2]  300 	ldw	x, (0x07, sp)
      0086C4 7F               [ 1]  301 	clr	(x)
      0086C5 1E 07            [ 2]  302 	ldw	x, (0x07, sp)
      0086C7 5C               [ 2]  303 	incw	x
      0086C8 7F               [ 1]  304 	clr	(x)
      0086C9 1E 07            [ 2]  305 	ldw	x, (0x07, sp)
      0086CB 5C               [ 2]  306 	incw	x
      0086CC 5C               [ 2]  307 	incw	x
      0086CD 7F               [ 1]  308 	clr	(x)
      0086CE 1E 07            [ 2]  309 	ldw	x, (0x07, sp)
      0086D0 1C 00 03         [ 2]  310 	addw	x, #0x0003
      0086D3 7F               [ 1]  311 	clr	(x)
      0086D4 1E 07            [ 2]  312 	ldw	x, (0x07, sp)
      0086D6 1C 00 04         [ 2]  313 	addw	x, #0x0004
      0086D9 7F               [ 1]  314 	clr	(x)
                                    315 ;	lib/src/lib.c: 115: if(number == 0){
      0086DA 1E 0F            [ 2]  316 	ldw	x, (0x0f, sp)
      0086DC 26 07            [ 1]  317 	jrne	00102$
                                    318 ;	lib/src/lib.c: 116: count = 1;
      0086DE A6 01            [ 1]  319 	ld	a, #0x01
      0086E0 6B 06            [ 1]  320 	ld	(0x06, sp), a
                                    321 ;	lib/src/lib.c: 117: digit[0] = 0;
      0086E2 1E 07            [ 2]  322 	ldw	x, (0x07, sp)
      0086E4 7F               [ 1]  323 	clr	(x)
      0086E5                        324 00102$:
                                    325 ;	lib/src/lib.c: 119: if(number < 0){
      0086E5 0D 0F            [ 1]  326 	tnz	(0x0f, sp)
      0086E7 2A 1A            [ 1]  327 	jrpl	00119$
                                    328 ;	lib/src/lib.c: 120: number = fabsf(number);
      0086E9 1E 0F            [ 2]  329 	ldw	x, (0x0f, sp)
      0086EB 89               [ 2]  330 	pushw	x
      0086EC CD 8D D8         [ 4]  331 	call	___sint2fs
      0086EF 5B 02            [ 2]  332 	addw	sp, #2
      0086F1 89               [ 2]  333 	pushw	x
      0086F2 90 89            [ 2]  334 	pushw	y
      0086F4 CD 8D 64         [ 4]  335 	call	_fabsf
      0086F7 5B 04            [ 2]  336 	addw	sp, #4
      0086F9 89               [ 2]  337 	pushw	x
      0086FA 90 89            [ 2]  338 	pushw	y
      0086FC CD 8D 9A         [ 4]  339 	call	___fs2sint
      0086FF 5B 04            [ 2]  340 	addw	sp, #4
      008701 1F 0F            [ 2]  341 	ldw	(0x0f, sp), x
                                    342 ;	lib/src/lib.c: 123: while(number != 0)
      008703                        343 00119$:
      008703 7B 06            [ 1]  344 	ld	a, (0x06, sp)
      008705 6B 0C            [ 1]  345 	ld	(0x0c, sp), a
      008707                        346 00105$:
      008707 1E 0F            [ 2]  347 	ldw	x, (0x0f, sp)
      008709 27 2B            [ 1]  348 	jreq	00123$
                                    349 ;	lib/src/lib.c: 125: digit[count] = number%10;   //lay chu so ngoai cung xxxx8;
      00870B 5F               [ 1]  350 	clrw	x
      00870C 7B 0C            [ 1]  351 	ld	a, (0x0c, sp)
      00870E 97               [ 1]  352 	ld	xl, a
      00870F 72 FB 07         [ 2]  353 	addw	x, (0x07, sp)
      008712 1F 0A            [ 2]  354 	ldw	(0x0a, sp), x
      008714 4B 0A            [ 1]  355 	push	#0x0a
      008716 4B 00            [ 1]  356 	push	#0x00
      008718 1E 11            [ 2]  357 	ldw	x, (0x11, sp)
      00871A 89               [ 2]  358 	pushw	x
      00871B CD 90 F9         [ 4]  359 	call	__modsint
      00871E 5B 04            [ 2]  360 	addw	sp, #4
      008720 9F               [ 1]  361 	ld	a, xl
      008721 1E 0A            [ 2]  362 	ldw	x, (0x0a, sp)
      008723 F7               [ 1]  363 	ld	(x), a
                                    364 ;	lib/src/lib.c: 126: ++count;
      008724 0C 0C            [ 1]  365 	inc	(0x0c, sp)
                                    366 ;	lib/src/lib.c: 127: number = number/10;         //chia so number cho 10 de bo so ngoai cung xxxx
      008726 4B 0A            [ 1]  367 	push	#0x0a
      008728 4B 00            [ 1]  368 	push	#0x00
      00872A 1E 11            [ 2]  369 	ldw	x, (0x11, sp)
      00872C 89               [ 2]  370 	pushw	x
      00872D CD 91 0F         [ 4]  371 	call	__divsint
      008730 5B 04            [ 2]  372 	addw	sp, #4
      008732 1F 0F            [ 2]  373 	ldw	(0x0f, sp), x
      008734 20 D1            [ 2]  374 	jra	00105$
                                    375 ;	lib/src/lib.c: 129: while (count!=0)
      008736                        376 00123$:
      008736 7B 0C            [ 1]  377 	ld	a, (0x0c, sp)
      008738                        378 00111$:
      008738 4D               [ 1]  379 	tnz	a
      008739 27 1C            [ 1]  380 	jreq	00114$
                                    381 ;	lib/src/lib.c: 131: UART1->DR = (digit[count - 1] + 0x30); // 0x30 = 48 ;
      00873B 4A               [ 1]  382 	dec	a
      00873C 6B 09            [ 1]  383 	ld	(0x09, sp), a
      00873E 5F               [ 1]  384 	clrw	x
      00873F 7B 09            [ 1]  385 	ld	a, (0x09, sp)
      008741 97               [ 1]  386 	ld	xl, a
      008742 72 FB 07         [ 2]  387 	addw	x, (0x07, sp)
      008745 F6               [ 1]  388 	ld	a, (x)
      008746 AB 30            [ 1]  389 	add	a, #0x30
      008748 AE 52 31         [ 2]  390 	ldw	x, #0x5231
      00874B F7               [ 1]  391 	ld	(x), a
                                    392 ;	lib/src/lib.c: 132: while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET);
      00874C                        393 00108$:
      00874C AE 52 30         [ 2]  394 	ldw	x, #0x5230
      00874F F6               [ 1]  395 	ld	a, (x)
      008750 4D               [ 1]  396 	tnz	a
      008751 2A F9            [ 1]  397 	jrpl	00108$
                                    398 ;	lib/src/lib.c: 133: --count;
      008753 7B 09            [ 1]  399 	ld	a, (0x09, sp)
      008755 20 E1            [ 2]  400 	jra	00111$
      008757                        401 00114$:
      008757 5B 0C            [ 2]  402 	addw	sp, #12
      008759 81               [ 4]  403 	ret
                                    404 ;	lib/src/lib.c: 136: void uart1_string(const char *cy)
                                    405 ;	-----------------------------------------
                                    406 ;	 function uart1_string
                                    407 ;	-----------------------------------------
      00875A                        408 _uart1_string:
                                    409 ;	lib/src/lib.c: 138: while(*cy)
      00875A 16 03            [ 2]  410 	ldw	y, (0x03, sp)
      00875C                        411 00104$:
      00875C 90 F6            [ 1]  412 	ld	a, (y)
      00875E 4D               [ 1]  413 	tnz	a
      00875F 27 0F            [ 1]  414 	jreq	00107$
                                    415 ;	lib/src/lib.c: 140: UART1->DR = (*cy);
      008761 AE 52 31         [ 2]  416 	ldw	x, #0x5231
      008764 F7               [ 1]  417 	ld	(x), a
                                    418 ;	lib/src/lib.c: 141: while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET){}
      008765                        419 00101$:
      008765 AE 52 30         [ 2]  420 	ldw	x, #0x5230
      008768 F6               [ 1]  421 	ld	a, (x)
      008769 4D               [ 1]  422 	tnz	a
      00876A 2A F9            [ 1]  423 	jrpl	00101$
                                    424 ;	lib/src/lib.c: 142: cy++;
      00876C 90 5C            [ 2]  425 	incw	y
      00876E 20 EC            [ 2]  426 	jra	00104$
      008770                        427 00107$:
      008770 81               [ 4]  428 	ret
                                    429 ;	lib/src/lib.c: 145: void uart1_nline(void)
                                    430 ;	-----------------------------------------
                                    431 ;	 function uart1_nline
                                    432 ;	-----------------------------------------
      008771                        433 _uart1_nline:
                                    434 ;	lib/src/lib.c: 147: UART1->DR = (0x0a);
      008771 35 0A 52 31      [ 1]  435 	mov	0x5231+0, #0x0a
                                    436 ;	lib/src/lib.c: 148: while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET);
      008775                        437 00101$:
      008775 AE 52 30         [ 2]  438 	ldw	x, #0x5230
      008778 F6               [ 1]  439 	ld	a, (x)
      008779 4D               [ 1]  440 	tnz	a
      00877A 2A F9            [ 1]  441 	jrpl	00101$
      00877C 81               [ 4]  442 	ret
                                    443 	.area CODE
                                    444 	.area INITIALIZER
                                    445 	.area CABS (ABS)
