                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.3.0 #14184 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_i2c
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _I2C_DeInit
                                     12 	.globl _I2C_Init
                                     13 	.globl _I2C_Cmd
                                     14 	.globl _I2C_GeneralCallCmd
                                     15 	.globl _I2C_GenerateSTART
                                     16 	.globl _I2C_GenerateSTOP
                                     17 	.globl _I2C_SoftwareResetCmd
                                     18 	.globl _I2C_StretchClockCmd
                                     19 	.globl _I2C_AcknowledgeConfig
                                     20 	.globl _I2C_ITConfig
                                     21 	.globl _I2C_FastModeDutyCycleConfig
                                     22 	.globl _I2C_ReceiveData
                                     23 	.globl _I2C_Send7bitAddress
                                     24 	.globl _I2C_SendData
                                     25 	.globl _I2C_CheckEvent
                                     26 	.globl _I2C_GetLastEvent
                                     27 	.globl _I2C_GetFlagStatus
                                     28 	.globl _I2C_ClearFlag
                                     29 	.globl _I2C_GetITStatus
                                     30 	.globl _I2C_ClearITPendingBit
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
                                     68 ;	lib/src/stm8s_i2c.c: 67: void I2C_DeInit(void)
                                     69 ;	-----------------------------------------
                                     70 ;	 function I2C_DeInit
                                     71 ;	-----------------------------------------
      008DC4                         72 _I2C_DeInit:
                                     73 ;	lib/src/stm8s_i2c.c: 69: I2C->CR1 = I2C_CR1_RESET_VALUE;
      008DC4 35 00 52 10      [ 1]   74 	mov	0x5210+0, #0x00
                                     75 ;	lib/src/stm8s_i2c.c: 70: I2C->CR2 = I2C_CR2_RESET_VALUE;
      008DC8 35 00 52 11      [ 1]   76 	mov	0x5211+0, #0x00
                                     77 ;	lib/src/stm8s_i2c.c: 71: I2C->FREQR = I2C_FREQR_RESET_VALUE;
      008DCC 35 00 52 12      [ 1]   78 	mov	0x5212+0, #0x00
                                     79 ;	lib/src/stm8s_i2c.c: 72: I2C->OARL = I2C_OARL_RESET_VALUE;
      008DD0 35 00 52 13      [ 1]   80 	mov	0x5213+0, #0x00
                                     81 ;	lib/src/stm8s_i2c.c: 73: I2C->OARH = I2C_OARH_RESET_VALUE;
      008DD4 35 00 52 14      [ 1]   82 	mov	0x5214+0, #0x00
                                     83 ;	lib/src/stm8s_i2c.c: 74: I2C->ITR = I2C_ITR_RESET_VALUE;
      008DD8 35 00 52 1A      [ 1]   84 	mov	0x521a+0, #0x00
                                     85 ;	lib/src/stm8s_i2c.c: 75: I2C->CCRL = I2C_CCRL_RESET_VALUE;
      008DDC 35 00 52 1B      [ 1]   86 	mov	0x521b+0, #0x00
                                     87 ;	lib/src/stm8s_i2c.c: 76: I2C->CCRH = I2C_CCRH_RESET_VALUE;
      008DE0 35 00 52 1C      [ 1]   88 	mov	0x521c+0, #0x00
                                     89 ;	lib/src/stm8s_i2c.c: 77: I2C->TRISER = I2C_TRISER_RESET_VALUE;
      008DE4 35 02 52 1D      [ 1]   90 	mov	0x521d+0, #0x02
                                     91 ;	lib/src/stm8s_i2c.c: 78: }
      008DE8 81               [ 4]   92 	ret
                                     93 ;	lib/src/stm8s_i2c.c: 96: void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
                                     94 ;	-----------------------------------------
                                     95 ;	 function I2C_Init
                                     96 ;	-----------------------------------------
      008DE9                         97 _I2C_Init:
      008DE9 52 07            [ 2]   98 	sub	sp, #7
                                     99 ;	lib/src/stm8s_i2c.c: 102: uint8_t tmpccrh = 0;
      008DEB 0F 05            [ 1]  100 	clr	(0x05, sp)
                                    101 ;	lib/src/stm8s_i2c.c: 115: I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
      008DED C6 52 12         [ 1]  102 	ld	a, 0x5212
      008DF0 A4 C0            [ 1]  103 	and	a, #0xc0
      008DF2 C7 52 12         [ 1]  104 	ld	0x5212, a
                                    105 ;	lib/src/stm8s_i2c.c: 117: I2C->FREQR |= InputClockFrequencyMHz;
      008DF5 C6 52 12         [ 1]  106 	ld	a, 0x5212
      008DF8 1A 13            [ 1]  107 	or	a, (0x13, sp)
      008DFA C7 52 12         [ 1]  108 	ld	0x5212, a
                                    109 ;	lib/src/stm8s_i2c.c: 121: I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
      008DFD 72 11 52 10      [ 1]  110 	bres	0x5210, #0
                                    111 ;	lib/src/stm8s_i2c.c: 124: I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
      008E01 C6 52 1C         [ 1]  112 	ld	a, 0x521c
      008E04 A4 30            [ 1]  113 	and	a, #0x30
      008E06 C7 52 1C         [ 1]  114 	ld	0x521c, a
                                    115 ;	lib/src/stm8s_i2c.c: 125: I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
      008E09 C6 52 1B         [ 1]  116 	ld	a, 0x521b
      008E0C 35 00 52 1B      [ 1]  117 	mov	0x521b+0, #0x00
                                    118 ;	lib/src/stm8s_i2c.c: 136: result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
      008E10 5F               [ 1]  119 	clrw	x
      008E11 7B 13            [ 1]  120 	ld	a, (0x13, sp)
      008E13 97               [ 1]  121 	ld	xl, a
      008E14 90 5F            [ 1]  122 	clrw	y
      008E16 89               [ 2]  123 	pushw	x
      008E17 90 89            [ 2]  124 	pushw	y
      008E19 4B 40            [ 1]  125 	push	#0x40
      008E1B 4B 42            [ 1]  126 	push	#0x42
      008E1D 4B 0F            [ 1]  127 	push	#0x0f
      008E1F 4B 00            [ 1]  128 	push	#0x00
      008E21 CD 92 79         [ 4]  129 	call	__mullong
      008E24 5B 08            [ 2]  130 	addw	sp, #8
      008E26 1F 03            [ 2]  131 	ldw	(0x03, sp), x
      008E28 17 01            [ 2]  132 	ldw	(0x01, sp), y
                                    133 ;	lib/src/stm8s_i2c.c: 128: if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
      008E2A AE 86 A0         [ 2]  134 	ldw	x, #0x86a0
      008E2D 13 0C            [ 2]  135 	cpw	x, (0x0c, sp)
      008E2F A6 01            [ 1]  136 	ld	a, #0x01
      008E31 12 0B            [ 1]  137 	sbc	a, (0x0b, sp)
      008E33 4F               [ 1]  138 	clr	a
      008E34 12 0A            [ 1]  139 	sbc	a, (0x0a, sp)
      008E36 24 76            [ 1]  140 	jrnc	00109$
                                    141 ;	lib/src/stm8s_i2c.c: 131: tmpccrh = I2C_CCRH_FS;
      008E38 A6 80            [ 1]  142 	ld	a, #0x80
      008E3A 6B 05            [ 1]  143 	ld	(0x05, sp), a
                                    144 ;	lib/src/stm8s_i2c.c: 133: if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
      008E3C 0D 10            [ 1]  145 	tnz	(0x10, sp)
      008E3E 26 21            [ 1]  146 	jrne	00102$
                                    147 ;	lib/src/stm8s_i2c.c: 136: result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
      008E40 1E 0C            [ 2]  148 	ldw	x, (0x0c, sp)
      008E42 89               [ 2]  149 	pushw	x
      008E43 1E 0C            [ 2]  150 	ldw	x, (0x0c, sp)
      008E45 89               [ 2]  151 	pushw	x
      008E46 4B 03            [ 1]  152 	push	#0x03
      008E48 5F               [ 1]  153 	clrw	x
      008E49 89               [ 2]  154 	pushw	x
      008E4A 4B 00            [ 1]  155 	push	#0x00
      008E4C CD 92 79         [ 4]  156 	call	__mullong
      008E4F 5B 08            [ 2]  157 	addw	sp, #8
      008E51 89               [ 2]  158 	pushw	x
      008E52 90 89            [ 2]  159 	pushw	y
      008E54 1E 07            [ 2]  160 	ldw	x, (0x07, sp)
      008E56 89               [ 2]  161 	pushw	x
      008E57 1E 07            [ 2]  162 	ldw	x, (0x07, sp)
      008E59 89               [ 2]  163 	pushw	x
      008E5A CD 92 1E         [ 4]  164 	call	__divulong
      008E5D 5B 08            [ 2]  165 	addw	sp, #8
      008E5F 20 26            [ 2]  166 	jra	00103$
      008E61                        167 00102$:
                                    168 ;	lib/src/stm8s_i2c.c: 141: result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
      008E61 1E 0C            [ 2]  169 	ldw	x, (0x0c, sp)
      008E63 89               [ 2]  170 	pushw	x
      008E64 1E 0C            [ 2]  171 	ldw	x, (0x0c, sp)
      008E66 89               [ 2]  172 	pushw	x
      008E67 4B 19            [ 1]  173 	push	#0x19
      008E69 5F               [ 1]  174 	clrw	x
      008E6A 89               [ 2]  175 	pushw	x
      008E6B 4B 00            [ 1]  176 	push	#0x00
      008E6D CD 92 79         [ 4]  177 	call	__mullong
      008E70 5B 08            [ 2]  178 	addw	sp, #8
      008E72 9F               [ 1]  179 	ld	a, xl
      008E73 88               [ 1]  180 	push	a
      008E74 9E               [ 1]  181 	ld	a, xh
      008E75 88               [ 1]  182 	push	a
      008E76 90 89            [ 2]  183 	pushw	y
      008E78 1E 07            [ 2]  184 	ldw	x, (0x07, sp)
      008E7A 89               [ 2]  185 	pushw	x
      008E7B 1E 07            [ 2]  186 	ldw	x, (0x07, sp)
      008E7D 89               [ 2]  187 	pushw	x
      008E7E CD 92 1E         [ 4]  188 	call	__divulong
      008E81 5B 08            [ 2]  189 	addw	sp, #8
                                    190 ;	lib/src/stm8s_i2c.c: 143: tmpccrh |= I2C_CCRH_DUTY;
      008E83 A6 C0            [ 1]  191 	ld	a, #0xc0
      008E85 6B 05            [ 1]  192 	ld	(0x05, sp), a
      008E87                        193 00103$:
                                    194 ;	lib/src/stm8s_i2c.c: 147: if (result < (uint16_t)0x01)
      008E87 A3 00 01         [ 2]  195 	cpw	x, #0x0001
      008E8A 24 02            [ 1]  196 	jrnc	00105$
                                    197 ;	lib/src/stm8s_i2c.c: 150: result = (uint16_t)0x0001;
      008E8C 5F               [ 1]  198 	clrw	x
      008E8D 5C               [ 1]  199 	incw	x
      008E8E                        200 00105$:
                                    201 ;	lib/src/stm8s_i2c.c: 156: tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
      008E8E 7B 13            [ 1]  202 	ld	a, (0x13, sp)
      008E90 6B 07            [ 1]  203 	ld	(0x07, sp), a
      008E92 0F 06            [ 1]  204 	clr	(0x06, sp)
      008E94 89               [ 2]  205 	pushw	x
      008E95 1E 08            [ 2]  206 	ldw	x, (0x08, sp)
      008E97 58               [ 2]  207 	sllw	x
      008E98 72 FB 08         [ 2]  208 	addw	x, (0x08, sp)
      008E9B 51               [ 1]  209 	exgw	x, y
      008E9C 4B 0A            [ 1]  210 	push	#0x0a
      008E9E 4B 00            [ 1]  211 	push	#0x00
      008EA0 93               [ 1]  212 	ldw	x, y
      008EA1 CD 92 F5         [ 4]  213 	call	__divsint
      008EA4 90 93            [ 1]  214 	ldw	y, x
      008EA6 9F               [ 1]  215 	ld	a, xl
      008EA7 85               [ 2]  216 	popw	x
      008EA8 4C               [ 1]  217 	inc	a
                                    218 ;	lib/src/stm8s_i2c.c: 157: I2C->TRISER = (uint8_t)tmpval;
      008EA9 C7 52 1D         [ 1]  219 	ld	0x521d, a
      008EAC 20 23            [ 2]  220 	jra	00110$
      008EAE                        221 00109$:
                                    222 ;	lib/src/stm8s_i2c.c: 164: result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
      008EAE 1E 0C            [ 2]  223 	ldw	x, (0x0c, sp)
      008EB0 16 0A            [ 2]  224 	ldw	y, (0x0a, sp)
      008EB2 58               [ 2]  225 	sllw	x
      008EB3 90 59            [ 2]  226 	rlcw	y
      008EB5 89               [ 2]  227 	pushw	x
      008EB6 90 89            [ 2]  228 	pushw	y
      008EB8 1E 07            [ 2]  229 	ldw	x, (0x07, sp)
      008EBA 89               [ 2]  230 	pushw	x
      008EBB 1E 07            [ 2]  231 	ldw	x, (0x07, sp)
      008EBD 89               [ 2]  232 	pushw	x
      008EBE CD 92 1E         [ 4]  233 	call	__divulong
      008EC1 5B 08            [ 2]  234 	addw	sp, #8
                                    235 ;	lib/src/stm8s_i2c.c: 167: if (result < (uint16_t)0x0004)
      008EC3 A3 00 04         [ 2]  236 	cpw	x, #0x0004
      008EC6 24 03            [ 1]  237 	jrnc	00107$
                                    238 ;	lib/src/stm8s_i2c.c: 170: result = (uint16_t)0x0004;
      008EC8 AE 00 04         [ 2]  239 	ldw	x, #0x0004
      008ECB                        240 00107$:
                                    241 ;	lib/src/stm8s_i2c.c: 176: I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
      008ECB 7B 13            [ 1]  242 	ld	a, (0x13, sp)
      008ECD 4C               [ 1]  243 	inc	a
      008ECE C7 52 1D         [ 1]  244 	ld	0x521d, a
      008ED1                        245 00110$:
                                    246 ;	lib/src/stm8s_i2c.c: 181: I2C->CCRL = (uint8_t)result;
      008ED1 9F               [ 1]  247 	ld	a, xl
      008ED2 C7 52 1B         [ 1]  248 	ld	0x521b, a
                                    249 ;	lib/src/stm8s_i2c.c: 182: I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
      008ED5 9E               [ 1]  250 	ld	a, xh
      008ED6 A4 0F            [ 1]  251 	and	a, #0x0f
      008ED8 1A 05            [ 1]  252 	or	a, (0x05, sp)
      008EDA C7 52 1C         [ 1]  253 	ld	0x521c, a
                                    254 ;	lib/src/stm8s_i2c.c: 185: I2C->CR1 |= I2C_CR1_PE;
      008EDD 72 10 52 10      [ 1]  255 	bset	0x5210, #0
                                    256 ;	lib/src/stm8s_i2c.c: 188: I2C_AcknowledgeConfig(Ack);
      008EE1 7B 11            [ 1]  257 	ld	a, (0x11, sp)
      008EE3 CD 8F A5         [ 4]  258 	call	_I2C_AcknowledgeConfig
                                    259 ;	lib/src/stm8s_i2c.c: 201: I2C->OARL = (uint8_t)(AddMode == I2C_ADDMODE_7BIT ? (OwnAddress<<1) : OwnAddress);
      008EE6 0D 12            [ 1]  260 	tnz	(0x12, sp)
      008EE8 26 0A            [ 1]  261 	jrne	00113$
      008EEA 7B 0F            [ 1]  262 	ld	a, (0x0f, sp)
      008EEC 48               [ 1]  263 	sll	a
      008EED 97               [ 1]  264 	ld	xl, a
      008EEE 49               [ 1]  265 	rlc	a
      008EEF 4F               [ 1]  266 	clr	a
      008EF0 A2 00            [ 1]  267 	sbc	a, #0x00
      008EF2 95               [ 1]  268 	ld	xh, a
      008EF3 C5                     269 	.byte 0xc5
      008EF4                        270 00113$:
      008EF4 1E 0E            [ 2]  271 	ldw	x, (0x0e, sp)
      008EF6                        272 00114$:
      008EF6 9F               [ 1]  273 	ld	a, xl
      008EF7 C7 52 13         [ 1]  274 	ld	0x5213, a
                                    275 ;	lib/src/stm8s_i2c.c: 202: I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
      008EFA 7B 12            [ 1]  276 	ld	a, (0x12, sp)
      008EFC AA 40            [ 1]  277 	or	a, #0x40
      008EFE 6B 07            [ 1]  278 	ld	(0x07, sp), a
                                    279 ;	lib/src/stm8s_i2c.c: 203: (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
      008F00 4F               [ 1]  280 	clr	a
      008F01 97               [ 1]  281 	ld	xl, a
      008F02 7B 0E            [ 1]  282 	ld	a, (0x0e, sp)
      008F04 A4 03            [ 1]  283 	and	a, #0x03
      008F06 95               [ 1]  284 	ld	xh, a
      008F07 A6 80            [ 1]  285 	ld	a, #0x80
      008F09 62               [ 2]  286 	div	x, a
      008F0A 9F               [ 1]  287 	ld	a, xl
      008F0B 1A 07            [ 1]  288 	or	a, (0x07, sp)
      008F0D C7 52 14         [ 1]  289 	ld	0x5214, a
                                    290 ;	lib/src/stm8s_i2c.c: 204: }
      008F10 1E 08            [ 2]  291 	ldw	x, (8, sp)
      008F12 5B 13            [ 2]  292 	addw	sp, #19
      008F14 FC               [ 2]  293 	jp	(x)
                                    294 ;	lib/src/stm8s_i2c.c: 212: void I2C_Cmd(FunctionalState NewState)
                                    295 ;	-----------------------------------------
                                    296 ;	 function I2C_Cmd
                                    297 ;	-----------------------------------------
      008F15                        298 _I2C_Cmd:
      008F15 88               [ 1]  299 	push	a
      008F16 6B 01            [ 1]  300 	ld	(0x01, sp), a
                                    301 ;	lib/src/stm8s_i2c.c: 220: I2C->CR1 |= I2C_CR1_PE;
      008F18 C6 52 10         [ 1]  302 	ld	a, 0x5210
                                    303 ;	lib/src/stm8s_i2c.c: 217: if (NewState != DISABLE)
      008F1B 0D 01            [ 1]  304 	tnz	(0x01, sp)
      008F1D 27 07            [ 1]  305 	jreq	00102$
                                    306 ;	lib/src/stm8s_i2c.c: 220: I2C->CR1 |= I2C_CR1_PE;
      008F1F AA 01            [ 1]  307 	or	a, #0x01
      008F21 C7 52 10         [ 1]  308 	ld	0x5210, a
      008F24 20 05            [ 2]  309 	jra	00104$
      008F26                        310 00102$:
                                    311 ;	lib/src/stm8s_i2c.c: 225: I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
      008F26 A4 FE            [ 1]  312 	and	a, #0xfe
      008F28 C7 52 10         [ 1]  313 	ld	0x5210, a
      008F2B                        314 00104$:
                                    315 ;	lib/src/stm8s_i2c.c: 227: }
      008F2B 84               [ 1]  316 	pop	a
      008F2C 81               [ 4]  317 	ret
                                    318 ;	lib/src/stm8s_i2c.c: 235: void I2C_GeneralCallCmd(FunctionalState NewState)
                                    319 ;	-----------------------------------------
                                    320 ;	 function I2C_GeneralCallCmd
                                    321 ;	-----------------------------------------
      008F2D                        322 _I2C_GeneralCallCmd:
      008F2D 88               [ 1]  323 	push	a
      008F2E 6B 01            [ 1]  324 	ld	(0x01, sp), a
                                    325 ;	lib/src/stm8s_i2c.c: 243: I2C->CR1 |= I2C_CR1_ENGC;
      008F30 C6 52 10         [ 1]  326 	ld	a, 0x5210
                                    327 ;	lib/src/stm8s_i2c.c: 240: if (NewState != DISABLE)
      008F33 0D 01            [ 1]  328 	tnz	(0x01, sp)
      008F35 27 07            [ 1]  329 	jreq	00102$
                                    330 ;	lib/src/stm8s_i2c.c: 243: I2C->CR1 |= I2C_CR1_ENGC;
      008F37 AA 40            [ 1]  331 	or	a, #0x40
      008F39 C7 52 10         [ 1]  332 	ld	0x5210, a
      008F3C 20 05            [ 2]  333 	jra	00104$
      008F3E                        334 00102$:
                                    335 ;	lib/src/stm8s_i2c.c: 248: I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
      008F3E A4 BF            [ 1]  336 	and	a, #0xbf
      008F40 C7 52 10         [ 1]  337 	ld	0x5210, a
      008F43                        338 00104$:
                                    339 ;	lib/src/stm8s_i2c.c: 250: }
      008F43 84               [ 1]  340 	pop	a
      008F44 81               [ 4]  341 	ret
                                    342 ;	lib/src/stm8s_i2c.c: 260: void I2C_GenerateSTART(FunctionalState NewState)
                                    343 ;	-----------------------------------------
                                    344 ;	 function I2C_GenerateSTART
                                    345 ;	-----------------------------------------
      008F45                        346 _I2C_GenerateSTART:
      008F45 88               [ 1]  347 	push	a
      008F46 6B 01            [ 1]  348 	ld	(0x01, sp), a
                                    349 ;	lib/src/stm8s_i2c.c: 268: I2C->CR2 |= I2C_CR2_START;
      008F48 C6 52 11         [ 1]  350 	ld	a, 0x5211
                                    351 ;	lib/src/stm8s_i2c.c: 265: if (NewState != DISABLE)
      008F4B 0D 01            [ 1]  352 	tnz	(0x01, sp)
      008F4D 27 07            [ 1]  353 	jreq	00102$
                                    354 ;	lib/src/stm8s_i2c.c: 268: I2C->CR2 |= I2C_CR2_START;
      008F4F AA 01            [ 1]  355 	or	a, #0x01
      008F51 C7 52 11         [ 1]  356 	ld	0x5211, a
      008F54 20 05            [ 2]  357 	jra	00104$
      008F56                        358 00102$:
                                    359 ;	lib/src/stm8s_i2c.c: 273: I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
      008F56 A4 FE            [ 1]  360 	and	a, #0xfe
      008F58 C7 52 11         [ 1]  361 	ld	0x5211, a
      008F5B                        362 00104$:
                                    363 ;	lib/src/stm8s_i2c.c: 275: }
      008F5B 84               [ 1]  364 	pop	a
      008F5C 81               [ 4]  365 	ret
                                    366 ;	lib/src/stm8s_i2c.c: 283: void I2C_GenerateSTOP(FunctionalState NewState)
                                    367 ;	-----------------------------------------
                                    368 ;	 function I2C_GenerateSTOP
                                    369 ;	-----------------------------------------
      008F5D                        370 _I2C_GenerateSTOP:
      008F5D 88               [ 1]  371 	push	a
      008F5E 6B 01            [ 1]  372 	ld	(0x01, sp), a
                                    373 ;	lib/src/stm8s_i2c.c: 291: I2C->CR2 |= I2C_CR2_STOP;
      008F60 C6 52 11         [ 1]  374 	ld	a, 0x5211
                                    375 ;	lib/src/stm8s_i2c.c: 288: if (NewState != DISABLE)
      008F63 0D 01            [ 1]  376 	tnz	(0x01, sp)
      008F65 27 07            [ 1]  377 	jreq	00102$
                                    378 ;	lib/src/stm8s_i2c.c: 291: I2C->CR2 |= I2C_CR2_STOP;
      008F67 AA 02            [ 1]  379 	or	a, #0x02
      008F69 C7 52 11         [ 1]  380 	ld	0x5211, a
      008F6C 20 05            [ 2]  381 	jra	00104$
      008F6E                        382 00102$:
                                    383 ;	lib/src/stm8s_i2c.c: 296: I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
      008F6E A4 FD            [ 1]  384 	and	a, #0xfd
      008F70 C7 52 11         [ 1]  385 	ld	0x5211, a
      008F73                        386 00104$:
                                    387 ;	lib/src/stm8s_i2c.c: 298: }
      008F73 84               [ 1]  388 	pop	a
      008F74 81               [ 4]  389 	ret
                                    390 ;	lib/src/stm8s_i2c.c: 306: void I2C_SoftwareResetCmd(FunctionalState NewState)
                                    391 ;	-----------------------------------------
                                    392 ;	 function I2C_SoftwareResetCmd
                                    393 ;	-----------------------------------------
      008F75                        394 _I2C_SoftwareResetCmd:
      008F75 88               [ 1]  395 	push	a
      008F76 6B 01            [ 1]  396 	ld	(0x01, sp), a
                                    397 ;	lib/src/stm8s_i2c.c: 314: I2C->CR2 |= I2C_CR2_SWRST;
      008F78 C6 52 11         [ 1]  398 	ld	a, 0x5211
                                    399 ;	lib/src/stm8s_i2c.c: 311: if (NewState != DISABLE)
      008F7B 0D 01            [ 1]  400 	tnz	(0x01, sp)
      008F7D 27 07            [ 1]  401 	jreq	00102$
                                    402 ;	lib/src/stm8s_i2c.c: 314: I2C->CR2 |= I2C_CR2_SWRST;
      008F7F AA 80            [ 1]  403 	or	a, #0x80
      008F81 C7 52 11         [ 1]  404 	ld	0x5211, a
      008F84 20 05            [ 2]  405 	jra	00104$
      008F86                        406 00102$:
                                    407 ;	lib/src/stm8s_i2c.c: 319: I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
      008F86 A4 7F            [ 1]  408 	and	a, #0x7f
      008F88 C7 52 11         [ 1]  409 	ld	0x5211, a
      008F8B                        410 00104$:
                                    411 ;	lib/src/stm8s_i2c.c: 321: }
      008F8B 84               [ 1]  412 	pop	a
      008F8C 81               [ 4]  413 	ret
                                    414 ;	lib/src/stm8s_i2c.c: 330: void I2C_StretchClockCmd(FunctionalState NewState)
                                    415 ;	-----------------------------------------
                                    416 ;	 function I2C_StretchClockCmd
                                    417 ;	-----------------------------------------
      008F8D                        418 _I2C_StretchClockCmd:
      008F8D 88               [ 1]  419 	push	a
      008F8E 6B 01            [ 1]  420 	ld	(0x01, sp), a
                                    421 ;	lib/src/stm8s_i2c.c: 338: I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
      008F90 C6 52 10         [ 1]  422 	ld	a, 0x5210
                                    423 ;	lib/src/stm8s_i2c.c: 335: if (NewState != DISABLE)
      008F93 0D 01            [ 1]  424 	tnz	(0x01, sp)
      008F95 27 07            [ 1]  425 	jreq	00102$
                                    426 ;	lib/src/stm8s_i2c.c: 338: I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
      008F97 A4 7F            [ 1]  427 	and	a, #0x7f
      008F99 C7 52 10         [ 1]  428 	ld	0x5210, a
      008F9C 20 05            [ 2]  429 	jra	00104$
      008F9E                        430 00102$:
                                    431 ;	lib/src/stm8s_i2c.c: 344: I2C->CR1 |= I2C_CR1_NOSTRETCH;
      008F9E AA 80            [ 1]  432 	or	a, #0x80
      008FA0 C7 52 10         [ 1]  433 	ld	0x5210, a
      008FA3                        434 00104$:
                                    435 ;	lib/src/stm8s_i2c.c: 346: }
      008FA3 84               [ 1]  436 	pop	a
      008FA4 81               [ 4]  437 	ret
                                    438 ;	lib/src/stm8s_i2c.c: 355: void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
                                    439 ;	-----------------------------------------
                                    440 ;	 function I2C_AcknowledgeConfig
                                    441 ;	-----------------------------------------
      008FA5                        442 _I2C_AcknowledgeConfig:
      008FA5 97               [ 1]  443 	ld	xl, a
                                    444 ;	lib/src/stm8s_i2c.c: 363: I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
      008FA6 C6 52 11         [ 1]  445 	ld	a, 0x5211
                                    446 ;	lib/src/stm8s_i2c.c: 360: if (Ack == I2C_ACK_NONE)
      008FA9 41               [ 1]  447 	exg	a, xl
      008FAA 4D               [ 1]  448 	tnz	a
      008FAB 41               [ 1]  449 	exg	a, xl
      008FAC 26 06            [ 1]  450 	jrne	00105$
                                    451 ;	lib/src/stm8s_i2c.c: 363: I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
      008FAE A4 FB            [ 1]  452 	and	a, #0xfb
      008FB0 C7 52 11         [ 1]  453 	ld	0x5211, a
      008FB3 81               [ 4]  454 	ret
      008FB4                        455 00105$:
                                    456 ;	lib/src/stm8s_i2c.c: 368: I2C->CR2 |= I2C_CR2_ACK;
      008FB4 AA 04            [ 1]  457 	or	a, #0x04
      008FB6 C7 52 11         [ 1]  458 	ld	0x5211, a
                                    459 ;	lib/src/stm8s_i2c.c: 363: I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
      008FB9 C6 52 11         [ 1]  460 	ld	a, 0x5211
                                    461 ;	lib/src/stm8s_i2c.c: 370: if (Ack == I2C_ACK_CURR)
      008FBC 88               [ 1]  462 	push	a
      008FBD 9F               [ 1]  463 	ld	a, xl
      008FBE 4A               [ 1]  464 	dec	a
      008FBF 84               [ 1]  465 	pop	a
      008FC0 26 06            [ 1]  466 	jrne	00102$
                                    467 ;	lib/src/stm8s_i2c.c: 373: I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
      008FC2 A4 F7            [ 1]  468 	and	a, #0xf7
      008FC4 C7 52 11         [ 1]  469 	ld	0x5211, a
      008FC7 81               [ 4]  470 	ret
      008FC8                        471 00102$:
                                    472 ;	lib/src/stm8s_i2c.c: 378: I2C->CR2 |= I2C_CR2_POS;
      008FC8 AA 08            [ 1]  473 	or	a, #0x08
      008FCA C7 52 11         [ 1]  474 	ld	0x5211, a
                                    475 ;	lib/src/stm8s_i2c.c: 381: }
      008FCD 81               [ 4]  476 	ret
                                    477 ;	lib/src/stm8s_i2c.c: 391: void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
                                    478 ;	-----------------------------------------
                                    479 ;	 function I2C_ITConfig
                                    480 ;	-----------------------------------------
      008FCE                        481 _I2C_ITConfig:
      008FCE 88               [ 1]  482 	push	a
                                    483 ;	lib/src/stm8s_i2c.c: 400: I2C->ITR |= (uint8_t)I2C_IT;
      008FCF AE 52 1A         [ 2]  484 	ldw	x, #0x521a
      008FD2 88               [ 1]  485 	push	a
      008FD3 F6               [ 1]  486 	ld	a, (x)
      008FD4 6B 02            [ 1]  487 	ld	(0x02, sp), a
      008FD6 84               [ 1]  488 	pop	a
                                    489 ;	lib/src/stm8s_i2c.c: 397: if (NewState != DISABLE)
      008FD7 0D 04            [ 1]  490 	tnz	(0x04, sp)
      008FD9 27 07            [ 1]  491 	jreq	00102$
                                    492 ;	lib/src/stm8s_i2c.c: 400: I2C->ITR |= (uint8_t)I2C_IT;
      008FDB 1A 01            [ 1]  493 	or	a, (0x01, sp)
      008FDD C7 52 1A         [ 1]  494 	ld	0x521a, a
      008FE0 20 06            [ 2]  495 	jra	00104$
      008FE2                        496 00102$:
                                    497 ;	lib/src/stm8s_i2c.c: 405: I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
      008FE2 43               [ 1]  498 	cpl	a
      008FE3 14 01            [ 1]  499 	and	a, (0x01, sp)
      008FE5 C7 52 1A         [ 1]  500 	ld	0x521a, a
      008FE8                        501 00104$:
                                    502 ;	lib/src/stm8s_i2c.c: 407: }
      008FE8 84               [ 1]  503 	pop	a
      008FE9 85               [ 2]  504 	popw	x
      008FEA 84               [ 1]  505 	pop	a
      008FEB FC               [ 2]  506 	jp	(x)
                                    507 ;	lib/src/stm8s_i2c.c: 415: void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
                                    508 ;	-----------------------------------------
                                    509 ;	 function I2C_FastModeDutyCycleConfig
                                    510 ;	-----------------------------------------
      008FEC                        511 _I2C_FastModeDutyCycleConfig:
      008FEC 97               [ 1]  512 	ld	xl, a
                                    513 ;	lib/src/stm8s_i2c.c: 423: I2C->CCRH |= I2C_CCRH_DUTY;
      008FED C6 52 1C         [ 1]  514 	ld	a, 0x521c
                                    515 ;	lib/src/stm8s_i2c.c: 420: if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
      008FF0 88               [ 1]  516 	push	a
      008FF1 9F               [ 1]  517 	ld	a, xl
      008FF2 A1 40            [ 1]  518 	cp	a, #0x40
      008FF4 84               [ 1]  519 	pop	a
      008FF5 26 06            [ 1]  520 	jrne	00102$
                                    521 ;	lib/src/stm8s_i2c.c: 423: I2C->CCRH |= I2C_CCRH_DUTY;
      008FF7 AA 40            [ 1]  522 	or	a, #0x40
      008FF9 C7 52 1C         [ 1]  523 	ld	0x521c, a
      008FFC 81               [ 4]  524 	ret
      008FFD                        525 00102$:
                                    526 ;	lib/src/stm8s_i2c.c: 428: I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
      008FFD A4 BF            [ 1]  527 	and	a, #0xbf
      008FFF C7 52 1C         [ 1]  528 	ld	0x521c, a
                                    529 ;	lib/src/stm8s_i2c.c: 430: }
      009002 81               [ 4]  530 	ret
                                    531 ;	lib/src/stm8s_i2c.c: 437: uint8_t I2C_ReceiveData(void)
                                    532 ;	-----------------------------------------
                                    533 ;	 function I2C_ReceiveData
                                    534 ;	-----------------------------------------
      009003                        535 _I2C_ReceiveData:
                                    536 ;	lib/src/stm8s_i2c.c: 440: return ((uint8_t)I2C->DR);
      009003 C6 52 16         [ 1]  537 	ld	a, 0x5216
                                    538 ;	lib/src/stm8s_i2c.c: 441: }
      009006 81               [ 4]  539 	ret
                                    540 ;	lib/src/stm8s_i2c.c: 450: void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
                                    541 ;	-----------------------------------------
                                    542 ;	 function I2C_Send7bitAddress
                                    543 ;	-----------------------------------------
      009007                        544 _I2C_Send7bitAddress:
      009007 88               [ 1]  545 	push	a
                                    546 ;	lib/src/stm8s_i2c.c: 457: Address &= (uint8_t)0xFE;
      009008 A4 FE            [ 1]  547 	and	a, #0xfe
      00900A 6B 01            [ 1]  548 	ld	(0x01, sp), a
                                    549 ;	lib/src/stm8s_i2c.c: 460: I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
      00900C 7B 04            [ 1]  550 	ld	a, (0x04, sp)
      00900E 1A 01            [ 1]  551 	or	a, (0x01, sp)
      009010 C7 52 16         [ 1]  552 	ld	0x5216, a
                                    553 ;	lib/src/stm8s_i2c.c: 461: }
      009013 84               [ 1]  554 	pop	a
      009014 85               [ 2]  555 	popw	x
      009015 84               [ 1]  556 	pop	a
      009016 FC               [ 2]  557 	jp	(x)
                                    558 ;	lib/src/stm8s_i2c.c: 468: void I2C_SendData(uint8_t Data)
                                    559 ;	-----------------------------------------
                                    560 ;	 function I2C_SendData
                                    561 ;	-----------------------------------------
      009017                        562 _I2C_SendData:
                                    563 ;	lib/src/stm8s_i2c.c: 471: I2C->DR = Data;
      009017 C7 52 16         [ 1]  564 	ld	0x5216, a
                                    565 ;	lib/src/stm8s_i2c.c: 472: }
      00901A 81               [ 4]  566 	ret
                                    567 ;	lib/src/stm8s_i2c.c: 588: ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
                                    568 ;	-----------------------------------------
                                    569 ;	 function I2C_CheckEvent
                                    570 ;	-----------------------------------------
      00901B                        571 _I2C_CheckEvent:
      00901B 52 08            [ 2]  572 	sub	sp, #8
                                    573 ;	lib/src/stm8s_i2c.c: 590: __IO uint16_t lastevent = 0x00;
      00901D 0F 02            [ 1]  574 	clr	(0x02, sp)
      00901F 0F 01            [ 1]  575 	clr	(0x01, sp)
                                    576 ;	lib/src/stm8s_i2c.c: 598: if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
      009021 1F 03            [ 2]  577 	ldw	(0x03, sp), x
      009023 A3 00 04         [ 2]  578 	cpw	x, #0x0004
      009026 26 0B            [ 1]  579 	jrne	00102$
                                    580 ;	lib/src/stm8s_i2c.c: 600: lastevent = I2C->SR2 & I2C_SR2_AF;
      009028 C6 52 18         [ 1]  581 	ld	a, 0x5218
      00902B A4 04            [ 1]  582 	and	a, #0x04
      00902D 5F               [ 1]  583 	clrw	x
      00902E 97               [ 1]  584 	ld	xl, a
      00902F 1F 01            [ 2]  585 	ldw	(0x01, sp), x
      009031 20 15            [ 2]  586 	jra	00103$
      009033                        587 00102$:
                                    588 ;	lib/src/stm8s_i2c.c: 604: flag1 = I2C->SR1;
      009033 C6 52 17         [ 1]  589 	ld	a, 0x5217
      009036 97               [ 1]  590 	ld	xl, a
                                    591 ;	lib/src/stm8s_i2c.c: 605: flag2 = I2C->SR3;
      009037 C6 52 19         [ 1]  592 	ld	a, 0x5219
                                    593 ;	lib/src/stm8s_i2c.c: 606: lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
      00903A 95               [ 1]  594 	ld	xh, a
      00903B 0F 06            [ 1]  595 	clr	(0x06, sp)
      00903D 9F               [ 1]  596 	ld	a, xl
      00903E 0F 07            [ 1]  597 	clr	(0x07, sp)
      009040 1A 06            [ 1]  598 	or	a, (0x06, sp)
      009042 02               [ 1]  599 	rlwa	x
      009043 1A 07            [ 1]  600 	or	a, (0x07, sp)
      009045 95               [ 1]  601 	ld	xh, a
      009046 1F 01            [ 2]  602 	ldw	(0x01, sp), x
      009048                        603 00103$:
                                    604 ;	lib/src/stm8s_i2c.c: 609: if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
      009048 7B 02            [ 1]  605 	ld	a, (0x02, sp)
      00904A 14 04            [ 1]  606 	and	a, (0x04, sp)
      00904C 97               [ 1]  607 	ld	xl, a
      00904D 7B 01            [ 1]  608 	ld	a, (0x01, sp)
      00904F 14 03            [ 1]  609 	and	a, (0x03, sp)
      009051 95               [ 1]  610 	ld	xh, a
      009052 13 03            [ 2]  611 	cpw	x, (0x03, sp)
      009054 26 03            [ 1]  612 	jrne	00105$
                                    613 ;	lib/src/stm8s_i2c.c: 612: status = SUCCESS;
      009056 A6 01            [ 1]  614 	ld	a, #0x01
                                    615 ;	lib/src/stm8s_i2c.c: 617: status = ERROR;
      009058 21                     616 	.byte 0x21
      009059                        617 00105$:
      009059 4F               [ 1]  618 	clr	a
      00905A                        619 00106$:
                                    620 ;	lib/src/stm8s_i2c.c: 621: return status;
                                    621 ;	lib/src/stm8s_i2c.c: 622: }
      00905A 5B 08            [ 2]  622 	addw	sp, #8
      00905C 81               [ 4]  623 	ret
                                    624 ;	lib/src/stm8s_i2c.c: 638: I2C_Event_TypeDef I2C_GetLastEvent(void)
                                    625 ;	-----------------------------------------
                                    626 ;	 function I2C_GetLastEvent
                                    627 ;	-----------------------------------------
      00905D                        628 _I2C_GetLastEvent:
      00905D 52 04            [ 2]  629 	sub	sp, #4
                                    630 ;	lib/src/stm8s_i2c.c: 640: __IO uint16_t lastevent = 0;
      00905F 5F               [ 1]  631 	clrw	x
      009060 1F 01            [ 2]  632 	ldw	(0x01, sp), x
                                    633 ;	lib/src/stm8s_i2c.c: 644: if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
      009062 72 05 52 18 07   [ 2]  634 	btjf	0x5218, #2, 00102$
                                    635 ;	lib/src/stm8s_i2c.c: 646: lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
      009067 AE 00 04         [ 2]  636 	ldw	x, #0x0004
      00906A 1F 01            [ 2]  637 	ldw	(0x01, sp), x
      00906C 20 13            [ 2]  638 	jra	00103$
      00906E                        639 00102$:
                                    640 ;	lib/src/stm8s_i2c.c: 651: flag1 = I2C->SR1;
      00906E C6 52 17         [ 1]  641 	ld	a, 0x5217
      009071 6B 04            [ 1]  642 	ld	(0x04, sp), a
      009073 0F 03            [ 1]  643 	clr	(0x03, sp)
                                    644 ;	lib/src/stm8s_i2c.c: 652: flag2 = I2C->SR3;
      009075 C6 52 19         [ 1]  645 	ld	a, 0x5219
                                    646 ;	lib/src/stm8s_i2c.c: 655: lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
      009078 95               [ 1]  647 	ld	xh, a
      009079 7B 04            [ 1]  648 	ld	a, (0x04, sp)
      00907B 02               [ 1]  649 	rlwa	x
      00907C 1A 03            [ 1]  650 	or	a, (0x03, sp)
      00907E 95               [ 1]  651 	ld	xh, a
      00907F 1F 01            [ 2]  652 	ldw	(0x01, sp), x
      009081                        653 00103$:
                                    654 ;	lib/src/stm8s_i2c.c: 658: return (I2C_Event_TypeDef)lastevent;
      009081 1E 01            [ 2]  655 	ldw	x, (0x01, sp)
                                    656 ;	lib/src/stm8s_i2c.c: 659: }
      009083 5B 04            [ 2]  657 	addw	sp, #4
      009085 81               [ 4]  658 	ret
                                    659 ;	lib/src/stm8s_i2c.c: 689: FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
                                    660 ;	-----------------------------------------
                                    661 ;	 function I2C_GetFlagStatus
                                    662 ;	-----------------------------------------
      009086                        663 _I2C_GetFlagStatus:
      009086 88               [ 1]  664 	push	a
                                    665 ;	lib/src/stm8s_i2c.c: 691: uint8_t tempreg = 0;
      009087 0F 01            [ 1]  666 	clr	(0x01, sp)
                                    667 ;	lib/src/stm8s_i2c.c: 699: regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
      009089 9E               [ 1]  668 	ld	a, xh
                                    669 ;	lib/src/stm8s_i2c.c: 701: switch (regindex)
      00908A A1 01            [ 1]  670 	cp	a, #0x01
      00908C 27 0A            [ 1]  671 	jreq	00101$
      00908E A1 02            [ 1]  672 	cp	a, #0x02
      009090 27 0D            [ 1]  673 	jreq	00102$
      009092 A1 03            [ 1]  674 	cp	a, #0x03
      009094 27 10            [ 1]  675 	jreq	00103$
      009096 20 13            [ 2]  676 	jra	00105$
                                    677 ;	lib/src/stm8s_i2c.c: 704: case 0x01:
      009098                        678 00101$:
                                    679 ;	lib/src/stm8s_i2c.c: 705: tempreg = (uint8_t)I2C->SR1;
      009098 C6 52 17         [ 1]  680 	ld	a, 0x5217
      00909B 6B 01            [ 1]  681 	ld	(0x01, sp), a
                                    682 ;	lib/src/stm8s_i2c.c: 706: break;
      00909D 20 0C            [ 2]  683 	jra	00105$
                                    684 ;	lib/src/stm8s_i2c.c: 709: case 0x02:
      00909F                        685 00102$:
                                    686 ;	lib/src/stm8s_i2c.c: 710: tempreg = (uint8_t)I2C->SR2;
      00909F C6 52 18         [ 1]  687 	ld	a, 0x5218
      0090A2 6B 01            [ 1]  688 	ld	(0x01, sp), a
                                    689 ;	lib/src/stm8s_i2c.c: 711: break;
      0090A4 20 05            [ 2]  690 	jra	00105$
                                    691 ;	lib/src/stm8s_i2c.c: 714: case 0x03:
      0090A6                        692 00103$:
                                    693 ;	lib/src/stm8s_i2c.c: 715: tempreg = (uint8_t)I2C->SR3;
      0090A6 C6 52 19         [ 1]  694 	ld	a, 0x5219
      0090A9 6B 01            [ 1]  695 	ld	(0x01, sp), a
                                    696 ;	lib/src/stm8s_i2c.c: 720: }
      0090AB                        697 00105$:
                                    698 ;	lib/src/stm8s_i2c.c: 723: if ((tempreg & (uint8_t)I2C_Flag ) != 0)
      0090AB 9F               [ 1]  699 	ld	a, xl
      0090AC 14 01            [ 1]  700 	and	a, (0x01, sp)
      0090AE 27 03            [ 1]  701 	jreq	00107$
                                    702 ;	lib/src/stm8s_i2c.c: 726: bitstatus = SET;
      0090B0 A6 01            [ 1]  703 	ld	a, #0x01
                                    704 ;	lib/src/stm8s_i2c.c: 731: bitstatus = RESET;
      0090B2 21                     705 	.byte 0x21
      0090B3                        706 00107$:
      0090B3 4F               [ 1]  707 	clr	a
      0090B4                        708 00108$:
                                    709 ;	lib/src/stm8s_i2c.c: 734: return bitstatus;
                                    710 ;	lib/src/stm8s_i2c.c: 735: }
      0090B4 5B 01            [ 2]  711 	addw	sp, #1
      0090B6 81               [ 4]  712 	ret
                                    713 ;	lib/src/stm8s_i2c.c: 769: void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
                                    714 ;	-----------------------------------------
                                    715 ;	 function I2C_ClearFlag
                                    716 ;	-----------------------------------------
      0090B7                        717 _I2C_ClearFlag:
                                    718 ;	lib/src/stm8s_i2c.c: 776: flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
      0090B7 4F               [ 1]  719 	clr	a
      0090B8 95               [ 1]  720 	ld	xh, a
                                    721 ;	lib/src/stm8s_i2c.c: 778: I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
      0090B9 53               [ 2]  722 	cplw	x
      0090BA 9F               [ 1]  723 	ld	a, xl
      0090BB C7 52 18         [ 1]  724 	ld	0x5218, a
                                    725 ;	lib/src/stm8s_i2c.c: 779: }
      0090BE 81               [ 4]  726 	ret
                                    727 ;	lib/src/stm8s_i2c.c: 801: ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
                                    728 ;	-----------------------------------------
                                    729 ;	 function I2C_GetITStatus
                                    730 ;	-----------------------------------------
      0090BF                        731 _I2C_GetITStatus:
      0090BF 52 04            [ 2]  732 	sub	sp, #4
      0090C1 51               [ 1]  733 	exgw	x, y
                                    734 ;	lib/src/stm8s_i2c.c: 804: __IO uint8_t enablestatus = 0;
      0090C2 0F 03            [ 1]  735 	clr	(0x03, sp)
                                    736 ;	lib/src/stm8s_i2c.c: 810: tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
      0090C4 93               [ 1]  737 	ldw	x, y
      0090C5 0F 02            [ 1]  738 	clr	(0x02, sp)
      0090C7 9E               [ 1]  739 	ld	a, xh
      0090C8 A4 07            [ 1]  740 	and	a, #0x07
      0090CA 6B 04            [ 1]  741 	ld	(0x04, sp), a
                                    742 ;	lib/src/stm8s_i2c.c: 813: enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
      0090CC C6 52 1A         [ 1]  743 	ld	a, 0x521a
      0090CF 14 04            [ 1]  744 	and	a, (0x04, sp)
      0090D1 6B 03            [ 1]  745 	ld	(0x03, sp), a
                                    746 ;	lib/src/stm8s_i2c.c: 815: if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
      0090D3 4F               [ 1]  747 	clr	a
      0090D4 02               [ 1]  748 	rlwa	x
      0090D5 A4 30            [ 1]  749 	and	a, #0x30
                                    750 ;	lib/src/stm8s_i2c.c: 818: if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
      0090D7 61               [ 1]  751 	exg	a, yl
      0090D8 6B 04            [ 1]  752 	ld	(0x04, sp), a
      0090DA 61               [ 1]  753 	exg	a, yl
                                    754 ;	lib/src/stm8s_i2c.c: 815: if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
      0090DB 95               [ 1]  755 	ld	xh, a
      0090DC A3 01 00         [ 2]  756 	cpw	x, #0x0100
      0090DF 26 12            [ 1]  757 	jrne	00110$
                                    758 ;	lib/src/stm8s_i2c.c: 818: if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
      0090E1 C6 52 17         [ 1]  759 	ld	a, 0x5217
      0090E4 14 04            [ 1]  760 	and	a, (0x04, sp)
      0090E6 27 08            [ 1]  761 	jreq	00102$
      0090E8 0D 03            [ 1]  762 	tnz	(0x03, sp)
      0090EA 27 04            [ 1]  763 	jreq	00102$
                                    764 ;	lib/src/stm8s_i2c.c: 821: bitstatus = SET;
      0090EC A6 01            [ 1]  765 	ld	a, #0x01
      0090EE 20 12            [ 2]  766 	jra	00111$
      0090F0                        767 00102$:
                                    768 ;	lib/src/stm8s_i2c.c: 826: bitstatus = RESET;
      0090F0 4F               [ 1]  769 	clr	a
      0090F1 20 0F            [ 2]  770 	jra	00111$
      0090F3                        771 00110$:
                                    772 ;	lib/src/stm8s_i2c.c: 832: if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
      0090F3 C6 52 18         [ 1]  773 	ld	a, 0x5218
      0090F6 14 04            [ 1]  774 	and	a, (0x04, sp)
      0090F8 27 07            [ 1]  775 	jreq	00106$
      0090FA 0D 03            [ 1]  776 	tnz	(0x03, sp)
      0090FC 27 03            [ 1]  777 	jreq	00106$
                                    778 ;	lib/src/stm8s_i2c.c: 835: bitstatus = SET;
      0090FE A6 01            [ 1]  779 	ld	a, #0x01
                                    780 ;	lib/src/stm8s_i2c.c: 840: bitstatus = RESET;
      009100 21                     781 	.byte 0x21
      009101                        782 00106$:
      009101 4F               [ 1]  783 	clr	a
      009102                        784 00111$:
                                    785 ;	lib/src/stm8s_i2c.c: 844: return  bitstatus;
                                    786 ;	lib/src/stm8s_i2c.c: 845: }
      009102 5B 04            [ 2]  787 	addw	sp, #4
      009104 81               [ 4]  788 	ret
                                    789 ;	lib/src/stm8s_i2c.c: 881: void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
                                    790 ;	-----------------------------------------
                                    791 ;	 function I2C_ClearITPendingBit
                                    792 ;	-----------------------------------------
      009105                        793 _I2C_ClearITPendingBit:
                                    794 ;	lib/src/stm8s_i2c.c: 889: flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
      009105 4F               [ 1]  795 	clr	a
      009106 95               [ 1]  796 	ld	xh, a
                                    797 ;	lib/src/stm8s_i2c.c: 892: I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
      009107 53               [ 2]  798 	cplw	x
      009108 9F               [ 1]  799 	ld	a, xl
      009109 C7 52 18         [ 1]  800 	ld	0x5218, a
                                    801 ;	lib/src/stm8s_i2c.c: 893: }
      00910C 81               [ 4]  802 	ret
                                    803 	.area CODE
                                    804 	.area CONST
                                    805 	.area INITIALIZER
                                    806 	.area CABS (ABS)
