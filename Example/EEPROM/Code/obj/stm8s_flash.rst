                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.3.0 #14184 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_flash
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _FLASH_Unlock
                                     12 	.globl _FLASH_Lock
                                     13 	.globl _FLASH_DeInit
                                     14 	.globl _FLASH_ITConfig
                                     15 	.globl _FLASH_EraseByte
                                     16 	.globl _FLASH_ProgramByte
                                     17 	.globl _FLASH_ReadByte
                                     18 	.globl _FLASH_ProgramWord
                                     19 	.globl _FLASH_ProgramOptionByte
                                     20 	.globl _FLASH_EraseOptionByte
                                     21 	.globl _FLASH_ReadOptionByte
                                     22 	.globl _FLASH_SetLowPowerMode
                                     23 	.globl _FLASH_SetProgrammingTime
                                     24 	.globl _FLASH_GetLowPowerMode
                                     25 	.globl _FLASH_GetProgrammingTime
                                     26 	.globl _FLASH_GetBootSize
                                     27 	.globl _FLASH_GetFlagStatus
                                     28 	.globl _FLASH_WaitForLastOperation
                                     29 	.globl _FLASH_EraseBlock
                                     30 	.globl _FLASH_ProgramBlock
                                     31 ;--------------------------------------------------------
                                     32 ; ram data
                                     33 ;--------------------------------------------------------
                                     34 	.area DATA
                                     35 ;--------------------------------------------------------
                                     36 ; ram data
                                     37 ;--------------------------------------------------------
                                     38 	.area INITIALIZED
                                     39 ;--------------------------------------------------------
                                     40 ; absolute external ram data
                                     41 ;--------------------------------------------------------
                                     42 	.area DABS (ABS)
                                     43 
                                     44 ; default segment ordering for linker
                                     45 	.area HOME
                                     46 	.area GSINIT
                                     47 	.area GSFINAL
                                     48 	.area CONST
                                     49 	.area INITIALIZER
                                     50 	.area CODE
                                     51 
                                     52 ;--------------------------------------------------------
                                     53 ; global & static initialisations
                                     54 ;--------------------------------------------------------
                                     55 	.area HOME
                                     56 	.area GSINIT
                                     57 	.area GSFINAL
                                     58 	.area GSINIT
                                     59 ;--------------------------------------------------------
                                     60 ; Home
                                     61 ;--------------------------------------------------------
                                     62 	.area HOME
                                     63 	.area HOME
                                     64 ;--------------------------------------------------------
                                     65 ; code
                                     66 ;--------------------------------------------------------
                                     67 	.area CODE
                                     68 ;	lib/src/stm8s_flash.c: 87: void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
                                     69 ;	-----------------------------------------
                                     70 ;	 function FLASH_Unlock
                                     71 ;	-----------------------------------------
      00862A                         72 _FLASH_Unlock:
                                     73 ;	lib/src/stm8s_flash.c: 93: if(FLASH_MemType == FLASH_MEMTYPE_PROG)
      00862A A1 FD            [ 1]   74 	cp	a, #0xfd
      00862C 26 09            [ 1]   75 	jrne	00102$
                                     76 ;	lib/src/stm8s_flash.c: 95: FLASH->PUKR = FLASH_RASS_KEY1;
      00862E 35 56 50 62      [ 1]   77 	mov	0x5062+0, #0x56
                                     78 ;	lib/src/stm8s_flash.c: 96: FLASH->PUKR = FLASH_RASS_KEY2;
      008632 35 AE 50 62      [ 1]   79 	mov	0x5062+0, #0xae
      008636 81               [ 4]   80 	ret
      008637                         81 00102$:
                                     82 ;	lib/src/stm8s_flash.c: 101: FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
      008637 35 AE 50 64      [ 1]   83 	mov	0x5064+0, #0xae
                                     84 ;	lib/src/stm8s_flash.c: 102: FLASH->DUKR = FLASH_RASS_KEY1;
      00863B 35 56 50 64      [ 1]   85 	mov	0x5064+0, #0x56
                                     86 ;	lib/src/stm8s_flash.c: 104: }
      00863F 81               [ 4]   87 	ret
                                     88 ;	lib/src/stm8s_flash.c: 112: void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
                                     89 ;	-----------------------------------------
                                     90 ;	 function FLASH_Lock
                                     91 ;	-----------------------------------------
      008640                         92 _FLASH_Lock:
      008640 88               [ 1]   93 	push	a
      008641 6B 01            [ 1]   94 	ld	(0x01, sp), a
                                     95 ;	lib/src/stm8s_flash.c: 118: FLASH->IAPSR &= (uint8_t)FLASH_MemType;
      008643 C6 50 5F         [ 1]   96 	ld	a, 0x505f
      008646 14 01            [ 1]   97 	and	a, (0x01, sp)
      008648 C7 50 5F         [ 1]   98 	ld	0x505f, a
                                     99 ;	lib/src/stm8s_flash.c: 119: }
      00864B 84               [ 1]  100 	pop	a
      00864C 81               [ 4]  101 	ret
                                    102 ;	lib/src/stm8s_flash.c: 126: void FLASH_DeInit(void)
                                    103 ;	-----------------------------------------
                                    104 ;	 function FLASH_DeInit
                                    105 ;	-----------------------------------------
      00864D                        106 _FLASH_DeInit:
                                    107 ;	lib/src/stm8s_flash.c: 128: FLASH->CR1 = FLASH_CR1_RESET_VALUE;
      00864D 35 00 50 5A      [ 1]  108 	mov	0x505a+0, #0x00
                                    109 ;	lib/src/stm8s_flash.c: 129: FLASH->CR2 = FLASH_CR2_RESET_VALUE;
      008651 35 00 50 5B      [ 1]  110 	mov	0x505b+0, #0x00
                                    111 ;	lib/src/stm8s_flash.c: 130: FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
      008655 35 FF 50 5C      [ 1]  112 	mov	0x505c+0, #0xff
                                    113 ;	lib/src/stm8s_flash.c: 131: FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
      008659 72 17 50 5F      [ 1]  114 	bres	0x505f, #3
                                    115 ;	lib/src/stm8s_flash.c: 132: FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
      00865D 72 13 50 5F      [ 1]  116 	bres	0x505f, #1
                                    117 ;	lib/src/stm8s_flash.c: 133: (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
      008661 C6 50 5F         [ 1]  118 	ld	a, 0x505f
                                    119 ;	lib/src/stm8s_flash.c: 134: }
      008664 81               [ 4]  120 	ret
                                    121 ;	lib/src/stm8s_flash.c: 142: void FLASH_ITConfig(FunctionalState NewState)
                                    122 ;	-----------------------------------------
                                    123 ;	 function FLASH_ITConfig
                                    124 ;	-----------------------------------------
      008665                        125 _FLASH_ITConfig:
      008665 88               [ 1]  126 	push	a
      008666 6B 01            [ 1]  127 	ld	(0x01, sp), a
                                    128 ;	lib/src/stm8s_flash.c: 149: FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
      008668 C6 50 5A         [ 1]  129 	ld	a, 0x505a
                                    130 ;	lib/src/stm8s_flash.c: 147: if(NewState != DISABLE)
      00866B 0D 01            [ 1]  131 	tnz	(0x01, sp)
      00866D 27 07            [ 1]  132 	jreq	00102$
                                    133 ;	lib/src/stm8s_flash.c: 149: FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
      00866F AA 02            [ 1]  134 	or	a, #0x02
      008671 C7 50 5A         [ 1]  135 	ld	0x505a, a
      008674 20 05            [ 2]  136 	jra	00104$
      008676                        137 00102$:
                                    138 ;	lib/src/stm8s_flash.c: 153: FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
      008676 A4 FD            [ 1]  139 	and	a, #0xfd
      008678 C7 50 5A         [ 1]  140 	ld	0x505a, a
      00867B                        141 00104$:
                                    142 ;	lib/src/stm8s_flash.c: 155: }
      00867B 84               [ 1]  143 	pop	a
      00867C 81               [ 4]  144 	ret
                                    145 ;	lib/src/stm8s_flash.c: 164: void FLASH_EraseByte(uint32_t Address)
                                    146 ;	-----------------------------------------
                                    147 ;	 function FLASH_EraseByte
                                    148 ;	-----------------------------------------
      00867D                        149 _FLASH_EraseByte:
                                    150 ;	lib/src/stm8s_flash.c: 170: *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE;
      00867D 1E 05            [ 2]  151 	ldw	x, (0x05, sp)
      00867F 7F               [ 1]  152 	clr	(x)
                                    153 ;	lib/src/stm8s_flash.c: 171: }
      008680 1E 01            [ 2]  154 	ldw	x, (1, sp)
      008682 5B 06            [ 2]  155 	addw	sp, #6
      008684 FC               [ 2]  156 	jp	(x)
                                    157 ;	lib/src/stm8s_flash.c: 181: void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
                                    158 ;	-----------------------------------------
                                    159 ;	 function FLASH_ProgramByte
                                    160 ;	-----------------------------------------
      008685                        161 _FLASH_ProgramByte:
                                    162 ;	lib/src/stm8s_flash.c: 185: *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
      008685 1E 05            [ 2]  163 	ldw	x, (0x05, sp)
      008687 7B 07            [ 1]  164 	ld	a, (0x07, sp)
      008689 F7               [ 1]  165 	ld	(x), a
                                    166 ;	lib/src/stm8s_flash.c: 186: }
      00868A 1E 01            [ 2]  167 	ldw	x, (1, sp)
      00868C 5B 07            [ 2]  168 	addw	sp, #7
      00868E FC               [ 2]  169 	jp	(x)
                                    170 ;	lib/src/stm8s_flash.c: 195: uint8_t FLASH_ReadByte(uint32_t Address)
                                    171 ;	-----------------------------------------
                                    172 ;	 function FLASH_ReadByte
                                    173 ;	-----------------------------------------
      00868F                        174 _FLASH_ReadByte:
                                    175 ;	lib/src/stm8s_flash.c: 201: return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address);
      00868F 1E 05            [ 2]  176 	ldw	x, (0x05, sp)
      008691 F6               [ 1]  177 	ld	a, (x)
                                    178 ;	lib/src/stm8s_flash.c: 202: }
      008692 1E 01            [ 2]  179 	ldw	x, (1, sp)
      008694 5B 06            [ 2]  180 	addw	sp, #6
      008696 FC               [ 2]  181 	jp	(x)
                                    182 ;	lib/src/stm8s_flash.c: 212: void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
                                    183 ;	-----------------------------------------
                                    184 ;	 function FLASH_ProgramWord
                                    185 ;	-----------------------------------------
      008697                        186 _FLASH_ProgramWord:
      008697 52 04            [ 2]  187 	sub	sp, #4
                                    188 ;	lib/src/stm8s_flash.c: 218: FLASH->CR2 |= FLASH_CR2_WPRG;
      008699 72 1C 50 5B      [ 1]  189 	bset	0x505b, #6
                                    190 ;	lib/src/stm8s_flash.c: 219: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
      00869D 72 1D 50 5C      [ 1]  191 	bres	0x505c, #6
                                    192 ;	lib/src/stm8s_flash.c: 222: *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));
      0086A1 1E 09            [ 2]  193 	ldw	x, (0x09, sp)
      0086A3 1F 01            [ 2]  194 	ldw	(0x01, sp), x
      0086A5 90 96            [ 1]  195 	ldw	y, sp
      0086A7 72 A9 00 0B      [ 2]  196 	addw	y, #11
      0086AB 93               [ 1]  197 	ldw	x, y
      0086AC F6               [ 1]  198 	ld	a, (x)
      0086AD 1E 01            [ 2]  199 	ldw	x, (0x01, sp)
      0086AF F7               [ 1]  200 	ld	(x), a
                                    201 ;	lib/src/stm8s_flash.c: 224: *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data)+1);
      0086B0 1E 01            [ 2]  202 	ldw	x, (0x01, sp)
      0086B2 5C               [ 1]  203 	incw	x
      0086B3 1F 03            [ 2]  204 	ldw	(0x03, sp), x
      0086B5 93               [ 1]  205 	ldw	x, y
      0086B6 E6 01            [ 1]  206 	ld	a, (0x1, x)
      0086B8 1E 03            [ 2]  207 	ldw	x, (0x03, sp)
      0086BA F7               [ 1]  208 	ld	(x), a
                                    209 ;	lib/src/stm8s_flash.c: 226: *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data)+2);
      0086BB 1E 01            [ 2]  210 	ldw	x, (0x01, sp)
      0086BD 5C               [ 1]  211 	incw	x
      0086BE 5C               [ 1]  212 	incw	x
      0086BF 1F 03            [ 2]  213 	ldw	(0x03, sp), x
      0086C1 93               [ 1]  214 	ldw	x, y
      0086C2 E6 02            [ 1]  215 	ld	a, (0x2, x)
      0086C4 1E 03            [ 2]  216 	ldw	x, (0x03, sp)
      0086C6 F7               [ 1]  217 	ld	(x), a
                                    218 ;	lib/src/stm8s_flash.c: 228: *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data)+3);
      0086C7 1E 01            [ 2]  219 	ldw	x, (0x01, sp)
      0086C9 90 E6 03         [ 1]  220 	ld	a, (0x3, y)
      0086CC E7 03            [ 1]  221 	ld	(0x0003, x), a
                                    222 ;	lib/src/stm8s_flash.c: 229: }
      0086CE 1E 05            [ 2]  223 	ldw	x, (5, sp)
      0086D0 5B 0E            [ 2]  224 	addw	sp, #14
      0086D2 FC               [ 2]  225 	jp	(x)
                                    226 ;	lib/src/stm8s_flash.c: 237: void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
                                    227 ;	-----------------------------------------
                                    228 ;	 function FLASH_ProgramOptionByte
                                    229 ;	-----------------------------------------
      0086D3                        230 _FLASH_ProgramOptionByte:
      0086D3 52 05            [ 2]  231 	sub	sp, #5
      0086D5 6B 05            [ 1]  232 	ld	(0x05, sp), a
                                    233 ;	lib/src/stm8s_flash.c: 243: FLASH->CR2 |= FLASH_CR2_OPT;
      0086D7 72 1E 50 5B      [ 1]  234 	bset	0x505b, #7
                                    235 ;	lib/src/stm8s_flash.c: 244: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
      0086DB 72 1F 50 5C      [ 1]  236 	bres	0x505c, #7
                                    237 ;	lib/src/stm8s_flash.c: 247: if(Address == 0x4800)
      0086DF 1F 01            [ 2]  238 	ldw	(0x01, sp), x
                                    239 ;	lib/src/stm8s_flash.c: 250: *((NEAR uint8_t*)Address) = Data;
      0086E1 1F 03            [ 2]  240 	ldw	(0x03, sp), x
                                    241 ;	lib/src/stm8s_flash.c: 247: if(Address == 0x4800)
      0086E3 1E 01            [ 2]  242 	ldw	x, (0x01, sp)
      0086E5 A3 48 00         [ 2]  243 	cpw	x, #0x4800
      0086E8 26 07            [ 1]  244 	jrne	00102$
                                    245 ;	lib/src/stm8s_flash.c: 250: *((NEAR uint8_t*)Address) = Data;
      0086EA 1E 03            [ 2]  246 	ldw	x, (0x03, sp)
      0086EC 7B 05            [ 1]  247 	ld	a, (0x05, sp)
      0086EE F7               [ 1]  248 	ld	(x), a
      0086EF 20 0C            [ 2]  249 	jra	00103$
      0086F1                        250 00102$:
                                    251 ;	lib/src/stm8s_flash.c: 255: *((NEAR uint8_t*)Address) = Data;
      0086F1 1E 03            [ 2]  252 	ldw	x, (0x03, sp)
      0086F3 7B 05            [ 1]  253 	ld	a, (0x05, sp)
      0086F5 F7               [ 1]  254 	ld	(x), a
                                    255 ;	lib/src/stm8s_flash.c: 256: *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
      0086F6 1E 01            [ 2]  256 	ldw	x, (0x01, sp)
      0086F8 5C               [ 1]  257 	incw	x
      0086F9 7B 05            [ 1]  258 	ld	a, (0x05, sp)
      0086FB 43               [ 1]  259 	cpl	a
      0086FC F7               [ 1]  260 	ld	(x), a
      0086FD                        261 00103$:
                                    262 ;	lib/src/stm8s_flash.c: 258: FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
      0086FD A6 FD            [ 1]  263 	ld	a, #0xfd
      0086FF CD 87 D4         [ 4]  264 	call	_FLASH_WaitForLastOperation
                                    265 ;	lib/src/stm8s_flash.c: 261: FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
      008702 72 1F 50 5B      [ 1]  266 	bres	0x505b, #7
                                    267 ;	lib/src/stm8s_flash.c: 262: FLASH->NCR2 |= FLASH_NCR2_NOPT;
      008706 72 1E 50 5C      [ 1]  268 	bset	0x505c, #7
                                    269 ;	lib/src/stm8s_flash.c: 263: }
      00870A 5B 05            [ 2]  270 	addw	sp, #5
      00870C 81               [ 4]  271 	ret
                                    272 ;	lib/src/stm8s_flash.c: 270: void FLASH_EraseOptionByte(uint16_t Address)
                                    273 ;	-----------------------------------------
                                    274 ;	 function FLASH_EraseOptionByte
                                    275 ;	-----------------------------------------
      00870D                        276 _FLASH_EraseOptionByte:
      00870D 52 02            [ 2]  277 	sub	sp, #2
      00870F 51               [ 1]  278 	exgw	x, y
                                    279 ;	lib/src/stm8s_flash.c: 276: FLASH->CR2 |= FLASH_CR2_OPT;
      008710 72 1E 50 5B      [ 1]  280 	bset	0x505b, #7
                                    281 ;	lib/src/stm8s_flash.c: 277: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
      008714 72 1F 50 5C      [ 1]  282 	bres	0x505c, #7
                                    283 ;	lib/src/stm8s_flash.c: 280: if(Address == 0x4800)
      008718 93               [ 1]  284 	ldw	x, y
                                    285 ;	lib/src/stm8s_flash.c: 283: *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
      008719 17 01            [ 2]  286 	ldw	(0x01, sp), y
                                    287 ;	lib/src/stm8s_flash.c: 280: if(Address == 0x4800)
      00871B A3 48 00         [ 2]  288 	cpw	x, #0x4800
      00871E 26 05            [ 1]  289 	jrne	00102$
                                    290 ;	lib/src/stm8s_flash.c: 283: *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
      008720 1E 01            [ 2]  291 	ldw	x, (0x01, sp)
      008722 7F               [ 1]  292 	clr	(x)
      008723 20 08            [ 2]  293 	jra	00103$
      008725                        294 00102$:
                                    295 ;	lib/src/stm8s_flash.c: 288: *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
      008725 1E 01            [ 2]  296 	ldw	x, (0x01, sp)
      008727 7F               [ 1]  297 	clr	(x)
                                    298 ;	lib/src/stm8s_flash.c: 289: *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
      008728 93               [ 1]  299 	ldw	x, y
      008729 5C               [ 1]  300 	incw	x
      00872A A6 FF            [ 1]  301 	ld	a, #0xff
      00872C F7               [ 1]  302 	ld	(x), a
      00872D                        303 00103$:
                                    304 ;	lib/src/stm8s_flash.c: 291: FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
      00872D A6 FD            [ 1]  305 	ld	a, #0xfd
      00872F CD 87 D4         [ 4]  306 	call	_FLASH_WaitForLastOperation
                                    307 ;	lib/src/stm8s_flash.c: 294: FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
      008732 72 1F 50 5B      [ 1]  308 	bres	0x505b, #7
                                    309 ;	lib/src/stm8s_flash.c: 295: FLASH->NCR2 |= FLASH_NCR2_NOPT;
      008736 72 1E 50 5C      [ 1]  310 	bset	0x505c, #7
                                    311 ;	lib/src/stm8s_flash.c: 296: }
      00873A 5B 02            [ 2]  312 	addw	sp, #2
      00873C 81               [ 4]  313 	ret
                                    314 ;	lib/src/stm8s_flash.c: 303: uint16_t FLASH_ReadOptionByte(uint16_t Address)
                                    315 ;	-----------------------------------------
                                    316 ;	 function FLASH_ReadOptionByte
                                    317 ;	-----------------------------------------
      00873D                        318 _FLASH_ReadOptionByte:
      00873D 52 02            [ 2]  319 	sub	sp, #2
                                    320 ;	lib/src/stm8s_flash.c: 311: value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
      00873F 90 93            [ 1]  321 	ldw	y, x
      008741 F6               [ 1]  322 	ld	a, (x)
      008742 6B 01            [ 1]  323 	ld	(0x01, sp), a
                                    324 ;	lib/src/stm8s_flash.c: 312: value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
      008744 E6 01            [ 1]  325 	ld	a, (0x1, x)
      008746 6B 02            [ 1]  326 	ld	(0x02, sp), a
                                    327 ;	lib/src/stm8s_flash.c: 315: if(Address == 0x4800)
                                    328 ;	lib/src/stm8s_flash.c: 317: res_value =	 value_optbyte;
      008748 5F               [ 1]  329 	clrw	x
      008749 7B 01            [ 1]  330 	ld	a, (0x01, sp)
      00874B 97               [ 1]  331 	ld	xl, a
                                    332 ;	lib/src/stm8s_flash.c: 315: if(Address == 0x4800)
      00874C 90 A3 48 00      [ 2]  333 	cpw	y, #0x4800
      008750 27 19            [ 1]  334 	jreq	00106$
                                    335 ;	lib/src/stm8s_flash.c: 317: res_value =	 value_optbyte;
                                    336 ;	lib/src/stm8s_flash.c: 321: if(value_optbyte == (uint8_t)(~value_optbyte_complement))
      008752 7B 02            [ 1]  337 	ld	a, (0x02, sp)
      008754 43               [ 1]  338 	cpl	a
      008755 11 01            [ 1]  339 	cp	a, (0x01, sp)
      008757 26 0F            [ 1]  340 	jrne	00102$
                                    341 ;	lib/src/stm8s_flash.c: 323: res_value = (uint16_t)((uint16_t)value_optbyte << 8);
      008759 4F               [ 1]  342 	clr	a
      00875A 02               [ 1]  343 	rlwa	x
                                    344 ;	lib/src/stm8s_flash.c: 324: res_value = res_value | (uint16_t)value_optbyte_complement;
      00875B 7B 02            [ 1]  345 	ld	a, (0x02, sp)
      00875D 0F 01            [ 1]  346 	clr	(0x01, sp)
      00875F 89               [ 2]  347 	pushw	x
      008760 1A 02            [ 1]  348 	or	a, (2, sp)
      008762 85               [ 2]  349 	popw	x
      008763 02               [ 1]  350 	rlwa	x
      008764 1A 01            [ 1]  351 	or	a, (0x01, sp)
      008766 95               [ 1]  352 	ld	xh, a
                                    353 ;	lib/src/stm8s_flash.c: 328: res_value = FLASH_OPTIONBYTE_ERROR;
      008767 BC                     354 	.byte 0xbc
      008768                        355 00102$:
      008768 AE 55 55         [ 2]  356 	ldw	x, #0x5555
      00876B                        357 00106$:
                                    358 ;	lib/src/stm8s_flash.c: 331: return(res_value);
                                    359 ;	lib/src/stm8s_flash.c: 332: }
      00876B 5B 02            [ 2]  360 	addw	sp, #2
      00876D 81               [ 4]  361 	ret
                                    362 ;	lib/src/stm8s_flash.c: 340: void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
                                    363 ;	-----------------------------------------
                                    364 ;	 function FLASH_SetLowPowerMode
                                    365 ;	-----------------------------------------
      00876E                        366 _FLASH_SetLowPowerMode:
      00876E 88               [ 1]  367 	push	a
      00876F 6B 01            [ 1]  368 	ld	(0x01, sp), a
                                    369 ;	lib/src/stm8s_flash.c: 346: FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT));
      008771 C6 50 5A         [ 1]  370 	ld	a, 0x505a
      008774 A4 F3            [ 1]  371 	and	a, #0xf3
      008776 C7 50 5A         [ 1]  372 	ld	0x505a, a
                                    373 ;	lib/src/stm8s_flash.c: 349: FLASH->CR1 |= (uint8_t)FLASH_LPMode;
      008779 C6 50 5A         [ 1]  374 	ld	a, 0x505a
      00877C 1A 01            [ 1]  375 	or	a, (0x01, sp)
      00877E C7 50 5A         [ 1]  376 	ld	0x505a, a
                                    377 ;	lib/src/stm8s_flash.c: 350: }
      008781 84               [ 1]  378 	pop	a
      008782 81               [ 4]  379 	ret
                                    380 ;	lib/src/stm8s_flash.c: 358: void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
                                    381 ;	-----------------------------------------
                                    382 ;	 function FLASH_SetProgrammingTime
                                    383 ;	-----------------------------------------
      008783                        384 _FLASH_SetProgrammingTime:
      008783 97               [ 1]  385 	ld	xl, a
                                    386 ;	lib/src/stm8s_flash.c: 363: FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
      008784 C6 50 5A         [ 1]  387 	ld	a, 0x505a
      008787 A4 FE            [ 1]  388 	and	a, #0xfe
      008789 C7 50 5A         [ 1]  389 	ld	0x505a, a
                                    390 ;	lib/src/stm8s_flash.c: 364: FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
      00878C C6 50 5A         [ 1]  391 	ld	a, 0x505a
      00878F 89               [ 2]  392 	pushw	x
      008790 1A 02            [ 1]  393 	or	a, (2, sp)
      008792 85               [ 2]  394 	popw	x
      008793 C7 50 5A         [ 1]  395 	ld	0x505a, a
                                    396 ;	lib/src/stm8s_flash.c: 365: }
      008796 81               [ 4]  397 	ret
                                    398 ;	lib/src/stm8s_flash.c: 372: FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
                                    399 ;	-----------------------------------------
                                    400 ;	 function FLASH_GetLowPowerMode
                                    401 ;	-----------------------------------------
      008797                        402 _FLASH_GetLowPowerMode:
                                    403 ;	lib/src/stm8s_flash.c: 374: return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
      008797 C6 50 5A         [ 1]  404 	ld	a, 0x505a
      00879A A4 0C            [ 1]  405 	and	a, #0x0c
                                    406 ;	lib/src/stm8s_flash.c: 375: }
      00879C 81               [ 4]  407 	ret
                                    408 ;	lib/src/stm8s_flash.c: 382: FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
                                    409 ;	-----------------------------------------
                                    410 ;	 function FLASH_GetProgrammingTime
                                    411 ;	-----------------------------------------
      00879D                        412 _FLASH_GetProgrammingTime:
                                    413 ;	lib/src/stm8s_flash.c: 384: return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
      00879D C6 50 5A         [ 1]  414 	ld	a, 0x505a
      0087A0 A4 01            [ 1]  415 	and	a, #0x01
                                    416 ;	lib/src/stm8s_flash.c: 385: }
      0087A2 81               [ 4]  417 	ret
                                    418 ;	lib/src/stm8s_flash.c: 392: uint32_t FLASH_GetBootSize(void)
                                    419 ;	-----------------------------------------
                                    420 ;	 function FLASH_GetBootSize
                                    421 ;	-----------------------------------------
      0087A3                        422 _FLASH_GetBootSize:
                                    423 ;	lib/src/stm8s_flash.c: 397: temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
      0087A3 C6 50 5D         [ 1]  424 	ld	a, 0x505d
      0087A6 5F               [ 1]  425 	clrw	x
      0087A7 5E               [ 1]  426 	swapw	x
      0087A8 90 95            [ 1]  427 	ld	yh, a
      0087AA 4F               [ 1]  428 	clr	a
      0087AB 90 97            [ 1]  429 	ld	yl, a
      0087AD 90 58            [ 2]  430 	sllw	y
      0087AF 59               [ 2]  431 	rlcw	x
                                    432 ;	lib/src/stm8s_flash.c: 400: if(FLASH->FPR == 0xFF)
      0087B0 C6 50 5D         [ 1]  433 	ld	a, 0x505d
      0087B3 4C               [ 1]  434 	inc	a
      0087B4 26 0B            [ 1]  435 	jrne	00102$
                                    436 ;	lib/src/stm8s_flash.c: 402: temp += 512;
      0087B6 72 A9 02 00      [ 2]  437 	addw	y, #0x0200
      0087BA 9F               [ 1]  438 	ld	a, xl
      0087BB A9 00            [ 1]  439 	adc	a, #0x00
      0087BD 02               [ 1]  440 	rlwa	x
      0087BE A9 00            [ 1]  441 	adc	a, #0x00
      0087C0 95               [ 1]  442 	ld	xh, a
      0087C1                        443 00102$:
                                    444 ;	lib/src/stm8s_flash.c: 406: return(temp);
      0087C1 51               [ 1]  445 	exgw	x, y
                                    446 ;	lib/src/stm8s_flash.c: 407: }
      0087C2 81               [ 4]  447 	ret
                                    448 ;	lib/src/stm8s_flash.c: 417: FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
                                    449 ;	-----------------------------------------
                                    450 ;	 function FLASH_GetFlagStatus
                                    451 ;	-----------------------------------------
      0087C3                        452 _FLASH_GetFlagStatus:
      0087C3 88               [ 1]  453 	push	a
      0087C4 6B 01            [ 1]  454 	ld	(0x01, sp), a
                                    455 ;	lib/src/stm8s_flash.c: 424: if((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
      0087C6 C6 50 5F         [ 1]  456 	ld	a, 0x505f
      0087C9 14 01            [ 1]  457 	and	a, (0x01, sp)
      0087CB 27 03            [ 1]  458 	jreq	00102$
                                    459 ;	lib/src/stm8s_flash.c: 426: status = SET; /* FLASH_FLAG is set */
      0087CD A6 01            [ 1]  460 	ld	a, #0x01
                                    461 ;	lib/src/stm8s_flash.c: 430: status = RESET; /* FLASH_FLAG is reset*/
      0087CF 21                     462 	.byte 0x21
      0087D0                        463 00102$:
      0087D0 4F               [ 1]  464 	clr	a
      0087D1                        465 00103$:
                                    466 ;	lib/src/stm8s_flash.c: 434: return status;
                                    467 ;	lib/src/stm8s_flash.c: 435: }
      0087D1 5B 01            [ 2]  468 	addw	sp, #1
      0087D3 81               [ 4]  469 	ret
                                    470 ;	lib/src/stm8s_flash.c: 549: IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType))
                                    471 ;	-----------------------------------------
                                    472 ;	 function FLASH_WaitForLastOperation
                                    473 ;	-----------------------------------------
      0087D4                        474 _FLASH_WaitForLastOperation:
                                    475 ;	lib/src/stm8s_flash.c: 551: uint8_t flagstatus = 0x00;
      0087D4 4F               [ 1]  476 	clr	a
                                    477 ;	lib/src/stm8s_flash.c: 577: while((flagstatus == 0x00) && (timeout != 0x00))
      0087D5 5F               [ 1]  478 	clrw	x
      0087D6 5A               [ 2]  479 	decw	x
      0087D7                        480 00102$:
      0087D7 4D               [ 1]  481 	tnz	a
      0087D8 26 0B            [ 1]  482 	jrne	00104$
      0087DA 5D               [ 2]  483 	tnzw	x
      0087DB 27 08            [ 1]  484 	jreq	00104$
                                    485 ;	lib/src/stm8s_flash.c: 579: flagstatus = (uint8_t)(FLASH->IAPSR & (FLASH_IAPSR_EOP | FLASH_IAPSR_WR_PG_DIS));
      0087DD C6 50 5F         [ 1]  486 	ld	a, 0x505f
      0087E0 A4 05            [ 1]  487 	and	a, #0x05
                                    488 ;	lib/src/stm8s_flash.c: 580: timeout--;
      0087E2 5A               [ 2]  489 	decw	x
      0087E3 20 F2            [ 2]  490 	jra	00102$
      0087E5                        491 00104$:
                                    492 ;	lib/src/stm8s_flash.c: 584: if(timeout == 0x00 )
      0087E5 5D               [ 2]  493 	tnzw	x
      0087E6 27 01            [ 1]  494 	jreq	00132$
      0087E8 81               [ 4]  495 	ret
      0087E9                        496 00132$:
                                    497 ;	lib/src/stm8s_flash.c: 586: flagstatus = FLASH_STATUS_TIMEOUT;
      0087E9 A6 02            [ 1]  498 	ld	a, #0x02
                                    499 ;	lib/src/stm8s_flash.c: 589: return((FLASH_Status_TypeDef)flagstatus);
                                    500 ;	lib/src/stm8s_flash.c: 590: }
      0087EB 81               [ 4]  501 	ret
                                    502 ;	lib/src/stm8s_flash.c: 599: IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
                                    503 ;	-----------------------------------------
                                    504 ;	 function FLASH_EraseBlock
                                    505 ;	-----------------------------------------
      0087EC                        506 _FLASH_EraseBlock:
      0087EC 52 04            [ 2]  507 	sub	sp, #4
      0087EE 51               [ 1]  508 	exgw	x, y
                                    509 ;	lib/src/stm8s_flash.c: 612: if(FLASH_MemType == FLASH_MEMTYPE_PROG)
      0087EF A1 FD            [ 1]  510 	cp	a, #0xfd
      0087F1 26 0A            [ 1]  511 	jrne	00102$
                                    512 ;	lib/src/stm8s_flash.c: 615: startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
      0087F3 AE 80 00         [ 2]  513 	ldw	x, #0x8000
      0087F6 1F 03            [ 2]  514 	ldw	(0x03, sp), x
      0087F8 5F               [ 1]  515 	clrw	x
      0087F9 1F 01            [ 2]  516 	ldw	(0x01, sp), x
      0087FB 20 08            [ 2]  517 	jra	00103$
      0087FD                        518 00102$:
                                    519 ;	lib/src/stm8s_flash.c: 620: startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
      0087FD AE 40 00         [ 2]  520 	ldw	x, #0x4000
      008800 1F 03            [ 2]  521 	ldw	(0x03, sp), x
      008802 5F               [ 1]  522 	clrw	x
      008803 1F 01            [ 2]  523 	ldw	(0x01, sp), x
      008805                        524 00103$:
                                    525 ;	lib/src/stm8s_flash.c: 628: pwFlash = (PointerAttr uint32_t *)(MemoryAddressCast)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
      008805 93               [ 1]  526 	ldw	x, y
      008806 58               [ 2]  527 	sllw	x
      008807 58               [ 2]  528 	sllw	x
      008808 58               [ 2]  529 	sllw	x
      008809 58               [ 2]  530 	sllw	x
      00880A 58               [ 2]  531 	sllw	x
      00880B 58               [ 2]  532 	sllw	x
      00880C 72 FB 03         [ 2]  533 	addw	x, (0x03, sp)
                                    534 ;	lib/src/stm8s_flash.c: 632: FLASH->CR2 |= FLASH_CR2_ERASE;
      00880F 72 1A 50 5B      [ 1]  535 	bset	0x505b, #5
                                    536 ;	lib/src/stm8s_flash.c: 633: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
      008813 72 1B 50 5C      [ 1]  537 	bres	0x505c, #5
                                    538 ;	lib/src/stm8s_flash.c: 637: *pwFlash = (uint32_t)0;
      008817 6F 03            [ 1]  539 	clr	(0x3, x)
      008819 6F 02            [ 1]  540 	clr	(0x2, x)
      00881B 6F 01            [ 1]  541 	clr	(0x1, x)
      00881D 7F               [ 1]  542 	clr	(x)
                                    543 ;	lib/src/stm8s_flash.c: 645: }
      00881E 5B 04            [ 2]  544 	addw	sp, #4
      008820 81               [ 4]  545 	ret
                                    546 ;	lib/src/stm8s_flash.c: 656: IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType,
                                    547 ;	-----------------------------------------
                                    548 ;	 function FLASH_ProgramBlock
                                    549 ;	-----------------------------------------
      008821                        550 _FLASH_ProgramBlock:
      008821 52 08            [ 2]  551 	sub	sp, #8
      008823 51               [ 1]  552 	exgw	x, y
                                    553 ;	lib/src/stm8s_flash.c: 665: if(FLASH_MemType == FLASH_MEMTYPE_PROG)
      008824 A1 FD            [ 1]  554 	cp	a, #0xfd
      008826 26 09            [ 1]  555 	jrne	00102$
                                    556 ;	lib/src/stm8s_flash.c: 668: startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
      008828 0F 04            [ 1]  557 	clr	(0x04, sp)
      00882A A6 80            [ 1]  558 	ld	a, #0x80
      00882C 5F               [ 1]  559 	clrw	x
      00882D 1F 01            [ 2]  560 	ldw	(0x01, sp), x
      00882F 20 07            [ 2]  561 	jra	00103$
      008831                        562 00102$:
                                    563 ;	lib/src/stm8s_flash.c: 673: startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
      008831 0F 04            [ 1]  564 	clr	(0x04, sp)
      008833 A6 40            [ 1]  565 	ld	a, #0x40
      008835 5F               [ 1]  566 	clrw	x
      008836 1F 01            [ 2]  567 	ldw	(0x01, sp), x
      008838                        568 00103$:
                                    569 ;	lib/src/stm8s_flash.c: 677: startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
      008838 5F               [ 1]  570 	clrw	x
      008839 88               [ 1]  571 	push	a
      00883A A6 06            [ 1]  572 	ld	a, #0x06
      00883C                        573 00131$:
      00883C 90 58            [ 2]  574 	sllw	y
      00883E 59               [ 2]  575 	rlcw	x
      00883F 4A               [ 1]  576 	dec	a
      008840 26 FA            [ 1]  577 	jrne	00131$
      008842 17 08            [ 2]  578 	ldw	(0x08, sp), y
      008844 84               [ 1]  579 	pop	a
      008845 90 95            [ 1]  580 	ld	yh, a
      008847 61               [ 1]  581 	exg	a, yl
      008848 7B 04            [ 1]  582 	ld	a, (0x04, sp)
      00884A 61               [ 1]  583 	exg	a, yl
      00884B 72 F9 07         [ 2]  584 	addw	y, (0x07, sp)
      00884E 9F               [ 1]  585 	ld	a, xl
      00884F 19 02            [ 1]  586 	adc	a, (0x02, sp)
      008851 02               [ 1]  587 	rlwa	x
      008852 19 01            [ 1]  588 	adc	a, (0x01, sp)
      008854 95               [ 1]  589 	ld	xh, a
      008855 17 03            [ 2]  590 	ldw	(0x03, sp), y
      008857 1F 01            [ 2]  591 	ldw	(0x01, sp), x
                                    592 ;	lib/src/stm8s_flash.c: 683: FLASH->CR2 |= FLASH_CR2_PRG;
      008859 C6 50 5B         [ 1]  593 	ld	a, 0x505b
                                    594 ;	lib/src/stm8s_flash.c: 680: if(FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
      00885C 0D 0B            [ 1]  595 	tnz	(0x0b, sp)
      00885E 26 0B            [ 1]  596 	jrne	00105$
                                    597 ;	lib/src/stm8s_flash.c: 683: FLASH->CR2 |= FLASH_CR2_PRG;
      008860 AA 01            [ 1]  598 	or	a, #0x01
      008862 C7 50 5B         [ 1]  599 	ld	0x505b, a
                                    600 ;	lib/src/stm8s_flash.c: 684: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
      008865 72 11 50 5C      [ 1]  601 	bres	0x505c, #0
      008869 20 09            [ 2]  602 	jra	00114$
      00886B                        603 00105$:
                                    604 ;	lib/src/stm8s_flash.c: 689: FLASH->CR2 |= FLASH_CR2_FPRG;
      00886B AA 10            [ 1]  605 	or	a, #0x10
      00886D C7 50 5B         [ 1]  606 	ld	0x505b, a
                                    607 ;	lib/src/stm8s_flash.c: 690: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
      008870 72 19 50 5C      [ 1]  608 	bres	0x505c, #4
                                    609 ;	lib/src/stm8s_flash.c: 694: for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
      008874                        610 00114$:
      008874 90 5F            [ 1]  611 	clrw	y
      008876                        612 00108$:
                                    613 ;	lib/src/stm8s_flash.c: 696: *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
      008876 1E 03            [ 2]  614 	ldw	x, (0x03, sp)
      008878 1F 05            [ 2]  615 	ldw	(0x05, sp), x
      00887A 93               [ 1]  616 	ldw	x, y
      00887B 72 FB 05         [ 2]  617 	addw	x, (0x05, sp)
      00887E 1F 07            [ 2]  618 	ldw	(0x07, sp), x
      008880 93               [ 1]  619 	ldw	x, y
      008881 72 FB 0C         [ 2]  620 	addw	x, (0x0c, sp)
      008884 F6               [ 1]  621 	ld	a, (x)
      008885 1E 07            [ 2]  622 	ldw	x, (0x07, sp)
      008887 F7               [ 1]  623 	ld	(x), a
                                    624 ;	lib/src/stm8s_flash.c: 694: for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
      008888 90 5C            [ 1]  625 	incw	y
      00888A 90 A3 00 40      [ 2]  626 	cpw	y, #0x0040
      00888E 25 E6            [ 1]  627 	jrc	00108$
                                    628 ;	lib/src/stm8s_flash.c: 698: }
      008890 1E 09            [ 2]  629 	ldw	x, (9, sp)
      008892 5B 0D            [ 2]  630 	addw	sp, #13
      008894 FC               [ 2]  631 	jp	(x)
                                    632 	.area CODE
                                    633 	.area CONST
                                    634 	.area INITIALIZER
                                    635 	.area CABS (ABS)
