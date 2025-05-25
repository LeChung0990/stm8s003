                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.5.0 #9253 (Apr  3 2018) (Linux)
                                      4 ; This file was generated Tue Feb 11 21:09:31 2025
                                      5 ;--------------------------------------------------------
                                      6 	.module one_wire
                                      7 	.optsdcc -mstm8
                                      8 	
                                      9 ;--------------------------------------------------------
                                     10 ; Public variables in this module
                                     11 ;--------------------------------------------------------
                                     12 	.globl _delay_us
                                     13 	.globl _OneWireHigh
                                     14 	.globl _OneWireRelease
                                     15 	.globl _OneWireRead
                                     16 	.globl _OneWireReset
                                     17 	.globl _OneWireWriteBit
                                     18 	.globl _OneWireReadBit
                                     19 	.globl _OneWireWriteByte
                                     20 	.globl _OneWireReadByte
                                     21 ;--------------------------------------------------------
                                     22 ; ram data
                                     23 ;--------------------------------------------------------
                                     24 	.area DATA
                                     25 ;--------------------------------------------------------
                                     26 ; ram data
                                     27 ;--------------------------------------------------------
                                     28 	.area INITIALIZED
                                     29 ;--------------------------------------------------------
                                     30 ; absolute external ram data
                                     31 ;--------------------------------------------------------
                                     32 	.area DABS (ABS)
                                     33 ;--------------------------------------------------------
                                     34 ; global & static initialisations
                                     35 ;--------------------------------------------------------
                                     36 	.area HOME
                                     37 	.area GSINIT
                                     38 	.area GSFINAL
                                     39 	.area GSINIT
                                     40 ;--------------------------------------------------------
                                     41 ; Home
                                     42 ;--------------------------------------------------------
                                     43 	.area HOME
                                     44 	.area HOME
                                     45 ;--------------------------------------------------------
                                     46 ; code
                                     47 ;--------------------------------------------------------
                                     48 	.area CODE
                                     49 ;	lib/src/one-wire.c: 12: void OneWireHigh(){
                                     50 ;	-----------------------------------------
                                     51 ;	 function OneWireHigh
                                     52 ;	-----------------------------------------
      0084BC                         53 _OneWireHigh:
                                     54 ;	lib/src/one-wire.c: 14: OW_OUT();
      0084BC AE 50 0C         [ 2]   55 	ldw	x, #0x500c
      0084BF F6               [ 1]   56 	ld	a, (x)
      0084C0 AA 10            [ 1]   57 	or	a, #0x10
      0084C2 F7               [ 1]   58 	ld	(x), a
                                     59 ;	lib/src/one-wire.c: 15: OW_PIN_OPEN_DRAIN();
      0084C3 AE 50 0D         [ 2]   60 	ldw	x, #0x500d
      0084C6 F6               [ 1]   61 	ld	a, (x)
      0084C7 A4 EF            [ 1]   62 	and	a, #0xef
      0084C9 F7               [ 1]   63 	ld	(x), a
                                     64 ;	lib/src/one-wire.c: 17: OW_HIGH();
      0084CA AE 50 0A         [ 2]   65 	ldw	x, #0x500a
      0084CD F6               [ 1]   66 	ld	a, (x)
      0084CE AA 10            [ 1]   67 	or	a, #0x10
      0084D0 F7               [ 1]   68 	ld	(x), a
      0084D1 81               [ 4]   69 	ret
                                     70 ;	lib/src/one-wire.c: 20: void OneWireRelease(){
                                     71 ;	-----------------------------------------
                                     72 ;	 function OneWireRelease
                                     73 ;	-----------------------------------------
      0084D2                         74 _OneWireRelease:
                                     75 ;	lib/src/one-wire.c: 22: OW_OUT();
      0084D2 AE 50 0C         [ 2]   76 	ldw	x, #0x500c
      0084D5 F6               [ 1]   77 	ld	a, (x)
      0084D6 AA 10            [ 1]   78 	or	a, #0x10
      0084D8 F7               [ 1]   79 	ld	(x), a
                                     80 ;	lib/src/one-wire.c: 23: OW_PIN_OPEN_DRAIN();
      0084D9 AE 50 0D         [ 2]   81 	ldw	x, #0x500d
      0084DC F6               [ 1]   82 	ld	a, (x)
      0084DD A4 EF            [ 1]   83 	and	a, #0xef
      0084DF F7               [ 1]   84 	ld	(x), a
                                     85 ;	lib/src/one-wire.c: 25: OW_LOW();
      0084E0 AE 50 0A         [ 2]   86 	ldw	x, #0x500a
      0084E3 F6               [ 1]   87 	ld	a, (x)
      0084E4 A4 EF            [ 1]   88 	and	a, #0xef
      0084E6 F7               [ 1]   89 	ld	(x), a
      0084E7 81               [ 4]   90 	ret
                                     91 ;	lib/src/one-wire.c: 28: unsigned char OneWireRead(){
                                     92 ;	-----------------------------------------
                                     93 ;	 function OneWireRead
                                     94 ;	-----------------------------------------
      0084E8                         95 _OneWireRead:
                                     96 ;	lib/src/one-wire.c: 29: return OW_PIN_VALUE();
      0084E8 AE 50 0B         [ 2]   97 	ldw	x, #0x500b
      0084EB F6               [ 1]   98 	ld	a, (x)
      0084EC A4 10            [ 1]   99 	and	a, #0x10
      0084EE 81               [ 4]  100 	ret
                                    101 ;	lib/src/one-wire.c: 32: unsigned int OneWireReset(){
                                    102 ;	-----------------------------------------
                                    103 ;	 function OneWireReset
                                    104 ;	-----------------------------------------
      0084EF                        105 _OneWireReset:
                                    106 ;	lib/src/one-wire.c: 35: OneWireRelease();
      0084EF CD 84 D2         [ 4]  107 	call	_OneWireRelease
                                    108 ;	lib/src/one-wire.c: 36: delay_us(479); // 480uS Delay
      0084F2 4B DF            [ 1]  109 	push	#0xdf
      0084F4 4B 01            [ 1]  110 	push	#0x01
      0084F6 CD 82 CF         [ 4]  111 	call	_delay_us
      0084F9 5B 02            [ 2]  112 	addw	sp, #2
                                    113 ;	lib/src/one-wire.c: 37: OneWireHigh();
      0084FB CD 84 BC         [ 4]  114 	call	_OneWireHigh
                                    115 ;	lib/src/one-wire.c: 38: delay_us(69);  // wait 70 uS before reading
      0084FE 4B 45            [ 1]  116 	push	#0x45
      008500 4B 00            [ 1]  117 	push	#0x00
      008502 CD 82 CF         [ 4]  118 	call	_delay_us
      008505 5B 02            [ 2]  119 	addw	sp, #2
                                    120 ;	lib/src/one-wire.c: 40: OW = OneWireRead(); // check for OneWire
      008507 CD 84 E8         [ 4]  121 	call	_OneWireRead
      00850A 5F               [ 1]  122 	clrw	x
      00850B 97               [ 1]  123 	ld	xl, a
                                    124 ;	lib/src/one-wire.c: 41: delay_us(479);      // 480uS delay
      00850C 89               [ 2]  125 	pushw	x
      00850D 4B DF            [ 1]  126 	push	#0xdf
      00850F 4B 01            [ 1]  127 	push	#0x01
      008511 CD 82 CF         [ 4]  128 	call	_delay_us
      008514 5B 02            [ 2]  129 	addw	sp, #2
      008516 CD 84 BC         [ 4]  130 	call	_OneWireHigh
      008519 85               [ 2]  131 	popw	x
                                    132 ;	lib/src/one-wire.c: 43: return OW;
      00851A 81               [ 4]  133 	ret
                                    134 ;	lib/src/one-wire.c: 47: void OneWireWriteBit(unsigned char b){
                                    135 ;	-----------------------------------------
                                    136 ;	 function OneWireWriteBit
                                    137 ;	-----------------------------------------
      00851B                        138 _OneWireWriteBit:
                                    139 ;	lib/src/one-wire.c: 48: if(b){
      00851B 0D 03            [ 1]  140 	tnz	(0x03, sp)
      00851D 27 1A            [ 1]  141 	jreq	00102$
                                    142 ;	lib/src/one-wire.c: 49: OneWireRelease();
      00851F CD 84 D2         [ 4]  143 	call	_OneWireRelease
                                    144 ;	lib/src/one-wire.c: 50: delay_us(5);  // wait 6uS
      008522 4B 05            [ 1]  145 	push	#0x05
      008524 4B 00            [ 1]  146 	push	#0x00
      008526 CD 82 CF         [ 4]  147 	call	_delay_us
      008529 5B 02            [ 2]  148 	addw	sp, #2
                                    149 ;	lib/src/one-wire.c: 51: OneWireHigh();
      00852B CD 84 BC         [ 4]  150 	call	_OneWireHigh
                                    151 ;	lib/src/one-wire.c: 52: delay_us(63); // wait 64uS
      00852E 4B 3F            [ 1]  152 	push	#0x3f
      008530 4B 00            [ 1]  153 	push	#0x00
      008532 CD 82 CF         [ 4]  154 	call	_delay_us
      008535 5B 02            [ 2]  155 	addw	sp, #2
      008537 20 18            [ 2]  156 	jra	00104$
      008539                        157 00102$:
                                    158 ;	lib/src/one-wire.c: 55: OneWireRelease();
      008539 CD 84 D2         [ 4]  159 	call	_OneWireRelease
                                    160 ;	lib/src/one-wire.c: 56: delay_us(59); // wait 60uS
      00853C 4B 3B            [ 1]  161 	push	#0x3b
      00853E 4B 00            [ 1]  162 	push	#0x00
      008540 CD 82 CF         [ 4]  163 	call	_delay_us
      008543 5B 02            [ 2]  164 	addw	sp, #2
                                    165 ;	lib/src/one-wire.c: 57: OneWireHigh();
      008545 CD 84 BC         [ 4]  166 	call	_OneWireHigh
                                    167 ;	lib/src/one-wire.c: 58: delay_us(9); // wait 10uS
      008548 4B 09            [ 1]  168 	push	#0x09
      00854A 4B 00            [ 1]  169 	push	#0x00
      00854C CD 82 CF         [ 4]  170 	call	_delay_us
      00854F 5B 02            [ 2]  171 	addw	sp, #2
      008551                        172 00104$:
      008551 81               [ 4]  173 	ret
                                    174 ;	lib/src/one-wire.c: 64: unsigned char OneWireReadBit() {
                                    175 ;	-----------------------------------------
                                    176 ;	 function OneWireReadBit
                                    177 ;	-----------------------------------------
      008552                        178 _OneWireReadBit:
                                    179 ;	lib/src/one-wire.c: 67: OneWireRelease();
      008552 CD 84 D2         [ 4]  180 	call	_OneWireRelease
                                    181 ;	lib/src/one-wire.c: 68: delay_us(5); // wait 6uS
      008555 4B 05            [ 1]  182 	push	#0x05
      008557 4B 00            [ 1]  183 	push	#0x00
      008559 CD 82 CF         [ 4]  184 	call	_delay_us
      00855C 5B 02            [ 2]  185 	addw	sp, #2
                                    186 ;	lib/src/one-wire.c: 69: OneWireHigh();
      00855E CD 84 BC         [ 4]  187 	call	_OneWireHigh
                                    188 ;	lib/src/one-wire.c: 70: delay_us(8); // wait 9uS
      008561 4B 08            [ 1]  189 	push	#0x08
      008563 4B 00            [ 1]  190 	push	#0x00
      008565 CD 82 CF         [ 4]  191 	call	_delay_us
      008568 5B 02            [ 2]  192 	addw	sp, #2
                                    193 ;	lib/src/one-wire.c: 71: out = OneWireRead();
      00856A CD 84 E8         [ 4]  194 	call	_OneWireRead
                                    195 ;	lib/src/one-wire.c: 73: if(out) {
      00856D 4D               [ 1]  196 	tnz	a
      00856E 27 03            [ 1]  197 	jreq	00102$
                                    198 ;	lib/src/one-wire.c: 74: out = 0x01;
      008570 A6 01            [ 1]  199 	ld	a, #0x01
                                    200 ;	lib/src/one-wire.c: 78: out = 0x00;
      008572 21                     201 	.byte 0x21
      008573                        202 00102$:
      008573 4F               [ 1]  203 	clr	a
      008574                        204 00103$:
                                    205 ;	lib/src/one-wire.c: 82: delay_us(54); // wait 55uS
      008574 88               [ 1]  206 	push	a
      008575 4B 36            [ 1]  207 	push	#0x36
      008577 4B 00            [ 1]  208 	push	#0x00
      008579 CD 82 CF         [ 4]  209 	call	_delay_us
      00857C 5B 02            [ 2]  210 	addw	sp, #2
      00857E 84               [ 1]  211 	pop	a
                                    212 ;	lib/src/one-wire.c: 83: return out;
      00857F 81               [ 4]  213 	ret
                                    214 ;	lib/src/one-wire.c: 86: void OneWireWriteByte(unsigned char b) {
                                    215 ;	-----------------------------------------
                                    216 ;	 function OneWireWriteByte
                                    217 ;	-----------------------------------------
      008580                        218 _OneWireWriteByte:
                                    219 ;	lib/src/one-wire.c: 89: for(i=0; i < 8; i++) {
      008580 5F               [ 1]  220 	clrw	x
      008581                        221 00102$:
                                    222 ;	lib/src/one-wire.c: 90: OneWireWriteBit(b & 0x01); // send LS bit first
      008581 7B 03            [ 1]  223 	ld	a, (0x03, sp)
      008583 A4 01            [ 1]  224 	and	a, #0x01
      008585 89               [ 2]  225 	pushw	x
      008586 88               [ 1]  226 	push	a
      008587 CD 85 1B         [ 4]  227 	call	_OneWireWriteBit
      00858A 84               [ 1]  228 	pop	a
      00858B 85               [ 2]  229 	popw	x
                                    230 ;	lib/src/one-wire.c: 91: b = b >> 1;
      00858C 7B 03            [ 1]  231 	ld	a, (0x03, sp)
      00858E 44               [ 1]  232 	srl	a
      00858F 6B 03            [ 1]  233 	ld	(0x03, sp), a
                                    234 ;	lib/src/one-wire.c: 89: for(i=0; i < 8; i++) {
      008591 5C               [ 2]  235 	incw	x
      008592 A3 00 08         [ 2]  236 	cpw	x, #0x0008
      008595 2F EA            [ 1]  237 	jrslt	00102$
      008597 81               [ 4]  238 	ret
                                    239 ;	lib/src/one-wire.c: 95: unsigned char OneWireReadByte(void){
                                    240 ;	-----------------------------------------
                                    241 ;	 function OneWireReadByte
                                    242 ;	-----------------------------------------
      008598                        243 _OneWireReadByte:
      008598 52 02            [ 2]  244 	sub	sp, #2
                                    245 ;	lib/src/one-wire.c: 99: out = 0;
      00859A 4F               [ 1]  246 	clr	a
                                    247 ;	lib/src/one-wire.c: 100: for(i = 0; i < 8; i++){       // read in LS bit first
      00859B AE 00 08         [ 2]  248 	ldw	x, #0x0008
      00859E 1F 01            [ 2]  249 	ldw	(0x01, sp), x
      0085A0                        250 00106$:
                                    251 ;	lib/src/one-wire.c: 101: out = out >> 1;             // get out ready for next bit
      0085A0 44               [ 1]  252 	srl	a
                                    253 ;	lib/src/one-wire.c: 102: if(OneWireReadBit() & 0x01) // if its a one
      0085A1 88               [ 1]  254 	push	a
      0085A2 CD 85 52         [ 4]  255 	call	_OneWireReadBit
      0085A5 97               [ 1]  256 	ld	xl, a
      0085A6 84               [ 1]  257 	pop	a
      0085A7 54               [ 2]  258 	srlw	x
      0085A8 24 02            [ 1]  259 	jrnc	00102$
                                    260 ;	lib/src/one-wire.c: 103: out = out | 0x80;         // place a 1
      0085AA AA 80            [ 1]  261 	or	a, #0x80
      0085AC                        262 00102$:
      0085AC 1E 01            [ 2]  263 	ldw	x, (0x01, sp)
      0085AE 5A               [ 2]  264 	decw	x
      0085AF 1F 01            [ 2]  265 	ldw	(0x01, sp), x
                                    266 ;	lib/src/one-wire.c: 100: for(i = 0; i < 8; i++){       // read in LS bit first
      0085B1 5D               [ 2]  267 	tnzw	x
      0085B2 26 EC            [ 1]  268 	jrne	00106$
                                    269 ;	lib/src/one-wire.c: 105: return out;
      0085B4 5B 02            [ 2]  270 	addw	sp, #2
      0085B6 81               [ 4]  271 	ret
                                    272 	.area CODE
                                    273 	.area INITIALIZER
                                    274 	.area CABS (ABS)
