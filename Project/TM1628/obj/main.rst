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
                                     11 	.globl _TIM4_UPD_OVF_IRQHandler
                                     12 	.globl _main
                                     13 	.globl _Read_EEPROM
                                     14 	.globl _TM1628_DISPLAY_SEGMENTS
                                     15 	.globl _TM1628_INIT
                                     16 	.globl _delay_us
                                     17 	.globl _delay_config
                                     18 	.globl _TIM4_ClearITPendingBit
                                     19 	.globl _GPIO_ReadInputPin
                                     20 	.globl _GPIO_Init
                                     21 	.globl _GPIO_DeInit
                                     22 	.globl _counter
                                     23 	.globl _second
                                     24 	.globl _minute
                                     25 	.globl _buffer
                                     26 	.globl _i
                                     27 	.globl _Clock_setup
                                     28 	.globl _GPIO_setup
                                     29 ;--------------------------------------------------------
                                     30 ; ram data
                                     31 ;--------------------------------------------------------
                                     32 	.area DATA
      000001                         33 _i::
      000001                         34 	.ds 1
                                     35 ;--------------------------------------------------------
                                     36 ; ram data
                                     37 ;--------------------------------------------------------
                                     38 	.area INITIALIZED
      000002                         39 _buffer::
      000002                         40 	.ds 14
      000010                         41 _minute::
      000010                         42 	.ds 1
      000011                         43 _second::
      000011                         44 	.ds 1
      000012                         45 _counter::
      000012                         46 	.ds 2
                                     47 ;--------------------------------------------------------
                                     48 ; Stack segment in internal ram
                                     49 ;--------------------------------------------------------
                                     50 	.area SSEG
      000016                         51 __start__stack:
      000016                         52 	.ds	1
                                     53 
                                     54 ;--------------------------------------------------------
                                     55 ; absolute external ram data
                                     56 ;--------------------------------------------------------
                                     57 	.area DABS (ABS)
                                     58 
                                     59 ; default segment ordering for linker
                                     60 	.area HOME
                                     61 	.area GSINIT
                                     62 	.area GSFINAL
                                     63 	.area CONST
                                     64 	.area INITIALIZER
                                     65 	.area CODE
                                     66 
                                     67 ;--------------------------------------------------------
                                     68 ; interrupt vector
                                     69 ;--------------------------------------------------------
                                     70 	.area HOME
      008000                         71 __interrupt_vect:
      008000 82 00 80 6B             72 	int s_GSINIT ; reset
      008004 82 00 00 00             73 	int 0x000000 ; trap
      008008 82 00 00 00             74 	int 0x000000 ; int0
      00800C 82 00 00 00             75 	int 0x000000 ; int1
      008010 82 00 00 00             76 	int 0x000000 ; int2
      008014 82 00 00 00             77 	int 0x000000 ; int3
      008018 82 00 00 00             78 	int 0x000000 ; int4
      00801C 82 00 00 00             79 	int 0x000000 ; int5
      008020 82 00 00 00             80 	int 0x000000 ; int6
      008024 82 00 00 00             81 	int 0x000000 ; int7
      008028 82 00 00 00             82 	int 0x000000 ; int8
      00802C 82 00 00 00             83 	int 0x000000 ; int9
      008030 82 00 00 00             84 	int 0x000000 ; int10
      008034 82 00 00 00             85 	int 0x000000 ; int11
      008038 82 00 00 00             86 	int 0x000000 ; int12
      00803C 82 00 00 00             87 	int 0x000000 ; int13
      008040 82 00 00 00             88 	int 0x000000 ; int14
      008044 82 00 00 00             89 	int 0x000000 ; int15
      008048 82 00 00 00             90 	int 0x000000 ; int16
      00804C 82 00 00 00             91 	int 0x000000 ; int17
      008050 82 00 00 00             92 	int 0x000000 ; int18
      008054 82 00 00 00             93 	int 0x000000 ; int19
      008058 82 00 00 00             94 	int 0x000000 ; int20
      00805C 82 00 00 00             95 	int 0x000000 ; int21
      008060 82 00 00 00             96 	int 0x000000 ; int22
      008064 82 00 81 8A             97 	int _TIM4_UPD_OVF_IRQHandler ; int23
                                     98 ;--------------------------------------------------------
                                     99 ; global & static initialisations
                                    100 ;--------------------------------------------------------
                                    101 	.area HOME
                                    102 	.area GSINIT
                                    103 	.area GSFINAL
                                    104 	.area GSINIT
      00806B CD 87 49         [ 4]  105 	call	___sdcc_external_startup
      00806E 4D               [ 1]  106 	tnz	a
      00806F 27 03            [ 1]  107 	jreq	__sdcc_init_data
      008071 CC 80 68         [ 2]  108 	jp	__sdcc_program_startup
      008074                        109 __sdcc_init_data:
                                    110 ; stm8_genXINIT() start
      008074 AE 00 01         [ 2]  111 	ldw x, #l_DATA
      008077 27 07            [ 1]  112 	jreq	00002$
      008079                        113 00001$:
      008079 72 4F 00 00      [ 1]  114 	clr (s_DATA - 1, x)
      00807D 5A               [ 2]  115 	decw x
      00807E 26 F9            [ 1]  116 	jrne	00001$
      008080                        117 00002$:
      008080 AE 00 14         [ 2]  118 	ldw	x, #l_INITIALIZER
      008083 27 09            [ 1]  119 	jreq	00004$
      008085                        120 00003$:
      008085 D6 80 9F         [ 1]  121 	ld	a, (s_INITIALIZER - 1, x)
      008088 D7 00 01         [ 1]  122 	ld	(s_INITIALIZED - 1, x), a
      00808B 5A               [ 2]  123 	decw	x
      00808C 26 F7            [ 1]  124 	jrne	00003$
      00808E                        125 00004$:
                                    126 ; stm8_genXINIT() end
                                    127 	.area GSFINAL
      00808E CC 80 68         [ 2]  128 	jp	__sdcc_program_startup
                                    129 ;--------------------------------------------------------
                                    130 ; Home
                                    131 ;--------------------------------------------------------
                                    132 	.area HOME
                                    133 	.area HOME
      008068                        134 __sdcc_program_startup:
      008068 CC 80 B4         [ 2]  135 	jp	_main
                                    136 ;	return from main will return to caller
                                    137 ;--------------------------------------------------------
                                    138 ; code
                                    139 ;--------------------------------------------------------
                                    140 	.area CODE
                                    141 ;	main.c: 34: void main()
                                    142 ;	-----------------------------------------
                                    143 ;	 function main
                                    144 ;	-----------------------------------------
      0080B4                        145 _main:
                                    146 ;	main.c: 36: Clock_setup();
      0080B4 CD 81 C0         [ 4]  147 	call	_Clock_setup
                                    148 ;	main.c: 37: GPIO_setup();
      0080B7 CD 82 03         [ 4]  149 	call	_GPIO_setup
                                    150 ;	main.c: 38: delay_config();
      0080BA CD 82 3C         [ 4]  151 	call	_delay_config
                                    152 ;	main.c: 41: TM1628_INIT(1,1);
      0080BD 4B 01            [ 1]  153 	push	#0x01
      0080BF A6 01            [ 1]  154 	ld	a, #0x01
      0080C1 CD 83 B4         [ 4]  155 	call	_TM1628_INIT
                                    156 ;	main.c: 43: delay_us(1000);
      0080C4 4B E8            [ 1]  157 	push	#0xe8
      0080C6 4B 03            [ 1]  158 	push	#0x03
      0080C8 5F               [ 1]  159 	clrw	x
      0080C9 89               [ 2]  160 	pushw	x
      0080CA CD 82 7B         [ 4]  161 	call	_delay_us
                                    162 ;	main.c: 44: minute = Read_EEPROM(0x4000);
      0080CD 4B 00            [ 1]  163 	push	#0x00
      0080CF 4B 40            [ 1]  164 	push	#0x40
      0080D1 5F               [ 1]  165 	clrw	x
      0080D2 89               [ 2]  166 	pushw	x
      0080D3 CD 84 65         [ 4]  167 	call	_Read_EEPROM
      0080D6 C7 00 10         [ 1]  168 	ld	_minute+0, a
                                    169 ;	main.c: 45: second = Read_EEPROM(0x4001);
      0080D9 4B 01            [ 1]  170 	push	#0x01
      0080DB 4B 40            [ 1]  171 	push	#0x40
      0080DD 5F               [ 1]  172 	clrw	x
      0080DE 89               [ 2]  173 	pushw	x
      0080DF CD 84 65         [ 4]  174 	call	_Read_EEPROM
      0080E2 C7 00 11         [ 1]  175 	ld	_second+0, a
                                    176 ;	main.c: 46: delay_us(1000);
      0080E5 4B E8            [ 1]  177 	push	#0xe8
      0080E7 4B 03            [ 1]  178 	push	#0x03
      0080E9 5F               [ 1]  179 	clrw	x
      0080EA 89               [ 2]  180 	pushw	x
      0080EB CD 82 7B         [ 4]  181 	call	_delay_us
                                    182 ;	main.c: 49: while (1)
      0080EE                        183 00111$:
                                    184 ;	main.c: 51: if (GPIO_ReadInputPin(BUT_PORT, BUT_PIN) == RESET){
      0080EE A6 08            [ 1]  185 	ld	a, #0x08
      0080F0 AE 50 00         [ 2]  186 	ldw	x, #0x5000
      0080F3 CD 85 18         [ 4]  187 	call	_GPIO_ReadInputPin
      0080F6 4D               [ 1]  188 	tnz	a
      0080F7 26 16            [ 1]  189 	jrne	00105$
                                    190 ;	main.c: 52: delay_us(1000000);
      0080F9 4B 40            [ 1]  191 	push	#0x40
      0080FB 4B 42            [ 1]  192 	push	#0x42
      0080FD 4B 0F            [ 1]  193 	push	#0x0f
      0080FF 4B 00            [ 1]  194 	push	#0x00
      008101 CD 82 7B         [ 4]  195 	call	_delay_us
                                    196 ;	main.c: 53: while (GPIO_ReadInputPin(BUT_PORT, BUT_PIN) == RESET);
      008104                        197 00101$:
      008104 A6 08            [ 1]  198 	ld	a, #0x08
      008106 AE 50 00         [ 2]  199 	ldw	x, #0x5000
      008109 CD 85 18         [ 4]  200 	call	_GPIO_ReadInputPin
      00810C 4D               [ 1]  201 	tnz	a
      00810D 27 F5            [ 1]  202 	jreq	00101$
      00810F                        203 00105$:
                                    204 ;	main.c: 56: buffer[0] = minute / 10;
      00810F C6 00 10         [ 1]  205 	ld	a, _minute+0
      008112 5F               [ 1]  206 	clrw	x
      008113 4B 0A            [ 1]  207 	push	#0x0a
      008115 4B 00            [ 1]  208 	push	#0x00
      008117 97               [ 1]  209 	ld	xl, a
      008118 CD 87 63         [ 4]  210 	call	__divsint
      00811B 9F               [ 1]  211 	ld	a, xl
      00811C C7 00 02         [ 1]  212 	ld	_buffer+0, a
                                    213 ;	main.c: 57: buffer[2] = minute % 10;
      00811F 5F               [ 1]  214 	clrw	x
      008120 C6 00 10         [ 1]  215 	ld	a, _minute+0
      008123 97               [ 1]  216 	ld	xl, a
      008124 4B 0A            [ 1]  217 	push	#0x0a
      008126 4B 00            [ 1]  218 	push	#0x00
      008128 CD 87 4B         [ 4]  219 	call	__modsint
      00812B 9F               [ 1]  220 	ld	a, xl
      00812C C7 00 04         [ 1]  221 	ld	_buffer+2, a
                                    222 ;	main.c: 58: buffer[4] = second / 10;
      00812F 5F               [ 1]  223 	clrw	x
      008130 C6 00 11         [ 1]  224 	ld	a, _second+0
      008133 97               [ 1]  225 	ld	xl, a
      008134 4B 0A            [ 1]  226 	push	#0x0a
      008136 4B 00            [ 1]  227 	push	#0x00
      008138 CD 87 63         [ 4]  228 	call	__divsint
      00813B 9F               [ 1]  229 	ld	a, xl
      00813C C7 00 06         [ 1]  230 	ld	_buffer+4, a
                                    231 ;	main.c: 59: buffer[6] = second % 10;
      00813F 5F               [ 1]  232 	clrw	x
      008140 C6 00 11         [ 1]  233 	ld	a, _second+0
      008143 97               [ 1]  234 	ld	xl, a
      008144 4B 0A            [ 1]  235 	push	#0x0a
      008146 4B 00            [ 1]  236 	push	#0x00
      008148 CD 87 4B         [ 4]  237 	call	__modsint
      00814B 9F               [ 1]  238 	ld	a, xl
      00814C C7 00 08         [ 1]  239 	ld	_buffer+6, a
                                    240 ;	main.c: 61: for(i=0; i< 14; ++i)
      00814F 72 5F 00 01      [ 1]  241 	clr	_i+0
      008153                        242 00113$:
                                    243 ;	main.c: 63: if( second % 2 ){
      008153 90 5F            [ 1]  244 	clrw	y
      008155 C6 00 11         [ 1]  245 	ld	a, _second+0
      008158 A4 01            [ 1]  246 	and	a, #0x01
      00815A 90 97            [ 1]  247 	ld	yl, a
                                    248 ;	main.c: 64: TM1628_DISPLAY_SEGMENTS(i,buffer[i],1); 
      00815C 5F               [ 1]  249 	clrw	x
      00815D C6 00 01         [ 1]  250 	ld	a, _i+0
      008160 97               [ 1]  251 	ld	xl, a
      008161 D6 00 02         [ 1]  252 	ld	a, (_buffer+0, x)
                                    253 ;	main.c: 63: if( second % 2 ){
      008164 90 5D            [ 2]  254 	tnzw	y
      008166 27 0B            [ 1]  255 	jreq	00107$
                                    256 ;	main.c: 64: TM1628_DISPLAY_SEGMENTS(i,buffer[i],1); 
      008168 4B 01            [ 1]  257 	push	#0x01
      00816A 88               [ 1]  258 	push	a
      00816B C6 00 01         [ 1]  259 	ld	a, _i+0
      00816E CD 83 D7         [ 4]  260 	call	_TM1628_DISPLAY_SEGMENTS
      008171 20 09            [ 2]  261 	jra	00114$
      008173                        262 00107$:
                                    263 ;	main.c: 67: TM1628_DISPLAY_SEGMENTS(i,buffer[i],0); 
      008173 4B 00            [ 1]  264 	push	#0x00
      008175 88               [ 1]  265 	push	a
      008176 C6 00 01         [ 1]  266 	ld	a, _i+0
      008179 CD 83 D7         [ 4]  267 	call	_TM1628_DISPLAY_SEGMENTS
      00817C                        268 00114$:
                                    269 ;	main.c: 61: for(i=0; i< 14; ++i)
      00817C 72 5C 00 01      [ 1]  270 	inc	_i+0
      008180 C6 00 01         [ 1]  271 	ld	a, _i+0
      008183 A1 0E            [ 1]  272 	cp	a, #0x0e
      008185 25 CC            [ 1]  273 	jrc	00113$
                                    274 ;	main.c: 71: }
      008187 CC 80 EE         [ 2]  275 	jp	00111$
                                    276 ;	main.c: 73: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
                                    277 ;	-----------------------------------------
                                    278 ;	 function TIM4_UPD_OVF_IRQHandler
                                    279 ;	-----------------------------------------
      00818A                        280 _TIM4_UPD_OVF_IRQHandler:
      00818A 4F               [ 1]  281 	clr	a
      00818B 62               [ 2]  282 	div	x, a
                                    283 ;	main.c: 75: counter++;
      00818C CE 00 12         [ 2]  284 	ldw	x, _counter+0
      00818F 5C               [ 1]  285 	incw	x
                                    286 ;	main.c: 76: if (counter == 1000)
      008190 CF 00 12         [ 2]  287 	ldw	_counter+0, x
      008193 A3 03 E8         [ 2]  288 	cpw	x, #0x03e8
      008196 26 22            [ 1]  289 	jrne	00106$
                                    290 ;	main.c: 78: counter = 0;
      008198 5F               [ 1]  291 	clrw	x
      008199 CF 00 12         [ 2]  292 	ldw	_counter+0, x
                                    293 ;	main.c: 79: second++;
      00819C 72 5C 00 11      [ 1]  294 	inc	_second+0
                                    295 ;	main.c: 80: if (second > 59) 
      0081A0 C6 00 11         [ 1]  296 	ld	a, _second+0
      0081A3 A1 3B            [ 1]  297 	cp	a, #0x3b
      0081A5 23 13            [ 2]  298 	jrule	00106$
                                    299 ;	main.c: 82: second = 0;
      0081A7 72 5F 00 11      [ 1]  300 	clr	_second+0
                                    301 ;	main.c: 83: minute++;
      0081AB 72 5C 00 10      [ 1]  302 	inc	_minute+0
                                    303 ;	main.c: 84: if (minute > 59) minute = 0;
      0081AF C6 00 10         [ 1]  304 	ld	a, _minute+0
      0081B2 A1 3B            [ 1]  305 	cp	a, #0x3b
      0081B4 23 04            [ 2]  306 	jrule	00106$
      0081B6 72 5F 00 10      [ 1]  307 	clr	_minute+0
      0081BA                        308 00106$:
                                    309 ;	main.c: 88: TIM4_ClearITPendingBit(TIM4_IT_UPDATE); 
      0081BA A6 01            [ 1]  310 	ld	a, #0x01
      0081BC CD 86 4F         [ 4]  311 	call	_TIM4_ClearITPendingBit
                                    312 ;	main.c: 89: }
      0081BF 80               [11]  313 	iret
                                    314 ;	main.c: 91: void Clock_setup(void)
                                    315 ;	-----------------------------------------
                                    316 ;	 function Clock_setup
                                    317 ;	-----------------------------------------
      0081C0                        318 _Clock_setup:
                                    319 ;	main.c: 94: CLK->ICKR = CLK_ICKR_RESET_VALUE;
      0081C0 35 01 50 C0      [ 1]  320 	mov	0x50c0+0, #0x01
                                    321 ;	main.c: 95: CLK->ECKR = CLK_ECKR_RESET_VALUE;
      0081C4 35 00 50 C1      [ 1]  322 	mov	0x50c1+0, #0x00
                                    323 ;	main.c: 96: CLK->SWR  = CLK_SWR_RESET_VALUE;
      0081C8 35 E1 50 C4      [ 1]  324 	mov	0x50c4+0, #0xe1
                                    325 ;	main.c: 97: CLK->SWCR = CLK_SWCR_RESET_VALUE;
      0081CC 35 00 50 C5      [ 1]  326 	mov	0x50c5+0, #0x00
                                    327 ;	main.c: 98: CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
      0081D0 35 18 50 C6      [ 1]  328 	mov	0x50c6+0, #0x18
                                    329 ;	main.c: 99: CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
      0081D4 35 FF 50 C7      [ 1]  330 	mov	0x50c7+0, #0xff
                                    331 ;	main.c: 100: CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
      0081D8 35 FF 50 CA      [ 1]  332 	mov	0x50ca+0, #0xff
                                    333 ;	main.c: 101: CLK->CSSR = CLK_CSSR_RESET_VALUE;
      0081DC 35 00 50 C8      [ 1]  334 	mov	0x50c8+0, #0x00
                                    335 ;	main.c: 102: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      0081E0 35 00 50 C9      [ 1]  336 	mov	0x50c9+0, #0x00
                                    337 ;	main.c: 103: while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0) {}
      0081E4                        338 00101$:
      0081E4 72 00 50 C9 FB   [ 2]  339 	btjt	0x50c9, #0, 00101$
                                    340 ;	main.c: 104: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      0081E9 35 00 50 C9      [ 1]  341 	mov	0x50c9+0, #0x00
                                    342 ;	main.c: 105: CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
      0081ED 35 00 50 CC      [ 1]  343 	mov	0x50cc+0, #0x00
                                    344 ;	main.c: 106: CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
      0081F1 35 00 50 CD      [ 1]  345 	mov	0x50cd+0, #0x00
                                    346 ;	main.c: 109: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      0081F5 C6 50 C6         [ 1]  347 	ld	a, 0x50c6
      0081F8 A4 E7            [ 1]  348 	and	a, #0xe7
      0081FA C7 50 C6         [ 1]  349 	ld	0x50c6, a
                                    350 ;	main.c: 112: CLK->CKDIVR |= (uint8_t)0x00; /*!< High speed internal clock prescaler: 1 */
      0081FD 55 50 C6 50 C6   [ 1]  351 	mov	0x50c6, 0x50c6
                                    352 ;	main.c: 113: }
      008202 81               [ 4]  353 	ret
                                    354 ;	main.c: 116: void GPIO_setup(void)
                                    355 ;	-----------------------------------------
                                    356 ;	 function GPIO_setup
                                    357 ;	-----------------------------------------
      008203                        358 _GPIO_setup:
                                    359 ;	main.c: 119: GPIO_DeInit(GPIOD);
      008203 AE 50 0F         [ 2]  360 	ldw	x, #0x500f
      008206 CD 84 6D         [ 4]  361 	call	_GPIO_DeInit
                                    362 ;	main.c: 120: GPIO_DeInit(GPIOC);
      008209 AE 50 0A         [ 2]  363 	ldw	x, #0x500a
      00820C CD 84 6D         [ 4]  364 	call	_GPIO_DeInit
                                    365 ;	main.c: 121: GPIO_DeInit(GPIOA);
      00820F AE 50 00         [ 2]  366 	ldw	x, #0x5000
      008212 CD 84 6D         [ 4]  367 	call	_GPIO_DeInit
                                    368 ;	main.c: 122: GPIO_DeInit(GPIOE);
      008215 AE 50 14         [ 2]  369 	ldw	x, #0x5014
      008218 CD 84 6D         [ 4]  370 	call	_GPIO_DeInit
                                    371 ;	main.c: 123: GPIO_DeInit(GPIOB);   
      00821B AE 50 05         [ 2]  372 	ldw	x, #0x5005
      00821E CD 84 6D         [ 4]  373 	call	_GPIO_DeInit
                                    374 ;	main.c: 124: GPIO_DeInit(GPIOF);
      008221 AE 50 19         [ 2]  375 	ldw	x, #0x5019
      008224 CD 84 6D         [ 4]  376 	call	_GPIO_DeInit
                                    377 ;	main.c: 126: GPIO_Init(BUT_PORT, BUT_PIN, GPIO_MODE_IN_PU_NO_IT);
      008227 4B 40            [ 1]  378 	push	#0x40
      008229 A6 08            [ 1]  379 	ld	a, #0x08
      00822B AE 50 00         [ 2]  380 	ldw	x, #0x5000
      00822E CD 84 7B         [ 4]  381 	call	_GPIO_Init
                                    382 ;	main.c: 127: GPIO_Init(GPIOB, GPIO_PIN_4 | GPIO_PIN_5, GPIO_MODE_OUT_OD_HIZ_SLOW);
      008231 4B 90            [ 1]  383 	push	#0x90
      008233 A6 30            [ 1]  384 	ld	a, #0x30
      008235 AE 50 05         [ 2]  385 	ldw	x, #0x5005
      008238 CD 84 7B         [ 4]  386 	call	_GPIO_Init
                                    387 ;	main.c: 128: }
      00823B 81               [ 4]  388 	ret
                                    389 	.area CODE
                                    390 	.area CONST
                                    391 	.area INITIALIZER
      0080A0                        392 __xinit__buffer:
      0080A0 00                     393 	.db #0x00	; 0
      0080A1 00                     394 	.db #0x00	; 0
      0080A2 00                     395 	.db #0x00	; 0
      0080A3 00                     396 	.db #0x00	; 0
      0080A4 00                     397 	.db #0x00	; 0
      0080A5 00                     398 	.db #0x00	; 0
      0080A6 00                     399 	.db #0x00	; 0
      0080A7 00                     400 	.db #0x00	; 0
      0080A8 00                     401 	.db #0x00	; 0
      0080A9 00                     402 	.db #0x00	; 0
      0080AA 00                     403 	.db #0x00	; 0
      0080AB 00                     404 	.db #0x00	; 0
      0080AC 00                     405 	.db #0x00	; 0
      0080AD 00                     406 	.db #0x00	; 0
      0080AE                        407 __xinit__minute:
      0080AE 00                     408 	.db #0x00	; 0
      0080AF                        409 __xinit__second:
      0080AF 00                     410 	.db #0x00	; 0
      0080B0                        411 __xinit__counter:
      0080B0 00 00                  412 	.dw #0x0000
                                    413 	.area CABS (ABS)
