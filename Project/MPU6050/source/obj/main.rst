                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.5.0 #9253 (Apr  3 2018) (Linux)
                                      4 ; This file was generated Fri Mar 21 15:18:47 2025
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
                                     15 	.globl _fabsf
                                     16 	.globl _uart1_string
                                     17 	.globl _uart1_number
                                     18 	.globl _uart_init
                                     19 	.globl _I2C_write
                                     20 	.globl _I2C_address
                                     21 	.globl _I2C_stop
                                     22 	.globl _I2C_start
                                     23 	.globl _I2C_init
                                     24 	.globl _Timer4DelayMs
                                     25 	.globl _Timer4Config
                                     26 	.globl _Mode
                                     27 	.globl _Threshold
                                     28 	.globl _Steps
                                     29 	.globl _a
                                     30 	.globl _SumValue
                                     31 	.globl _LastSteps
                                     32 	.globl _Distance
                                     33 	.globl _Value
                                     34 	.globl _LastValue
                                     35 	.globl _CurrentValue
                                     36 	.globl _AccZMSB
                                     37 	.globl _AccZLSB
                                     38 	.globl _AccYMSB
                                     39 	.globl _AccYLSB
                                     40 	.globl _AccXMSB
                                     41 	.globl _AccXLSB
                                     42 	.globl _AccZ
                                     43 	.globl _AccY
                                     44 	.globl _AccX
                                     45 	.globl _initMPU6050
                                     46 	.globl _getMPU6050
                                     47 ;--------------------------------------------------------
                                     48 ; ram data
                                     49 ;--------------------------------------------------------
                                     50 	.area DATA
      000001                         51 _AccX::
      000001                         52 	.ds 4
      000005                         53 _AccY::
      000005                         54 	.ds 4
      000009                         55 _AccZ::
      000009                         56 	.ds 4
      00000D                         57 _AccXLSB::
      00000D                         58 	.ds 2
      00000F                         59 _AccXMSB::
      00000F                         60 	.ds 2
      000011                         61 _AccYLSB::
      000011                         62 	.ds 2
      000013                         63 _AccYMSB::
      000013                         64 	.ds 2
      000015                         65 _AccZLSB::
      000015                         66 	.ds 2
      000017                         67 _AccZMSB::
      000017                         68 	.ds 2
      000019                         69 _CurrentValue::
      000019                         70 	.ds 4
      00001D                         71 _LastValue::
      00001D                         72 	.ds 4
      000021                         73 _Value::
      000021                         74 	.ds 4
      000025                         75 _Distance::
      000025                         76 	.ds 4
      000029                         77 _LastSteps::
      000029                         78 	.ds 1
      00002A                         79 _SumValue::
      00002A                         80 	.ds 4
      00002E                         81 _a::
      00002E                         82 	.ds 1
                                     83 ;--------------------------------------------------------
                                     84 ; ram data
                                     85 ;--------------------------------------------------------
                                     86 	.area INITIALIZED
      00002F                         87 _Steps::
      00002F                         88 	.ds 1
      000030                         89 _Threshold::
      000030                         90 	.ds 4
      000034                         91 _Mode::
      000034                         92 	.ds 1
                                     93 ;--------------------------------------------------------
                                     94 ; Stack segment in internal ram 
                                     95 ;--------------------------------------------------------
                                     96 	.area	SSEG
      000035                         97 __start__stack:
      000035                         98 	.ds	1
                                     99 
                                    100 ;--------------------------------------------------------
                                    101 ; absolute external ram data
                                    102 ;--------------------------------------------------------
                                    103 	.area DABS (ABS)
                                    104 ;--------------------------------------------------------
                                    105 ; interrupt vector 
                                    106 ;--------------------------------------------------------
                                    107 	.area HOME
      008000                        108 __interrupt_vect:
      008000 82 00 80 83            109 	int s_GSINIT ;reset
      008004 82 00 00 00            110 	int 0x0000 ;trap
      008008 82 00 00 00            111 	int 0x0000 ;int0
      00800C 82 00 00 00            112 	int 0x0000 ;int1
      008010 82 00 00 00            113 	int 0x0000 ;int2
      008014 82 00 00 00            114 	int 0x0000 ;int3
      008018 82 00 00 00            115 	int 0x0000 ;int4
      00801C 82 00 00 00            116 	int 0x0000 ;int5
      008020 82 00 00 00            117 	int 0x0000 ;int6
      008024 82 00 00 00            118 	int 0x0000 ;int7
      008028 82 00 00 00            119 	int 0x0000 ;int8
      00802C 82 00 00 00            120 	int 0x0000 ;int9
      008030 82 00 00 00            121 	int 0x0000 ;int10
      008034 82 00 00 00            122 	int 0x0000 ;int11
      008038 82 00 00 00            123 	int 0x0000 ;int12
      00803C 82 00 00 00            124 	int 0x0000 ;int13
      008040 82 00 00 00            125 	int 0x0000 ;int14
      008044 82 00 00 00            126 	int 0x0000 ;int15
      008048 82 00 00 00            127 	int 0x0000 ;int16
      00804C 82 00 00 00            128 	int 0x0000 ;int17
      008050 82 00 00 00            129 	int 0x0000 ;int18
      008054 82 00 00 00            130 	int 0x0000 ;int19
      008058 82 00 00 00            131 	int 0x0000 ;int20
      00805C 82 00 00 00            132 	int 0x0000 ;int21
      008060 82 00 00 00            133 	int 0x0000 ;int22
      008064 82 00 00 00            134 	int 0x0000 ;int23
      008068 82 00 00 00            135 	int 0x0000 ;int24
      00806C 82 00 00 00            136 	int 0x0000 ;int25
      008070 82 00 00 00            137 	int 0x0000 ;int26
      008074 82 00 00 00            138 	int 0x0000 ;int27
      008078 82 00 00 00            139 	int 0x0000 ;int28
      00807C 82 00 00 00            140 	int 0x0000 ;int29
                                    141 ;--------------------------------------------------------
                                    142 ; global & static initialisations
                                    143 ;--------------------------------------------------------
                                    144 	.area HOME
                                    145 	.area GSINIT
                                    146 	.area GSFINAL
                                    147 	.area GSINIT
      008083                        148 __sdcc_gs_init_startup:
      008083                        149 __sdcc_init_data:
                                    150 ; stm8_genXINIT() start
      008083 AE 00 2E         [ 2]  151 	ldw x, #l_DATA
      008086 27 07            [ 1]  152 	jreq	00002$
      008088                        153 00001$:
      008088 72 4F 00 00      [ 1]  154 	clr (s_DATA - 1, x)
      00808C 5A               [ 2]  155 	decw x
      00808D 26 F9            [ 1]  156 	jrne	00001$
      00808F                        157 00002$:
      00808F AE 00 06         [ 2]  158 	ldw	x, #l_INITIALIZER
      008092 27 09            [ 1]  159 	jreq	00004$
      008094                        160 00003$:
      008094 D6 93 EA         [ 1]  161 	ld	a, (s_INITIALIZER - 1, x)
      008097 D7 00 2E         [ 1]  162 	ld	(s_INITIALIZED - 1, x), a
      00809A 5A               [ 2]  163 	decw	x
      00809B 26 F7            [ 1]  164 	jrne	00003$
      00809D                        165 00004$:
                                    166 ; stm8_genXINIT() end
                                    167 	.area GSFINAL
      00809D CC 80 80         [ 2]  168 	jp	__sdcc_program_startup
                                    169 ;--------------------------------------------------------
                                    170 ; Home
                                    171 ;--------------------------------------------------------
                                    172 	.area HOME
                                    173 	.area HOME
      008080                        174 __sdcc_program_startup:
      008080 CC 80 A0         [ 2]  175 	jp	_main
                                    176 ;	return from main will return to caller
                                    177 ;--------------------------------------------------------
                                    178 ; code
                                    179 ;--------------------------------------------------------
                                    180 	.area CODE
                                    181 ;	main.c: 118: void main(void)
                                    182 ;	-----------------------------------------
                                    183 ;	 function main
                                    184 ;	-----------------------------------------
      0080A0                        185 _main:
      0080A0 89               [ 2]  186 	pushw	x
                                    187 ;	main.c: 121: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      0080A1 AE 50 C6         [ 2]  188 	ldw	x, #0x50c6
      0080A4 F6               [ 1]  189 	ld	a, (x)
      0080A5 A4 E7            [ 1]  190 	and	a, #0xe7
      0080A7 F7               [ 1]  191 	ld	(x), a
                                    192 ;	main.c: 122: CLK->CKDIVR |= (uint8_t)0x00;
      0080A8 AE 50 C6         [ 2]  193 	ldw	x, #0x50c6
      0080AB F6               [ 1]  194 	ld	a, (x)
      0080AC AE 50 C6         [ 2]  195 	ldw	x, #0x50c6
      0080AF F7               [ 1]  196 	ld	(x), a
                                    197 ;	main.c: 125: GPIOB->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
      0080B0 35 00 50 05      [ 1]  198 	mov	0x5005+0, #0x00
                                    199 ;	main.c: 126: GPIOB->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
      0080B4 35 00 50 07      [ 1]  200 	mov	0x5007+0, #0x00
                                    201 ;	main.c: 127: GPIOB->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
      0080B8 35 00 50 08      [ 1]  202 	mov	0x5008+0, #0x00
                                    203 ;	main.c: 128: GPIOB->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
      0080BC 35 00 50 09      [ 1]  204 	mov	0x5009+0, #0x00
                                    205 ;	main.c: 130: GPIOA->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
      0080C0 35 00 50 00      [ 1]  206 	mov	0x5000+0, #0x00
                                    207 ;	main.c: 131: GPIOA->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
      0080C4 35 00 50 02      [ 1]  208 	mov	0x5002+0, #0x00
                                    209 ;	main.c: 132: GPIOA->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
      0080C8 35 00 50 03      [ 1]  210 	mov	0x5003+0, #0x00
                                    211 ;	main.c: 133: GPIOA->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
      0080CC 35 00 50 04      [ 1]  212 	mov	0x5004+0, #0x00
                                    213 ;	main.c: 135: GPIOC->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
      0080D0 35 00 50 0A      [ 1]  214 	mov	0x500a+0, #0x00
                                    215 ;	main.c: 136: GPIOC->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
      0080D4 35 00 50 0C      [ 1]  216 	mov	0x500c+0, #0x00
                                    217 ;	main.c: 137: GPIOC->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
      0080D8 35 00 50 0D      [ 1]  218 	mov	0x500d+0, #0x00
                                    219 ;	main.c: 138: GPIOC->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
      0080DC 35 00 50 0E      [ 1]  220 	mov	0x500e+0, #0x00
                                    221 ;	main.c: 141: GPIOB->DDR |= (uint8_t)(1 << 4);
      0080E0 AE 50 07         [ 2]  222 	ldw	x, #0x5007
      0080E3 F6               [ 1]  223 	ld	a, (x)
      0080E4 AA 10            [ 1]  224 	or	a, #0x10
      0080E6 F7               [ 1]  225 	ld	(x), a
                                    226 ;	main.c: 142: GPIOB->ODR |= (uint8_t)(1 << 4);
      0080E7 AE 50 05         [ 2]  227 	ldw	x, #0x5005
      0080EA F6               [ 1]  228 	ld	a, (x)
      0080EB AA 10            [ 1]  229 	or	a, #0x10
      0080ED F7               [ 1]  230 	ld	(x), a
                                    231 ;	main.c: 143: GPIOB->CR1 &= ~(uint8_t)(1 << 4); /*OPEN DRAIN*/
      0080EE AE 50 08         [ 2]  232 	ldw	x, #0x5008
      0080F1 F6               [ 1]  233 	ld	a, (x)
      0080F2 A4 EF            [ 1]  234 	and	a, #0xef
      0080F4 F7               [ 1]  235 	ld	(x), a
                                    236 ;	main.c: 144: GPIOB->CR2 &= ~(uint8_t)(1 << 4); /*Output Speed Up to 2Mhz*/
      0080F5 AE 50 09         [ 2]  237 	ldw	x, #0x5009
      0080F8 F6               [ 1]  238 	ld	a, (x)
      0080F9 A4 EF            [ 1]  239 	and	a, #0xef
      0080FB F7               [ 1]  240 	ld	(x), a
                                    241 ;	main.c: 147: GPIOB->DDR |= (uint8_t)(1 << 5);
      0080FC AE 50 07         [ 2]  242 	ldw	x, #0x5007
      0080FF F6               [ 1]  243 	ld	a, (x)
      008100 AA 20            [ 1]  244 	or	a, #0x20
      008102 F7               [ 1]  245 	ld	(x), a
                                    246 ;	main.c: 148: GPIOB->ODR |= (uint8_t)(1 << 5);
      008103 AE 50 05         [ 2]  247 	ldw	x, #0x5005
      008106 F6               [ 1]  248 	ld	a, (x)
      008107 AA 20            [ 1]  249 	or	a, #0x20
      008109 F7               [ 1]  250 	ld	(x), a
                                    251 ;	main.c: 149: GPIOB->CR1 &= ~(uint8_t)(1 << 5); /*OPEN DRAIN*/
      00810A AE 50 08         [ 2]  252 	ldw	x, #0x5008
      00810D F6               [ 1]  253 	ld	a, (x)
      00810E A4 DF            [ 1]  254 	and	a, #0xdf
      008110 F7               [ 1]  255 	ld	(x), a
                                    256 ;	main.c: 150: GPIOB->CR2 &= ~(uint8_t)(1 << 5); /*Output Speed Up to 2Mhz*/
      008111 AE 50 09         [ 2]  257 	ldw	x, #0x5009
      008114 F6               [ 1]  258 	ld	a, (x)
      008115 A4 DF            [ 1]  259 	and	a, #0xdf
      008117 F7               [ 1]  260 	ld	(x), a
                                    261 ;	main.c: 153: GPIOA->DDR &= ~(uint8_t)(1 << 3);
      008118 AE 50 02         [ 2]  262 	ldw	x, #0x5002
      00811B F6               [ 1]  263 	ld	a, (x)
      00811C A4 F7            [ 1]  264 	and	a, #0xf7
      00811E F7               [ 1]  265 	ld	(x), a
                                    266 ;	main.c: 154: GPIOA->IDR |= (uint8_t)(1 << 3);
      00811F AE 50 01         [ 2]  267 	ldw	x, #0x5001
      008122 F6               [ 1]  268 	ld	a, (x)
      008123 AA 08            [ 1]  269 	or	a, #0x08
      008125 F7               [ 1]  270 	ld	(x), a
                                    271 ;	main.c: 155: GPIOA->CR1 |= (uint8_t)(1 << 3);  /*PULL UP*/
      008126 AE 50 03         [ 2]  272 	ldw	x, #0x5003
      008129 F6               [ 1]  273 	ld	a, (x)
      00812A AA 08            [ 1]  274 	or	a, #0x08
      00812C F7               [ 1]  275 	ld	(x), a
                                    276 ;	main.c: 156: GPIOA->CR2 &= ~(uint8_t)(1 << 3); /*External interrupt disabled*/
      00812D AE 50 04         [ 2]  277 	ldw	x, #0x5004
      008130 F6               [ 1]  278 	ld	a, (x)
      008131 A4 F7            [ 1]  279 	and	a, #0xf7
      008133 F7               [ 1]  280 	ld	(x), a
                                    281 ;	main.c: 159: GPIOC->DDR &= ~(uint8_t)(1 << 3);
      008134 AE 50 0C         [ 2]  282 	ldw	x, #0x500c
      008137 F6               [ 1]  283 	ld	a, (x)
      008138 A4 F7            [ 1]  284 	and	a, #0xf7
      00813A F7               [ 1]  285 	ld	(x), a
                                    286 ;	main.c: 160: GPIOC->IDR |= (uint8_t)(1 << 3);
      00813B AE 50 0B         [ 2]  287 	ldw	x, #0x500b
      00813E F6               [ 1]  288 	ld	a, (x)
      00813F AA 08            [ 1]  289 	or	a, #0x08
      008141 F7               [ 1]  290 	ld	(x), a
                                    291 ;	main.c: 161: GPIOC->CR1 |= (uint8_t)(1 << 3);  /*PULL UP*/
      008142 AE 50 0D         [ 2]  292 	ldw	x, #0x500d
      008145 F6               [ 1]  293 	ld	a, (x)
      008146 AA 08            [ 1]  294 	or	a, #0x08
      008148 F7               [ 1]  295 	ld	(x), a
                                    296 ;	main.c: 162: GPIOC->CR2 &= ~(uint8_t)(1 << 3); /*External interrupt disabled*/
      008149 AE 50 0E         [ 2]  297 	ldw	x, #0x500e
      00814C F6               [ 1]  298 	ld	a, (x)
      00814D A4 F7            [ 1]  299 	and	a, #0xf7
      00814F F7               [ 1]  300 	ld	(x), a
                                    301 ;	main.c: 165: GPIOC->DDR |= (uint8_t)(1 << 4);
      008150 AE 50 0C         [ 2]  302 	ldw	x, #0x500c
      008153 F6               [ 1]  303 	ld	a, (x)
      008154 AA 10            [ 1]  304 	or	a, #0x10
      008156 F7               [ 1]  305 	ld	(x), a
                                    306 ;	main.c: 166: GPIOC->ODR &= ~(uint8_t)(1 << 4);
      008157 AE 50 0A         [ 2]  307 	ldw	x, #0x500a
      00815A F6               [ 1]  308 	ld	a, (x)
      00815B A4 EF            [ 1]  309 	and	a, #0xef
      00815D F7               [ 1]  310 	ld	(x), a
                                    311 ;	main.c: 167: GPIOC->CR1 |= (uint8_t)(1 << 4);  /*PULL PUSH*/
      00815E AE 50 0D         [ 2]  312 	ldw	x, #0x500d
      008161 F6               [ 1]  313 	ld	a, (x)
      008162 AA 10            [ 1]  314 	or	a, #0x10
      008164 F7               [ 1]  315 	ld	(x), a
                                    316 ;	main.c: 168: GPIOC->CR2 &= ~(uint8_t)(1 << 4); /*Output Speed Up to 2Mhz*/
      008165 AE 50 0E         [ 2]  317 	ldw	x, #0x500e
      008168 F6               [ 1]  318 	ld	a, (x)
      008169 A4 EF            [ 1]  319 	and	a, #0xef
      00816B F7               [ 1]  320 	ld	(x), a
                                    321 ;	main.c: 170: uart_init();    //baudrate 57600
      00816C CD 86 52         [ 4]  322 	call	_uart_init
                                    323 ;	main.c: 171: Timer4Config();
      00816F CD 85 97         [ 4]  324 	call	_Timer4Config
                                    325 ;	main.c: 172: I2C_init();
      008172 CD 85 BE         [ 4]  326 	call	_I2C_init
                                    327 ;	main.c: 173: Timer4DelayMs(100);
      008175 4B 64            [ 1]  328 	push	#0x64
      008177 4B 00            [ 1]  329 	push	#0x00
      008179 CD 85 A4         [ 4]  330 	call	_Timer4DelayMs
      00817C 85               [ 2]  331 	popw	x
                                    332 ;	main.c: 182: initMPU6050();  //init MPU6050
      00817D CD 82 43         [ 4]  333 	call	_initMPU6050
                                    334 ;	main.c: 183: Timer4DelayMs(200);
      008180 4B C8            [ 1]  335 	push	#0xc8
      008182 4B 00            [ 1]  336 	push	#0x00
      008184 CD 85 A4         [ 4]  337 	call	_Timer4DelayMs
      008187 85               [ 2]  338 	popw	x
                                    339 ;	main.c: 185: while (1)
      008188                        340 00102$:
                                    341 ;	main.c: 188: getMPU6050();
      008188 CD 82 C3         [ 4]  342 	call	_getMPU6050
                                    343 ;	main.c: 189: AccX *= 100.0;
      00818B CE 00 03         [ 2]  344 	ldw	x, _AccX+2
      00818E 89               [ 2]  345 	pushw	x
      00818F CE 00 01         [ 2]  346 	ldw	x, _AccX+0
      008192 89               [ 2]  347 	pushw	x
      008193 5F               [ 1]  348 	clrw	x
      008194 89               [ 2]  349 	pushw	x
      008195 4B C8            [ 1]  350 	push	#0xc8
      008197 4B 42            [ 1]  351 	push	#0x42
      008199 CD 87 A0         [ 4]  352 	call	___fsmul
      00819C 5B 08            [ 2]  353 	addw	sp, #8
      00819E CF 00 03         [ 2]  354 	ldw	_AccX+2, x
      0081A1 90 CF 00 01      [ 2]  355 	ldw	_AccX+0, y
                                    356 ;	main.c: 190: AccY *= 100.0;
      0081A5 CE 00 07         [ 2]  357 	ldw	x, _AccY+2
      0081A8 89               [ 2]  358 	pushw	x
      0081A9 CE 00 05         [ 2]  359 	ldw	x, _AccY+0
      0081AC 89               [ 2]  360 	pushw	x
      0081AD 5F               [ 1]  361 	clrw	x
      0081AE 89               [ 2]  362 	pushw	x
      0081AF 4B C8            [ 1]  363 	push	#0xc8
      0081B1 4B 42            [ 1]  364 	push	#0x42
      0081B3 CD 87 A0         [ 4]  365 	call	___fsmul
      0081B6 5B 08            [ 2]  366 	addw	sp, #8
      0081B8 CF 00 07         [ 2]  367 	ldw	_AccY+2, x
      0081BB 90 CF 00 05      [ 2]  368 	ldw	_AccY+0, y
                                    369 ;	main.c: 191: AccX = fabsf(AccX);
      0081BF CE 00 03         [ 2]  370 	ldw	x, _AccX+2
      0081C2 89               [ 2]  371 	pushw	x
      0081C3 CE 00 01         [ 2]  372 	ldw	x, _AccX+0
      0081C6 89               [ 2]  373 	pushw	x
      0081C7 CD 8D 64         [ 4]  374 	call	_fabsf
      0081CA 5B 04            [ 2]  375 	addw	sp, #4
      0081CC CF 00 03         [ 2]  376 	ldw	_AccX+2, x
      0081CF 90 CF 00 01      [ 2]  377 	ldw	_AccX+0, y
                                    378 ;	main.c: 192: AccY = fabsf(AccY);
      0081D3 CE 00 07         [ 2]  379 	ldw	x, _AccY+2
      0081D6 89               [ 2]  380 	pushw	x
      0081D7 CE 00 05         [ 2]  381 	ldw	x, _AccY+0
      0081DA 89               [ 2]  382 	pushw	x
      0081DB CD 8D 64         [ 4]  383 	call	_fabsf
      0081DE 5B 04            [ 2]  384 	addw	sp, #4
      0081E0 CF 00 07         [ 2]  385 	ldw	_AccY+2, x
      0081E3 90 CF 00 05      [ 2]  386 	ldw	_AccY+0, y
                                    387 ;	main.c: 194: uart1_string(" Acceleration X [g]*100 =  ");
      0081E7 AE 85 37         [ 2]  388 	ldw	x, #___str_0+0
      0081EA 89               [ 2]  389 	pushw	x
      0081EB CD 87 5A         [ 4]  390 	call	_uart1_string
      0081EE 85               [ 2]  391 	popw	x
                                    392 ;	main.c: 195: uart1_number((int)AccX);
      0081EF CE 00 03         [ 2]  393 	ldw	x, _AccX+2
      0081F2 89               [ 2]  394 	pushw	x
      0081F3 CE 00 01         [ 2]  395 	ldw	x, _AccX+0
      0081F6 89               [ 2]  396 	pushw	x
      0081F7 CD 8D 9A         [ 4]  397 	call	___fs2sint
      0081FA 5B 04            [ 2]  398 	addw	sp, #4
      0081FC 89               [ 2]  399 	pushw	x
      0081FD CD 86 BA         [ 4]  400 	call	_uart1_number
      008200 85               [ 2]  401 	popw	x
                                    402 ;	main.c: 196: uart1_string(" | ");
      008201 AE 85 53         [ 2]  403 	ldw	x, #___str_1+0
      008204 1F 01            [ 2]  404 	ldw	(0x01, sp), x
      008206 1E 01            [ 2]  405 	ldw	x, (0x01, sp)
      008208 89               [ 2]  406 	pushw	x
      008209 CD 87 5A         [ 4]  407 	call	_uart1_string
      00820C 85               [ 2]  408 	popw	x
                                    409 ;	main.c: 197: uart1_string(" Acceleration Y [g]*100 =  ");
      00820D AE 85 57         [ 2]  410 	ldw	x, #___str_2+0
      008210 89               [ 2]  411 	pushw	x
      008211 CD 87 5A         [ 4]  412 	call	_uart1_string
      008214 85               [ 2]  413 	popw	x
                                    414 ;	main.c: 198: uart1_number((int)AccY);
      008215 CE 00 07         [ 2]  415 	ldw	x, _AccY+2
      008218 89               [ 2]  416 	pushw	x
      008219 CE 00 05         [ 2]  417 	ldw	x, _AccY+0
      00821C 89               [ 2]  418 	pushw	x
      00821D CD 8D 9A         [ 4]  419 	call	___fs2sint
      008220 5B 04            [ 2]  420 	addw	sp, #4
      008222 89               [ 2]  421 	pushw	x
      008223 CD 86 BA         [ 4]  422 	call	_uart1_number
      008226 85               [ 2]  423 	popw	x
                                    424 ;	main.c: 199: uart1_string(" | ");
      008227 1E 01            [ 2]  425 	ldw	x, (0x01, sp)
      008229 89               [ 2]  426 	pushw	x
      00822A CD 87 5A         [ 4]  427 	call	_uart1_string
      00822D 85               [ 2]  428 	popw	x
                                    429 ;	main.c: 200: uart1_string("                                   ");
      00822E AE 85 73         [ 2]  430 	ldw	x, #___str_3+0
      008231 89               [ 2]  431 	pushw	x
      008232 CD 87 5A         [ 4]  432 	call	_uart1_string
      008235 85               [ 2]  433 	popw	x
                                    434 ;	main.c: 201: Timer4DelayMs(500);
      008236 4B F4            [ 1]  435 	push	#0xf4
      008238 4B 01            [ 1]  436 	push	#0x01
      00823A CD 85 A4         [ 4]  437 	call	_Timer4DelayMs
      00823D 85               [ 2]  438 	popw	x
      00823E CC 81 88         [ 2]  439 	jp	00102$
      008241 85               [ 2]  440 	popw	x
      008242 81               [ 4]  441 	ret
                                    442 ;	main.c: 307: void initMPU6050(void)
                                    443 ;	-----------------------------------------
                                    444 ;	 function initMPU6050
                                    445 ;	-----------------------------------------
      008243                        446 _initMPU6050:
                                    447 ;	main.c: 309: I2C_start();	/*Disable SLEEP Mode*/
      008243 CD 85 FB         [ 4]  448 	call	_I2C_start
                                    449 ;	main.c: 310: I2C_address((uint8_t)0x68 << 1, I2C_DIRECTION_TX);
      008246 4B 00            [ 1]  450 	push	#0x00
      008248 4B D0            [ 1]  451 	push	#0xd0
      00824A CD 86 21         [ 4]  452 	call	_I2C_address
      00824D 85               [ 2]  453 	popw	x
                                    454 ;	main.c: 311: I2C_write(0x6B);
      00824E 4B 6B            [ 1]  455 	push	#0x6b
      008250 CD 86 3C         [ 4]  456 	call	_I2C_write
      008253 84               [ 1]  457 	pop	a
                                    458 ;	main.c: 312: I2C_write(0x00);
      008254 4B 00            [ 1]  459 	push	#0x00
      008256 CD 86 3C         [ 4]  460 	call	_I2C_write
      008259 84               [ 1]  461 	pop	a
                                    462 ;	main.c: 313: I2C_stop();
      00825A CD 86 11         [ 4]  463 	call	_I2C_stop
                                    464 ;	main.c: 314: Timer4DelayMs(100);
      00825D 4B 64            [ 1]  465 	push	#0x64
      00825F 4B 00            [ 1]  466 	push	#0x00
      008261 CD 85 A4         [ 4]  467 	call	_Timer4DelayMs
      008264 85               [ 2]  468 	popw	x
                                    469 ;	main.c: 316: I2C_start();	/*Enable Low Pass Filter*/
      008265 CD 85 FB         [ 4]  470 	call	_I2C_start
                                    471 ;	main.c: 317: I2C_address((uint8_t)0x68 << 1, I2C_DIRECTION_TX);
      008268 4B 00            [ 1]  472 	push	#0x00
      00826A 4B D0            [ 1]  473 	push	#0xd0
      00826C CD 86 21         [ 4]  474 	call	_I2C_address
      00826F 85               [ 2]  475 	popw	x
                                    476 ;	main.c: 318: I2C_write(0x1A);
      008270 4B 1A            [ 1]  477 	push	#0x1a
      008272 CD 86 3C         [ 4]  478 	call	_I2C_write
      008275 84               [ 1]  479 	pop	a
                                    480 ;	main.c: 319: I2C_write(0x05);
      008276 4B 05            [ 1]  481 	push	#0x05
      008278 CD 86 3C         [ 4]  482 	call	_I2C_write
      00827B 84               [ 1]  483 	pop	a
                                    484 ;	main.c: 320: I2C_stop();
      00827C CD 86 11         [ 4]  485 	call	_I2C_stop
                                    486 ;	main.c: 321: Timer4DelayMs(100);
      00827F 4B 64            [ 1]  487 	push	#0x64
      008281 4B 00            [ 1]  488 	push	#0x00
      008283 CD 85 A4         [ 4]  489 	call	_Timer4DelayMs
      008286 85               [ 2]  490 	popw	x
                                    491 ;	main.c: 323: I2C_start();
      008287 CD 85 FB         [ 4]  492 	call	_I2C_start
                                    493 ;	main.c: 324: I2C_address((uint8_t)0x68 << 1, I2C_DIRECTION_TX);
      00828A 4B 00            [ 1]  494 	push	#0x00
      00828C 4B D0            [ 1]  495 	push	#0xd0
      00828E CD 86 21         [ 4]  496 	call	_I2C_address
      008291 85               [ 2]  497 	popw	x
                                    498 ;	main.c: 325: I2C_write(0x1B);
      008292 4B 1B            [ 1]  499 	push	#0x1b
      008294 CD 86 3C         [ 4]  500 	call	_I2C_write
      008297 84               [ 1]  501 	pop	a
                                    502 ;	main.c: 326: I2C_write(0x00); // 250 do/s
      008298 4B 00            [ 1]  503 	push	#0x00
      00829A CD 86 3C         [ 4]  504 	call	_I2C_write
      00829D 84               [ 1]  505 	pop	a
                                    506 ;	main.c: 327: I2C_stop();
      00829E CD 86 11         [ 4]  507 	call	_I2C_stop
                                    508 ;	main.c: 328: Timer4DelayMs(100);
      0082A1 4B 64            [ 1]  509 	push	#0x64
      0082A3 4B 00            [ 1]  510 	push	#0x00
      0082A5 CD 85 A4         [ 4]  511 	call	_Timer4DelayMs
      0082A8 85               [ 2]  512 	popw	x
                                    513 ;	main.c: 330: I2C_start(); /*Accelerometer Configuration*/
      0082A9 CD 85 FB         [ 4]  514 	call	_I2C_start
                                    515 ;	main.c: 331: I2C_address((uint8_t)0x68 << 1, I2C_DIRECTION_TX);
      0082AC 4B 00            [ 1]  516 	push	#0x00
      0082AE 4B D0            [ 1]  517 	push	#0xd0
      0082B0 CD 86 21         [ 4]  518 	call	_I2C_address
      0082B3 85               [ 2]  519 	popw	x
                                    520 ;	main.c: 332: I2C_write(0x1C);
      0082B4 4B 1C            [ 1]  521 	push	#0x1c
      0082B6 CD 86 3C         [ 4]  522 	call	_I2C_write
      0082B9 84               [ 1]  523 	pop	a
                                    524 ;	main.c: 333: I2C_write(0x10); //+-8g
      0082BA 4B 10            [ 1]  525 	push	#0x10
      0082BC CD 86 3C         [ 4]  526 	call	_I2C_write
      0082BF 84               [ 1]  527 	pop	a
                                    528 ;	main.c: 334: I2C_stop();
      0082C0 CC 86 11         [ 2]  529 	jp	_I2C_stop
                                    530 ;	main.c: 336: void getMPU6050(void)
                                    531 ;	-----------------------------------------
                                    532 ;	 function getMPU6050
                                    533 ;	-----------------------------------------
      0082C3                        534 _getMPU6050:
                                    535 ;	main.c: 340: I2C_start();
      0082C3 CD 85 FB         [ 4]  536 	call	_I2C_start
                                    537 ;	main.c: 341: I2C_address(I2C_Slave_Address, I2C_DIRECTION_TX);
      0082C6 4B 00            [ 1]  538 	push	#0x00
      0082C8 4B D0            [ 1]  539 	push	#0xd0
      0082CA CD 86 21         [ 4]  540 	call	_I2C_address
      0082CD 85               [ 2]  541 	popw	x
                                    542 ;	main.c: 342: I2C_write(0x3B);
      0082CE 4B 3B            [ 1]  543 	push	#0x3b
      0082D0 CD 86 3C         [ 4]  544 	call	_I2C_write
      0082D3 84               [ 1]  545 	pop	a
                                    546 ;	main.c: 344: I2C->CR2 |= I2C_CR2_START | I2C_CR2_ACK; /* Generate a START condition and Acknowledge Enable */
      0082D4 AE 52 11         [ 2]  547 	ldw	x, #0x5211
      0082D7 F6               [ 1]  548 	ld	a, (x)
      0082D8 AA 05            [ 1]  549 	or	a, #0x05
      0082DA F7               [ 1]  550 	ld	(x), a
                                    551 ;	main.c: 345: while ((I2C->SR1 & I2C_SR1_SB) == 0);	/*Check --EV5 */
      0082DB                        552 00101$:
      0082DB AE 52 17         [ 2]  553 	ldw	x, #0x5217
      0082DE F6               [ 1]  554 	ld	a, (x)
      0082DF 44               [ 1]  555 	srl	a
      0082E0 24 F9            [ 1]  556 	jrnc	00101$
                                    557 ;	main.c: 347: I2C->DR = (uint8_t)(I2C_Slave_Address | (uint8_t)I2C_DIRECTION_RX); /* Send the Address + Direction */
      0082E2 35 D1 52 16      [ 1]  558 	mov	0x5216+0, #0xd1
                                    559 ;	main.c: 349: I2C->SR1;
      0082E6 AE 52 17         [ 2]  560 	ldw	x, #0x5217
      0082E9 F6               [ 1]  561 	ld	a, (x)
                                    562 ;	main.c: 350: I2C->SR3;
      0082EA AE 52 19         [ 2]  563 	ldw	x, #0x5219
      0082ED F6               [ 1]  564 	ld	a, (x)
                                    565 ;	main.c: 351: while ((I2C->SR1 & I2C_SR1_ADDR) == 0);
      0082EE                        566 00104$:
      0082EE AE 52 17         [ 2]  567 	ldw	x, #0x5217
      0082F1 F6               [ 1]  568 	ld	a, (x)
      0082F2 A5 02            [ 1]  569 	bcp	a, #0x02
      0082F4 27 F8            [ 1]  570 	jreq	00104$
                                    571 ;	main.c: 352: while ((I2C->SR3 & (uint8_t)0x02) == SET); /*check busy flag */
      0082F6                        572 00107$:
      0082F6 AE 52 19         [ 2]  573 	ldw	x, #0x5219
      0082F9 F6               [ 1]  574 	ld	a, (x)
      0082FA A4 02            [ 1]  575 	and	a, #0x02
      0082FC A1 01            [ 1]  576 	cp	a, #0x01
      0082FE 27 F6            [ 1]  577 	jreq	00107$
                                    578 ;	main.c: 354: while ((I2C->SR1 & I2C_SR1_RXNE) == 0);
      008300                        579 00110$:
      008300 AE 52 17         [ 2]  580 	ldw	x, #0x5217
      008303 F6               [ 1]  581 	ld	a, (x)
      008304 A5 40            [ 1]  582 	bcp	a, #0x40
      008306 27 F8            [ 1]  583 	jreq	00110$
                                    584 ;	main.c: 355: AccXLSB = (uint8_t)I2C->DR;
      008308 AE 52 16         [ 2]  585 	ldw	x, #0x5216
      00830B F6               [ 1]  586 	ld	a, (x)
      00830C 5F               [ 1]  587 	clrw	x
      00830D 97               [ 1]  588 	ld	xl, a
      00830E CF 00 0D         [ 2]  589 	ldw	_AccXLSB+0, x
                                    590 ;	main.c: 356: I2C->CR2 |= (uint8_t)(I2C_CR2_ACK); /* Enable the acknowledgement */
      008311 AE 52 11         [ 2]  591 	ldw	x, #0x5211
      008314 F6               [ 1]  592 	ld	a, (x)
      008315 AA 04            [ 1]  593 	or	a, #0x04
      008317 F7               [ 1]  594 	ld	(x), a
                                    595 ;	main.c: 358: while ((I2C->SR1 & I2C_SR1_RXNE) == 0);
      008318                        596 00113$:
      008318 AE 52 17         [ 2]  597 	ldw	x, #0x5217
      00831B F6               [ 1]  598 	ld	a, (x)
      00831C A5 40            [ 1]  599 	bcp	a, #0x40
      00831E 27 F8            [ 1]  600 	jreq	00113$
                                    601 ;	main.c: 359: AccXMSB = (uint8_t)I2C->DR;
      008320 AE 52 16         [ 2]  602 	ldw	x, #0x5216
      008323 F6               [ 1]  603 	ld	a, (x)
      008324 5F               [ 1]  604 	clrw	x
      008325 97               [ 1]  605 	ld	xl, a
      008326 CF 00 0F         [ 2]  606 	ldw	_AccXMSB+0, x
                                    607 ;	main.c: 360: I2C->CR2 |= (uint8_t)(I2C_CR2_ACK); /* Enable the acknowledgement */
      008329 AE 52 11         [ 2]  608 	ldw	x, #0x5211
      00832C F6               [ 1]  609 	ld	a, (x)
      00832D AA 04            [ 1]  610 	or	a, #0x04
      00832F F7               [ 1]  611 	ld	(x), a
                                    612 ;	main.c: 362: while ((I2C->SR1 & I2C_SR1_RXNE) == 0);
      008330                        613 00116$:
      008330 AE 52 17         [ 2]  614 	ldw	x, #0x5217
      008333 F6               [ 1]  615 	ld	a, (x)
      008334 A5 40            [ 1]  616 	bcp	a, #0x40
      008336 27 F8            [ 1]  617 	jreq	00116$
                                    618 ;	main.c: 363: AccYLSB = (uint8_t)I2C->DR;
      008338 AE 52 16         [ 2]  619 	ldw	x, #0x5216
      00833B F6               [ 1]  620 	ld	a, (x)
      00833C 5F               [ 1]  621 	clrw	x
      00833D 97               [ 1]  622 	ld	xl, a
      00833E CF 00 11         [ 2]  623 	ldw	_AccYLSB+0, x
                                    624 ;	main.c: 364: I2C->CR2 |= (uint8_t)(I2C_CR2_ACK); /* Enable the acknowledgement */
      008341 AE 52 11         [ 2]  625 	ldw	x, #0x5211
      008344 F6               [ 1]  626 	ld	a, (x)
      008345 AA 04            [ 1]  627 	or	a, #0x04
      008347 F7               [ 1]  628 	ld	(x), a
                                    629 ;	main.c: 366: while ((I2C->SR1 & I2C_SR1_RXNE) == 0);
      008348                        630 00119$:
      008348 AE 52 17         [ 2]  631 	ldw	x, #0x5217
      00834B F6               [ 1]  632 	ld	a, (x)
      00834C A5 40            [ 1]  633 	bcp	a, #0x40
      00834E 27 F8            [ 1]  634 	jreq	00119$
                                    635 ;	main.c: 367: AccYMSB = (uint8_t)I2C->DR;
      008350 AE 52 16         [ 2]  636 	ldw	x, #0x5216
      008353 F6               [ 1]  637 	ld	a, (x)
      008354 5F               [ 1]  638 	clrw	x
      008355 97               [ 1]  639 	ld	xl, a
      008356 CF 00 13         [ 2]  640 	ldw	_AccYMSB+0, x
                                    641 ;	main.c: 368: I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK); /* Enable the acknowledgement */
      008359 AE 52 11         [ 2]  642 	ldw	x, #0x5211
      00835C F6               [ 1]  643 	ld	a, (x)
      00835D A4 FB            [ 1]  644 	and	a, #0xfb
      00835F F7               [ 1]  645 	ld	(x), a
                                    646 ;	main.c: 370: I2C_stop();
      008360 CD 86 11         [ 4]  647 	call	_I2C_stop
                                    648 ;	main.c: 372: AccXLSB = (AccXLSB << 8) | AccXMSB; /*16 bit , 0-65535*/ /*0-1g, 0-9.8m/s^2*/
      008363 C6 00 0E         [ 1]  649 	ld	a, _AccXLSB+1
      008366 95               [ 1]  650 	ld	xh, a
      008367 4F               [ 1]  651 	clr	a
      008368 CA 00 10         [ 1]  652 	or	a, _AccXMSB+1
      00836B 02               [ 1]  653 	rlwa	x
      00836C CA 00 0F         [ 1]  654 	or	a, _AccXMSB+0
      00836F 95               [ 1]  655 	ld	xh, a
      008370 CF 00 0D         [ 2]  656 	ldw	_AccXLSB+0, x
                                    657 ;	main.c: 373: AccYLSB = (AccYLSB << 8) | AccYMSB;
      008373 C6 00 12         [ 1]  658 	ld	a, _AccYLSB+1
      008376 95               [ 1]  659 	ld	xh, a
      008377 4F               [ 1]  660 	clr	a
      008378 CA 00 14         [ 1]  661 	or	a, _AccYMSB+1
      00837B 02               [ 1]  662 	rlwa	x
      00837C CA 00 13         [ 1]  663 	or	a, _AccYMSB+0
      00837F 95               [ 1]  664 	ld	xh, a
      008380 CF 00 11         [ 2]  665 	ldw	_AccYLSB+0, x
                                    666 ;	main.c: 375: AccX = (float)AccXLSB / 4096.0 - 0.04;
      008383 CE 00 0D         [ 2]  667 	ldw	x, _AccXLSB+0
      008386 89               [ 2]  668 	pushw	x
      008387 CD 8D D8         [ 4]  669 	call	___sint2fs
      00838A 5B 02            [ 2]  670 	addw	sp, #2
      00838C 4B 00            [ 1]  671 	push	#0x00
      00838E 4B 00            [ 1]  672 	push	#0x00
      008390 4B 80            [ 1]  673 	push	#0x80
      008392 4B 45            [ 1]  674 	push	#0x45
      008394 89               [ 2]  675 	pushw	x
      008395 90 89            [ 2]  676 	pushw	y
      008397 CD 8D E9         [ 4]  677 	call	___fsdiv
      00839A 5B 08            [ 2]  678 	addw	sp, #8
      00839C 4B 0A            [ 1]  679 	push	#0x0a
      00839E 4B D7            [ 1]  680 	push	#0xd7
      0083A0 4B 23            [ 1]  681 	push	#0x23
      0083A2 4B 3D            [ 1]  682 	push	#0x3d
      0083A4 89               [ 2]  683 	pushw	x
      0083A5 90 89            [ 2]  684 	pushw	y
      0083A7 CD 87 7D         [ 4]  685 	call	___fssub
      0083AA 5B 08            [ 2]  686 	addw	sp, #8
      0083AC CF 00 03         [ 2]  687 	ldw	_AccX+2, x
      0083AF 90 CF 00 01      [ 2]  688 	ldw	_AccX+0, y
                                    689 ;	main.c: 376: AccY = (float)AccYLSB / 4096.0 + 0.01;
      0083B3 CE 00 11         [ 2]  690 	ldw	x, _AccYLSB+0
      0083B6 89               [ 2]  691 	pushw	x
      0083B7 CD 8D D8         [ 4]  692 	call	___sint2fs
      0083BA 5B 02            [ 2]  693 	addw	sp, #2
      0083BC 4B 00            [ 1]  694 	push	#0x00
      0083BE 4B 00            [ 1]  695 	push	#0x00
      0083C0 4B 80            [ 1]  696 	push	#0x80
      0083C2 4B 45            [ 1]  697 	push	#0x45
      0083C4 89               [ 2]  698 	pushw	x
      0083C5 90 89            [ 2]  699 	pushw	y
      0083C7 CD 8D E9         [ 4]  700 	call	___fsdiv
      0083CA 5B 08            [ 2]  701 	addw	sp, #8
      0083CC 4B 0A            [ 1]  702 	push	#0x0a
      0083CE 4B D7            [ 1]  703 	push	#0xd7
      0083D0 4B 23            [ 1]  704 	push	#0x23
      0083D2 4B 3C            [ 1]  705 	push	#0x3c
      0083D4 89               [ 2]  706 	pushw	x
      0083D5 90 89            [ 2]  707 	pushw	y
      0083D7 CD 8A A2         [ 4]  708 	call	___fsadd
      0083DA 5B 08            [ 2]  709 	addw	sp, #8
      0083DC CF 00 07         [ 2]  710 	ldw	_AccY+2, x
      0083DF 90 CF 00 05      [ 2]  711 	ldw	_AccY+0, y
      0083E3 81               [ 4]  712 	ret
                                    713 	.area CODE
      0083E4                        714 _OLED_INIT_CMD:
      0083E4 A8                     715 	.db #0xA8	; 168
      0083E5 1F                     716 	.db #0x1F	; 31
      0083E6 22                     717 	.db #0x22	; 34
      0083E7 00                     718 	.db #0x00	; 0
      0083E8 03                     719 	.db #0x03	; 3
      0083E9 20                     720 	.db #0x20	; 32
      0083EA 00                     721 	.db #0x00	; 0
      0083EB DA                     722 	.db #0xDA	; 218
      0083EC 02                     723 	.db #0x02	; 2
      0083ED 8D                     724 	.db #0x8D	; 141
      0083EE 14                     725 	.db #0x14	; 20
      0083EF AF                     726 	.db #0xAF	; 175
      0083F0 A1                     727 	.db #0xA1	; 161
      0083F1 C8                     728 	.db #0xC8	; 200
      0083F2                        729 _OLED_FONT:
      0083F2 00                     730 	.db #0x00	; 0
      0083F3 00                     731 	.db #0x00	; 0
      0083F4 00                     732 	.db #0x00	; 0
      0083F5 00                     733 	.db #0x00	; 0
      0083F6 00                     734 	.db #0x00	; 0
      0083F7 00                     735 	.db #0x00	; 0
      0083F8 00                     736 	.db #0x00	; 0
      0083F9 2F                     737 	.db #0x2F	; 47
      0083FA 00                     738 	.db #0x00	; 0
      0083FB 00                     739 	.db #0x00	; 0
      0083FC 00                     740 	.db #0x00	; 0
      0083FD 07                     741 	.db #0x07	; 7
      0083FE 00                     742 	.db #0x00	; 0
      0083FF 07                     743 	.db #0x07	; 7
      008400 00                     744 	.db #0x00	; 0
      008401 14                     745 	.db #0x14	; 20
      008402 7F                     746 	.db #0x7F	; 127
      008403 14                     747 	.db #0x14	; 20
      008404 7F                     748 	.db #0x7F	; 127
      008405 14                     749 	.db #0x14	; 20
      008406 24                     750 	.db #0x24	; 36
      008407 2A                     751 	.db #0x2A	; 42
      008408 7F                     752 	.db #0x7F	; 127
      008409 2A                     753 	.db #0x2A	; 42
      00840A 12                     754 	.db #0x12	; 18
      00840B 62                     755 	.db #0x62	; 98	'b'
      00840C 64                     756 	.db #0x64	; 100	'd'
      00840D 08                     757 	.db #0x08	; 8
      00840E 13                     758 	.db #0x13	; 19
      00840F 23                     759 	.db #0x23	; 35
      008410 36                     760 	.db #0x36	; 54	'6'
      008411 49                     761 	.db #0x49	; 73	'I'
      008412 55                     762 	.db #0x55	; 85	'U'
      008413 22                     763 	.db #0x22	; 34
      008414 50                     764 	.db #0x50	; 80	'P'
      008415 00                     765 	.db #0x00	; 0
      008416 05                     766 	.db #0x05	; 5
      008417 03                     767 	.db #0x03	; 3
      008418 00                     768 	.db #0x00	; 0
      008419 00                     769 	.db #0x00	; 0
      00841A 00                     770 	.db #0x00	; 0
      00841B 1C                     771 	.db #0x1C	; 28
      00841C 22                     772 	.db #0x22	; 34
      00841D 41                     773 	.db #0x41	; 65	'A'
      00841E 00                     774 	.db #0x00	; 0
      00841F 00                     775 	.db #0x00	; 0
      008420 41                     776 	.db #0x41	; 65	'A'
      008421 22                     777 	.db #0x22	; 34
      008422 1C                     778 	.db #0x1C	; 28
      008423 00                     779 	.db #0x00	; 0
      008424 14                     780 	.db #0x14	; 20
      008425 08                     781 	.db #0x08	; 8
      008426 3E                     782 	.db #0x3E	; 62
      008427 08                     783 	.db #0x08	; 8
      008428 14                     784 	.db #0x14	; 20
      008429 08                     785 	.db #0x08	; 8
      00842A 08                     786 	.db #0x08	; 8
      00842B 3E                     787 	.db #0x3E	; 62
      00842C 08                     788 	.db #0x08	; 8
      00842D 08                     789 	.db #0x08	; 8
      00842E 00                     790 	.db #0x00	; 0
      00842F 00                     791 	.db #0x00	; 0
      008430 A0                     792 	.db #0xA0	; 160
      008431 60                     793 	.db #0x60	; 96
      008432 00                     794 	.db #0x00	; 0
      008433 08                     795 	.db #0x08	; 8
      008434 08                     796 	.db #0x08	; 8
      008435 08                     797 	.db #0x08	; 8
      008436 08                     798 	.db #0x08	; 8
      008437 08                     799 	.db #0x08	; 8
      008438 00                     800 	.db #0x00	; 0
      008439 60                     801 	.db #0x60	; 96
      00843A 60                     802 	.db #0x60	; 96
      00843B 00                     803 	.db #0x00	; 0
      00843C 00                     804 	.db #0x00	; 0
      00843D 20                     805 	.db #0x20	; 32
      00843E 10                     806 	.db #0x10	; 16
      00843F 08                     807 	.db #0x08	; 8
      008440 04                     808 	.db #0x04	; 4
      008441 02                     809 	.db #0x02	; 2
      008442 3E                     810 	.db #0x3E	; 62
      008443 51                     811 	.db #0x51	; 81	'Q'
      008444 49                     812 	.db #0x49	; 73	'I'
      008445 45                     813 	.db #0x45	; 69	'E'
      008446 3E                     814 	.db #0x3E	; 62
      008447 00                     815 	.db #0x00	; 0
      008448 42                     816 	.db #0x42	; 66	'B'
      008449 7F                     817 	.db #0x7F	; 127
      00844A 40                     818 	.db #0x40	; 64
      00844B 00                     819 	.db #0x00	; 0
      00844C 42                     820 	.db #0x42	; 66	'B'
      00844D 61                     821 	.db #0x61	; 97	'a'
      00844E 51                     822 	.db #0x51	; 81	'Q'
      00844F 49                     823 	.db #0x49	; 73	'I'
      008450 46                     824 	.db #0x46	; 70	'F'
      008451 21                     825 	.db #0x21	; 33
      008452 41                     826 	.db #0x41	; 65	'A'
      008453 45                     827 	.db #0x45	; 69	'E'
      008454 4B                     828 	.db #0x4B	; 75	'K'
      008455 31                     829 	.db #0x31	; 49	'1'
      008456 18                     830 	.db #0x18	; 24
      008457 14                     831 	.db #0x14	; 20
      008458 12                     832 	.db #0x12	; 18
      008459 7F                     833 	.db #0x7F	; 127
      00845A 10                     834 	.db #0x10	; 16
      00845B 27                     835 	.db #0x27	; 39
      00845C 45                     836 	.db #0x45	; 69	'E'
      00845D 45                     837 	.db #0x45	; 69	'E'
      00845E 45                     838 	.db #0x45	; 69	'E'
      00845F 39                     839 	.db #0x39	; 57	'9'
      008460 3C                     840 	.db #0x3C	; 60
      008461 4A                     841 	.db #0x4A	; 74	'J'
      008462 49                     842 	.db #0x49	; 73	'I'
      008463 49                     843 	.db #0x49	; 73	'I'
      008464 30                     844 	.db #0x30	; 48	'0'
      008465 01                     845 	.db #0x01	; 1
      008466 71                     846 	.db #0x71	; 113	'q'
      008467 09                     847 	.db #0x09	; 9
      008468 05                     848 	.db #0x05	; 5
      008469 03                     849 	.db #0x03	; 3
      00846A 36                     850 	.db #0x36	; 54	'6'
      00846B 49                     851 	.db #0x49	; 73	'I'
      00846C 49                     852 	.db #0x49	; 73	'I'
      00846D 49                     853 	.db #0x49	; 73	'I'
      00846E 36                     854 	.db #0x36	; 54	'6'
      00846F 06                     855 	.db #0x06	; 6
      008470 49                     856 	.db #0x49	; 73	'I'
      008471 49                     857 	.db #0x49	; 73	'I'
      008472 29                     858 	.db #0x29	; 41
      008473 1E                     859 	.db #0x1E	; 30
      008474 00                     860 	.db #0x00	; 0
      008475 36                     861 	.db #0x36	; 54	'6'
      008476 36                     862 	.db #0x36	; 54	'6'
      008477 00                     863 	.db #0x00	; 0
      008478 00                     864 	.db #0x00	; 0
      008479 00                     865 	.db #0x00	; 0
      00847A 56                     866 	.db #0x56	; 86	'V'
      00847B 36                     867 	.db #0x36	; 54	'6'
      00847C 00                     868 	.db #0x00	; 0
      00847D 00                     869 	.db #0x00	; 0
      00847E 08                     870 	.db #0x08	; 8
      00847F 14                     871 	.db #0x14	; 20
      008480 22                     872 	.db #0x22	; 34
      008481 41                     873 	.db #0x41	; 65	'A'
      008482 00                     874 	.db #0x00	; 0
      008483 14                     875 	.db #0x14	; 20
      008484 14                     876 	.db #0x14	; 20
      008485 14                     877 	.db #0x14	; 20
      008486 14                     878 	.db #0x14	; 20
      008487 14                     879 	.db #0x14	; 20
      008488 00                     880 	.db #0x00	; 0
      008489 41                     881 	.db #0x41	; 65	'A'
      00848A 22                     882 	.db #0x22	; 34
      00848B 14                     883 	.db #0x14	; 20
      00848C 08                     884 	.db #0x08	; 8
      00848D 02                     885 	.db #0x02	; 2
      00848E 01                     886 	.db #0x01	; 1
      00848F 51                     887 	.db #0x51	; 81	'Q'
      008490 09                     888 	.db #0x09	; 9
      008491 06                     889 	.db #0x06	; 6
      008492 32                     890 	.db #0x32	; 50	'2'
      008493 49                     891 	.db #0x49	; 73	'I'
      008494 59                     892 	.db #0x59	; 89	'Y'
      008495 51                     893 	.db #0x51	; 81	'Q'
      008496 3E                     894 	.db #0x3E	; 62
      008497 7C                     895 	.db #0x7C	; 124
      008498 12                     896 	.db #0x12	; 18
      008499 11                     897 	.db #0x11	; 17
      00849A 12                     898 	.db #0x12	; 18
      00849B 7C                     899 	.db #0x7C	; 124
      00849C 7F                     900 	.db #0x7F	; 127
      00849D 49                     901 	.db #0x49	; 73	'I'
      00849E 49                     902 	.db #0x49	; 73	'I'
      00849F 49                     903 	.db #0x49	; 73	'I'
      0084A0 36                     904 	.db #0x36	; 54	'6'
      0084A1 3E                     905 	.db #0x3E	; 62
      0084A2 41                     906 	.db #0x41	; 65	'A'
      0084A3 41                     907 	.db #0x41	; 65	'A'
      0084A4 41                     908 	.db #0x41	; 65	'A'
      0084A5 22                     909 	.db #0x22	; 34
      0084A6 7F                     910 	.db #0x7F	; 127
      0084A7 41                     911 	.db #0x41	; 65	'A'
      0084A8 41                     912 	.db #0x41	; 65	'A'
      0084A9 22                     913 	.db #0x22	; 34
      0084AA 1C                     914 	.db #0x1C	; 28
      0084AB 7F                     915 	.db #0x7F	; 127
      0084AC 49                     916 	.db #0x49	; 73	'I'
      0084AD 49                     917 	.db #0x49	; 73	'I'
      0084AE 49                     918 	.db #0x49	; 73	'I'
      0084AF 41                     919 	.db #0x41	; 65	'A'
      0084B0 7F                     920 	.db #0x7F	; 127
      0084B1 09                     921 	.db #0x09	; 9
      0084B2 09                     922 	.db #0x09	; 9
      0084B3 09                     923 	.db #0x09	; 9
      0084B4 01                     924 	.db #0x01	; 1
      0084B5 3E                     925 	.db #0x3E	; 62
      0084B6 41                     926 	.db #0x41	; 65	'A'
      0084B7 49                     927 	.db #0x49	; 73	'I'
      0084B8 49                     928 	.db #0x49	; 73	'I'
      0084B9 7A                     929 	.db #0x7A	; 122	'z'
      0084BA 7F                     930 	.db #0x7F	; 127
      0084BB 08                     931 	.db #0x08	; 8
      0084BC 08                     932 	.db #0x08	; 8
      0084BD 08                     933 	.db #0x08	; 8
      0084BE 7F                     934 	.db #0x7F	; 127
      0084BF 00                     935 	.db #0x00	; 0
      0084C0 41                     936 	.db #0x41	; 65	'A'
      0084C1 7F                     937 	.db #0x7F	; 127
      0084C2 41                     938 	.db #0x41	; 65	'A'
      0084C3 00                     939 	.db #0x00	; 0
      0084C4 20                     940 	.db #0x20	; 32
      0084C5 40                     941 	.db #0x40	; 64
      0084C6 41                     942 	.db #0x41	; 65	'A'
      0084C7 3F                     943 	.db #0x3F	; 63
      0084C8 01                     944 	.db #0x01	; 1
      0084C9 7F                     945 	.db #0x7F	; 127
      0084CA 08                     946 	.db #0x08	; 8
      0084CB 14                     947 	.db #0x14	; 20
      0084CC 22                     948 	.db #0x22	; 34
      0084CD 41                     949 	.db #0x41	; 65	'A'
      0084CE 7F                     950 	.db #0x7F	; 127
      0084CF 40                     951 	.db #0x40	; 64
      0084D0 40                     952 	.db #0x40	; 64
      0084D1 40                     953 	.db #0x40	; 64
      0084D2 40                     954 	.db #0x40	; 64
      0084D3 7F                     955 	.db #0x7F	; 127
      0084D4 02                     956 	.db #0x02	; 2
      0084D5 0C                     957 	.db #0x0C	; 12
      0084D6 02                     958 	.db #0x02	; 2
      0084D7 7F                     959 	.db #0x7F	; 127
      0084D8 7F                     960 	.db #0x7F	; 127
      0084D9 04                     961 	.db #0x04	; 4
      0084DA 08                     962 	.db #0x08	; 8
      0084DB 10                     963 	.db #0x10	; 16
      0084DC 7F                     964 	.db #0x7F	; 127
      0084DD 3E                     965 	.db #0x3E	; 62
      0084DE 41                     966 	.db #0x41	; 65	'A'
      0084DF 41                     967 	.db #0x41	; 65	'A'
      0084E0 41                     968 	.db #0x41	; 65	'A'
      0084E1 3E                     969 	.db #0x3E	; 62
      0084E2 7F                     970 	.db #0x7F	; 127
      0084E3 09                     971 	.db #0x09	; 9
      0084E4 09                     972 	.db #0x09	; 9
      0084E5 09                     973 	.db #0x09	; 9
      0084E6 06                     974 	.db #0x06	; 6
      0084E7 3E                     975 	.db #0x3E	; 62
      0084E8 41                     976 	.db #0x41	; 65	'A'
      0084E9 51                     977 	.db #0x51	; 81	'Q'
      0084EA 21                     978 	.db #0x21	; 33
      0084EB 5E                     979 	.db #0x5E	; 94
      0084EC 7F                     980 	.db #0x7F	; 127
      0084ED 09                     981 	.db #0x09	; 9
      0084EE 19                     982 	.db #0x19	; 25
      0084EF 29                     983 	.db #0x29	; 41
      0084F0 46                     984 	.db #0x46	; 70	'F'
      0084F1 46                     985 	.db #0x46	; 70	'F'
      0084F2 49                     986 	.db #0x49	; 73	'I'
      0084F3 49                     987 	.db #0x49	; 73	'I'
      0084F4 49                     988 	.db #0x49	; 73	'I'
      0084F5 31                     989 	.db #0x31	; 49	'1'
      0084F6 01                     990 	.db #0x01	; 1
      0084F7 01                     991 	.db #0x01	; 1
      0084F8 7F                     992 	.db #0x7F	; 127
      0084F9 01                     993 	.db #0x01	; 1
      0084FA 01                     994 	.db #0x01	; 1
      0084FB 3F                     995 	.db #0x3F	; 63
      0084FC 40                     996 	.db #0x40	; 64
      0084FD 40                     997 	.db #0x40	; 64
      0084FE 40                     998 	.db #0x40	; 64
      0084FF 3F                     999 	.db #0x3F	; 63
      008500 1F                    1000 	.db #0x1F	; 31
      008501 20                    1001 	.db #0x20	; 32
      008502 40                    1002 	.db #0x40	; 64
      008503 20                    1003 	.db #0x20	; 32
      008504 1F                    1004 	.db #0x1F	; 31
      008505 3F                    1005 	.db #0x3F	; 63
      008506 40                    1006 	.db #0x40	; 64
      008507 38                    1007 	.db #0x38	; 56	'8'
      008508 40                    1008 	.db #0x40	; 64
      008509 3F                    1009 	.db #0x3F	; 63
      00850A 63                    1010 	.db #0x63	; 99	'c'
      00850B 14                    1011 	.db #0x14	; 20
      00850C 08                    1012 	.db #0x08	; 8
      00850D 14                    1013 	.db #0x14	; 20
      00850E 63                    1014 	.db #0x63	; 99	'c'
      00850F 07                    1015 	.db #0x07	; 7
      008510 08                    1016 	.db #0x08	; 8
      008511 70                    1017 	.db #0x70	; 112	'p'
      008512 08                    1018 	.db #0x08	; 8
      008513 07                    1019 	.db #0x07	; 7
      008514 61                    1020 	.db #0x61	; 97	'a'
      008515 51                    1021 	.db #0x51	; 81	'Q'
      008516 49                    1022 	.db #0x49	; 73	'I'
      008517 45                    1023 	.db #0x45	; 69	'E'
      008518 43                    1024 	.db #0x43	; 67	'C'
      008519 00                    1025 	.db #0x00	; 0
      00851A 7F                    1026 	.db #0x7F	; 127
      00851B 41                    1027 	.db #0x41	; 65	'A'
      00851C 41                    1028 	.db #0x41	; 65	'A'
      00851D 00                    1029 	.db #0x00	; 0
      00851E 02                    1030 	.db #0x02	; 2
      00851F 04                    1031 	.db #0x04	; 4
      008520 08                    1032 	.db #0x08	; 8
      008521 10                    1033 	.db #0x10	; 16
      008522 20                    1034 	.db #0x20	; 32
      008523 00                    1035 	.db #0x00	; 0
      008524 41                    1036 	.db #0x41	; 65	'A'
      008525 41                    1037 	.db #0x41	; 65	'A'
      008526 7F                    1038 	.db #0x7F	; 127
      008527 00                    1039 	.db #0x00	; 0
      008528 04                    1040 	.db #0x04	; 4
      008529 02                    1041 	.db #0x02	; 2
      00852A 01                    1042 	.db #0x01	; 1
      00852B 02                    1043 	.db #0x02	; 2
      00852C 04                    1044 	.db #0x04	; 4
      00852D 40                    1045 	.db #0x40	; 64
      00852E 40                    1046 	.db #0x40	; 64
      00852F 40                    1047 	.db #0x40	; 64
      008530 40                    1048 	.db #0x40	; 64
      008531 40                    1049 	.db #0x40	; 64
      008532 00                    1050 	.db #0x00	; 0
      008533 60                    1051 	.db #0x60	; 96
      008534 60                    1052 	.db #0x60	; 96
      008535 00                    1053 	.db #0x00	; 0
      008536 00                    1054 	.db #0x00	; 0
      008537                       1055 ___str_0:
      008537 20 41 63 63 65 6C 65  1056 	.ascii " Acceleration X [g]*100 =  "
             72 61 74 69 6F 6E 20
             58 20 5B 67 5D 2A 31
             30 30 20 3D 20 20
      008552 00                    1057 	.db 0x00
      008553                       1058 ___str_1:
      008553 20 7C 20              1059 	.ascii " | "
      008556 00                    1060 	.db 0x00
      008557                       1061 ___str_2:
      008557 20 41 63 63 65 6C 65  1062 	.ascii " Acceleration Y [g]*100 =  "
             72 61 74 69 6F 6E 20
             59 20 5B 67 5D 2A 31
             30 30 20 3D 20 20
      008572 00                    1063 	.db 0x00
      008573                       1064 ___str_3:
      008573 20 20 20 20 20 20 20  1065 	.ascii "                                   "
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
      008596 00                    1066 	.db 0x00
                                   1067 	.area INITIALIZER
      0093EB                       1068 __xinit__Steps:
      0093EB 00                    1069 	.db #0x00	; 0
      0093EC                       1070 __xinit__Threshold:
      0093EC 40 A0 00 00           1071 	.byte #0x40,#0xA0,#0x00,#0x00	;  5.000000e+00
      0093F0                       1072 __xinit__Mode:
      0093F0 00                    1073 	.db #0x00	; 0
                                   1074 	.area CABS (ABS)
