                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.5.0 #9253 (Apr  3 2018) (Linux)
                                      4 ; This file was generated Fri Mar 21 14:40:27 2025
                                      5 ;--------------------------------------------------------
                                      6 	.module main
                                      7 	.optsdcc -mstm8
                                      8 	
                                      9 ;--------------------------------------------------------
                                     10 ; Public variables in this module
                                     11 ;--------------------------------------------------------
                                     12 	.globl _OLED_FONT
                                     13 	.globl _OLED_INIT_CMD
                                     14 	.globl _main
                                     15 	.globl _sqrtf
                                     16 	.globl _uart1_nline
                                     17 	.globl _uart1_string
                                     18 	.globl _uart1_number
                                     19 	.globl _uart_init
                                     20 	.globl _I2C_write
                                     21 	.globl _I2C_address
                                     22 	.globl _I2C_stop
                                     23 	.globl _I2C_start
                                     24 	.globl _I2C_init
                                     25 	.globl _Timer4DelayMs
                                     26 	.globl _Timer4Config
                                     27 	.globl _Mode
                                     28 	.globl _Threshold
                                     29 	.globl _Steps
                                     30 	.globl _a
                                     31 	.globl _SumValue
                                     32 	.globl _LastSteps
                                     33 	.globl _Distance
                                     34 	.globl _Value
                                     35 	.globl _LastValue
                                     36 	.globl _CurrentValue
                                     37 	.globl _AccZMSB
                                     38 	.globl _AccZLSB
                                     39 	.globl _AccYMSB
                                     40 	.globl _AccYLSB
                                     41 	.globl _AccXMSB
                                     42 	.globl _AccXLSB
                                     43 	.globl _AccZ
                                     44 	.globl _AccY
                                     45 	.globl _AccX
                                     46 	.globl _initMPU6050
                                     47 	.globl _getMPU6050
                                     48 ;--------------------------------------------------------
                                     49 ; ram data
                                     50 ;--------------------------------------------------------
                                     51 	.area DATA
      000001                         52 _AccX::
      000001                         53 	.ds 4
      000005                         54 _AccY::
      000005                         55 	.ds 4
      000009                         56 _AccZ::
      000009                         57 	.ds 4
      00000D                         58 _AccXLSB::
      00000D                         59 	.ds 2
      00000F                         60 _AccXMSB::
      00000F                         61 	.ds 2
      000011                         62 _AccYLSB::
      000011                         63 	.ds 2
      000013                         64 _AccYMSB::
      000013                         65 	.ds 2
      000015                         66 _AccZLSB::
      000015                         67 	.ds 2
      000017                         68 _AccZMSB::
      000017                         69 	.ds 2
      000019                         70 _CurrentValue::
      000019                         71 	.ds 4
      00001D                         72 _LastValue::
      00001D                         73 	.ds 4
      000021                         74 _Value::
      000021                         75 	.ds 4
      000025                         76 _Distance::
      000025                         77 	.ds 4
      000029                         78 _LastSteps::
      000029                         79 	.ds 1
      00002A                         80 _SumValue::
      00002A                         81 	.ds 4
      00002E                         82 _a::
      00002E                         83 	.ds 1
                                     84 ;--------------------------------------------------------
                                     85 ; ram data
                                     86 ;--------------------------------------------------------
                                     87 	.area INITIALIZED
      000031                         88 _Steps::
      000031                         89 	.ds 1
      000032                         90 _Threshold::
      000032                         91 	.ds 4
      000036                         92 _Mode::
      000036                         93 	.ds 1
                                     94 ;--------------------------------------------------------
                                     95 ; Stack segment in internal ram 
                                     96 ;--------------------------------------------------------
                                     97 	.area	SSEG
      000037                         98 __start__stack:
      000037                         99 	.ds	1
                                    100 
                                    101 ;--------------------------------------------------------
                                    102 ; absolute external ram data
                                    103 ;--------------------------------------------------------
                                    104 	.area DABS (ABS)
                                    105 ;--------------------------------------------------------
                                    106 ; interrupt vector 
                                    107 ;--------------------------------------------------------
                                    108 	.area HOME
      008000                        109 __interrupt_vect:
      008000 82 00 80 83            110 	int s_GSINIT ;reset
      008004 82 00 00 00            111 	int 0x0000 ;trap
      008008 82 00 00 00            112 	int 0x0000 ;int0
      00800C 82 00 00 00            113 	int 0x0000 ;int1
      008010 82 00 00 00            114 	int 0x0000 ;int2
      008014 82 00 00 00            115 	int 0x0000 ;int3
      008018 82 00 00 00            116 	int 0x0000 ;int4
      00801C 82 00 00 00            117 	int 0x0000 ;int5
      008020 82 00 00 00            118 	int 0x0000 ;int6
      008024 82 00 00 00            119 	int 0x0000 ;int7
      008028 82 00 00 00            120 	int 0x0000 ;int8
      00802C 82 00 00 00            121 	int 0x0000 ;int9
      008030 82 00 00 00            122 	int 0x0000 ;int10
      008034 82 00 00 00            123 	int 0x0000 ;int11
      008038 82 00 00 00            124 	int 0x0000 ;int12
      00803C 82 00 00 00            125 	int 0x0000 ;int13
      008040 82 00 00 00            126 	int 0x0000 ;int14
      008044 82 00 00 00            127 	int 0x0000 ;int15
      008048 82 00 00 00            128 	int 0x0000 ;int16
      00804C 82 00 00 00            129 	int 0x0000 ;int17
      008050 82 00 00 00            130 	int 0x0000 ;int18
      008054 82 00 00 00            131 	int 0x0000 ;int19
      008058 82 00 00 00            132 	int 0x0000 ;int20
      00805C 82 00 00 00            133 	int 0x0000 ;int21
      008060 82 00 00 00            134 	int 0x0000 ;int22
      008064 82 00 00 00            135 	int 0x0000 ;int23
      008068 82 00 00 00            136 	int 0x0000 ;int24
      00806C 82 00 00 00            137 	int 0x0000 ;int25
      008070 82 00 00 00            138 	int 0x0000 ;int26
      008074 82 00 00 00            139 	int 0x0000 ;int27
      008078 82 00 00 00            140 	int 0x0000 ;int28
      00807C 82 00 00 00            141 	int 0x0000 ;int29
                                    142 ;--------------------------------------------------------
                                    143 ; global & static initialisations
                                    144 ;--------------------------------------------------------
                                    145 	.area HOME
                                    146 	.area GSINIT
                                    147 	.area GSFINAL
                                    148 	.area GSINIT
      008083                        149 __sdcc_gs_init_startup:
      008083                        150 __sdcc_init_data:
                                    151 ; stm8_genXINIT() start
      008083 AE 00 30         [ 2]  152 	ldw x, #l_DATA
      008086 27 07            [ 1]  153 	jreq	00002$
      008088                        154 00001$:
      008088 72 4F 00 00      [ 1]  155 	clr (s_DATA - 1, x)
      00808C 5A               [ 2]  156 	decw x
      00808D 26 F9            [ 1]  157 	jrne	00001$
      00808F                        158 00002$:
      00808F AE 00 06         [ 2]  159 	ldw	x, #l_INITIALIZER
      008092 27 09            [ 1]  160 	jreq	00004$
      008094                        161 00003$:
      008094 D6 97 D2         [ 1]  162 	ld	a, (s_INITIALIZER - 1, x)
      008097 D7 00 30         [ 1]  163 	ld	(s_INITIALIZED - 1, x), a
      00809A 5A               [ 2]  164 	decw	x
      00809B 26 F7            [ 1]  165 	jrne	00003$
      00809D                        166 00004$:
                                    167 ; stm8_genXINIT() end
                                    168 	.area GSFINAL
      00809D CC 80 80         [ 2]  169 	jp	__sdcc_program_startup
                                    170 ;--------------------------------------------------------
                                    171 ; Home
                                    172 ;--------------------------------------------------------
                                    173 	.area HOME
                                    174 	.area HOME
      008080                        175 __sdcc_program_startup:
      008080 CC 80 A0         [ 2]  176 	jp	_main
                                    177 ;	return from main will return to caller
                                    178 ;--------------------------------------------------------
                                    179 ; code
                                    180 ;--------------------------------------------------------
                                    181 	.area CODE
                                    182 ;	main.c: 118: void main(void)
                                    183 ;	-----------------------------------------
                                    184 ;	 function main
                                    185 ;	-----------------------------------------
      0080A0                        186 _main:
      0080A0 52 08            [ 2]  187 	sub	sp, #8
                                    188 ;	main.c: 121: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      0080A2 AE 50 C6         [ 2]  189 	ldw	x, #0x50c6
      0080A5 F6               [ 1]  190 	ld	a, (x)
      0080A6 A4 E7            [ 1]  191 	and	a, #0xe7
      0080A8 F7               [ 1]  192 	ld	(x), a
                                    193 ;	main.c: 122: CLK->CKDIVR |= (uint8_t)0x00;
      0080A9 AE 50 C6         [ 2]  194 	ldw	x, #0x50c6
      0080AC F6               [ 1]  195 	ld	a, (x)
      0080AD AE 50 C6         [ 2]  196 	ldw	x, #0x50c6
      0080B0 F7               [ 1]  197 	ld	(x), a
                                    198 ;	main.c: 125: GPIOB->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
      0080B1 35 00 50 05      [ 1]  199 	mov	0x5005+0, #0x00
                                    200 ;	main.c: 126: GPIOB->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
      0080B5 35 00 50 07      [ 1]  201 	mov	0x5007+0, #0x00
                                    202 ;	main.c: 127: GPIOB->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
      0080B9 35 00 50 08      [ 1]  203 	mov	0x5008+0, #0x00
                                    204 ;	main.c: 128: GPIOB->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
      0080BD 35 00 50 09      [ 1]  205 	mov	0x5009+0, #0x00
                                    206 ;	main.c: 130: GPIOA->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
      0080C1 35 00 50 00      [ 1]  207 	mov	0x5000+0, #0x00
                                    208 ;	main.c: 131: GPIOA->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
      0080C5 35 00 50 02      [ 1]  209 	mov	0x5002+0, #0x00
                                    210 ;	main.c: 132: GPIOA->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
      0080C9 35 00 50 03      [ 1]  211 	mov	0x5003+0, #0x00
                                    212 ;	main.c: 133: GPIOA->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
      0080CD 35 00 50 04      [ 1]  213 	mov	0x5004+0, #0x00
                                    214 ;	main.c: 135: GPIOC->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
      0080D1 35 00 50 0A      [ 1]  215 	mov	0x500a+0, #0x00
                                    216 ;	main.c: 136: GPIOC->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
      0080D5 35 00 50 0C      [ 1]  217 	mov	0x500c+0, #0x00
                                    218 ;	main.c: 137: GPIOC->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
      0080D9 35 00 50 0D      [ 1]  219 	mov	0x500d+0, #0x00
                                    220 ;	main.c: 138: GPIOC->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
      0080DD 35 00 50 0E      [ 1]  221 	mov	0x500e+0, #0x00
                                    222 ;	main.c: 141: GPIOB->DDR |= (uint8_t)(1 << 4);
      0080E1 AE 50 07         [ 2]  223 	ldw	x, #0x5007
      0080E4 F6               [ 1]  224 	ld	a, (x)
      0080E5 AA 10            [ 1]  225 	or	a, #0x10
      0080E7 F7               [ 1]  226 	ld	(x), a
                                    227 ;	main.c: 142: GPIOB->ODR |= (uint8_t)(1 << 4);
      0080E8 AE 50 05         [ 2]  228 	ldw	x, #0x5005
      0080EB F6               [ 1]  229 	ld	a, (x)
      0080EC AA 10            [ 1]  230 	or	a, #0x10
      0080EE F7               [ 1]  231 	ld	(x), a
                                    232 ;	main.c: 143: GPIOB->CR1 &= ~(uint8_t)(1 << 4); /*OPEN DRAIN*/
      0080EF AE 50 08         [ 2]  233 	ldw	x, #0x5008
      0080F2 F6               [ 1]  234 	ld	a, (x)
      0080F3 A4 EF            [ 1]  235 	and	a, #0xef
      0080F5 F7               [ 1]  236 	ld	(x), a
                                    237 ;	main.c: 144: GPIOB->CR2 &= ~(uint8_t)(1 << 4); /*Output Speed Up to 2Mhz*/
      0080F6 AE 50 09         [ 2]  238 	ldw	x, #0x5009
      0080F9 F6               [ 1]  239 	ld	a, (x)
      0080FA A4 EF            [ 1]  240 	and	a, #0xef
      0080FC F7               [ 1]  241 	ld	(x), a
                                    242 ;	main.c: 147: GPIOB->DDR |= (uint8_t)(1 << 5);
      0080FD AE 50 07         [ 2]  243 	ldw	x, #0x5007
      008100 F6               [ 1]  244 	ld	a, (x)
      008101 AA 20            [ 1]  245 	or	a, #0x20
      008103 F7               [ 1]  246 	ld	(x), a
                                    247 ;	main.c: 148: GPIOB->ODR |= (uint8_t)(1 << 5);
      008104 AE 50 05         [ 2]  248 	ldw	x, #0x5005
      008107 F6               [ 1]  249 	ld	a, (x)
      008108 AA 20            [ 1]  250 	or	a, #0x20
      00810A F7               [ 1]  251 	ld	(x), a
                                    252 ;	main.c: 149: GPIOB->CR1 &= ~(uint8_t)(1 << 5); /*OPEN DRAIN*/
      00810B AE 50 08         [ 2]  253 	ldw	x, #0x5008
      00810E F6               [ 1]  254 	ld	a, (x)
      00810F A4 DF            [ 1]  255 	and	a, #0xdf
      008111 F7               [ 1]  256 	ld	(x), a
                                    257 ;	main.c: 150: GPIOB->CR2 &= ~(uint8_t)(1 << 5); /*Output Speed Up to 2Mhz*/
      008112 AE 50 09         [ 2]  258 	ldw	x, #0x5009
      008115 F6               [ 1]  259 	ld	a, (x)
      008116 A4 DF            [ 1]  260 	and	a, #0xdf
      008118 F7               [ 1]  261 	ld	(x), a
                                    262 ;	main.c: 153: GPIOA->DDR &= ~(uint8_t)(1 << 3);
      008119 AE 50 02         [ 2]  263 	ldw	x, #0x5002
      00811C F6               [ 1]  264 	ld	a, (x)
      00811D A4 F7            [ 1]  265 	and	a, #0xf7
      00811F F7               [ 1]  266 	ld	(x), a
                                    267 ;	main.c: 154: GPIOA->IDR |= (uint8_t)(1 << 3);
      008120 AE 50 01         [ 2]  268 	ldw	x, #0x5001
      008123 F6               [ 1]  269 	ld	a, (x)
      008124 AA 08            [ 1]  270 	or	a, #0x08
      008126 F7               [ 1]  271 	ld	(x), a
                                    272 ;	main.c: 155: GPIOA->CR1 |= (uint8_t)(1 << 3);  /*PULL UP*/
      008127 AE 50 03         [ 2]  273 	ldw	x, #0x5003
      00812A F6               [ 1]  274 	ld	a, (x)
      00812B AA 08            [ 1]  275 	or	a, #0x08
      00812D F7               [ 1]  276 	ld	(x), a
                                    277 ;	main.c: 156: GPIOA->CR2 &= ~(uint8_t)(1 << 3); /*External interrupt disabled*/
      00812E AE 50 04         [ 2]  278 	ldw	x, #0x5004
      008131 F6               [ 1]  279 	ld	a, (x)
      008132 A4 F7            [ 1]  280 	and	a, #0xf7
      008134 F7               [ 1]  281 	ld	(x), a
                                    282 ;	main.c: 159: GPIOC->DDR &= ~(uint8_t)(1 << 3);
      008135 AE 50 0C         [ 2]  283 	ldw	x, #0x500c
      008138 F6               [ 1]  284 	ld	a, (x)
      008139 A4 F7            [ 1]  285 	and	a, #0xf7
      00813B F7               [ 1]  286 	ld	(x), a
                                    287 ;	main.c: 160: GPIOC->IDR |= (uint8_t)(1 << 3);
      00813C AE 50 0B         [ 2]  288 	ldw	x, #0x500b
      00813F F6               [ 1]  289 	ld	a, (x)
      008140 AA 08            [ 1]  290 	or	a, #0x08
      008142 F7               [ 1]  291 	ld	(x), a
                                    292 ;	main.c: 161: GPIOC->CR1 |= (uint8_t)(1 << 3);  /*PULL UP*/
      008143 AE 50 0D         [ 2]  293 	ldw	x, #0x500d
      008146 F6               [ 1]  294 	ld	a, (x)
      008147 AA 08            [ 1]  295 	or	a, #0x08
      008149 F7               [ 1]  296 	ld	(x), a
                                    297 ;	main.c: 162: GPIOC->CR2 &= ~(uint8_t)(1 << 3); /*External interrupt disabled*/
      00814A AE 50 0E         [ 2]  298 	ldw	x, #0x500e
      00814D F6               [ 1]  299 	ld	a, (x)
      00814E A4 F7            [ 1]  300 	and	a, #0xf7
      008150 F7               [ 1]  301 	ld	(x), a
                                    302 ;	main.c: 165: GPIOC->DDR |= (uint8_t)(1 << 4);
      008151 AE 50 0C         [ 2]  303 	ldw	x, #0x500c
      008154 F6               [ 1]  304 	ld	a, (x)
      008155 AA 10            [ 1]  305 	or	a, #0x10
      008157 F7               [ 1]  306 	ld	(x), a
                                    307 ;	main.c: 166: GPIOC->ODR &= ~(uint8_t)(1 << 4);
      008158 AE 50 0A         [ 2]  308 	ldw	x, #0x500a
      00815B F6               [ 1]  309 	ld	a, (x)
      00815C A4 EF            [ 1]  310 	and	a, #0xef
      00815E F7               [ 1]  311 	ld	(x), a
                                    312 ;	main.c: 167: GPIOC->CR1 |= (uint8_t)(1 << 4);  /*PULL PUSH*/
      00815F AE 50 0D         [ 2]  313 	ldw	x, #0x500d
      008162 F6               [ 1]  314 	ld	a, (x)
      008163 AA 10            [ 1]  315 	or	a, #0x10
      008165 F7               [ 1]  316 	ld	(x), a
                                    317 ;	main.c: 168: GPIOC->CR2 &= ~(uint8_t)(1 << 4); /*Output Speed Up to 2Mhz*/
      008166 AE 50 0E         [ 2]  318 	ldw	x, #0x500e
      008169 F6               [ 1]  319 	ld	a, (x)
      00816A A4 EF            [ 1]  320 	and	a, #0xef
      00816C F7               [ 1]  321 	ld	(x), a
                                    322 ;	main.c: 170: uart_init();    //baudrate 57600
      00816D CD 86 A3         [ 4]  323 	call	_uart_init
                                    324 ;	main.c: 171: Timer4Config();
      008170 CD 85 E8         [ 4]  325 	call	_Timer4Config
                                    326 ;	main.c: 172: I2C_init();
      008173 CD 86 0F         [ 4]  327 	call	_I2C_init
                                    328 ;	main.c: 197: initMPU6050();
      008176 CD 82 F2         [ 4]  329 	call	_initMPU6050
                                    330 ;	main.c: 198: Timer4DelayMs(10);
      008179 4B 0A            [ 1]  331 	push	#0x0a
      00817B 4B 00            [ 1]  332 	push	#0x00
      00817D CD 85 F5         [ 4]  333 	call	_Timer4DelayMs
      008180 85               [ 2]  334 	popw	x
                                    335 ;	main.c: 199: for (a = 0; a < 20; a++)
      008181 72 5F 00 2E      [ 1]  336 	clr	_a+0
      008185                        337 00108$:
                                    338 ;	main.c: 201: getMPU6050();
      008185 CD 83 72         [ 4]  339 	call	_getMPU6050
                                    340 ;	main.c: 202: CurrentValue = sqrtf((AccX * AccX) + (AccY * AccY));
      008188 CE 00 03         [ 2]  341 	ldw	x, _AccX+2
      00818B 89               [ 2]  342 	pushw	x
      00818C CE 00 01         [ 2]  343 	ldw	x, _AccX+0
      00818F 89               [ 2]  344 	pushw	x
      008190 CE 00 03         [ 2]  345 	ldw	x, _AccX+2
      008193 89               [ 2]  346 	pushw	x
      008194 CE 00 01         [ 2]  347 	ldw	x, _AccX+0
      008197 89               [ 2]  348 	pushw	x
      008198 CD 87 F1         [ 4]  349 	call	___fsmul
      00819B 5B 08            [ 2]  350 	addw	sp, #8
      00819D 1F 03            [ 2]  351 	ldw	(0x03, sp), x
      00819F 17 01            [ 2]  352 	ldw	(0x01, sp), y
      0081A1 CE 00 07         [ 2]  353 	ldw	x, _AccY+2
      0081A4 89               [ 2]  354 	pushw	x
      0081A5 CE 00 05         [ 2]  355 	ldw	x, _AccY+0
      0081A8 89               [ 2]  356 	pushw	x
      0081A9 CE 00 07         [ 2]  357 	ldw	x, _AccY+2
      0081AC 89               [ 2]  358 	pushw	x
      0081AD CE 00 05         [ 2]  359 	ldw	x, _AccY+0
      0081B0 89               [ 2]  360 	pushw	x
      0081B1 CD 87 F1         [ 4]  361 	call	___fsmul
      0081B4 5B 08            [ 2]  362 	addw	sp, #8
      0081B6 89               [ 2]  363 	pushw	x
      0081B7 90 89            [ 2]  364 	pushw	y
      0081B9 1E 07            [ 2]  365 	ldw	x, (0x07, sp)
      0081BB 89               [ 2]  366 	pushw	x
      0081BC 1E 07            [ 2]  367 	ldw	x, (0x07, sp)
      0081BE 89               [ 2]  368 	pushw	x
      0081BF CD 8D E1         [ 4]  369 	call	___fsadd
      0081C2 5B 08            [ 2]  370 	addw	sp, #8
      0081C4 89               [ 2]  371 	pushw	x
      0081C5 90 89            [ 2]  372 	pushw	y
      0081C7 CD 8A F3         [ 4]  373 	call	_sqrtf
      0081CA 5B 04            [ 2]  374 	addw	sp, #4
      0081CC CF 00 1B         [ 2]  375 	ldw	_CurrentValue+2, x
      0081CF 90 CF 00 19      [ 2]  376 	ldw	_CurrentValue+0, y
                                    377 ;	main.c: 203: LastValue = LastValue + CurrentValue;
      0081D3 CE 00 1B         [ 2]  378 	ldw	x, _CurrentValue+2
      0081D6 89               [ 2]  379 	pushw	x
      0081D7 CE 00 19         [ 2]  380 	ldw	x, _CurrentValue+0
      0081DA 89               [ 2]  381 	pushw	x
      0081DB CE 00 1F         [ 2]  382 	ldw	x, _LastValue+2
      0081DE 89               [ 2]  383 	pushw	x
      0081DF CE 00 1D         [ 2]  384 	ldw	x, _LastValue+0
      0081E2 89               [ 2]  385 	pushw	x
      0081E3 CD 8D E1         [ 4]  386 	call	___fsadd
      0081E6 5B 08            [ 2]  387 	addw	sp, #8
      0081E8 CF 00 1F         [ 2]  388 	ldw	_LastValue+2, x
      0081EB 90 CF 00 1D      [ 2]  389 	ldw	_LastValue+0, y
                                    390 ;	main.c: 199: for (a = 0; a < 20; a++)
      0081EF C6 00 2E         [ 1]  391 	ld	a, _a+0
      0081F2 4C               [ 1]  392 	inc	a
      0081F3 C7 00 2E         [ 1]  393 	ld	_a+0, a
      0081F6 A1 14            [ 1]  394 	cp	a, #0x14
      0081F8 25 8B            [ 1]  395 	jrc	00108$
                                    396 ;	main.c: 206: uart1_string(" ");
      0081FA AE 85 E6         [ 2]  397 	ldw	x, #___str_0+0
      0081FD 89               [ 2]  398 	pushw	x
      0081FE CD 87 AB         [ 4]  399 	call	_uart1_string
      008201 85               [ 2]  400 	popw	x
                                    401 ;	main.c: 207: uart1_number((int)LastValue);
      008202 CE 00 1F         [ 2]  402 	ldw	x, _LastValue+2
      008205 89               [ 2]  403 	pushw	x
      008206 CE 00 1D         [ 2]  404 	ldw	x, _LastValue+0
      008209 89               [ 2]  405 	pushw	x
      00820A CD 91 6E         [ 4]  406 	call	___fs2sint
      00820D 5B 04            [ 2]  407 	addw	sp, #4
      00820F 89               [ 2]  408 	pushw	x
      008210 CD 87 0B         [ 4]  409 	call	_uart1_number
      008213 85               [ 2]  410 	popw	x
                                    411 ;	main.c: 211: while (1)
      008214                        412 00106$:
                                    413 ;	main.c: 214: for (a = 0; a < 20; a++) /*100-500 mau*/
      008214 72 5F 00 2E      [ 1]  414 	clr	_a+0
      008218                        415 00110$:
                                    416 ;	main.c: 216: getMPU6050();
      008218 CD 83 72         [ 4]  417 	call	_getMPU6050
                                    418 ;	main.c: 217: CurrentValue = sqrtf((AccX * AccX) + (AccY * AccY));
      00821B CE 00 03         [ 2]  419 	ldw	x, _AccX+2
      00821E 89               [ 2]  420 	pushw	x
      00821F CE 00 01         [ 2]  421 	ldw	x, _AccX+0
      008222 89               [ 2]  422 	pushw	x
      008223 CE 00 03         [ 2]  423 	ldw	x, _AccX+2
      008226 89               [ 2]  424 	pushw	x
      008227 CE 00 01         [ 2]  425 	ldw	x, _AccX+0
      00822A 89               [ 2]  426 	pushw	x
      00822B CD 87 F1         [ 4]  427 	call	___fsmul
      00822E 5B 08            [ 2]  428 	addw	sp, #8
      008230 1F 07            [ 2]  429 	ldw	(0x07, sp), x
      008232 17 05            [ 2]  430 	ldw	(0x05, sp), y
      008234 CE 00 07         [ 2]  431 	ldw	x, _AccY+2
      008237 89               [ 2]  432 	pushw	x
      008238 CE 00 05         [ 2]  433 	ldw	x, _AccY+0
      00823B 89               [ 2]  434 	pushw	x
      00823C CE 00 07         [ 2]  435 	ldw	x, _AccY+2
      00823F 89               [ 2]  436 	pushw	x
      008240 CE 00 05         [ 2]  437 	ldw	x, _AccY+0
      008243 89               [ 2]  438 	pushw	x
      008244 CD 87 F1         [ 4]  439 	call	___fsmul
      008247 5B 08            [ 2]  440 	addw	sp, #8
      008249 89               [ 2]  441 	pushw	x
      00824A 90 89            [ 2]  442 	pushw	y
      00824C 1E 0B            [ 2]  443 	ldw	x, (0x0b, sp)
      00824E 89               [ 2]  444 	pushw	x
      00824F 1E 0B            [ 2]  445 	ldw	x, (0x0b, sp)
      008251 89               [ 2]  446 	pushw	x
      008252 CD 8D E1         [ 4]  447 	call	___fsadd
      008255 5B 08            [ 2]  448 	addw	sp, #8
      008257 89               [ 2]  449 	pushw	x
      008258 90 89            [ 2]  450 	pushw	y
      00825A CD 8A F3         [ 4]  451 	call	_sqrtf
      00825D 5B 04            [ 2]  452 	addw	sp, #4
      00825F CF 00 1B         [ 2]  453 	ldw	_CurrentValue+2, x
      008262 90 CF 00 19      [ 2]  454 	ldw	_CurrentValue+0, y
                                    455 ;	main.c: 218: SumValue = SumValue + CurrentValue;
      008266 CE 00 1B         [ 2]  456 	ldw	x, _CurrentValue+2
      008269 89               [ 2]  457 	pushw	x
      00826A CE 00 19         [ 2]  458 	ldw	x, _CurrentValue+0
      00826D 89               [ 2]  459 	pushw	x
      00826E CE 00 2C         [ 2]  460 	ldw	x, _SumValue+2
      008271 89               [ 2]  461 	pushw	x
      008272 CE 00 2A         [ 2]  462 	ldw	x, _SumValue+0
      008275 89               [ 2]  463 	pushw	x
      008276 CD 8D E1         [ 4]  464 	call	___fsadd
      008279 5B 08            [ 2]  465 	addw	sp, #8
      00827B CF 00 2C         [ 2]  466 	ldw	_SumValue+2, x
      00827E 90 CF 00 2A      [ 2]  467 	ldw	_SumValue+0, y
                                    468 ;	main.c: 214: for (a = 0; a < 20; a++) /*100-500 mau*/
      008282 C6 00 2E         [ 1]  469 	ld	a, _a+0
      008285 4C               [ 1]  470 	inc	a
      008286 C7 00 2E         [ 1]  471 	ld	_a+0, a
      008289 A1 14            [ 1]  472 	cp	a, #0x14
      00828B 25 8B            [ 1]  473 	jrc	00110$
                                    474 ;	main.c: 221: Value = SumValue - LastValue;
      00828D CE 00 1F         [ 2]  475 	ldw	x, _LastValue+2
      008290 89               [ 2]  476 	pushw	x
      008291 CE 00 1D         [ 2]  477 	ldw	x, _LastValue+0
      008294 89               [ 2]  478 	pushw	x
      008295 CE 00 2C         [ 2]  479 	ldw	x, _SumValue+2
      008298 89               [ 2]  480 	pushw	x
      008299 CE 00 2A         [ 2]  481 	ldw	x, _SumValue+0
      00829C 89               [ 2]  482 	pushw	x
      00829D CD 87 CE         [ 4]  483 	call	___fssub
      0082A0 5B 08            [ 2]  484 	addw	sp, #8
      0082A2 CF 00 23         [ 2]  485 	ldw	_Value+2, x
      0082A5 90 CF 00 21      [ 2]  486 	ldw	_Value+0, y
                                    487 ;	main.c: 223: if (Value > Threshold)
      0082A9 CE 00 34         [ 2]  488 	ldw	x, _Threshold+2
      0082AC 89               [ 2]  489 	pushw	x
      0082AD CE 00 32         [ 2]  490 	ldw	x, _Threshold+0
      0082B0 89               [ 2]  491 	pushw	x
      0082B1 CE 00 23         [ 2]  492 	ldw	x, _Value+2
      0082B4 89               [ 2]  493 	pushw	x
      0082B5 CE 00 21         [ 2]  494 	ldw	x, _Value+0
      0082B8 89               [ 2]  495 	pushw	x
      0082B9 CD 8C 07         [ 4]  496 	call	___fsgt
      0082BC 5B 08            [ 2]  497 	addw	sp, #8
      0082BE 4D               [ 1]  498 	tnz	a
      0082BF 27 07            [ 1]  499 	jreq	00104$
                                    500 ;	main.c: 225: Steps++;
      0082C1 C6 00 31         [ 1]  501 	ld	a, _Steps+0
      0082C4 4C               [ 1]  502 	inc	a
      0082C5 C7 00 31         [ 1]  503 	ld	_Steps+0, a
      0082C8                        504 00104$:
                                    505 ;	main.c: 228: uart1_number((int)Value);
      0082C8 CE 00 23         [ 2]  506 	ldw	x, _Value+2
      0082CB 89               [ 2]  507 	pushw	x
      0082CC CE 00 21         [ 2]  508 	ldw	x, _Value+0
      0082CF 89               [ 2]  509 	pushw	x
      0082D0 CD 91 6E         [ 4]  510 	call	___fs2sint
      0082D3 5B 04            [ 2]  511 	addw	sp, #4
      0082D5 89               [ 2]  512 	pushw	x
      0082D6 CD 87 0B         [ 4]  513 	call	_uart1_number
      0082D9 85               [ 2]  514 	popw	x
                                    515 ;	main.c: 229: uart1_nline();
      0082DA CD 87 C2         [ 4]  516 	call	_uart1_nline
                                    517 ;	main.c: 230: Timer4DelayMs(100);
      0082DD 4B 64            [ 1]  518 	push	#0x64
      0082DF 4B 00            [ 1]  519 	push	#0x00
      0082E1 CD 85 F5         [ 4]  520 	call	_Timer4DelayMs
      0082E4 85               [ 2]  521 	popw	x
                                    522 ;	main.c: 231: SumValue = 0;
      0082E5 5F               [ 1]  523 	clrw	x
      0082E6 CF 00 2C         [ 2]  524 	ldw	_SumValue+2, x
      0082E9 CF 00 2A         [ 2]  525 	ldw	_SumValue+0, x
      0082EC CC 82 14         [ 2]  526 	jp	00106$
      0082EF 5B 08            [ 2]  527 	addw	sp, #8
      0082F1 81               [ 4]  528 	ret
                                    529 ;	main.c: 337: void initMPU6050(void)
                                    530 ;	-----------------------------------------
                                    531 ;	 function initMPU6050
                                    532 ;	-----------------------------------------
      0082F2                        533 _initMPU6050:
                                    534 ;	main.c: 339: I2C_start();	/*Disable SLEEP Mode*/
      0082F2 CD 86 4C         [ 4]  535 	call	_I2C_start
                                    536 ;	main.c: 340: I2C_address((uint8_t)0x68 << 1, I2C_DIRECTION_TX);
      0082F5 4B 00            [ 1]  537 	push	#0x00
      0082F7 4B D0            [ 1]  538 	push	#0xd0
      0082F9 CD 86 72         [ 4]  539 	call	_I2C_address
      0082FC 85               [ 2]  540 	popw	x
                                    541 ;	main.c: 341: I2C_write(0x6B);
      0082FD 4B 6B            [ 1]  542 	push	#0x6b
      0082FF CD 86 8D         [ 4]  543 	call	_I2C_write
      008302 84               [ 1]  544 	pop	a
                                    545 ;	main.c: 342: I2C_write(0x00);
      008303 4B 00            [ 1]  546 	push	#0x00
      008305 CD 86 8D         [ 4]  547 	call	_I2C_write
      008308 84               [ 1]  548 	pop	a
                                    549 ;	main.c: 343: I2C_stop();
      008309 CD 86 62         [ 4]  550 	call	_I2C_stop
                                    551 ;	main.c: 344: Timer4DelayMs(100);
      00830C 4B 64            [ 1]  552 	push	#0x64
      00830E 4B 00            [ 1]  553 	push	#0x00
      008310 CD 85 F5         [ 4]  554 	call	_Timer4DelayMs
      008313 85               [ 2]  555 	popw	x
                                    556 ;	main.c: 346: I2C_start();	/*Enable Low Pass Filter*/
      008314 CD 86 4C         [ 4]  557 	call	_I2C_start
                                    558 ;	main.c: 347: I2C_address((uint8_t)0x68 << 1, I2C_DIRECTION_TX);
      008317 4B 00            [ 1]  559 	push	#0x00
      008319 4B D0            [ 1]  560 	push	#0xd0
      00831B CD 86 72         [ 4]  561 	call	_I2C_address
      00831E 85               [ 2]  562 	popw	x
                                    563 ;	main.c: 348: I2C_write(0x1A);
      00831F 4B 1A            [ 1]  564 	push	#0x1a
      008321 CD 86 8D         [ 4]  565 	call	_I2C_write
      008324 84               [ 1]  566 	pop	a
                                    567 ;	main.c: 349: I2C_write(0x05);
      008325 4B 05            [ 1]  568 	push	#0x05
      008327 CD 86 8D         [ 4]  569 	call	_I2C_write
      00832A 84               [ 1]  570 	pop	a
                                    571 ;	main.c: 350: I2C_stop();
      00832B CD 86 62         [ 4]  572 	call	_I2C_stop
                                    573 ;	main.c: 351: Timer4DelayMs(100);
      00832E 4B 64            [ 1]  574 	push	#0x64
      008330 4B 00            [ 1]  575 	push	#0x00
      008332 CD 85 F5         [ 4]  576 	call	_Timer4DelayMs
      008335 85               [ 2]  577 	popw	x
                                    578 ;	main.c: 353: I2C_start();
      008336 CD 86 4C         [ 4]  579 	call	_I2C_start
                                    580 ;	main.c: 354: I2C_address((uint8_t)0x68 << 1, I2C_DIRECTION_TX);
      008339 4B 00            [ 1]  581 	push	#0x00
      00833B 4B D0            [ 1]  582 	push	#0xd0
      00833D CD 86 72         [ 4]  583 	call	_I2C_address
      008340 85               [ 2]  584 	popw	x
                                    585 ;	main.c: 355: I2C_write(0x1B);
      008341 4B 1B            [ 1]  586 	push	#0x1b
      008343 CD 86 8D         [ 4]  587 	call	_I2C_write
      008346 84               [ 1]  588 	pop	a
                                    589 ;	main.c: 356: I2C_write(0x00); // 250 do/s
      008347 4B 00            [ 1]  590 	push	#0x00
      008349 CD 86 8D         [ 4]  591 	call	_I2C_write
      00834C 84               [ 1]  592 	pop	a
                                    593 ;	main.c: 357: I2C_stop();
      00834D CD 86 62         [ 4]  594 	call	_I2C_stop
                                    595 ;	main.c: 358: Timer4DelayMs(100);
      008350 4B 64            [ 1]  596 	push	#0x64
      008352 4B 00            [ 1]  597 	push	#0x00
      008354 CD 85 F5         [ 4]  598 	call	_Timer4DelayMs
      008357 85               [ 2]  599 	popw	x
                                    600 ;	main.c: 360: I2C_start(); /*Accelerometer Configuration*/
      008358 CD 86 4C         [ 4]  601 	call	_I2C_start
                                    602 ;	main.c: 361: I2C_address((uint8_t)0x68 << 1, I2C_DIRECTION_TX);
      00835B 4B 00            [ 1]  603 	push	#0x00
      00835D 4B D0            [ 1]  604 	push	#0xd0
      00835F CD 86 72         [ 4]  605 	call	_I2C_address
      008362 85               [ 2]  606 	popw	x
                                    607 ;	main.c: 362: I2C_write(0x1C);
      008363 4B 1C            [ 1]  608 	push	#0x1c
      008365 CD 86 8D         [ 4]  609 	call	_I2C_write
      008368 84               [ 1]  610 	pop	a
                                    611 ;	main.c: 363: I2C_write(0x10); //+-8g
      008369 4B 10            [ 1]  612 	push	#0x10
      00836B CD 86 8D         [ 4]  613 	call	_I2C_write
      00836E 84               [ 1]  614 	pop	a
                                    615 ;	main.c: 364: I2C_stop();
      00836F CC 86 62         [ 2]  616 	jp	_I2C_stop
                                    617 ;	main.c: 366: void getMPU6050(void)
                                    618 ;	-----------------------------------------
                                    619 ;	 function getMPU6050
                                    620 ;	-----------------------------------------
      008372                        621 _getMPU6050:
                                    622 ;	main.c: 370: I2C_start();
      008372 CD 86 4C         [ 4]  623 	call	_I2C_start
                                    624 ;	main.c: 371: I2C_address(I2C_Slave_Address, I2C_DIRECTION_TX);
      008375 4B 00            [ 1]  625 	push	#0x00
      008377 4B D0            [ 1]  626 	push	#0xd0
      008379 CD 86 72         [ 4]  627 	call	_I2C_address
      00837C 85               [ 2]  628 	popw	x
                                    629 ;	main.c: 372: I2C_write(0x3B);
      00837D 4B 3B            [ 1]  630 	push	#0x3b
      00837F CD 86 8D         [ 4]  631 	call	_I2C_write
      008382 84               [ 1]  632 	pop	a
                                    633 ;	main.c: 374: I2C->CR2 |= I2C_CR2_START | I2C_CR2_ACK; /* Generate a START condition and Acknowledge Enable */
      008383 AE 52 11         [ 2]  634 	ldw	x, #0x5211
      008386 F6               [ 1]  635 	ld	a, (x)
      008387 AA 05            [ 1]  636 	or	a, #0x05
      008389 F7               [ 1]  637 	ld	(x), a
                                    638 ;	main.c: 375: while ((I2C->SR1 & I2C_SR1_SB) == 0)
      00838A                        639 00101$:
      00838A AE 52 17         [ 2]  640 	ldw	x, #0x5217
      00838D F6               [ 1]  641 	ld	a, (x)
      00838E 44               [ 1]  642 	srl	a
      00838F 24 F9            [ 1]  643 	jrnc	00101$
                                    644 ;	main.c: 378: I2C->DR = (uint8_t)(I2C_Slave_Address | (uint8_t)I2C_DIRECTION_RX); /* Send the Address + Direction */
      008391 35 D1 52 16      [ 1]  645 	mov	0x5216+0, #0xd1
                                    646 ;	main.c: 380: I2C->SR1;
      008395 AE 52 17         [ 2]  647 	ldw	x, #0x5217
      008398 F6               [ 1]  648 	ld	a, (x)
                                    649 ;	main.c: 381: I2C->SR3;
      008399 AE 52 19         [ 2]  650 	ldw	x, #0x5219
      00839C F6               [ 1]  651 	ld	a, (x)
                                    652 ;	main.c: 382: while ((I2C->SR1 & I2C_SR1_ADDR) == 0)
      00839D                        653 00104$:
      00839D AE 52 17         [ 2]  654 	ldw	x, #0x5217
      0083A0 F6               [ 1]  655 	ld	a, (x)
      0083A1 A5 02            [ 1]  656 	bcp	a, #0x02
      0083A3 27 F8            [ 1]  657 	jreq	00104$
                                    658 ;	main.c: 384: while ((I2C->SR3 & (uint8_t)0x02) == SET)
      0083A5                        659 00107$:
      0083A5 AE 52 19         [ 2]  660 	ldw	x, #0x5219
      0083A8 F6               [ 1]  661 	ld	a, (x)
      0083A9 A4 02            [ 1]  662 	and	a, #0x02
      0083AB A1 01            [ 1]  663 	cp	a, #0x01
      0083AD 27 F6            [ 1]  664 	jreq	00107$
                                    665 ;	main.c: 387: while ((I2C->SR1 & I2C_SR1_RXNE) == 0)
      0083AF                        666 00110$:
      0083AF AE 52 17         [ 2]  667 	ldw	x, #0x5217
      0083B2 F6               [ 1]  668 	ld	a, (x)
      0083B3 A5 40            [ 1]  669 	bcp	a, #0x40
      0083B5 27 F8            [ 1]  670 	jreq	00110$
                                    671 ;	main.c: 389: AccXLSB = (uint8_t)I2C->DR;
      0083B7 AE 52 16         [ 2]  672 	ldw	x, #0x5216
      0083BA F6               [ 1]  673 	ld	a, (x)
      0083BB 5F               [ 1]  674 	clrw	x
      0083BC 97               [ 1]  675 	ld	xl, a
      0083BD CF 00 0D         [ 2]  676 	ldw	_AccXLSB+0, x
                                    677 ;	main.c: 390: I2C->CR2 |= (uint8_t)(I2C_CR2_ACK); /* Enable the acknowledgement */
      0083C0 AE 52 11         [ 2]  678 	ldw	x, #0x5211
      0083C3 F6               [ 1]  679 	ld	a, (x)
      0083C4 AA 04            [ 1]  680 	or	a, #0x04
      0083C6 F7               [ 1]  681 	ld	(x), a
                                    682 ;	main.c: 392: while ((I2C->SR1 & I2C_SR1_RXNE) == 0)
      0083C7                        683 00113$:
      0083C7 AE 52 17         [ 2]  684 	ldw	x, #0x5217
      0083CA F6               [ 1]  685 	ld	a, (x)
      0083CB A5 40            [ 1]  686 	bcp	a, #0x40
      0083CD 27 F8            [ 1]  687 	jreq	00113$
                                    688 ;	main.c: 394: AccXMSB = (uint8_t)I2C->DR;
      0083CF AE 52 16         [ 2]  689 	ldw	x, #0x5216
      0083D2 F6               [ 1]  690 	ld	a, (x)
      0083D3 5F               [ 1]  691 	clrw	x
      0083D4 97               [ 1]  692 	ld	xl, a
      0083D5 CF 00 0F         [ 2]  693 	ldw	_AccXMSB+0, x
                                    694 ;	main.c: 395: I2C->CR2 |= (uint8_t)(I2C_CR2_ACK); /* Enable the acknowledgement */
      0083D8 AE 52 11         [ 2]  695 	ldw	x, #0x5211
      0083DB F6               [ 1]  696 	ld	a, (x)
      0083DC AA 04            [ 1]  697 	or	a, #0x04
      0083DE F7               [ 1]  698 	ld	(x), a
                                    699 ;	main.c: 397: while ((I2C->SR1 & I2C_SR1_RXNE) == 0)
      0083DF                        700 00116$:
      0083DF AE 52 17         [ 2]  701 	ldw	x, #0x5217
      0083E2 F6               [ 1]  702 	ld	a, (x)
      0083E3 A5 40            [ 1]  703 	bcp	a, #0x40
      0083E5 27 F8            [ 1]  704 	jreq	00116$
                                    705 ;	main.c: 399: AccYLSB = (uint8_t)I2C->DR;
      0083E7 AE 52 16         [ 2]  706 	ldw	x, #0x5216
      0083EA F6               [ 1]  707 	ld	a, (x)
      0083EB 5F               [ 1]  708 	clrw	x
      0083EC 97               [ 1]  709 	ld	xl, a
      0083ED CF 00 11         [ 2]  710 	ldw	_AccYLSB+0, x
                                    711 ;	main.c: 400: I2C->CR2 |= (uint8_t)(I2C_CR2_ACK); /* Enable the acknowledgement */
      0083F0 AE 52 11         [ 2]  712 	ldw	x, #0x5211
      0083F3 F6               [ 1]  713 	ld	a, (x)
      0083F4 AA 04            [ 1]  714 	or	a, #0x04
      0083F6 F7               [ 1]  715 	ld	(x), a
                                    716 ;	main.c: 402: while ((I2C->SR1 & I2C_SR1_RXNE) == 0)
      0083F7                        717 00119$:
      0083F7 AE 52 17         [ 2]  718 	ldw	x, #0x5217
      0083FA F6               [ 1]  719 	ld	a, (x)
      0083FB A5 40            [ 1]  720 	bcp	a, #0x40
      0083FD 27 F8            [ 1]  721 	jreq	00119$
                                    722 ;	main.c: 404: AccYMSB = (uint8_t)I2C->DR;
      0083FF AE 52 16         [ 2]  723 	ldw	x, #0x5216
      008402 F6               [ 1]  724 	ld	a, (x)
      008403 5F               [ 1]  725 	clrw	x
      008404 97               [ 1]  726 	ld	xl, a
      008405 CF 00 13         [ 2]  727 	ldw	_AccYMSB+0, x
                                    728 ;	main.c: 405: I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK); /* Enable the acknowledgement */
      008408 AE 52 11         [ 2]  729 	ldw	x, #0x5211
      00840B F6               [ 1]  730 	ld	a, (x)
      00840C A4 FB            [ 1]  731 	and	a, #0xfb
      00840E F7               [ 1]  732 	ld	(x), a
                                    733 ;	main.c: 407: I2C_stop();
      00840F CD 86 62         [ 4]  734 	call	_I2C_stop
                                    735 ;	main.c: 409: AccXLSB = (AccXLSB << 8) | AccXMSB; /*16 bit , 0-65535*/ /*0-1g, 0-9.8m/s^2*/
      008412 C6 00 0E         [ 1]  736 	ld	a, _AccXLSB+1
      008415 95               [ 1]  737 	ld	xh, a
      008416 4F               [ 1]  738 	clr	a
      008417 CA 00 10         [ 1]  739 	or	a, _AccXMSB+1
      00841A 02               [ 1]  740 	rlwa	x
      00841B CA 00 0F         [ 1]  741 	or	a, _AccXMSB+0
      00841E 95               [ 1]  742 	ld	xh, a
      00841F CF 00 0D         [ 2]  743 	ldw	_AccXLSB+0, x
                                    744 ;	main.c: 410: AccYLSB = (AccYLSB << 8) | AccYMSB;
      008422 C6 00 12         [ 1]  745 	ld	a, _AccYLSB+1
      008425 95               [ 1]  746 	ld	xh, a
      008426 4F               [ 1]  747 	clr	a
      008427 CA 00 14         [ 1]  748 	or	a, _AccYMSB+1
      00842A 02               [ 1]  749 	rlwa	x
      00842B CA 00 13         [ 1]  750 	or	a, _AccYMSB+0
      00842E 95               [ 1]  751 	ld	xh, a
      00842F CF 00 11         [ 2]  752 	ldw	_AccYLSB+0, x
                                    753 ;	main.c: 412: AccX = (float)AccXLSB / 4096.0 - 0.04;
      008432 CE 00 0D         [ 2]  754 	ldw	x, _AccXLSB+0
      008435 89               [ 2]  755 	pushw	x
      008436 CD 91 AC         [ 4]  756 	call	___sint2fs
      008439 5B 02            [ 2]  757 	addw	sp, #2
      00843B 4B 00            [ 1]  758 	push	#0x00
      00843D 4B 00            [ 1]  759 	push	#0x00
      00843F 4B 80            [ 1]  760 	push	#0x80
      008441 4B 45            [ 1]  761 	push	#0x45
      008443 89               [ 2]  762 	pushw	x
      008444 90 89            [ 2]  763 	pushw	y
      008446 CD 92 41         [ 4]  764 	call	___fsdiv
      008449 5B 08            [ 2]  765 	addw	sp, #8
      00844B 4B 0A            [ 1]  766 	push	#0x0a
      00844D 4B D7            [ 1]  767 	push	#0xd7
      00844F 4B 23            [ 1]  768 	push	#0x23
      008451 4B 3D            [ 1]  769 	push	#0x3d
      008453 89               [ 2]  770 	pushw	x
      008454 90 89            [ 2]  771 	pushw	y
      008456 CD 87 CE         [ 4]  772 	call	___fssub
      008459 5B 08            [ 2]  773 	addw	sp, #8
      00845B CF 00 03         [ 2]  774 	ldw	_AccX+2, x
      00845E 90 CF 00 01      [ 2]  775 	ldw	_AccX+0, y
                                    776 ;	main.c: 413: AccY = (float)AccYLSB / 4096.0 + 0.01;
      008462 CE 00 11         [ 2]  777 	ldw	x, _AccYLSB+0
      008465 89               [ 2]  778 	pushw	x
      008466 CD 91 AC         [ 4]  779 	call	___sint2fs
      008469 5B 02            [ 2]  780 	addw	sp, #2
      00846B 4B 00            [ 1]  781 	push	#0x00
      00846D 4B 00            [ 1]  782 	push	#0x00
      00846F 4B 80            [ 1]  783 	push	#0x80
      008471 4B 45            [ 1]  784 	push	#0x45
      008473 89               [ 2]  785 	pushw	x
      008474 90 89            [ 2]  786 	pushw	y
      008476 CD 92 41         [ 4]  787 	call	___fsdiv
      008479 5B 08            [ 2]  788 	addw	sp, #8
      00847B 4B 0A            [ 1]  789 	push	#0x0a
      00847D 4B D7            [ 1]  790 	push	#0xd7
      00847F 4B 23            [ 1]  791 	push	#0x23
      008481 4B 3C            [ 1]  792 	push	#0x3c
      008483 89               [ 2]  793 	pushw	x
      008484 90 89            [ 2]  794 	pushw	y
      008486 CD 8D E1         [ 4]  795 	call	___fsadd
      008489 5B 08            [ 2]  796 	addw	sp, #8
      00848B CF 00 07         [ 2]  797 	ldw	_AccY+2, x
      00848E 90 CF 00 05      [ 2]  798 	ldw	_AccY+0, y
      008492 81               [ 4]  799 	ret
                                    800 	.area CODE
      008493                        801 _OLED_INIT_CMD:
      008493 A8                     802 	.db #0xA8	; 168
      008494 1F                     803 	.db #0x1F	; 31
      008495 22                     804 	.db #0x22	; 34
      008496 00                     805 	.db #0x00	; 0
      008497 03                     806 	.db #0x03	; 3
      008498 20                     807 	.db #0x20	; 32
      008499 00                     808 	.db #0x00	; 0
      00849A DA                     809 	.db #0xDA	; 218
      00849B 02                     810 	.db #0x02	; 2
      00849C 8D                     811 	.db #0x8D	; 141
      00849D 14                     812 	.db #0x14	; 20
      00849E AF                     813 	.db #0xAF	; 175
      00849F A1                     814 	.db #0xA1	; 161
      0084A0 C8                     815 	.db #0xC8	; 200
      0084A1                        816 _OLED_FONT:
      0084A1 00                     817 	.db #0x00	; 0
      0084A2 00                     818 	.db #0x00	; 0
      0084A3 00                     819 	.db #0x00	; 0
      0084A4 00                     820 	.db #0x00	; 0
      0084A5 00                     821 	.db #0x00	; 0
      0084A6 00                     822 	.db #0x00	; 0
      0084A7 00                     823 	.db #0x00	; 0
      0084A8 2F                     824 	.db #0x2F	; 47
      0084A9 00                     825 	.db #0x00	; 0
      0084AA 00                     826 	.db #0x00	; 0
      0084AB 00                     827 	.db #0x00	; 0
      0084AC 07                     828 	.db #0x07	; 7
      0084AD 00                     829 	.db #0x00	; 0
      0084AE 07                     830 	.db #0x07	; 7
      0084AF 00                     831 	.db #0x00	; 0
      0084B0 14                     832 	.db #0x14	; 20
      0084B1 7F                     833 	.db #0x7F	; 127
      0084B2 14                     834 	.db #0x14	; 20
      0084B3 7F                     835 	.db #0x7F	; 127
      0084B4 14                     836 	.db #0x14	; 20
      0084B5 24                     837 	.db #0x24	; 36
      0084B6 2A                     838 	.db #0x2A	; 42
      0084B7 7F                     839 	.db #0x7F	; 127
      0084B8 2A                     840 	.db #0x2A	; 42
      0084B9 12                     841 	.db #0x12	; 18
      0084BA 62                     842 	.db #0x62	; 98	'b'
      0084BB 64                     843 	.db #0x64	; 100	'd'
      0084BC 08                     844 	.db #0x08	; 8
      0084BD 13                     845 	.db #0x13	; 19
      0084BE 23                     846 	.db #0x23	; 35
      0084BF 36                     847 	.db #0x36	; 54	'6'
      0084C0 49                     848 	.db #0x49	; 73	'I'
      0084C1 55                     849 	.db #0x55	; 85	'U'
      0084C2 22                     850 	.db #0x22	; 34
      0084C3 50                     851 	.db #0x50	; 80	'P'
      0084C4 00                     852 	.db #0x00	; 0
      0084C5 05                     853 	.db #0x05	; 5
      0084C6 03                     854 	.db #0x03	; 3
      0084C7 00                     855 	.db #0x00	; 0
      0084C8 00                     856 	.db #0x00	; 0
      0084C9 00                     857 	.db #0x00	; 0
      0084CA 1C                     858 	.db #0x1C	; 28
      0084CB 22                     859 	.db #0x22	; 34
      0084CC 41                     860 	.db #0x41	; 65	'A'
      0084CD 00                     861 	.db #0x00	; 0
      0084CE 00                     862 	.db #0x00	; 0
      0084CF 41                     863 	.db #0x41	; 65	'A'
      0084D0 22                     864 	.db #0x22	; 34
      0084D1 1C                     865 	.db #0x1C	; 28
      0084D2 00                     866 	.db #0x00	; 0
      0084D3 14                     867 	.db #0x14	; 20
      0084D4 08                     868 	.db #0x08	; 8
      0084D5 3E                     869 	.db #0x3E	; 62
      0084D6 08                     870 	.db #0x08	; 8
      0084D7 14                     871 	.db #0x14	; 20
      0084D8 08                     872 	.db #0x08	; 8
      0084D9 08                     873 	.db #0x08	; 8
      0084DA 3E                     874 	.db #0x3E	; 62
      0084DB 08                     875 	.db #0x08	; 8
      0084DC 08                     876 	.db #0x08	; 8
      0084DD 00                     877 	.db #0x00	; 0
      0084DE 00                     878 	.db #0x00	; 0
      0084DF A0                     879 	.db #0xA0	; 160
      0084E0 60                     880 	.db #0x60	; 96
      0084E1 00                     881 	.db #0x00	; 0
      0084E2 08                     882 	.db #0x08	; 8
      0084E3 08                     883 	.db #0x08	; 8
      0084E4 08                     884 	.db #0x08	; 8
      0084E5 08                     885 	.db #0x08	; 8
      0084E6 08                     886 	.db #0x08	; 8
      0084E7 00                     887 	.db #0x00	; 0
      0084E8 60                     888 	.db #0x60	; 96
      0084E9 60                     889 	.db #0x60	; 96
      0084EA 00                     890 	.db #0x00	; 0
      0084EB 00                     891 	.db #0x00	; 0
      0084EC 20                     892 	.db #0x20	; 32
      0084ED 10                     893 	.db #0x10	; 16
      0084EE 08                     894 	.db #0x08	; 8
      0084EF 04                     895 	.db #0x04	; 4
      0084F0 02                     896 	.db #0x02	; 2
      0084F1 3E                     897 	.db #0x3E	; 62
      0084F2 51                     898 	.db #0x51	; 81	'Q'
      0084F3 49                     899 	.db #0x49	; 73	'I'
      0084F4 45                     900 	.db #0x45	; 69	'E'
      0084F5 3E                     901 	.db #0x3E	; 62
      0084F6 00                     902 	.db #0x00	; 0
      0084F7 42                     903 	.db #0x42	; 66	'B'
      0084F8 7F                     904 	.db #0x7F	; 127
      0084F9 40                     905 	.db #0x40	; 64
      0084FA 00                     906 	.db #0x00	; 0
      0084FB 42                     907 	.db #0x42	; 66	'B'
      0084FC 61                     908 	.db #0x61	; 97	'a'
      0084FD 51                     909 	.db #0x51	; 81	'Q'
      0084FE 49                     910 	.db #0x49	; 73	'I'
      0084FF 46                     911 	.db #0x46	; 70	'F'
      008500 21                     912 	.db #0x21	; 33
      008501 41                     913 	.db #0x41	; 65	'A'
      008502 45                     914 	.db #0x45	; 69	'E'
      008503 4B                     915 	.db #0x4B	; 75	'K'
      008504 31                     916 	.db #0x31	; 49	'1'
      008505 18                     917 	.db #0x18	; 24
      008506 14                     918 	.db #0x14	; 20
      008507 12                     919 	.db #0x12	; 18
      008508 7F                     920 	.db #0x7F	; 127
      008509 10                     921 	.db #0x10	; 16
      00850A 27                     922 	.db #0x27	; 39
      00850B 45                     923 	.db #0x45	; 69	'E'
      00850C 45                     924 	.db #0x45	; 69	'E'
      00850D 45                     925 	.db #0x45	; 69	'E'
      00850E 39                     926 	.db #0x39	; 57	'9'
      00850F 3C                     927 	.db #0x3C	; 60
      008510 4A                     928 	.db #0x4A	; 74	'J'
      008511 49                     929 	.db #0x49	; 73	'I'
      008512 49                     930 	.db #0x49	; 73	'I'
      008513 30                     931 	.db #0x30	; 48	'0'
      008514 01                     932 	.db #0x01	; 1
      008515 71                     933 	.db #0x71	; 113	'q'
      008516 09                     934 	.db #0x09	; 9
      008517 05                     935 	.db #0x05	; 5
      008518 03                     936 	.db #0x03	; 3
      008519 36                     937 	.db #0x36	; 54	'6'
      00851A 49                     938 	.db #0x49	; 73	'I'
      00851B 49                     939 	.db #0x49	; 73	'I'
      00851C 49                     940 	.db #0x49	; 73	'I'
      00851D 36                     941 	.db #0x36	; 54	'6'
      00851E 06                     942 	.db #0x06	; 6
      00851F 49                     943 	.db #0x49	; 73	'I'
      008520 49                     944 	.db #0x49	; 73	'I'
      008521 29                     945 	.db #0x29	; 41
      008522 1E                     946 	.db #0x1E	; 30
      008523 00                     947 	.db #0x00	; 0
      008524 36                     948 	.db #0x36	; 54	'6'
      008525 36                     949 	.db #0x36	; 54	'6'
      008526 00                     950 	.db #0x00	; 0
      008527 00                     951 	.db #0x00	; 0
      008528 00                     952 	.db #0x00	; 0
      008529 56                     953 	.db #0x56	; 86	'V'
      00852A 36                     954 	.db #0x36	; 54	'6'
      00852B 00                     955 	.db #0x00	; 0
      00852C 00                     956 	.db #0x00	; 0
      00852D 08                     957 	.db #0x08	; 8
      00852E 14                     958 	.db #0x14	; 20
      00852F 22                     959 	.db #0x22	; 34
      008530 41                     960 	.db #0x41	; 65	'A'
      008531 00                     961 	.db #0x00	; 0
      008532 14                     962 	.db #0x14	; 20
      008533 14                     963 	.db #0x14	; 20
      008534 14                     964 	.db #0x14	; 20
      008535 14                     965 	.db #0x14	; 20
      008536 14                     966 	.db #0x14	; 20
      008537 00                     967 	.db #0x00	; 0
      008538 41                     968 	.db #0x41	; 65	'A'
      008539 22                     969 	.db #0x22	; 34
      00853A 14                     970 	.db #0x14	; 20
      00853B 08                     971 	.db #0x08	; 8
      00853C 02                     972 	.db #0x02	; 2
      00853D 01                     973 	.db #0x01	; 1
      00853E 51                     974 	.db #0x51	; 81	'Q'
      00853F 09                     975 	.db #0x09	; 9
      008540 06                     976 	.db #0x06	; 6
      008541 32                     977 	.db #0x32	; 50	'2'
      008542 49                     978 	.db #0x49	; 73	'I'
      008543 59                     979 	.db #0x59	; 89	'Y'
      008544 51                     980 	.db #0x51	; 81	'Q'
      008545 3E                     981 	.db #0x3E	; 62
      008546 7C                     982 	.db #0x7C	; 124
      008547 12                     983 	.db #0x12	; 18
      008548 11                     984 	.db #0x11	; 17
      008549 12                     985 	.db #0x12	; 18
      00854A 7C                     986 	.db #0x7C	; 124
      00854B 7F                     987 	.db #0x7F	; 127
      00854C 49                     988 	.db #0x49	; 73	'I'
      00854D 49                     989 	.db #0x49	; 73	'I'
      00854E 49                     990 	.db #0x49	; 73	'I'
      00854F 36                     991 	.db #0x36	; 54	'6'
      008550 3E                     992 	.db #0x3E	; 62
      008551 41                     993 	.db #0x41	; 65	'A'
      008552 41                     994 	.db #0x41	; 65	'A'
      008553 41                     995 	.db #0x41	; 65	'A'
      008554 22                     996 	.db #0x22	; 34
      008555 7F                     997 	.db #0x7F	; 127
      008556 41                     998 	.db #0x41	; 65	'A'
      008557 41                     999 	.db #0x41	; 65	'A'
      008558 22                    1000 	.db #0x22	; 34
      008559 1C                    1001 	.db #0x1C	; 28
      00855A 7F                    1002 	.db #0x7F	; 127
      00855B 49                    1003 	.db #0x49	; 73	'I'
      00855C 49                    1004 	.db #0x49	; 73	'I'
      00855D 49                    1005 	.db #0x49	; 73	'I'
      00855E 41                    1006 	.db #0x41	; 65	'A'
      00855F 7F                    1007 	.db #0x7F	; 127
      008560 09                    1008 	.db #0x09	; 9
      008561 09                    1009 	.db #0x09	; 9
      008562 09                    1010 	.db #0x09	; 9
      008563 01                    1011 	.db #0x01	; 1
      008564 3E                    1012 	.db #0x3E	; 62
      008565 41                    1013 	.db #0x41	; 65	'A'
      008566 49                    1014 	.db #0x49	; 73	'I'
      008567 49                    1015 	.db #0x49	; 73	'I'
      008568 7A                    1016 	.db #0x7A	; 122	'z'
      008569 7F                    1017 	.db #0x7F	; 127
      00856A 08                    1018 	.db #0x08	; 8
      00856B 08                    1019 	.db #0x08	; 8
      00856C 08                    1020 	.db #0x08	; 8
      00856D 7F                    1021 	.db #0x7F	; 127
      00856E 00                    1022 	.db #0x00	; 0
      00856F 41                    1023 	.db #0x41	; 65	'A'
      008570 7F                    1024 	.db #0x7F	; 127
      008571 41                    1025 	.db #0x41	; 65	'A'
      008572 00                    1026 	.db #0x00	; 0
      008573 20                    1027 	.db #0x20	; 32
      008574 40                    1028 	.db #0x40	; 64
      008575 41                    1029 	.db #0x41	; 65	'A'
      008576 3F                    1030 	.db #0x3F	; 63
      008577 01                    1031 	.db #0x01	; 1
      008578 7F                    1032 	.db #0x7F	; 127
      008579 08                    1033 	.db #0x08	; 8
      00857A 14                    1034 	.db #0x14	; 20
      00857B 22                    1035 	.db #0x22	; 34
      00857C 41                    1036 	.db #0x41	; 65	'A'
      00857D 7F                    1037 	.db #0x7F	; 127
      00857E 40                    1038 	.db #0x40	; 64
      00857F 40                    1039 	.db #0x40	; 64
      008580 40                    1040 	.db #0x40	; 64
      008581 40                    1041 	.db #0x40	; 64
      008582 7F                    1042 	.db #0x7F	; 127
      008583 02                    1043 	.db #0x02	; 2
      008584 0C                    1044 	.db #0x0C	; 12
      008585 02                    1045 	.db #0x02	; 2
      008586 7F                    1046 	.db #0x7F	; 127
      008587 7F                    1047 	.db #0x7F	; 127
      008588 04                    1048 	.db #0x04	; 4
      008589 08                    1049 	.db #0x08	; 8
      00858A 10                    1050 	.db #0x10	; 16
      00858B 7F                    1051 	.db #0x7F	; 127
      00858C 3E                    1052 	.db #0x3E	; 62
      00858D 41                    1053 	.db #0x41	; 65	'A'
      00858E 41                    1054 	.db #0x41	; 65	'A'
      00858F 41                    1055 	.db #0x41	; 65	'A'
      008590 3E                    1056 	.db #0x3E	; 62
      008591 7F                    1057 	.db #0x7F	; 127
      008592 09                    1058 	.db #0x09	; 9
      008593 09                    1059 	.db #0x09	; 9
      008594 09                    1060 	.db #0x09	; 9
      008595 06                    1061 	.db #0x06	; 6
      008596 3E                    1062 	.db #0x3E	; 62
      008597 41                    1063 	.db #0x41	; 65	'A'
      008598 51                    1064 	.db #0x51	; 81	'Q'
      008599 21                    1065 	.db #0x21	; 33
      00859A 5E                    1066 	.db #0x5E	; 94
      00859B 7F                    1067 	.db #0x7F	; 127
      00859C 09                    1068 	.db #0x09	; 9
      00859D 19                    1069 	.db #0x19	; 25
      00859E 29                    1070 	.db #0x29	; 41
      00859F 46                    1071 	.db #0x46	; 70	'F'
      0085A0 46                    1072 	.db #0x46	; 70	'F'
      0085A1 49                    1073 	.db #0x49	; 73	'I'
      0085A2 49                    1074 	.db #0x49	; 73	'I'
      0085A3 49                    1075 	.db #0x49	; 73	'I'
      0085A4 31                    1076 	.db #0x31	; 49	'1'
      0085A5 01                    1077 	.db #0x01	; 1
      0085A6 01                    1078 	.db #0x01	; 1
      0085A7 7F                    1079 	.db #0x7F	; 127
      0085A8 01                    1080 	.db #0x01	; 1
      0085A9 01                    1081 	.db #0x01	; 1
      0085AA 3F                    1082 	.db #0x3F	; 63
      0085AB 40                    1083 	.db #0x40	; 64
      0085AC 40                    1084 	.db #0x40	; 64
      0085AD 40                    1085 	.db #0x40	; 64
      0085AE 3F                    1086 	.db #0x3F	; 63
      0085AF 1F                    1087 	.db #0x1F	; 31
      0085B0 20                    1088 	.db #0x20	; 32
      0085B1 40                    1089 	.db #0x40	; 64
      0085B2 20                    1090 	.db #0x20	; 32
      0085B3 1F                    1091 	.db #0x1F	; 31
      0085B4 3F                    1092 	.db #0x3F	; 63
      0085B5 40                    1093 	.db #0x40	; 64
      0085B6 38                    1094 	.db #0x38	; 56	'8'
      0085B7 40                    1095 	.db #0x40	; 64
      0085B8 3F                    1096 	.db #0x3F	; 63
      0085B9 63                    1097 	.db #0x63	; 99	'c'
      0085BA 14                    1098 	.db #0x14	; 20
      0085BB 08                    1099 	.db #0x08	; 8
      0085BC 14                    1100 	.db #0x14	; 20
      0085BD 63                    1101 	.db #0x63	; 99	'c'
      0085BE 07                    1102 	.db #0x07	; 7
      0085BF 08                    1103 	.db #0x08	; 8
      0085C0 70                    1104 	.db #0x70	; 112	'p'
      0085C1 08                    1105 	.db #0x08	; 8
      0085C2 07                    1106 	.db #0x07	; 7
      0085C3 61                    1107 	.db #0x61	; 97	'a'
      0085C4 51                    1108 	.db #0x51	; 81	'Q'
      0085C5 49                    1109 	.db #0x49	; 73	'I'
      0085C6 45                    1110 	.db #0x45	; 69	'E'
      0085C7 43                    1111 	.db #0x43	; 67	'C'
      0085C8 00                    1112 	.db #0x00	; 0
      0085C9 7F                    1113 	.db #0x7F	; 127
      0085CA 41                    1114 	.db #0x41	; 65	'A'
      0085CB 41                    1115 	.db #0x41	; 65	'A'
      0085CC 00                    1116 	.db #0x00	; 0
      0085CD 02                    1117 	.db #0x02	; 2
      0085CE 04                    1118 	.db #0x04	; 4
      0085CF 08                    1119 	.db #0x08	; 8
      0085D0 10                    1120 	.db #0x10	; 16
      0085D1 20                    1121 	.db #0x20	; 32
      0085D2 00                    1122 	.db #0x00	; 0
      0085D3 41                    1123 	.db #0x41	; 65	'A'
      0085D4 41                    1124 	.db #0x41	; 65	'A'
      0085D5 7F                    1125 	.db #0x7F	; 127
      0085D6 00                    1126 	.db #0x00	; 0
      0085D7 04                    1127 	.db #0x04	; 4
      0085D8 02                    1128 	.db #0x02	; 2
      0085D9 01                    1129 	.db #0x01	; 1
      0085DA 02                    1130 	.db #0x02	; 2
      0085DB 04                    1131 	.db #0x04	; 4
      0085DC 40                    1132 	.db #0x40	; 64
      0085DD 40                    1133 	.db #0x40	; 64
      0085DE 40                    1134 	.db #0x40	; 64
      0085DF 40                    1135 	.db #0x40	; 64
      0085E0 40                    1136 	.db #0x40	; 64
      0085E1 00                    1137 	.db #0x00	; 0
      0085E2 60                    1138 	.db #0x60	; 96
      0085E3 60                    1139 	.db #0x60	; 96
      0085E4 00                    1140 	.db #0x00	; 0
      0085E5 00                    1141 	.db #0x00	; 0
      0085E6                       1142 ___str_0:
      0085E6 20                    1143 	.ascii " "
      0085E7 00                    1144 	.db 0x00
                                   1145 	.area INITIALIZER
      0097D3                       1146 __xinit__Steps:
      0097D3 00                    1147 	.db #0x00	; 0
      0097D4                       1148 __xinit__Threshold:
      0097D4 40 A0 00 00           1149 	.byte #0x40,#0xA0,#0x00,#0x00	;  5.000000e+00
      0097D8                       1150 __xinit__Mode:
      0097D8 00                    1151 	.db #0x00	; 0
                                   1152 	.area CABS (ABS)
