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
                                     11 	.globl _Message2
                                     12 	.globl _Message1
                                     13 	.globl _OLED_FONT
                                     14 	.globl _OLED_INIT_CMD
                                     15 	.globl _main
                                     16 	.globl _Read_EEPROM
                                     17 	.globl _Write_EEPROM
                                     18 	.globl _I2C_write
                                     19 	.globl _I2C_address
                                     20 	.globl _I2C_stop
                                     21 	.globl _I2C_start
                                     22 	.globl _I2C_init
                                     23 	.globl _Timer4DelayMs
                                     24 	.globl _Timer4Config
                                     25 	.globl _Flag
                                     26 	.globl _Data
                                     27 	.globl _OLED_init
                                     28 	.globl _OLED_printP
                                     29 	.globl _OLED_printNum
                                     30 	.globl _OLED_printFloat
                                     31 	.globl _OLED_printOneNumber
                                     32 	.globl _OLED_cursor
                                     33 	.globl _OLED_clear
                                     34 ;--------------------------------------------------------
                                     35 ; ram data
                                     36 ;--------------------------------------------------------
                                     37 	.area DATA
      000001                         38 _Data::
      000001                         39 	.ds 1
      000002                         40 _Flag::
      000002                         41 	.ds 1
                                     42 ;--------------------------------------------------------
                                     43 ; ram data
                                     44 ;--------------------------------------------------------
                                     45 	.area INITIALIZED
                                     46 ;--------------------------------------------------------
                                     47 ; Stack segment in internal ram
                                     48 ;--------------------------------------------------------
                                     49 	.area SSEG
      000003                         50 __start__stack:
      000003                         51 	.ds	1
                                     52 
                                     53 ;--------------------------------------------------------
                                     54 ; absolute external ram data
                                     55 ;--------------------------------------------------------
                                     56 	.area DABS (ABS)
                                     57 
                                     58 ; default segment ordering for linker
                                     59 	.area HOME
                                     60 	.area GSINIT
                                     61 	.area GSFINAL
                                     62 	.area CONST
                                     63 	.area INITIALIZER
                                     64 	.area CODE
                                     65 
                                     66 ;--------------------------------------------------------
                                     67 ; interrupt vector
                                     68 ;--------------------------------------------------------
                                     69 	.area HOME
      008000                         70 __interrupt_vect:
      008000 82 00 80 07             71 	int s_GSINIT ; reset
                                     72 ;--------------------------------------------------------
                                     73 ; global & static initialisations
                                     74 ;--------------------------------------------------------
                                     75 	.area HOME
                                     76 	.area GSINIT
                                     77 	.area GSFINAL
                                     78 	.area GSINIT
      008007 CD 87 79         [ 4]   79 	call	___sdcc_external_startup
      00800A 4D               [ 1]   80 	tnz	a
      00800B 27 03            [ 1]   81 	jreq	__sdcc_init_data
      00800D CC 80 04         [ 2]   82 	jp	__sdcc_program_startup
      008010                         83 __sdcc_init_data:
                                     84 ; stm8_genXINIT() start
      008010 AE 00 02         [ 2]   85 	ldw x, #l_DATA
      008013 27 07            [ 1]   86 	jreq	00002$
      008015                         87 00001$:
      008015 72 4F 00 00      [ 1]   88 	clr (s_DATA - 1, x)
      008019 5A               [ 2]   89 	decw x
      00801A 26 F9            [ 1]   90 	jrne	00001$
      00801C                         91 00002$:
      00801C AE 00 00         [ 2]   92 	ldw	x, #l_INITIALIZER
      00801F 27 09            [ 1]   93 	jreq	00004$
      008021                         94 00003$:
      008021 D6 81 92         [ 1]   95 	ld	a, (s_INITIALIZER - 1, x)
      008024 D7 00 02         [ 1]   96 	ld	(s_INITIALIZED - 1, x), a
      008027 5A               [ 2]   97 	decw	x
      008028 26 F7            [ 1]   98 	jrne	00003$
      00802A                         99 00004$:
                                    100 ; stm8_genXINIT() end
                                    101 	.area GSFINAL
      00802A CC 80 04         [ 2]  102 	jp	__sdcc_program_startup
                                    103 ;--------------------------------------------------------
                                    104 ; Home
                                    105 ;--------------------------------------------------------
                                    106 	.area HOME
                                    107 	.area HOME
      008004                        108 __sdcc_program_startup:
      008004 CC 81 BD         [ 2]  109 	jp	_main
                                    110 ;	return from main will return to caller
                                    111 ;--------------------------------------------------------
                                    112 ; code
                                    113 ;--------------------------------------------------------
                                    114 	.area CODE
                                    115 ;	main.c: 151: void Write_EEPROM(uint8_t Data){
                                    116 ;	-----------------------------------------
                                    117 ;	 function Write_EEPROM
                                    118 ;	-----------------------------------------
      008193                        119 _Write_EEPROM:
      008193 88               [ 1]  120 	push	a
      008194 6B 01            [ 1]  121 	ld	(0x01, sp), a
                                    122 ;	main.c: 153: if( (FLASH->IAPSR &= (uint8_t)FLASH_IAPSR_DUL)== RESET){
      008196 C6 50 5F         [ 1]  123 	ld	a, 0x505f
      008199 A4 08            [ 1]  124 	and	a, #0x08
      00819B C7 50 5F         [ 1]  125 	ld	0x505f, a
      00819E 4D               [ 1]  126 	tnz	a
      00819F 26 08            [ 1]  127 	jrne	00102$
                                    128 ;	main.c: 154: FLASH->DUKR = 0xAE; /* Warning: keys are reversed on data memory !!! */
      0081A1 35 AE 50 64      [ 1]  129 	mov	0x5064+0, #0xae
                                    130 ;	main.c: 155: FLASH->DUKR = 0x56;
      0081A5 35 56 50 64      [ 1]  131 	mov	0x5064+0, #0x56
      0081A9                        132 00102$:
                                    133 ;	main.c: 159: *(PointerAttr uint8_t*) (MemoryAddressCast)0X4000 = Data;
      0081A9 AE 40 00         [ 2]  134 	ldw	x, #0x4000
      0081AC 7B 01            [ 1]  135 	ld	a, (0x01, sp)
      0081AE F7               [ 1]  136 	ld	(x), a
                                    137 ;	main.c: 162: FLASH->IAPSR &= (uint8_t)0xF7;
      0081AF 72 17 50 5F      [ 1]  138 	bres	0x505f, #3
                                    139 ;	main.c: 163: }
      0081B3 84               [ 1]  140 	pop	a
      0081B4 81               [ 4]  141 	ret
                                    142 ;	main.c: 164: uint8_t Read_EEPROM(uint32_t Address){
                                    143 ;	-----------------------------------------
                                    144 ;	 function Read_EEPROM
                                    145 ;	-----------------------------------------
      0081B5                        146 _Read_EEPROM:
                                    147 ;	main.c: 171: Data = (*(PointerAttr uint8_t *) (MemoryAddressCast)Address);
      0081B5 1E 05            [ 2]  148 	ldw	x, (0x05, sp)
      0081B7 F6               [ 1]  149 	ld	a, (x)
                                    150 ;	main.c: 174: return Data;
                                    151 ;	main.c: 175: }
      0081B8 1E 01            [ 2]  152 	ldw	x, (1, sp)
      0081BA 5B 06            [ 2]  153 	addw	sp, #6
      0081BC FC               [ 2]  154 	jp	(x)
                                    155 ;	main.c: 178: void main (void)
                                    156 ;	-----------------------------------------
                                    157 ;	 function main
                                    158 ;	-----------------------------------------
      0081BD                        159 _main:
                                    160 ;	main.c: 181: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      0081BD C6 50 C6         [ 1]  161 	ld	a, 0x50c6
      0081C0 A4 E7            [ 1]  162 	and	a, #0xe7
      0081C2 C7 50 C6         [ 1]  163 	ld	0x50c6, a
                                    164 ;	main.c: 182: CLK->CKDIVR |= (uint8_t)0x00;
      0081C5 55 50 C6 50 C6   [ 1]  165 	mov	0x50c6, 0x50c6
                                    166 ;	main.c: 184: GPIOB->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
      0081CA 35 00 50 05      [ 1]  167 	mov	0x5005+0, #0x00
                                    168 ;	main.c: 185: GPIOB->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
      0081CE 35 00 50 07      [ 1]  169 	mov	0x5007+0, #0x00
                                    170 ;	main.c: 186: GPIOB->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
      0081D2 35 00 50 08      [ 1]  171 	mov	0x5008+0, #0x00
                                    172 ;	main.c: 187: GPIOB->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
      0081D6 35 00 50 09      [ 1]  173 	mov	0x5009+0, #0x00
                                    174 ;	main.c: 189: GPIOD->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
      0081DA 35 00 50 0F      [ 1]  175 	mov	0x500f+0, #0x00
                                    176 ;	main.c: 190: GPIOD->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
      0081DE 35 00 50 11      [ 1]  177 	mov	0x5011+0, #0x00
                                    178 ;	main.c: 191: GPIOD->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
      0081E2 35 00 50 12      [ 1]  179 	mov	0x5012+0, #0x00
                                    180 ;	main.c: 192: GPIOD->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
      0081E6 35 00 50 13      [ 1]  181 	mov	0x5013+0, #0x00
                                    182 ;	main.c: 195: GPIOB->DDR |= (uint8_t)(1<<4);
      0081EA 72 18 50 07      [ 1]  183 	bset	0x5007, #4
                                    184 ;	main.c: 196: GPIOB->ODR |= (uint8_t)(1<<4);
      0081EE 72 18 50 05      [ 1]  185 	bset	0x5005, #4
                                    186 ;	main.c: 197: GPIOB->CR1 &= ~(uint8_t)(1<<4);		/*OPEN DRAIN*/
      0081F2 72 19 50 08      [ 1]  187 	bres	0x5008, #4
                                    188 ;	main.c: 198: GPIOB->CR2 &= ~(uint8_t)(1<<4);		/*Output Speed Up to 2Mhz*/
      0081F6 72 19 50 09      [ 1]  189 	bres	0x5009, #4
                                    190 ;	main.c: 201: GPIOB->DDR |= (uint8_t)(1<<5);
      0081FA 72 1A 50 07      [ 1]  191 	bset	0x5007, #5
                                    192 ;	main.c: 202: GPIOB->ODR |= (uint8_t)(1<<5);
      0081FE 72 1A 50 05      [ 1]  193 	bset	0x5005, #5
                                    194 ;	main.c: 203: GPIOB->CR1 &= ~(uint8_t)(1<<5);		/*OPEN DRAIN*/
      008202 72 1B 50 08      [ 1]  195 	bres	0x5008, #5
                                    196 ;	main.c: 204: GPIOB->CR2 &= ~(uint8_t)(1<<5);		/*Output Speed Up to 2Mhz*/
      008206 72 1B 50 09      [ 1]  197 	bres	0x5009, #5
                                    198 ;	main.c: 207: GPIOD->DDR &= ~(uint8_t)(1<<3);
      00820A 72 17 50 11      [ 1]  199 	bres	0x5011, #3
                                    200 ;	main.c: 208: GPIOD->IDR |= (uint8_t)(1<<3);
      00820E 72 16 50 10      [ 1]  201 	bset	0x5010, #3
                                    202 ;	main.c: 209: GPIOD->CR1 |= (uint8_t)(1<<3);		/*PULL UP*/
      008212 72 16 50 12      [ 1]  203 	bset	0x5012, #3
                                    204 ;	main.c: 210: GPIOD->CR2 &= ~(uint8_t)(1<<3);		/*DISABLE INTERRUPT*/
      008216 72 17 50 13      [ 1]  205 	bres	0x5013, #3
                                    206 ;	main.c: 212: Timer4Config();
      00821A CD 84 F8         [ 4]  207 	call	_Timer4Config
                                    208 ;	main.c: 213: I2C_init();
      00821D CD 85 1A         [ 4]  209 	call	_I2C_init
                                    210 ;	main.c: 214: OLED_init();
      008220 CD 82 6E         [ 4]  211 	call	_OLED_init
                                    212 ;	main.c: 215: OLED_cursor(0,0);
      008223 4B 00            [ 1]  213 	push	#0x00
      008225 4F               [ 1]  214 	clr	a
      008226 CD 84 96         [ 4]  215 	call	_OLED_cursor
                                    216 ;	main.c: 216: OLED_printP(Message1);
      008229 AE 81 80         [ 2]  217 	ldw	x, #(_Message1+0)
      00822C CD 82 9A         [ 4]  218 	call	_OLED_printP
                                    219 ;	main.c: 217: Timer4DelayMs(2000);
      00822F AE 07 D0         [ 2]  220 	ldw	x, #0x07d0
      008232 CD 85 05         [ 4]  221 	call	_Timer4DelayMs
                                    222 ;	main.c: 218: OLED_clear();
      008235 CD 84 CE         [ 4]  223 	call	_OLED_clear
                                    224 ;	main.c: 223: while (1)
      008238                        225 00104$:
                                    226 ;	main.c: 226: if( (GPIOD->IDR & (1<<3)) == RESET){
      008238 C6 50 10         [ 1]  227 	ld	a, 0x5010
      00823B A5 08            [ 1]  228 	bcp	a, #0x08
      00823D 26 12            [ 1]  229 	jrne	00102$
                                    230 ;	main.c: 227: OLED_cursor(10,0);
      00823F 4B 00            [ 1]  231 	push	#0x00
      008241 A6 0A            [ 1]  232 	ld	a, #0x0a
      008243 CD 84 96         [ 4]  233 	call	_OLED_cursor
                                    234 ;	main.c: 228: OLED_printP("GHI");
      008246 AE 81 8F         [ 2]  235 	ldw	x, #(___str_0+0)
      008249 CD 82 9A         [ 4]  236 	call	_OLED_printP
                                    237 ;	main.c: 229: Write_EEPROM(82);
      00824C A6 52            [ 1]  238 	ld	a, #0x52
      00824E CD 81 93         [ 4]  239 	call	_Write_EEPROM
      008251                        240 00102$:
                                    241 ;	main.c: 232: Data = Read_EEPROM(0x4000);
      008251 4B 00            [ 1]  242 	push	#0x00
      008253 4B 40            [ 1]  243 	push	#0x40
      008255 5F               [ 1]  244 	clrw	x
      008256 89               [ 2]  245 	pushw	x
      008257 CD 81 B5         [ 4]  246 	call	_Read_EEPROM
      00825A C7 00 01         [ 1]  247 	ld	_Data+0, a
                                    248 ;	main.c: 233: OLED_cursor(0,2);
      00825D 4B 02            [ 1]  249 	push	#0x02
      00825F 4F               [ 1]  250 	clr	a
      008260 CD 84 96         [ 4]  251 	call	_OLED_cursor
                                    252 ;	main.c: 234: OLED_printNum(Data);
      008263 C6 00 01         [ 1]  253 	ld	a, _Data+0
      008266 5F               [ 1]  254 	clrw	x
      008267 97               [ 1]  255 	ld	xl, a
      008268 CD 82 F2         [ 4]  256 	call	_OLED_printNum
      00826B 20 CB            [ 2]  257 	jra	00104$
                                    258 ;	main.c: 241: }
      00826D 81               [ 4]  259 	ret
                                    260 ;	main.c: 243: void OLED_init(void) {
                                    261 ;	-----------------------------------------
                                    262 ;	 function OLED_init
                                    263 ;	-----------------------------------------
      00826E                        264 _OLED_init:
      00826E 88               [ 1]  265 	push	a
                                    266 ;	main.c: 244: I2C_start();
      00826F CD 85 52         [ 4]  267 	call	_I2C_start
                                    268 ;	main.c: 245: I2C_address(OLED_I2C_ADDR, I2C_DIRECTION_TX);
      008272 4B 00            [ 1]  269 	push	#0x00
      008274 A6 78            [ 1]  270 	ld	a, #0x78
      008276 CD 85 6F         [ 4]  271 	call	_I2C_address
                                    272 ;	main.c: 246: I2C_write(OLED_CMD_MODE);
      008279 4F               [ 1]  273 	clr	a
      00827A CD 85 89         [ 4]  274 	call	_I2C_write
                                    275 ;	main.c: 247: for (uint8_t i = 0;i < 12;i++)
      00827D 0F 01            [ 1]  276 	clr	(0x01, sp)
      00827F                        277 00103$:
      00827F 7B 01            [ 1]  278 	ld	a, (0x01, sp)
      008281 A1 0C            [ 1]  279 	cp	a, #0x0c
      008283 24 0F            [ 1]  280 	jrnc	00101$
                                    281 ;	main.c: 249: I2C_write(OLED_INIT_CMD[i]);
      008285 5F               [ 1]  282 	clrw	x
      008286 7B 01            [ 1]  283 	ld	a, (0x01, sp)
      008288 97               [ 1]  284 	ld	xl, a
      008289 1C 80 2D         [ 2]  285 	addw	x, #(_OLED_INIT_CMD+0)
      00828C F6               [ 1]  286 	ld	a, (x)
      00828D CD 85 89         [ 4]  287 	call	_I2C_write
                                    288 ;	main.c: 247: for (uint8_t i = 0;i < 12;i++)
      008290 0C 01            [ 1]  289 	inc	(0x01, sp)
      008292 20 EB            [ 2]  290 	jra	00103$
      008294                        291 00101$:
                                    292 ;	main.c: 251: I2C_stop();
      008294 84               [ 1]  293 	pop	a
      008295 CC 85 64         [ 2]  294 	jp	_I2C_stop
                                    295 ;	main.c: 252: }
      008298 84               [ 1]  296 	pop	a
      008299 81               [ 4]  297 	ret
                                    298 ;	main.c: 253: void OLED_printP(const char *p)
                                    299 ;	-----------------------------------------
                                    300 ;	 function OLED_printP
                                    301 ;	-----------------------------------------
      00829A                        302 _OLED_printP:
      00829A 52 07            [ 2]  303 	sub	sp, #7
      00829C 1F 03            [ 2]  304 	ldw	(0x03, sp), x
                                    305 ;	main.c: 255: I2C_start();
      00829E CD 85 52         [ 4]  306 	call	_I2C_start
                                    307 ;	main.c: 256: I2C_address(OLED_I2C_ADDR,I2C_DIRECTION_TX);
      0082A1 4B 00            [ 1]  308 	push	#0x00
      0082A3 A6 78            [ 1]  309 	ld	a, #0x78
      0082A5 CD 85 6F         [ 4]  310 	call	_I2C_address
                                    311 ;	main.c: 257: I2C_write(OLED_DAT_MODE);
      0082A8 A6 40            [ 1]  312 	ld	a, #0x40
      0082AA CD 85 89         [ 4]  313 	call	_I2C_write
                                    314 ;	main.c: 258: while (*p)
      0082AD 16 03            [ 2]  315 	ldw	y, (0x03, sp)
      0082AF 17 05            [ 2]  316 	ldw	(0x05, sp), y
      0082B1                        317 00102$:
      0082B1 1E 05            [ 2]  318 	ldw	x, (0x05, sp)
      0082B3 F6               [ 1]  319 	ld	a, (x)
      0082B4 6B 07            [ 1]  320 	ld	(0x07, sp), a
      0082B6 27 35            [ 1]  321 	jreq	00104$
                                    322 ;	main.c: 260: uint16_t offset = *p - 32;
      0082B8 7B 07            [ 1]  323 	ld	a, (0x07, sp)
      0082BA 5F               [ 1]  324 	clrw	x
      0082BB 97               [ 1]  325 	ld	xl, a
      0082BC 1D 00 20         [ 2]  326 	subw	x, #0x0020
                                    327 ;	main.c: 261: offset += offset << 2;
      0082BF 1F 01            [ 2]  328 	ldw	(0x01, sp), x
      0082C1 58               [ 2]  329 	sllw	x
      0082C2 58               [ 2]  330 	sllw	x
      0082C3 72 FB 01         [ 2]  331 	addw	x, (0x01, sp)
                                    332 ;	main.c: 262: I2C_write(0x00);
      0082C6 89               [ 2]  333 	pushw	x
      0082C7 4F               [ 1]  334 	clr	a
      0082C8 CD 85 89         [ 4]  335 	call	_I2C_write
      0082CB 85               [ 2]  336 	popw	x
                                    337 ;	main.c: 263: for(uint8_t i = 5; i;i--){ I2C_write(OLED_FONT[offset++]); }
      0082CC A6 05            [ 1]  338 	ld	a, #0x05
      0082CE 6B 07            [ 1]  339 	ld	(0x07, sp), a
      0082D0                        340 00106$:
      0082D0 0D 07            [ 1]  341 	tnz	(0x07, sp)
      0082D2 27 12            [ 1]  342 	jreq	00101$
      0082D4 90 93            [ 1]  343 	ldw	y, x
      0082D6 72 A9 80 3B      [ 2]  344 	addw	y, #(_OLED_FONT+0)
      0082DA 5C               [ 1]  345 	incw	x
      0082DB 90 F6            [ 1]  346 	ld	a, (y)
      0082DD 89               [ 2]  347 	pushw	x
      0082DE CD 85 89         [ 4]  348 	call	_I2C_write
      0082E1 85               [ 2]  349 	popw	x
      0082E2 0A 07            [ 1]  350 	dec	(0x07, sp)
      0082E4 20 EA            [ 2]  351 	jra	00106$
      0082E6                        352 00101$:
                                    353 ;	main.c: 264: p++;
      0082E6 1E 05            [ 2]  354 	ldw	x, (0x05, sp)
      0082E8 5C               [ 1]  355 	incw	x
      0082E9 1F 05            [ 2]  356 	ldw	(0x05, sp), x
      0082EB 20 C4            [ 2]  357 	jra	00102$
      0082ED                        358 00104$:
                                    359 ;	main.c: 266: I2C_stop();
      0082ED 5B 07            [ 2]  360 	addw	sp, #7
                                    361 ;	main.c: 267: }
      0082EF CC 85 64         [ 2]  362 	jp	_I2C_stop
                                    363 ;	main.c: 268: void OLED_printNum(uint16_t num){
                                    364 ;	-----------------------------------------
                                    365 ;	 function OLED_printNum
                                    366 ;	-----------------------------------------
      0082F2                        367 _OLED_printNum:
      0082F2 52 0D            [ 2]  368 	sub	sp, #13
      0082F4 1F 0A            [ 2]  369 	ldw	(0x0a, sp), x
                                    370 ;	main.c: 269: uint8_t mang[] = {0,0,0,0,0};
      0082F6 0F 05            [ 1]  371 	clr	(0x05, sp)
      0082F8 0F 06            [ 1]  372 	clr	(0x06, sp)
      0082FA 0F 07            [ 1]  373 	clr	(0x07, sp)
      0082FC 0F 08            [ 1]  374 	clr	(0x08, sp)
      0082FE 0F 09            [ 1]  375 	clr	(0x09, sp)
                                    376 ;	main.c: 271: while(num != 0){
      008300 0F 0D            [ 1]  377 	clr	(0x0d, sp)
      008302                        378 00101$:
      008302 1E 0A            [ 2]  379 	ldw	x, (0x0a, sp)
      008304 27 2C            [ 1]  380 	jreq	00103$
                                    381 ;	main.c: 272: mang[count] = num%10;
      008306 5F               [ 1]  382 	clrw	x
      008307 7B 0D            [ 1]  383 	ld	a, (0x0d, sp)
      008309 97               [ 1]  384 	ld	xl, a
      00830A 89               [ 2]  385 	pushw	x
      00830B 96               [ 1]  386 	ldw	x, sp
      00830C 1C 00 07         [ 2]  387 	addw	x, #7
      00830F 72 FB 01         [ 2]  388 	addw	x, (1, sp)
      008312 1F 03            [ 2]  389 	ldw	(0x03, sp), x
      008314 5B 02            [ 2]  390 	addw	sp, #2
      008316 16 0A            [ 2]  391 	ldw	y, (0x0a, sp)
      008318 17 03            [ 2]  392 	ldw	(0x03, sp), y
      00831A 93               [ 1]  393 	ldw	x, y
      00831B 90 AE 00 0A      [ 2]  394 	ldw	y, #0x000a
      00831F 65               [ 2]  395 	divw	x, y
      008320 90 9F            [ 1]  396 	ld	a, yl
      008322 1E 01            [ 2]  397 	ldw	x, (0x01, sp)
      008324 F7               [ 1]  398 	ld	(x), a
                                    399 ;	main.c: 273: num = num /10;
      008325 1E 03            [ 2]  400 	ldw	x, (0x03, sp)
      008327 90 AE 00 0A      [ 2]  401 	ldw	y, #0x000a
      00832B 65               [ 2]  402 	divw	x, y
      00832C 1F 0A            [ 2]  403 	ldw	(0x0a, sp), x
                                    404 ;	main.c: 274: ++count;
      00832E 0C 0D            [ 1]  405 	inc	(0x0d, sp)
      008330 20 D0            [ 2]  406 	jra	00101$
      008332                        407 00103$:
                                    408 ;	main.c: 276: I2C_start();
      008332 CD 85 52         [ 4]  409 	call	_I2C_start
                                    410 ;	main.c: 277: I2C_address(OLED_I2C_ADDR,I2C_DIRECTION_TX);
      008335 4B 00            [ 1]  411 	push	#0x00
      008337 A6 78            [ 1]  412 	ld	a, #0x78
      008339 CD 85 6F         [ 4]  413 	call	_I2C_address
                                    414 ;	main.c: 278: I2C_write(OLED_DAT_MODE);
      00833C A6 40            [ 1]  415 	ld	a, #0x40
      00833E CD 85 89         [ 4]  416 	call	_I2C_write
                                    417 ;	main.c: 279: while(count != 0){
      008341 7B 0D            [ 1]  418 	ld	a, (0x0d, sp)
      008343 6B 0C            [ 1]  419 	ld	(0x0c, sp), a
      008345                        420 00105$:
      008345 0D 0C            [ 1]  421 	tnz	(0x0c, sp)
      008347 27 43            [ 1]  422 	jreq	00107$
                                    423 ;	main.c: 280: uint16_t offset = mang[count-1] + 16;
      008349 7B 0C            [ 1]  424 	ld	a, (0x0c, sp)
      00834B 4A               [ 1]  425 	dec	a
      00834C 6B 04            [ 1]  426 	ld	(0x04, sp), a
      00834E 49               [ 1]  427 	rlc	a
      00834F 4F               [ 1]  428 	clr	a
      008350 A2 00            [ 1]  429 	sbc	a, #0x00
      008352 6B 03            [ 1]  430 	ld	(0x03, sp), a
      008354 96               [ 1]  431 	ldw	x, sp
      008355 1C 00 05         [ 2]  432 	addw	x, #5
      008358 72 FB 03         [ 2]  433 	addw	x, (0x03, sp)
      00835B F6               [ 1]  434 	ld	a, (x)
      00835C 5F               [ 1]  435 	clrw	x
      00835D 97               [ 1]  436 	ld	xl, a
      00835E 1C 00 10         [ 2]  437 	addw	x, #0x0010
                                    438 ;	main.c: 281: offset += offset << 2;
      008361 1F 03            [ 2]  439 	ldw	(0x03, sp), x
      008363 58               [ 2]  440 	sllw	x
      008364 58               [ 2]  441 	sllw	x
      008365 72 FB 03         [ 2]  442 	addw	x, (0x03, sp)
                                    443 ;	main.c: 282: I2C_write(0x00);
      008368 89               [ 2]  444 	pushw	x
      008369 4F               [ 1]  445 	clr	a
      00836A CD 85 89         [ 4]  446 	call	_I2C_write
      00836D 85               [ 2]  447 	popw	x
                                    448 ;	main.c: 283: for(uint8_t i = 5; i;i--){ I2C_write(OLED_FONT[offset++]); }
      00836E A6 05            [ 1]  449 	ld	a, #0x05
      008370 6B 0D            [ 1]  450 	ld	(0x0d, sp), a
      008372                        451 00109$:
      008372 0D 0D            [ 1]  452 	tnz	(0x0d, sp)
      008374 27 12            [ 1]  453 	jreq	00104$
      008376 90 93            [ 1]  454 	ldw	y, x
      008378 72 A9 80 3B      [ 2]  455 	addw	y, #(_OLED_FONT+0)
      00837C 5C               [ 1]  456 	incw	x
      00837D 90 F6            [ 1]  457 	ld	a, (y)
      00837F 89               [ 2]  458 	pushw	x
      008380 CD 85 89         [ 4]  459 	call	_I2C_write
      008383 85               [ 2]  460 	popw	x
      008384 0A 0D            [ 1]  461 	dec	(0x0d, sp)
      008386 20 EA            [ 2]  462 	jra	00109$
      008388                        463 00104$:
                                    464 ;	main.c: 284: --count;
      008388 0A 0C            [ 1]  465 	dec	(0x0c, sp)
      00838A 20 B9            [ 2]  466 	jra	00105$
      00838C                        467 00107$:
                                    468 ;	main.c: 286: I2C_stop();		
      00838C CD 85 64         [ 4]  469 	call	_I2C_stop
                                    470 ;	main.c: 287: }
      00838F 5B 0D            [ 2]  471 	addw	sp, #13
      008391 81               [ 4]  472 	ret
                                    473 ;	main.c: 288: void OLED_printFloat(float num){
                                    474 ;	-----------------------------------------
                                    475 ;	 function OLED_printFloat
                                    476 ;	-----------------------------------------
      008392                        477 _OLED_printFloat:
      008392 52 0B            [ 2]  478 	sub	sp, #11
                                    479 ;	main.c: 289: uint16_t num2 = num * 100;
      008394 1E 10            [ 2]  480 	ldw	x, (0x10, sp)
      008396 89               [ 2]  481 	pushw	x
      008397 1E 10            [ 2]  482 	ldw	x, (0x10, sp)
      008399 89               [ 2]  483 	pushw	x
      00839A 5F               [ 1]  484 	clrw	x
      00839B 89               [ 2]  485 	pushw	x
      00839C 4B C8            [ 1]  486 	push	#0xc8
      00839E 4B 42            [ 1]  487 	push	#0x42
      0083A0 CD 85 9F         [ 4]  488 	call	___fsmul
      0083A3 89               [ 2]  489 	pushw	x
      0083A4 90 89            [ 2]  490 	pushw	y
      0083A6 CD 87 59         [ 4]  491 	call	___fs2uint
      0083A9 1F 01            [ 2]  492 	ldw	(0x01, sp), x
                                    493 ;	main.c: 290: uint8_t mang[] = {0,0,0,0,0};
      0083AB 0F 05            [ 1]  494 	clr	(0x05, sp)
      0083AD 0F 06            [ 1]  495 	clr	(0x06, sp)
      0083AF 0F 07            [ 1]  496 	clr	(0x07, sp)
      0083B1 0F 08            [ 1]  497 	clr	(0x08, sp)
      0083B3 0F 09            [ 1]  498 	clr	(0x09, sp)
                                    499 ;	main.c: 291: uint8_t count = 0;
      0083B5 0F 0B            [ 1]  500 	clr	(0x0b, sp)
                                    501 ;	main.c: 292: while(count<5){
      0083B7                        502 00103$:
      0083B7 7B 0B            [ 1]  503 	ld	a, (0x0b, sp)
      0083B9 A1 05            [ 1]  504 	cp	a, #0x05
      0083BB 24 38            [ 1]  505 	jrnc	00105$
                                    506 ;	main.c: 293: mang[count] = (uint8_t)num2%10;
      0083BD 5F               [ 1]  507 	clrw	x
      0083BE 7B 0B            [ 1]  508 	ld	a, (0x0b, sp)
      0083C0 97               [ 1]  509 	ld	xl, a
      0083C1 89               [ 2]  510 	pushw	x
      0083C2 96               [ 1]  511 	ldw	x, sp
      0083C3 1C 00 07         [ 2]  512 	addw	x, #7
      0083C6 72 FB 01         [ 2]  513 	addw	x, (1, sp)
      0083C9 1F 05            [ 2]  514 	ldw	(0x05, sp), x
      0083CB 5B 02            [ 2]  515 	addw	sp, #2
      0083CD 7B 02            [ 1]  516 	ld	a, (0x02, sp)
      0083CF 5F               [ 1]  517 	clrw	x
      0083D0 4B 0A            [ 1]  518 	push	#0x0a
      0083D2 4B 00            [ 1]  519 	push	#0x00
      0083D4 97               [ 1]  520 	ld	xl, a
      0083D5 CD 87 7B         [ 4]  521 	call	__modsint
      0083D8 9F               [ 1]  522 	ld	a, xl
      0083D9 1E 03            [ 2]  523 	ldw	x, (0x03, sp)
      0083DB F7               [ 1]  524 	ld	(x), a
                                    525 ;	main.c: 294: num2 = num2 /10;
      0083DC 1E 01            [ 2]  526 	ldw	x, (0x01, sp)
      0083DE 90 AE 00 0A      [ 2]  527 	ldw	y, #0x000a
      0083E2 65               [ 2]  528 	divw	x, y
      0083E3 1F 01            [ 2]  529 	ldw	(0x01, sp), x
                                    530 ;	main.c: 295: ++count;
      0083E5 0C 0B            [ 1]  531 	inc	(0x0b, sp)
                                    532 ;	main.c: 296: if(count==2) {mang[2]= 48; ++count;}
      0083E7 7B 0B            [ 1]  533 	ld	a, (0x0b, sp)
      0083E9 A1 02            [ 1]  534 	cp	a, #0x02
      0083EB 26 CA            [ 1]  535 	jrne	00103$
      0083ED A6 30            [ 1]  536 	ld	a, #0x30
      0083EF 6B 07            [ 1]  537 	ld	(0x07, sp), a
      0083F1 0C 0B            [ 1]  538 	inc	(0x0b, sp)
      0083F3 20 C2            [ 2]  539 	jra	00103$
      0083F5                        540 00105$:
                                    541 ;	main.c: 298: I2C_start();
      0083F5 CD 85 52         [ 4]  542 	call	_I2C_start
                                    543 ;	main.c: 299: I2C_address(OLED_I2C_ADDR,I2C_DIRECTION_TX);
      0083F8 4B 00            [ 1]  544 	push	#0x00
      0083FA A6 78            [ 1]  545 	ld	a, #0x78
      0083FC CD 85 6F         [ 4]  546 	call	_I2C_address
                                    547 ;	main.c: 300: I2C_write(OLED_DAT_MODE);
      0083FF A6 40            [ 1]  548 	ld	a, #0x40
      008401 CD 85 89         [ 4]  549 	call	_I2C_write
                                    550 ;	main.c: 301: while(count != 0){
      008404 7B 0B            [ 1]  551 	ld	a, (0x0b, sp)
      008406 6B 0A            [ 1]  552 	ld	(0x0a, sp), a
      008408                        553 00107$:
      008408 0D 0A            [ 1]  554 	tnz	(0x0a, sp)
      00840A 27 43            [ 1]  555 	jreq	00109$
                                    556 ;	main.c: 302: uint16_t offset = mang[count-1] + 16;
      00840C 7B 0A            [ 1]  557 	ld	a, (0x0a, sp)
      00840E 4A               [ 1]  558 	dec	a
      00840F 6B 04            [ 1]  559 	ld	(0x04, sp), a
      008411 49               [ 1]  560 	rlc	a
      008412 4F               [ 1]  561 	clr	a
      008413 A2 00            [ 1]  562 	sbc	a, #0x00
      008415 6B 03            [ 1]  563 	ld	(0x03, sp), a
      008417 96               [ 1]  564 	ldw	x, sp
      008418 1C 00 05         [ 2]  565 	addw	x, #5
      00841B 72 FB 03         [ 2]  566 	addw	x, (0x03, sp)
      00841E F6               [ 1]  567 	ld	a, (x)
      00841F 5F               [ 1]  568 	clrw	x
      008420 97               [ 1]  569 	ld	xl, a
      008421 1C 00 10         [ 2]  570 	addw	x, #0x0010
                                    571 ;	main.c: 303: offset += offset << 2;
      008424 1F 03            [ 2]  572 	ldw	(0x03, sp), x
      008426 58               [ 2]  573 	sllw	x
      008427 58               [ 2]  574 	sllw	x
      008428 72 FB 03         [ 2]  575 	addw	x, (0x03, sp)
                                    576 ;	main.c: 304: I2C_write(0x00);
      00842B 89               [ 2]  577 	pushw	x
      00842C 4F               [ 1]  578 	clr	a
      00842D CD 85 89         [ 4]  579 	call	_I2C_write
      008430 85               [ 2]  580 	popw	x
                                    581 ;	main.c: 305: for(uint8_t i = 5; i;i--){ I2C_write(OLED_FONT[offset++]); }
      008431 A6 05            [ 1]  582 	ld	a, #0x05
      008433 6B 0B            [ 1]  583 	ld	(0x0b, sp), a
      008435                        584 00111$:
      008435 0D 0B            [ 1]  585 	tnz	(0x0b, sp)
      008437 27 12            [ 1]  586 	jreq	00106$
      008439 90 93            [ 1]  587 	ldw	y, x
      00843B 72 A9 80 3B      [ 2]  588 	addw	y, #(_OLED_FONT+0)
      00843F 5C               [ 1]  589 	incw	x
      008440 90 F6            [ 1]  590 	ld	a, (y)
      008442 89               [ 2]  591 	pushw	x
      008443 CD 85 89         [ 4]  592 	call	_I2C_write
      008446 85               [ 2]  593 	popw	x
      008447 0A 0B            [ 1]  594 	dec	(0x0b, sp)
      008449 20 EA            [ 2]  595 	jra	00111$
      00844B                        596 00106$:
                                    597 ;	main.c: 306: --count;
      00844B 0A 0A            [ 1]  598 	dec	(0x0a, sp)
      00844D 20 B9            [ 2]  599 	jra	00107$
      00844F                        600 00109$:
                                    601 ;	main.c: 308: I2C_stop();		
      00844F CD 85 64         [ 4]  602 	call	_I2C_stop
                                    603 ;	main.c: 310: }
      008452 1E 0C            [ 2]  604 	ldw	x, (12, sp)
      008454 5B 11            [ 2]  605 	addw	sp, #17
      008456 FC               [ 2]  606 	jp	(x)
                                    607 ;	main.c: 311: void OLED_printOneNumber(uint8_t num)
                                    608 ;	-----------------------------------------
                                    609 ;	 function OLED_printOneNumber
                                    610 ;	-----------------------------------------
      008457                        611 _OLED_printOneNumber:
      008457 52 02            [ 2]  612 	sub	sp, #2
                                    613 ;	main.c: 313: uint16_t offset = num + 16;
      008459 5F               [ 1]  614 	clrw	x
      00845A 97               [ 1]  615 	ld	xl, a
      00845B 1C 00 10         [ 2]  616 	addw	x, #0x0010
                                    617 ;	main.c: 314: offset += offset << 2;
      00845E 1F 01            [ 2]  618 	ldw	(0x01, sp), x
      008460 58               [ 2]  619 	sllw	x
      008461 58               [ 2]  620 	sllw	x
      008462 72 FB 01         [ 2]  621 	addw	x, (0x01, sp)
      008465 1F 01            [ 2]  622 	ldw	(0x01, sp), x
                                    623 ;	main.c: 315: I2C_start();
      008467 CD 85 52         [ 4]  624 	call	_I2C_start
                                    625 ;	main.c: 316: I2C_address(OLED_I2C_ADDR, OLED_DAT_MODE);
      00846A 4B 01            [ 1]  626 	push	#0x01
      00846C A6 78            [ 1]  627 	ld	a, #0x78
      00846E CD 85 6F         [ 4]  628 	call	_I2C_address
                                    629 ;	main.c: 317: I2C_write(0x00);
      008471 4F               [ 1]  630 	clr	a
      008472 CD 85 89         [ 4]  631 	call	_I2C_write
                                    632 ;	main.c: 318: for(uint8_t i = 5; i;i--){ I2C_write(OLED_FONT[offset++]); }
      008475 1E 01            [ 2]  633 	ldw	x, (0x01, sp)
      008477 A6 05            [ 1]  634 	ld	a, #0x05
      008479 6B 02            [ 1]  635 	ld	(0x02, sp), a
      00847B                        636 00103$:
      00847B 0D 02            [ 1]  637 	tnz	(0x02, sp)
      00847D 27 12            [ 1]  638 	jreq	00101$
      00847F 90 93            [ 1]  639 	ldw	y, x
      008481 72 A9 80 3B      [ 2]  640 	addw	y, #(_OLED_FONT+0)
      008485 5C               [ 1]  641 	incw	x
      008486 90 F6            [ 1]  642 	ld	a, (y)
      008488 89               [ 2]  643 	pushw	x
      008489 CD 85 89         [ 4]  644 	call	_I2C_write
      00848C 85               [ 2]  645 	popw	x
      00848D 0A 02            [ 1]  646 	dec	(0x02, sp)
      00848F 20 EA            [ 2]  647 	jra	00103$
      008491                        648 00101$:
                                    649 ;	main.c: 319: I2C_stop();
      008491 5B 02            [ 2]  650 	addw	sp, #2
                                    651 ;	main.c: 320: }
      008493 CC 85 64         [ 2]  652 	jp	_I2C_stop
                                    653 ;	main.c: 321: void OLED_cursor(uint8_t xpos, uint8_t ypos)
                                    654 ;	-----------------------------------------
                                    655 ;	 function OLED_cursor
                                    656 ;	-----------------------------------------
      008496                        657 _OLED_cursor:
      008496 88               [ 1]  658 	push	a
      008497 6B 01            [ 1]  659 	ld	(0x01, sp), a
                                    660 ;	main.c: 323: I2C_start();
      008499 CD 85 52         [ 4]  661 	call	_I2C_start
                                    662 ;	main.c: 324: I2C_address(OLED_I2C_ADDR, I2C_DIRECTION_TX);
      00849C 4B 00            [ 1]  663 	push	#0x00
      00849E A6 78            [ 1]  664 	ld	a, #0x78
      0084A0 CD 85 6F         [ 4]  665 	call	_I2C_address
                                    666 ;	main.c: 325: I2C_write(OLED_CMD_MODE);
      0084A3 4F               [ 1]  667 	clr	a
      0084A4 CD 85 89         [ 4]  668 	call	_I2C_write
                                    669 ;	main.c: 326: I2C_write(xpos & 0x0F);
      0084A7 7B 01            [ 1]  670 	ld	a, (0x01, sp)
      0084A9 A4 0F            [ 1]  671 	and	a, #0x0f
      0084AB CD 85 89         [ 4]  672 	call	_I2C_write
                                    673 ;	main.c: 327: I2C_write(0x10 | (xpos >> 4));
      0084AE 7B 01            [ 1]  674 	ld	a, (0x01, sp)
      0084B0 4E               [ 1]  675 	swap	a
      0084B1 A4 0F            [ 1]  676 	and	a, #0x0f
      0084B3 AA 10            [ 1]  677 	or	a, #0x10
      0084B5 CD 85 89         [ 4]  678 	call	_I2C_write
                                    679 ;	main.c: 328: I2C_write(0xB0 | (ypos & 0x07));
      0084B8 7B 04            [ 1]  680 	ld	a, (0x04, sp)
      0084BA A4 07            [ 1]  681 	and	a, #0x07
      0084BC AA B0            [ 1]  682 	or	a, #0xb0
      0084BE CD 85 89         [ 4]  683 	call	_I2C_write
                                    684 ;	main.c: 329: I2C_stop();
      0084C1 1E 02            [ 2]  685 	ldw	x, (2, sp)
      0084C3 1F 03            [ 2]  686 	ldw	(3, sp), x
      0084C5 5B 02            [ 2]  687 	addw	sp, #2
      0084C7 CC 85 64         [ 2]  688 	jp	_I2C_stop
                                    689 ;	main.c: 330: }
      0084CA 84               [ 1]  690 	pop	a
      0084CB 85               [ 2]  691 	popw	x
      0084CC 84               [ 1]  692 	pop	a
      0084CD FC               [ 2]  693 	jp	(x)
                                    694 ;	main.c: 331: void OLED_clear(void)
                                    695 ;	-----------------------------------------
                                    696 ;	 function OLED_clear
                                    697 ;	-----------------------------------------
      0084CE                        698 _OLED_clear:
                                    699 ;	main.c: 333: OLED_cursor(0,0);
      0084CE 4B 00            [ 1]  700 	push	#0x00
      0084D0 4F               [ 1]  701 	clr	a
      0084D1 CD 84 96         [ 4]  702 	call	_OLED_cursor
                                    703 ;	main.c: 334: I2C_start();
      0084D4 CD 85 52         [ 4]  704 	call	_I2C_start
                                    705 ;	main.c: 335: I2C_address(OLED_I2C_ADDR, I2C_DIRECTION_TX);
      0084D7 4B 00            [ 1]  706 	push	#0x00
      0084D9 A6 78            [ 1]  707 	ld	a, #0x78
      0084DB CD 85 6F         [ 4]  708 	call	_I2C_address
                                    709 ;	main.c: 336: I2C_write(OLED_DAT_MODE);
      0084DE A6 40            [ 1]  710 	ld	a, #0x40
      0084E0 CD 85 89         [ 4]  711 	call	_I2C_write
                                    712 ;	main.c: 337: for (uint16_t i=0;i<512;i++)
      0084E3 5F               [ 1]  713 	clrw	x
      0084E4                        714 00103$:
      0084E4 90 93            [ 1]  715 	ldw	y, x
      0084E6 90 A3 02 00      [ 2]  716 	cpw	y, #0x0200
      0084EA 25 03            [ 1]  717 	jrc	00118$
      0084EC CC 85 64         [ 2]  718 	jp	_I2C_stop
      0084EF                        719 00118$:
                                    720 ;	main.c: 339: I2C_write(0x00);
      0084EF 89               [ 2]  721 	pushw	x
      0084F0 4F               [ 1]  722 	clr	a
      0084F1 CD 85 89         [ 4]  723 	call	_I2C_write
      0084F4 85               [ 2]  724 	popw	x
                                    725 ;	main.c: 337: for (uint16_t i=0;i<512;i++)
      0084F5 5C               [ 1]  726 	incw	x
                                    727 ;	main.c: 341: I2C_stop();
                                    728 ;	main.c: 342: }
      0084F6 20 EC            [ 2]  729 	jra	00103$
                                    730 	.area CODE
                                    731 	.area CONST
      00802D                        732 _OLED_INIT_CMD:
      00802D A8                     733 	.db #0xa8	; 168
      00802E 1F                     734 	.db #0x1f	; 31
      00802F 22                     735 	.db #0x22	; 34
      008030 00                     736 	.db #0x00	; 0
      008031 03                     737 	.db #0x03	; 3
      008032 20                     738 	.db #0x20	; 32
      008033 00                     739 	.db #0x00	; 0
      008034 DA                     740 	.db #0xda	; 218
      008035 02                     741 	.db #0x02	; 2
      008036 8D                     742 	.db #0x8d	; 141
      008037 14                     743 	.db #0x14	; 20
      008038 AF                     744 	.db #0xaf	; 175
      008039 A1                     745 	.db #0xa1	; 161
      00803A C8                     746 	.db #0xc8	; 200
      00803B                        747 _OLED_FONT:
      00803B 00                     748 	.db #0x00	; 0
      00803C 00                     749 	.db #0x00	; 0
      00803D 00                     750 	.db #0x00	; 0
      00803E 00                     751 	.db #0x00	; 0
      00803F 00                     752 	.db #0x00	; 0
      008040 00                     753 	.db #0x00	; 0
      008041 00                     754 	.db #0x00	; 0
      008042 2F                     755 	.db #0x2f	; 47
      008043 00                     756 	.db #0x00	; 0
      008044 00                     757 	.db #0x00	; 0
      008045 00                     758 	.db #0x00	; 0
      008046 07                     759 	.db #0x07	; 7
      008047 00                     760 	.db #0x00	; 0
      008048 07                     761 	.db #0x07	; 7
      008049 00                     762 	.db #0x00	; 0
      00804A 14                     763 	.db #0x14	; 20
      00804B 7F                     764 	.db #0x7f	; 127
      00804C 14                     765 	.db #0x14	; 20
      00804D 7F                     766 	.db #0x7f	; 127
      00804E 14                     767 	.db #0x14	; 20
      00804F 24                     768 	.db #0x24	; 36
      008050 2A                     769 	.db #0x2a	; 42
      008051 7F                     770 	.db #0x7f	; 127
      008052 2A                     771 	.db #0x2a	; 42
      008053 12                     772 	.db #0x12	; 18
      008054 62                     773 	.db #0x62	; 98	'b'
      008055 64                     774 	.db #0x64	; 100	'd'
      008056 08                     775 	.db #0x08	; 8
      008057 13                     776 	.db #0x13	; 19
      008058 23                     777 	.db #0x23	; 35
      008059 36                     778 	.db #0x36	; 54	'6'
      00805A 49                     779 	.db #0x49	; 73	'I'
      00805B 55                     780 	.db #0x55	; 85	'U'
      00805C 22                     781 	.db #0x22	; 34
      00805D 50                     782 	.db #0x50	; 80	'P'
      00805E 00                     783 	.db #0x00	; 0
      00805F 05                     784 	.db #0x05	; 5
      008060 03                     785 	.db #0x03	; 3
      008061 00                     786 	.db #0x00	; 0
      008062 00                     787 	.db #0x00	; 0
      008063 00                     788 	.db #0x00	; 0
      008064 1C                     789 	.db #0x1c	; 28
      008065 22                     790 	.db #0x22	; 34
      008066 41                     791 	.db #0x41	; 65	'A'
      008067 00                     792 	.db #0x00	; 0
      008068 00                     793 	.db #0x00	; 0
      008069 41                     794 	.db #0x41	; 65	'A'
      00806A 22                     795 	.db #0x22	; 34
      00806B 1C                     796 	.db #0x1c	; 28
      00806C 00                     797 	.db #0x00	; 0
      00806D 14                     798 	.db #0x14	; 20
      00806E 08                     799 	.db #0x08	; 8
      00806F 3E                     800 	.db #0x3e	; 62
      008070 08                     801 	.db #0x08	; 8
      008071 14                     802 	.db #0x14	; 20
      008072 08                     803 	.db #0x08	; 8
      008073 08                     804 	.db #0x08	; 8
      008074 3E                     805 	.db #0x3e	; 62
      008075 08                     806 	.db #0x08	; 8
      008076 08                     807 	.db #0x08	; 8
      008077 00                     808 	.db #0x00	; 0
      008078 00                     809 	.db #0x00	; 0
      008079 A0                     810 	.db #0xa0	; 160
      00807A 60                     811 	.db #0x60	; 96
      00807B 00                     812 	.db #0x00	; 0
      00807C 08                     813 	.db #0x08	; 8
      00807D 08                     814 	.db #0x08	; 8
      00807E 08                     815 	.db #0x08	; 8
      00807F 08                     816 	.db #0x08	; 8
      008080 08                     817 	.db #0x08	; 8
      008081 00                     818 	.db #0x00	; 0
      008082 60                     819 	.db #0x60	; 96
      008083 60                     820 	.db #0x60	; 96
      008084 00                     821 	.db #0x00	; 0
      008085 00                     822 	.db #0x00	; 0
      008086 20                     823 	.db #0x20	; 32
      008087 10                     824 	.db #0x10	; 16
      008088 08                     825 	.db #0x08	; 8
      008089 04                     826 	.db #0x04	; 4
      00808A 02                     827 	.db #0x02	; 2
      00808B 3E                     828 	.db #0x3e	; 62
      00808C 51                     829 	.db #0x51	; 81	'Q'
      00808D 49                     830 	.db #0x49	; 73	'I'
      00808E 45                     831 	.db #0x45	; 69	'E'
      00808F 3E                     832 	.db #0x3e	; 62
      008090 00                     833 	.db #0x00	; 0
      008091 42                     834 	.db #0x42	; 66	'B'
      008092 7F                     835 	.db #0x7f	; 127
      008093 40                     836 	.db #0x40	; 64
      008094 00                     837 	.db #0x00	; 0
      008095 42                     838 	.db #0x42	; 66	'B'
      008096 61                     839 	.db #0x61	; 97	'a'
      008097 51                     840 	.db #0x51	; 81	'Q'
      008098 49                     841 	.db #0x49	; 73	'I'
      008099 46                     842 	.db #0x46	; 70	'F'
      00809A 21                     843 	.db #0x21	; 33
      00809B 41                     844 	.db #0x41	; 65	'A'
      00809C 45                     845 	.db #0x45	; 69	'E'
      00809D 4B                     846 	.db #0x4b	; 75	'K'
      00809E 31                     847 	.db #0x31	; 49	'1'
      00809F 18                     848 	.db #0x18	; 24
      0080A0 14                     849 	.db #0x14	; 20
      0080A1 12                     850 	.db #0x12	; 18
      0080A2 7F                     851 	.db #0x7f	; 127
      0080A3 10                     852 	.db #0x10	; 16
      0080A4 27                     853 	.db #0x27	; 39
      0080A5 45                     854 	.db #0x45	; 69	'E'
      0080A6 45                     855 	.db #0x45	; 69	'E'
      0080A7 45                     856 	.db #0x45	; 69	'E'
      0080A8 39                     857 	.db #0x39	; 57	'9'
      0080A9 3C                     858 	.db #0x3c	; 60
      0080AA 4A                     859 	.db #0x4a	; 74	'J'
      0080AB 49                     860 	.db #0x49	; 73	'I'
      0080AC 49                     861 	.db #0x49	; 73	'I'
      0080AD 30                     862 	.db #0x30	; 48	'0'
      0080AE 01                     863 	.db #0x01	; 1
      0080AF 71                     864 	.db #0x71	; 113	'q'
      0080B0 09                     865 	.db #0x09	; 9
      0080B1 05                     866 	.db #0x05	; 5
      0080B2 03                     867 	.db #0x03	; 3
      0080B3 36                     868 	.db #0x36	; 54	'6'
      0080B4 49                     869 	.db #0x49	; 73	'I'
      0080B5 49                     870 	.db #0x49	; 73	'I'
      0080B6 49                     871 	.db #0x49	; 73	'I'
      0080B7 36                     872 	.db #0x36	; 54	'6'
      0080B8 06                     873 	.db #0x06	; 6
      0080B9 49                     874 	.db #0x49	; 73	'I'
      0080BA 49                     875 	.db #0x49	; 73	'I'
      0080BB 29                     876 	.db #0x29	; 41
      0080BC 1E                     877 	.db #0x1e	; 30
      0080BD 00                     878 	.db #0x00	; 0
      0080BE 36                     879 	.db #0x36	; 54	'6'
      0080BF 36                     880 	.db #0x36	; 54	'6'
      0080C0 00                     881 	.db #0x00	; 0
      0080C1 00                     882 	.db #0x00	; 0
      0080C2 00                     883 	.db #0x00	; 0
      0080C3 56                     884 	.db #0x56	; 86	'V'
      0080C4 36                     885 	.db #0x36	; 54	'6'
      0080C5 00                     886 	.db #0x00	; 0
      0080C6 00                     887 	.db #0x00	; 0
      0080C7 08                     888 	.db #0x08	; 8
      0080C8 14                     889 	.db #0x14	; 20
      0080C9 22                     890 	.db #0x22	; 34
      0080CA 41                     891 	.db #0x41	; 65	'A'
      0080CB 00                     892 	.db #0x00	; 0
      0080CC 14                     893 	.db #0x14	; 20
      0080CD 14                     894 	.db #0x14	; 20
      0080CE 14                     895 	.db #0x14	; 20
      0080CF 14                     896 	.db #0x14	; 20
      0080D0 14                     897 	.db #0x14	; 20
      0080D1 00                     898 	.db #0x00	; 0
      0080D2 41                     899 	.db #0x41	; 65	'A'
      0080D3 22                     900 	.db #0x22	; 34
      0080D4 14                     901 	.db #0x14	; 20
      0080D5 08                     902 	.db #0x08	; 8
      0080D6 02                     903 	.db #0x02	; 2
      0080D7 01                     904 	.db #0x01	; 1
      0080D8 51                     905 	.db #0x51	; 81	'Q'
      0080D9 09                     906 	.db #0x09	; 9
      0080DA 06                     907 	.db #0x06	; 6
      0080DB 32                     908 	.db #0x32	; 50	'2'
      0080DC 49                     909 	.db #0x49	; 73	'I'
      0080DD 59                     910 	.db #0x59	; 89	'Y'
      0080DE 51                     911 	.db #0x51	; 81	'Q'
      0080DF 3E                     912 	.db #0x3e	; 62
      0080E0 7C                     913 	.db #0x7c	; 124
      0080E1 12                     914 	.db #0x12	; 18
      0080E2 11                     915 	.db #0x11	; 17
      0080E3 12                     916 	.db #0x12	; 18
      0080E4 7C                     917 	.db #0x7c	; 124
      0080E5 7F                     918 	.db #0x7f	; 127
      0080E6 49                     919 	.db #0x49	; 73	'I'
      0080E7 49                     920 	.db #0x49	; 73	'I'
      0080E8 49                     921 	.db #0x49	; 73	'I'
      0080E9 36                     922 	.db #0x36	; 54	'6'
      0080EA 3E                     923 	.db #0x3e	; 62
      0080EB 41                     924 	.db #0x41	; 65	'A'
      0080EC 41                     925 	.db #0x41	; 65	'A'
      0080ED 41                     926 	.db #0x41	; 65	'A'
      0080EE 22                     927 	.db #0x22	; 34
      0080EF 7F                     928 	.db #0x7f	; 127
      0080F0 41                     929 	.db #0x41	; 65	'A'
      0080F1 41                     930 	.db #0x41	; 65	'A'
      0080F2 22                     931 	.db #0x22	; 34
      0080F3 1C                     932 	.db #0x1c	; 28
      0080F4 7F                     933 	.db #0x7f	; 127
      0080F5 49                     934 	.db #0x49	; 73	'I'
      0080F6 49                     935 	.db #0x49	; 73	'I'
      0080F7 49                     936 	.db #0x49	; 73	'I'
      0080F8 41                     937 	.db #0x41	; 65	'A'
      0080F9 7F                     938 	.db #0x7f	; 127
      0080FA 09                     939 	.db #0x09	; 9
      0080FB 09                     940 	.db #0x09	; 9
      0080FC 09                     941 	.db #0x09	; 9
      0080FD 01                     942 	.db #0x01	; 1
      0080FE 3E                     943 	.db #0x3e	; 62
      0080FF 41                     944 	.db #0x41	; 65	'A'
      008100 49                     945 	.db #0x49	; 73	'I'
      008101 49                     946 	.db #0x49	; 73	'I'
      008102 7A                     947 	.db #0x7a	; 122	'z'
      008103 7F                     948 	.db #0x7f	; 127
      008104 08                     949 	.db #0x08	; 8
      008105 08                     950 	.db #0x08	; 8
      008106 08                     951 	.db #0x08	; 8
      008107 7F                     952 	.db #0x7f	; 127
      008108 00                     953 	.db #0x00	; 0
      008109 41                     954 	.db #0x41	; 65	'A'
      00810A 7F                     955 	.db #0x7f	; 127
      00810B 41                     956 	.db #0x41	; 65	'A'
      00810C 00                     957 	.db #0x00	; 0
      00810D 20                     958 	.db #0x20	; 32
      00810E 40                     959 	.db #0x40	; 64
      00810F 41                     960 	.db #0x41	; 65	'A'
      008110 3F                     961 	.db #0x3f	; 63
      008111 01                     962 	.db #0x01	; 1
      008112 7F                     963 	.db #0x7f	; 127
      008113 08                     964 	.db #0x08	; 8
      008114 14                     965 	.db #0x14	; 20
      008115 22                     966 	.db #0x22	; 34
      008116 41                     967 	.db #0x41	; 65	'A'
      008117 7F                     968 	.db #0x7f	; 127
      008118 40                     969 	.db #0x40	; 64
      008119 40                     970 	.db #0x40	; 64
      00811A 40                     971 	.db #0x40	; 64
      00811B 40                     972 	.db #0x40	; 64
      00811C 7F                     973 	.db #0x7f	; 127
      00811D 02                     974 	.db #0x02	; 2
      00811E 0C                     975 	.db #0x0c	; 12
      00811F 02                     976 	.db #0x02	; 2
      008120 7F                     977 	.db #0x7f	; 127
      008121 7F                     978 	.db #0x7f	; 127
      008122 04                     979 	.db #0x04	; 4
      008123 08                     980 	.db #0x08	; 8
      008124 10                     981 	.db #0x10	; 16
      008125 7F                     982 	.db #0x7f	; 127
      008126 3E                     983 	.db #0x3e	; 62
      008127 41                     984 	.db #0x41	; 65	'A'
      008128 41                     985 	.db #0x41	; 65	'A'
      008129 41                     986 	.db #0x41	; 65	'A'
      00812A 3E                     987 	.db #0x3e	; 62
      00812B 7F                     988 	.db #0x7f	; 127
      00812C 09                     989 	.db #0x09	; 9
      00812D 09                     990 	.db #0x09	; 9
      00812E 09                     991 	.db #0x09	; 9
      00812F 06                     992 	.db #0x06	; 6
      008130 3E                     993 	.db #0x3e	; 62
      008131 41                     994 	.db #0x41	; 65	'A'
      008132 51                     995 	.db #0x51	; 81	'Q'
      008133 21                     996 	.db #0x21	; 33
      008134 5E                     997 	.db #0x5e	; 94
      008135 7F                     998 	.db #0x7f	; 127
      008136 09                     999 	.db #0x09	; 9
      008137 19                    1000 	.db #0x19	; 25
      008138 29                    1001 	.db #0x29	; 41
      008139 46                    1002 	.db #0x46	; 70	'F'
      00813A 46                    1003 	.db #0x46	; 70	'F'
      00813B 49                    1004 	.db #0x49	; 73	'I'
      00813C 49                    1005 	.db #0x49	; 73	'I'
      00813D 49                    1006 	.db #0x49	; 73	'I'
      00813E 31                    1007 	.db #0x31	; 49	'1'
      00813F 01                    1008 	.db #0x01	; 1
      008140 01                    1009 	.db #0x01	; 1
      008141 7F                    1010 	.db #0x7f	; 127
      008142 01                    1011 	.db #0x01	; 1
      008143 01                    1012 	.db #0x01	; 1
      008144 3F                    1013 	.db #0x3f	; 63
      008145 40                    1014 	.db #0x40	; 64
      008146 40                    1015 	.db #0x40	; 64
      008147 40                    1016 	.db #0x40	; 64
      008148 3F                    1017 	.db #0x3f	; 63
      008149 1F                    1018 	.db #0x1f	; 31
      00814A 20                    1019 	.db #0x20	; 32
      00814B 40                    1020 	.db #0x40	; 64
      00814C 20                    1021 	.db #0x20	; 32
      00814D 1F                    1022 	.db #0x1f	; 31
      00814E 3F                    1023 	.db #0x3f	; 63
      00814F 40                    1024 	.db #0x40	; 64
      008150 38                    1025 	.db #0x38	; 56	'8'
      008151 40                    1026 	.db #0x40	; 64
      008152 3F                    1027 	.db #0x3f	; 63
      008153 63                    1028 	.db #0x63	; 99	'c'
      008154 14                    1029 	.db #0x14	; 20
      008155 08                    1030 	.db #0x08	; 8
      008156 14                    1031 	.db #0x14	; 20
      008157 63                    1032 	.db #0x63	; 99	'c'
      008158 07                    1033 	.db #0x07	; 7
      008159 08                    1034 	.db #0x08	; 8
      00815A 70                    1035 	.db #0x70	; 112	'p'
      00815B 08                    1036 	.db #0x08	; 8
      00815C 07                    1037 	.db #0x07	; 7
      00815D 61                    1038 	.db #0x61	; 97	'a'
      00815E 51                    1039 	.db #0x51	; 81	'Q'
      00815F 49                    1040 	.db #0x49	; 73	'I'
      008160 45                    1041 	.db #0x45	; 69	'E'
      008161 43                    1042 	.db #0x43	; 67	'C'
      008162 00                    1043 	.db #0x00	; 0
      008163 7F                    1044 	.db #0x7f	; 127
      008164 41                    1045 	.db #0x41	; 65	'A'
      008165 41                    1046 	.db #0x41	; 65	'A'
      008166 00                    1047 	.db #0x00	; 0
      008167 02                    1048 	.db #0x02	; 2
      008168 04                    1049 	.db #0x04	; 4
      008169 08                    1050 	.db #0x08	; 8
      00816A 10                    1051 	.db #0x10	; 16
      00816B 20                    1052 	.db #0x20	; 32
      00816C 00                    1053 	.db #0x00	; 0
      00816D 41                    1054 	.db #0x41	; 65	'A'
      00816E 41                    1055 	.db #0x41	; 65	'A'
      00816F 7F                    1056 	.db #0x7f	; 127
      008170 00                    1057 	.db #0x00	; 0
      008171 04                    1058 	.db #0x04	; 4
      008172 02                    1059 	.db #0x02	; 2
      008173 01                    1060 	.db #0x01	; 1
      008174 02                    1061 	.db #0x02	; 2
      008175 04                    1062 	.db #0x04	; 4
      008176 40                    1063 	.db #0x40	; 64
      008177 40                    1064 	.db #0x40	; 64
      008178 40                    1065 	.db #0x40	; 64
      008179 40                    1066 	.db #0x40	; 64
      00817A 40                    1067 	.db #0x40	; 64
      00817B 00                    1068 	.db #0x00	; 0
      00817C 60                    1069 	.db #0x60	; 96
      00817D 60                    1070 	.db #0x60	; 96
      00817E 00                    1071 	.db #0x00	; 0
      00817F 00                    1072 	.db #0x00	; 0
      008180                       1073 _Message1:
      008180 44 4F 20 41 4E        1074 	.ascii "DO AN"
      008185 00                    1075 	.db 0x00
      008186                       1076 _Message2:
      008186 53 4F 20 42 55 4F 43  1077 	.ascii "SO BUOC="
             3D
      00818E 00                    1078 	.db 0x00
                                   1079 	.area CONST
      00818F                       1080 ___str_0:
      00818F 47 48 49              1081 	.ascii "GHI"
      008192 00                    1082 	.db 0x00
                                   1083 	.area CODE
                                   1084 	.area INITIALIZER
                                   1085 	.area CABS (ABS)
