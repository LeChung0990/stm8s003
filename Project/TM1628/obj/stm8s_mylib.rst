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
                                     11 	.globl _TM1628_SEND_CONFIG
                                     12 	.globl _TM1628_SEND_COMMAND
                                     13 	.globl _SEND_WRITE
                                     14 	.globl _SEND_START
                                     15 	.globl _SEND_STOP
                                     16 	.globl _TIM4_ClearFlag
                                     17 	.globl _TIM4_GetFlagStatus
                                     18 	.globl _TIM4_SetCounter
                                     19 	.globl _TIM4_ITConfig
                                     20 	.globl _TIM4_Cmd
                                     21 	.globl _TIM4_TimeBaseInit
                                     22 	.globl _TIM4_DeInit
                                     23 	.globl _GPIO_WriteLow
                                     24 	.globl _GPIO_WriteHigh
                                     25 	.globl _GPIO_Init
                                     26 	.globl _delay_config
                                     27 	.globl _delay_ms
                                     28 	.globl _delay_us
                                     29 	.globl _TM1628_INIT
                                     30 	.globl _TM1628_DISPLAY_SEGMENTS
                                     31 	.globl _Write_EEPROM
                                     32 	.globl _Read_EEPROM
                                     33 ;--------------------------------------------------------
                                     34 ; ram data
                                     35 ;--------------------------------------------------------
                                     36 	.area DATA
                                     37 ;--------------------------------------------------------
                                     38 ; ram data
                                     39 ;--------------------------------------------------------
                                     40 	.area INITIALIZED
      000014                         41 __config:
      000014                         42 	.ds 1
      000015                         43 __segments:
      000015                         44 	.ds 1
                                     45 ;--------------------------------------------------------
                                     46 ; absolute external ram data
                                     47 ;--------------------------------------------------------
                                     48 	.area DABS (ABS)
                                     49 
                                     50 ; default segment ordering for linker
                                     51 	.area HOME
                                     52 	.area GSINIT
                                     53 	.area GSFINAL
                                     54 	.area CONST
                                     55 	.area INITIALIZER
                                     56 	.area CODE
                                     57 
                                     58 ;--------------------------------------------------------
                                     59 ; global & static initialisations
                                     60 ;--------------------------------------------------------
                                     61 	.area HOME
                                     62 	.area GSINIT
                                     63 	.area GSFINAL
                                     64 	.area GSINIT
                                     65 ;--------------------------------------------------------
                                     66 ; Home
                                     67 ;--------------------------------------------------------
                                     68 	.area HOME
                                     69 	.area HOME
                                     70 ;--------------------------------------------------------
                                     71 ; code
                                     72 ;--------------------------------------------------------
                                     73 	.area CODE
                                     74 ;	lib/src/stm8s_mylib.c: 24: void delay_config(void){
                                     75 ;	-----------------------------------------
                                     76 ;	 function delay_config
                                     77 ;	-----------------------------------------
      00823C                         78 _delay_config:
                                     79 ;	lib/src/stm8s_mylib.c: 25: TIM4_DeInit();
      00823C CD 85 3F         [ 4]   80 	call	_TIM4_DeInit
                                     81 ;	lib/src/stm8s_mylib.c: 26: TIM4_TimeBaseInit(TIM4_PRESCALER_128, 125 - 1);
      00823F 4B 7C            [ 1]   82 	push	#0x7c
      008241 A6 07            [ 1]   83 	ld	a, #0x07
      008243 CD 85 58         [ 4]   84 	call	_TIM4_TimeBaseInit
                                     85 ;	lib/src/stm8s_mylib.c: 27: TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
      008246 4B 01            [ 1]   86 	push	#0x01
      008248 A6 01            [ 1]   87 	ld	a, #0x01
      00824A CD 85 7C         [ 4]   88 	call	_TIM4_ITConfig
                                     89 ;	lib/src/stm8s_mylib.c: 28: TIM4_ClearFlag(TIM4_FLAG_UPDATE);
      00824D A6 01            [ 1]   90 	ld	a, #0x01
      00824F CD 86 29         [ 4]   91 	call	_TIM4_ClearFlag
                                     92 ;	lib/src/stm8s_mylib.c: 29: TIM4_Cmd(DISABLE);
      008252 4F               [ 1]   93 	clr	a
      008253 CD 85 64         [ 4]   94 	call	_TIM4_Cmd
                                     95 ;	lib/src/stm8s_mylib.c: 30: enableInterrupts();
      008256 9A               [ 1]   96 	rim
                                     97 ;	lib/src/stm8s_mylib.c: 31: }
      008257 81               [ 4]   98 	ret
                                     99 ;	lib/src/stm8s_mylib.c: 32: void delay_ms(unsigned int  u16Delay)
                                    100 ;	-----------------------------------------
                                    101 ;	 function delay_ms
                                    102 ;	-----------------------------------------
      008258                        103 _delay_ms:
      008258 52 02            [ 2]  104 	sub	sp, #2
                                    105 ;	lib/src/stm8s_mylib.c: 34: while (u16Delay) {
      00825A 1F 01            [ 2]  106 	ldw	(0x01, sp), x
      00825C                        107 00104$:
      00825C 1E 01            [ 2]  108 	ldw	x, (0x01, sp)
      00825E 27 18            [ 1]  109 	jreq	00107$
                                    110 ;	lib/src/stm8s_mylib.c: 35: TIM4_SetCounter(0);
      008260 4F               [ 1]  111 	clr	a
      008261 CD 86 09         [ 4]  112 	call	_TIM4_SetCounter
                                    113 ;	lib/src/stm8s_mylib.c: 36: TIM4_ClearFlag(TIM4_FLAG_UPDATE);
      008264 A6 01            [ 1]  114 	ld	a, #0x01
      008266 CD 86 29         [ 4]  115 	call	_TIM4_ClearFlag
                                    116 ;	lib/src/stm8s_mylib.c: 37: while (TIM4_GetFlagStatus(TIM4_FLAG_UPDATE) == RESET) {
      008269                        117 00101$:
      008269 A6 01            [ 1]  118 	ld	a, #0x01
      00826B CD 86 19         [ 4]  119 	call	_TIM4_GetFlagStatus
      00826E 4D               [ 1]  120 	tnz	a
      00826F 27 F8            [ 1]  121 	jreq	00101$
                                    122 ;	lib/src/stm8s_mylib.c: 39: --u16Delay;
      008271 1E 01            [ 2]  123 	ldw	x, (0x01, sp)
      008273 5A               [ 2]  124 	decw	x
      008274 1F 01            [ 2]  125 	ldw	(0x01, sp), x
      008276 20 E4            [ 2]  126 	jra	00104$
      008278                        127 00107$:
                                    128 ;	lib/src/stm8s_mylib.c: 41: }
      008278 5B 02            [ 2]  129 	addw	sp, #2
      00827A 81               [ 4]  130 	ret
                                    131 ;	lib/src/stm8s_mylib.c: 43: void delay_us(unsigned long int  us) {
                                    132 ;	-----------------------------------------
                                    133 ;	 function delay_us
                                    134 ;	-----------------------------------------
      00827B                        135 _delay_us:
                                    136 ;	lib/src/stm8s_mylib.c: 44: for(;us > 0; us--) nop();
      00827B 1E 05            [ 2]  137 	ldw	x, (0x05, sp)
      00827D 16 03            [ 2]  138 	ldw	y, (0x03, sp)
      00827F                        139 00103$:
      00827F 5D               [ 2]  140 	tnzw	x
      008280 26 04            [ 1]  141 	jrne	00120$
      008282 90 5D            [ 2]  142 	tnzw	y
      008284 27 0A            [ 1]  143 	jreq	00105$
      008286                        144 00120$:
      008286 9D               [ 1]  145 	nop
      008287 1D 00 01         [ 2]  146 	subw	x, #0x0001
      00828A 24 F3            [ 1]  147 	jrnc	00103$
      00828C 90 5A            [ 2]  148 	decw	y
      00828E 20 EF            [ 2]  149 	jra	00103$
      008290                        150 00105$:
                                    151 ;	lib/src/stm8s_mylib.c: 45: }
      008290 1E 01            [ 2]  152 	ldw	x, (1, sp)
      008292 5B 06            [ 2]  153 	addw	sp, #6
      008294 FC               [ 2]  154 	jp	(x)
                                    155 ;	lib/src/stm8s_mylib.c: 47: void SEND_STOP(void)
                                    156 ;	-----------------------------------------
                                    157 ;	 function SEND_STOP
                                    158 ;	-----------------------------------------
      008295                        159 _SEND_STOP:
                                    160 ;	lib/src/stm8s_mylib.c: 49: STB_1;
      008295 A6 08            [ 1]  161 	ld	a, #0x08
      008297 AE 50 00         [ 2]  162 	ldw	x, #0x5000
      00829A CD 84 F5         [ 4]  163 	call	_GPIO_WriteHigh
                                    164 ;	lib/src/stm8s_mylib.c: 50: DIO_0; TM_DELAY;  
      00829D A6 20            [ 1]  165 	ld	a, #0x20
      00829F AE 50 0F         [ 2]  166 	ldw	x, #0x500f
      0082A2 CD 84 FE         [ 4]  167 	call	_GPIO_WriteLow
      0082A5 4B 64            [ 1]  168 	push	#0x64
      0082A7 5F               [ 1]  169 	clrw	x
      0082A8 89               [ 2]  170 	pushw	x
      0082A9 4B 00            [ 1]  171 	push	#0x00
      0082AB CD 82 7B         [ 4]  172 	call	_delay_us
                                    173 ;	lib/src/stm8s_mylib.c: 51: CLK_1; TM_DELAY;
      0082AE A6 40            [ 1]  174 	ld	a, #0x40
      0082B0 AE 50 0F         [ 2]  175 	ldw	x, #0x500f
      0082B3 CD 84 F5         [ 4]  176 	call	_GPIO_WriteHigh
      0082B6 4B 64            [ 1]  177 	push	#0x64
      0082B8 5F               [ 1]  178 	clrw	x
      0082B9 89               [ 2]  179 	pushw	x
      0082BA 4B 00            [ 1]  180 	push	#0x00
      0082BC CD 82 7B         [ 4]  181 	call	_delay_us
                                    182 ;	lib/src/stm8s_mylib.c: 52: DIO_1; TM_DELAY;
      0082BF A6 20            [ 1]  183 	ld	a, #0x20
      0082C1 AE 50 0F         [ 2]  184 	ldw	x, #0x500f
      0082C4 CD 84 F5         [ 4]  185 	call	_GPIO_WriteHigh
      0082C7 4B 64            [ 1]  186 	push	#0x64
      0082C9 5F               [ 1]  187 	clrw	x
      0082CA 89               [ 2]  188 	pushw	x
      0082CB 4B 00            [ 1]  189 	push	#0x00
      0082CD CD 82 7B         [ 4]  190 	call	_delay_us
                                    191 ;	lib/src/stm8s_mylib.c: 53: }
      0082D0 81               [ 4]  192 	ret
                                    193 ;	lib/src/stm8s_mylib.c: 54: void SEND_START(void)
                                    194 ;	-----------------------------------------
                                    195 ;	 function SEND_START
                                    196 ;	-----------------------------------------
      0082D1                        197 _SEND_START:
                                    198 ;	lib/src/stm8s_mylib.c: 57: CLK_1; TM_DELAY;
      0082D1 A6 40            [ 1]  199 	ld	a, #0x40
      0082D3 AE 50 0F         [ 2]  200 	ldw	x, #0x500f
      0082D6 CD 84 F5         [ 4]  201 	call	_GPIO_WriteHigh
      0082D9 4B 64            [ 1]  202 	push	#0x64
      0082DB 5F               [ 1]  203 	clrw	x
      0082DC 89               [ 2]  204 	pushw	x
      0082DD 4B 00            [ 1]  205 	push	#0x00
      0082DF CD 82 7B         [ 4]  206 	call	_delay_us
                                    207 ;	lib/src/stm8s_mylib.c: 58: DIO_1; TM_DELAY;
      0082E2 A6 20            [ 1]  208 	ld	a, #0x20
      0082E4 AE 50 0F         [ 2]  209 	ldw	x, #0x500f
      0082E7 CD 84 F5         [ 4]  210 	call	_GPIO_WriteHigh
      0082EA 4B 64            [ 1]  211 	push	#0x64
      0082EC 5F               [ 1]  212 	clrw	x
      0082ED 89               [ 2]  213 	pushw	x
      0082EE 4B 00            [ 1]  214 	push	#0x00
      0082F0 CD 82 7B         [ 4]  215 	call	_delay_us
                                    216 ;	lib/src/stm8s_mylib.c: 59: STB_0;
      0082F3 A6 08            [ 1]  217 	ld	a, #0x08
      0082F5 AE 50 00         [ 2]  218 	ldw	x, #0x5000
      0082F8 CD 84 FE         [ 4]  219 	call	_GPIO_WriteLow
                                    220 ;	lib/src/stm8s_mylib.c: 60: DIO_0; TM_DELAY;
      0082FB A6 20            [ 1]  221 	ld	a, #0x20
      0082FD AE 50 0F         [ 2]  222 	ldw	x, #0x500f
      008300 CD 84 FE         [ 4]  223 	call	_GPIO_WriteLow
      008303 4B 64            [ 1]  224 	push	#0x64
      008305 5F               [ 1]  225 	clrw	x
      008306 89               [ 2]  226 	pushw	x
      008307 4B 00            [ 1]  227 	push	#0x00
      008309 CD 82 7B         [ 4]  228 	call	_delay_us
                                    229 ;	lib/src/stm8s_mylib.c: 61: CLK_0; TM_DELAY;
      00830C A6 40            [ 1]  230 	ld	a, #0x40
      00830E AE 50 0F         [ 2]  231 	ldw	x, #0x500f
      008311 CD 84 FE         [ 4]  232 	call	_GPIO_WriteLow
      008314 4B 64            [ 1]  233 	push	#0x64
      008316 5F               [ 1]  234 	clrw	x
      008317 89               [ 2]  235 	pushw	x
      008318 4B 00            [ 1]  236 	push	#0x00
      00831A CD 82 7B         [ 4]  237 	call	_delay_us
                                    238 ;	lib/src/stm8s_mylib.c: 62: }
      00831D 81               [ 4]  239 	ret
                                    240 ;	lib/src/stm8s_mylib.c: 64: void SEND_WRITE(unsigned char data)
                                    241 ;	-----------------------------------------
                                    242 ;	 function SEND_WRITE
                                    243 ;	-----------------------------------------
      00831E                        244 _SEND_WRITE:
      00831E 52 02            [ 2]  245 	sub	sp, #2
      008320 6B 01            [ 1]  246 	ld	(0x01, sp), a
                                    247 ;	lib/src/stm8s_mylib.c: 67: for (i = 0; i < 8; ++i)
      008322 0F 02            [ 1]  248 	clr	(0x02, sp)
      008324                        249 00105$:
                                    250 ;	lib/src/stm8s_mylib.c: 69: if (data & 0x01) {DIO_1;}
      008324 7B 01            [ 1]  251 	ld	a, (0x01, sp)
      008326 44               [ 1]  252 	srl	a
      008327 24 0A            [ 1]  253 	jrnc	00102$
      008329 A6 20            [ 1]  254 	ld	a, #0x20
      00832B AE 50 0F         [ 2]  255 	ldw	x, #0x500f
      00832E CD 84 F5         [ 4]  256 	call	_GPIO_WriteHigh
      008331 20 08            [ 2]  257 	jra	00103$
      008333                        258 00102$:
                                    259 ;	lib/src/stm8s_mylib.c: 70: else {DIO_0;}
      008333 A6 20            [ 1]  260 	ld	a, #0x20
      008335 AE 50 0F         [ 2]  261 	ldw	x, #0x500f
      008338 CD 84 FE         [ 4]  262 	call	_GPIO_WriteLow
      00833B                        263 00103$:
                                    264 ;	lib/src/stm8s_mylib.c: 71: TM_DELAY;	
      00833B 4B 64            [ 1]  265 	push	#0x64
      00833D 5F               [ 1]  266 	clrw	x
      00833E 89               [ 2]  267 	pushw	x
      00833F 4B 00            [ 1]  268 	push	#0x00
      008341 CD 82 7B         [ 4]  269 	call	_delay_us
                                    270 ;	lib/src/stm8s_mylib.c: 72: CLK_1;
      008344 A6 40            [ 1]  271 	ld	a, #0x40
      008346 AE 50 0F         [ 2]  272 	ldw	x, #0x500f
      008349 CD 84 F5         [ 4]  273 	call	_GPIO_WriteHigh
                                    274 ;	lib/src/stm8s_mylib.c: 73: TM_DELAY;
      00834C 4B 64            [ 1]  275 	push	#0x64
      00834E 5F               [ 1]  276 	clrw	x
      00834F 89               [ 2]  277 	pushw	x
      008350 4B 00            [ 1]  278 	push	#0x00
      008352 CD 82 7B         [ 4]  279 	call	_delay_us
                                    280 ;	lib/src/stm8s_mylib.c: 74: CLK_0;
      008355 A6 40            [ 1]  281 	ld	a, #0x40
      008357 AE 50 0F         [ 2]  282 	ldw	x, #0x500f
      00835A CD 84 FE         [ 4]  283 	call	_GPIO_WriteLow
                                    284 ;	lib/src/stm8s_mylib.c: 75: data >>= 1;
      00835D 04 01            [ 1]  285 	srl	(0x01, sp)
                                    286 ;	lib/src/stm8s_mylib.c: 67: for (i = 0; i < 8; ++i)
      00835F 0C 02            [ 1]  287 	inc	(0x02, sp)
      008361 7B 02            [ 1]  288 	ld	a, (0x02, sp)
      008363 A1 08            [ 1]  289 	cp	a, #0x08
      008365 25 BD            [ 1]  290 	jrc	00105$
                                    291 ;	lib/src/stm8s_mylib.c: 77: }
      008367 5B 02            [ 2]  292 	addw	sp, #2
      008369 81               [ 4]  293 	ret
                                    294 ;	lib/src/stm8s_mylib.c: 78: void TM1628_SEND_COMMAND(const unsigned char value)
                                    295 ;	-----------------------------------------
                                    296 ;	 function TM1628_SEND_COMMAND
                                    297 ;	-----------------------------------------
      00836A                        298 _TM1628_SEND_COMMAND:
                                    299 ;	lib/src/stm8s_mylib.c: 80: SEND_START();
      00836A 88               [ 1]  300 	push	a
      00836B CD 82 D1         [ 4]  301 	call	_SEND_START
      00836E 84               [ 1]  302 	pop	a
                                    303 ;	lib/src/stm8s_mylib.c: 81: SEND_WRITE(value);
      00836F CD 83 1E         [ 4]  304 	call	_SEND_WRITE
                                    305 ;	lib/src/stm8s_mylib.c: 82: SEND_STOP();
      008372 CD 82 95         [ 4]  306 	call	_SEND_STOP
                                    307 ;	lib/src/stm8s_mylib.c: 83: TM_DELAY;
      008375 4B 64            [ 1]  308 	push	#0x64
      008377 5F               [ 1]  309 	clrw	x
      008378 89               [ 2]  310 	pushw	x
      008379 4B 00            [ 1]  311 	push	#0x00
      00837B CD 82 7B         [ 4]  312 	call	_delay_us
                                    313 ;	lib/src/stm8s_mylib.c: 84: }
      00837E 81               [ 4]  314 	ret
                                    315 ;	lib/src/stm8s_mylib.c: 86: void TM1628_SEND_CONFIG(const unsigned char enable, const unsigned char brightness)
                                    316 ;	-----------------------------------------
                                    317 ;	 function TM1628_SEND_CONFIG
                                    318 ;	-----------------------------------------
      00837F                        319 _TM1628_SEND_CONFIG:
      00837F 52 02            [ 2]  320 	sub	sp, #2
                                    321 ;	lib/src/stm8s_mylib.c: 88: TM1628_SEND_COMMAND(TM1628_CMD_MODE_DIS_2);
      008381 88               [ 1]  322 	push	a
      008382 A6 03            [ 1]  323 	ld	a, #0x03
      008384 CD 83 6A         [ 4]  324 	call	_TM1628_SEND_COMMAND
      008387 84               [ 1]  325 	pop	a
                                    326 ;	lib/src/stm8s_mylib.c: 89: _config = (enable ? TM1628_SET_DISPLAY_ON : TM1628_SET_DISPLAY_OFF) |
      008388 4D               [ 1]  327 	tnz	a
      008389 27 04            [ 1]  328 	jreq	00103$
      00838B AE 00 08         [ 2]  329 	ldw	x, #0x0008
      00838E 21                     330 	.byte 0x21
      00838F                        331 00103$:
      00838F 5F               [ 1]  332 	clrw	x
      008390                        333 00104$:
                                    334 ;	lib/src/stm8s_mylib.c: 90: (brightness > TM1628_BRIGHTNESS_MAX ? TM1628_BRIGHTNESS_MAX : brightness);
      008390 7B 05            [ 1]  335 	ld	a, (0x05, sp)
      008392 A1 07            [ 1]  336 	cp	a, #0x07
      008394 23 06            [ 2]  337 	jrule	00105$
      008396 A6 07            [ 1]  338 	ld	a, #0x07
      008398 0F 01            [ 1]  339 	clr	(0x01, sp)
      00839A 20 04            [ 2]  340 	jra	00106$
      00839C                        341 00105$:
      00839C 7B 05            [ 1]  342 	ld	a, (0x05, sp)
      00839E 0F 01            [ 1]  343 	clr	(0x01, sp)
      0083A0                        344 00106$:
      0083A0 89               [ 2]  345 	pushw	x
      0083A1 1A 02            [ 1]  346 	or	a, (2, sp)
      0083A3 85               [ 2]  347 	popw	x
                                    348 ;	lib/src/stm8s_mylib.c: 92: TM1628_SEND_COMMAND(TM1628_CMD_SET_DSIPLAY | _config);
      0083A4 C7 00 14         [ 1]  349 	ld	__config+0, a
      0083A7 AA 80            [ 1]  350 	or	a, #0x80
      0083A9 1E 03            [ 2]  351 	ldw	x, (3, sp)
      0083AB 1F 04            [ 2]  352 	ldw	(4, sp), x
      0083AD 5B 03            [ 2]  353 	addw	sp, #3
                                    354 ;	lib/src/stm8s_mylib.c: 94: }
      0083AF CC 83 6A         [ 2]  355 	jp	_TM1628_SEND_COMMAND
      0083B2 84               [ 1]  356 	pop	a
      0083B3 FC               [ 2]  357 	jp	(x)
                                    358 ;	lib/src/stm8s_mylib.c: 95: void TM1628_INIT(unsigned char enable, const unsigned char brightness)
                                    359 ;	-----------------------------------------
                                    360 ;	 function TM1628_INIT
                                    361 ;	-----------------------------------------
      0083B4                        362 _TM1628_INIT:
      0083B4 88               [ 1]  363 	push	a
      0083B5 6B 01            [ 1]  364 	ld	(0x01, sp), a
                                    365 ;	lib/src/stm8s_mylib.c: 97: GPIO_Init(GPIOA, STB, GPIO_MODE_OUT_PP_HIGH_FAST);	
      0083B7 4B F0            [ 1]  366 	push	#0xf0
      0083B9 A6 08            [ 1]  367 	ld	a, #0x08
      0083BB AE 50 00         [ 2]  368 	ldw	x, #0x5000
      0083BE CD 84 7B         [ 4]  369 	call	_GPIO_Init
                                    370 ;	lib/src/stm8s_mylib.c: 98: GPIO_Init(GPIOD, DIO|SCLK, GPIO_MODE_OUT_PP_HIGH_FAST);
      0083C1 4B F0            [ 1]  371 	push	#0xf0
      0083C3 A6 60            [ 1]  372 	ld	a, #0x60
      0083C5 AE 50 0F         [ 2]  373 	ldw	x, #0x500f
      0083C8 CD 84 7B         [ 4]  374 	call	_GPIO_Init
                                    375 ;	lib/src/stm8s_mylib.c: 100: TM1628_SEND_CONFIG(enable, brightness);
      0083CB 7B 04            [ 1]  376 	ld	a, (0x04, sp)
      0083CD 88               [ 1]  377 	push	a
      0083CE 7B 02            [ 1]  378 	ld	a, (0x02, sp)
      0083D0 CD 83 7F         [ 4]  379 	call	_TM1628_SEND_CONFIG
                                    380 ;	lib/src/stm8s_mylib.c: 101: }
      0083D3 84               [ 1]  381 	pop	a
      0083D4 85               [ 2]  382 	popw	x
      0083D5 84               [ 1]  383 	pop	a
      0083D6 FC               [ 2]  384 	jp	(x)
                                    385 ;	lib/src/stm8s_mylib.c: 102: void TM1628_DISPLAY_SEGMENTS(const unsigned char position, const unsigned char digit, unsigned char dot)
                                    386 ;	-----------------------------------------
                                    387 ;	 function TM1628_DISPLAY_SEGMENTS
                                    388 ;	-----------------------------------------
      0083D7                        389 _TM1628_DISPLAY_SEGMENTS:
      0083D7 52 04            [ 2]  390 	sub	sp, #4
      0083D9 6B 03            [ 1]  391 	ld	(0x03, sp), a
                                    392 ;	lib/src/stm8s_mylib.c: 105: if (digit < 15)
      0083DB 7B 07            [ 1]  393 	ld	a, (0x07, sp)
      0083DD A1 0F            [ 1]  394 	cp	a, #0x0f
      0083DF 24 0A            [ 1]  395 	jrnc	00102$
                                    396 ;	lib/src/stm8s_mylib.c: 107: segments = _digit2segments[digit];
      0083E1 5F               [ 1]  397 	clrw	x
      0083E2 7B 07            [ 1]  398 	ld	a, (0x07, sp)
      0083E4 97               [ 1]  399 	ld	xl, a
      0083E5 D6 80 91         [ 1]  400 	ld	a, (__digit2segments+0, x)
      0083E8 6B 04            [ 1]  401 	ld	(0x04, sp), a
                                    402 ;	lib/src/stm8s_mylib.c: 110: segments = 0x00;	
      0083EA C5                     403 	.byte 0xc5
      0083EB                        404 00102$:
      0083EB 0F 04            [ 1]  405 	clr	(0x04, sp)
      0083ED                        406 00103$:
                                    407 ;	lib/src/stm8s_mylib.c: 112: if ( (dot == 1 & (position == 2 )) | (dot == 2 & (position == 0 )) ) {
      0083ED 7B 08            [ 1]  408 	ld	a, (0x08, sp)
      0083EF 4A               [ 1]  409 	dec	a
      0083F0 26 05            [ 1]  410 	jrne	00120$
      0083F2 A6 01            [ 1]  411 	ld	a, #0x01
      0083F4 6B 02            [ 1]  412 	ld	(0x02, sp), a
      0083F6 C5                     413 	.byte 0xc5
      0083F7                        414 00120$:
      0083F7 0F 02            [ 1]  415 	clr	(0x02, sp)
      0083F9                        416 00121$:
      0083F9 7B 03            [ 1]  417 	ld	a, (0x03, sp)
      0083FB A0 02            [ 1]  418 	sub	a, #0x02
      0083FD 26 02            [ 1]  419 	jrne	00123$
      0083FF 4C               [ 1]  420 	inc	a
      008400 21                     421 	.byte 0x21
      008401                        422 00123$:
      008401 4F               [ 1]  423 	clr	a
      008402                        424 00124$:
      008402 14 02            [ 1]  425 	and	a, (0x02, sp)
      008404 6B 01            [ 1]  426 	ld	(0x01, sp), a
      008406 7B 08            [ 1]  427 	ld	a, (0x08, sp)
      008408 A0 02            [ 1]  428 	sub	a, #0x02
      00840A 26 04            [ 1]  429 	jrne	00126$
      00840C 4C               [ 1]  430 	inc	a
      00840D 6B 02            [ 1]  431 	ld	(0x02, sp), a
      00840F C5                     432 	.byte 0xc5
      008410                        433 00126$:
      008410 0F 02            [ 1]  434 	clr	(0x02, sp)
      008412                        435 00127$:
      008412 7B 03            [ 1]  436 	ld	a, (0x03, sp)
      008414 A0 00            [ 1]  437 	sub	a, #0x00
      008416 26 02            [ 1]  438 	jrne	00129$
      008418 4C               [ 1]  439 	inc	a
      008419 21                     440 	.byte 0x21
      00841A                        441 00129$:
      00841A 4F               [ 1]  442 	clr	a
      00841B                        443 00130$:
      00841B 14 02            [ 1]  444 	and	a, (0x02, sp)
      00841D 1A 01            [ 1]  445 	or	a, (0x01, sp)
      00841F 27 05            [ 1]  446 	jreq	00105$
                                    447 ;	lib/src/stm8s_mylib.c: 113: segments = segments | 0x80;
      008421 08 04            [ 1]  448 	sll	(0x04, sp)
      008423 99               [ 1]  449 	scf
      008424 06 04            [ 1]  450 	rrc	(0x04, sp)
      008426                        451 00105$:
                                    452 ;	lib/src/stm8s_mylib.c: 115: TM1628_SEND_COMMAND(TM1628_CMD_SET_DATA | TM1628_SET_DATA_F_ADDR);
      008426 A6 44            [ 1]  453 	ld	a, #0x44
      008428 CD 83 6A         [ 4]  454 	call	_TM1628_SEND_COMMAND
                                    455 ;	lib/src/stm8s_mylib.c: 116: SEND_START();
      00842B CD 82 D1         [ 4]  456 	call	_SEND_START
                                    457 ;	lib/src/stm8s_mylib.c: 117: SEND_WRITE(TM1628_CMD_SET_ADDR | position );
      00842E 7B 03            [ 1]  458 	ld	a, (0x03, sp)
      008430 AA C0            [ 1]  459 	or	a, #0xc0
      008432 CD 83 1E         [ 4]  460 	call	_SEND_WRITE
                                    461 ;	lib/src/stm8s_mylib.c: 118: SEND_WRITE(segments);
      008435 7B 04            [ 1]  462 	ld	a, (0x04, sp)
      008437 CD 83 1E         [ 4]  463 	call	_SEND_WRITE
                                    464 ;	lib/src/stm8s_mylib.c: 119: SEND_STOP();
      00843A CD 82 95         [ 4]  465 	call	_SEND_STOP
                                    466 ;	lib/src/stm8s_mylib.c: 120: TM_DELAY;
      00843D 4B 64            [ 1]  467 	push	#0x64
      00843F 5F               [ 1]  468 	clrw	x
      008440 89               [ 2]  469 	pushw	x
      008441 4B 00            [ 1]  470 	push	#0x00
      008443 CD 82 7B         [ 4]  471 	call	_delay_us
                                    472 ;	lib/src/stm8s_mylib.c: 121: }
      008446 1E 05            [ 2]  473 	ldw	x, (5, sp)
      008448 5B 08            [ 2]  474 	addw	sp, #8
      00844A FC               [ 2]  475 	jp	(x)
                                    476 ;	lib/src/stm8s_mylib.c: 122: void Write_EEPROM(uint32_t Address, unsigned char Data){
                                    477 ;	-----------------------------------------
                                    478 ;	 function Write_EEPROM
                                    479 ;	-----------------------------------------
      00844B                        480 _Write_EEPROM:
                                    481 ;	lib/src/stm8s_mylib.c: 124: FLASH->DUKR = (uint8_t)0xAE ; /*!< Second RASS key */ /* Warning: keys are reversed on data memory !!! */ 
      00844B 35 AE 50 64      [ 1]  482 	mov	0x5064+0, #0xae
                                    483 ;	lib/src/stm8s_mylib.c: 125: FLASH->DUKR = (uint8_t)0x56 ;  /*!< First RASS key */
      00844F 35 56 50 64      [ 1]  484 	mov	0x5064+0, #0x56
                                    485 ;	lib/src/stm8s_mylib.c: 127: *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
      008453 1E 05            [ 2]  486 	ldw	x, (0x05, sp)
      008455 7B 07            [ 1]  487 	ld	a, (0x07, sp)
      008457 F7               [ 1]  488 	ld	(x), a
                                    489 ;	lib/src/stm8s_mylib.c: 130: FLASH->IAPSR &= (uint8_t)0xF7; /*!< Data EEPROM memory */
      008458 C6 50 5F         [ 1]  490 	ld	a, 0x505f
      00845B A4 F7            [ 1]  491 	and	a, #0xf7
      00845D C7 50 5F         [ 1]  492 	ld	0x505f, a
                                    493 ;	lib/src/stm8s_mylib.c: 131: }
      008460 1E 01            [ 2]  494 	ldw	x, (1, sp)
      008462 5B 07            [ 2]  495 	addw	sp, #7
      008464 FC               [ 2]  496 	jp	(x)
                                    497 ;	lib/src/stm8s_mylib.c: 132: uint8_t Read_EEPROM(uint32_t Address){
                                    498 ;	-----------------------------------------
                                    499 ;	 function Read_EEPROM
                                    500 ;	-----------------------------------------
      008465                        501 _Read_EEPROM:
                                    502 ;	lib/src/stm8s_mylib.c: 133: return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address);
      008465 1E 05            [ 2]  503 	ldw	x, (0x05, sp)
      008467 F6               [ 1]  504 	ld	a, (x)
                                    505 ;	lib/src/stm8s_mylib.c: 134: }
      008468 1E 01            [ 2]  506 	ldw	x, (1, sp)
      00846A 5B 06            [ 2]  507 	addw	sp, #6
      00846C FC               [ 2]  508 	jp	(x)
                                    509 	.area CODE
                                    510 	.area CONST
      008091                        511 __digit2segments:
      008091 3F                     512 	.db #0x3f	; 63
      008092 06                     513 	.db #0x06	; 6
      008093 5B                     514 	.db #0x5b	; 91
      008094 4F                     515 	.db #0x4f	; 79	'O'
      008095 66                     516 	.db #0x66	; 102	'f'
      008096 6D                     517 	.db #0x6d	; 109	'm'
      008097 7D                     518 	.db #0x7d	; 125
      008098 07                     519 	.db #0x07	; 7
      008099 7F                     520 	.db #0x7f	; 127
      00809A 6F                     521 	.db #0x6f	; 111	'o'
      00809B 77                     522 	.db #0x77	; 119	'w'
      00809C 38                     523 	.db #0x38	; 56	'8'
      00809D 74                     524 	.db #0x74	; 116	't'
      00809E 54                     525 	.db #0x54	; 84	'T'
      00809F 5E                     526 	.db #0x5e	; 94
                                    527 	.area INITIALIZER
      0080B2                        528 __xinit___config:
      0080B2 0F                     529 	.db #0x0f	; 15
      0080B3                        530 __xinit___segments:
      0080B3 FF                     531 	.db #0xff	; 255
                                    532 	.area CABS (ABS)
