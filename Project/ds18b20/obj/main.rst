                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.5.0 #9253 (Apr  3 2018) (Linux)
                                      4 ; This file was generated Tue Feb 11 21:31:46 2025
                                      5 ;--------------------------------------------------------
                                      6 	.module main
                                      7 	.optsdcc -mstm8
                                      8 	
                                      9 ;--------------------------------------------------------
                                     10 ; Public variables in this module
                                     11 ;--------------------------------------------------------
                                     12 	.globl _main
                                     13 	.globl _DS18x20_ReadTemp
                                     14 	.globl _OneWireReadByte
                                     15 	.globl _OneWireWriteByte
                                     16 	.globl _OneWireReset
                                     17 	.globl _TM1637_clear
                                     18 	.globl _TM1637_DISPLAY_DIGIT
                                     19 	.globl _TM1637_INIT
                                     20 	.globl _delay_us
                                     21 	.globl _GPIO_Init
                                     22 	.globl _CLK_HSIPrescalerConfig
                                     23 	.globl _chuctp
                                     24 	.globl _tramtp
                                     25 	.globl _donvi
                                     26 	.globl _chuc
                                     27 	.globl _temp
                                     28 ;--------------------------------------------------------
                                     29 ; ram data
                                     30 ;--------------------------------------------------------
                                     31 	.area DATA
      000001                         32 _temp::
      000001                         33 	.ds 4
      000005                         34 _chuc::
      000005                         35 	.ds 1
      000006                         36 _donvi::
      000006                         37 	.ds 1
      000007                         38 _tramtp::
      000007                         39 	.ds 1
      000008                         40 _chuctp::
      000008                         41 	.ds 1
                                     42 ;--------------------------------------------------------
                                     43 ; ram data
                                     44 ;--------------------------------------------------------
                                     45 	.area INITIALIZED
                                     46 ;--------------------------------------------------------
                                     47 ; Stack segment in internal ram 
                                     48 ;--------------------------------------------------------
                                     49 	.area	SSEG
      00000B                         50 __start__stack:
      00000B                         51 	.ds	1
                                     52 
                                     53 ;--------------------------------------------------------
                                     54 ; absolute external ram data
                                     55 ;--------------------------------------------------------
                                     56 	.area DABS (ABS)
                                     57 ;--------------------------------------------------------
                                     58 ; interrupt vector 
                                     59 ;--------------------------------------------------------
                                     60 	.area HOME
      008000                         61 __interrupt_vect:
      008000 82 00 80 83             62 	int s_GSINIT ;reset
      008004 82 00 00 00             63 	int 0x0000 ;trap
      008008 82 00 00 00             64 	int 0x0000 ;int0
      00800C 82 00 00 00             65 	int 0x0000 ;int1
      008010 82 00 00 00             66 	int 0x0000 ;int2
      008014 82 00 00 00             67 	int 0x0000 ;int3
      008018 82 00 00 00             68 	int 0x0000 ;int4
      00801C 82 00 00 00             69 	int 0x0000 ;int5
      008020 82 00 00 00             70 	int 0x0000 ;int6
      008024 82 00 00 00             71 	int 0x0000 ;int7
      008028 82 00 00 00             72 	int 0x0000 ;int8
      00802C 82 00 00 00             73 	int 0x0000 ;int9
      008030 82 00 00 00             74 	int 0x0000 ;int10
      008034 82 00 00 00             75 	int 0x0000 ;int11
      008038 82 00 00 00             76 	int 0x0000 ;int12
      00803C 82 00 00 00             77 	int 0x0000 ;int13
      008040 82 00 00 00             78 	int 0x0000 ;int14
      008044 82 00 00 00             79 	int 0x0000 ;int15
      008048 82 00 00 00             80 	int 0x0000 ;int16
      00804C 82 00 00 00             81 	int 0x0000 ;int17
      008050 82 00 00 00             82 	int 0x0000 ;int18
      008054 82 00 00 00             83 	int 0x0000 ;int19
      008058 82 00 00 00             84 	int 0x0000 ;int20
      00805C 82 00 00 00             85 	int 0x0000 ;int21
      008060 82 00 00 00             86 	int 0x0000 ;int22
      008064 82 00 00 00             87 	int 0x0000 ;int23
      008068 82 00 00 00             88 	int 0x0000 ;int24
      00806C 82 00 00 00             89 	int 0x0000 ;int25
      008070 82 00 00 00             90 	int 0x0000 ;int26
      008074 82 00 00 00             91 	int 0x0000 ;int27
      008078 82 00 00 00             92 	int 0x0000 ;int28
      00807C 82 00 00 00             93 	int 0x0000 ;int29
                                     94 ;--------------------------------------------------------
                                     95 ; global & static initialisations
                                     96 ;--------------------------------------------------------
                                     97 	.area HOME
                                     98 	.area GSINIT
                                     99 	.area GSFINAL
                                    100 	.area GSINIT
      008083                        101 __sdcc_gs_init_startup:
      008083                        102 __sdcc_init_data:
                                    103 ; stm8_genXINIT() start
      008083 AE 00 08         [ 2]  104 	ldw x, #l_DATA
      008086 27 07            [ 1]  105 	jreq	00002$
      008088                        106 00001$:
      008088 72 4F 00 00      [ 1]  107 	clr (s_DATA - 1, x)
      00808C 5A               [ 2]  108 	decw x
      00808D 26 F9            [ 1]  109 	jrne	00001$
      00808F                        110 00002$:
      00808F AE 00 02         [ 2]  111 	ldw	x, #l_INITIALIZER
      008092 27 09            [ 1]  112 	jreq	00004$
      008094                        113 00003$:
      008094 D6 91 24         [ 1]  114 	ld	a, (s_INITIALIZER - 1, x)
      008097 D7 00 08         [ 1]  115 	ld	(s_INITIALIZED - 1, x), a
      00809A 5A               [ 2]  116 	decw	x
      00809B 26 F7            [ 1]  117 	jrne	00003$
      00809D                        118 00004$:
                                    119 ; stm8_genXINIT() end
                                    120 	.area GSFINAL
      00809D CC 80 80         [ 2]  121 	jp	__sdcc_program_startup
                                    122 ;--------------------------------------------------------
                                    123 ; Home
                                    124 ;--------------------------------------------------------
                                    125 	.area HOME
                                    126 	.area HOME
      008080                        127 __sdcc_program_startup:
      008080 CC 81 03         [ 2]  128 	jp	_main
                                    129 ;	return from main will return to caller
                                    130 ;--------------------------------------------------------
                                    131 ; code
                                    132 ;--------------------------------------------------------
                                    133 	.area CODE
                                    134 ;	main.c: 37: void DS18x20_ReadTemp(void) {
                                    135 ;	-----------------------------------------
                                    136 ;	 function DS18x20_ReadTemp
                                    137 ;	-----------------------------------------
      0080A0                        138 _DS18x20_ReadTemp:
      0080A0 52 05            [ 2]  139 	sub	sp, #5
                                    140 ;	main.c: 41: OneWireReset();                       // Reset Pulse
      0080A2 CD 84 EF         [ 4]  141 	call	_OneWireReset
                                    142 ;	main.c: 42: OneWireWriteByte(SKIP_ROM);           // Issue skip ROM command (CCh)
      0080A5 4B CC            [ 1]  143 	push	#0xcc
      0080A7 CD 85 80         [ 4]  144 	call	_OneWireWriteByte
      0080AA 84               [ 1]  145 	pop	a
                                    146 ;	main.c: 43: OneWireWriteByte(CONVERT_T);          // Convert T command (44h)
      0080AB 4B 44            [ 1]  147 	push	#0x44
      0080AD CD 85 80         [ 4]  148 	call	_OneWireWriteByte
      0080B0 84               [ 1]  149 	pop	a
                                    150 ;	main.c: 44: while(!OW_PIN_VALUE());               // DQ will hold line low while making measurement
      0080B1                        151 00101$:
      0080B1 AE 50 0B         [ 2]  152 	ldw	x, #0x500b
      0080B4 F6               [ 1]  153 	ld	a, (x)
      0080B5 A5 10            [ 1]  154 	bcp	a, #0x10
      0080B7 27 F8            [ 1]  155 	jreq	00101$
                                    156 ;	main.c: 45: OneWireReset();                       // Start new command sequence
      0080B9 CD 84 EF         [ 4]  157 	call	_OneWireReset
                                    158 ;	main.c: 46: OneWireWriteByte(SKIP_ROM);           // Issue skip ROM command
      0080BC 4B CC            [ 1]  159 	push	#0xcc
      0080BE CD 85 80         [ 4]  160 	call	_OneWireWriteByte
      0080C1 84               [ 1]  161 	pop	a
                                    162 ;	main.c: 47: OneWireWriteByte(READ_SCRATCHPAD);    // Read Scratchpad (BEh) - 15 bits
      0080C2 4B BE            [ 1]  163 	push	#0xbe
      0080C4 CD 85 80         [ 4]  164 	call	_OneWireWriteByte
      0080C7 84               [ 1]  165 	pop	a
                                    166 ;	main.c: 48: LSB = OneWireReadByte();
      0080C8 CD 85 98         [ 4]  167 	call	_OneWireReadByte
      0080CB 6B 01            [ 1]  168 	ld	(0x01, sp), a
                                    169 ;	main.c: 49: MSB = OneWireReadByte();
      0080CD CD 85 98         [ 4]  170 	call	_OneWireReadByte
                                    171 ;	main.c: 50: OneWireReset();                       // Stop Reading
      0080D0 88               [ 1]  172 	push	a
      0080D1 CD 84 EF         [ 4]  173 	call	_OneWireReset
      0080D4 84               [ 1]  174 	pop	a
                                    175 ;	main.c: 52: temp = (((MSB << 8) | LSB)/ 16.0);
      0080D5 95               [ 1]  176 	ld	xh, a
      0080D6 4F               [ 1]  177 	clr	a
      0080D7 0F 05            [ 1]  178 	clr	(0x05, sp)
      0080D9 7B 01            [ 1]  179 	ld	a, (0x01, sp)
      0080DB 0F 02            [ 1]  180 	clr	(0x02, sp)
      0080DD 1A 05            [ 1]  181 	or	a, (0x05, sp)
      0080DF 02               [ 1]  182 	rlwa	x
      0080E0 1A 02            [ 1]  183 	or	a, (0x02, sp)
      0080E2 95               [ 1]  184 	ld	xh, a
      0080E3 89               [ 2]  185 	pushw	x
      0080E4 CD 8C 5B         [ 4]  186 	call	___sint2fs
      0080E7 5B 02            [ 2]  187 	addw	sp, #2
      0080E9 4B 00            [ 1]  188 	push	#0x00
      0080EB 4B 00            [ 1]  189 	push	#0x00
      0080ED 4B 80            [ 1]  190 	push	#0x80
      0080EF 4B 41            [ 1]  191 	push	#0x41
      0080F1 89               [ 2]  192 	pushw	x
      0080F2 90 89            [ 2]  193 	pushw	y
      0080F4 CD 8C 6C         [ 4]  194 	call	___fsdiv
      0080F7 5B 08            [ 2]  195 	addw	sp, #8
      0080F9 CF 00 03         [ 2]  196 	ldw	_temp+2, x
      0080FC 90 CF 00 01      [ 2]  197 	ldw	_temp+0, y
      008100 5B 05            [ 2]  198 	addw	sp, #5
      008102 81               [ 4]  199 	ret
                                    200 ;	main.c: 56: void main(void)
                                    201 ;	-----------------------------------------
                                    202 ;	 function main
                                    203 ;	-----------------------------------------
      008103                        204 _main:
                                    205 ;	main.c: 59: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV2);
      008103 4B 08            [ 1]  206 	push	#0x08
      008105 CD 87 95         [ 4]  207 	call	_CLK_HSIPrescalerConfig
      008108 84               [ 1]  208 	pop	a
                                    209 ;	main.c: 63: GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_OUT_OD_LOW_FAST);
      008109 4B A0            [ 1]  210 	push	#0xa0
      00810B 4B 20            [ 1]  211 	push	#0x20
      00810D 4B 05            [ 1]  212 	push	#0x05
      00810F 4B 50            [ 1]  213 	push	#0x50
      008111 CD 82 0A         [ 4]  214 	call	_GPIO_Init
      008114 5B 04            [ 2]  215 	addw	sp, #4
                                    216 ;	main.c: 66: TM1637_INIT(1, 1);
      008116 4B 01            [ 1]  217 	push	#0x01
      008118 4B 01            [ 1]  218 	push	#0x01
      00811A CD 84 36         [ 4]  219 	call	_TM1637_INIT
      00811D 5B 02            [ 2]  220 	addw	sp, #2
                                    221 ;	main.c: 67: TM1637_clear();
      00811F CD 84 A1         [ 4]  222 	call	_TM1637_clear
                                    223 ;	main.c: 69: while (1)
      008122                        224 00102$:
                                    225 ;	main.c: 72: LED_PORT->ODR ^= (uint8_t)LED_PIN;
      008122 AE 50 05         [ 2]  226 	ldw	x, #0x5005
      008125 F6               [ 1]  227 	ld	a, (x)
      008126 A8 20            [ 1]  228 	xor	a, #0x20
      008128 F7               [ 1]  229 	ld	(x), a
                                    230 ;	main.c: 73: DS18x20_ReadTemp();
      008129 CD 80 A0         [ 4]  231 	call	_DS18x20_ReadTemp
                                    232 ;	main.c: 74: delay_us(65000);
      00812C 4B E8            [ 1]  233 	push	#0xe8
      00812E 4B FD            [ 1]  234 	push	#0xfd
      008130 CD 82 CF         [ 4]  235 	call	_delay_us
      008133 5B 02            [ 2]  236 	addw	sp, #2
                                    237 ;	main.c: 75: chuc = (uint8_t) (temp / 10.0) % 10;
      008135 5F               [ 1]  238 	clrw	x
      008136 89               [ 2]  239 	pushw	x
      008137 4B 20            [ 1]  240 	push	#0x20
      008139 4B 41            [ 1]  241 	push	#0x41
      00813B 3B 00 04         [ 1]  242 	push	_temp+3
      00813E 3B 00 03         [ 1]  243 	push	_temp+2
      008141 3B 00 02         [ 1]  244 	push	_temp+1
      008144 3B 00 01         [ 1]  245 	push	_temp+0
      008147 CD 8C 6C         [ 4]  246 	call	___fsdiv
      00814A 5B 08            [ 2]  247 	addw	sp, #8
      00814C 89               [ 2]  248 	pushw	x
      00814D 90 89            [ 2]  249 	pushw	y
      00814F CD 8F 00         [ 4]  250 	call	___fs2uchar
      008152 5B 04            [ 2]  251 	addw	sp, #4
      008154 5F               [ 1]  252 	clrw	x
      008155 97               [ 1]  253 	ld	xl, a
      008156 A6 0A            [ 1]  254 	ld	a, #0x0a
      008158 62               [ 2]  255 	div	x, a
      008159 C7 00 05         [ 1]  256 	ld	_chuc+0, a
                                    257 ;	main.c: 76: donvi = (uint8_t) (temp / 1.0) % 10;
      00815C 90 CE 00 03      [ 2]  258 	ldw	y, _temp+2
      008160 CE 00 01         [ 2]  259 	ldw	x, _temp+0
      008163 90 89            [ 2]  260 	pushw	y
      008165 89               [ 2]  261 	pushw	x
      008166 CD 8F 00         [ 4]  262 	call	___fs2uchar
      008169 5B 04            [ 2]  263 	addw	sp, #4
      00816B 5F               [ 1]  264 	clrw	x
      00816C 97               [ 1]  265 	ld	xl, a
      00816D A6 0A            [ 1]  266 	ld	a, #0x0a
      00816F 62               [ 2]  267 	div	x, a
      008170 C7 00 06         [ 1]  268 	ld	_donvi+0, a
                                    269 ;	main.c: 77: chuctp = (uint8_t) (temp * 10.0) % 10;
      008173 3B 00 04         [ 1]  270 	push	_temp+3
      008176 3B 00 03         [ 1]  271 	push	_temp+2
      008179 3B 00 02         [ 1]  272 	push	_temp+1
      00817C 3B 00 01         [ 1]  273 	push	_temp+0
      00817F 5F               [ 1]  274 	clrw	x
      008180 89               [ 2]  275 	pushw	x
      008181 4B 20            [ 1]  276 	push	#0x20
      008183 4B 41            [ 1]  277 	push	#0x41
      008185 CD 89 59         [ 4]  278 	call	___fsmul
      008188 5B 08            [ 2]  279 	addw	sp, #8
      00818A 89               [ 2]  280 	pushw	x
      00818B 90 89            [ 2]  281 	pushw	y
      00818D CD 8F 00         [ 4]  282 	call	___fs2uchar
      008190 5B 04            [ 2]  283 	addw	sp, #4
      008192 5F               [ 1]  284 	clrw	x
      008193 97               [ 1]  285 	ld	xl, a
      008194 A6 0A            [ 1]  286 	ld	a, #0x0a
      008196 62               [ 2]  287 	div	x, a
      008197 C7 00 08         [ 1]  288 	ld	_chuctp+0, a
                                    289 ;	main.c: 78: tramtp = (uint8_t) (temp * 100.0) % 10;
      00819A 3B 00 04         [ 1]  290 	push	_temp+3
      00819D 3B 00 03         [ 1]  291 	push	_temp+2
      0081A0 3B 00 02         [ 1]  292 	push	_temp+1
      0081A3 3B 00 01         [ 1]  293 	push	_temp+0
      0081A6 5F               [ 1]  294 	clrw	x
      0081A7 89               [ 2]  295 	pushw	x
      0081A8 4B C8            [ 1]  296 	push	#0xc8
      0081AA 4B 42            [ 1]  297 	push	#0x42
      0081AC CD 89 59         [ 4]  298 	call	___fsmul
      0081AF 5B 08            [ 2]  299 	addw	sp, #8
      0081B1 89               [ 2]  300 	pushw	x
      0081B2 90 89            [ 2]  301 	pushw	y
      0081B4 CD 8F 00         [ 4]  302 	call	___fs2uchar
      0081B7 5B 04            [ 2]  303 	addw	sp, #4
      0081B9 5F               [ 1]  304 	clrw	x
      0081BA 97               [ 1]  305 	ld	xl, a
      0081BB A6 0A            [ 1]  306 	ld	a, #0x0a
      0081BD 62               [ 2]  307 	div	x, a
      0081BE C7 00 07         [ 1]  308 	ld	_tramtp+0, a
                                    309 ;	main.c: 79: TM1637_DISPLAY_DIGIT(0x00, chuc);
      0081C1 3B 00 05         [ 1]  310 	push	_chuc+0
      0081C4 4B 00            [ 1]  311 	push	#0x00
      0081C6 CD 84 6D         [ 4]  312 	call	_TM1637_DISPLAY_DIGIT
      0081C9 5B 02            [ 2]  313 	addw	sp, #2
                                    314 ;	main.c: 80: TM1637_DISPLAY_DIGIT(0x01, donvi);
      0081CB 3B 00 06         [ 1]  315 	push	_donvi+0
      0081CE 4B 01            [ 1]  316 	push	#0x01
      0081D0 CD 84 6D         [ 4]  317 	call	_TM1637_DISPLAY_DIGIT
      0081D3 5B 02            [ 2]  318 	addw	sp, #2
                                    319 ;	main.c: 81: TM1637_DISPLAY_DIGIT(0x02, chuctp);
      0081D5 3B 00 08         [ 1]  320 	push	_chuctp+0
      0081D8 4B 02            [ 1]  321 	push	#0x02
      0081DA CD 84 6D         [ 4]  322 	call	_TM1637_DISPLAY_DIGIT
      0081DD 5B 02            [ 2]  323 	addw	sp, #2
                                    324 ;	main.c: 82: TM1637_DISPLAY_DIGIT(0x03, tramtp);
      0081DF 3B 00 07         [ 1]  325 	push	_tramtp+0
      0081E2 4B 03            [ 1]  326 	push	#0x03
      0081E4 CD 84 6D         [ 4]  327 	call	_TM1637_DISPLAY_DIGIT
      0081E7 5B 02            [ 2]  328 	addw	sp, #2
      0081E9 CC 81 22         [ 2]  329 	jp	00102$
      0081EC 81               [ 4]  330 	ret
                                    331 	.area CODE
                                    332 	.area INITIALIZER
                                    333 	.area CABS (ABS)
