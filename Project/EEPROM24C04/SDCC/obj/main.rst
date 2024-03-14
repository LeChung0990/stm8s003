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
                                     11 	.globl _OLED_FONT
                                     12 	.globl _OLED_INIT_CMD
                                     13 	.globl _main
                                     14 	.globl _sqrtf
                                     15 	.globl _uart1_number
                                     16 	.globl _uart_init
                                     17 	.globl _I2C_write
                                     18 	.globl _I2C_address
                                     19 	.globl _I2C_stop
                                     20 	.globl _I2C_start
                                     21 	.globl _I2C_init
                                     22 	.globl _Timer4DelayMs
                                     23 	.globl _Timer4Config
                                     24 	.globl _Mode
                                     25 	.globl _Threshold
                                     26 	.globl _Steps
                                     27 	.globl _SumValue
                                     28 	.globl _LastSteps
                                     29 	.globl _Distance
                                     30 	.globl _Value
                                     31 	.globl _LastValue
                                     32 	.globl _CurrentValue
                                     33 	.globl _AccZMSB
                                     34 	.globl _AccZLSB
                                     35 	.globl _AccYMSB
                                     36 	.globl _AccYLSB
                                     37 	.globl _AccXMSB
                                     38 	.globl _AccXLSB
                                     39 	.globl _AccZ
                                     40 	.globl _AccY
                                     41 	.globl _AccX
                                     42 	.globl _OLED_init
                                     43 	.globl _OLED_printP
                                     44 	.globl _OLED_printNum
                                     45 	.globl _OLED_printOneNumber
                                     46 	.globl _OLED_cursor
                                     47 	.globl _OLED_clear
                                     48 	.globl _initMPU6050
                                     49 	.globl _getMPU6050
                                     50 ;--------------------------------------------------------
                                     51 ; ram data
                                     52 ;--------------------------------------------------------
                                     53 	.area DATA
      000001                         54 _AccX::
      000001                         55 	.ds 4
      000005                         56 _AccY::
      000005                         57 	.ds 4
      000009                         58 _AccZ::
      000009                         59 	.ds 4
      00000D                         60 _AccXLSB::
      00000D                         61 	.ds 2
      00000F                         62 _AccXMSB::
      00000F                         63 	.ds 2
      000011                         64 _AccYLSB::
      000011                         65 	.ds 2
      000013                         66 _AccYMSB::
      000013                         67 	.ds 2
      000015                         68 _AccZLSB::
      000015                         69 	.ds 2
      000017                         70 _AccZMSB::
      000017                         71 	.ds 2
      000019                         72 _CurrentValue::
      000019                         73 	.ds 4
      00001D                         74 _LastValue::
      00001D                         75 	.ds 4
      000021                         76 _Value::
      000021                         77 	.ds 4
      000025                         78 _Distance::
      000025                         79 	.ds 4
      000029                         80 _LastSteps::
      000029                         81 	.ds 1
      00002A                         82 _SumValue::
      00002A                         83 	.ds 4
                                     84 ;--------------------------------------------------------
                                     85 ; ram data
                                     86 ;--------------------------------------------------------
                                     87 	.area INITIALIZED
      000030                         88 _Steps::
      000030                         89 	.ds 1
      000031                         90 _Threshold::
      000031                         91 	.ds 4
      000035                         92 _Mode::
      000035                         93 	.ds 1
                                     94 ;--------------------------------------------------------
                                     95 ; Stack segment in internal ram
                                     96 ;--------------------------------------------------------
                                     97 	.area SSEG
      000036                         98 __start__stack:
      000036                         99 	.ds	1
                                    100 
                                    101 ;--------------------------------------------------------
                                    102 ; absolute external ram data
                                    103 ;--------------------------------------------------------
                                    104 	.area DABS (ABS)
                                    105 
                                    106 ; default segment ordering for linker
                                    107 	.area HOME
                                    108 	.area GSINIT
                                    109 	.area GSFINAL
                                    110 	.area CONST
                                    111 	.area INITIALIZER
                                    112 	.area CODE
                                    113 
                                    114 ;--------------------------------------------------------
                                    115 ; interrupt vector
                                    116 ;--------------------------------------------------------
                                    117 	.area HOME
      008000                        118 __interrupt_vect:
      008000 82 00 80 07            119 	int s_GSINIT ; reset
                                    120 ;--------------------------------------------------------
                                    121 ; global & static initialisations
                                    122 ;--------------------------------------------------------
                                    123 	.area HOME
                                    124 	.area GSINIT
                                    125 	.area GSFINAL
                                    126 	.area GSINIT
      008007 CD 8E 3B         [ 4]  127 	call	___sdcc_external_startup
      00800A 4D               [ 1]  128 	tnz	a
      00800B 27 03            [ 1]  129 	jreq	__sdcc_init_data
      00800D CC 80 04         [ 2]  130 	jp	__sdcc_program_startup
      008010                        131 __sdcc_init_data:
                                    132 ; stm8_genXINIT() start
      008010 AE 00 2F         [ 2]  133 	ldw x, #l_DATA
      008013 27 07            [ 1]  134 	jreq	00002$
      008015                        135 00001$:
      008015 72 4F 00 00      [ 1]  136 	clr (s_DATA - 1, x)
      008019 5A               [ 2]  137 	decw x
      00801A 26 F9            [ 1]  138 	jrne	00001$
      00801C                        139 00002$:
      00801C AE 00 06         [ 2]  140 	ldw	x, #l_INITIALIZER
      00801F 27 09            [ 1]  141 	jreq	00004$
      008021                        142 00003$:
      008021 D6 81 7F         [ 1]  143 	ld	a, (s_INITIALIZER - 1, x)
      008024 D7 00 2F         [ 1]  144 	ld	(s_INITIALIZED - 1, x), a
      008027 5A               [ 2]  145 	decw	x
      008028 26 F7            [ 1]  146 	jrne	00003$
      00802A                        147 00004$:
                                    148 ; stm8_genXINIT() end
                                    149 	.area GSFINAL
      00802A CC 80 04         [ 2]  150 	jp	__sdcc_program_startup
                                    151 ;--------------------------------------------------------
                                    152 ; Home
                                    153 ;--------------------------------------------------------
                                    154 	.area HOME
                                    155 	.area HOME
      008004                        156 __sdcc_program_startup:
      008004 CC 81 86         [ 2]  157 	jp	_main
                                    158 ;	return from main will return to caller
                                    159 ;--------------------------------------------------------
                                    160 ; code
                                    161 ;--------------------------------------------------------
                                    162 	.area CODE
                                    163 ;	main.c: 116: void main(void)
                                    164 ;	-----------------------------------------
                                    165 ;	 function main
                                    166 ;	-----------------------------------------
      008186                        167 _main:
      008186 52 05            [ 2]  168 	sub	sp, #5
                                    169 ;	main.c: 119: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      008188 C6 50 C6         [ 1]  170 	ld	a, 0x50c6
      00818B A4 E7            [ 1]  171 	and	a, #0xe7
      00818D C7 50 C6         [ 1]  172 	ld	0x50c6, a
                                    173 ;	main.c: 120: CLK->CKDIVR |= (uint8_t)0x00;
      008190 55 50 C6 50 C6   [ 1]  174 	mov	0x50c6, 0x50c6
                                    175 ;	main.c: 123: GPIOB->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
      008195 35 00 50 05      [ 1]  176 	mov	0x5005+0, #0x00
                                    177 ;	main.c: 124: GPIOB->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
      008199 35 00 50 07      [ 1]  178 	mov	0x5007+0, #0x00
                                    179 ;	main.c: 125: GPIOB->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
      00819D 35 00 50 08      [ 1]  180 	mov	0x5008+0, #0x00
                                    181 ;	main.c: 126: GPIOB->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
      0081A1 35 00 50 09      [ 1]  182 	mov	0x5009+0, #0x00
                                    183 ;	main.c: 128: GPIOA->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
      0081A5 35 00 50 00      [ 1]  184 	mov	0x5000+0, #0x00
                                    185 ;	main.c: 129: GPIOA->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
      0081A9 35 00 50 02      [ 1]  186 	mov	0x5002+0, #0x00
                                    187 ;	main.c: 130: GPIOA->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
      0081AD 35 00 50 03      [ 1]  188 	mov	0x5003+0, #0x00
                                    189 ;	main.c: 131: GPIOA->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
      0081B1 35 00 50 04      [ 1]  190 	mov	0x5004+0, #0x00
                                    191 ;	main.c: 133: GPIOC->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
      0081B5 35 00 50 0A      [ 1]  192 	mov	0x500a+0, #0x00
                                    193 ;	main.c: 134: GPIOC->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
      0081B9 35 00 50 0C      [ 1]  194 	mov	0x500c+0, #0x00
                                    195 ;	main.c: 135: GPIOC->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
      0081BD 35 00 50 0D      [ 1]  196 	mov	0x500d+0, #0x00
                                    197 ;	main.c: 136: GPIOC->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
      0081C1 35 00 50 0E      [ 1]  198 	mov	0x500e+0, #0x00
                                    199 ;	main.c: 139: GPIOB->DDR |= (uint8_t)(1 << 4);
      0081C5 72 18 50 07      [ 1]  200 	bset	0x5007, #4
                                    201 ;	main.c: 140: GPIOB->ODR |= (uint8_t)(1 << 4);
      0081C9 72 18 50 05      [ 1]  202 	bset	0x5005, #4
                                    203 ;	main.c: 141: GPIOB->CR1 &= ~(uint8_t)(1 << 4); /*OPEN DRAIN*/
      0081CD 72 19 50 08      [ 1]  204 	bres	0x5008, #4
                                    205 ;	main.c: 142: GPIOB->CR2 &= ~(uint8_t)(1 << 4); /*Output Speed Up to 2Mhz*/
      0081D1 72 19 50 09      [ 1]  206 	bres	0x5009, #4
                                    207 ;	main.c: 145: GPIOB->DDR |= (uint8_t)(1 << 5);
      0081D5 72 1A 50 07      [ 1]  208 	bset	0x5007, #5
                                    209 ;	main.c: 146: GPIOB->ODR |= (uint8_t)(1 << 5);
      0081D9 72 1A 50 05      [ 1]  210 	bset	0x5005, #5
                                    211 ;	main.c: 147: GPIOB->CR1 &= ~(uint8_t)(1 << 5); /*OPEN DRAIN*/
      0081DD 72 1B 50 08      [ 1]  212 	bres	0x5008, #5
                                    213 ;	main.c: 148: GPIOB->CR2 &= ~(uint8_t)(1 << 5); /*Output Speed Up to 2Mhz*/
      0081E1 72 1B 50 09      [ 1]  214 	bres	0x5009, #5
                                    215 ;	main.c: 151: GPIOA->DDR &= ~(uint8_t)(1 << 3);
      0081E5 72 17 50 02      [ 1]  216 	bres	0x5002, #3
                                    217 ;	main.c: 152: GPIOA->IDR |= (uint8_t)(1 << 3);
      0081E9 72 16 50 01      [ 1]  218 	bset	0x5001, #3
                                    219 ;	main.c: 153: GPIOA->CR1 |= (uint8_t)(1 << 3);  /*PULL UP*/
      0081ED 72 16 50 03      [ 1]  220 	bset	0x5003, #3
                                    221 ;	main.c: 154: GPIOA->CR2 &= ~(uint8_t)(1 << 3); /*External interrupt disabled*/
      0081F1 72 17 50 04      [ 1]  222 	bres	0x5004, #3
                                    223 ;	main.c: 157: GPIOC->DDR &= ~(uint8_t)(1 << 3);
      0081F5 72 17 50 0C      [ 1]  224 	bres	0x500c, #3
                                    225 ;	main.c: 158: GPIOC->IDR |= (uint8_t)(1 << 3);
      0081F9 72 16 50 0B      [ 1]  226 	bset	0x500b, #3
                                    227 ;	main.c: 159: GPIOC->CR1 |= (uint8_t)(1 << 3);  /*PULL UP*/
      0081FD 72 16 50 0D      [ 1]  228 	bset	0x500d, #3
                                    229 ;	main.c: 160: GPIOC->CR2 &= ~(uint8_t)(1 << 3); /*External interrupt disabled*/
      008201 72 17 50 0E      [ 1]  230 	bres	0x500e, #3
                                    231 ;	main.c: 163: GPIOC->DDR |= (uint8_t)(1 << 4);
      008205 72 18 50 0C      [ 1]  232 	bset	0x500c, #4
                                    233 ;	main.c: 164: GPIOC->ODR &= ~(uint8_t)(1 << 4);
      008209 72 19 50 0A      [ 1]  234 	bres	0x500a, #4
                                    235 ;	main.c: 165: GPIOC->CR1 |= (uint8_t)(1 << 4);  /*PULL PUSH*/
      00820D 72 18 50 0D      [ 1]  236 	bset	0x500d, #4
                                    237 ;	main.c: 166: GPIOC->CR2 &= ~(uint8_t)(1 << 4); /*Output Speed Up to 2Mhz*/
      008211 72 19 50 0E      [ 1]  238 	bres	0x500e, #4
                                    239 ;	main.c: 168: uart_init();
      008215 CD 86 9C         [ 4]  240 	call	_uart_init
                                    241 ;	main.c: 169: Timer4Config();
      008218 CD 85 F5         [ 4]  242 	call	_Timer4Config
                                    243 ;	main.c: 170: I2C_init();
      00821B CD 86 17         [ 4]  244 	call	_I2C_init
                                    245 ;	main.c: 195: initMPU6050();
      00821E CD 84 94         [ 4]  246 	call	_initMPU6050
                                    247 ;	main.c: 196: Timer4DelayMs(10);
      008221 AE 00 0A         [ 2]  248 	ldw	x, #0x000a
      008224 CD 86 02         [ 4]  249 	call	_Timer4DelayMs
                                    250 ;	main.c: 198: for (uint8_t a = 0; a < 20; a++)
      008227 0F 05            [ 1]  251 	clr	(0x05, sp)
      008229                        252 00106$:
      008229 7B 05            [ 1]  253 	ld	a, (0x05, sp)
      00822B A1 14            [ 1]  254 	cp	a, #0x14
      00822D 25 03            [ 1]  255 	jrc	00126$
      00822F CC 82 AF         [ 2]  256 	jp	00101$
      008232                        257 00126$:
                                    258 ;	main.c: 200: getMPU6050();
      008232 CD 85 00         [ 4]  259 	call	_getMPU6050
                                    260 ;	main.c: 201: CurrentValue = sqrtf((AccX * AccX) + (AccY * AccY));
      008235 3B 00 04         [ 1]  261 	push	_AccX+3
      008238 3B 00 03         [ 1]  262 	push	_AccX+2
      00823B 3B 00 02         [ 1]  263 	push	_AccX+1
      00823E 3B 00 01         [ 1]  264 	push	_AccX+0
      008241 3B 00 04         [ 1]  265 	push	_AccX+3
      008244 3B 00 03         [ 1]  266 	push	_AccX+2
      008247 3B 00 02         [ 1]  267 	push	_AccX+1
      00824A 3B 00 01         [ 1]  268 	push	_AccX+0
      00824D CD 87 9A         [ 4]  269 	call	___fsmul
      008250 1F 03            [ 2]  270 	ldw	(0x03, sp), x
      008252 17 01            [ 2]  271 	ldw	(0x01, sp), y
      008254 3B 00 08         [ 1]  272 	push	_AccY+3
      008257 3B 00 07         [ 1]  273 	push	_AccY+2
      00825A 3B 00 06         [ 1]  274 	push	_AccY+1
      00825D 3B 00 05         [ 1]  275 	push	_AccY+0
      008260 3B 00 08         [ 1]  276 	push	_AccY+3
      008263 3B 00 07         [ 1]  277 	push	_AccY+2
      008266 3B 00 06         [ 1]  278 	push	_AccY+1
      008269 3B 00 05         [ 1]  279 	push	_AccY+0
      00826C CD 87 9A         [ 4]  280 	call	___fsmul
      00826F 89               [ 2]  281 	pushw	x
      008270 90 89            [ 2]  282 	pushw	y
      008272 1E 07            [ 2]  283 	ldw	x, (0x07, sp)
      008274 89               [ 2]  284 	pushw	x
      008275 1E 07            [ 2]  285 	ldw	x, (0x07, sp)
      008277 89               [ 2]  286 	pushw	x
      008278 CD 8A E2         [ 4]  287 	call	___fsadd
      00827B 89               [ 2]  288 	pushw	x
      00827C 90 89            [ 2]  289 	pushw	y
      00827E CD 89 54         [ 4]  290 	call	_sqrtf
      008281 CF 00 1B         [ 2]  291 	ldw	_CurrentValue+2, x
      008284 90 CF 00 19      [ 2]  292 	ldw	_CurrentValue+0, y
                                    293 ;	main.c: 202: LastValue = LastValue + CurrentValue;
      008288 3B 00 1C         [ 1]  294 	push	_CurrentValue+3
      00828B 3B 00 1B         [ 1]  295 	push	_CurrentValue+2
      00828E 3B 00 1A         [ 1]  296 	push	_CurrentValue+1
      008291 3B 00 19         [ 1]  297 	push	_CurrentValue+0
      008294 3B 00 20         [ 1]  298 	push	_LastValue+3
      008297 3B 00 1F         [ 1]  299 	push	_LastValue+2
      00829A 3B 00 1E         [ 1]  300 	push	_LastValue+1
      00829D 3B 00 1D         [ 1]  301 	push	_LastValue+0
      0082A0 CD 8A E2         [ 4]  302 	call	___fsadd
      0082A3 CF 00 1F         [ 2]  303 	ldw	_LastValue+2, x
      0082A6 90 CF 00 1D      [ 2]  304 	ldw	_LastValue+0, y
                                    305 ;	main.c: 198: for (uint8_t a = 0; a < 20; a++)
      0082AA 0C 05            [ 1]  306 	inc	(0x05, sp)
      0082AC CC 82 29         [ 2]  307 	jp	00106$
      0082AF                        308 00101$:
                                    309 ;	main.c: 204: uart1_number((int)LastValue);
      0082AF 3B 00 20         [ 1]  310 	push	_LastValue+3
      0082B2 3B 00 1F         [ 1]  311 	push	_LastValue+2
      0082B5 3B 00 1E         [ 1]  312 	push	_LastValue+1
      0082B8 3B 00 1D         [ 1]  313 	push	_LastValue+0
      0082BB CD 8D 8F         [ 4]  314 	call	___fs2sint
      0082BE CD 86 EF         [ 4]  315 	call	_uart1_number
                                    316 ;	main.c: 205: while (1)
      0082C1                        317 00103$:
      0082C1 20 FE            [ 2]  318 	jra	00103$
                                    319 ;	main.c: 269: }
      0082C3 5B 05            [ 2]  320 	addw	sp, #5
      0082C5 81               [ 4]  321 	ret
                                    322 ;	main.c: 272: void OLED_init(void)
                                    323 ;	-----------------------------------------
                                    324 ;	 function OLED_init
                                    325 ;	-----------------------------------------
      0082C6                        326 _OLED_init:
      0082C6 88               [ 1]  327 	push	a
                                    328 ;	main.c: 274: I2C_start();
      0082C7 CD 86 4F         [ 4]  329 	call	_I2C_start
                                    330 ;	main.c: 275: I2C_address(OLED_I2C_ADDR, I2C_DIRECTION_TX);
      0082CA 4B 00            [ 1]  331 	push	#0x00
      0082CC A6 78            [ 1]  332 	ld	a, #0x78
      0082CE CD 86 6C         [ 4]  333 	call	_I2C_address
                                    334 ;	main.c: 276: I2C_write(OLED_CMD_MODE);
      0082D1 4F               [ 1]  335 	clr	a
      0082D2 CD 86 86         [ 4]  336 	call	_I2C_write
                                    337 ;	main.c: 277: for (uint8_t i = 0; i < 12; i++)
      0082D5 0F 01            [ 1]  338 	clr	(0x01, sp)
      0082D7                        339 00103$:
      0082D7 7B 01            [ 1]  340 	ld	a, (0x01, sp)
      0082D9 A1 0C            [ 1]  341 	cp	a, #0x0c
      0082DB 24 0F            [ 1]  342 	jrnc	00101$
                                    343 ;	main.c: 279: I2C_write(OLED_INIT_CMD[i]);
      0082DD 5F               [ 1]  344 	clrw	x
      0082DE 7B 01            [ 1]  345 	ld	a, (0x01, sp)
      0082E0 97               [ 1]  346 	ld	xl, a
      0082E1 1C 80 2D         [ 2]  347 	addw	x, #(_OLED_INIT_CMD+0)
      0082E4 F6               [ 1]  348 	ld	a, (x)
      0082E5 CD 86 86         [ 4]  349 	call	_I2C_write
                                    350 ;	main.c: 277: for (uint8_t i = 0; i < 12; i++)
      0082E8 0C 01            [ 1]  351 	inc	(0x01, sp)
      0082EA 20 EB            [ 2]  352 	jra	00103$
      0082EC                        353 00101$:
                                    354 ;	main.c: 281: I2C_stop();
      0082EC 84               [ 1]  355 	pop	a
      0082ED CC 86 61         [ 2]  356 	jp	_I2C_stop
                                    357 ;	main.c: 282: }
      0082F0 84               [ 1]  358 	pop	a
      0082F1 81               [ 4]  359 	ret
                                    360 ;	main.c: 283: void OLED_printP(const char *p)
                                    361 ;	-----------------------------------------
                                    362 ;	 function OLED_printP
                                    363 ;	-----------------------------------------
      0082F2                        364 _OLED_printP:
      0082F2 52 07            [ 2]  365 	sub	sp, #7
      0082F4 1F 03            [ 2]  366 	ldw	(0x03, sp), x
                                    367 ;	main.c: 285: I2C_start();
      0082F6 CD 86 4F         [ 4]  368 	call	_I2C_start
                                    369 ;	main.c: 286: I2C_address(OLED_I2C_ADDR, I2C_DIRECTION_TX);
      0082F9 4B 00            [ 1]  370 	push	#0x00
      0082FB A6 78            [ 1]  371 	ld	a, #0x78
      0082FD CD 86 6C         [ 4]  372 	call	_I2C_address
                                    373 ;	main.c: 287: I2C_write(OLED_DAT_MODE);
      008300 A6 40            [ 1]  374 	ld	a, #0x40
      008302 CD 86 86         [ 4]  375 	call	_I2C_write
                                    376 ;	main.c: 288: while (*p)
      008305 16 03            [ 2]  377 	ldw	y, (0x03, sp)
      008307 17 05            [ 2]  378 	ldw	(0x05, sp), y
      008309                        379 00102$:
      008309 1E 05            [ 2]  380 	ldw	x, (0x05, sp)
      00830B F6               [ 1]  381 	ld	a, (x)
      00830C 6B 07            [ 1]  382 	ld	(0x07, sp), a
      00830E 27 35            [ 1]  383 	jreq	00104$
                                    384 ;	main.c: 290: uint16_t offset = *p - 32;
      008310 7B 07            [ 1]  385 	ld	a, (0x07, sp)
      008312 5F               [ 1]  386 	clrw	x
      008313 97               [ 1]  387 	ld	xl, a
      008314 1D 00 20         [ 2]  388 	subw	x, #0x0020
                                    389 ;	main.c: 291: offset += offset << 2;
      008317 1F 01            [ 2]  390 	ldw	(0x01, sp), x
      008319 58               [ 2]  391 	sllw	x
      00831A 58               [ 2]  392 	sllw	x
      00831B 72 FB 01         [ 2]  393 	addw	x, (0x01, sp)
                                    394 ;	main.c: 292: I2C_write(0x00);
      00831E 89               [ 2]  395 	pushw	x
      00831F 4F               [ 1]  396 	clr	a
      008320 CD 86 86         [ 4]  397 	call	_I2C_write
      008323 85               [ 2]  398 	popw	x
                                    399 ;	main.c: 293: for (uint8_t i = 5; i; i--)
      008324 A6 05            [ 1]  400 	ld	a, #0x05
      008326 6B 07            [ 1]  401 	ld	(0x07, sp), a
      008328                        402 00106$:
      008328 0D 07            [ 1]  403 	tnz	(0x07, sp)
      00832A 27 12            [ 1]  404 	jreq	00101$
                                    405 ;	main.c: 295: I2C_write(OLED_FONT[offset++]);
      00832C 90 93            [ 1]  406 	ldw	y, x
      00832E 72 A9 80 3B      [ 2]  407 	addw	y, #(_OLED_FONT+0)
      008332 5C               [ 1]  408 	incw	x
      008333 90 F6            [ 1]  409 	ld	a, (y)
      008335 89               [ 2]  410 	pushw	x
      008336 CD 86 86         [ 4]  411 	call	_I2C_write
      008339 85               [ 2]  412 	popw	x
                                    413 ;	main.c: 293: for (uint8_t i = 5; i; i--)
      00833A 0A 07            [ 1]  414 	dec	(0x07, sp)
      00833C 20 EA            [ 2]  415 	jra	00106$
      00833E                        416 00101$:
                                    417 ;	main.c: 297: p++;
      00833E 1E 05            [ 2]  418 	ldw	x, (0x05, sp)
      008340 5C               [ 1]  419 	incw	x
      008341 1F 05            [ 2]  420 	ldw	(0x05, sp), x
      008343 20 C4            [ 2]  421 	jra	00102$
      008345                        422 00104$:
                                    423 ;	main.c: 299: I2C_stop();
      008345 5B 07            [ 2]  424 	addw	sp, #7
                                    425 ;	main.c: 300: }
      008347 CC 86 61         [ 2]  426 	jp	_I2C_stop
                                    427 ;	main.c: 301: void OLED_printNum(uint16_t num)
                                    428 ;	-----------------------------------------
                                    429 ;	 function OLED_printNum
                                    430 ;	-----------------------------------------
      00834A                        431 _OLED_printNum:
      00834A 52 0D            [ 2]  432 	sub	sp, #13
      00834C 1F 0A            [ 2]  433 	ldw	(0x0a, sp), x
                                    434 ;	main.c: 303: uint8_t mang[] = {0, 0, 0, 0, 0};
      00834E 0F 05            [ 1]  435 	clr	(0x05, sp)
      008350 0F 06            [ 1]  436 	clr	(0x06, sp)
      008352 0F 07            [ 1]  437 	clr	(0x07, sp)
      008354 0F 08            [ 1]  438 	clr	(0x08, sp)
      008356 0F 09            [ 1]  439 	clr	(0x09, sp)
                                    440 ;	main.c: 304: uint8_t count = 0;
      008358 4F               [ 1]  441 	clr	a
                                    442 ;	main.c: 305: if (num == 0)
      008359 1E 0A            [ 2]  443 	ldw	x, (0x0a, sp)
      00835B 26 04            [ 1]  444 	jrne	00117$
                                    445 ;	main.c: 307: mang[0] = 0;
      00835D 0F 05            [ 1]  446 	clr	(0x05, sp)
                                    447 ;	main.c: 308: count = 1;
      00835F A6 01            [ 1]  448 	ld	a, #0x01
                                    449 ;	main.c: 310: while (num != 0)
      008361                        450 00117$:
      008361 6B 0D            [ 1]  451 	ld	(0x0d, sp), a
      008363                        452 00103$:
      008363 1E 0A            [ 2]  453 	ldw	x, (0x0a, sp)
      008365 27 2C            [ 1]  454 	jreq	00105$
                                    455 ;	main.c: 312: mang[count] = num % 10;
      008367 5F               [ 1]  456 	clrw	x
      008368 7B 0D            [ 1]  457 	ld	a, (0x0d, sp)
      00836A 97               [ 1]  458 	ld	xl, a
      00836B 89               [ 2]  459 	pushw	x
      00836C 96               [ 1]  460 	ldw	x, sp
      00836D 1C 00 07         [ 2]  461 	addw	x, #7
      008370 72 FB 01         [ 2]  462 	addw	x, (1, sp)
      008373 1F 03            [ 2]  463 	ldw	(0x03, sp), x
      008375 5B 02            [ 2]  464 	addw	sp, #2
      008377 16 0A            [ 2]  465 	ldw	y, (0x0a, sp)
      008379 17 03            [ 2]  466 	ldw	(0x03, sp), y
      00837B 93               [ 1]  467 	ldw	x, y
      00837C 90 AE 00 0A      [ 2]  468 	ldw	y, #0x000a
      008380 65               [ 2]  469 	divw	x, y
      008381 90 9F            [ 1]  470 	ld	a, yl
      008383 1E 01            [ 2]  471 	ldw	x, (0x01, sp)
      008385 F7               [ 1]  472 	ld	(x), a
                                    473 ;	main.c: 313: num = num / 10;
      008386 1E 03            [ 2]  474 	ldw	x, (0x03, sp)
      008388 90 AE 00 0A      [ 2]  475 	ldw	y, #0x000a
      00838C 65               [ 2]  476 	divw	x, y
      00838D 1F 0A            [ 2]  477 	ldw	(0x0a, sp), x
                                    478 ;	main.c: 314: ++count;
      00838F 0C 0D            [ 1]  479 	inc	(0x0d, sp)
      008391 20 D0            [ 2]  480 	jra	00103$
      008393                        481 00105$:
                                    482 ;	main.c: 316: I2C_start();
      008393 CD 86 4F         [ 4]  483 	call	_I2C_start
                                    484 ;	main.c: 317: I2C_address(OLED_I2C_ADDR, I2C_DIRECTION_TX);
      008396 4B 00            [ 1]  485 	push	#0x00
      008398 A6 78            [ 1]  486 	ld	a, #0x78
      00839A CD 86 6C         [ 4]  487 	call	_I2C_address
                                    488 ;	main.c: 318: I2C_write(OLED_DAT_MODE);
      00839D A6 40            [ 1]  489 	ld	a, #0x40
      00839F CD 86 86         [ 4]  490 	call	_I2C_write
                                    491 ;	main.c: 319: while (count != 0)
      0083A2 7B 0D            [ 1]  492 	ld	a, (0x0d, sp)
      0083A4 6B 0C            [ 1]  493 	ld	(0x0c, sp), a
      0083A6                        494 00107$:
      0083A6 0D 0C            [ 1]  495 	tnz	(0x0c, sp)
      0083A8 27 43            [ 1]  496 	jreq	00109$
                                    497 ;	main.c: 321: uint16_t offset = mang[count - 1] + 16;
      0083AA 7B 0C            [ 1]  498 	ld	a, (0x0c, sp)
      0083AC 4A               [ 1]  499 	dec	a
      0083AD 6B 04            [ 1]  500 	ld	(0x04, sp), a
      0083AF 49               [ 1]  501 	rlc	a
      0083B0 4F               [ 1]  502 	clr	a
      0083B1 A2 00            [ 1]  503 	sbc	a, #0x00
      0083B3 6B 03            [ 1]  504 	ld	(0x03, sp), a
      0083B5 96               [ 1]  505 	ldw	x, sp
      0083B6 1C 00 05         [ 2]  506 	addw	x, #5
      0083B9 72 FB 03         [ 2]  507 	addw	x, (0x03, sp)
      0083BC F6               [ 1]  508 	ld	a, (x)
      0083BD 5F               [ 1]  509 	clrw	x
      0083BE 97               [ 1]  510 	ld	xl, a
      0083BF 1C 00 10         [ 2]  511 	addw	x, #0x0010
                                    512 ;	main.c: 322: offset += offset << 2;
      0083C2 1F 03            [ 2]  513 	ldw	(0x03, sp), x
      0083C4 58               [ 2]  514 	sllw	x
      0083C5 58               [ 2]  515 	sllw	x
      0083C6 72 FB 03         [ 2]  516 	addw	x, (0x03, sp)
                                    517 ;	main.c: 323: I2C_write(0x00);
      0083C9 89               [ 2]  518 	pushw	x
      0083CA 4F               [ 1]  519 	clr	a
      0083CB CD 86 86         [ 4]  520 	call	_I2C_write
      0083CE 85               [ 2]  521 	popw	x
                                    522 ;	main.c: 324: for (uint8_t i = 5; i; i--)
      0083CF A6 05            [ 1]  523 	ld	a, #0x05
      0083D1 6B 0D            [ 1]  524 	ld	(0x0d, sp), a
      0083D3                        525 00111$:
      0083D3 0D 0D            [ 1]  526 	tnz	(0x0d, sp)
      0083D5 27 12            [ 1]  527 	jreq	00106$
                                    528 ;	main.c: 326: I2C_write(OLED_FONT[offset++]);
      0083D7 90 93            [ 1]  529 	ldw	y, x
      0083D9 72 A9 80 3B      [ 2]  530 	addw	y, #(_OLED_FONT+0)
      0083DD 5C               [ 1]  531 	incw	x
      0083DE 90 F6            [ 1]  532 	ld	a, (y)
      0083E0 89               [ 2]  533 	pushw	x
      0083E1 CD 86 86         [ 4]  534 	call	_I2C_write
      0083E4 85               [ 2]  535 	popw	x
                                    536 ;	main.c: 324: for (uint8_t i = 5; i; i--)
      0083E5 0A 0D            [ 1]  537 	dec	(0x0d, sp)
      0083E7 20 EA            [ 2]  538 	jra	00111$
      0083E9                        539 00106$:
                                    540 ;	main.c: 328: --count;
      0083E9 0A 0C            [ 1]  541 	dec	(0x0c, sp)
      0083EB 20 B9            [ 2]  542 	jra	00107$
      0083ED                        543 00109$:
                                    544 ;	main.c: 330: I2C_stop();
      0083ED CD 86 61         [ 4]  545 	call	_I2C_stop
                                    546 ;	main.c: 331: }
      0083F0 5B 0D            [ 2]  547 	addw	sp, #13
      0083F2 81               [ 4]  548 	ret
                                    549 ;	main.c: 332: void OLED_printOneNumber(uint8_t num)
                                    550 ;	-----------------------------------------
                                    551 ;	 function OLED_printOneNumber
                                    552 ;	-----------------------------------------
      0083F3                        553 _OLED_printOneNumber:
      0083F3 52 02            [ 2]  554 	sub	sp, #2
                                    555 ;	main.c: 334: uint16_t offset = num + 16;
      0083F5 5F               [ 1]  556 	clrw	x
      0083F6 97               [ 1]  557 	ld	xl, a
      0083F7 1C 00 10         [ 2]  558 	addw	x, #0x0010
                                    559 ;	main.c: 335: offset += offset << 2;
      0083FA 1F 01            [ 2]  560 	ldw	(0x01, sp), x
      0083FC 58               [ 2]  561 	sllw	x
      0083FD 58               [ 2]  562 	sllw	x
      0083FE 72 FB 01         [ 2]  563 	addw	x, (0x01, sp)
      008401 1F 01            [ 2]  564 	ldw	(0x01, sp), x
                                    565 ;	main.c: 336: I2C_start();
      008403 CD 86 4F         [ 4]  566 	call	_I2C_start
                                    567 ;	main.c: 337: I2C_address(OLED_I2C_ADDR, OLED_DAT_MODE);
      008406 4B 01            [ 1]  568 	push	#0x01
      008408 A6 78            [ 1]  569 	ld	a, #0x78
      00840A CD 86 6C         [ 4]  570 	call	_I2C_address
                                    571 ;	main.c: 338: I2C_write(0x00);
      00840D 4F               [ 1]  572 	clr	a
      00840E CD 86 86         [ 4]  573 	call	_I2C_write
                                    574 ;	main.c: 339: for (uint8_t i = 5; i; i--)
      008411 1E 01            [ 2]  575 	ldw	x, (0x01, sp)
      008413 A6 05            [ 1]  576 	ld	a, #0x05
      008415 6B 02            [ 1]  577 	ld	(0x02, sp), a
      008417                        578 00103$:
      008417 0D 02            [ 1]  579 	tnz	(0x02, sp)
      008419 27 12            [ 1]  580 	jreq	00101$
                                    581 ;	main.c: 341: I2C_write(OLED_FONT[offset++]);
      00841B 90 93            [ 1]  582 	ldw	y, x
      00841D 72 A9 80 3B      [ 2]  583 	addw	y, #(_OLED_FONT+0)
      008421 5C               [ 1]  584 	incw	x
      008422 90 F6            [ 1]  585 	ld	a, (y)
      008424 89               [ 2]  586 	pushw	x
      008425 CD 86 86         [ 4]  587 	call	_I2C_write
      008428 85               [ 2]  588 	popw	x
                                    589 ;	main.c: 339: for (uint8_t i = 5; i; i--)
      008429 0A 02            [ 1]  590 	dec	(0x02, sp)
      00842B 20 EA            [ 2]  591 	jra	00103$
      00842D                        592 00101$:
                                    593 ;	main.c: 343: I2C_stop();
      00842D 5B 02            [ 2]  594 	addw	sp, #2
                                    595 ;	main.c: 344: }
      00842F CC 86 61         [ 2]  596 	jp	_I2C_stop
                                    597 ;	main.c: 345: void OLED_cursor(uint8_t xpos, uint8_t ypos)
                                    598 ;	-----------------------------------------
                                    599 ;	 function OLED_cursor
                                    600 ;	-----------------------------------------
      008432                        601 _OLED_cursor:
      008432 88               [ 1]  602 	push	a
      008433 6B 01            [ 1]  603 	ld	(0x01, sp), a
                                    604 ;	main.c: 347: I2C_start();
      008435 CD 86 4F         [ 4]  605 	call	_I2C_start
                                    606 ;	main.c: 348: I2C_address(OLED_I2C_ADDR, I2C_DIRECTION_TX);
      008438 4B 00            [ 1]  607 	push	#0x00
      00843A A6 78            [ 1]  608 	ld	a, #0x78
      00843C CD 86 6C         [ 4]  609 	call	_I2C_address
                                    610 ;	main.c: 349: I2C_write(OLED_CMD_MODE);
      00843F 4F               [ 1]  611 	clr	a
      008440 CD 86 86         [ 4]  612 	call	_I2C_write
                                    613 ;	main.c: 350: I2C_write(xpos & 0x0F);
      008443 7B 01            [ 1]  614 	ld	a, (0x01, sp)
      008445 A4 0F            [ 1]  615 	and	a, #0x0f
      008447 CD 86 86         [ 4]  616 	call	_I2C_write
                                    617 ;	main.c: 351: I2C_write(0x10 | (xpos >> 4));
      00844A 7B 01            [ 1]  618 	ld	a, (0x01, sp)
      00844C 4E               [ 1]  619 	swap	a
      00844D A4 0F            [ 1]  620 	and	a, #0x0f
      00844F AA 10            [ 1]  621 	or	a, #0x10
      008451 CD 86 86         [ 4]  622 	call	_I2C_write
                                    623 ;	main.c: 352: I2C_write(0xB0 | (ypos & 0x07));
      008454 7B 04            [ 1]  624 	ld	a, (0x04, sp)
      008456 A4 07            [ 1]  625 	and	a, #0x07
      008458 AA B0            [ 1]  626 	or	a, #0xb0
      00845A CD 86 86         [ 4]  627 	call	_I2C_write
                                    628 ;	main.c: 353: I2C_stop();
      00845D 1E 02            [ 2]  629 	ldw	x, (2, sp)
      00845F 1F 03            [ 2]  630 	ldw	(3, sp), x
      008461 5B 02            [ 2]  631 	addw	sp, #2
      008463 CC 86 61         [ 2]  632 	jp	_I2C_stop
                                    633 ;	main.c: 354: }
      008466 84               [ 1]  634 	pop	a
      008467 85               [ 2]  635 	popw	x
      008468 84               [ 1]  636 	pop	a
      008469 FC               [ 2]  637 	jp	(x)
                                    638 ;	main.c: 355: void OLED_clear(void)
                                    639 ;	-----------------------------------------
                                    640 ;	 function OLED_clear
                                    641 ;	-----------------------------------------
      00846A                        642 _OLED_clear:
                                    643 ;	main.c: 357: OLED_cursor(0, 0);
      00846A 4B 00            [ 1]  644 	push	#0x00
      00846C 4F               [ 1]  645 	clr	a
      00846D CD 84 32         [ 4]  646 	call	_OLED_cursor
                                    647 ;	main.c: 358: I2C_start();
      008470 CD 86 4F         [ 4]  648 	call	_I2C_start
                                    649 ;	main.c: 359: I2C_address(OLED_I2C_ADDR, I2C_DIRECTION_TX);
      008473 4B 00            [ 1]  650 	push	#0x00
      008475 A6 78            [ 1]  651 	ld	a, #0x78
      008477 CD 86 6C         [ 4]  652 	call	_I2C_address
                                    653 ;	main.c: 360: I2C_write(OLED_DAT_MODE);
      00847A A6 40            [ 1]  654 	ld	a, #0x40
      00847C CD 86 86         [ 4]  655 	call	_I2C_write
                                    656 ;	main.c: 361: for (uint16_t i = 0; i < 512; i++)
      00847F 5F               [ 1]  657 	clrw	x
      008480                        658 00103$:
      008480 90 93            [ 1]  659 	ldw	y, x
      008482 90 A3 02 00      [ 2]  660 	cpw	y, #0x0200
      008486 25 03            [ 1]  661 	jrc	00118$
      008488 CC 86 61         [ 2]  662 	jp	_I2C_stop
      00848B                        663 00118$:
                                    664 ;	main.c: 363: I2C_write(0x00);
      00848B 89               [ 2]  665 	pushw	x
      00848C 4F               [ 1]  666 	clr	a
      00848D CD 86 86         [ 4]  667 	call	_I2C_write
      008490 85               [ 2]  668 	popw	x
                                    669 ;	main.c: 361: for (uint16_t i = 0; i < 512; i++)
      008491 5C               [ 1]  670 	incw	x
                                    671 ;	main.c: 365: I2C_stop();
                                    672 ;	main.c: 366: }
      008492 20 EC            [ 2]  673 	jra	00103$
                                    674 ;	main.c: 369: void initMPU6050(void)
                                    675 ;	-----------------------------------------
                                    676 ;	 function initMPU6050
                                    677 ;	-----------------------------------------
      008494                        678 _initMPU6050:
                                    679 ;	main.c: 371: I2C_start();	/*Disable SLEEP Mode*/
      008494 CD 86 4F         [ 4]  680 	call	_I2C_start
                                    681 ;	main.c: 372: I2C_address((uint8_t)0x68 << 1, I2C_DIRECTION_TX);
      008497 4B 00            [ 1]  682 	push	#0x00
      008499 A6 D0            [ 1]  683 	ld	a, #0xd0
      00849B CD 86 6C         [ 4]  684 	call	_I2C_address
                                    685 ;	main.c: 373: I2C_write(0x6B);
      00849E A6 6B            [ 1]  686 	ld	a, #0x6b
      0084A0 CD 86 86         [ 4]  687 	call	_I2C_write
                                    688 ;	main.c: 374: I2C_write(0x00);
      0084A3 4F               [ 1]  689 	clr	a
      0084A4 CD 86 86         [ 4]  690 	call	_I2C_write
                                    691 ;	main.c: 375: I2C_stop();
      0084A7 CD 86 61         [ 4]  692 	call	_I2C_stop
                                    693 ;	main.c: 376: Timer4DelayMs(100);
      0084AA AE 00 64         [ 2]  694 	ldw	x, #0x0064
      0084AD CD 86 02         [ 4]  695 	call	_Timer4DelayMs
                                    696 ;	main.c: 378: I2C_start();	/*Enable Low Pass Filter*/
      0084B0 CD 86 4F         [ 4]  697 	call	_I2C_start
                                    698 ;	main.c: 379: I2C_address((uint8_t)0x68 << 1, I2C_DIRECTION_TX);
      0084B3 4B 00            [ 1]  699 	push	#0x00
      0084B5 A6 D0            [ 1]  700 	ld	a, #0xd0
      0084B7 CD 86 6C         [ 4]  701 	call	_I2C_address
                                    702 ;	main.c: 380: I2C_write(0x1A);
      0084BA A6 1A            [ 1]  703 	ld	a, #0x1a
      0084BC CD 86 86         [ 4]  704 	call	_I2C_write
                                    705 ;	main.c: 381: I2C_write(0x05);
      0084BF A6 05            [ 1]  706 	ld	a, #0x05
      0084C1 CD 86 86         [ 4]  707 	call	_I2C_write
                                    708 ;	main.c: 382: I2C_stop();
      0084C4 CD 86 61         [ 4]  709 	call	_I2C_stop
                                    710 ;	main.c: 383: Timer4DelayMs(100);
      0084C7 AE 00 64         [ 2]  711 	ldw	x, #0x0064
      0084CA CD 86 02         [ 4]  712 	call	_Timer4DelayMs
                                    713 ;	main.c: 385: I2C_start();
      0084CD CD 86 4F         [ 4]  714 	call	_I2C_start
                                    715 ;	main.c: 386: I2C_address((uint8_t)0x68 << 1, I2C_DIRECTION_TX);
      0084D0 4B 00            [ 1]  716 	push	#0x00
      0084D2 A6 D0            [ 1]  717 	ld	a, #0xd0
      0084D4 CD 86 6C         [ 4]  718 	call	_I2C_address
                                    719 ;	main.c: 387: I2C_write(0x1B);
      0084D7 A6 1B            [ 1]  720 	ld	a, #0x1b
      0084D9 CD 86 86         [ 4]  721 	call	_I2C_write
                                    722 ;	main.c: 388: I2C_write(0x00); // 250 do/s
      0084DC 4F               [ 1]  723 	clr	a
      0084DD CD 86 86         [ 4]  724 	call	_I2C_write
                                    725 ;	main.c: 389: I2C_stop();
      0084E0 CD 86 61         [ 4]  726 	call	_I2C_stop
                                    727 ;	main.c: 390: Timer4DelayMs(100);
      0084E3 AE 00 64         [ 2]  728 	ldw	x, #0x0064
      0084E6 CD 86 02         [ 4]  729 	call	_Timer4DelayMs
                                    730 ;	main.c: 392: I2C_start(); /*Accelerometer Configuration*/
      0084E9 CD 86 4F         [ 4]  731 	call	_I2C_start
                                    732 ;	main.c: 393: I2C_address((uint8_t)0x68 << 1, I2C_DIRECTION_TX);
      0084EC 4B 00            [ 1]  733 	push	#0x00
      0084EE A6 D0            [ 1]  734 	ld	a, #0xd0
      0084F0 CD 86 6C         [ 4]  735 	call	_I2C_address
                                    736 ;	main.c: 394: I2C_write(0x1C);
      0084F3 A6 1C            [ 1]  737 	ld	a, #0x1c
      0084F5 CD 86 86         [ 4]  738 	call	_I2C_write
                                    739 ;	main.c: 395: I2C_write(0x10); //+-8g
      0084F8 A6 10            [ 1]  740 	ld	a, #0x10
      0084FA CD 86 86         [ 4]  741 	call	_I2C_write
                                    742 ;	main.c: 396: I2C_stop();
                                    743 ;	main.c: 397: }
      0084FD CC 86 61         [ 2]  744 	jp	_I2C_stop
                                    745 ;	main.c: 398: void getMPU6050(void)
                                    746 ;	-----------------------------------------
                                    747 ;	 function getMPU6050
                                    748 ;	-----------------------------------------
      008500                        749 _getMPU6050:
      008500 52 02            [ 2]  750 	sub	sp, #2
                                    751 ;	main.c: 402: I2C_start();
      008502 CD 86 4F         [ 4]  752 	call	_I2C_start
                                    753 ;	main.c: 403: I2C_address(I2C_Slave_Address, I2C_DIRECTION_TX);
      008505 4B 00            [ 1]  754 	push	#0x00
      008507 A6 D0            [ 1]  755 	ld	a, #0xd0
      008509 CD 86 6C         [ 4]  756 	call	_I2C_address
                                    757 ;	main.c: 404: I2C_write(0x3B);
      00850C A6 3B            [ 1]  758 	ld	a, #0x3b
      00850E CD 86 86         [ 4]  759 	call	_I2C_write
                                    760 ;	main.c: 406: I2C->CR2 |= I2C_CR2_START | I2C_CR2_ACK; /* Generate a START condition and Acknowledge Enable */
      008511 C6 52 11         [ 1]  761 	ld	a, 0x5211
      008514 AA 05            [ 1]  762 	or	a, #0x05
      008516 C7 52 11         [ 1]  763 	ld	0x5211, a
                                    764 ;	main.c: 407: while ((I2C->SR1 & I2C_SR1_SB) == 0)
      008519                        765 00101$:
      008519 72 01 52 17 FB   [ 2]  766 	btjf	0x5217, #0, 00101$
                                    767 ;	main.c: 410: I2C->DR = (uint8_t)(I2C_Slave_Address | (uint8_t)I2C_DIRECTION_RX); /* Send the Address + Direction */
      00851E 35 D1 52 16      [ 1]  768 	mov	0x5216+0, #0xd1
                                    769 ;	main.c: 412: I2C->SR1;
      008522 C6 52 17         [ 1]  770 	ld	a, 0x5217
                                    771 ;	main.c: 413: I2C->SR3;
      008525 C6 52 19         [ 1]  772 	ld	a, 0x5219
                                    773 ;	main.c: 414: while ((I2C->SR1 & I2C_SR1_ADDR) == 0)
      008528                        774 00104$:
      008528 72 03 52 17 FB   [ 2]  775 	btjf	0x5217, #1, 00104$
                                    776 ;	main.c: 416: while ((I2C->SR3 & (uint8_t)0x02) == SET)
      00852D                        777 00107$:
      00852D C6 52 19         [ 1]  778 	ld	a, 0x5219
      008530 A4 02            [ 1]  779 	and	a, #0x02
      008532 4A               [ 1]  780 	dec	a
      008533 27 F8            [ 1]  781 	jreq	00107$
                                    782 ;	main.c: 419: while ((I2C->SR1 & I2C_SR1_RXNE) == 0)
      008535                        783 00110$:
      008535 72 0D 52 17 FB   [ 2]  784 	btjf	0x5217, #6, 00110$
                                    785 ;	main.c: 421: AccXLSB = (uint8_t)I2C->DR;
      00853A C6 52 16         [ 1]  786 	ld	a, 0x5216
      00853D 5F               [ 1]  787 	clrw	x
      00853E 97               [ 1]  788 	ld	xl, a
      00853F CF 00 0D         [ 2]  789 	ldw	_AccXLSB+0, x
                                    790 ;	main.c: 422: I2C->CR2 |= (uint8_t)(I2C_CR2_ACK); /* Enable the acknowledgement */
      008542 72 14 52 11      [ 1]  791 	bset	0x5211, #2
                                    792 ;	main.c: 424: while ((I2C->SR1 & I2C_SR1_RXNE) == 0)
      008546                        793 00113$:
      008546 72 0D 52 17 FB   [ 2]  794 	btjf	0x5217, #6, 00113$
                                    795 ;	main.c: 426: AccXMSB = (uint8_t)I2C->DR;
      00854B C6 52 16         [ 1]  796 	ld	a, 0x5216
      00854E 5F               [ 1]  797 	clrw	x
      00854F 97               [ 1]  798 	ld	xl, a
      008550 CF 00 0F         [ 2]  799 	ldw	_AccXMSB+0, x
                                    800 ;	main.c: 427: I2C->CR2 |= (uint8_t)(I2C_CR2_ACK); /* Enable the acknowledgement */
      008553 72 14 52 11      [ 1]  801 	bset	0x5211, #2
                                    802 ;	main.c: 429: while ((I2C->SR1 & I2C_SR1_RXNE) == 0)
      008557                        803 00116$:
      008557 72 0D 52 17 FB   [ 2]  804 	btjf	0x5217, #6, 00116$
                                    805 ;	main.c: 431: AccYLSB = (uint8_t)I2C->DR;
      00855C C6 52 16         [ 1]  806 	ld	a, 0x5216
      00855F 5F               [ 1]  807 	clrw	x
      008560 97               [ 1]  808 	ld	xl, a
      008561 CF 00 11         [ 2]  809 	ldw	_AccYLSB+0, x
                                    810 ;	main.c: 432: I2C->CR2 |= (uint8_t)(I2C_CR2_ACK); /* Enable the acknowledgement */
      008564 72 14 52 11      [ 1]  811 	bset	0x5211, #2
                                    812 ;	main.c: 434: while ((I2C->SR1 & I2C_SR1_RXNE) == 0)
      008568                        813 00119$:
      008568 72 0D 52 17 FB   [ 2]  814 	btjf	0x5217, #6, 00119$
                                    815 ;	main.c: 436: AccYMSB = (uint8_t)I2C->DR;
      00856D C6 52 16         [ 1]  816 	ld	a, 0x5216
      008570 5F               [ 1]  817 	clrw	x
      008571 97               [ 1]  818 	ld	xl, a
      008572 CF 00 13         [ 2]  819 	ldw	_AccYMSB+0, x
                                    820 ;	main.c: 437: I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK); /* Enable the acknowledgement */
      008575 72 15 52 11      [ 1]  821 	bres	0x5211, #2
                                    822 ;	main.c: 439: I2C_stop();
      008579 CD 86 61         [ 4]  823 	call	_I2C_stop
                                    824 ;	main.c: 441: AccXLSB = (AccXLSB << 8) | AccXMSB; /*16 bit , 0-65535*/ /*0-1g, 0-9.8m/s^2*/
      00857C C6 00 0E         [ 1]  825 	ld	a, _AccXLSB+1
      00857F 0F 02            [ 1]  826 	clr	(0x02, sp)
      008581 CA 00 0F         [ 1]  827 	or	a, _AccXMSB+0
      008584 95               [ 1]  828 	ld	xh, a
      008585 7B 02            [ 1]  829 	ld	a, (0x02, sp)
      008587 CA 00 10         [ 1]  830 	or	a, _AccXMSB+1
      00858A 97               [ 1]  831 	ld	xl, a
      00858B CF 00 0D         [ 2]  832 	ldw	_AccXLSB+0, x
                                    833 ;	main.c: 442: AccYLSB = (AccYLSB << 8) | AccYMSB;
      00858E C6 00 12         [ 1]  834 	ld	a, _AccYLSB+1
      008591 0F 02            [ 1]  835 	clr	(0x02, sp)
      008593 CA 00 13         [ 1]  836 	or	a, _AccYMSB+0
      008596 95               [ 1]  837 	ld	xh, a
      008597 7B 02            [ 1]  838 	ld	a, (0x02, sp)
      008599 CA 00 14         [ 1]  839 	or	a, _AccYMSB+1
      00859C 97               [ 1]  840 	ld	xl, a
      00859D CF 00 11         [ 2]  841 	ldw	_AccYLSB+0, x
                                    842 ;	main.c: 444: AccX = (float)AccXLSB / 4096.0 - 0.04;
      0085A0 CE 00 0D         [ 2]  843 	ldw	x, _AccXLSB+0
      0085A3 CD 8D CF         [ 4]  844 	call	___sint2fs
      0085A6 4B 00            [ 1]  845 	push	#0x00
      0085A8 4B 00            [ 1]  846 	push	#0x00
      0085AA 4B 80            [ 1]  847 	push	#0x80
      0085AC 4B 45            [ 1]  848 	push	#0x45
      0085AE 89               [ 2]  849 	pushw	x
      0085AF 90 89            [ 2]  850 	pushw	y
      0085B1 CD 8F C2         [ 4]  851 	call	___fsdiv
      0085B4 4B 0A            [ 1]  852 	push	#0x0a
      0085B6 4B D7            [ 1]  853 	push	#0xd7
      0085B8 4B 23            [ 1]  854 	push	#0x23
      0085BA 4B 3D            [ 1]  855 	push	#0x3d
      0085BC 89               [ 2]  856 	pushw	x
      0085BD 90 89            [ 2]  857 	pushw	y
      0085BF CD 87 71         [ 4]  858 	call	___fssub
      0085C2 CF 00 03         [ 2]  859 	ldw	_AccX+2, x
      0085C5 90 CF 00 01      [ 2]  860 	ldw	_AccX+0, y
                                    861 ;	main.c: 445: AccY = (float)AccYLSB / 4096.0 + 0.01;
      0085C9 CE 00 11         [ 2]  862 	ldw	x, _AccYLSB+0
      0085CC CD 8D CF         [ 4]  863 	call	___sint2fs
      0085CF 4B 00            [ 1]  864 	push	#0x00
      0085D1 4B 00            [ 1]  865 	push	#0x00
      0085D3 4B 80            [ 1]  866 	push	#0x80
      0085D5 4B 45            [ 1]  867 	push	#0x45
      0085D7 89               [ 2]  868 	pushw	x
      0085D8 90 89            [ 2]  869 	pushw	y
      0085DA CD 8F C2         [ 4]  870 	call	___fsdiv
      0085DD 4B 0A            [ 1]  871 	push	#0x0a
      0085DF 4B D7            [ 1]  872 	push	#0xd7
      0085E1 4B 23            [ 1]  873 	push	#0x23
      0085E3 4B 3C            [ 1]  874 	push	#0x3c
      0085E5 89               [ 2]  875 	pushw	x
      0085E6 90 89            [ 2]  876 	pushw	y
      0085E8 CD 8A E2         [ 4]  877 	call	___fsadd
      0085EB CF 00 07         [ 2]  878 	ldw	_AccY+2, x
      0085EE 90 CF 00 05      [ 2]  879 	ldw	_AccY+0, y
                                    880 ;	main.c: 446: }
      0085F2 5B 02            [ 2]  881 	addw	sp, #2
      0085F4 81               [ 4]  882 	ret
                                    883 	.area CODE
                                    884 	.area CONST
      00802D                        885 _OLED_INIT_CMD:
      00802D A8                     886 	.db #0xa8	; 168
      00802E 1F                     887 	.db #0x1f	; 31
      00802F 22                     888 	.db #0x22	; 34
      008030 00                     889 	.db #0x00	; 0
      008031 03                     890 	.db #0x03	; 3
      008032 20                     891 	.db #0x20	; 32
      008033 00                     892 	.db #0x00	; 0
      008034 DA                     893 	.db #0xda	; 218
      008035 02                     894 	.db #0x02	; 2
      008036 8D                     895 	.db #0x8d	; 141
      008037 14                     896 	.db #0x14	; 20
      008038 AF                     897 	.db #0xaf	; 175
      008039 A1                     898 	.db #0xa1	; 161
      00803A C8                     899 	.db #0xc8	; 200
      00803B                        900 _OLED_FONT:
      00803B 00                     901 	.db #0x00	; 0
      00803C 00                     902 	.db #0x00	; 0
      00803D 00                     903 	.db #0x00	; 0
      00803E 00                     904 	.db #0x00	; 0
      00803F 00                     905 	.db #0x00	; 0
      008040 00                     906 	.db #0x00	; 0
      008041 00                     907 	.db #0x00	; 0
      008042 2F                     908 	.db #0x2f	; 47
      008043 00                     909 	.db #0x00	; 0
      008044 00                     910 	.db #0x00	; 0
      008045 00                     911 	.db #0x00	; 0
      008046 07                     912 	.db #0x07	; 7
      008047 00                     913 	.db #0x00	; 0
      008048 07                     914 	.db #0x07	; 7
      008049 00                     915 	.db #0x00	; 0
      00804A 14                     916 	.db #0x14	; 20
      00804B 7F                     917 	.db #0x7f	; 127
      00804C 14                     918 	.db #0x14	; 20
      00804D 7F                     919 	.db #0x7f	; 127
      00804E 14                     920 	.db #0x14	; 20
      00804F 24                     921 	.db #0x24	; 36
      008050 2A                     922 	.db #0x2a	; 42
      008051 7F                     923 	.db #0x7f	; 127
      008052 2A                     924 	.db #0x2a	; 42
      008053 12                     925 	.db #0x12	; 18
      008054 62                     926 	.db #0x62	; 98	'b'
      008055 64                     927 	.db #0x64	; 100	'd'
      008056 08                     928 	.db #0x08	; 8
      008057 13                     929 	.db #0x13	; 19
      008058 23                     930 	.db #0x23	; 35
      008059 36                     931 	.db #0x36	; 54	'6'
      00805A 49                     932 	.db #0x49	; 73	'I'
      00805B 55                     933 	.db #0x55	; 85	'U'
      00805C 22                     934 	.db #0x22	; 34
      00805D 50                     935 	.db #0x50	; 80	'P'
      00805E 00                     936 	.db #0x00	; 0
      00805F 05                     937 	.db #0x05	; 5
      008060 03                     938 	.db #0x03	; 3
      008061 00                     939 	.db #0x00	; 0
      008062 00                     940 	.db #0x00	; 0
      008063 00                     941 	.db #0x00	; 0
      008064 1C                     942 	.db #0x1c	; 28
      008065 22                     943 	.db #0x22	; 34
      008066 41                     944 	.db #0x41	; 65	'A'
      008067 00                     945 	.db #0x00	; 0
      008068 00                     946 	.db #0x00	; 0
      008069 41                     947 	.db #0x41	; 65	'A'
      00806A 22                     948 	.db #0x22	; 34
      00806B 1C                     949 	.db #0x1c	; 28
      00806C 00                     950 	.db #0x00	; 0
      00806D 14                     951 	.db #0x14	; 20
      00806E 08                     952 	.db #0x08	; 8
      00806F 3E                     953 	.db #0x3e	; 62
      008070 08                     954 	.db #0x08	; 8
      008071 14                     955 	.db #0x14	; 20
      008072 08                     956 	.db #0x08	; 8
      008073 08                     957 	.db #0x08	; 8
      008074 3E                     958 	.db #0x3e	; 62
      008075 08                     959 	.db #0x08	; 8
      008076 08                     960 	.db #0x08	; 8
      008077 00                     961 	.db #0x00	; 0
      008078 00                     962 	.db #0x00	; 0
      008079 A0                     963 	.db #0xa0	; 160
      00807A 60                     964 	.db #0x60	; 96
      00807B 00                     965 	.db #0x00	; 0
      00807C 08                     966 	.db #0x08	; 8
      00807D 08                     967 	.db #0x08	; 8
      00807E 08                     968 	.db #0x08	; 8
      00807F 08                     969 	.db #0x08	; 8
      008080 08                     970 	.db #0x08	; 8
      008081 00                     971 	.db #0x00	; 0
      008082 60                     972 	.db #0x60	; 96
      008083 60                     973 	.db #0x60	; 96
      008084 00                     974 	.db #0x00	; 0
      008085 00                     975 	.db #0x00	; 0
      008086 20                     976 	.db #0x20	; 32
      008087 10                     977 	.db #0x10	; 16
      008088 08                     978 	.db #0x08	; 8
      008089 04                     979 	.db #0x04	; 4
      00808A 02                     980 	.db #0x02	; 2
      00808B 3E                     981 	.db #0x3e	; 62
      00808C 51                     982 	.db #0x51	; 81	'Q'
      00808D 49                     983 	.db #0x49	; 73	'I'
      00808E 45                     984 	.db #0x45	; 69	'E'
      00808F 3E                     985 	.db #0x3e	; 62
      008090 00                     986 	.db #0x00	; 0
      008091 42                     987 	.db #0x42	; 66	'B'
      008092 7F                     988 	.db #0x7f	; 127
      008093 40                     989 	.db #0x40	; 64
      008094 00                     990 	.db #0x00	; 0
      008095 42                     991 	.db #0x42	; 66	'B'
      008096 61                     992 	.db #0x61	; 97	'a'
      008097 51                     993 	.db #0x51	; 81	'Q'
      008098 49                     994 	.db #0x49	; 73	'I'
      008099 46                     995 	.db #0x46	; 70	'F'
      00809A 21                     996 	.db #0x21	; 33
      00809B 41                     997 	.db #0x41	; 65	'A'
      00809C 45                     998 	.db #0x45	; 69	'E'
      00809D 4B                     999 	.db #0x4b	; 75	'K'
      00809E 31                    1000 	.db #0x31	; 49	'1'
      00809F 18                    1001 	.db #0x18	; 24
      0080A0 14                    1002 	.db #0x14	; 20
      0080A1 12                    1003 	.db #0x12	; 18
      0080A2 7F                    1004 	.db #0x7f	; 127
      0080A3 10                    1005 	.db #0x10	; 16
      0080A4 27                    1006 	.db #0x27	; 39
      0080A5 45                    1007 	.db #0x45	; 69	'E'
      0080A6 45                    1008 	.db #0x45	; 69	'E'
      0080A7 45                    1009 	.db #0x45	; 69	'E'
      0080A8 39                    1010 	.db #0x39	; 57	'9'
      0080A9 3C                    1011 	.db #0x3c	; 60
      0080AA 4A                    1012 	.db #0x4a	; 74	'J'
      0080AB 49                    1013 	.db #0x49	; 73	'I'
      0080AC 49                    1014 	.db #0x49	; 73	'I'
      0080AD 30                    1015 	.db #0x30	; 48	'0'
      0080AE 01                    1016 	.db #0x01	; 1
      0080AF 71                    1017 	.db #0x71	; 113	'q'
      0080B0 09                    1018 	.db #0x09	; 9
      0080B1 05                    1019 	.db #0x05	; 5
      0080B2 03                    1020 	.db #0x03	; 3
      0080B3 36                    1021 	.db #0x36	; 54	'6'
      0080B4 49                    1022 	.db #0x49	; 73	'I'
      0080B5 49                    1023 	.db #0x49	; 73	'I'
      0080B6 49                    1024 	.db #0x49	; 73	'I'
      0080B7 36                    1025 	.db #0x36	; 54	'6'
      0080B8 06                    1026 	.db #0x06	; 6
      0080B9 49                    1027 	.db #0x49	; 73	'I'
      0080BA 49                    1028 	.db #0x49	; 73	'I'
      0080BB 29                    1029 	.db #0x29	; 41
      0080BC 1E                    1030 	.db #0x1e	; 30
      0080BD 00                    1031 	.db #0x00	; 0
      0080BE 36                    1032 	.db #0x36	; 54	'6'
      0080BF 36                    1033 	.db #0x36	; 54	'6'
      0080C0 00                    1034 	.db #0x00	; 0
      0080C1 00                    1035 	.db #0x00	; 0
      0080C2 00                    1036 	.db #0x00	; 0
      0080C3 56                    1037 	.db #0x56	; 86	'V'
      0080C4 36                    1038 	.db #0x36	; 54	'6'
      0080C5 00                    1039 	.db #0x00	; 0
      0080C6 00                    1040 	.db #0x00	; 0
      0080C7 08                    1041 	.db #0x08	; 8
      0080C8 14                    1042 	.db #0x14	; 20
      0080C9 22                    1043 	.db #0x22	; 34
      0080CA 41                    1044 	.db #0x41	; 65	'A'
      0080CB 00                    1045 	.db #0x00	; 0
      0080CC 14                    1046 	.db #0x14	; 20
      0080CD 14                    1047 	.db #0x14	; 20
      0080CE 14                    1048 	.db #0x14	; 20
      0080CF 14                    1049 	.db #0x14	; 20
      0080D0 14                    1050 	.db #0x14	; 20
      0080D1 00                    1051 	.db #0x00	; 0
      0080D2 41                    1052 	.db #0x41	; 65	'A'
      0080D3 22                    1053 	.db #0x22	; 34
      0080D4 14                    1054 	.db #0x14	; 20
      0080D5 08                    1055 	.db #0x08	; 8
      0080D6 02                    1056 	.db #0x02	; 2
      0080D7 01                    1057 	.db #0x01	; 1
      0080D8 51                    1058 	.db #0x51	; 81	'Q'
      0080D9 09                    1059 	.db #0x09	; 9
      0080DA 06                    1060 	.db #0x06	; 6
      0080DB 32                    1061 	.db #0x32	; 50	'2'
      0080DC 49                    1062 	.db #0x49	; 73	'I'
      0080DD 59                    1063 	.db #0x59	; 89	'Y'
      0080DE 51                    1064 	.db #0x51	; 81	'Q'
      0080DF 3E                    1065 	.db #0x3e	; 62
      0080E0 7C                    1066 	.db #0x7c	; 124
      0080E1 12                    1067 	.db #0x12	; 18
      0080E2 11                    1068 	.db #0x11	; 17
      0080E3 12                    1069 	.db #0x12	; 18
      0080E4 7C                    1070 	.db #0x7c	; 124
      0080E5 7F                    1071 	.db #0x7f	; 127
      0080E6 49                    1072 	.db #0x49	; 73	'I'
      0080E7 49                    1073 	.db #0x49	; 73	'I'
      0080E8 49                    1074 	.db #0x49	; 73	'I'
      0080E9 36                    1075 	.db #0x36	; 54	'6'
      0080EA 3E                    1076 	.db #0x3e	; 62
      0080EB 41                    1077 	.db #0x41	; 65	'A'
      0080EC 41                    1078 	.db #0x41	; 65	'A'
      0080ED 41                    1079 	.db #0x41	; 65	'A'
      0080EE 22                    1080 	.db #0x22	; 34
      0080EF 7F                    1081 	.db #0x7f	; 127
      0080F0 41                    1082 	.db #0x41	; 65	'A'
      0080F1 41                    1083 	.db #0x41	; 65	'A'
      0080F2 22                    1084 	.db #0x22	; 34
      0080F3 1C                    1085 	.db #0x1c	; 28
      0080F4 7F                    1086 	.db #0x7f	; 127
      0080F5 49                    1087 	.db #0x49	; 73	'I'
      0080F6 49                    1088 	.db #0x49	; 73	'I'
      0080F7 49                    1089 	.db #0x49	; 73	'I'
      0080F8 41                    1090 	.db #0x41	; 65	'A'
      0080F9 7F                    1091 	.db #0x7f	; 127
      0080FA 09                    1092 	.db #0x09	; 9
      0080FB 09                    1093 	.db #0x09	; 9
      0080FC 09                    1094 	.db #0x09	; 9
      0080FD 01                    1095 	.db #0x01	; 1
      0080FE 3E                    1096 	.db #0x3e	; 62
      0080FF 41                    1097 	.db #0x41	; 65	'A'
      008100 49                    1098 	.db #0x49	; 73	'I'
      008101 49                    1099 	.db #0x49	; 73	'I'
      008102 7A                    1100 	.db #0x7a	; 122	'z'
      008103 7F                    1101 	.db #0x7f	; 127
      008104 08                    1102 	.db #0x08	; 8
      008105 08                    1103 	.db #0x08	; 8
      008106 08                    1104 	.db #0x08	; 8
      008107 7F                    1105 	.db #0x7f	; 127
      008108 00                    1106 	.db #0x00	; 0
      008109 41                    1107 	.db #0x41	; 65	'A'
      00810A 7F                    1108 	.db #0x7f	; 127
      00810B 41                    1109 	.db #0x41	; 65	'A'
      00810C 00                    1110 	.db #0x00	; 0
      00810D 20                    1111 	.db #0x20	; 32
      00810E 40                    1112 	.db #0x40	; 64
      00810F 41                    1113 	.db #0x41	; 65	'A'
      008110 3F                    1114 	.db #0x3f	; 63
      008111 01                    1115 	.db #0x01	; 1
      008112 7F                    1116 	.db #0x7f	; 127
      008113 08                    1117 	.db #0x08	; 8
      008114 14                    1118 	.db #0x14	; 20
      008115 22                    1119 	.db #0x22	; 34
      008116 41                    1120 	.db #0x41	; 65	'A'
      008117 7F                    1121 	.db #0x7f	; 127
      008118 40                    1122 	.db #0x40	; 64
      008119 40                    1123 	.db #0x40	; 64
      00811A 40                    1124 	.db #0x40	; 64
      00811B 40                    1125 	.db #0x40	; 64
      00811C 7F                    1126 	.db #0x7f	; 127
      00811D 02                    1127 	.db #0x02	; 2
      00811E 0C                    1128 	.db #0x0c	; 12
      00811F 02                    1129 	.db #0x02	; 2
      008120 7F                    1130 	.db #0x7f	; 127
      008121 7F                    1131 	.db #0x7f	; 127
      008122 04                    1132 	.db #0x04	; 4
      008123 08                    1133 	.db #0x08	; 8
      008124 10                    1134 	.db #0x10	; 16
      008125 7F                    1135 	.db #0x7f	; 127
      008126 3E                    1136 	.db #0x3e	; 62
      008127 41                    1137 	.db #0x41	; 65	'A'
      008128 41                    1138 	.db #0x41	; 65	'A'
      008129 41                    1139 	.db #0x41	; 65	'A'
      00812A 3E                    1140 	.db #0x3e	; 62
      00812B 7F                    1141 	.db #0x7f	; 127
      00812C 09                    1142 	.db #0x09	; 9
      00812D 09                    1143 	.db #0x09	; 9
      00812E 09                    1144 	.db #0x09	; 9
      00812F 06                    1145 	.db #0x06	; 6
      008130 3E                    1146 	.db #0x3e	; 62
      008131 41                    1147 	.db #0x41	; 65	'A'
      008132 51                    1148 	.db #0x51	; 81	'Q'
      008133 21                    1149 	.db #0x21	; 33
      008134 5E                    1150 	.db #0x5e	; 94
      008135 7F                    1151 	.db #0x7f	; 127
      008136 09                    1152 	.db #0x09	; 9
      008137 19                    1153 	.db #0x19	; 25
      008138 29                    1154 	.db #0x29	; 41
      008139 46                    1155 	.db #0x46	; 70	'F'
      00813A 46                    1156 	.db #0x46	; 70	'F'
      00813B 49                    1157 	.db #0x49	; 73	'I'
      00813C 49                    1158 	.db #0x49	; 73	'I'
      00813D 49                    1159 	.db #0x49	; 73	'I'
      00813E 31                    1160 	.db #0x31	; 49	'1'
      00813F 01                    1161 	.db #0x01	; 1
      008140 01                    1162 	.db #0x01	; 1
      008141 7F                    1163 	.db #0x7f	; 127
      008142 01                    1164 	.db #0x01	; 1
      008143 01                    1165 	.db #0x01	; 1
      008144 3F                    1166 	.db #0x3f	; 63
      008145 40                    1167 	.db #0x40	; 64
      008146 40                    1168 	.db #0x40	; 64
      008147 40                    1169 	.db #0x40	; 64
      008148 3F                    1170 	.db #0x3f	; 63
      008149 1F                    1171 	.db #0x1f	; 31
      00814A 20                    1172 	.db #0x20	; 32
      00814B 40                    1173 	.db #0x40	; 64
      00814C 20                    1174 	.db #0x20	; 32
      00814D 1F                    1175 	.db #0x1f	; 31
      00814E 3F                    1176 	.db #0x3f	; 63
      00814F 40                    1177 	.db #0x40	; 64
      008150 38                    1178 	.db #0x38	; 56	'8'
      008151 40                    1179 	.db #0x40	; 64
      008152 3F                    1180 	.db #0x3f	; 63
      008153 63                    1181 	.db #0x63	; 99	'c'
      008154 14                    1182 	.db #0x14	; 20
      008155 08                    1183 	.db #0x08	; 8
      008156 14                    1184 	.db #0x14	; 20
      008157 63                    1185 	.db #0x63	; 99	'c'
      008158 07                    1186 	.db #0x07	; 7
      008159 08                    1187 	.db #0x08	; 8
      00815A 70                    1188 	.db #0x70	; 112	'p'
      00815B 08                    1189 	.db #0x08	; 8
      00815C 07                    1190 	.db #0x07	; 7
      00815D 61                    1191 	.db #0x61	; 97	'a'
      00815E 51                    1192 	.db #0x51	; 81	'Q'
      00815F 49                    1193 	.db #0x49	; 73	'I'
      008160 45                    1194 	.db #0x45	; 69	'E'
      008161 43                    1195 	.db #0x43	; 67	'C'
      008162 00                    1196 	.db #0x00	; 0
      008163 7F                    1197 	.db #0x7f	; 127
      008164 41                    1198 	.db #0x41	; 65	'A'
      008165 41                    1199 	.db #0x41	; 65	'A'
      008166 00                    1200 	.db #0x00	; 0
      008167 02                    1201 	.db #0x02	; 2
      008168 04                    1202 	.db #0x04	; 4
      008169 08                    1203 	.db #0x08	; 8
      00816A 10                    1204 	.db #0x10	; 16
      00816B 20                    1205 	.db #0x20	; 32
      00816C 00                    1206 	.db #0x00	; 0
      00816D 41                    1207 	.db #0x41	; 65	'A'
      00816E 41                    1208 	.db #0x41	; 65	'A'
      00816F 7F                    1209 	.db #0x7f	; 127
      008170 00                    1210 	.db #0x00	; 0
      008171 04                    1211 	.db #0x04	; 4
      008172 02                    1212 	.db #0x02	; 2
      008173 01                    1213 	.db #0x01	; 1
      008174 02                    1214 	.db #0x02	; 2
      008175 04                    1215 	.db #0x04	; 4
      008176 40                    1216 	.db #0x40	; 64
      008177 40                    1217 	.db #0x40	; 64
      008178 40                    1218 	.db #0x40	; 64
      008179 40                    1219 	.db #0x40	; 64
      00817A 40                    1220 	.db #0x40	; 64
      00817B 00                    1221 	.db #0x00	; 0
      00817C 60                    1222 	.db #0x60	; 96
      00817D 60                    1223 	.db #0x60	; 96
      00817E 00                    1224 	.db #0x00	; 0
      00817F 00                    1225 	.db #0x00	; 0
                                   1226 	.area INITIALIZER
      008180                       1227 __xinit__Steps:
      008180 00                    1228 	.db #0x00	; 0
      008181                       1229 __xinit__Threshold:
      008181 40 A0 00 00           1230 	.byte #0x40, #0xa0, #0x00, #0x00	;  5.000000e+00
      008185                       1231 __xinit__Mode:
      008185 00                    1232 	.db #0x00	; 0
                                   1233 	.area CABS (ABS)
