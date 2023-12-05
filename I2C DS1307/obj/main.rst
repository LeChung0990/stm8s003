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
                                     14 	.globl _I2C_GetFlagStatus
                                     15 	.globl _I2C_CheckEvent
                                     16 	.globl _I2C_SendData
                                     17 	.globl _I2C_Send7bitAddress
                                     18 	.globl _I2C_GenerateSTOP
                                     19 	.globl _I2C_GenerateSTART
                                     20 	.globl _I2C_Cmd
                                     21 	.globl _I2C_Init
                                     22 	.globl _I2C_DeInit
                                     23 	.globl _CLK_GetClockFreq
                                     24 	.globl _CLK_HSIPrescalerConfig
                                     25 	.globl _CLK_PeripheralClockConfig
                                     26 	.globl _I2C_init
                                     27 	.globl _I2C_start
                                     28 	.globl _I2C_address
                                     29 	.globl _I2C_write
                                     30 	.globl _I2C_stop
                                     31 	.globl _OLED_init
                                     32 	.globl _OLED_printC
                                     33 	.globl _OLED_cursor
                                     34 	.globl _OLED_clear
                                     35 ;--------------------------------------------------------
                                     36 ; ram data
                                     37 ;--------------------------------------------------------
                                     38 	.area DATA
                                     39 ;--------------------------------------------------------
                                     40 ; ram data
                                     41 ;--------------------------------------------------------
                                     42 	.area INITIALIZED
                                     43 ;--------------------------------------------------------
                                     44 ; Stack segment in internal ram
                                     45 ;--------------------------------------------------------
                                     46 	.area SSEG
      000001                         47 __start__stack:
      000001                         48 	.ds	1
                                     49 
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
                                     64 ; interrupt vector
                                     65 ;--------------------------------------------------------
                                     66 	.area HOME
      008000                         67 __interrupt_vect:
      008000 82 00 80 07             68 	int s_GSINIT ; reset
                                     69 ;--------------------------------------------------------
                                     70 ; global & static initialisations
                                     71 ;--------------------------------------------------------
                                     72 	.area HOME
                                     73 	.area GSINIT
                                     74 	.area GSFINAL
                                     75 	.area GSINIT
      008007 CD 8B 56         [ 4]   76 	call	___sdcc_external_startup
      00800A 4D               [ 1]   77 	tnz	a
      00800B 27 03            [ 1]   78 	jreq	__sdcc_init_data
      00800D CC 80 04         [ 2]   79 	jp	__sdcc_program_startup
      008010                         80 __sdcc_init_data:
                                     81 ; stm8_genXINIT() start
      008010 AE 00 00         [ 2]   82 	ldw x, #l_DATA
      008013 27 07            [ 1]   83 	jreq	00002$
      008015                         84 00001$:
      008015 72 4F 00 00      [ 1]   85 	clr (s_DATA - 1, x)
      008019 5A               [ 2]   86 	decw x
      00801A 26 F9            [ 1]   87 	jrne	00001$
      00801C                         88 00002$:
      00801C AE 00 00         [ 2]   89 	ldw	x, #l_INITIALIZER
      00801F 27 09            [ 1]   90 	jreq	00004$
      008021                         91 00003$:
      008021 D6 80 C3         [ 1]   92 	ld	a, (s_INITIALIZER - 1, x)
      008024 D7 00 00         [ 1]   93 	ld	(s_INITIALIZED - 1, x), a
      008027 5A               [ 2]   94 	decw	x
      008028 26 F7            [ 1]   95 	jrne	00003$
      00802A                         96 00004$:
                                     97 ; stm8_genXINIT() end
                                     98 	.area GSFINAL
      00802A CC 80 04         [ 2]   99 	jp	__sdcc_program_startup
                                    100 ;--------------------------------------------------------
                                    101 ; Home
                                    102 ;--------------------------------------------------------
                                    103 	.area HOME
                                    104 	.area HOME
      008004                        105 __sdcc_program_startup:
      008004 CC 80 C4         [ 2]  106 	jp	_main
                                    107 ;	return from main will return to caller
                                    108 ;--------------------------------------------------------
                                    109 ; code
                                    110 ;--------------------------------------------------------
                                    111 	.area CODE
                                    112 ;	main.c: 54: void main(void)
                                    113 ;	-----------------------------------------
                                    114 ;	 function main
                                    115 ;	-----------------------------------------
      0080C4                        116 _main:
                                    117 ;	main.c: 56: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
      0080C4 4F               [ 1]  118 	clr	a
      0080C5 CD 86 09         [ 4]  119 	call	_CLK_HSIPrescalerConfig
                                    120 ;	main.c: 57: I2C_init();
      0080C8 CD 81 09         [ 4]  121 	call	_I2C_init
                                    122 ;	main.c: 58: OLED_init();
      0080CB CD 81 9C         [ 4]  123 	call	_OLED_init
                                    124 ;	main.c: 62: while(1) {
      0080CE                        125 00103$:
                                    126 ;	main.c: 63: OLED_cursor(0,0);
      0080CE 4B 00            [ 1]  127 	push	#0x00
      0080D0 4F               [ 1]  128 	clr	a
      0080D1 CD 81 FD         [ 4]  129 	call	_OLED_cursor
                                    130 ;	main.c: 64: OLED_clear();
      0080D4 CD 82 2E         [ 4]  131 	call	_OLED_clear
                                    132 ;	main.c: 65: for (int i=13;i<23; i++)
      0080D7 AE 00 0D         [ 2]  133 	ldw	x, #0x000d
      0080DA                        134 00106$:
      0080DA A3 00 17         [ 2]  135 	cpw	x, #0x0017
      0080DD 2E 09            [ 1]  136 	jrsge	00101$
                                    137 ;	main.c: 67: OLED_printC(i);
      0080DF 9F               [ 1]  138 	ld	a, xl
      0080E0 89               [ 2]  139 	pushw	x
      0080E1 CD 81 C1         [ 4]  140 	call	_OLED_printC
      0080E4 85               [ 2]  141 	popw	x
                                    142 ;	main.c: 65: for (int i=13;i<23; i++)
      0080E5 5C               [ 1]  143 	incw	x
      0080E6 20 F2            [ 2]  144 	jra	00106$
      0080E8                        145 00101$:
                                    146 ;	main.c: 69: OLED_printC(21);
      0080E8 A6 15            [ 1]  147 	ld	a, #0x15
      0080EA CD 81 C1         [ 4]  148 	call	_OLED_printC
                                    149 ;	main.c: 70: OLED_printC(22);
      0080ED A6 16            [ 1]  150 	ld	a, #0x16
      0080EF CD 81 C1         [ 4]  151 	call	_OLED_printC
                                    152 ;	main.c: 71: OLED_printC(16);
      0080F2 A6 10            [ 1]  153 	ld	a, #0x10
      0080F4 CD 81 C1         [ 4]  154 	call	_OLED_printC
                                    155 ;	main.c: 72: OLED_printC(23);
      0080F7 A6 17            [ 1]  156 	ld	a, #0x17
      0080F9 CD 81 C1         [ 4]  157 	call	_OLED_printC
                                    158 ;	main.c: 73: OLED_printC(14);
      0080FC A6 0E            [ 1]  159 	ld	a, #0x0e
      0080FE CD 81 C1         [ 4]  160 	call	_OLED_printC
                                    161 ;	main.c: 74: OLED_printC(21);
      008101 A6 15            [ 1]  162 	ld	a, #0x15
      008103 CD 81 C1         [ 4]  163 	call	_OLED_printC
      008106 20 C6            [ 2]  164 	jra	00103$
                                    165 ;	main.c: 77: }
      008108 81               [ 4]  166 	ret
                                    167 ;	main.c: 79: void I2C_init(void)
                                    168 ;	-----------------------------------------
                                    169 ;	 function I2C_init
                                    170 ;	-----------------------------------------
      008109                        171 _I2C_init:
      008109 88               [ 1]  172 	push	a
                                    173 ;	main.c: 82: Input_Clock = CLK_GetClockFreq()/1000000;
      00810A CD 86 D9         [ 4]  174 	call	_CLK_GetClockFreq
      00810D 4B 40            [ 1]  175 	push	#0x40
      00810F 4B 42            [ 1]  176 	push	#0x42
      008111 4B 0F            [ 1]  177 	push	#0x0f
      008113 4B 00            [ 1]  178 	push	#0x00
      008115 89               [ 2]  179 	pushw	x
      008116 90 89            [ 2]  180 	pushw	y
      008118 CD 8A FD         [ 4]  181 	call	__divulong
      00811B 5B 08            [ 2]  182 	addw	sp, #8
      00811D 9F               [ 1]  183 	ld	a, xl
      00811E 6B 01            [ 1]  184 	ld	(0x01, sp), a
                                    185 ;	main.c: 83: I2C_DeInit();
      008120 CD 87 B4         [ 4]  186 	call	_I2C_DeInit
                                    187 ;	main.c: 84: CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
      008123 4B 01            [ 1]  188 	push	#0x01
      008125 4F               [ 1]  189 	clr	a
      008126 CD 85 13         [ 4]  190 	call	_CLK_PeripheralClockConfig
                                    191 ;	main.c: 85: I2C_Cmd( ENABLE);
      008129 A6 01            [ 1]  192 	ld	a, #0x01
      00812B CD 89 05         [ 4]  193 	call	_I2C_Cmd
                                    194 ;	main.c: 86: I2C_Init(DS1307_I2C_CLOCK, DS1307_I2C_ADDR, I2C_DUTYCYCLE_2, I2C_ACK_CURR, I2C_ADDMODE_7BIT, Input_Clock);
      00812E 7B 01            [ 1]  195 	ld	a, (0x01, sp)
      008130 88               [ 1]  196 	push	a
      008131 4B 00            [ 1]  197 	push	#0x00
      008133 4B 01            [ 1]  198 	push	#0x01
      008135 4B 00            [ 1]  199 	push	#0x00
      008137 4B 78            [ 1]  200 	push	#0x78
      008139 4B 00            [ 1]  201 	push	#0x00
      00813B 4B A0            [ 1]  202 	push	#0xa0
      00813D 4B 86            [ 1]  203 	push	#0x86
      00813F 4B 01            [ 1]  204 	push	#0x01
      008141 4B 00            [ 1]  205 	push	#0x00
      008143 CD 87 D9         [ 4]  206 	call	_I2C_Init
                                    207 ;	main.c: 87: }
      008146 84               [ 1]  208 	pop	a
      008147 81               [ 4]  209 	ret
                                    210 ;	main.c: 88: void I2C_start(void)
                                    211 ;	-----------------------------------------
                                    212 ;	 function I2C_start
                                    213 ;	-----------------------------------------
      008148                        214 _I2C_start:
                                    215 ;	main.c: 91: while(I2C_GetFlagStatus( I2C_FLAG_BUSBUSY)==SET);
      008148                        216 00101$:
      008148 AE 03 02         [ 2]  217 	ldw	x, #0x0302
      00814B CD 8A 76         [ 4]  218 	call	_I2C_GetFlagStatus
      00814E 4D               [ 1]  219 	tnz	a
      00814F 26 F7            [ 1]  220 	jrne	00101$
                                    221 ;	main.c: 92: I2C_GenerateSTART(ENABLE);
      008151 A6 01            [ 1]  222 	ld	a, #0x01
      008153 CD 89 35         [ 4]  223 	call	_I2C_GenerateSTART
                                    224 ;	main.c: 93: while(!I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT));
      008156                        225 00104$:
      008156 AE 03 01         [ 2]  226 	ldw	x, #0x0301
      008159 CD 8A 0B         [ 4]  227 	call	_I2C_CheckEvent
      00815C 4D               [ 1]  228 	tnz	a
      00815D 27 F7            [ 1]  229 	jreq	00104$
                                    230 ;	main.c: 94: }
      00815F 81               [ 4]  231 	ret
                                    232 ;	main.c: 95: void I2C_address(uint8_t mode)
                                    233 ;	-----------------------------------------
                                    234 ;	 function I2C_address
                                    235 ;	-----------------------------------------
      008160                        236 _I2C_address:
      008160 88               [ 1]  237 	push	a
      008161 6B 01            [ 1]  238 	ld	(0x01, sp), a
                                    239 ;	main.c: 98: I2C_Send7bitAddress((uint8_t)DS1307_I2C_ADDR,I2C_DIRECTION_TX);
      008163 4B 00            [ 1]  240 	push	#0x00
      008165 A6 78            [ 1]  241 	ld	a, #0x78
      008167 CD 89 F7         [ 4]  242 	call	_I2C_Send7bitAddress
                                    243 ;	main.c: 101: while(!I2C_CheckEvent( I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
      00816A                        244 00101$:
      00816A AE 07 82         [ 2]  245 	ldw	x, #0x0782
      00816D CD 8A 0B         [ 4]  246 	call	_I2C_CheckEvent
      008170 4D               [ 1]  247 	tnz	a
      008171 27 F7            [ 1]  248 	jreq	00101$
                                    249 ;	main.c: 104: I2C_SendData(mode);
      008173 7B 01            [ 1]  250 	ld	a, (0x01, sp)
      008175 CD 8A 07         [ 4]  251 	call	_I2C_SendData
                                    252 ;	main.c: 107: while(!I2C_CheckEvent( I2C_EVENT_MASTER_BYTE_TRANSMITTED));
      008178                        253 00104$:
      008178 AE 07 84         [ 2]  254 	ldw	x, #0x0784
      00817B CD 8A 0B         [ 4]  255 	call	_I2C_CheckEvent
      00817E 4D               [ 1]  256 	tnz	a
      00817F 27 F7            [ 1]  257 	jreq	00104$
                                    258 ;	main.c: 108: }
      008181 84               [ 1]  259 	pop	a
      008182 81               [ 4]  260 	ret
                                    261 ;	main.c: 109: void I2C_write(uint8_t data)
                                    262 ;	-----------------------------------------
                                    263 ;	 function I2C_write
                                    264 ;	-----------------------------------------
      008183                        265 _I2C_write:
                                    266 ;	main.c: 112: I2C_SendData(data);
      008183 CD 8A 07         [ 4]  267 	call	_I2C_SendData
                                    268 ;	main.c: 115: while(!I2C_GetFlagStatus( I2C_FLAG_TRANSFERFINISHED));
      008186                        269 00101$:
      008186 AE 01 04         [ 2]  270 	ldw	x, #0x0104
      008189 CD 8A 76         [ 4]  271 	call	_I2C_GetFlagStatus
      00818C 4D               [ 1]  272 	tnz	a
      00818D 27 F7            [ 1]  273 	jreq	00101$
                                    274 ;	main.c: 116: }
      00818F 81               [ 4]  275 	ret
                                    276 ;	main.c: 117: void I2C_stop(void)
                                    277 ;	-----------------------------------------
                                    278 ;	 function I2C_stop
                                    279 ;	-----------------------------------------
      008190                        280 _I2C_stop:
                                    281 ;	main.c: 120: I2C_GenerateSTOP(ENABLE);
      008190 A6 01            [ 1]  282 	ld	a, #0x01
      008192 CD 89 4D         [ 4]  283 	call	_I2C_GenerateSTOP
                                    284 ;	main.c: 122: I2C->SR1;       I2C->SR3;
      008195 C6 52 17         [ 1]  285 	ld	a, 0x5217
      008198 C6 52 19         [ 1]  286 	ld	a, 0x5219
                                    287 ;	main.c: 123: }
      00819B 81               [ 4]  288 	ret
                                    289 ;	main.c: 124: void OLED_init(void)
                                    290 ;	-----------------------------------------
                                    291 ;	 function OLED_init
                                    292 ;	-----------------------------------------
      00819C                        293 _OLED_init:
      00819C 88               [ 1]  294 	push	a
                                    295 ;	main.c: 126: I2C_start();
      00819D CD 81 48         [ 4]  296 	call	_I2C_start
                                    297 ;	main.c: 127: I2C_address(OLED_CMD_MODE);
      0081A0 4F               [ 1]  298 	clr	a
      0081A1 CD 81 60         [ 4]  299 	call	_I2C_address
                                    300 ;	main.c: 128: for (uint8_t i = 0;i < OLED_INIT_LEN;i++)
      0081A4 0F 01            [ 1]  301 	clr	(0x01, sp)
      0081A6                        302 00103$:
      0081A6 7B 01            [ 1]  303 	ld	a, (0x01, sp)
      0081A8 A1 0C            [ 1]  304 	cp	a, #0x0c
      0081AA 24 0F            [ 1]  305 	jrnc	00101$
                                    306 ;	main.c: 130: I2C_write(OLED_INIT_CMD[i]);
      0081AC 5F               [ 1]  307 	clrw	x
      0081AD 7B 01            [ 1]  308 	ld	a, (0x01, sp)
      0081AF 97               [ 1]  309 	ld	xl, a
      0081B0 1C 80 2D         [ 2]  310 	addw	x, #(_OLED_INIT_CMD+0)
      0081B3 F6               [ 1]  311 	ld	a, (x)
      0081B4 CD 81 83         [ 4]  312 	call	_I2C_write
                                    313 ;	main.c: 128: for (uint8_t i = 0;i < OLED_INIT_LEN;i++)
      0081B7 0C 01            [ 1]  314 	inc	(0x01, sp)
      0081B9 20 EB            [ 2]  315 	jra	00103$
      0081BB                        316 00101$:
                                    317 ;	main.c: 132: I2C_stop();
      0081BB 84               [ 1]  318 	pop	a
      0081BC CC 81 90         [ 2]  319 	jp	_I2C_stop
                                    320 ;	main.c: 133: }
      0081BF 84               [ 1]  321 	pop	a
      0081C0 81               [ 4]  322 	ret
                                    323 ;	main.c: 134: void OLED_printC(char ch)
                                    324 ;	-----------------------------------------
                                    325 ;	 function OLED_printC
                                    326 ;	-----------------------------------------
      0081C1                        327 _OLED_printC:
      0081C1 52 02            [ 2]  328 	sub	sp, #2
                                    329 ;	main.c: 136: uint16_t offset = ch;
      0081C3 6B 02            [ 1]  330 	ld	(0x02, sp), a
      0081C5 0F 01            [ 1]  331 	clr	(0x01, sp)
                                    332 ;	main.c: 137: offset += offset << 2;
      0081C7 1E 01            [ 2]  333 	ldw	x, (0x01, sp)
      0081C9 58               [ 2]  334 	sllw	x
      0081CA 58               [ 2]  335 	sllw	x
      0081CB 72 FB 01         [ 2]  336 	addw	x, (0x01, sp)
      0081CE 1F 01            [ 2]  337 	ldw	(0x01, sp), x
                                    338 ;	main.c: 138: I2C_start();
      0081D0 CD 81 48         [ 4]  339 	call	_I2C_start
                                    340 ;	main.c: 139: I2C_address(OLED_DAT_MODE);
      0081D3 A6 40            [ 1]  341 	ld	a, #0x40
      0081D5 CD 81 60         [ 4]  342 	call	_I2C_address
                                    343 ;	main.c: 140: I2C_write(0x00);
      0081D8 4F               [ 1]  344 	clr	a
      0081D9 CD 81 83         [ 4]  345 	call	_I2C_write
                                    346 ;	main.c: 141: for(uint8_t i = 5; i;i--){ I2C_write(OLED_FONT[offset++]); }
      0081DC 1E 01            [ 2]  347 	ldw	x, (0x01, sp)
      0081DE A6 05            [ 1]  348 	ld	a, #0x05
      0081E0 6B 02            [ 1]  349 	ld	(0x02, sp), a
      0081E2                        350 00103$:
      0081E2 0D 02            [ 1]  351 	tnz	(0x02, sp)
      0081E4 27 12            [ 1]  352 	jreq	00101$
      0081E6 90 93            [ 1]  353 	ldw	y, x
      0081E8 72 A9 80 3B      [ 2]  354 	addw	y, #(_OLED_FONT+0)
      0081EC 5C               [ 1]  355 	incw	x
      0081ED 90 F6            [ 1]  356 	ld	a, (y)
      0081EF 89               [ 2]  357 	pushw	x
      0081F0 CD 81 83         [ 4]  358 	call	_I2C_write
      0081F3 85               [ 2]  359 	popw	x
      0081F4 0A 02            [ 1]  360 	dec	(0x02, sp)
      0081F6 20 EA            [ 2]  361 	jra	00103$
      0081F8                        362 00101$:
                                    363 ;	main.c: 142: I2C_stop();
      0081F8 5B 02            [ 2]  364 	addw	sp, #2
                                    365 ;	main.c: 143: }
      0081FA CC 81 90         [ 2]  366 	jp	_I2C_stop
                                    367 ;	main.c: 144: void OLED_cursor(uint8_t xpos, uint8_t ypos)
                                    368 ;	-----------------------------------------
                                    369 ;	 function OLED_cursor
                                    370 ;	-----------------------------------------
      0081FD                        371 _OLED_cursor:
      0081FD 88               [ 1]  372 	push	a
      0081FE 6B 01            [ 1]  373 	ld	(0x01, sp), a
                                    374 ;	main.c: 146: I2C_start();
      008200 CD 81 48         [ 4]  375 	call	_I2C_start
                                    376 ;	main.c: 147: I2C_address(OLED_CMD_MODE);
      008203 4F               [ 1]  377 	clr	a
      008204 CD 81 60         [ 4]  378 	call	_I2C_address
                                    379 ;	main.c: 148: I2C_write(xpos & 0x0F);
      008207 7B 01            [ 1]  380 	ld	a, (0x01, sp)
      008209 A4 0F            [ 1]  381 	and	a, #0x0f
      00820B CD 81 83         [ 4]  382 	call	_I2C_write
                                    383 ;	main.c: 149: I2C_write(0x10 | (xpos >> 4));
      00820E 7B 01            [ 1]  384 	ld	a, (0x01, sp)
      008210 4E               [ 1]  385 	swap	a
      008211 A4 0F            [ 1]  386 	and	a, #0x0f
      008213 AA 10            [ 1]  387 	or	a, #0x10
      008215 CD 81 83         [ 4]  388 	call	_I2C_write
                                    389 ;	main.c: 150: I2C_write(0xB0 | (ypos & 0x07));
      008218 7B 04            [ 1]  390 	ld	a, (0x04, sp)
      00821A A4 07            [ 1]  391 	and	a, #0x07
      00821C AA B0            [ 1]  392 	or	a, #0xb0
      00821E CD 81 83         [ 4]  393 	call	_I2C_write
                                    394 ;	main.c: 151: I2C_stop();
      008221 1E 02            [ 2]  395 	ldw	x, (2, sp)
      008223 1F 03            [ 2]  396 	ldw	(3, sp), x
      008225 5B 02            [ 2]  397 	addw	sp, #2
      008227 CC 81 90         [ 2]  398 	jp	_I2C_stop
                                    399 ;	main.c: 152: }
      00822A 84               [ 1]  400 	pop	a
      00822B 85               [ 2]  401 	popw	x
      00822C 84               [ 1]  402 	pop	a
      00822D FC               [ 2]  403 	jp	(x)
                                    404 ;	main.c: 153: void OLED_clear(void)
                                    405 ;	-----------------------------------------
                                    406 ;	 function OLED_clear
                                    407 ;	-----------------------------------------
      00822E                        408 _OLED_clear:
                                    409 ;	main.c: 155: OLED_cursor(0,0);
      00822E 4B 00            [ 1]  410 	push	#0x00
      008230 4F               [ 1]  411 	clr	a
      008231 CD 81 FD         [ 4]  412 	call	_OLED_cursor
                                    413 ;	main.c: 156: I2C_start();
      008234 CD 81 48         [ 4]  414 	call	_I2C_start
                                    415 ;	main.c: 157: I2C_address(OLED_DAT_MODE);
      008237 A6 40            [ 1]  416 	ld	a, #0x40
      008239 CD 81 60         [ 4]  417 	call	_I2C_address
                                    418 ;	main.c: 158: for (uint16_t i=512;i;i--)
      00823C AE 02 00         [ 2]  419 	ldw	x, #0x0200
      00823F                        420 00103$:
      00823F 5D               [ 2]  421 	tnzw	x
      008240 26 03            [ 1]  422 	jrne	00118$
      008242 CC 81 90         [ 2]  423 	jp	_I2C_stop
      008245                        424 00118$:
                                    425 ;	main.c: 160: I2C_write(0x00);
      008245 89               [ 2]  426 	pushw	x
      008246 4F               [ 1]  427 	clr	a
      008247 CD 81 83         [ 4]  428 	call	_I2C_write
      00824A 85               [ 2]  429 	popw	x
                                    430 ;	main.c: 158: for (uint16_t i=512;i;i--)
      00824B 5A               [ 2]  431 	decw	x
                                    432 ;	main.c: 162: I2C_stop();
                                    433 ;	main.c: 163: }
      00824C 20 F1            [ 2]  434 	jra	00103$
                                    435 	.area CODE
                                    436 	.area CONST
      00802D                        437 _OLED_INIT_CMD:
      00802D A8                     438 	.db #0xa8	; 168
      00802E 1F                     439 	.db #0x1f	; 31
      00802F 22                     440 	.db #0x22	; 34
      008030 00                     441 	.db #0x00	; 0
      008031 03                     442 	.db #0x03	; 3
      008032 20                     443 	.db #0x20	; 32
      008033 00                     444 	.db #0x00	; 0
      008034 DA                     445 	.db #0xda	; 218
      008035 02                     446 	.db #0x02	; 2
      008036 8D                     447 	.db #0x8d	; 141
      008037 14                     448 	.db #0x14	; 20
      008038 AF                     449 	.db #0xaf	; 175
      008039 A1                     450 	.db #0xa1	; 161
      00803A C8                     451 	.db #0xc8	; 200
      00803B                        452 _OLED_FONT:
      00803B 3E                     453 	.db #0x3e	; 62
      00803C 51                     454 	.db #0x51	; 81	'Q'
      00803D 49                     455 	.db #0x49	; 73	'I'
      00803E 45                     456 	.db #0x45	; 69	'E'
      00803F 3E                     457 	.db #0x3e	; 62
      008040 00                     458 	.db #0x00	; 0
      008041 42                     459 	.db #0x42	; 66	'B'
      008042 7F                     460 	.db #0x7f	; 127
      008043 40                     461 	.db #0x40	; 64
      008044 00                     462 	.db #0x00	; 0
      008045 42                     463 	.db #0x42	; 66	'B'
      008046 61                     464 	.db #0x61	; 97	'a'
      008047 51                     465 	.db #0x51	; 81	'Q'
      008048 49                     466 	.db #0x49	; 73	'I'
      008049 46                     467 	.db #0x46	; 70	'F'
      00804A 21                     468 	.db #0x21	; 33
      00804B 41                     469 	.db #0x41	; 65	'A'
      00804C 45                     470 	.db #0x45	; 69	'E'
      00804D 4B                     471 	.db #0x4b	; 75	'K'
      00804E 31                     472 	.db #0x31	; 49	'1'
      00804F 18                     473 	.db #0x18	; 24
      008050 14                     474 	.db #0x14	; 20
      008051 12                     475 	.db #0x12	; 18
      008052 7F                     476 	.db #0x7f	; 127
      008053 10                     477 	.db #0x10	; 16
      008054 27                     478 	.db #0x27	; 39
      008055 45                     479 	.db #0x45	; 69	'E'
      008056 45                     480 	.db #0x45	; 69	'E'
      008057 45                     481 	.db #0x45	; 69	'E'
      008058 39                     482 	.db #0x39	; 57	'9'
      008059 3C                     483 	.db #0x3c	; 60
      00805A 4A                     484 	.db #0x4a	; 74	'J'
      00805B 49                     485 	.db #0x49	; 73	'I'
      00805C 49                     486 	.db #0x49	; 73	'I'
      00805D 30                     487 	.db #0x30	; 48	'0'
      00805E 01                     488 	.db #0x01	; 1
      00805F 71                     489 	.db #0x71	; 113	'q'
      008060 09                     490 	.db #0x09	; 9
      008061 05                     491 	.db #0x05	; 5
      008062 03                     492 	.db #0x03	; 3
      008063 36                     493 	.db #0x36	; 54	'6'
      008064 49                     494 	.db #0x49	; 73	'I'
      008065 49                     495 	.db #0x49	; 73	'I'
      008066 49                     496 	.db #0x49	; 73	'I'
      008067 36                     497 	.db #0x36	; 54	'6'
      008068 06                     498 	.db #0x06	; 6
      008069 49                     499 	.db #0x49	; 73	'I'
      00806A 49                     500 	.db #0x49	; 73	'I'
      00806B 29                     501 	.db #0x29	; 41
      00806C 1E                     502 	.db #0x1e	; 30
      00806D 7F                     503 	.db #0x7f	; 127
      00806E 09                     504 	.db #0x09	; 9
      00806F 19                     505 	.db #0x19	; 25
      008070 29                     506 	.db #0x29	; 41
      008071 46                     507 	.db #0x46	; 70	'F'
      008072 46                     508 	.db #0x46	; 70	'F'
      008073 49                     509 	.db #0x49	; 73	'I'
      008074 49                     510 	.db #0x49	; 73	'I'
      008075 49                     511 	.db #0x49	; 73	'I'
      008076 31                     512 	.db #0x31	; 49	'1'
      008077 00                     513 	.db #0x00	; 0
      008078 60                     514 	.db #0x60	; 96
      008079 60                     515 	.db #0x60	; 96
      00807A 00                     516 	.db #0x00	; 0
      00807B 00                     517 	.db #0x00	; 0
      00807C 7F                     518 	.db #0x7f	; 127
      00807D 40                     519 	.db #0x40	; 64
      00807E 40                     520 	.db #0x40	; 64
      00807F 40                     521 	.db #0x40	; 64
      008080 40                     522 	.db #0x40	; 64
      008081 7F                     523 	.db #0x7f	; 127
      008082 49                     524 	.db #0x49	; 73	'I'
      008083 49                     525 	.db #0x49	; 73	'I'
      008084 49                     526 	.db #0x49	; 73	'I'
      008085 41                     527 	.db #0x41	; 65	'A'
      008086 7F                     528 	.db #0x7f	; 127
      008087 41                     529 	.db #0x41	; 65	'A'
      008088 41                     530 	.db #0x41	; 65	'A'
      008089 22                     531 	.db #0x22	; 34
      00808A 1C                     532 	.db #0x1c	; 28
      00808B 3F                     533 	.db #0x3f	; 63
      00808C 40                     534 	.db #0x40	; 64
      00808D 40                     535 	.db #0x40	; 64
      00808E 40                     536 	.db #0x40	; 64
      00808F 3F                     537 	.db #0x3f	; 63
      008090 3E                     538 	.db #0x3e	; 62
      008091 41                     539 	.db #0x41	; 65	'A'
      008092 41                     540 	.db #0x41	; 65	'A'
      008093 41                     541 	.db #0x41	; 65	'A'
      008094 22                     542 	.db #0x22	; 34
      008095 7F                     543 	.db #0x7f	; 127
      008096 08                     544 	.db #0x08	; 8
      008097 08                     545 	.db #0x08	; 8
      008098 08                     546 	.db #0x08	; 8
      008099 7F                     547 	.db #0x7f	; 127
      00809A 3E                     548 	.db #0x3e	; 62
      00809B 41                     549 	.db #0x41	; 65	'A'
      00809C 41                     550 	.db #0x41	; 65	'A'
      00809D 41                     551 	.db #0x41	; 65	'A'
      00809E 3E                     552 	.db #0x3e	; 62
      00809F 7C                     553 	.db #0x7c	; 124
      0080A0 12                     554 	.db #0x12	; 18
      0080A1 11                     555 	.db #0x11	; 17
      0080A2 12                     556 	.db #0x12	; 18
      0080A3 7C                     557 	.db #0x7c	; 124
      0080A4 7F                     558 	.db #0x7f	; 127
      0080A5 04                     559 	.db #0x04	; 4
      0080A6 08                     560 	.db #0x08	; 8
      0080A7 10                     561 	.db #0x10	; 16
      0080A8 7F                     562 	.db #0x7f	; 127
      0080A9 3E                     563 	.db #0x3e	; 62
      0080AA 41                     564 	.db #0x41	; 65	'A'
      0080AB 49                     565 	.db #0x49	; 73	'I'
      0080AC 49                     566 	.db #0x49	; 73	'I'
      0080AD 7A                     567 	.db #0x7a	; 122	'z'
      0080AE 07                     568 	.db #0x07	; 7
      0080AF 08                     569 	.db #0x08	; 8
      0080B0 70                     570 	.db #0x70	; 112	'p'
      0080B1 08                     571 	.db #0x08	; 8
      0080B2 07                     572 	.db #0x07	; 7
      0080B3 40                     573 	.db #0x40	; 64
      0080B4 40                     574 	.db #0x40	; 64
      0080B5 40                     575 	.db #0x40	; 64
      0080B6 40                     576 	.db #0x40	; 64
      0080B7 40                     577 	.db #0x40	; 64
                                    578 	.area INITIALIZER
                                    579 	.area CABS (ABS)
