   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
   4                     ; Optimizer V4.3.6 - 29 Nov 2011
  48                     ; 67 void I2C_DeInit(void)
  48                     ; 68 {
  50                     	switch	.text
  51  0000               _I2C_DeInit:
  55                     ; 69   I2C->CR1 = I2C_CR1_RESET_VALUE;
  57  0000 725f5210      	clr	21008
  58                     ; 70   I2C->CR2 = I2C_CR2_RESET_VALUE;
  60  0004 725f5211      	clr	21009
  61                     ; 71   I2C->FREQR = I2C_FREQR_RESET_VALUE;
  63  0008 725f5212      	clr	21010
  64                     ; 72   I2C->OARL = I2C_OARL_RESET_VALUE;
  66  000c 725f5213      	clr	21011
  67                     ; 73   I2C->OARH = I2C_OARH_RESET_VALUE;
  69  0010 725f5214      	clr	21012
  70                     ; 74   I2C->ITR = I2C_ITR_RESET_VALUE;
  72  0014 725f521a      	clr	21018
  73                     ; 75   I2C->CCRL = I2C_CCRL_RESET_VALUE;
  75  0018 725f521b      	clr	21019
  76                     ; 76   I2C->CCRH = I2C_CCRH_RESET_VALUE;
  78  001c 725f521c      	clr	21020
  79                     ; 77   I2C->TRISER = I2C_TRISER_RESET_VALUE;
  81  0020 3502521d      	mov	21021,#2
  82                     ; 78 }
  85  0024 81            	ret	
 264                     .const:	section	.text
 265  0000               L01:
 266  0000 000186a1      	dc.l	100001
 267  0004               L21:
 268  0004 000f4240      	dc.l	1000000
 269                     ; 96 void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
 269                     ; 97               I2C_DutyCycle_TypeDef I2C_DutyCycle, I2C_Ack_TypeDef Ack, 
 269                     ; 98               I2C_AddMode_TypeDef AddMode, uint8_t InputClockFrequencyMHz )
 269                     ; 99 {
 270                     	switch	.text
 271  0025               _I2C_Init:
 273  0025 5209          	subw	sp,#9
 274       00000009      OFST:	set	9
 277                     ; 100   uint16_t result = 0x0004;
 279                     ; 101   uint16_t tmpval = 0;
 281                     ; 102   uint8_t tmpccrh = 0;
 283  0027 0f07          	clr	(OFST-2,sp)
 284                     ; 105   assert_param(IS_I2C_ACK_OK(Ack));
 286                     ; 106   assert_param(IS_I2C_ADDMODE_OK(AddMode));
 288                     ; 107   assert_param(IS_I2C_OWN_ADDRESS_OK(OwnAddress));
 290                     ; 108   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));  
 292                     ; 109   assert_param(IS_I2C_INPUT_CLOCK_FREQ_OK(InputClockFrequencyMHz));
 294                     ; 110   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ_OK(OutputClockFrequencyHz));
 296                     ; 115   I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 298  0029 c65212        	ld	a,21010
 299  002c a4c0          	and	a,#192
 300  002e c75212        	ld	21010,a
 301                     ; 117   I2C->FREQR |= InputClockFrequencyMHz;
 303  0031 c65212        	ld	a,21010
 304  0034 1a15          	or	a,(OFST+12,sp)
 305  0036 c75212        	ld	21010,a
 306                     ; 121   I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 308  0039 72115210      	bres	21008,#0
 309                     ; 124   I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 311  003d c6521c        	ld	a,21020
 312  0040 a430          	and	a,#48
 313  0042 c7521c        	ld	21020,a
 314                     ; 125   I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 316  0045 725f521b      	clr	21019
 317                     ; 128   if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 319  0049 96            	ldw	x,sp
 320  004a 1c000c        	addw	x,#OFST+3
 321  004d cd0000        	call	c_ltor
 323  0050 ae0000        	ldw	x,#L01
 324  0053 cd0000        	call	c_lcmp
 326  0056 2560          	jrult	L131
 327                     ; 131     tmpccrh = I2C_CCRH_FS;
 329  0058 a680          	ld	a,#128
 330  005a 6b07          	ld	(OFST-2,sp),a
 331                     ; 133     if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
 333  005c 96            	ldw	x,sp
 334  005d 0d12          	tnz	(OFST+9,sp)
 335  005f 261d          	jrne	L331
 336                     ; 136       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
 338  0061 1c000c        	addw	x,#OFST+3
 339  0064 cd0000        	call	c_ltor
 341  0067 a603          	ld	a,#3
 342  0069 cd0000        	call	c_smul
 344  006c 96            	ldw	x,sp
 345  006d 5c            	incw	x
 346  006e cd0000        	call	c_rtol
 348  0071 7b15          	ld	a,(OFST+12,sp)
 349  0073 cd0119        	call	LC001
 351  0076 96            	ldw	x,sp
 352  0077 cd0127        	call	LC002
 353  007a 1f08          	ldw	(OFST-1,sp),x
 355  007c 2021          	jra	L531
 356  007e               L331:
 357                     ; 141       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
 359  007e 1c000c        	addw	x,#OFST+3
 360  0081 cd0000        	call	c_ltor
 362  0084 a619          	ld	a,#25
 363  0086 cd0000        	call	c_smul
 365  0089 96            	ldw	x,sp
 366  008a 5c            	incw	x
 367  008b cd0000        	call	c_rtol
 369  008e 7b15          	ld	a,(OFST+12,sp)
 370  0090 cd0119        	call	LC001
 372  0093 96            	ldw	x,sp
 373  0094 cd0127        	call	LC002
 374  0097 1f08          	ldw	(OFST-1,sp),x
 375                     ; 143       tmpccrh |= I2C_CCRH_DUTY;
 377  0099 7b07          	ld	a,(OFST-2,sp)
 378  009b aa40          	or	a,#64
 379  009d 6b07          	ld	(OFST-2,sp),a
 380  009f               L531:
 381                     ; 147     if (result < (uint16_t)0x01)
 383  009f 1e08          	ldw	x,(OFST-1,sp)
 384  00a1 2603          	jrne	L731
 385                     ; 150       result = (uint16_t)0x0001;
 387  00a3 5c            	incw	x
 388  00a4 1f08          	ldw	(OFST-1,sp),x
 389  00a6               L731:
 390                     ; 156     tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
 392  00a6 7b15          	ld	a,(OFST+12,sp)
 393  00a8 97            	ld	xl,a
 394  00a9 a603          	ld	a,#3
 395  00ab 42            	mul	x,a
 396  00ac a60a          	ld	a,#10
 397  00ae cd0000        	call	c_sdivx
 399  00b1 5c            	incw	x
 400  00b2 1f05          	ldw	(OFST-4,sp),x
 401                     ; 157     I2C->TRISER = (uint8_t)tmpval;
 403  00b4 7b06          	ld	a,(OFST-3,sp)
 405  00b6 2028          	jra	L141
 406  00b8               L131:
 407                     ; 164     result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
 409  00b8 96            	ldw	x,sp
 410  00b9 1c000c        	addw	x,#OFST+3
 411  00bc cd0000        	call	c_ltor
 413  00bf 3803          	sll	c_lreg+3
 414  00c1 3902          	rlc	c_lreg+2
 415  00c3 3901          	rlc	c_lreg+1
 416  00c5 96            	ldw	x,sp
 417  00c6 3900          	rlc	c_lreg
 418  00c8 5c            	incw	x
 419  00c9 cd0000        	call	c_rtol
 421  00cc 7b15          	ld	a,(OFST+12,sp)
 422  00ce ad49          	call	LC001
 424  00d0 96            	ldw	x,sp
 425  00d1 ad54          	call	LC002
 426                     ; 167     if (result < (uint16_t)0x0004)
 428  00d3 a30004        	cpw	x,#4
 429  00d6 2403          	jruge	L341
 430                     ; 170       result = (uint16_t)0x0004;
 432  00d8 ae0004        	ldw	x,#4
 433  00db               L341:
 434  00db 1f08          	ldw	(OFST-1,sp),x
 435                     ; 176     I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
 437  00dd 7b15          	ld	a,(OFST+12,sp)
 438  00df 4c            	inc	a
 439  00e0               L141:
 440  00e0 c7521d        	ld	21021,a
 441                     ; 181   I2C->CCRL = (uint8_t)result;
 443  00e3 7b09          	ld	a,(OFST+0,sp)
 444  00e5 c7521b        	ld	21019,a
 445                     ; 182   I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 447  00e8 7b08          	ld	a,(OFST-1,sp)
 448  00ea a40f          	and	a,#15
 449  00ec 1a07          	or	a,(OFST-2,sp)
 450  00ee c7521c        	ld	21020,a
 451                     ; 185   I2C->CR1 |= I2C_CR1_PE;
 453  00f1 72105210      	bset	21008,#0
 454                     ; 188   I2C_AcknowledgeConfig(Ack);
 456  00f5 7b13          	ld	a,(OFST+10,sp)
 457  00f7 cd017c        	call	_I2C_AcknowledgeConfig
 459                     ; 191   I2C->OARL = (uint8_t)(OwnAddress);
 461  00fa 7b11          	ld	a,(OFST+8,sp)
 462  00fc c75213        	ld	21011,a
 463                     ; 192   I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
 463                     ; 193                    (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
 465  00ff 7b10          	ld	a,(OFST+7,sp)
 466  0101 a403          	and	a,#3
 467  0103 97            	ld	xl,a
 468  0104 4f            	clr	a
 469  0105 02            	rlwa	x,a
 470  0106 4f            	clr	a
 471  0107 01            	rrwa	x,a
 472  0108 48            	sll	a
 473  0109 59            	rlcw	x
 474  010a 9f            	ld	a,xl
 475  010b 6b04          	ld	(OFST-5,sp),a
 476  010d 7b14          	ld	a,(OFST+11,sp)
 477  010f aa40          	or	a,#64
 478  0111 1a04          	or	a,(OFST-5,sp)
 479  0113 c75214        	ld	21012,a
 480                     ; 194 }
 483  0116 5b09          	addw	sp,#9
 484  0118 81            	ret	
 485  0119               LC001:
 486  0119 b703          	ld	c_lreg+3,a
 487  011b 3f02          	clr	c_lreg+2
 488  011d 3f01          	clr	c_lreg+1
 489  011f 3f00          	clr	c_lreg
 490  0121 ae0004        	ldw	x,#L21
 491  0124 cc0000        	jp	c_lmul
 492  0127               LC002:
 493  0127 5c            	incw	x
 494  0128 cd0000        	call	c_ludv
 496  012b be02          	ldw	x,c_lreg+2
 497  012d 81            	ret	
 552                     ; 202 void I2C_Cmd(FunctionalState NewState)
 552                     ; 203 {
 553                     	switch	.text
 554  012e               _I2C_Cmd:
 558                     ; 205   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 560                     ; 207   if (NewState != DISABLE)
 562  012e 4d            	tnz	a
 563  012f 2705          	jreq	L371
 564                     ; 210     I2C->CR1 |= I2C_CR1_PE;
 566  0131 72105210      	bset	21008,#0
 569  0135 81            	ret	
 570  0136               L371:
 571                     ; 215     I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 573  0136 72115210      	bres	21008,#0
 574                     ; 217 }
 577  013a 81            	ret	
 612                     ; 225 void I2C_GeneralCallCmd(FunctionalState NewState)
 612                     ; 226 {
 613                     	switch	.text
 614  013b               _I2C_GeneralCallCmd:
 618                     ; 228   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 620                     ; 230   if (NewState != DISABLE)
 622  013b 4d            	tnz	a
 623  013c 2705          	jreq	L512
 624                     ; 233     I2C->CR1 |= I2C_CR1_ENGC;
 626  013e 721c5210      	bset	21008,#6
 629  0142 81            	ret	
 630  0143               L512:
 631                     ; 238     I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 633  0143 721d5210      	bres	21008,#6
 634                     ; 240 }
 637  0147 81            	ret	
 672                     ; 250 void I2C_GenerateSTART(FunctionalState NewState)
 672                     ; 251 {
 673                     	switch	.text
 674  0148               _I2C_GenerateSTART:
 678                     ; 253   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 680                     ; 255   if (NewState != DISABLE)
 682  0148 4d            	tnz	a
 683  0149 2705          	jreq	L732
 684                     ; 258     I2C->CR2 |= I2C_CR2_START;
 686  014b 72105211      	bset	21009,#0
 689  014f 81            	ret	
 690  0150               L732:
 691                     ; 263     I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
 693  0150 72115211      	bres	21009,#0
 694                     ; 265 }
 697  0154 81            	ret	
 732                     ; 273 void I2C_GenerateSTOP(FunctionalState NewState)
 732                     ; 274 {
 733                     	switch	.text
 734  0155               _I2C_GenerateSTOP:
 738                     ; 276   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 740                     ; 278   if (NewState != DISABLE)
 742  0155 4d            	tnz	a
 743  0156 2705          	jreq	L162
 744                     ; 281     I2C->CR2 |= I2C_CR2_STOP;
 746  0158 72125211      	bset	21009,#1
 749  015c 81            	ret	
 750  015d               L162:
 751                     ; 286     I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
 753  015d 72135211      	bres	21009,#1
 754                     ; 288 }
 757  0161 81            	ret	
 793                     ; 296 void I2C_SoftwareResetCmd(FunctionalState NewState)
 793                     ; 297 {
 794                     	switch	.text
 795  0162               _I2C_SoftwareResetCmd:
 799                     ; 299   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 801                     ; 301   if (NewState != DISABLE)
 803  0162 4d            	tnz	a
 804  0163 2705          	jreq	L303
 805                     ; 304     I2C->CR2 |= I2C_CR2_SWRST;
 807  0165 721e5211      	bset	21009,#7
 810  0169 81            	ret	
 811  016a               L303:
 812                     ; 309     I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
 814  016a 721f5211      	bres	21009,#7
 815                     ; 311 }
 818  016e 81            	ret	
 854                     ; 320 void I2C_StretchClockCmd(FunctionalState NewState)
 854                     ; 321 {
 855                     	switch	.text
 856  016f               _I2C_StretchClockCmd:
 860                     ; 323   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 862                     ; 325   if (NewState != DISABLE)
 864  016f 4d            	tnz	a
 865  0170 2705          	jreq	L523
 866                     ; 328     I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
 868  0172 721f5210      	bres	21008,#7
 871  0176 81            	ret	
 872  0177               L523:
 873                     ; 334     I2C->CR1 |= I2C_CR1_NOSTRETCH;
 875  0177 721e5210      	bset	21008,#7
 876                     ; 336 }
 879  017b 81            	ret	
 915                     ; 345 void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
 915                     ; 346 {
 916                     	switch	.text
 917  017c               _I2C_AcknowledgeConfig:
 919  017c 88            	push	a
 920       00000000      OFST:	set	0
 923                     ; 348   assert_param(IS_I2C_ACK_OK(Ack));
 925                     ; 350   if (Ack == I2C_ACK_NONE)
 927  017d 4d            	tnz	a
 928  017e 2606          	jrne	L743
 929                     ; 353     I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
 931  0180 72155211      	bres	21009,#2
 933  0184 2013          	jra	L153
 934  0186               L743:
 935                     ; 358     I2C->CR2 |= I2C_CR2_ACK;
 937  0186 72145211      	bset	21009,#2
 938                     ; 360     if (Ack == I2C_ACK_CURR)
 940  018a 7b01          	ld	a,(OFST+1,sp)
 941  018c 4a            	dec	a
 942  018d 2606          	jrne	L353
 943                     ; 363       I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
 945  018f 72175211      	bres	21009,#3
 947  0193 2004          	jra	L153
 948  0195               L353:
 949                     ; 368       I2C->CR2 |= I2C_CR2_POS;
 951  0195 72165211      	bset	21009,#3
 952  0199               L153:
 953                     ; 371 }
 956  0199 84            	pop	a
 957  019a 81            	ret	
1029                     ; 381 void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
1029                     ; 382 {
1030                     	switch	.text
1031  019b               _I2C_ITConfig:
1033  019b 89            	pushw	x
1034       00000000      OFST:	set	0
1037                     ; 384   assert_param(IS_I2C_INTERRUPT_OK(I2C_IT));
1039                     ; 385   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1041                     ; 387   if (NewState != DISABLE)
1043  019c 9f            	ld	a,xl
1044  019d 4d            	tnz	a
1045  019e 2706          	jreq	L314
1046                     ; 390     I2C->ITR |= (uint8_t)I2C_IT;
1048  01a0 9e            	ld	a,xh
1049  01a1 ca521a        	or	a,21018
1051  01a4 2006          	jra	L514
1052  01a6               L314:
1053                     ; 395     I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
1055  01a6 7b01          	ld	a,(OFST+1,sp)
1056  01a8 43            	cpl	a
1057  01a9 c4521a        	and	a,21018
1058  01ac               L514:
1059  01ac c7521a        	ld	21018,a
1060                     ; 397 }
1063  01af 85            	popw	x
1064  01b0 81            	ret	
1100                     ; 405 void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
1100                     ; 406 {
1101                     	switch	.text
1102  01b1               _I2C_FastModeDutyCycleConfig:
1106                     ; 408   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));
1108                     ; 410   if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
1110  01b1 a140          	cp	a,#64
1111  01b3 2605          	jrne	L534
1112                     ; 413     I2C->CCRH |= I2C_CCRH_DUTY;
1114  01b5 721c521c      	bset	21020,#6
1117  01b9 81            	ret	
1118  01ba               L534:
1119                     ; 418     I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1121  01ba 721d521c      	bres	21020,#6
1122                     ; 420 }
1125  01be 81            	ret	
1148                     ; 427 uint8_t I2C_ReceiveData(void)
1148                     ; 428 {
1149                     	switch	.text
1150  01bf               _I2C_ReceiveData:
1154                     ; 430   return ((uint8_t)I2C->DR);
1156  01bf c65216        	ld	a,21014
1159  01c2 81            	ret	
1224                     ; 440 void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
1224                     ; 441 {
1225                     	switch	.text
1226  01c3               _I2C_Send7bitAddress:
1228  01c3 89            	pushw	x
1229       00000000      OFST:	set	0
1232                     ; 443   assert_param(IS_I2C_ADDRESS_OK(Address));
1234                     ; 444   assert_param(IS_I2C_DIRECTION_OK(Direction));
1236                     ; 447   Address &= (uint8_t)0xFE;
1238  01c4 7b01          	ld	a,(OFST+1,sp)
1239  01c6 a4fe          	and	a,#254
1240  01c8 6b01          	ld	(OFST+1,sp),a
1241                     ; 450   I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
1243  01ca 1a02          	or	a,(OFST+2,sp)
1244  01cc c75216        	ld	21014,a
1245                     ; 451 }
1248  01cf 85            	popw	x
1249  01d0 81            	ret	
1283                     ; 458 void I2C_SendData(uint8_t Data)
1283                     ; 459 {
1284                     	switch	.text
1285  01d1               _I2C_SendData:
1289                     ; 461   I2C->DR = Data;
1291  01d1 c75216        	ld	21014,a
1292                     ; 462 }
1295  01d4 81            	ret	
1519                     ; 578 ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
1519                     ; 579 {
1520                     	switch	.text
1521  01d5               _I2C_CheckEvent:
1523  01d5 89            	pushw	x
1524  01d6 5206          	subw	sp,#6
1525       00000006      OFST:	set	6
1528                     ; 580   __IO uint16_t lastevent = 0x00;
1530  01d8 5f            	clrw	x
1531  01d9 1f04          	ldw	(OFST-2,sp),x
1532                     ; 581   uint8_t flag1 = 0x00 ;
1534                     ; 582   uint8_t flag2 = 0x00;
1536                     ; 583   ErrorStatus status = ERROR;
1538                     ; 586   assert_param(IS_I2C_EVENT_OK(I2C_Event));
1540                     ; 588   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
1542  01db 1e07          	ldw	x,(OFST+1,sp)
1543  01dd a30004        	cpw	x,#4
1544  01e0 2609          	jrne	L136
1545                     ; 590     lastevent = I2C->SR2 & I2C_SR2_AF;
1547  01e2 c65218        	ld	a,21016
1548  01e5 a404          	and	a,#4
1549  01e7 5f            	clrw	x
1550  01e8 97            	ld	xl,a
1552  01e9 201a          	jra	L336
1553  01eb               L136:
1554                     ; 594     flag1 = I2C->SR1;
1556  01eb c65217        	ld	a,21015
1557  01ee 6b03          	ld	(OFST-3,sp),a
1558                     ; 595     flag2 = I2C->SR3;
1560  01f0 c65219        	ld	a,21017
1561  01f3 6b06          	ld	(OFST+0,sp),a
1562                     ; 596     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
1564  01f5 5f            	clrw	x
1565  01f6 7b03          	ld	a,(OFST-3,sp)
1566  01f8 97            	ld	xl,a
1567  01f9 1f01          	ldw	(OFST-5,sp),x
1568  01fb 5f            	clrw	x
1569  01fc 7b06          	ld	a,(OFST+0,sp)
1570  01fe 97            	ld	xl,a
1571  01ff 7b02          	ld	a,(OFST-4,sp)
1572  0201 01            	rrwa	x,a
1573  0202 1a01          	or	a,(OFST-5,sp)
1574  0204 01            	rrwa	x,a
1575  0205               L336:
1576  0205 1f04          	ldw	(OFST-2,sp),x
1577                     ; 599   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
1579  0207 1e04          	ldw	x,(OFST-2,sp)
1580  0209 01            	rrwa	x,a
1581  020a 1408          	and	a,(OFST+2,sp)
1582  020c 01            	rrwa	x,a
1583  020d 1407          	and	a,(OFST+1,sp)
1584  020f 01            	rrwa	x,a
1585  0210 1307          	cpw	x,(OFST+1,sp)
1586  0212 2604          	jrne	L536
1587                     ; 602     status = SUCCESS;
1589  0214 a601          	ld	a,#1
1591  0216 2001          	jra	L736
1592  0218               L536:
1593                     ; 607     status = ERROR;
1595  0218 4f            	clr	a
1596  0219               L736:
1597                     ; 611   return status;
1601  0219 5b08          	addw	sp,#8
1602  021b 81            	ret	
1655                     ; 628 I2C_Event_TypeDef I2C_GetLastEvent(void)
1655                     ; 629 {
1656                     	switch	.text
1657  021c               _I2C_GetLastEvent:
1659  021c 5206          	subw	sp,#6
1660       00000006      OFST:	set	6
1663                     ; 630   __IO uint16_t lastevent = 0;
1665  021e 5f            	clrw	x
1666  021f 1f05          	ldw	(OFST-1,sp),x
1667                     ; 631   uint16_t flag1 = 0;
1669                     ; 632   uint16_t flag2 = 0;
1671                     ; 634   if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
1673  0221 7205521805    	btjf	21016,#2,L766
1674                     ; 636     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
1676  0226 ae0004        	ldw	x,#4
1678  0229 2013          	jra	L176
1679  022b               L766:
1680                     ; 641     flag1 = I2C->SR1;
1682  022b c65217        	ld	a,21015
1683  022e 97            	ld	xl,a
1684  022f 1f01          	ldw	(OFST-5,sp),x
1685                     ; 642     flag2 = I2C->SR3;
1687  0231 5f            	clrw	x
1688  0232 c65219        	ld	a,21017
1689  0235 97            	ld	xl,a
1690  0236 1f03          	ldw	(OFST-3,sp),x
1691                     ; 645     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
1693  0238 7b02          	ld	a,(OFST-4,sp)
1694  023a 01            	rrwa	x,a
1695  023b 1a01          	or	a,(OFST-5,sp)
1696  023d 01            	rrwa	x,a
1697  023e               L176:
1698  023e 1f05          	ldw	(OFST-1,sp),x
1699                     ; 648   return (I2C_Event_TypeDef)lastevent;
1701  0240 1e05          	ldw	x,(OFST-1,sp)
1704  0242 5b06          	addw	sp,#6
1705  0244 81            	ret	
1920                     ; 679 FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
1920                     ; 680 {
1921                     	switch	.text
1922  0245               _I2C_GetFlagStatus:
1924  0245 89            	pushw	x
1925  0246 89            	pushw	x
1926       00000002      OFST:	set	2
1929                     ; 681   uint8_t tempreg = 0;
1931  0247 0f02          	clr	(OFST+0,sp)
1932                     ; 682   uint8_t regindex = 0;
1934                     ; 683   FlagStatus bitstatus = RESET;
1936                     ; 686   assert_param(IS_I2C_FLAG_OK(I2C_Flag));
1938                     ; 689   regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
1940  0249 9e            	ld	a,xh
1941  024a 6b01          	ld	(OFST-1,sp),a
1942                     ; 691   switch (regindex)
1945                     ; 708     default:
1945                     ; 709       break;
1946  024c 4a            	dec	a
1947  024d 2708          	jreq	L376
1948  024f 4a            	dec	a
1949  0250 270a          	jreq	L576
1950  0252 4a            	dec	a
1951  0253 270c          	jreq	L776
1952  0255 200f          	jra	L3101
1953  0257               L376:
1954                     ; 694     case 0x01:
1954                     ; 695       tempreg = (uint8_t)I2C->SR1;
1956  0257 c65217        	ld	a,21015
1957                     ; 696       break;
1959  025a 2008          	jp	LC003
1960  025c               L576:
1961                     ; 699     case 0x02:
1961                     ; 700       tempreg = (uint8_t)I2C->SR2;
1963  025c c65218        	ld	a,21016
1964                     ; 701       break;
1966  025f 2003          	jp	LC003
1967  0261               L776:
1968                     ; 704     case 0x03:
1968                     ; 705       tempreg = (uint8_t)I2C->SR3;
1970  0261 c65219        	ld	a,21017
1971  0264               LC003:
1972  0264 6b02          	ld	(OFST+0,sp),a
1973                     ; 706       break;
1975                     ; 708     default:
1975                     ; 709       break;
1977  0266               L3101:
1978                     ; 713   if ((tempreg & (uint8_t)I2C_Flag ) != 0)
1980  0266 7b04          	ld	a,(OFST+2,sp)
1981  0268 1502          	bcp	a,(OFST+0,sp)
1982  026a 2704          	jreq	L5101
1983                     ; 716     bitstatus = SET;
1985  026c a601          	ld	a,#1
1987  026e 2001          	jra	L7101
1988  0270               L5101:
1989                     ; 721     bitstatus = RESET;
1991  0270 4f            	clr	a
1992  0271               L7101:
1993                     ; 724   return bitstatus;
1997  0271 5b04          	addw	sp,#4
1998  0273 81            	ret	
2042                     ; 759 void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
2042                     ; 760 {
2043                     	switch	.text
2044  0274               _I2C_ClearFlag:
2046  0274 89            	pushw	x
2047       00000002      OFST:	set	2
2050                     ; 761   uint16_t flagpos = 0;
2052                     ; 763   assert_param(IS_I2C_CLEAR_FLAG_OK(I2C_FLAG));
2054                     ; 766   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
2056  0275 01            	rrwa	x,a
2057  0276 5f            	clrw	x
2058  0277 02            	rlwa	x,a
2059  0278 1f01          	ldw	(OFST-1,sp),x
2060                     ; 768   I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
2062  027a 7b02          	ld	a,(OFST+0,sp)
2063  027c 43            	cpl	a
2064  027d c75218        	ld	21016,a
2065                     ; 769 }
2068  0280 85            	popw	x
2069  0281 81            	ret	
2235                     ; 791 ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2235                     ; 792 {
2236                     	switch	.text
2237  0282               _I2C_GetITStatus:
2239  0282 89            	pushw	x
2240  0283 5204          	subw	sp,#4
2241       00000004      OFST:	set	4
2244                     ; 793   ITStatus bitstatus = RESET;
2246                     ; 794   __IO uint8_t enablestatus = 0;
2248  0285 0f03          	clr	(OFST-1,sp)
2249                     ; 795   uint16_t tempregister = 0;
2251                     ; 798     assert_param(IS_I2C_ITPENDINGBIT_OK(I2C_ITPendingBit));
2253                     ; 800   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
2255  0287 01            	rrwa	x,a
2256  0288 9f            	ld	a,xl
2257  0289 a407          	and	a,#7
2258  028b 97            	ld	xl,a
2259  028c 4f            	clr	a
2260  028d 02            	rlwa	x,a
2261  028e 4f            	clr	a
2262  028f 01            	rrwa	x,a
2263  0290 9f            	ld	a,xl
2264  0291 5f            	clrw	x
2265  0292 97            	ld	xl,a
2266  0293 1f01          	ldw	(OFST-3,sp),x
2267                     ; 803   enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
2269  0295 c6521a        	ld	a,21018
2270  0298 1402          	and	a,(OFST-2,sp)
2271  029a 6b03          	ld	(OFST-1,sp),a
2272                     ; 805   if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
2274  029c 7b05          	ld	a,(OFST+1,sp)
2275  029e a430          	and	a,#48
2276  02a0 97            	ld	xl,a
2277  02a1 4f            	clr	a
2278  02a2 02            	rlwa	x,a
2279  02a3 a30100        	cpw	x,#256
2280  02a6 260d          	jrne	L1311
2281                     ; 808     if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2283  02a8 c65217        	ld	a,21015
2284  02ab 1506          	bcp	a,(OFST+2,sp)
2285  02ad 2715          	jreq	L1411
2287  02af 0d03          	tnz	(OFST-1,sp)
2288  02b1 2711          	jreq	L1411
2289                     ; 811       bitstatus = SET;
2291  02b3 200b          	jp	LC005
2292                     ; 816       bitstatus = RESET;
2293  02b5               L1311:
2294                     ; 822     if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2296  02b5 c65218        	ld	a,21016
2297  02b8 1506          	bcp	a,(OFST+2,sp)
2298  02ba 2708          	jreq	L1411
2300  02bc 0d03          	tnz	(OFST-1,sp)
2301  02be 2704          	jreq	L1411
2302                     ; 825       bitstatus = SET;
2304  02c0               LC005:
2306  02c0 a601          	ld	a,#1
2308  02c2 2001          	jra	L7311
2309  02c4               L1411:
2310                     ; 830       bitstatus = RESET;
2313  02c4 4f            	clr	a
2314  02c5               L7311:
2315                     ; 834   return  bitstatus;
2319  02c5 5b06          	addw	sp,#6
2320  02c7 81            	ret	
2365                     ; 871 void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2365                     ; 872 {
2366                     	switch	.text
2367  02c8               _I2C_ClearITPendingBit:
2369  02c8 89            	pushw	x
2370       00000002      OFST:	set	2
2373                     ; 873   uint16_t flagpos = 0;
2375                     ; 876   assert_param(IS_I2C_CLEAR_ITPENDINGBIT_OK(I2C_ITPendingBit));
2377                     ; 879   flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
2379  02c9 01            	rrwa	x,a
2380  02ca 5f            	clrw	x
2381  02cb 02            	rlwa	x,a
2382  02cc 1f01          	ldw	(OFST-1,sp),x
2383                     ; 882   I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
2385  02ce 7b02          	ld	a,(OFST+0,sp)
2386  02d0 43            	cpl	a
2387  02d1 c75218        	ld	21016,a
2388                     ; 883 }
2391  02d4 85            	popw	x
2392  02d5 81            	ret	
2405                     	xdef	_I2C_ClearITPendingBit
2406                     	xdef	_I2C_GetITStatus
2407                     	xdef	_I2C_ClearFlag
2408                     	xdef	_I2C_GetFlagStatus
2409                     	xdef	_I2C_GetLastEvent
2410                     	xdef	_I2C_CheckEvent
2411                     	xdef	_I2C_SendData
2412                     	xdef	_I2C_Send7bitAddress
2413                     	xdef	_I2C_ReceiveData
2414                     	xdef	_I2C_ITConfig
2415                     	xdef	_I2C_FastModeDutyCycleConfig
2416                     	xdef	_I2C_AcknowledgeConfig
2417                     	xdef	_I2C_StretchClockCmd
2418                     	xdef	_I2C_SoftwareResetCmd
2419                     	xdef	_I2C_GenerateSTOP
2420                     	xdef	_I2C_GenerateSTART
2421                     	xdef	_I2C_GeneralCallCmd
2422                     	xdef	_I2C_Cmd
2423                     	xdef	_I2C_Init
2424                     	xdef	_I2C_DeInit
2425                     	xref.b	c_lreg
2426                     	xref.b	c_x
2445                     	xref	c_sdivx
2446                     	xref	c_ludv
2447                     	xref	c_rtol
2448                     	xref	c_smul
2449                     	xref	c_lmul
2450                     	xref	c_lcmp
2451                     	xref	c_ltor
2452                     	end
