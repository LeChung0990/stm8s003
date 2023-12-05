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
                                     18 ;--------------------------------------------------------
                                     19 ; ram data
                                     20 ;--------------------------------------------------------
                                     21 	.area DATA
                                     22 ;--------------------------------------------------------
                                     23 ; ram data
                                     24 ;--------------------------------------------------------
                                     25 	.area INITIALIZED
                                     26 ;--------------------------------------------------------
                                     27 ; absolute external ram data
                                     28 ;--------------------------------------------------------
                                     29 	.area DABS (ABS)
                                     30 
                                     31 ; default segment ordering for linker
                                     32 	.area HOME
                                     33 	.area GSINIT
                                     34 	.area GSFINAL
                                     35 	.area CONST
                                     36 	.area INITIALIZER
                                     37 	.area CODE
                                     38 
                                     39 ;--------------------------------------------------------
                                     40 ; global & static initialisations
                                     41 ;--------------------------------------------------------
                                     42 	.area HOME
                                     43 	.area GSINIT
                                     44 	.area GSFINAL
                                     45 	.area GSINIT
                                     46 ;--------------------------------------------------------
                                     47 ; Home
                                     48 ;--------------------------------------------------------
                                     49 	.area HOME
                                     50 	.area HOME
                                     51 ;--------------------------------------------------------
                                     52 ; code
                                     53 ;--------------------------------------------------------
                                     54 	.area CODE
                                     55 ;	lib/src/lib.c: 2: void Timer4Config(void){
                                     56 ;	-----------------------------------------
                                     57 ;	 function Timer4Config
                                     58 ;	-----------------------------------------
      0084F8                         59 _Timer4Config:
                                     60 ;	lib/src/lib.c: 3: TIM4->PSCR = (uint8_t)0x07;
      0084F8 35 07 53 47      [ 1]   61 	mov	0x5347+0, #0x07
                                     62 ;	lib/src/lib.c: 4: TIM4->ARR = (uint8_t)125 - 1;
      0084FC 35 7C 53 48      [ 1]   63 	mov	0x5348+0, #0x7c
                                     64 ;	lib/src/lib.c: 6: TIM4->CR1 |= TIM4_CR1_CEN;
      008500 72 10 53 40      [ 1]   65 	bset	0x5340, #0
                                     66 ;	lib/src/lib.c: 7: }
      008504 81               [ 4]   67 	ret
                                     68 ;	lib/src/lib.c: 8: void Timer4DelayMs(uint16_t u16Delay){
                                     69 ;	-----------------------------------------
                                     70 ;	 function Timer4DelayMs
                                     71 ;	-----------------------------------------
      008505                         72 _Timer4DelayMs:
                                     73 ;	lib/src/lib.c: 9: while(u16Delay){
      008505                         74 00104$:
      008505 5D               [ 2]   75 	tnzw	x
      008506 26 01            [ 1]   76 	jrne	00130$
      008508 81               [ 4]   77 	ret
      008509                         78 00130$:
                                     79 ;	lib/src/lib.c: 10: TIM4->CNTR = (uint8_t)0;
      008509 35 00 53 46      [ 1]   80 	mov	0x5346+0, #0x00
                                     81 ;	lib/src/lib.c: 12: TIM4->SR1 = (uint8_t)(~0x01);
      00850D 35 FE 53 44      [ 1]   82 	mov	0x5344+0, #0xfe
                                     83 ;	lib/src/lib.c: 13: while((TIM4->SR1 & (uint8_t)0x01) == RESET){}
      008511                         84 00101$:
      008511 72 01 53 44 FB   [ 2]   85 	btjf	0x5344, #0, 00101$
                                     86 ;	lib/src/lib.c: 14: --u16Delay;
      008516 5A               [ 2]   87 	decw	x
      008517 20 EC            [ 2]   88 	jra	00104$
                                     89 ;	lib/src/lib.c: 16: }
      008519 81               [ 4]   90 	ret
                                     91 ;	lib/src/lib.c: 18: void I2C_init(void)
                                     92 ;	-----------------------------------------
                                     93 ;	 function I2C_init
                                     94 ;	-----------------------------------------
      00851A                         95 _I2C_init:
                                     96 ;	lib/src/lib.c: 20: I2C->CR1 = I2C_CR1_RESET_VALUE;
      00851A 35 00 52 10      [ 1]   97 	mov	0x5210+0, #0x00
                                     98 ;	lib/src/lib.c: 21: I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ); /* Clear frequency bits */
      00851E C6 52 12         [ 1]   99 	ld	a, 0x5212
      008521 A4 C0            [ 1]  100 	and	a, #0xc0
      008523 C7 52 12         [ 1]  101 	ld	0x5212, a
                                    102 ;	lib/src/lib.c: 22: I2C->FREQR |= 16;	/*run 16mhz*/
      008526 72 18 52 12      [ 1]  103 	bset	0x5212, #4
                                    104 ;	lib/src/lib.c: 26: I2C->CR1 &= (uint8_t)(~I2C_CR1_PE); 
      00852A 72 11 52 10      [ 1]  105 	bres	0x5210, #0
                                    106 ;	lib/src/lib.c: 28: I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
      00852E C6 52 1C         [ 1]  107 	ld	a, 0x521c
      008531 A4 30            [ 1]  108 	and	a, #0x30
      008533 C7 52 1C         [ 1]  109 	ld	0x521c, a
                                    110 ;	lib/src/lib.c: 29: I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
      008536 C6 52 1B         [ 1]  111 	ld	a, 0x521b
      008539 35 00 52 1B      [ 1]  112 	mov	0x521b+0, #0x00
                                    113 ;	lib/src/lib.c: 32: I2C->CCRL = 0x50; 		/*SCL clock is 100khz */
      00853D 35 50 52 1B      [ 1]  114 	mov	0x521b+0, #0x50
                                    115 ;	lib/src/lib.c: 33: I2C->CCRH = 0x00;
      008541 35 00 52 1C      [ 1]  116 	mov	0x521c+0, #0x00
                                    117 ;	lib/src/lib.c: 36: I2C->TRISER = 17;
      008545 35 11 52 1D      [ 1]  118 	mov	0x521d+0, #0x11
                                    119 ;	lib/src/lib.c: 41: I2C->OARH |=  (I2C_OARH_ADDCONF | (0x00));
      008549 72 1C 52 14      [ 1]  120 	bset	0x5214, #6
                                    121 ;	lib/src/lib.c: 43: I2C->CR1 |= I2C_CR1_PE;
      00854D 72 10 52 10      [ 1]  122 	bset	0x5210, #0
                                    123 ;	lib/src/lib.c: 44: }
      008551 81               [ 4]  124 	ret
                                    125 ;	lib/src/lib.c: 45: void I2C_start(void)
                                    126 ;	-----------------------------------------
                                    127 ;	 function I2C_start
                                    128 ;	-----------------------------------------
      008552                        129 _I2C_start:
                                    130 ;	lib/src/lib.c: 48: while((I2C->SR3 & (uint8_t)0x02)==SET); /* Check busy flag */
      008552                        131 00101$:
      008552 C6 52 19         [ 1]  132 	ld	a, 0x5219
      008555 A4 02            [ 1]  133 	and	a, #0x02
      008557 4A               [ 1]  134 	dec	a
      008558 27 F8            [ 1]  135 	jreq	00101$
                                    136 ;	lib/src/lib.c: 50: I2C->CR2 |= I2C_CR2_START; /* Generate a START condition */
      00855A 72 10 52 11      [ 1]  137 	bset	0x5211, #0
                                    138 ;	lib/src/lib.c: 52: while((I2C->SR1 & I2C_SR1_SB) == 0);	
      00855E                        139 00104$:
      00855E 72 01 52 17 FB   [ 2]  140 	btjf	0x5217, #0, 00104$
                                    141 ;	lib/src/lib.c: 53: }
      008563 81               [ 4]  142 	ret
                                    143 ;	lib/src/lib.c: 54: void I2C_stop(void)
                                    144 ;	-----------------------------------------
                                    145 ;	 function I2C_stop
                                    146 ;	-----------------------------------------
      008564                        147 _I2C_stop:
                                    148 ;	lib/src/lib.c: 56: I2C->CR2 |= I2C_CR2_STOP;	/* Generate a STOP condition */
      008564 72 12 52 11      [ 1]  149 	bset	0x5211, #1
                                    150 ;	lib/src/lib.c: 58: I2C->SR1;       I2C->SR3;
      008568 C6 52 17         [ 1]  151 	ld	a, 0x5217
      00856B C6 52 19         [ 1]  152 	ld	a, 0x5219
                                    153 ;	lib/src/lib.c: 59: }
      00856E 81               [ 4]  154 	ret
                                    155 ;	lib/src/lib.c: 60: void I2C_address(uint8_t I2C_ADDR, I2C_Direction_TypeDef Direction)
                                    156 ;	-----------------------------------------
                                    157 ;	 function I2C_address
                                    158 ;	-----------------------------------------
      00856F                        159 _I2C_address:
      00856F 88               [ 1]  160 	push	a
                                    161 ;	lib/src/lib.c: 62: I2C_ADDR &= (uint8_t)0xFE; /* Clear bit0 (direction) just in case */
      008570 A4 FE            [ 1]  162 	and	a, #0xfe
      008572 6B 01            [ 1]  163 	ld	(0x01, sp), a
                                    164 ;	lib/src/lib.c: 63: I2C->DR = (uint8_t)(I2C_ADDR | (uint8_t)Direction); /* Send the Address + Direction */ 
      008574 7B 04            [ 1]  165 	ld	a, (0x04, sp)
      008576 1A 01            [ 1]  166 	or	a, (0x01, sp)
      008578 C7 52 16         [ 1]  167 	ld	0x5216, a
                                    168 ;	lib/src/lib.c: 65: I2C->SR1;
      00857B C6 52 17         [ 1]  169 	ld	a, 0x5217
                                    170 ;	lib/src/lib.c: 66: while((I2C->SR1 & I2C_SR1_ADDR)==0);
      00857E A6 02            [ 1]  171 	ld	a,	#0x02
      008580                        172 00112$:
      008580 C5 52 17         [ 1]  173 	bcp	a,	0x5217
      008583 27 FB            [ 1]  174 	jreq	00112$
                                    175 ;	lib/src/lib.c: 67: }
      008585 84               [ 1]  176 	pop	a
      008586 85               [ 2]  177 	popw	x
      008587 84               [ 1]  178 	pop	a
      008588 FC               [ 2]  179 	jp	(x)
                                    180 ;	lib/src/lib.c: 68: void I2C_write(uint8_t data)
                                    181 ;	-----------------------------------------
                                    182 ;	 function I2C_write
                                    183 ;	-----------------------------------------
      008589                        184 _I2C_write:
      008589 88               [ 1]  185 	push	a
      00858A 6B 01            [ 1]  186 	ld	(0x01, sp), a
                                    187 ;	lib/src/lib.c: 70: I2C->SR1;
      00858C C6 52 17         [ 1]  188 	ld	a, 0x5217
                                    189 ;	lib/src/lib.c: 71: I2C->SR3;
      00858F C6 52 19         [ 1]  190 	ld	a, 0x5219
                                    191 ;	lib/src/lib.c: 73: I2C->DR = data;
      008592 AE 52 16         [ 2]  192 	ldw	x, #0x5216
      008595 7B 01            [ 1]  193 	ld	a, (0x01, sp)
      008597 F7               [ 1]  194 	ld	(x), a
                                    195 ;	lib/src/lib.c: 74: while((I2C->SR1 & I2C_SR1_TXE)==0);
      008598                        196 00101$:
      008598 C6 52 17         [ 1]  197 	ld	a, 0x5217
      00859B 2A FB            [ 1]  198 	jrpl	00101$
                                    199 ;	lib/src/lib.c: 75: }
      00859D 84               [ 1]  200 	pop	a
      00859E 81               [ 4]  201 	ret
                                    202 	.area CODE
                                    203 	.area CONST
                                    204 	.area INITIALIZER
                                    205 	.area CABS (ABS)
