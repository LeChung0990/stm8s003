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
      0085CC                         78 _UART1_DeInit:
                                     79 ;	lib/src/stm8s_uart1.c: 57: (void)UART1->SR;
      0085CC C6 52 30         [ 1]   80 	ld	a, 0x5230
                                     81 ;	lib/src/stm8s_uart1.c: 58: (void)UART1->DR;
      0085CF C6 52 31         [ 1]   82 	ld	a, 0x5231
                                     83 ;	lib/src/stm8s_uart1.c: 60: UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /* Set UART1_BRR2 to reset value 0x00 */
      0085D2 35 00 52 33      [ 1]   84 	mov	0x5233+0, #0x00
                                     85 ;	lib/src/stm8s_uart1.c: 61: UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /* Set UART1_BRR1 to reset value 0x00 */
      0085D6 35 00 52 32      [ 1]   86 	mov	0x5232+0, #0x00
                                     87 ;	lib/src/stm8s_uart1.c: 63: UART1->CR1 = UART1_CR1_RESET_VALUE;  /* Set UART1_CR1 to reset value 0x00 */
      0085DA 35 00 52 34      [ 1]   88 	mov	0x5234+0, #0x00
                                     89 ;	lib/src/stm8s_uart1.c: 64: UART1->CR2 = UART1_CR2_RESET_VALUE;  /* Set UART1_CR2 to reset value 0x00 */
      0085DE 35 00 52 35      [ 1]   90 	mov	0x5235+0, #0x00
                                     91 ;	lib/src/stm8s_uart1.c: 65: UART1->CR3 = UART1_CR3_RESET_VALUE;  /* Set UART1_CR3 to reset value 0x00 */
      0085E2 35 00 52 36      [ 1]   92 	mov	0x5236+0, #0x00
                                     93 ;	lib/src/stm8s_uart1.c: 66: UART1->CR4 = UART1_CR4_RESET_VALUE;  /* Set UART1_CR4 to reset value 0x00 */
      0085E6 35 00 52 37      [ 1]   94 	mov	0x5237+0, #0x00
                                     95 ;	lib/src/stm8s_uart1.c: 67: UART1->CR5 = UART1_CR5_RESET_VALUE;  /* Set UART1_CR5 to reset value 0x00 */
      0085EA 35 00 52 38      [ 1]   96 	mov	0x5238+0, #0x00
                                     97 ;	lib/src/stm8s_uart1.c: 69: UART1->GTR = UART1_GTR_RESET_VALUE;
      0085EE 35 00 52 39      [ 1]   98 	mov	0x5239+0, #0x00
                                     99 ;	lib/src/stm8s_uart1.c: 70: UART1->PSCR = UART1_PSCR_RESET_VALUE;
      0085F2 35 00 52 3A      [ 1]  100 	mov	0x523a+0, #0x00
                                    101 ;	lib/src/stm8s_uart1.c: 71: }
      0085F6 81               [ 4]  102 	ret
                                    103 ;	lib/src/stm8s_uart1.c: 90: void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength, 
                                    104 ;	-----------------------------------------
                                    105 ;	 function UART1_Init
                                    106 ;	-----------------------------------------
      0085F7                        107 _UART1_Init:
      0085F7 52 11            [ 2]  108 	sub	sp, #17
                                    109 ;	lib/src/stm8s_uart1.c: 105: UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  
      0085F9 72 19 52 34      [ 1]  110 	bres	0x5234, #4
                                    111 ;	lib/src/stm8s_uart1.c: 108: UART1->CR1 |= (uint8_t)WordLength;
      0085FD C6 52 34         [ 1]  112 	ld	a, 0x5234
      008600 1A 18            [ 1]  113 	or	a, (0x18, sp)
      008602 C7 52 34         [ 1]  114 	ld	0x5234, a
                                    115 ;	lib/src/stm8s_uart1.c: 111: UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
      008605 C6 52 36         [ 1]  116 	ld	a, 0x5236
      008608 A4 CF            [ 1]  117 	and	a, #0xcf
      00860A C7 52 36         [ 1]  118 	ld	0x5236, a
                                    119 ;	lib/src/stm8s_uart1.c: 113: UART1->CR3 |= (uint8_t)StopBits;  
      00860D C6 52 36         [ 1]  120 	ld	a, 0x5236
      008610 1A 19            [ 1]  121 	or	a, (0x19, sp)
      008612 C7 52 36         [ 1]  122 	ld	0x5236, a
                                    123 ;	lib/src/stm8s_uart1.c: 116: UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  
      008615 C6 52 34         [ 1]  124 	ld	a, 0x5234
      008618 A4 F9            [ 1]  125 	and	a, #0xf9
      00861A C7 52 34         [ 1]  126 	ld	0x5234, a
                                    127 ;	lib/src/stm8s_uart1.c: 118: UART1->CR1 |= (uint8_t)Parity;  
      00861D C6 52 34         [ 1]  128 	ld	a, 0x5234
      008620 1A 1A            [ 1]  129 	or	a, (0x1a, sp)
      008622 C7 52 34         [ 1]  130 	ld	0x5234, a
                                    131 ;	lib/src/stm8s_uart1.c: 121: UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  
      008625 C6 52 32         [ 1]  132 	ld	a, 0x5232
      008628 35 00 52 32      [ 1]  133 	mov	0x5232+0, #0x00
                                    134 ;	lib/src/stm8s_uart1.c: 123: UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);  
      00862C C6 52 33         [ 1]  135 	ld	a, 0x5233
      00862F A4 0F            [ 1]  136 	and	a, #0x0f
      008631 C7 52 33         [ 1]  137 	ld	0x5233, a
                                    138 ;	lib/src/stm8s_uart1.c: 125: UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  
      008634 C6 52 33         [ 1]  139 	ld	a, 0x5233
      008637 A4 F0            [ 1]  140 	and	a, #0xf0
      008639 C7 52 33         [ 1]  141 	ld	0x5233, a
                                    142 ;	lib/src/stm8s_uart1.c: 128: BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
      00863C CD 84 F1         [ 4]  143 	call	_CLK_GetClockFreq
      00863F 1F 10            [ 2]  144 	ldw	(0x10, sp), x
      008641 1E 14            [ 2]  145 	ldw	x, (0x14, sp)
      008643 1F 0A            [ 2]  146 	ldw	(0x0a, sp), x
      008645 1E 16            [ 2]  147 	ldw	x, (0x16, sp)
      008647 A6 04            [ 1]  148 	ld	a, #0x04
      008649                        149 00127$:
      008649 58               [ 2]  150 	sllw	x
      00864A 09 0B            [ 1]  151 	rlc	(0x0b, sp)
      00864C 09 0A            [ 1]  152 	rlc	(0x0a, sp)
      00864E 4A               [ 1]  153 	dec	a
      00864F 26 F8            [ 1]  154 	jrne	00127$
      008651 1F 0C            [ 2]  155 	ldw	(0x0c, sp), x
      008653 89               [ 2]  156 	pushw	x
      008654 1E 0C            [ 2]  157 	ldw	x, (0x0c, sp)
      008656 89               [ 2]  158 	pushw	x
      008657 1E 14            [ 2]  159 	ldw	x, (0x14, sp)
      008659 89               [ 2]  160 	pushw	x
      00865A 90 89            [ 2]  161 	pushw	y
      00865C CD 8F 7E         [ 4]  162 	call	__divulong
      00865F 5B 08            [ 2]  163 	addw	sp, #8
      008661 1F 10            [ 2]  164 	ldw	(0x10, sp), x
      008663 17 0E            [ 2]  165 	ldw	(0x0e, sp), y
      008665 16 10            [ 2]  166 	ldw	y, (0x10, sp)
      008667 17 03            [ 2]  167 	ldw	(0x03, sp), y
      008669 16 0E            [ 2]  168 	ldw	y, (0x0e, sp)
      00866B 17 01            [ 2]  169 	ldw	(0x01, sp), y
                                    170 ;	lib/src/stm8s_uart1.c: 129: BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
      00866D CD 84 F1         [ 4]  171 	call	_CLK_GetClockFreq
      008670 1F 10            [ 2]  172 	ldw	(0x10, sp), x
      008672 17 0E            [ 2]  173 	ldw	(0x0e, sp), y
      008674 1E 10            [ 2]  174 	ldw	x, (0x10, sp)
      008676 89               [ 2]  175 	pushw	x
      008677 1E 10            [ 2]  176 	ldw	x, (0x10, sp)
      008679 89               [ 2]  177 	pushw	x
      00867A 4B 64            [ 1]  178 	push	#0x64
      00867C 5F               [ 1]  179 	clrw	x
      00867D 89               [ 2]  180 	pushw	x
      00867E 4B 00            [ 1]  181 	push	#0x00
      008680 CD 8F F1         [ 4]  182 	call	__mullong
      008683 5B 08            [ 2]  183 	addw	sp, #8
      008685 1F 10            [ 2]  184 	ldw	(0x10, sp), x
      008687 1E 0C            [ 2]  185 	ldw	x, (0x0c, sp)
      008689 89               [ 2]  186 	pushw	x
      00868A 1E 0C            [ 2]  187 	ldw	x, (0x0c, sp)
      00868C 89               [ 2]  188 	pushw	x
      00868D 1E 14            [ 2]  189 	ldw	x, (0x14, sp)
      00868F 89               [ 2]  190 	pushw	x
      008690 90 89            [ 2]  191 	pushw	y
      008692 CD 8F 7E         [ 4]  192 	call	__divulong
      008695 5B 08            [ 2]  193 	addw	sp, #8
      008697 1F 07            [ 2]  194 	ldw	(0x07, sp), x
      008699 17 05            [ 2]  195 	ldw	(0x05, sp), y
                                    196 ;	lib/src/stm8s_uart1.c: 131: UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F); 
      00869B C6 52 33         [ 1]  197 	ld	a, 0x5233
      00869E 6B 09            [ 1]  198 	ld	(0x09, sp), a
      0086A0 1E 03            [ 2]  199 	ldw	x, (0x03, sp)
      0086A2 89               [ 2]  200 	pushw	x
      0086A3 1E 03            [ 2]  201 	ldw	x, (0x03, sp)
      0086A5 89               [ 2]  202 	pushw	x
      0086A6 4B 64            [ 1]  203 	push	#0x64
      0086A8 5F               [ 1]  204 	clrw	x
      0086A9 89               [ 2]  205 	pushw	x
      0086AA 4B 00            [ 1]  206 	push	#0x00
      0086AC CD 8F F1         [ 4]  207 	call	__mullong
      0086AF 5B 08            [ 2]  208 	addw	sp, #8
      0086B1 1F 0C            [ 2]  209 	ldw	(0x0c, sp), x
      0086B3 17 0A            [ 2]  210 	ldw	(0x0a, sp), y
      0086B5 1E 07            [ 2]  211 	ldw	x, (0x07, sp)
      0086B7 72 F0 0C         [ 2]  212 	subw	x, (0x0c, sp)
      0086BA 1F 10            [ 2]  213 	ldw	(0x10, sp), x
      0086BC 7B 06            [ 1]  214 	ld	a, (0x06, sp)
      0086BE 12 0B            [ 1]  215 	sbc	a, (0x0b, sp)
      0086C0 6B 0F            [ 1]  216 	ld	(0x0f, sp), a
      0086C2 7B 05            [ 1]  217 	ld	a, (0x05, sp)
      0086C4 12 0A            [ 1]  218 	sbc	a, (0x0a, sp)
      0086C6 6B 0E            [ 1]  219 	ld	(0x0e, sp), a
      0086C8 1E 10            [ 2]  220 	ldw	x, (0x10, sp)
      0086CA 16 0E            [ 2]  221 	ldw	y, (0x0e, sp)
      0086CC A6 04            [ 1]  222 	ld	a, #0x04
      0086CE                        223 00129$:
      0086CE 58               [ 2]  224 	sllw	x
      0086CF 90 59            [ 2]  225 	rlcw	y
      0086D1 4A               [ 1]  226 	dec	a
      0086D2 26 FA            [ 1]  227 	jrne	00129$
      0086D4 4B 64            [ 1]  228 	push	#0x64
      0086D6 4B 00            [ 1]  229 	push	#0x00
      0086D8 4B 00            [ 1]  230 	push	#0x00
      0086DA 4B 00            [ 1]  231 	push	#0x00
      0086DC 89               [ 2]  232 	pushw	x
      0086DD 90 89            [ 2]  233 	pushw	y
      0086DF CD 8F 7E         [ 4]  234 	call	__divulong
      0086E2 5B 08            [ 2]  235 	addw	sp, #8
      0086E4 9F               [ 1]  236 	ld	a, xl
      0086E5 A4 0F            [ 1]  237 	and	a, #0x0f
      0086E7 1A 09            [ 1]  238 	or	a, (0x09, sp)
      0086E9 C7 52 33         [ 1]  239 	ld	0x5233, a
                                    240 ;	lib/src/stm8s_uart1.c: 133: UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0); 
      0086EC C6 52 33         [ 1]  241 	ld	a, 0x5233
      0086EF 6B 11            [ 1]  242 	ld	(0x11, sp), a
      0086F1 1E 03            [ 2]  243 	ldw	x, (0x03, sp)
      0086F3 A6 10            [ 1]  244 	ld	a, #0x10
      0086F5 62               [ 2]  245 	div	x, a
      0086F6 9F               [ 1]  246 	ld	a, xl
      0086F7 A4 F0            [ 1]  247 	and	a, #0xf0
      0086F9 1A 11            [ 1]  248 	or	a, (0x11, sp)
      0086FB C7 52 33         [ 1]  249 	ld	0x5233, a
                                    250 ;	lib/src/stm8s_uart1.c: 135: UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;           
      0086FE C6 52 32         [ 1]  251 	ld	a, 0x5232
      008701 6B 11            [ 1]  252 	ld	(0x11, sp), a
      008703 7B 04            [ 1]  253 	ld	a, (0x04, sp)
      008705 1A 11            [ 1]  254 	or	a, (0x11, sp)
      008707 C7 52 32         [ 1]  255 	ld	0x5232, a
                                    256 ;	lib/src/stm8s_uart1.c: 138: UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
      00870A C6 52 35         [ 1]  257 	ld	a, 0x5235
      00870D A4 F3            [ 1]  258 	and	a, #0xf3
      00870F C7 52 35         [ 1]  259 	ld	0x5235, a
                                    260 ;	lib/src/stm8s_uart1.c: 140: UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL); 
      008712 C6 52 36         [ 1]  261 	ld	a, 0x5236
      008715 A4 F8            [ 1]  262 	and	a, #0xf8
      008717 C7 52 36         [ 1]  263 	ld	0x5236, a
                                    264 ;	lib/src/stm8s_uart1.c: 142: UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL | 
      00871A C6 52 36         [ 1]  265 	ld	a, 0x5236
      00871D 6B 11            [ 1]  266 	ld	(0x11, sp), a
      00871F 7B 1B            [ 1]  267 	ld	a, (0x1b, sp)
      008721 A4 07            [ 1]  268 	and	a, #0x07
      008723 1A 11            [ 1]  269 	or	a, (0x11, sp)
      008725 C7 52 36         [ 1]  270 	ld	0x5236, a
                                    271 ;	lib/src/stm8s_uart1.c: 138: UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
      008728 C6 52 35         [ 1]  272 	ld	a, 0x5235
                                    273 ;	lib/src/stm8s_uart1.c: 145: if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
      00872B 88               [ 1]  274 	push	a
      00872C 7B 1D            [ 1]  275 	ld	a, (0x1d, sp)
      00872E A5 04            [ 1]  276 	bcp	a, #0x04
      008730 84               [ 1]  277 	pop	a
      008731 27 07            [ 1]  278 	jreq	00102$
                                    279 ;	lib/src/stm8s_uart1.c: 148: UART1->CR2 |= (uint8_t)UART1_CR2_TEN;  
      008733 AA 08            [ 1]  280 	or	a, #0x08
      008735 C7 52 35         [ 1]  281 	ld	0x5235, a
      008738 20 05            [ 2]  282 	jra	00103$
      00873A                        283 00102$:
                                    284 ;	lib/src/stm8s_uart1.c: 153: UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);  
      00873A A4 F7            [ 1]  285 	and	a, #0xf7
      00873C C7 52 35         [ 1]  286 	ld	0x5235, a
      00873F                        287 00103$:
                                    288 ;	lib/src/stm8s_uart1.c: 138: UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
      00873F C6 52 35         [ 1]  289 	ld	a, 0x5235
                                    290 ;	lib/src/stm8s_uart1.c: 155: if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
      008742 88               [ 1]  291 	push	a
      008743 7B 1D            [ 1]  292 	ld	a, (0x1d, sp)
      008745 A5 08            [ 1]  293 	bcp	a, #0x08
      008747 84               [ 1]  294 	pop	a
      008748 27 07            [ 1]  295 	jreq	00105$
                                    296 ;	lib/src/stm8s_uart1.c: 158: UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
      00874A AA 04            [ 1]  297 	or	a, #0x04
      00874C C7 52 35         [ 1]  298 	ld	0x5235, a
      00874F 20 05            [ 2]  299 	jra	00106$
      008751                        300 00105$:
                                    301 ;	lib/src/stm8s_uart1.c: 163: UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);  
      008751 A4 FB            [ 1]  302 	and	a, #0xfb
      008753 C7 52 35         [ 1]  303 	ld	0x5235, a
      008756                        304 00106$:
                                    305 ;	lib/src/stm8s_uart1.c: 111: UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
      008756 C6 52 36         [ 1]  306 	ld	a, 0x5236
                                    307 ;	lib/src/stm8s_uart1.c: 167: if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
      008759 0D 1B            [ 1]  308 	tnz	(0x1b, sp)
      00875B 2A 07            [ 1]  309 	jrpl	00108$
                                    310 ;	lib/src/stm8s_uart1.c: 170: UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); 
      00875D A4 F7            [ 1]  311 	and	a, #0xf7
      00875F C7 52 36         [ 1]  312 	ld	0x5236, a
      008762 20 0D            [ 2]  313 	jra	00110$
      008764                        314 00108$:
                                    315 ;	lib/src/stm8s_uart1.c: 174: UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
      008764 88               [ 1]  316 	push	a
      008765 7B 1C            [ 1]  317 	ld	a, (0x1c, sp)
      008767 A4 08            [ 1]  318 	and	a, #0x08
      008769 6B 12            [ 1]  319 	ld	(0x12, sp), a
      00876B 84               [ 1]  320 	pop	a
      00876C 1A 11            [ 1]  321 	or	a, (0x11, sp)
      00876E C7 52 36         [ 1]  322 	ld	0x5236, a
      008771                        323 00110$:
                                    324 ;	lib/src/stm8s_uart1.c: 176: }
      008771 1E 12            [ 2]  325 	ldw	x, (18, sp)
      008773 5B 1C            [ 2]  326 	addw	sp, #28
      008775 FC               [ 2]  327 	jp	(x)
                                    328 ;	lib/src/stm8s_uart1.c: 184: void UART1_Cmd(FunctionalState NewState)
                                    329 ;	-----------------------------------------
                                    330 ;	 function UART1_Cmd
                                    331 ;	-----------------------------------------
      008776                        332 _UART1_Cmd:
      008776 88               [ 1]  333 	push	a
      008777 6B 01            [ 1]  334 	ld	(0x01, sp), a
                                    335 ;	lib/src/stm8s_uart1.c: 189: UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
      008779 C6 52 34         [ 1]  336 	ld	a, 0x5234
                                    337 ;	lib/src/stm8s_uart1.c: 186: if (NewState != DISABLE)
      00877C 0D 01            [ 1]  338 	tnz	(0x01, sp)
      00877E 27 07            [ 1]  339 	jreq	00102$
                                    340 ;	lib/src/stm8s_uart1.c: 189: UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
      008780 A4 DF            [ 1]  341 	and	a, #0xdf
      008782 C7 52 34         [ 1]  342 	ld	0x5234, a
      008785 20 05            [ 2]  343 	jra	00104$
      008787                        344 00102$:
                                    345 ;	lib/src/stm8s_uart1.c: 194: UART1->CR1 |= UART1_CR1_UARTD;  
      008787 AA 20            [ 1]  346 	or	a, #0x20
      008789 C7 52 34         [ 1]  347 	ld	0x5234, a
      00878C                        348 00104$:
                                    349 ;	lib/src/stm8s_uart1.c: 196: }
      00878C 84               [ 1]  350 	pop	a
      00878D 81               [ 4]  351 	ret
                                    352 ;	lib/src/stm8s_uart1.c: 211: void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
                                    353 ;	-----------------------------------------
                                    354 ;	 function UART1_ITConfig
                                    355 ;	-----------------------------------------
      00878E                        356 _UART1_ITConfig:
      00878E 52 03            [ 2]  357 	sub	sp, #3
      008790 51               [ 1]  358 	exgw	x, y
      008791 6B 03            [ 1]  359 	ld	(0x03, sp), a
                                    360 ;	lib/src/stm8s_uart1.c: 220: uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
      008793 93               [ 1]  361 	ldw	x, y
                                    362 ;	lib/src/stm8s_uart1.c: 222: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
      008794 90 9F            [ 1]  363 	ld	a, yl
      008796 A4 0F            [ 1]  364 	and	a, #0x0f
      008798 41               [ 1]  365 	exg	a, xl
      008799 A6 01            [ 1]  366 	ld	a, #0x01
      00879B 41               [ 1]  367 	exg	a, xl
      00879C 4D               [ 1]  368 	tnz	a
      00879D 27 06            [ 1]  369 	jreq	00144$
      00879F                        370 00143$:
      00879F 41               [ 1]  371 	exg	a, xl
      0087A0 48               [ 1]  372 	sll	a
      0087A1 41               [ 1]  373 	exg	a, xl
      0087A2 4A               [ 1]  374 	dec	a
      0087A3 26 FA            [ 1]  375 	jrne	00143$
      0087A5                        376 00144$:
                                    377 ;	lib/src/stm8s_uart1.c: 227: if (uartreg == 0x01)
      0087A5 9E               [ 1]  378 	ld	a, xh
      0087A6 4A               [ 1]  379 	dec	a
      0087A7 26 05            [ 1]  380 	jrne	00146$
      0087A9 A6 01            [ 1]  381 	ld	a, #0x01
      0087AB 6B 01            [ 1]  382 	ld	(0x01, sp), a
      0087AD C5                     383 	.byte 0xc5
      0087AE                        384 00146$:
      0087AE 0F 01            [ 1]  385 	clr	(0x01, sp)
      0087B0                        386 00147$:
                                    387 ;	lib/src/stm8s_uart1.c: 231: else if (uartreg == 0x02)
      0087B0 9E               [ 1]  388 	ld	a, xh
      0087B1 A0 02            [ 1]  389 	sub	a, #0x02
      0087B3 26 04            [ 1]  390 	jrne	00149$
      0087B5 4C               [ 1]  391 	inc	a
      0087B6 95               [ 1]  392 	ld	xh, a
      0087B7 20 02            [ 2]  393 	jra	00150$
      0087B9                        394 00149$:
      0087B9 4F               [ 1]  395 	clr	a
      0087BA 95               [ 1]  396 	ld	xh, a
      0087BB                        397 00150$:
                                    398 ;	lib/src/stm8s_uart1.c: 224: if (NewState != DISABLE)
      0087BB 0D 03            [ 1]  399 	tnz	(0x03, sp)
      0087BD 27 2C            [ 1]  400 	jreq	00114$
                                    401 ;	lib/src/stm8s_uart1.c: 227: if (uartreg == 0x01)
      0087BF 0D 01            [ 1]  402 	tnz	(0x01, sp)
      0087C1 27 0C            [ 1]  403 	jreq	00105$
                                    404 ;	lib/src/stm8s_uart1.c: 229: UART1->CR1 |= itpos;
      0087C3 C6 52 34         [ 1]  405 	ld	a, 0x5234
      0087C6 89               [ 2]  406 	pushw	x
      0087C7 1A 02            [ 1]  407 	or	a, (2, sp)
      0087C9 85               [ 2]  408 	popw	x
      0087CA C7 52 34         [ 1]  409 	ld	0x5234, a
      0087CD 20 44            [ 2]  410 	jra	00116$
      0087CF                        411 00105$:
                                    412 ;	lib/src/stm8s_uart1.c: 231: else if (uartreg == 0x02)
      0087CF 9E               [ 1]  413 	ld	a, xh
      0087D0 4D               [ 1]  414 	tnz	a
      0087D1 27 0C            [ 1]  415 	jreq	00102$
                                    416 ;	lib/src/stm8s_uart1.c: 233: UART1->CR2 |= itpos;
      0087D3 C6 52 35         [ 1]  417 	ld	a, 0x5235
      0087D6 89               [ 2]  418 	pushw	x
      0087D7 1A 02            [ 1]  419 	or	a, (2, sp)
      0087D9 85               [ 2]  420 	popw	x
      0087DA C7 52 35         [ 1]  421 	ld	0x5235, a
      0087DD 20 34            [ 2]  422 	jra	00116$
      0087DF                        423 00102$:
                                    424 ;	lib/src/stm8s_uart1.c: 237: UART1->CR4 |= itpos;
      0087DF C6 52 37         [ 1]  425 	ld	a, 0x5237
      0087E2 89               [ 2]  426 	pushw	x
      0087E3 1A 02            [ 1]  427 	or	a, (2, sp)
      0087E5 85               [ 2]  428 	popw	x
      0087E6 C7 52 37         [ 1]  429 	ld	0x5237, a
      0087E9 20 28            [ 2]  430 	jra	00116$
      0087EB                        431 00114$:
                                    432 ;	lib/src/stm8s_uart1.c: 245: UART1->CR1 &= (uint8_t)(~itpos);
      0087EB 9F               [ 1]  433 	ld	a, xl
      0087EC 43               [ 1]  434 	cpl	a
      0087ED 6B 02            [ 1]  435 	ld	(0x02, sp), a
                                    436 ;	lib/src/stm8s_uart1.c: 243: if (uartreg == 0x01)
      0087EF 0D 01            [ 1]  437 	tnz	(0x01, sp)
      0087F1 27 0A            [ 1]  438 	jreq	00111$
                                    439 ;	lib/src/stm8s_uart1.c: 245: UART1->CR1 &= (uint8_t)(~itpos);
      0087F3 C6 52 34         [ 1]  440 	ld	a, 0x5234
      0087F6 14 02            [ 1]  441 	and	a, (0x02, sp)
      0087F8 C7 52 34         [ 1]  442 	ld	0x5234, a
      0087FB 20 16            [ 2]  443 	jra	00116$
      0087FD                        444 00111$:
                                    445 ;	lib/src/stm8s_uart1.c: 247: else if (uartreg == 0x02)
      0087FD 9E               [ 1]  446 	ld	a, xh
      0087FE 4D               [ 1]  447 	tnz	a
      0087FF 27 0A            [ 1]  448 	jreq	00108$
                                    449 ;	lib/src/stm8s_uart1.c: 249: UART1->CR2 &= (uint8_t)(~itpos);
      008801 C6 52 35         [ 1]  450 	ld	a, 0x5235
      008804 14 02            [ 1]  451 	and	a, (0x02, sp)
      008806 C7 52 35         [ 1]  452 	ld	0x5235, a
      008809 20 08            [ 2]  453 	jra	00116$
      00880B                        454 00108$:
                                    455 ;	lib/src/stm8s_uart1.c: 253: UART1->CR4 &= (uint8_t)(~itpos);
      00880B C6 52 37         [ 1]  456 	ld	a, 0x5237
      00880E 14 02            [ 1]  457 	and	a, (0x02, sp)
      008810 C7 52 37         [ 1]  458 	ld	0x5237, a
      008813                        459 00116$:
                                    460 ;	lib/src/stm8s_uart1.c: 257: }
      008813 5B 03            [ 2]  461 	addw	sp, #3
      008815 81               [ 4]  462 	ret
                                    463 ;	lib/src/stm8s_uart1.c: 265: void UART1_HalfDuplexCmd(FunctionalState NewState)
                                    464 ;	-----------------------------------------
                                    465 ;	 function UART1_HalfDuplexCmd
                                    466 ;	-----------------------------------------
      008816                        467 _UART1_HalfDuplexCmd:
      008816 88               [ 1]  468 	push	a
      008817 6B 01            [ 1]  469 	ld	(0x01, sp), a
                                    470 ;	lib/src/stm8s_uart1.c: 271: UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
      008819 C6 52 38         [ 1]  471 	ld	a, 0x5238
                                    472 ;	lib/src/stm8s_uart1.c: 269: if (NewState != DISABLE)
      00881C 0D 01            [ 1]  473 	tnz	(0x01, sp)
      00881E 27 07            [ 1]  474 	jreq	00102$
                                    475 ;	lib/src/stm8s_uart1.c: 271: UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
      008820 AA 08            [ 1]  476 	or	a, #0x08
      008822 C7 52 38         [ 1]  477 	ld	0x5238, a
      008825 20 05            [ 2]  478 	jra	00104$
      008827                        479 00102$:
                                    480 ;	lib/src/stm8s_uart1.c: 275: UART1->CR5 &= (uint8_t)~UART1_CR5_HDSEL; /**< UART1 Half Duplex Disable */
      008827 A4 F7            [ 1]  481 	and	a, #0xf7
      008829 C7 52 38         [ 1]  482 	ld	0x5238, a
      00882C                        483 00104$:
                                    484 ;	lib/src/stm8s_uart1.c: 277: }
      00882C 84               [ 1]  485 	pop	a
      00882D 81               [ 4]  486 	ret
                                    487 ;	lib/src/stm8s_uart1.c: 285: void UART1_IrDAConfig(UART1_IrDAMode_TypeDef UART1_IrDAMode)
                                    488 ;	-----------------------------------------
                                    489 ;	 function UART1_IrDAConfig
                                    490 ;	-----------------------------------------
      00882E                        491 _UART1_IrDAConfig:
      00882E 88               [ 1]  492 	push	a
      00882F 6B 01            [ 1]  493 	ld	(0x01, sp), a
                                    494 ;	lib/src/stm8s_uart1.c: 291: UART1->CR5 |= UART1_CR5_IRLP;
      008831 C6 52 38         [ 1]  495 	ld	a, 0x5238
                                    496 ;	lib/src/stm8s_uart1.c: 289: if (UART1_IrDAMode != UART1_IRDAMODE_NORMAL)
      008834 0D 01            [ 1]  497 	tnz	(0x01, sp)
      008836 27 07            [ 1]  498 	jreq	00102$
                                    499 ;	lib/src/stm8s_uart1.c: 291: UART1->CR5 |= UART1_CR5_IRLP;
      008838 AA 04            [ 1]  500 	or	a, #0x04
      00883A C7 52 38         [ 1]  501 	ld	0x5238, a
      00883D 20 05            [ 2]  502 	jra	00104$
      00883F                        503 00102$:
                                    504 ;	lib/src/stm8s_uart1.c: 295: UART1->CR5 &= ((uint8_t)~UART1_CR5_IRLP);
      00883F A4 FB            [ 1]  505 	and	a, #0xfb
      008841 C7 52 38         [ 1]  506 	ld	0x5238, a
      008844                        507 00104$:
                                    508 ;	lib/src/stm8s_uart1.c: 297: }
      008844 84               [ 1]  509 	pop	a
      008845 81               [ 4]  510 	ret
                                    511 ;	lib/src/stm8s_uart1.c: 305: void UART1_IrDACmd(FunctionalState NewState)
                                    512 ;	-----------------------------------------
                                    513 ;	 function UART1_IrDACmd
                                    514 ;	-----------------------------------------
      008846                        515 _UART1_IrDACmd:
      008846 88               [ 1]  516 	push	a
      008847 6B 01            [ 1]  517 	ld	(0x01, sp), a
                                    518 ;	lib/src/stm8s_uart1.c: 313: UART1->CR5 |= UART1_CR5_IREN;
      008849 C6 52 38         [ 1]  519 	ld	a, 0x5238
                                    520 ;	lib/src/stm8s_uart1.c: 310: if (NewState != DISABLE)
      00884C 0D 01            [ 1]  521 	tnz	(0x01, sp)
      00884E 27 07            [ 1]  522 	jreq	00102$
                                    523 ;	lib/src/stm8s_uart1.c: 313: UART1->CR5 |= UART1_CR5_IREN;
      008850 AA 02            [ 1]  524 	or	a, #0x02
      008852 C7 52 38         [ 1]  525 	ld	0x5238, a
      008855 20 05            [ 2]  526 	jra	00104$
      008857                        527 00102$:
                                    528 ;	lib/src/stm8s_uart1.c: 318: UART1->CR5 &= ((uint8_t)~UART1_CR5_IREN);
      008857 A4 FD            [ 1]  529 	and	a, #0xfd
      008859 C7 52 38         [ 1]  530 	ld	0x5238, a
      00885C                        531 00104$:
                                    532 ;	lib/src/stm8s_uart1.c: 320: }
      00885C 84               [ 1]  533 	pop	a
      00885D 81               [ 4]  534 	ret
                                    535 ;	lib/src/stm8s_uart1.c: 329: void UART1_LINBreakDetectionConfig(UART1_LINBreakDetectionLength_TypeDef UART1_LINBreakDetectionLength)
                                    536 ;	-----------------------------------------
                                    537 ;	 function UART1_LINBreakDetectionConfig
                                    538 ;	-----------------------------------------
      00885E                        539 _UART1_LINBreakDetectionConfig:
      00885E 88               [ 1]  540 	push	a
      00885F 6B 01            [ 1]  541 	ld	(0x01, sp), a
                                    542 ;	lib/src/stm8s_uart1.c: 335: UART1->CR4 |= UART1_CR4_LBDL;
      008861 C6 52 37         [ 1]  543 	ld	a, 0x5237
                                    544 ;	lib/src/stm8s_uart1.c: 333: if (UART1_LINBreakDetectionLength != UART1_LINBREAKDETECTIONLENGTH_10BITS)
      008864 0D 01            [ 1]  545 	tnz	(0x01, sp)
      008866 27 07            [ 1]  546 	jreq	00102$
                                    547 ;	lib/src/stm8s_uart1.c: 335: UART1->CR4 |= UART1_CR4_LBDL;
      008868 AA 20            [ 1]  548 	or	a, #0x20
      00886A C7 52 37         [ 1]  549 	ld	0x5237, a
      00886D 20 05            [ 2]  550 	jra	00104$
      00886F                        551 00102$:
                                    552 ;	lib/src/stm8s_uart1.c: 339: UART1->CR4 &= ((uint8_t)~UART1_CR4_LBDL);
      00886F A4 DF            [ 1]  553 	and	a, #0xdf
      008871 C7 52 37         [ 1]  554 	ld	0x5237, a
      008874                        555 00104$:
                                    556 ;	lib/src/stm8s_uart1.c: 341: }
      008874 84               [ 1]  557 	pop	a
      008875 81               [ 4]  558 	ret
                                    559 ;	lib/src/stm8s_uart1.c: 349: void UART1_LINCmd(FunctionalState NewState)
                                    560 ;	-----------------------------------------
                                    561 ;	 function UART1_LINCmd
                                    562 ;	-----------------------------------------
      008876                        563 _UART1_LINCmd:
      008876 88               [ 1]  564 	push	a
      008877 6B 01            [ 1]  565 	ld	(0x01, sp), a
                                    566 ;	lib/src/stm8s_uart1.c: 356: UART1->CR3 |= UART1_CR3_LINEN;
      008879 C6 52 36         [ 1]  567 	ld	a, 0x5236
                                    568 ;	lib/src/stm8s_uart1.c: 353: if (NewState != DISABLE)
      00887C 0D 01            [ 1]  569 	tnz	(0x01, sp)
      00887E 27 07            [ 1]  570 	jreq	00102$
                                    571 ;	lib/src/stm8s_uart1.c: 356: UART1->CR3 |= UART1_CR3_LINEN;
      008880 AA 40            [ 1]  572 	or	a, #0x40
      008882 C7 52 36         [ 1]  573 	ld	0x5236, a
      008885 20 05            [ 2]  574 	jra	00104$
      008887                        575 00102$:
                                    576 ;	lib/src/stm8s_uart1.c: 361: UART1->CR3 &= ((uint8_t)~UART1_CR3_LINEN);
      008887 A4 BF            [ 1]  577 	and	a, #0xbf
      008889 C7 52 36         [ 1]  578 	ld	0x5236, a
      00888C                        579 00104$:
                                    580 ;	lib/src/stm8s_uart1.c: 363: }
      00888C 84               [ 1]  581 	pop	a
      00888D 81               [ 4]  582 	ret
                                    583 ;	lib/src/stm8s_uart1.c: 371: void UART1_SmartCardCmd(FunctionalState NewState)
                                    584 ;	-----------------------------------------
                                    585 ;	 function UART1_SmartCardCmd
                                    586 ;	-----------------------------------------
      00888E                        587 _UART1_SmartCardCmd:
      00888E 88               [ 1]  588 	push	a
      00888F 6B 01            [ 1]  589 	ld	(0x01, sp), a
                                    590 ;	lib/src/stm8s_uart1.c: 378: UART1->CR5 |= UART1_CR5_SCEN;
      008891 C6 52 38         [ 1]  591 	ld	a, 0x5238
                                    592 ;	lib/src/stm8s_uart1.c: 375: if (NewState != DISABLE)
      008894 0D 01            [ 1]  593 	tnz	(0x01, sp)
      008896 27 07            [ 1]  594 	jreq	00102$
                                    595 ;	lib/src/stm8s_uart1.c: 378: UART1->CR5 |= UART1_CR5_SCEN;
      008898 AA 20            [ 1]  596 	or	a, #0x20
      00889A C7 52 38         [ 1]  597 	ld	0x5238, a
      00889D 20 05            [ 2]  598 	jra	00104$
      00889F                        599 00102$:
                                    600 ;	lib/src/stm8s_uart1.c: 383: UART1->CR5 &= ((uint8_t)(~UART1_CR5_SCEN));
      00889F A4 DF            [ 1]  601 	and	a, #0xdf
      0088A1 C7 52 38         [ 1]  602 	ld	0x5238, a
      0088A4                        603 00104$:
                                    604 ;	lib/src/stm8s_uart1.c: 385: }
      0088A4 84               [ 1]  605 	pop	a
      0088A5 81               [ 4]  606 	ret
                                    607 ;	lib/src/stm8s_uart1.c: 394: void UART1_SmartCardNACKCmd(FunctionalState NewState)
                                    608 ;	-----------------------------------------
                                    609 ;	 function UART1_SmartCardNACKCmd
                                    610 ;	-----------------------------------------
      0088A6                        611 _UART1_SmartCardNACKCmd:
      0088A6 88               [ 1]  612 	push	a
      0088A7 6B 01            [ 1]  613 	ld	(0x01, sp), a
                                    614 ;	lib/src/stm8s_uart1.c: 401: UART1->CR5 |= UART1_CR5_NACK;
      0088A9 C6 52 38         [ 1]  615 	ld	a, 0x5238
                                    616 ;	lib/src/stm8s_uart1.c: 398: if (NewState != DISABLE)
      0088AC 0D 01            [ 1]  617 	tnz	(0x01, sp)
      0088AE 27 07            [ 1]  618 	jreq	00102$
                                    619 ;	lib/src/stm8s_uart1.c: 401: UART1->CR5 |= UART1_CR5_NACK;
      0088B0 AA 10            [ 1]  620 	or	a, #0x10
      0088B2 C7 52 38         [ 1]  621 	ld	0x5238, a
      0088B5 20 05            [ 2]  622 	jra	00104$
      0088B7                        623 00102$:
                                    624 ;	lib/src/stm8s_uart1.c: 406: UART1->CR5 &= ((uint8_t)~(UART1_CR5_NACK));
      0088B7 A4 EF            [ 1]  625 	and	a, #0xef
      0088B9 C7 52 38         [ 1]  626 	ld	0x5238, a
      0088BC                        627 00104$:
                                    628 ;	lib/src/stm8s_uart1.c: 408: }
      0088BC 84               [ 1]  629 	pop	a
      0088BD 81               [ 4]  630 	ret
                                    631 ;	lib/src/stm8s_uart1.c: 416: void UART1_WakeUpConfig(UART1_WakeUp_TypeDef UART1_WakeUp)
                                    632 ;	-----------------------------------------
                                    633 ;	 function UART1_WakeUpConfig
                                    634 ;	-----------------------------------------
      0088BE                        635 _UART1_WakeUpConfig:
      0088BE 88               [ 1]  636 	push	a
      0088BF 6B 01            [ 1]  637 	ld	(0x01, sp), a
                                    638 ;	lib/src/stm8s_uart1.c: 420: UART1->CR1 &= ((uint8_t)~UART1_CR1_WAKE);
      0088C1 72 17 52 34      [ 1]  639 	bres	0x5234, #3
                                    640 ;	lib/src/stm8s_uart1.c: 421: UART1->CR1 |= (uint8_t)UART1_WakeUp;
      0088C5 C6 52 34         [ 1]  641 	ld	a, 0x5234
      0088C8 1A 01            [ 1]  642 	or	a, (0x01, sp)
      0088CA C7 52 34         [ 1]  643 	ld	0x5234, a
                                    644 ;	lib/src/stm8s_uart1.c: 422: }
      0088CD 84               [ 1]  645 	pop	a
      0088CE 81               [ 4]  646 	ret
                                    647 ;	lib/src/stm8s_uart1.c: 430: void UART1_ReceiverWakeUpCmd(FunctionalState NewState)
                                    648 ;	-----------------------------------------
                                    649 ;	 function UART1_ReceiverWakeUpCmd
                                    650 ;	-----------------------------------------
      0088CF                        651 _UART1_ReceiverWakeUpCmd:
      0088CF 88               [ 1]  652 	push	a
      0088D0 6B 01            [ 1]  653 	ld	(0x01, sp), a
                                    654 ;	lib/src/stm8s_uart1.c: 437: UART1->CR2 |= UART1_CR2_RWU;
      0088D2 C6 52 35         [ 1]  655 	ld	a, 0x5235
                                    656 ;	lib/src/stm8s_uart1.c: 434: if (NewState != DISABLE)
      0088D5 0D 01            [ 1]  657 	tnz	(0x01, sp)
      0088D7 27 07            [ 1]  658 	jreq	00102$
                                    659 ;	lib/src/stm8s_uart1.c: 437: UART1->CR2 |= UART1_CR2_RWU;
      0088D9 AA 02            [ 1]  660 	or	a, #0x02
      0088DB C7 52 35         [ 1]  661 	ld	0x5235, a
      0088DE 20 05            [ 2]  662 	jra	00104$
      0088E0                        663 00102$:
                                    664 ;	lib/src/stm8s_uart1.c: 442: UART1->CR2 &= ((uint8_t)~UART1_CR2_RWU);
      0088E0 A4 FD            [ 1]  665 	and	a, #0xfd
      0088E2 C7 52 35         [ 1]  666 	ld	0x5235, a
      0088E5                        667 00104$:
                                    668 ;	lib/src/stm8s_uart1.c: 444: }
      0088E5 84               [ 1]  669 	pop	a
      0088E6 81               [ 4]  670 	ret
                                    671 ;	lib/src/stm8s_uart1.c: 451: uint8_t UART1_ReceiveData8(void)
                                    672 ;	-----------------------------------------
                                    673 ;	 function UART1_ReceiveData8
                                    674 ;	-----------------------------------------
      0088E7                        675 _UART1_ReceiveData8:
                                    676 ;	lib/src/stm8s_uart1.c: 453: return ((uint8_t)UART1->DR);
      0088E7 C6 52 31         [ 1]  677 	ld	a, 0x5231
                                    678 ;	lib/src/stm8s_uart1.c: 454: }
      0088EA 81               [ 4]  679 	ret
                                    680 ;	lib/src/stm8s_uart1.c: 461: uint16_t UART1_ReceiveData9(void)
                                    681 ;	-----------------------------------------
                                    682 ;	 function UART1_ReceiveData9
                                    683 ;	-----------------------------------------
      0088EB                        684 _UART1_ReceiveData9:
      0088EB 52 02            [ 2]  685 	sub	sp, #2
                                    686 ;	lib/src/stm8s_uart1.c: 465: temp = (uint16_t)(((uint16_t)( (uint16_t)UART1->CR1 & (uint16_t)UART1_CR1_R8)) << 1);
      0088ED C6 52 34         [ 1]  687 	ld	a, 0x5234
      0088F0 A4 80            [ 1]  688 	and	a, #0x80
      0088F2 97               [ 1]  689 	ld	xl, a
      0088F3 4F               [ 1]  690 	clr	a
      0088F4 95               [ 1]  691 	ld	xh, a
      0088F5 58               [ 2]  692 	sllw	x
      0088F6 1F 01            [ 2]  693 	ldw	(0x01, sp), x
                                    694 ;	lib/src/stm8s_uart1.c: 466: return (uint16_t)( (((uint16_t) UART1->DR) | temp ) & ((uint16_t)0x01FF));
      0088F8 C6 52 31         [ 1]  695 	ld	a, 0x5231
      0088FB 5F               [ 1]  696 	clrw	x
      0088FC 1A 02            [ 1]  697 	or	a, (0x02, sp)
      0088FE 02               [ 1]  698 	rlwa	x
      0088FF 1A 01            [ 1]  699 	or	a, (0x01, sp)
      008901 A4 01            [ 1]  700 	and	a, #0x01
      008903 95               [ 1]  701 	ld	xh, a
                                    702 ;	lib/src/stm8s_uart1.c: 467: }
      008904 5B 02            [ 2]  703 	addw	sp, #2
      008906 81               [ 4]  704 	ret
                                    705 ;	lib/src/stm8s_uart1.c: 474: void UART1_SendData8(uint8_t Data)
                                    706 ;	-----------------------------------------
                                    707 ;	 function UART1_SendData8
                                    708 ;	-----------------------------------------
      008907                        709 _UART1_SendData8:
                                    710 ;	lib/src/stm8s_uart1.c: 477: UART1->DR = Data;
      008907 C7 52 31         [ 1]  711 	ld	0x5231, a
                                    712 ;	lib/src/stm8s_uart1.c: 478: }
      00890A 81               [ 4]  713 	ret
                                    714 ;	lib/src/stm8s_uart1.c: 486: void UART1_SendData9(uint16_t Data)
                                    715 ;	-----------------------------------------
                                    716 ;	 function UART1_SendData9
                                    717 ;	-----------------------------------------
      00890B                        718 _UART1_SendData9:
      00890B 88               [ 1]  719 	push	a
      00890C 51               [ 1]  720 	exgw	x, y
                                    721 ;	lib/src/stm8s_uart1.c: 489: UART1->CR1 &= ((uint8_t)~UART1_CR1_T8);
      00890D 72 1D 52 34      [ 1]  722 	bres	0x5234, #6
                                    723 ;	lib/src/stm8s_uart1.c: 491: UART1->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART1_CR1_T8);
      008911 C6 52 34         [ 1]  724 	ld	a, 0x5234
      008914 6B 01            [ 1]  725 	ld	(0x01, sp), a
      008916 93               [ 1]  726 	ldw	x, y
      008917 54               [ 2]  727 	srlw	x
      008918 54               [ 2]  728 	srlw	x
      008919 9F               [ 1]  729 	ld	a, xl
      00891A A4 40            [ 1]  730 	and	a, #0x40
      00891C 1A 01            [ 1]  731 	or	a, (0x01, sp)
      00891E C7 52 34         [ 1]  732 	ld	0x5234, a
                                    733 ;	lib/src/stm8s_uart1.c: 493: UART1->DR   = (uint8_t)(Data);
      008921 90 9F            [ 1]  734 	ld	a, yl
      008923 C7 52 31         [ 1]  735 	ld	0x5231, a
                                    736 ;	lib/src/stm8s_uart1.c: 494: }
      008926 84               [ 1]  737 	pop	a
      008927 81               [ 4]  738 	ret
                                    739 ;	lib/src/stm8s_uart1.c: 501: void UART1_SendBreak(void)
                                    740 ;	-----------------------------------------
                                    741 ;	 function UART1_SendBreak
                                    742 ;	-----------------------------------------
      008928                        743 _UART1_SendBreak:
                                    744 ;	lib/src/stm8s_uart1.c: 503: UART1->CR2 |= UART1_CR2_SBK;
      008928 72 10 52 35      [ 1]  745 	bset	0x5235, #0
                                    746 ;	lib/src/stm8s_uart1.c: 504: }
      00892C 81               [ 4]  747 	ret
                                    748 ;	lib/src/stm8s_uart1.c: 511: void UART1_SetAddress(uint8_t UART1_Address)
                                    749 ;	-----------------------------------------
                                    750 ;	 function UART1_SetAddress
                                    751 ;	-----------------------------------------
      00892D                        752 _UART1_SetAddress:
      00892D 88               [ 1]  753 	push	a
      00892E 6B 01            [ 1]  754 	ld	(0x01, sp), a
                                    755 ;	lib/src/stm8s_uart1.c: 517: UART1->CR4 &= ((uint8_t)~UART1_CR4_ADD);
      008930 C6 52 37         [ 1]  756 	ld	a, 0x5237
      008933 A4 F0            [ 1]  757 	and	a, #0xf0
      008935 C7 52 37         [ 1]  758 	ld	0x5237, a
                                    759 ;	lib/src/stm8s_uart1.c: 519: UART1->CR4 |= UART1_Address;
      008938 C6 52 37         [ 1]  760 	ld	a, 0x5237
      00893B 1A 01            [ 1]  761 	or	a, (0x01, sp)
      00893D C7 52 37         [ 1]  762 	ld	0x5237, a
                                    763 ;	lib/src/stm8s_uart1.c: 520: }
      008940 84               [ 1]  764 	pop	a
      008941 81               [ 4]  765 	ret
                                    766 ;	lib/src/stm8s_uart1.c: 528: void UART1_SetGuardTime(uint8_t UART1_GuardTime)
                                    767 ;	-----------------------------------------
                                    768 ;	 function UART1_SetGuardTime
                                    769 ;	-----------------------------------------
      008942                        770 _UART1_SetGuardTime:
                                    771 ;	lib/src/stm8s_uart1.c: 531: UART1->GTR = UART1_GuardTime;
      008942 C7 52 39         [ 1]  772 	ld	0x5239, a
                                    773 ;	lib/src/stm8s_uart1.c: 532: }
      008945 81               [ 4]  774 	ret
                                    775 ;	lib/src/stm8s_uart1.c: 556: void UART1_SetPrescaler(uint8_t UART1_Prescaler)
                                    776 ;	-----------------------------------------
                                    777 ;	 function UART1_SetPrescaler
                                    778 ;	-----------------------------------------
      008946                        779 _UART1_SetPrescaler:
                                    780 ;	lib/src/stm8s_uart1.c: 559: UART1->PSCR = UART1_Prescaler;
      008946 C7 52 3A         [ 1]  781 	ld	0x523a, a
                                    782 ;	lib/src/stm8s_uart1.c: 560: }
      008949 81               [ 4]  783 	ret
                                    784 ;	lib/src/stm8s_uart1.c: 568: FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
                                    785 ;	-----------------------------------------
                                    786 ;	 function UART1_GetFlagStatus
                                    787 ;	-----------------------------------------
      00894A                        788 _UART1_GetFlagStatus:
      00894A 52 03            [ 2]  789 	sub	sp, #3
                                    790 ;	lib/src/stm8s_uart1.c: 577: if (UART1_FLAG == UART1_FLAG_LBDF)
      00894C 1F 01            [ 2]  791 	ldw	(0x01, sp), x
                                    792 ;	lib/src/stm8s_uart1.c: 579: if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
      00894E 41               [ 1]  793 	exg	a, xl
      00894F 6B 03            [ 1]  794 	ld	(0x03, sp), a
      008951 41               [ 1]  795 	exg	a, xl
                                    796 ;	lib/src/stm8s_uart1.c: 577: if (UART1_FLAG == UART1_FLAG_LBDF)
      008952 1E 01            [ 2]  797 	ldw	x, (0x01, sp)
      008954 A3 02 10         [ 2]  798 	cpw	x, #0x0210
      008957 26 0E            [ 1]  799 	jrne	00114$
                                    800 ;	lib/src/stm8s_uart1.c: 579: if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
      008959 C6 52 37         [ 1]  801 	ld	a, 0x5237
      00895C 14 03            [ 1]  802 	and	a, (0x03, sp)
      00895E 27 04            [ 1]  803 	jreq	00102$
                                    804 ;	lib/src/stm8s_uart1.c: 582: status = SET;
      008960 A6 01            [ 1]  805 	ld	a, #0x01
      008962 20 23            [ 2]  806 	jra	00115$
      008964                        807 00102$:
                                    808 ;	lib/src/stm8s_uart1.c: 587: status = RESET;
      008964 4F               [ 1]  809 	clr	a
      008965 20 20            [ 2]  810 	jra	00115$
      008967                        811 00114$:
                                    812 ;	lib/src/stm8s_uart1.c: 590: else if (UART1_FLAG == UART1_FLAG_SBK)
      008967 1E 01            [ 2]  813 	ldw	x, (0x01, sp)
      008969 A3 01 01         [ 2]  814 	cpw	x, #0x0101
      00896C 26 0E            [ 1]  815 	jrne	00111$
                                    816 ;	lib/src/stm8s_uart1.c: 592: if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
      00896E C6 52 35         [ 1]  817 	ld	a, 0x5235
      008971 14 03            [ 1]  818 	and	a, (0x03, sp)
      008973 27 04            [ 1]  819 	jreq	00105$
                                    820 ;	lib/src/stm8s_uart1.c: 595: status = SET;
      008975 A6 01            [ 1]  821 	ld	a, #0x01
      008977 20 0E            [ 2]  822 	jra	00115$
      008979                        823 00105$:
                                    824 ;	lib/src/stm8s_uart1.c: 600: status = RESET;
      008979 4F               [ 1]  825 	clr	a
      00897A 20 0B            [ 2]  826 	jra	00115$
      00897C                        827 00111$:
                                    828 ;	lib/src/stm8s_uart1.c: 605: if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
      00897C C6 52 30         [ 1]  829 	ld	a, 0x5230
      00897F 14 03            [ 1]  830 	and	a, (0x03, sp)
      008981 27 03            [ 1]  831 	jreq	00108$
                                    832 ;	lib/src/stm8s_uart1.c: 608: status = SET;
      008983 A6 01            [ 1]  833 	ld	a, #0x01
                                    834 ;	lib/src/stm8s_uart1.c: 613: status = RESET;
      008985 21                     835 	.byte 0x21
      008986                        836 00108$:
      008986 4F               [ 1]  837 	clr	a
      008987                        838 00115$:
                                    839 ;	lib/src/stm8s_uart1.c: 617: return status;
                                    840 ;	lib/src/stm8s_uart1.c: 618: }
      008987 5B 03            [ 2]  841 	addw	sp, #3
      008989 81               [ 4]  842 	ret
                                    843 ;	lib/src/stm8s_uart1.c: 646: void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
                                    844 ;	-----------------------------------------
                                    845 ;	 function UART1_ClearFlag
                                    846 ;	-----------------------------------------
      00898A                        847 _UART1_ClearFlag:
                                    848 ;	lib/src/stm8s_uart1.c: 651: if (UART1_FLAG == UART1_FLAG_RXNE)
      00898A A3 00 20         [ 2]  849 	cpw	x, #0x0020
      00898D 26 05            [ 1]  850 	jrne	00102$
                                    851 ;	lib/src/stm8s_uart1.c: 653: UART1->SR = (uint8_t)~(UART1_SR_RXNE);
      00898F 35 DF 52 30      [ 1]  852 	mov	0x5230+0, #0xdf
      008993 81               [ 4]  853 	ret
      008994                        854 00102$:
                                    855 ;	lib/src/stm8s_uart1.c: 658: UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
      008994 72 19 52 37      [ 1]  856 	bres	0x5237, #4
                                    857 ;	lib/src/stm8s_uart1.c: 660: }
      008998 81               [ 4]  858 	ret
                                    859 ;	lib/src/stm8s_uart1.c: 675: ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
                                    860 ;	-----------------------------------------
                                    861 ;	 function UART1_GetITStatus
                                    862 ;	-----------------------------------------
      008999                        863 _UART1_GetITStatus:
      008999 52 04            [ 2]  864 	sub	sp, #4
                                    865 ;	lib/src/stm8s_uart1.c: 687: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
      00899B 90 93            [ 1]  866 	ldw	y, x
      00899D 9F               [ 1]  867 	ld	a, xl
      00899E A4 0F            [ 1]  868 	and	a, #0x0f
      0089A0 88               [ 1]  869 	push	a
      0089A1 A6 01            [ 1]  870 	ld	a, #0x01
      0089A3 6B 02            [ 1]  871 	ld	(0x02, sp), a
      0089A5 84               [ 1]  872 	pop	a
      0089A6 4D               [ 1]  873 	tnz	a
      0089A7 27 05            [ 1]  874 	jreq	00162$
      0089A9                        875 00161$:
      0089A9 08 01            [ 1]  876 	sll	(0x01, sp)
      0089AB 4A               [ 1]  877 	dec	a
      0089AC 26 FB            [ 1]  878 	jrne	00161$
      0089AE                        879 00162$:
                                    880 ;	lib/src/stm8s_uart1.c: 689: itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
      0089AE 9F               [ 1]  881 	ld	a, xl
      0089AF 4E               [ 1]  882 	swap	a
      0089B0 A4 0F            [ 1]  883 	and	a, #0x0f
                                    884 ;	lib/src/stm8s_uart1.c: 691: itmask2 = (uint8_t)((uint8_t)1 << itmask1);
      0089B2 88               [ 1]  885 	push	a
      0089B3 A6 01            [ 1]  886 	ld	a, #0x01
      0089B5 6B 03            [ 1]  887 	ld	(0x03, sp), a
      0089B7 84               [ 1]  888 	pop	a
      0089B8 4D               [ 1]  889 	tnz	a
      0089B9 27 05            [ 1]  890 	jreq	00164$
      0089BB                        891 00163$:
      0089BB 08 02            [ 1]  892 	sll	(0x02, sp)
      0089BD 4A               [ 1]  893 	dec	a
      0089BE 26 FB            [ 1]  894 	jrne	00163$
      0089C0                        895 00164$:
                                    896 ;	lib/src/stm8s_uart1.c: 695: if (UART1_IT == UART1_IT_PE)
      0089C0 17 03            [ 2]  897 	ldw	(0x03, sp), y
      0089C2 93               [ 1]  898 	ldw	x, y
      0089C3 A3 01 00         [ 2]  899 	cpw	x, #0x0100
      0089C6 26 18            [ 1]  900 	jrne	00117$
                                    901 ;	lib/src/stm8s_uart1.c: 698: enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
      0089C8 C6 52 34         [ 1]  902 	ld	a, 0x5234
      0089CB 14 02            [ 1]  903 	and	a, (0x02, sp)
      0089CD 97               [ 1]  904 	ld	xl, a
                                    905 ;	lib/src/stm8s_uart1.c: 701: if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
      0089CE C6 52 30         [ 1]  906 	ld	a, 0x5230
      0089D1 14 01            [ 1]  907 	and	a, (0x01, sp)
      0089D3 27 08            [ 1]  908 	jreq	00102$
      0089D5 9F               [ 1]  909 	ld	a, xl
      0089D6 4D               [ 1]  910 	tnz	a
      0089D7 27 04            [ 1]  911 	jreq	00102$
                                    912 ;	lib/src/stm8s_uart1.c: 704: pendingbitstatus = SET;
      0089D9 A6 01            [ 1]  913 	ld	a, #0x01
      0089DB 20 37            [ 2]  914 	jra	00118$
      0089DD                        915 00102$:
                                    916 ;	lib/src/stm8s_uart1.c: 709: pendingbitstatus = RESET;
      0089DD 4F               [ 1]  917 	clr	a
      0089DE 20 34            [ 2]  918 	jra	00118$
      0089E0                        919 00117$:
                                    920 ;	lib/src/stm8s_uart1.c: 713: else if (UART1_IT == UART1_IT_LBDF)
      0089E0 1E 03            [ 2]  921 	ldw	x, (0x03, sp)
      0089E2 A3 03 46         [ 2]  922 	cpw	x, #0x0346
      0089E5 26 18            [ 1]  923 	jrne	00114$
                                    924 ;	lib/src/stm8s_uart1.c: 716: enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
      0089E7 C6 52 37         [ 1]  925 	ld	a, 0x5237
      0089EA 14 02            [ 1]  926 	and	a, (0x02, sp)
      0089EC 97               [ 1]  927 	ld	xl, a
                                    928 ;	lib/src/stm8s_uart1.c: 718: if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
      0089ED C6 52 37         [ 1]  929 	ld	a, 0x5237
      0089F0 14 01            [ 1]  930 	and	a, (0x01, sp)
      0089F2 27 08            [ 1]  931 	jreq	00106$
      0089F4 9F               [ 1]  932 	ld	a, xl
      0089F5 4D               [ 1]  933 	tnz	a
      0089F6 27 04            [ 1]  934 	jreq	00106$
                                    935 ;	lib/src/stm8s_uart1.c: 721: pendingbitstatus = SET;
      0089F8 A6 01            [ 1]  936 	ld	a, #0x01
      0089FA 20 18            [ 2]  937 	jra	00118$
      0089FC                        938 00106$:
                                    939 ;	lib/src/stm8s_uart1.c: 726: pendingbitstatus = RESET;
      0089FC 4F               [ 1]  940 	clr	a
      0089FD 20 15            [ 2]  941 	jra	00118$
      0089FF                        942 00114$:
                                    943 ;	lib/src/stm8s_uart1.c: 732: enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
      0089FF C6 52 35         [ 1]  944 	ld	a, 0x5235
      008A02 14 02            [ 1]  945 	and	a, (0x02, sp)
      008A04 97               [ 1]  946 	ld	xl, a
                                    947 ;	lib/src/stm8s_uart1.c: 734: if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
      008A05 C6 52 30         [ 1]  948 	ld	a, 0x5230
      008A08 14 01            [ 1]  949 	and	a, (0x01, sp)
      008A0A 27 07            [ 1]  950 	jreq	00110$
      008A0C 9F               [ 1]  951 	ld	a, xl
      008A0D 4D               [ 1]  952 	tnz	a
      008A0E 27 03            [ 1]  953 	jreq	00110$
                                    954 ;	lib/src/stm8s_uart1.c: 737: pendingbitstatus = SET;
      008A10 A6 01            [ 1]  955 	ld	a, #0x01
                                    956 ;	lib/src/stm8s_uart1.c: 742: pendingbitstatus = RESET;
      008A12 21                     957 	.byte 0x21
      008A13                        958 00110$:
      008A13 4F               [ 1]  959 	clr	a
      008A14                        960 00118$:
                                    961 ;	lib/src/stm8s_uart1.c: 747: return  pendingbitstatus;
                                    962 ;	lib/src/stm8s_uart1.c: 748: }
      008A14 5B 04            [ 2]  963 	addw	sp, #4
      008A16 81               [ 4]  964 	ret
                                    965 ;	lib/src/stm8s_uart1.c: 775: void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
                                    966 ;	-----------------------------------------
                                    967 ;	 function UART1_ClearITPendingBit
                                    968 ;	-----------------------------------------
      008A17                        969 _UART1_ClearITPendingBit:
                                    970 ;	lib/src/stm8s_uart1.c: 780: if (UART1_IT == UART1_IT_RXNE)
      008A17 A3 02 55         [ 2]  971 	cpw	x, #0x0255
      008A1A 26 05            [ 1]  972 	jrne	00102$
                                    973 ;	lib/src/stm8s_uart1.c: 782: UART1->SR = (uint8_t)~(UART1_SR_RXNE);
      008A1C 35 DF 52 30      [ 1]  974 	mov	0x5230+0, #0xdf
      008A20 81               [ 4]  975 	ret
      008A21                        976 00102$:
                                    977 ;	lib/src/stm8s_uart1.c: 787: UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
      008A21 72 19 52 37      [ 1]  978 	bres	0x5237, #4
                                    979 ;	lib/src/stm8s_uart1.c: 789: }
      008A25 81               [ 4]  980 	ret
                                    981 	.area CODE
                                    982 	.area CONST
                                    983 	.area INITIALIZER
                                    984 	.area CABS (ABS)
