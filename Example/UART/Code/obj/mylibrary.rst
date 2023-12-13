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
                                     11 	.globl _UART1_receive
                                     12 	.globl _UART1_GetFlagStatus
                                     13 	.globl _UART1_SendData8
                                     14 	.globl _UART1_Cmd
                                     15 	.globl _UART1_Init
                                     16 	.globl _UART1_DeInit
                                     17 	.globl _TIM4_ClearFlag
                                     18 	.globl _TIM4_GetFlagStatus
                                     19 	.globl _TIM4_SetCounter
                                     20 	.globl _TIM4_Cmd
                                     21 	.globl _TIM4_TimeBaseInit
                                     22 	.globl _data
                                     23 	.globl _delay_msSetup
                                     24 	.globl _delay_ms
                                     25 	.globl _UART1_Setup
                                     26 	.globl _UART1_number
                                     27 	.globl _UART1_String
                                     28 ;--------------------------------------------------------
                                     29 ; ram data
                                     30 ;--------------------------------------------------------
                                     31 	.area DATA
                                     32 ;--------------------------------------------------------
                                     33 ; ram data
                                     34 ;--------------------------------------------------------
                                     35 	.area INITIALIZED
      000008                         36 _data::
      000008                         37 	.ds 1
                                     38 ;--------------------------------------------------------
                                     39 ; absolute external ram data
                                     40 ;--------------------------------------------------------
                                     41 	.area DABS (ABS)
                                     42 
                                     43 ; default segment ordering for linker
                                     44 	.area HOME
                                     45 	.area GSINIT
                                     46 	.area GSFINAL
                                     47 	.area CONST
                                     48 	.area INITIALIZER
                                     49 	.area CODE
                                     50 
                                     51 ;--------------------------------------------------------
                                     52 ; global & static initialisations
                                     53 ;--------------------------------------------------------
                                     54 	.area HOME
                                     55 	.area GSINIT
                                     56 	.area GSFINAL
                                     57 	.area GSINIT
                                     58 ;--------------------------------------------------------
                                     59 ; Home
                                     60 ;--------------------------------------------------------
                                     61 	.area HOME
                                     62 	.area HOME
                                     63 ;--------------------------------------------------------
                                     64 ; code
                                     65 ;--------------------------------------------------------
                                     66 	.area CODE
                                     67 ;	mylibrary.c: 4: void delay_msSetup(void)
                                     68 ;	-----------------------------------------
                                     69 ;	 function delay_msSetup
                                     70 ;	-----------------------------------------
      008EAC                         71 _delay_msSetup:
                                     72 ;	mylibrary.c: 6: TIM4_TimeBaseInit(TIM4_PRESCALER_128, 125 - 1);
      008EAC 4B 7C            [ 1]   73 	push	#0x7c
      008EAE A6 07            [ 1]   74 	ld	a, #0x07
      008EB0 CD 81 51         [ 4]   75 	call	_TIM4_TimeBaseInit
                                     76 ;	mylibrary.c: 7: TIM4_Cmd(ENABLE);
      008EB3 A6 01            [ 1]   77 	ld	a, #0x01
                                     78 ;	mylibrary.c: 8: }
      008EB5 CC 81 5D         [ 2]   79 	jp	_TIM4_Cmd
                                     80 ;	mylibrary.c: 9: void delay_ms(uint16_t u16Delay)
                                     81 ;	-----------------------------------------
                                     82 ;	 function delay_ms
                                     83 ;	-----------------------------------------
      008EB8                         84 _delay_ms:
      008EB8 52 02            [ 2]   85 	sub	sp, #2
                                     86 ;	mylibrary.c: 11: while (u16Delay) {
      008EBA 1F 01            [ 2]   87 	ldw	(0x01, sp), x
      008EBC                         88 00104$:
      008EBC 1E 01            [ 2]   89 	ldw	x, (0x01, sp)
      008EBE 27 18            [ 1]   90 	jreq	00107$
                                     91 ;	mylibrary.c: 12: TIM4_SetCounter(0);
      008EC0 4F               [ 1]   92 	clr	a
      008EC1 CD 82 02         [ 4]   93 	call	_TIM4_SetCounter
                                     94 ;	mylibrary.c: 13: TIM4_ClearFlag(TIM4_FLAG_UPDATE);
      008EC4 A6 01            [ 1]   95 	ld	a, #0x01
      008EC6 CD 82 22         [ 4]   96 	call	_TIM4_ClearFlag
                                     97 ;	mylibrary.c: 14: while (TIM4_GetFlagStatus(TIM4_FLAG_UPDATE) == RESET) {}
      008EC9                         98 00101$:
      008EC9 A6 01            [ 1]   99 	ld	a, #0x01
      008ECB CD 82 12         [ 4]  100 	call	_TIM4_GetFlagStatus
      008ECE 4D               [ 1]  101 	tnz	a
      008ECF 27 F8            [ 1]  102 	jreq	00101$
                                    103 ;	mylibrary.c: 15: --u16Delay;
      008ED1 1E 01            [ 2]  104 	ldw	x, (0x01, sp)
      008ED3 5A               [ 2]  105 	decw	x
      008ED4 1F 01            [ 2]  106 	ldw	(0x01, sp), x
      008ED6 20 E4            [ 2]  107 	jra	00104$
      008ED8                        108 00107$:
                                    109 ;	mylibrary.c: 17: }
      008ED8 5B 02            [ 2]  110 	addw	sp, #2
      008EDA 81               [ 4]  111 	ret
                                    112 ;	mylibrary.c: 22: void UART1_Setup(void)
                                    113 ;	-----------------------------------------
                                    114 ;	 function UART1_Setup
                                    115 ;	-----------------------------------------
      008EDB                        116 _UART1_Setup:
                                    117 ;	mylibrary.c: 24: UART1_DeInit();
      008EDB CD 85 CC         [ 4]  118 	call	_UART1_DeInit
                                    119 ;	mylibrary.c: 25: UART1_Init(9600, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, 
      008EDE 4B 0C            [ 1]  120 	push	#0x0c
      008EE0 4B 80            [ 1]  121 	push	#0x80
      008EE2 4B 00            [ 1]  122 	push	#0x00
      008EE4 4B 00            [ 1]  123 	push	#0x00
      008EE6 4B 00            [ 1]  124 	push	#0x00
      008EE8 4B 80            [ 1]  125 	push	#0x80
      008EEA 4B 25            [ 1]  126 	push	#0x25
      008EEC 5F               [ 1]  127 	clrw	x
      008EED 89               [ 2]  128 	pushw	x
      008EEE CD 85 F7         [ 4]  129 	call	_UART1_Init
                                    130 ;	mylibrary.c: 28: UART1_Cmd(ENABLE);
      008EF1 A6 01            [ 1]  131 	ld	a, #0x01
                                    132 ;	mylibrary.c: 29: }
      008EF3 CC 87 76         [ 2]  133 	jp	_UART1_Cmd
                                    134 ;	mylibrary.c: 30: void UART1_number(int number)
                                    135 ;	-----------------------------------------
                                    136 ;	 function UART1_number
                                    137 ;	-----------------------------------------
      008EF6                        138 _UART1_number:
      008EF6 52 0A            [ 2]  139 	sub	sp, #10
      008EF8 1F 08            [ 2]  140 	ldw	(0x08, sp), x
                                    141 ;	mylibrary.c: 33: char digit[5] = "";
      008EFA 0F 03            [ 1]  142 	clr	(0x03, sp)
      008EFC 0F 04            [ 1]  143 	clr	(0x04, sp)
      008EFE 0F 05            [ 1]  144 	clr	(0x05, sp)
      008F00 0F 06            [ 1]  145 	clr	(0x06, sp)
      008F02 0F 07            [ 1]  146 	clr	(0x07, sp)
                                    147 ;	mylibrary.c: 34: while(number != 0)
      008F04 0F 0A            [ 1]  148 	clr	(0x0a, sp)
      008F06                        149 00101$:
      008F06 1E 08            [ 2]  150 	ldw	x, (0x08, sp)
      008F08 27 2C            [ 1]  151 	jreq	00117$
                                    152 ;	mylibrary.c: 36: digit[count] = number%10;   //lay chu so ngoai cung xxxx8;
      008F0A 5F               [ 1]  153 	clrw	x
      008F0B 7B 0A            [ 1]  154 	ld	a, (0x0a, sp)
      008F0D 97               [ 1]  155 	ld	xl, a
      008F0E 89               [ 2]  156 	pushw	x
      008F0F 96               [ 1]  157 	ldw	x, sp
      008F10 1C 00 05         [ 2]  158 	addw	x, #5
      008F13 72 FB 01         [ 2]  159 	addw	x, (1, sp)
      008F16 1F 03            [ 2]  160 	ldw	(0x03, sp), x
      008F18 5B 02            [ 2]  161 	addw	sp, #2
      008F1A 4B 0A            [ 1]  162 	push	#0x0a
      008F1C 4B 00            [ 1]  163 	push	#0x00
      008F1E 1E 0A            [ 2]  164 	ldw	x, (0x0a, sp)
      008F20 CD 8F D9         [ 4]  165 	call	__modsint
      008F23 9F               [ 1]  166 	ld	a, xl
      008F24 1E 01            [ 2]  167 	ldw	x, (0x01, sp)
      008F26 F7               [ 1]  168 	ld	(x), a
                                    169 ;	mylibrary.c: 37: count++;
      008F27 0C 0A            [ 1]  170 	inc	(0x0a, sp)
                                    171 ;	mylibrary.c: 38: number = number/10;         //chia so number cho 10 de bo so ngoai cung xxxx
      008F29 4B 0A            [ 1]  172 	push	#0x0a
      008F2B 4B 00            [ 1]  173 	push	#0x00
      008F2D 1E 0A            [ 2]  174 	ldw	x, (0x0a, sp)
      008F2F CD 90 6D         [ 4]  175 	call	__divsint
      008F32 1F 08            [ 2]  176 	ldw	(0x08, sp), x
      008F34 20 D0            [ 2]  177 	jra	00101$
                                    178 ;	mylibrary.c: 40: while (count!=0)
      008F36                        179 00117$:
      008F36                        180 00107$:
      008F36 0D 0A            [ 1]  181 	tnz	(0x0a, sp)
      008F38 27 25            [ 1]  182 	jreq	00110$
                                    183 ;	mylibrary.c: 42: UART1_SendData8(digit[count - 1] + 0x30); // 0x30 = 48 ;
      008F3A 7B 0A            [ 1]  184 	ld	a, (0x0a, sp)
      008F3C 4A               [ 1]  185 	dec	a
      008F3D 6B 02            [ 1]  186 	ld	(0x02, sp), a
      008F3F 49               [ 1]  187 	rlc	a
      008F40 4F               [ 1]  188 	clr	a
      008F41 A2 00            [ 1]  189 	sbc	a, #0x00
      008F43 6B 01            [ 1]  190 	ld	(0x01, sp), a
      008F45 96               [ 1]  191 	ldw	x, sp
      008F46 1C 00 03         [ 2]  192 	addw	x, #3
      008F49 72 FB 01         [ 2]  193 	addw	x, (0x01, sp)
      008F4C F6               [ 1]  194 	ld	a, (x)
      008F4D AB 30            [ 1]  195 	add	a, #0x30
      008F4F CD 89 07         [ 4]  196 	call	_UART1_SendData8
                                    197 ;	mylibrary.c: 43: while(UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET);
      008F52                        198 00104$:
      008F52 AE 00 80         [ 2]  199 	ldw	x, #0x0080
      008F55 CD 89 4A         [ 4]  200 	call	_UART1_GetFlagStatus
      008F58 4D               [ 1]  201 	tnz	a
      008F59 27 F7            [ 1]  202 	jreq	00104$
                                    203 ;	mylibrary.c: 45: count--;
      008F5B 0A 0A            [ 1]  204 	dec	(0x0a, sp)
      008F5D 20 D7            [ 2]  205 	jra	00107$
      008F5F                        206 00110$:
                                    207 ;	mylibrary.c: 47: }
      008F5F 5B 0A            [ 2]  208 	addw	sp, #10
      008F61 81               [ 4]  209 	ret
                                    210 ;	mylibrary.c: 48: char UART1_receive()
                                    211 ;	-----------------------------------------
                                    212 ;	 function UART1_receive
                                    213 ;	-----------------------------------------
      008F62                        214 _UART1_receive:
                                    215 ;	mylibrary.c: 53: return data;
      008F62 C6 00 08         [ 1]  216 	ld	a, _data+0
                                    217 ;	mylibrary.c: 54: }
      008F65 81               [ 4]  218 	ret
                                    219 ;	mylibrary.c: 55: void UART1_String(const char *cy)
                                    220 ;	-----------------------------------------
                                    221 ;	 function UART1_String
                                    222 ;	-----------------------------------------
      008F66                        223 _UART1_String:
                                    224 ;	mylibrary.c: 57: while(*cy)
      008F66                        225 00104$:
      008F66 F6               [ 1]  226 	ld	a, (x)
      008F67 26 01            [ 1]  227 	jrne	00130$
      008F69 81               [ 4]  228 	ret
      008F6A                        229 00130$:
                                    230 ;	mylibrary.c: 59: UART1_SendData8(*cy);
      008F6A 89               [ 2]  231 	pushw	x
      008F6B CD 89 07         [ 4]  232 	call	_UART1_SendData8
      008F6E 85               [ 2]  233 	popw	x
                                    234 ;	mylibrary.c: 60: while(UART1_GetFlagStatus(UART1_FLAG_TXE)==0){}
      008F6F                        235 00101$:
      008F6F 89               [ 2]  236 	pushw	x
      008F70 AE 00 80         [ 2]  237 	ldw	x, #0x0080
      008F73 CD 89 4A         [ 4]  238 	call	_UART1_GetFlagStatus
      008F76 85               [ 2]  239 	popw	x
      008F77 4D               [ 1]  240 	tnz	a
      008F78 27 F5            [ 1]  241 	jreq	00101$
                                    242 ;	mylibrary.c: 62: cy++;
      008F7A 5C               [ 1]  243 	incw	x
      008F7B 20 E9            [ 2]  244 	jra	00104$
                                    245 ;	mylibrary.c: 64: }
      008F7D 81               [ 4]  246 	ret
                                    247 	.area CODE
                                    248 	.area CONST
                                    249 	.area INITIALIZER
      008046                        250 __xinit__data:
      008046 00                     251 	.db #0x00	; 0
                                    252 	.area CABS (ABS)
