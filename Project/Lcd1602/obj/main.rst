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
                                     12 	.globl _lcd_puts
                                     13 	.globl _lcd_init
                                     14 	.globl _CLK_HSIPrescalerConfig
                                     15 	.globl _i
                                     16 ;--------------------------------------------------------
                                     17 ; ram data
                                     18 ;--------------------------------------------------------
                                     19 	.area DATA
                                     20 ;--------------------------------------------------------
                                     21 ; ram data
                                     22 ;--------------------------------------------------------
                                     23 	.area INITIALIZED
      000001                         24 _i::
      000001                         25 	.ds 2
                                     26 ;--------------------------------------------------------
                                     27 ; Stack segment in internal ram
                                     28 ;--------------------------------------------------------
                                     29 	.area SSEG
      000003                         30 __start__stack:
      000003                         31 	.ds	1
                                     32 
                                     33 ;--------------------------------------------------------
                                     34 ; absolute external ram data
                                     35 ;--------------------------------------------------------
                                     36 	.area DABS (ABS)
                                     37 
                                     38 ; default segment ordering for linker
                                     39 	.area HOME
                                     40 	.area GSINIT
                                     41 	.area GSFINAL
                                     42 	.area CONST
                                     43 	.area INITIALIZER
                                     44 	.area CODE
                                     45 
                                     46 ;--------------------------------------------------------
                                     47 ; interrupt vector
                                     48 ;--------------------------------------------------------
                                     49 	.area HOME
      008000                         50 __interrupt_vect:
      008000 82 00 80 07             51 	int s_GSINIT ; reset
                                     52 ;--------------------------------------------------------
                                     53 ; global & static initialisations
                                     54 ;--------------------------------------------------------
                                     55 	.area HOME
                                     56 	.area GSINIT
                                     57 	.area GSFINAL
                                     58 	.area GSINIT
      008007 CD 87 9B         [ 4]   59 	call	___sdcc_external_startup
      00800A 4D               [ 1]   60 	tnz	a
      00800B 27 03            [ 1]   61 	jreq	__sdcc_init_data
      00800D CC 80 04         [ 2]   62 	jp	__sdcc_program_startup
      008010                         63 __sdcc_init_data:
                                     64 ; stm8_genXINIT() start
      008010 AE 00 00         [ 2]   65 	ldw x, #l_DATA
      008013 27 07            [ 1]   66 	jreq	00002$
      008015                         67 00001$:
      008015 72 4F 00 00      [ 1]   68 	clr (s_DATA - 1, x)
      008019 5A               [ 2]   69 	decw x
      00801A 26 F9            [ 1]   70 	jrne	00001$
      00801C                         71 00002$:
      00801C AE 00 02         [ 2]   72 	ldw	x, #l_INITIALIZER
      00801F 27 09            [ 1]   73 	jreq	00004$
      008021                         74 00003$:
      008021 D6 80 3E         [ 1]   75 	ld	a, (s_INITIALIZER - 1, x)
      008024 D7 00 00         [ 1]   76 	ld	(s_INITIALIZED - 1, x), a
      008027 5A               [ 2]   77 	decw	x
      008028 26 F7            [ 1]   78 	jrne	00003$
      00802A                         79 00004$:
                                     80 ; stm8_genXINIT() end
                                     81 	.area GSFINAL
      00802A CC 80 04         [ 2]   82 	jp	__sdcc_program_startup
                                     83 ;--------------------------------------------------------
                                     84 ; Home
                                     85 ;--------------------------------------------------------
                                     86 	.area HOME
                                     87 	.area HOME
      008004                         88 __sdcc_program_startup:
      008004 CC 80 41         [ 2]   89 	jp	_main
                                     90 ;	return from main will return to caller
                                     91 ;--------------------------------------------------------
                                     92 ; code
                                     93 ;--------------------------------------------------------
                                     94 	.area CODE
                                     95 ;	main.c: 4: void main (void)
                                     96 ;	-----------------------------------------
                                     97 ;	 function main
                                     98 ;	-----------------------------------------
      008041                         99 _main:
                                    100 ;	main.c: 6: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
      008041 4F               [ 1]  101 	clr	a
      008042 CD 84 10         [ 4]  102 	call	_CLK_HSIPrescalerConfig
                                    103 ;	main.c: 7: lcd_init();
      008045 CD 85 EE         [ 4]  104 	call	_lcd_init
                                    105 ;	main.c: 8: while(1) 
      008048                        106 00102$:
                                    107 ;	main.c: 10: lcd_puts(0,0,"chung");
      008048 4B 2D            [ 1]  108 	push	#<(___str_0+0)
      00804A 4B 80            [ 1]  109 	push	#((___str_0+0) >> 8)
      00804C 4B 00            [ 1]  110 	push	#0x00
      00804E 4F               [ 1]  111 	clr	a
      00804F CD 87 60         [ 4]  112 	call	_lcd_puts
      008052 20 F4            [ 2]  113 	jra	00102$
                                    114 ;	main.c: 12: }
      008054 81               [ 4]  115 	ret
                                    116 	.area CODE
                                    117 	.area CONST
                                    118 	.area CONST
      00802D                        119 ___str_0:
      00802D 63 68 75 6E 67         120 	.ascii "chung"
      008032 00                     121 	.db 0x00
                                    122 	.area CODE
                                    123 	.area INITIALIZER
      00803F                        124 __xinit__i:
      00803F 00 00                  125 	.dw #0x0000
                                    126 	.area CABS (ABS)
