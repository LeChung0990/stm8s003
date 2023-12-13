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
                                     12 	.globl _UART1_String
                                     13 	.globl _UART1_number
                                     14 	.globl _UART1_Setup
                                     15 	.globl _delay_ms
                                     16 	.globl _delay_msSetup
                                     17 	.globl _CLK_HSIPrescalerConfig
                                     18 	.globl _adc_value
                                     19 	.globl _volt
                                     20 	.globl _datareceive
                                     21 ;--------------------------------------------------------
                                     22 ; ram data
                                     23 ;--------------------------------------------------------
                                     24 	.area DATA
                                     25 ;--------------------------------------------------------
                                     26 ; ram data
                                     27 ;--------------------------------------------------------
                                     28 	.area INITIALIZED
      000001                         29 _datareceive::
      000001                         30 	.ds 1
      000002                         31 _volt::
      000002                         32 	.ds 4
      000006                         33 _adc_value::
      000006                         34 	.ds 2
                                     35 ;--------------------------------------------------------
                                     36 ; Stack segment in internal ram
                                     37 ;--------------------------------------------------------
                                     38 	.area SSEG
      000009                         39 __start__stack:
      000009                         40 	.ds	1
                                     41 
                                     42 ;--------------------------------------------------------
                                     43 ; absolute external ram data
                                     44 ;--------------------------------------------------------
                                     45 	.area DABS (ABS)
                                     46 
                                     47 ; default segment ordering for linker
                                     48 	.area HOME
                                     49 	.area GSINIT
                                     50 	.area GSFINAL
                                     51 	.area CONST
                                     52 	.area INITIALIZER
                                     53 	.area CODE
                                     54 
                                     55 ;--------------------------------------------------------
                                     56 ; interrupt vector
                                     57 ;--------------------------------------------------------
                                     58 	.area HOME
      008000                         59 __interrupt_vect:
      008000 82 00 80 07             60 	int s_GSINIT ; reset
                                     61 ;--------------------------------------------------------
                                     62 ; global & static initialisations
                                     63 ;--------------------------------------------------------
                                     64 	.area HOME
                                     65 	.area GSINIT
                                     66 	.area GSFINAL
                                     67 	.area GSINIT
      008007 CD 8F D7         [ 4]   68 	call	___sdcc_external_startup
      00800A 4D               [ 1]   69 	tnz	a
      00800B 27 03            [ 1]   70 	jreq	__sdcc_init_data
      00800D CC 80 04         [ 2]   71 	jp	__sdcc_program_startup
      008010                         72 __sdcc_init_data:
                                     73 ; stm8_genXINIT() start
      008010 AE 00 00         [ 2]   74 	ldw x, #l_DATA
      008013 27 07            [ 1]   75 	jreq	00002$
      008015                         76 00001$:
      008015 72 4F 00 00      [ 1]   77 	clr (s_DATA - 1, x)
      008019 5A               [ 2]   78 	decw x
      00801A 26 F9            [ 1]   79 	jrne	00001$
      00801C                         80 00002$:
      00801C AE 00 08         [ 2]   81 	ldw	x, #l_INITIALIZER
      00801F 27 09            [ 1]   82 	jreq	00004$
      008021                         83 00003$:
      008021 D6 80 3E         [ 1]   84 	ld	a, (s_INITIALIZER - 1, x)
      008024 D7 00 00         [ 1]   85 	ld	(s_INITIALIZED - 1, x), a
      008027 5A               [ 2]   86 	decw	x
      008028 26 F7            [ 1]   87 	jrne	00003$
      00802A                         88 00004$:
                                     89 ; stm8_genXINIT() end
                                     90 	.area GSFINAL
      00802A CC 80 04         [ 2]   91 	jp	__sdcc_program_startup
                                     92 ;--------------------------------------------------------
                                     93 ; Home
                                     94 ;--------------------------------------------------------
                                     95 	.area HOME
                                     96 	.area HOME
      008004                         97 __sdcc_program_startup:
      008004 CC 80 47         [ 2]   98 	jp	_main
                                     99 ;	return from main will return to caller
                                    100 ;--------------------------------------------------------
                                    101 ; code
                                    102 ;--------------------------------------------------------
                                    103 	.area CODE
                                    104 ;	main.c: 6: void main(void)
                                    105 ;	-----------------------------------------
                                    106 ;	 function main
                                    107 ;	-----------------------------------------
      008047                        108 _main:
                                    109 ;	main.c: 9: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
      008047 4F               [ 1]  110 	clr	a
      008048 CD 84 21         [ 4]  111 	call	_CLK_HSIPrescalerConfig
                                    112 ;	main.c: 14: delay_msSetup();
      00804B CD 8E AC         [ 4]  113 	call	_delay_msSetup
                                    114 ;	main.c: 16: UART1_Setup();
      00804E CD 8E DB         [ 4]  115 	call	_UART1_Setup
                                    116 ;	main.c: 26: while(1) 
      008051                        117 00102$:
                                    118 ;	main.c: 37: UART1_String("chung");
      008051 AE 80 2D         [ 2]  119 	ldw	x, #(___str_0+0)
      008054 CD 8F 66         [ 4]  120 	call	_UART1_String
                                    121 ;	main.c: 39: UART1_number(987);
      008057 AE 03 DB         [ 2]  122 	ldw	x, #0x03db
      00805A CD 8E F6         [ 4]  123 	call	_UART1_number
                                    124 ;	main.c: 40: delay_ms(1000);
      00805D AE 03 E8         [ 2]  125 	ldw	x, #0x03e8
      008060 CD 8E B8         [ 4]  126 	call	_delay_ms
      008063 20 EC            [ 2]  127 	jra	00102$
                                    128 ;	main.c: 66: }
      008065 81               [ 4]  129 	ret
                                    130 	.area CODE
                                    131 	.area CONST
                                    132 	.area CONST
      00802D                        133 ___str_0:
      00802D 63 68 75 6E 67         134 	.ascii "chung"
      008032 00                     135 	.db 0x00
                                    136 	.area CODE
                                    137 	.area INITIALIZER
      00803F                        138 __xinit__datareceive:
      00803F 00                     139 	.db #0x00	; 0
      008040                        140 __xinit__volt:
      008040 00 00 00 00            141 	.byte #0x00, #0x00, #0x00, #0x00	;  0.000000e+00
      008044                        142 __xinit__adc_value:
      008044 00 00                  143 	.dw #0x0000
                                    144 	.area CABS (ABS)
