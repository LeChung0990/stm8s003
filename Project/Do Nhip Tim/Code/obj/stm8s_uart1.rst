                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.3.0 #14184 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_uart1
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _CLK_GetClockFreq
                                     12 	.globl _UART1_DeInit
                                     13 	.globl _UART1_Init
                                     14 	.globl _UART1_Cmd
                                     15 	.globl _UART1_ITConfig
                                     16 	.globl _UART1_HalfDuplexCmd
                                     17 	.globl _UART1_IrDAConfig
                                     18 	.globl _UART1_IrDACmd
                                     19 	.globl _UART1_LINBreakDetectionConfig
                                     20 	.globl _UART1_LINCmd
                                     21 	.globl _UART1_SmartCardCmd
                                     22 	.globl _UART1_SmartCardNACKCmd
                                     23 	.globl _UART1_WakeUpConfig
                                     24 	.globl _UART1_ReceiverWakeUpCmd
                                     25 	.globl _UART1_ReceiveData8
                                     26 	.globl _UART1_ReceiveData9
                                     27 	.globl _UART1_SendData8
                                     28 	.globl _UART1_SendData9
                                     29 	.globl _UART1_SendBreak
                                     30 	.globl _UART1_SetAddress
                                     31 	.globl _UART1_SetGuardTime
                                     32 	.globl _UART1_SetPrescaler
                                     33 	.globl _UART1_GetFlagStatus
                                     34 	.globl _UART1_ClearFlag
                                     35 	.globl _UART1_GetITStatus
                                     36 	.globl _UART1_ClearITPendingBit
                                     37 ;--------------------------------------------------------
                                     38 ; ram data
                                     39 ;--------------------------------------------------------
                                     40 	.area DATA
                                     41 ;--------------------------------------------------------
                                     42 ; ram data
                                     43 ;--------------------------------------------------------
                                     44 	.area INITIALIZED
                                     45 ;--------------------------------------------------------
                                     46 ; absolute external ram data
                                     47 ;--------------------------------------------------------
                                     48 	.area DABS (ABS)
                                     49 
                                     50 ; default segment ordering for linker
                                     51 	.area HOME
                                     52 	.area GSINIT
                                     53 	.area GSFINAL
                                     54 	.area CONST
                                     55 	.area INITIALIZER
                                     56 	.area CODE
                                     57 
                                     58 ;--------------------------------------------------------
                                     59 ; global & static initialisations
                                     60 ;--------------------------------------------------------
                                     61 	.area HOME
                                     62 	.area GSINIT
                                     63 	.area GSFINAL
                                     64 	.area GSINIT
                                     65 ;--------------------------------------------------------
                                     66 ; Home
                                     67 ;--------------------------------------------------------
                                     68 	.area HOME
                                     69 	.area HOME
                                     70 ;--------------------------------------------------------
                                     71 ; code
                                     72 ;--------------------------------------------------------
                                     73 	.area CODE
                                     74 ;	lib/src/stm8s_uart1.c: 53: void UART1_DeInit(void)
                                     75 ;	-----------------------------------------
                                     76 ;	 function UART1_DeInit
                                     77 ;	-----------------------------------------
      00896A                         78 _UART1_DeInit:
                                     79 ;	lib/src/stm8s_uart1.c: 57: (void)UART1->SR;
      00896A C6 52 30         [ 1]   80 	ld	a, 0x5230
                                     81 ;	lib/src/stm8s_uart1.c: 58: (void)UART1->DR;
      00896D C6 52 31         [ 1]   82 	ld	a, 0x5231
                                     83 ;	lib/src/stm8s_uart1.c: 60: UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /* Set UART1_BRR2 to reset value 0x00 */
      008970 35 00 52 33      [ 1]   84 	mov	0x5233+0, #0x00
                                     85 ;	lib/src/stm8s_uart1.c: 61: UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /* Set UART1_BRR1 to reset value 0x00 */
      008974 35 00 52 32      [ 1]   86 	mov	0x5232+0, #0x00
                                     87 ;	lib/src/stm8s_uart1.c: 63: UART1->CR1 = UART1_CR1_RESET_VALUE;  /* Set UART1_CR1 to reset value 0x00 */
      008978 35 00 52 34      [ 1]   88 	mov	0x5234+0, #0x00
                                     89 ;	lib/src/stm8s_uart1.c: 64: UART1->CR2 = UART1_CR2_RESET_VALUE;  /* Set UART1_CR2 to reset value 0x00 */
      00897C 35 00 52 35      [ 1]   90 	mov	0x5235+0, #0x00
                                     91 ;	lib/src/stm8s_uart1.c: 65: UART1->CR3 = UART1_CR3_RESET_VALUE;  /* Set UART1_CR3 to reset value 0x00 */
      008980 35 00 52 36      [ 1]   92 	mov	0x5236+0, #0x00
                                     93 ;	lib/src/stm8s_uart1.c: 66: UART1->CR4 = UART1_CR4_RESET_VALUE;  /* Set UART1_CR4 to reset value 0x00 */
      008984 35 00 52 37      [ 1]   94 	mov	0x5237+0, #0x00
                                     95 ;	lib/src/stm8s_uart1.c: 67: UART1->CR5 = UART1_CR5_RESET_VALUE;  /* Set UART1_CR5 to reset value 0x00 */
      008988 35 00 52 38      [ 1]   96 	mov	0x5238+0, #0x00
                                     97 ;	lib/src/stm8s_uart1.c: 69: UART1->GTR = UART1_GTR_RESET_VALUE;
      00898C 35 00 52 39      [ 1]   98 	mov	0x5239+0, #0x00
                                     99 ;	lib/src/stm8s_uart1.c: 70: UART1->PSCR = UART1_PSCR_RESET_VALUE;
      008990 35 00 52 3A      [ 1]  100 	mov	0x523a+0, #0x00
                                    101 ;	lib/src/stm8s_uart1.c: 71: }
      008994 81               [ 4]  102 	ret
                                    103 ;	lib/src/stm8s_uart1.c: 90: void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength, 
                                    104 ;	-----------------------------------------
                                    105 ;	 function UART1_Init
                                    106 ;	-----------------------------------------
      008995                        107 _UART1_Init:
      008995 52 11            [ 2]  108 	sub	sp, #17
                                    109 ;	lib/src/stm8s_uart1.c: 105: UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  
      008997 72 19 52 34      [ 1]  110 	bres	0x5234, #4
                                    111 ;	lib/src/stm8s_uart1.c: 108: UART1->CR1 |= (uint8_t)WordLength;
      00899B C6 52 34         [ 1]  112 	ld	a, 0x5234
      00899E 1A 18            [ 1]  113 	or	a, (0x18, sp)
      0089A0 C7 52 34         [ 1]  114 	ld	0x5234, a
                                    115 ;	lib/src/stm8s_uart1.c: 111: UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
      0089A3 C6 52 36         [ 1]  116 	ld	a, 0x5236
      0089A6 A4 CF            [ 1]  117 	and	a, #0xcf
      0089A8 C7 52 36         [ 1]  118 	ld	0x5236, a
                                    119 ;	lib/src/stm8s_uart1.c: 113: UART1->CR3 |= (uint8_t)StopBits;  
      0089AB C6 52 36         [ 1]  120 	ld	a, 0x5236
      0089AE 1A 19            [ 1]  121 	or	a, (0x19, sp)
      0089B0 C7 52 36         [ 1]  122 	ld	0x5236, a
                                    123 ;	lib/src/stm8s_uart1.c: 116: UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  
      0089B3 C6 52 34         [ 1]  124 	ld	a, 0x5234
      0089B6 A4 F9            [ 1]  125 	and	a, #0xf9
      0089B8 C7 52 34         [ 1]  126 	ld	0x5234, a
                                    127 ;	lib/src/stm8s_uart1.c: 118: UART1->CR1 |= (uint8_t)Parity;  
      0089BB C6 52 34         [ 1]  128 	ld	a, 0x5234
      0089BE 1A 1A            [ 1]  129 	or	a, (0x1a, sp)
      0089C0 C7 52 34         [ 1]  130 	ld	0x5234, a
                                    131 ;	lib/src/stm8s_uart1.c: 121: UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  
      0089C3 C6 52 32         [ 1]  132 	ld	a, 0x5232
      0089C6 35 00 52 32      [ 1]  133 	mov	0x5232+0, #0x00
                                    134 ;	lib/src/stm8s_uart1.c: 123: UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);  
      0089CA C6 52 33         [ 1]  135 	ld	a, 0x5233
      0089CD A4 0F            [ 1]  136 	and	a, #0x0f
      0089CF C7 52 33         [ 1]  137 	ld	0x5233, a
                                    138 ;	lib/src/stm8s_uart1.c: 125: UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  
      0089D2 C6 52 33         [ 1]  139 	ld	a, 0x5233
      0089D5 A4 F0            [ 1]  140 	and	a, #0xf0
      0089D7 C7 52 33         [ 1]  141 	ld	0x5233, a
                                    142 ;	lib/src/stm8s_uart1.c: 128: BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
      0089DA CD 87 9A         [ 4]  143 	call	_CLK_GetClockFreq
      0089DD 1F 10            [ 2]  144 	ldw	(0x10, sp), x
      0089DF 1E 14            [ 2]  145 	ldw	x, (0x14, sp)
      0089E1 1F 0A            [ 2]  146 	ldw	(0x0a, sp), x
      0089E3 1E 16            [ 2]  147 	ldw	x, (0x16, sp)
      0089E5 A6 04            [ 1]  148 	ld	a, #0x04
      0089E7                        149 00127$:
      0089E7 58               [ 2]  150 	sllw	x
      0089E8 09 0B            [ 1]  151 	rlc	(0x0b, sp)
      0089EA 09 0A            [ 1]  152 	rlc	(0x0a, sp)
      0089EC 4A               [ 1]  153 	dec	a
      0089ED 26 F8            [ 1]  154 	jrne	00127$
      0089EF 1F 0C            [ 2]  155 	ldw	(0x0c, sp), x
      0089F1 89               [ 2]  156 	pushw	x
      0089F2 1E 0C            [ 2]  157 	ldw	x, (0x0c, sp)
      0089F4 89               [ 2]  158 	pushw	x
      0089F5 1E 14            [ 2]  159 	ldw	x, (0x14, sp)
      0089F7 89               [ 2]  160 	pushw	x
      0089F8 90 89            [ 2]  161 	pushw	y
      0089FA CD 92 1E         [ 4]  162 	call	__divulong
      0089FD 5B 08            [ 2]  163 	addw	sp, #8
      0089FF 1F 10            [ 2]  164 	ldw	(0x10, sp), x
      008A01 17 0E            [ 2]  165 	ldw	(0x0e, sp), y
      008A03 16 10            [ 2]  166 	ldw	y, (0x10, sp)
      008A05 17 03            [ 2]  167 	ldw	(0x03, sp), y
      008A07 16 0E            [ 2]  168 	ldw	y, (0x0e, sp)
      008A09 17 01            [ 2]  169 	ldw	(0x01, sp), y
                                    170 ;	lib/src/stm8s_uart1.c: 129: BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
      008A0B CD 87 9A         [ 4]  171 	call	_CLK_GetClockFreq
      008A0E 1F 10            [ 2]  172 	ldw	(0x10, sp), x
      008A10 17 0E            [ 2]  173 	ldw	(0x0e, sp), y
      008A12 1E 10            [ 2]  174 	ldw	x, (0x10, sp)
      008A14 89               [ 2]  175 	pushw	x
      008A15 1E 10            [ 2]  176 	ldw	x, (0x10, sp)
      008A17 89               [ 2]  177 	pushw	x
      008A18 4B 64            [ 1]  178 	push	#0x64
      008A1A 5F               [ 1]  179 	clrw	x
      008A1B 89               [ 2]  180 	pushw	x
      008A1C 4B 00            [ 1]  181 	push	#0x00
      008A1E CD 92 79         [ 4]  182 	call	__mullong
      008A21 5B 08            [ 2]  183 	addw	sp, #8
      008A23 1F 10            [ 2]  184 	ldw	(0x10, sp), x
      008A25 1E 0C            [ 2]  185 	ldw	x, (0x0c, sp)
      008A27 89               [ 2]  186 	pushw	x
      008A28 1E 0C            [ 2]  187 	ldw	x, (0x0c, sp)
      008A2A 89               [ 2]  188 	pushw	x
      008A2B 1E 14            [ 2]  189 	ldw	x, (0x14, sp)
      008A2D 89               [ 2]  190 	pushw	x
      008A2E 90 89            [ 2]  191 	pushw	y
      008A30 CD 92 1E         [ 4]  192 	call	__divulong
      008A33 5B 08            [ 2]  193 	addw	sp, #8
      008A35 1F 07            [ 2]  194 	ldw	(0x07, sp), x
      008A37 17 05            [ 2]  195 	ldw	(0x05, sp), y
                                    196 ;	lib/src/stm8s_uart1.c: 131: UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F); 
      008A39 C6 52 33         [ 1]  197 	ld	a, 0x5233
      008A3C 6B 09            [ 1]  198 	ld	(0x09, sp), a
      008A3E 1E 03            [ 2]  199 	ldw	x, (0x03, sp)
      008A40 89               [ 2]  200 	pushw	x
      008A41 1E 03            [ 2]  201 	ldw	x, (0x03, sp)
      008A43 89               [ 2]  202 	pushw	x
      008A44 4B 64            [ 1]  203 	push	#0x64
      008A46 5F               [ 1]  204 	clrw	x
      008A47 89               [ 2]  205 	pushw	x
      008A48 4B 00            [ 1]  206 	push	#0x00
      008A4A CD 92 79         [ 4]  207 	call	__mullong
      008A4D 5B 08            [ 2]  208 	addw	sp, #8
      008A4F 1F 0C            [ 2]  209 	ldw	(0x0c, sp), x
      008A51 17 0A            [ 2]  210 	ldw	(0x0a, sp), y
      008A53 1E 07            [ 2]  211 	ldw	x, (0x07, sp)
      008A55 72 F0 0C         [ 2]  212 	subw	x, (0x0c, sp)
      008A58 1F 10            [ 2]  213 	ldw	(0x10, sp), x
      008A5A 7B 06            [ 1]  214 	ld	a, (0x06, sp)
      008A5C 12 0B            [ 1]  215 	sbc	a, (0x0b, sp)
      008A5E 6B 0F            [ 1]  216 	ld	(0x0f, sp), a
      008A60 7B 05            [ 1]  217 	ld	a, (0x05, sp)
      008A62 12 0A            [ 1]  218 	sbc	a, (0x0a, sp)
      008A64 6B 0E            [ 1]  219 	ld	(0x0e, sp), a
      008A66 1E 10            [ 2]  220 	ldw	x, (0x10, sp)
      008A68 16 0E            [ 2]  221 	ldw	y, (0x0e, sp)
      008A6A A6 04            [ 1]  222 	ld	a, #0x04
      008A6C                        223 00129$:
      008A6C 58               [ 2]  224 	sllw	x
      008A6D 90 59            [ 2]  225 	rlcw	y
      008A6F 4A               [ 1]  226 	dec	a
      008A70 26 FA            [ 1]  227 	jrne	00129$
      008A72 4B 64            [ 1]  228 	push	#0x64
      008A74 4B 00            [ 1]  229 	push	#0x00
      008A76 4B 00            [ 1]  230 	push	#0x00
      008A78 4B 00            [ 1]  231 	push	#0x00
      008A7A 89               [ 2]  232 	pushw	x
      008A7B 90 89            [ 2]  233 	pushw	y
      008A7D CD 92 1E         [ 4]  234 	call	__divulong
      008A80 5B 08            [ 2]  235 	addw	sp, #8
      008A82 9F               [ 1]  236 	ld	a, xl
      008A83 A4 0F            [ 1]  237 	and	a, #0x0f
      008A85 1A 09            [ 1]  238 	or	a, (0x09, sp)
      008A87 C7 52 33         [ 1]  239 	ld	0x5233, a
                                    240 ;	lib/src/stm8s_uart1.c: 133: UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0); 
      008A8A C6 52 33         [ 1]  241 	ld	a, 0x5233
      008A8D 6B 11            [ 1]  242 	ld	(0x11, sp), a
      008A8F 1E 03            [ 2]  243 	ldw	x, (0x03, sp)
      008A91 A6 10            [ 1]  244 	ld	a, #0x10
      008A93 62               [ 2]  245 	div	x, a
      008A94 9F               [ 1]  246 	ld	a, xl
      008A95 A4 F0            [ 1]  247 	and	a, #0xf0
      008A97 1A 11            [ 1]  248 	or	a, (0x11, sp)
      008A99 C7 52 33         [ 1]  249 	ld	0x5233, a
                                    250 ;	lib/src/stm8s_uart1.c: 135: UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;           
      008A9C C6 52 32         [ 1]  251 	ld	a, 0x5232
      008A9F 6B 11            [ 1]  252 	ld	(0x11, sp), a
      008AA1 7B 04            [ 1]  253 	ld	a, (0x04, sp)
      008AA3 1A 11            [ 1]  254 	or	a, (0x11, sp)
      008AA5 C7 52 32         [ 1]  255 	ld	0x5232, a
                                    256 ;	lib/src/stm8s_uart1.c: 138: UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
      008AA8 C6 52 35         [ 1]  257 	ld	a, 0x5235
      008AAB A4 F3            [ 1]  258 	and	a, #0xf3
      008AAD C7 52 35         [ 1]  259 	ld	0x5235, a
                                    260 ;	lib/src/stm8s_uart1.c: 140: UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL); 
      008AB0 C6 52 36         [ 1]  261 	ld	a, 0x5236
      008AB3 A4 F8            [ 1]  262 	and	a, #0xf8
      008AB5 C7 52 36         [ 1]  263 	ld	0x5236, a
                                    264 ;	lib/src/stm8s_uart1.c: 142: UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL | 
      008AB8 C6 52 36         [ 1]  265 	ld	a, 0x5236
      008ABB 6B 11            [ 1]  266 	ld	(0x11, sp), a
      008ABD 7B 1B            [ 1]  267 	ld	a, (0x1b, sp)
      008ABF A4 07            [ 1]  268 	and	a, #0x07
      008AC1 1A 11            [ 1]  269 	or	a, (0x11, sp)
      008AC3 C7 52 36         [ 1]  270 	ld	0x5236, a
                                    271 ;	lib/src/stm8s_uart1.c: 138: UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
      008AC6 C6 52 35         [ 1]  272 	ld	a, 0x5235
                                    273 ;	lib/src/stm8s_uart1.c: 145: if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
      008AC9 88               [ 1]  274 	push	a
      008ACA 7B 1D            [ 1]  275 	ld	a, (0x1d, sp)
      008ACC A5 04            [ 1]  276 	bcp	a, #0x04
      008ACE 84               [ 1]  277 	pop	a
      008ACF 27 07            [ 1]  278 	jreq	00102$
                                    279 ;	lib/src/stm8s_uart1.c: 148: UART1->CR2 |= (uint8_t)UART1_CR2_TEN;  
      008AD1 AA 08            [ 1]  280 	or	a, #0x08
      008AD3 C7 52 35         [ 1]  281 	ld	0x5235, a
      008AD6 20 05            [ 2]  282 	jra	00103$
      008AD8                        283 00102$:
                                    284 ;	lib/src/stm8s_uart1.c: 153: UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);  
      008AD8 A4 F7            [ 1]  285 	and	a, #0xf7
      008ADA C7 52 35         [ 1]  286 	ld	0x5235, a
      008ADD                        287 00103$:
                                    288 ;	lib/src/stm8s_uart1.c: 138: UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
      008ADD C6 52 35         [ 1]  289 	ld	a, 0x5235
                                    290 ;	lib/src/stm8s_uart1.c: 155: if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
      008AE0 88               [ 1]  291 	push	a
      008AE1 7B 1D            [ 1]  292 	ld	a, (0x1d, sp)
      008AE3 A5 08            [ 1]  293 	bcp	a, #0x08
      008AE5 84               [ 1]  294 	pop	a
      008AE6 27 07            [ 1]  295 	jreq	00105$
                                    296 ;	lib/src/stm8s_uart1.c: 158: UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
      008AE8 AA 04            [ 1]  297 	or	a, #0x04
      008AEA C7 52 35         [ 1]  298 	ld	0x5235, a
      008AED 20 05            [ 2]  299 	jra	00106$
      008AEF                        300 00105$:
                                    301 ;	lib/src/stm8s_uart1.c: 163: UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);  
      008AEF A4 FB            [ 1]  302 	and	a, #0xfb
      008AF1 C7 52 35         [ 1]  303 	ld	0x5235, a
      008AF4                        304 00106$:
                                    305 ;	lib/src/stm8s_uart1.c: 111: UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
      008AF4 C6 52 36         [ 1]  306 	ld	a, 0x5236
                                    307 ;	lib/src/stm8s_uart1.c: 167: if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
      008AF7 0D 1B            [ 1]  308 	tnz	(0x1b, sp)
      008AF9 2A 07            [ 1]  309 	jrpl	00108$
                                    310 ;	lib/src/stm8s_uart1.c: 170: UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); 
      008AFB A4 F7            [ 1]  311 	and	a, #0xf7
      008AFD C7 52 36         [ 1]  312 	ld	0x5236, a
      008B00 20 0D            [ 2]  313 	jra	00110$
      008B02                        314 00108$:
                                    315 ;	lib/src/stm8s_uart1.c: 174: UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
      008B02 88               [ 1]  316 	push	a
      008B03 7B 1C            [ 1]  317 	ld	a, (0x1c, sp)
      008B05 A4 08            [ 1]  318 	and	a, #0x08
      008B07 6B 12            [ 1]  319 	ld	(0x12, sp), a
      008B09 84               [ 1]  320 	pop	a
      008B0A 1A 11            [ 1]  321 	or	a, (0x11, sp)
      008B0C C7 52 36         [ 1]  322 	ld	0x5236, a
      008B0F                        323 00110$:
                                    324 ;	lib/src/stm8s_uart1.c: 176: }
      008B0F 1E 12            [ 2]  325 	ldw	x, (18, sp)
      008B11 5B 1C            [ 2]  326 	addw	sp, #28
      008B13 FC               [ 2]  327 	jp	(x)
                                    328 ;	lib/src/stm8s_uart1.c: 184: void UART1_Cmd(FunctionalState NewState)
                                    329 ;	-----------------------------------------
                                    330 ;	 function UART1_Cmd
                                    331 ;	-----------------------------------------
      008B14                        332 _UART1_Cmd:
      008B14 88               [ 1]  333 	push	a
      008B15 6B 01            [ 1]  334 	ld	(0x01, sp), a
                                    335 ;	lib/src/stm8s_uart1.c: 189: UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
      008B17 C6 52 34         [ 1]  336 	ld	a, 0x5234
                                    337 ;	lib/src/stm8s_uart1.c: 186: if (NewState != DISABLE)
      008B1A 0D 01            [ 1]  338 	tnz	(0x01, sp)
      008B1C 27 07            [ 1]  339 	jreq	00102$
                                    340 ;	lib/src/stm8s_uart1.c: 189: UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
      008B1E A4 DF            [ 1]  341 	and	a, #0xdf
      008B20 C7 52 34         [ 1]  342 	ld	0x5234, a
      008B23 20 05            [ 2]  343 	jra	00104$
      008B25                        344 00102$:
                                    345 ;	lib/src/stm8s_uart1.c: 194: UART1->CR1 |= UART1_CR1_UARTD;  
      008B25 AA 20            [ 1]  346 	or	a, #0x20
      008B27 C7 52 34         [ 1]  347 	ld	0x5234, a
      008B2A                        348 00104$:
                                    349 ;	lib/src/stm8s_uart1.c: 196: }
      008B2A 84               [ 1]  350 	pop	a
      008B2B 81               [ 4]  351 	ret
                                    352 ;	lib/src/stm8s_uart1.c: 211: void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
                                    353 ;	-----------------------------------------
                                    354 ;	 function UART1_ITConfig
                                    355 ;	-----------------------------------------
      008B2C                        356 _UART1_ITConfig:
      008B2C 52 03            [ 2]  357 	sub	sp, #3
      008B2E 51               [ 1]  358 	exgw	x, y
      008B2F 6B 03            [ 1]  359 	ld	(0x03, sp), a
                                    360 ;	lib/src/stm8s_uart1.c: 220: uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
      008B31 93               [ 1]  361 	ldw	x, y
                                    362 ;	lib/src/stm8s_uart1.c: 222: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
      008B32 90 9F            [ 1]  363 	ld	a, yl
      008B34 A4 0F            [ 1]  364 	and	a, #0x0f
      008B36 41               [ 1]  365 	exg	a, xl
      008B37 A6 01            [ 1]  366 	ld	a, #0x01
      008B39 41               [ 1]  367 	exg	a, xl
      008B3A 4D               [ 1]  368 	tnz	a
      008B3B 27 06            [ 1]  369 	jreq	00144$
      008B3D                        370 00143$:
      008B3D 41               [ 1]  371 	exg	a, xl
      008B3E 48               [ 1]  372 	sll	a
      008B3F 41               [ 1]  373 	exg	a, xl
      008B40 4A               [ 1]  374 	dec	a
      008B41 26 FA            [ 1]  375 	jrne	00143$
      008B43                        376 00144$:
                                    377 ;	lib/src/stm8s_uart1.c: 227: if (uartreg == 0x01)
      008B43 9E               [ 1]  378 	ld	a, xh
      008B44 4A               [ 1]  379 	dec	a
      008B45 26 05            [ 1]  380 	jrne	00146$
      008B47 A6 01            [ 1]  381 	ld	a, #0x01
      008B49 6B 01            [ 1]  382 	ld	(0x01, sp), a
      008B4B C5                     383 	.byte 0xc5
      008B4C                        384 00146$:
      008B4C 0F 01            [ 1]  385 	clr	(0x01, sp)
      008B4E                        386 00147$:
                                    387 ;	lib/src/stm8s_uart1.c: 231: else if (uartreg == 0x02)
      008B4E 9E               [ 1]  388 	ld	a, xh
      008B4F A0 02            [ 1]  389 	sub	a, #0x02
      008B51 26 04            [ 1]  390 	jrne	00149$
      008B53 4C               [ 1]  391 	inc	a
      008B54 95               [ 1]  392 	ld	xh, a
      008B55 20 02            [ 2]  393 	jra	00150$
      008B57                        394 00149$:
      008B57 4F               [ 1]  395 	clr	a
      008B58 95               [ 1]  396 	ld	xh, a
      008B59                        397 00150$:
                                    398 ;	lib/src/stm8s_uart1.c: 224: if (NewState != DISABLE)
      008B59 0D 03            [ 1]  399 	tnz	(0x03, sp)
      008B5B 27 2C            [ 1]  400 	jreq	00114$
                                    401 ;	lib/src/stm8s_uart1.c: 227: if (uartreg == 0x01)
      008B5D 0D 01            [ 1]  402 	tnz	(0x01, sp)
      008B5F 27 0C            [ 1]  403 	jreq	00105$
                                    404 ;	lib/src/stm8s_uart1.c: 229: UART1->CR1 |= itpos;
      008B61 C6 52 34         [ 1]  405 	ld	a, 0x5234
      008B64 89               [ 2]  406 	pushw	x
      008B65 1A 02            [ 1]  407 	or	a, (2, sp)
      008B67 85               [ 2]  408 	popw	x
      008B68 C7 52 34         [ 1]  409 	ld	0x5234, a
      008B6B 20 44            [ 2]  410 	jra	00116$
      008B6D                        411 00105$:
                                    412 ;	lib/src/stm8s_uart1.c: 231: else if (uartreg == 0x02)
      008B6D 9E               [ 1]  413 	ld	a, xh
      008B6E 4D               [ 1]  414 	tnz	a
      008B6F 27 0C            [ 1]  415 	jreq	00102$
                                    416 ;	lib/src/stm8s_uart1.c: 233: UART1->CR2 |= itpos;
      008B71 C6 52 35         [ 1]  417 	ld	a, 0x5235
      008B74 89               [ 2]  418 	pushw	x
      008B75 1A 02            [ 1]  419 	or	a, (2, sp)
      008B77 85               [ 2]  420 	popw	x
      008B78 C7 52 35         [ 1]  421 	ld	0x5235, a
      008B7B 20 34            [ 2]  422 	jra	00116$
      008B7D                        423 00102$:
                                    424 ;	lib/src/stm8s_uart1.c: 237: UART1->CR4 |= itpos;
      008B7D C6 52 37         [ 1]  425 	ld	a, 0x5237
      008B80 89               [ 2]  426 	pushw	x
      008B81 1A 02            [ 1]  427 	or	a, (2, sp)
      008B83 85               [ 2]  428 	popw	x
      008B84 C7 52 37         [ 1]  429 	ld	0x5237, a
      008B87 20 28            [ 2]  430 	jra	00116$
      008B89                        431 00114$:
                                    432 ;	lib/src/stm8s_uart1.c: 245: UART1->CR1 &= (uint8_t)(~itpos);
      008B89 9F               [ 1]  433 	ld	a, xl
      008B8A 43               [ 1]  434 	cpl	a
      008B8B 6B 02            [ 1]  435 	ld	(0x02, sp), a
                                    436 ;	lib/src/stm8s_uart1.c: 243: if (uartreg == 0x01)
      008B8D 0D 01            [ 1]  437 	tnz	(0x01, sp)
      008B8F 27 0A            [ 1]  438 	jreq	00111$
                                    439 ;	lib/src/stm8s_uart1.c: 245: UART1->CR1 &= (uint8_t)(~itpos);
      008B91 C6 52 34         [ 1]  440 	ld	a, 0x5234
      008B94 14 02            [ 1]  441 	and	a, (0x02, sp)
      008B96 C7 52 34         [ 1]  442 	ld	0x5234, a
      008B99 20 16            [ 2]  443 	jra	00116$
      008B9B                        444 00111$:
                                    445 ;	lib/src/stm8s_uart1.c: 247: else if (uartreg == 0x02)
      008B9B 9E               [ 1]  446 	ld	a, xh
      008B9C 4D               [ 1]  447 	tnz	a
      008B9D 27 0A            [ 1]  448 	jreq	00108$
                                    449 ;	lib/src/stm8s_uart1.c: 249: UART1->CR2 &= (uint8_t)(~itpos);
      008B9F C6 52 35         [ 1]  450 	ld	a, 0x5235
      008BA2 14 02            [ 1]  451 	and	a, (0x02, sp)
      008BA4 C7 52 35         [ 1]  452 	ld	0x5235, a
      008BA7 20 08            [ 2]  453 	jra	00116$
      008BA9                        454 00108$:
                                    455 ;	lib/src/stm8s_uart1.c: 253: UART1->CR4 &= (uint8_t)(~itpos);
      008BA9 C6 52 37         [ 1]  456 	ld	a, 0x5237
      008BAC 14 02            [ 1]  457 	and	a, (0x02, sp)
      008BAE C7 52 37         [ 1]  458 	ld	0x5237, a
      008BB1                        459 00116$:
                                    460 ;	lib/src/stm8s_uart1.c: 257: }
      008BB1 5B 03            [ 2]  461 	addw	sp, #3
      008BB3 81               [ 4]  462 	ret
                                    463 ;	lib/src/stm8s_uart1.c: 265: void UART1_HalfDuplexCmd(FunctionalState NewState)
                                    464 ;	-----------------------------------------
                                    465 ;	 function UART1_HalfDuplexCmd
                                    466 ;	-----------------------------------------
      008BB4                        467 _UART1_HalfDuplexCmd:
      008BB4 88               [ 1]  468 	push	a
      008BB5 6B 01            [ 1]  469 	ld	(0x01, sp), a
                                    470 ;	lib/src/stm8s_uart1.c: 271: UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
      008BB7 C6 52 38         [ 1]  471 	ld	a, 0x5238
                                    472 ;	lib/src/stm8s_uart1.c: 269: if (NewState != DISABLE)
      008BBA 0D 01            [ 1]  473 	tnz	(0x01, sp)
      008BBC 27 07            [ 1]  474 	jreq	00102$
                                    475 ;	lib/src/stm8s_uart1.c: 271: UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
      008BBE AA 08            [ 1]  476 	or	a, #0x08
      008BC0 C7 52 38         [ 1]  477 	ld	0x5238, a
      008BC3 20 05            [ 2]  478 	jra	00104$
      008BC5                        479 00102$:
                                    480 ;	lib/src/stm8s_uart1.c: 275: UART1->CR5 &= (uint8_t)~UART1_CR5_HDSEL; /**< UART1 Half Duplex Disable */
      008BC5 A4 F7            [ 1]  481 	and	a, #0xf7
      008BC7 C7 52 38         [ 1]  482 	ld	0x5238, a
      008BCA                        483 00104$:
                                    484 ;	lib/src/stm8s_uart1.c: 277: }
      008BCA 84               [ 1]  485 	pop	a
      008BCB 81               [ 4]  486 	ret
                                    487 ;	lib/src/stm8s_uart1.c: 285: void UART1_IrDAConfig(UART1_IrDAMode_TypeDef UART1_IrDAMode)
                                    488 ;	-----------------------------------------
                                    489 ;	 function UART1_IrDAConfig
                                    490 ;	-----------------------------------------
      008BCC                        491 _UART1_IrDAConfig:
      008BCC 88               [ 1]  492 	push	a
      008BCD 6B 01            [ 1]  493 	ld	(0x01, sp), a
                                    494 ;	lib/src/stm8s_uart1.c: 291: UART1->CR5 |= UART1_CR5_IRLP;
      008BCF C6 52 38         [ 1]  495 	ld	a, 0x5238
                                    496 ;	lib/src/stm8s_uart1.c: 289: if (UART1_IrDAMode != UART1_IRDAMODE_NORMAL)
      008BD2 0D 01            [ 1]  497 	tnz	(0x01, sp)
      008BD4 27 07            [ 1]  498 	jreq	00102$
                                    499 ;	lib/src/stm8s_uart1.c: 291: UART1->CR5 |= UART1_CR5_IRLP;
      008BD6 AA 04            [ 1]  500 	or	a, #0x04
      008BD8 C7 52 38         [ 1]  501 	ld	0x5238, a
      008BDB 20 05            [ 2]  502 	jra	00104$
      008BDD                        503 00102$:
                                    504 ;	lib/src/stm8s_uart1.c: 295: UART1->CR5 &= ((uint8_t)~UART1_CR5_IRLP);
      008BDD A4 FB            [ 1]  505 	and	a, #0xfb
      008BDF C7 52 38         [ 1]  506 	ld	0x5238, a
      008BE2                        507 00104$:
                                    508 ;	lib/src/stm8s_uart1.c: 297: }
      008BE2 84               [ 1]  509 	pop	a
      008BE3 81               [ 4]  510 	ret
                                    511 ;	lib/src/stm8s_uart1.c: 305: void UART1_IrDACmd(FunctionalState NewState)
                                    512 ;	-----------------------------------------
                                    513 ;	 function UART1_IrDACmd
                                    514 ;	-----------------------------------------
      008BE4                        515 _UART1_IrDACmd:
      008BE4 88               [ 1]  516 	push	a
      008BE5 6B 01            [ 1]  517 	ld	(0x01, sp), a
                                    518 ;	lib/src/stm8s_uart1.c: 313: UART1->CR5 |= UART1_CR5_IREN;
      008BE7 C6 52 38         [ 1]  519 	ld	a, 0x5238
                                    520 ;	lib/src/stm8s_uart1.c: 310: if (NewState != DISABLE)
      008BEA 0D 01            [ 1]  521 	tnz	(0x01, sp)
      008BEC 27 07            [ 1]  522 	jreq	00102$
                                    523 ;	lib/src/stm8s_uart1.c: 313: UART1->CR5 |= UART1_CR5_IREN;
      008BEE AA 02            [ 1]  524 	or	a, #0x02
      008BF0 C7 52 38         [ 1]  525 	ld	0x5238, a
      008BF3 20 05            [ 2]  526 	jra	00104$
      008BF5                        527 00102$:
                                    528 ;	lib/src/stm8s_uart1.c: 318: UART1->CR5 &= ((uint8_t)~UART1_CR5_IREN);
      008BF5 A4 FD            [ 1]  529 	and	a, #0xfd
      008BF7 C7 52 38         [ 1]  530 	ld	0x5238, a
      008BFA                        531 00104$:
                                    532 ;	lib/src/stm8s_uart1.c: 320: }
      008BFA 84               [ 1]  533 	pop	a
      008BFB 81               [ 4]  534 	ret
                                    535 ;	lib/src/stm8s_uart1.c: 329: void UART1_LINBreakDetectionConfig(UART1_LINBreakDetectionLength_TypeDef UART1_LINBreakDetectionLength)
                                    536 ;	-----------------------------------------
                                    537 ;	 function UART1_LINBreakDetectionConfig
                                    538 ;	-----------------------------------------
      008BFC                        539 _UART1_LINBreakDetectionConfig:
      008BFC 88               [ 1]  540 	push	a
      008BFD 6B 01            [ 1]  541 	ld	(0x01, sp), a
                                    542 ;	lib/src/stm8s_uart1.c: 335: UART1->CR4 |= UART1_CR4_LBDL;
      008BFF C6 52 37         [ 1]  543 	ld	a, 0x5237
                                    544 ;	lib/src/stm8s_uart1.c: 333: if (UART1_LINBreakDetectionLength != UART1_LINBREAKDETECTIONLENGTH_10BITS)
      008C02 0D 01            [ 1]  545 	tnz	(0x01, sp)
      008C04 27 07            [ 1]  546 	jreq	00102$
                                    547 ;	lib/src/stm8s_uart1.c: 335: UART1->CR4 |= UART1_CR4_LBDL;
      008C06 AA 20            [ 1]  548 	or	a, #0x20
      008C08 C7 52 37         [ 1]  549 	ld	0x5237, a
      008C0B 20 05            [ 2]  550 	jra	00104$
      008C0D                        551 00102$:
                                    552 ;	lib/src/stm8s_uart1.c: 339: UART1->CR4 &= ((uint8_t)~UART1_CR4_LBDL);
      008C0D A4 DF            [ 1]  553 	and	a, #0xdf
      008C0F C7 52 37         [ 1]  554 	ld	0x5237, a
      008C12                        555 00104$:
                                    556 ;	lib/src/stm8s_uart1.c: 341: }
      008C12 84               [ 1]  557 	pop	a
      008C13 81               [ 4]  558 	ret
                                    559 ;	lib/src/stm8s_uart1.c: 349: void UART1_LINCmd(FunctionalState NewState)
                                    560 ;	-----------------------------------------
                                    561 ;	 function UART1_LINCmd
                                    562 ;	-----------------------------------------
      008C14                        563 _UART1_LINCmd:
      008C14 88               [ 1]  564 	push	a
      008C15 6B 01            [ 1]  565 	ld	(0x01, sp), a
                                    566 ;	lib/src/stm8s_uart1.c: 356: UART1->CR3 |= UART1_CR3_LINEN;
      008C17 C6 52 36         [ 1]  567 	ld	a, 0x5236
                                    568 ;	lib/src/stm8s_uart1.c: 353: if (NewState != DISABLE)
      008C1A 0D 01            [ 1]  569 	tnz	(0x01, sp)
      008C1C 27 07            [ 1]  570 	jreq	00102$
                                    571 ;	lib/src/stm8s_uart1.c: 356: UART1->CR3 |= UART1_CR3_LINEN;
      008C1E AA 40            [ 1]  572 	or	a, #0x40
      008C20 C7 52 36         [ 1]  573 	ld	0x5236, a
      008C23 20 05            [ 2]  574 	jra	00104$
      008C25                        575 00102$:
                                    576 ;	lib/src/stm8s_uart1.c: 361: UART1->CR3 &= ((uint8_t)~UART1_CR3_LINEN);
      008C25 A4 BF            [ 1]  577 	and	a, #0xbf
      008C27 C7 52 36         [ 1]  578 	ld	0x5236, a
      008C2A                        579 00104$:
                                    580 ;	lib/src/stm8s_uart1.c: 363: }
      008C2A 84               [ 1]  581 	pop	a
      008C2B 81               [ 4]  582 	ret
                                    583 ;	lib/src/stm8s_uart1.c: 371: void UART1_SmartCardCmd(FunctionalState NewState)
                                    584 ;	-----------------------------------------
                                    585 ;	 function UART1_SmartCardCmd
                                    586 ;	-----------------------------------------
      008C2C                        587 _UART1_SmartCardCmd:
      008C2C 88               [ 1]  588 	push	a
      008C2D 6B 01            [ 1]  589 	ld	(0x01, sp), a
                                    590 ;	lib/src/stm8s_uart1.c: 378: UART1->CR5 |= UART1_CR5_SCEN;
      008C2F C6 52 38         [ 1]  591 	ld	a, 0x5238
                                    592 ;	lib/src/stm8s_uart1.c: 375: if (NewState != DISABLE)
      008C32 0D 01            [ 1]  593 	tnz	(0x01, sp)
      008C34 27 07            [ 1]  594 	jreq	00102$
                                    595 ;	lib/src/stm8s_uart1.c: 378: UART1->CR5 |= UART1_CR5_SCEN;
      008C36 AA 20            [ 1]  596 	or	a, #0x20
      008C38 C7 52 38         [ 1]  597 	ld	0x5238, a
      008C3B 20 05            [ 2]  598 	jra	00104$
      008C3D                        599 00102$:
                                    600 ;	lib/src/stm8s_uart1.c: 383: UART1->CR5 &= ((uint8_t)(~UART1_CR5_SCEN));
      008C3D A4 DF            [ 1]  601 	and	a, #0xdf
      008C3F C7 52 38         [ 1]  602 	ld	0x5238, a
      008C42                        603 00104$:
                                    604 ;	lib/src/stm8s_uart1.c: 385: }
      008C42 84               [ 1]  605 	pop	a
      008C43 81               [ 4]  606 	ret
                                    607 ;	lib/src/stm8s_uart1.c: 394: void UART1_SmartCardNACKCmd(FunctionalState NewState)
                                    608 ;	-----------------------------------------
                                    609 ;	 function UART1_SmartCardNACKCmd
                                    610 ;	-----------------------------------------
      008C44                        611 _UART1_SmartCardNACKCmd:
      008C44 88               [ 1]  612 	push	a
      008C45 6B 01            [ 1]  613 	ld	(0x01, sp), a
                                    614 ;	lib/src/stm8s_uart1.c: 401: UART1->CR5 |= UART1_CR5_NACK;
      008C47 C6 52 38         [ 1]  615 	ld	a, 0x5238
                                    616 ;	lib/src/stm8s_uart1.c: 398: if (NewState != DISABLE)
      008C4A 0D 01            [ 1]  617 	tnz	(0x01, sp)
      008C4C 27 07            [ 1]  618 	jreq	00102$
                                    619 ;	lib/src/stm8s_uart1.c: 401: UART1->CR5 |= UART1_CR5_NACK;
      008C4E AA 10            [ 1]  620 	or	a, #0x10
      008C50 C7 52 38         [ 1]  621 	ld	0x5238, a
      008C53 20 05            [ 2]  622 	jra	00104$
      008C55                        623 00102$:
                                    624 ;	lib/src/stm8s_uart1.c: 406: UART1->CR5 &= ((uint8_t)~(UART1_CR5_NACK));
      008C55 A4 EF            [ 1]  625 	and	a, #0xef
      008C57 C7 52 38         [ 1]  626 	ld	0x5238, a
      008C5A                        627 00104$:
                                    628 ;	lib/src/stm8s_uart1.c: 408: }
      008C5A 84               [ 1]  629 	pop	a
      008C5B 81               [ 4]  630 	ret
                                    631 ;	lib/src/stm8s_uart1.c: 416: void UART1_WakeUpConfig(UART1_WakeUp_TypeDef UART1_WakeUp)
                                    632 ;	-----------------------------------------
                                    633 ;	 function UART1_WakeUpConfig
                                    634 ;	-----------------------------------------
      008C5C                        635 _UART1_WakeUpConfig:
      008C5C 88               [ 1]  636 	push	a
      008C5D 6B 01            [ 1]  637 	ld	(0x01, sp), a
                                    638 ;	lib/src/stm8s_uart1.c: 420: UART1->CR1 &= ((uint8_t)~UART1_CR1_WAKE);
      008C5F 72 17 52 34      [ 1]  639 	bres	0x5234, #3
                                    640 ;	lib/src/stm8s_uart1.c: 421: UART1->CR1 |= (uint8_t)UART1_WakeUp;
      008C63 C6 52 34         [ 1]  641 	ld	a, 0x5234
      008C66 1A 01            [ 1]  642 	or	a, (0x01, sp)
      008C68 C7 52 34         [ 1]  643 	ld	0x5234, a
                                    644 ;	lib/src/stm8s_uart1.c: 422: }
      008C6B 84               [ 1]  645 	pop	a
      008C6C 81               [ 4]  646 	ret
                                    647 ;	lib/src/stm8s_uart1.c: 430: void UART1_ReceiverWakeUpCmd(FunctionalState NewState)
                                    648 ;	-----------------------------------------
                                    649 ;	 function UART1_ReceiverWakeUpCmd
                                    650 ;	-----------------------------------------
      008C6D                        651 _UART1_ReceiverWakeUpCmd:
      008C6D 88               [ 1]  652 	push	a
      008C6E 6B 01            [ 1]  653 	ld	(0x01, sp), a
                                    654 ;	lib/src/stm8s_uart1.c: 437: UART1->CR2 |= UART1_CR2_RWU;
      008C70 C6 52 35         [ 1]  655 	ld	a, 0x5235
                                    656 ;	lib/src/stm8s_uart1.c: 434: if (NewState != DISABLE)
      008C73 0D 01            [ 1]  657 	tnz	(0x01, sp)
      008C75 27 07            [ 1]  658 	jreq	00102$
                                    659 ;	lib/src/stm8s_uart1.c: 437: UART1->CR2 |= UART1_CR2_RWU;
      008C77 AA 02            [ 1]  660 	or	a, #0x02
      008C79 C7 52 35         [ 1]  661 	ld	0x5235, a
      008C7C 20 05            [ 2]  662 	jra	00104$
      008C7E                        663 00102$:
                                    664 ;	lib/src/stm8s_uart1.c: 442: UART1->CR2 &= ((uint8_t)~UART1_CR2_RWU);
      008C7E A4 FD            [ 1]  665 	and	a, #0xfd
      008C80 C7 52 35         [ 1]  666 	ld	0x5235, a
      008C83                        667 00104$:
                                    668 ;	lib/src/stm8s_uart1.c: 444: }
      008C83 84               [ 1]  669 	pop	a
      008C84 81               [ 4]  670 	ret
                                    671 ;	lib/src/stm8s_uart1.c: 451: uint8_t UART1_ReceiveData8(void)
                                    672 ;	-----------------------------------------
                                    673 ;	 function UART1_ReceiveData8
                                    674 ;	-----------------------------------------
      008C85                        675 _UART1_ReceiveData8:
                                    676 ;	lib/src/stm8s_uart1.c: 453: return ((uint8_t)UART1->DR);
      008C85 C6 52 31         [ 1]  677 	ld	a, 0x5231
                                    678 ;	lib/src/stm8s_uart1.c: 454: }
      008C88 81               [ 4]  679 	ret
                                    680 ;	lib/src/stm8s_uart1.c: 461: uint16_t UART1_ReceiveData9(void)
                                    681 ;	-----------------------------------------
                                    682 ;	 function UART1_ReceiveData9
                                    683 ;	-----------------------------------------
      008C89                        684 _UART1_ReceiveData9:
      008C89 52 02            [ 2]  685 	sub	sp, #2
                                    686 ;	lib/src/stm8s_uart1.c: 465: temp = (uint16_t)(((uint16_t)( (uint16_t)UART1->CR1 & (uint16_t)UART1_CR1_R8)) << 1);
      008C8B C6 52 34         [ 1]  687 	ld	a, 0x5234
      008C8E A4 80            [ 1]  688 	and	a, #0x80
      008C90 97               [ 1]  689 	ld	xl, a
      008C91 4F               [ 1]  690 	clr	a
      008C92 95               [ 1]  691 	ld	xh, a
      008C93 58               [ 2]  692 	sllw	x
      008C94 1F 01            [ 2]  693 	ldw	(0x01, sp), x
                                    694 ;	lib/src/stm8s_uart1.c: 466: return (uint16_t)( (((uint16_t) UART1->DR) | temp ) & ((uint16_t)0x01FF));
      008C96 C6 52 31         [ 1]  695 	ld	a, 0x5231
      008C99 5F               [ 1]  696 	clrw	x
      008C9A 1A 02            [ 1]  697 	or	a, (0x02, sp)
      008C9C 02               [ 1]  698 	rlwa	x
      008C9D 1A 01            [ 1]  699 	or	a, (0x01, sp)
      008C9F A4 01            [ 1]  700 	and	a, #0x01
      008CA1 95               [ 1]  701 	ld	xh, a
                                    702 ;	lib/src/stm8s_uart1.c: 467: }
      008CA2 5B 02            [ 2]  703 	addw	sp, #2
      008CA4 81               [ 4]  704 	ret
                                    705 ;	lib/src/stm8s_uart1.c: 474: void UART1_SendData8(uint8_t Data)
                                    706 ;	-----------------------------------------
                                    707 ;	 function UART1_SendData8
                                    708 ;	-----------------------------------------
      008CA5                        709 _UART1_SendData8:
                                    710 ;	lib/src/stm8s_uart1.c: 477: UART1->DR = Data;
      008CA5 C7 52 31         [ 1]  711 	ld	0x5231, a
                                    712 ;	lib/src/stm8s_uart1.c: 478: }
      008CA8 81               [ 4]  713 	ret
                                    714 ;	lib/src/stm8s_uart1.c: 486: void UART1_SendData9(uint16_t Data)
                                    715 ;	-----------------------------------------
                                    716 ;	 function UART1_SendData9
                                    717 ;	-----------------------------------------
      008CA9                        718 _UART1_SendData9:
      008CA9 88               [ 1]  719 	push	a
      008CAA 51               [ 1]  720 	exgw	x, y
                                    721 ;	lib/src/stm8s_uart1.c: 489: UART1->CR1 &= ((uint8_t)~UART1_CR1_T8);
      008CAB 72 1D 52 34      [ 1]  722 	bres	0x5234, #6
                                    723 ;	lib/src/stm8s_uart1.c: 491: UART1->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART1_CR1_T8);
      008CAF C6 52 34         [ 1]  724 	ld	a, 0x5234
      008CB2 6B 01            [ 1]  725 	ld	(0x01, sp), a
      008CB4 93               [ 1]  726 	ldw	x, y
      008CB5 54               [ 2]  727 	srlw	x
      008CB6 54               [ 2]  728 	srlw	x
      008CB7 9F               [ 1]  729 	ld	a, xl
      008CB8 A4 40            [ 1]  730 	and	a, #0x40
      008CBA 1A 01            [ 1]  731 	or	a, (0x01, sp)
      008CBC C7 52 34         [ 1]  732 	ld	0x5234, a
                                    733 ;	lib/src/stm8s_uart1.c: 493: UART1->DR   = (uint8_t)(Data);
      008CBF 90 9F            [ 1]  734 	ld	a, yl
      008CC1 C7 52 31         [ 1]  735 	ld	0x5231, a
                                    736 ;	lib/src/stm8s_uart1.c: 494: }
      008CC4 84               [ 1]  737 	pop	a
      008CC5 81               [ 4]  738 	ret
                                    739 ;	lib/src/stm8s_uart1.c: 501: void UART1_SendBreak(void)
                                    740 ;	-----------------------------------------
                                    741 ;	 function UART1_SendBreak
                                    742 ;	-----------------------------------------
      008CC6                        743 _UART1_SendBreak:
                                    744 ;	lib/src/stm8s_uart1.c: 503: UART1->CR2 |= UART1_CR2_SBK;
      008CC6 72 10 52 35      [ 1]  745 	bset	0x5235, #0
                                    746 ;	lib/src/stm8s_uart1.c: 504: }
      008CCA 81               [ 4]  747 	ret
                                    748 ;	lib/src/stm8s_uart1.c: 511: void UART1_SetAddress(uint8_t UART1_Address)
                                    749 ;	-----------------------------------------
                                    750 ;	 function UART1_SetAddress
                                    751 ;	-----------------------------------------
      008CCB                        752 _UART1_SetAddress:
      008CCB 88               [ 1]  753 	push	a
      008CCC 6B 01            [ 1]  754 	ld	(0x01, sp), a
                                    755 ;	lib/src/stm8s_uart1.c: 517: UART1->CR4 &= ((uint8_t)~UART1_CR4_ADD);
      008CCE C6 52 37         [ 1]  756 	ld	a, 0x5237
      008CD1 A4 F0            [ 1]  757 	and	a, #0xf0
      008CD3 C7 52 37         [ 1]  758 	ld	0x5237, a
                                    759 ;	lib/src/stm8s_uart1.c: 519: UART1->CR4 |= UART1_Address;
      008CD6 C6 52 37         [ 1]  760 	ld	a, 0x5237
      008CD9 1A 01            [ 1]  761 	or	a, (0x01, sp)
      008CDB C7 52 37         [ 1]  762 	ld	0x5237, a
                                    763 ;	lib/src/stm8s_uart1.c: 520: }
      008CDE 84               [ 1]  764 	pop	a
      008CDF 81               [ 4]  765 	ret
                                    766 ;	lib/src/stm8s_uart1.c: 528: void UART1_SetGuardTime(uint8_t UART1_GuardTime)
                                    767 ;	-----------------------------------------
                                    768 ;	 function UART1_SetGuardTime
                                    769 ;	-----------------------------------------
      008CE0                        770 _UART1_SetGuardTime:
                                    771 ;	lib/src/stm8s_uart1.c: 531: UART1->GTR = UART1_GuardTime;
      008CE0 C7 52 39         [ 1]  772 	ld	0x5239, a
                                    773 ;	lib/src/stm8s_uart1.c: 532: }
      008CE3 81               [ 4]  774 	ret
                                    775 ;	lib/src/stm8s_uart1.c: 556: void UART1_SetPrescaler(uint8_t UART1_Prescaler)
                                    776 ;	-----------------------------------------
                                    777 ;	 function UART1_SetPrescaler
                                    778 ;	-----------------------------------------
      008CE4                        779 _UART1_SetPrescaler:
                                    780 ;	lib/src/stm8s_uart1.c: 559: UART1->PSCR = UART1_Prescaler;
      008CE4 C7 52 3A         [ 1]  781 	ld	0x523a, a
                                    782 ;	lib/src/stm8s_uart1.c: 560: }
      008CE7 81               [ 4]  783 	ret
                                    784 ;	lib/src/stm8s_uart1.c: 568: FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
                                    785 ;	-----------------------------------------
                                    786 ;	 function UART1_GetFlagStatus
                                    787 ;	-----------------------------------------
      008CE8                        788 _UART1_GetFlagStatus:
      008CE8 52 03            [ 2]  789 	sub	sp, #3
                                    790 ;	lib/src/stm8s_uart1.c: 577: if (UART1_FLAG == UART1_FLAG_LBDF)
      008CEA 1F 01            [ 2]  791 	ldw	(0x01, sp), x
                                    792 ;	lib/src/stm8s_uart1.c: 579: if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
      008CEC 41               [ 1]  793 	exg	a, xl
      008CED 6B 03            [ 1]  794 	ld	(0x03, sp), a
      008CEF 41               [ 1]  795 	exg	a, xl
                                    796 ;	lib/src/stm8s_uart1.c: 577: if (UART1_FLAG == UART1_FLAG_LBDF)
      008CF0 1E 01            [ 2]  797 	ldw	x, (0x01, sp)
      008CF2 A3 02 10         [ 2]  798 	cpw	x, #0x0210
      008CF5 26 0E            [ 1]  799 	jrne	00114$
                                    800 ;	lib/src/stm8s_uart1.c: 579: if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
      008CF7 C6 52 37         [ 1]  801 	ld	a, 0x5237
      008CFA 14 03            [ 1]  802 	and	a, (0x03, sp)
      008CFC 27 04            [ 1]  803 	jreq	00102$
                                    804 ;	lib/src/stm8s_uart1.c: 582: status = SET;
      008CFE A6 01            [ 1]  805 	ld	a, #0x01
      008D00 20 23            [ 2]  806 	jra	00115$
      008D02                        807 00102$:
                                    808 ;	lib/src/stm8s_uart1.c: 587: status = RESET;
      008D02 4F               [ 1]  809 	clr	a
      008D03 20 20            [ 2]  810 	jra	00115$
      008D05                        811 00114$:
                                    812 ;	lib/src/stm8s_uart1.c: 590: else if (UART1_FLAG == UART1_FLAG_SBK)
      008D05 1E 01            [ 2]  813 	ldw	x, (0x01, sp)
      008D07 A3 01 01         [ 2]  814 	cpw	x, #0x0101
      008D0A 26 0E            [ 1]  815 	jrne	00111$
                                    816 ;	lib/src/stm8s_uart1.c: 592: if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
      008D0C C6 52 35         [ 1]  817 	ld	a, 0x5235
      008D0F 14 03            [ 1]  818 	and	a, (0x03, sp)
      008D11 27 04            [ 1]  819 	jreq	00105$
                                    820 ;	lib/src/stm8s_uart1.c: 595: status = SET;
      008D13 A6 01            [ 1]  821 	ld	a, #0x01
      008D15 20 0E            [ 2]  822 	jra	00115$
      008D17                        823 00105$:
                                    824 ;	lib/src/stm8s_uart1.c: 600: status = RESET;
      008D17 4F               [ 1]  825 	clr	a
      008D18 20 0B            [ 2]  826 	jra	00115$
      008D1A                        827 00111$:
                                    828 ;	lib/src/stm8s_uart1.c: 605: if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
      008D1A C6 52 30         [ 1]  829 	ld	a, 0x5230
      008D1D 14 03            [ 1]  830 	and	a, (0x03, sp)
      008D1F 27 03            [ 1]  831 	jreq	00108$
                                    832 ;	lib/src/stm8s_uart1.c: 608: status = SET;
      008D21 A6 01            [ 1]  833 	ld	a, #0x01
                                    834 ;	lib/src/stm8s_uart1.c: 613: status = RESET;
      008D23 21                     835 	.byte 0x21
      008D24                        836 00108$:
      008D24 4F               [ 1]  837 	clr	a
      008D25                        838 00115$:
                                    839 ;	lib/src/stm8s_uart1.c: 617: return status;
                                    840 ;	lib/src/stm8s_uart1.c: 618: }
      008D25 5B 03            [ 2]  841 	addw	sp, #3
      008D27 81               [ 4]  842 	ret
                                    843 ;	lib/src/stm8s_uart1.c: 646: void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
                                    844 ;	-----------------------------------------
                                    845 ;	 function UART1_ClearFlag
                                    846 ;	-----------------------------------------
      008D28                        847 _UART1_ClearFlag:
                                    848 ;	lib/src/stm8s_uart1.c: 651: if (UART1_FLAG == UART1_FLAG_RXNE)
      008D28 A3 00 20         [ 2]  849 	cpw	x, #0x0020
      008D2B 26 05            [ 1]  850 	jrne	00102$
                                    851 ;	lib/src/stm8s_uart1.c: 653: UART1->SR = (uint8_t)~(UART1_SR_RXNE);
      008D2D 35 DF 52 30      [ 1]  852 	mov	0x5230+0, #0xdf
      008D31 81               [ 4]  853 	ret
      008D32                        854 00102$:
                                    855 ;	lib/src/stm8s_uart1.c: 658: UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
      008D32 72 19 52 37      [ 1]  856 	bres	0x5237, #4
                                    857 ;	lib/src/stm8s_uart1.c: 660: }
      008D36 81               [ 4]  858 	ret
                                    859 ;	lib/src/stm8s_uart1.c: 675: ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
                                    860 ;	-----------------------------------------
                                    861 ;	 function UART1_GetITStatus
                                    862 ;	-----------------------------------------
      008D37                        863 _UART1_GetITStatus:
      008D37 52 04            [ 2]  864 	sub	sp, #4
                                    865 ;	lib/src/stm8s_uart1.c: 687: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
      008D39 90 93            [ 1]  866 	ldw	y, x
      008D3B 9F               [ 1]  867 	ld	a, xl
      008D3C A4 0F            [ 1]  868 	and	a, #0x0f
      008D3E 88               [ 1]  869 	push	a
      008D3F A6 01            [ 1]  870 	ld	a, #0x01
      008D41 6B 02            [ 1]  871 	ld	(0x02, sp), a
      008D43 84               [ 1]  872 	pop	a
      008D44 4D               [ 1]  873 	tnz	a
      008D45 27 05            [ 1]  874 	jreq	00162$
      008D47                        875 00161$:
      008D47 08 01            [ 1]  876 	sll	(0x01, sp)
      008D49 4A               [ 1]  877 	dec	a
      008D4A 26 FB            [ 1]  878 	jrne	00161$
      008D4C                        879 00162$:
                                    880 ;	lib/src/stm8s_uart1.c: 689: itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
      008D4C 9F               [ 1]  881 	ld	a, xl
      008D4D 4E               [ 1]  882 	swap	a
      008D4E A4 0F            [ 1]  883 	and	a, #0x0f
                                    884 ;	lib/src/stm8s_uart1.c: 691: itmask2 = (uint8_t)((uint8_t)1 << itmask1);
      008D50 88               [ 1]  885 	push	a
      008D51 A6 01            [ 1]  886 	ld	a, #0x01
      008D53 6B 03            [ 1]  887 	ld	(0x03, sp), a
      008D55 84               [ 1]  888 	pop	a
      008D56 4D               [ 1]  889 	tnz	a
      008D57 27 05            [ 1]  890 	jreq	00164$
      008D59                        891 00163$:
      008D59 08 02            [ 1]  892 	sll	(0x02, sp)
      008D5B 4A               [ 1]  893 	dec	a
      008D5C 26 FB            [ 1]  894 	jrne	00163$
      008D5E                        895 00164$:
                                    896 ;	lib/src/stm8s_uart1.c: 695: if (UART1_IT == UART1_IT_PE)
      008D5E 17 03            [ 2]  897 	ldw	(0x03, sp), y
      008D60 93               [ 1]  898 	ldw	x, y
      008D61 A3 01 00         [ 2]  899 	cpw	x, #0x0100
      008D64 26 18            [ 1]  900 	jrne	00117$
                                    901 ;	lib/src/stm8s_uart1.c: 698: enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
      008D66 C6 52 34         [ 1]  902 	ld	a, 0x5234
      008D69 14 02            [ 1]  903 	and	a, (0x02, sp)
      008D6B 97               [ 1]  904 	ld	xl, a
                                    905 ;	lib/src/stm8s_uart1.c: 701: if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
      008D6C C6 52 30         [ 1]  906 	ld	a, 0x5230
      008D6F 14 01            [ 1]  907 	and	a, (0x01, sp)
      008D71 27 08            [ 1]  908 	jreq	00102$
      008D73 9F               [ 1]  909 	ld	a, xl
      008D74 4D               [ 1]  910 	tnz	a
      008D75 27 04            [ 1]  911 	jreq	00102$
                                    912 ;	lib/src/stm8s_uart1.c: 704: pendingbitstatus = SET;
      008D77 A6 01            [ 1]  913 	ld	a, #0x01
      008D79 20 37            [ 2]  914 	jra	00118$
      008D7B                        915 00102$:
                                    916 ;	lib/src/stm8s_uart1.c: 709: pendingbitstatus = RESET;
      008D7B 4F               [ 1]  917 	clr	a
      008D7C 20 34            [ 2]  918 	jra	00118$
      008D7E                        919 00117$:
                                    920 ;	lib/src/stm8s_uart1.c: 713: else if (UART1_IT == UART1_IT_LBDF)
      008D7E 1E 03            [ 2]  921 	ldw	x, (0x03, sp)
      008D80 A3 03 46         [ 2]  922 	cpw	x, #0x0346
      008D83 26 18            [ 1]  923 	jrne	00114$
                                    924 ;	lib/src/stm8s_uart1.c: 716: enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
      008D85 C6 52 37         [ 1]  925 	ld	a, 0x5237
      008D88 14 02            [ 1]  926 	and	a, (0x02, sp)
      008D8A 97               [ 1]  927 	ld	xl, a
                                    928 ;	lib/src/stm8s_uart1.c: 718: if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
      008D8B C6 52 37         [ 1]  929 	ld	a, 0x5237
      008D8E 14 01            [ 1]  930 	and	a, (0x01, sp)
      008D90 27 08            [ 1]  931 	jreq	00106$
      008D92 9F               [ 1]  932 	ld	a, xl
      008D93 4D               [ 1]  933 	tnz	a
      008D94 27 04            [ 1]  934 	jreq	00106$
                                    935 ;	lib/src/stm8s_uart1.c: 721: pendingbitstatus = SET;
      008D96 A6 01            [ 1]  936 	ld	a, #0x01
      008D98 20 18            [ 2]  937 	jra	00118$
      008D9A                        938 00106$:
                                    939 ;	lib/src/stm8s_uart1.c: 726: pendingbitstatus = RESET;
      008D9A 4F               [ 1]  940 	clr	a
      008D9B 20 15            [ 2]  941 	jra	00118$
      008D9D                        942 00114$:
                                    943 ;	lib/src/stm8s_uart1.c: 732: enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
      008D9D C6 52 35         [ 1]  944 	ld	a, 0x5235
      008DA0 14 02            [ 1]  945 	and	a, (0x02, sp)
      008DA2 97               [ 1]  946 	ld	xl, a
                                    947 ;	lib/src/stm8s_uart1.c: 734: if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
      008DA3 C6 52 30         [ 1]  948 	ld	a, 0x5230
      008DA6 14 01            [ 1]  949 	and	a, (0x01, sp)
      008DA8 27 07            [ 1]  950 	jreq	00110$
      008DAA 9F               [ 1]  951 	ld	a, xl
      008DAB 4D               [ 1]  952 	tnz	a
      008DAC 27 03            [ 1]  953 	jreq	00110$
                                    954 ;	lib/src/stm8s_uart1.c: 737: pendingbitstatus = SET;
      008DAE A6 01            [ 1]  955 	ld	a, #0x01
                                    956 ;	lib/src/stm8s_uart1.c: 742: pendingbitstatus = RESET;
      008DB0 21                     957 	.byte 0x21
      008DB1                        958 00110$:
      008DB1 4F               [ 1]  959 	clr	a
      008DB2                        960 00118$:
                                    961 ;	lib/src/stm8s_uart1.c: 747: return  pendingbitstatus;
                                    962 ;	lib/src/stm8s_uart1.c: 748: }
      008DB2 5B 04            [ 2]  963 	addw	sp, #4
      008DB4 81               [ 4]  964 	ret
                                    965 ;	lib/src/stm8s_uart1.c: 775: void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
                                    966 ;	-----------------------------------------
                                    967 ;	 function UART1_ClearITPendingBit
                                    968 ;	-----------------------------------------
      008DB5                        969 _UART1_ClearITPendingBit:
                                    970 ;	lib/src/stm8s_uart1.c: 780: if (UART1_IT == UART1_IT_RXNE)
      008DB5 A3 02 55         [ 2]  971 	cpw	x, #0x0255
      008DB8 26 05            [ 1]  972 	jrne	00102$
                                    973 ;	lib/src/stm8s_uart1.c: 782: UART1->SR = (uint8_t)~(UART1_SR_RXNE);
      008DBA 35 DF 52 30      [ 1]  974 	mov	0x5230+0, #0xdf
      008DBE 81               [ 4]  975 	ret
      008DBF                        976 00102$:
                                    977 ;	lib/src/stm8s_uart1.c: 787: UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
      008DBF 72 19 52 37      [ 1]  978 	bres	0x5237, #4
                                    979 ;	lib/src/stm8s_uart1.c: 789: }
      008DC3 81               [ 4]  980 	ret
                                    981 	.area CODE
                                    982 	.area CONST
                                    983 	.area INITIALIZER
                                    984 	.area CABS (ABS)
