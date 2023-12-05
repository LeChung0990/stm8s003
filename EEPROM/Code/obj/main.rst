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
                                     11 	.globl _main
                                     12 	.globl _Read_EEPROM
                                     13 	.globl _Write_EEPROM
                                     14 	.globl _TIM4_ClearFlag
                                     15 	.globl _TIM4_GetFlagStatus
                                     16 	.globl _TIM4_SetCounter
                                     17 	.globl _TIM4_Cmd
                                     18 	.globl _TIM4_TimeBaseInit
                                     19 	.globl _GPIO_WriteLow
                                     20 	.globl _GPIO_WriteHigh
                                     21 	.globl _GPIO_Init
                                     22 	.globl _GPIO_DeInit
                                     23 	.globl _FLASH_ReadByte
                                     24 	.globl _FLASH_ProgramByte
                                     25 	.globl _FLASH_Lock
                                     26 	.globl _FLASH_Unlock
                                     27 	.globl _CLK_HSIPrescalerConfig
                                     28 	.globl _delay_ms
                                     29 ;--------------------------------------------------------
                                     30 ; ram data
                                     31 ;--------------------------------------------------------
                                     32 	.area DATA
                                     33 ;--------------------------------------------------------
                                     34 ; ram data
                                     35 ;--------------------------------------------------------
                                     36 	.area INITIALIZED
                                     37 ;--------------------------------------------------------
                                     38 ; Stack segment in internal ram
                                     39 ;--------------------------------------------------------
                                     40 	.area SSEG
      000001                         41 __start__stack:
      000001                         42 	.ds	1
                                     43 
                                     44 ;--------------------------------------------------------
                                     45 ; absolute external ram data
                                     46 ;--------------------------------------------------------
                                     47 	.area DABS (ABS)
                                     48 
                                     49 ; default segment ordering for linker
                                     50 	.area HOME
                                     51 	.area GSINIT
                                     52 	.area GSFINAL
                                     53 	.area CONST
                                     54 	.area INITIALIZER
                                     55 	.area CODE
                                     56 
                                     57 ;--------------------------------------------------------
                                     58 ; interrupt vector
                                     59 ;--------------------------------------------------------
                                     60 	.area HOME
      008000                         61 __interrupt_vect:
      008000 82 00 80 07             62 	int s_GSINIT ; reset
                                     63 ;--------------------------------------------------------
                                     64 ; global & static initialisations
                                     65 ;--------------------------------------------------------
                                     66 	.area HOME
                                     67 	.area GSINIT
                                     68 	.area GSFINAL
                                     69 	.area GSINIT
      008007 CD 88 95         [ 4]   70 	call	___sdcc_external_startup
      00800A 4D               [ 1]   71 	tnz	a
      00800B 27 03            [ 1]   72 	jreq	__sdcc_init_data
      00800D CC 80 04         [ 2]   73 	jp	__sdcc_program_startup
      008010                         74 __sdcc_init_data:
                                     75 ; stm8_genXINIT() start
      008010 AE 00 00         [ 2]   76 	ldw x, #l_DATA
      008013 27 07            [ 1]   77 	jreq	00002$
      008015                         78 00001$:
      008015 72 4F 00 00      [ 1]   79 	clr (s_DATA - 1, x)
      008019 5A               [ 2]   80 	decw x
      00801A 26 F9            [ 1]   81 	jrne	00001$
      00801C                         82 00002$:
      00801C AE 00 00         [ 2]   83 	ldw	x, #l_INITIALIZER
      00801F 27 09            [ 1]   84 	jreq	00004$
      008021                         85 00003$:
      008021 D6 80 38         [ 1]   86 	ld	a, (s_INITIALIZER - 1, x)
      008024 D7 00 00         [ 1]   87 	ld	(s_INITIALIZED - 1, x), a
      008027 5A               [ 2]   88 	decw	x
      008028 26 F7            [ 1]   89 	jrne	00003$
      00802A                         90 00004$:
                                     91 ; stm8_genXINIT() end
                                     92 	.area GSFINAL
      00802A CC 80 04         [ 2]   93 	jp	__sdcc_program_startup
                                     94 ;--------------------------------------------------------
                                     95 ; Home
                                     96 ;--------------------------------------------------------
                                     97 	.area HOME
                                     98 	.area HOME
      008004                         99 __sdcc_program_startup:
      008004 CC 80 5B         [ 2]  100 	jp	_main
                                    101 ;	return from main will return to caller
                                    102 ;--------------------------------------------------------
                                    103 ; code
                                    104 ;--------------------------------------------------------
                                    105 	.area CODE
                                    106 ;	main.c: 5: void Write_EEPROM(uint8_t Data){
                                    107 ;	-----------------------------------------
                                    108 ;	 function Write_EEPROM
                                    109 ;	-----------------------------------------
      008039                        110 _Write_EEPROM:
                                    111 ;	main.c: 6: FLASH_Unlock(FLASH_MEMTYPE_DATA);
      008039 88               [ 1]  112 	push	a
      00803A A6 F7            [ 1]  113 	ld	a, #0xf7
      00803C CD 86 2A         [ 4]  114 	call	_FLASH_Unlock
      00803F 4B 00            [ 1]  115 	push	#0x00
      008041 4B 40            [ 1]  116 	push	#0x40
      008043 5F               [ 1]  117 	clrw	x
      008044 89               [ 2]  118 	pushw	x
      008045 CD 86 85         [ 4]  119 	call	_FLASH_ProgramByte
                                    120 ;	main.c: 8: FLASH_Lock(FLASH_MEMTYPE_DATA);
      008048 A6 F7            [ 1]  121 	ld	a, #0xf7
                                    122 ;	main.c: 9: }
      00804A CC 86 40         [ 2]  123 	jp	_FLASH_Lock
                                    124 ;	main.c: 10: uint8_t Read_EEPROM(uint32_t Address){
                                    125 ;	-----------------------------------------
                                    126 ;	 function Read_EEPROM
                                    127 ;	-----------------------------------------
      00804D                        128 _Read_EEPROM:
                                    129 ;	main.c: 12: Data = FLASH_ReadByte(Address);
      00804D 1E 05            [ 2]  130 	ldw	x, (0x05, sp)
      00804F 89               [ 2]  131 	pushw	x
      008050 1E 05            [ 2]  132 	ldw	x, (0x05, sp)
      008052 89               [ 2]  133 	pushw	x
      008053 CD 86 8F         [ 4]  134 	call	_FLASH_ReadByte
                                    135 ;	main.c: 13: return Data;
                                    136 ;	main.c: 14: }
      008056 1E 01            [ 2]  137 	ldw	x, (1, sp)
      008058 5B 06            [ 2]  138 	addw	sp, #6
      00805A FC               [ 2]  139 	jp	(x)
                                    140 ;	main.c: 16: void main(void)
                                    141 ;	-----------------------------------------
                                    142 ;	 function main
                                    143 ;	-----------------------------------------
      00805B                        144 _main:
                                    145 ;	main.c: 19: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
      00805B 4F               [ 1]  146 	clr	a
      00805C CD 84 7F         [ 4]  147 	call	_CLK_HSIPrescalerConfig
                                    148 ;	main.c: 20: GPIO_DeInit(GPIOD); 	/*CLEAR REGISTER GPIO OR RESET VALUE*/
      00805F AE 50 0F         [ 2]  149 	ldw	x, #0x500f
      008062 CD 80 C4         [ 4]  150 	call	_GPIO_DeInit
                                    151 ;	main.c: 21: GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);
      008065 4B E0            [ 1]  152 	push	#0xe0
      008067 A6 08            [ 1]  153 	ld	a, #0x08
      008069 AE 50 0F         [ 2]  154 	ldw	x, #0x500f
      00806C CD 80 D2         [ 4]  155 	call	_GPIO_Init
                                    156 ;	main.c: 22: TIM4_TimeBaseInit(TIM4_PRESCALER_128, 63 - 1);
      00806F 4B 3E            [ 1]  157 	push	#0x3e
      008071 A6 07            [ 1]  158 	ld	a, #0x07
      008073 CD 81 AF         [ 4]  159 	call	_TIM4_TimeBaseInit
                                    160 ;	main.c: 23: TIM4_Cmd(ENABLE);
      008076 A6 01            [ 1]  161 	ld	a, #0x01
      008078 CD 81 BB         [ 4]  162 	call	_TIM4_Cmd
                                    163 ;	main.c: 25: Write_EEPROM(0x82);
      00807B A6 82            [ 1]  164 	ld	a, #0x82
      00807D CD 80 39         [ 4]  165 	call	_Write_EEPROM
                                    166 ;	main.c: 26: while(1) {
      008080                        167 00105$:
                                    168 ;	main.c: 27: if(Read_EEPROM(0x407F) == 255) GPIO_WriteHigh(GPIOD, GPIO_PIN_3);	/*Nhap nhay LED tai chan PD3*/
      008080 4B 7F            [ 1]  169 	push	#0x7f
      008082 4B 40            [ 1]  170 	push	#0x40
      008084 5F               [ 1]  171 	clrw	x
      008085 89               [ 2]  172 	pushw	x
      008086 CD 80 4D         [ 4]  173 	call	_Read_EEPROM
      008089 4C               [ 1]  174 	inc	a
      00808A 26 0A            [ 1]  175 	jrne	00102$
      00808C A6 08            [ 1]  176 	ld	a, #0x08
      00808E AE 50 0F         [ 2]  177 	ldw	x, #0x500f
      008091 CD 81 4C         [ 4]  178 	call	_GPIO_WriteHigh
      008094 20 EA            [ 2]  179 	jra	00105$
      008096                        180 00102$:
                                    181 ;	main.c: 28: else GPIO_WriteLow(GPIOD, GPIO_PIN_3);
      008096 A6 08            [ 1]  182 	ld	a, #0x08
      008098 AE 50 0F         [ 2]  183 	ldw	x, #0x500f
      00809B CD 81 55         [ 4]  184 	call	_GPIO_WriteLow
      00809E 20 E0            [ 2]  185 	jra	00105$
                                    186 ;	main.c: 30: }
      0080A0 81               [ 4]  187 	ret
                                    188 ;	main.c: 32: void delay_ms(uint16_t u16Delay)	//Ham delay dung timer4
                                    189 ;	-----------------------------------------
                                    190 ;	 function delay_ms
                                    191 ;	-----------------------------------------
      0080A1                        192 _delay_ms:
      0080A1 52 02            [ 2]  193 	sub	sp, #2
                                    194 ;	main.c: 35: while (u16Delay) {
      0080A3 1F 01            [ 2]  195 	ldw	(0x01, sp), x
      0080A5                        196 00104$:
      0080A5 1E 01            [ 2]  197 	ldw	x, (0x01, sp)
      0080A7 27 18            [ 1]  198 	jreq	00107$
                                    199 ;	main.c: 36: TIM4_SetCounter(0);
      0080A9 4F               [ 1]  200 	clr	a
      0080AA CD 82 60         [ 4]  201 	call	_TIM4_SetCounter
                                    202 ;	main.c: 37: TIM4_ClearFlag(TIM4_FLAG_UPDATE);
      0080AD A6 01            [ 1]  203 	ld	a, #0x01
      0080AF CD 82 80         [ 4]  204 	call	_TIM4_ClearFlag
                                    205 ;	main.c: 38: while (TIM4_GetFlagStatus(TIM4_FLAG_UPDATE) == RESET) {
      0080B2                        206 00101$:
      0080B2 A6 01            [ 1]  207 	ld	a, #0x01
      0080B4 CD 82 70         [ 4]  208 	call	_TIM4_GetFlagStatus
      0080B7 4D               [ 1]  209 	tnz	a
      0080B8 27 F8            [ 1]  210 	jreq	00101$
                                    211 ;	main.c: 40: --u16Delay;
      0080BA 1E 01            [ 2]  212 	ldw	x, (0x01, sp)
      0080BC 5A               [ 2]  213 	decw	x
      0080BD 1F 01            [ 2]  214 	ldw	(0x01, sp), x
      0080BF 20 E4            [ 2]  215 	jra	00104$
      0080C1                        216 00107$:
                                    217 ;	main.c: 42: }
      0080C1 5B 02            [ 2]  218 	addw	sp, #2
      0080C3 81               [ 4]  219 	ret
                                    220 	.area CODE
                                    221 	.area CONST
                                    222 	.area INITIALIZER
                                    223 	.area CABS (ABS)
