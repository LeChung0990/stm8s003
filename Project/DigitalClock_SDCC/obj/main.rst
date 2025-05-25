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
                                     11 	.globl _mangAL
                                     12 	.globl _TIM4_UPD_OVF_IRQHandler
                                     13 	.globl _ADC1_IRQHandler
                                     14 	.globl _EXTI_PORTA_IRQHandler
                                     15 	.globl _main
                                     16 	.globl _EXTI_SetTLISensitivity
                                     17 	.globl _EXTI_SetExtIntSensitivity
                                     18 	.globl _EXTI_DeInit
                                     19 	.globl _clock_icon_ds
                                     20 	.globl _station_chanel
                                     21 	.globl _print_rssi
                                     22 	.globl _print_levelBAT
                                     23 	.globl _SD1106_CUS_PRINT
                                     24 	.globl _SD1106_printBigLine
                                     25 	.globl _SD1106_printBigPoint
                                     26 	.globl _SD1106_printBigNum
                                     27 	.globl _SD1106_printNum
                                     28 	.globl _SD1106_print_one_num
                                     29 	.globl _SD1106_printP
                                     30 	.globl _SD1106_resetDis
                                     31 	.globl _SD1106_setContranst
                                     32 	.globl _SD1106_clear
                                     33 	.globl _SD1106_sendInitCom
                                     34 	.globl _SD1106_sendCom
                                     35 	.globl _writeDay
                                     36 	.globl _writeTime
                                     37 	.globl _data_read
                                     38 	.globl _i2c_write
                                     39 	.globl _i2c_stop
                                     40 	.globl _i2c_start
                                     41 	.globl _i2c_init
                                     42 	.globl _BEEP_Cmd
                                     43 	.globl _BEEP_config
                                     44 	.globl _delay_ms
                                     45 	.globl _configADC
                                     46 	.globl _Tim4_config
                                     47 	.globl _GPIO_ReadInputPin
                                     48 	.globl _GPIO_WriteReverse
                                     49 	.globl _GPIO_WriteLow
                                     50 	.globl _GPIO_Init
                                     51 	.globl _GPIO_DeInit
                                     52 	.globl _lcdstate
                                     53 	.globl _cnt_refesh
                                     54 	.globl _monthAL
                                     55 	.globl _dateAL
                                     56 	.globl _month
                                     57 	.globl _date
                                     58 	.globl _templ
                                     59 	.globl _temph
                                     60 	.globl _mode
                                     61 	.globl _cnt_minute
                                     62 	.globl _cnt_autoOff
                                     63 	.globl _cnt_second
                                     64 	.globl _powerradio
                                     65 	.globl _counter
                                     66 	.globl _voltBat
                                     67 	.globl _adc_value
                                     68 	.globl _FreFM
                                     69 	.globl _u8Radio
                                     70 	.globl _u8Time
                                     71 	.globl _Clock_setup
                                     72 	.globl _GPIO_setup
                                     73 	.globl _Exti_Config
                                     74 	.globl _readTime
                                     75 	.globl _setchannel
                                     76 ;--------------------------------------------------------
                                     77 ; ram data
                                     78 ;--------------------------------------------------------
                                     79 	.area DATA
                                     80 ;--------------------------------------------------------
                                     81 ; ram data
                                     82 ;--------------------------------------------------------
                                     83 	.area INITIALIZED
      000001                         84 _u8Time::
      000001                         85 	.ds 6
      000007                         86 _u8Radio::
      000007                         87 	.ds 4
      00000B                         88 _FreFM::
      00000B                         89 	.ds 2
      00000D                         90 _adc_value::
      00000D                         91 	.ds 2
      00000F                         92 _voltBat::
      00000F                         93 	.ds 2
      000011                         94 _counter::
      000011                         95 	.ds 2
      000013                         96 _powerradio::
      000013                         97 	.ds 1
      000014                         98 _cnt_second::
      000014                         99 	.ds 1
      000015                        100 _cnt_autoOff::
      000015                        101 	.ds 1
      000016                        102 _cnt_minute::
      000016                        103 	.ds 1
      000017                        104 _mode::
      000017                        105 	.ds 1
      000018                        106 _temph::
      000018                        107 	.ds 2
      00001A                        108 _templ::
      00001A                        109 	.ds 1
      00001B                        110 _date::
      00001B                        111 	.ds 1
      00001C                        112 _month::
      00001C                        113 	.ds 1
      00001D                        114 _dateAL::
      00001D                        115 	.ds 1
      00001E                        116 _monthAL::
      00001E                        117 	.ds 1
      00001F                        118 _cnt_refesh::
      00001F                        119 	.ds 1
      000020                        120 _lcdstate::
      000020                        121 	.ds 1
                                    122 ;--------------------------------------------------------
                                    123 ; Stack segment in internal ram
                                    124 ;--------------------------------------------------------
                                    125 	.area SSEG
      000021                        126 __start__stack:
      000021                        127 	.ds	1
                                    128 
                                    129 ;--------------------------------------------------------
                                    130 ; absolute external ram data
                                    131 ;--------------------------------------------------------
                                    132 	.area DABS (ABS)
                                    133 
                                    134 ; default segment ordering for linker
                                    135 	.area HOME
                                    136 	.area GSINIT
                                    137 	.area GSFINAL
                                    138 	.area CONST
                                    139 	.area INITIALIZER
                                    140 	.area CODE
                                    141 
                                    142 ;--------------------------------------------------------
                                    143 ; interrupt vector
                                    144 ;--------------------------------------------------------
                                    145 	.area HOME
      008000                        146 __interrupt_vect:
      008000 82 00 80 6B            147 	int s_GSINIT ; reset
      008004 82 00 00 00            148 	int 0x000000 ; trap
      008008 82 00 00 00            149 	int 0x000000 ; int0
      00800C 82 00 00 00            150 	int 0x000000 ; int1
      008010 82 00 00 00            151 	int 0x000000 ; int2
      008014 82 00 8F C0            152 	int _EXTI_PORTA_IRQHandler ; int3
      008018 82 00 00 00            153 	int 0x000000 ; int4
      00801C 82 00 00 00            154 	int 0x000000 ; int5
      008020 82 00 00 00            155 	int 0x000000 ; int6
      008024 82 00 00 00            156 	int 0x000000 ; int7
      008028 82 00 00 00            157 	int 0x000000 ; int8
      00802C 82 00 00 00            158 	int 0x000000 ; int9
      008030 82 00 00 00            159 	int 0x000000 ; int10
      008034 82 00 00 00            160 	int 0x000000 ; int11
      008038 82 00 00 00            161 	int 0x000000 ; int12
      00803C 82 00 00 00            162 	int 0x000000 ; int13
      008040 82 00 00 00            163 	int 0x000000 ; int14
      008044 82 00 00 00            164 	int 0x000000 ; int15
      008048 82 00 00 00            165 	int 0x000000 ; int16
      00804C 82 00 00 00            166 	int 0x000000 ; int17
      008050 82 00 00 00            167 	int 0x000000 ; int18
      008054 82 00 00 00            168 	int 0x000000 ; int19
      008058 82 00 00 00            169 	int 0x000000 ; int20
      00805C 82 00 00 00            170 	int 0x000000 ; int21
      008060 82 00 90 33            171 	int _ADC1_IRQHandler ; int22
      008064 82 00 90 5D            172 	int _TIM4_UPD_OVF_IRQHandler ; int23
                                    173 ;--------------------------------------------------------
                                    174 ; global & static initialisations
                                    175 ;--------------------------------------------------------
                                    176 	.area HOME
                                    177 	.area GSINIT
                                    178 	.area GSFINAL
                                    179 	.area GSINIT
      00806B CD 9B CD         [ 4]  180 	call	___sdcc_external_startup
      00806E 4D               [ 1]  181 	tnz	a
      00806F 27 03            [ 1]  182 	jreq	__sdcc_init_data
      008071 CC 80 68         [ 2]  183 	jp	__sdcc_program_startup
      008074                        184 __sdcc_init_data:
                                    185 ; stm8_genXINIT() start
      008074 AE 00 00         [ 2]  186 	ldw x, #l_DATA
      008077 27 07            [ 1]  187 	jreq	00002$
      008079                        188 00001$:
      008079 72 4F 00 00      [ 1]  189 	clr (s_DATA - 1, x)
      00807D 5A               [ 2]  190 	decw x
      00807E 26 F9            [ 1]  191 	jrne	00001$
      008080                        192 00002$:
      008080 AE 00 20         [ 2]  193 	ldw	x, #l_INITIALIZER
      008083 27 09            [ 1]  194 	jreq	00004$
      008085                        195 00003$:
      008085 D6 88 94         [ 1]  196 	ld	a, (s_INITIALIZER - 1, x)
      008088 D7 00 00         [ 1]  197 	ld	(s_INITIALIZED - 1, x), a
      00808B 5A               [ 2]  198 	decw	x
      00808C 26 F7            [ 1]  199 	jrne	00003$
      00808E                        200 00004$:
                                    201 ; stm8_genXINIT() end
                                    202 	.area GSFINAL
      00808E CC 80 68         [ 2]  203 	jp	__sdcc_program_startup
                                    204 ;--------------------------------------------------------
                                    205 ; Home
                                    206 ;--------------------------------------------------------
                                    207 	.area HOME
                                    208 	.area HOME
      008068                        209 __sdcc_program_startup:
      008068 CC 88 B5         [ 2]  210 	jp	_main
                                    211 ;	return from main will return to caller
                                    212 ;--------------------------------------------------------
                                    213 ; code
                                    214 ;--------------------------------------------------------
                                    215 	.area CODE
                                    216 ;	main.c: 72: void main()
                                    217 ;	-----------------------------------------
                                    218 ;	 function main
                                    219 ;	-----------------------------------------
      0088B5                        220 _main:
      0088B5 52 06            [ 2]  221 	sub	sp, #6
                                    222 ;	main.c: 74: Clock_setup();
      0088B7 CD 8E 93         [ 4]  223 	call	_Clock_setup
                                    224 ;	main.c: 75: GPIO_setup();
      0088BA CD 8E D6         [ 4]  225 	call	_GPIO_setup
                                    226 ;	main.c: 76: Tim4_config();
      0088BD CD 90 A9         [ 4]  227 	call	_Tim4_config
                                    228 ;	main.c: 77: Exti_Config();
      0088C0 CD 8F 34         [ 4]  229 	call	_Exti_Config
                                    230 ;	main.c: 78: configADC();
      0088C3 CD 90 C3         [ 4]  231 	call	_configADC
                                    232 ;	main.c: 79: BEEP_config();
      0088C6 CD 91 53         [ 4]  233 	call	_BEEP_config
                                    234 ;	main.c: 80: i2c_init();
      0088C9 CD 91 98         [ 4]  235 	call	_i2c_init
                                    236 ;	main.c: 82: delay_ms(100);  //Wait LCD OLED init
      0088CC AE 00 64         [ 2]  237 	ldw	x, #0x0064
      0088CF CD 91 3E         [ 4]  238 	call	_delay_ms
                                    239 ;	main.c: 83: SD1106_sendInitCom();
      0088D2 CD 94 31         [ 4]  240 	call	_SD1106_sendInitCom
                                    241 ;	main.c: 84: SD1106_resetDis();
      0088D5 CD 96 D8         [ 4]  242 	call	_SD1106_resetDis
                                    243 ;	main.c: 85: SD1106_setContranst(200);
      0088D8 A6 C8            [ 1]  244 	ld	a, #0xc8
      0088DA CD 96 CE         [ 4]  245 	call	_SD1106_setContranst
                                    246 ;	main.c: 86: SD1106_clear();
      0088DD CD 94 B6         [ 4]  247 	call	_SD1106_clear
                                    248 ;	main.c: 87: lcdstate = SET;
      0088E0 35 01 00 20      [ 1]  249 	mov	_lcdstate+0, #0x01
                                    250 ;	main.c: 88: delay_ms(1);
      0088E4 5F               [ 1]  251 	clrw	x
      0088E5 5C               [ 1]  252 	incw	x
      0088E6 CD 91 3E         [ 4]  253 	call	_delay_ms
                                    254 ;	main.c: 101: SD1106_CUS_PRINT();
      0088E9 CD 95 02         [ 4]  255 	call	_SD1106_CUS_PRINT
                                    256 ;	main.c: 103: while (1)
      0088EC                        257 00174$:
                                    258 ;	main.c: 105: if(!cnt_refesh){
      0088EC C6 00 1F         [ 1]  259 	ld	a, _cnt_refesh+0
      0088EF 26 07            [ 1]  260 	jrne	00102$
                                    261 ;	main.c: 106: SD1106_clear();
      0088F1 CD 94 B6         [ 4]  262 	call	_SD1106_clear
                                    263 ;	main.c: 107: cnt_refesh++;
      0088F4 72 5C 00 1F      [ 1]  264 	inc	_cnt_refesh+0
      0088F8                        265 00102$:
                                    266 ;	main.c: 110: if( (cnt_autoOff >= 30) & lcdstate ){
      0088F8 C6 00 15         [ 1]  267 	ld	a, _cnt_autoOff+0
      0088FB A1 1E            [ 1]  268 	cp	a, #0x1e
      0088FD 4F               [ 1]  269 	clr	a
      0088FE 49               [ 1]  270 	rlc	a
      0088FF A8 01            [ 1]  271 	xor	a, #0x01
      008901 C4 00 20         [ 1]  272 	and	a, _lcdstate+0
      008904 27 1C            [ 1]  273 	jreq	00107$
                                    274 ;	main.c: 111: SD1106_sendCom(0xAE);   //OLED Off
      008906 A6 AE            [ 1]  275 	ld	a, #0xae
      008908 CD 94 16         [ 4]  276 	call	_SD1106_sendCom
                                    277 ;	main.c: 112: lcdstate = 0;
      00890B 72 5F 00 20      [ 1]  278 	clr	_lcdstate+0
                                    279 ;	main.c: 113: cnt_minute = 0;
      00890F 72 5F 00 16      [ 1]  280 	clr	_cnt_minute+0
                                    281 ;	main.c: 114: cnt_second = 0; 
      008913 72 5F 00 14      [ 1]  282 	clr	_cnt_second+0
                                    283 ;	main.c: 115: cnt_autoOff = 0;
      008917 72 5F 00 15      [ 1]  284 	clr	_cnt_autoOff+0
                                    285 ;	main.c: 116: if(powerradio){
      00891B 72 5D 00 13      [ 1]  286 	tnz	_powerradio+0
      00891F 26 01            [ 1]  287 	jrne	00107$
                                    288 ;	main.c: 118: halt();
      008921 8E               [10]  289 	halt
      008922                        290 00107$:
                                    291 ;	main.c: 123: if(dateAL == 1 | dateAL == 15){
      008922 C6 00 1D         [ 1]  292 	ld	a, _dateAL+0
      008925 4A               [ 1]  293 	dec	a
      008926 26 05            [ 1]  294 	jrne	00374$
      008928 A6 01            [ 1]  295 	ld	a, #0x01
      00892A 6B 06            [ 1]  296 	ld	(0x06, sp), a
      00892C C5                     297 	.byte 0xc5
      00892D                        298 00374$:
      00892D 0F 06            [ 1]  299 	clr	(0x06, sp)
      00892F                        300 00375$:
      00892F C6 00 1D         [ 1]  301 	ld	a, _dateAL+0
      008932 A0 0F            [ 1]  302 	sub	a, #0x0f
      008934 26 02            [ 1]  303 	jrne	00377$
      008936 4C               [ 1]  304 	inc	a
      008937 21                     305 	.byte 0x21
      008938                        306 00377$:
      008938 4F               [ 1]  307 	clr	a
      008939                        308 00378$:
      008939 1A 06            [ 1]  309 	or	a, (0x06, sp)
      00893B 27 09            [ 1]  310 	jreq	00109$
                                    311 ;	main.c: 124: SD1106_printP("AL:1|15",0,2);
      00893D 4B 02            [ 1]  312 	push	#0x02
      00893F 4F               [ 1]  313 	clr	a
      008940 AE 80 A5         [ 2]  314 	ldw	x, #(___str_0+0)
      008943 CD 96 F9         [ 4]  315 	call	_SD1106_printP
      008946                        316 00109$:
                                    317 ;	main.c: 127: if(adc_value != temph){
      008946 CE 00 18         [ 2]  318 	ldw	x, _temph+0
      008949 C3 00 0D         [ 2]  319 	cpw	x, _adc_value+0
      00894C 27 51            [ 1]  320 	jreq	00111$
                                    321 ;	main.c: 132: voltBat = 5325 / temph;
      00894E AE 14 CD         [ 2]  322 	ldw	x, #0x14cd
      008951 90 CE 00 18      [ 2]  323 	ldw	y, _temph+0
      008955 65               [ 2]  324 	divw	x, y
      008956 CF 00 0F         [ 2]  325 	ldw	_voltBat+0, x
                                    326 ;	main.c: 134: print_levelBAT(voltBat);
      008959 C6 00 10         [ 1]  327 	ld	a, _voltBat+1
      00895C CD 95 D8         [ 4]  328 	call	_print_levelBAT
                                    329 ;	main.c: 135: SD1106_print_one_num( (uint8_t)voltBat/10,0,100);
      00895F C6 00 10         [ 1]  330 	ld	a, _voltBat+1
      008962 5F               [ 1]  331 	clrw	x
      008963 4B 0A            [ 1]  332 	push	#0x0a
      008965 4B 00            [ 1]  333 	push	#0x00
      008967 97               [ 1]  334 	ld	xl, a
      008968 CD 9B E7         [ 4]  335 	call	__divsint
      00896B 9F               [ 1]  336 	ld	a, xl
      00896C 4B 64            [ 1]  337 	push	#0x64
      00896E 4B 00            [ 1]  338 	push	#0x00
      008970 CD 97 6D         [ 4]  339 	call	_SD1106_print_one_num
                                    340 ;	main.c: 136: SD1106_printP(".",    0,  106);
      008973 4B 6A            [ 1]  341 	push	#0x6a
      008975 4F               [ 1]  342 	clr	a
      008976 AE 80 AD         [ 2]  343 	ldw	x, #(___str_1+0)
      008979 CD 96 F9         [ 4]  344 	call	_SD1106_printP
                                    345 ;	main.c: 137: SD1106_print_one_num( (uint8_t)voltBat%10, 0, 112);
      00897C C6 00 10         [ 1]  346 	ld	a, _voltBat+1
      00897F 5F               [ 1]  347 	clrw	x
      008980 4B 0A            [ 1]  348 	push	#0x0a
      008982 4B 00            [ 1]  349 	push	#0x00
      008984 97               [ 1]  350 	ld	xl, a
      008985 CD 9B CF         [ 4]  351 	call	__modsint
      008988 9F               [ 1]  352 	ld	a, xl
      008989 4B 70            [ 1]  353 	push	#0x70
      00898B 4B 00            [ 1]  354 	push	#0x00
      00898D CD 97 6D         [ 4]  355 	call	_SD1106_print_one_num
                                    356 ;	main.c: 138: SD1106_printP("V", 0, 118);
      008990 4B 76            [ 1]  357 	push	#0x76
      008992 4F               [ 1]  358 	clr	a
      008993 AE 80 AF         [ 2]  359 	ldw	x, #(___str_2+0)
      008996 CD 96 F9         [ 4]  360 	call	_SD1106_printP
                                    361 ;	main.c: 140: adc_value = temph;
      008999 CE 00 18         [ 2]  362 	ldw	x, _temph+0
      00899C CF 00 0D         [ 2]  363 	ldw	_adc_value+0, x
      00899F                        364 00111$:
                                    365 ;	main.c: 143: if (GPIO_ReadInputPin(right_port, right_pin) == RESET){
      00899F A6 40            [ 1]  366 	ld	a, #0x40
      0089A1 AE 50 0A         [ 2]  367 	ldw	x, #0x500a
      0089A4 CD 9A B1         [ 4]  368 	call	_GPIO_ReadInputPin
      0089A7 4D               [ 1]  369 	tnz	a
      0089A8 26 1C            [ 1]  370 	jrne	00118$
                                    371 ;	main.c: 144: delay_ms(20);
      0089AA AE 00 14         [ 2]  372 	ldw	x, #0x0014
      0089AD CD 91 3E         [ 4]  373 	call	_delay_ms
                                    374 ;	main.c: 145: if(powerradio){
      0089B0 C6 00 13         [ 1]  375 	ld	a, _powerradio+0
      0089B3 27 11            [ 1]  376 	jreq	00118$
                                    377 ;	main.c: 146: while (GPIO_ReadInputPin(right_port, right_pin) == RESET);
      0089B5                        378 00112$:
      0089B5 A6 40            [ 1]  379 	ld	a, #0x40
      0089B7 AE 50 0A         [ 2]  380 	ldw	x, #0x500a
      0089BA CD 9A B1         [ 4]  381 	call	_GPIO_ReadInputPin
      0089BD 4D               [ 1]  382 	tnz	a
      0089BE 27 F5            [ 1]  383 	jreq	00112$
                                    384 ;	main.c: 147: setchannel(1000);   //Tan so 100.0 MHZ
      0089C0 AE 03 E8         [ 2]  385 	ldw	x, #0x03e8
      0089C3 CD 8F 89         [ 4]  386 	call	_setchannel
      0089C6                        387 00118$:
                                    388 ;	main.c: 152: if (GPIO_ReadInputPin(left_port, left_pin) == RESET){
      0089C6 A6 20            [ 1]  389 	ld	a, #0x20
      0089C8 AE 50 0A         [ 2]  390 	ldw	x, #0x500a
      0089CB CD 9A B1         [ 4]  391 	call	_GPIO_ReadInputPin
      0089CE 6B 06            [ 1]  392 	ld	(0x06, sp), a
      0089D0 27 03            [ 1]  393 	jreq	00386$
      0089D2 CC 8B 89         [ 2]  394 	jp	00138$
      0089D5                        395 00386$:
                                    396 ;	main.c: 153: delay_ms(20);
      0089D5 AE 00 14         [ 2]  397 	ldw	x, #0x0014
      0089D8 CD 91 3E         [ 4]  398 	call	_delay_ms
                                    399 ;	main.c: 154: if(powerradio){
      0089DB C6 00 13         [ 1]  400 	ld	a, _powerradio+0
      0089DE 27 18            [ 1]  401 	jreq	00135$
                                    402 ;	main.c: 156: i2c_start();
      0089E0 CD 91 A1         [ 4]  403 	call	_i2c_start
                                    404 ;	main.c: 157: i2c_write(ADDR_5807M);
      0089E3 A6 20            [ 1]  405 	ld	a, #0x20
      0089E5 CD 91 FE         [ 4]  406 	call	_i2c_write
                                    407 ;	main.c: 158: i2c_write(0xC3);
      0089E8 A6 C3            [ 1]  408 	ld	a, #0xc3
      0089EA CD 91 FE         [ 4]  409 	call	_i2c_write
                                    410 ;	main.c: 159: i2c_write(0x01);
      0089ED A6 01            [ 1]  411 	ld	a, #0x01
      0089EF CD 91 FE         [ 4]  412 	call	_i2c_write
                                    413 ;	main.c: 160: i2c_stop();
      0089F2 CD 91 D6         [ 4]  414 	call	_i2c_stop
      0089F5 CC 8B 89         [ 2]  415 	jp	00138$
      0089F8                        416 00135$:
                                    417 ;	main.c: 163: delay_ms(500);
      0089F8 AE 01 F4         [ 2]  418 	ldw	x, #0x01f4
      0089FB CD 91 3E         [ 4]  419 	call	_delay_ms
                                    420 ;	main.c: 164: SD1106_clear();
      0089FE CD 94 B6         [ 4]  421 	call	_SD1106_clear
                                    422 ;	main.c: 165: while (GPIO_ReadInputPin(left_port, left_pin) == RESET){
      008A01                        423 00131$:
      008A01 A6 20            [ 1]  424 	ld	a, #0x20
      008A03 AE 50 0A         [ 2]  425 	ldw	x, #0x500a
      008A06 CD 9A B1         [ 4]  426 	call	_GPIO_ReadInputPin
      008A09 6B 06            [ 1]  427 	ld	(0x06, sp), a
      008A0B 27 03            [ 1]  428 	jreq	00388$
      008A0D CC 8B 86         [ 2]  429 	jp	00133$
      008A10                        430 00388$:
                                    431 ;	main.c: 166: SD1106_printP("+DATE+",   1,  70);
      008A10 4B 46            [ 1]  432 	push	#0x46
      008A12 A6 01            [ 1]  433 	ld	a, #0x01
      008A14 AE 80 B1         [ 2]  434 	ldw	x, #(___str_3+0)
      008A17 CD 96 F9         [ 4]  435 	call	_SD1106_printP
                                    436 ;	main.c: 167: readTime();
      008A1A CD 8F 43         [ 4]  437 	call	_readTime
                                    438 ;	main.c: 168: uint8_t flag = ( (mangAL[(u8Time[5] - 8)*4] - u8Time[4] >= 1) ? 0 : 1);
      008A1D C6 00 06         [ 1]  439 	ld	a, _u8Time+5
      008A20 A0 08            [ 1]  440 	sub	a, #0x08
      008A22 6B 03            [ 1]  441 	ld	(0x03, sp), a
      008A24 97               [ 1]  442 	ld	xl, a
      008A25 49               [ 1]  443 	rlc	a
      008A26 4F               [ 1]  444 	clr	a
      008A27 A2 00            [ 1]  445 	sbc	a, #0x00
      008A29 95               [ 1]  446 	ld	xh, a
      008A2A 58               [ 2]  447 	sllw	x
      008A2B 58               [ 2]  448 	sllw	x
      008A2C D6 80 91         [ 1]  449 	ld	a, (_mangAL+0, x)
      008A2F 6B 04            [ 1]  450 	ld	(0x04, sp), a
      008A31 5F               [ 1]  451 	clrw	x
      008A32 7B 04            [ 1]  452 	ld	a, (0x04, sp)
      008A34 97               [ 1]  453 	ld	xl, a
      008A35 C6 00 05         [ 1]  454 	ld	a, _u8Time+4
      008A38 6B 05            [ 1]  455 	ld	(0x05, sp), a
      008A3A 6B 02            [ 1]  456 	ld	(0x02, sp), a
      008A3C 0F 01            [ 1]  457 	clr	(0x01, sp)
      008A3E 72 F0 01         [ 2]  458 	subw	x, (0x01, sp)
      008A41 A3 00 01         [ 2]  459 	cpw	x, #0x0001
      008A44 2F 02            [ 1]  460 	jrslt	00178$
      008A46 4F               [ 1]  461 	clr	a
      008A47 C5                     462 	.byte 0xc5
      008A48                        463 00178$:
      008A48 A6 01            [ 1]  464 	ld	a, #0x01
      008A4A                        465 00179$:
                                    466 ;	main.c: 169: if(flag){
      008A4A 6B 06            [ 1]  467 	ld	(0x06, sp), a
      008A4C 27 1F            [ 1]  468 	jreq	00120$
                                    469 ;	main.c: 170: dateAL = u8Time[4] - mangAL[(u8Time[5] - 8)*4] + 1;
      008A4E 7B 05            [ 1]  470 	ld	a, (0x05, sp)
      008A50 10 04            [ 1]  471 	sub	a, (0x04, sp)
      008A52 4C               [ 1]  472 	inc	a
      008A53 C7 00 1D         [ 1]  473 	ld	_dateAL+0, a
                                    474 ;	main.c: 171: monthAL = mangAL[(u8Time[5] - 8)*4 + 3];
      008A56 C6 00 06         [ 1]  475 	ld	a, _u8Time+5
      008A59 A0 08            [ 1]  476 	sub	a, #0x08
      008A5B 48               [ 1]  477 	sll	a
      008A5C 48               [ 1]  478 	sll	a
      008A5D AB 03            [ 1]  479 	add	a, #0x03
      008A5F 97               [ 1]  480 	ld	xl, a
      008A60 49               [ 1]  481 	rlc	a
      008A61 4F               [ 1]  482 	clr	a
      008A62 A2 00            [ 1]  483 	sbc	a, #0x00
      008A64 95               [ 1]  484 	ld	xh, a
      008A65 D6 80 91         [ 1]  485 	ld	a, (_mangAL+0, x)
      008A68 C7 00 1E         [ 1]  486 	ld	_monthAL+0, a
      008A6B 20 29            [ 2]  487 	jra	00121$
      008A6D                        488 00120$:
                                    489 ;	main.c: 174: dateAL = u8Time[4] + mangAL[(u8Time[5] - 8)*4 + 2] - 1;
      008A6D 7B 03            [ 1]  490 	ld	a, (0x03, sp)
      008A6F 48               [ 1]  491 	sll	a
      008A70 48               [ 1]  492 	sll	a
      008A71 AB 02            [ 1]  493 	add	a, #0x02
      008A73 97               [ 1]  494 	ld	xl, a
      008A74 49               [ 1]  495 	rlc	a
      008A75 4F               [ 1]  496 	clr	a
      008A76 A2 00            [ 1]  497 	sbc	a, #0x00
      008A78 95               [ 1]  498 	ld	xh, a
      008A79 D6 80 91         [ 1]  499 	ld	a, (_mangAL+0, x)
      008A7C 1B 05            [ 1]  500 	add	a, (0x05, sp)
      008A7E 4A               [ 1]  501 	dec	a
      008A7F C7 00 1D         [ 1]  502 	ld	_dateAL+0, a
                                    503 ;	main.c: 175: monthAL = mangAL[(u8Time[5] - 8)*4 + 1];
      008A82 C6 00 06         [ 1]  504 	ld	a, _u8Time+5
      008A85 A0 08            [ 1]  505 	sub	a, #0x08
      008A87 48               [ 1]  506 	sll	a
      008A88 48               [ 1]  507 	sll	a
      008A89 4C               [ 1]  508 	inc	a
      008A8A 97               [ 1]  509 	ld	xl, a
      008A8B 49               [ 1]  510 	rlc	a
      008A8C 4F               [ 1]  511 	clr	a
      008A8D A2 00            [ 1]  512 	sbc	a, #0x00
      008A8F 95               [ 1]  513 	ld	xh, a
      008A90 D6 80 91         [ 1]  514 	ld	a, (_mangAL+0, x)
      008A93 C7 00 1E         [ 1]  515 	ld	_monthAL+0, a
      008A96                        516 00121$:
                                    517 ;	main.c: 177: SD1106_printBigNum(u8Time[4]/10, 25);
      008A96 C6 00 05         [ 1]  518 	ld	a, _u8Time+4
      008A99 5F               [ 1]  519 	clrw	x
      008A9A 97               [ 1]  520 	ld	xl, a
      008A9B 4B 0A            [ 1]  521 	push	#0x0a
      008A9D 4B 00            [ 1]  522 	push	#0x00
      008A9F CD 9B E7         [ 4]  523 	call	__divsint
      008AA2 9F               [ 1]  524 	ld	a, xl
      008AA3 4B 19            [ 1]  525 	push	#0x19
      008AA5 CD 98 91         [ 4]  526 	call	_SD1106_printBigNum
                                    527 ;	main.c: 178: SD1106_printBigNum(u8Time[4]%10, 42);
      008AA8 C6 00 05         [ 1]  528 	ld	a, _u8Time+4
      008AAB 5F               [ 1]  529 	clrw	x
      008AAC 97               [ 1]  530 	ld	xl, a
      008AAD 4B 0A            [ 1]  531 	push	#0x0a
      008AAF 4B 00            [ 1]  532 	push	#0x00
      008AB1 CD 9B CF         [ 4]  533 	call	__modsint
      008AB4 9F               [ 1]  534 	ld	a, xl
      008AB5 4B 2A            [ 1]  535 	push	#0x2a
      008AB7 CD 98 91         [ 4]  536 	call	_SD1106_printBigNum
                                    537 ;	main.c: 179: SD1106_printBigLine(59);
      008ABA A6 3B            [ 1]  538 	ld	a, #0x3b
      008ABC CD 99 A2         [ 4]  539 	call	_SD1106_printBigLine
                                    540 ;	main.c: 180: SD1106_printBigNum(u8Time[5]/10, 66);
      008ABF C6 00 06         [ 1]  541 	ld	a, _u8Time+5
      008AC2 5F               [ 1]  542 	clrw	x
      008AC3 97               [ 1]  543 	ld	xl, a
      008AC4 4B 0A            [ 1]  544 	push	#0x0a
      008AC6 4B 00            [ 1]  545 	push	#0x00
      008AC8 CD 9B E7         [ 4]  546 	call	__divsint
      008ACB 9F               [ 1]  547 	ld	a, xl
      008ACC 4B 42            [ 1]  548 	push	#0x42
      008ACE CD 98 91         [ 4]  549 	call	_SD1106_printBigNum
                                    550 ;	main.c: 181: SD1106_printBigNum(u8Time[5]%10, 83);
      008AD1 C6 00 06         [ 1]  551 	ld	a, _u8Time+5
      008AD4 5F               [ 1]  552 	clrw	x
      008AD5 97               [ 1]  553 	ld	xl, a
      008AD6 4B 0A            [ 1]  554 	push	#0x0a
      008AD8 4B 00            [ 1]  555 	push	#0x00
      008ADA CD 9B CF         [ 4]  556 	call	__modsint
      008ADD 9F               [ 1]  557 	ld	a, xl
      008ADE 4B 53            [ 1]  558 	push	#0x53
      008AE0 CD 98 91         [ 4]  559 	call	_SD1106_printBigNum
                                    560 ;	main.c: 183: SD1106_printP("AL:",0,2);
      008AE3 4B 02            [ 1]  561 	push	#0x02
      008AE5 4F               [ 1]  562 	clr	a
      008AE6 AE 80 B8         [ 2]  563 	ldw	x, #(___str_4+0)
      008AE9 CD 96 F9         [ 4]  564 	call	_SD1106_printP
                                    565 ;	main.c: 184: SD1106_printNum(dateAL,0,20);
      008AEC 5F               [ 1]  566 	clrw	x
      008AED C6 00 1D         [ 1]  567 	ld	a, _dateAL+0
      008AF0 97               [ 1]  568 	ld	xl, a
      008AF1 4B 14            [ 1]  569 	push	#0x14
      008AF3 4F               [ 1]  570 	clr	a
      008AF4 CD 97 CF         [ 4]  571 	call	_SD1106_printNum
                                    572 ;	main.c: 185: SD1106_printP("-",0,32);
      008AF7 4B 20            [ 1]  573 	push	#0x20
      008AF9 4F               [ 1]  574 	clr	a
      008AFA AE 80 BC         [ 2]  575 	ldw	x, #(___str_5+0)
      008AFD CD 96 F9         [ 4]  576 	call	_SD1106_printP
                                    577 ;	main.c: 186: SD1106_printNum( monthAL, 0, 38);
      008B00 5F               [ 1]  578 	clrw	x
      008B01 C6 00 1E         [ 1]  579 	ld	a, _monthAL+0
      008B04 97               [ 1]  580 	ld	xl, a
      008B05 4B 26            [ 1]  581 	push	#0x26
      008B07 4F               [ 1]  582 	clr	a
      008B08 CD 97 CF         [ 4]  583 	call	_SD1106_printNum
                                    584 ;	main.c: 187: delay_ms(100);
      008B0B AE 00 64         [ 2]  585 	ldw	x, #0x0064
      008B0E CD 91 3E         [ 4]  586 	call	_delay_ms
                                    587 ;	main.c: 188: if(GPIO_ReadInputPin(right_port, right_pin) == RESET){
      008B11 A6 40            [ 1]  588 	ld	a, #0x40
      008B13 AE 50 0A         [ 2]  589 	ldw	x, #0x500a
      008B16 CD 9A B1         [ 4]  590 	call	_GPIO_ReadInputPin
      008B19 4D               [ 1]  591 	tnz	a
      008B1A 27 03            [ 1]  592 	jreq	00391$
      008B1C CC 8A 01         [ 2]  593 	jp	00131$
      008B1F                        594 00391$:
                                    595 ;	main.c: 189: delay_ms(400);
      008B1F AE 01 90         [ 2]  596 	ldw	x, #0x0190
      008B22 CD 91 3E         [ 4]  597 	call	_delay_ms
                                    598 ;	main.c: 190: while(GPIO_ReadInputPin(right_port, right_pin) == RESET){
      008B25                        599 00124$:
      008B25 A6 40            [ 1]  600 	ld	a, #0x40
      008B27 AE 50 0A         [ 2]  601 	ldw	x, #0x500a
      008B2A CD 9A B1         [ 4]  602 	call	_GPIO_ReadInputPin
      008B2D 4D               [ 1]  603 	tnz	a
      008B2E 26 3B            [ 1]  604 	jrne	00126$
                                    605 ;	main.c: 191: delay_ms(400);
      008B30 AE 01 90         [ 2]  606 	ldw	x, #0x0190
      008B33 CD 91 3E         [ 4]  607 	call	_delay_ms
                                    608 ;	main.c: 192: month++;
      008B36 72 5C 00 1C      [ 1]  609 	inc	_month+0
                                    610 ;	main.c: 193: if(month > 12) month = 0;
      008B3A C6 00 1C         [ 1]  611 	ld	a, _month+0
      008B3D A1 0C            [ 1]  612 	cp	a, #0x0c
      008B3F 23 04            [ 2]  613 	jrule	00123$
      008B41 72 5F 00 1C      [ 1]  614 	clr	_month+0
      008B45                        615 00123$:
                                    616 ;	main.c: 194: SD1106_printBigNum(month/10, 66);
      008B45 5F               [ 1]  617 	clrw	x
      008B46 C6 00 1C         [ 1]  618 	ld	a, _month+0
      008B49 97               [ 1]  619 	ld	xl, a
      008B4A 4B 0A            [ 1]  620 	push	#0x0a
      008B4C 4B 00            [ 1]  621 	push	#0x00
      008B4E CD 9B E7         [ 4]  622 	call	__divsint
      008B51 9F               [ 1]  623 	ld	a, xl
      008B52 4B 42            [ 1]  624 	push	#0x42
      008B54 CD 98 91         [ 4]  625 	call	_SD1106_printBigNum
                                    626 ;	main.c: 195: SD1106_printBigNum(month%10, 83);
      008B57 C6 00 1C         [ 1]  627 	ld	a, _month+0
      008B5A 5F               [ 1]  628 	clrw	x
      008B5B 4B 0A            [ 1]  629 	push	#0x0a
      008B5D 4B 00            [ 1]  630 	push	#0x00
      008B5F 97               [ 1]  631 	ld	xl, a
      008B60 CD 9B CF         [ 4]  632 	call	__modsint
      008B63 9F               [ 1]  633 	ld	a, xl
      008B64 4B 53            [ 1]  634 	push	#0x53
      008B66 CD 98 91         [ 4]  635 	call	_SD1106_printBigNum
      008B69 20 BA            [ 2]  636 	jra	00124$
      008B6B                        637 00126$:
                                    638 ;	main.c: 197: date++;
      008B6B 72 5C 00 1B      [ 1]  639 	inc	_date+0
                                    640 ;	main.c: 198: if(date > 31) date = 0;
      008B6F C6 00 1B         [ 1]  641 	ld	a, _date+0
      008B72 A1 1F            [ 1]  642 	cp	a, #0x1f
      008B74 23 04            [ 2]  643 	jrule	00128$
      008B76 72 5F 00 1B      [ 1]  644 	clr	_date+0
      008B7A                        645 00128$:
                                    646 ;	main.c: 199: writeDay(date, month);
      008B7A 3B 00 1C         [ 1]  647 	push	_month+0
      008B7D C6 00 1B         [ 1]  648 	ld	a, _date+0
      008B80 CD 93 D5         [ 4]  649 	call	_writeDay
      008B83 CC 8A 01         [ 2]  650 	jp	00131$
      008B86                        651 00133$:
                                    652 ;	main.c: 203: SD1106_clear();
      008B86 CD 94 B6         [ 4]  653 	call	_SD1106_clear
      008B89                        654 00138$:
                                    655 ;	main.c: 208: readTime();
      008B89 CD 8F 43         [ 4]  656 	call	_readTime
                                    657 ;	main.c: 221: SD1106_printBigNum(u8Time[2]/10, 25);
      008B8C C6 00 03         [ 1]  658 	ld	a, _u8Time+2
      008B8F 5F               [ 1]  659 	clrw	x
      008B90 4B 0A            [ 1]  660 	push	#0x0a
      008B92 4B 00            [ 1]  661 	push	#0x00
      008B94 97               [ 1]  662 	ld	xl, a
      008B95 CD 9B E7         [ 4]  663 	call	__divsint
      008B98 9F               [ 1]  664 	ld	a, xl
      008B99 4B 19            [ 1]  665 	push	#0x19
      008B9B CD 98 91         [ 4]  666 	call	_SD1106_printBigNum
                                    667 ;	main.c: 222: SD1106_printBigNum(u8Time[2]%10, 42);
      008B9E C6 00 03         [ 1]  668 	ld	a, _u8Time+2
      008BA1 5F               [ 1]  669 	clrw	x
      008BA2 4B 0A            [ 1]  670 	push	#0x0a
      008BA4 4B 00            [ 1]  671 	push	#0x00
      008BA6 97               [ 1]  672 	ld	xl, a
      008BA7 CD 9B CF         [ 4]  673 	call	__modsint
      008BAA 9F               [ 1]  674 	ld	a, xl
      008BAB 4B 2A            [ 1]  675 	push	#0x2a
      008BAD CD 98 91         [ 4]  676 	call	_SD1106_printBigNum
                                    677 ;	main.c: 223: SD1106_printBigPoint(59);
      008BB0 A6 3B            [ 1]  678 	ld	a, #0x3b
      008BB2 CD 99 2B         [ 4]  679 	call	_SD1106_printBigPoint
                                    680 ;	main.c: 225: SD1106_printBigNum(u8Time[1]/10, 66);
      008BB5 C6 00 02         [ 1]  681 	ld	a, _u8Time+1
      008BB8 5F               [ 1]  682 	clrw	x
      008BB9 4B 0A            [ 1]  683 	push	#0x0a
      008BBB 4B 00            [ 1]  684 	push	#0x00
      008BBD 97               [ 1]  685 	ld	xl, a
      008BBE CD 9B E7         [ 4]  686 	call	__divsint
      008BC1 9F               [ 1]  687 	ld	a, xl
      008BC2 4B 42            [ 1]  688 	push	#0x42
      008BC4 CD 98 91         [ 4]  689 	call	_SD1106_printBigNum
                                    690 ;	main.c: 226: SD1106_printBigNum(u8Time[1]%10, 83);
      008BC7 C6 00 02         [ 1]  691 	ld	a, _u8Time+1
      008BCA 5F               [ 1]  692 	clrw	x
      008BCB 4B 0A            [ 1]  693 	push	#0x0a
      008BCD 4B 00            [ 1]  694 	push	#0x00
      008BCF 97               [ 1]  695 	ld	xl, a
      008BD0 CD 9B CF         [ 4]  696 	call	__modsint
      008BD3 9F               [ 1]  697 	ld	a, xl
      008BD4 4B 53            [ 1]  698 	push	#0x53
      008BD6 CD 98 91         [ 4]  699 	call	_SD1106_printBigNum
                                    700 ;	main.c: 228: SD1106_print_one_num( (uint8_t)u8Time[0]/10,7,100);
      008BD9 C6 00 01         [ 1]  701 	ld	a, _u8Time+0
      008BDC 5F               [ 1]  702 	clrw	x
      008BDD 4B 0A            [ 1]  703 	push	#0x0a
      008BDF 4B 00            [ 1]  704 	push	#0x00
      008BE1 97               [ 1]  705 	ld	xl, a
      008BE2 CD 9B E7         [ 4]  706 	call	__divsint
      008BE5 9F               [ 1]  707 	ld	a, xl
      008BE6 4B 64            [ 1]  708 	push	#0x64
      008BE8 4B 07            [ 1]  709 	push	#0x07
      008BEA CD 97 6D         [ 4]  710 	call	_SD1106_print_one_num
                                    711 ;	main.c: 229: SD1106_print_one_num( (uint8_t)u8Time[0]%10,7,106);
      008BED C6 00 01         [ 1]  712 	ld	a, _u8Time+0
      008BF0 5F               [ 1]  713 	clrw	x
      008BF1 4B 0A            [ 1]  714 	push	#0x0a
      008BF3 4B 00            [ 1]  715 	push	#0x00
      008BF5 97               [ 1]  716 	ld	xl, a
      008BF6 CD 9B CF         [ 4]  717 	call	__modsint
      008BF9 9F               [ 1]  718 	ld	a, xl
      008BFA 4B 6A            [ 1]  719 	push	#0x6a
      008BFC 4B 07            [ 1]  720 	push	#0x07
      008BFE CD 97 6D         [ 4]  721 	call	_SD1106_print_one_num
                                    722 ;	main.c: 230: delay_ms(100);
      008C01 AE 00 64         [ 2]  723 	ldw	x, #0x0064
      008C04 CD 91 3E         [ 4]  724 	call	_delay_ms
                                    725 ;	main.c: 232: if(GPIO_ReadInputPin(switch_PORT, switch_PIN)){
      008C07 A6 10            [ 1]  726 	ld	a, #0x10
      008C09 AE 50 0A         [ 2]  727 	ldw	x, #0x500a
      008C0C CD 9A B1         [ 4]  728 	call	_GPIO_ReadInputPin
      008C0F 4D               [ 1]  729 	tnz	a
      008C10 27 0B            [ 1]  730 	jreq	00140$
                                    731 ;	main.c: 233: powerradio = 1;
      008C12 35 01 00 13      [ 1]  732 	mov	_powerradio+0, #0x01
                                    733 ;	main.c: 234: delay_ms(1);
      008C16 5F               [ 1]  734 	clrw	x
      008C17 5C               [ 1]  735 	incw	x
      008C18 CD 91 3E         [ 4]  736 	call	_delay_ms
      008C1B 20 0C            [ 2]  737 	jra	00141$
      008C1D                        738 00140$:
                                    739 ;	main.c: 236: powerradio = 0;
      008C1D 72 5F 00 13      [ 1]  740 	clr	_powerradio+0
                                    741 ;	main.c: 237: clock_icon_ds();
      008C21 CD 96 9A         [ 4]  742 	call	_clock_icon_ds
                                    743 ;	main.c: 238: delay_ms(1);
      008C24 5F               [ 1]  744 	clrw	x
      008C25 5C               [ 1]  745 	incw	x
      008C26 CD 91 3E         [ 4]  746 	call	_delay_ms
      008C29                        747 00141$:
                                    748 ;	main.c: 242: if(powerradio == 1){
      008C29 C6 00 13         [ 1]  749 	ld	a, _powerradio+0
      008C2C 4A               [ 1]  750 	dec	a
      008C2D 27 03            [ 1]  751 	jreq	00398$
      008C2F CC 8C CA         [ 2]  752 	jp	00208$
      008C32                        753 00398$:
                                    754 ;	main.c: 243: data_read(ADDR_5807M | 0x22, 0x0A, 4, u8Radio);
      008C32 4B 07            [ 1]  755 	push	#<(_u8Radio+0)
      008C34 4B 00            [ 1]  756 	push	#((_u8Radio+0) >> 8)
      008C36 4B 04            [ 1]  757 	push	#0x04
      008C38 4B 0A            [ 1]  758 	push	#0x0a
      008C3A A6 22            [ 1]  759 	ld	a, #0x22
      008C3C CD 93 3C         [ 4]  760 	call	_data_read
                                    761 ;	main.c: 244: FreFM = (u8Radio[0] & 0x1) << 8;    //bit cao
      008C3F C6 00 07         [ 1]  762 	ld	a, _u8Radio+0
      008C42 5F               [ 1]  763 	clrw	x
      008C43 A4 01            [ 1]  764 	and	a, #0x01
      008C45 97               [ 1]  765 	ld	xl, a
      008C46 4F               [ 1]  766 	clr	a
      008C47 02               [ 1]  767 	rlwa	x
      008C48 CF 00 0B         [ 2]  768 	ldw	_FreFM+0, x
                                    769 ;	main.c: 245: FreFM |= u8Radio[1];                //bit thap
      008C4B C6 00 08         [ 1]  770 	ld	a, _u8Radio+1
      008C4E 5F               [ 1]  771 	clrw	x
      008C4F CA 00 0C         [ 1]  772 	or	a, _FreFM+1
      008C52 02               [ 1]  773 	rlwa	x
      008C53 CA 00 0B         [ 1]  774 	or	a, _FreFM+0
      008C56 95               [ 1]  775 	ld	xh, a
                                    776 ;	main.c: 246: FreFM += 870; //tan so kenh hien tai
      008C57 CF 00 0B         [ 2]  777 	ldw	_FreFM+0, x
      008C5A 1C 03 66         [ 2]  778 	addw	x, #0x0366
      008C5D CF 00 0B         [ 2]  779 	ldw	_FreFM+0, x
                                    780 ;	main.c: 248: print_rssi();
      008C60 CD 96 30         [ 4]  781 	call	_print_rssi
                                    782 ;	main.c: 249: SD1106_printNum(u8Radio[2] >> 2,    0,  20);
      008C63 C6 00 09         [ 1]  783 	ld	a, _u8Radio+2
      008C66 44               [ 1]  784 	srl	a
      008C67 44               [ 1]  785 	srl	a
      008C68 5F               [ 1]  786 	clrw	x
      008C69 97               [ 1]  787 	ld	xl, a
      008C6A 4B 14            [ 1]  788 	push	#0x14
      008C6C 4F               [ 1]  789 	clr	a
      008C6D CD 97 CF         [ 4]  790 	call	_SD1106_printNum
                                    791 ;	main.c: 251: station_chanel();
      008C70 CD 96 65         [ 4]  792 	call	_station_chanel
                                    793 ;	main.c: 252: SD1106_print_one_num(  FreFM/1000,      1,  20); // + 6
      008C73 CE 00 0B         [ 2]  794 	ldw	x, _FreFM+0
      008C76 90 AE 03 E8      [ 2]  795 	ldw	y, #0x03e8
      008C7A 65               [ 2]  796 	divw	x, y
      008C7B 9F               [ 1]  797 	ld	a, xl
      008C7C 4B 14            [ 1]  798 	push	#0x14
      008C7E 4B 01            [ 1]  799 	push	#0x01
      008C80 CD 97 6D         [ 4]  800 	call	_SD1106_print_one_num
                                    801 ;	main.c: 253: SD1106_print_one_num( (FreFM/100)%10,   1,  26);
      008C83 CE 00 0B         [ 2]  802 	ldw	x, _FreFM+0
      008C86 90 AE 00 64      [ 2]  803 	ldw	y, #0x0064
      008C8A 65               [ 2]  804 	divw	x, y
      008C8B 90 AE 00 0A      [ 2]  805 	ldw	y, #0x000a
      008C8F 65               [ 2]  806 	divw	x, y
      008C90 90 9F            [ 1]  807 	ld	a, yl
      008C92 4B 1A            [ 1]  808 	push	#0x1a
      008C94 4B 01            [ 1]  809 	push	#0x01
      008C96 CD 97 6D         [ 4]  810 	call	_SD1106_print_one_num
                                    811 ;	main.c: 254: SD1106_print_one_num( (FreFM/10) % 10,  1,  32);
      008C99 CE 00 0B         [ 2]  812 	ldw	x, _FreFM+0
      008C9C 90 AE 00 0A      [ 2]  813 	ldw	y, #0x000a
      008CA0 65               [ 2]  814 	divw	x, y
      008CA1 90 AE 00 0A      [ 2]  815 	ldw	y, #0x000a
      008CA5 65               [ 2]  816 	divw	x, y
      008CA6 90 9F            [ 1]  817 	ld	a, yl
      008CA8 4B 20            [ 1]  818 	push	#0x20
      008CAA 4B 01            [ 1]  819 	push	#0x01
      008CAC CD 97 6D         [ 4]  820 	call	_SD1106_print_one_num
                                    821 ;	main.c: 255: SD1106_printP(".",    1,  38);
      008CAF 4B 26            [ 1]  822 	push	#0x26
      008CB1 A6 01            [ 1]  823 	ld	a, #0x01
      008CB3 AE 80 AD         [ 2]  824 	ldw	x, #(___str_1+0)
      008CB6 CD 96 F9         [ 4]  825 	call	_SD1106_printP
                                    826 ;	main.c: 256: SD1106_print_one_num( (FreFM/1) %10,    1,  44);
      008CB9 CE 00 0B         [ 2]  827 	ldw	x, _FreFM+0
      008CBC 90 AE 00 0A      [ 2]  828 	ldw	y, #0x000a
      008CC0 65               [ 2]  829 	divw	x, y
      008CC1 90 9F            [ 1]  830 	ld	a, yl
      008CC3 4B 2C            [ 1]  831 	push	#0x2c
      008CC5 4B 01            [ 1]  832 	push	#0x01
      008CC7 CD 97 6D         [ 4]  833 	call	_SD1106_print_one_num
                                    834 ;	main.c: 259: while(mode == 1){
      008CCA                        835 00208$:
      008CCA                        836 00155$:
      008CCA C6 00 17         [ 1]  837 	ld	a, _mode+0
      008CCD 4A               [ 1]  838 	dec	a
      008CCE 27 03            [ 1]  839 	jreq	00401$
      008CD0 CC 8D 9A         [ 2]  840 	jp	00217$
      008CD3                        841 00401$:
                                    842 ;	main.c: 261: if(!cnt_refesh){
      008CD3 C6 00 1F         [ 1]  843 	ld	a, _cnt_refesh+0
      008CD6 26 10            [ 1]  844 	jrne	00145$
                                    845 ;	main.c: 262: SD1106_sendCom(0xAF);   ////OLED On
      008CD8 A6 AF            [ 1]  846 	ld	a, #0xaf
      008CDA CD 94 16         [ 4]  847 	call	_SD1106_sendCom
                                    848 ;	main.c: 263: lcdstate = SET;
      008CDD 35 01 00 20      [ 1]  849 	mov	_lcdstate+0, #0x01
                                    850 ;	main.c: 264: SD1106_clear();
      008CE1 CD 94 B6         [ 4]  851 	call	_SD1106_clear
                                    852 ;	main.c: 265: cnt_refesh++;
      008CE4 72 5C 00 1F      [ 1]  853 	inc	_cnt_refesh+0
      008CE8                        854 00145$:
                                    855 ;	main.c: 267: SD1106_printP("+COUNTER+",   1,  70);
      008CE8 4B 46            [ 1]  856 	push	#0x46
      008CEA A6 01            [ 1]  857 	ld	a, #0x01
      008CEC AE 80 BE         [ 2]  858 	ldw	x, #(___str_6+0)
      008CEF CD 96 F9         [ 4]  859 	call	_SD1106_printP
                                    860 ;	main.c: 268: if(GPIO_ReadInputPin(right_port, right_pin) == RESET){
      008CF2 A6 40            [ 1]  861 	ld	a, #0x40
      008CF4 AE 50 0A         [ 2]  862 	ldw	x, #0x500a
      008CF7 CD 9A B1         [ 4]  863 	call	_GPIO_ReadInputPin
      008CFA 4D               [ 1]  864 	tnz	a
      008CFB 26 15            [ 1]  865 	jrne	00150$
                                    866 ;	main.c: 269: delay_ms(20); //stop/start
      008CFD AE 00 14         [ 2]  867 	ldw	x, #0x0014
      008D00 CD 91 3E         [ 4]  868 	call	_delay_ms
                                    869 ;	main.c: 270: while(GPIO_ReadInputPin(right_port, right_pin) == RESET);
      008D03                        870 00146$:
      008D03 A6 40            [ 1]  871 	ld	a, #0x40
      008D05 AE 50 0A         [ 2]  872 	ldw	x, #0x500a
      008D08 CD 9A B1         [ 4]  873 	call	_GPIO_ReadInputPin
      008D0B 4D               [ 1]  874 	tnz	a
      008D0C 27 F5            [ 1]  875 	jreq	00146$
                                    876 ;	main.c: 271: TIM4->CR1 ^= TIM4_CR1_CEN;
      008D0E 90 10 53 40      [ 1]  877 	bcpl	0x5340, #0
      008D12                        878 00150$:
                                    879 ;	main.c: 273: if(GPIO_ReadInputPin(left_port, left_pin) == RESET){
      008D12 A6 20            [ 1]  880 	ld	a, #0x20
      008D14 AE 50 0A         [ 2]  881 	ldw	x, #0x500a
      008D17 CD 9A B1         [ 4]  882 	call	_GPIO_ReadInputPin
      008D1A 4D               [ 1]  883 	tnz	a
      008D1B 26 27            [ 1]  884 	jrne	00154$
                                    885 ;	main.c: 274: delay_ms(50); //reset
      008D1D AE 00 32         [ 2]  886 	ldw	x, #0x0032
      008D20 CD 91 3E         [ 4]  887 	call	_delay_ms
                                    888 ;	main.c: 275: counter = 0;
      008D23 5F               [ 1]  889 	clrw	x
      008D24 CF 00 11         [ 2]  890 	ldw	_counter+0, x
                                    891 ;	main.c: 276: cnt_second = 0;
      008D27 72 5F 00 14      [ 1]  892 	clr	_cnt_second+0
                                    893 ;	main.c: 277: cnt_minute = 0;
      008D2B 72 5F 00 16      [ 1]  894 	clr	_cnt_minute+0
                                    895 ;	main.c: 278: delay_ms(500);
      008D2F AE 01 F4         [ 2]  896 	ldw	x, #0x01f4
      008D32 CD 91 3E         [ 4]  897 	call	_delay_ms
                                    898 ;	main.c: 279: if(GPIO_ReadInputPin(left_port, left_pin) == RESET){
      008D35 A6 20            [ 1]  899 	ld	a, #0x20
      008D37 AE 50 0A         [ 2]  900 	ldw	x, #0x500a
      008D3A CD 9A B1         [ 4]  901 	call	_GPIO_ReadInputPin
      008D3D 4D               [ 1]  902 	tnz	a
      008D3E 26 04            [ 1]  903 	jrne	00154$
                                    904 ;	main.c: 280: mode = 0;
      008D40 72 5F 00 17      [ 1]  905 	clr	_mode+0
      008D44                        906 00154$:
                                    907 ;	main.c: 284: SD1106_printBigNum(cnt_minute/10, 25);
      008D44 C6 00 16         [ 1]  908 	ld	a, _cnt_minute+0
      008D47 5F               [ 1]  909 	clrw	x
      008D48 4B 0A            [ 1]  910 	push	#0x0a
      008D4A 4B 00            [ 1]  911 	push	#0x00
      008D4C 97               [ 1]  912 	ld	xl, a
      008D4D CD 9B E7         [ 4]  913 	call	__divsint
      008D50 9F               [ 1]  914 	ld	a, xl
      008D51 4B 19            [ 1]  915 	push	#0x19
      008D53 CD 98 91         [ 4]  916 	call	_SD1106_printBigNum
                                    917 ;	main.c: 285: SD1106_printBigNum(cnt_minute%10, 42);
      008D56 C6 00 16         [ 1]  918 	ld	a, _cnt_minute+0
      008D59 5F               [ 1]  919 	clrw	x
      008D5A 4B 0A            [ 1]  920 	push	#0x0a
      008D5C 4B 00            [ 1]  921 	push	#0x00
      008D5E 97               [ 1]  922 	ld	xl, a
      008D5F CD 9B CF         [ 4]  923 	call	__modsint
      008D62 9F               [ 1]  924 	ld	a, xl
      008D63 4B 2A            [ 1]  925 	push	#0x2a
      008D65 CD 98 91         [ 4]  926 	call	_SD1106_printBigNum
                                    927 ;	main.c: 286: SD1106_printBigPoint(59);
      008D68 A6 3B            [ 1]  928 	ld	a, #0x3b
      008D6A CD 99 2B         [ 4]  929 	call	_SD1106_printBigPoint
                                    930 ;	main.c: 287: SD1106_printBigNum(cnt_second/10, 66);
      008D6D C6 00 14         [ 1]  931 	ld	a, _cnt_second+0
      008D70 5F               [ 1]  932 	clrw	x
      008D71 4B 0A            [ 1]  933 	push	#0x0a
      008D73 4B 00            [ 1]  934 	push	#0x00
      008D75 97               [ 1]  935 	ld	xl, a
      008D76 CD 9B E7         [ 4]  936 	call	__divsint
      008D79 9F               [ 1]  937 	ld	a, xl
      008D7A 4B 42            [ 1]  938 	push	#0x42
      008D7C CD 98 91         [ 4]  939 	call	_SD1106_printBigNum
                                    940 ;	main.c: 288: SD1106_printBigNum(cnt_second%10, 83);
      008D7F C6 00 14         [ 1]  941 	ld	a, _cnt_second+0
      008D82 5F               [ 1]  942 	clrw	x
      008D83 4B 0A            [ 1]  943 	push	#0x0a
      008D85 4B 00            [ 1]  944 	push	#0x00
      008D87 97               [ 1]  945 	ld	xl, a
      008D88 CD 9B CF         [ 4]  946 	call	__modsint
      008D8B 9F               [ 1]  947 	ld	a, xl
      008D8C 4B 53            [ 1]  948 	push	#0x53
      008D8E CD 98 91         [ 4]  949 	call	_SD1106_printBigNum
                                    950 ;	main.c: 289: delay_ms(100);
      008D91 AE 00 64         [ 2]  951 	ldw	x, #0x0064
      008D94 CD 91 3E         [ 4]  952 	call	_delay_ms
      008D97 CC 8C CA         [ 2]  953 	jp	00155$
                                    954 ;	main.c: 292: while(mode == 2)
      008D9A                        955 00217$:
      008D9A                        956 00170$:
      008D9A C6 00 17         [ 1]  957 	ld	a, _mode+0
      008D9D A1 02            [ 1]  958 	cp	a, #0x02
      008D9F 27 03            [ 1]  959 	jreq	00409$
      008DA1 CC 88 EC         [ 2]  960 	jp	00174$
      008DA4                        961 00409$:
                                    962 ;	main.c: 294: if(!cnt_refesh){
      008DA4 C6 00 1F         [ 1]  963 	ld	a, _cnt_refesh+0
      008DA7 26 10            [ 1]  964 	jrne	00159$
                                    965 ;	main.c: 295: SD1106_sendCom(0xAF);   ////OLED On
      008DA9 A6 AF            [ 1]  966 	ld	a, #0xaf
      008DAB CD 94 16         [ 4]  967 	call	_SD1106_sendCom
                                    968 ;	main.c: 296: lcdstate = SET;
      008DAE 35 01 00 20      [ 1]  969 	mov	_lcdstate+0, #0x01
                                    970 ;	main.c: 297: SD1106_clear();
      008DB2 CD 94 B6         [ 4]  971 	call	_SD1106_clear
                                    972 ;	main.c: 298: cnt_refesh++;
      008DB5 72 5C 00 1F      [ 1]  973 	inc	_cnt_refesh+0
      008DB9                        974 00159$:
                                    975 ;	main.c: 300: SD1106_printP("+SET TIME+",   1,  70);
      008DB9 4B 46            [ 1]  976 	push	#0x46
      008DBB A6 01            [ 1]  977 	ld	a, #0x01
      008DBD AE 80 C8         [ 2]  978 	ldw	x, #(___str_7+0)
      008DC0 CD 96 F9         [ 4]  979 	call	_SD1106_printP
                                    980 ;	main.c: 301: if( (GPIO_ReadInputPin(right_port, right_pin) == RESET) | (GPIO_ReadInputPin(left_port, left_pin) == RESET) ) {
      008DC3 A6 40            [ 1]  981 	ld	a, #0x40
      008DC5 AE 50 0A         [ 2]  982 	ldw	x, #0x500a
      008DC8 CD 9A B1         [ 4]  983 	call	_GPIO_ReadInputPin
      008DCB A0 00            [ 1]  984 	sub	a, #0x00
      008DCD 26 04            [ 1]  985 	jrne	00412$
      008DCF 4C               [ 1]  986 	inc	a
      008DD0 6B 06            [ 1]  987 	ld	(0x06, sp), a
      008DD2 C5                     988 	.byte 0xc5
      008DD3                        989 00412$:
      008DD3 0F 06            [ 1]  990 	clr	(0x06, sp)
      008DD5                        991 00413$:
      008DD5 A6 20            [ 1]  992 	ld	a, #0x20
      008DD7 AE 50 0A         [ 2]  993 	ldw	x, #0x500a
      008DDA CD 9A B1         [ 4]  994 	call	_GPIO_ReadInputPin
      008DDD A0 00            [ 1]  995 	sub	a, #0x00
      008DDF 26 02            [ 1]  996 	jrne	00415$
      008DE1 4C               [ 1]  997 	inc	a
      008DE2 21                     998 	.byte 0x21
      008DE3                        999 00415$:
      008DE3 4F               [ 1] 1000 	clr	a
      008DE4                       1001 00416$:
      008DE4 1A 06            [ 1] 1002 	or	a, (0x06, sp)
      008DE6 27 55            [ 1] 1003 	jreq	00169$
                                   1004 ;	main.c: 302: delay_ms(20);
      008DE8 AE 00 14         [ 2] 1005 	ldw	x, #0x0014
      008DEB CD 91 3E         [ 4] 1006 	call	_delay_ms
                                   1007 ;	main.c: 303: if(GPIO_ReadInputPin(right_port, right_pin) == RESET){
      008DEE A6 40            [ 1] 1008 	ld	a, #0x40
      008DF0 AE 50 0A         [ 2] 1009 	ldw	x, #0x500a
      008DF3 CD 9A B1         [ 4] 1010 	call	_GPIO_ReadInputPin
      008DF6 4D               [ 1] 1011 	tnz	a
      008DF7 26 15            [ 1] 1012 	jrne	00163$
                                   1013 ;	main.c: 304: delay_ms(100);
      008DF9 AE 00 64         [ 2] 1014 	ldw	x, #0x0064
      008DFC CD 91 3E         [ 4] 1015 	call	_delay_ms
                                   1016 ;	main.c: 305: u8Time[1]++;
      008DFF C6 00 02         [ 1] 1017 	ld	a, _u8Time+1
      008E02 4C               [ 1] 1018 	inc	a
      008E03 C7 00 02         [ 1] 1019 	ld	_u8Time+1, a
                                   1020 ;	main.c: 306: if(u8Time[1] > 59) u8Time[1] = 0;
      008E06 A1 3B            [ 1] 1021 	cp	a, #0x3b
      008E08 23 04            [ 2] 1022 	jrule	00163$
      008E0A 35 00 00 02      [ 1] 1023 	mov	_u8Time+1, #0x00
      008E0E                       1024 00163$:
                                   1025 ;	main.c: 308: if(GPIO_ReadInputPin(left_port, left_pin) == RESET){
      008E0E A6 20            [ 1] 1026 	ld	a, #0x20
      008E10 AE 50 0A         [ 2] 1027 	ldw	x, #0x500a
      008E13 CD 9A B1         [ 4] 1028 	call	_GPIO_ReadInputPin
      008E16 4D               [ 1] 1029 	tnz	a
      008E17 26 15            [ 1] 1030 	jrne	00167$
                                   1031 ;	main.c: 309: delay_ms(100);
      008E19 AE 00 64         [ 2] 1032 	ldw	x, #0x0064
      008E1C CD 91 3E         [ 4] 1033 	call	_delay_ms
                                   1034 ;	main.c: 310: u8Time[2]++;
      008E1F C6 00 03         [ 1] 1035 	ld	a, _u8Time+2
      008E22 4C               [ 1] 1036 	inc	a
      008E23 C7 00 03         [ 1] 1037 	ld	_u8Time+2, a
                                   1038 ;	main.c: 311: if(u8Time[2] > 23) u8Time[2] = 0;
      008E26 A1 17            [ 1] 1039 	cp	a, #0x17
      008E28 23 04            [ 2] 1040 	jrule	00167$
      008E2A 35 00 00 03      [ 1] 1041 	mov	_u8Time+2, #0x00
      008E2E                       1042 00167$:
                                   1043 ;	main.c: 313: writeTime(00,u8Time[1],u8Time[2]);
      008E2E C6 00 03         [ 1] 1044 	ld	a, _u8Time+2
      008E31 97               [ 1] 1045 	ld	xl, a
      008E32 C6 00 02         [ 1] 1046 	ld	a, _u8Time+1
      008E35 89               [ 2] 1047 	pushw	x
      008E36 5B 01            [ 2] 1048 	addw	sp, #1
      008E38 88               [ 1] 1049 	push	a
      008E39 4F               [ 1] 1050 	clr	a
      008E3A CD 93 AF         [ 4] 1051 	call	_writeTime
      008E3D                       1052 00169$:
                                   1053 ;	main.c: 316: delay_ms(10);
      008E3D AE 00 0A         [ 2] 1054 	ldw	x, #0x000a
      008E40 CD 91 3E         [ 4] 1055 	call	_delay_ms
                                   1056 ;	main.c: 326: SD1106_printBigNum(u8Time[2]/10, 25);
      008E43 C6 00 03         [ 1] 1057 	ld	a, _u8Time+2
      008E46 5F               [ 1] 1058 	clrw	x
      008E47 4B 0A            [ 1] 1059 	push	#0x0a
      008E49 4B 00            [ 1] 1060 	push	#0x00
      008E4B 97               [ 1] 1061 	ld	xl, a
      008E4C CD 9B E7         [ 4] 1062 	call	__divsint
      008E4F 9F               [ 1] 1063 	ld	a, xl
      008E50 4B 19            [ 1] 1064 	push	#0x19
      008E52 CD 98 91         [ 4] 1065 	call	_SD1106_printBigNum
                                   1066 ;	main.c: 327: SD1106_printBigNum(u8Time[2]%10, 42);
      008E55 C6 00 03         [ 1] 1067 	ld	a, _u8Time+2
      008E58 5F               [ 1] 1068 	clrw	x
      008E59 4B 0A            [ 1] 1069 	push	#0x0a
      008E5B 4B 00            [ 1] 1070 	push	#0x00
      008E5D 97               [ 1] 1071 	ld	xl, a
      008E5E CD 9B CF         [ 4] 1072 	call	__modsint
      008E61 9F               [ 1] 1073 	ld	a, xl
      008E62 4B 2A            [ 1] 1074 	push	#0x2a
      008E64 CD 98 91         [ 4] 1075 	call	_SD1106_printBigNum
                                   1076 ;	main.c: 328: SD1106_printBigPoint(59);
      008E67 A6 3B            [ 1] 1077 	ld	a, #0x3b
      008E69 CD 99 2B         [ 4] 1078 	call	_SD1106_printBigPoint
                                   1079 ;	main.c: 329: SD1106_printBigNum(u8Time[1]/10, 66);
      008E6C C6 00 02         [ 1] 1080 	ld	a, _u8Time+1
      008E6F 5F               [ 1] 1081 	clrw	x
      008E70 4B 0A            [ 1] 1082 	push	#0x0a
      008E72 4B 00            [ 1] 1083 	push	#0x00
      008E74 97               [ 1] 1084 	ld	xl, a
      008E75 CD 9B E7         [ 4] 1085 	call	__divsint
      008E78 9F               [ 1] 1086 	ld	a, xl
      008E79 4B 42            [ 1] 1087 	push	#0x42
      008E7B CD 98 91         [ 4] 1088 	call	_SD1106_printBigNum
                                   1089 ;	main.c: 330: SD1106_printBigNum(u8Time[1]%10, 83);
      008E7E C6 00 02         [ 1] 1090 	ld	a, _u8Time+1
      008E81 5F               [ 1] 1091 	clrw	x
      008E82 4B 0A            [ 1] 1092 	push	#0x0a
      008E84 4B 00            [ 1] 1093 	push	#0x00
      008E86 97               [ 1] 1094 	ld	xl, a
      008E87 CD 9B CF         [ 4] 1095 	call	__modsint
      008E8A 9F               [ 1] 1096 	ld	a, xl
      008E8B 4B 53            [ 1] 1097 	push	#0x53
      008E8D CD 98 91         [ 4] 1098 	call	_SD1106_printBigNum
                                   1099 ;	main.c: 333: }
      008E90 CC 8D 9A         [ 2] 1100 	jp	00170$
                                   1101 ;	main.c: 335: void Clock_setup(void)
                                   1102 ;	-----------------------------------------
                                   1103 ;	 function Clock_setup
                                   1104 ;	-----------------------------------------
      008E93                       1105 _Clock_setup:
                                   1106 ;	main.c: 338: CLK->ICKR = CLK_ICKR_RESET_VALUE;
      008E93 35 01 50 C0      [ 1] 1107 	mov	0x50c0+0, #0x01
                                   1108 ;	main.c: 339: CLK->ECKR = CLK_ECKR_RESET_VALUE;
      008E97 35 00 50 C1      [ 1] 1109 	mov	0x50c1+0, #0x00
                                   1110 ;	main.c: 340: CLK->SWR  = CLK_SWR_RESET_VALUE;
      008E9B 35 E1 50 C4      [ 1] 1111 	mov	0x50c4+0, #0xe1
                                   1112 ;	main.c: 341: CLK->SWCR = CLK_SWCR_RESET_VALUE;
      008E9F 35 00 50 C5      [ 1] 1113 	mov	0x50c5+0, #0x00
                                   1114 ;	main.c: 342: CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
      008EA3 35 18 50 C6      [ 1] 1115 	mov	0x50c6+0, #0x18
                                   1116 ;	main.c: 343: CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
      008EA7 35 FF 50 C7      [ 1] 1117 	mov	0x50c7+0, #0xff
                                   1118 ;	main.c: 344: CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
      008EAB 35 FF 50 CA      [ 1] 1119 	mov	0x50ca+0, #0xff
                                   1120 ;	main.c: 345: CLK->CSSR = CLK_CSSR_RESET_VALUE;
      008EAF 35 00 50 C8      [ 1] 1121 	mov	0x50c8+0, #0x00
                                   1122 ;	main.c: 346: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      008EB3 35 00 50 C9      [ 1] 1123 	mov	0x50c9+0, #0x00
                                   1124 ;	main.c: 347: while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0) {}
      008EB7                       1125 00101$:
      008EB7 72 00 50 C9 FB   [ 2] 1126 	btjt	0x50c9, #0, 00101$
                                   1127 ;	main.c: 348: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      008EBC 35 00 50 C9      [ 1] 1128 	mov	0x50c9+0, #0x00
                                   1129 ;	main.c: 349: CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
      008EC0 35 00 50 CC      [ 1] 1130 	mov	0x50cc+0, #0x00
                                   1131 ;	main.c: 350: CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
      008EC4 35 00 50 CD      [ 1] 1132 	mov	0x50cd+0, #0x00
                                   1133 ;	main.c: 353: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      008EC8 C6 50 C6         [ 1] 1134 	ld	a, 0x50c6
      008ECB A4 E7            [ 1] 1135 	and	a, #0xe7
      008ECD C7 50 C6         [ 1] 1136 	ld	0x50c6, a
                                   1137 ;	main.c: 356: CLK->CKDIVR |= (uint8_t)0x00; /*!< High speed internal clock prescaler: 1 */
      008ED0 55 50 C6 50 C6   [ 1] 1138 	mov	0x50c6, 0x50c6
                                   1139 ;	main.c: 357: }
      008ED5 81               [ 4] 1140 	ret
                                   1141 ;	main.c: 360: void GPIO_setup(void)
                                   1142 ;	-----------------------------------------
                                   1143 ;	 function GPIO_setup
                                   1144 ;	-----------------------------------------
      008ED6                       1145 _GPIO_setup:
                                   1146 ;	main.c: 363: GPIO_DeInit(GPIOD);
      008ED6 AE 50 0F         [ 2] 1147 	ldw	x, #0x500f
      008ED9 CD 9A 06         [ 4] 1148 	call	_GPIO_DeInit
                                   1149 ;	main.c: 364: GPIO_DeInit(GPIOC);
      008EDC AE 50 0A         [ 2] 1150 	ldw	x, #0x500a
      008EDF CD 9A 06         [ 4] 1151 	call	_GPIO_DeInit
                                   1152 ;	main.c: 365: GPIO_DeInit(GPIOA);
      008EE2 AE 50 00         [ 2] 1153 	ldw	x, #0x5000
      008EE5 CD 9A 06         [ 4] 1154 	call	_GPIO_DeInit
                                   1155 ;	main.c: 366: GPIO_DeInit(GPIOE);
      008EE8 AE 50 14         [ 2] 1156 	ldw	x, #0x5014
      008EEB CD 9A 06         [ 4] 1157 	call	_GPIO_DeInit
                                   1158 ;	main.c: 367: GPIO_DeInit(GPIOB);   
      008EEE AE 50 05         [ 2] 1159 	ldw	x, #0x5005
      008EF1 CD 9A 06         [ 4] 1160 	call	_GPIO_DeInit
                                   1161 ;	main.c: 368: GPIO_DeInit(GPIOF);
      008EF4 AE 50 19         [ 2] 1162 	ldw	x, #0x5019
      008EF7 CD 9A 06         [ 4] 1163 	call	_GPIO_DeInit
                                   1164 ;	main.c: 370: GPIO_Init(mode_PORT, mode_PIN, GPIO_MODE_IN_PU_IT);
      008EFA 4B 60            [ 1] 1165 	push	#0x60
      008EFC A6 08            [ 1] 1166 	ld	a, #0x08
      008EFE AE 50 00         [ 2] 1167 	ldw	x, #0x5000
      008F01 CD 9A 14         [ 4] 1168 	call	_GPIO_Init
                                   1169 ;	main.c: 371: GPIO_Init(left_port, left_pin, GPIO_MODE_IN_PU_NO_IT);
      008F04 4B 40            [ 1] 1170 	push	#0x40
      008F06 A6 20            [ 1] 1171 	ld	a, #0x20
      008F08 AE 50 0A         [ 2] 1172 	ldw	x, #0x500a
      008F0B CD 9A 14         [ 4] 1173 	call	_GPIO_Init
                                   1174 ;	main.c: 372: GPIO_Init(right_port, right_pin, GPIO_MODE_IN_PU_NO_IT);
      008F0E 4B 40            [ 1] 1175 	push	#0x40
      008F10 A6 40            [ 1] 1176 	ld	a, #0x40
      008F12 AE 50 0A         [ 2] 1177 	ldw	x, #0x500a
      008F15 CD 9A 14         [ 4] 1178 	call	_GPIO_Init
                                   1179 ;	main.c: 374: GPIO_Init(GPIOB, GPIO_PIN_4 | GPIO_PIN_5, GPIO_MODE_OUT_OD_HIZ_SLOW);
      008F18 4B 90            [ 1] 1180 	push	#0x90
      008F1A A6 30            [ 1] 1181 	ld	a, #0x30
      008F1C AE 50 05         [ 2] 1182 	ldw	x, #0x5005
      008F1F CD 9A 14         [ 4] 1183 	call	_GPIO_Init
                                   1184 ;	main.c: 375: GPIO_Init(GPIOC ,GPIO_PIN_4 ,GPIO_MODE_OUT_PP_LOW_SLOW);
      008F22 4B C0            [ 1] 1185 	push	#0xc0
      008F24 A6 10            [ 1] 1186 	ld	a, #0x10
      008F26 AE 50 0A         [ 2] 1187 	ldw	x, #0x500a
      008F29 CD 9A 14         [ 4] 1188 	call	_GPIO_Init
                                   1189 ;	main.c: 376: GPIO_WriteLow(GPIOC, GPIO_PIN_4);
      008F2C A6 10            [ 1] 1190 	ld	a, #0x10
      008F2E AE 50 0A         [ 2] 1191 	ldw	x, #0x500a
                                   1192 ;	main.c: 377: }
      008F31 CC 9A 97         [ 2] 1193 	jp	_GPIO_WriteLow
                                   1194 ;	main.c: 379: void Exti_Config(void){
                                   1195 ;	-----------------------------------------
                                   1196 ;	 function Exti_Config
                                   1197 ;	-----------------------------------------
      008F34                       1198 _Exti_Config:
                                   1199 ;	main.c: 381: EXTI_DeInit();
      008F34 CD 9A D8         [ 4] 1200 	call	_EXTI_DeInit
                                   1201 ;	main.c: 382: EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOA, EXTI_SENSITIVITY_FALL_ONLY);
      008F37 4B 02            [ 1] 1202 	push	#0x02
      008F39 4F               [ 1] 1203 	clr	a
      008F3A CD 9A E1         [ 4] 1204 	call	_EXTI_SetExtIntSensitivity
                                   1205 ;	main.c: 383: EXTI_SetTLISensitivity(EXTI_TLISENSITIVITY_FALL_ONLY);
      008F3D 4F               [ 1] 1206 	clr	a
      008F3E CD 9B 6F         [ 4] 1207 	call	_EXTI_SetTLISensitivity
                                   1208 ;	main.c: 384: enableInterrupts();
      008F41 9A               [ 1] 1209 	rim
                                   1210 ;	main.c: 385: }
      008F42 81               [ 4] 1211 	ret
                                   1212 ;	main.c: 386: void readTime(void){
                                   1213 ;	-----------------------------------------
                                   1214 ;	 function readTime
                                   1215 ;	-----------------------------------------
      008F43                       1216 _readTime:
      008F43 88               [ 1] 1217 	push	a
                                   1218 ;	main.c: 388: data_read(ADDR_DS13, 0x00, 6, u8Time);
      008F44 4B 01            [ 1] 1219 	push	#<(_u8Time+0)
      008F46 4B 00            [ 1] 1220 	push	#((_u8Time+0) >> 8)
      008F48 4B 06            [ 1] 1221 	push	#0x06
      008F4A 4B 00            [ 1] 1222 	push	#0x00
      008F4C A6 D0            [ 1] 1223 	ld	a, #0xd0
      008F4E CD 93 3C         [ 4] 1224 	call	_data_read
                                   1225 ;	main.c: 389: for(uint8_t i=0; i<6; ++i){
      008F51 0F 01            [ 1] 1226 	clr	(0x01, sp)
      008F53                       1227 00107$:
      008F53 7B 01            [ 1] 1228 	ld	a, (0x01, sp)
      008F55 A1 06            [ 1] 1229 	cp	a, #0x06
      008F57 24 2E            [ 1] 1230 	jrnc	00109$
                                   1231 ;	main.c: 391: if((u8Time[i] >=0) && (u8Time[i] < 90) ){
      008F59 90 5F            [ 1] 1232 	clrw	y
      008F5B 7B 01            [ 1] 1233 	ld	a, (0x01, sp)
      008F5D 90 97            [ 1] 1234 	ld	yl, a
      008F5F 72 A9 00 01      [ 2] 1235 	addw	y, #(_u8Time+0)
      008F63 90 F6            [ 1] 1236 	ld	a, (y)
      008F65 95               [ 1] 1237 	ld	xh, a
      008F66 A1 5A            [ 1] 1238 	cp	a, #0x5a
      008F68 24 17            [ 1] 1239 	jrnc	00102$
                                   1240 ;	main.c: 392: temp = (u8Time[i] >> 4) & 0x0F;
      008F6A 9E               [ 1] 1241 	ld	a, xh
      008F6B 4E               [ 1] 1242 	swap	a
      008F6C A4 0F            [ 1] 1243 	and	a, #15
      008F6E 97               [ 1] 1244 	ld	xl, a
                                   1245 ;	main.c: 393: u8Time[i] = u8Time[i] & 0x0F;
      008F6F 9E               [ 1] 1246 	ld	a, xh
      008F70 A4 0F            [ 1] 1247 	and	a, #0x0f
      008F72 90 F7            [ 1] 1248 	ld	(y), a
                                   1249 ;	main.c: 394: u8Time[i] = (temp * 10) + u8Time[i];
      008F74 88               [ 1] 1250 	push	a
      008F75 A6 0A            [ 1] 1251 	ld	a, #0x0a
      008F77 42               [ 4] 1252 	mul	x, a
      008F78 84               [ 1] 1253 	pop	a
      008F79 89               [ 2] 1254 	pushw	x
      008F7A 1B 02            [ 1] 1255 	add	a, (2, sp)
      008F7C 85               [ 2] 1256 	popw	x
      008F7D 90 F7            [ 1] 1257 	ld	(y), a
      008F7F 20 02            [ 2] 1258 	jra	00108$
      008F81                       1259 00102$:
                                   1260 ;	main.c: 396: u8Time[i] = 0;
      008F81 90 7F            [ 1] 1261 	clr	(y)
      008F83                       1262 00108$:
                                   1263 ;	main.c: 389: for(uint8_t i=0; i<6; ++i){
      008F83 0C 01            [ 1] 1264 	inc	(0x01, sp)
      008F85 20 CC            [ 2] 1265 	jra	00107$
      008F87                       1266 00109$:
                                   1267 ;	main.c: 399: }
      008F87 84               [ 1] 1268 	pop	a
      008F88 81               [ 4] 1269 	ret
                                   1270 ;	main.c: 420: void setchannel(uint16_t fre){
                                   1271 ;	-----------------------------------------
                                   1272 ;	 function setchannel
                                   1273 ;	-----------------------------------------
      008F89                       1274 _setchannel:
      008F89 52 02            [ 2] 1275 	sub	sp, #2
                                   1276 ;	main.c: 421: fre = fre - 870;
      008F8B 1D 03 66         [ 2] 1277 	subw	x, #0x0366
                                   1278 ;	main.c: 422: uint8_t high = (uint8_t) fre >> 2;
      008F8E 9F               [ 1] 1279 	ld	a, xl
      008F8F 44               [ 1] 1280 	srl	a
      008F90 44               [ 1] 1281 	srl	a
      008F91 6B 01            [ 1] 1282 	ld	(0x01, sp), a
                                   1283 ;	main.c: 423: uint8_t low = (uint8_t) ( (fre & 0b11) << 6) | 0b00010000;
      008F93 9F               [ 1] 1284 	ld	a, xl
      008F94 A4 03            [ 1] 1285 	and	a, #0x03
      008F96 4E               [ 1] 1286 	swap	a
      008F97 A4 F0            [ 1] 1287 	and	a, #0xf0
      008F99 48               [ 1] 1288 	sll	a
      008F9A 48               [ 1] 1289 	sll	a
      008F9B AA 10            [ 1] 1290 	or	a, #0x10
      008F9D 6B 02            [ 1] 1291 	ld	(0x02, sp), a
                                   1292 ;	main.c: 424: i2c_start();
      008F9F CD 91 A1         [ 4] 1293 	call	_i2c_start
                                   1294 ;	main.c: 425: i2c_write(ADDR_5807M);
      008FA2 A6 20            [ 1] 1295 	ld	a, #0x20
      008FA4 CD 91 FE         [ 4] 1296 	call	_i2c_write
                                   1297 ;	main.c: 426: i2c_write(0xC0);
      008FA7 A6 C0            [ 1] 1298 	ld	a, #0xc0
      008FA9 CD 91 FE         [ 4] 1299 	call	_i2c_write
                                   1300 ;	main.c: 427: i2c_write(0x01);
      008FAC A6 01            [ 1] 1301 	ld	a, #0x01
      008FAE CD 91 FE         [ 4] 1302 	call	_i2c_write
                                   1303 ;	main.c: 428: i2c_write(high);
      008FB1 7B 01            [ 1] 1304 	ld	a, (0x01, sp)
      008FB3 CD 91 FE         [ 4] 1305 	call	_i2c_write
                                   1306 ;	main.c: 429: i2c_write(low);
      008FB6 7B 02            [ 1] 1307 	ld	a, (0x02, sp)
      008FB8 CD 91 FE         [ 4] 1308 	call	_i2c_write
                                   1309 ;	main.c: 430: i2c_stop();
      008FBB 5B 02            [ 2] 1310 	addw	sp, #2
                                   1311 ;	main.c: 431: }
      008FBD CC 91 D6         [ 2] 1312 	jp	_i2c_stop
                                   1313 ;	main.c: 433: INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
                                   1314 ;	-----------------------------------------
                                   1315 ;	 function EXTI_PORTA_IRQHandler
                                   1316 ;	-----------------------------------------
      008FC0                       1317 _EXTI_PORTA_IRQHandler:
      008FC0 4F               [ 1] 1318 	clr	a
      008FC1 62               [ 2] 1319 	div	x, a
                                   1320 ;	main.c: 438: if (GPIO_ReadInputPin(mode_PORT, mode_PIN) == RESET){
      008FC2 A6 08            [ 1] 1321 	ld	a, #0x08
      008FC4 AE 50 00         [ 2] 1322 	ldw	x, #0x5000
      008FC7 CD 9A B1         [ 4] 1323 	call	_GPIO_ReadInputPin
      008FCA 4D               [ 1] 1324 	tnz	a
      008FCB 26 65            [ 1] 1325 	jrne	00112$
                                   1326 ;	main.c: 439: BEEP_Cmd(ENABLE);
      008FCD A6 01            [ 1] 1327 	ld	a, #0x01
      008FCF CD 91 80         [ 4] 1328 	call	_BEEP_Cmd
                                   1329 ;	main.c: 440: delay_ms(200);
      008FD2 AE 00 C8         [ 2] 1330 	ldw	x, #0x00c8
      008FD5 CD 91 3E         [ 4] 1331 	call	_delay_ms
                                   1332 ;	main.c: 441: BEEP_Cmd(DISABLE);
      008FD8 4F               [ 1] 1333 	clr	a
      008FD9 CD 91 80         [ 4] 1334 	call	_BEEP_Cmd
                                   1335 ;	main.c: 443: cnt_refesh = 0;
      008FDC 72 5F 00 1F      [ 1] 1336 	clr	_cnt_refesh+0
                                   1337 ;	main.c: 444: cnt_autoOff = 0;
      008FE0 72 5F 00 15      [ 1] 1338 	clr	_cnt_autoOff+0
                                   1339 ;	main.c: 445: mode++;
      008FE4 72 5C 00 17      [ 1] 1340 	inc	_mode+0
                                   1341 ;	main.c: 446: if(mode > 2) mode = 0;
      008FE8 C6 00 17         [ 1] 1342 	ld	a, _mode+0
      008FEB A1 02            [ 1] 1343 	cp	a, #0x02
      008FED 23 04            [ 2] 1344 	jrule	00102$
      008FEF 72 5F 00 17      [ 1] 1345 	clr	_mode+0
      008FF3                       1346 00102$:
                                   1347 ;	main.c: 447: delay_ms(200);
      008FF3 AE 00 C8         [ 2] 1348 	ldw	x, #0x00c8
      008FF6 CD 91 3E         [ 4] 1349 	call	_delay_ms
                                   1350 ;	main.c: 448: if(GPIO_ReadInputPin(mode_PORT, mode_PIN) == RESET){
      008FF9 A6 08            [ 1] 1351 	ld	a, #0x08
      008FFB AE 50 00         [ 2] 1352 	ldw	x, #0x5000
      008FFE CD 9A B1         [ 4] 1353 	call	_GPIO_ReadInputPin
      009001 4D               [ 1] 1354 	tnz	a
      009002 26 2E            [ 1] 1355 	jrne	00112$
                                   1356 ;	main.c: 449: delay_ms(400);
      009004 AE 01 90         [ 2] 1357 	ldw	x, #0x0190
      009007 CD 91 3E         [ 4] 1358 	call	_delay_ms
                                   1359 ;	main.c: 450: if(GPIO_ReadInputPin(mode_PORT, mode_PIN) == RESET){
      00900A A6 08            [ 1] 1360 	ld	a, #0x08
      00900C AE 50 00         [ 2] 1361 	ldw	x, #0x5000
      00900F CD 9A B1         [ 4] 1362 	call	_GPIO_ReadInputPin
      009012 4D               [ 1] 1363 	tnz	a
      009013 26 1D            [ 1] 1364 	jrne	00112$
                                   1365 ;	main.c: 451: delay_ms(400);
      009015 AE 01 90         [ 2] 1366 	ldw	x, #0x0190
      009018 CD 91 3E         [ 4] 1367 	call	_delay_ms
                                   1368 ;	main.c: 452: while(GPIO_ReadInputPin(mode_PORT, mode_PIN) == RESET);
      00901B                       1369 00103$:
      00901B A6 08            [ 1] 1370 	ld	a, #0x08
      00901D AE 50 00         [ 2] 1371 	ldw	x, #0x5000
      009020 CD 9A B1         [ 4] 1372 	call	_GPIO_ReadInputPin
      009023 4D               [ 1] 1373 	tnz	a
      009024 27 F5            [ 1] 1374 	jreq	00103$
                                   1375 ;	main.c: 453: mode = 0;
      009026 72 5F 00 17      [ 1] 1376 	clr	_mode+0
                                   1377 ;	main.c: 454: GPIO_WriteReverse(switch_PORT, switch_PIN);
      00902A A6 10            [ 1] 1378 	ld	a, #0x10
      00902C AE 50 0A         [ 2] 1379 	ldw	x, #0x500a
      00902F CD 9A A3         [ 4] 1380 	call	_GPIO_WriteReverse
      009032                       1381 00112$:
                                   1382 ;	main.c: 460: }
      009032 80               [11] 1383 	iret
                                   1384 ;	main.c: 462: INTERRUPT_HANDLER(ADC1_IRQHandler, 22){    
                                   1385 ;	-----------------------------------------
                                   1386 ;	 function ADC1_IRQHandler
                                   1387 ;	-----------------------------------------
      009033                       1388 _ADC1_IRQHandler:
      009033 52 02            [ 2] 1389 	sub	sp, #2
                                   1390 ;	main.c: 465: templ = ADC1->DRL;
      009035 55 54 05 00 1A   [ 1] 1391 	mov	_templ+0, 0x5405
                                   1392 ;	main.c: 467: temph = ADC1->DRH;
      00903A C6 54 04         [ 1] 1393 	ld	a, 0x5404
      00903D 5F               [ 1] 1394 	clrw	x
      00903E 97               [ 1] 1395 	ld	xl, a
      00903F CF 00 18         [ 2] 1396 	ldw	_temph+0, x
                                   1397 ;	main.c: 469: temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t) 8 ));
      009042 C6 00 19         [ 1] 1398 	ld	a, _temph+1
      009045 6B 01            [ 1] 1399 	ld	(0x01, sp), a
      009047 0F 02            [ 1] 1400 	clr	(0x02, sp)
      009049 C6 00 1A         [ 1] 1401 	ld	a, _templ+0
      00904C 5F               [ 1] 1402 	clrw	x
      00904D 1A 02            [ 1] 1403 	or	a, (0x02, sp)
      00904F 02               [ 1] 1404 	rlwa	x
      009050 1A 01            [ 1] 1405 	or	a, (0x01, sp)
      009052 95               [ 1] 1406 	ld	xh, a
      009053 CF 00 18         [ 2] 1407 	ldw	_temph+0, x
                                   1408 ;	main.c: 472: ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT_EOC);    
      009056 72 1F 54 00      [ 1] 1409 	bres	0x5400, #7
                                   1410 ;	main.c: 473: }
      00905A 5B 02            [ 2] 1411 	addw	sp, #2
      00905C 80               [11] 1412 	iret
                                   1413 ;	main.c: 476: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
                                   1414 ;	-----------------------------------------
                                   1415 ;	 function TIM4_UPD_OVF_IRQHandler
                                   1416 ;	-----------------------------------------
      00905D                       1417 _TIM4_UPD_OVF_IRQHandler:
      00905D 4F               [ 1] 1418 	clr	a
      00905E 62               [ 2] 1419 	div	x, a
                                   1420 ;	main.c: 478: counter++;
      00905F CE 00 11         [ 2] 1421 	ldw	x, _counter+0
      009062 5C               [ 1] 1422 	incw	x
                                   1423 ;	main.c: 479: if (counter == 1000)
      009063 CF 00 11         [ 2] 1424 	ldw	_counter+0, x
      009066 A3 03 E8         [ 2] 1425 	cpw	x, #0x03e8
      009069 26 39            [ 1] 1426 	jrne	00108$
                                   1427 ;	main.c: 481: counter = 0;
      00906B 5F               [ 1] 1428 	clrw	x
      00906C CF 00 11         [ 2] 1429 	ldw	_counter+0, x
                                   1430 ;	main.c: 482: cnt_second++;
      00906F 72 5C 00 14      [ 1] 1431 	inc	_cnt_second+0
                                   1432 ;	main.c: 483: cnt_autoOff++;
      009073 72 5C 00 15      [ 1] 1433 	inc	_cnt_autoOff+0
                                   1434 ;	main.c: 484: if((cnt_second % 5) == 0){
      009077 C6 00 14         [ 1] 1435 	ld	a, _cnt_second+0
      00907A 5F               [ 1] 1436 	clrw	x
      00907B 4B 05            [ 1] 1437 	push	#0x05
      00907D 4B 00            [ 1] 1438 	push	#0x00
      00907F 97               [ 1] 1439 	ld	xl, a
      009080 CD 9B CF         [ 4] 1440 	call	__modsint
      009083 5D               [ 2] 1441 	tnzw	x
      009084 26 04            [ 1] 1442 	jrne	00102$
                                   1443 ;	main.c: 486: ADC1->CR1 |= ADC1_CR1_ADON;    
      009086 72 10 54 01      [ 1] 1444 	bset	0x5401, #0
      00908A                       1445 00102$:
                                   1446 ;	main.c: 488: if (cnt_second > 59) 
      00908A C6 00 14         [ 1] 1447 	ld	a, _cnt_second+0
      00908D A1 3B            [ 1] 1448 	cp	a, #0x3b
      00908F 23 13            [ 2] 1449 	jrule	00108$
                                   1450 ;	main.c: 490: cnt_second = 0;
      009091 72 5F 00 14      [ 1] 1451 	clr	_cnt_second+0
                                   1452 ;	main.c: 491: cnt_minute++;
      009095 72 5C 00 16      [ 1] 1453 	inc	_cnt_minute+0
                                   1454 ;	main.c: 492: if (cnt_minute > 59) cnt_minute = 0;
      009099 C6 00 16         [ 1] 1455 	ld	a, _cnt_minute+0
      00909C A1 3B            [ 1] 1456 	cp	a, #0x3b
      00909E 23 04            [ 2] 1457 	jrule	00108$
      0090A0 72 5F 00 16      [ 1] 1458 	clr	_cnt_minute+0
      0090A4                       1459 00108$:
                                   1460 ;	main.c: 496: TIM4->SR1 = (uint8_t)(~TIM4_IT_UPDATE);
      0090A4 35 FE 53 44      [ 1] 1461 	mov	0x5344+0, #0xfe
                                   1462 ;	main.c: 497: }
      0090A8 80               [11] 1463 	iret
                                   1464 	.area CODE
                                   1465 	.area CONST
      008091                       1466 _mangAL:
      008091 04                    1467 	.db #0x04	; 4
      008092 06                    1468 	.db #0x06	; 6
      008093 1B                    1469 	.db #0x1b	; 27
      008094 07                    1470 	.db #0x07	; 7
      008095 03                    1471 	.db #0x03	; 3
      008096 07                    1472 	.db #0x07	; 7
      008097 1D                    1473 	.db #0x1d	; 29
      008098 08                    1474 	.db #0x08	; 8
      008099 03                    1475 	.db #0x03	; 3
      00809A 08                    1476 	.db #0x08	; 8
      00809B 1D                    1477 	.db #0x1d	; 29
      00809C 09                    1478 	.db #0x09	; 9
      00809D 01                    1479 	.db #0x01	; 1
      00809E 0A                    1480 	.db #0x0a	; 10
      00809F 01                    1481 	.db #0x01	; 1
      0080A0 0A                    1482 	.db #0x0a	; 10
      0080A1 01                    1483 	.db #0x01	; 1
      0080A2 0B                    1484 	.db #0x0b	; 11
      0080A3 01                    1485 	.db #0x01	; 1
      0080A4 0B                    1486 	.db #0x0b	; 11
                                   1487 	.area CONST
      0080A5                       1488 ___str_0:
      0080A5 41 4C 3A 31 7C 31 35  1489 	.ascii "AL:1|15"
      0080AC 00                    1490 	.db 0x00
                                   1491 	.area CODE
                                   1492 	.area CONST
      0080AD                       1493 ___str_1:
      0080AD 2E                    1494 	.ascii "."
      0080AE 00                    1495 	.db 0x00
                                   1496 	.area CODE
                                   1497 	.area CONST
      0080AF                       1498 ___str_2:
      0080AF 56                    1499 	.ascii "V"
      0080B0 00                    1500 	.db 0x00
                                   1501 	.area CODE
                                   1502 	.area CONST
      0080B1                       1503 ___str_3:
      0080B1 2B 44 41 54 45 2B     1504 	.ascii "+DATE+"
      0080B7 00                    1505 	.db 0x00
                                   1506 	.area CODE
                                   1507 	.area CONST
      0080B8                       1508 ___str_4:
      0080B8 41 4C 3A              1509 	.ascii "AL:"
      0080BB 00                    1510 	.db 0x00
                                   1511 	.area CODE
                                   1512 	.area CONST
      0080BC                       1513 ___str_5:
      0080BC 2D                    1514 	.ascii "-"
      0080BD 00                    1515 	.db 0x00
                                   1516 	.area CODE
                                   1517 	.area CONST
      0080BE                       1518 ___str_6:
      0080BE 2B 43 4F 55 4E 54 45  1519 	.ascii "+COUNTER+"
             52 2B
      0080C7 00                    1520 	.db 0x00
                                   1521 	.area CODE
                                   1522 	.area CONST
      0080C8                       1523 ___str_7:
      0080C8 2B 53 45 54 20 54 49  1524 	.ascii "+SET TIME+"
             4D 45 2B
      0080D2 00                    1525 	.db 0x00
                                   1526 	.area CODE
                                   1527 	.area INITIALIZER
      008895                       1528 __xinit__u8Time:
      008895 00                    1529 	.db #0x00	; 0
      008896 00                    1530 	.db #0x00	; 0
      008897 00                    1531 	.db #0x00	; 0
      008898 00                    1532 	.db #0x00	; 0
      008899 00                    1533 	.db #0x00	; 0
      00889A 00                    1534 	.db #0x00	; 0
      00889B                       1535 __xinit__u8Radio:
      00889B 00                    1536 	.db #0x00	; 0
      00889C 00                    1537 	.db #0x00	; 0
      00889D 00                    1538 	.db #0x00	; 0
      00889E 00                    1539 	.db #0x00	; 0
      00889F                       1540 __xinit__FreFM:
      00889F 00 00                 1541 	.dw #0x0000
      0088A1                       1542 __xinit__adc_value:
      0088A1 00 00                 1543 	.dw #0x0000
      0088A3                       1544 __xinit__voltBat:
      0088A3 00 00                 1545 	.dw #0x0000
      0088A5                       1546 __xinit__counter:
      0088A5 00 00                 1547 	.dw #0x0000
      0088A7                       1548 __xinit__powerradio:
      0088A7 00                    1549 	.db #0x00	; 0
      0088A8                       1550 __xinit__cnt_second:
      0088A8 00                    1551 	.db #0x00	; 0
      0088A9                       1552 __xinit__cnt_autoOff:
      0088A9 00                    1553 	.db #0x00	; 0
      0088AA                       1554 __xinit__cnt_minute:
      0088AA 00                    1555 	.db #0x00	; 0
      0088AB                       1556 __xinit__mode:
      0088AB 00                    1557 	.db #0x00	; 0
      0088AC                       1558 __xinit__temph:
      0088AC 00 00                 1559 	.dw #0x0000
      0088AE                       1560 __xinit__templ:
      0088AE 00                    1561 	.db #0x00	; 0
      0088AF                       1562 __xinit__date:
      0088AF 00                    1563 	.db #0x00	; 0
      0088B0                       1564 __xinit__month:
      0088B0 00                    1565 	.db #0x00	; 0
      0088B1                       1566 __xinit__dateAL:
      0088B1 00                    1567 	.db #0x00	; 0
      0088B2                       1568 __xinit__monthAL:
      0088B2 00                    1569 	.db #0x00	; 0
      0088B3                       1570 __xinit__cnt_refesh:
      0088B3 00                    1571 	.db #0x00	; 0
      0088B4                       1572 __xinit__lcdstate:
      0088B4 00                    1573 	.db #0x00	;  0
                                   1574 	.area CABS (ABS)
