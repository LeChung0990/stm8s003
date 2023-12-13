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
                                     11 	.globl _EXTI_PORTD_IRQHandler
                                     12 	.globl _main
                                     13 	.globl _ChayLEDNgoaiTrong
                                     14 	.globl _Chay1LED
                                     15 	.globl _HaiMau
                                     16 	.globl _NhapNhayRED
                                     17 	.globl _NhapNhay1
                                     18 	.globl _ChayLED5
                                     19 	.globl _ChayLED4
                                     20 	.globl _ChayLed2
                                     21 	.globl _ChayLed1
                                     22 	.globl _clearLEDs
                                     23 	.globl _Timer4DelayMs
                                     24 	.globl _Timer4Config
                                     25 	.globl _hieuung1
                                     26 	.globl _number
                                     27 	.globl _sendRGB
                                     28 	.globl _Color_byte
                                     29 	.globl _send_1
                                     30 	.globl _send_0
                                     31 	.globl _rand
                                     32 	.globl _mode
                                     33 	.globl _b
                                     34 	.globl _g
                                     35 	.globl _r
                                     36 	.globl _i
                                     37 ;--------------------------------------------------------
                                     38 ; ram data
                                     39 ;--------------------------------------------------------
                                     40 	.area DATA
      000001                         41 _i::
      000001                         42 	.ds 1
      000002                         43 _r::
      000002                         44 	.ds 1
      000003                         45 _g::
      000003                         46 	.ds 1
      000004                         47 _b::
      000004                         48 	.ds 1
                                     49 ;--------------------------------------------------------
                                     50 ; ram data
                                     51 ;--------------------------------------------------------
                                     52 	.area INITIALIZED
      000005                         53 _mode::
      000005                         54 	.ds 1
                                     55 ;--------------------------------------------------------
                                     56 ; Stack segment in internal ram
                                     57 ;--------------------------------------------------------
                                     58 	.area SSEG
      00000A                         59 __start__stack:
      00000A                         60 	.ds	1
                                     61 
                                     62 ;--------------------------------------------------------
                                     63 ; absolute external ram data
                                     64 ;--------------------------------------------------------
                                     65 	.area DABS (ABS)
                                     66 
                                     67 ; default segment ordering for linker
                                     68 	.area HOME
                                     69 	.area GSINIT
                                     70 	.area GSFINAL
                                     71 	.area CONST
                                     72 	.area INITIALIZER
                                     73 	.area CODE
                                     74 
                                     75 ;--------------------------------------------------------
                                     76 ; interrupt vector
                                     77 ;--------------------------------------------------------
                                     78 	.area HOME
      008000                         79 __interrupt_vect:
      008000 82 00 80 27             80 	int s_GSINIT ; reset
      008004 82 00 00 00             81 	int 0x000000 ; trap
      008008 82 00 00 00             82 	int 0x000000 ; int0
      00800C 82 00 00 00             83 	int 0x000000 ; int1
      008010 82 00 00 00             84 	int 0x000000 ; int2
      008014 82 00 00 00             85 	int 0x000000 ; int3
      008018 82 00 00 00             86 	int 0x000000 ; int4
      00801C 82 00 00 00             87 	int 0x000000 ; int5
      008020 82 00 88 31             88 	int _EXTI_PORTD_IRQHandler ; int6
                                     89 ;--------------------------------------------------------
                                     90 ; global & static initialisations
                                     91 ;--------------------------------------------------------
                                     92 	.area HOME
                                     93 	.area GSINIT
                                     94 	.area GSFINAL
                                     95 	.area GSINIT
      008027 CD 88 CA         [ 4]   96 	call	___sdcc_external_startup
      00802A 4D               [ 1]   97 	tnz	a
      00802B 27 03            [ 1]   98 	jreq	__sdcc_init_data
      00802D CC 80 24         [ 2]   99 	jp	__sdcc_program_startup
      008030                        100 __sdcc_init_data:
                                    101 ; stm8_genXINIT() start
      008030 AE 00 04         [ 2]  102 	ldw x, #l_DATA
      008033 27 07            [ 1]  103 	jreq	00002$
      008035                        104 00001$:
      008035 72 4F 00 00      [ 1]  105 	clr (s_DATA - 1, x)
      008039 5A               [ 2]  106 	decw x
      00803A 26 F9            [ 1]  107 	jrne	00001$
      00803C                        108 00002$:
      00803C AE 00 05         [ 2]  109 	ldw	x, #l_INITIALIZER
      00803F 27 09            [ 1]  110 	jreq	00004$
      008041                        111 00003$:
      008041 D6 80 4C         [ 1]  112 	ld	a, (s_INITIALIZER - 1, x)
      008044 D7 00 04         [ 1]  113 	ld	(s_INITIALIZED - 1, x), a
      008047 5A               [ 2]  114 	decw	x
      008048 26 F7            [ 1]  115 	jrne	00003$
      00804A                        116 00004$:
                                    117 ; stm8_genXINIT() end
                                    118 	.area GSFINAL
      00804A CC 80 24         [ 2]  119 	jp	__sdcc_program_startup
                                    120 ;--------------------------------------------------------
                                    121 ; Home
                                    122 ;--------------------------------------------------------
                                    123 	.area HOME
                                    124 	.area HOME
      008024                        125 __sdcc_program_startup:
      008024 CC 86 AC         [ 2]  126 	jp	_main
                                    127 ;	return from main will return to caller
                                    128 ;--------------------------------------------------------
                                    129 ; code
                                    130 ;--------------------------------------------------------
                                    131 	.area CODE
                                    132 ;	main.c: 12: void send_0(void)
                                    133 ;	-----------------------------------------
                                    134 ;	 function send_0
                                    135 ;	-----------------------------------------
      008052                        136 _send_0:
                                    137 ;	main.c: 15: __asm__("bset 0x500f, #3");
      008052 72 16 50 0F      [ 1]  138 	bset	0x500f, #3
                                    139 ;	main.c: 16: __asm__("nop\n nop\n nop\n nop\n nop\n");
      008056 9D               [ 1]  140 	nop
      008057 9D               [ 1]  141 	nop
      008058 9D               [ 1]  142 	nop
      008059 9D               [ 1]  143 	nop
      00805A 9D               [ 1]  144 	nop
                                    145 ;	main.c: 18: __asm__("bres 0x500f, #3");
      00805B 72 17 50 0F      [ 1]  146 	bres	0x500f, #3
                                    147 ;	main.c: 19: __asm__("nop\n nop\n nop\n nop\n nop\n nop\n nop\n nop\n nop\n nop\n");
      00805F 9D               [ 1]  148 	nop
      008060 9D               [ 1]  149 	nop
      008061 9D               [ 1]  150 	nop
      008062 9D               [ 1]  151 	nop
      008063 9D               [ 1]  152 	nop
      008064 9D               [ 1]  153 	nop
      008065 9D               [ 1]  154 	nop
      008066 9D               [ 1]  155 	nop
      008067 9D               [ 1]  156 	nop
      008068 9D               [ 1]  157 	nop
                                    158 ;	main.c: 20: }
      008069 81               [ 4]  159 	ret
                                    160 ;	main.c: 21: void send_1(void)
                                    161 ;	-----------------------------------------
                                    162 ;	 function send_1
                                    163 ;	-----------------------------------------
      00806A                        164 _send_1:
                                    165 ;	main.c: 23: __asm__("bset 0x500f, #3");
      00806A 72 16 50 0F      [ 1]  166 	bset	0x500f, #3
                                    167 ;	main.c: 24: __asm__("nop\n nop\n nop\n nop\n nop\n nop\n nop\n nop\n nop\n nop\n nop\n nop\n");
      00806E 9D               [ 1]  168 	nop
      00806F 9D               [ 1]  169 	nop
      008070 9D               [ 1]  170 	nop
      008071 9D               [ 1]  171 	nop
      008072 9D               [ 1]  172 	nop
      008073 9D               [ 1]  173 	nop
      008074 9D               [ 1]  174 	nop
      008075 9D               [ 1]  175 	nop
      008076 9D               [ 1]  176 	nop
      008077 9D               [ 1]  177 	nop
      008078 9D               [ 1]  178 	nop
      008079 9D               [ 1]  179 	nop
                                    180 ;	main.c: 25: __asm__("bres 0x500f, #3");
      00807A 72 17 50 0F      [ 1]  181 	bres	0x500f, #3
                                    182 ;	main.c: 26: __asm__("nop\n nop\n nop\n");
      00807E 9D               [ 1]  183 	nop
      00807F 9D               [ 1]  184 	nop
      008080 9D               [ 1]  185 	nop
                                    186 ;	main.c: 27: }
      008081 81               [ 4]  187 	ret
                                    188 ;	main.c: 28: void Color_byte(uint8_t data)
                                    189 ;	-----------------------------------------
                                    190 ;	 function Color_byte
                                    191 ;	-----------------------------------------
      008082                        192 _Color_byte:
      008082 88               [ 1]  193 	push	a
                                    194 ;	main.c: 30: for (uint8_t i = 0; i < 8; i++)
      008083 0F 01            [ 1]  195 	clr	(0x01, sp)
      008085                        196 00106$:
      008085 88               [ 1]  197 	push	a
      008086 7B 02            [ 1]  198 	ld	a, (0x02, sp)
      008088 A1 08            [ 1]  199 	cp	a, #0x08
      00808A 84               [ 1]  200 	pop	a
      00808B 24 14            [ 1]  201 	jrnc	00108$
                                    202 ;	main.c: 32: if (data & 0x80)
      00808D 4D               [ 1]  203 	tnz	a
      00808E 2A 07            [ 1]  204 	jrpl	00102$
                                    205 ;	main.c: 33: send_1();
      008090 88               [ 1]  206 	push	a
      008091 CD 80 6A         [ 4]  207 	call	_send_1
      008094 84               [ 1]  208 	pop	a
      008095 20 05            [ 2]  209 	jra	00103$
      008097                        210 00102$:
                                    211 ;	main.c: 35: send_0();
      008097 88               [ 1]  212 	push	a
      008098 CD 80 52         [ 4]  213 	call	_send_0
      00809B 84               [ 1]  214 	pop	a
      00809C                        215 00103$:
                                    216 ;	main.c: 36: data <<= 1;
      00809C 48               [ 1]  217 	sll	a
                                    218 ;	main.c: 30: for (uint8_t i = 0; i < 8; i++)
      00809D 0C 01            [ 1]  219 	inc	(0x01, sp)
      00809F 20 E4            [ 2]  220 	jra	00106$
      0080A1                        221 00108$:
                                    222 ;	main.c: 38: }
      0080A1 84               [ 1]  223 	pop	a
      0080A2 81               [ 4]  224 	ret
                                    225 ;	main.c: 39: void sendRGB(uint8_t Gbyte, uint8_t Rbyte, uint8_t Bbyte)
                                    226 ;	-----------------------------------------
                                    227 ;	 function sendRGB
                                    228 ;	-----------------------------------------
      0080A3                        229 _sendRGB:
                                    230 ;	main.c: 41: Color_byte(Gbyte);
      0080A3 CD 80 82         [ 4]  231 	call	_Color_byte
                                    232 ;	main.c: 42: Color_byte(Rbyte);
      0080A6 7B 03            [ 1]  233 	ld	a, (0x03, sp)
      0080A8 CD 80 82         [ 4]  234 	call	_Color_byte
                                    235 ;	main.c: 43: Color_byte(Bbyte);
      0080AB 7B 04            [ 1]  236 	ld	a, (0x04, sp)
      0080AD 1E 01            [ 2]  237 	ldw	x, (1, sp)
      0080AF 1F 03            [ 2]  238 	ldw	(3, sp), x
      0080B1 5B 02            [ 2]  239 	addw	sp, #2
                                    240 ;	main.c: 44: }
      0080B3 CC 80 82         [ 2]  241 	jp	_Color_byte
                                    242 ;	main.c: 45: void number(uint8_t soLed, uint8_t Gbyte, uint8_t Rbyte, uint8_t Bbyte)
                                    243 ;	-----------------------------------------
                                    244 ;	 function number
                                    245 ;	-----------------------------------------
      0080B6                        246 _number:
                                    247 ;	main.c: 47: switch (soLed)
      0080B6 A1 08            [ 1]  248 	cp	a, #0x08
      0080B8 23 03            [ 2]  249 	jrule	00118$
      0080BA CC 82 76         [ 2]  250 	jp	00111$
      0080BD                        251 00118$:
      0080BD 5F               [ 1]  252 	clrw	x
      0080BE 97               [ 1]  253 	ld	xl, a
      0080BF 58               [ 2]  254 	sllw	x
      0080C0 DE 80 C4         [ 2]  255 	ldw	x, (#00119$, x)
      0080C3 FC               [ 2]  256 	jp	(x)
      0080C4                        257 00119$:
      0080C4 82 76                  258 	.dw	#00111$
      0080C6 80 D6                  259 	.dw	#00101$
      0080C8 80 E4                  260 	.dw	#00102$
      0080CA 80 FD                  261 	.dw	#00103$
      0080CC 81 21                  262 	.dw	#00104$
      0080CE 81 50                  263 	.dw	#00105$
      0080D0 81 8A                  264 	.dw	#00106$
      0080D2 81 CF                  265 	.dw	#00107$
      0080D4 82 1E                  266 	.dw	#00108$
                                    267 ;	main.c: 49: case 1:
      0080D6                        268 00101$:
                                    269 ;	main.c: 50: sendRGB(Gbyte, Rbyte, Bbyte);
      0080D6 7B 05            [ 1]  270 	ld	a, (0x05, sp)
      0080D8 88               [ 1]  271 	push	a
      0080D9 7B 05            [ 1]  272 	ld	a, (0x05, sp)
      0080DB 88               [ 1]  273 	push	a
      0080DC 7B 05            [ 1]  274 	ld	a, (0x05, sp)
      0080DE CD 80 A3         [ 4]  275 	call	_sendRGB
                                    276 ;	main.c: 51: break;
      0080E1 CC 82 76         [ 2]  277 	jp	00111$
                                    278 ;	main.c: 52: case 2:
      0080E4                        279 00102$:
                                    280 ;	main.c: 53: sendRGB(Gbyte, Rbyte, Bbyte);
      0080E4 7B 05            [ 1]  281 	ld	a, (0x05, sp)
      0080E6 88               [ 1]  282 	push	a
      0080E7 7B 05            [ 1]  283 	ld	a, (0x05, sp)
      0080E9 88               [ 1]  284 	push	a
      0080EA 7B 05            [ 1]  285 	ld	a, (0x05, sp)
      0080EC CD 80 A3         [ 4]  286 	call	_sendRGB
                                    287 ;	main.c: 54: sendRGB(Gbyte, Rbyte, Bbyte);
      0080EF 7B 05            [ 1]  288 	ld	a, (0x05, sp)
      0080F1 88               [ 1]  289 	push	a
      0080F2 7B 05            [ 1]  290 	ld	a, (0x05, sp)
      0080F4 88               [ 1]  291 	push	a
      0080F5 7B 05            [ 1]  292 	ld	a, (0x05, sp)
      0080F7 CD 80 A3         [ 4]  293 	call	_sendRGB
                                    294 ;	main.c: 55: break;
      0080FA CC 82 76         [ 2]  295 	jp	00111$
                                    296 ;	main.c: 56: case 3:
      0080FD                        297 00103$:
                                    298 ;	main.c: 57: sendRGB(Gbyte, Rbyte, Bbyte);
      0080FD 7B 05            [ 1]  299 	ld	a, (0x05, sp)
      0080FF 88               [ 1]  300 	push	a
      008100 7B 05            [ 1]  301 	ld	a, (0x05, sp)
      008102 88               [ 1]  302 	push	a
      008103 7B 05            [ 1]  303 	ld	a, (0x05, sp)
      008105 CD 80 A3         [ 4]  304 	call	_sendRGB
                                    305 ;	main.c: 58: sendRGB(Gbyte, Rbyte, Bbyte);
      008108 7B 05            [ 1]  306 	ld	a, (0x05, sp)
      00810A 88               [ 1]  307 	push	a
      00810B 7B 05            [ 1]  308 	ld	a, (0x05, sp)
      00810D 88               [ 1]  309 	push	a
      00810E 7B 05            [ 1]  310 	ld	a, (0x05, sp)
      008110 CD 80 A3         [ 4]  311 	call	_sendRGB
                                    312 ;	main.c: 59: sendRGB(Gbyte, Rbyte, Bbyte);
      008113 7B 05            [ 1]  313 	ld	a, (0x05, sp)
      008115 88               [ 1]  314 	push	a
      008116 7B 05            [ 1]  315 	ld	a, (0x05, sp)
      008118 88               [ 1]  316 	push	a
      008119 7B 05            [ 1]  317 	ld	a, (0x05, sp)
      00811B CD 80 A3         [ 4]  318 	call	_sendRGB
                                    319 ;	main.c: 60: break;
      00811E CC 82 76         [ 2]  320 	jp	00111$
                                    321 ;	main.c: 61: case 4:
      008121                        322 00104$:
                                    323 ;	main.c: 62: sendRGB(Gbyte, Rbyte, Bbyte);
      008121 7B 05            [ 1]  324 	ld	a, (0x05, sp)
      008123 88               [ 1]  325 	push	a
      008124 7B 05            [ 1]  326 	ld	a, (0x05, sp)
      008126 88               [ 1]  327 	push	a
      008127 7B 05            [ 1]  328 	ld	a, (0x05, sp)
      008129 CD 80 A3         [ 4]  329 	call	_sendRGB
                                    330 ;	main.c: 63: sendRGB(Gbyte, Rbyte, Bbyte);
      00812C 7B 05            [ 1]  331 	ld	a, (0x05, sp)
      00812E 88               [ 1]  332 	push	a
      00812F 7B 05            [ 1]  333 	ld	a, (0x05, sp)
      008131 88               [ 1]  334 	push	a
      008132 7B 05            [ 1]  335 	ld	a, (0x05, sp)
      008134 CD 80 A3         [ 4]  336 	call	_sendRGB
                                    337 ;	main.c: 64: sendRGB(Gbyte, Rbyte, Bbyte);
      008137 7B 05            [ 1]  338 	ld	a, (0x05, sp)
      008139 88               [ 1]  339 	push	a
      00813A 7B 05            [ 1]  340 	ld	a, (0x05, sp)
      00813C 88               [ 1]  341 	push	a
      00813D 7B 05            [ 1]  342 	ld	a, (0x05, sp)
      00813F CD 80 A3         [ 4]  343 	call	_sendRGB
                                    344 ;	main.c: 65: sendRGB(Gbyte, Rbyte, Bbyte);
      008142 7B 05            [ 1]  345 	ld	a, (0x05, sp)
      008144 88               [ 1]  346 	push	a
      008145 7B 05            [ 1]  347 	ld	a, (0x05, sp)
      008147 88               [ 1]  348 	push	a
      008148 7B 05            [ 1]  349 	ld	a, (0x05, sp)
      00814A CD 80 A3         [ 4]  350 	call	_sendRGB
                                    351 ;	main.c: 66: break;
      00814D CC 82 76         [ 2]  352 	jp	00111$
                                    353 ;	main.c: 67: case 5:
      008150                        354 00105$:
                                    355 ;	main.c: 68: sendRGB(Gbyte, Rbyte, Bbyte);
      008150 7B 05            [ 1]  356 	ld	a, (0x05, sp)
      008152 88               [ 1]  357 	push	a
      008153 7B 05            [ 1]  358 	ld	a, (0x05, sp)
      008155 88               [ 1]  359 	push	a
      008156 7B 05            [ 1]  360 	ld	a, (0x05, sp)
      008158 CD 80 A3         [ 4]  361 	call	_sendRGB
                                    362 ;	main.c: 69: sendRGB(Gbyte, Rbyte, Bbyte);
      00815B 7B 05            [ 1]  363 	ld	a, (0x05, sp)
      00815D 88               [ 1]  364 	push	a
      00815E 7B 05            [ 1]  365 	ld	a, (0x05, sp)
      008160 88               [ 1]  366 	push	a
      008161 7B 05            [ 1]  367 	ld	a, (0x05, sp)
      008163 CD 80 A3         [ 4]  368 	call	_sendRGB
                                    369 ;	main.c: 70: sendRGB(Gbyte, Rbyte, Bbyte);
      008166 7B 05            [ 1]  370 	ld	a, (0x05, sp)
      008168 88               [ 1]  371 	push	a
      008169 7B 05            [ 1]  372 	ld	a, (0x05, sp)
      00816B 88               [ 1]  373 	push	a
      00816C 7B 05            [ 1]  374 	ld	a, (0x05, sp)
      00816E CD 80 A3         [ 4]  375 	call	_sendRGB
                                    376 ;	main.c: 71: sendRGB(Gbyte, Rbyte, Bbyte);
      008171 7B 05            [ 1]  377 	ld	a, (0x05, sp)
      008173 88               [ 1]  378 	push	a
      008174 7B 05            [ 1]  379 	ld	a, (0x05, sp)
      008176 88               [ 1]  380 	push	a
      008177 7B 05            [ 1]  381 	ld	a, (0x05, sp)
      008179 CD 80 A3         [ 4]  382 	call	_sendRGB
                                    383 ;	main.c: 72: sendRGB(Gbyte, Rbyte, Bbyte);
      00817C 7B 05            [ 1]  384 	ld	a, (0x05, sp)
      00817E 88               [ 1]  385 	push	a
      00817F 7B 05            [ 1]  386 	ld	a, (0x05, sp)
      008181 88               [ 1]  387 	push	a
      008182 7B 05            [ 1]  388 	ld	a, (0x05, sp)
      008184 CD 80 A3         [ 4]  389 	call	_sendRGB
                                    390 ;	main.c: 73: break;
      008187 CC 82 76         [ 2]  391 	jp	00111$
                                    392 ;	main.c: 74: case 6:
      00818A                        393 00106$:
                                    394 ;	main.c: 75: sendRGB(Gbyte, Rbyte, Bbyte);
      00818A 7B 05            [ 1]  395 	ld	a, (0x05, sp)
      00818C 88               [ 1]  396 	push	a
      00818D 7B 05            [ 1]  397 	ld	a, (0x05, sp)
      00818F 88               [ 1]  398 	push	a
      008190 7B 05            [ 1]  399 	ld	a, (0x05, sp)
      008192 CD 80 A3         [ 4]  400 	call	_sendRGB
                                    401 ;	main.c: 76: sendRGB(Gbyte, Rbyte, Bbyte);
      008195 7B 05            [ 1]  402 	ld	a, (0x05, sp)
      008197 88               [ 1]  403 	push	a
      008198 7B 05            [ 1]  404 	ld	a, (0x05, sp)
      00819A 88               [ 1]  405 	push	a
      00819B 7B 05            [ 1]  406 	ld	a, (0x05, sp)
      00819D CD 80 A3         [ 4]  407 	call	_sendRGB
                                    408 ;	main.c: 77: sendRGB(Gbyte, Rbyte, Bbyte);
      0081A0 7B 05            [ 1]  409 	ld	a, (0x05, sp)
      0081A2 88               [ 1]  410 	push	a
      0081A3 7B 05            [ 1]  411 	ld	a, (0x05, sp)
      0081A5 88               [ 1]  412 	push	a
      0081A6 7B 05            [ 1]  413 	ld	a, (0x05, sp)
      0081A8 CD 80 A3         [ 4]  414 	call	_sendRGB
                                    415 ;	main.c: 78: sendRGB(Gbyte, Rbyte, Bbyte);
      0081AB 7B 05            [ 1]  416 	ld	a, (0x05, sp)
      0081AD 88               [ 1]  417 	push	a
      0081AE 7B 05            [ 1]  418 	ld	a, (0x05, sp)
      0081B0 88               [ 1]  419 	push	a
      0081B1 7B 05            [ 1]  420 	ld	a, (0x05, sp)
      0081B3 CD 80 A3         [ 4]  421 	call	_sendRGB
                                    422 ;	main.c: 79: sendRGB(Gbyte, Rbyte, Bbyte);
      0081B6 7B 05            [ 1]  423 	ld	a, (0x05, sp)
      0081B8 88               [ 1]  424 	push	a
      0081B9 7B 05            [ 1]  425 	ld	a, (0x05, sp)
      0081BB 88               [ 1]  426 	push	a
      0081BC 7B 05            [ 1]  427 	ld	a, (0x05, sp)
      0081BE CD 80 A3         [ 4]  428 	call	_sendRGB
                                    429 ;	main.c: 80: sendRGB(Gbyte, Rbyte, Bbyte);
      0081C1 7B 05            [ 1]  430 	ld	a, (0x05, sp)
      0081C3 88               [ 1]  431 	push	a
      0081C4 7B 05            [ 1]  432 	ld	a, (0x05, sp)
      0081C6 88               [ 1]  433 	push	a
      0081C7 7B 05            [ 1]  434 	ld	a, (0x05, sp)
      0081C9 CD 80 A3         [ 4]  435 	call	_sendRGB
                                    436 ;	main.c: 81: break;
      0081CC CC 82 76         [ 2]  437 	jp	00111$
                                    438 ;	main.c: 82: case 7:
      0081CF                        439 00107$:
                                    440 ;	main.c: 83: sendRGB(Gbyte, Rbyte, Bbyte);
      0081CF 7B 05            [ 1]  441 	ld	a, (0x05, sp)
      0081D1 88               [ 1]  442 	push	a
      0081D2 7B 05            [ 1]  443 	ld	a, (0x05, sp)
      0081D4 88               [ 1]  444 	push	a
      0081D5 7B 05            [ 1]  445 	ld	a, (0x05, sp)
      0081D7 CD 80 A3         [ 4]  446 	call	_sendRGB
                                    447 ;	main.c: 84: sendRGB(Gbyte, Rbyte, Bbyte);
      0081DA 7B 05            [ 1]  448 	ld	a, (0x05, sp)
      0081DC 88               [ 1]  449 	push	a
      0081DD 7B 05            [ 1]  450 	ld	a, (0x05, sp)
      0081DF 88               [ 1]  451 	push	a
      0081E0 7B 05            [ 1]  452 	ld	a, (0x05, sp)
      0081E2 CD 80 A3         [ 4]  453 	call	_sendRGB
                                    454 ;	main.c: 85: sendRGB(Gbyte, Rbyte, Bbyte);
      0081E5 7B 05            [ 1]  455 	ld	a, (0x05, sp)
      0081E7 88               [ 1]  456 	push	a
      0081E8 7B 05            [ 1]  457 	ld	a, (0x05, sp)
      0081EA 88               [ 1]  458 	push	a
      0081EB 7B 05            [ 1]  459 	ld	a, (0x05, sp)
      0081ED CD 80 A3         [ 4]  460 	call	_sendRGB
                                    461 ;	main.c: 86: sendRGB(Gbyte, Rbyte, Bbyte);
      0081F0 7B 05            [ 1]  462 	ld	a, (0x05, sp)
      0081F2 88               [ 1]  463 	push	a
      0081F3 7B 05            [ 1]  464 	ld	a, (0x05, sp)
      0081F5 88               [ 1]  465 	push	a
      0081F6 7B 05            [ 1]  466 	ld	a, (0x05, sp)
      0081F8 CD 80 A3         [ 4]  467 	call	_sendRGB
                                    468 ;	main.c: 87: sendRGB(Gbyte, Rbyte, Bbyte);
      0081FB 7B 05            [ 1]  469 	ld	a, (0x05, sp)
      0081FD 88               [ 1]  470 	push	a
      0081FE 7B 05            [ 1]  471 	ld	a, (0x05, sp)
      008200 88               [ 1]  472 	push	a
      008201 7B 05            [ 1]  473 	ld	a, (0x05, sp)
      008203 CD 80 A3         [ 4]  474 	call	_sendRGB
                                    475 ;	main.c: 88: sendRGB(Gbyte, Rbyte, Bbyte);
      008206 7B 05            [ 1]  476 	ld	a, (0x05, sp)
      008208 88               [ 1]  477 	push	a
      008209 7B 05            [ 1]  478 	ld	a, (0x05, sp)
      00820B 88               [ 1]  479 	push	a
      00820C 7B 05            [ 1]  480 	ld	a, (0x05, sp)
      00820E CD 80 A3         [ 4]  481 	call	_sendRGB
                                    482 ;	main.c: 89: sendRGB(Gbyte, Rbyte, Bbyte);
      008211 7B 05            [ 1]  483 	ld	a, (0x05, sp)
      008213 88               [ 1]  484 	push	a
      008214 7B 05            [ 1]  485 	ld	a, (0x05, sp)
      008216 88               [ 1]  486 	push	a
      008217 7B 05            [ 1]  487 	ld	a, (0x05, sp)
      008219 CD 80 A3         [ 4]  488 	call	_sendRGB
                                    489 ;	main.c: 90: break;
      00821C 20 58            [ 2]  490 	jra	00111$
                                    491 ;	main.c: 91: case 8:
      00821E                        492 00108$:
                                    493 ;	main.c: 92: sendRGB(Gbyte, Rbyte, Bbyte);
      00821E 7B 05            [ 1]  494 	ld	a, (0x05, sp)
      008220 88               [ 1]  495 	push	a
      008221 7B 05            [ 1]  496 	ld	a, (0x05, sp)
      008223 88               [ 1]  497 	push	a
      008224 7B 05            [ 1]  498 	ld	a, (0x05, sp)
      008226 CD 80 A3         [ 4]  499 	call	_sendRGB
                                    500 ;	main.c: 93: sendRGB(Gbyte, Rbyte, Bbyte);
      008229 7B 05            [ 1]  501 	ld	a, (0x05, sp)
      00822B 88               [ 1]  502 	push	a
      00822C 7B 05            [ 1]  503 	ld	a, (0x05, sp)
      00822E 88               [ 1]  504 	push	a
      00822F 7B 05            [ 1]  505 	ld	a, (0x05, sp)
      008231 CD 80 A3         [ 4]  506 	call	_sendRGB
                                    507 ;	main.c: 94: sendRGB(Gbyte, Rbyte, Bbyte);
      008234 7B 05            [ 1]  508 	ld	a, (0x05, sp)
      008236 88               [ 1]  509 	push	a
      008237 7B 05            [ 1]  510 	ld	a, (0x05, sp)
      008239 88               [ 1]  511 	push	a
      00823A 7B 05            [ 1]  512 	ld	a, (0x05, sp)
      00823C CD 80 A3         [ 4]  513 	call	_sendRGB
                                    514 ;	main.c: 95: sendRGB(Gbyte, Rbyte, Bbyte);
      00823F 7B 05            [ 1]  515 	ld	a, (0x05, sp)
      008241 88               [ 1]  516 	push	a
      008242 7B 05            [ 1]  517 	ld	a, (0x05, sp)
      008244 88               [ 1]  518 	push	a
      008245 7B 05            [ 1]  519 	ld	a, (0x05, sp)
      008247 CD 80 A3         [ 4]  520 	call	_sendRGB
                                    521 ;	main.c: 96: sendRGB(Gbyte, Rbyte, Bbyte);
      00824A 7B 05            [ 1]  522 	ld	a, (0x05, sp)
      00824C 88               [ 1]  523 	push	a
      00824D 7B 05            [ 1]  524 	ld	a, (0x05, sp)
      00824F 88               [ 1]  525 	push	a
      008250 7B 05            [ 1]  526 	ld	a, (0x05, sp)
      008252 CD 80 A3         [ 4]  527 	call	_sendRGB
                                    528 ;	main.c: 97: sendRGB(Gbyte, Rbyte, Bbyte);
      008255 7B 05            [ 1]  529 	ld	a, (0x05, sp)
      008257 88               [ 1]  530 	push	a
      008258 7B 05            [ 1]  531 	ld	a, (0x05, sp)
      00825A 88               [ 1]  532 	push	a
      00825B 7B 05            [ 1]  533 	ld	a, (0x05, sp)
      00825D CD 80 A3         [ 4]  534 	call	_sendRGB
                                    535 ;	main.c: 98: sendRGB(Gbyte, Rbyte, Bbyte);
      008260 7B 05            [ 1]  536 	ld	a, (0x05, sp)
      008262 88               [ 1]  537 	push	a
      008263 7B 05            [ 1]  538 	ld	a, (0x05, sp)
      008265 88               [ 1]  539 	push	a
      008266 7B 05            [ 1]  540 	ld	a, (0x05, sp)
      008268 CD 80 A3         [ 4]  541 	call	_sendRGB
                                    542 ;	main.c: 99: sendRGB(Gbyte, Rbyte, Bbyte);
      00826B 7B 05            [ 1]  543 	ld	a, (0x05, sp)
      00826D 88               [ 1]  544 	push	a
      00826E 7B 05            [ 1]  545 	ld	a, (0x05, sp)
      008270 88               [ 1]  546 	push	a
      008271 7B 05            [ 1]  547 	ld	a, (0x05, sp)
      008273 CD 80 A3         [ 4]  548 	call	_sendRGB
                                    549 ;	main.c: 103: }
      008276                        550 00111$:
                                    551 ;	main.c: 104: }
      008276 1E 01            [ 2]  552 	ldw	x, (1, sp)
      008278 5B 05            [ 2]  553 	addw	sp, #5
      00827A FC               [ 2]  554 	jp	(x)
                                    555 ;	main.c: 106: void hieuung1(uint8_t r, uint8_t g, uint8_t b)
                                    556 ;	-----------------------------------------
                                    557 ;	 function hieuung1
                                    558 ;	-----------------------------------------
      00827B                        559 _hieuung1:
      00827B 52 05            [ 2]  560 	sub	sp, #5
      00827D 6B 01            [ 1]  561 	ld	(0x01, sp), a
                                    562 ;	main.c: 108: uint8_t rev_r = 0, rev_g = 0, rev_b = 0;
      00827F 0F 02            [ 1]  563 	clr	(0x02, sp)
      008281 0F 03            [ 1]  564 	clr	(0x03, sp)
      008283 0F 04            [ 1]  565 	clr	(0x04, sp)
                                    566 ;	main.c: 110: for (uint8_t i = 0; i < 8; i++)
      008285 0F 05            [ 1]  567 	clr	(0x05, sp)
      008287                        568 00105$:
      008287 7B 05            [ 1]  569 	ld	a, (0x05, sp)
      008289 A1 08            [ 1]  570 	cp	a, #0x08
      00828B 24 33            [ 1]  571 	jrnc	00101$
                                    572 ;	main.c: 111: rev_r |= (((r >> (7 - i)) & 1) ? (1 << i) : 0);
      00828D A6 07            [ 1]  573 	ld	a, #0x07
      00828F 10 05            [ 1]  574 	sub	a, (0x05, sp)
      008291 41               [ 1]  575 	exg	a, xl
      008292 7B 01            [ 1]  576 	ld	a, (0x01, sp)
      008294 41               [ 1]  577 	exg	a, xl
      008295 4D               [ 1]  578 	tnz	a
      008296 27 06            [ 1]  579 	jreq	00171$
      008298                        580 00170$:
      008298 41               [ 1]  581 	exg	a, xl
      008299 44               [ 1]  582 	srl	a
      00829A 41               [ 1]  583 	exg	a, xl
      00829B 4A               [ 1]  584 	dec	a
      00829C 26 FA            [ 1]  585 	jrne	00170$
      00829E                        586 00171$:
      00829E 54               [ 2]  587 	srlw	x
      00829F 24 15            [ 1]  588 	jrnc	00115$
      0082A1 7B 05            [ 1]  589 	ld	a, (0x05, sp)
      0082A3 41               [ 1]  590 	exg	a, xl
      0082A4 A6 01            [ 1]  591 	ld	a, #0x01
      0082A6 41               [ 1]  592 	exg	a, xl
      0082A7 4D               [ 1]  593 	tnz	a
      0082A8 27 06            [ 1]  594 	jreq	00174$
      0082AA                        595 00173$:
      0082AA 41               [ 1]  596 	exg	a, xl
      0082AB 48               [ 1]  597 	sll	a
      0082AC 41               [ 1]  598 	exg	a, xl
      0082AD 4A               [ 1]  599 	dec	a
      0082AE 26 FA            [ 1]  600 	jrne	00173$
      0082B0                        601 00174$:
      0082B0 9F               [ 1]  602 	ld	a, xl
      0082B1 49               [ 1]  603 	rlc	a
      0082B2 4F               [ 1]  604 	clr	a
      0082B3 A2 00            [ 1]  605 	sbc	a, #0x00
      0082B5 21                     606 	.byte 0x21
      0082B6                        607 00115$:
      0082B6 5F               [ 1]  608 	clrw	x
      0082B7                        609 00116$:
      0082B7 9F               [ 1]  610 	ld	a, xl
      0082B8 1A 02            [ 1]  611 	or	a, (0x02, sp)
      0082BA 6B 02            [ 1]  612 	ld	(0x02, sp), a
                                    613 ;	main.c: 110: for (uint8_t i = 0; i < 8; i++)
      0082BC 0C 05            [ 1]  614 	inc	(0x05, sp)
      0082BE 20 C7            [ 2]  615 	jra	00105$
      0082C0                        616 00101$:
                                    617 ;	main.c: 112: for (uint8_t i = 0; i < 8; i++)
      0082C0 0F 05            [ 1]  618 	clr	(0x05, sp)
      0082C2                        619 00108$:
      0082C2 7B 05            [ 1]  620 	ld	a, (0x05, sp)
      0082C4 A1 08            [ 1]  621 	cp	a, #0x08
      0082C6 24 33            [ 1]  622 	jrnc	00102$
                                    623 ;	main.c: 113: rev_g |= (((g >> (7 - i)) & 1) ? (1 << i) : 0);
      0082C8 A6 07            [ 1]  624 	ld	a, #0x07
      0082CA 10 05            [ 1]  625 	sub	a, (0x05, sp)
      0082CC 41               [ 1]  626 	exg	a, xl
      0082CD 7B 08            [ 1]  627 	ld	a, (0x08, sp)
      0082CF 41               [ 1]  628 	exg	a, xl
      0082D0 4D               [ 1]  629 	tnz	a
      0082D1 27 06            [ 1]  630 	jreq	00177$
      0082D3                        631 00176$:
      0082D3 41               [ 1]  632 	exg	a, xl
      0082D4 44               [ 1]  633 	srl	a
      0082D5 41               [ 1]  634 	exg	a, xl
      0082D6 4A               [ 1]  635 	dec	a
      0082D7 26 FA            [ 1]  636 	jrne	00176$
      0082D9                        637 00177$:
      0082D9 54               [ 2]  638 	srlw	x
      0082DA 24 15            [ 1]  639 	jrnc	00117$
      0082DC 7B 05            [ 1]  640 	ld	a, (0x05, sp)
      0082DE 41               [ 1]  641 	exg	a, xl
      0082DF A6 01            [ 1]  642 	ld	a, #0x01
      0082E1 41               [ 1]  643 	exg	a, xl
      0082E2 4D               [ 1]  644 	tnz	a
      0082E3 27 06            [ 1]  645 	jreq	00180$
      0082E5                        646 00179$:
      0082E5 41               [ 1]  647 	exg	a, xl
      0082E6 48               [ 1]  648 	sll	a
      0082E7 41               [ 1]  649 	exg	a, xl
      0082E8 4A               [ 1]  650 	dec	a
      0082E9 26 FA            [ 1]  651 	jrne	00179$
      0082EB                        652 00180$:
      0082EB 9F               [ 1]  653 	ld	a, xl
      0082EC 49               [ 1]  654 	rlc	a
      0082ED 4F               [ 1]  655 	clr	a
      0082EE A2 00            [ 1]  656 	sbc	a, #0x00
      0082F0 21                     657 	.byte 0x21
      0082F1                        658 00117$:
      0082F1 5F               [ 1]  659 	clrw	x
      0082F2                        660 00118$:
      0082F2 9F               [ 1]  661 	ld	a, xl
      0082F3 1A 03            [ 1]  662 	or	a, (0x03, sp)
      0082F5 6B 03            [ 1]  663 	ld	(0x03, sp), a
                                    664 ;	main.c: 112: for (uint8_t i = 0; i < 8; i++)
      0082F7 0C 05            [ 1]  665 	inc	(0x05, sp)
      0082F9 20 C7            [ 2]  666 	jra	00108$
      0082FB                        667 00102$:
                                    668 ;	main.c: 114: for (uint8_t i = 0; i < 8; i++)
      0082FB 0F 05            [ 1]  669 	clr	(0x05, sp)
      0082FD                        670 00111$:
      0082FD 7B 05            [ 1]  671 	ld	a, (0x05, sp)
      0082FF A1 08            [ 1]  672 	cp	a, #0x08
      008301 24 33            [ 1]  673 	jrnc	00103$
                                    674 ;	main.c: 115: rev_b |= (((b >> (7 - i)) & 1) ? (1 << i) : 0);
      008303 A6 07            [ 1]  675 	ld	a, #0x07
      008305 10 05            [ 1]  676 	sub	a, (0x05, sp)
      008307 41               [ 1]  677 	exg	a, xl
      008308 7B 09            [ 1]  678 	ld	a, (0x09, sp)
      00830A 41               [ 1]  679 	exg	a, xl
      00830B 4D               [ 1]  680 	tnz	a
      00830C 27 06            [ 1]  681 	jreq	00183$
      00830E                        682 00182$:
      00830E 41               [ 1]  683 	exg	a, xl
      00830F 44               [ 1]  684 	srl	a
      008310 41               [ 1]  685 	exg	a, xl
      008311 4A               [ 1]  686 	dec	a
      008312 26 FA            [ 1]  687 	jrne	00182$
      008314                        688 00183$:
      008314 54               [ 2]  689 	srlw	x
      008315 24 15            [ 1]  690 	jrnc	00119$
      008317 7B 05            [ 1]  691 	ld	a, (0x05, sp)
      008319 41               [ 1]  692 	exg	a, xl
      00831A A6 01            [ 1]  693 	ld	a, #0x01
      00831C 41               [ 1]  694 	exg	a, xl
      00831D 4D               [ 1]  695 	tnz	a
      00831E 27 06            [ 1]  696 	jreq	00186$
      008320                        697 00185$:
      008320 41               [ 1]  698 	exg	a, xl
      008321 48               [ 1]  699 	sll	a
      008322 41               [ 1]  700 	exg	a, xl
      008323 4A               [ 1]  701 	dec	a
      008324 26 FA            [ 1]  702 	jrne	00185$
      008326                        703 00186$:
      008326 9F               [ 1]  704 	ld	a, xl
      008327 49               [ 1]  705 	rlc	a
      008328 4F               [ 1]  706 	clr	a
      008329 A2 00            [ 1]  707 	sbc	a, #0x00
      00832B 21                     708 	.byte 0x21
      00832C                        709 00119$:
      00832C 5F               [ 1]  710 	clrw	x
      00832D                        711 00120$:
      00832D 9F               [ 1]  712 	ld	a, xl
      00832E 1A 04            [ 1]  713 	or	a, (0x04, sp)
      008330 6B 04            [ 1]  714 	ld	(0x04, sp), a
                                    715 ;	main.c: 114: for (uint8_t i = 0; i < 8; i++)
      008332 0C 05            [ 1]  716 	inc	(0x05, sp)
      008334 20 C7            [ 2]  717 	jra	00111$
      008336                        718 00103$:
                                    719 ;	main.c: 117: number(8, rev_r, rev_g, rev_b);
      008336 7B 04            [ 1]  720 	ld	a, (0x04, sp)
      008338 88               [ 1]  721 	push	a
      008339 7B 04            [ 1]  722 	ld	a, (0x04, sp)
      00833B 88               [ 1]  723 	push	a
      00833C 7B 04            [ 1]  724 	ld	a, (0x04, sp)
      00833E 88               [ 1]  725 	push	a
      00833F A6 08            [ 1]  726 	ld	a, #0x08
      008341 CD 80 B6         [ 4]  727 	call	_number
                                    728 ;	main.c: 118: }
      008344 1E 06            [ 2]  729 	ldw	x, (6, sp)
      008346 5B 09            [ 2]  730 	addw	sp, #9
      008348 FC               [ 2]  731 	jp	(x)
                                    732 ;	main.c: 121: void Timer4Config(void)
                                    733 ;	-----------------------------------------
                                    734 ;	 function Timer4Config
                                    735 ;	-----------------------------------------
      008349                        736 _Timer4Config:
                                    737 ;	main.c: 123: TIM4->PSCR = (uint8_t)0x07;
      008349 35 07 53 47      [ 1]  738 	mov	0x5347+0, #0x07
                                    739 ;	main.c: 124: TIM4->ARR = (uint8_t)125 - 1;
      00834D 35 7C 53 48      [ 1]  740 	mov	0x5348+0, #0x7c
                                    741 ;	main.c: 126: TIM4->CR1 |= TIM4_CR1_CEN;
      008351 72 10 53 40      [ 1]  742 	bset	0x5340, #0
                                    743 ;	main.c: 127: }
      008355 81               [ 4]  744 	ret
                                    745 ;	main.c: 128: void Timer4DelayMs(uint16_t u16Delay)
                                    746 ;	-----------------------------------------
                                    747 ;	 function Timer4DelayMs
                                    748 ;	-----------------------------------------
      008356                        749 _Timer4DelayMs:
                                    750 ;	main.c: 130: while (u16Delay)
      008356                        751 00104$:
      008356 5D               [ 2]  752 	tnzw	x
      008357 26 01            [ 1]  753 	jrne	00130$
      008359 81               [ 4]  754 	ret
      00835A                        755 00130$:
                                    756 ;	main.c: 132: TIM4->CNTR = (uint8_t)0;
      00835A 35 00 53 46      [ 1]  757 	mov	0x5346+0, #0x00
                                    758 ;	main.c: 134: TIM4->SR1 = (uint8_t)(~0x01);
      00835E 35 FE 53 44      [ 1]  759 	mov	0x5344+0, #0xfe
                                    760 ;	main.c: 135: while ((TIM4->SR1 & (uint8_t)0x01) == RESET)
      008362                        761 00101$:
      008362 72 01 53 44 FB   [ 2]  762 	btjf	0x5344, #0, 00101$
                                    763 ;	main.c: 138: --u16Delay;
      008367 5A               [ 2]  764 	decw	x
      008368 20 EC            [ 2]  765 	jra	00104$
                                    766 ;	main.c: 140: }
      00836A 81               [ 4]  767 	ret
                                    768 ;	main.c: 141: void clearLEDs(void)
                                    769 ;	-----------------------------------------
                                    770 ;	 function clearLEDs
                                    771 ;	-----------------------------------------
      00836B                        772 _clearLEDs:
                                    773 ;	main.c: 143: number(8, 0, 0, 0);
      00836B 4B 00            [ 1]  774 	push	#0x00
      00836D 4B 00            [ 1]  775 	push	#0x00
      00836F 4B 00            [ 1]  776 	push	#0x00
      008371 A6 08            [ 1]  777 	ld	a, #0x08
      008373 CD 80 B6         [ 4]  778 	call	_number
                                    779 ;	main.c: 144: Timer4DelayMs(50);
      008376 AE 00 32         [ 2]  780 	ldw	x, #0x0032
                                    781 ;	main.c: 145: }
      008379 CC 83 56         [ 2]  782 	jp	_Timer4DelayMs
                                    783 ;	main.c: 147: void ChayLed1(void)
                                    784 ;	-----------------------------------------
                                    785 ;	 function ChayLed1
                                    786 ;	-----------------------------------------
      00837C                        787 _ChayLed1:
                                    788 ;	main.c: 149: r = rand() % 256;
      00837C CD 88 53         [ 4]  789 	call	_rand
      00837F 4B 00            [ 1]  790 	push	#0x00
      008381 4B 01            [ 1]  791 	push	#0x01
      008383 CD 88 CC         [ 4]  792 	call	__modsint
      008386 9F               [ 1]  793 	ld	a, xl
      008387 C7 00 02         [ 1]  794 	ld	_r+0, a
                                    795 ;	main.c: 150: g = rand() % 256;
      00838A CD 88 53         [ 4]  796 	call	_rand
      00838D 4B 00            [ 1]  797 	push	#0x00
      00838F 4B 01            [ 1]  798 	push	#0x01
      008391 CD 88 CC         [ 4]  799 	call	__modsint
      008394 9F               [ 1]  800 	ld	a, xl
      008395 C7 00 03         [ 1]  801 	ld	_g+0, a
                                    802 ;	main.c: 151: b = rand() % 256;
      008398 CD 88 53         [ 4]  803 	call	_rand
      00839B 4B 00            [ 1]  804 	push	#0x00
      00839D 4B 01            [ 1]  805 	push	#0x01
      00839F CD 88 CC         [ 4]  806 	call	__modsint
      0083A2 9F               [ 1]  807 	ld	a, xl
      0083A3 C7 00 04         [ 1]  808 	ld	_b+0, a
                                    809 ;	main.c: 152: for (i = 1; i < 9; i++)
      0083A6 35 01 00 01      [ 1]  810 	mov	_i+0, #0x01
      0083AA                        811 00102$:
                                    812 ;	main.c: 155: number(i, g, r, b);
      0083AA 3B 00 04         [ 1]  813 	push	_b+0
      0083AD 3B 00 02         [ 1]  814 	push	_r+0
      0083B0 3B 00 03         [ 1]  815 	push	_g+0
      0083B3 C6 00 01         [ 1]  816 	ld	a, _i+0
      0083B6 CD 80 B6         [ 4]  817 	call	_number
                                    818 ;	main.c: 156: Timer4DelayMs(TimeRun);
      0083B9 AE 00 28         [ 2]  819 	ldw	x, #0x0028
      0083BC CD 83 56         [ 4]  820 	call	_Timer4DelayMs
                                    821 ;	main.c: 152: for (i = 1; i < 9; i++)
      0083BF 72 5C 00 01      [ 1]  822 	inc	_i+0
      0083C3 C6 00 01         [ 1]  823 	ld	a, _i+0
      0083C6 A1 09            [ 1]  824 	cp	a, #0x09
      0083C8 25 E0            [ 1]  825 	jrc	00102$
                                    826 ;	main.c: 158: }
      0083CA 81               [ 4]  827 	ret
                                    828 ;	main.c: 160: void ChayLed2(void)
                                    829 ;	-----------------------------------------
                                    830 ;	 function ChayLed2
                                    831 ;	-----------------------------------------
      0083CB                        832 _ChayLed2:
                                    833 ;	main.c: 163: for (i = 0; i < 255; i++)
      0083CB 72 5F 00 01      [ 1]  834 	clr	_i+0
      0083CF                        835 00103$:
                                    836 ;	main.c: 165: number(8, i, 100, i);
      0083CF 3B 00 01         [ 1]  837 	push	_i+0
      0083D2 4B 64            [ 1]  838 	push	#0x64
      0083D4 3B 00 01         [ 1]  839 	push	_i+0
      0083D7 A6 08            [ 1]  840 	ld	a, #0x08
      0083D9 CD 80 B6         [ 4]  841 	call	_number
                                    842 ;	main.c: 166: Timer4DelayMs(10);
      0083DC AE 00 0A         [ 2]  843 	ldw	x, #0x000a
      0083DF CD 83 56         [ 4]  844 	call	_Timer4DelayMs
                                    845 ;	main.c: 163: for (i = 0; i < 255; i++)
      0083E2 72 5C 00 01      [ 1]  846 	inc	_i+0
      0083E6 C6 00 01         [ 1]  847 	ld	a, _i+0
      0083E9 A1 FF            [ 1]  848 	cp	a, #0xff
      0083EB 25 E2            [ 1]  849 	jrc	00103$
                                    850 ;	main.c: 169: for (i = 255; i > 0; i--)
      0083ED 35 FF 00 01      [ 1]  851 	mov	_i+0, #0xff
      0083F1                        852 00105$:
                                    853 ;	main.c: 171: number(8, i, 100, i);
      0083F1 3B 00 01         [ 1]  854 	push	_i+0
      0083F4 4B 64            [ 1]  855 	push	#0x64
      0083F6 3B 00 01         [ 1]  856 	push	_i+0
      0083F9 A6 08            [ 1]  857 	ld	a, #0x08
      0083FB CD 80 B6         [ 4]  858 	call	_number
                                    859 ;	main.c: 172: Timer4DelayMs(10);
      0083FE AE 00 0A         [ 2]  860 	ldw	x, #0x000a
      008401 CD 83 56         [ 4]  861 	call	_Timer4DelayMs
                                    862 ;	main.c: 169: for (i = 255; i > 0; i--)
      008404 72 5A 00 01      [ 1]  863 	dec	_i+0
      008408 C6 00 01         [ 1]  864 	ld	a, _i+0
      00840B 26 E4            [ 1]  865 	jrne	00105$
                                    866 ;	main.c: 174: }
      00840D 81               [ 4]  867 	ret
                                    868 ;	main.c: 175: void ChayLED4(void)
                                    869 ;	-----------------------------------------
                                    870 ;	 function ChayLED4
                                    871 ;	-----------------------------------------
      00840E                        872 _ChayLED4:
                                    873 ;	main.c: 177: for (i = 1; i < 9; i++)
      00840E 35 01 00 01      [ 1]  874 	mov	_i+0, #0x01
      008412                        875 00102$:
                                    876 ;	main.c: 179: number(i, 255, 51, 255);
      008412 4B FF            [ 1]  877 	push	#0xff
      008414 4B 33            [ 1]  878 	push	#0x33
      008416 4B FF            [ 1]  879 	push	#0xff
      008418 C6 00 01         [ 1]  880 	ld	a, _i+0
      00841B CD 80 B6         [ 4]  881 	call	_number
                                    882 ;	main.c: 180: Timer4DelayMs(TimeRun);
      00841E AE 00 28         [ 2]  883 	ldw	x, #0x0028
      008421 CD 83 56         [ 4]  884 	call	_Timer4DelayMs
                                    885 ;	main.c: 177: for (i = 1; i < 9; i++)
      008424 72 5C 00 01      [ 1]  886 	inc	_i+0
      008428 C6 00 01         [ 1]  887 	ld	a, _i+0
      00842B A1 09            [ 1]  888 	cp	a, #0x09
      00842D 25 E3            [ 1]  889 	jrc	00102$
                                    890 ;	main.c: 182: }
      00842F 81               [ 4]  891 	ret
                                    892 ;	main.c: 184: void ChayLED5(void)
                                    893 ;	-----------------------------------------
                                    894 ;	 function ChayLED5
                                    895 ;	-----------------------------------------
      008430                        896 _ChayLED5:
      008430 88               [ 1]  897 	push	a
                                    898 ;	main.c: 186: r = rand() % 256;
      008431 CD 88 53         [ 4]  899 	call	_rand
      008434 4B 00            [ 1]  900 	push	#0x00
      008436 4B 01            [ 1]  901 	push	#0x01
      008438 CD 88 CC         [ 4]  902 	call	__modsint
      00843B 9F               [ 1]  903 	ld	a, xl
      00843C C7 00 02         [ 1]  904 	ld	_r+0, a
                                    905 ;	main.c: 187: g = rand() % 256;
      00843F CD 88 53         [ 4]  906 	call	_rand
      008442 4B 00            [ 1]  907 	push	#0x00
      008444 4B 01            [ 1]  908 	push	#0x01
      008446 CD 88 CC         [ 4]  909 	call	__modsint
      008449 9F               [ 1]  910 	ld	a, xl
      00844A C7 00 03         [ 1]  911 	ld	_g+0, a
                                    912 ;	main.c: 188: b = rand() % 256;
      00844D CD 88 53         [ 4]  913 	call	_rand
      008450 4B 00            [ 1]  914 	push	#0x00
      008452 4B 01            [ 1]  915 	push	#0x01
      008454 CD 88 CC         [ 4]  916 	call	__modsint
      008457 9F               [ 1]  917 	ld	a, xl
      008458 C7 00 04         [ 1]  918 	ld	_b+0, a
                                    919 ;	main.c: 189: for (i = 8; i > 0; i--)
      00845B 35 08 00 01      [ 1]  920 	mov	_i+0, #0x08
      00845F                        921 00103$:
                                    922 ;	main.c: 191: number(i - 1, 0, 0, 0);
      00845F C6 00 01         [ 1]  923 	ld	a, _i+0
      008462 4A               [ 1]  924 	dec	a
      008463 4B 00            [ 1]  925 	push	#0x00
      008465 4B 00            [ 1]  926 	push	#0x00
      008467 4B 00            [ 1]  927 	push	#0x00
      008469 CD 80 B6         [ 4]  928 	call	_number
                                    929 ;	main.c: 192: number(9 - i, g, r, b);
      00846C C6 00 01         [ 1]  930 	ld	a, _i+0
      00846F 6B 01            [ 1]  931 	ld	(0x01, sp), a
      008471 A6 09            [ 1]  932 	ld	a, #0x09
      008473 10 01            [ 1]  933 	sub	a, (0x01, sp)
      008475 3B 00 04         [ 1]  934 	push	_b+0
      008478 3B 00 02         [ 1]  935 	push	_r+0
      00847B 3B 00 03         [ 1]  936 	push	_g+0
      00847E CD 80 B6         [ 4]  937 	call	_number
                                    938 ;	main.c: 193: Timer4DelayMs(100);
      008481 AE 00 64         [ 2]  939 	ldw	x, #0x0064
      008484 CD 83 56         [ 4]  940 	call	_Timer4DelayMs
                                    941 ;	main.c: 189: for (i = 8; i > 0; i--)
      008487 72 5A 00 01      [ 1]  942 	dec	_i+0
      00848B C6 00 01         [ 1]  943 	ld	a, _i+0
      00848E 26 CF            [ 1]  944 	jrne	00103$
                                    945 ;	main.c: 196: for (i = 1; i < 9; i++)
      008490 35 01 00 01      [ 1]  946 	mov	_i+0, #0x01
      008494                        947 00105$:
                                    948 ;	main.c: 198: number(i, 0, 0, 0);
      008494 4B 00            [ 1]  949 	push	#0x00
      008496 4B 00            [ 1]  950 	push	#0x00
      008498 4B 00            [ 1]  951 	push	#0x00
      00849A C6 00 01         [ 1]  952 	ld	a, _i+0
      00849D CD 80 B6         [ 4]  953 	call	_number
                                    954 ;	main.c: 199: Timer4DelayMs(100);
      0084A0 AE 00 64         [ 2]  955 	ldw	x, #0x0064
      0084A3 CD 83 56         [ 4]  956 	call	_Timer4DelayMs
                                    957 ;	main.c: 196: for (i = 1; i < 9; i++)
      0084A6 72 5C 00 01      [ 1]  958 	inc	_i+0
      0084AA C6 00 01         [ 1]  959 	ld	a, _i+0
      0084AD A1 09            [ 1]  960 	cp	a, #0x09
      0084AF 25 E3            [ 1]  961 	jrc	00105$
                                    962 ;	main.c: 201: }
      0084B1 84               [ 1]  963 	pop	a
      0084B2 81               [ 4]  964 	ret
                                    965 ;	main.c: 203: void NhapNhay1(void)
                                    966 ;	-----------------------------------------
                                    967 ;	 function NhapNhay1
                                    968 ;	-----------------------------------------
      0084B3                        969 _NhapNhay1:
                                    970 ;	main.c: 205: for (i = 0; i < 255; i++)
      0084B3 72 5F 00 01      [ 1]  971 	clr	_i+0
      0084B7                        972 00103$:
                                    973 ;	main.c: 207: number(8, i, 100, i);
      0084B7 3B 00 01         [ 1]  974 	push	_i+0
      0084BA 4B 64            [ 1]  975 	push	#0x64
      0084BC 3B 00 01         [ 1]  976 	push	_i+0
      0084BF A6 08            [ 1]  977 	ld	a, #0x08
      0084C1 CD 80 B6         [ 4]  978 	call	_number
                                    979 ;	main.c: 208: Timer4DelayMs(10);
      0084C4 AE 00 0A         [ 2]  980 	ldw	x, #0x000a
      0084C7 CD 83 56         [ 4]  981 	call	_Timer4DelayMs
                                    982 ;	main.c: 205: for (i = 0; i < 255; i++)
      0084CA 72 5C 00 01      [ 1]  983 	inc	_i+0
      0084CE C6 00 01         [ 1]  984 	ld	a, _i+0
      0084D1 A1 FF            [ 1]  985 	cp	a, #0xff
      0084D3 25 E2            [ 1]  986 	jrc	00103$
                                    987 ;	main.c: 211: for (i = 255; i > 0; i--)
      0084D5 35 FF 00 01      [ 1]  988 	mov	_i+0, #0xff
      0084D9                        989 00105$:
                                    990 ;	main.c: 213: number(8, i, 100, i);
      0084D9 3B 00 01         [ 1]  991 	push	_i+0
      0084DC 4B 64            [ 1]  992 	push	#0x64
      0084DE 3B 00 01         [ 1]  993 	push	_i+0
      0084E1 A6 08            [ 1]  994 	ld	a, #0x08
      0084E3 CD 80 B6         [ 4]  995 	call	_number
                                    996 ;	main.c: 214: Timer4DelayMs(10);
      0084E6 AE 00 0A         [ 2]  997 	ldw	x, #0x000a
      0084E9 CD 83 56         [ 4]  998 	call	_Timer4DelayMs
                                    999 ;	main.c: 211: for (i = 255; i > 0; i--)
      0084EC 72 5A 00 01      [ 1] 1000 	dec	_i+0
      0084F0 C6 00 01         [ 1] 1001 	ld	a, _i+0
      0084F3 26 E4            [ 1] 1002 	jrne	00105$
                                   1003 ;	main.c: 216: }
      0084F5 81               [ 4] 1004 	ret
                                   1005 ;	main.c: 218: void NhapNhayRED(void)
                                   1006 ;	-----------------------------------------
                                   1007 ;	 function NhapNhayRED
                                   1008 ;	-----------------------------------------
      0084F6                       1009 _NhapNhayRED:
                                   1010 ;	main.c: 220: for (i = 0; i < 255; i++)
      0084F6 72 5F 00 01      [ 1] 1011 	clr	_i+0
      0084FA                       1012 00103$:
                                   1013 ;	main.c: 222: number(8, 0, i, 0);
      0084FA 4B 00            [ 1] 1014 	push	#0x00
      0084FC 3B 00 01         [ 1] 1015 	push	_i+0
      0084FF 4B 00            [ 1] 1016 	push	#0x00
      008501 A6 08            [ 1] 1017 	ld	a, #0x08
      008503 CD 80 B6         [ 4] 1018 	call	_number
                                   1019 ;	main.c: 223: Timer4DelayMs(1);
      008506 5F               [ 1] 1020 	clrw	x
      008507 5C               [ 1] 1021 	incw	x
      008508 CD 83 56         [ 4] 1022 	call	_Timer4DelayMs
                                   1023 ;	main.c: 220: for (i = 0; i < 255; i++)
      00850B 72 5C 00 01      [ 1] 1024 	inc	_i+0
      00850F C6 00 01         [ 1] 1025 	ld	a, _i+0
      008512 A1 FF            [ 1] 1026 	cp	a, #0xff
      008514 25 E4            [ 1] 1027 	jrc	00103$
                                   1028 ;	main.c: 226: for (i = 255; i > 0; i--)
      008516 35 FF 00 01      [ 1] 1029 	mov	_i+0, #0xff
      00851A                       1030 00105$:
                                   1031 ;	main.c: 228: number(8, 0, i, 0);
      00851A 4B 00            [ 1] 1032 	push	#0x00
      00851C 3B 00 01         [ 1] 1033 	push	_i+0
      00851F 4B 00            [ 1] 1034 	push	#0x00
      008521 A6 08            [ 1] 1035 	ld	a, #0x08
      008523 CD 80 B6         [ 4] 1036 	call	_number
                                   1037 ;	main.c: 229: Timer4DelayMs(1);
      008526 5F               [ 1] 1038 	clrw	x
      008527 5C               [ 1] 1039 	incw	x
      008528 CD 83 56         [ 4] 1040 	call	_Timer4DelayMs
                                   1041 ;	main.c: 226: for (i = 255; i > 0; i--)
      00852B 72 5A 00 01      [ 1] 1042 	dec	_i+0
      00852F C6 00 01         [ 1] 1043 	ld	a, _i+0
      008532 26 E6            [ 1] 1044 	jrne	00105$
                                   1045 ;	main.c: 231: }
      008534 81               [ 4] 1046 	ret
                                   1047 ;	main.c: 233: void HaiMau(void)
                                   1048 ;	-----------------------------------------
                                   1049 ;	 function HaiMau
                                   1050 ;	-----------------------------------------
      008535                       1051 _HaiMau:
                                   1052 ;	main.c: 235: number(4, 255, 51, 255);
      008535 4B FF            [ 1] 1053 	push	#0xff
      008537 4B 33            [ 1] 1054 	push	#0x33
      008539 4B FF            [ 1] 1055 	push	#0xff
      00853B A6 04            [ 1] 1056 	ld	a, #0x04
      00853D CD 80 B6         [ 4] 1057 	call	_number
                                   1058 ;	main.c: 236: number(4, 60, 255, 60);
      008540 4B 3C            [ 1] 1059 	push	#0x3c
      008542 4B FF            [ 1] 1060 	push	#0xff
      008544 4B 3C            [ 1] 1061 	push	#0x3c
      008546 A6 04            [ 1] 1062 	ld	a, #0x04
      008548 CD 80 B6         [ 4] 1063 	call	_number
                                   1064 ;	main.c: 237: }
      00854B 81               [ 4] 1065 	ret
                                   1066 ;	main.c: 239: void Chay1LED(void)
                                   1067 ;	-----------------------------------------
                                   1068 ;	 function Chay1LED
                                   1069 ;	-----------------------------------------
      00854C                       1070 _Chay1LED:
      00854C 88               [ 1] 1071 	push	a
                                   1072 ;	main.c: 241: r = rand() % 256;
      00854D CD 88 53         [ 4] 1073 	call	_rand
      008550 4B 00            [ 1] 1074 	push	#0x00
      008552 4B 01            [ 1] 1075 	push	#0x01
      008554 CD 88 CC         [ 4] 1076 	call	__modsint
      008557 9F               [ 1] 1077 	ld	a, xl
      008558 C7 00 02         [ 1] 1078 	ld	_r+0, a
                                   1079 ;	main.c: 242: g = rand() % 256;
      00855B CD 88 53         [ 4] 1080 	call	_rand
      00855E 4B 00            [ 1] 1081 	push	#0x00
      008560 4B 01            [ 1] 1082 	push	#0x01
      008562 CD 88 CC         [ 4] 1083 	call	__modsint
      008565 9F               [ 1] 1084 	ld	a, xl
      008566 C7 00 03         [ 1] 1085 	ld	_g+0, a
                                   1086 ;	main.c: 243: b = rand() % 256;
      008569 CD 88 53         [ 4] 1087 	call	_rand
      00856C 4B 00            [ 1] 1088 	push	#0x00
      00856E 4B 01            [ 1] 1089 	push	#0x01
      008570 CD 88 CC         [ 4] 1090 	call	__modsint
      008573 9F               [ 1] 1091 	ld	a, xl
      008574 C7 00 04         [ 1] 1092 	ld	_b+0, a
                                   1093 ;	main.c: 244: for (i = 1; i < 9; i++)
      008577 35 01 00 01      [ 1] 1094 	mov	_i+0, #0x01
      00857B                       1095 00102$:
                                   1096 ;	main.c: 246: number(i - 1, 0, 0, 0);
      00857B C6 00 01         [ 1] 1097 	ld	a, _i+0
      00857E 4A               [ 1] 1098 	dec	a
      00857F 4B 00            [ 1] 1099 	push	#0x00
      008581 4B 00            [ 1] 1100 	push	#0x00
      008583 4B 00            [ 1] 1101 	push	#0x00
      008585 CD 80 B6         [ 4] 1102 	call	_number
                                   1103 ;	main.c: 247: number(2, g, r, b);
      008588 3B 00 04         [ 1] 1104 	push	_b+0
      00858B 3B 00 02         [ 1] 1105 	push	_r+0
      00858E 3B 00 03         [ 1] 1106 	push	_g+0
      008591 A6 02            [ 1] 1107 	ld	a, #0x02
      008593 CD 80 B6         [ 4] 1108 	call	_number
                                   1109 ;	main.c: 248: number(7 - i, 0, 0, 0);
      008596 C6 00 01         [ 1] 1110 	ld	a, _i+0
      008599 6B 01            [ 1] 1111 	ld	(0x01, sp), a
      00859B A6 07            [ 1] 1112 	ld	a, #0x07
      00859D 10 01            [ 1] 1113 	sub	a, (0x01, sp)
      00859F 4B 00            [ 1] 1114 	push	#0x00
      0085A1 4B 00            [ 1] 1115 	push	#0x00
      0085A3 4B 00            [ 1] 1116 	push	#0x00
      0085A5 CD 80 B6         [ 4] 1117 	call	_number
                                   1118 ;	main.c: 249: Timer4DelayMs(100);
      0085A8 AE 00 64         [ 2] 1119 	ldw	x, #0x0064
      0085AB CD 83 56         [ 4] 1120 	call	_Timer4DelayMs
                                   1121 ;	main.c: 244: for (i = 1; i < 9; i++)
      0085AE 72 5C 00 01      [ 1] 1122 	inc	_i+0
      0085B2 C6 00 01         [ 1] 1123 	ld	a, _i+0
      0085B5 A1 09            [ 1] 1124 	cp	a, #0x09
      0085B7 25 C2            [ 1] 1125 	jrc	00102$
                                   1126 ;	main.c: 251: }
      0085B9 84               [ 1] 1127 	pop	a
      0085BA 81               [ 4] 1128 	ret
                                   1129 ;	main.c: 253: void ChayLEDNgoaiTrong(void)
                                   1130 ;	-----------------------------------------
                                   1131 ;	 function ChayLEDNgoaiTrong
                                   1132 ;	-----------------------------------------
      0085BB                       1133 _ChayLEDNgoaiTrong:
      0085BB 88               [ 1] 1134 	push	a
                                   1135 ;	main.c: 255: r = rand() % 256;
      0085BC CD 88 53         [ 4] 1136 	call	_rand
      0085BF 4B 00            [ 1] 1137 	push	#0x00
      0085C1 4B 01            [ 1] 1138 	push	#0x01
      0085C3 CD 88 CC         [ 4] 1139 	call	__modsint
      0085C6 9F               [ 1] 1140 	ld	a, xl
      0085C7 C7 00 02         [ 1] 1141 	ld	_r+0, a
                                   1142 ;	main.c: 256: g = rand() % 256;
      0085CA CD 88 53         [ 4] 1143 	call	_rand
      0085CD 4B 00            [ 1] 1144 	push	#0x00
      0085CF 4B 01            [ 1] 1145 	push	#0x01
      0085D1 CD 88 CC         [ 4] 1146 	call	__modsint
      0085D4 9F               [ 1] 1147 	ld	a, xl
      0085D5 C7 00 03         [ 1] 1148 	ld	_g+0, a
                                   1149 ;	main.c: 257: b = rand() % 256;
      0085D8 CD 88 53         [ 4] 1150 	call	_rand
      0085DB 4B 00            [ 1] 1151 	push	#0x00
      0085DD 4B 01            [ 1] 1152 	push	#0x01
      0085DF CD 88 CC         [ 4] 1153 	call	__modsint
      0085E2 9F               [ 1] 1154 	ld	a, xl
      0085E3 C7 00 04         [ 1] 1155 	ld	_b+0, a
                                   1156 ;	main.c: 258: for (i = 1; i < 5; i++)
      0085E6 35 01 00 01      [ 1] 1157 	mov	_i+0, #0x01
      0085EA                       1158 00103$:
                                   1159 ;	main.c: 260: number(4 - i, 0, 0, 0);
      0085EA C6 00 01         [ 1] 1160 	ld	a, _i+0
      0085ED 6B 01            [ 1] 1161 	ld	(0x01, sp), a
      0085EF A6 04            [ 1] 1162 	ld	a, #0x04
      0085F1 10 01            [ 1] 1163 	sub	a, (0x01, sp)
      0085F3 4B 00            [ 1] 1164 	push	#0x00
      0085F5 4B 00            [ 1] 1165 	push	#0x00
      0085F7 4B 00            [ 1] 1166 	push	#0x00
      0085F9 CD 80 B6         [ 4] 1167 	call	_number
                                   1168 ;	main.c: 261: number(1, g, r, b);
      0085FC 3B 00 04         [ 1] 1169 	push	_b+0
      0085FF 3B 00 02         [ 1] 1170 	push	_r+0
      008602 3B 00 03         [ 1] 1171 	push	_g+0
      008605 A6 01            [ 1] 1172 	ld	a, #0x01
      008607 CD 80 B6         [ 4] 1173 	call	_number
                                   1174 ;	main.c: 262: number(2 * (i - 1), 0, 0, 0);
      00860A C6 00 01         [ 1] 1175 	ld	a, _i+0
      00860D 4A               [ 1] 1176 	dec	a
      00860E 48               [ 1] 1177 	sll	a
      00860F 4B 00            [ 1] 1178 	push	#0x00
      008611 4B 00            [ 1] 1179 	push	#0x00
      008613 4B 00            [ 1] 1180 	push	#0x00
      008615 CD 80 B6         [ 4] 1181 	call	_number
                                   1182 ;	main.c: 263: number(1, g, r, b);
      008618 3B 00 04         [ 1] 1183 	push	_b+0
      00861B 3B 00 02         [ 1] 1184 	push	_r+0
      00861E 3B 00 03         [ 1] 1185 	push	_g+0
      008621 A6 01            [ 1] 1186 	ld	a, #0x01
      008623 CD 80 B6         [ 4] 1187 	call	_number
                                   1188 ;	main.c: 264: number(4 - i, 0, 0, 0);
      008626 C6 00 01         [ 1] 1189 	ld	a, _i+0
      008629 6B 01            [ 1] 1190 	ld	(0x01, sp), a
      00862B A6 04            [ 1] 1191 	ld	a, #0x04
      00862D 10 01            [ 1] 1192 	sub	a, (0x01, sp)
      00862F 4B 00            [ 1] 1193 	push	#0x00
      008631 4B 00            [ 1] 1194 	push	#0x00
      008633 4B 00            [ 1] 1195 	push	#0x00
      008635 CD 80 B6         [ 4] 1196 	call	_number
                                   1197 ;	main.c: 265: Timer4DelayMs(200);
      008638 AE 00 C8         [ 2] 1198 	ldw	x, #0x00c8
      00863B CD 83 56         [ 4] 1199 	call	_Timer4DelayMs
                                   1200 ;	main.c: 258: for (i = 1; i < 5; i++)
      00863E 72 5C 00 01      [ 1] 1201 	inc	_i+0
      008642 C6 00 01         [ 1] 1202 	ld	a, _i+0
      008645 A1 05            [ 1] 1203 	cp	a, #0x05
      008647 25 A1            [ 1] 1204 	jrc	00103$
                                   1205 ;	main.c: 267: for (i = 4; i > 0; i--)
      008649 35 04 00 01      [ 1] 1206 	mov	_i+0, #0x04
      00864D                       1207 00105$:
                                   1208 ;	main.c: 269: number(4 - i, 0, 0, 0);
      00864D C6 00 01         [ 1] 1209 	ld	a, _i+0
      008650 6B 01            [ 1] 1210 	ld	(0x01, sp), a
      008652 A6 04            [ 1] 1211 	ld	a, #0x04
      008654 10 01            [ 1] 1212 	sub	a, (0x01, sp)
      008656 4B 00            [ 1] 1213 	push	#0x00
      008658 4B 00            [ 1] 1214 	push	#0x00
      00865A 4B 00            [ 1] 1215 	push	#0x00
      00865C CD 80 B6         [ 4] 1216 	call	_number
                                   1217 ;	main.c: 270: number(1, g, r, b);
      00865F 3B 00 04         [ 1] 1218 	push	_b+0
      008662 3B 00 02         [ 1] 1219 	push	_r+0
      008665 3B 00 03         [ 1] 1220 	push	_g+0
      008668 A6 01            [ 1] 1221 	ld	a, #0x01
      00866A CD 80 B6         [ 4] 1222 	call	_number
                                   1223 ;	main.c: 271: number(2 * (i - 1), 0, 0, 0);
      00866D C6 00 01         [ 1] 1224 	ld	a, _i+0
      008670 4A               [ 1] 1225 	dec	a
      008671 48               [ 1] 1226 	sll	a
      008672 4B 00            [ 1] 1227 	push	#0x00
      008674 4B 00            [ 1] 1228 	push	#0x00
      008676 4B 00            [ 1] 1229 	push	#0x00
      008678 CD 80 B6         [ 4] 1230 	call	_number
                                   1231 ;	main.c: 272: number(1, g, r, b);
      00867B 3B 00 04         [ 1] 1232 	push	_b+0
      00867E 3B 00 02         [ 1] 1233 	push	_r+0
      008681 3B 00 03         [ 1] 1234 	push	_g+0
      008684 A6 01            [ 1] 1235 	ld	a, #0x01
      008686 CD 80 B6         [ 4] 1236 	call	_number
                                   1237 ;	main.c: 273: number(4 - i, 0, 0, 0);
      008689 C6 00 01         [ 1] 1238 	ld	a, _i+0
      00868C 6B 01            [ 1] 1239 	ld	(0x01, sp), a
      00868E A6 04            [ 1] 1240 	ld	a, #0x04
      008690 10 01            [ 1] 1241 	sub	a, (0x01, sp)
      008692 4B 00            [ 1] 1242 	push	#0x00
      008694 4B 00            [ 1] 1243 	push	#0x00
      008696 4B 00            [ 1] 1244 	push	#0x00
      008698 CD 80 B6         [ 4] 1245 	call	_number
                                   1246 ;	main.c: 274: Timer4DelayMs(200);
      00869B AE 00 C8         [ 2] 1247 	ldw	x, #0x00c8
      00869E CD 83 56         [ 4] 1248 	call	_Timer4DelayMs
                                   1249 ;	main.c: 267: for (i = 4; i > 0; i--)
      0086A1 72 5A 00 01      [ 1] 1250 	dec	_i+0
      0086A5 C6 00 01         [ 1] 1251 	ld	a, _i+0
      0086A8 26 A3            [ 1] 1252 	jrne	00105$
                                   1253 ;	main.c: 276: }
      0086AA 84               [ 1] 1254 	pop	a
      0086AB 81               [ 4] 1255 	ret
                                   1256 ;	main.c: 278: int main(void)
                                   1257 ;	-----------------------------------------
                                   1258 ;	 function main
                                   1259 ;	-----------------------------------------
      0086AC                       1260 _main:
                                   1261 ;	main.c: 282: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      0086AC C6 50 C6         [ 1] 1262 	ld	a, 0x50c6
      0086AF A4 E7            [ 1] 1263 	and	a, #0xe7
      0086B1 C7 50 C6         [ 1] 1264 	ld	0x50c6, a
                                   1265 ;	main.c: 283: CLK->CKDIVR |= (uint8_t)0x00;
      0086B4 55 50 C6 50 C6   [ 1] 1266 	mov	0x50c6, 0x50c6
                                   1267 ;	main.c: 285: GPIOD->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
      0086B9 35 00 50 0F      [ 1] 1268 	mov	0x500f+0, #0x00
                                   1269 ;	main.c: 286: GPIOD->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
      0086BD 35 00 50 11      [ 1] 1270 	mov	0x5011+0, #0x00
                                   1271 ;	main.c: 287: GPIOD->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
      0086C1 35 00 50 12      [ 1] 1272 	mov	0x5012+0, #0x00
                                   1273 ;	main.c: 288: GPIOD->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
      0086C5 35 00 50 13      [ 1] 1274 	mov	0x5013+0, #0x00
                                   1275 ;	main.c: 290: GPIOD->DDR |= (uint8_t)(1 << 3); /* Set Output mode */
      0086C9 72 16 50 11      [ 1] 1276 	bset	0x5011, #3
                                   1277 ;	main.c: 291: GPIOD->ODR |= (uint8_t)(1 << 3); /* High level */
      0086CD 72 16 50 0F      [ 1] 1278 	bset	0x500f, #3
                                   1279 ;	main.c: 292: GPIOD->CR1 |= (uint8_t)(1 << 3); /* Pull-Up or Push-Pull */
      0086D1 72 16 50 12      [ 1] 1280 	bset	0x5012, #3
                                   1281 ;	main.c: 293: GPIOD->CR2 |= (uint8_t)(1 << 3); /* Output speed up to 10 MHz */
      0086D5 72 16 50 13      [ 1] 1282 	bset	0x5013, #3
                                   1283 ;	main.c: 300: EXTI->CR1 = EXTI_CR1_RESET_VALUE;
      0086D9 35 00 50 A0      [ 1] 1284 	mov	0x50a0+0, #0x00
                                   1285 ;	main.c: 301: EXTI->CR2 = EXTI_CR2_RESET_VALUE;
      0086DD 35 00 50 A1      [ 1] 1286 	mov	0x50a1+0, #0x00
                                   1287 ;	main.c: 303: BUT_PORT->DDR &= (uint8_t)(~(BUT_PIN)); /* Set Input mode */
      0086E1 72 15 50 11      [ 1] 1288 	bres	0x5011, #2
                                   1289 ;	main.c: 304: BUT_PORT->CR1 |= (uint8_t)BUT_PIN;      /* Pull-Up  */
      0086E5 72 14 50 12      [ 1] 1290 	bset	0x5012, #2
                                   1291 ;	main.c: 305: BUT_PORT->CR2 |= (uint8_t)BUT_PIN;      /* External interrupt enabled */
      0086E9 C6 50 13         [ 1] 1292 	ld	a, 0x5013
      0086EC AA 04            [ 1] 1293 	or	a, #0x04
      0086EE C7 50 13         [ 1] 1294 	ld	0x5013, a
                                   1295 ;	main.c: 306: EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS); /*!< PORTD external interrupt sensitivity bits mask */
      0086F1 C6 50 A0         [ 1] 1296 	ld	a, 0x50a0
      0086F4 A4 3F            [ 1] 1297 	and	a, #0x3f
      0086F6 C7 50 A0         [ 1] 1298 	ld	0x50a0, a
                                   1299 ;	main.c: 307: EXTI->CR1 |= (uint8_t)((0x02) << 6);    /*!< Interrupt on Falling edge only */
      0086F9 C6 50 A0         [ 1] 1300 	ld	a, 0x50a0
      0086FC AA 80            [ 1] 1301 	or	a, #0x80
      0086FE C7 50 A0         [ 1] 1302 	ld	0x50a0, a
                                   1303 ;	main.c: 309: Timer4Config();
      008701 CD 83 49         [ 4] 1304 	call	_Timer4Config
                                   1305 ;	main.c: 310: enableInterrupts();
      008704 9A               [ 1] 1306 	rim
                                   1307 ;	main.c: 321: while (mode == 1)
      008705                       1308 00107$:
      008705 C6 00 05         [ 1] 1309 	ld	a, _mode+0
      008708 4A               [ 1] 1310 	dec	a
      008709 27 03            [ 1] 1311 	jreq	00284$
      00870B CC 87 D7         [ 2] 1312 	jp	00109$
      00870E                       1313 00284$:
                                   1314 ;	main.c: 324: for (i = 1; i < 9; i++)
      00870E 35 01 00 01      [ 1] 1315 	mov	_i+0, #0x01
      008712                       1316 00133$:
                                   1317 ;	main.c: 326: number(i, 255, 0, 0);
      008712 4B 00            [ 1] 1318 	push	#0x00
      008714 4B 00            [ 1] 1319 	push	#0x00
      008716 4B FF            [ 1] 1320 	push	#0xff
      008718 C6 00 01         [ 1] 1321 	ld	a, _i+0
      00871B CD 80 B6         [ 4] 1322 	call	_number
                                   1323 ;	main.c: 327: Timer4DelayMs(TimeRun);
      00871E AE 00 28         [ 2] 1324 	ldw	x, #0x0028
      008721 CD 83 56         [ 4] 1325 	call	_Timer4DelayMs
                                   1326 ;	main.c: 324: for (i = 1; i < 9; i++)
      008724 72 5C 00 01      [ 1] 1327 	inc	_i+0
      008728 C6 00 01         [ 1] 1328 	ld	a, _i+0
      00872B A1 09            [ 1] 1329 	cp	a, #0x09
      00872D 25 E3            [ 1] 1330 	jrc	00133$
                                   1331 ;	main.c: 329: for (i = 1; i < 9; i++)
      00872F 35 01 00 01      [ 1] 1332 	mov	_i+0, #0x01
      008733                       1333 00135$:
                                   1334 ;	main.c: 331: number(i, 0, 255, 0);
      008733 4B 00            [ 1] 1335 	push	#0x00
      008735 4B FF            [ 1] 1336 	push	#0xff
      008737 4B 00            [ 1] 1337 	push	#0x00
      008739 C6 00 01         [ 1] 1338 	ld	a, _i+0
      00873C CD 80 B6         [ 4] 1339 	call	_number
                                   1340 ;	main.c: 332: Timer4DelayMs(TimeRun);
      00873F AE 00 28         [ 2] 1341 	ldw	x, #0x0028
      008742 CD 83 56         [ 4] 1342 	call	_Timer4DelayMs
                                   1343 ;	main.c: 329: for (i = 1; i < 9; i++)
      008745 72 5C 00 01      [ 1] 1344 	inc	_i+0
      008749 C6 00 01         [ 1] 1345 	ld	a, _i+0
      00874C A1 09            [ 1] 1346 	cp	a, #0x09
      00874E 25 E3            [ 1] 1347 	jrc	00135$
                                   1348 ;	main.c: 335: for (i = 1; i < 9; i++)
      008750 35 01 00 01      [ 1] 1349 	mov	_i+0, #0x01
      008754                       1350 00137$:
                                   1351 ;	main.c: 337: number(i, 0, 0, 255);
      008754 4B FF            [ 1] 1352 	push	#0xff
      008756 4B 00            [ 1] 1353 	push	#0x00
      008758 4B 00            [ 1] 1354 	push	#0x00
      00875A C6 00 01         [ 1] 1355 	ld	a, _i+0
      00875D CD 80 B6         [ 4] 1356 	call	_number
                                   1357 ;	main.c: 338: Timer4DelayMs(TimeRun);
      008760 AE 00 28         [ 2] 1358 	ldw	x, #0x0028
      008763 CD 83 56         [ 4] 1359 	call	_Timer4DelayMs
                                   1360 ;	main.c: 335: for (i = 1; i < 9; i++)
      008766 72 5C 00 01      [ 1] 1361 	inc	_i+0
      00876A C6 00 01         [ 1] 1362 	ld	a, _i+0
      00876D A1 09            [ 1] 1363 	cp	a, #0x09
      00876F 25 E3            [ 1] 1364 	jrc	00137$
                                   1365 ;	main.c: 341: for (i = 1; i < 9; i++)
      008771 35 01 00 01      [ 1] 1366 	mov	_i+0, #0x01
      008775                       1367 00139$:
                                   1368 ;	main.c: 343: number(i, 0, 255, 255);
      008775 4B FF            [ 1] 1369 	push	#0xff
      008777 4B FF            [ 1] 1370 	push	#0xff
      008779 4B 00            [ 1] 1371 	push	#0x00
      00877B C6 00 01         [ 1] 1372 	ld	a, _i+0
      00877E CD 80 B6         [ 4] 1373 	call	_number
                                   1374 ;	main.c: 344: Timer4DelayMs(TimeRun);
      008781 AE 00 28         [ 2] 1375 	ldw	x, #0x0028
      008784 CD 83 56         [ 4] 1376 	call	_Timer4DelayMs
                                   1377 ;	main.c: 341: for (i = 1; i < 9; i++)
      008787 72 5C 00 01      [ 1] 1378 	inc	_i+0
      00878B C6 00 01         [ 1] 1379 	ld	a, _i+0
      00878E A1 09            [ 1] 1380 	cp	a, #0x09
      008790 25 E3            [ 1] 1381 	jrc	00139$
                                   1382 ;	main.c: 346: for (i = 1; i < 9; i++)
      008792 35 01 00 01      [ 1] 1383 	mov	_i+0, #0x01
      008796                       1384 00141$:
                                   1385 ;	main.c: 348: number(i, 255, 0, 255);
      008796 4B FF            [ 1] 1386 	push	#0xff
      008798 4B 00            [ 1] 1387 	push	#0x00
      00879A 4B FF            [ 1] 1388 	push	#0xff
      00879C C6 00 01         [ 1] 1389 	ld	a, _i+0
      00879F CD 80 B6         [ 4] 1390 	call	_number
                                   1391 ;	main.c: 349: Timer4DelayMs(TimeRun);
      0087A2 AE 00 28         [ 2] 1392 	ldw	x, #0x0028
      0087A5 CD 83 56         [ 4] 1393 	call	_Timer4DelayMs
                                   1394 ;	main.c: 346: for (i = 1; i < 9; i++)
      0087A8 72 5C 00 01      [ 1] 1395 	inc	_i+0
      0087AC C6 00 01         [ 1] 1396 	ld	a, _i+0
      0087AF A1 09            [ 1] 1397 	cp	a, #0x09
      0087B1 25 E3            [ 1] 1398 	jrc	00141$
                                   1399 ;	main.c: 352: for (i = 1; i < 9; i++)
      0087B3 35 01 00 01      [ 1] 1400 	mov	_i+0, #0x01
      0087B7                       1401 00143$:
                                   1402 ;	main.c: 354: number(i, 255, 255, 0);
      0087B7 4B 00            [ 1] 1403 	push	#0x00
      0087B9 4B FF            [ 1] 1404 	push	#0xff
      0087BB 4B FF            [ 1] 1405 	push	#0xff
      0087BD C6 00 01         [ 1] 1406 	ld	a, _i+0
      0087C0 CD 80 B6         [ 4] 1407 	call	_number
                                   1408 ;	main.c: 355: Timer4DelayMs(TimeRun);
      0087C3 AE 00 28         [ 2] 1409 	ldw	x, #0x0028
      0087C6 CD 83 56         [ 4] 1410 	call	_Timer4DelayMs
                                   1411 ;	main.c: 352: for (i = 1; i < 9; i++)
      0087C9 72 5C 00 01      [ 1] 1412 	inc	_i+0
      0087CD C6 00 01         [ 1] 1413 	ld	a, _i+0
      0087D0 A1 09            [ 1] 1414 	cp	a, #0x09
      0087D2 25 E3            [ 1] 1415 	jrc	00143$
      0087D4 CC 87 05         [ 2] 1416 	jp	00107$
      0087D7                       1417 00109$:
                                   1418 ;	main.c: 358: if (mode == 2)
      0087D7 C6 00 05         [ 1] 1419 	ld	a, _mode+0
      0087DA A1 02            [ 1] 1420 	cp	a, #0x02
      0087DC 26 03            [ 1] 1421 	jrne	00112$
                                   1422 ;	main.c: 360: ChayLED4();
      0087DE CD 84 0E         [ 4] 1423 	call	_ChayLED4
                                   1424 ;	main.c: 362: while (mode == 3)
      0087E1                       1425 00112$:
      0087E1 C6 00 05         [ 1] 1426 	ld	a, _mode+0
      0087E4 A1 03            [ 1] 1427 	cp	a, #0x03
      0087E6 26 05            [ 1] 1428 	jrne	00115$
                                   1429 ;	main.c: 364: NhapNhay1();
      0087E8 CD 84 B3         [ 4] 1430 	call	_NhapNhay1
      0087EB 20 F4            [ 2] 1431 	jra	00112$
                                   1432 ;	main.c: 366: while (mode == 4)
      0087ED                       1433 00115$:
      0087ED C6 00 05         [ 1] 1434 	ld	a, _mode+0
      0087F0 A1 04            [ 1] 1435 	cp	a, #0x04
      0087F2 26 05            [ 1] 1436 	jrne	00118$
                                   1437 ;	main.c: 368: NhapNhayRED();
      0087F4 CD 84 F6         [ 4] 1438 	call	_NhapNhayRED
      0087F7 20 F4            [ 2] 1439 	jra	00115$
                                   1440 ;	main.c: 370: while (mode == 5)
      0087F9                       1441 00118$:
      0087F9 C6 00 05         [ 1] 1442 	ld	a, _mode+0
      0087FC A1 05            [ 1] 1443 	cp	a, #0x05
      0087FE 26 05            [ 1] 1444 	jrne	00121$
                                   1445 ;	main.c: 372: ChayLED5();
      008800 CD 84 30         [ 4] 1446 	call	_ChayLED5
      008803 20 F4            [ 2] 1447 	jra	00118$
                                   1448 ;	main.c: 375: while (mode == 6)
      008805                       1449 00121$:
      008805 C6 00 05         [ 1] 1450 	ld	a, _mode+0
      008808 A1 06            [ 1] 1451 	cp	a, #0x06
      00880A 26 05            [ 1] 1452 	jrne	00124$
                                   1453 ;	main.c: 377: Chay1LED();
      00880C CD 85 4C         [ 4] 1454 	call	_Chay1LED
      00880F 20 F4            [ 2] 1455 	jra	00121$
                                   1456 ;	main.c: 380: while (mode == 7)
      008811                       1457 00124$:
      008811 C6 00 05         [ 1] 1458 	ld	a, _mode+0
      008814 A1 07            [ 1] 1459 	cp	a, #0x07
      008816 26 05            [ 1] 1460 	jrne	00127$
                                   1461 ;	main.c: 382: ChayLEDNgoaiTrong();
      008818 CD 85 BB         [ 4] 1462 	call	_ChayLEDNgoaiTrong
      00881B 20 F4            [ 2] 1463 	jra	00124$
                                   1464 ;	main.c: 384: while (mode == 8)
      00881D                       1465 00127$:
      00881D C6 00 05         [ 1] 1466 	ld	a, _mode+0
      008820 A1 08            [ 1] 1467 	cp	a, #0x08
      008822 27 03            [ 1] 1468 	jreq	00311$
      008824 CC 87 05         [ 2] 1469 	jp	00107$
      008827                       1470 00311$:
                                   1471 ;	main.c: 386: HaiMau();
      008827 CD 85 35         [ 4] 1472 	call	_HaiMau
                                   1473 ;	main.c: 387: mode = 0;
      00882A 72 5F 00 05      [ 1] 1474 	clr	_mode+0
      00882E 20 ED            [ 2] 1475 	jra	00127$
                                   1476 ;	main.c: 390: }
      008830 81               [ 4] 1477 	ret
                                   1478 ;	main.c: 391: INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
                                   1479 ;	-----------------------------------------
                                   1480 ;	 function EXTI_PORTD_IRQHandler
                                   1481 ;	-----------------------------------------
      008831                       1482 _EXTI_PORTD_IRQHandler:
                                   1483 ;	main.c: 393: if ((GPIOD->IDR & (1 << 2)) == RESET)
      008831 C6 50 10         [ 1] 1484 	ld	a, 0x5010
      008834 A5 04            [ 1] 1485 	bcp	a, #0x04
      008836 26 1A            [ 1] 1486 	jrne	00108$
                                   1487 ;	main.c: 395: Timer4DelayMs(200);
      008838 AE 00 C8         [ 2] 1488 	ldw	x, #0x00c8
      00883B CD 83 56         [ 4] 1489 	call	_Timer4DelayMs
                                   1490 ;	main.c: 396: while ((GPIOD->IDR & (1 << 2)) == RESET)
      00883E                       1491 00101$:
      00883E 72 05 50 10 FB   [ 2] 1492 	btjf	0x5010, #2, 00101$
                                   1493 ;	main.c: 398: mode++;
      008843 72 5C 00 05      [ 1] 1494 	inc	_mode+0
                                   1495 ;	main.c: 399: if (mode > 8)
      008847 C6 00 05         [ 1] 1496 	ld	a, _mode+0
      00884A A1 08            [ 1] 1497 	cp	a, #0x08
      00884C 23 04            [ 2] 1498 	jrule	00108$
                                   1499 ;	main.c: 400: mode = 0;
      00884E 72 5F 00 05      [ 1] 1500 	clr	_mode+0
      008852                       1501 00108$:
                                   1502 ;	main.c: 402: }
      008852 80               [11] 1503 	iret
                                   1504 	.area CODE
                                   1505 	.area CONST
                                   1506 	.area INITIALIZER
      00804D                       1507 __xinit__mode:
      00804D 00                    1508 	.db #0x00	; 0
                                   1509 	.area CABS (ABS)
