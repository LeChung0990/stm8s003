                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.3.0 #14184 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module mylibrary
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _UART1_ClearFlag
                                     12 	.globl _UART1_GetFlagStatus
                                     13 	.globl _UART1_SendData8
                                     14 	.globl _UART1_Cmd
                                     15 	.globl _UART1_Init
                                     16 	.globl _TIM4_ClearFlag
                                     17 	.globl _TIM4_GetFlagStatus
                                     18 	.globl _TIM4_SetCounter
                                     19 	.globl _TIM4_Cmd
                                     20 	.globl _TIM4_TimeBaseInit
                                     21 	.globl _I2C_GetFlagStatus
                                     22 	.globl _I2C_CheckEvent
                                     23 	.globl _I2C_SendData
                                     24 	.globl _I2C_Send7bitAddress
                                     25 	.globl _I2C_GenerateSTOP
                                     26 	.globl _I2C_GenerateSTART
                                     27 	.globl _I2C_Cmd
                                     28 	.globl _I2C_Init
                                     29 	.globl _I2C_DeInit
                                     30 	.globl _CLK_GetClockFreq
                                     31 	.globl _CLK_PeripheralClockConfig
                                     32 	.globl _delay_msSetup
                                     33 	.globl _delay_ms
                                     34 	.globl _UART1_Setup
                                     35 	.globl _UART1_number
                                     36 	.globl _UART1_String
                                     37 	.globl _I2C_init
                                     38 	.globl _I2C_start
                                     39 	.globl _I2C_address
                                     40 	.globl _I2C_write
                                     41 	.globl _I2C_stop
                                     42 ;--------------------------------------------------------
                                     43 ; ram data
                                     44 ;--------------------------------------------------------
                                     45 	.area DATA
                                     46 ;--------------------------------------------------------
                                     47 ; ram data
                                     48 ;--------------------------------------------------------
                                     49 	.area INITIALIZED
                                     50 ;--------------------------------------------------------
                                     51 ; absolute external ram data
                                     52 ;--------------------------------------------------------
                                     53 	.area DABS (ABS)
                                     54 
                                     55 ; default segment ordering for linker
                                     56 	.area HOME
                                     57 	.area GSINIT
                                     58 	.area GSFINAL
                                     59 	.area CONST
                                     60 	.area INITIALIZER
                                     61 	.area CODE
                                     62 
                                     63 ;--------------------------------------------------------
                                     64 ; global & static initialisations
                                     65 ;--------------------------------------------------------
                                     66 	.area HOME
                                     67 	.area GSINIT
                                     68 	.area GSFINAL
                                     69 	.area GSINIT
                                     70 ;--------------------------------------------------------
                                     71 ; Home
                                     72 ;--------------------------------------------------------
                                     73 	.area HOME
                                     74 	.area HOME
                                     75 ;--------------------------------------------------------
                                     76 ; code
                                     77 ;--------------------------------------------------------
                                     78 	.area CODE
                                     79 ;	mylibrary.c: 4: void delay_msSetup(void)
                                     80 ;	-----------------------------------------
                                     81 ;	 function delay_msSetup
                                     82 ;	-----------------------------------------
      00910D                         83 _delay_msSetup:
                                     84 ;	mylibrary.c: 6: TIM4_TimeBaseInit(TIM4_PRESCALER_128, 125 - 1);
      00910D 4B 7C            [ 1]   85 	push	#0x7c
      00910F A6 07            [ 1]   86 	ld	a, #0x07
      009111 CD 83 FA         [ 4]   87 	call	_TIM4_TimeBaseInit
                                     88 ;	mylibrary.c: 7: TIM4_Cmd(ENABLE);
      009114 A6 01            [ 1]   89 	ld	a, #0x01
                                     90 ;	mylibrary.c: 8: }
      009116 CC 84 06         [ 2]   91 	jp	_TIM4_Cmd
                                     92 ;	mylibrary.c: 9: void delay_ms(uint16_t u16Delay)
                                     93 ;	-----------------------------------------
                                     94 ;	 function delay_ms
                                     95 ;	-----------------------------------------
      009119                         96 _delay_ms:
      009119 52 02            [ 2]   97 	sub	sp, #2
                                     98 ;	mylibrary.c: 11: while (u16Delay) {
      00911B 1F 01            [ 2]   99 	ldw	(0x01, sp), x
      00911D                        100 00104$:
      00911D 1E 01            [ 2]  101 	ldw	x, (0x01, sp)
      00911F 27 18            [ 1]  102 	jreq	00107$
                                    103 ;	mylibrary.c: 12: TIM4_SetCounter(0);
      009121 4F               [ 1]  104 	clr	a
      009122 CD 84 AB         [ 4]  105 	call	_TIM4_SetCounter
                                    106 ;	mylibrary.c: 13: TIM4_ClearFlag(TIM4_FLAG_UPDATE);
      009125 A6 01            [ 1]  107 	ld	a, #0x01
      009127 CD 84 CB         [ 4]  108 	call	_TIM4_ClearFlag
                                    109 ;	mylibrary.c: 14: while (TIM4_GetFlagStatus(TIM4_FLAG_UPDATE) == RESET) {}
      00912A                        110 00101$:
      00912A A6 01            [ 1]  111 	ld	a, #0x01
      00912C CD 84 BB         [ 4]  112 	call	_TIM4_GetFlagStatus
      00912F 4D               [ 1]  113 	tnz	a
      009130 27 F8            [ 1]  114 	jreq	00101$
                                    115 ;	mylibrary.c: 15: --u16Delay;
      009132 1E 01            [ 2]  116 	ldw	x, (0x01, sp)
      009134 5A               [ 2]  117 	decw	x
      009135 1F 01            [ 2]  118 	ldw	(0x01, sp), x
      009137 20 E4            [ 2]  119 	jra	00104$
      009139                        120 00107$:
                                    121 ;	mylibrary.c: 17: }
      009139 5B 02            [ 2]  122 	addw	sp, #2
      00913B 81               [ 4]  123 	ret
                                    124 ;	mylibrary.c: 22: void UART1_Setup(void)
                                    125 ;	-----------------------------------------
                                    126 ;	 function UART1_Setup
                                    127 ;	-----------------------------------------
      00913C                        128 _UART1_Setup:
                                    129 ;	mylibrary.c: 24: UART1_Init(9600, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, 
      00913C 4B 0C            [ 1]  130 	push	#0x0c
      00913E 4B 80            [ 1]  131 	push	#0x80
      009140 4B 00            [ 1]  132 	push	#0x00
      009142 4B 00            [ 1]  133 	push	#0x00
      009144 4B 00            [ 1]  134 	push	#0x00
      009146 4B 80            [ 1]  135 	push	#0x80
      009148 4B 25            [ 1]  136 	push	#0x25
      00914A 5F               [ 1]  137 	clrw	x
      00914B 89               [ 2]  138 	pushw	x
      00914C CD 89 95         [ 4]  139 	call	_UART1_Init
                                    140 ;	mylibrary.c: 26: UART1_Cmd(ENABLE);
      00914F A6 01            [ 1]  141 	ld	a, #0x01
                                    142 ;	mylibrary.c: 27: }
      009151 CC 8B 14         [ 2]  143 	jp	_UART1_Cmd
                                    144 ;	mylibrary.c: 28: void UART1_number(uint8_t data)
                                    145 ;	-----------------------------------------
                                    146 ;	 function UART1_number
                                    147 ;	-----------------------------------------
      009154                        148 _UART1_number:
                                    149 ;	mylibrary.c: 30: UART1_SendData8(48+data);
      009154 AB 30            [ 1]  150 	add	a, #0x30
      009156 CD 8C A5         [ 4]  151 	call	_UART1_SendData8
                                    152 ;	mylibrary.c: 31: while(UART1_GetFlagStatus(UART1_FLAG_TXE)==0){}
      009159                        153 00101$:
      009159 AE 00 80         [ 2]  154 	ldw	x, #0x0080
      00915C CD 8C E8         [ 4]  155 	call	_UART1_GetFlagStatus
      00915F 4D               [ 1]  156 	tnz	a
      009160 27 F7            [ 1]  157 	jreq	00101$
                                    158 ;	mylibrary.c: 32: UART1_ClearFlag(UART1_FLAG_TXE);
      009162 AE 00 80         [ 2]  159 	ldw	x, #0x0080
                                    160 ;	mylibrary.c: 33: }
      009165 CC 8D 28         [ 2]  161 	jp	_UART1_ClearFlag
                                    162 ;	mylibrary.c: 34: void UART1_String(const char *cy)
                                    163 ;	-----------------------------------------
                                    164 ;	 function UART1_String
                                    165 ;	-----------------------------------------
      009168                        166 _UART1_String:
      009168 52 02            [ 2]  167 	sub	sp, #2
                                    168 ;	mylibrary.c: 36: while(*cy)
      00916A 1F 01            [ 2]  169 	ldw	(0x01, sp), x
      00916C                        170 00104$:
      00916C 1E 01            [ 2]  171 	ldw	x, (0x01, sp)
      00916E F6               [ 1]  172 	ld	a, (x)
      00916F 27 19            [ 1]  173 	jreq	00107$
                                    174 ;	mylibrary.c: 38: UART1_SendData8(*cy);
      009171 CD 8C A5         [ 4]  175 	call	_UART1_SendData8
                                    176 ;	mylibrary.c: 39: while(UART1_GetFlagStatus(UART1_FLAG_TXE)==0){}
      009174                        177 00101$:
      009174 AE 00 80         [ 2]  178 	ldw	x, #0x0080
      009177 CD 8C E8         [ 4]  179 	call	_UART1_GetFlagStatus
      00917A 4D               [ 1]  180 	tnz	a
      00917B 27 F7            [ 1]  181 	jreq	00101$
                                    182 ;	mylibrary.c: 40: UART1_ClearFlag(UART1_FLAG_TXE);
      00917D AE 00 80         [ 2]  183 	ldw	x, #0x0080
      009180 CD 8D 28         [ 4]  184 	call	_UART1_ClearFlag
                                    185 ;	mylibrary.c: 41: cy++;
      009183 1E 01            [ 2]  186 	ldw	x, (0x01, sp)
      009185 5C               [ 1]  187 	incw	x
      009186 1F 01            [ 2]  188 	ldw	(0x01, sp), x
      009188 20 E2            [ 2]  189 	jra	00104$
      00918A                        190 00107$:
                                    191 ;	mylibrary.c: 43: }
      00918A 5B 02            [ 2]  192 	addw	sp, #2
      00918C 81               [ 4]  193 	ret
                                    194 ;	mylibrary.c: 48: void I2C_init(uint32_t I2C_CLOCK,uint8_t I2C_ADDR)
                                    195 ;	-----------------------------------------
                                    196 ;	 function I2C_init
                                    197 ;	-----------------------------------------
      00918D                        198 _I2C_init:
      00918D 88               [ 1]  199 	push	a
                                    200 ;	mylibrary.c: 51: Input_Clock = CLK_GetClockFreq()/1000000;
      00918E CD 87 9A         [ 4]  201 	call	_CLK_GetClockFreq
      009191 4B 40            [ 1]  202 	push	#0x40
      009193 4B 42            [ 1]  203 	push	#0x42
      009195 4B 0F            [ 1]  204 	push	#0x0f
      009197 4B 00            [ 1]  205 	push	#0x00
      009199 89               [ 2]  206 	pushw	x
      00919A 90 89            [ 2]  207 	pushw	y
      00919C CD 92 1E         [ 4]  208 	call	__divulong
      00919F 5B 08            [ 2]  209 	addw	sp, #8
      0091A1 9F               [ 1]  210 	ld	a, xl
      0091A2 6B 01            [ 1]  211 	ld	(0x01, sp), a
                                    212 ;	mylibrary.c: 52: I2C_DeInit();
      0091A4 CD 8D C4         [ 4]  213 	call	_I2C_DeInit
                                    214 ;	mylibrary.c: 53: CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
      0091A7 4B 01            [ 1]  215 	push	#0x01
      0091A9 4F               [ 1]  216 	clr	a
      0091AA CD 85 D4         [ 4]  217 	call	_CLK_PeripheralClockConfig
                                    218 ;	mylibrary.c: 54: I2C_Cmd(ENABLE);
      0091AD A6 01            [ 1]  219 	ld	a, #0x01
      0091AF CD 8F 15         [ 4]  220 	call	_I2C_Cmd
                                    221 ;	mylibrary.c: 55: I2C_Init(I2C_CLOCK, I2C_ADDR, I2C_DUTYCYCLE_2, I2C_ACK_CURR, I2C_ADDMODE_7BIT, Input_Clock);
      0091B2 5F               [ 1]  222 	clrw	x
      0091B3 7B 08            [ 1]  223 	ld	a, (0x08, sp)
      0091B5 97               [ 1]  224 	ld	xl, a
      0091B6 7B 01            [ 1]  225 	ld	a, (0x01, sp)
      0091B8 88               [ 1]  226 	push	a
      0091B9 4B 00            [ 1]  227 	push	#0x00
      0091BB 4B 01            [ 1]  228 	push	#0x01
      0091BD 4B 00            [ 1]  229 	push	#0x00
      0091BF 89               [ 2]  230 	pushw	x
      0091C0 1E 0C            [ 2]  231 	ldw	x, (0x0c, sp)
      0091C2 89               [ 2]  232 	pushw	x
      0091C3 1E 0C            [ 2]  233 	ldw	x, (0x0c, sp)
      0091C5 89               [ 2]  234 	pushw	x
      0091C6 CD 8D E9         [ 4]  235 	call	_I2C_Init
                                    236 ;	mylibrary.c: 56: }
      0091C9 1E 02            [ 2]  237 	ldw	x, (2, sp)
      0091CB 5B 08            [ 2]  238 	addw	sp, #8
      0091CD FC               [ 2]  239 	jp	(x)
                                    240 ;	mylibrary.c: 57: void I2C_start(void)
                                    241 ;	-----------------------------------------
                                    242 ;	 function I2C_start
                                    243 ;	-----------------------------------------
      0091CE                        244 _I2C_start:
                                    245 ;	mylibrary.c: 60: while(I2C_GetFlagStatus( I2C_FLAG_BUSBUSY)==SET);
      0091CE                        246 00101$:
      0091CE AE 03 02         [ 2]  247 	ldw	x, #0x0302
      0091D1 CD 90 86         [ 4]  248 	call	_I2C_GetFlagStatus
      0091D4 4D               [ 1]  249 	tnz	a
      0091D5 26 F7            [ 1]  250 	jrne	00101$
                                    251 ;	mylibrary.c: 61: I2C_GenerateSTART(ENABLE);
      0091D7 A6 01            [ 1]  252 	ld	a, #0x01
      0091D9 CD 8F 45         [ 4]  253 	call	_I2C_GenerateSTART
                                    254 ;	mylibrary.c: 62: while(!I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT));
      0091DC                        255 00104$:
      0091DC AE 03 01         [ 2]  256 	ldw	x, #0x0301
      0091DF CD 90 1B         [ 4]  257 	call	_I2C_CheckEvent
      0091E2 4D               [ 1]  258 	tnz	a
      0091E3 27 F7            [ 1]  259 	jreq	00104$
                                    260 ;	mylibrary.c: 63: }
      0091E5 81               [ 4]  261 	ret
                                    262 ;	mylibrary.c: 64: void I2C_address(uint8_t I2C_ADDR, uint8_t mode)
                                    263 ;	-----------------------------------------
                                    264 ;	 function I2C_address
                                    265 ;	-----------------------------------------
      0091E6                        266 _I2C_address:
                                    267 ;	mylibrary.c: 67: I2C_Send7bitAddress((uint8_t)I2C_ADDR,I2C_DIRECTION_TX);
      0091E6 4B 00            [ 1]  268 	push	#0x00
      0091E8 CD 90 07         [ 4]  269 	call	_I2C_Send7bitAddress
                                    270 ;	mylibrary.c: 70: while(!I2C_CheckEvent( I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
      0091EB                        271 00101$:
      0091EB AE 07 82         [ 2]  272 	ldw	x, #0x0782
      0091EE CD 90 1B         [ 4]  273 	call	_I2C_CheckEvent
      0091F1 4D               [ 1]  274 	tnz	a
      0091F2 27 F7            [ 1]  275 	jreq	00101$
                                    276 ;	mylibrary.c: 73: I2C_SendData(mode);
      0091F4 7B 03            [ 1]  277 	ld	a, (0x03, sp)
      0091F6 CD 90 17         [ 4]  278 	call	_I2C_SendData
                                    279 ;	mylibrary.c: 76: while(!I2C_CheckEvent( I2C_EVENT_MASTER_BYTE_TRANSMITTED));
      0091F9                        280 00104$:
      0091F9 AE 07 84         [ 2]  281 	ldw	x, #0x0784
      0091FC CD 90 1B         [ 4]  282 	call	_I2C_CheckEvent
      0091FF 4D               [ 1]  283 	tnz	a
      009200 27 F7            [ 1]  284 	jreq	00104$
                                    285 ;	mylibrary.c: 77: }
      009202 85               [ 2]  286 	popw	x
      009203 84               [ 1]  287 	pop	a
      009204 FC               [ 2]  288 	jp	(x)
                                    289 ;	mylibrary.c: 78: void I2C_write(uint8_t data)
                                    290 ;	-----------------------------------------
                                    291 ;	 function I2C_write
                                    292 ;	-----------------------------------------
      009205                        293 _I2C_write:
                                    294 ;	mylibrary.c: 81: I2C_SendData(data);
      009205 CD 90 17         [ 4]  295 	call	_I2C_SendData
                                    296 ;	mylibrary.c: 84: while(!I2C_GetFlagStatus( I2C_FLAG_TRANSFERFINISHED));
      009208                        297 00101$:
      009208 AE 01 04         [ 2]  298 	ldw	x, #0x0104
      00920B CD 90 86         [ 4]  299 	call	_I2C_GetFlagStatus
      00920E 4D               [ 1]  300 	tnz	a
      00920F 27 F7            [ 1]  301 	jreq	00101$
                                    302 ;	mylibrary.c: 85: }
      009211 81               [ 4]  303 	ret
                                    304 ;	mylibrary.c: 86: void I2C_stop(void)
                                    305 ;	-----------------------------------------
                                    306 ;	 function I2C_stop
                                    307 ;	-----------------------------------------
      009212                        308 _I2C_stop:
                                    309 ;	mylibrary.c: 89: I2C_GenerateSTOP(ENABLE);
      009212 A6 01            [ 1]  310 	ld	a, #0x01
      009214 CD 8F 5D         [ 4]  311 	call	_I2C_GenerateSTOP
                                    312 ;	mylibrary.c: 91: I2C->SR1;       I2C->SR3;
      009217 C6 52 17         [ 1]  313 	ld	a, 0x5217
      00921A C6 52 19         [ 1]  314 	ld	a, 0x5219
                                    315 ;	mylibrary.c: 92: }
      00921D 81               [ 4]  316 	ret
                                    317 	.area CODE
                                    318 	.area CONST
                                    319 	.area INITIALIZER
                                    320 	.area CABS (ABS)
