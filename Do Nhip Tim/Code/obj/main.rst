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
                                     14 	.globl _I2C_stop
                                     15 	.globl _I2C_write
                                     16 	.globl _I2C_address
                                     17 	.globl _I2C_start
                                     18 	.globl _I2C_init
                                     19 	.globl _delay_ms
                                     20 	.globl _delay_msSetup
                                     21 	.globl _GPIO_Init
                                     22 	.globl _GPIO_DeInit
                                     23 	.globl _CLK_HSIPrescalerConfig
                                     24 	.globl _a
                                     25 	.globl _ketqua
                                     26 	.globl _i
                                     27 	.globl _nut
                                     28 	.globl _dem
                                     29 	.globl _OLED_init
                                     30 	.globl _OLED_printOneNumber
                                     31 	.globl _OLED_printP
                                     32 	.globl _OLED_cursor
                                     33 	.globl _OLED_clear
                                     34 ;--------------------------------------------------------
                                     35 ; ram data
                                     36 ;--------------------------------------------------------
                                     37 	.area DATA
                                     38 ;--------------------------------------------------------
                                     39 ; ram data
                                     40 ;--------------------------------------------------------
                                     41 	.area INITIALIZED
      000001                         42 _dem::
      000001                         43 	.ds 1
      000002                         44 _nut::
      000002                         45 	.ds 1
      000003                         46 _i::
      000003                         47 	.ds 2
      000005                         48 _ketqua::
      000005                         49 	.ds 1
      000006                         50 _a::
      000006                         51 	.ds 6
                                     52 ;--------------------------------------------------------
                                     53 ; Stack segment in internal ram
                                     54 ;--------------------------------------------------------
                                     55 	.area SSEG
      00000C                         56 __start__stack:
      00000C                         57 	.ds	1
                                     58 
                                     59 ;--------------------------------------------------------
                                     60 ; absolute external ram data
                                     61 ;--------------------------------------------------------
                                     62 	.area DABS (ABS)
                                     63 
                                     64 ; default segment ordering for linker
                                     65 	.area HOME
                                     66 	.area GSINIT
                                     67 	.area GSFINAL
                                     68 	.area CONST
                                     69 	.area INITIALIZER
                                     70 	.area CODE
                                     71 
                                     72 ;--------------------------------------------------------
                                     73 ; interrupt vector
                                     74 ;--------------------------------------------------------
                                     75 	.area HOME
      008000                         76 __interrupt_vect:
      008000 82 00 80 07             77 	int s_GSINIT ; reset
                                     78 ;--------------------------------------------------------
                                     79 ; global & static initialisations
                                     80 ;--------------------------------------------------------
                                     81 	.area HOME
                                     82 	.area GSINIT
                                     83 	.area GSFINAL
                                     84 	.area GSINIT
      008007 CD 92 77         [ 4]   85 	call	___sdcc_external_startup
      00800A 4D               [ 1]   86 	tnz	a
      00800B 27 03            [ 1]   87 	jreq	__sdcc_init_data
      00800D CC 80 04         [ 2]   88 	jp	__sdcc_program_startup
      008010                         89 __sdcc_init_data:
                                     90 ; stm8_genXINIT() start
      008010 AE 00 00         [ 2]   91 	ldw x, #l_DATA
      008013 27 07            [ 1]   92 	jreq	00002$
      008015                         93 00001$:
      008015 72 4F 00 00      [ 1]   94 	clr (s_DATA - 1, x)
      008019 5A               [ 2]   95 	decw x
      00801A 26 F9            [ 1]   96 	jrne	00001$
      00801C                         97 00002$:
      00801C AE 00 0B         [ 2]   98 	ldw	x, #l_INITIALIZER
      00801F 27 09            [ 1]   99 	jreq	00004$
      008021                        100 00003$:
      008021 D6 81 86         [ 1]  101 	ld	a, (s_INITIALIZER - 1, x)
      008024 D7 00 00         [ 1]  102 	ld	(s_INITIALIZED - 1, x), a
      008027 5A               [ 2]  103 	decw	x
      008028 26 F7            [ 1]  104 	jrne	00003$
      00802A                        105 00004$:
                                    106 ; stm8_genXINIT() end
                                    107 	.area GSFINAL
      00802A CC 80 04         [ 2]  108 	jp	__sdcc_program_startup
                                    109 ;--------------------------------------------------------
                                    110 ; Home
                                    111 ;--------------------------------------------------------
                                    112 	.area HOME
                                    113 	.area HOME
      008004                        114 __sdcc_program_startup:
      008004 CC 81 92         [ 2]  115 	jp	_main
                                    116 ;	return from main will return to caller
                                    117 ;--------------------------------------------------------
                                    118 ; code
                                    119 ;--------------------------------------------------------
                                    120 	.area CODE
                                    121 ;	main.c: 99: void main (void)
                                    122 ;	-----------------------------------------
                                    123 ;	 function main
                                    124 ;	-----------------------------------------
      008192                        125 _main:
                                    126 ;	main.c: 101: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
      008192 4F               [ 1]  127 	clr	a
      008193 CD 86 CA         [ 4]  128 	call	_CLK_HSIPrescalerConfig
                                    129 ;	main.c: 102: GPIO_DeInit(GPIOB);
      008196 AE 50 05         [ 2]  130 	ldw	x, #0x5005
      008199 CD 83 0F         [ 4]  131 	call	_GPIO_DeInit
                                    132 ;	main.c: 103: GPIO_Init(GPIOB, GPIO_PIN_4, GPIO_MODE_OUT_OD_HIZ_SLOW);
      00819C 4B 90            [ 1]  133 	push	#0x90
      00819E A6 10            [ 1]  134 	ld	a, #0x10
      0081A0 AE 50 05         [ 2]  135 	ldw	x, #0x5005
      0081A3 CD 83 1D         [ 4]  136 	call	_GPIO_Init
                                    137 ;	main.c: 104: GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_OUT_OD_HIZ_SLOW);
      0081A6 4B 90            [ 1]  138 	push	#0x90
      0081A8 A6 20            [ 1]  139 	ld	a, #0x20
      0081AA AE 50 05         [ 2]  140 	ldw	x, #0x5005
      0081AD CD 83 1D         [ 4]  141 	call	_GPIO_Init
                                    142 ;	main.c: 106: I2C_init(I2C_CLOCK, OLED_I2C_ADDR);
      0081B0 4B 78            [ 1]  143 	push	#0x78
      0081B2 4B A0            [ 1]  144 	push	#0xa0
      0081B4 4B 86            [ 1]  145 	push	#0x86
      0081B6 4B 01            [ 1]  146 	push	#0x01
      0081B8 4B 00            [ 1]  147 	push	#0x00
      0081BA CD 91 8D         [ 4]  148 	call	_I2C_init
                                    149 ;	main.c: 107: delay_msSetup();
      0081BD CD 91 0D         [ 4]  150 	call	_delay_msSetup
                                    151 ;	main.c: 108: OLED_init();
      0081C0 CD 81 FC         [ 4]  152 	call	_OLED_init
                                    153 ;	main.c: 127: OLED_cursor(0,0);
      0081C3 4B 00            [ 1]  154 	push	#0x00
      0081C5 4F               [ 1]  155 	clr	a
      0081C6 CD 82 B6         [ 4]  156 	call	_OLED_cursor
                                    157 ;	main.c: 128: OLED_printP(a);
      0081C9 AE 00 06         [ 2]  158 	ldw	x, #(_a+0)
      0081CC CD 82 63         [ 4]  159 	call	_OLED_printP
                                    160 ;	main.c: 129: OLED_cursor(0,2);
      0081CF 4B 02            [ 1]  161 	push	#0x02
      0081D1 4F               [ 1]  162 	clr	a
      0081D2 CD 82 B6         [ 4]  163 	call	_OLED_cursor
                                    164 ;	main.c: 130: OLED_printP(a);
      0081D5 AE 00 06         [ 2]  165 	ldw	x, #(_a+0)
      0081D8 CD 82 63         [ 4]  166 	call	_OLED_printP
                                    167 ;	main.c: 131: delay_ms(10);
      0081DB AE 00 0A         [ 2]  168 	ldw	x, #0x000a
      0081DE CD 91 19         [ 4]  169 	call	_delay_ms
                                    170 ;	main.c: 132: OLED_clear();
      0081E1 CD 82 EA         [ 4]  171 	call	_OLED_clear
                                    172 ;	main.c: 133: while(1) 
      0081E4                        173 00102$:
                                    174 ;	main.c: 135: OLED_cursor(0,0);
      0081E4 4B 00            [ 1]  175 	push	#0x00
      0081E6 4F               [ 1]  176 	clr	a
      0081E7 CD 82 B6         [ 4]  177 	call	_OLED_cursor
                                    178 ;	main.c: 136: OLED_printP(a);
      0081EA AE 00 06         [ 2]  179 	ldw	x, #(_a+0)
      0081ED CD 82 63         [ 4]  180 	call	_OLED_printP
                                    181 ;	main.c: 137: delay_ms(1000);
      0081F0 AE 03 E8         [ 2]  182 	ldw	x, #0x03e8
      0081F3 CD 91 19         [ 4]  183 	call	_delay_ms
                                    184 ;	main.c: 138: OLED_clear();
      0081F6 CD 82 EA         [ 4]  185 	call	_OLED_clear
      0081F9 20 E9            [ 2]  186 	jra	00102$
                                    187 ;	main.c: 154: }
      0081FB 81               [ 4]  188 	ret
                                    189 ;	main.c: 193: void OLED_init(void)
                                    190 ;	-----------------------------------------
                                    191 ;	 function OLED_init
                                    192 ;	-----------------------------------------
      0081FC                        193 _OLED_init:
      0081FC 88               [ 1]  194 	push	a
                                    195 ;	main.c: 195: I2C_start();
      0081FD CD 91 CE         [ 4]  196 	call	_I2C_start
                                    197 ;	main.c: 196: I2C_address(OLED_I2C_ADDR, OLED_CMD_MODE);
      008200 4B 00            [ 1]  198 	push	#0x00
      008202 A6 78            [ 1]  199 	ld	a, #0x78
      008204 CD 91 E6         [ 4]  200 	call	_I2C_address
                                    201 ;	main.c: 197: for (uint8_t i = 0;i < 12;i++)
      008207 0F 01            [ 1]  202 	clr	(0x01, sp)
      008209                        203 00103$:
      008209 7B 01            [ 1]  204 	ld	a, (0x01, sp)
      00820B A1 0C            [ 1]  205 	cp	a, #0x0c
      00820D 24 0F            [ 1]  206 	jrnc	00101$
                                    207 ;	main.c: 199: I2C_write(OLED_INIT_CMD[i]);
      00820F 5F               [ 1]  208 	clrw	x
      008210 7B 01            [ 1]  209 	ld	a, (0x01, sp)
      008212 97               [ 1]  210 	ld	xl, a
      008213 1C 80 2D         [ 2]  211 	addw	x, #(_OLED_INIT_CMD+0)
      008216 F6               [ 1]  212 	ld	a, (x)
      008217 CD 92 05         [ 4]  213 	call	_I2C_write
                                    214 ;	main.c: 197: for (uint8_t i = 0;i < 12;i++)
      00821A 0C 01            [ 1]  215 	inc	(0x01, sp)
      00821C 20 EB            [ 2]  216 	jra	00103$
      00821E                        217 00101$:
                                    218 ;	main.c: 201: I2C_stop();
      00821E 84               [ 1]  219 	pop	a
      00821F CC 92 12         [ 2]  220 	jp	_I2C_stop
                                    221 ;	main.c: 202: }
      008222 84               [ 1]  222 	pop	a
      008223 81               [ 4]  223 	ret
                                    224 ;	main.c: 203: void OLED_printOneNumber(uint8_t num)
                                    225 ;	-----------------------------------------
                                    226 ;	 function OLED_printOneNumber
                                    227 ;	-----------------------------------------
      008224                        228 _OLED_printOneNumber:
      008224 52 02            [ 2]  229 	sub	sp, #2
                                    230 ;	main.c: 205: uint16_t offset = num + 16;
      008226 5F               [ 1]  231 	clrw	x
      008227 97               [ 1]  232 	ld	xl, a
      008228 1C 00 10         [ 2]  233 	addw	x, #0x0010
                                    234 ;	main.c: 206: offset += offset << 2;
      00822B 1F 01            [ 2]  235 	ldw	(0x01, sp), x
      00822D 58               [ 2]  236 	sllw	x
      00822E 58               [ 2]  237 	sllw	x
      00822F 72 FB 01         [ 2]  238 	addw	x, (0x01, sp)
      008232 1F 01            [ 2]  239 	ldw	(0x01, sp), x
                                    240 ;	main.c: 207: I2C_start();
      008234 CD 91 CE         [ 4]  241 	call	_I2C_start
                                    242 ;	main.c: 208: I2C_address(OLED_I2C_ADDR, OLED_DAT_MODE);
      008237 4B 40            [ 1]  243 	push	#0x40
      008239 A6 78            [ 1]  244 	ld	a, #0x78
      00823B CD 91 E6         [ 4]  245 	call	_I2C_address
                                    246 ;	main.c: 209: I2C_write(0x00);
      00823E 4F               [ 1]  247 	clr	a
      00823F CD 92 05         [ 4]  248 	call	_I2C_write
                                    249 ;	main.c: 210: for(uint8_t i = 5; i;i--){ I2C_write(OLED_FONT[offset++]); }
      008242 1E 01            [ 2]  250 	ldw	x, (0x01, sp)
      008244 A6 05            [ 1]  251 	ld	a, #0x05
      008246 6B 02            [ 1]  252 	ld	(0x02, sp), a
      008248                        253 00103$:
      008248 0D 02            [ 1]  254 	tnz	(0x02, sp)
      00824A 27 12            [ 1]  255 	jreq	00101$
      00824C 90 93            [ 1]  256 	ldw	y, x
      00824E 72 A9 80 3B      [ 2]  257 	addw	y, #(_OLED_FONT+0)
      008252 5C               [ 1]  258 	incw	x
      008253 90 F6            [ 1]  259 	ld	a, (y)
      008255 89               [ 2]  260 	pushw	x
      008256 CD 92 05         [ 4]  261 	call	_I2C_write
      008259 85               [ 2]  262 	popw	x
      00825A 0A 02            [ 1]  263 	dec	(0x02, sp)
      00825C 20 EA            [ 2]  264 	jra	00103$
      00825E                        265 00101$:
                                    266 ;	main.c: 211: I2C_stop();
      00825E 5B 02            [ 2]  267 	addw	sp, #2
                                    268 ;	main.c: 212: }
      008260 CC 92 12         [ 2]  269 	jp	_I2C_stop
                                    270 ;	main.c: 213: void OLED_printP(const char *p)
                                    271 ;	-----------------------------------------
                                    272 ;	 function OLED_printP
                                    273 ;	-----------------------------------------
      008263                        274 _OLED_printP:
      008263 52 07            [ 2]  275 	sub	sp, #7
      008265 1F 03            [ 2]  276 	ldw	(0x03, sp), x
                                    277 ;	main.c: 215: I2C_start();
      008267 CD 91 CE         [ 4]  278 	call	_I2C_start
                                    279 ;	main.c: 216: I2C_address(OLED_I2C_ADDR, OLED_DAT_MODE);
      00826A 4B 40            [ 1]  280 	push	#0x40
      00826C A6 78            [ 1]  281 	ld	a, #0x78
      00826E CD 91 E6         [ 4]  282 	call	_I2C_address
                                    283 ;	main.c: 217: while (*p)
      008271 16 03            [ 2]  284 	ldw	y, (0x03, sp)
      008273 17 05            [ 2]  285 	ldw	(0x05, sp), y
      008275                        286 00102$:
      008275 1E 05            [ 2]  287 	ldw	x, (0x05, sp)
      008277 F6               [ 1]  288 	ld	a, (x)
      008278 6B 07            [ 1]  289 	ld	(0x07, sp), a
      00827A 27 35            [ 1]  290 	jreq	00104$
                                    291 ;	main.c: 219: uint16_t offset = *p - 32;
      00827C 7B 07            [ 1]  292 	ld	a, (0x07, sp)
      00827E 5F               [ 1]  293 	clrw	x
      00827F 97               [ 1]  294 	ld	xl, a
      008280 1D 00 20         [ 2]  295 	subw	x, #0x0020
                                    296 ;	main.c: 220: offset += offset << 2;
      008283 1F 01            [ 2]  297 	ldw	(0x01, sp), x
      008285 58               [ 2]  298 	sllw	x
      008286 58               [ 2]  299 	sllw	x
      008287 72 FB 01         [ 2]  300 	addw	x, (0x01, sp)
                                    301 ;	main.c: 221: I2C_write(0x00);
      00828A 89               [ 2]  302 	pushw	x
      00828B 4F               [ 1]  303 	clr	a
      00828C CD 92 05         [ 4]  304 	call	_I2C_write
      00828F 85               [ 2]  305 	popw	x
                                    306 ;	main.c: 222: for(uint8_t i = 5; i;i--){ I2C_write(OLED_FONT[offset++]); }
      008290 A6 05            [ 1]  307 	ld	a, #0x05
      008292 6B 07            [ 1]  308 	ld	(0x07, sp), a
      008294                        309 00106$:
      008294 0D 07            [ 1]  310 	tnz	(0x07, sp)
      008296 27 12            [ 1]  311 	jreq	00101$
      008298 90 93            [ 1]  312 	ldw	y, x
      00829A 72 A9 80 3B      [ 2]  313 	addw	y, #(_OLED_FONT+0)
      00829E 5C               [ 1]  314 	incw	x
      00829F 90 F6            [ 1]  315 	ld	a, (y)
      0082A1 89               [ 2]  316 	pushw	x
      0082A2 CD 92 05         [ 4]  317 	call	_I2C_write
      0082A5 85               [ 2]  318 	popw	x
      0082A6 0A 07            [ 1]  319 	dec	(0x07, sp)
      0082A8 20 EA            [ 2]  320 	jra	00106$
      0082AA                        321 00101$:
                                    322 ;	main.c: 223: p++;
      0082AA 1E 05            [ 2]  323 	ldw	x, (0x05, sp)
      0082AC 5C               [ 1]  324 	incw	x
      0082AD 1F 05            [ 2]  325 	ldw	(0x05, sp), x
      0082AF 20 C4            [ 2]  326 	jra	00102$
      0082B1                        327 00104$:
                                    328 ;	main.c: 225: I2C_stop();
      0082B1 5B 07            [ 2]  329 	addw	sp, #7
                                    330 ;	main.c: 226: }
      0082B3 CC 92 12         [ 2]  331 	jp	_I2C_stop
                                    332 ;	main.c: 227: void OLED_cursor(uint8_t xpos, uint8_t ypos)
                                    333 ;	-----------------------------------------
                                    334 ;	 function OLED_cursor
                                    335 ;	-----------------------------------------
      0082B6                        336 _OLED_cursor:
      0082B6 88               [ 1]  337 	push	a
      0082B7 6B 01            [ 1]  338 	ld	(0x01, sp), a
                                    339 ;	main.c: 229: I2C_start();
      0082B9 CD 91 CE         [ 4]  340 	call	_I2C_start
                                    341 ;	main.c: 230: I2C_address(OLED_I2C_ADDR, OLED_CMD_MODE);
      0082BC 4B 00            [ 1]  342 	push	#0x00
      0082BE A6 78            [ 1]  343 	ld	a, #0x78
      0082C0 CD 91 E6         [ 4]  344 	call	_I2C_address
                                    345 ;	main.c: 231: I2C_write(xpos & 0x0F);
      0082C3 7B 01            [ 1]  346 	ld	a, (0x01, sp)
      0082C5 A4 0F            [ 1]  347 	and	a, #0x0f
      0082C7 CD 92 05         [ 4]  348 	call	_I2C_write
                                    349 ;	main.c: 232: I2C_write(0x10 | (xpos >> 4));
      0082CA 7B 01            [ 1]  350 	ld	a, (0x01, sp)
      0082CC 4E               [ 1]  351 	swap	a
      0082CD A4 0F            [ 1]  352 	and	a, #0x0f
      0082CF AA 10            [ 1]  353 	or	a, #0x10
      0082D1 CD 92 05         [ 4]  354 	call	_I2C_write
                                    355 ;	main.c: 233: I2C_write(0xB0 | (ypos & 0x07));
      0082D4 7B 04            [ 1]  356 	ld	a, (0x04, sp)
      0082D6 A4 07            [ 1]  357 	and	a, #0x07
      0082D8 AA B0            [ 1]  358 	or	a, #0xb0
      0082DA CD 92 05         [ 4]  359 	call	_I2C_write
                                    360 ;	main.c: 234: I2C_stop();
      0082DD 1E 02            [ 2]  361 	ldw	x, (2, sp)
      0082DF 1F 03            [ 2]  362 	ldw	(3, sp), x
      0082E1 5B 02            [ 2]  363 	addw	sp, #2
      0082E3 CC 92 12         [ 2]  364 	jp	_I2C_stop
                                    365 ;	main.c: 235: }
      0082E6 84               [ 1]  366 	pop	a
      0082E7 85               [ 2]  367 	popw	x
      0082E8 84               [ 1]  368 	pop	a
      0082E9 FC               [ 2]  369 	jp	(x)
                                    370 ;	main.c: 236: void OLED_clear(void)
                                    371 ;	-----------------------------------------
                                    372 ;	 function OLED_clear
                                    373 ;	-----------------------------------------
      0082EA                        374 _OLED_clear:
                                    375 ;	main.c: 238: OLED_cursor(0,0);
      0082EA 4B 00            [ 1]  376 	push	#0x00
      0082EC 4F               [ 1]  377 	clr	a
      0082ED CD 82 B6         [ 4]  378 	call	_OLED_cursor
                                    379 ;	main.c: 239: I2C_start();
      0082F0 CD 91 CE         [ 4]  380 	call	_I2C_start
                                    381 ;	main.c: 240: I2C_address(OLED_I2C_ADDR, OLED_DAT_MODE);
      0082F3 4B 40            [ 1]  382 	push	#0x40
      0082F5 A6 78            [ 1]  383 	ld	a, #0x78
      0082F7 CD 91 E6         [ 4]  384 	call	_I2C_address
                                    385 ;	main.c: 241: for (uint16_t i=0;i<512;i++)
      0082FA 5F               [ 1]  386 	clrw	x
      0082FB                        387 00103$:
      0082FB 90 93            [ 1]  388 	ldw	y, x
      0082FD 90 A3 02 00      [ 2]  389 	cpw	y, #0x0200
      008301 25 03            [ 1]  390 	jrc	00118$
      008303 CC 92 12         [ 2]  391 	jp	_I2C_stop
      008306                        392 00118$:
                                    393 ;	main.c: 243: I2C_write(0x00);
      008306 89               [ 2]  394 	pushw	x
      008307 4F               [ 1]  395 	clr	a
      008308 CD 92 05         [ 4]  396 	call	_I2C_write
      00830B 85               [ 2]  397 	popw	x
                                    398 ;	main.c: 241: for (uint16_t i=0;i<512;i++)
      00830C 5C               [ 1]  399 	incw	x
                                    400 ;	main.c: 245: I2C_stop();
                                    401 ;	main.c: 246: }
      00830D 20 EC            [ 2]  402 	jra	00103$
                                    403 	.area CODE
                                    404 	.area CONST
      00802D                        405 _OLED_INIT_CMD:
      00802D A8                     406 	.db #0xa8	; 168
      00802E 1F                     407 	.db #0x1f	; 31
      00802F D3                     408 	.db #0xd3	; 211
      008030 00                     409 	.db #0x00	; 0
      008031 03                     410 	.db #0x03	; 3
      008032 20                     411 	.db #0x20	; 32
      008033 00                     412 	.db #0x00	; 0
      008034 DA                     413 	.db #0xda	; 218
      008035 12                     414 	.db #0x12	; 18
      008036 8D                     415 	.db #0x8d	; 141
      008037 10                     416 	.db #0x10	; 16
      008038 AF                     417 	.db #0xaf	; 175
      008039 A1                     418 	.db #0xa1	; 161
      00803A C8                     419 	.db #0xc8	; 200
      00803B                        420 _OLED_FONT:
      00803B 00                     421 	.db #0x00	; 0
      00803C 00                     422 	.db #0x00	; 0
      00803D 00                     423 	.db #0x00	; 0
      00803E 00                     424 	.db #0x00	; 0
      00803F 00                     425 	.db #0x00	; 0
      008040 00                     426 	.db #0x00	; 0
      008041 00                     427 	.db #0x00	; 0
      008042 2F                     428 	.db #0x2f	; 47
      008043 00                     429 	.db #0x00	; 0
      008044 00                     430 	.db #0x00	; 0
      008045 00                     431 	.db #0x00	; 0
      008046 07                     432 	.db #0x07	; 7
      008047 00                     433 	.db #0x00	; 0
      008048 07                     434 	.db #0x07	; 7
      008049 00                     435 	.db #0x00	; 0
      00804A 14                     436 	.db #0x14	; 20
      00804B 7F                     437 	.db #0x7f	; 127
      00804C 14                     438 	.db #0x14	; 20
      00804D 7F                     439 	.db #0x7f	; 127
      00804E 14                     440 	.db #0x14	; 20
      00804F 24                     441 	.db #0x24	; 36
      008050 2A                     442 	.db #0x2a	; 42
      008051 7F                     443 	.db #0x7f	; 127
      008052 2A                     444 	.db #0x2a	; 42
      008053 12                     445 	.db #0x12	; 18
      008054 62                     446 	.db #0x62	; 98	'b'
      008055 64                     447 	.db #0x64	; 100	'd'
      008056 08                     448 	.db #0x08	; 8
      008057 13                     449 	.db #0x13	; 19
      008058 23                     450 	.db #0x23	; 35
      008059 36                     451 	.db #0x36	; 54	'6'
      00805A 49                     452 	.db #0x49	; 73	'I'
      00805B 55                     453 	.db #0x55	; 85	'U'
      00805C 22                     454 	.db #0x22	; 34
      00805D 50                     455 	.db #0x50	; 80	'P'
      00805E 00                     456 	.db #0x00	; 0
      00805F 05                     457 	.db #0x05	; 5
      008060 03                     458 	.db #0x03	; 3
      008061 00                     459 	.db #0x00	; 0
      008062 00                     460 	.db #0x00	; 0
      008063 00                     461 	.db #0x00	; 0
      008064 1C                     462 	.db #0x1c	; 28
      008065 22                     463 	.db #0x22	; 34
      008066 41                     464 	.db #0x41	; 65	'A'
      008067 00                     465 	.db #0x00	; 0
      008068 00                     466 	.db #0x00	; 0
      008069 41                     467 	.db #0x41	; 65	'A'
      00806A 22                     468 	.db #0x22	; 34
      00806B 1C                     469 	.db #0x1c	; 28
      00806C 00                     470 	.db #0x00	; 0
      00806D 14                     471 	.db #0x14	; 20
      00806E 08                     472 	.db #0x08	; 8
      00806F 3E                     473 	.db #0x3e	; 62
      008070 08                     474 	.db #0x08	; 8
      008071 14                     475 	.db #0x14	; 20
      008072 08                     476 	.db #0x08	; 8
      008073 08                     477 	.db #0x08	; 8
      008074 3E                     478 	.db #0x3e	; 62
      008075 08                     479 	.db #0x08	; 8
      008076 08                     480 	.db #0x08	; 8
      008077 00                     481 	.db #0x00	; 0
      008078 00                     482 	.db #0x00	; 0
      008079 A0                     483 	.db #0xa0	; 160
      00807A 60                     484 	.db #0x60	; 96
      00807B 00                     485 	.db #0x00	; 0
      00807C 08                     486 	.db #0x08	; 8
      00807D 08                     487 	.db #0x08	; 8
      00807E 08                     488 	.db #0x08	; 8
      00807F 08                     489 	.db #0x08	; 8
      008080 08                     490 	.db #0x08	; 8
      008081 00                     491 	.db #0x00	; 0
      008082 60                     492 	.db #0x60	; 96
      008083 60                     493 	.db #0x60	; 96
      008084 00                     494 	.db #0x00	; 0
      008085 00                     495 	.db #0x00	; 0
      008086 20                     496 	.db #0x20	; 32
      008087 10                     497 	.db #0x10	; 16
      008088 08                     498 	.db #0x08	; 8
      008089 04                     499 	.db #0x04	; 4
      00808A 02                     500 	.db #0x02	; 2
      00808B 3E                     501 	.db #0x3e	; 62
      00808C 51                     502 	.db #0x51	; 81	'Q'
      00808D 49                     503 	.db #0x49	; 73	'I'
      00808E 45                     504 	.db #0x45	; 69	'E'
      00808F 3E                     505 	.db #0x3e	; 62
      008090 00                     506 	.db #0x00	; 0
      008091 42                     507 	.db #0x42	; 66	'B'
      008092 7F                     508 	.db #0x7f	; 127
      008093 40                     509 	.db #0x40	; 64
      008094 00                     510 	.db #0x00	; 0
      008095 42                     511 	.db #0x42	; 66	'B'
      008096 61                     512 	.db #0x61	; 97	'a'
      008097 51                     513 	.db #0x51	; 81	'Q'
      008098 49                     514 	.db #0x49	; 73	'I'
      008099 46                     515 	.db #0x46	; 70	'F'
      00809A 21                     516 	.db #0x21	; 33
      00809B 41                     517 	.db #0x41	; 65	'A'
      00809C 45                     518 	.db #0x45	; 69	'E'
      00809D 4B                     519 	.db #0x4b	; 75	'K'
      00809E 31                     520 	.db #0x31	; 49	'1'
      00809F 18                     521 	.db #0x18	; 24
      0080A0 14                     522 	.db #0x14	; 20
      0080A1 12                     523 	.db #0x12	; 18
      0080A2 7F                     524 	.db #0x7f	; 127
      0080A3 10                     525 	.db #0x10	; 16
      0080A4 27                     526 	.db #0x27	; 39
      0080A5 45                     527 	.db #0x45	; 69	'E'
      0080A6 45                     528 	.db #0x45	; 69	'E'
      0080A7 45                     529 	.db #0x45	; 69	'E'
      0080A8 39                     530 	.db #0x39	; 57	'9'
      0080A9 3C                     531 	.db #0x3c	; 60
      0080AA 4A                     532 	.db #0x4a	; 74	'J'
      0080AB 49                     533 	.db #0x49	; 73	'I'
      0080AC 49                     534 	.db #0x49	; 73	'I'
      0080AD 30                     535 	.db #0x30	; 48	'0'
      0080AE 01                     536 	.db #0x01	; 1
      0080AF 71                     537 	.db #0x71	; 113	'q'
      0080B0 09                     538 	.db #0x09	; 9
      0080B1 05                     539 	.db #0x05	; 5
      0080B2 03                     540 	.db #0x03	; 3
      0080B3 36                     541 	.db #0x36	; 54	'6'
      0080B4 49                     542 	.db #0x49	; 73	'I'
      0080B5 49                     543 	.db #0x49	; 73	'I'
      0080B6 49                     544 	.db #0x49	; 73	'I'
      0080B7 36                     545 	.db #0x36	; 54	'6'
      0080B8 06                     546 	.db #0x06	; 6
      0080B9 49                     547 	.db #0x49	; 73	'I'
      0080BA 49                     548 	.db #0x49	; 73	'I'
      0080BB 29                     549 	.db #0x29	; 41
      0080BC 1E                     550 	.db #0x1e	; 30
      0080BD 00                     551 	.db #0x00	; 0
      0080BE 36                     552 	.db #0x36	; 54	'6'
      0080BF 36                     553 	.db #0x36	; 54	'6'
      0080C0 00                     554 	.db #0x00	; 0
      0080C1 00                     555 	.db #0x00	; 0
      0080C2 00                     556 	.db #0x00	; 0
      0080C3 56                     557 	.db #0x56	; 86	'V'
      0080C4 36                     558 	.db #0x36	; 54	'6'
      0080C5 00                     559 	.db #0x00	; 0
      0080C6 00                     560 	.db #0x00	; 0
      0080C7 08                     561 	.db #0x08	; 8
      0080C8 14                     562 	.db #0x14	; 20
      0080C9 22                     563 	.db #0x22	; 34
      0080CA 41                     564 	.db #0x41	; 65	'A'
      0080CB 00                     565 	.db #0x00	; 0
      0080CC 14                     566 	.db #0x14	; 20
      0080CD 14                     567 	.db #0x14	; 20
      0080CE 14                     568 	.db #0x14	; 20
      0080CF 14                     569 	.db #0x14	; 20
      0080D0 14                     570 	.db #0x14	; 20
      0080D1 00                     571 	.db #0x00	; 0
      0080D2 41                     572 	.db #0x41	; 65	'A'
      0080D3 22                     573 	.db #0x22	; 34
      0080D4 14                     574 	.db #0x14	; 20
      0080D5 08                     575 	.db #0x08	; 8
      0080D6 02                     576 	.db #0x02	; 2
      0080D7 01                     577 	.db #0x01	; 1
      0080D8 51                     578 	.db #0x51	; 81	'Q'
      0080D9 09                     579 	.db #0x09	; 9
      0080DA 06                     580 	.db #0x06	; 6
      0080DB 32                     581 	.db #0x32	; 50	'2'
      0080DC 49                     582 	.db #0x49	; 73	'I'
      0080DD 59                     583 	.db #0x59	; 89	'Y'
      0080DE 51                     584 	.db #0x51	; 81	'Q'
      0080DF 3E                     585 	.db #0x3e	; 62
      0080E0 7C                     586 	.db #0x7c	; 124
      0080E1 12                     587 	.db #0x12	; 18
      0080E2 11                     588 	.db #0x11	; 17
      0080E3 12                     589 	.db #0x12	; 18
      0080E4 7C                     590 	.db #0x7c	; 124
      0080E5 7F                     591 	.db #0x7f	; 127
      0080E6 49                     592 	.db #0x49	; 73	'I'
      0080E7 49                     593 	.db #0x49	; 73	'I'
      0080E8 49                     594 	.db #0x49	; 73	'I'
      0080E9 36                     595 	.db #0x36	; 54	'6'
      0080EA 3E                     596 	.db #0x3e	; 62
      0080EB 41                     597 	.db #0x41	; 65	'A'
      0080EC 41                     598 	.db #0x41	; 65	'A'
      0080ED 41                     599 	.db #0x41	; 65	'A'
      0080EE 22                     600 	.db #0x22	; 34
      0080EF 7F                     601 	.db #0x7f	; 127
      0080F0 41                     602 	.db #0x41	; 65	'A'
      0080F1 41                     603 	.db #0x41	; 65	'A'
      0080F2 22                     604 	.db #0x22	; 34
      0080F3 1C                     605 	.db #0x1c	; 28
      0080F4 7F                     606 	.db #0x7f	; 127
      0080F5 49                     607 	.db #0x49	; 73	'I'
      0080F6 49                     608 	.db #0x49	; 73	'I'
      0080F7 49                     609 	.db #0x49	; 73	'I'
      0080F8 41                     610 	.db #0x41	; 65	'A'
      0080F9 7F                     611 	.db #0x7f	; 127
      0080FA 09                     612 	.db #0x09	; 9
      0080FB 09                     613 	.db #0x09	; 9
      0080FC 09                     614 	.db #0x09	; 9
      0080FD 01                     615 	.db #0x01	; 1
      0080FE 3E                     616 	.db #0x3e	; 62
      0080FF 41                     617 	.db #0x41	; 65	'A'
      008100 49                     618 	.db #0x49	; 73	'I'
      008101 49                     619 	.db #0x49	; 73	'I'
      008102 7A                     620 	.db #0x7a	; 122	'z'
      008103 7F                     621 	.db #0x7f	; 127
      008104 08                     622 	.db #0x08	; 8
      008105 08                     623 	.db #0x08	; 8
      008106 08                     624 	.db #0x08	; 8
      008107 7F                     625 	.db #0x7f	; 127
      008108 00                     626 	.db #0x00	; 0
      008109 41                     627 	.db #0x41	; 65	'A'
      00810A 7F                     628 	.db #0x7f	; 127
      00810B 41                     629 	.db #0x41	; 65	'A'
      00810C 00                     630 	.db #0x00	; 0
      00810D 20                     631 	.db #0x20	; 32
      00810E 40                     632 	.db #0x40	; 64
      00810F 41                     633 	.db #0x41	; 65	'A'
      008110 3F                     634 	.db #0x3f	; 63
      008111 01                     635 	.db #0x01	; 1
      008112 7F                     636 	.db #0x7f	; 127
      008113 08                     637 	.db #0x08	; 8
      008114 14                     638 	.db #0x14	; 20
      008115 22                     639 	.db #0x22	; 34
      008116 41                     640 	.db #0x41	; 65	'A'
      008117 7F                     641 	.db #0x7f	; 127
      008118 40                     642 	.db #0x40	; 64
      008119 40                     643 	.db #0x40	; 64
      00811A 40                     644 	.db #0x40	; 64
      00811B 40                     645 	.db #0x40	; 64
      00811C 7F                     646 	.db #0x7f	; 127
      00811D 02                     647 	.db #0x02	; 2
      00811E 0C                     648 	.db #0x0c	; 12
      00811F 02                     649 	.db #0x02	; 2
      008120 7F                     650 	.db #0x7f	; 127
      008121 7F                     651 	.db #0x7f	; 127
      008122 04                     652 	.db #0x04	; 4
      008123 08                     653 	.db #0x08	; 8
      008124 10                     654 	.db #0x10	; 16
      008125 7F                     655 	.db #0x7f	; 127
      008126 3E                     656 	.db #0x3e	; 62
      008127 41                     657 	.db #0x41	; 65	'A'
      008128 41                     658 	.db #0x41	; 65	'A'
      008129 41                     659 	.db #0x41	; 65	'A'
      00812A 3E                     660 	.db #0x3e	; 62
      00812B 7F                     661 	.db #0x7f	; 127
      00812C 09                     662 	.db #0x09	; 9
      00812D 09                     663 	.db #0x09	; 9
      00812E 09                     664 	.db #0x09	; 9
      00812F 06                     665 	.db #0x06	; 6
      008130 3E                     666 	.db #0x3e	; 62
      008131 41                     667 	.db #0x41	; 65	'A'
      008132 51                     668 	.db #0x51	; 81	'Q'
      008133 21                     669 	.db #0x21	; 33
      008134 5E                     670 	.db #0x5e	; 94
      008135 7F                     671 	.db #0x7f	; 127
      008136 09                     672 	.db #0x09	; 9
      008137 19                     673 	.db #0x19	; 25
      008138 29                     674 	.db #0x29	; 41
      008139 46                     675 	.db #0x46	; 70	'F'
      00813A 46                     676 	.db #0x46	; 70	'F'
      00813B 49                     677 	.db #0x49	; 73	'I'
      00813C 49                     678 	.db #0x49	; 73	'I'
      00813D 49                     679 	.db #0x49	; 73	'I'
      00813E 31                     680 	.db #0x31	; 49	'1'
      00813F 01                     681 	.db #0x01	; 1
      008140 01                     682 	.db #0x01	; 1
      008141 7F                     683 	.db #0x7f	; 127
      008142 01                     684 	.db #0x01	; 1
      008143 01                     685 	.db #0x01	; 1
      008144 3F                     686 	.db #0x3f	; 63
      008145 40                     687 	.db #0x40	; 64
      008146 40                     688 	.db #0x40	; 64
      008147 40                     689 	.db #0x40	; 64
      008148 3F                     690 	.db #0x3f	; 63
      008149 1F                     691 	.db #0x1f	; 31
      00814A 20                     692 	.db #0x20	; 32
      00814B 40                     693 	.db #0x40	; 64
      00814C 20                     694 	.db #0x20	; 32
      00814D 1F                     695 	.db #0x1f	; 31
      00814E 3F                     696 	.db #0x3f	; 63
      00814F 40                     697 	.db #0x40	; 64
      008150 38                     698 	.db #0x38	; 56	'8'
      008151 40                     699 	.db #0x40	; 64
      008152 3F                     700 	.db #0x3f	; 63
      008153 63                     701 	.db #0x63	; 99	'c'
      008154 14                     702 	.db #0x14	; 20
      008155 08                     703 	.db #0x08	; 8
      008156 14                     704 	.db #0x14	; 20
      008157 63                     705 	.db #0x63	; 99	'c'
      008158 07                     706 	.db #0x07	; 7
      008159 08                     707 	.db #0x08	; 8
      00815A 70                     708 	.db #0x70	; 112	'p'
      00815B 08                     709 	.db #0x08	; 8
      00815C 07                     710 	.db #0x07	; 7
      00815D 61                     711 	.db #0x61	; 97	'a'
      00815E 51                     712 	.db #0x51	; 81	'Q'
      00815F 49                     713 	.db #0x49	; 73	'I'
      008160 45                     714 	.db #0x45	; 69	'E'
      008161 43                     715 	.db #0x43	; 67	'C'
      008162 00                     716 	.db #0x00	; 0
      008163 7F                     717 	.db #0x7f	; 127
      008164 41                     718 	.db #0x41	; 65	'A'
      008165 41                     719 	.db #0x41	; 65	'A'
      008166 00                     720 	.db #0x00	; 0
      008167 02                     721 	.db #0x02	; 2
      008168 04                     722 	.db #0x04	; 4
      008169 08                     723 	.db #0x08	; 8
      00816A 10                     724 	.db #0x10	; 16
      00816B 20                     725 	.db #0x20	; 32
      00816C 00                     726 	.db #0x00	; 0
      00816D 41                     727 	.db #0x41	; 65	'A'
      00816E 41                     728 	.db #0x41	; 65	'A'
      00816F 7F                     729 	.db #0x7f	; 127
      008170 00                     730 	.db #0x00	; 0
      008171 04                     731 	.db #0x04	; 4
      008172 02                     732 	.db #0x02	; 2
      008173 01                     733 	.db #0x01	; 1
      008174 02                     734 	.db #0x02	; 2
      008175 04                     735 	.db #0x04	; 4
      008176 40                     736 	.db #0x40	; 64
      008177 40                     737 	.db #0x40	; 64
      008178 40                     738 	.db #0x40	; 64
      008179 40                     739 	.db #0x40	; 64
      00817A 40                     740 	.db #0x40	; 64
                                    741 	.area INITIALIZER
      008187                        742 __xinit__dem:
      008187 00                     743 	.db #0x00	; 0
      008188                        744 __xinit__nut:
      008188 00                     745 	.db #0x00	; 0
      008189                        746 __xinit__i:
      008189 00 00                  747 	.dw #0x0000
      00818B                        748 __xinit__ketqua:
      00818B 00                     749 	.db #0x00	; 0
      00818C                        750 __xinit__a:
      00818C 43 48 55 4E 47         751 	.ascii "CHUNG"
      008191 00                     752 	.db 0x00
                                    753 	.area CABS (ABS)
