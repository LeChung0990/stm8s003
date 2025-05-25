                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.3.0 #14184 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_mylib
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _clock_icon
                                     12 	.globl _station_icon
                                     13 	.globl _rssi
                                     14 	.globl _levelBAT_Tb
                                     15 	.globl _levelBAT_full
                                     16 	.globl _mixigamingLogo
                                     17 	.globl _lacoVietNam
                                     18 	.globl _Tim4_config
                                     19 	.globl _configADC
                                     20 	.globl _delay_us
                                     21 	.globl _delay_ms
                                     22 	.globl _BEEP_config
                                     23 	.globl _BEEP_Cmd
                                     24 	.globl _i2c_init
                                     25 	.globl _i2c_start
                                     26 	.globl _i2c_stop
                                     27 	.globl _i2c_write
                                     28 	.globl _i2c_read
                                     29 	.globl _data_write
                                     30 	.globl _data_read
                                     31 	.globl _decimal_to_bcd
                                     32 	.globl _writeTime
                                     33 	.globl _writeDay
                                     34 	.globl _Write_EEPROM
                                     35 	.globl _Read_EEPROM
                                     36 	.globl _SD1106_sendCom
                                     37 	.globl _SD1106_sendInitCom
                                     38 	.globl _SD1106_clear
                                     39 	.globl _SD1106_CUS_PRINT
                                     40 	.globl _print_levelBAT
                                     41 	.globl _print_rssi
                                     42 	.globl _station_chanel
                                     43 	.globl _clock_icon_ds
                                     44 	.globl _SD1106_setContranst
                                     45 	.globl _SD1106_resetDis
                                     46 	.globl _SD1106_flipScreen
                                     47 	.globl _SD1106_printP
                                     48 	.globl _SD1106_print_one_num
                                     49 	.globl _SD1106_printNum
                                     50 	.globl _SD1106_printBigNum
                                     51 	.globl _SD1106_printBigPoint
                                     52 	.globl _SD1106_printBigLine
                                     53 ;--------------------------------------------------------
                                     54 ; ram data
                                     55 ;--------------------------------------------------------
                                     56 	.area DATA
                                     57 ;--------------------------------------------------------
                                     58 ; ram data
                                     59 ;--------------------------------------------------------
                                     60 	.area INITIALIZED
                                     61 ;--------------------------------------------------------
                                     62 ; absolute external ram data
                                     63 ;--------------------------------------------------------
                                     64 	.area DABS (ABS)
                                     65 
                                     66 ; default segment ordering for linker
                                     67 	.area HOME
                                     68 	.area GSINIT
                                     69 	.area GSFINAL
                                     70 	.area CONST
                                     71 	.area INITIALIZER
                                     72 	.area CODE
                                     73 
                                     74 ;--------------------------------------------------------
                                     75 ; global & static initialisations
                                     76 ;--------------------------------------------------------
                                     77 	.area HOME
                                     78 	.area GSINIT
                                     79 	.area GSFINAL
                                     80 	.area GSINIT
                                     81 ;--------------------------------------------------------
                                     82 ; Home
                                     83 ;--------------------------------------------------------
                                     84 	.area HOME
                                     85 	.area HOME
                                     86 ;--------------------------------------------------------
                                     87 ; code
                                     88 ;--------------------------------------------------------
                                     89 	.area CODE
                                     90 ;	lib/src/stm8s_mylib.c: 207: void Tim4_config(void){
                                     91 ;	-----------------------------------------
                                     92 ;	 function Tim4_config
                                     93 ;	-----------------------------------------
      0090A9                         94 _Tim4_config:
                                     95 ;	lib/src/stm8s_mylib.c: 208: TIM4->PSCR = (uint8_t)TIM4_PRESCALER_128;
      0090A9 35 07 53 47      [ 1]   96 	mov	0x5347+0, #0x07
                                     97 ;	lib/src/stm8s_mylib.c: 209: TIM4->ARR = (uint8_t)125 - 1;
      0090AD 35 7C 53 48      [ 1]   98 	mov	0x5348+0, #0x7c
                                     99 ;	lib/src/stm8s_mylib.c: 212: TIM4->IER |= (uint8_t)TIM4_IT_UPDATE;
      0090B1 72 10 53 43      [ 1]  100 	bset	0x5343, #0
                                    101 ;	lib/src/stm8s_mylib.c: 215: TIM4->SR1 = (uint8_t)(~TIM4_FLAG_UPDATE);
      0090B5 35 FE 53 44      [ 1]  102 	mov	0x5344+0, #0xfe
                                    103 ;	lib/src/stm8s_mylib.c: 218: TIM4->CR1 |= TIM4_CR1_CEN;
      0090B9 C6 53 40         [ 1]  104 	ld	a, 0x5340
      0090BC AA 01            [ 1]  105 	or	a, #0x01
      0090BE C7 53 40         [ 1]  106 	ld	0x5340, a
                                    107 ;	lib/src/stm8s_mylib.c: 220: enableInterrupts(); 
      0090C1 9A               [ 1]  108 	rim
                                    109 ;	lib/src/stm8s_mylib.c: 221: }
      0090C2 81               [ 4]  110 	ret
                                    111 ;	lib/src/stm8s_mylib.c: 222: void configADC(void){
                                    112 ;	-----------------------------------------
                                    113 ;	 function configADC
                                    114 ;	-----------------------------------------
      0090C3                        115 _configADC:
                                    116 ;	lib/src/stm8s_mylib.c: 223: ADC1->CSR  = ADC1_CSR_RESET_VALUE;
      0090C3 35 00 54 00      [ 1]  117 	mov	0x5400+0, #0x00
                                    118 ;	lib/src/stm8s_mylib.c: 224: ADC1->CR1  = ADC1_CR1_RESET_VALUE;
      0090C7 35 00 54 01      [ 1]  119 	mov	0x5401+0, #0x00
                                    120 ;	lib/src/stm8s_mylib.c: 225: ADC1->CR2  = ADC1_CR2_RESET_VALUE;
      0090CB 35 00 54 02      [ 1]  121 	mov	0x5402+0, #0x00
                                    122 ;	lib/src/stm8s_mylib.c: 226: ADC1->CR3  = ADC1_CR3_RESET_VALUE;
      0090CF 35 00 54 03      [ 1]  123 	mov	0x5403+0, #0x00
                                    124 ;	lib/src/stm8s_mylib.c: 227: ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
      0090D3 35 00 54 06      [ 1]  125 	mov	0x5406+0, #0x00
                                    126 ;	lib/src/stm8s_mylib.c: 228: ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
      0090D7 35 00 54 07      [ 1]  127 	mov	0x5407+0, #0x00
                                    128 ;	lib/src/stm8s_mylib.c: 229: ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
      0090DB 35 FF 54 08      [ 1]  129 	mov	0x5408+0, #0xff
                                    130 ;	lib/src/stm8s_mylib.c: 230: ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
      0090DF 35 03 54 09      [ 1]  131 	mov	0x5409+0, #0x03
                                    132 ;	lib/src/stm8s_mylib.c: 231: ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
      0090E3 35 00 54 0A      [ 1]  133 	mov	0x540a+0, #0x00
                                    134 ;	lib/src/stm8s_mylib.c: 232: ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
      0090E7 35 00 54 0B      [ 1]  135 	mov	0x540b+0, #0x00
                                    136 ;	lib/src/stm8s_mylib.c: 233: ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
      0090EB 35 00 54 0E      [ 1]  137 	mov	0x540e+0, #0x00
                                    138 ;	lib/src/stm8s_mylib.c: 234: ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
      0090EF 35 00 54 0F      [ 1]  139 	mov	0x540f+0, #0x00
                                    140 ;	lib/src/stm8s_mylib.c: 236: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
      0090F3 72 17 54 02      [ 1]  141 	bres	0x5402, #3
                                    142 ;	lib/src/stm8s_mylib.c: 238: ADC1->CR2 |= (uint8_t)(ADC1_ALIGN_RIGHT);
      0090F7 72 16 54 02      [ 1]  143 	bset	0x5402, #3
                                    144 ;	lib/src/stm8s_mylib.c: 240: ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
      0090FB 72 13 54 01      [ 1]  145 	bres	0x5401, #1
                                    146 ;	lib/src/stm8s_mylib.c: 243: ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
      0090FF C6 54 00         [ 1]  147 	ld	a, 0x5400
      009102 A4 F0            [ 1]  148 	and	a, #0xf0
      009104 C7 54 00         [ 1]  149 	ld	0x5400, a
                                    150 ;	lib/src/stm8s_mylib.c: 245: ADC1->CSR |= (uint8_t)(ADC1_CHANNEL_4);
      009107 72 14 54 00      [ 1]  151 	bset	0x5400, #2
                                    152 ;	lib/src/stm8s_mylib.c: 248: ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
      00910B C6 54 01         [ 1]  153 	ld	a, 0x5401
      00910E A4 8F            [ 1]  154 	and	a, #0x8f
      009110 C7 54 01         [ 1]  155 	ld	0x5401, a
                                    156 ;	lib/src/stm8s_mylib.c: 250: ADC1->CR1 |= (uint8_t)(ADC1_PRESSEL_FCPU_D18);
      009113 C6 54 01         [ 1]  157 	ld	a, 0x5401
      009116 AA 70            [ 1]  158 	or	a, #0x70
      009118 C7 54 01         [ 1]  159 	ld	0x5401, a
                                    160 ;	lib/src/stm8s_mylib.c: 254: ADC1->CSR |= (uint8_t)ADC1_IT_EOCIE;
      00911B 72 1A 54 00      [ 1]  161 	bset	0x5400, #5
                                    162 ;	lib/src/stm8s_mylib.c: 257: ADC1->CR1 |=  ADC1_CR1_ADON;
      00911F 72 10 54 01      [ 1]  163 	bset	0x5401, #0
                                    164 ;	lib/src/stm8s_mylib.c: 258: }
      009123 81               [ 4]  165 	ret
                                    166 ;	lib/src/stm8s_mylib.c: 259: void delay_us(unsigned long int  us) {
                                    167 ;	-----------------------------------------
                                    168 ;	 function delay_us
                                    169 ;	-----------------------------------------
      009124                        170 _delay_us:
                                    171 ;	lib/src/stm8s_mylib.c: 260: for(;us > 0; us--) nop();
      009124 1E 05            [ 2]  172 	ldw	x, (0x05, sp)
      009126 16 03            [ 2]  173 	ldw	y, (0x03, sp)
      009128                        174 00103$:
      009128 5D               [ 2]  175 	tnzw	x
      009129 26 04            [ 1]  176 	jrne	00120$
      00912B 90 5D            [ 2]  177 	tnzw	y
      00912D 27 0A            [ 1]  178 	jreq	00105$
      00912F                        179 00120$:
      00912F 9D               [ 1]  180 	nop
      009130 1D 00 01         [ 2]  181 	subw	x, #0x0001
      009133 24 F3            [ 1]  182 	jrnc	00103$
      009135 90 5A            [ 2]  183 	decw	y
      009137 20 EF            [ 2]  184 	jra	00103$
      009139                        185 00105$:
                                    186 ;	lib/src/stm8s_mylib.c: 261: }
      009139 1E 01            [ 2]  187 	ldw	x, (1, sp)
      00913B 5B 06            [ 2]  188 	addw	sp, #6
      00913D FC               [ 2]  189 	jp	(x)
                                    190 ;	lib/src/stm8s_mylib.c: 262: void delay_ms(unsigned int  u16Delay)
                                    191 ;	-----------------------------------------
                                    192 ;	 function delay_ms
                                    193 ;	-----------------------------------------
      00913E                        194 _delay_ms:
      00913E                        195 00103$:
                                    196 ;	lib/src/stm8s_mylib.c: 264: for(; u16Delay > 0; u16Delay--) delay_us(1000);
      00913E 5D               [ 2]  197 	tnzw	x
      00913F 26 01            [ 1]  198 	jrne	00120$
      009141 81               [ 4]  199 	ret
      009142                        200 00120$:
      009142 89               [ 2]  201 	pushw	x
      009143 4B E8            [ 1]  202 	push	#0xe8
      009145 4B 03            [ 1]  203 	push	#0x03
      009147 4B 00            [ 1]  204 	push	#0x00
      009149 4B 00            [ 1]  205 	push	#0x00
      00914B CD 91 24         [ 4]  206 	call	_delay_us
      00914E 85               [ 2]  207 	popw	x
      00914F 5A               [ 2]  208 	decw	x
      009150 20 EC            [ 2]  209 	jra	00103$
                                    210 ;	lib/src/stm8s_mylib.c: 265: }
      009152 81               [ 4]  211 	ret
                                    212 ;	lib/src/stm8s_mylib.c: 266: void BEEP_config(void){
                                    213 ;	-----------------------------------------
                                    214 ;	 function BEEP_config
                                    215 ;	-----------------------------------------
      009153                        216 _BEEP_config:
                                    217 ;	lib/src/stm8s_mylib.c: 268: BEEP->CSR = BEEP_CSR_RESET_VALUE;
      009153 35 1F 50 F3      [ 1]  218 	mov	0x50f3+0, #0x1f
                                    219 ;	lib/src/stm8s_mylib.c: 270: if ((BEEP->CSR & BEEP_CSR_BEEPDIV) == BEEP_CSR_BEEPDIV)
      009157 C6 50 F3         [ 1]  220 	ld	a, 0x50f3
      00915A 43               [ 1]  221 	cpl	a
      00915B A5 1F            [ 1]  222 	bcp	a, #0x1f
      00915D 26 10            [ 1]  223 	jrne	00102$
                                    224 ;	lib/src/stm8s_mylib.c: 272: BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
      00915F C6 50 F3         [ 1]  225 	ld	a, 0x50f3
      009162 A4 E0            [ 1]  226 	and	a, #0xe0
      009164 C7 50 F3         [ 1]  227 	ld	0x50f3, a
                                    228 ;	lib/src/stm8s_mylib.c: 273: BEEP->CSR |= 0x0B; /*!< Default value when calibration is not done */
      009167 C6 50 F3         [ 1]  229 	ld	a, 0x50f3
      00916A AA 0B            [ 1]  230 	or	a, #0x0b
      00916C C7 50 F3         [ 1]  231 	ld	0x50f3, a
      00916F                        232 00102$:
                                    233 ;	lib/src/stm8s_mylib.c: 276: BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPSEL);
      00916F C6 50 F3         [ 1]  234 	ld	a, 0x50f3
      009172 A4 3F            [ 1]  235 	and	a, #0x3f
      009174 C7 50 F3         [ 1]  236 	ld	0x50f3, a
                                    237 ;	lib/src/stm8s_mylib.c: 277: BEEP->CSR |= (uint8_t)(0x80); /*!< Beep signal output frequency equals to 4 KHz */
      009177 72 1E 50 F3      [ 1]  238 	bset	0x50f3, #7
                                    239 ;	lib/src/stm8s_mylib.c: 283: BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPEN);
      00917B 72 1B 50 F3      [ 1]  240 	bres	0x50f3, #5
                                    241 ;	lib/src/stm8s_mylib.c: 284: }
      00917F 81               [ 4]  242 	ret
                                    243 ;	lib/src/stm8s_mylib.c: 285: void BEEP_Cmd(FunctionalState NewState)
                                    244 ;	-----------------------------------------
                                    245 ;	 function BEEP_Cmd
                                    246 ;	-----------------------------------------
      009180                        247 _BEEP_Cmd:
      009180 88               [ 1]  248 	push	a
      009181 6B 01            [ 1]  249 	ld	(0x01, sp), a
                                    250 ;	lib/src/stm8s_mylib.c: 290: BEEP->CSR |= BEEP_CSR_BEEPEN;
      009183 C6 50 F3         [ 1]  251 	ld	a, 0x50f3
                                    252 ;	lib/src/stm8s_mylib.c: 287: if (NewState != DISABLE)
      009186 0D 01            [ 1]  253 	tnz	(0x01, sp)
      009188 27 07            [ 1]  254 	jreq	00102$
                                    255 ;	lib/src/stm8s_mylib.c: 290: BEEP->CSR |= BEEP_CSR_BEEPEN;
      00918A AA 20            [ 1]  256 	or	a, #0x20
      00918C C7 50 F3         [ 1]  257 	ld	0x50f3, a
      00918F 20 05            [ 2]  258 	jra	00104$
      009191                        259 00102$:
                                    260 ;	lib/src/stm8s_mylib.c: 295: BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPEN);
      009191 A4 DF            [ 1]  261 	and	a, #0xdf
      009193 C7 50 F3         [ 1]  262 	ld	0x50f3, a
      009196                        263 00104$:
                                    264 ;	lib/src/stm8s_mylib.c: 297: }
      009196 84               [ 1]  265 	pop	a
      009197 81               [ 4]  266 	ret
                                    267 ;	lib/src/stm8s_mylib.c: 298: void i2c_init(void)
                                    268 ;	-----------------------------------------
                                    269 ;	 function i2c_init
                                    270 ;	-----------------------------------------
      009198                        271 _i2c_init:
                                    272 ;	lib/src/stm8s_mylib.c: 304: SDA_1;
      009198 72 1A 50 05      [ 1]  273 	bset	0x5005, #5
                                    274 ;	lib/src/stm8s_mylib.c: 305: SCL_1;
      00919C 72 18 50 05      [ 1]  275 	bset	0x5005, #4
                                    276 ;	lib/src/stm8s_mylib.c: 306: }
      0091A0 81               [ 4]  277 	ret
                                    278 ;	lib/src/stm8s_mylib.c: 307: void i2c_start(void)
                                    279 ;	-----------------------------------------
                                    280 ;	 function i2c_start
                                    281 ;	-----------------------------------------
      0091A1                        282 _i2c_start:
                                    283 ;	lib/src/stm8s_mylib.c: 316: SCL_1;
      0091A1 72 18 50 05      [ 1]  284 	bset	0x5005, #4
                                    285 ;	lib/src/stm8s_mylib.c: 317: DELAYI2C;
      0091A5 4B 03            [ 1]  286 	push	#0x03
      0091A7 5F               [ 1]  287 	clrw	x
      0091A8 89               [ 2]  288 	pushw	x
      0091A9 4B 00            [ 1]  289 	push	#0x00
      0091AB CD 91 24         [ 4]  290 	call	_delay_us
                                    291 ;	lib/src/stm8s_mylib.c: 318: SDA_1;
      0091AE 72 1A 50 05      [ 1]  292 	bset	0x5005, #5
                                    293 ;	lib/src/stm8s_mylib.c: 319: DELAYI2C;
      0091B2 4B 03            [ 1]  294 	push	#0x03
      0091B4 5F               [ 1]  295 	clrw	x
      0091B5 89               [ 2]  296 	pushw	x
      0091B6 4B 00            [ 1]  297 	push	#0x00
      0091B8 CD 91 24         [ 4]  298 	call	_delay_us
                                    299 ;	lib/src/stm8s_mylib.c: 320: SDA_0;
      0091BB 72 1B 50 05      [ 1]  300 	bres	0x5005, #5
                                    301 ;	lib/src/stm8s_mylib.c: 321: DELAYI2C;
      0091BF 4B 03            [ 1]  302 	push	#0x03
      0091C1 5F               [ 1]  303 	clrw	x
      0091C2 89               [ 2]  304 	pushw	x
      0091C3 4B 00            [ 1]  305 	push	#0x00
      0091C5 CD 91 24         [ 4]  306 	call	_delay_us
                                    307 ;	lib/src/stm8s_mylib.c: 322: SCL_0;
      0091C8 72 19 50 05      [ 1]  308 	bres	0x5005, #4
                                    309 ;	lib/src/stm8s_mylib.c: 323: DELAYI2C;
      0091CC 4B 03            [ 1]  310 	push	#0x03
      0091CE 5F               [ 1]  311 	clrw	x
      0091CF 89               [ 2]  312 	pushw	x
      0091D0 4B 00            [ 1]  313 	push	#0x00
      0091D2 CD 91 24         [ 4]  314 	call	_delay_us
                                    315 ;	lib/src/stm8s_mylib.c: 325: }
      0091D5 81               [ 4]  316 	ret
                                    317 ;	lib/src/stm8s_mylib.c: 326: void i2c_stop(void)
                                    318 ;	-----------------------------------------
                                    319 ;	 function i2c_stop
                                    320 ;	-----------------------------------------
      0091D6                        321 _i2c_stop:
                                    322 ;	lib/src/stm8s_mylib.c: 330: SDA_0;
      0091D6 72 1B 50 05      [ 1]  323 	bres	0x5005, #5
                                    324 ;	lib/src/stm8s_mylib.c: 331: DELAYI2C;
      0091DA 4B 03            [ 1]  325 	push	#0x03
      0091DC 5F               [ 1]  326 	clrw	x
      0091DD 89               [ 2]  327 	pushw	x
      0091DE 4B 00            [ 1]  328 	push	#0x00
      0091E0 CD 91 24         [ 4]  329 	call	_delay_us
                                    330 ;	lib/src/stm8s_mylib.c: 332: SCL_1;
      0091E3 72 18 50 05      [ 1]  331 	bset	0x5005, #4
                                    332 ;	lib/src/stm8s_mylib.c: 333: DELAYI2C;
      0091E7 4B 03            [ 1]  333 	push	#0x03
      0091E9 5F               [ 1]  334 	clrw	x
      0091EA 89               [ 2]  335 	pushw	x
      0091EB 4B 00            [ 1]  336 	push	#0x00
      0091ED CD 91 24         [ 4]  337 	call	_delay_us
                                    338 ;	lib/src/stm8s_mylib.c: 334: SDA_1;
      0091F0 72 1A 50 05      [ 1]  339 	bset	0x5005, #5
                                    340 ;	lib/src/stm8s_mylib.c: 335: DELAYI2C;
      0091F4 4B 03            [ 1]  341 	push	#0x03
      0091F6 5F               [ 1]  342 	clrw	x
      0091F7 89               [ 2]  343 	pushw	x
      0091F8 4B 00            [ 1]  344 	push	#0x00
      0091FA CD 91 24         [ 4]  345 	call	_delay_us
                                    346 ;	lib/src/stm8s_mylib.c: 336: }
      0091FD 81               [ 4]  347 	ret
                                    348 ;	lib/src/stm8s_mylib.c: 337: uint8_t i2c_write(uint8_t u8Data)
                                    349 ;	-----------------------------------------
                                    350 ;	 function i2c_write
                                    351 ;	-----------------------------------------
      0091FE                        352 _i2c_write:
      0091FE 52 02            [ 2]  353 	sub	sp, #2
      009200 6B 01            [ 1]  354 	ld	(0x01, sp), a
                                    355 ;	lib/src/stm8s_mylib.c: 345: for (i = 0; i < 8; ++i) {
      009202 0F 02            [ 1]  356 	clr	(0x02, sp)
      009204                        357 00108$:
                                    358 ;	lib/src/stm8s_mylib.c: 347: SDA_1;
      009204 C6 50 05         [ 1]  359 	ld	a, 0x5005
                                    360 ;	lib/src/stm8s_mylib.c: 346: if (u8Data & 0x80) {
      009207 0D 01            [ 1]  361 	tnz	(0x01, sp)
      009209 2A 07            [ 1]  362 	jrpl	00102$
                                    363 ;	lib/src/stm8s_mylib.c: 347: SDA_1;
      00920B AA 20            [ 1]  364 	or	a, #0x20
      00920D C7 50 05         [ 1]  365 	ld	0x5005, a
      009210 20 05            [ 2]  366 	jra	00103$
      009212                        367 00102$:
                                    368 ;	lib/src/stm8s_mylib.c: 349: SDA_0;
      009212 A4 DF            [ 1]  369 	and	a, #0xdf
      009214 C7 50 05         [ 1]  370 	ld	0x5005, a
      009217                        371 00103$:
                                    372 ;	lib/src/stm8s_mylib.c: 351: DELAYI2C;
      009217 4B 03            [ 1]  373 	push	#0x03
      009219 5F               [ 1]  374 	clrw	x
      00921A 89               [ 2]  375 	pushw	x
      00921B 4B 00            [ 1]  376 	push	#0x00
      00921D CD 91 24         [ 4]  377 	call	_delay_us
                                    378 ;	lib/src/stm8s_mylib.c: 352: SCL_1;
      009220 72 18 50 05      [ 1]  379 	bset	0x5005, #4
                                    380 ;	lib/src/stm8s_mylib.c: 353: DELAYI2C;
      009224 4B 03            [ 1]  381 	push	#0x03
      009226 5F               [ 1]  382 	clrw	x
      009227 89               [ 2]  383 	pushw	x
      009228 4B 00            [ 1]  384 	push	#0x00
      00922A CD 91 24         [ 4]  385 	call	_delay_us
                                    386 ;	lib/src/stm8s_mylib.c: 354: SCL_0;
      00922D 72 19 50 05      [ 1]  387 	bres	0x5005, #4
                                    388 ;	lib/src/stm8s_mylib.c: 356: u8Data <<= 1;
      009231 08 01            [ 1]  389 	sll	(0x01, sp)
                                    390 ;	lib/src/stm8s_mylib.c: 345: for (i = 0; i < 8; ++i) {
      009233 0C 02            [ 1]  391 	inc	(0x02, sp)
      009235 7B 02            [ 1]  392 	ld	a, (0x02, sp)
      009237 A1 08            [ 1]  393 	cp	a, #0x08
      009239 25 C9            [ 1]  394 	jrc	00108$
                                    395 ;	lib/src/stm8s_mylib.c: 359: SDA_0;
      00923B 72 1B 50 05      [ 1]  396 	bres	0x5005, #5
                                    397 ;	lib/src/stm8s_mylib.c: 360: DELAYI2C;
      00923F 4B 03            [ 1]  398 	push	#0x03
      009241 5F               [ 1]  399 	clrw	x
      009242 89               [ 2]  400 	pushw	x
      009243 4B 00            [ 1]  401 	push	#0x00
      009245 CD 91 24         [ 4]  402 	call	_delay_us
                                    403 ;	lib/src/stm8s_mylib.c: 362: SCL_1;
      009248 72 18 50 05      [ 1]  404 	bset	0x5005, #4
                                    405 ;	lib/src/stm8s_mylib.c: 363: DELAYI2C;
      00924C 4B 03            [ 1]  406 	push	#0x03
      00924E 5F               [ 1]  407 	clrw	x
      00924F 89               [ 2]  408 	pushw	x
      009250 4B 00            [ 1]  409 	push	#0x00
      009252 CD 91 24         [ 4]  410 	call	_delay_us
                                    411 ;	lib/src/stm8s_mylib.c: 364: SCL_0;
      009255 72 19 50 05      [ 1]  412 	bres	0x5005, #4
                                    413 ;	lib/src/stm8s_mylib.c: 365: DELAYI2C;
      009259 4B 03            [ 1]  414 	push	#0x03
      00925B 5F               [ 1]  415 	clrw	x
      00925C 89               [ 2]  416 	pushw	x
      00925D 4B 00            [ 1]  417 	push	#0x00
      00925F CD 91 24         [ 4]  418 	call	_delay_us
                                    419 ;	lib/src/stm8s_mylib.c: 366: SDA_1;
      009262 72 1A 50 05      [ 1]  420 	bset	0x5005, #5
                                    421 ;	lib/src/stm8s_mylib.c: 367: if (SDA_VAL) {
      009266 72 0B 50 06 02   [ 2]  422 	btjf	0x5006, #5, 00106$
                                    423 ;	lib/src/stm8s_mylib.c: 368: u8Ret = 0;
      00926B 4F               [ 1]  424 	clr	a
                                    425 ;	lib/src/stm8s_mylib.c: 370: u8Ret = 1;
      00926C C5                     426 	.byte 0xc5
      00926D                        427 00106$:
      00926D A6 01            [ 1]  428 	ld	a, #0x01
      00926F                        429 00107$:
                                    430 ;	lib/src/stm8s_mylib.c: 372: DELAYI2C;
      00926F 88               [ 1]  431 	push	a
      009270 4B 03            [ 1]  432 	push	#0x03
      009272 5F               [ 1]  433 	clrw	x
      009273 89               [ 2]  434 	pushw	x
      009274 4B 00            [ 1]  435 	push	#0x00
      009276 CD 91 24         [ 4]  436 	call	_delay_us
      009279 84               [ 1]  437 	pop	a
                                    438 ;	lib/src/stm8s_mylib.c: 373: return u8Ret;
                                    439 ;	lib/src/stm8s_mylib.c: 374: }
      00927A 5B 02            [ 2]  440 	addw	sp, #2
      00927C 81               [ 4]  441 	ret
                                    442 ;	lib/src/stm8s_mylib.c: 375: uint8_t i2c_read(uint8_t Ack)
                                    443 ;	-----------------------------------------
                                    444 ;	 function i2c_read
                                    445 ;	-----------------------------------------
      00927D                        446 _i2c_read:
      00927D 52 03            [ 2]  447 	sub	sp, #3
      00927F 6B 01            [ 1]  448 	ld	(0x01, sp), a
                                    449 ;	lib/src/stm8s_mylib.c: 377: uint8_t u8DataRead = 0;
      009281 0F 02            [ 1]  450 	clr	(0x02, sp)
                                    451 ;	lib/src/stm8s_mylib.c: 379: SDA_1;
      009283 72 1A 50 05      [ 1]  452 	bset	0x5005, #5
                                    453 ;	lib/src/stm8s_mylib.c: 380: for (i = 0; i < 8; ++i)
      009287 0F 03            [ 1]  454 	clr	(0x03, sp)
      009289                        455 00107$:
                                    456 ;	lib/src/stm8s_mylib.c: 382: u8DataRead = u8DataRead << 1;
      009289 08 02            [ 1]  457 	sll	(0x02, sp)
                                    458 ;	lib/src/stm8s_mylib.c: 383: SCL_1;
      00928B 72 18 50 05      [ 1]  459 	bset	0x5005, #4
                                    460 ;	lib/src/stm8s_mylib.c: 384: DELAYI2C;
      00928F 4B 03            [ 1]  461 	push	#0x03
      009291 5F               [ 1]  462 	clrw	x
      009292 89               [ 2]  463 	pushw	x
      009293 4B 00            [ 1]  464 	push	#0x00
      009295 CD 91 24         [ 4]  465 	call	_delay_us
                                    466 ;	lib/src/stm8s_mylib.c: 385: if (SDA_VAL)
      009298 72 0B 50 06 05   [ 2]  467 	btjf	0x5006, #5, 00102$
                                    468 ;	lib/src/stm8s_mylib.c: 387: u8DataRead = u8DataRead | 0x01;
      00929D 04 02            [ 1]  469 	srl	(0x02, sp)
      00929F 99               [ 1]  470 	scf
      0092A0 09 02            [ 1]  471 	rlc	(0x02, sp)
      0092A2                        472 00102$:
                                    473 ;	lib/src/stm8s_mylib.c: 389: DELAYI2C;
      0092A2 4B 03            [ 1]  474 	push	#0x03
      0092A4 5F               [ 1]  475 	clrw	x
      0092A5 89               [ 2]  476 	pushw	x
      0092A6 4B 00            [ 1]  477 	push	#0x00
      0092A8 CD 91 24         [ 4]  478 	call	_delay_us
                                    479 ;	lib/src/stm8s_mylib.c: 390: SCL_0;
      0092AB 72 19 50 05      [ 1]  480 	bres	0x5005, #4
                                    481 ;	lib/src/stm8s_mylib.c: 391: DELAYI2C;
      0092AF 4B 03            [ 1]  482 	push	#0x03
      0092B1 5F               [ 1]  483 	clrw	x
      0092B2 89               [ 2]  484 	pushw	x
      0092B3 4B 00            [ 1]  485 	push	#0x00
      0092B5 CD 91 24         [ 4]  486 	call	_delay_us
                                    487 ;	lib/src/stm8s_mylib.c: 380: for (i = 0; i < 8; ++i)
      0092B8 0C 03            [ 1]  488 	inc	(0x03, sp)
      0092BA 7B 03            [ 1]  489 	ld	a, (0x03, sp)
      0092BC A1 08            [ 1]  490 	cp	a, #0x08
      0092BE 25 C9            [ 1]  491 	jrc	00107$
                                    492 ;	lib/src/stm8s_mylib.c: 379: SDA_1;
      0092C0 C6 50 05         [ 1]  493 	ld	a, 0x5005
                                    494 ;	lib/src/stm8s_mylib.c: 394: if(Ack){
      0092C3 0D 01            [ 1]  495 	tnz	(0x01, sp)
      0092C5 27 07            [ 1]  496 	jreq	00105$
                                    497 ;	lib/src/stm8s_mylib.c: 395: SDA_0;
      0092C7 A4 DF            [ 1]  498 	and	a, #0xdf
      0092C9 C7 50 05         [ 1]  499 	ld	0x5005, a
      0092CC 20 05            [ 2]  500 	jra	00106$
      0092CE                        501 00105$:
                                    502 ;	lib/src/stm8s_mylib.c: 397: SDA_1;
      0092CE AA 20            [ 1]  503 	or	a, #0x20
      0092D0 C7 50 05         [ 1]  504 	ld	0x5005, a
      0092D3                        505 00106$:
                                    506 ;	lib/src/stm8s_mylib.c: 399: DELAYI2C;
      0092D3 4B 03            [ 1]  507 	push	#0x03
      0092D5 5F               [ 1]  508 	clrw	x
      0092D6 89               [ 2]  509 	pushw	x
      0092D7 4B 00            [ 1]  510 	push	#0x00
      0092D9 CD 91 24         [ 4]  511 	call	_delay_us
                                    512 ;	lib/src/stm8s_mylib.c: 401: SCL_1;
      0092DC 72 18 50 05      [ 1]  513 	bset	0x5005, #4
                                    514 ;	lib/src/stm8s_mylib.c: 402: DELAYI2C;
      0092E0 4B 03            [ 1]  515 	push	#0x03
      0092E2 5F               [ 1]  516 	clrw	x
      0092E3 89               [ 2]  517 	pushw	x
      0092E4 4B 00            [ 1]  518 	push	#0x00
      0092E6 CD 91 24         [ 4]  519 	call	_delay_us
                                    520 ;	lib/src/stm8s_mylib.c: 403: SCL_0;
      0092E9 72 19 50 05      [ 1]  521 	bres	0x5005, #4
                                    522 ;	lib/src/stm8s_mylib.c: 404: DELAYI2C;
      0092ED 4B 03            [ 1]  523 	push	#0x03
      0092EF 5F               [ 1]  524 	clrw	x
      0092F0 89               [ 2]  525 	pushw	x
      0092F1 4B 00            [ 1]  526 	push	#0x00
      0092F3 CD 91 24         [ 4]  527 	call	_delay_us
                                    528 ;	lib/src/stm8s_mylib.c: 405: return u8DataRead;
      0092F6 7B 02            [ 1]  529 	ld	a, (0x02, sp)
                                    530 ;	lib/src/stm8s_mylib.c: 406: }
      0092F8 5B 03            [ 2]  531 	addw	sp, #3
      0092FA 81               [ 4]  532 	ret
                                    533 ;	lib/src/stm8s_mylib.c: 407: uint8_t data_write(uint8_t address, uint8_t addressData, uint8_t num, uint8_t *data)
                                    534 ;	-----------------------------------------
                                    535 ;	 function data_write
                                    536 ;	-----------------------------------------
      0092FB                        537 _data_write:
      0092FB 52 03            [ 2]  538 	sub	sp, #3
      0092FD 6B 01            [ 1]  539 	ld	(0x01, sp), a
                                    540 ;	lib/src/stm8s_mylib.c: 410: for(i=0; i< num; ++i)
      0092FF 7B 06            [ 1]  541 	ld	a, (0x06, sp)
      009301 6B 02            [ 1]  542 	ld	(0x02, sp), a
      009303 0F 03            [ 1]  543 	clr	(0x03, sp)
      009305                        544 00103$:
      009305 7B 03            [ 1]  545 	ld	a, (0x03, sp)
      009307 11 07            [ 1]  546 	cp	a, (0x07, sp)
      009309 24 2A            [ 1]  547 	jrnc	00101$
                                    548 ;	lib/src/stm8s_mylib.c: 412: i2c_start();
      00930B CD 91 A1         [ 4]  549 	call	_i2c_start
                                    550 ;	lib/src/stm8s_mylib.c: 413: i2c_write(address);
      00930E 7B 01            [ 1]  551 	ld	a, (0x01, sp)
      009310 CD 91 FE         [ 4]  552 	call	_i2c_write
                                    553 ;	lib/src/stm8s_mylib.c: 414: i2c_write(addressData++);
      009313 7B 02            [ 1]  554 	ld	a, (0x02, sp)
      009315 0C 02            [ 1]  555 	inc	(0x02, sp)
      009317 CD 91 FE         [ 4]  556 	call	_i2c_write
                                    557 ;	lib/src/stm8s_mylib.c: 415: i2c_write(data[i]);
      00931A 5F               [ 1]  558 	clrw	x
      00931B 7B 03            [ 1]  559 	ld	a, (0x03, sp)
      00931D 97               [ 1]  560 	ld	xl, a
      00931E 72 FB 08         [ 2]  561 	addw	x, (0x08, sp)
      009321 F6               [ 1]  562 	ld	a, (x)
      009322 CD 91 FE         [ 4]  563 	call	_i2c_write
                                    564 ;	lib/src/stm8s_mylib.c: 416: i2c_stop();
      009325 CD 91 D6         [ 4]  565 	call	_i2c_stop
                                    566 ;	lib/src/stm8s_mylib.c: 417: delay_us(1000);
      009328 4B E8            [ 1]  567 	push	#0xe8
      00932A 4B 03            [ 1]  568 	push	#0x03
      00932C 5F               [ 1]  569 	clrw	x
      00932D 89               [ 2]  570 	pushw	x
      00932E CD 91 24         [ 4]  571 	call	_delay_us
                                    572 ;	lib/src/stm8s_mylib.c: 410: for(i=0; i< num; ++i)
      009331 0C 03            [ 1]  573 	inc	(0x03, sp)
      009333 20 D0            [ 2]  574 	jra	00103$
      009335                        575 00101$:
                                    576 ;	lib/src/stm8s_mylib.c: 419: return 1;
      009335 A6 01            [ 1]  577 	ld	a, #0x01
                                    578 ;	lib/src/stm8s_mylib.c: 420: }
      009337 1E 04            [ 2]  579 	ldw	x, (4, sp)
      009339 5B 09            [ 2]  580 	addw	sp, #9
      00933B FC               [ 2]  581 	jp	(x)
                                    582 ;	lib/src/stm8s_mylib.c: 421: uint8_t data_read(uint8_t address, uint8_t addressData, uint8_t num, uint8_t *data)
                                    583 ;	-----------------------------------------
                                    584 ;	 function data_read
                                    585 ;	-----------------------------------------
      00933C                        586 _data_read:
      00933C 52 04            [ 2]  587 	sub	sp, #4
      00933E 6B 03            [ 1]  588 	ld	(0x03, sp), a
                                    589 ;	lib/src/stm8s_mylib.c: 424: i2c_start();
      009340 CD 91 A1         [ 4]  590 	call	_i2c_start
                                    591 ;	lib/src/stm8s_mylib.c: 425: i2c_write(address);
      009343 7B 03            [ 1]  592 	ld	a, (0x03, sp)
      009345 CD 91 FE         [ 4]  593 	call	_i2c_write
                                    594 ;	lib/src/stm8s_mylib.c: 426: i2c_write(addressData);
      009348 7B 07            [ 1]  595 	ld	a, (0x07, sp)
      00934A CD 91 FE         [ 4]  596 	call	_i2c_write
                                    597 ;	lib/src/stm8s_mylib.c: 428: i2c_start();
      00934D CD 91 A1         [ 4]  598 	call	_i2c_start
                                    599 ;	lib/src/stm8s_mylib.c: 429: i2c_write(address | 0x01);
      009350 7B 03            [ 1]  600 	ld	a, (0x03, sp)
      009352 AA 01            [ 1]  601 	or	a, #0x01
      009354 CD 91 FE         [ 4]  602 	call	_i2c_write
                                    603 ;	lib/src/stm8s_mylib.c: 430: for(i=0; i< num - 1; ++i)
      009357 0F 04            [ 1]  604 	clr	(0x04, sp)
      009359                        605 00103$:
      009359 5F               [ 1]  606 	clrw	x
      00935A 7B 08            [ 1]  607 	ld	a, (0x08, sp)
      00935C 97               [ 1]  608 	ld	xl, a
      00935D 5A               [ 2]  609 	decw	x
      00935E 1F 01            [ 2]  610 	ldw	(0x01, sp), x
      009360 90 5F            [ 1]  611 	clrw	y
      009362 7B 04            [ 1]  612 	ld	a, (0x04, sp)
      009364 90 97            [ 1]  613 	ld	yl, a
                                    614 ;	lib/src/stm8s_mylib.c: 432: data[i] = i2c_read(1);
      009366 5F               [ 1]  615 	clrw	x
      009367 7B 04            [ 1]  616 	ld	a, (0x04, sp)
      009369 97               [ 1]  617 	ld	xl, a
      00936A 72 FB 09         [ 2]  618 	addw	x, (0x09, sp)
                                    619 ;	lib/src/stm8s_mylib.c: 430: for(i=0; i< num - 1; ++i)
      00936D 51               [ 1]  620 	exgw	x, y
      00936E 13 01            [ 2]  621 	cpw	x, (0x01, sp)
      009370 51               [ 1]  622 	exgw	x, y
      009371 2E 0C            [ 1]  623 	jrsge	00101$
                                    624 ;	lib/src/stm8s_mylib.c: 432: data[i] = i2c_read(1);
      009373 89               [ 2]  625 	pushw	x
      009374 A6 01            [ 1]  626 	ld	a, #0x01
      009376 CD 92 7D         [ 4]  627 	call	_i2c_read
      009379 85               [ 2]  628 	popw	x
      00937A F7               [ 1]  629 	ld	(x), a
                                    630 ;	lib/src/stm8s_mylib.c: 430: for(i=0; i< num - 1; ++i)
      00937B 0C 04            [ 1]  631 	inc	(0x04, sp)
      00937D 20 DA            [ 2]  632 	jra	00103$
      00937F                        633 00101$:
                                    634 ;	lib/src/stm8s_mylib.c: 434: data[i] = i2c_read(0);
      00937F 89               [ 2]  635 	pushw	x
      009380 4F               [ 1]  636 	clr	a
      009381 CD 92 7D         [ 4]  637 	call	_i2c_read
      009384 85               [ 2]  638 	popw	x
      009385 F7               [ 1]  639 	ld	(x), a
                                    640 ;	lib/src/stm8s_mylib.c: 435: i2c_stop();
      009386 CD 91 D6         [ 4]  641 	call	_i2c_stop
                                    642 ;	lib/src/stm8s_mylib.c: 436: return 1;
      009389 A6 01            [ 1]  643 	ld	a, #0x01
                                    644 ;	lib/src/stm8s_mylib.c: 437: }
      00938B 1E 05            [ 2]  645 	ldw	x, (5, sp)
      00938D 5B 0A            [ 2]  646 	addw	sp, #10
      00938F FC               [ 2]  647 	jp	(x)
                                    648 ;	lib/src/stm8s_mylib.c: 438: uint8_t decimal_to_bcd(uint8_t value)
                                    649 ;	-----------------------------------------
                                    650 ;	 function decimal_to_bcd
                                    651 ;	-----------------------------------------
      009390                        652 _decimal_to_bcd:
      009390 88               [ 1]  653 	push	a
                                    654 ;	lib/src/stm8s_mylib.c: 441: hex = (((value / 10) << 4) + (value % 10));
      009391 5F               [ 1]  655 	clrw	x
      009392 97               [ 1]  656 	ld	xl, a
      009393 89               [ 2]  657 	pushw	x
      009394 4B 0A            [ 1]  658 	push	#0x0a
      009396 4B 00            [ 1]  659 	push	#0x00
      009398 CD 9B E7         [ 4]  660 	call	__divsint
      00939B 9F               [ 1]  661 	ld	a, xl
      00939C 85               [ 2]  662 	popw	x
      00939D 4E               [ 1]  663 	swap	a
      00939E A4 F0            [ 1]  664 	and	a, #0xf0
      0093A0 6B 01            [ 1]  665 	ld	(0x01, sp), a
      0093A2 4B 0A            [ 1]  666 	push	#0x0a
      0093A4 4B 00            [ 1]  667 	push	#0x00
      0093A6 CD 9B CF         [ 4]  668 	call	__modsint
      0093A9 9F               [ 1]  669 	ld	a, xl
      0093AA 1B 01            [ 1]  670 	add	a, (0x01, sp)
                                    671 ;	lib/src/stm8s_mylib.c: 442: return hex;
                                    672 ;	lib/src/stm8s_mylib.c: 443: }
      0093AC 5B 01            [ 2]  673 	addw	sp, #1
      0093AE 81               [ 4]  674 	ret
                                    675 ;	lib/src/stm8s_mylib.c: 444: void writeTime(uint8_t giay, uint8_t phut, uint8_t gio){
                                    676 ;	-----------------------------------------
                                    677 ;	 function writeTime
                                    678 ;	-----------------------------------------
      0093AF                        679 _writeTime:
      0093AF 52 03            [ 2]  680 	sub	sp, #3
                                    681 ;	lib/src/stm8s_mylib.c: 446: u8Data[0] = decimal_to_bcd(giay);
      0093B1 CD 93 90         [ 4]  682 	call	_decimal_to_bcd
      0093B4 6B 01            [ 1]  683 	ld	(0x01, sp), a
                                    684 ;	lib/src/stm8s_mylib.c: 447: u8Data[1] = decimal_to_bcd(phut);
      0093B6 7B 06            [ 1]  685 	ld	a, (0x06, sp)
      0093B8 CD 93 90         [ 4]  686 	call	_decimal_to_bcd
      0093BB 6B 02            [ 1]  687 	ld	(0x02, sp), a
                                    688 ;	lib/src/stm8s_mylib.c: 448: u8Data[2] = decimal_to_bcd(gio);
      0093BD 7B 07            [ 1]  689 	ld	a, (0x07, sp)
      0093BF CD 93 90         [ 4]  690 	call	_decimal_to_bcd
      0093C2 6B 03            [ 1]  691 	ld	(0x03, sp), a
                                    692 ;	lib/src/stm8s_mylib.c: 449: data_write(ADDR_DS13, 0x00, 3, u8Data);
      0093C4 96               [ 1]  693 	ldw	x, sp
      0093C5 5C               [ 1]  694 	incw	x
      0093C6 89               [ 2]  695 	pushw	x
      0093C7 4B 03            [ 1]  696 	push	#0x03
      0093C9 4B 00            [ 1]  697 	push	#0x00
      0093CB A6 D0            [ 1]  698 	ld	a, #0xd0
      0093CD CD 92 FB         [ 4]  699 	call	_data_write
                                    700 ;	lib/src/stm8s_mylib.c: 450: }
      0093D0 1E 04            [ 2]  701 	ldw	x, (4, sp)
      0093D2 5B 07            [ 2]  702 	addw	sp, #7
      0093D4 FC               [ 2]  703 	jp	(x)
                                    704 ;	lib/src/stm8s_mylib.c: 451: void writeDay(uint8_t date, uint8_t month){
                                    705 ;	-----------------------------------------
                                    706 ;	 function writeDay
                                    707 ;	-----------------------------------------
      0093D5                        708 _writeDay:
      0093D5 52 02            [ 2]  709 	sub	sp, #2
                                    710 ;	lib/src/stm8s_mylib.c: 453: u8Data[0] = decimal_to_bcd(date);
      0093D7 CD 93 90         [ 4]  711 	call	_decimal_to_bcd
      0093DA 6B 01            [ 1]  712 	ld	(0x01, sp), a
                                    713 ;	lib/src/stm8s_mylib.c: 454: u8Data[1] = decimal_to_bcd(month);
      0093DC 7B 05            [ 1]  714 	ld	a, (0x05, sp)
      0093DE CD 93 90         [ 4]  715 	call	_decimal_to_bcd
      0093E1 6B 02            [ 1]  716 	ld	(0x02, sp), a
                                    717 ;	lib/src/stm8s_mylib.c: 455: data_write(ADDR_DS13, 0x04, 2, u8Data);
      0093E3 96               [ 1]  718 	ldw	x, sp
      0093E4 5C               [ 1]  719 	incw	x
      0093E5 89               [ 2]  720 	pushw	x
      0093E6 4B 02            [ 1]  721 	push	#0x02
      0093E8 4B 04            [ 1]  722 	push	#0x04
      0093EA A6 D0            [ 1]  723 	ld	a, #0xd0
      0093EC CD 92 FB         [ 4]  724 	call	_data_write
                                    725 ;	lib/src/stm8s_mylib.c: 456: }
      0093EF 5B 02            [ 2]  726 	addw	sp, #2
      0093F1 85               [ 2]  727 	popw	x
      0093F2 84               [ 1]  728 	pop	a
      0093F3 FC               [ 2]  729 	jp	(x)
                                    730 ;	lib/src/stm8s_mylib.c: 457: void Write_EEPROM(uint32_t Address, unsigned char Data){
                                    731 ;	-----------------------------------------
                                    732 ;	 function Write_EEPROM
                                    733 ;	-----------------------------------------
      0093F4                        734 _Write_EEPROM:
                                    735 ;	lib/src/stm8s_mylib.c: 459: FLASH->DUKR = (uint8_t)0xAE ; /*!< Second RASS key */ /* Warning: keys are reversed on data memory !!! */ 
      0093F4 35 AE 50 64      [ 1]  736 	mov	0x5064+0, #0xae
                                    737 ;	lib/src/stm8s_mylib.c: 460: FLASH->DUKR = (uint8_t)0x56 ;  /*!< First RASS key */
      0093F8 35 56 50 64      [ 1]  738 	mov	0x5064+0, #0x56
                                    739 ;	lib/src/stm8s_mylib.c: 462: *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
      0093FC 1E 05            [ 2]  740 	ldw	x, (0x05, sp)
      0093FE 7B 07            [ 1]  741 	ld	a, (0x07, sp)
      009400 F7               [ 1]  742 	ld	(x), a
                                    743 ;	lib/src/stm8s_mylib.c: 465: FLASH->IAPSR &= (uint8_t)0xF7; /*!< Data EEPROM memory */
      009401 C6 50 5F         [ 1]  744 	ld	a, 0x505f
      009404 A4 F7            [ 1]  745 	and	a, #0xf7
      009406 C7 50 5F         [ 1]  746 	ld	0x505f, a
                                    747 ;	lib/src/stm8s_mylib.c: 466: }
      009409 1E 01            [ 2]  748 	ldw	x, (1, sp)
      00940B 5B 07            [ 2]  749 	addw	sp, #7
      00940D FC               [ 2]  750 	jp	(x)
                                    751 ;	lib/src/stm8s_mylib.c: 467: uint8_t Read_EEPROM(uint32_t Address){
                                    752 ;	-----------------------------------------
                                    753 ;	 function Read_EEPROM
                                    754 ;	-----------------------------------------
      00940E                        755 _Read_EEPROM:
                                    756 ;	lib/src/stm8s_mylib.c: 468: return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address);
      00940E 1E 05            [ 2]  757 	ldw	x, (0x05, sp)
      009410 F6               [ 1]  758 	ld	a, (x)
                                    759 ;	lib/src/stm8s_mylib.c: 469: }
      009411 1E 01            [ 2]  760 	ldw	x, (1, sp)
      009413 5B 06            [ 2]  761 	addw	sp, #6
      009415 FC               [ 2]  762 	jp	(x)
                                    763 ;	lib/src/stm8s_mylib.c: 470: void SD1106_sendCom(uint8_t command){
                                    764 ;	-----------------------------------------
                                    765 ;	 function SD1106_sendCom
                                    766 ;	-----------------------------------------
      009416                        767 _SD1106_sendCom:
      009416 88               [ 1]  768 	push	a
      009417 6B 01            [ 1]  769 	ld	(0x01, sp), a
                                    770 ;	lib/src/stm8s_mylib.c: 471: i2c_start();                // initialize I2C first
      009419 CD 91 A1         [ 4]  771 	call	_i2c_start
                                    772 ;	lib/src/stm8s_mylib.c: 472: i2c_write(OLED_ADDR);
      00941C A6 78            [ 1]  773 	ld	a, #0x78
      00941E CD 91 FE         [ 4]  774 	call	_i2c_write
                                    775 ;	lib/src/stm8s_mylib.c: 473: i2c_write(OLED_CMD_MODE);   // set command mode
      009421 A6 80            [ 1]  776 	ld	a, #0x80
      009423 CD 91 FE         [ 4]  777 	call	_i2c_write
                                    778 ;	lib/src/stm8s_mylib.c: 474: i2c_write(command);         // send the command bytes
      009426 7B 01            [ 1]  779 	ld	a, (0x01, sp)
      009428 CD 91 FE         [ 4]  780 	call	_i2c_write
                                    781 ;	lib/src/stm8s_mylib.c: 475: i2c_stop();  
      00942B 84               [ 1]  782 	pop	a
      00942C CC 91 D6         [ 2]  783 	jp	_i2c_stop
                                    784 ;	lib/src/stm8s_mylib.c: 477: }
      00942F 84               [ 1]  785 	pop	a
      009430 81               [ 4]  786 	ret
                                    787 ;	lib/src/stm8s_mylib.c: 478: void SD1106_sendInitCom(void){
                                    788 ;	-----------------------------------------
                                    789 ;	 function SD1106_sendInitCom
                                    790 ;	-----------------------------------------
      009431                        791 _SD1106_sendInitCom:
                                    792 ;	lib/src/stm8s_mylib.c: 479: SD1106_sendCom(DISPLAYOFF);
      009431 A6 AE            [ 1]  793 	ld	a, #0xae
      009433 CD 94 16         [ 4]  794 	call	_SD1106_sendCom
                                    795 ;	lib/src/stm8s_mylib.c: 480: SD1106_sendCom(NORMALDISPLAY);
      009436 A6 A6            [ 1]  796 	ld	a, #0xa6
      009438 CD 94 16         [ 4]  797 	call	_SD1106_sendCom
                                    798 ;	lib/src/stm8s_mylib.c: 481: SD1106_sendCom(SETDISPLAYCLOCKDIV);
      00943B A6 D5            [ 1]  799 	ld	a, #0xd5
      00943D CD 94 16         [ 4]  800 	call	_SD1106_sendCom
                                    801 ;	lib/src/stm8s_mylib.c: 482: SD1106_sendCom(0x80);
      009440 A6 80            [ 1]  802 	ld	a, #0x80
      009442 CD 94 16         [ 4]  803 	call	_SD1106_sendCom
                                    804 ;	lib/src/stm8s_mylib.c: 483: SD1106_sendCom(SETMULTIPLEX);
      009445 A6 A8            [ 1]  805 	ld	a, #0xa8
      009447 CD 94 16         [ 4]  806 	call	_SD1106_sendCom
                                    807 ;	lib/src/stm8s_mylib.c: 484: SD1106_sendCom(0x3f);   //0x3F
      00944A A6 3F            [ 1]  808 	ld	a, #0x3f
      00944C CD 94 16         [ 4]  809 	call	_SD1106_sendCom
                                    810 ;	lib/src/stm8s_mylib.c: 485: SD1106_sendCom(SETDISPLAYOFFSET);
      00944F A6 D3            [ 1]  811 	ld	a, #0xd3
      009451 CD 94 16         [ 4]  812 	call	_SD1106_sendCom
                                    813 ;	lib/src/stm8s_mylib.c: 486: SD1106_sendCom(0x00);
      009454 4F               [ 1]  814 	clr	a
      009455 CD 94 16         [ 4]  815 	call	_SD1106_sendCom
                                    816 ;	lib/src/stm8s_mylib.c: 487: SD1106_sendCom(SETSTARTLINE | 0x00);
      009458 A6 40            [ 1]  817 	ld	a, #0x40
      00945A CD 94 16         [ 4]  818 	call	_SD1106_sendCom
                                    819 ;	lib/src/stm8s_mylib.c: 488: SD1106_sendCom(CHARGEPUMP);
      00945D A6 8D            [ 1]  820 	ld	a, #0x8d
      00945F CD 94 16         [ 4]  821 	call	_SD1106_sendCom
                                    822 ;	lib/src/stm8s_mylib.c: 489: SD1106_sendCom(0x14);
      009462 A6 14            [ 1]  823 	ld	a, #0x14
      009464 CD 94 16         [ 4]  824 	call	_SD1106_sendCom
                                    825 ;	lib/src/stm8s_mylib.c: 490: SD1106_sendCom(MEMORYMODE);
      009467 A6 20            [ 1]  826 	ld	a, #0x20
      009469 CD 94 16         [ 4]  827 	call	_SD1106_sendCom
                                    828 ;	lib/src/stm8s_mylib.c: 491: SD1106_sendCom(0x00);
      00946C 4F               [ 1]  829 	clr	a
      00946D CD 94 16         [ 4]  830 	call	_SD1106_sendCom
                                    831 ;	lib/src/stm8s_mylib.c: 492: SD1106_sendCom(SEGREMAP);   //A0: le phai, A1: le trai
      009470 A6 A1            [ 1]  832 	ld	a, #0xa1
      009472 CD 94 16         [ 4]  833 	call	_SD1106_sendCom
                                    834 ;	lib/src/stm8s_mylib.c: 493: SD1106_sendCom(COMSCANDEC); //0xC8: scan from COM(n-1) to COM0 : hien thi o tren, 0xC0 scan from COM0 to COM(n-1) : hien thi o duoi
      009475 A6 C8            [ 1]  835 	ld	a, #0xc8
      009477 CD 94 16         [ 4]  836 	call	_SD1106_sendCom
                                    837 ;	lib/src/stm8s_mylib.c: 494: SD1106_sendCom(SETCOMPINS);
      00947A A6 DA            [ 1]  838 	ld	a, #0xda
      00947C CD 94 16         [ 4]  839 	call	_SD1106_sendCom
                                    840 ;	lib/src/stm8s_mylib.c: 495: SD1106_sendCom(0x12); //0x12
      00947F A6 12            [ 1]  841 	ld	a, #0x12
      009481 CD 94 16         [ 4]  842 	call	_SD1106_sendCom
                                    843 ;	lib/src/stm8s_mylib.c: 496: SD1106_sendCom(SETCONTRAST);
      009484 A6 81            [ 1]  844 	ld	a, #0x81
      009486 CD 94 16         [ 4]  845 	call	_SD1106_sendCom
                                    846 ;	lib/src/stm8s_mylib.c: 497: SD1106_sendCom(0xcf);
      009489 A6 CF            [ 1]  847 	ld	a, #0xcf
      00948B CD 94 16         [ 4]  848 	call	_SD1106_sendCom
                                    849 ;	lib/src/stm8s_mylib.c: 498: SD1106_sendCom(SETPRECHARGE);
      00948E A6 D9            [ 1]  850 	ld	a, #0xd9
      009490 CD 94 16         [ 4]  851 	call	_SD1106_sendCom
                                    852 ;	lib/src/stm8s_mylib.c: 499: SD1106_sendCom(0xF1);
      009493 A6 F1            [ 1]  853 	ld	a, #0xf1
      009495 CD 94 16         [ 4]  854 	call	_SD1106_sendCom
                                    855 ;	lib/src/stm8s_mylib.c: 500: SD1106_sendCom(SETVCOMDETECT);
      009498 A6 DB            [ 1]  856 	ld	a, #0xdb
      00949A CD 94 16         [ 4]  857 	call	_SD1106_sendCom
                                    858 ;	lib/src/stm8s_mylib.c: 501: SD1106_sendCom(0x40);
      00949D A6 40            [ 1]  859 	ld	a, #0x40
      00949F CD 94 16         [ 4]  860 	call	_SD1106_sendCom
                                    861 ;	lib/src/stm8s_mylib.c: 502: SD1106_sendCom(DISPLAYALLON_RESUME);
      0094A2 A6 A4            [ 1]  862 	ld	a, #0xa4
      0094A4 CD 94 16         [ 4]  863 	call	_SD1106_sendCom
                                    864 ;	lib/src/stm8s_mylib.c: 503: SD1106_sendCom(NORMALDISPLAY);
      0094A7 A6 A6            [ 1]  865 	ld	a, #0xa6
      0094A9 CD 94 16         [ 4]  866 	call	_SD1106_sendCom
                                    867 ;	lib/src/stm8s_mylib.c: 504: SD1106_sendCom(0x2E);   //stop scroll
      0094AC A6 2E            [ 1]  868 	ld	a, #0x2e
      0094AE CD 94 16         [ 4]  869 	call	_SD1106_sendCom
                                    870 ;	lib/src/stm8s_mylib.c: 505: SD1106_sendCom(DISPLAYON);
      0094B1 A6 AF            [ 1]  871 	ld	a, #0xaf
                                    872 ;	lib/src/stm8s_mylib.c: 506: }
      0094B3 CC 94 16         [ 2]  873 	jp	_SD1106_sendCom
                                    874 ;	lib/src/stm8s_mylib.c: 507: void SD1106_clear(void)
                                    875 ;	-----------------------------------------
                                    876 ;	 function SD1106_clear
                                    877 ;	-----------------------------------------
      0094B6                        878 _SD1106_clear:
      0094B6 52 02            [ 2]  879 	sub	sp, #2
                                    880 ;	lib/src/stm8s_mylib.c: 509: for (uint8_t page = 0; page<8; page++){
      0094B8 0F 01            [ 1]  881 	clr	(0x01, sp)
      0094BA                        882 00111$:
      0094BA 7B 01            [ 1]  883 	ld	a, (0x01, sp)
      0094BC A1 08            [ 1]  884 	cp	a, #0x08
      0094BE 24 3F            [ 1]  885 	jrnc	00113$
                                    886 ;	lib/src/stm8s_mylib.c: 510: SD1106_sendCom(PAGESTARTADDRESS | page);
      0094C0 7B 01            [ 1]  887 	ld	a, (0x01, sp)
      0094C2 AA B0            [ 1]  888 	or	a, #0xb0
      0094C4 CD 94 16         [ 4]  889 	call	_SD1106_sendCom
                                    890 ;	lib/src/stm8s_mylib.c: 511: SD1106_sendCom(SETLOWCOLUMN | 2);
      0094C7 A6 02            [ 1]  891 	ld	a, #0x02
      0094C9 CD 94 16         [ 4]  892 	call	_SD1106_sendCom
                                    893 ;	lib/src/stm8s_mylib.c: 512: SD1106_sendCom(SETHIGHCOLUMN | 0);
      0094CC A6 10            [ 1]  894 	ld	a, #0x10
      0094CE CD 94 16         [ 4]  895 	call	_SD1106_sendCom
                                    896 ;	lib/src/stm8s_mylib.c: 514: for(uint8_t y=0; y<16; y++){
      0094D1 0F 02            [ 1]  897 	clr	(0x02, sp)
      0094D3                        898 00108$:
      0094D3 7B 02            [ 1]  899 	ld	a, (0x02, sp)
      0094D5 A1 10            [ 1]  900 	cp	a, #0x10
      0094D7 24 22            [ 1]  901 	jrnc	00112$
                                    902 ;	lib/src/stm8s_mylib.c: 515: i2c_start();  
      0094D9 CD 91 A1         [ 4]  903 	call	_i2c_start
                                    904 ;	lib/src/stm8s_mylib.c: 516: i2c_write(OLED_ADDR);
      0094DC A6 78            [ 1]  905 	ld	a, #0x78
      0094DE CD 91 FE         [ 4]  906 	call	_i2c_write
                                    907 ;	lib/src/stm8s_mylib.c: 517: i2c_write(OLED_DAT_MODE);
      0094E1 A6 40            [ 1]  908 	ld	a, #0x40
      0094E3 CD 91 FE         [ 4]  909 	call	_i2c_write
                                    910 ;	lib/src/stm8s_mylib.c: 518: for (uint8_t w=0; w<8; w++) {
      0094E6 4F               [ 1]  911 	clr	a
      0094E7                        912 00105$:
      0094E7 A1 08            [ 1]  913 	cp	a, #0x08
      0094E9 24 09            [ 1]  914 	jrnc	00101$
                                    915 ;	lib/src/stm8s_mylib.c: 519: i2c_write(0x00); 
      0094EB 88               [ 1]  916 	push	a
      0094EC 4F               [ 1]  917 	clr	a
      0094ED CD 91 FE         [ 4]  918 	call	_i2c_write
      0094F0 84               [ 1]  919 	pop	a
                                    920 ;	lib/src/stm8s_mylib.c: 518: for (uint8_t w=0; w<8; w++) {
      0094F1 4C               [ 1]  921 	inc	a
      0094F2 20 F3            [ 2]  922 	jra	00105$
      0094F4                        923 00101$:
                                    924 ;	lib/src/stm8s_mylib.c: 521: i2c_stop();
      0094F4 CD 91 D6         [ 4]  925 	call	_i2c_stop
                                    926 ;	lib/src/stm8s_mylib.c: 514: for(uint8_t y=0; y<16; y++){
      0094F7 0C 02            [ 1]  927 	inc	(0x02, sp)
      0094F9 20 D8            [ 2]  928 	jra	00108$
      0094FB                        929 00112$:
                                    930 ;	lib/src/stm8s_mylib.c: 509: for (uint8_t page = 0; page<8; page++){
      0094FB 0C 01            [ 1]  931 	inc	(0x01, sp)
      0094FD 20 BB            [ 2]  932 	jra	00111$
      0094FF                        933 00113$:
                                    934 ;	lib/src/stm8s_mylib.c: 525: }
      0094FF 5B 02            [ 2]  935 	addw	sp, #2
      009501 81               [ 4]  936 	ret
                                    937 ;	lib/src/stm8s_mylib.c: 526: void SD1106_CUS_PRINT(void){
                                    938 ;	-----------------------------------------
                                    939 ;	 function SD1106_CUS_PRINT
                                    940 ;	-----------------------------------------
      009502                        941 _SD1106_CUS_PRINT:
      009502 52 07            [ 2]  942 	sub	sp, #7
                                    943 ;	lib/src/stm8s_mylib.c: 532: for(uint8_t i=0; i<8;++i){
      009504 0F 05            [ 1]  944 	clr	(0x05, sp)
      009506                        945 00109$:
      009506 7B 05            [ 1]  946 	ld	a, (0x05, sp)
      009508 A1 08            [ 1]  947 	cp	a, #0x08
      00950A 24 5B            [ 1]  948 	jrnc	00102$
                                    949 ;	lib/src/stm8s_mylib.c: 533: SD1106_sendCom(PAGESTARTADDRESS | i);
      00950C 7B 05            [ 1]  950 	ld	a, (0x05, sp)
      00950E AA B0            [ 1]  951 	or	a, #0xb0
      009510 CD 94 16         [ 4]  952 	call	_SD1106_sendCom
                                    953 ;	lib/src/stm8s_mylib.c: 534: SD1106_sendCom(SETLOWCOLUMN | 2);
      009513 A6 02            [ 1]  954 	ld	a, #0x02
      009515 CD 94 16         [ 4]  955 	call	_SD1106_sendCom
                                    956 ;	lib/src/stm8s_mylib.c: 535: SD1106_sendCom(SETHIGHCOLUMN | 0);
      009518 A6 10            [ 1]  957 	ld	a, #0x10
      00951A CD 94 16         [ 4]  958 	call	_SD1106_sendCom
                                    959 ;	lib/src/stm8s_mylib.c: 537: i2c_start();  
      00951D CD 91 A1         [ 4]  960 	call	_i2c_start
                                    961 ;	lib/src/stm8s_mylib.c: 538: i2c_write(OLED_ADDR);
      009520 A6 78            [ 1]  962 	ld	a, #0x78
      009522 CD 91 FE         [ 4]  963 	call	_i2c_write
                                    964 ;	lib/src/stm8s_mylib.c: 539: i2c_write(OLED_DAT_MODE);
      009525 A6 40            [ 1]  965 	ld	a, #0x40
      009527 CD 91 FE         [ 4]  966 	call	_i2c_write
                                    967 ;	lib/src/stm8s_mylib.c: 540: for (uint16_t w=i*128; w < (i+1)*128 ; w++) {
      00952A 7B 05            [ 1]  968 	ld	a, (0x05, sp)
      00952C 6B 02            [ 1]  969 	ld	(0x02, sp), a
      00952E 0F 01            [ 1]  970 	clr	(0x01, sp)
      009530 1E 01            [ 2]  971 	ldw	x, (0x01, sp)
      009532 58               [ 2]  972 	sllw	x
      009533 58               [ 2]  973 	sllw	x
      009534 58               [ 2]  974 	sllw	x
      009535 58               [ 2]  975 	sllw	x
      009536 58               [ 2]  976 	sllw	x
      009537 58               [ 2]  977 	sllw	x
      009538 58               [ 2]  978 	sllw	x
      009539 1F 06            [ 2]  979 	ldw	(0x06, sp), x
      00953B                        980 00106$:
      00953B 1E 01            [ 2]  981 	ldw	x, (0x01, sp)
      00953D 5C               [ 1]  982 	incw	x
      00953E 58               [ 2]  983 	sllw	x
      00953F 58               [ 2]  984 	sllw	x
      009540 58               [ 2]  985 	sllw	x
      009541 58               [ 2]  986 	sllw	x
      009542 58               [ 2]  987 	sllw	x
      009543 58               [ 2]  988 	sllw	x
      009544 58               [ 2]  989 	sllw	x
      009545 16 06            [ 2]  990 	ldw	y, (0x06, sp)
      009547 1F 03            [ 2]  991 	ldw	(0x03, sp), x
      009549 93               [ 1]  992 	ldw	x, y
      00954A 13 03            [ 2]  993 	cpw	x, (0x03, sp)
      00954C 24 12            [ 1]  994 	jrnc	00101$
                                    995 ;	lib/src/stm8s_mylib.c: 541: i2c_write(lacoVietNam[w]); 
      00954E 1E 06            [ 2]  996 	ldw	x, (0x06, sp)
      009550 1C 82 45         [ 2]  997 	addw	x, #(_lacoVietNam+0)
      009553 1F 03            [ 2]  998 	ldw	(0x03, sp), x
      009555 F6               [ 1]  999 	ld	a, (x)
      009556 CD 91 FE         [ 4] 1000 	call	_i2c_write
                                   1001 ;	lib/src/stm8s_mylib.c: 540: for (uint16_t w=i*128; w < (i+1)*128 ; w++) {
      009559 1E 06            [ 2] 1002 	ldw	x, (0x06, sp)
      00955B 5C               [ 1] 1003 	incw	x
      00955C 1F 06            [ 2] 1004 	ldw	(0x06, sp), x
      00955E 20 DB            [ 2] 1005 	jra	00106$
      009560                       1006 00101$:
                                   1007 ;	lib/src/stm8s_mylib.c: 543: i2c_stop();  
      009560 CD 91 D6         [ 4] 1008 	call	_i2c_stop
                                   1009 ;	lib/src/stm8s_mylib.c: 532: for(uint8_t i=0; i<8;++i){
      009563 0C 05            [ 1] 1010 	inc	(0x05, sp)
      009565 20 9F            [ 2] 1011 	jra	00109$
      009567                       1012 00102$:
                                   1013 ;	lib/src/stm8s_mylib.c: 546: delay_ms(2000);
      009567 AE 07 D0         [ 2] 1014 	ldw	x, #0x07d0
      00956A CD 91 3E         [ 4] 1015 	call	_delay_ms
                                   1016 ;	lib/src/stm8s_mylib.c: 547: SD1106_clear();
      00956D CD 94 B6         [ 4] 1017 	call	_SD1106_clear
                                   1018 ;	lib/src/stm8s_mylib.c: 549: for(uint8_t i=0; i<8;++i){
      009570 0F 05            [ 1] 1019 	clr	(0x05, sp)
      009572                       1020 00115$:
      009572 7B 05            [ 1] 1021 	ld	a, (0x05, sp)
      009574 A1 08            [ 1] 1022 	cp	a, #0x08
      009576 24 55            [ 1] 1023 	jrnc	00104$
                                   1024 ;	lib/src/stm8s_mylib.c: 550: SD1106_sendCom(PAGESTARTADDRESS | i);
      009578 7B 05            [ 1] 1025 	ld	a, (0x05, sp)
      00957A AA B0            [ 1] 1026 	or	a, #0xb0
      00957C CD 94 16         [ 4] 1027 	call	_SD1106_sendCom
                                   1028 ;	lib/src/stm8s_mylib.c: 551: SD1106_sendCom(SETLOWCOLUMN | (32 & 0xf));
      00957F 4F               [ 1] 1029 	clr	a
      009580 CD 94 16         [ 4] 1030 	call	_SD1106_sendCom
                                   1031 ;	lib/src/stm8s_mylib.c: 552: SD1106_sendCom(SETHIGHCOLUMN | ( (32 >> 4) & 0xf) );
      009583 A6 12            [ 1] 1032 	ld	a, #0x12
      009585 CD 94 16         [ 4] 1033 	call	_SD1106_sendCom
                                   1034 ;	lib/src/stm8s_mylib.c: 556: i2c_start();  
      009588 CD 91 A1         [ 4] 1035 	call	_i2c_start
                                   1036 ;	lib/src/stm8s_mylib.c: 557: i2c_write(OLED_ADDR);
      00958B A6 78            [ 1] 1037 	ld	a, #0x78
      00958D CD 91 FE         [ 4] 1038 	call	_i2c_write
                                   1039 ;	lib/src/stm8s_mylib.c: 558: i2c_write(OLED_DAT_MODE);
      009590 A6 40            [ 1] 1040 	ld	a, #0x40
      009592 CD 91 FE         [ 4] 1041 	call	_i2c_write
                                   1042 ;	lib/src/stm8s_mylib.c: 559: for (uint16_t w=i*64; w < (i+1)*64 ; w++) {
      009595 7B 05            [ 1] 1043 	ld	a, (0x05, sp)
      009597 6B 02            [ 1] 1044 	ld	(0x02, sp), a
      009599 0F 01            [ 1] 1045 	clr	(0x01, sp)
      00959B 1E 01            [ 2] 1046 	ldw	x, (0x01, sp)
      00959D 58               [ 2] 1047 	sllw	x
      00959E 58               [ 2] 1048 	sllw	x
      00959F 58               [ 2] 1049 	sllw	x
      0095A0 58               [ 2] 1050 	sllw	x
      0095A1 58               [ 2] 1051 	sllw	x
      0095A2 58               [ 2] 1052 	sllw	x
      0095A3 1F 06            [ 2] 1053 	ldw	(0x06, sp), x
      0095A5                       1054 00112$:
      0095A5 1E 01            [ 2] 1055 	ldw	x, (0x01, sp)
      0095A7 5C               [ 1] 1056 	incw	x
      0095A8 58               [ 2] 1057 	sllw	x
      0095A9 58               [ 2] 1058 	sllw	x
      0095AA 58               [ 2] 1059 	sllw	x
      0095AB 58               [ 2] 1060 	sllw	x
      0095AC 58               [ 2] 1061 	sllw	x
      0095AD 58               [ 2] 1062 	sllw	x
      0095AE 16 06            [ 2] 1063 	ldw	y, (0x06, sp)
      0095B0 1F 03            [ 2] 1064 	ldw	(0x03, sp), x
      0095B2 93               [ 1] 1065 	ldw	x, y
      0095B3 13 03            [ 2] 1066 	cpw	x, (0x03, sp)
      0095B5 24 0F            [ 1] 1067 	jrnc	00103$
                                   1068 ;	lib/src/stm8s_mylib.c: 560: i2c_write(mixigamingLogo[w]); 
      0095B7 1E 06            [ 2] 1069 	ldw	x, (0x06, sp)
      0095B9 D6 86 45         [ 1] 1070 	ld	a, (_mixigamingLogo+0, x)
      0095BC CD 91 FE         [ 4] 1071 	call	_i2c_write
                                   1072 ;	lib/src/stm8s_mylib.c: 559: for (uint16_t w=i*64; w < (i+1)*64 ; w++) {
      0095BF 1E 06            [ 2] 1073 	ldw	x, (0x06, sp)
      0095C1 5C               [ 1] 1074 	incw	x
      0095C2 1F 06            [ 2] 1075 	ldw	(0x06, sp), x
      0095C4 20 DF            [ 2] 1076 	jra	00112$
      0095C6                       1077 00103$:
                                   1078 ;	lib/src/stm8s_mylib.c: 562: i2c_stop();   
      0095C6 CD 91 D6         [ 4] 1079 	call	_i2c_stop
                                   1080 ;	lib/src/stm8s_mylib.c: 549: for(uint8_t i=0; i<8;++i){
      0095C9 0C 05            [ 1] 1081 	inc	(0x05, sp)
      0095CB 20 A5            [ 2] 1082 	jra	00115$
      0095CD                       1083 00104$:
                                   1084 ;	lib/src/stm8s_mylib.c: 565: delay_ms(1000);
      0095CD AE 03 E8         [ 2] 1085 	ldw	x, #0x03e8
      0095D0 CD 91 3E         [ 4] 1086 	call	_delay_ms
                                   1087 ;	lib/src/stm8s_mylib.c: 566: SD1106_clear();
      0095D3 5B 07            [ 2] 1088 	addw	sp, #7
                                   1089 ;	lib/src/stm8s_mylib.c: 568: }
      0095D5 CC 94 B6         [ 2] 1090 	jp	_SD1106_clear
                                   1091 ;	lib/src/stm8s_mylib.c: 569: void print_levelBAT(uint8_t levelBAT ){
                                   1092 ;	-----------------------------------------
                                   1093 ;	 function print_levelBAT
                                   1094 ;	-----------------------------------------
      0095D8                       1095 _print_levelBAT:
      0095D8 52 02            [ 2] 1096 	sub	sp, #2
      0095DA 6B 01            [ 1] 1097 	ld	(0x01, sp), a
                                   1098 ;	lib/src/stm8s_mylib.c: 570: SD1106_sendCom(PAGESTARTADDRESS | 0);
      0095DC A6 B0            [ 1] 1099 	ld	a, #0xb0
      0095DE CD 94 16         [ 4] 1100 	call	_SD1106_sendCom
                                   1101 ;	lib/src/stm8s_mylib.c: 571: SD1106_sendCom(SETLOWCOLUMN | (80 & 0xf));
      0095E1 4F               [ 1] 1102 	clr	a
      0095E2 CD 94 16         [ 4] 1103 	call	_SD1106_sendCom
                                   1104 ;	lib/src/stm8s_mylib.c: 572: SD1106_sendCom(SETHIGHCOLUMN | ( (80 >> 4) & 0xf) );
      0095E5 A6 15            [ 1] 1105 	ld	a, #0x15
      0095E7 CD 94 16         [ 4] 1106 	call	_SD1106_sendCom
                                   1107 ;	lib/src/stm8s_mylib.c: 574: i2c_start();  
      0095EA CD 91 A1         [ 4] 1108 	call	_i2c_start
                                   1109 ;	lib/src/stm8s_mylib.c: 575: i2c_write(OLED_ADDR);
      0095ED A6 78            [ 1] 1110 	ld	a, #0x78
      0095EF CD 91 FE         [ 4] 1111 	call	_i2c_write
                                   1112 ;	lib/src/stm8s_mylib.c: 576: i2c_write(OLED_DAT_MODE);
      0095F2 A6 40            [ 1] 1113 	ld	a, #0x40
      0095F4 CD 91 FE         [ 4] 1114 	call	_i2c_write
                                   1115 ;	lib/src/stm8s_mylib.c: 577: if(levelBAT >= 38){
      0095F7 7B 01            [ 1] 1116 	ld	a, (0x01, sp)
      0095F9 A1 26            [ 1] 1117 	cp	a, #0x26
      0095FB 25 17            [ 1] 1118 	jrc	00118$
                                   1119 ;	lib/src/stm8s_mylib.c: 578: for (uint8_t w=0; w<sizeof(levelBAT_full); w++) {
      0095FD 0F 02            [ 1] 1120 	clr	(0x02, sp)
      0095FF                       1121 00107$:
      0095FF 7B 02            [ 1] 1122 	ld	a, (0x02, sp)
      009601 A1 10            [ 1] 1123 	cp	a, #0x10
      009603 24 26            [ 1] 1124 	jrnc	00105$
                                   1125 ;	lib/src/stm8s_mylib.c: 579: i2c_write(levelBAT_full[w]); 
      009605 5F               [ 1] 1126 	clrw	x
      009606 7B 02            [ 1] 1127 	ld	a, (0x02, sp)
      009608 97               [ 1] 1128 	ld	xl, a
      009609 1C 88 45         [ 2] 1129 	addw	x, #(_levelBAT_full+0)
      00960C F6               [ 1] 1130 	ld	a, (x)
      00960D CD 91 FE         [ 4] 1131 	call	_i2c_write
                                   1132 ;	lib/src/stm8s_mylib.c: 578: for (uint8_t w=0; w<sizeof(levelBAT_full); w++) {
      009610 0C 02            [ 1] 1133 	inc	(0x02, sp)
      009612 20 EB            [ 2] 1134 	jra	00107$
                                   1135 ;	lib/src/stm8s_mylib.c: 582: for (uint8_t w=0; w<sizeof(levelBAT_Tb); w++) {
      009614                       1136 00118$:
      009614 0F 02            [ 1] 1137 	clr	(0x02, sp)
      009616                       1138 00110$:
      009616 7B 02            [ 1] 1139 	ld	a, (0x02, sp)
      009618 A1 10            [ 1] 1140 	cp	a, #0x10
      00961A 24 0F            [ 1] 1141 	jrnc	00105$
                                   1142 ;	lib/src/stm8s_mylib.c: 583: i2c_write(levelBAT_Tb[w]); 
      00961C 5F               [ 1] 1143 	clrw	x
      00961D 7B 02            [ 1] 1144 	ld	a, (0x02, sp)
      00961F 97               [ 1] 1145 	ld	xl, a
      009620 1C 88 55         [ 2] 1146 	addw	x, #(_levelBAT_Tb+0)
      009623 F6               [ 1] 1147 	ld	a, (x)
      009624 CD 91 FE         [ 4] 1148 	call	_i2c_write
                                   1149 ;	lib/src/stm8s_mylib.c: 582: for (uint8_t w=0; w<sizeof(levelBAT_Tb); w++) {
      009627 0C 02            [ 1] 1150 	inc	(0x02, sp)
      009629 20 EB            [ 2] 1151 	jra	00110$
      00962B                       1152 00105$:
                                   1153 ;	lib/src/stm8s_mylib.c: 586: i2c_stop();
      00962B 5B 02            [ 2] 1154 	addw	sp, #2
                                   1155 ;	lib/src/stm8s_mylib.c: 587: }
      00962D CC 91 D6         [ 2] 1156 	jp	_i2c_stop
                                   1157 ;	lib/src/stm8s_mylib.c: 588: void print_rssi(void){
                                   1158 ;	-----------------------------------------
                                   1159 ;	 function print_rssi
                                   1160 ;	-----------------------------------------
      009630                       1161 _print_rssi:
      009630 88               [ 1] 1162 	push	a
                                   1163 ;	lib/src/stm8s_mylib.c: 589: SD1106_sendCom(PAGESTARTADDRESS | 0);
      009631 A6 B0            [ 1] 1164 	ld	a, #0xb0
      009633 CD 94 16         [ 4] 1165 	call	_SD1106_sendCom
                                   1166 ;	lib/src/stm8s_mylib.c: 590: SD1106_sendCom(SETLOWCOLUMN | 2);
      009636 A6 02            [ 1] 1167 	ld	a, #0x02
      009638 CD 94 16         [ 4] 1168 	call	_SD1106_sendCom
                                   1169 ;	lib/src/stm8s_mylib.c: 591: SD1106_sendCom(SETHIGHCOLUMN | 0);
      00963B A6 10            [ 1] 1170 	ld	a, #0x10
      00963D CD 94 16         [ 4] 1171 	call	_SD1106_sendCom
                                   1172 ;	lib/src/stm8s_mylib.c: 593: i2c_start();  
      009640 CD 91 A1         [ 4] 1173 	call	_i2c_start
                                   1174 ;	lib/src/stm8s_mylib.c: 594: i2c_write(OLED_ADDR);
      009643 A6 78            [ 1] 1175 	ld	a, #0x78
      009645 CD 91 FE         [ 4] 1176 	call	_i2c_write
                                   1177 ;	lib/src/stm8s_mylib.c: 595: i2c_write(OLED_DAT_MODE);
      009648 A6 40            [ 1] 1178 	ld	a, #0x40
      00964A CD 91 FE         [ 4] 1179 	call	_i2c_write
                                   1180 ;	lib/src/stm8s_mylib.c: 596: for (uint8_t w=0; w<sizeof(rssi); w++) {
      00964D 0F 01            [ 1] 1181 	clr	(0x01, sp)
      00964F                       1182 00103$:
      00964F 7B 01            [ 1] 1183 	ld	a, (0x01, sp)
      009651 A1 10            [ 1] 1184 	cp	a, #0x10
      009653 24 0E            [ 1] 1185 	jrnc	00105$
                                   1186 ;	lib/src/stm8s_mylib.c: 597: i2c_write(rssi[w]); 
      009655 5F               [ 1] 1187 	clrw	x
      009656 7B 01            [ 1] 1188 	ld	a, (0x01, sp)
      009658 97               [ 1] 1189 	ld	xl, a
      009659 D6 88 65         [ 1] 1190 	ld	a, (_rssi+0, x)
      00965C CD 91 FE         [ 4] 1191 	call	_i2c_write
                                   1192 ;	lib/src/stm8s_mylib.c: 596: for (uint8_t w=0; w<sizeof(rssi); w++) {
      00965F 0C 01            [ 1] 1193 	inc	(0x01, sp)
      009661 20 EC            [ 2] 1194 	jra	00103$
      009663                       1195 00105$:
                                   1196 ;	lib/src/stm8s_mylib.c: 599: }
      009663 84               [ 1] 1197 	pop	a
      009664 81               [ 4] 1198 	ret
                                   1199 ;	lib/src/stm8s_mylib.c: 600: void station_chanel(void){
                                   1200 ;	-----------------------------------------
                                   1201 ;	 function station_chanel
                                   1202 ;	-----------------------------------------
      009665                       1203 _station_chanel:
      009665 88               [ 1] 1204 	push	a
                                   1205 ;	lib/src/stm8s_mylib.c: 601: SD1106_sendCom(PAGESTARTADDRESS | 1);
      009666 A6 B1            [ 1] 1206 	ld	a, #0xb1
      009668 CD 94 16         [ 4] 1207 	call	_SD1106_sendCom
                                   1208 ;	lib/src/stm8s_mylib.c: 602: SD1106_sendCom(SETLOWCOLUMN | 2);
      00966B A6 02            [ 1] 1209 	ld	a, #0x02
      00966D CD 94 16         [ 4] 1210 	call	_SD1106_sendCom
                                   1211 ;	lib/src/stm8s_mylib.c: 603: SD1106_sendCom(SETHIGHCOLUMN | 0);
      009670 A6 10            [ 1] 1212 	ld	a, #0x10
      009672 CD 94 16         [ 4] 1213 	call	_SD1106_sendCom
                                   1214 ;	lib/src/stm8s_mylib.c: 605: i2c_start();  
      009675 CD 91 A1         [ 4] 1215 	call	_i2c_start
                                   1216 ;	lib/src/stm8s_mylib.c: 606: i2c_write(OLED_ADDR);
      009678 A6 78            [ 1] 1217 	ld	a, #0x78
      00967A CD 91 FE         [ 4] 1218 	call	_i2c_write
                                   1219 ;	lib/src/stm8s_mylib.c: 607: i2c_write(OLED_DAT_MODE);
      00967D A6 40            [ 1] 1220 	ld	a, #0x40
      00967F CD 91 FE         [ 4] 1221 	call	_i2c_write
                                   1222 ;	lib/src/stm8s_mylib.c: 608: for (uint8_t w=0; w<sizeof(station_icon); w++) {
      009682 0F 01            [ 1] 1223 	clr	(0x01, sp)
      009684                       1224 00103$:
      009684 7B 01            [ 1] 1225 	ld	a, (0x01, sp)
      009686 A1 10            [ 1] 1226 	cp	a, #0x10
      009688 24 0E            [ 1] 1227 	jrnc	00105$
                                   1228 ;	lib/src/stm8s_mylib.c: 609: i2c_write(station_icon[w]); 
      00968A 5F               [ 1] 1229 	clrw	x
      00968B 7B 01            [ 1] 1230 	ld	a, (0x01, sp)
      00968D 97               [ 1] 1231 	ld	xl, a
      00968E D6 88 75         [ 1] 1232 	ld	a, (_station_icon+0, x)
      009691 CD 91 FE         [ 4] 1233 	call	_i2c_write
                                   1234 ;	lib/src/stm8s_mylib.c: 608: for (uint8_t w=0; w<sizeof(station_icon); w++) {
      009694 0C 01            [ 1] 1235 	inc	(0x01, sp)
      009696 20 EC            [ 2] 1236 	jra	00103$
      009698                       1237 00105$:
                                   1238 ;	lib/src/stm8s_mylib.c: 611: }
      009698 84               [ 1] 1239 	pop	a
      009699 81               [ 4] 1240 	ret
                                   1241 ;	lib/src/stm8s_mylib.c: 612: void clock_icon_ds(void){
                                   1242 ;	-----------------------------------------
                                   1243 ;	 function clock_icon_ds
                                   1244 ;	-----------------------------------------
      00969A                       1245 _clock_icon_ds:
      00969A 88               [ 1] 1246 	push	a
                                   1247 ;	lib/src/stm8s_mylib.c: 613: SD1106_sendCom(PAGESTARTADDRESS | 1);
      00969B A6 B1            [ 1] 1248 	ld	a, #0xb1
      00969D CD 94 16         [ 4] 1249 	call	_SD1106_sendCom
                                   1250 ;	lib/src/stm8s_mylib.c: 614: SD1106_sendCom(SETLOWCOLUMN | (80 & 0xf));
      0096A0 4F               [ 1] 1251 	clr	a
      0096A1 CD 94 16         [ 4] 1252 	call	_SD1106_sendCom
                                   1253 ;	lib/src/stm8s_mylib.c: 615: SD1106_sendCom(SETHIGHCOLUMN | ( (80 >> 4) & 0xf) );
      0096A4 A6 15            [ 1] 1254 	ld	a, #0x15
      0096A6 CD 94 16         [ 4] 1255 	call	_SD1106_sendCom
                                   1256 ;	lib/src/stm8s_mylib.c: 617: i2c_start();  
      0096A9 CD 91 A1         [ 4] 1257 	call	_i2c_start
                                   1258 ;	lib/src/stm8s_mylib.c: 618: i2c_write(OLED_ADDR);
      0096AC A6 78            [ 1] 1259 	ld	a, #0x78
      0096AE CD 91 FE         [ 4] 1260 	call	_i2c_write
                                   1261 ;	lib/src/stm8s_mylib.c: 619: i2c_write(OLED_DAT_MODE);
      0096B1 A6 40            [ 1] 1262 	ld	a, #0x40
      0096B3 CD 91 FE         [ 4] 1263 	call	_i2c_write
                                   1264 ;	lib/src/stm8s_mylib.c: 620: for (uint8_t w=0; w<sizeof(clock_icon); w++) {
      0096B6 0F 01            [ 1] 1265 	clr	(0x01, sp)
      0096B8                       1266 00103$:
      0096B8 7B 01            [ 1] 1267 	ld	a, (0x01, sp)
      0096BA A1 10            [ 1] 1268 	cp	a, #0x10
      0096BC 24 0E            [ 1] 1269 	jrnc	00105$
                                   1270 ;	lib/src/stm8s_mylib.c: 621: i2c_write(clock_icon[w]); 
      0096BE 5F               [ 1] 1271 	clrw	x
      0096BF 7B 01            [ 1] 1272 	ld	a, (0x01, sp)
      0096C1 97               [ 1] 1273 	ld	xl, a
      0096C2 D6 88 85         [ 1] 1274 	ld	a, (_clock_icon+0, x)
      0096C5 CD 91 FE         [ 4] 1275 	call	_i2c_write
                                   1276 ;	lib/src/stm8s_mylib.c: 620: for (uint8_t w=0; w<sizeof(clock_icon); w++) {
      0096C8 0C 01            [ 1] 1277 	inc	(0x01, sp)
      0096CA 20 EC            [ 2] 1278 	jra	00103$
      0096CC                       1279 00105$:
                                   1280 ;	lib/src/stm8s_mylib.c: 623: }
      0096CC 84               [ 1] 1281 	pop	a
      0096CD 81               [ 4] 1282 	ret
                                   1283 ;	lib/src/stm8s_mylib.c: 624: void SD1106_setContranst(char constrast)
                                   1284 ;	-----------------------------------------
                                   1285 ;	 function SD1106_setContranst
                                   1286 ;	-----------------------------------------
      0096CE                       1287 _SD1106_setContranst:
                                   1288 ;	lib/src/stm8s_mylib.c: 626: SD1106_sendCom(0x81);
      0096CE 88               [ 1] 1289 	push	a
      0096CF A6 81            [ 1] 1290 	ld	a, #0x81
      0096D1 CD 94 16         [ 4] 1291 	call	_SD1106_sendCom
      0096D4 84               [ 1] 1292 	pop	a
                                   1293 ;	lib/src/stm8s_mylib.c: 627: SD1106_sendCom(constrast);
                                   1294 ;	lib/src/stm8s_mylib.c: 628: }
      0096D5 CC 94 16         [ 2] 1295 	jp	_SD1106_sendCom
                                   1296 ;	lib/src/stm8s_mylib.c: 629: void SD1106_resetDis(void)
                                   1297 ;	-----------------------------------------
                                   1298 ;	 function SD1106_resetDis
                                   1299 ;	-----------------------------------------
      0096D8                       1300 _SD1106_resetDis:
                                   1301 ;	lib/src/stm8s_mylib.c: 631: SD1106_sendCom(0xAE);   //OLED Off
      0096D8 A6 AE            [ 1] 1302 	ld	a, #0xae
      0096DA CD 94 16         [ 4] 1303 	call	_SD1106_sendCom
                                   1304 ;	lib/src/stm8s_mylib.c: 632: SD1106_clear();
      0096DD CD 94 B6         [ 4] 1305 	call	_SD1106_clear
                                   1306 ;	lib/src/stm8s_mylib.c: 633: SD1106_sendCom(0xAF);   ////OLED On
      0096E0 A6 AF            [ 1] 1307 	ld	a, #0xaf
                                   1308 ;	lib/src/stm8s_mylib.c: 634: }
      0096E2 CC 94 16         [ 2] 1309 	jp	_SD1106_sendCom
                                   1310 ;	lib/src/stm8s_mylib.c: 635: void SD1106_flipScreen(void)
                                   1311 ;	-----------------------------------------
                                   1312 ;	 function SD1106_flipScreen
                                   1313 ;	-----------------------------------------
      0096E5                       1314 _SD1106_flipScreen:
                                   1315 ;	lib/src/stm8s_mylib.c: 637: SD1106_sendCom(0xA0);   //le trai hay phai
      0096E5 A6 A0            [ 1] 1316 	ld	a, #0xa0
      0096E7 CD 94 16         [ 4] 1317 	call	_SD1106_sendCom
                                   1318 ;	lib/src/stm8s_mylib.c: 638: SD1106_sendCom(SETCOMPINS);
      0096EA A6 DA            [ 1] 1319 	ld	a, #0xda
      0096EC CD 94 16         [ 4] 1320 	call	_SD1106_sendCom
                                   1321 ;	lib/src/stm8s_mylib.c: 639: SD1106_sendCom(0x22);
      0096EF A6 22            [ 1] 1322 	ld	a, #0x22
      0096F1 CD 94 16         [ 4] 1323 	call	_SD1106_sendCom
                                   1324 ;	lib/src/stm8s_mylib.c: 640: SD1106_sendCom(COMSCANINC);
      0096F4 A6 C0            [ 1] 1325 	ld	a, #0xc0
                                   1326 ;	lib/src/stm8s_mylib.c: 641: }
      0096F6 CC 94 16         [ 2] 1327 	jp	_SD1106_sendCom
                                   1328 ;	lib/src/stm8s_mylib.c: 643: void SD1106_printP(char* p, uint8_t PAGES, uint8_t Column)
                                   1329 ;	-----------------------------------------
                                   1330 ;	 function SD1106_printP
                                   1331 ;	-----------------------------------------
      0096F9                       1332 _SD1106_printP:
      0096F9 52 07            [ 2] 1333 	sub	sp, #7
      0096FB 1F 03            [ 2] 1334 	ldw	(0x03, sp), x
                                   1335 ;	lib/src/stm8s_mylib.c: 645: SD1106_sendCom(PAGESTARTADDRESS | PAGES);
      0096FD AA B0            [ 1] 1336 	or	a, #0xb0
      0096FF CD 94 16         [ 4] 1337 	call	_SD1106_sendCom
                                   1338 ;	lib/src/stm8s_mylib.c: 646: SD1106_sendCom(SETLOWCOLUMN | (Column & 0xf));
      009702 7B 0A            [ 1] 1339 	ld	a, (0x0a, sp)
      009704 6B 07            [ 1] 1340 	ld	(0x07, sp), a
      009706 A4 0F            [ 1] 1341 	and	a, #0x0f
      009708 CD 94 16         [ 4] 1342 	call	_SD1106_sendCom
                                   1343 ;	lib/src/stm8s_mylib.c: 647: SD1106_sendCom(SETHIGHCOLUMN | ( (Column >> 4) & 0xf) );
      00970B 7B 07            [ 1] 1344 	ld	a, (0x07, sp)
      00970D 4E               [ 1] 1345 	swap	a
      00970E A4 0F            [ 1] 1346 	and	a, #15
      009710 AA 10            [ 1] 1347 	or	a, #0x10
      009712 CD 94 16         [ 4] 1348 	call	_SD1106_sendCom
                                   1349 ;	lib/src/stm8s_mylib.c: 648: i2c_start();  
      009715 CD 91 A1         [ 4] 1350 	call	_i2c_start
                                   1351 ;	lib/src/stm8s_mylib.c: 649: i2c_write(OLED_ADDR);
      009718 A6 78            [ 1] 1352 	ld	a, #0x78
      00971A CD 91 FE         [ 4] 1353 	call	_i2c_write
                                   1354 ;	lib/src/stm8s_mylib.c: 650: i2c_write(OLED_DAT_MODE);
      00971D A6 40            [ 1] 1355 	ld	a, #0x40
      00971F CD 91 FE         [ 4] 1356 	call	_i2c_write
                                   1357 ;	lib/src/stm8s_mylib.c: 651: while(*p){
      009722 16 03            [ 2] 1358 	ldw	y, (0x03, sp)
      009724 17 05            [ 2] 1359 	ldw	(0x05, sp), y
      009726                       1360 00102$:
      009726 1E 05            [ 2] 1361 	ldw	x, (0x05, sp)
      009728 F6               [ 1] 1362 	ld	a, (x)
      009729 6B 07            [ 1] 1363 	ld	(0x07, sp), a
      00972B 27 35            [ 1] 1364 	jreq	00104$
                                   1365 ;	lib/src/stm8s_mylib.c: 652: uint16_t offset = *p - 32;
      00972D 7B 07            [ 1] 1366 	ld	a, (0x07, sp)
      00972F 5F               [ 1] 1367 	clrw	x
      009730 97               [ 1] 1368 	ld	xl, a
      009731 1D 00 20         [ 2] 1369 	subw	x, #0x0020
                                   1370 ;	lib/src/stm8s_mylib.c: 653: offset += (offset << 2) ;
      009734 1F 01            [ 2] 1371 	ldw	(0x01, sp), x
      009736 58               [ 2] 1372 	sllw	x
      009737 58               [ 2] 1373 	sllw	x
      009738 72 FB 01         [ 2] 1374 	addw	x, (0x01, sp)
                                   1375 ;	lib/src/stm8s_mylib.c: 654: i2c_write(0x00);   
      00973B 89               [ 2] 1376 	pushw	x
      00973C 4F               [ 1] 1377 	clr	a
      00973D CD 91 FE         [ 4] 1378 	call	_i2c_write
      009740 85               [ 2] 1379 	popw	x
                                   1380 ;	lib/src/stm8s_mylib.c: 655: for (uint8_t w=0; w<5; w++) {
      009741 0F 07            [ 1] 1381 	clr	(0x07, sp)
      009743                       1382 00106$:
      009743 7B 07            [ 1] 1383 	ld	a, (0x07, sp)
      009745 A1 05            [ 1] 1384 	cp	a, #0x05
      009747 24 12            [ 1] 1385 	jrnc	00101$
                                   1386 ;	lib/src/stm8s_mylib.c: 656: i2c_write(OLED_FONT[offset++]); 
      009749 90 93            [ 1] 1387 	ldw	y, x
      00974B 72 A9 80 D3      [ 2] 1388 	addw	y, #(_OLED_FONT+0)
      00974F 5C               [ 1] 1389 	incw	x
      009750 90 F6            [ 1] 1390 	ld	a, (y)
      009752 89               [ 2] 1391 	pushw	x
      009753 CD 91 FE         [ 4] 1392 	call	_i2c_write
      009756 85               [ 2] 1393 	popw	x
                                   1394 ;	lib/src/stm8s_mylib.c: 655: for (uint8_t w=0; w<5; w++) {
      009757 0C 07            [ 1] 1395 	inc	(0x07, sp)
      009759 20 E8            [ 2] 1396 	jra	00106$
      00975B                       1397 00101$:
                                   1398 ;	lib/src/stm8s_mylib.c: 658: p++;    
      00975B 1E 05            [ 2] 1399 	ldw	x, (0x05, sp)
      00975D 5C               [ 1] 1400 	incw	x
      00975E 1F 05            [ 2] 1401 	ldw	(0x05, sp), x
      009760 20 C4            [ 2] 1402 	jra	00102$
      009762                       1403 00104$:
                                   1404 ;	lib/src/stm8s_mylib.c: 660: i2c_stop();
      009762 1E 08            [ 2] 1405 	ldw	x, (8, sp)
      009764 1F 09            [ 2] 1406 	ldw	(9, sp), x
      009766 5B 08            [ 2] 1407 	addw	sp, #8
                                   1408 ;	lib/src/stm8s_mylib.c: 661: }
      009768 CC 91 D6         [ 2] 1409 	jp	_i2c_stop
      00976B 84               [ 1] 1410 	pop	a
      00976C FC               [ 2] 1411 	jp	(x)
                                   1412 ;	lib/src/stm8s_mylib.c: 662: void SD1106_print_one_num(uint8_t so, uint8_t PAGES, uint8_t Column)
                                   1413 ;	-----------------------------------------
                                   1414 ;	 function SD1106_print_one_num
                                   1415 ;	-----------------------------------------
      00976D                       1416 _SD1106_print_one_num:
      00976D 52 04            [ 2] 1417 	sub	sp, #4
      00976F 6B 03            [ 1] 1418 	ld	(0x03, sp), a
                                   1419 ;	lib/src/stm8s_mylib.c: 664: SD1106_sendCom(PAGESTARTADDRESS | PAGES);
      009771 7B 07            [ 1] 1420 	ld	a, (0x07, sp)
      009773 AA B0            [ 1] 1421 	or	a, #0xb0
      009775 CD 94 16         [ 4] 1422 	call	_SD1106_sendCom
                                   1423 ;	lib/src/stm8s_mylib.c: 665: SD1106_sendCom(SETLOWCOLUMN | (Column & 0xf));
      009778 7B 08            [ 1] 1424 	ld	a, (0x08, sp)
      00977A 6B 04            [ 1] 1425 	ld	(0x04, sp), a
      00977C A4 0F            [ 1] 1426 	and	a, #0x0f
      00977E CD 94 16         [ 4] 1427 	call	_SD1106_sendCom
                                   1428 ;	lib/src/stm8s_mylib.c: 666: SD1106_sendCom(SETHIGHCOLUMN | ( (Column >> 4) & 0xf) );
      009781 7B 04            [ 1] 1429 	ld	a, (0x04, sp)
      009783 4E               [ 1] 1430 	swap	a
      009784 A4 0F            [ 1] 1431 	and	a, #15
      009786 AA 10            [ 1] 1432 	or	a, #0x10
      009788 CD 94 16         [ 4] 1433 	call	_SD1106_sendCom
                                   1434 ;	lib/src/stm8s_mylib.c: 667: i2c_start();
      00978B CD 91 A1         [ 4] 1435 	call	_i2c_start
                                   1436 ;	lib/src/stm8s_mylib.c: 668: i2c_write(OLED_ADDR);					// start transmission to OLED
      00978E A6 78            [ 1] 1437 	ld	a, #0x78
      009790 CD 91 FE         [ 4] 1438 	call	_i2c_write
                                   1439 ;	lib/src/stm8s_mylib.c: 669: i2c_write(OLED_DAT_MODE);
      009793 A6 40            [ 1] 1440 	ld	a, #0x40
      009795 CD 91 FE         [ 4] 1441 	call	_i2c_write
                                   1442 ;	lib/src/stm8s_mylib.c: 670: uint16_t offset = so + 16;					
      009798 7B 03            [ 1] 1443 	ld	a, (0x03, sp)
      00979A 5F               [ 1] 1444 	clrw	x
      00979B 97               [ 1] 1445 	ld	xl, a
      00979C 1C 00 10         [ 2] 1446 	addw	x, #0x0010
                                   1447 ;	lib/src/stm8s_mylib.c: 671: offset += offset << 2;					// -> offset = so * 5
      00979F 1F 01            [ 2] 1448 	ldw	(0x01, sp), x
      0097A1 58               [ 2] 1449 	sllw	x
      0097A2 58               [ 2] 1450 	sllw	x
      0097A3 72 FB 01         [ 2] 1451 	addw	x, (0x01, sp)
                                   1452 ;	lib/src/stm8s_mylib.c: 672: i2c_write(0x00);                       // print spacing between characters
      0097A6 89               [ 2] 1453 	pushw	x
      0097A7 4F               [ 1] 1454 	clr	a
      0097A8 CD 91 FE         [ 4] 1455 	call	_i2c_write
      0097AB 85               [ 2] 1456 	popw	x
                                   1457 ;	lib/src/stm8s_mylib.c: 673: for(uint8_t i=5; i; i--) i2c_write(OLED_FONT[offset++]); // print character
      0097AC A6 05            [ 1] 1458 	ld	a, #0x05
      0097AE 6B 04            [ 1] 1459 	ld	(0x04, sp), a
      0097B0                       1460 00103$:
      0097B0 0D 04            [ 1] 1461 	tnz	(0x04, sp)
      0097B2 27 12            [ 1] 1462 	jreq	00101$
      0097B4 90 93            [ 1] 1463 	ldw	y, x
      0097B6 72 A9 80 D3      [ 2] 1464 	addw	y, #(_OLED_FONT+0)
      0097BA 5C               [ 1] 1465 	incw	x
      0097BB 90 F6            [ 1] 1466 	ld	a, (y)
      0097BD 89               [ 2] 1467 	pushw	x
      0097BE CD 91 FE         [ 4] 1468 	call	_i2c_write
      0097C1 85               [ 2] 1469 	popw	x
      0097C2 0A 04            [ 1] 1470 	dec	(0x04, sp)
      0097C4 20 EA            [ 2] 1471 	jra	00103$
      0097C6                       1472 00101$:
                                   1473 ;	lib/src/stm8s_mylib.c: 674: i2c_stop();
      0097C6 1E 05            [ 2] 1474 	ldw	x, (5, sp)
      0097C8 1F 07            [ 2] 1475 	ldw	(7, sp), x
      0097CA 5B 06            [ 2] 1476 	addw	sp, #6
                                   1477 ;	lib/src/stm8s_mylib.c: 675: }
      0097CC CC 91 D6         [ 2] 1478 	jp	_i2c_stop
                                   1479 ;	lib/src/stm8s_mylib.c: 676: void SD1106_printNum(unsigned int Number, uint8_t PAGES,  uint8_t Column)
                                   1480 ;	-----------------------------------------
                                   1481 ;	 function SD1106_printNum
                                   1482 ;	-----------------------------------------
      0097CF                       1483 _SD1106_printNum:
      0097CF 52 0C            [ 2] 1484 	sub	sp, #12
      0097D1 1F 09            [ 2] 1485 	ldw	(0x09, sp), x
      0097D3 6B 08            [ 1] 1486 	ld	(0x08, sp), a
                                   1487 ;	lib/src/stm8s_mylib.c: 678: unsigned char mang[] = {0, 0, 0, 0, 0};
      0097D5 0F 03            [ 1] 1488 	clr	(0x03, sp)
      0097D7 0F 04            [ 1] 1489 	clr	(0x04, sp)
      0097D9 0F 05            [ 1] 1490 	clr	(0x05, sp)
      0097DB 0F 06            [ 1] 1491 	clr	(0x06, sp)
      0097DD 0F 07            [ 1] 1492 	clr	(0x07, sp)
                                   1493 ;	lib/src/stm8s_mylib.c: 679: unsigned char count = 0;
      0097DF 4F               [ 1] 1494 	clr	a
                                   1495 ;	lib/src/stm8s_mylib.c: 681: if (Number == 0)   //In ra so 0 khi Number = 0
      0097E0 1E 09            [ 2] 1496 	ldw	x, (0x09, sp)
      0097E2 26 04            [ 1] 1497 	jrne	00117$
                                   1498 ;	lib/src/stm8s_mylib.c: 683: mang[0] = 0;
      0097E4 0F 03            [ 1] 1499 	clr	(0x03, sp)
                                   1500 ;	lib/src/stm8s_mylib.c: 684: count = 1;
      0097E6 A6 01            [ 1] 1501 	ld	a, #0x01
                                   1502 ;	lib/src/stm8s_mylib.c: 686: while (Number != 0)
      0097E8                       1503 00117$:
      0097E8 6B 0C            [ 1] 1504 	ld	(0x0c, sp), a
      0097EA                       1505 00103$:
      0097EA 1E 09            [ 2] 1506 	ldw	x, (0x09, sp)
      0097EC 27 29            [ 1] 1507 	jreq	00105$
                                   1508 ;	lib/src/stm8s_mylib.c: 688: mang[count] = Number % 10;
      0097EE 5F               [ 1] 1509 	clrw	x
      0097EF 7B 0C            [ 1] 1510 	ld	a, (0x0c, sp)
      0097F1 97               [ 1] 1511 	ld	xl, a
      0097F2 89               [ 2] 1512 	pushw	x
      0097F3 96               [ 1] 1513 	ldw	x, sp
      0097F4 1C 00 05         [ 2] 1514 	addw	x, #5
      0097F7 72 FB 01         [ 2] 1515 	addw	x, (1, sp)
      0097FA 1F 03            [ 2] 1516 	ldw	(0x03, sp), x
      0097FC 5B 02            [ 2] 1517 	addw	sp, #2
      0097FE 1E 09            [ 2] 1518 	ldw	x, (0x09, sp)
      009800 90 AE 00 0A      [ 2] 1519 	ldw	y, #0x000a
      009804 65               [ 2] 1520 	divw	x, y
      009805 90 9F            [ 1] 1521 	ld	a, yl
      009807 1E 01            [ 2] 1522 	ldw	x, (0x01, sp)
      009809 F7               [ 1] 1523 	ld	(x), a
                                   1524 ;	lib/src/stm8s_mylib.c: 689: Number = Number / 10;
      00980A 1E 09            [ 2] 1525 	ldw	x, (0x09, sp)
      00980C 90 AE 00 0A      [ 2] 1526 	ldw	y, #0x000a
      009810 65               [ 2] 1527 	divw	x, y
      009811 1F 09            [ 2] 1528 	ldw	(0x09, sp), x
                                   1529 ;	lib/src/stm8s_mylib.c: 690: ++count;
      009813 0C 0C            [ 1] 1530 	inc	(0x0c, sp)
      009815 20 D3            [ 2] 1531 	jra	00103$
      009817                       1532 00105$:
                                   1533 ;	lib/src/stm8s_mylib.c: 692: SD1106_sendCom(PAGESTARTADDRESS | PAGES);
      009817 7B 08            [ 1] 1534 	ld	a, (0x08, sp)
      009819 AA B0            [ 1] 1535 	or	a, #0xb0
      00981B CD 94 16         [ 4] 1536 	call	_SD1106_sendCom
                                   1537 ;	lib/src/stm8s_mylib.c: 693: SD1106_sendCom(SETLOWCOLUMN | (Column & 0xf));
      00981E 7B 0F            [ 1] 1538 	ld	a, (0x0f, sp)
      009820 6B 0B            [ 1] 1539 	ld	(0x0b, sp), a
      009822 A4 0F            [ 1] 1540 	and	a, #0x0f
      009824 CD 94 16         [ 4] 1541 	call	_SD1106_sendCom
                                   1542 ;	lib/src/stm8s_mylib.c: 694: SD1106_sendCom(SETHIGHCOLUMN | ( (Column >> 4) & 0xf) );
      009827 7B 0B            [ 1] 1543 	ld	a, (0x0b, sp)
      009829 4E               [ 1] 1544 	swap	a
      00982A A4 0F            [ 1] 1545 	and	a, #15
      00982C AA 10            [ 1] 1546 	or	a, #0x10
      00982E CD 94 16         [ 4] 1547 	call	_SD1106_sendCom
                                   1548 ;	lib/src/stm8s_mylib.c: 695: i2c_start();
      009831 CD 91 A1         [ 4] 1549 	call	_i2c_start
                                   1550 ;	lib/src/stm8s_mylib.c: 696: i2c_write(OLED_ADDR);					// start transmission to OLED
      009834 A6 78            [ 1] 1551 	ld	a, #0x78
      009836 CD 91 FE         [ 4] 1552 	call	_i2c_write
                                   1553 ;	lib/src/stm8s_mylib.c: 697: i2c_write(OLED_DAT_MODE);
      009839 A6 40            [ 1] 1554 	ld	a, #0x40
      00983B CD 91 FE         [ 4] 1555 	call	_i2c_write
                                   1556 ;	lib/src/stm8s_mylib.c: 698: while (count != 0)
      00983E 7B 0C            [ 1] 1557 	ld	a, (0x0c, sp)
      009840 6B 0B            [ 1] 1558 	ld	(0x0b, sp), a
      009842                       1559 00107$:
      009842 0D 0B            [ 1] 1560 	tnz	(0x0b, sp)
      009844 27 43            [ 1] 1561 	jreq	00109$
                                   1562 ;	lib/src/stm8s_mylib.c: 700: offset = mang[count - 1] + 16;
      009846 7B 0B            [ 1] 1563 	ld	a, (0x0b, sp)
      009848 4A               [ 1] 1564 	dec	a
      009849 6B 02            [ 1] 1565 	ld	(0x02, sp), a
      00984B 49               [ 1] 1566 	rlc	a
      00984C 4F               [ 1] 1567 	clr	a
      00984D A2 00            [ 1] 1568 	sbc	a, #0x00
      00984F 6B 01            [ 1] 1569 	ld	(0x01, sp), a
      009851 96               [ 1] 1570 	ldw	x, sp
      009852 1C 00 03         [ 2] 1571 	addw	x, #3
      009855 72 FB 01         [ 2] 1572 	addw	x, (0x01, sp)
      009858 F6               [ 1] 1573 	ld	a, (x)
      009859 5F               [ 1] 1574 	clrw	x
      00985A 97               [ 1] 1575 	ld	xl, a
      00985B 1C 00 10         [ 2] 1576 	addw	x, #0x0010
                                   1577 ;	lib/src/stm8s_mylib.c: 701: offset += offset << 2;
      00985E 1F 01            [ 2] 1578 	ldw	(0x01, sp), x
      009860 58               [ 2] 1579 	sllw	x
      009861 58               [ 2] 1580 	sllw	x
      009862 72 FB 01         [ 2] 1581 	addw	x, (0x01, sp)
                                   1582 ;	lib/src/stm8s_mylib.c: 702: i2c_write(0x00);
      009865 89               [ 2] 1583 	pushw	x
      009866 4F               [ 1] 1584 	clr	a
      009867 CD 91 FE         [ 4] 1585 	call	_i2c_write
      00986A 85               [ 2] 1586 	popw	x
                                   1587 ;	lib/src/stm8s_mylib.c: 703: for (unsigned char i = 5; i; i--)
      00986B A6 05            [ 1] 1588 	ld	a, #0x05
      00986D 6B 0C            [ 1] 1589 	ld	(0x0c, sp), a
      00986F                       1590 00111$:
      00986F 0D 0C            [ 1] 1591 	tnz	(0x0c, sp)
      009871 27 12            [ 1] 1592 	jreq	00106$
                                   1593 ;	lib/src/stm8s_mylib.c: 705: i2c_write(OLED_FONT[offset++]);
      009873 90 93            [ 1] 1594 	ldw	y, x
      009875 72 A9 80 D3      [ 2] 1595 	addw	y, #(_OLED_FONT+0)
      009879 5C               [ 1] 1596 	incw	x
      00987A 90 F6            [ 1] 1597 	ld	a, (y)
      00987C 89               [ 2] 1598 	pushw	x
      00987D CD 91 FE         [ 4] 1599 	call	_i2c_write
      009880 85               [ 2] 1600 	popw	x
                                   1601 ;	lib/src/stm8s_mylib.c: 703: for (unsigned char i = 5; i; i--)
      009881 0A 0C            [ 1] 1602 	dec	(0x0c, sp)
      009883 20 EA            [ 2] 1603 	jra	00111$
      009885                       1604 00106$:
                                   1605 ;	lib/src/stm8s_mylib.c: 707: --count;
      009885 0A 0B            [ 1] 1606 	dec	(0x0b, sp)
      009887 20 B9            [ 2] 1607 	jra	00107$
      009889                       1608 00109$:
                                   1609 ;	lib/src/stm8s_mylib.c: 709: i2c_stop();
      009889 CD 91 D6         [ 4] 1610 	call	_i2c_stop
                                   1611 ;	lib/src/stm8s_mylib.c: 710: }
      00988C 5B 0C            [ 2] 1612 	addw	sp, #12
      00988E 85               [ 2] 1613 	popw	x
      00988F 84               [ 1] 1614 	pop	a
      009890 FC               [ 2] 1615 	jp	(x)
                                   1616 ;	lib/src/stm8s_mylib.c: 711: void SD1106_printBigNum(uint8_t Num, uint8_t Column){
                                   1617 ;	-----------------------------------------
                                   1618 ;	 function SD1106_printBigNum
                                   1619 ;	-----------------------------------------
      009891                       1620 _SD1106_printBigNum:
      009891 52 08            [ 2] 1621 	sub	sp, #8
                                   1622 ;	lib/src/stm8s_mylib.c: 712: uint16_t offset = (Num << 2) + Num;			
      009893 6B 08            [ 1] 1623 	ld	(0x08, sp), a
      009895 0F 07            [ 1] 1624 	clr	(0x07, sp)
      009897 1E 07            [ 2] 1625 	ldw	x, (0x07, sp)
      009899 58               [ 2] 1626 	sllw	x
      00989A 58               [ 2] 1627 	sllw	x
      00989B 72 FB 07         [ 2] 1628 	addw	x, (0x07, sp)
                                   1629 ;	lib/src/stm8s_mylib.c: 713: for(uint8_t i=3;  i< 8; ++i){
      00989E 7B 0B            [ 1] 1630 	ld	a, (0x0b, sp)
      0098A0 88               [ 1] 1631 	push	a
      0098A1 A4 0F            [ 1] 1632 	and	a, #0x0f
      0098A3 6B 02            [ 1] 1633 	ld	(0x02, sp), a
      0098A5 84               [ 1] 1634 	pop	a
      0098A6 4E               [ 1] 1635 	swap	a
      0098A7 A4 0F            [ 1] 1636 	and	a, #15
      0098A9 AA 10            [ 1] 1637 	or	a, #0x10
      0098AB 6B 02            [ 1] 1638 	ld	(0x02, sp), a
      0098AD 1F 05            [ 2] 1639 	ldw	(0x05, sp), x
      0098AF A6 03            [ 1] 1640 	ld	a, #0x03
      0098B1 6B 07            [ 1] 1641 	ld	(0x07, sp), a
      0098B3                       1642 00118$:
      0098B3 7B 07            [ 1] 1643 	ld	a, (0x07, sp)
      0098B5 A1 08            [ 1] 1644 	cp	a, #0x08
      0098B7 24 6D            [ 1] 1645 	jrnc	00120$
                                   1646 ;	lib/src/stm8s_mylib.c: 714: SD1106_sendCom(PAGESTARTADDRESS | i);
      0098B9 7B 07            [ 1] 1647 	ld	a, (0x07, sp)
      0098BB AA B0            [ 1] 1648 	or	a, #0xb0
      0098BD CD 94 16         [ 4] 1649 	call	_SD1106_sendCom
                                   1650 ;	lib/src/stm8s_mylib.c: 715: SD1106_sendCom(SETLOWCOLUMN | (Column & 0xf));
      0098C0 7B 01            [ 1] 1651 	ld	a, (0x01, sp)
      0098C2 CD 94 16         [ 4] 1652 	call	_SD1106_sendCom
                                   1653 ;	lib/src/stm8s_mylib.c: 716: SD1106_sendCom(SETHIGHCOLUMN | ( (Column >> 4) & 0xf) );
      0098C5 7B 02            [ 1] 1654 	ld	a, (0x02, sp)
      0098C7 CD 94 16         [ 4] 1655 	call	_SD1106_sendCom
                                   1656 ;	lib/src/stm8s_mylib.c: 717: i2c_start();
      0098CA CD 91 A1         [ 4] 1657 	call	_i2c_start
                                   1658 ;	lib/src/stm8s_mylib.c: 718: i2c_write(OLED_ADDR);					// start transmission to OLED
      0098CD A6 78            [ 1] 1659 	ld	a, #0x78
      0098CF CD 91 FE         [ 4] 1660 	call	_i2c_write
                                   1661 ;	lib/src/stm8s_mylib.c: 719: i2c_write(OLED_DAT_MODE);
      0098D2 A6 40            [ 1] 1662 	ld	a, #0x40
      0098D4 CD 91 FE         [ 4] 1663 	call	_i2c_write
                                   1664 ;	lib/src/stm8s_mylib.c: 720: for(uint8_t z=0; z<3; ++z){
      0098D7 1E 05            [ 2] 1665 	ldw	x, (0x05, sp)
      0098D9 1C 82 13         [ 2] 1666 	addw	x, #(_OLED_FONT_BIG+0)
      0098DC 1F 03            [ 2] 1667 	ldw	(0x03, sp), x
      0098DE 0F 08            [ 1] 1668 	clr	(0x08, sp)
      0098E0                       1669 00115$:
      0098E0 7B 08            [ 1] 1670 	ld	a, (0x08, sp)
      0098E2 A1 03            [ 1] 1671 	cp	a, #0x03
      0098E4 24 34            [ 1] 1672 	jrnc	00106$
                                   1673 ;	lib/src/stm8s_mylib.c: 721: if( ((OLED_FONT_BIG[offset]) >> (2 - z)) & 0b1 ) {
      0098E6 1E 03            [ 2] 1674 	ldw	x, (0x03, sp)
      0098E8 F6               [ 1] 1675 	ld	a, (x)
      0098E9 97               [ 1] 1676 	ld	xl, a
      0098EA A6 02            [ 1] 1677 	ld	a, #0x02
      0098EC 10 08            [ 1] 1678 	sub	a, (0x08, sp)
      0098EE 27 06            [ 1] 1679 	jreq	00174$
      0098F0                       1680 00173$:
      0098F0 41               [ 1] 1681 	exg	a, xl
      0098F1 44               [ 1] 1682 	srl	a
      0098F2 41               [ 1] 1683 	exg	a, xl
      0098F3 4A               [ 1] 1684 	dec	a
      0098F4 26 FA            [ 1] 1685 	jrne	00173$
      0098F6                       1686 00174$:
      0098F6 54               [ 2] 1687 	srlw	x
      0098F7 24 0F            [ 1] 1688 	jrnc	00128$
                                   1689 ;	lib/src/stm8s_mylib.c: 722: for(uint8_t t=5; t; t--) i2c_write(0xff); // print character
      0098F9 A6 05            [ 1] 1690 	ld	a, #0x05
      0098FB                       1691 00109$:
      0098FB 4D               [ 1] 1692 	tnz	a
      0098FC 27 18            [ 1] 1693 	jreq	00116$
      0098FE 88               [ 1] 1694 	push	a
      0098FF A6 FF            [ 1] 1695 	ld	a, #0xff
      009901 CD 91 FE         [ 4] 1696 	call	_i2c_write
      009904 84               [ 1] 1697 	pop	a
      009905 4A               [ 1] 1698 	dec	a
      009906 20 F3            [ 2] 1699 	jra	00109$
                                   1700 ;	lib/src/stm8s_mylib.c: 724: for(uint8_t t=5; t; t--) i2c_write(0x00); // print character
      009908                       1701 00128$:
      009908 A6 05            [ 1] 1702 	ld	a, #0x05
      00990A                       1703 00112$:
      00990A 4D               [ 1] 1704 	tnz	a
      00990B 27 09            [ 1] 1705 	jreq	00116$
      00990D 88               [ 1] 1706 	push	a
      00990E 4F               [ 1] 1707 	clr	a
      00990F CD 91 FE         [ 4] 1708 	call	_i2c_write
      009912 84               [ 1] 1709 	pop	a
      009913 4A               [ 1] 1710 	dec	a
      009914 20 F4            [ 2] 1711 	jra	00112$
      009916                       1712 00116$:
                                   1713 ;	lib/src/stm8s_mylib.c: 720: for(uint8_t z=0; z<3; ++z){
      009916 0C 08            [ 1] 1714 	inc	(0x08, sp)
      009918 20 C6            [ 2] 1715 	jra	00115$
      00991A                       1716 00106$:
                                   1717 ;	lib/src/stm8s_mylib.c: 728: offset++;
      00991A 1E 05            [ 2] 1718 	ldw	x, (0x05, sp)
      00991C 5C               [ 1] 1719 	incw	x
      00991D 1F 05            [ 2] 1720 	ldw	(0x05, sp), x
                                   1721 ;	lib/src/stm8s_mylib.c: 729: i2c_stop();
      00991F CD 91 D6         [ 4] 1722 	call	_i2c_stop
                                   1723 ;	lib/src/stm8s_mylib.c: 713: for(uint8_t i=3;  i< 8; ++i){
      009922 0C 07            [ 1] 1724 	inc	(0x07, sp)
      009924 20 8D            [ 2] 1725 	jra	00118$
      009926                       1726 00120$:
                                   1727 ;	lib/src/stm8s_mylib.c: 731: }
      009926 5B 08            [ 2] 1728 	addw	sp, #8
      009928 85               [ 2] 1729 	popw	x
      009929 84               [ 1] 1730 	pop	a
      00992A FC               [ 2] 1731 	jp	(x)
                                   1732 ;	lib/src/stm8s_mylib.c: 732: void SD1106_printBigPoint(uint8_t Column){		
                                   1733 ;	-----------------------------------------
                                   1734 ;	 function SD1106_printBigPoint
                                   1735 ;	-----------------------------------------
      00992B                       1736 _SD1106_printBigPoint:
      00992B 52 04            [ 2] 1737 	sub	sp, #4
                                   1738 ;	lib/src/stm8s_mylib.c: 733: for(uint8_t i=3;  i< 8; ++i){
      00992D 88               [ 1] 1739 	push	a
      00992E A4 0F            [ 1] 1740 	and	a, #0x0f
      009930 6B 02            [ 1] 1741 	ld	(0x02, sp), a
      009932 84               [ 1] 1742 	pop	a
      009933 4E               [ 1] 1743 	swap	a
      009934 A4 0F            [ 1] 1744 	and	a, #15
      009936 AA 10            [ 1] 1745 	or	a, #0x10
      009938 6B 02            [ 1] 1746 	ld	(0x02, sp), a
      00993A A6 03            [ 1] 1747 	ld	a, #0x03
      00993C 6B 04            [ 1] 1748 	ld	(0x04, sp), a
      00993E                       1749 00114$:
      00993E 7B 04            [ 1] 1750 	ld	a, (0x04, sp)
      009940 A1 08            [ 1] 1751 	cp	a, #0x08
      009942 24 5B            [ 1] 1752 	jrnc	00116$
                                   1753 ;	lib/src/stm8s_mylib.c: 734: SD1106_sendCom(PAGESTARTADDRESS | i);
      009944 7B 04            [ 1] 1754 	ld	a, (0x04, sp)
      009946 AA B0            [ 1] 1755 	or	a, #0xb0
      009948 CD 94 16         [ 4] 1756 	call	_SD1106_sendCom
                                   1757 ;	lib/src/stm8s_mylib.c: 735: SD1106_sendCom(SETLOWCOLUMN | (Column & 0xf));
      00994B 7B 01            [ 1] 1758 	ld	a, (0x01, sp)
      00994D CD 94 16         [ 4] 1759 	call	_SD1106_sendCom
                                   1760 ;	lib/src/stm8s_mylib.c: 736: SD1106_sendCom(SETHIGHCOLUMN | ( (Column >> 4) & 0xf) );
      009950 7B 02            [ 1] 1761 	ld	a, (0x02, sp)
      009952 CD 94 16         [ 4] 1762 	call	_SD1106_sendCom
                                   1763 ;	lib/src/stm8s_mylib.c: 737: i2c_start();
      009955 CD 91 A1         [ 4] 1764 	call	_i2c_start
                                   1765 ;	lib/src/stm8s_mylib.c: 738: i2c_write(OLED_ADDR);					// start transmission to OLED
      009958 A6 78            [ 1] 1766 	ld	a, #0x78
      00995A CD 91 FE         [ 4] 1767 	call	_i2c_write
                                   1768 ;	lib/src/stm8s_mylib.c: 739: i2c_write(OLED_DAT_MODE);
      00995D A6 40            [ 1] 1769 	ld	a, #0x40
      00995F CD 91 FE         [ 4] 1770 	call	_i2c_write
                                   1771 ;	lib/src/stm8s_mylib.c: 741: if(i == 4 | i == 6){
      009962 7B 04            [ 1] 1772 	ld	a, (0x04, sp)
      009964 A0 04            [ 1] 1773 	sub	a, #0x04
      009966 26 04            [ 1] 1774 	jrne	00158$
      009968 4C               [ 1] 1775 	inc	a
      009969 6B 03            [ 1] 1776 	ld	(0x03, sp), a
      00996B C5                    1777 	.byte 0xc5
      00996C                       1778 00158$:
      00996C 0F 03            [ 1] 1779 	clr	(0x03, sp)
      00996E                       1780 00159$:
      00996E 7B 04            [ 1] 1781 	ld	a, (0x04, sp)
      009970 A0 06            [ 1] 1782 	sub	a, #0x06
      009972 26 02            [ 1] 1783 	jrne	00161$
      009974 4C               [ 1] 1784 	inc	a
      009975 21                    1785 	.byte 0x21
      009976                       1786 00161$:
      009976 4F               [ 1] 1787 	clr	a
      009977                       1788 00162$:
      009977 1A 03            [ 1] 1789 	or	a, (0x03, sp)
      009979 27 0F            [ 1] 1790 	jreq	00123$
                                   1791 ;	lib/src/stm8s_mylib.c: 742: for(uint8_t t=5; t; t--) i2c_write(0xff); // print character
      00997B A6 05            [ 1] 1792 	ld	a, #0x05
      00997D                       1793 00108$:
      00997D 4D               [ 1] 1794 	tnz	a
      00997E 27 18            [ 1] 1795 	jreq	00105$
      009980 88               [ 1] 1796 	push	a
      009981 A6 FF            [ 1] 1797 	ld	a, #0xff
      009983 CD 91 FE         [ 4] 1798 	call	_i2c_write
      009986 84               [ 1] 1799 	pop	a
      009987 4A               [ 1] 1800 	dec	a
      009988 20 F3            [ 2] 1801 	jra	00108$
                                   1802 ;	lib/src/stm8s_mylib.c: 744: for(uint8_t t=5; t; t--) i2c_write(0x00); // print character
      00998A                       1803 00123$:
      00998A A6 05            [ 1] 1804 	ld	a, #0x05
      00998C                       1805 00111$:
      00998C 4D               [ 1] 1806 	tnz	a
      00998D 27 09            [ 1] 1807 	jreq	00105$
      00998F 88               [ 1] 1808 	push	a
      009990 4F               [ 1] 1809 	clr	a
      009991 CD 91 FE         [ 4] 1810 	call	_i2c_write
      009994 84               [ 1] 1811 	pop	a
      009995 4A               [ 1] 1812 	dec	a
      009996 20 F4            [ 2] 1813 	jra	00111$
      009998                       1814 00105$:
                                   1815 ;	lib/src/stm8s_mylib.c: 746: i2c_stop();
      009998 CD 91 D6         [ 4] 1816 	call	_i2c_stop
                                   1817 ;	lib/src/stm8s_mylib.c: 733: for(uint8_t i=3;  i< 8; ++i){
      00999B 0C 04            [ 1] 1818 	inc	(0x04, sp)
      00999D 20 9F            [ 2] 1819 	jra	00114$
      00999F                       1820 00116$:
                                   1821 ;	lib/src/stm8s_mylib.c: 748: }
      00999F 5B 04            [ 2] 1822 	addw	sp, #4
      0099A1 81               [ 4] 1823 	ret
                                   1824 ;	lib/src/stm8s_mylib.c: 750: void SD1106_printBigLine(uint8_t Column){		
                                   1825 ;	-----------------------------------------
                                   1826 ;	 function SD1106_printBigLine
                                   1827 ;	-----------------------------------------
      0099A2                       1828 _SD1106_printBigLine:
      0099A2 52 03            [ 2] 1829 	sub	sp, #3
                                   1830 ;	lib/src/stm8s_mylib.c: 751: for(uint8_t i=3;  i< 8; ++i){
      0099A4 88               [ 1] 1831 	push	a
      0099A5 A4 0F            [ 1] 1832 	and	a, #0x0f
      0099A7 6B 02            [ 1] 1833 	ld	(0x02, sp), a
      0099A9 84               [ 1] 1834 	pop	a
      0099AA 4E               [ 1] 1835 	swap	a
      0099AB A4 0F            [ 1] 1836 	and	a, #15
      0099AD AA 10            [ 1] 1837 	or	a, #0x10
      0099AF 6B 02            [ 1] 1838 	ld	(0x02, sp), a
      0099B1 A6 03            [ 1] 1839 	ld	a, #0x03
      0099B3 6B 03            [ 1] 1840 	ld	(0x03, sp), a
      0099B5                       1841 00114$:
      0099B5 7B 03            [ 1] 1842 	ld	a, (0x03, sp)
      0099B7 A1 08            [ 1] 1843 	cp	a, #0x08
      0099B9 24 48            [ 1] 1844 	jrnc	00116$
                                   1845 ;	lib/src/stm8s_mylib.c: 752: SD1106_sendCom(PAGESTARTADDRESS | i);
      0099BB 7B 03            [ 1] 1846 	ld	a, (0x03, sp)
      0099BD AA B0            [ 1] 1847 	or	a, #0xb0
      0099BF CD 94 16         [ 4] 1848 	call	_SD1106_sendCom
                                   1849 ;	lib/src/stm8s_mylib.c: 753: SD1106_sendCom(SETLOWCOLUMN | (Column & 0xf));
      0099C2 7B 01            [ 1] 1850 	ld	a, (0x01, sp)
      0099C4 CD 94 16         [ 4] 1851 	call	_SD1106_sendCom
                                   1852 ;	lib/src/stm8s_mylib.c: 754: SD1106_sendCom(SETHIGHCOLUMN | ( (Column >> 4) & 0xf) );
      0099C7 7B 02            [ 1] 1853 	ld	a, (0x02, sp)
      0099C9 CD 94 16         [ 4] 1854 	call	_SD1106_sendCom
                                   1855 ;	lib/src/stm8s_mylib.c: 755: i2c_start();
      0099CC CD 91 A1         [ 4] 1856 	call	_i2c_start
                                   1857 ;	lib/src/stm8s_mylib.c: 756: i2c_write(OLED_ADDR);					// start transmission to OLED
      0099CF A6 78            [ 1] 1858 	ld	a, #0x78
      0099D1 CD 91 FE         [ 4] 1859 	call	_i2c_write
                                   1860 ;	lib/src/stm8s_mylib.c: 757: i2c_write(OLED_DAT_MODE);
      0099D4 A6 40            [ 1] 1861 	ld	a, #0x40
      0099D6 CD 91 FE         [ 4] 1862 	call	_i2c_write
                                   1863 ;	lib/src/stm8s_mylib.c: 759: if(i == 5){
      0099D9 7B 03            [ 1] 1864 	ld	a, (0x03, sp)
      0099DB A1 05            [ 1] 1865 	cp	a, #0x05
      0099DD 26 0F            [ 1] 1866 	jrne	00123$
                                   1867 ;	lib/src/stm8s_mylib.c: 760: for(uint8_t t=5; t; t--) i2c_write(0xff); // print character
      0099DF A6 05            [ 1] 1868 	ld	a, #0x05
      0099E1                       1869 00108$:
      0099E1 4D               [ 1] 1870 	tnz	a
      0099E2 27 18            [ 1] 1871 	jreq	00105$
      0099E4 88               [ 1] 1872 	push	a
      0099E5 A6 FF            [ 1] 1873 	ld	a, #0xff
      0099E7 CD 91 FE         [ 4] 1874 	call	_i2c_write
      0099EA 84               [ 1] 1875 	pop	a
      0099EB 4A               [ 1] 1876 	dec	a
      0099EC 20 F3            [ 2] 1877 	jra	00108$
                                   1878 ;	lib/src/stm8s_mylib.c: 762: for(uint8_t t=5; t; t--) i2c_write(0x00); // print character
      0099EE                       1879 00123$:
      0099EE A6 05            [ 1] 1880 	ld	a, #0x05
      0099F0                       1881 00111$:
      0099F0 4D               [ 1] 1882 	tnz	a
      0099F1 27 09            [ 1] 1883 	jreq	00105$
      0099F3 88               [ 1] 1884 	push	a
      0099F4 4F               [ 1] 1885 	clr	a
      0099F5 CD 91 FE         [ 4] 1886 	call	_i2c_write
      0099F8 84               [ 1] 1887 	pop	a
      0099F9 4A               [ 1] 1888 	dec	a
      0099FA 20 F4            [ 2] 1889 	jra	00111$
      0099FC                       1890 00105$:
                                   1891 ;	lib/src/stm8s_mylib.c: 764: i2c_stop();
      0099FC CD 91 D6         [ 4] 1892 	call	_i2c_stop
                                   1893 ;	lib/src/stm8s_mylib.c: 751: for(uint8_t i=3;  i< 8; ++i){
      0099FF 0C 03            [ 1] 1894 	inc	(0x03, sp)
      009A01 20 B2            [ 2] 1895 	jra	00114$
      009A03                       1896 00116$:
                                   1897 ;	lib/src/stm8s_mylib.c: 766: }
      009A03 5B 03            [ 2] 1898 	addw	sp, #3
      009A05 81               [ 4] 1899 	ret
                                   1900 	.area CODE
                                   1901 	.area CONST
      0080D3                       1902 _OLED_FONT:
      0080D3 00                    1903 	.db #0x00	; 0
      0080D4 00                    1904 	.db #0x00	; 0
      0080D5 00                    1905 	.db #0x00	; 0
      0080D6 00                    1906 	.db #0x00	; 0
      0080D7 00                    1907 	.db #0x00	; 0
      0080D8 00                    1908 	.db #0x00	; 0
      0080D9 00                    1909 	.db #0x00	; 0
      0080DA 2F                    1910 	.db #0x2f	; 47
      0080DB 00                    1911 	.db #0x00	; 0
      0080DC 00                    1912 	.db #0x00	; 0
      0080DD 00                    1913 	.db #0x00	; 0
      0080DE 07                    1914 	.db #0x07	; 7
      0080DF 00                    1915 	.db #0x00	; 0
      0080E0 07                    1916 	.db #0x07	; 7
      0080E1 00                    1917 	.db #0x00	; 0
      0080E2 14                    1918 	.db #0x14	; 20
      0080E3 7F                    1919 	.db #0x7f	; 127
      0080E4 14                    1920 	.db #0x14	; 20
      0080E5 7F                    1921 	.db #0x7f	; 127
      0080E6 14                    1922 	.db #0x14	; 20
      0080E7 24                    1923 	.db #0x24	; 36
      0080E8 2A                    1924 	.db #0x2a	; 42
      0080E9 7F                    1925 	.db #0x7f	; 127
      0080EA 2A                    1926 	.db #0x2a	; 42
      0080EB 12                    1927 	.db #0x12	; 18
      0080EC 62                    1928 	.db #0x62	; 98	'b'
      0080ED 64                    1929 	.db #0x64	; 100	'd'
      0080EE 08                    1930 	.db #0x08	; 8
      0080EF 13                    1931 	.db #0x13	; 19
      0080F0 23                    1932 	.db #0x23	; 35
      0080F1 36                    1933 	.db #0x36	; 54	'6'
      0080F2 49                    1934 	.db #0x49	; 73	'I'
      0080F3 55                    1935 	.db #0x55	; 85	'U'
      0080F4 22                    1936 	.db #0x22	; 34
      0080F5 50                    1937 	.db #0x50	; 80	'P'
      0080F6 00                    1938 	.db #0x00	; 0
      0080F7 05                    1939 	.db #0x05	; 5
      0080F8 03                    1940 	.db #0x03	; 3
      0080F9 00                    1941 	.db #0x00	; 0
      0080FA 00                    1942 	.db #0x00	; 0
      0080FB 00                    1943 	.db #0x00	; 0
      0080FC 1C                    1944 	.db #0x1c	; 28
      0080FD 22                    1945 	.db #0x22	; 34
      0080FE 41                    1946 	.db #0x41	; 65	'A'
      0080FF 00                    1947 	.db #0x00	; 0
      008100 00                    1948 	.db #0x00	; 0
      008101 41                    1949 	.db #0x41	; 65	'A'
      008102 22                    1950 	.db #0x22	; 34
      008103 1C                    1951 	.db #0x1c	; 28
      008104 00                    1952 	.db #0x00	; 0
      008105 14                    1953 	.db #0x14	; 20
      008106 08                    1954 	.db #0x08	; 8
      008107 3E                    1955 	.db #0x3e	; 62
      008108 08                    1956 	.db #0x08	; 8
      008109 14                    1957 	.db #0x14	; 20
      00810A 08                    1958 	.db #0x08	; 8
      00810B 08                    1959 	.db #0x08	; 8
      00810C 3E                    1960 	.db #0x3e	; 62
      00810D 08                    1961 	.db #0x08	; 8
      00810E 08                    1962 	.db #0x08	; 8
      00810F 00                    1963 	.db #0x00	; 0
      008110 00                    1964 	.db #0x00	; 0
      008111 A0                    1965 	.db #0xa0	; 160
      008112 60                    1966 	.db #0x60	; 96
      008113 00                    1967 	.db #0x00	; 0
      008114 08                    1968 	.db #0x08	; 8
      008115 08                    1969 	.db #0x08	; 8
      008116 08                    1970 	.db #0x08	; 8
      008117 08                    1971 	.db #0x08	; 8
      008118 08                    1972 	.db #0x08	; 8
      008119 00                    1973 	.db #0x00	; 0
      00811A 60                    1974 	.db #0x60	; 96
      00811B 60                    1975 	.db #0x60	; 96
      00811C 00                    1976 	.db #0x00	; 0
      00811D 00                    1977 	.db #0x00	; 0
      00811E 20                    1978 	.db #0x20	; 32
      00811F 10                    1979 	.db #0x10	; 16
      008120 08                    1980 	.db #0x08	; 8
      008121 04                    1981 	.db #0x04	; 4
      008122 02                    1982 	.db #0x02	; 2
      008123 3E                    1983 	.db #0x3e	; 62
      008124 51                    1984 	.db #0x51	; 81	'Q'
      008125 49                    1985 	.db #0x49	; 73	'I'
      008126 45                    1986 	.db #0x45	; 69	'E'
      008127 3E                    1987 	.db #0x3e	; 62
      008128 00                    1988 	.db #0x00	; 0
      008129 42                    1989 	.db #0x42	; 66	'B'
      00812A 7F                    1990 	.db #0x7f	; 127
      00812B 40                    1991 	.db #0x40	; 64
      00812C 00                    1992 	.db #0x00	; 0
      00812D 42                    1993 	.db #0x42	; 66	'B'
      00812E 61                    1994 	.db #0x61	; 97	'a'
      00812F 51                    1995 	.db #0x51	; 81	'Q'
      008130 49                    1996 	.db #0x49	; 73	'I'
      008131 46                    1997 	.db #0x46	; 70	'F'
      008132 21                    1998 	.db #0x21	; 33
      008133 41                    1999 	.db #0x41	; 65	'A'
      008134 45                    2000 	.db #0x45	; 69	'E'
      008135 4B                    2001 	.db #0x4b	; 75	'K'
      008136 31                    2002 	.db #0x31	; 49	'1'
      008137 18                    2003 	.db #0x18	; 24
      008138 14                    2004 	.db #0x14	; 20
      008139 12                    2005 	.db #0x12	; 18
      00813A 7F                    2006 	.db #0x7f	; 127
      00813B 10                    2007 	.db #0x10	; 16
      00813C 27                    2008 	.db #0x27	; 39
      00813D 45                    2009 	.db #0x45	; 69	'E'
      00813E 45                    2010 	.db #0x45	; 69	'E'
      00813F 45                    2011 	.db #0x45	; 69	'E'
      008140 39                    2012 	.db #0x39	; 57	'9'
      008141 3C                    2013 	.db #0x3c	; 60
      008142 4A                    2014 	.db #0x4a	; 74	'J'
      008143 49                    2015 	.db #0x49	; 73	'I'
      008144 49                    2016 	.db #0x49	; 73	'I'
      008145 30                    2017 	.db #0x30	; 48	'0'
      008146 01                    2018 	.db #0x01	; 1
      008147 71                    2019 	.db #0x71	; 113	'q'
      008148 09                    2020 	.db #0x09	; 9
      008149 05                    2021 	.db #0x05	; 5
      00814A 03                    2022 	.db #0x03	; 3
      00814B 36                    2023 	.db #0x36	; 54	'6'
      00814C 49                    2024 	.db #0x49	; 73	'I'
      00814D 49                    2025 	.db #0x49	; 73	'I'
      00814E 49                    2026 	.db #0x49	; 73	'I'
      00814F 36                    2027 	.db #0x36	; 54	'6'
      008150 06                    2028 	.db #0x06	; 6
      008151 49                    2029 	.db #0x49	; 73	'I'
      008152 49                    2030 	.db #0x49	; 73	'I'
      008153 29                    2031 	.db #0x29	; 41
      008154 1E                    2032 	.db #0x1e	; 30
      008155 00                    2033 	.db #0x00	; 0
      008156 36                    2034 	.db #0x36	; 54	'6'
      008157 36                    2035 	.db #0x36	; 54	'6'
      008158 00                    2036 	.db #0x00	; 0
      008159 00                    2037 	.db #0x00	; 0
      00815A 00                    2038 	.db #0x00	; 0
      00815B 56                    2039 	.db #0x56	; 86	'V'
      00815C 36                    2040 	.db #0x36	; 54	'6'
      00815D 00                    2041 	.db #0x00	; 0
      00815E 00                    2042 	.db #0x00	; 0
      00815F 08                    2043 	.db #0x08	; 8
      008160 14                    2044 	.db #0x14	; 20
      008161 22                    2045 	.db #0x22	; 34
      008162 41                    2046 	.db #0x41	; 65	'A'
      008163 00                    2047 	.db #0x00	; 0
      008164 14                    2048 	.db #0x14	; 20
      008165 14                    2049 	.db #0x14	; 20
      008166 14                    2050 	.db #0x14	; 20
      008167 14                    2051 	.db #0x14	; 20
      008168 14                    2052 	.db #0x14	; 20
      008169 00                    2053 	.db #0x00	; 0
      00816A 41                    2054 	.db #0x41	; 65	'A'
      00816B 22                    2055 	.db #0x22	; 34
      00816C 14                    2056 	.db #0x14	; 20
      00816D 08                    2057 	.db #0x08	; 8
      00816E 02                    2058 	.db #0x02	; 2
      00816F 01                    2059 	.db #0x01	; 1
      008170 51                    2060 	.db #0x51	; 81	'Q'
      008171 09                    2061 	.db #0x09	; 9
      008172 06                    2062 	.db #0x06	; 6
      008173 32                    2063 	.db #0x32	; 50	'2'
      008174 49                    2064 	.db #0x49	; 73	'I'
      008175 59                    2065 	.db #0x59	; 89	'Y'
      008176 51                    2066 	.db #0x51	; 81	'Q'
      008177 3E                    2067 	.db #0x3e	; 62
      008178 7C                    2068 	.db #0x7c	; 124
      008179 12                    2069 	.db #0x12	; 18
      00817A 11                    2070 	.db #0x11	; 17
      00817B 12                    2071 	.db #0x12	; 18
      00817C 7C                    2072 	.db #0x7c	; 124
      00817D 7F                    2073 	.db #0x7f	; 127
      00817E 49                    2074 	.db #0x49	; 73	'I'
      00817F 49                    2075 	.db #0x49	; 73	'I'
      008180 49                    2076 	.db #0x49	; 73	'I'
      008181 36                    2077 	.db #0x36	; 54	'6'
      008182 3E                    2078 	.db #0x3e	; 62
      008183 41                    2079 	.db #0x41	; 65	'A'
      008184 41                    2080 	.db #0x41	; 65	'A'
      008185 41                    2081 	.db #0x41	; 65	'A'
      008186 22                    2082 	.db #0x22	; 34
      008187 7F                    2083 	.db #0x7f	; 127
      008188 41                    2084 	.db #0x41	; 65	'A'
      008189 41                    2085 	.db #0x41	; 65	'A'
      00818A 22                    2086 	.db #0x22	; 34
      00818B 1C                    2087 	.db #0x1c	; 28
      00818C 7F                    2088 	.db #0x7f	; 127
      00818D 49                    2089 	.db #0x49	; 73	'I'
      00818E 49                    2090 	.db #0x49	; 73	'I'
      00818F 49                    2091 	.db #0x49	; 73	'I'
      008190 41                    2092 	.db #0x41	; 65	'A'
      008191 7F                    2093 	.db #0x7f	; 127
      008192 09                    2094 	.db #0x09	; 9
      008193 09                    2095 	.db #0x09	; 9
      008194 09                    2096 	.db #0x09	; 9
      008195 01                    2097 	.db #0x01	; 1
      008196 3E                    2098 	.db #0x3e	; 62
      008197 41                    2099 	.db #0x41	; 65	'A'
      008198 49                    2100 	.db #0x49	; 73	'I'
      008199 49                    2101 	.db #0x49	; 73	'I'
      00819A 7A                    2102 	.db #0x7a	; 122	'z'
      00819B 7F                    2103 	.db #0x7f	; 127
      00819C 08                    2104 	.db #0x08	; 8
      00819D 08                    2105 	.db #0x08	; 8
      00819E 08                    2106 	.db #0x08	; 8
      00819F 7F                    2107 	.db #0x7f	; 127
      0081A0 00                    2108 	.db #0x00	; 0
      0081A1 41                    2109 	.db #0x41	; 65	'A'
      0081A2 7F                    2110 	.db #0x7f	; 127
      0081A3 41                    2111 	.db #0x41	; 65	'A'
      0081A4 00                    2112 	.db #0x00	; 0
      0081A5 20                    2113 	.db #0x20	; 32
      0081A6 40                    2114 	.db #0x40	; 64
      0081A7 41                    2115 	.db #0x41	; 65	'A'
      0081A8 3F                    2116 	.db #0x3f	; 63
      0081A9 01                    2117 	.db #0x01	; 1
      0081AA 7F                    2118 	.db #0x7f	; 127
      0081AB 08                    2119 	.db #0x08	; 8
      0081AC 14                    2120 	.db #0x14	; 20
      0081AD 22                    2121 	.db #0x22	; 34
      0081AE 41                    2122 	.db #0x41	; 65	'A'
      0081AF 7F                    2123 	.db #0x7f	; 127
      0081B0 40                    2124 	.db #0x40	; 64
      0081B1 40                    2125 	.db #0x40	; 64
      0081B2 40                    2126 	.db #0x40	; 64
      0081B3 40                    2127 	.db #0x40	; 64
      0081B4 7F                    2128 	.db #0x7f	; 127
      0081B5 02                    2129 	.db #0x02	; 2
      0081B6 0C                    2130 	.db #0x0c	; 12
      0081B7 02                    2131 	.db #0x02	; 2
      0081B8 7F                    2132 	.db #0x7f	; 127
      0081B9 7F                    2133 	.db #0x7f	; 127
      0081BA 04                    2134 	.db #0x04	; 4
      0081BB 08                    2135 	.db #0x08	; 8
      0081BC 10                    2136 	.db #0x10	; 16
      0081BD 7F                    2137 	.db #0x7f	; 127
      0081BE 3E                    2138 	.db #0x3e	; 62
      0081BF 41                    2139 	.db #0x41	; 65	'A'
      0081C0 41                    2140 	.db #0x41	; 65	'A'
      0081C1 41                    2141 	.db #0x41	; 65	'A'
      0081C2 3E                    2142 	.db #0x3e	; 62
      0081C3 7F                    2143 	.db #0x7f	; 127
      0081C4 09                    2144 	.db #0x09	; 9
      0081C5 09                    2145 	.db #0x09	; 9
      0081C6 09                    2146 	.db #0x09	; 9
      0081C7 06                    2147 	.db #0x06	; 6
      0081C8 3E                    2148 	.db #0x3e	; 62
      0081C9 41                    2149 	.db #0x41	; 65	'A'
      0081CA 51                    2150 	.db #0x51	; 81	'Q'
      0081CB 21                    2151 	.db #0x21	; 33
      0081CC 5E                    2152 	.db #0x5e	; 94
      0081CD 7F                    2153 	.db #0x7f	; 127
      0081CE 09                    2154 	.db #0x09	; 9
      0081CF 19                    2155 	.db #0x19	; 25
      0081D0 29                    2156 	.db #0x29	; 41
      0081D1 46                    2157 	.db #0x46	; 70	'F'
      0081D2 46                    2158 	.db #0x46	; 70	'F'
      0081D3 49                    2159 	.db #0x49	; 73	'I'
      0081D4 49                    2160 	.db #0x49	; 73	'I'
      0081D5 49                    2161 	.db #0x49	; 73	'I'
      0081D6 31                    2162 	.db #0x31	; 49	'1'
      0081D7 01                    2163 	.db #0x01	; 1
      0081D8 01                    2164 	.db #0x01	; 1
      0081D9 7F                    2165 	.db #0x7f	; 127
      0081DA 01                    2166 	.db #0x01	; 1
      0081DB 01                    2167 	.db #0x01	; 1
      0081DC 3F                    2168 	.db #0x3f	; 63
      0081DD 40                    2169 	.db #0x40	; 64
      0081DE 40                    2170 	.db #0x40	; 64
      0081DF 40                    2171 	.db #0x40	; 64
      0081E0 3F                    2172 	.db #0x3f	; 63
      0081E1 1F                    2173 	.db #0x1f	; 31
      0081E2 20                    2174 	.db #0x20	; 32
      0081E3 40                    2175 	.db #0x40	; 64
      0081E4 20                    2176 	.db #0x20	; 32
      0081E5 1F                    2177 	.db #0x1f	; 31
      0081E6 3F                    2178 	.db #0x3f	; 63
      0081E7 40                    2179 	.db #0x40	; 64
      0081E8 38                    2180 	.db #0x38	; 56	'8'
      0081E9 40                    2181 	.db #0x40	; 64
      0081EA 3F                    2182 	.db #0x3f	; 63
      0081EB 63                    2183 	.db #0x63	; 99	'c'
      0081EC 14                    2184 	.db #0x14	; 20
      0081ED 08                    2185 	.db #0x08	; 8
      0081EE 14                    2186 	.db #0x14	; 20
      0081EF 63                    2187 	.db #0x63	; 99	'c'
      0081F0 07                    2188 	.db #0x07	; 7
      0081F1 08                    2189 	.db #0x08	; 8
      0081F2 70                    2190 	.db #0x70	; 112	'p'
      0081F3 08                    2191 	.db #0x08	; 8
      0081F4 07                    2192 	.db #0x07	; 7
      0081F5 61                    2193 	.db #0x61	; 97	'a'
      0081F6 51                    2194 	.db #0x51	; 81	'Q'
      0081F7 49                    2195 	.db #0x49	; 73	'I'
      0081F8 45                    2196 	.db #0x45	; 69	'E'
      0081F9 43                    2197 	.db #0x43	; 67	'C'
      0081FA 00                    2198 	.db #0x00	; 0
      0081FB 7F                    2199 	.db #0x7f	; 127
      0081FC 41                    2200 	.db #0x41	; 65	'A'
      0081FD 41                    2201 	.db #0x41	; 65	'A'
      0081FE 00                    2202 	.db #0x00	; 0
      0081FF 02                    2203 	.db #0x02	; 2
      008200 04                    2204 	.db #0x04	; 4
      008201 08                    2205 	.db #0x08	; 8
      008202 10                    2206 	.db #0x10	; 16
      008203 20                    2207 	.db #0x20	; 32
      008204 00                    2208 	.db #0x00	; 0
      008205 41                    2209 	.db #0x41	; 65	'A'
      008206 41                    2210 	.db #0x41	; 65	'A'
      008207 7F                    2211 	.db #0x7f	; 127
      008208 00                    2212 	.db #0x00	; 0
      008209 04                    2213 	.db #0x04	; 4
      00820A 02                    2214 	.db #0x02	; 2
      00820B 01                    2215 	.db #0x01	; 1
      00820C 02                    2216 	.db #0x02	; 2
      00820D 04                    2217 	.db #0x04	; 4
      00820E 40                    2218 	.db #0x40	; 64
      00820F 40                    2219 	.db #0x40	; 64
      008210 40                    2220 	.db #0x40	; 64
      008211 40                    2221 	.db #0x40	; 64
      008212 40                    2222 	.db #0x40	; 64
      008213                       2223 _OLED_FONT_BIG:
      008213 07                    2224 	.db #0x07	; 7
      008214 05                    2225 	.db #0x05	; 5
      008215 05                    2226 	.db #0x05	; 5
      008216 05                    2227 	.db #0x05	; 5
      008217 07                    2228 	.db #0x07	; 7
      008218 01                    2229 	.db #0x01	; 1
      008219 01                    2230 	.db #0x01	; 1
      00821A 01                    2231 	.db #0x01	; 1
      00821B 01                    2232 	.db #0x01	; 1
      00821C 01                    2233 	.db #0x01	; 1
      00821D 07                    2234 	.db #0x07	; 7
      00821E 01                    2235 	.db #0x01	; 1
      00821F 07                    2236 	.db #0x07	; 7
      008220 04                    2237 	.db #0x04	; 4
      008221 07                    2238 	.db #0x07	; 7
      008222 07                    2239 	.db #0x07	; 7
      008223 01                    2240 	.db #0x01	; 1
      008224 07                    2241 	.db #0x07	; 7
      008225 01                    2242 	.db #0x01	; 1
      008226 07                    2243 	.db #0x07	; 7
      008227 05                    2244 	.db #0x05	; 5
      008228 05                    2245 	.db #0x05	; 5
      008229 07                    2246 	.db #0x07	; 7
      00822A 01                    2247 	.db #0x01	; 1
      00822B 01                    2248 	.db #0x01	; 1
      00822C 07                    2249 	.db #0x07	; 7
      00822D 04                    2250 	.db #0x04	; 4
      00822E 07                    2251 	.db #0x07	; 7
      00822F 01                    2252 	.db #0x01	; 1
      008230 07                    2253 	.db #0x07	; 7
      008231 07                    2254 	.db #0x07	; 7
      008232 04                    2255 	.db #0x04	; 4
      008233 07                    2256 	.db #0x07	; 7
      008234 05                    2257 	.db #0x05	; 5
      008235 07                    2258 	.db #0x07	; 7
      008236 07                    2259 	.db #0x07	; 7
      008237 05                    2260 	.db #0x05	; 5
      008238 01                    2261 	.db #0x01	; 1
      008239 01                    2262 	.db #0x01	; 1
      00823A 01                    2263 	.db #0x01	; 1
      00823B 07                    2264 	.db #0x07	; 7
      00823C 05                    2265 	.db #0x05	; 5
      00823D 07                    2266 	.db #0x07	; 7
      00823E 05                    2267 	.db #0x05	; 5
      00823F 07                    2268 	.db #0x07	; 7
      008240 07                    2269 	.db #0x07	; 7
      008241 05                    2270 	.db #0x05	; 5
      008242 07                    2271 	.db #0x07	; 7
      008243 01                    2272 	.db #0x01	; 1
      008244 07                    2273 	.db #0x07	; 7
      008245                       2274 _lacoVietNam:
      008245 FF                    2275 	.db #0xff	; 255
      008246 FF                    2276 	.db #0xff	; 255
      008247 FF                    2277 	.db #0xff	; 255
      008248 FF                    2278 	.db #0xff	; 255
      008249 FF                    2279 	.db #0xff	; 255
      00824A FF                    2280 	.db #0xff	; 255
      00824B FF                    2281 	.db #0xff	; 255
      00824C FF                    2282 	.db #0xff	; 255
      00824D FF                    2283 	.db #0xff	; 255
      00824E FF                    2284 	.db #0xff	; 255
      00824F FF                    2285 	.db #0xff	; 255
      008250 FF                    2286 	.db #0xff	; 255
      008251 FF                    2287 	.db #0xff	; 255
      008252 FF                    2288 	.db #0xff	; 255
      008253 FF                    2289 	.db #0xff	; 255
      008254 FF                    2290 	.db #0xff	; 255
      008255 FF                    2291 	.db #0xff	; 255
      008256 FF                    2292 	.db #0xff	; 255
      008257 FF                    2293 	.db #0xff	; 255
      008258 FF                    2294 	.db #0xff	; 255
      008259 FF                    2295 	.db #0xff	; 255
      00825A FF                    2296 	.db #0xff	; 255
      00825B FF                    2297 	.db #0xff	; 255
      00825C FF                    2298 	.db #0xff	; 255
      00825D FF                    2299 	.db #0xff	; 255
      00825E FF                    2300 	.db #0xff	; 255
      00825F FF                    2301 	.db #0xff	; 255
      008260 FF                    2302 	.db #0xff	; 255
      008261 FF                    2303 	.db #0xff	; 255
      008262 FF                    2304 	.db #0xff	; 255
      008263 FF                    2305 	.db #0xff	; 255
      008264 FF                    2306 	.db #0xff	; 255
      008265 FF                    2307 	.db #0xff	; 255
      008266 FF                    2308 	.db #0xff	; 255
      008267 FF                    2309 	.db #0xff	; 255
      008268 FF                    2310 	.db #0xff	; 255
      008269 FF                    2311 	.db #0xff	; 255
      00826A FF                    2312 	.db #0xff	; 255
      00826B FF                    2313 	.db #0xff	; 255
      00826C FF                    2314 	.db #0xff	; 255
      00826D FF                    2315 	.db #0xff	; 255
      00826E FF                    2316 	.db #0xff	; 255
      00826F FF                    2317 	.db #0xff	; 255
      008270 FF                    2318 	.db #0xff	; 255
      008271 FF                    2319 	.db #0xff	; 255
      008272 FF                    2320 	.db #0xff	; 255
      008273 FF                    2321 	.db #0xff	; 255
      008274 FF                    2322 	.db #0xff	; 255
      008275 FF                    2323 	.db #0xff	; 255
      008276 FF                    2324 	.db #0xff	; 255
      008277 FF                    2325 	.db #0xff	; 255
      008278 FF                    2326 	.db #0xff	; 255
      008279 FF                    2327 	.db #0xff	; 255
      00827A FF                    2328 	.db #0xff	; 255
      00827B FF                    2329 	.db #0xff	; 255
      00827C FF                    2330 	.db #0xff	; 255
      00827D FF                    2331 	.db #0xff	; 255
      00827E FF                    2332 	.db #0xff	; 255
      00827F FF                    2333 	.db #0xff	; 255
      008280 FF                    2334 	.db #0xff	; 255
      008281 FF                    2335 	.db #0xff	; 255
      008282 FF                    2336 	.db #0xff	; 255
      008283 FF                    2337 	.db #0xff	; 255
      008284 FF                    2338 	.db #0xff	; 255
      008285 FF                    2339 	.db #0xff	; 255
      008286 FF                    2340 	.db #0xff	; 255
      008287 FF                    2341 	.db #0xff	; 255
      008288 FF                    2342 	.db #0xff	; 255
      008289 FF                    2343 	.db #0xff	; 255
      00828A FF                    2344 	.db #0xff	; 255
      00828B FF                    2345 	.db #0xff	; 255
      00828C FF                    2346 	.db #0xff	; 255
      00828D FF                    2347 	.db #0xff	; 255
      00828E FF                    2348 	.db #0xff	; 255
      00828F FF                    2349 	.db #0xff	; 255
      008290 FF                    2350 	.db #0xff	; 255
      008291 FF                    2351 	.db #0xff	; 255
      008292 FF                    2352 	.db #0xff	; 255
      008293 FF                    2353 	.db #0xff	; 255
      008294 FF                    2354 	.db #0xff	; 255
      008295 FF                    2355 	.db #0xff	; 255
      008296 FF                    2356 	.db #0xff	; 255
      008297 FF                    2357 	.db #0xff	; 255
      008298 FF                    2358 	.db #0xff	; 255
      008299 FF                    2359 	.db #0xff	; 255
      00829A FF                    2360 	.db #0xff	; 255
      00829B FF                    2361 	.db #0xff	; 255
      00829C FF                    2362 	.db #0xff	; 255
      00829D FF                    2363 	.db #0xff	; 255
      00829E FF                    2364 	.db #0xff	; 255
      00829F FF                    2365 	.db #0xff	; 255
      0082A0 FF                    2366 	.db #0xff	; 255
      0082A1 FF                    2367 	.db #0xff	; 255
      0082A2 FF                    2368 	.db #0xff	; 255
      0082A3 FF                    2369 	.db #0xff	; 255
      0082A4 FF                    2370 	.db #0xff	; 255
      0082A5 FF                    2371 	.db #0xff	; 255
      0082A6 FF                    2372 	.db #0xff	; 255
      0082A7 FF                    2373 	.db #0xff	; 255
      0082A8 FF                    2374 	.db #0xff	; 255
      0082A9 FF                    2375 	.db #0xff	; 255
      0082AA FF                    2376 	.db #0xff	; 255
      0082AB FF                    2377 	.db #0xff	; 255
      0082AC FF                    2378 	.db #0xff	; 255
      0082AD FF                    2379 	.db #0xff	; 255
      0082AE FF                    2380 	.db #0xff	; 255
      0082AF FF                    2381 	.db #0xff	; 255
      0082B0 FF                    2382 	.db #0xff	; 255
      0082B1 FF                    2383 	.db #0xff	; 255
      0082B2 FF                    2384 	.db #0xff	; 255
      0082B3 FF                    2385 	.db #0xff	; 255
      0082B4 FF                    2386 	.db #0xff	; 255
      0082B5 FF                    2387 	.db #0xff	; 255
      0082B6 FF                    2388 	.db #0xff	; 255
      0082B7 FF                    2389 	.db #0xff	; 255
      0082B8 FF                    2390 	.db #0xff	; 255
      0082B9 FF                    2391 	.db #0xff	; 255
      0082BA FF                    2392 	.db #0xff	; 255
      0082BB FF                    2393 	.db #0xff	; 255
      0082BC FF                    2394 	.db #0xff	; 255
      0082BD FF                    2395 	.db #0xff	; 255
      0082BE FF                    2396 	.db #0xff	; 255
      0082BF FF                    2397 	.db #0xff	; 255
      0082C0 FF                    2398 	.db #0xff	; 255
      0082C1 FF                    2399 	.db #0xff	; 255
      0082C2 FF                    2400 	.db #0xff	; 255
      0082C3 FF                    2401 	.db #0xff	; 255
      0082C4 FF                    2402 	.db #0xff	; 255
      0082C5 FF                    2403 	.db #0xff	; 255
      0082C6 FF                    2404 	.db #0xff	; 255
      0082C7 FF                    2405 	.db #0xff	; 255
      0082C8 FF                    2406 	.db #0xff	; 255
      0082C9 FF                    2407 	.db #0xff	; 255
      0082CA FF                    2408 	.db #0xff	; 255
      0082CB FF                    2409 	.db #0xff	; 255
      0082CC FF                    2410 	.db #0xff	; 255
      0082CD FF                    2411 	.db #0xff	; 255
      0082CE FF                    2412 	.db #0xff	; 255
      0082CF FF                    2413 	.db #0xff	; 255
      0082D0 FF                    2414 	.db #0xff	; 255
      0082D1 FF                    2415 	.db #0xff	; 255
      0082D2 FF                    2416 	.db #0xff	; 255
      0082D3 FF                    2417 	.db #0xff	; 255
      0082D4 FF                    2418 	.db #0xff	; 255
      0082D5 FF                    2419 	.db #0xff	; 255
      0082D6 FF                    2420 	.db #0xff	; 255
      0082D7 FF                    2421 	.db #0xff	; 255
      0082D8 FF                    2422 	.db #0xff	; 255
      0082D9 FF                    2423 	.db #0xff	; 255
      0082DA FF                    2424 	.db #0xff	; 255
      0082DB FF                    2425 	.db #0xff	; 255
      0082DC FF                    2426 	.db #0xff	; 255
      0082DD FF                    2427 	.db #0xff	; 255
      0082DE FF                    2428 	.db #0xff	; 255
      0082DF FF                    2429 	.db #0xff	; 255
      0082E0 FF                    2430 	.db #0xff	; 255
      0082E1 FF                    2431 	.db #0xff	; 255
      0082E2 FF                    2432 	.db #0xff	; 255
      0082E3 FF                    2433 	.db #0xff	; 255
      0082E4 FF                    2434 	.db #0xff	; 255
      0082E5 FF                    2435 	.db #0xff	; 255
      0082E6 FF                    2436 	.db #0xff	; 255
      0082E7 FF                    2437 	.db #0xff	; 255
      0082E8 FF                    2438 	.db #0xff	; 255
      0082E9 FF                    2439 	.db #0xff	; 255
      0082EA FF                    2440 	.db #0xff	; 255
      0082EB FF                    2441 	.db #0xff	; 255
      0082EC FF                    2442 	.db #0xff	; 255
      0082ED FF                    2443 	.db #0xff	; 255
      0082EE FF                    2444 	.db #0xff	; 255
      0082EF FF                    2445 	.db #0xff	; 255
      0082F0 FF                    2446 	.db #0xff	; 255
      0082F1 FF                    2447 	.db #0xff	; 255
      0082F2 FF                    2448 	.db #0xff	; 255
      0082F3 FF                    2449 	.db #0xff	; 255
      0082F4 FF                    2450 	.db #0xff	; 255
      0082F5 FF                    2451 	.db #0xff	; 255
      0082F6 FF                    2452 	.db #0xff	; 255
      0082F7 FF                    2453 	.db #0xff	; 255
      0082F8 FF                    2454 	.db #0xff	; 255
      0082F9 FF                    2455 	.db #0xff	; 255
      0082FA FF                    2456 	.db #0xff	; 255
      0082FB FF                    2457 	.db #0xff	; 255
      0082FC FF                    2458 	.db #0xff	; 255
      0082FD FF                    2459 	.db #0xff	; 255
      0082FE FF                    2460 	.db #0xff	; 255
      0082FF FF                    2461 	.db #0xff	; 255
      008300 FF                    2462 	.db #0xff	; 255
      008301 FF                    2463 	.db #0xff	; 255
      008302 FF                    2464 	.db #0xff	; 255
      008303 FF                    2465 	.db #0xff	; 255
      008304 3F                    2466 	.db #0x3f	; 63
      008305 3F                    2467 	.db #0x3f	; 63
      008306 FF                    2468 	.db #0xff	; 255
      008307 FF                    2469 	.db #0xff	; 255
      008308 FF                    2470 	.db #0xff	; 255
      008309 FF                    2471 	.db #0xff	; 255
      00830A FF                    2472 	.db #0xff	; 255
      00830B FF                    2473 	.db #0xff	; 255
      00830C FF                    2474 	.db #0xff	; 255
      00830D FF                    2475 	.db #0xff	; 255
      00830E FF                    2476 	.db #0xff	; 255
      00830F FF                    2477 	.db #0xff	; 255
      008310 FF                    2478 	.db #0xff	; 255
      008311 FF                    2479 	.db #0xff	; 255
      008312 FF                    2480 	.db #0xff	; 255
      008313 FF                    2481 	.db #0xff	; 255
      008314 FF                    2482 	.db #0xff	; 255
      008315 FF                    2483 	.db #0xff	; 255
      008316 FF                    2484 	.db #0xff	; 255
      008317 FF                    2485 	.db #0xff	; 255
      008318 FF                    2486 	.db #0xff	; 255
      008319 FF                    2487 	.db #0xff	; 255
      00831A FF                    2488 	.db #0xff	; 255
      00831B FF                    2489 	.db #0xff	; 255
      00831C FF                    2490 	.db #0xff	; 255
      00831D FF                    2491 	.db #0xff	; 255
      00831E FF                    2492 	.db #0xff	; 255
      00831F FF                    2493 	.db #0xff	; 255
      008320 FF                    2494 	.db #0xff	; 255
      008321 FF                    2495 	.db #0xff	; 255
      008322 FF                    2496 	.db #0xff	; 255
      008323 FF                    2497 	.db #0xff	; 255
      008324 FF                    2498 	.db #0xff	; 255
      008325 FF                    2499 	.db #0xff	; 255
      008326 FF                    2500 	.db #0xff	; 255
      008327 FF                    2501 	.db #0xff	; 255
      008328 FF                    2502 	.db #0xff	; 255
      008329 FF                    2503 	.db #0xff	; 255
      00832A FF                    2504 	.db #0xff	; 255
      00832B FF                    2505 	.db #0xff	; 255
      00832C FF                    2506 	.db #0xff	; 255
      00832D FF                    2507 	.db #0xff	; 255
      00832E FF                    2508 	.db #0xff	; 255
      00832F FF                    2509 	.db #0xff	; 255
      008330 FF                    2510 	.db #0xff	; 255
      008331 FF                    2511 	.db #0xff	; 255
      008332 FF                    2512 	.db #0xff	; 255
      008333 FF                    2513 	.db #0xff	; 255
      008334 FF                    2514 	.db #0xff	; 255
      008335 FF                    2515 	.db #0xff	; 255
      008336 FF                    2516 	.db #0xff	; 255
      008337 FF                    2517 	.db #0xff	; 255
      008338 FF                    2518 	.db #0xff	; 255
      008339 FF                    2519 	.db #0xff	; 255
      00833A FF                    2520 	.db #0xff	; 255
      00833B FF                    2521 	.db #0xff	; 255
      00833C FF                    2522 	.db #0xff	; 255
      00833D FF                    2523 	.db #0xff	; 255
      00833E FF                    2524 	.db #0xff	; 255
      00833F FF                    2525 	.db #0xff	; 255
      008340 FF                    2526 	.db #0xff	; 255
      008341 FF                    2527 	.db #0xff	; 255
      008342 FF                    2528 	.db #0xff	; 255
      008343 FF                    2529 	.db #0xff	; 255
      008344 FF                    2530 	.db #0xff	; 255
      008345 FF                    2531 	.db #0xff	; 255
      008346 FF                    2532 	.db #0xff	; 255
      008347 FF                    2533 	.db #0xff	; 255
      008348 FF                    2534 	.db #0xff	; 255
      008349 FF                    2535 	.db #0xff	; 255
      00834A FF                    2536 	.db #0xff	; 255
      00834B FF                    2537 	.db #0xff	; 255
      00834C FF                    2538 	.db #0xff	; 255
      00834D FF                    2539 	.db #0xff	; 255
      00834E FF                    2540 	.db #0xff	; 255
      00834F FF                    2541 	.db #0xff	; 255
      008350 FF                    2542 	.db #0xff	; 255
      008351 FF                    2543 	.db #0xff	; 255
      008352 FF                    2544 	.db #0xff	; 255
      008353 FF                    2545 	.db #0xff	; 255
      008354 FF                    2546 	.db #0xff	; 255
      008355 FF                    2547 	.db #0xff	; 255
      008356 FF                    2548 	.db #0xff	; 255
      008357 FF                    2549 	.db #0xff	; 255
      008358 FF                    2550 	.db #0xff	; 255
      008359 FF                    2551 	.db #0xff	; 255
      00835A FF                    2552 	.db #0xff	; 255
      00835B FF                    2553 	.db #0xff	; 255
      00835C FF                    2554 	.db #0xff	; 255
      00835D FF                    2555 	.db #0xff	; 255
      00835E FF                    2556 	.db #0xff	; 255
      00835F FF                    2557 	.db #0xff	; 255
      008360 FF                    2558 	.db #0xff	; 255
      008361 FF                    2559 	.db #0xff	; 255
      008362 FF                    2560 	.db #0xff	; 255
      008363 FF                    2561 	.db #0xff	; 255
      008364 FF                    2562 	.db #0xff	; 255
      008365 FF                    2563 	.db #0xff	; 255
      008366 FF                    2564 	.db #0xff	; 255
      008367 FF                    2565 	.db #0xff	; 255
      008368 FF                    2566 	.db #0xff	; 255
      008369 FF                    2567 	.db #0xff	; 255
      00836A FF                    2568 	.db #0xff	; 255
      00836B FF                    2569 	.db #0xff	; 255
      00836C FF                    2570 	.db #0xff	; 255
      00836D FF                    2571 	.db #0xff	; 255
      00836E FF                    2572 	.db #0xff	; 255
      00836F FF                    2573 	.db #0xff	; 255
      008370 FF                    2574 	.db #0xff	; 255
      008371 FF                    2575 	.db #0xff	; 255
      008372 FF                    2576 	.db #0xff	; 255
      008373 FF                    2577 	.db #0xff	; 255
      008374 FF                    2578 	.db #0xff	; 255
      008375 FF                    2579 	.db #0xff	; 255
      008376 FF                    2580 	.db #0xff	; 255
      008377 FF                    2581 	.db #0xff	; 255
      008378 FF                    2582 	.db #0xff	; 255
      008379 FF                    2583 	.db #0xff	; 255
      00837A FF                    2584 	.db #0xff	; 255
      00837B FF                    2585 	.db #0xff	; 255
      00837C FF                    2586 	.db #0xff	; 255
      00837D FF                    2587 	.db #0xff	; 255
      00837E FF                    2588 	.db #0xff	; 255
      00837F FF                    2589 	.db #0xff	; 255
      008380 7F                    2590 	.db #0x7f	; 127
      008381 1F                    2591 	.db #0x1f	; 31
      008382 03                    2592 	.db #0x03	; 3
      008383 00                    2593 	.db #0x00	; 0
      008384 00                    2594 	.db #0x00	; 0
      008385 00                    2595 	.db #0x00	; 0
      008386 00                    2596 	.db #0x00	; 0
      008387 03                    2597 	.db #0x03	; 3
      008388 1F                    2598 	.db #0x1f	; 31
      008389 7F                    2599 	.db #0x7f	; 127
      00838A FF                    2600 	.db #0xff	; 255
      00838B FF                    2601 	.db #0xff	; 255
      00838C FF                    2602 	.db #0xff	; 255
      00838D FF                    2603 	.db #0xff	; 255
      00838E FF                    2604 	.db #0xff	; 255
      00838F FF                    2605 	.db #0xff	; 255
      008390 FF                    2606 	.db #0xff	; 255
      008391 FF                    2607 	.db #0xff	; 255
      008392 FF                    2608 	.db #0xff	; 255
      008393 FF                    2609 	.db #0xff	; 255
      008394 FF                    2610 	.db #0xff	; 255
      008395 FF                    2611 	.db #0xff	; 255
      008396 FF                    2612 	.db #0xff	; 255
      008397 FF                    2613 	.db #0xff	; 255
      008398 FF                    2614 	.db #0xff	; 255
      008399 FF                    2615 	.db #0xff	; 255
      00839A FF                    2616 	.db #0xff	; 255
      00839B FF                    2617 	.db #0xff	; 255
      00839C FF                    2618 	.db #0xff	; 255
      00839D FF                    2619 	.db #0xff	; 255
      00839E FF                    2620 	.db #0xff	; 255
      00839F FF                    2621 	.db #0xff	; 255
      0083A0 FF                    2622 	.db #0xff	; 255
      0083A1 FF                    2623 	.db #0xff	; 255
      0083A2 FF                    2624 	.db #0xff	; 255
      0083A3 FF                    2625 	.db #0xff	; 255
      0083A4 FF                    2626 	.db #0xff	; 255
      0083A5 FF                    2627 	.db #0xff	; 255
      0083A6 FF                    2628 	.db #0xff	; 255
      0083A7 FF                    2629 	.db #0xff	; 255
      0083A8 FF                    2630 	.db #0xff	; 255
      0083A9 FF                    2631 	.db #0xff	; 255
      0083AA FF                    2632 	.db #0xff	; 255
      0083AB FF                    2633 	.db #0xff	; 255
      0083AC FF                    2634 	.db #0xff	; 255
      0083AD FF                    2635 	.db #0xff	; 255
      0083AE FF                    2636 	.db #0xff	; 255
      0083AF FF                    2637 	.db #0xff	; 255
      0083B0 FF                    2638 	.db #0xff	; 255
      0083B1 FF                    2639 	.db #0xff	; 255
      0083B2 FF                    2640 	.db #0xff	; 255
      0083B3 FF                    2641 	.db #0xff	; 255
      0083B4 FF                    2642 	.db #0xff	; 255
      0083B5 FF                    2643 	.db #0xff	; 255
      0083B6 FF                    2644 	.db #0xff	; 255
      0083B7 FF                    2645 	.db #0xff	; 255
      0083B8 FF                    2646 	.db #0xff	; 255
      0083B9 FF                    2647 	.db #0xff	; 255
      0083BA FF                    2648 	.db #0xff	; 255
      0083BB FF                    2649 	.db #0xff	; 255
      0083BC FF                    2650 	.db #0xff	; 255
      0083BD FF                    2651 	.db #0xff	; 255
      0083BE FF                    2652 	.db #0xff	; 255
      0083BF FF                    2653 	.db #0xff	; 255
      0083C0 FF                    2654 	.db #0xff	; 255
      0083C1 FF                    2655 	.db #0xff	; 255
      0083C2 FF                    2656 	.db #0xff	; 255
      0083C3 FF                    2657 	.db #0xff	; 255
      0083C4 FF                    2658 	.db #0xff	; 255
      0083C5 FF                    2659 	.db #0xff	; 255
      0083C6 FF                    2660 	.db #0xff	; 255
      0083C7 FF                    2661 	.db #0xff	; 255
      0083C8 FF                    2662 	.db #0xff	; 255
      0083C9 FF                    2663 	.db #0xff	; 255
      0083CA FF                    2664 	.db #0xff	; 255
      0083CB FF                    2665 	.db #0xff	; 255
      0083CC FF                    2666 	.db #0xff	; 255
      0083CD FF                    2667 	.db #0xff	; 255
      0083CE FF                    2668 	.db #0xff	; 255
      0083CF FF                    2669 	.db #0xff	; 255
      0083D0 FF                    2670 	.db #0xff	; 255
      0083D1 FF                    2671 	.db #0xff	; 255
      0083D2 FF                    2672 	.db #0xff	; 255
      0083D3 FF                    2673 	.db #0xff	; 255
      0083D4 FF                    2674 	.db #0xff	; 255
      0083D5 FF                    2675 	.db #0xff	; 255
      0083D6 FF                    2676 	.db #0xff	; 255
      0083D7 FF                    2677 	.db #0xff	; 255
      0083D8 FF                    2678 	.db #0xff	; 255
      0083D9 FF                    2679 	.db #0xff	; 255
      0083DA FF                    2680 	.db #0xff	; 255
      0083DB FF                    2681 	.db #0xff	; 255
      0083DC FF                    2682 	.db #0xff	; 255
      0083DD FF                    2683 	.db #0xff	; 255
      0083DE FF                    2684 	.db #0xff	; 255
      0083DF FF                    2685 	.db #0xff	; 255
      0083E0 FF                    2686 	.db #0xff	; 255
      0083E1 FF                    2687 	.db #0xff	; 255
      0083E2 FF                    2688 	.db #0xff	; 255
      0083E3 FF                    2689 	.db #0xff	; 255
      0083E4 FF                    2690 	.db #0xff	; 255
      0083E5 FF                    2691 	.db #0xff	; 255
      0083E6 FF                    2692 	.db #0xff	; 255
      0083E7 FF                    2693 	.db #0xff	; 255
      0083E8 FF                    2694 	.db #0xff	; 255
      0083E9 FF                    2695 	.db #0xff	; 255
      0083EA FF                    2696 	.db #0xff	; 255
      0083EB FF                    2697 	.db #0xff	; 255
      0083EC FF                    2698 	.db #0xff	; 255
      0083ED FB                    2699 	.db #0xfb	; 251
      0083EE FB                    2700 	.db #0xfb	; 251
      0083EF F3                    2701 	.db #0xf3	; 243
      0083F0 F3                    2702 	.db #0xf3	; 243
      0083F1 E3                    2703 	.db #0xe3	; 227
      0083F2 E3                    2704 	.db #0xe3	; 227
      0083F3 C3                    2705 	.db #0xc3	; 195
      0083F4 C3                    2706 	.db #0xc3	; 195
      0083F5 83                    2707 	.db #0x83	; 131
      0083F6 83                    2708 	.db #0x83	; 131
      0083F7 03                    2709 	.db #0x03	; 3
      0083F8 03                    2710 	.db #0x03	; 3
      0083F9 03                    2711 	.db #0x03	; 3
      0083FA 03                    2712 	.db #0x03	; 3
      0083FB 03                    2713 	.db #0x03	; 3
      0083FC 03                    2714 	.db #0x03	; 3
      0083FD 03                    2715 	.db #0x03	; 3
      0083FE 03                    2716 	.db #0x03	; 3
      0083FF 01                    2717 	.db #0x01	; 1
      008400 00                    2718 	.db #0x00	; 0
      008401 00                    2719 	.db #0x00	; 0
      008402 00                    2720 	.db #0x00	; 0
      008403 00                    2721 	.db #0x00	; 0
      008404 00                    2722 	.db #0x00	; 0
      008405 00                    2723 	.db #0x00	; 0
      008406 00                    2724 	.db #0x00	; 0
      008407 00                    2725 	.db #0x00	; 0
      008408 00                    2726 	.db #0x00	; 0
      008409 00                    2727 	.db #0x00	; 0
      00840A 01                    2728 	.db #0x01	; 1
      00840B 03                    2729 	.db #0x03	; 3
      00840C 03                    2730 	.db #0x03	; 3
      00840D 03                    2731 	.db #0x03	; 3
      00840E 03                    2732 	.db #0x03	; 3
      00840F 03                    2733 	.db #0x03	; 3
      008410 03                    2734 	.db #0x03	; 3
      008411 03                    2735 	.db #0x03	; 3
      008412 03                    2736 	.db #0x03	; 3
      008413 83                    2737 	.db #0x83	; 131
      008414 83                    2738 	.db #0x83	; 131
      008415 C3                    2739 	.db #0xc3	; 195
      008416 C3                    2740 	.db #0xc3	; 195
      008417 E3                    2741 	.db #0xe3	; 227
      008418 E3                    2742 	.db #0xe3	; 227
      008419 F3                    2743 	.db #0xf3	; 243
      00841A F3                    2744 	.db #0xf3	; 243
      00841B FB                    2745 	.db #0xfb	; 251
      00841C FB                    2746 	.db #0xfb	; 251
      00841D FF                    2747 	.db #0xff	; 255
      00841E FF                    2748 	.db #0xff	; 255
      00841F FF                    2749 	.db #0xff	; 255
      008420 FF                    2750 	.db #0xff	; 255
      008421 FF                    2751 	.db #0xff	; 255
      008422 FF                    2752 	.db #0xff	; 255
      008423 FF                    2753 	.db #0xff	; 255
      008424 FF                    2754 	.db #0xff	; 255
      008425 FF                    2755 	.db #0xff	; 255
      008426 FF                    2756 	.db #0xff	; 255
      008427 FF                    2757 	.db #0xff	; 255
      008428 FF                    2758 	.db #0xff	; 255
      008429 FF                    2759 	.db #0xff	; 255
      00842A FF                    2760 	.db #0xff	; 255
      00842B FF                    2761 	.db #0xff	; 255
      00842C FF                    2762 	.db #0xff	; 255
      00842D FF                    2763 	.db #0xff	; 255
      00842E FF                    2764 	.db #0xff	; 255
      00842F FF                    2765 	.db #0xff	; 255
      008430 FF                    2766 	.db #0xff	; 255
      008431 FF                    2767 	.db #0xff	; 255
      008432 FF                    2768 	.db #0xff	; 255
      008433 FF                    2769 	.db #0xff	; 255
      008434 FF                    2770 	.db #0xff	; 255
      008435 FF                    2771 	.db #0xff	; 255
      008436 FF                    2772 	.db #0xff	; 255
      008437 FF                    2773 	.db #0xff	; 255
      008438 FF                    2774 	.db #0xff	; 255
      008439 FF                    2775 	.db #0xff	; 255
      00843A FF                    2776 	.db #0xff	; 255
      00843B FF                    2777 	.db #0xff	; 255
      00843C FF                    2778 	.db #0xff	; 255
      00843D FF                    2779 	.db #0xff	; 255
      00843E FF                    2780 	.db #0xff	; 255
      00843F FF                    2781 	.db #0xff	; 255
      008440 FF                    2782 	.db #0xff	; 255
      008441 FF                    2783 	.db #0xff	; 255
      008442 FF                    2784 	.db #0xff	; 255
      008443 FF                    2785 	.db #0xff	; 255
      008444 FF                    2786 	.db #0xff	; 255
      008445 FF                    2787 	.db #0xff	; 255
      008446 FF                    2788 	.db #0xff	; 255
      008447 FF                    2789 	.db #0xff	; 255
      008448 FF                    2790 	.db #0xff	; 255
      008449 FF                    2791 	.db #0xff	; 255
      00844A FF                    2792 	.db #0xff	; 255
      00844B FF                    2793 	.db #0xff	; 255
      00844C FF                    2794 	.db #0xff	; 255
      00844D FF                    2795 	.db #0xff	; 255
      00844E FF                    2796 	.db #0xff	; 255
      00844F FF                    2797 	.db #0xff	; 255
      008450 FF                    2798 	.db #0xff	; 255
      008451 FF                    2799 	.db #0xff	; 255
      008452 FF                    2800 	.db #0xff	; 255
      008453 FF                    2801 	.db #0xff	; 255
      008454 FF                    2802 	.db #0xff	; 255
      008455 FF                    2803 	.db #0xff	; 255
      008456 FF                    2804 	.db #0xff	; 255
      008457 FF                    2805 	.db #0xff	; 255
      008458 FF                    2806 	.db #0xff	; 255
      008459 FF                    2807 	.db #0xff	; 255
      00845A FF                    2808 	.db #0xff	; 255
      00845B FF                    2809 	.db #0xff	; 255
      00845C FF                    2810 	.db #0xff	; 255
      00845D FF                    2811 	.db #0xff	; 255
      00845E FF                    2812 	.db #0xff	; 255
      00845F FF                    2813 	.db #0xff	; 255
      008460 FF                    2814 	.db #0xff	; 255
      008461 FF                    2815 	.db #0xff	; 255
      008462 FF                    2816 	.db #0xff	; 255
      008463 FF                    2817 	.db #0xff	; 255
      008464 FF                    2818 	.db #0xff	; 255
      008465 FF                    2819 	.db #0xff	; 255
      008466 FF                    2820 	.db #0xff	; 255
      008467 FF                    2821 	.db #0xff	; 255
      008468 FF                    2822 	.db #0xff	; 255
      008469 FF                    2823 	.db #0xff	; 255
      00846A FF                    2824 	.db #0xff	; 255
      00846B FF                    2825 	.db #0xff	; 255
      00846C FF                    2826 	.db #0xff	; 255
      00846D FF                    2827 	.db #0xff	; 255
      00846E FF                    2828 	.db #0xff	; 255
      00846F FF                    2829 	.db #0xff	; 255
      008470 FF                    2830 	.db #0xff	; 255
      008471 FF                    2831 	.db #0xff	; 255
      008472 FF                    2832 	.db #0xff	; 255
      008473 FF                    2833 	.db #0xff	; 255
      008474 FF                    2834 	.db #0xff	; 255
      008475 FF                    2835 	.db #0xff	; 255
      008476 FF                    2836 	.db #0xff	; 255
      008477 FF                    2837 	.db #0xff	; 255
      008478 FE                    2838 	.db #0xfe	; 254
      008479 7E                    2839 	.db #0x7e	; 126
      00847A 1C                    2840 	.db #0x1c	; 28
      00847B 04                    2841 	.db #0x04	; 4
      00847C 00                    2842 	.db #0x00	; 0
      00847D 00                    2843 	.db #0x00	; 0
      00847E 00                    2844 	.db #0x00	; 0
      00847F 00                    2845 	.db #0x00	; 0
      008480 00                    2846 	.db #0x00	; 0
      008481 00                    2847 	.db #0x00	; 0
      008482 00                    2848 	.db #0x00	; 0
      008483 00                    2849 	.db #0x00	; 0
      008484 00                    2850 	.db #0x00	; 0
      008485 00                    2851 	.db #0x00	; 0
      008486 00                    2852 	.db #0x00	; 0
      008487 00                    2853 	.db #0x00	; 0
      008488 00                    2854 	.db #0x00	; 0
      008489 00                    2855 	.db #0x00	; 0
      00848A 00                    2856 	.db #0x00	; 0
      00848B 00                    2857 	.db #0x00	; 0
      00848C 00                    2858 	.db #0x00	; 0
      00848D 00                    2859 	.db #0x00	; 0
      00848E 04                    2860 	.db #0x04	; 4
      00848F 1C                    2861 	.db #0x1c	; 28
      008490 7E                    2862 	.db #0x7e	; 126
      008491 FE                    2863 	.db #0xfe	; 254
      008492 FF                    2864 	.db #0xff	; 255
      008493 FF                    2865 	.db #0xff	; 255
      008494 FF                    2866 	.db #0xff	; 255
      008495 FF                    2867 	.db #0xff	; 255
      008496 FF                    2868 	.db #0xff	; 255
      008497 FF                    2869 	.db #0xff	; 255
      008498 FF                    2870 	.db #0xff	; 255
      008499 FF                    2871 	.db #0xff	; 255
      00849A FF                    2872 	.db #0xff	; 255
      00849B FF                    2873 	.db #0xff	; 255
      00849C FF                    2874 	.db #0xff	; 255
      00849D FF                    2875 	.db #0xff	; 255
      00849E FF                    2876 	.db #0xff	; 255
      00849F FF                    2877 	.db #0xff	; 255
      0084A0 FF                    2878 	.db #0xff	; 255
      0084A1 FF                    2879 	.db #0xff	; 255
      0084A2 FF                    2880 	.db #0xff	; 255
      0084A3 FF                    2881 	.db #0xff	; 255
      0084A4 FF                    2882 	.db #0xff	; 255
      0084A5 FF                    2883 	.db #0xff	; 255
      0084A6 FF                    2884 	.db #0xff	; 255
      0084A7 FF                    2885 	.db #0xff	; 255
      0084A8 FF                    2886 	.db #0xff	; 255
      0084A9 FF                    2887 	.db #0xff	; 255
      0084AA FF                    2888 	.db #0xff	; 255
      0084AB FF                    2889 	.db #0xff	; 255
      0084AC FF                    2890 	.db #0xff	; 255
      0084AD FF                    2891 	.db #0xff	; 255
      0084AE FF                    2892 	.db #0xff	; 255
      0084AF FF                    2893 	.db #0xff	; 255
      0084B0 FF                    2894 	.db #0xff	; 255
      0084B1 FF                    2895 	.db #0xff	; 255
      0084B2 FF                    2896 	.db #0xff	; 255
      0084B3 FF                    2897 	.db #0xff	; 255
      0084B4 FF                    2898 	.db #0xff	; 255
      0084B5 FF                    2899 	.db #0xff	; 255
      0084B6 FF                    2900 	.db #0xff	; 255
      0084B7 FF                    2901 	.db #0xff	; 255
      0084B8 FF                    2902 	.db #0xff	; 255
      0084B9 FF                    2903 	.db #0xff	; 255
      0084BA FF                    2904 	.db #0xff	; 255
      0084BB FF                    2905 	.db #0xff	; 255
      0084BC FF                    2906 	.db #0xff	; 255
      0084BD FF                    2907 	.db #0xff	; 255
      0084BE FF                    2908 	.db #0xff	; 255
      0084BF FF                    2909 	.db #0xff	; 255
      0084C0 FF                    2910 	.db #0xff	; 255
      0084C1 FF                    2911 	.db #0xff	; 255
      0084C2 FF                    2912 	.db #0xff	; 255
      0084C3 FF                    2913 	.db #0xff	; 255
      0084C4 FF                    2914 	.db #0xff	; 255
      0084C5 FF                    2915 	.db #0xff	; 255
      0084C6 FF                    2916 	.db #0xff	; 255
      0084C7 FF                    2917 	.db #0xff	; 255
      0084C8 FF                    2918 	.db #0xff	; 255
      0084C9 FF                    2919 	.db #0xff	; 255
      0084CA FF                    2920 	.db #0xff	; 255
      0084CB FF                    2921 	.db #0xff	; 255
      0084CC FF                    2922 	.db #0xff	; 255
      0084CD FF                    2923 	.db #0xff	; 255
      0084CE FF                    2924 	.db #0xff	; 255
      0084CF FF                    2925 	.db #0xff	; 255
      0084D0 FF                    2926 	.db #0xff	; 255
      0084D1 FF                    2927 	.db #0xff	; 255
      0084D2 FF                    2928 	.db #0xff	; 255
      0084D3 FF                    2929 	.db #0xff	; 255
      0084D4 FF                    2930 	.db #0xff	; 255
      0084D5 FF                    2931 	.db #0xff	; 255
      0084D6 FF                    2932 	.db #0xff	; 255
      0084D7 FF                    2933 	.db #0xff	; 255
      0084D8 FF                    2934 	.db #0xff	; 255
      0084D9 FF                    2935 	.db #0xff	; 255
      0084DA FF                    2936 	.db #0xff	; 255
      0084DB FF                    2937 	.db #0xff	; 255
      0084DC FF                    2938 	.db #0xff	; 255
      0084DD FF                    2939 	.db #0xff	; 255
      0084DE FF                    2940 	.db #0xff	; 255
      0084DF FF                    2941 	.db #0xff	; 255
      0084E0 FF                    2942 	.db #0xff	; 255
      0084E1 FF                    2943 	.db #0xff	; 255
      0084E2 FF                    2944 	.db #0xff	; 255
      0084E3 FF                    2945 	.db #0xff	; 255
      0084E4 FF                    2946 	.db #0xff	; 255
      0084E5 FF                    2947 	.db #0xff	; 255
      0084E6 FF                    2948 	.db #0xff	; 255
      0084E7 FF                    2949 	.db #0xff	; 255
      0084E8 FF                    2950 	.db #0xff	; 255
      0084E9 FF                    2951 	.db #0xff	; 255
      0084EA FF                    2952 	.db #0xff	; 255
      0084EB FF                    2953 	.db #0xff	; 255
      0084EC FF                    2954 	.db #0xff	; 255
      0084ED FF                    2955 	.db #0xff	; 255
      0084EE FF                    2956 	.db #0xff	; 255
      0084EF FF                    2957 	.db #0xff	; 255
      0084F0 FF                    2958 	.db #0xff	; 255
      0084F1 FF                    2959 	.db #0xff	; 255
      0084F2 FF                    2960 	.db #0xff	; 255
      0084F3 FF                    2961 	.db #0xff	; 255
      0084F4 FF                    2962 	.db #0xff	; 255
      0084F5 FF                    2963 	.db #0xff	; 255
      0084F6 BF                    2964 	.db #0xbf	; 191
      0084F7 8F                    2965 	.db #0x8f	; 143
      0084F8 C3                    2966 	.db #0xc3	; 195
      0084F9 C0                    2967 	.db #0xc0	; 192
      0084FA E0                    2968 	.db #0xe0	; 224
      0084FB E0                    2969 	.db #0xe0	; 224
      0084FC F0                    2970 	.db #0xf0	; 240
      0084FD F8                    2971 	.db #0xf8	; 248
      0084FE F8                    2972 	.db #0xf8	; 248
      0084FF FC                    2973 	.db #0xfc	; 252
      008500 FC                    2974 	.db #0xfc	; 252
      008501 FE                    2975 	.db #0xfe	; 254
      008502 FE                    2976 	.db #0xfe	; 254
      008503 FF                    2977 	.db #0xff	; 255
      008504 FF                    2978 	.db #0xff	; 255
      008505 FF                    2979 	.db #0xff	; 255
      008506 FF                    2980 	.db #0xff	; 255
      008507 FE                    2981 	.db #0xfe	; 254
      008508 FE                    2982 	.db #0xfe	; 254
      008509 FC                    2983 	.db #0xfc	; 252
      00850A FC                    2984 	.db #0xfc	; 252
      00850B F8                    2985 	.db #0xf8	; 248
      00850C F8                    2986 	.db #0xf8	; 248
      00850D F0                    2987 	.db #0xf0	; 240
      00850E E0                    2988 	.db #0xe0	; 224
      00850F E0                    2989 	.db #0xe0	; 224
      008510 C0                    2990 	.db #0xc0	; 192
      008511 C3                    2991 	.db #0xc3	; 195
      008512 8F                    2992 	.db #0x8f	; 143
      008513 BF                    2993 	.db #0xbf	; 191
      008514 FF                    2994 	.db #0xff	; 255
      008515 FF                    2995 	.db #0xff	; 255
      008516 FF                    2996 	.db #0xff	; 255
      008517 FF                    2997 	.db #0xff	; 255
      008518 FF                    2998 	.db #0xff	; 255
      008519 FF                    2999 	.db #0xff	; 255
      00851A FF                    3000 	.db #0xff	; 255
      00851B FF                    3001 	.db #0xff	; 255
      00851C FF                    3002 	.db #0xff	; 255
      00851D FF                    3003 	.db #0xff	; 255
      00851E FF                    3004 	.db #0xff	; 255
      00851F FF                    3005 	.db #0xff	; 255
      008520 FF                    3006 	.db #0xff	; 255
      008521 FF                    3007 	.db #0xff	; 255
      008522 FF                    3008 	.db #0xff	; 255
      008523 FF                    3009 	.db #0xff	; 255
      008524 FF                    3010 	.db #0xff	; 255
      008525 FF                    3011 	.db #0xff	; 255
      008526 FF                    3012 	.db #0xff	; 255
      008527 FF                    3013 	.db #0xff	; 255
      008528 FF                    3014 	.db #0xff	; 255
      008529 FF                    3015 	.db #0xff	; 255
      00852A FF                    3016 	.db #0xff	; 255
      00852B FF                    3017 	.db #0xff	; 255
      00852C FF                    3018 	.db #0xff	; 255
      00852D FF                    3019 	.db #0xff	; 255
      00852E FF                    3020 	.db #0xff	; 255
      00852F FF                    3021 	.db #0xff	; 255
      008530 FF                    3022 	.db #0xff	; 255
      008531 FF                    3023 	.db #0xff	; 255
      008532 FF                    3024 	.db #0xff	; 255
      008533 FF                    3025 	.db #0xff	; 255
      008534 FF                    3026 	.db #0xff	; 255
      008535 FF                    3027 	.db #0xff	; 255
      008536 FF                    3028 	.db #0xff	; 255
      008537 FF                    3029 	.db #0xff	; 255
      008538 FF                    3030 	.db #0xff	; 255
      008539 FF                    3031 	.db #0xff	; 255
      00853A FF                    3032 	.db #0xff	; 255
      00853B FF                    3033 	.db #0xff	; 255
      00853C FF                    3034 	.db #0xff	; 255
      00853D FF                    3035 	.db #0xff	; 255
      00853E FF                    3036 	.db #0xff	; 255
      00853F FF                    3037 	.db #0xff	; 255
      008540 FF                    3038 	.db #0xff	; 255
      008541 FF                    3039 	.db #0xff	; 255
      008542 FF                    3040 	.db #0xff	; 255
      008543 FF                    3041 	.db #0xff	; 255
      008544 FF                    3042 	.db #0xff	; 255
      008545 FF                    3043 	.db #0xff	; 255
      008546 FF                    3044 	.db #0xff	; 255
      008547 FF                    3045 	.db #0xff	; 255
      008548 FF                    3046 	.db #0xff	; 255
      008549 FF                    3047 	.db #0xff	; 255
      00854A FF                    3048 	.db #0xff	; 255
      00854B FF                    3049 	.db #0xff	; 255
      00854C FF                    3050 	.db #0xff	; 255
      00854D FF                    3051 	.db #0xff	; 255
      00854E FF                    3052 	.db #0xff	; 255
      00854F FF                    3053 	.db #0xff	; 255
      008550 FF                    3054 	.db #0xff	; 255
      008551 FF                    3055 	.db #0xff	; 255
      008552 FF                    3056 	.db #0xff	; 255
      008553 FF                    3057 	.db #0xff	; 255
      008554 FF                    3058 	.db #0xff	; 255
      008555 FF                    3059 	.db #0xff	; 255
      008556 FF                    3060 	.db #0xff	; 255
      008557 FF                    3061 	.db #0xff	; 255
      008558 FF                    3062 	.db #0xff	; 255
      008559 FF                    3063 	.db #0xff	; 255
      00855A FF                    3064 	.db #0xff	; 255
      00855B FF                    3065 	.db #0xff	; 255
      00855C FF                    3066 	.db #0xff	; 255
      00855D FF                    3067 	.db #0xff	; 255
      00855E FF                    3068 	.db #0xff	; 255
      00855F FF                    3069 	.db #0xff	; 255
      008560 FF                    3070 	.db #0xff	; 255
      008561 FF                    3071 	.db #0xff	; 255
      008562 FF                    3072 	.db #0xff	; 255
      008563 FF                    3073 	.db #0xff	; 255
      008564 FF                    3074 	.db #0xff	; 255
      008565 FF                    3075 	.db #0xff	; 255
      008566 FF                    3076 	.db #0xff	; 255
      008567 FF                    3077 	.db #0xff	; 255
      008568 FF                    3078 	.db #0xff	; 255
      008569 FF                    3079 	.db #0xff	; 255
      00856A FF                    3080 	.db #0xff	; 255
      00856B FF                    3081 	.db #0xff	; 255
      00856C FF                    3082 	.db #0xff	; 255
      00856D FF                    3083 	.db #0xff	; 255
      00856E FF                    3084 	.db #0xff	; 255
      00856F FF                    3085 	.db #0xff	; 255
      008570 FF                    3086 	.db #0xff	; 255
      008571 FF                    3087 	.db #0xff	; 255
      008572 FF                    3088 	.db #0xff	; 255
      008573 FF                    3089 	.db #0xff	; 255
      008574 FF                    3090 	.db #0xff	; 255
      008575 FF                    3091 	.db #0xff	; 255
      008576 FF                    3092 	.db #0xff	; 255
      008577 FF                    3093 	.db #0xff	; 255
      008578 FF                    3094 	.db #0xff	; 255
      008579 FF                    3095 	.db #0xff	; 255
      00857A FF                    3096 	.db #0xff	; 255
      00857B FF                    3097 	.db #0xff	; 255
      00857C FF                    3098 	.db #0xff	; 255
      00857D FF                    3099 	.db #0xff	; 255
      00857E FF                    3100 	.db #0xff	; 255
      00857F FF                    3101 	.db #0xff	; 255
      008580 FF                    3102 	.db #0xff	; 255
      008581 FF                    3103 	.db #0xff	; 255
      008582 FF                    3104 	.db #0xff	; 255
      008583 FF                    3105 	.db #0xff	; 255
      008584 FF                    3106 	.db #0xff	; 255
      008585 FF                    3107 	.db #0xff	; 255
      008586 FF                    3108 	.db #0xff	; 255
      008587 FF                    3109 	.db #0xff	; 255
      008588 FF                    3110 	.db #0xff	; 255
      008589 FF                    3111 	.db #0xff	; 255
      00858A FF                    3112 	.db #0xff	; 255
      00858B FF                    3113 	.db #0xff	; 255
      00858C FF                    3114 	.db #0xff	; 255
      00858D FF                    3115 	.db #0xff	; 255
      00858E FF                    3116 	.db #0xff	; 255
      00858F FF                    3117 	.db #0xff	; 255
      008590 FF                    3118 	.db #0xff	; 255
      008591 FF                    3119 	.db #0xff	; 255
      008592 FF                    3120 	.db #0xff	; 255
      008593 FF                    3121 	.db #0xff	; 255
      008594 FF                    3122 	.db #0xff	; 255
      008595 FF                    3123 	.db #0xff	; 255
      008596 FF                    3124 	.db #0xff	; 255
      008597 FF                    3125 	.db #0xff	; 255
      008598 FF                    3126 	.db #0xff	; 255
      008599 FF                    3127 	.db #0xff	; 255
      00859A FF                    3128 	.db #0xff	; 255
      00859B FF                    3129 	.db #0xff	; 255
      00859C FF                    3130 	.db #0xff	; 255
      00859D FF                    3131 	.db #0xff	; 255
      00859E FF                    3132 	.db #0xff	; 255
      00859F FF                    3133 	.db #0xff	; 255
      0085A0 FF                    3134 	.db #0xff	; 255
      0085A1 FF                    3135 	.db #0xff	; 255
      0085A2 FF                    3136 	.db #0xff	; 255
      0085A3 FF                    3137 	.db #0xff	; 255
      0085A4 FF                    3138 	.db #0xff	; 255
      0085A5 FF                    3139 	.db #0xff	; 255
      0085A6 FF                    3140 	.db #0xff	; 255
      0085A7 FF                    3141 	.db #0xff	; 255
      0085A8 FF                    3142 	.db #0xff	; 255
      0085A9 FF                    3143 	.db #0xff	; 255
      0085AA FF                    3144 	.db #0xff	; 255
      0085AB FF                    3145 	.db #0xff	; 255
      0085AC FF                    3146 	.db #0xff	; 255
      0085AD FF                    3147 	.db #0xff	; 255
      0085AE FF                    3148 	.db #0xff	; 255
      0085AF FF                    3149 	.db #0xff	; 255
      0085B0 FF                    3150 	.db #0xff	; 255
      0085B1 FF                    3151 	.db #0xff	; 255
      0085B2 FF                    3152 	.db #0xff	; 255
      0085B3 FF                    3153 	.db #0xff	; 255
      0085B4 FF                    3154 	.db #0xff	; 255
      0085B5 FF                    3155 	.db #0xff	; 255
      0085B6 FF                    3156 	.db #0xff	; 255
      0085B7 FF                    3157 	.db #0xff	; 255
      0085B8 FF                    3158 	.db #0xff	; 255
      0085B9 FF                    3159 	.db #0xff	; 255
      0085BA FF                    3160 	.db #0xff	; 255
      0085BB FF                    3161 	.db #0xff	; 255
      0085BC FF                    3162 	.db #0xff	; 255
      0085BD FF                    3163 	.db #0xff	; 255
      0085BE FF                    3164 	.db #0xff	; 255
      0085BF FF                    3165 	.db #0xff	; 255
      0085C0 FF                    3166 	.db #0xff	; 255
      0085C1 FF                    3167 	.db #0xff	; 255
      0085C2 FF                    3168 	.db #0xff	; 255
      0085C3 FF                    3169 	.db #0xff	; 255
      0085C4 FF                    3170 	.db #0xff	; 255
      0085C5 FF                    3171 	.db #0xff	; 255
      0085C6 FF                    3172 	.db #0xff	; 255
      0085C7 FF                    3173 	.db #0xff	; 255
      0085C8 FF                    3174 	.db #0xff	; 255
      0085C9 FF                    3175 	.db #0xff	; 255
      0085CA FF                    3176 	.db #0xff	; 255
      0085CB FF                    3177 	.db #0xff	; 255
      0085CC FF                    3178 	.db #0xff	; 255
      0085CD FF                    3179 	.db #0xff	; 255
      0085CE FF                    3180 	.db #0xff	; 255
      0085CF FF                    3181 	.db #0xff	; 255
      0085D0 FF                    3182 	.db #0xff	; 255
      0085D1 FF                    3183 	.db #0xff	; 255
      0085D2 FF                    3184 	.db #0xff	; 255
      0085D3 FF                    3185 	.db #0xff	; 255
      0085D4 FF                    3186 	.db #0xff	; 255
      0085D5 FF                    3187 	.db #0xff	; 255
      0085D6 FF                    3188 	.db #0xff	; 255
      0085D7 FF                    3189 	.db #0xff	; 255
      0085D8 FF                    3190 	.db #0xff	; 255
      0085D9 FF                    3191 	.db #0xff	; 255
      0085DA FF                    3192 	.db #0xff	; 255
      0085DB FF                    3193 	.db #0xff	; 255
      0085DC FF                    3194 	.db #0xff	; 255
      0085DD FF                    3195 	.db #0xff	; 255
      0085DE FF                    3196 	.db #0xff	; 255
      0085DF FF                    3197 	.db #0xff	; 255
      0085E0 FF                    3198 	.db #0xff	; 255
      0085E1 FF                    3199 	.db #0xff	; 255
      0085E2 FF                    3200 	.db #0xff	; 255
      0085E3 FF                    3201 	.db #0xff	; 255
      0085E4 FF                    3202 	.db #0xff	; 255
      0085E5 FF                    3203 	.db #0xff	; 255
      0085E6 FF                    3204 	.db #0xff	; 255
      0085E7 FF                    3205 	.db #0xff	; 255
      0085E8 FF                    3206 	.db #0xff	; 255
      0085E9 FF                    3207 	.db #0xff	; 255
      0085EA FF                    3208 	.db #0xff	; 255
      0085EB FF                    3209 	.db #0xff	; 255
      0085EC FF                    3210 	.db #0xff	; 255
      0085ED FF                    3211 	.db #0xff	; 255
      0085EE FF                    3212 	.db #0xff	; 255
      0085EF FF                    3213 	.db #0xff	; 255
      0085F0 FF                    3214 	.db #0xff	; 255
      0085F1 FF                    3215 	.db #0xff	; 255
      0085F2 FF                    3216 	.db #0xff	; 255
      0085F3 FF                    3217 	.db #0xff	; 255
      0085F4 FF                    3218 	.db #0xff	; 255
      0085F5 FF                    3219 	.db #0xff	; 255
      0085F6 FF                    3220 	.db #0xff	; 255
      0085F7 FF                    3221 	.db #0xff	; 255
      0085F8 FF                    3222 	.db #0xff	; 255
      0085F9 FF                    3223 	.db #0xff	; 255
      0085FA FF                    3224 	.db #0xff	; 255
      0085FB FF                    3225 	.db #0xff	; 255
      0085FC FF                    3226 	.db #0xff	; 255
      0085FD FF                    3227 	.db #0xff	; 255
      0085FE FF                    3228 	.db #0xff	; 255
      0085FF FF                    3229 	.db #0xff	; 255
      008600 FF                    3230 	.db #0xff	; 255
      008601 FF                    3231 	.db #0xff	; 255
      008602 FF                    3232 	.db #0xff	; 255
      008603 FF                    3233 	.db #0xff	; 255
      008604 FF                    3234 	.db #0xff	; 255
      008605 FF                    3235 	.db #0xff	; 255
      008606 FF                    3236 	.db #0xff	; 255
      008607 FF                    3237 	.db #0xff	; 255
      008608 FF                    3238 	.db #0xff	; 255
      008609 FF                    3239 	.db #0xff	; 255
      00860A FF                    3240 	.db #0xff	; 255
      00860B FF                    3241 	.db #0xff	; 255
      00860C FF                    3242 	.db #0xff	; 255
      00860D FF                    3243 	.db #0xff	; 255
      00860E FF                    3244 	.db #0xff	; 255
      00860F FF                    3245 	.db #0xff	; 255
      008610 FF                    3246 	.db #0xff	; 255
      008611 FF                    3247 	.db #0xff	; 255
      008612 FF                    3248 	.db #0xff	; 255
      008613 FF                    3249 	.db #0xff	; 255
      008614 FF                    3250 	.db #0xff	; 255
      008615 FF                    3251 	.db #0xff	; 255
      008616 FF                    3252 	.db #0xff	; 255
      008617 FF                    3253 	.db #0xff	; 255
      008618 FF                    3254 	.db #0xff	; 255
      008619 FF                    3255 	.db #0xff	; 255
      00861A FF                    3256 	.db #0xff	; 255
      00861B FF                    3257 	.db #0xff	; 255
      00861C FF                    3258 	.db #0xff	; 255
      00861D FF                    3259 	.db #0xff	; 255
      00861E FF                    3260 	.db #0xff	; 255
      00861F FF                    3261 	.db #0xff	; 255
      008620 FF                    3262 	.db #0xff	; 255
      008621 FF                    3263 	.db #0xff	; 255
      008622 FF                    3264 	.db #0xff	; 255
      008623 FF                    3265 	.db #0xff	; 255
      008624 FF                    3266 	.db #0xff	; 255
      008625 FF                    3267 	.db #0xff	; 255
      008626 FF                    3268 	.db #0xff	; 255
      008627 FF                    3269 	.db #0xff	; 255
      008628 FF                    3270 	.db #0xff	; 255
      008629 FF                    3271 	.db #0xff	; 255
      00862A FF                    3272 	.db #0xff	; 255
      00862B FF                    3273 	.db #0xff	; 255
      00862C FF                    3274 	.db #0xff	; 255
      00862D FF                    3275 	.db #0xff	; 255
      00862E FF                    3276 	.db #0xff	; 255
      00862F FF                    3277 	.db #0xff	; 255
      008630 FF                    3278 	.db #0xff	; 255
      008631 FF                    3279 	.db #0xff	; 255
      008632 FF                    3280 	.db #0xff	; 255
      008633 FF                    3281 	.db #0xff	; 255
      008634 FF                    3282 	.db #0xff	; 255
      008635 FF                    3283 	.db #0xff	; 255
      008636 FF                    3284 	.db #0xff	; 255
      008637 FF                    3285 	.db #0xff	; 255
      008638 FF                    3286 	.db #0xff	; 255
      008639 FF                    3287 	.db #0xff	; 255
      00863A FF                    3288 	.db #0xff	; 255
      00863B FF                    3289 	.db #0xff	; 255
      00863C FF                    3290 	.db #0xff	; 255
      00863D FF                    3291 	.db #0xff	; 255
      00863E FF                    3292 	.db #0xff	; 255
      00863F FF                    3293 	.db #0xff	; 255
      008640 FF                    3294 	.db #0xff	; 255
      008641 FF                    3295 	.db #0xff	; 255
      008642 FF                    3296 	.db #0xff	; 255
      008643 FF                    3297 	.db #0xff	; 255
      008644 FF                    3298 	.db #0xff	; 255
      008645                       3299 _mixigamingLogo:
      008645 00                    3300 	.db #0x00	; 0
      008646 00                    3301 	.db #0x00	; 0
      008647 00                    3302 	.db #0x00	; 0
      008648 00                    3303 	.db #0x00	; 0
      008649 00                    3304 	.db #0x00	; 0
      00864A 00                    3305 	.db #0x00	; 0
      00864B 00                    3306 	.db #0x00	; 0
      00864C 00                    3307 	.db #0x00	; 0
      00864D 00                    3308 	.db #0x00	; 0
      00864E 00                    3309 	.db #0x00	; 0
      00864F 00                    3310 	.db #0x00	; 0
      008650 00                    3311 	.db #0x00	; 0
      008651 00                    3312 	.db #0x00	; 0
      008652 00                    3313 	.db #0x00	; 0
      008653 80                    3314 	.db #0x80	; 128
      008654 40                    3315 	.db #0x40	; 64
      008655 80                    3316 	.db #0x80	; 128
      008656 C0                    3317 	.db #0xc0	; 192
      008657 E0                    3318 	.db #0xe0	; 224
      008658 E0                    3319 	.db #0xe0	; 224
      008659 D0                    3320 	.db #0xd0	; 208
      00865A C8                    3321 	.db #0xc8	; 200
      00865B E0                    3322 	.db #0xe0	; 224
      00865C E0                    3323 	.db #0xe0	; 224
      00865D F0                    3324 	.db #0xf0	; 240
      00865E C0                    3325 	.db #0xc0	; 192
      00865F C0                    3326 	.db #0xc0	; 192
      008660 F8                    3327 	.db #0xf8	; 248
      008661 F0                    3328 	.db #0xf0	; 240
      008662 F8                    3329 	.db #0xf8	; 248
      008663 FC                    3330 	.db #0xfc	; 252
      008664 F8                    3331 	.db #0xf8	; 248
      008665 FC                    3332 	.db #0xfc	; 252
      008666 FE                    3333 	.db #0xfe	; 254
      008667 FE                    3334 	.db #0xfe	; 254
      008668 FA                    3335 	.db #0xfa	; 250
      008669 FC                    3336 	.db #0xfc	; 252
      00866A F8                    3337 	.db #0xf8	; 248
      00866B E4                    3338 	.db #0xe4	; 228
      00866C F8                    3339 	.db #0xf8	; 248
      00866D E0                    3340 	.db #0xe0	; 224
      00866E E0                    3341 	.db #0xe0	; 224
      00866F C0                    3342 	.db #0xc0	; 192
      008670 F0                    3343 	.db #0xf0	; 240
      008671 C0                    3344 	.db #0xc0	; 192
      008672 80                    3345 	.db #0x80	; 128
      008673 20                    3346 	.db #0x20	; 32
      008674 80                    3347 	.db #0x80	; 128
      008675 80                    3348 	.db #0x80	; 128
      008676 C0                    3349 	.db #0xc0	; 192
      008677 00                    3350 	.db #0x00	; 0
      008678 00                    3351 	.db #0x00	; 0
      008679 00                    3352 	.db #0x00	; 0
      00867A 00                    3353 	.db #0x00	; 0
      00867B 00                    3354 	.db #0x00	; 0
      00867C 00                    3355 	.db #0x00	; 0
      00867D 00                    3356 	.db #0x00	; 0
      00867E 00                    3357 	.db #0x00	; 0
      00867F 00                    3358 	.db #0x00	; 0
      008680 00                    3359 	.db #0x00	; 0
      008681 00                    3360 	.db #0x00	; 0
      008682 00                    3361 	.db #0x00	; 0
      008683 00                    3362 	.db #0x00	; 0
      008684 00                    3363 	.db #0x00	; 0
      008685 00                    3364 	.db #0x00	; 0
      008686 00                    3365 	.db #0x00	; 0
      008687 00                    3366 	.db #0x00	; 0
      008688 00                    3367 	.db #0x00	; 0
      008689 00                    3368 	.db #0x00	; 0
      00868A 00                    3369 	.db #0x00	; 0
      00868B 00                    3370 	.db #0x00	; 0
      00868C 80                    3371 	.db #0x80	; 128
      00868D 80                    3372 	.db #0x80	; 128
      00868E F0                    3373 	.db #0xf0	; 240
      00868F FC                    3374 	.db #0xfc	; 252
      008690 F8                    3375 	.db #0xf8	; 248
      008691 FC                    3376 	.db #0xfc	; 252
      008692 FE                    3377 	.db #0xfe	; 254
      008693 FF                    3378 	.db #0xff	; 255
      008694 FF                    3379 	.db #0xff	; 255
      008695 FF                    3380 	.db #0xff	; 255
      008696 FF                    3381 	.db #0xff	; 255
      008697 FF                    3382 	.db #0xff	; 255
      008698 FF                    3383 	.db #0xff	; 255
      008699 FF                    3384 	.db #0xff	; 255
      00869A FF                    3385 	.db #0xff	; 255
      00869B FF                    3386 	.db #0xff	; 255
      00869C FF                    3387 	.db #0xff	; 255
      00869D FF                    3388 	.db #0xff	; 255
      00869E FF                    3389 	.db #0xff	; 255
      00869F FF                    3390 	.db #0xff	; 255
      0086A0 FF                    3391 	.db #0xff	; 255
      0086A1 FF                    3392 	.db #0xff	; 255
      0086A2 FF                    3393 	.db #0xff	; 255
      0086A3 FF                    3394 	.db #0xff	; 255
      0086A4 FF                    3395 	.db #0xff	; 255
      0086A5 FF                    3396 	.db #0xff	; 255
      0086A6 FF                    3397 	.db #0xff	; 255
      0086A7 FF                    3398 	.db #0xff	; 255
      0086A8 FF                    3399 	.db #0xff	; 255
      0086A9 FF                    3400 	.db #0xff	; 255
      0086AA FF                    3401 	.db #0xff	; 255
      0086AB FF                    3402 	.db #0xff	; 255
      0086AC FF                    3403 	.db #0xff	; 255
      0086AD FF                    3404 	.db #0xff	; 255
      0086AE FF                    3405 	.db #0xff	; 255
      0086AF FF                    3406 	.db #0xff	; 255
      0086B0 FF                    3407 	.db #0xff	; 255
      0086B1 FF                    3408 	.db #0xff	; 255
      0086B2 FF                    3409 	.db #0xff	; 255
      0086B3 FF                    3410 	.db #0xff	; 255
      0086B4 FF                    3411 	.db #0xff	; 255
      0086B5 FF                    3412 	.db #0xff	; 255
      0086B6 FF                    3413 	.db #0xff	; 255
      0086B7 FE                    3414 	.db #0xfe	; 254
      0086B8 FF                    3415 	.db #0xff	; 255
      0086B9 FC                    3416 	.db #0xfc	; 252
      0086BA F0                    3417 	.db #0xf0	; 240
      0086BB F8                    3418 	.db #0xf8	; 248
      0086BC F0                    3419 	.db #0xf0	; 240
      0086BD 00                    3420 	.db #0x00	; 0
      0086BE 00                    3421 	.db #0x00	; 0
      0086BF 00                    3422 	.db #0x00	; 0
      0086C0 00                    3423 	.db #0x00	; 0
      0086C1 00                    3424 	.db #0x00	; 0
      0086C2 00                    3425 	.db #0x00	; 0
      0086C3 00                    3426 	.db #0x00	; 0
      0086C4 00                    3427 	.db #0x00	; 0
      0086C5 00                    3428 	.db #0x00	; 0
      0086C6 00                    3429 	.db #0x00	; 0
      0086C7 00                    3430 	.db #0x00	; 0
      0086C8 00                    3431 	.db #0x00	; 0
      0086C9 00                    3432 	.db #0x00	; 0
      0086CA F0                    3433 	.db #0xf0	; 240
      0086CB F8                    3434 	.db #0xf8	; 248
      0086CC FF                    3435 	.db #0xff	; 255
      0086CD FF                    3436 	.db #0xff	; 255
      0086CE FF                    3437 	.db #0xff	; 255
      0086CF FF                    3438 	.db #0xff	; 255
      0086D0 FF                    3439 	.db #0xff	; 255
      0086D1 FF                    3440 	.db #0xff	; 255
      0086D2 FF                    3441 	.db #0xff	; 255
      0086D3 FF                    3442 	.db #0xff	; 255
      0086D4 FF                    3443 	.db #0xff	; 255
      0086D5 FF                    3444 	.db #0xff	; 255
      0086D6 FF                    3445 	.db #0xff	; 255
      0086D7 FF                    3446 	.db #0xff	; 255
      0086D8 FF                    3447 	.db #0xff	; 255
      0086D9 FF                    3448 	.db #0xff	; 255
      0086DA FF                    3449 	.db #0xff	; 255
      0086DB FF                    3450 	.db #0xff	; 255
      0086DC FF                    3451 	.db #0xff	; 255
      0086DD FF                    3452 	.db #0xff	; 255
      0086DE FF                    3453 	.db #0xff	; 255
      0086DF FF                    3454 	.db #0xff	; 255
      0086E0 FF                    3455 	.db #0xff	; 255
      0086E1 FF                    3456 	.db #0xff	; 255
      0086E2 FF                    3457 	.db #0xff	; 255
      0086E3 FF                    3458 	.db #0xff	; 255
      0086E4 FF                    3459 	.db #0xff	; 255
      0086E5 FF                    3460 	.db #0xff	; 255
      0086E6 FF                    3461 	.db #0xff	; 255
      0086E7 FF                    3462 	.db #0xff	; 255
      0086E8 FF                    3463 	.db #0xff	; 255
      0086E9 FF                    3464 	.db #0xff	; 255
      0086EA FF                    3465 	.db #0xff	; 255
      0086EB FF                    3466 	.db #0xff	; 255
      0086EC FF                    3467 	.db #0xff	; 255
      0086ED FF                    3468 	.db #0xff	; 255
      0086EE FF                    3469 	.db #0xff	; 255
      0086EF FF                    3470 	.db #0xff	; 255
      0086F0 FF                    3471 	.db #0xff	; 255
      0086F1 FF                    3472 	.db #0xff	; 255
      0086F2 FF                    3473 	.db #0xff	; 255
      0086F3 FF                    3474 	.db #0xff	; 255
      0086F4 FF                    3475 	.db #0xff	; 255
      0086F5 FF                    3476 	.db #0xff	; 255
      0086F6 FF                    3477 	.db #0xff	; 255
      0086F7 FF                    3478 	.db #0xff	; 255
      0086F8 FF                    3479 	.db #0xff	; 255
      0086F9 FF                    3480 	.db #0xff	; 255
      0086FA FF                    3481 	.db #0xff	; 255
      0086FB FF                    3482 	.db #0xff	; 255
      0086FC FF                    3483 	.db #0xff	; 255
      0086FD FF                    3484 	.db #0xff	; 255
      0086FE FF                    3485 	.db #0xff	; 255
      0086FF 60                    3486 	.db #0x60	; 96
      008700 00                    3487 	.db #0x00	; 0
      008701 00                    3488 	.db #0x00	; 0
      008702 00                    3489 	.db #0x00	; 0
      008703 00                    3490 	.db #0x00	; 0
      008704 00                    3491 	.db #0x00	; 0
      008705 00                    3492 	.db #0x00	; 0
      008706 00                    3493 	.db #0x00	; 0
      008707 00                    3494 	.db #0x00	; 0
      008708 80                    3495 	.db #0x80	; 128
      008709 E7                    3496 	.db #0xe7	; 231
      00870A 7F                    3497 	.db #0x7f	; 127
      00870B FF                    3498 	.db #0xff	; 255
      00870C FF                    3499 	.db #0xff	; 255
      00870D FF                    3500 	.db #0xff	; 255
      00870E FF                    3501 	.db #0xff	; 255
      00870F FF                    3502 	.db #0xff	; 255
      008710 3F                    3503 	.db #0x3f	; 63
      008711 1F                    3504 	.db #0x1f	; 31
      008712 07                    3505 	.db #0x07	; 7
      008713 03                    3506 	.db #0x03	; 3
      008714 01                    3507 	.db #0x01	; 1
      008715 00                    3508 	.db #0x00	; 0
      008716 00                    3509 	.db #0x00	; 0
      008717 00                    3510 	.db #0x00	; 0
      008718 01                    3511 	.db #0x01	; 1
      008719 01                    3512 	.db #0x01	; 1
      00871A 83                    3513 	.db #0x83	; 131
      00871B C3                    3514 	.db #0xc3	; 195
      00871C 63                    3515 	.db #0x63	; 99	'c'
      00871D 33                    3516 	.db #0x33	; 51	'3'
      00871E 37                    3517 	.db #0x37	; 55	'7'
      00871F 17                    3518 	.db #0x17	; 23
      008720 97                    3519 	.db #0x97	; 151
      008721 F7                    3520 	.db #0xf7	; 247
      008722 F3                    3521 	.db #0xf3	; 243
      008723 E3                    3522 	.db #0xe3	; 227
      008724 E3                    3523 	.db #0xe3	; 227
      008725 C3                    3524 	.db #0xc3	; 195
      008726 83                    3525 	.db #0x83	; 131
      008727 C3                    3526 	.db #0xc3	; 195
      008728 63                    3527 	.db #0x63	; 99	'c'
      008729 33                    3528 	.db #0x33	; 51	'3'
      00872A 1B                    3529 	.db #0x1b	; 27
      00872B 09                    3530 	.db #0x09	; 9
      00872C ED                    3531 	.db #0xed	; 237
      00872D FD                    3532 	.db #0xfd	; 253
      00872E FD                    3533 	.db #0xfd	; 253
      00872F F9                    3534 	.db #0xf9	; 249
      008730 F9                    3535 	.db #0xf9	; 249
      008731 19                    3536 	.db #0x19	; 25
      008732 71                    3537 	.db #0x71	; 113	'q'
      008733 E1                    3538 	.db #0xe1	; 225
      008734 01                    3539 	.db #0x01	; 1
      008735 01                    3540 	.db #0x01	; 1
      008736 01                    3541 	.db #0x01	; 1
      008737 03                    3542 	.db #0x03	; 3
      008738 03                    3543 	.db #0x03	; 3
      008739 07                    3544 	.db #0x07	; 7
      00873A 0F                    3545 	.db #0x0f	; 15
      00873B 3F                    3546 	.db #0x3f	; 63
      00873C 7F                    3547 	.db #0x7f	; 127
      00873D FF                    3548 	.db #0xff	; 255
      00873E FF                    3549 	.db #0xff	; 255
      00873F 6E                    3550 	.db #0x6e	; 110	'n'
      008740 9C                    3551 	.db #0x9c	; 156
      008741 F8                    3552 	.db #0xf8	; 248
      008742 00                    3553 	.db #0x00	; 0
      008743 00                    3554 	.db #0x00	; 0
      008744 00                    3555 	.db #0x00	; 0
      008745 00                    3556 	.db #0x00	; 0
      008746 00                    3557 	.db #0x00	; 0
      008747 00                    3558 	.db #0x00	; 0
      008748 03                    3559 	.db #0x03	; 3
      008749 0F                    3560 	.db #0x0f	; 15
      00874A 08                    3561 	.db #0x08	; 8
      00874B 1B                    3562 	.db #0x1b	; 27
      00874C FF                    3563 	.db #0xff	; 255
      00874D 7F                    3564 	.db #0x7f	; 127
      00874E 03                    3565 	.db #0x03	; 3
      00874F 00                    3566 	.db #0x00	; 0
      008750 00                    3567 	.db #0x00	; 0
      008751 00                    3568 	.db #0x00	; 0
      008752 00                    3569 	.db #0x00	; 0
      008753 00                    3570 	.db #0x00	; 0
      008754 00                    3571 	.db #0x00	; 0
      008755 00                    3572 	.db #0x00	; 0
      008756 00                    3573 	.db #0x00	; 0
      008757 00                    3574 	.db #0x00	; 0
      008758 00                    3575 	.db #0x00	; 0
      008759 00                    3576 	.db #0x00	; 0
      00875A 1F                    3577 	.db #0x1f	; 31
      00875B 39                    3578 	.db #0x39	; 57	'9'
      00875C 60                    3579 	.db #0x60	; 96
      00875D 60                    3580 	.db #0x60	; 96
      00875E C0                    3581 	.db #0xc0	; 192
      00875F C0                    3582 	.db #0xc0	; 192
      008760 C3                    3583 	.db #0xc3	; 195
      008761 C7                    3584 	.db #0xc7	; 199
      008762 4F                    3585 	.db #0x4f	; 79	'O'
      008763 67                    3586 	.db #0x67	; 103	'g'
      008764 33                    3587 	.db #0x33	; 51	'3'
      008765 3F                    3588 	.db #0x3f	; 63
      008766 7F                    3589 	.db #0x7f	; 127
      008767 C1                    3590 	.db #0xc1	; 193
      008768 80                    3591 	.db #0x80	; 128
      008769 80                    3592 	.db #0x80	; 128
      00876A 80                    3593 	.db #0x80	; 128
      00876B 80                    3594 	.db #0x80	; 128
      00876C 81                    3595 	.db #0x81	; 129
      00876D 81                    3596 	.db #0x81	; 129
      00876E 83                    3597 	.db #0x83	; 131
      00876F C3                    3598 	.db #0xc3	; 195
      008770 C1                    3599 	.db #0xc1	; 193
      008771 60                    3600 	.db #0x60	; 96
      008772 38                    3601 	.db #0x38	; 56	'8'
      008773 0F                    3602 	.db #0x0f	; 15
      008774 01                    3603 	.db #0x01	; 1
      008775 00                    3604 	.db #0x00	; 0
      008776 00                    3605 	.db #0x00	; 0
      008777 00                    3606 	.db #0x00	; 0
      008778 00                    3607 	.db #0x00	; 0
      008779 00                    3608 	.db #0x00	; 0
      00877A 00                    3609 	.db #0x00	; 0
      00877B 00                    3610 	.db #0x00	; 0
      00877C 00                    3611 	.db #0x00	; 0
      00877D 01                    3612 	.db #0x01	; 1
      00877E 07                    3613 	.db #0x07	; 7
      00877F 3F                    3614 	.db #0x3f	; 63
      008780 F1                    3615 	.db #0xf1	; 241
      008781 00                    3616 	.db #0x00	; 0
      008782 00                    3617 	.db #0x00	; 0
      008783 00                    3618 	.db #0x00	; 0
      008784 00                    3619 	.db #0x00	; 0
      008785 00                    3620 	.db #0x00	; 0
      008786 00                    3621 	.db #0x00	; 0
      008787 00                    3622 	.db #0x00	; 0
      008788 00                    3623 	.db #0x00	; 0
      008789 00                    3624 	.db #0x00	; 0
      00878A 00                    3625 	.db #0x00	; 0
      00878B 00                    3626 	.db #0x00	; 0
      00878C 3F                    3627 	.db #0x3f	; 63
      00878D F8                    3628 	.db #0xf8	; 248
      00878E 80                    3629 	.db #0x80	; 128
      00878F 00                    3630 	.db #0x00	; 0
      008790 00                    3631 	.db #0x00	; 0
      008791 00                    3632 	.db #0x00	; 0
      008792 00                    3633 	.db #0x00	; 0
      008793 00                    3634 	.db #0x00	; 0
      008794 00                    3635 	.db #0x00	; 0
      008795 00                    3636 	.db #0x00	; 0
      008796 00                    3637 	.db #0x00	; 0
      008797 00                    3638 	.db #0x00	; 0
      008798 00                    3639 	.db #0x00	; 0
      008799 00                    3640 	.db #0x00	; 0
      00879A 00                    3641 	.db #0x00	; 0
      00879B 00                    3642 	.db #0x00	; 0
      00879C 00                    3643 	.db #0x00	; 0
      00879D 00                    3644 	.db #0x00	; 0
      00879E 00                    3645 	.db #0x00	; 0
      00879F 00                    3646 	.db #0x00	; 0
      0087A0 00                    3647 	.db #0x00	; 0
      0087A1 00                    3648 	.db #0x00	; 0
      0087A2 00                    3649 	.db #0x00	; 0
      0087A3 00                    3650 	.db #0x00	; 0
      0087A4 00                    3651 	.db #0x00	; 0
      0087A5 00                    3652 	.db #0x00	; 0
      0087A6 00                    3653 	.db #0x00	; 0
      0087A7 00                    3654 	.db #0x00	; 0
      0087A8 00                    3655 	.db #0x00	; 0
      0087A9 01                    3656 	.db #0x01	; 1
      0087AA 01                    3657 	.db #0x01	; 1
      0087AB 01                    3658 	.db #0x01	; 1
      0087AC 01                    3659 	.db #0x01	; 1
      0087AD 01                    3660 	.db #0x01	; 1
      0087AE 01                    3661 	.db #0x01	; 1
      0087AF 00                    3662 	.db #0x00	; 0
      0087B0 00                    3663 	.db #0x00	; 0
      0087B1 00                    3664 	.db #0x00	; 0
      0087B2 00                    3665 	.db #0x00	; 0
      0087B3 00                    3666 	.db #0x00	; 0
      0087B4 00                    3667 	.db #0x00	; 0
      0087B5 00                    3668 	.db #0x00	; 0
      0087B6 00                    3669 	.db #0x00	; 0
      0087B7 00                    3670 	.db #0x00	; 0
      0087B8 00                    3671 	.db #0x00	; 0
      0087B9 00                    3672 	.db #0x00	; 0
      0087BA 00                    3673 	.db #0x00	; 0
      0087BB 00                    3674 	.db #0x00	; 0
      0087BC 00                    3675 	.db #0x00	; 0
      0087BD 00                    3676 	.db #0x00	; 0
      0087BE 80                    3677 	.db #0x80	; 128
      0087BF F0                    3678 	.db #0xf0	; 240
      0087C0 7F                    3679 	.db #0x7f	; 127
      0087C1 00                    3680 	.db #0x00	; 0
      0087C2 00                    3681 	.db #0x00	; 0
      0087C3 00                    3682 	.db #0x00	; 0
      0087C4 00                    3683 	.db #0x00	; 0
      0087C5 00                    3684 	.db #0x00	; 0
      0087C6 00                    3685 	.db #0x00	; 0
      0087C7 00                    3686 	.db #0x00	; 0
      0087C8 00                    3687 	.db #0x00	; 0
      0087C9 00                    3688 	.db #0x00	; 0
      0087CA 00                    3689 	.db #0x00	; 0
      0087CB 00                    3690 	.db #0x00	; 0
      0087CC 00                    3691 	.db #0x00	; 0
      0087CD 01                    3692 	.db #0x01	; 1
      0087CE 07                    3693 	.db #0x07	; 7
      0087CF 1C                    3694 	.db #0x1c	; 28
      0087D0 70                    3695 	.db #0x70	; 112	'p'
      0087D1 E0                    3696 	.db #0xe0	; 224
      0087D2 80                    3697 	.db #0x80	; 128
      0087D3 00                    3698 	.db #0x00	; 0
      0087D4 00                    3699 	.db #0x00	; 0
      0087D5 00                    3700 	.db #0x00	; 0
      0087D6 00                    3701 	.db #0x00	; 0
      0087D7 00                    3702 	.db #0x00	; 0
      0087D8 00                    3703 	.db #0x00	; 0
      0087D9 03                    3704 	.db #0x03	; 3
      0087DA 0C                    3705 	.db #0x0c	; 12
      0087DB 18                    3706 	.db #0x18	; 24
      0087DC 30                    3707 	.db #0x30	; 48	'0'
      0087DD 60                    3708 	.db #0x60	; 96
      0087DE C0                    3709 	.db #0xc0	; 192
      0087DF 80                    3710 	.db #0x80	; 128
      0087E0 80                    3711 	.db #0x80	; 128
      0087E1 00                    3712 	.db #0x00	; 0
      0087E2 00                    3713 	.db #0x00	; 0
      0087E3 00                    3714 	.db #0x00	; 0
      0087E4 00                    3715 	.db #0x00	; 0
      0087E5 00                    3716 	.db #0x00	; 0
      0087E6 00                    3717 	.db #0x00	; 0
      0087E7 00                    3718 	.db #0x00	; 0
      0087E8 00                    3719 	.db #0x00	; 0
      0087E9 00                    3720 	.db #0x00	; 0
      0087EA 00                    3721 	.db #0x00	; 0
      0087EB 00                    3722 	.db #0x00	; 0
      0087EC 00                    3723 	.db #0x00	; 0
      0087ED 00                    3724 	.db #0x00	; 0
      0087EE 00                    3725 	.db #0x00	; 0
      0087EF 80                    3726 	.db #0x80	; 128
      0087F0 C0                    3727 	.db #0xc0	; 192
      0087F1 60                    3728 	.db #0x60	; 96
      0087F2 30                    3729 	.db #0x30	; 48	'0'
      0087F3 0C                    3730 	.db #0x0c	; 12
      0087F4 00                    3731 	.db #0x00	; 0
      0087F5 00                    3732 	.db #0x00	; 0
      0087F6 00                    3733 	.db #0x00	; 0
      0087F7 00                    3734 	.db #0x00	; 0
      0087F8 80                    3735 	.db #0x80	; 128
      0087F9 C3                    3736 	.db #0xc3	; 195
      0087FA E0                    3737 	.db #0xe0	; 224
      0087FB 70                    3738 	.db #0x70	; 112	'p'
      0087FC 38                    3739 	.db #0x38	; 56	'8'
      0087FD 0E                    3740 	.db #0x0e	; 14
      0087FE 07                    3741 	.db #0x07	; 7
      0087FF 01                    3742 	.db #0x01	; 1
      008800 00                    3743 	.db #0x00	; 0
      008801 00                    3744 	.db #0x00	; 0
      008802 00                    3745 	.db #0x00	; 0
      008803 00                    3746 	.db #0x00	; 0
      008804 00                    3747 	.db #0x00	; 0
      008805 00                    3748 	.db #0x00	; 0
      008806 00                    3749 	.db #0x00	; 0
      008807 00                    3750 	.db #0x00	; 0
      008808 00                    3751 	.db #0x00	; 0
      008809 00                    3752 	.db #0x00	; 0
      00880A 00                    3753 	.db #0x00	; 0
      00880B 00                    3754 	.db #0x00	; 0
      00880C 00                    3755 	.db #0x00	; 0
      00880D 00                    3756 	.db #0x00	; 0
      00880E 00                    3757 	.db #0x00	; 0
      00880F 00                    3758 	.db #0x00	; 0
      008810 00                    3759 	.db #0x00	; 0
      008811 00                    3760 	.db #0x00	; 0
      008812 01                    3761 	.db #0x01	; 1
      008813 03                    3762 	.db #0x03	; 3
      008814 07                    3763 	.db #0x07	; 7
      008815 06                    3764 	.db #0x06	; 6
      008816 0C                    3765 	.db #0x0c	; 12
      008817 08                    3766 	.db #0x08	; 8
      008818 18                    3767 	.db #0x18	; 24
      008819 10                    3768 	.db #0x10	; 16
      00881A 30                    3769 	.db #0x30	; 48	'0'
      00881B 30                    3770 	.db #0x30	; 48	'0'
      00881C 20                    3771 	.db #0x20	; 32
      00881D 60                    3772 	.db #0x60	; 96
      00881E 60                    3773 	.db #0x60	; 96
      00881F 40                    3774 	.db #0x40	; 64
      008820 41                    3775 	.db #0x41	; 65	'A'
      008821 41                    3776 	.db #0x41	; 65	'A'
      008822 41                    3777 	.db #0x41	; 65	'A'
      008823 43                    3778 	.db #0x43	; 67	'C'
      008824 42                    3779 	.db #0x42	; 66	'B'
      008825 42                    3780 	.db #0x42	; 66	'B'
      008826 42                    3781 	.db #0x42	; 66	'B'
      008827 42                    3782 	.db #0x42	; 66	'B'
      008828 42                    3783 	.db #0x42	; 66	'B'
      008829 42                    3784 	.db #0x42	; 66	'B'
      00882A 62                    3785 	.db #0x62	; 98	'b'
      00882B 62                    3786 	.db #0x62	; 98	'b'
      00882C 63                    3787 	.db #0x63	; 99	'c'
      00882D 21                    3788 	.db #0x21	; 33
      00882E 21                    3789 	.db #0x21	; 33
      00882F 30                    3790 	.db #0x30	; 48	'0'
      008830 10                    3791 	.db #0x10	; 16
      008831 18                    3792 	.db #0x18	; 24
      008832 18                    3793 	.db #0x18	; 24
      008833 08                    3794 	.db #0x08	; 8
      008834 0C                    3795 	.db #0x0c	; 12
      008835 06                    3796 	.db #0x06	; 6
      008836 06                    3797 	.db #0x06	; 6
      008837 03                    3798 	.db #0x03	; 3
      008838 01                    3799 	.db #0x01	; 1
      008839 00                    3800 	.db #0x00	; 0
      00883A 00                    3801 	.db #0x00	; 0
      00883B 00                    3802 	.db #0x00	; 0
      00883C 00                    3803 	.db #0x00	; 0
      00883D 00                    3804 	.db #0x00	; 0
      00883E 00                    3805 	.db #0x00	; 0
      00883F 00                    3806 	.db #0x00	; 0
      008840 00                    3807 	.db #0x00	; 0
      008841 00                    3808 	.db #0x00	; 0
      008842 00                    3809 	.db #0x00	; 0
      008843 00                    3810 	.db #0x00	; 0
      008844 00                    3811 	.db #0x00	; 0
      008845                       3812 _levelBAT_full:
      008845 FF                    3813 	.db #0xff	; 255
      008846 81                    3814 	.db #0x81	; 129
      008847 BD                    3815 	.db #0xbd	; 189
      008848 BD                    3816 	.db #0xbd	; 189
      008849 BD                    3817 	.db #0xbd	; 189
      00884A 81                    3818 	.db #0x81	; 129
      00884B BD                    3819 	.db #0xbd	; 189
      00884C BD                    3820 	.db #0xbd	; 189
      00884D BD                    3821 	.db #0xbd	; 189
      00884E 81                    3822 	.db #0x81	; 129
      00884F BD                    3823 	.db #0xbd	; 189
      008850 BD                    3824 	.db #0xbd	; 189
      008851 BD                    3825 	.db #0xbd	; 189
      008852 81                    3826 	.db #0x81	; 129
      008853 FF                    3827 	.db #0xff	; 255
      008854 18                    3828 	.db #0x18	; 24
      008855                       3829 _levelBAT_Tb:
      008855 FF                    3830 	.db #0xff	; 255
      008856 81                    3831 	.db #0x81	; 129
      008857 BD                    3832 	.db #0xbd	; 189
      008858 BD                    3833 	.db #0xbd	; 189
      008859 BD                    3834 	.db #0xbd	; 189
      00885A 81                    3835 	.db #0x81	; 129
      00885B BD                    3836 	.db #0xbd	; 189
      00885C BD                    3837 	.db #0xbd	; 189
      00885D BD                    3838 	.db #0xbd	; 189
      00885E 81                    3839 	.db #0x81	; 129
      00885F 81                    3840 	.db #0x81	; 129
      008860 81                    3841 	.db #0x81	; 129
      008861 81                    3842 	.db #0x81	; 129
      008862 81                    3843 	.db #0x81	; 129
      008863 FF                    3844 	.db #0xff	; 255
      008864 18                    3845 	.db #0x18	; 24
      008865                       3846 _rssi:
      008865 C0                    3847 	.db #0xc0	; 192
      008866 00                    3848 	.db #0x00	; 0
      008867 E0                    3849 	.db #0xe0	; 224
      008868 E0                    3850 	.db #0xe0	; 224
      008869 00                    3851 	.db #0x00	; 0
      00886A F0                    3852 	.db #0xf0	; 240
      00886B F0                    3853 	.db #0xf0	; 240
      00886C 00                    3854 	.db #0x00	; 0
      00886D F8                    3855 	.db #0xf8	; 248
      00886E F8                    3856 	.db #0xf8	; 248
      00886F 00                    3857 	.db #0x00	; 0
      008870 FC                    3858 	.db #0xfc	; 252
      008871 FC                    3859 	.db #0xfc	; 252
      008872 00                    3860 	.db #0x00	; 0
      008873 FE                    3861 	.db #0xfe	; 254
      008874 FE                    3862 	.db #0xfe	; 254
      008875                       3863 _station_icon:
      008875 FE                    3864 	.db #0xfe	; 254
      008876 82                    3865 	.db #0x82	; 130
      008877 BA                    3866 	.db #0xba	; 186
      008878 82                    3867 	.db #0x82	; 130
      008879 BA                    3868 	.db #0xba	; 186
      00887A 82                    3869 	.db #0x82	; 130
      00887B BA                    3870 	.db #0xba	; 186
      00887C 82                    3871 	.db #0x82	; 130
      00887D BA                    3872 	.db #0xba	; 186
      00887E AA                    3873 	.db #0xaa	; 170
      00887F AA                    3874 	.db #0xaa	; 170
      008880 AA                    3875 	.db #0xaa	; 170
      008881 AA                    3876 	.db #0xaa	; 170
      008882 BA                    3877 	.db #0xba	; 186
      008883 82                    3878 	.db #0x82	; 130
      008884 FE                    3879 	.db #0xfe	; 254
      008885                       3880 _clock_icon:
      008885 00                    3881 	.db #0x00	; 0
      008886 00                    3882 	.db #0x00	; 0
      008887 00                    3883 	.db #0x00	; 0
      008888 38                    3884 	.db #0x38	; 56	'8'
      008889 44                    3885 	.db #0x44	; 68	'D'
      00888A 82                    3886 	.db #0x82	; 130
      00888B 82                    3887 	.db #0x82	; 130
      00888C 9A                    3888 	.db #0x9a	; 154
      00888D 92                    3889 	.db #0x92	; 146
      00888E 92                    3890 	.db #0x92	; 146
      00888F 44                    3891 	.db #0x44	; 68	'D'
      008890 38                    3892 	.db #0x38	; 56	'8'
      008891 00                    3893 	.db #0x00	; 0
      008892 00                    3894 	.db #0x00	; 0
      008893 00                    3895 	.db #0x00	; 0
      008894 00                    3896 	.db #0x00	; 0
                                   3897 	.area INITIALIZER
                                   3898 	.area CABS (ABS)
