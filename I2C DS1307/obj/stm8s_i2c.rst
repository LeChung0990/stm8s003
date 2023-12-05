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
      0087B4                         72 _I2C_DeInit:
                                     73 ;	lib/src/stm8s_i2c.c: 69: I2C->CR1 = I2C_CR1_RESET_VALUE;
      0087B4 35 00 52 10      [ 1]   74 	mov	0x5210+0, #0x00
                                     75 ;	lib/src/stm8s_i2c.c: 70: I2C->CR2 = I2C_CR2_RESET_VALUE;
      0087B8 35 00 52 11      [ 1]   76 	mov	0x5211+0, #0x00
                                     77 ;	lib/src/stm8s_i2c.c: 71: I2C->FREQR = I2C_FREQR_RESET_VALUE;
      0087BC 35 00 52 12      [ 1]   78 	mov	0x5212+0, #0x00
                                     79 ;	lib/src/stm8s_i2c.c: 72: I2C->OARL = I2C_OARL_RESET_VALUE;
      0087C0 35 00 52 13      [ 1]   80 	mov	0x5213+0, #0x00
                                     81 ;	lib/src/stm8s_i2c.c: 73: I2C->OARH = I2C_OARH_RESET_VALUE;
      0087C4 35 00 52 14      [ 1]   82 	mov	0x5214+0, #0x00
                                     83 ;	lib/src/stm8s_i2c.c: 74: I2C->ITR = I2C_ITR_RESET_VALUE;
      0087C8 35 00 52 1A      [ 1]   84 	mov	0x521a+0, #0x00
                                     85 ;	lib/src/stm8s_i2c.c: 75: I2C->CCRL = I2C_CCRL_RESET_VALUE;
      0087CC 35 00 52 1B      [ 1]   86 	mov	0x521b+0, #0x00
                                     87 ;	lib/src/stm8s_i2c.c: 76: I2C->CCRH = I2C_CCRH_RESET_VALUE;
      0087D0 35 00 52 1C      [ 1]   88 	mov	0x521c+0, #0x00
                                     89 ;	lib/src/stm8s_i2c.c: 77: I2C->TRISER = I2C_TRISER_RESET_VALUE;
      0087D4 35 02 52 1D      [ 1]   90 	mov	0x521d+0, #0x02
                                     91 ;	lib/src/stm8s_i2c.c: 78: }
      0087D8 81               [ 4]   92 	ret
                                     93 ;	lib/src/stm8s_i2c.c: 96: void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
                                     94 ;	-----------------------------------------
                                     95 ;	 function I2C_Init
                                     96 ;	-----------------------------------------
      0087D9                         97 _I2C_Init:
      0087D9 52 07            [ 2]   98 	sub	sp, #7
                                     99 ;	lib/src/stm8s_i2c.c: 102: uint8_t tmpccrh = 0;
      0087DB 0F 05            [ 1]  100 	clr	(0x05, sp)
                                    101 ;	lib/src/stm8s_i2c.c: 115: I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
      0087DD C6 52 12         [ 1]  102 	ld	a, 0x5212
      0087E0 A4 C0            [ 1]  103 	and	a, #0xc0
      0087E2 C7 52 12         [ 1]  104 	ld	0x5212, a
                                    105 ;	lib/src/stm8s_i2c.c: 117: I2C->FREQR |= InputClockFrequencyMHz;
      0087E5 C6 52 12         [ 1]  106 	ld	a, 0x5212
      0087E8 1A 13            [ 1]  107 	or	a, (0x13, sp)
      0087EA C7 52 12         [ 1]  108 	ld	0x5212, a
                                    109 ;	lib/src/stm8s_i2c.c: 121: I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
      0087ED 72 11 52 10      [ 1]  110 	bres	0x5210, #0
                                    111 ;	lib/src/stm8s_i2c.c: 124: I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
      0087F1 C6 52 1C         [ 1]  112 	ld	a, 0x521c
      0087F4 A4 30            [ 1]  113 	and	a, #0x30
      0087F6 C7 52 1C         [ 1]  114 	ld	0x521c, a
                                    115 ;	lib/src/stm8s_i2c.c: 125: I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
      0087F9 C6 52 1B         [ 1]  116 	ld	a, 0x521b
      0087FC 35 00 52 1B      [ 1]  117 	mov	0x521b+0, #0x00
                                    118 ;	lib/src/stm8s_i2c.c: 136: result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
      008800 5F               [ 1]  119 	clrw	x
      008801 7B 13            [ 1]  120 	ld	a, (0x13, sp)
      008803 97               [ 1]  121 	ld	xl, a
      008804 90 5F            [ 1]  122 	clrw	y
      008806 89               [ 2]  123 	pushw	x
      008807 90 89            [ 2]  124 	pushw	y
      008809 4B 40            [ 1]  125 	push	#0x40
      00880B 4B 42            [ 1]  126 	push	#0x42
      00880D 4B 0F            [ 1]  127 	push	#0x0f
      00880F 4B 00            [ 1]  128 	push	#0x00
      008811 CD 8B 58         [ 4]  129 	call	__mullong
      008814 5B 08            [ 2]  130 	addw	sp, #8
      008816 1F 03            [ 2]  131 	ldw	(0x03, sp), x
      008818 17 01            [ 2]  132 	ldw	(0x01, sp), y
                                    133 ;	lib/src/stm8s_i2c.c: 128: if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
      00881A AE 86 A0         [ 2]  134 	ldw	x, #0x86a0
      00881D 13 0C            [ 2]  135 	cpw	x, (0x0c, sp)
      00881F A6 01            [ 1]  136 	ld	a, #0x01
      008821 12 0B            [ 1]  137 	sbc	a, (0x0b, sp)
      008823 4F               [ 1]  138 	clr	a
      008824 12 0A            [ 1]  139 	sbc	a, (0x0a, sp)
      008826 24 76            [ 1]  140 	jrnc	00109$
                                    141 ;	lib/src/stm8s_i2c.c: 131: tmpccrh = I2C_CCRH_FS;
      008828 A6 80            [ 1]  142 	ld	a, #0x80
      00882A 6B 05            [ 1]  143 	ld	(0x05, sp), a
                                    144 ;	lib/src/stm8s_i2c.c: 133: if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
      00882C 0D 10            [ 1]  145 	tnz	(0x10, sp)
      00882E 26 21            [ 1]  146 	jrne	00102$
                                    147 ;	lib/src/stm8s_i2c.c: 136: result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
      008830 1E 0C            [ 2]  148 	ldw	x, (0x0c, sp)
      008832 89               [ 2]  149 	pushw	x
      008833 1E 0C            [ 2]  150 	ldw	x, (0x0c, sp)
      008835 89               [ 2]  151 	pushw	x
      008836 4B 03            [ 1]  152 	push	#0x03
      008838 5F               [ 1]  153 	clrw	x
      008839 89               [ 2]  154 	pushw	x
      00883A 4B 00            [ 1]  155 	push	#0x00
      00883C CD 8B 58         [ 4]  156 	call	__mullong
      00883F 5B 08            [ 2]  157 	addw	sp, #8
      008841 89               [ 2]  158 	pushw	x
      008842 90 89            [ 2]  159 	pushw	y
      008844 1E 07            [ 2]  160 	ldw	x, (0x07, sp)
      008846 89               [ 2]  161 	pushw	x
      008847 1E 07            [ 2]  162 	ldw	x, (0x07, sp)
      008849 89               [ 2]  163 	pushw	x
      00884A CD 8A FD         [ 4]  164 	call	__divulong
      00884D 5B 08            [ 2]  165 	addw	sp, #8
      00884F 20 26            [ 2]  166 	jra	00103$
      008851                        167 00102$:
                                    168 ;	lib/src/stm8s_i2c.c: 141: result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
      008851 1E 0C            [ 2]  169 	ldw	x, (0x0c, sp)
      008853 89               [ 2]  170 	pushw	x
      008854 1E 0C            [ 2]  171 	ldw	x, (0x0c, sp)
      008856 89               [ 2]  172 	pushw	x
      008857 4B 19            [ 1]  173 	push	#0x19
      008859 5F               [ 1]  174 	clrw	x
      00885A 89               [ 2]  175 	pushw	x
      00885B 4B 00            [ 1]  176 	push	#0x00
      00885D CD 8B 58         [ 4]  177 	call	__mullong
      008860 5B 08            [ 2]  178 	addw	sp, #8
      008862 9F               [ 1]  179 	ld	a, xl
      008863 88               [ 1]  180 	push	a
      008864 9E               [ 1]  181 	ld	a, xh
      008865 88               [ 1]  182 	push	a
      008866 90 89            [ 2]  183 	pushw	y
      008868 1E 07            [ 2]  184 	ldw	x, (0x07, sp)
      00886A 89               [ 2]  185 	pushw	x
      00886B 1E 07            [ 2]  186 	ldw	x, (0x07, sp)
      00886D 89               [ 2]  187 	pushw	x
      00886E CD 8A FD         [ 4]  188 	call	__divulong
      008871 5B 08            [ 2]  189 	addw	sp, #8
                                    190 ;	lib/src/stm8s_i2c.c: 143: tmpccrh |= I2C_CCRH_DUTY;
      008873 A6 C0            [ 1]  191 	ld	a, #0xc0
      008875 6B 05            [ 1]  192 	ld	(0x05, sp), a
      008877                        193 00103$:
                                    194 ;	lib/src/stm8s_i2c.c: 147: if (result < (uint16_t)0x01)
      008877 A3 00 01         [ 2]  195 	cpw	x, #0x0001
      00887A 24 02            [ 1]  196 	jrnc	00105$
                                    197 ;	lib/src/stm8s_i2c.c: 150: result = (uint16_t)0x0001;
      00887C 5F               [ 1]  198 	clrw	x
      00887D 5C               [ 1]  199 	incw	x
      00887E                        200 00105$:
                                    201 ;	lib/src/stm8s_i2c.c: 156: tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
      00887E 7B 13            [ 1]  202 	ld	a, (0x13, sp)
      008880 6B 07            [ 1]  203 	ld	(0x07, sp), a
      008882 0F 06            [ 1]  204 	clr	(0x06, sp)
      008884 89               [ 2]  205 	pushw	x
      008885 1E 08            [ 2]  206 	ldw	x, (0x08, sp)
      008887 58               [ 2]  207 	sllw	x
      008888 72 FB 08         [ 2]  208 	addw	x, (0x08, sp)
      00888B 51               [ 1]  209 	exgw	x, y
      00888C 4B 0A            [ 1]  210 	push	#0x0a
      00888E 4B 00            [ 1]  211 	push	#0x00
      008890 93               [ 1]  212 	ldw	x, y
      008891 CD 8B D4         [ 4]  213 	call	__divsint
      008894 90 93            [ 1]  214 	ldw	y, x
      008896 9F               [ 1]  215 	ld	a, xl
      008897 85               [ 2]  216 	popw	x
      008898 4C               [ 1]  217 	inc	a
                                    218 ;	lib/src/stm8s_i2c.c: 157: I2C->TRISER = (uint8_t)tmpval;
      008899 C7 52 1D         [ 1]  219 	ld	0x521d, a
      00889C 20 23            [ 2]  220 	jra	00110$
      00889E                        221 00109$:
                                    222 ;	lib/src/stm8s_i2c.c: 164: result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
      00889E 1E 0C            [ 2]  223 	ldw	x, (0x0c, sp)
      0088A0 16 0A            [ 2]  224 	ldw	y, (0x0a, sp)
      0088A2 58               [ 2]  225 	sllw	x
      0088A3 90 59            [ 2]  226 	rlcw	y
      0088A5 89               [ 2]  227 	pushw	x
      0088A6 90 89            [ 2]  228 	pushw	y
      0088A8 1E 07            [ 2]  229 	ldw	x, (0x07, sp)
      0088AA 89               [ 2]  230 	pushw	x
      0088AB 1E 07            [ 2]  231 	ldw	x, (0x07, sp)
      0088AD 89               [ 2]  232 	pushw	x
      0088AE CD 8A FD         [ 4]  233 	call	__divulong
      0088B1 5B 08            [ 2]  234 	addw	sp, #8
                                    235 ;	lib/src/stm8s_i2c.c: 167: if (result < (uint16_t)0x0004)
      0088B3 A3 00 04         [ 2]  236 	cpw	x, #0x0004
      0088B6 24 03            [ 1]  237 	jrnc	00107$
                                    238 ;	lib/src/stm8s_i2c.c: 170: result = (uint16_t)0x0004;
      0088B8 AE 00 04         [ 2]  239 	ldw	x, #0x0004
      0088BB                        240 00107$:
                                    241 ;	lib/src/stm8s_i2c.c: 176: I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
      0088BB 7B 13            [ 1]  242 	ld	a, (0x13, sp)
      0088BD 4C               [ 1]  243 	inc	a
      0088BE C7 52 1D         [ 1]  244 	ld	0x521d, a
      0088C1                        245 00110$:
                                    246 ;	lib/src/stm8s_i2c.c: 181: I2C->CCRL = (uint8_t)result;
      0088C1 9F               [ 1]  247 	ld	a, xl
      0088C2 C7 52 1B         [ 1]  248 	ld	0x521b, a
                                    249 ;	lib/src/stm8s_i2c.c: 182: I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
      0088C5 9E               [ 1]  250 	ld	a, xh
      0088C6 A4 0F            [ 1]  251 	and	a, #0x0f
      0088C8 1A 05            [ 1]  252 	or	a, (0x05, sp)
      0088CA C7 52 1C         [ 1]  253 	ld	0x521c, a
                                    254 ;	lib/src/stm8s_i2c.c: 185: I2C->CR1 |= I2C_CR1_PE;
      0088CD 72 10 52 10      [ 1]  255 	bset	0x5210, #0
                                    256 ;	lib/src/stm8s_i2c.c: 188: I2C_AcknowledgeConfig(Ack);
      0088D1 7B 11            [ 1]  257 	ld	a, (0x11, sp)
      0088D3 CD 89 95         [ 4]  258 	call	_I2C_AcknowledgeConfig
                                    259 ;	lib/src/stm8s_i2c.c: 201: I2C->OARL = (uint8_t)(AddMode == I2C_ADDMODE_7BIT ? (OwnAddress<<1) : OwnAddress);
      0088D6 0D 12            [ 1]  260 	tnz	(0x12, sp)
      0088D8 26 0A            [ 1]  261 	jrne	00113$
      0088DA 7B 0F            [ 1]  262 	ld	a, (0x0f, sp)
      0088DC 48               [ 1]  263 	sll	a
      0088DD 97               [ 1]  264 	ld	xl, a
      0088DE 49               [ 1]  265 	rlc	a
      0088DF 4F               [ 1]  266 	clr	a
      0088E0 A2 00            [ 1]  267 	sbc	a, #0x00
      0088E2 95               [ 1]  268 	ld	xh, a
      0088E3 C5                     269 	.byte 0xc5
      0088E4                        270 00113$:
      0088E4 1E 0E            [ 2]  271 	ldw	x, (0x0e, sp)
      0088E6                        272 00114$:
      0088E6 9F               [ 1]  273 	ld	a, xl
      0088E7 C7 52 13         [ 1]  274 	ld	0x5213, a
                                    275 ;	lib/src/stm8s_i2c.c: 202: I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
      0088EA 7B 12            [ 1]  276 	ld	a, (0x12, sp)
      0088EC AA 40            [ 1]  277 	or	a, #0x40
      0088EE 6B 07            [ 1]  278 	ld	(0x07, sp), a
                                    279 ;	lib/src/stm8s_i2c.c: 203: (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
      0088F0 4F               [ 1]  280 	clr	a
      0088F1 97               [ 1]  281 	ld	xl, a
      0088F2 7B 0E            [ 1]  282 	ld	a, (0x0e, sp)
      0088F4 A4 03            [ 1]  283 	and	a, #0x03
      0088F6 95               [ 1]  284 	ld	xh, a
      0088F7 A6 80            [ 1]  285 	ld	a, #0x80
      0088F9 62               [ 2]  286 	div	x, a
      0088FA 9F               [ 1]  287 	ld	a, xl
      0088FB 1A 07            [ 1]  288 	or	a, (0x07, sp)
      0088FD C7 52 14         [ 1]  289 	ld	0x5214, a
                                    290 ;	lib/src/stm8s_i2c.c: 204: }
      008900 1E 08            [ 2]  291 	ldw	x, (8, sp)
      008902 5B 13            [ 2]  292 	addw	sp, #19
      008904 FC               [ 2]  293 	jp	(x)
                                    294 ;	lib/src/stm8s_i2c.c: 212: void I2C_Cmd(FunctionalState NewState)
                                    295 ;	-----------------------------------------
                                    296 ;	 function I2C_Cmd
                                    297 ;	-----------------------------------------
      008905                        298 _I2C_Cmd:
      008905 88               [ 1]  299 	push	a
      008906 6B 01            [ 1]  300 	ld	(0x01, sp), a
                                    301 ;	lib/src/stm8s_i2c.c: 220: I2C->CR1 |= I2C_CR1_PE;
      008908 C6 52 10         [ 1]  302 	ld	a, 0x5210
                                    303 ;	lib/src/stm8s_i2c.c: 217: if (NewState != DISABLE)
      00890B 0D 01            [ 1]  304 	tnz	(0x01, sp)
      00890D 27 07            [ 1]  305 	jreq	00102$
                                    306 ;	lib/src/stm8s_i2c.c: 220: I2C->CR1 |= I2C_CR1_PE;
      00890F AA 01            [ 1]  307 	or	a, #0x01
      008911 C7 52 10         [ 1]  308 	ld	0x5210, a
      008914 20 05            [ 2]  309 	jra	00104$
      008916                        310 00102$:
                                    311 ;	lib/src/stm8s_i2c.c: 225: I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
      008916 A4 FE            [ 1]  312 	and	a, #0xfe
      008918 C7 52 10         [ 1]  313 	ld	0x5210, a
      00891B                        314 00104$:
                                    315 ;	lib/src/stm8s_i2c.c: 227: }
      00891B 84               [ 1]  316 	pop	a
      00891C 81               [ 4]  317 	ret
                                    318 ;	lib/src/stm8s_i2c.c: 235: void I2C_GeneralCallCmd(FunctionalState NewState)
                                    319 ;	-----------------------------------------
                                    320 ;	 function I2C_GeneralCallCmd
                                    321 ;	-----------------------------------------
      00891D                        322 _I2C_GeneralCallCmd:
      00891D 88               [ 1]  323 	push	a
      00891E 6B 01            [ 1]  324 	ld	(0x01, sp), a
                                    325 ;	lib/src/stm8s_i2c.c: 243: I2C->CR1 |= I2C_CR1_ENGC;
      008920 C6 52 10         [ 1]  326 	ld	a, 0x5210
                                    327 ;	lib/src/stm8s_i2c.c: 240: if (NewState != DISABLE)
      008923 0D 01            [ 1]  328 	tnz	(0x01, sp)
      008925 27 07            [ 1]  329 	jreq	00102$
                                    330 ;	lib/src/stm8s_i2c.c: 243: I2C->CR1 |= I2C_CR1_ENGC;
      008927 AA 40            [ 1]  331 	or	a, #0x40
      008929 C7 52 10         [ 1]  332 	ld	0x5210, a
      00892C 20 05            [ 2]  333 	jra	00104$
      00892E                        334 00102$:
                                    335 ;	lib/src/stm8s_i2c.c: 248: I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
      00892E A4 BF            [ 1]  336 	and	a, #0xbf
      008930 C7 52 10         [ 1]  337 	ld	0x5210, a
      008933                        338 00104$:
                                    339 ;	lib/src/stm8s_i2c.c: 250: }
      008933 84               [ 1]  340 	pop	a
      008934 81               [ 4]  341 	ret
                                    342 ;	lib/src/stm8s_i2c.c: 260: void I2C_GenerateSTART(FunctionalState NewState)
                                    343 ;	-----------------------------------------
                                    344 ;	 function I2C_GenerateSTART
                                    345 ;	-----------------------------------------
      008935                        346 _I2C_GenerateSTART:
      008935 88               [ 1]  347 	push	a
      008936 6B 01            [ 1]  348 	ld	(0x01, sp), a
                                    349 ;	lib/src/stm8s_i2c.c: 268: I2C->CR2 |= I2C_CR2_START;
      008938 C6 52 11         [ 1]  350 	ld	a, 0x5211
                                    351 ;	lib/src/stm8s_i2c.c: 265: if (NewState != DISABLE)
      00893B 0D 01            [ 1]  352 	tnz	(0x01, sp)
      00893D 27 07            [ 1]  353 	jreq	00102$
                                    354 ;	lib/src/stm8s_i2c.c: 268: I2C->CR2 |= I2C_CR2_START;
      00893F AA 01            [ 1]  355 	or	a, #0x01
      008941 C7 52 11         [ 1]  356 	ld	0x5211, a
      008944 20 05            [ 2]  357 	jra	00104$
      008946                        358 00102$:
                                    359 ;	lib/src/stm8s_i2c.c: 273: I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
      008946 A4 FE            [ 1]  360 	and	a, #0xfe
      008948 C7 52 11         [ 1]  361 	ld	0x5211, a
      00894B                        362 00104$:
                                    363 ;	lib/src/stm8s_i2c.c: 275: }
      00894B 84               [ 1]  364 	pop	a
      00894C 81               [ 4]  365 	ret
                                    366 ;	lib/src/stm8s_i2c.c: 283: void I2C_GenerateSTOP(FunctionalState NewState)
                                    367 ;	-----------------------------------------
                                    368 ;	 function I2C_GenerateSTOP
                                    369 ;	-----------------------------------------
      00894D                        370 _I2C_GenerateSTOP:
      00894D 88               [ 1]  371 	push	a
      00894E 6B 01            [ 1]  372 	ld	(0x01, sp), a
                                    373 ;	lib/src/stm8s_i2c.c: 291: I2C->CR2 |= I2C_CR2_STOP;
      008950 C6 52 11         [ 1]  374 	ld	a, 0x5211
                                    375 ;	lib/src/stm8s_i2c.c: 288: if (NewState != DISABLE)
      008953 0D 01            [ 1]  376 	tnz	(0x01, sp)
      008955 27 07            [ 1]  377 	jreq	00102$
                                    378 ;	lib/src/stm8s_i2c.c: 291: I2C->CR2 |= I2C_CR2_STOP;
      008957 AA 02            [ 1]  379 	or	a, #0x02
      008959 C7 52 11         [ 1]  380 	ld	0x5211, a
      00895C 20 05            [ 2]  381 	jra	00104$
      00895E                        382 00102$:
                                    383 ;	lib/src/stm8s_i2c.c: 296: I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
      00895E A4 FD            [ 1]  384 	and	a, #0xfd
      008960 C7 52 11         [ 1]  385 	ld	0x5211, a
      008963                        386 00104$:
                                    387 ;	lib/src/stm8s_i2c.c: 298: }
      008963 84               [ 1]  388 	pop	a
      008964 81               [ 4]  389 	ret
                                    390 ;	lib/src/stm8s_i2c.c: 306: void I2C_SoftwareResetCmd(FunctionalState NewState)
                                    391 ;	-----------------------------------------
                                    392 ;	 function I2C_SoftwareResetCmd
                                    393 ;	-----------------------------------------
      008965                        394 _I2C_SoftwareResetCmd:
      008965 88               [ 1]  395 	push	a
      008966 6B 01            [ 1]  396 	ld	(0x01, sp), a
                                    397 ;	lib/src/stm8s_i2c.c: 314: I2C->CR2 |= I2C_CR2_SWRST;
      008968 C6 52 11         [ 1]  398 	ld	a, 0x5211
                                    399 ;	lib/src/stm8s_i2c.c: 311: if (NewState != DISABLE)
      00896B 0D 01            [ 1]  400 	tnz	(0x01, sp)
      00896D 27 07            [ 1]  401 	jreq	00102$
                                    402 ;	lib/src/stm8s_i2c.c: 314: I2C->CR2 |= I2C_CR2_SWRST;
      00896F AA 80            [ 1]  403 	or	a, #0x80
      008971 C7 52 11         [ 1]  404 	ld	0x5211, a
      008974 20 05            [ 2]  405 	jra	00104$
      008976                        406 00102$:
                                    407 ;	lib/src/stm8s_i2c.c: 319: I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
      008976 A4 7F            [ 1]  408 	and	a, #0x7f
      008978 C7 52 11         [ 1]  409 	ld	0x5211, a
      00897B                        410 00104$:
                                    411 ;	lib/src/stm8s_i2c.c: 321: }
      00897B 84               [ 1]  412 	pop	a
      00897C 81               [ 4]  413 	ret
                                    414 ;	lib/src/stm8s_i2c.c: 330: void I2C_StretchClockCmd(FunctionalState NewState)
                                    415 ;	-----------------------------------------
                                    416 ;	 function I2C_StretchClockCmd
                                    417 ;	-----------------------------------------
      00897D                        418 _I2C_StretchClockCmd:
      00897D 88               [ 1]  419 	push	a
      00897E 6B 01            [ 1]  420 	ld	(0x01, sp), a
                                    421 ;	lib/src/stm8s_i2c.c: 338: I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
      008980 C6 52 10         [ 1]  422 	ld	a, 0x5210
                                    423 ;	lib/src/stm8s_i2c.c: 335: if (NewState != DISABLE)
      008983 0D 01            [ 1]  424 	tnz	(0x01, sp)
      008985 27 07            [ 1]  425 	jreq	00102$
                                    426 ;	lib/src/stm8s_i2c.c: 338: I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
      008987 A4 7F            [ 1]  427 	and	a, #0x7f
      008989 C7 52 10         [ 1]  428 	ld	0x5210, a
      00898C 20 05            [ 2]  429 	jra	00104$
      00898E                        430 00102$:
                                    431 ;	lib/src/stm8s_i2c.c: 344: I2C->CR1 |= I2C_CR1_NOSTRETCH;
      00898E AA 80            [ 1]  432 	or	a, #0x80
      008990 C7 52 10         [ 1]  433 	ld	0x5210, a
      008993                        434 00104$:
                                    435 ;	lib/src/stm8s_i2c.c: 346: }
      008993 84               [ 1]  436 	pop	a
      008994 81               [ 4]  437 	ret
                                    438 ;	lib/src/stm8s_i2c.c: 355: void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
                                    439 ;	-----------------------------------------
                                    440 ;	 function I2C_AcknowledgeConfig
                                    441 ;	-----------------------------------------
      008995                        442 _I2C_AcknowledgeConfig:
      008995 97               [ 1]  443 	ld	xl, a
                                    444 ;	lib/src/stm8s_i2c.c: 363: I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
      008996 C6 52 11         [ 1]  445 	ld	a, 0x5211
                                    446 ;	lib/src/stm8s_i2c.c: 360: if (Ack == I2C_ACK_NONE)
      008999 41               [ 1]  447 	exg	a, xl
      00899A 4D               [ 1]  448 	tnz	a
      00899B 41               [ 1]  449 	exg	a, xl
      00899C 26 06            [ 1]  450 	jrne	00105$
                                    451 ;	lib/src/stm8s_i2c.c: 363: I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
      00899E A4 FB            [ 1]  452 	and	a, #0xfb
      0089A0 C7 52 11         [ 1]  453 	ld	0x5211, a
      0089A3 81               [ 4]  454 	ret
      0089A4                        455 00105$:
                                    456 ;	lib/src/stm8s_i2c.c: 368: I2C->CR2 |= I2C_CR2_ACK;
      0089A4 AA 04            [ 1]  457 	or	a, #0x04
      0089A6 C7 52 11         [ 1]  458 	ld	0x5211, a
                                    459 ;	lib/src/stm8s_i2c.c: 363: I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
      0089A9 C6 52 11         [ 1]  460 	ld	a, 0x5211
                                    461 ;	lib/src/stm8s_i2c.c: 370: if (Ack == I2C_ACK_CURR)
      0089AC 88               [ 1]  462 	push	a
      0089AD 9F               [ 1]  463 	ld	a, xl
      0089AE 4A               [ 1]  464 	dec	a
      0089AF 84               [ 1]  465 	pop	a
      0089B0 26 06            [ 1]  466 	jrne	00102$
                                    467 ;	lib/src/stm8s_i2c.c: 373: I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
      0089B2 A4 F7            [ 1]  468 	and	a, #0xf7
      0089B4 C7 52 11         [ 1]  469 	ld	0x5211, a
      0089B7 81               [ 4]  470 	ret
      0089B8                        471 00102$:
                                    472 ;	lib/src/stm8s_i2c.c: 378: I2C->CR2 |= I2C_CR2_POS;
      0089B8 AA 08            [ 1]  473 	or	a, #0x08
      0089BA C7 52 11         [ 1]  474 	ld	0x5211, a
                                    475 ;	lib/src/stm8s_i2c.c: 381: }
      0089BD 81               [ 4]  476 	ret
                                    477 ;	lib/src/stm8s_i2c.c: 391: void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
                                    478 ;	-----------------------------------------
                                    479 ;	 function I2C_ITConfig
                                    480 ;	-----------------------------------------
      0089BE                        481 _I2C_ITConfig:
      0089BE 88               [ 1]  482 	push	a
                                    483 ;	lib/src/stm8s_i2c.c: 400: I2C->ITR |= (uint8_t)I2C_IT;
      0089BF AE 52 1A         [ 2]  484 	ldw	x, #0x521a
      0089C2 88               [ 1]  485 	push	a
      0089C3 F6               [ 1]  486 	ld	a, (x)
      0089C4 6B 02            [ 1]  487 	ld	(0x02, sp), a
      0089C6 84               [ 1]  488 	pop	a
                                    489 ;	lib/src/stm8s_i2c.c: 397: if (NewState != DISABLE)
      0089C7 0D 04            [ 1]  490 	tnz	(0x04, sp)
      0089C9 27 07            [ 1]  491 	jreq	00102$
                                    492 ;	lib/src/stm8s_i2c.c: 400: I2C->ITR |= (uint8_t)I2C_IT;
      0089CB 1A 01            [ 1]  493 	or	a, (0x01, sp)
      0089CD C7 52 1A         [ 1]  494 	ld	0x521a, a
      0089D0 20 06            [ 2]  495 	jra	00104$
      0089D2                        496 00102$:
                                    497 ;	lib/src/stm8s_i2c.c: 405: I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
      0089D2 43               [ 1]  498 	cpl	a
      0089D3 14 01            [ 1]  499 	and	a, (0x01, sp)
      0089D5 C7 52 1A         [ 1]  500 	ld	0x521a, a
      0089D8                        501 00104$:
                                    502 ;	lib/src/stm8s_i2c.c: 407: }
      0089D8 84               [ 1]  503 	pop	a
      0089D9 85               [ 2]  504 	popw	x
      0089DA 84               [ 1]  505 	pop	a
      0089DB FC               [ 2]  506 	jp	(x)
                                    507 ;	lib/src/stm8s_i2c.c: 415: void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
                                    508 ;	-----------------------------------------
                                    509 ;	 function I2C_FastModeDutyCycleConfig
                                    510 ;	-----------------------------------------
      0089DC                        511 _I2C_FastModeDutyCycleConfig:
      0089DC 97               [ 1]  512 	ld	xl, a
                                    513 ;	lib/src/stm8s_i2c.c: 423: I2C->CCRH |= I2C_CCRH_DUTY;
      0089DD C6 52 1C         [ 1]  514 	ld	a, 0x521c
                                    515 ;	lib/src/stm8s_i2c.c: 420: if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
      0089E0 88               [ 1]  516 	push	a
      0089E1 9F               [ 1]  517 	ld	a, xl
      0089E2 A1 40            [ 1]  518 	cp	a, #0x40
      0089E4 84               [ 1]  519 	pop	a
      0089E5 26 06            [ 1]  520 	jrne	00102$
                                    521 ;	lib/src/stm8s_i2c.c: 423: I2C->CCRH |= I2C_CCRH_DUTY;
      0089E7 AA 40            [ 1]  522 	or	a, #0x40
      0089E9 C7 52 1C         [ 1]  523 	ld	0x521c, a
      0089EC 81               [ 4]  524 	ret
      0089ED                        525 00102$:
                                    526 ;	lib/src/stm8s_i2c.c: 428: I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
      0089ED A4 BF            [ 1]  527 	and	a, #0xbf
      0089EF C7 52 1C         [ 1]  528 	ld	0x521c, a
                                    529 ;	lib/src/stm8s_i2c.c: 430: }
      0089F2 81               [ 4]  530 	ret
                                    531 ;	lib/src/stm8s_i2c.c: 437: uint8_t I2C_ReceiveData(void)
                                    532 ;	-----------------------------------------
                                    533 ;	 function I2C_ReceiveData
                                    534 ;	-----------------------------------------
      0089F3                        535 _I2C_ReceiveData:
                                    536 ;	lib/src/stm8s_i2c.c: 440: return ((uint8_t)I2C->DR);
      0089F3 C6 52 16         [ 1]  537 	ld	a, 0x5216
                                    538 ;	lib/src/stm8s_i2c.c: 441: }
      0089F6 81               [ 4]  539 	ret
                                    540 ;	lib/src/stm8s_i2c.c: 450: void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
                                    541 ;	-----------------------------------------
                                    542 ;	 function I2C_Send7bitAddress
                                    543 ;	-----------------------------------------
      0089F7                        544 _I2C_Send7bitAddress:
      0089F7 88               [ 1]  545 	push	a
                                    546 ;	lib/src/stm8s_i2c.c: 457: Address &= (uint8_t)0xFE;
      0089F8 A4 FE            [ 1]  547 	and	a, #0xfe
      0089FA 6B 01            [ 1]  548 	ld	(0x01, sp), a
                                    549 ;	lib/src/stm8s_i2c.c: 460: I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
      0089FC 7B 04            [ 1]  550 	ld	a, (0x04, sp)
      0089FE 1A 01            [ 1]  551 	or	a, (0x01, sp)
      008A00 C7 52 16         [ 1]  552 	ld	0x5216, a
                                    553 ;	lib/src/stm8s_i2c.c: 461: }
      008A03 84               [ 1]  554 	pop	a
      008A04 85               [ 2]  555 	popw	x
      008A05 84               [ 1]  556 	pop	a
      008A06 FC               [ 2]  557 	jp	(x)
                                    558 ;	lib/src/stm8s_i2c.c: 468: void I2C_SendData(uint8_t Data)
                                    559 ;	-----------------------------------------
                                    560 ;	 function I2C_SendData
                                    561 ;	-----------------------------------------
      008A07                        562 _I2C_SendData:
                                    563 ;	lib/src/stm8s_i2c.c: 471: I2C->DR = Data;
      008A07 C7 52 16         [ 1]  564 	ld	0x5216, a
                                    565 ;	lib/src/stm8s_i2c.c: 472: }
      008A0A 81               [ 4]  566 	ret
                                    567 ;	lib/src/stm8s_i2c.c: 588: ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
                                    568 ;	-----------------------------------------
                                    569 ;	 function I2C_CheckEvent
                                    570 ;	-----------------------------------------
      008A0B                        571 _I2C_CheckEvent:
      008A0B 52 08            [ 2]  572 	sub	sp, #8
                                    573 ;	lib/src/stm8s_i2c.c: 590: __IO uint16_t lastevent = 0x00;
      008A0D 0F 02            [ 1]  574 	clr	(0x02, sp)
      008A0F 0F 01            [ 1]  575 	clr	(0x01, sp)
                                    576 ;	lib/src/stm8s_i2c.c: 598: if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
      008A11 1F 03            [ 2]  577 	ldw	(0x03, sp), x
      008A13 A3 00 04         [ 2]  578 	cpw	x, #0x0004
      008A16 26 0B            [ 1]  579 	jrne	00102$
                                    580 ;	lib/src/stm8s_i2c.c: 600: lastevent = I2C->SR2 & I2C_SR2_AF;
      008A18 C6 52 18         [ 1]  581 	ld	a, 0x5218
      008A1B A4 04            [ 1]  582 	and	a, #0x04
      008A1D 5F               [ 1]  583 	clrw	x
      008A1E 97               [ 1]  584 	ld	xl, a
      008A1F 1F 01            [ 2]  585 	ldw	(0x01, sp), x
      008A21 20 15            [ 2]  586 	jra	00103$
      008A23                        587 00102$:
                                    588 ;	lib/src/stm8s_i2c.c: 604: flag1 = I2C->SR1;
      008A23 C6 52 17         [ 1]  589 	ld	a, 0x5217
      008A26 97               [ 1]  590 	ld	xl, a
                                    591 ;	lib/src/stm8s_i2c.c: 605: flag2 = I2C->SR3;
      008A27 C6 52 19         [ 1]  592 	ld	a, 0x5219
                                    593 ;	lib/src/stm8s_i2c.c: 606: lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
      008A2A 95               [ 1]  594 	ld	xh, a
      008A2B 0F 06            [ 1]  595 	clr	(0x06, sp)
      008A2D 9F               [ 1]  596 	ld	a, xl
      008A2E 0F 07            [ 1]  597 	clr	(0x07, sp)
      008A30 1A 06            [ 1]  598 	or	a, (0x06, sp)
      008A32 02               [ 1]  599 	rlwa	x
      008A33 1A 07            [ 1]  600 	or	a, (0x07, sp)
      008A35 95               [ 1]  601 	ld	xh, a
      008A36 1F 01            [ 2]  602 	ldw	(0x01, sp), x
      008A38                        603 00103$:
                                    604 ;	lib/src/stm8s_i2c.c: 609: if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
      008A38 7B 02            [ 1]  605 	ld	a, (0x02, sp)
      008A3A 14 04            [ 1]  606 	and	a, (0x04, sp)
      008A3C 97               [ 1]  607 	ld	xl, a
      008A3D 7B 01            [ 1]  608 	ld	a, (0x01, sp)
      008A3F 14 03            [ 1]  609 	and	a, (0x03, sp)
      008A41 95               [ 1]  610 	ld	xh, a
      008A42 13 03            [ 2]  611 	cpw	x, (0x03, sp)
      008A44 26 03            [ 1]  612 	jrne	00105$
                                    613 ;	lib/src/stm8s_i2c.c: 612: status = SUCCESS;
      008A46 A6 01            [ 1]  614 	ld	a, #0x01
                                    615 ;	lib/src/stm8s_i2c.c: 617: status = ERROR;
      008A48 21                     616 	.byte 0x21
      008A49                        617 00105$:
      008A49 4F               [ 1]  618 	clr	a
      008A4A                        619 00106$:
                                    620 ;	lib/src/stm8s_i2c.c: 621: return status;
                                    621 ;	lib/src/stm8s_i2c.c: 622: }
      008A4A 5B 08            [ 2]  622 	addw	sp, #8
      008A4C 81               [ 4]  623 	ret
                                    624 ;	lib/src/stm8s_i2c.c: 638: I2C_Event_TypeDef I2C_GetLastEvent(void)
                                    625 ;	-----------------------------------------
                                    626 ;	 function I2C_GetLastEvent
                                    627 ;	-----------------------------------------
      008A4D                        628 _I2C_GetLastEvent:
      008A4D 52 04            [ 2]  629 	sub	sp, #4
                                    630 ;	lib/src/stm8s_i2c.c: 640: __IO uint16_t lastevent = 0;
      008A4F 5F               [ 1]  631 	clrw	x
      008A50 1F 01            [ 2]  632 	ldw	(0x01, sp), x
                                    633 ;	lib/src/stm8s_i2c.c: 644: if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
      008A52 72 05 52 18 07   [ 2]  634 	btjf	0x5218, #2, 00102$
                                    635 ;	lib/src/stm8s_i2c.c: 646: lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
      008A57 AE 00 04         [ 2]  636 	ldw	x, #0x0004
      008A5A 1F 01            [ 2]  637 	ldw	(0x01, sp), x
      008A5C 20 13            [ 2]  638 	jra	00103$
      008A5E                        639 00102$:
                                    640 ;	lib/src/stm8s_i2c.c: 651: flag1 = I2C->SR1;
      008A5E C6 52 17         [ 1]  641 	ld	a, 0x5217
      008A61 6B 04            [ 1]  642 	ld	(0x04, sp), a
      008A63 0F 03            [ 1]  643 	clr	(0x03, sp)
                                    644 ;	lib/src/stm8s_i2c.c: 652: flag2 = I2C->SR3;
      008A65 C6 52 19         [ 1]  645 	ld	a, 0x5219
                                    646 ;	lib/src/stm8s_i2c.c: 655: lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
      008A68 95               [ 1]  647 	ld	xh, a
      008A69 7B 04            [ 1]  648 	ld	a, (0x04, sp)
      008A6B 02               [ 1]  649 	rlwa	x
      008A6C 1A 03            [ 1]  650 	or	a, (0x03, sp)
      008A6E 95               [ 1]  651 	ld	xh, a
      008A6F 1F 01            [ 2]  652 	ldw	(0x01, sp), x
      008A71                        653 00103$:
                                    654 ;	lib/src/stm8s_i2c.c: 658: return (I2C_Event_TypeDef)lastevent;
      008A71 1E 01            [ 2]  655 	ldw	x, (0x01, sp)
                                    656 ;	lib/src/stm8s_i2c.c: 659: }
      008A73 5B 04            [ 2]  657 	addw	sp, #4
      008A75 81               [ 4]  658 	ret
                                    659 ;	lib/src/stm8s_i2c.c: 689: FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
                                    660 ;	-----------------------------------------
                                    661 ;	 function I2C_GetFlagStatus
                                    662 ;	-----------------------------------------
      008A76                        663 _I2C_GetFlagStatus:
      008A76 88               [ 1]  664 	push	a
                                    665 ;	lib/src/stm8s_i2c.c: 691: uint8_t tempreg = 0;
      008A77 0F 01            [ 1]  666 	clr	(0x01, sp)
                                    667 ;	lib/src/stm8s_i2c.c: 699: regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
      008A79 9E               [ 1]  668 	ld	a, xh
                                    669 ;	lib/src/stm8s_i2c.c: 701: switch (regindex)
      008A7A A1 01            [ 1]  670 	cp	a, #0x01
      008A7C 27 0A            [ 1]  671 	jreq	00101$
      008A7E A1 02            [ 1]  672 	cp	a, #0x02
      008A80 27 0D            [ 1]  673 	jreq	00102$
      008A82 A1 03            [ 1]  674 	cp	a, #0x03
      008A84 27 10            [ 1]  675 	jreq	00103$
      008A86 20 13            [ 2]  676 	jra	00105$
                                    677 ;	lib/src/stm8s_i2c.c: 704: case 0x01:
      008A88                        678 00101$:
                                    679 ;	lib/src/stm8s_i2c.c: 705: tempreg = (uint8_t)I2C->SR1;
      008A88 C6 52 17         [ 1]  680 	ld	a, 0x5217
      008A8B 6B 01            [ 1]  681 	ld	(0x01, sp), a
                                    682 ;	lib/src/stm8s_i2c.c: 706: break;
      008A8D 20 0C            [ 2]  683 	jra	00105$
                                    684 ;	lib/src/stm8s_i2c.c: 709: case 0x02:
      008A8F                        685 00102$:
                                    686 ;	lib/src/stm8s_i2c.c: 710: tempreg = (uint8_t)I2C->SR2;
      008A8F C6 52 18         [ 1]  687 	ld	a, 0x5218
      008A92 6B 01            [ 1]  688 	ld	(0x01, sp), a
                                    689 ;	lib/src/stm8s_i2c.c: 711: break;
      008A94 20 05            [ 2]  690 	jra	00105$
                                    691 ;	lib/src/stm8s_i2c.c: 714: case 0x03:
      008A96                        692 00103$:
                                    693 ;	lib/src/stm8s_i2c.c: 715: tempreg = (uint8_t)I2C->SR3;
      008A96 C6 52 19         [ 1]  694 	ld	a, 0x5219
      008A99 6B 01            [ 1]  695 	ld	(0x01, sp), a
                                    696 ;	lib/src/stm8s_i2c.c: 720: }
      008A9B                        697 00105$:
                                    698 ;	lib/src/stm8s_i2c.c: 723: if ((tempreg & (uint8_t)I2C_Flag ) != 0)
      008A9B 9F               [ 1]  699 	ld	a, xl
      008A9C 14 01            [ 1]  700 	and	a, (0x01, sp)
      008A9E 27 03            [ 1]  701 	jreq	00107$
                                    702 ;	lib/src/stm8s_i2c.c: 726: bitstatus = SET;
      008AA0 A6 01            [ 1]  703 	ld	a, #0x01
                                    704 ;	lib/src/stm8s_i2c.c: 731: bitstatus = RESET;
      008AA2 21                     705 	.byte 0x21
      008AA3                        706 00107$:
      008AA3 4F               [ 1]  707 	clr	a
      008AA4                        708 00108$:
                                    709 ;	lib/src/stm8s_i2c.c: 734: return bitstatus;
                                    710 ;	lib/src/stm8s_i2c.c: 735: }
      008AA4 5B 01            [ 2]  711 	addw	sp, #1
      008AA6 81               [ 4]  712 	ret
                                    713 ;	lib/src/stm8s_i2c.c: 769: void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
                                    714 ;	-----------------------------------------
                                    715 ;	 function I2C_ClearFlag
                                    716 ;	-----------------------------------------
      008AA7                        717 _I2C_ClearFlag:
                                    718 ;	lib/src/stm8s_i2c.c: 776: flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
      008AA7 4F               [ 1]  719 	clr	a
      008AA8 95               [ 1]  720 	ld	xh, a
                                    721 ;	lib/src/stm8s_i2c.c: 778: I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
      008AA9 53               [ 2]  722 	cplw	x
      008AAA 9F               [ 1]  723 	ld	a, xl
      008AAB C7 52 18         [ 1]  724 	ld	0x5218, a
                                    725 ;	lib/src/stm8s_i2c.c: 779: }
      008AAE 81               [ 4]  726 	ret
                                    727 ;	lib/src/stm8s_i2c.c: 801: ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
                                    728 ;	-----------------------------------------
                                    729 ;	 function I2C_GetITStatus
                                    730 ;	-----------------------------------------
      008AAF                        731 _I2C_GetITStatus:
      008AAF 52 04            [ 2]  732 	sub	sp, #4
      008AB1 51               [ 1]  733 	exgw	x, y
                                    734 ;	lib/src/stm8s_i2c.c: 804: __IO uint8_t enablestatus = 0;
      008AB2 0F 03            [ 1]  735 	clr	(0x03, sp)
                                    736 ;	lib/src/stm8s_i2c.c: 810: tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
      008AB4 93               [ 1]  737 	ldw	x, y
      008AB5 0F 02            [ 1]  738 	clr	(0x02, sp)
      008AB7 9E               [ 1]  739 	ld	a, xh
      008AB8 A4 07            [ 1]  740 	and	a, #0x07
      008ABA 6B 04            [ 1]  741 	ld	(0x04, sp), a
                                    742 ;	lib/src/stm8s_i2c.c: 813: enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
      008ABC C6 52 1A         [ 1]  743 	ld	a, 0x521a
      008ABF 14 04            [ 1]  744 	and	a, (0x04, sp)
      008AC1 6B 03            [ 1]  745 	ld	(0x03, sp), a
                                    746 ;	lib/src/stm8s_i2c.c: 815: if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
      008AC3 4F               [ 1]  747 	clr	a
      008AC4 02               [ 1]  748 	rlwa	x
      008AC5 A4 30            [ 1]  749 	and	a, #0x30
                                    750 ;	lib/src/stm8s_i2c.c: 818: if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
      008AC7 61               [ 1]  751 	exg	a, yl
      008AC8 6B 04            [ 1]  752 	ld	(0x04, sp), a
      008ACA 61               [ 1]  753 	exg	a, yl
                                    754 ;	lib/src/stm8s_i2c.c: 815: if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
      008ACB 95               [ 1]  755 	ld	xh, a
      008ACC A3 01 00         [ 2]  756 	cpw	x, #0x0100
      008ACF 26 12            [ 1]  757 	jrne	00110$
                                    758 ;	lib/src/stm8s_i2c.c: 818: if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
      008AD1 C6 52 17         [ 1]  759 	ld	a, 0x5217
      008AD4 14 04            [ 1]  760 	and	a, (0x04, sp)
      008AD6 27 08            [ 1]  761 	jreq	00102$
      008AD8 0D 03            [ 1]  762 	tnz	(0x03, sp)
      008ADA 27 04            [ 1]  763 	jreq	00102$
                                    764 ;	lib/src/stm8s_i2c.c: 821: bitstatus = SET;
      008ADC A6 01            [ 1]  765 	ld	a, #0x01
      008ADE 20 12            [ 2]  766 	jra	00111$
      008AE0                        767 00102$:
                                    768 ;	lib/src/stm8s_i2c.c: 826: bitstatus = RESET;
      008AE0 4F               [ 1]  769 	clr	a
      008AE1 20 0F            [ 2]  770 	jra	00111$
      008AE3                        771 00110$:
                                    772 ;	lib/src/stm8s_i2c.c: 832: if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
      008AE3 C6 52 18         [ 1]  773 	ld	a, 0x5218
      008AE6 14 04            [ 1]  774 	and	a, (0x04, sp)
      008AE8 27 07            [ 1]  775 	jreq	00106$
      008AEA 0D 03            [ 1]  776 	tnz	(0x03, sp)
      008AEC 27 03            [ 1]  777 	jreq	00106$
                                    778 ;	lib/src/stm8s_i2c.c: 835: bitstatus = SET;
      008AEE A6 01            [ 1]  779 	ld	a, #0x01
                                    780 ;	lib/src/stm8s_i2c.c: 840: bitstatus = RESET;
      008AF0 21                     781 	.byte 0x21
      008AF1                        782 00106$:
      008AF1 4F               [ 1]  783 	clr	a
      008AF2                        784 00111$:
                                    785 ;	lib/src/stm8s_i2c.c: 844: return  bitstatus;
                                    786 ;	lib/src/stm8s_i2c.c: 845: }
      008AF2 5B 04            [ 2]  787 	addw	sp, #4
      008AF4 81               [ 4]  788 	ret
                                    789 ;	lib/src/stm8s_i2c.c: 881: void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
                                    790 ;	-----------------------------------------
                                    791 ;	 function I2C_ClearITPendingBit
                                    792 ;	-----------------------------------------
      008AF5                        793 _I2C_ClearITPendingBit:
                                    794 ;	lib/src/stm8s_i2c.c: 889: flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
      008AF5 4F               [ 1]  795 	clr	a
      008AF6 95               [ 1]  796 	ld	xh, a
                                    797 ;	lib/src/stm8s_i2c.c: 892: I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
      008AF7 53               [ 2]  798 	cplw	x
      008AF8 9F               [ 1]  799 	ld	a, xl
      008AF9 C7 52 18         [ 1]  800 	ld	0x5218, a
                                    801 ;	lib/src/stm8s_i2c.c: 893: }
      008AFC 81               [ 4]  802 	ret
                                    803 	.area CODE
                                    804 	.area CONST
                                    805 	.area INITIALIZER
                                    806 	.area CABS (ABS)
