                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.3.0 #14184 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_beep
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _BEEP_DeInit
                                     12 	.globl _BEEP_Init
                                     13 	.globl _BEEP_Cmd
                                     14 	.globl _BEEP_LSICalibrationConfig
                                     15 ;--------------------------------------------------------
                                     16 ; ram data
                                     17 ;--------------------------------------------------------
                                     18 	.area DATA
                                     19 ;--------------------------------------------------------
                                     20 ; ram data
                                     21 ;--------------------------------------------------------
                                     22 	.area INITIALIZED
                                     23 ;--------------------------------------------------------
                                     24 ; absolute external ram data
                                     25 ;--------------------------------------------------------
                                     26 	.area DABS (ABS)
                                     27 
                                     28 ; default segment ordering for linker
                                     29 	.area HOME
                                     30 	.area GSINIT
                                     31 	.area GSFINAL
                                     32 	.area CONST
                                     33 	.area INITIALIZER
                                     34 	.area CODE
                                     35 
                                     36 ;--------------------------------------------------------
                                     37 ; global & static initialisations
                                     38 ;--------------------------------------------------------
                                     39 	.area HOME
                                     40 	.area GSINIT
                                     41 	.area GSFINAL
                                     42 	.area GSINIT
                                     43 ;--------------------------------------------------------
                                     44 ; Home
                                     45 ;--------------------------------------------------------
                                     46 	.area HOME
                                     47 	.area HOME
                                     48 ;--------------------------------------------------------
                                     49 ; code
                                     50 ;--------------------------------------------------------
                                     51 	.area CODE
                                     52 ;	lib/src/stm8s_beep.c: 54: void BEEP_DeInit(void)
                                     53 ;	-----------------------------------------
                                     54 ;	 function BEEP_DeInit
                                     55 ;	-----------------------------------------
      0084A2                         56 _BEEP_DeInit:
                                     57 ;	lib/src/stm8s_beep.c: 56: BEEP->CSR = BEEP_CSR_RESET_VALUE;
      0084A2 35 1F 50 F3      [ 1]   58 	mov	0x50f3+0, #0x1f
                                     59 ;	lib/src/stm8s_beep.c: 57: }
      0084A6 81               [ 4]   60 	ret
                                     61 ;	lib/src/stm8s_beep.c: 67: void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
                                     62 ;	-----------------------------------------
                                     63 ;	 function BEEP_Init
                                     64 ;	-----------------------------------------
      0084A7                         65 _BEEP_Init:
      0084A7 88               [ 1]   66 	push	a
      0084A8 6B 01            [ 1]   67 	ld	(0x01, sp), a
                                     68 ;	lib/src/stm8s_beep.c: 73: if ((BEEP->CSR & BEEP_CSR_BEEPDIV) == BEEP_CSR_BEEPDIV)
      0084AA C6 50 F3         [ 1]   69 	ld	a, 0x50f3
      0084AD 43               [ 1]   70 	cpl	a
      0084AE A5 1F            [ 1]   71 	bcp	a, #0x1f
      0084B0 26 10            [ 1]   72 	jrne	00102$
                                     73 ;	lib/src/stm8s_beep.c: 75: BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
      0084B2 C6 50 F3         [ 1]   74 	ld	a, 0x50f3
      0084B5 A4 E0            [ 1]   75 	and	a, #0xe0
      0084B7 C7 50 F3         [ 1]   76 	ld	0x50f3, a
                                     77 ;	lib/src/stm8s_beep.c: 76: BEEP->CSR |= BEEP_CALIBRATION_DEFAULT;
      0084BA C6 50 F3         [ 1]   78 	ld	a, 0x50f3
      0084BD AA 0B            [ 1]   79 	or	a, #0x0b
      0084BF C7 50 F3         [ 1]   80 	ld	0x50f3, a
      0084C2                         81 00102$:
                                     82 ;	lib/src/stm8s_beep.c: 80: BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPSEL);
      0084C2 C6 50 F3         [ 1]   83 	ld	a, 0x50f3
      0084C5 A4 3F            [ 1]   84 	and	a, #0x3f
      0084C7 C7 50 F3         [ 1]   85 	ld	0x50f3, a
                                     86 ;	lib/src/stm8s_beep.c: 81: BEEP->CSR |= (uint8_t)(BEEP_Frequency);
      0084CA C6 50 F3         [ 1]   87 	ld	a, 0x50f3
      0084CD 1A 01            [ 1]   88 	or	a, (0x01, sp)
      0084CF C7 50 F3         [ 1]   89 	ld	0x50f3, a
                                     90 ;	lib/src/stm8s_beep.c: 82: }
      0084D2 84               [ 1]   91 	pop	a
      0084D3 81               [ 4]   92 	ret
                                     93 ;	lib/src/stm8s_beep.c: 91: void BEEP_Cmd(FunctionalState NewState)
                                     94 ;	-----------------------------------------
                                     95 ;	 function BEEP_Cmd
                                     96 ;	-----------------------------------------
      0084D4                         97 _BEEP_Cmd:
      0084D4 88               [ 1]   98 	push	a
      0084D5 6B 01            [ 1]   99 	ld	(0x01, sp), a
                                    100 ;	lib/src/stm8s_beep.c: 96: BEEP->CSR |= BEEP_CSR_BEEPEN;
      0084D7 C6 50 F3         [ 1]  101 	ld	a, 0x50f3
                                    102 ;	lib/src/stm8s_beep.c: 93: if (NewState != DISABLE)
      0084DA 0D 01            [ 1]  103 	tnz	(0x01, sp)
      0084DC 27 07            [ 1]  104 	jreq	00102$
                                    105 ;	lib/src/stm8s_beep.c: 96: BEEP->CSR |= BEEP_CSR_BEEPEN;
      0084DE AA 20            [ 1]  106 	or	a, #0x20
      0084E0 C7 50 F3         [ 1]  107 	ld	0x50f3, a
      0084E3 20 05            [ 2]  108 	jra	00104$
      0084E5                        109 00102$:
                                    110 ;	lib/src/stm8s_beep.c: 101: BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPEN);
      0084E5 A4 DF            [ 1]  111 	and	a, #0xdf
      0084E7 C7 50 F3         [ 1]  112 	ld	0x50f3, a
      0084EA                        113 00104$:
                                    114 ;	lib/src/stm8s_beep.c: 103: }
      0084EA 84               [ 1]  115 	pop	a
      0084EB 81               [ 4]  116 	ret
                                    117 ;	lib/src/stm8s_beep.c: 118: void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
                                    118 ;	-----------------------------------------
                                    119 ;	 function BEEP_LSICalibrationConfig
                                    120 ;	-----------------------------------------
      0084EC                        121 _BEEP_LSICalibrationConfig:
      0084EC 52 09            [ 2]  122 	sub	sp, #9
                                    123 ;	lib/src/stm8s_beep.c: 126: lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
      0084EE 4B E8            [ 1]  124 	push	#0xe8
      0084F0 4B 03            [ 1]  125 	push	#0x03
      0084F2 5F               [ 1]  126 	clrw	x
      0084F3 89               [ 2]  127 	pushw	x
      0084F4 1E 12            [ 2]  128 	ldw	x, (0x12, sp)
      0084F6 89               [ 2]  129 	pushw	x
      0084F7 1E 12            [ 2]  130 	ldw	x, (0x12, sp)
      0084F9 89               [ 2]  131 	pushw	x
      0084FA CD 85 65         [ 4]  132 	call	__divulong
      0084FD 5B 08            [ 2]  133 	addw	sp, #8
      0084FF 1F 01            [ 2]  134 	ldw	(0x01, sp), x
                                    135 ;	lib/src/stm8s_beep.c: 130: BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
      008501 C6 50 F3         [ 1]  136 	ld	a, 0x50f3
      008504 A4 E0            [ 1]  137 	and	a, #0xe0
      008506 C7 50 F3         [ 1]  138 	ld	0x50f3, a
                                    139 ;	lib/src/stm8s_beep.c: 132: A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
      008509 1E 01            [ 2]  140 	ldw	x, (0x01, sp)
      00850B 54               [ 2]  141 	srlw	x
      00850C 54               [ 2]  142 	srlw	x
      00850D 54               [ 2]  143 	srlw	x
                                    144 ;	lib/src/stm8s_beep.c: 134: if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
      00850E 1F 03            [ 2]  145 	ldw	(0x03, sp), x
      008510 1F 08            [ 2]  146 	ldw	(0x08, sp), x
      008512 58               [ 2]  147 	sllw	x
      008513 58               [ 2]  148 	sllw	x
      008514 58               [ 2]  149 	sllw	x
      008515 1F 05            [ 2]  150 	ldw	(0x05, sp), x
      008517 16 01            [ 2]  151 	ldw	y, (0x01, sp)
      008519 72 F2 05         [ 2]  152 	subw	y, (0x05, sp)
      00851C 1E 08            [ 2]  153 	ldw	x, (0x08, sp)
      00851E 58               [ 2]  154 	sllw	x
      00851F 5C               [ 1]  155 	incw	x
      008520 89               [ 2]  156 	pushw	x
      008521 93               [ 1]  157 	ldw	x, y
                                    158 ;	lib/src/stm8s_beep.c: 130: BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
      008522 CD 85 48         [ 4]  159 	call	__mulint
      008525 1F 07            [ 2]  160 	ldw	(0x07, sp), x
      008527 C6 50 F3         [ 1]  161 	ld	a, 0x50f3
      00852A 6B 09            [ 1]  162 	ld	(0x09, sp), a
                                    163 ;	lib/src/stm8s_beep.c: 136: BEEP->CSR |= (uint8_t)(A - 2U);
      00852C 7B 04            [ 1]  164 	ld	a, (0x04, sp)
                                    165 ;	lib/src/stm8s_beep.c: 134: if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
      00852E 1E 05            [ 2]  166 	ldw	x, (0x05, sp)
      008530 13 07            [ 2]  167 	cpw	x, (0x07, sp)
      008532 25 09            [ 1]  168 	jrc	00102$
                                    169 ;	lib/src/stm8s_beep.c: 136: BEEP->CSR |= (uint8_t)(A - 2U);
      008534 A0 02            [ 1]  170 	sub	a, #0x02
      008536 1A 09            [ 1]  171 	or	a, (0x09, sp)
      008538 C7 50 F3         [ 1]  172 	ld	0x50f3, a
      00853B 20 06            [ 2]  173 	jra	00104$
      00853D                        174 00102$:
                                    175 ;	lib/src/stm8s_beep.c: 140: BEEP->CSR |= (uint8_t)(A - 1U);
      00853D 4A               [ 1]  176 	dec	a
      00853E 1A 09            [ 1]  177 	or	a, (0x09, sp)
      008540 C7 50 F3         [ 1]  178 	ld	0x50f3, a
      008543                        179 00104$:
                                    180 ;	lib/src/stm8s_beep.c: 142: }
      008543 1E 0A            [ 2]  181 	ldw	x, (10, sp)
      008545 5B 0F            [ 2]  182 	addw	sp, #15
      008547 FC               [ 2]  183 	jp	(x)
                                    184 	.area CODE
                                    185 	.area CONST
                                    186 	.area INITIALIZER
                                    187 	.area CABS (ABS)
