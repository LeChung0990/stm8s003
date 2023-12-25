   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  44                     ; 67 void I2C_DeInit(void)
  44                     ; 68 {
  46                     	switch	.text
  47  0000               _I2C_DeInit:
  51                     ; 69   I2C->CR1 = I2C_CR1_RESET_VALUE;
  53  0000 725f5210      	clr	21008
  54                     ; 70   I2C->CR2 = I2C_CR2_RESET_VALUE;
  56  0004 725f5211      	clr	21009
  57                     ; 71   I2C->FREQR = I2C_FREQR_RESET_VALUE;
  59  0008 725f5212      	clr	21010
  60                     ; 72   I2C->OARL = I2C_OARL_RESET_VALUE;
  62  000c 725f5213      	clr	21011
  63                     ; 73   I2C->OARH = I2C_OARH_RESET_VALUE;
  65  0010 725f5214      	clr	21012
  66                     ; 74   I2C->ITR = I2C_ITR_RESET_VALUE;
  68  0014 725f521a      	clr	21018
  69                     ; 75   I2C->CCRL = I2C_CCRL_RESET_VALUE;
  71  0018 725f521b      	clr	21019
  72                     ; 76   I2C->CCRH = I2C_CCRH_RESET_VALUE;
  74  001c 725f521c      	clr	21020
  75                     ; 77   I2C->TRISER = I2C_TRISER_RESET_VALUE;
  77  0020 3502521d      	mov	21021,#2
  78                     ; 78 }
  81  0024 81            	ret
 260                     .const:	section	.text
 261  0000               L01:
 262  0000 000186a1      	dc.l	100001
 263  0004               L21:
 264  0004 000f4240      	dc.l	1000000
 265                     ; 96 void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
 265                     ; 97               I2C_DutyCycle_TypeDef I2C_DutyCycle, I2C_Ack_TypeDef Ack, 
 265                     ; 98               I2C_AddMode_TypeDef AddMode, uint8_t InputClockFrequencyMHz )
 265                     ; 99 {
 266                     	switch	.text
 267  0025               _I2C_Init:
 269  0025 5209          	subw	sp,#9
 270       00000009      OFST:	set	9
 273                     ; 100   uint16_t result = 0x0004;
 275                     ; 101   uint16_t tmpval = 0;
 277                     ; 102   uint8_t tmpccrh = 0;
 279  0027 0f07          	clr	(OFST-2,sp)
 280                     ; 105   assert_param(IS_I2C_ACK_OK(Ack));
 282                     ; 106   assert_param(IS_I2C_ADDMODE_OK(AddMode));
 284                     ; 107   assert_param(IS_I2C_OWN_ADDRESS_OK(OwnAddress));
 286                     ; 108   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));  
 288                     ; 109   assert_param(IS_I2C_INPUT_CLOCK_FREQ_OK(InputClockFrequencyMHz));
 290                     ; 110   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ_OK(OutputClockFrequencyHz));
 292                     ; 115   I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 294  0029 c65212        	ld	a,21010
 295  002c a4c0          	and	a,#192
 296  002e c75212        	ld	21010,a
 297                     ; 117   I2C->FREQR |= InputClockFrequencyMHz;
 299  0031 c65212        	ld	a,21010
 300  0034 1a15          	or	a,(OFST+12,sp)
 301  0036 c75212        	ld	21010,a
 302                     ; 121   I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 304  0039 72115210      	bres	21008,#0
 305                     ; 124   I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 307  003d c6521c        	ld	a,21020
 308  0040 a430          	and	a,#48
 309  0042 c7521c        	ld	21020,a
 310                     ; 125   I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 312  0045 725f521b      	clr	21019
 313                     ; 128   if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 315  0049 96            	ldw	x,sp
 316  004a 1c000c        	addw	x,#OFST+3
 317  004d cd0000        	call	c_ltor
 319  0050 ae0000        	ldw	x,#L01
 320  0053 cd0000        	call	c_lcmp
 322  0056 2403          	jruge	L41
 323  0058 cc00e5        	jp	L131
 324  005b               L41:
 325                     ; 131     tmpccrh = I2C_CCRH_FS;
 327  005b a680          	ld	a,#128
 328  005d 6b07          	ld	(OFST-2,sp),a
 329                     ; 133     if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
 331  005f 0d12          	tnz	(OFST+9,sp)
 332  0061 2630          	jrne	L331
 333                     ; 136       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
 335  0063 96            	ldw	x,sp
 336  0064 1c000c        	addw	x,#OFST+3
 337  0067 cd0000        	call	c_ltor
 339  006a a603          	ld	a,#3
 340  006c cd0000        	call	c_smul
 342  006f 96            	ldw	x,sp
 343  0070 1c0001        	addw	x,#OFST-8
 344  0073 cd0000        	call	c_rtol
 346  0076 7b15          	ld	a,(OFST+12,sp)
 347  0078 b703          	ld	c_lreg+3,a
 348  007a 3f02          	clr	c_lreg+2
 349  007c 3f01          	clr	c_lreg+1
 350  007e 3f00          	clr	c_lreg
 351  0080 ae0004        	ldw	x,#L21
 352  0083 cd0000        	call	c_lmul
 354  0086 96            	ldw	x,sp
 355  0087 1c0001        	addw	x,#OFST-8
 356  008a cd0000        	call	c_ludv
 358  008d be02          	ldw	x,c_lreg+2
 359  008f 1f08          	ldw	(OFST-1,sp),x
 361  0091 2034          	jra	L531
 362  0093               L331:
 363                     ; 141       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
 365  0093 96            	ldw	x,sp
 366  0094 1c000c        	addw	x,#OFST+3
 367  0097 cd0000        	call	c_ltor
 369  009a a619          	ld	a,#25
 370  009c cd0000        	call	c_smul
 372  009f 96            	ldw	x,sp
 373  00a0 1c0001        	addw	x,#OFST-8
 374  00a3 cd0000        	call	c_rtol
 376  00a6 7b15          	ld	a,(OFST+12,sp)
 377  00a8 b703          	ld	c_lreg+3,a
 378  00aa 3f02          	clr	c_lreg+2
 379  00ac 3f01          	clr	c_lreg+1
 380  00ae 3f00          	clr	c_lreg
 381  00b0 ae0004        	ldw	x,#L21
 382  00b3 cd0000        	call	c_lmul
 384  00b6 96            	ldw	x,sp
 385  00b7 1c0001        	addw	x,#OFST-8
 386  00ba cd0000        	call	c_ludv
 388  00bd be02          	ldw	x,c_lreg+2
 389  00bf 1f08          	ldw	(OFST-1,sp),x
 390                     ; 143       tmpccrh |= I2C_CCRH_DUTY;
 392  00c1 7b07          	ld	a,(OFST-2,sp)
 393  00c3 aa40          	or	a,#64
 394  00c5 6b07          	ld	(OFST-2,sp),a
 395  00c7               L531:
 396                     ; 147     if (result < (uint16_t)0x01)
 398  00c7 1e08          	ldw	x,(OFST-1,sp)
 399  00c9 2605          	jrne	L731
 400                     ; 150       result = (uint16_t)0x0001;
 402  00cb ae0001        	ldw	x,#1
 403  00ce 1f08          	ldw	(OFST-1,sp),x
 404  00d0               L731:
 405                     ; 156     tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
 407  00d0 7b15          	ld	a,(OFST+12,sp)
 408  00d2 97            	ld	xl,a
 409  00d3 a603          	ld	a,#3
 410  00d5 42            	mul	x,a
 411  00d6 a60a          	ld	a,#10
 412  00d8 cd0000        	call	c_sdivx
 414  00db 5c            	incw	x
 415  00dc 1f05          	ldw	(OFST-4,sp),x
 416                     ; 157     I2C->TRISER = (uint8_t)tmpval;
 418  00de 7b06          	ld	a,(OFST-3,sp)
 419  00e0 c7521d        	ld	21021,a
 421  00e3 2043          	jra	L141
 422  00e5               L131:
 423                     ; 164     result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
 425  00e5 96            	ldw	x,sp
 426  00e6 1c000c        	addw	x,#OFST+3
 427  00e9 cd0000        	call	c_ltor
 429  00ec 3803          	sll	c_lreg+3
 430  00ee 3902          	rlc	c_lreg+2
 431  00f0 3901          	rlc	c_lreg+1
 432  00f2 3900          	rlc	c_lreg
 433  00f4 96            	ldw	x,sp
 434  00f5 1c0001        	addw	x,#OFST-8
 435  00f8 cd0000        	call	c_rtol
 437  00fb 7b15          	ld	a,(OFST+12,sp)
 438  00fd b703          	ld	c_lreg+3,a
 439  00ff 3f02          	clr	c_lreg+2
 440  0101 3f01          	clr	c_lreg+1
 441  0103 3f00          	clr	c_lreg
 442  0105 ae0004        	ldw	x,#L21
 443  0108 cd0000        	call	c_lmul
 445  010b 96            	ldw	x,sp
 446  010c 1c0001        	addw	x,#OFST-8
 447  010f cd0000        	call	c_ludv
 449  0112 be02          	ldw	x,c_lreg+2
 450  0114 1f08          	ldw	(OFST-1,sp),x
 451                     ; 167     if (result < (uint16_t)0x0004)
 453  0116 1e08          	ldw	x,(OFST-1,sp)
 454  0118 a30004        	cpw	x,#4
 455  011b 2405          	jruge	L341
 456                     ; 170       result = (uint16_t)0x0004;
 458  011d ae0004        	ldw	x,#4
 459  0120 1f08          	ldw	(OFST-1,sp),x
 460  0122               L341:
 461                     ; 176     I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
 463  0122 7b15          	ld	a,(OFST+12,sp)
 464  0124 4c            	inc	a
 465  0125 c7521d        	ld	21021,a
 466  0128               L141:
 467                     ; 181   I2C->CCRL = (uint8_t)result;
 469  0128 7b09          	ld	a,(OFST+0,sp)
 470  012a c7521b        	ld	21019,a
 471                     ; 182   I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 473  012d 7b08          	ld	a,(OFST-1,sp)
 474  012f a40f          	and	a,#15
 475  0131 1a07          	or	a,(OFST-2,sp)
 476  0133 c7521c        	ld	21020,a
 477                     ; 185   I2C->CR1 |= I2C_CR1_PE;
 479  0136 72105210      	bset	21008,#0
 480                     ; 188   I2C_AcknowledgeConfig(Ack);
 482  013a 7b13          	ld	a,(OFST+10,sp)
 483  013c ad77          	call	_I2C_AcknowledgeConfig
 485                     ; 191   I2C->OARL = (uint8_t)(OwnAddress);
 487  013e 7b11          	ld	a,(OFST+8,sp)
 488  0140 c75213        	ld	21011,a
 489                     ; 192   I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
 489                     ; 193                    (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
 491  0143 7b10          	ld	a,(OFST+7,sp)
 492  0145 97            	ld	xl,a
 493  0146 7b11          	ld	a,(OFST+8,sp)
 494  0148 9f            	ld	a,xl
 495  0149 a403          	and	a,#3
 496  014b 97            	ld	xl,a
 497  014c 4f            	clr	a
 498  014d 02            	rlwa	x,a
 499  014e 4f            	clr	a
 500  014f 01            	rrwa	x,a
 501  0150 48            	sll	a
 502  0151 59            	rlcw	x
 503  0152 9f            	ld	a,xl
 504  0153 6b04          	ld	(OFST-5,sp),a
 505  0155 7b14          	ld	a,(OFST+11,sp)
 506  0157 aa40          	or	a,#64
 507  0159 1a04          	or	a,(OFST-5,sp)
 508  015b c75214        	ld	21012,a
 509                     ; 194 }
 512  015e 5b09          	addw	sp,#9
 513  0160 81            	ret
 568                     ; 202 void I2C_Cmd(FunctionalState NewState)
 568                     ; 203 {
 569                     	switch	.text
 570  0161               _I2C_Cmd:
 574                     ; 205   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 576                     ; 207   if (NewState != DISABLE)
 578  0161 4d            	tnz	a
 579  0162 2706          	jreq	L371
 580                     ; 210     I2C->CR1 |= I2C_CR1_PE;
 582  0164 72105210      	bset	21008,#0
 584  0168 2004          	jra	L571
 585  016a               L371:
 586                     ; 215     I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 588  016a 72115210      	bres	21008,#0
 589  016e               L571:
 590                     ; 217 }
 593  016e 81            	ret
 628                     ; 225 void I2C_GeneralCallCmd(FunctionalState NewState)
 628                     ; 226 {
 629                     	switch	.text
 630  016f               _I2C_GeneralCallCmd:
 634                     ; 228   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 636                     ; 230   if (NewState != DISABLE)
 638  016f 4d            	tnz	a
 639  0170 2706          	jreq	L512
 640                     ; 233     I2C->CR1 |= I2C_CR1_ENGC;
 642  0172 721c5210      	bset	21008,#6
 644  0176 2004          	jra	L712
 645  0178               L512:
 646                     ; 238     I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 648  0178 721d5210      	bres	21008,#6
 649  017c               L712:
 650                     ; 240 }
 653  017c 81            	ret
 688                     ; 250 void I2C_GenerateSTART(FunctionalState NewState)
 688                     ; 251 {
 689                     	switch	.text
 690  017d               _I2C_GenerateSTART:
 694                     ; 253   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 696                     ; 255   if (NewState != DISABLE)
 698  017d 4d            	tnz	a
 699  017e 2706          	jreq	L732
 700                     ; 258     I2C->CR2 |= I2C_CR2_START;
 702  0180 72105211      	bset	21009,#0
 704  0184 2004          	jra	L142
 705  0186               L732:
 706                     ; 263     I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
 708  0186 72115211      	bres	21009,#0
 709  018a               L142:
 710                     ; 265 }
 713  018a 81            	ret
 748                     ; 273 void I2C_GenerateSTOP(FunctionalState NewState)
 748                     ; 274 {
 749                     	switch	.text
 750  018b               _I2C_GenerateSTOP:
 754                     ; 276   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 756                     ; 278   if (NewState != DISABLE)
 758  018b 4d            	tnz	a
 759  018c 2706          	jreq	L162
 760                     ; 281     I2C->CR2 |= I2C_CR2_STOP;
 762  018e 72125211      	bset	21009,#1
 764  0192 2004          	jra	L362
 765  0194               L162:
 766                     ; 286     I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
 768  0194 72135211      	bres	21009,#1
 769  0198               L362:
 770                     ; 288 }
 773  0198 81            	ret
 809                     ; 296 void I2C_SoftwareResetCmd(FunctionalState NewState)
 809                     ; 297 {
 810                     	switch	.text
 811  0199               _I2C_SoftwareResetCmd:
 815                     ; 299   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 817                     ; 301   if (NewState != DISABLE)
 819  0199 4d            	tnz	a
 820  019a 2706          	jreq	L303
 821                     ; 304     I2C->CR2 |= I2C_CR2_SWRST;
 823  019c 721e5211      	bset	21009,#7
 825  01a0 2004          	jra	L503
 826  01a2               L303:
 827                     ; 309     I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
 829  01a2 721f5211      	bres	21009,#7
 830  01a6               L503:
 831                     ; 311 }
 834  01a6 81            	ret
 870                     ; 320 void I2C_StretchClockCmd(FunctionalState NewState)
 870                     ; 321 {
 871                     	switch	.text
 872  01a7               _I2C_StretchClockCmd:
 876                     ; 323   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 878                     ; 325   if (NewState != DISABLE)
 880  01a7 4d            	tnz	a
 881  01a8 2706          	jreq	L523
 882                     ; 328     I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
 884  01aa 721f5210      	bres	21008,#7
 886  01ae 2004          	jra	L723
 887  01b0               L523:
 888                     ; 334     I2C->CR1 |= I2C_CR1_NOSTRETCH;
 890  01b0 721e5210      	bset	21008,#7
 891  01b4               L723:
 892                     ; 336 }
 895  01b4 81            	ret
 931                     ; 345 void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
 931                     ; 346 {
 932                     	switch	.text
 933  01b5               _I2C_AcknowledgeConfig:
 935  01b5 88            	push	a
 936       00000000      OFST:	set	0
 939                     ; 348   assert_param(IS_I2C_ACK_OK(Ack));
 941                     ; 350   if (Ack == I2C_ACK_NONE)
 943  01b6 4d            	tnz	a
 944  01b7 2606          	jrne	L743
 945                     ; 353     I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
 947  01b9 72155211      	bres	21009,#2
 949  01bd 2014          	jra	L153
 950  01bf               L743:
 951                     ; 358     I2C->CR2 |= I2C_CR2_ACK;
 953  01bf 72145211      	bset	21009,#2
 954                     ; 360     if (Ack == I2C_ACK_CURR)
 956  01c3 7b01          	ld	a,(OFST+1,sp)
 957  01c5 a101          	cp	a,#1
 958  01c7 2606          	jrne	L353
 959                     ; 363       I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
 961  01c9 72175211      	bres	21009,#3
 963  01cd 2004          	jra	L153
 964  01cf               L353:
 965                     ; 368       I2C->CR2 |= I2C_CR2_POS;
 967  01cf 72165211      	bset	21009,#3
 968  01d3               L153:
 969                     ; 371 }
 972  01d3 84            	pop	a
 973  01d4 81            	ret
1045                     ; 381 void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
1045                     ; 382 {
1046                     	switch	.text
1047  01d5               _I2C_ITConfig:
1049  01d5 89            	pushw	x
1050       00000000      OFST:	set	0
1053                     ; 384   assert_param(IS_I2C_INTERRUPT_OK(I2C_IT));
1055                     ; 385   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1057                     ; 387   if (NewState != DISABLE)
1059  01d6 9f            	ld	a,xl
1060  01d7 4d            	tnz	a
1061  01d8 2709          	jreq	L314
1062                     ; 390     I2C->ITR |= (uint8_t)I2C_IT;
1064  01da 9e            	ld	a,xh
1065  01db ca521a        	or	a,21018
1066  01de c7521a        	ld	21018,a
1068  01e1 2009          	jra	L514
1069  01e3               L314:
1070                     ; 395     I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
1072  01e3 7b01          	ld	a,(OFST+1,sp)
1073  01e5 43            	cpl	a
1074  01e6 c4521a        	and	a,21018
1075  01e9 c7521a        	ld	21018,a
1076  01ec               L514:
1077                     ; 397 }
1080  01ec 85            	popw	x
1081  01ed 81            	ret
1117                     ; 405 void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
1117                     ; 406 {
1118                     	switch	.text
1119  01ee               _I2C_FastModeDutyCycleConfig:
1123                     ; 408   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));
1125                     ; 410   if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
1127  01ee a140          	cp	a,#64
1128  01f0 2606          	jrne	L534
1129                     ; 413     I2C->CCRH |= I2C_CCRH_DUTY;
1131  01f2 721c521c      	bset	21020,#6
1133  01f6 2004          	jra	L734
1134  01f8               L534:
1135                     ; 418     I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1137  01f8 721d521c      	bres	21020,#6
1138  01fc               L734:
1139                     ; 420 }
1142  01fc 81            	ret
1165                     ; 427 uint8_t I2C_ReceiveData(void)
1165                     ; 428 {
1166                     	switch	.text
1167  01fd               _I2C_ReceiveData:
1171                     ; 430   return ((uint8_t)I2C->DR);
1173  01fd c65216        	ld	a,21014
1176  0200 81            	ret
1241                     ; 440 void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
1241                     ; 441 {
1242                     	switch	.text
1243  0201               _I2C_Send7bitAddress:
1245  0201 89            	pushw	x
1246       00000000      OFST:	set	0
1249                     ; 443   assert_param(IS_I2C_ADDRESS_OK(Address));
1251                     ; 444   assert_param(IS_I2C_DIRECTION_OK(Direction));
1253                     ; 447   Address &= (uint8_t)0xFE;
1255  0202 7b01          	ld	a,(OFST+1,sp)
1256  0204 a4fe          	and	a,#254
1257  0206 6b01          	ld	(OFST+1,sp),a
1258                     ; 450   I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
1260  0208 7b01          	ld	a,(OFST+1,sp)
1261  020a 1a02          	or	a,(OFST+2,sp)
1262  020c c75216        	ld	21014,a
1263                     ; 451 }
1266  020f 85            	popw	x
1267  0210 81            	ret
1301                     ; 458 void I2C_SendData(uint8_t Data)
1301                     ; 459 {
1302                     	switch	.text
1303  0211               _I2C_SendData:
1307                     ; 461   I2C->DR = Data;
1309  0211 c75216        	ld	21014,a
1310                     ; 462 }
1313  0214 81            	ret
1537                     ; 578 ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
1537                     ; 579 {
1538                     	switch	.text
1539  0215               _I2C_CheckEvent:
1541  0215 89            	pushw	x
1542  0216 5206          	subw	sp,#6
1543       00000006      OFST:	set	6
1546                     ; 580   __IO uint16_t lastevent = 0x00;
1548  0218 5f            	clrw	x
1549  0219 1f04          	ldw	(OFST-2,sp),x
1550                     ; 581   uint8_t flag1 = 0x00 ;
1552                     ; 582   uint8_t flag2 = 0x00;
1554                     ; 583   ErrorStatus status = ERROR;
1556                     ; 586   assert_param(IS_I2C_EVENT_OK(I2C_Event));
1558                     ; 588   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
1560  021b 1e07          	ldw	x,(OFST+1,sp)
1561  021d a30004        	cpw	x,#4
1562  0220 260b          	jrne	L136
1563                     ; 590     lastevent = I2C->SR2 & I2C_SR2_AF;
1565  0222 c65218        	ld	a,21016
1566  0225 a404          	and	a,#4
1567  0227 5f            	clrw	x
1568  0228 97            	ld	xl,a
1569  0229 1f04          	ldw	(OFST-2,sp),x
1571  022b 201f          	jra	L336
1572  022d               L136:
1573                     ; 594     flag1 = I2C->SR1;
1575  022d c65217        	ld	a,21015
1576  0230 6b03          	ld	(OFST-3,sp),a
1577                     ; 595     flag2 = I2C->SR3;
1579  0232 c65219        	ld	a,21017
1580  0235 6b06          	ld	(OFST+0,sp),a
1581                     ; 596     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
1583  0237 7b03          	ld	a,(OFST-3,sp)
1584  0239 5f            	clrw	x
1585  023a 97            	ld	xl,a
1586  023b 1f01          	ldw	(OFST-5,sp),x
1587  023d 7b06          	ld	a,(OFST+0,sp)
1588  023f 5f            	clrw	x
1589  0240 97            	ld	xl,a
1590  0241 4f            	clr	a
1591  0242 02            	rlwa	x,a
1592  0243 01            	rrwa	x,a
1593  0244 1a02          	or	a,(OFST-4,sp)
1594  0246 01            	rrwa	x,a
1595  0247 1a01          	or	a,(OFST-5,sp)
1596  0249 01            	rrwa	x,a
1597  024a 1f04          	ldw	(OFST-2,sp),x
1598  024c               L336:
1599                     ; 599   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
1601  024c 1e04          	ldw	x,(OFST-2,sp)
1602  024e 01            	rrwa	x,a
1603  024f 1408          	and	a,(OFST+2,sp)
1604  0251 01            	rrwa	x,a
1605  0252 1407          	and	a,(OFST+1,sp)
1606  0254 01            	rrwa	x,a
1607  0255 1307          	cpw	x,(OFST+1,sp)
1608  0257 2606          	jrne	L536
1609                     ; 602     status = SUCCESS;
1611  0259 a601          	ld	a,#1
1612  025b 6b06          	ld	(OFST+0,sp),a
1614  025d 2002          	jra	L736
1615  025f               L536:
1616                     ; 607     status = ERROR;
1618  025f 0f06          	clr	(OFST+0,sp)
1619  0261               L736:
1620                     ; 611   return status;
1622  0261 7b06          	ld	a,(OFST+0,sp)
1625  0263 5b08          	addw	sp,#8
1626  0265 81            	ret
1679                     ; 628 I2C_Event_TypeDef I2C_GetLastEvent(void)
1679                     ; 629 {
1680                     	switch	.text
1681  0266               _I2C_GetLastEvent:
1683  0266 5206          	subw	sp,#6
1684       00000006      OFST:	set	6
1687                     ; 630   __IO uint16_t lastevent = 0;
1689  0268 5f            	clrw	x
1690  0269 1f05          	ldw	(OFST-1,sp),x
1691                     ; 631   uint16_t flag1 = 0;
1693                     ; 632   uint16_t flag2 = 0;
1695                     ; 634   if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
1697  026b c65218        	ld	a,21016
1698  026e a504          	bcp	a,#4
1699  0270 2707          	jreq	L766
1700                     ; 636     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
1702  0272 ae0004        	ldw	x,#4
1703  0275 1f05          	ldw	(OFST-1,sp),x
1705  0277 201b          	jra	L176
1706  0279               L766:
1707                     ; 641     flag1 = I2C->SR1;
1709  0279 c65217        	ld	a,21015
1710  027c 5f            	clrw	x
1711  027d 97            	ld	xl,a
1712  027e 1f01          	ldw	(OFST-5,sp),x
1713                     ; 642     flag2 = I2C->SR3;
1715  0280 c65219        	ld	a,21017
1716  0283 5f            	clrw	x
1717  0284 97            	ld	xl,a
1718  0285 1f03          	ldw	(OFST-3,sp),x
1719                     ; 645     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
1721  0287 1e03          	ldw	x,(OFST-3,sp)
1722  0289 4f            	clr	a
1723  028a 02            	rlwa	x,a
1724  028b 01            	rrwa	x,a
1725  028c 1a02          	or	a,(OFST-4,sp)
1726  028e 01            	rrwa	x,a
1727  028f 1a01          	or	a,(OFST-5,sp)
1728  0291 01            	rrwa	x,a
1729  0292 1f05          	ldw	(OFST-1,sp),x
1730  0294               L176:
1731                     ; 648   return (I2C_Event_TypeDef)lastevent;
1733  0294 1e05          	ldw	x,(OFST-1,sp)
1736  0296 5b06          	addw	sp,#6
1737  0298 81            	ret
1952                     ; 679 FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
1952                     ; 680 {
1953                     	switch	.text
1954  0299               _I2C_GetFlagStatus:
1956  0299 89            	pushw	x
1957  029a 89            	pushw	x
1958       00000002      OFST:	set	2
1961                     ; 681   uint8_t tempreg = 0;
1963  029b 0f02          	clr	(OFST+0,sp)
1964                     ; 682   uint8_t regindex = 0;
1966                     ; 683   FlagStatus bitstatus = RESET;
1968                     ; 686   assert_param(IS_I2C_FLAG_OK(I2C_Flag));
1970                     ; 689   regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
1972  029d 9e            	ld	a,xh
1973  029e 6b01          	ld	(OFST-1,sp),a
1974                     ; 691   switch (regindex)
1976  02a0 7b01          	ld	a,(OFST-1,sp)
1978                     ; 708     default:
1978                     ; 709       break;
1979  02a2 4a            	dec	a
1980  02a3 2708          	jreq	L376
1981  02a5 4a            	dec	a
1982  02a6 270c          	jreq	L576
1983  02a8 4a            	dec	a
1984  02a9 2710          	jreq	L776
1985  02ab 2013          	jra	L3101
1986  02ad               L376:
1987                     ; 694     case 0x01:
1987                     ; 695       tempreg = (uint8_t)I2C->SR1;
1989  02ad c65217        	ld	a,21015
1990  02b0 6b02          	ld	(OFST+0,sp),a
1991                     ; 696       break;
1993  02b2 200c          	jra	L3101
1994  02b4               L576:
1995                     ; 699     case 0x02:
1995                     ; 700       tempreg = (uint8_t)I2C->SR2;
1997  02b4 c65218        	ld	a,21016
1998  02b7 6b02          	ld	(OFST+0,sp),a
1999                     ; 701       break;
2001  02b9 2005          	jra	L3101
2002  02bb               L776:
2003                     ; 704     case 0x03:
2003                     ; 705       tempreg = (uint8_t)I2C->SR3;
2005  02bb c65219        	ld	a,21017
2006  02be 6b02          	ld	(OFST+0,sp),a
2007                     ; 706       break;
2009  02c0               L107:
2010                     ; 708     default:
2010                     ; 709       break;
2012  02c0               L3101:
2013                     ; 713   if ((tempreg & (uint8_t)I2C_Flag ) != 0)
2015  02c0 7b04          	ld	a,(OFST+2,sp)
2016  02c2 1502          	bcp	a,(OFST+0,sp)
2017  02c4 2706          	jreq	L5101
2018                     ; 716     bitstatus = SET;
2020  02c6 a601          	ld	a,#1
2021  02c8 6b02          	ld	(OFST+0,sp),a
2023  02ca 2002          	jra	L7101
2024  02cc               L5101:
2025                     ; 721     bitstatus = RESET;
2027  02cc 0f02          	clr	(OFST+0,sp)
2028  02ce               L7101:
2029                     ; 724   return bitstatus;
2031  02ce 7b02          	ld	a,(OFST+0,sp)
2034  02d0 5b04          	addw	sp,#4
2035  02d2 81            	ret
2079                     ; 759 void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
2079                     ; 760 {
2080                     	switch	.text
2081  02d3               _I2C_ClearFlag:
2083  02d3 89            	pushw	x
2084       00000002      OFST:	set	2
2087                     ; 761   uint16_t flagpos = 0;
2089                     ; 763   assert_param(IS_I2C_CLEAR_FLAG_OK(I2C_FLAG));
2091                     ; 766   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
2093  02d4 01            	rrwa	x,a
2094  02d5 a4ff          	and	a,#255
2095  02d7 5f            	clrw	x
2096  02d8 02            	rlwa	x,a
2097  02d9 1f01          	ldw	(OFST-1,sp),x
2098  02db 01            	rrwa	x,a
2099                     ; 768   I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
2101  02dc 7b02          	ld	a,(OFST+0,sp)
2102  02de 43            	cpl	a
2103  02df c75218        	ld	21016,a
2104                     ; 769 }
2107  02e2 85            	popw	x
2108  02e3 81            	ret
2274                     ; 791 ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2274                     ; 792 {
2275                     	switch	.text
2276  02e4               _I2C_GetITStatus:
2278  02e4 89            	pushw	x
2279  02e5 5204          	subw	sp,#4
2280       00000004      OFST:	set	4
2283                     ; 793   ITStatus bitstatus = RESET;
2285                     ; 794   __IO uint8_t enablestatus = 0;
2287  02e7 0f03          	clr	(OFST-1,sp)
2288                     ; 795   uint16_t tempregister = 0;
2290                     ; 798     assert_param(IS_I2C_ITPENDINGBIT_OK(I2C_ITPendingBit));
2292                     ; 800   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
2294  02e9 01            	rrwa	x,a
2295  02ea 9f            	ld	a,xl
2296  02eb a407          	and	a,#7
2297  02ed 97            	ld	xl,a
2298  02ee 4f            	clr	a
2299  02ef 02            	rlwa	x,a
2300  02f0 4f            	clr	a
2301  02f1 01            	rrwa	x,a
2302  02f2 9f            	ld	a,xl
2303  02f3 5f            	clrw	x
2304  02f4 97            	ld	xl,a
2305  02f5 1f01          	ldw	(OFST-3,sp),x
2306                     ; 803   enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
2308  02f7 c6521a        	ld	a,21018
2309  02fa 1402          	and	a,(OFST-2,sp)
2310  02fc 6b03          	ld	(OFST-1,sp),a
2311                     ; 805   if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
2313  02fe 7b05          	ld	a,(OFST+1,sp)
2314  0300 97            	ld	xl,a
2315  0301 7b06          	ld	a,(OFST+2,sp)
2316  0303 9f            	ld	a,xl
2317  0304 a430          	and	a,#48
2318  0306 97            	ld	xl,a
2319  0307 4f            	clr	a
2320  0308 02            	rlwa	x,a
2321  0309 a30100        	cpw	x,#256
2322  030c 2615          	jrne	L1311
2323                     ; 808     if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2325  030e c65217        	ld	a,21015
2326  0311 1506          	bcp	a,(OFST+2,sp)
2327  0313 270a          	jreq	L3311
2329  0315 0d03          	tnz	(OFST-1,sp)
2330  0317 2706          	jreq	L3311
2331                     ; 811       bitstatus = SET;
2333  0319 a601          	ld	a,#1
2334  031b 6b04          	ld	(OFST+0,sp),a
2336  031d 2017          	jra	L7311
2337  031f               L3311:
2338                     ; 816       bitstatus = RESET;
2340  031f 0f04          	clr	(OFST+0,sp)
2341  0321 2013          	jra	L7311
2342  0323               L1311:
2343                     ; 822     if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2345  0323 c65218        	ld	a,21016
2346  0326 1506          	bcp	a,(OFST+2,sp)
2347  0328 270a          	jreq	L1411
2349  032a 0d03          	tnz	(OFST-1,sp)
2350  032c 2706          	jreq	L1411
2351                     ; 825       bitstatus = SET;
2353  032e a601          	ld	a,#1
2354  0330 6b04          	ld	(OFST+0,sp),a
2356  0332 2002          	jra	L7311
2357  0334               L1411:
2358                     ; 830       bitstatus = RESET;
2360  0334 0f04          	clr	(OFST+0,sp)
2361  0336               L7311:
2362                     ; 834   return  bitstatus;
2364  0336 7b04          	ld	a,(OFST+0,sp)
2367  0338 5b06          	addw	sp,#6
2368  033a 81            	ret
2413                     ; 871 void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2413                     ; 872 {
2414                     	switch	.text
2415  033b               _I2C_ClearITPendingBit:
2417  033b 89            	pushw	x
2418       00000002      OFST:	set	2
2421                     ; 873   uint16_t flagpos = 0;
2423                     ; 876   assert_param(IS_I2C_CLEAR_ITPENDINGBIT_OK(I2C_ITPendingBit));
2425                     ; 879   flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
2427  033c 01            	rrwa	x,a
2428  033d a4ff          	and	a,#255
2429  033f 5f            	clrw	x
2430  0340 02            	rlwa	x,a
2431  0341 1f01          	ldw	(OFST-1,sp),x
2432  0343 01            	rrwa	x,a
2433                     ; 882   I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
2435  0344 7b02          	ld	a,(OFST+0,sp)
2436  0346 43            	cpl	a
2437  0347 c75218        	ld	21016,a
2438                     ; 883 }
2441  034a 85            	popw	x
2442  034b 81            	ret
2455                     	xdef	_I2C_ClearITPendingBit
2456                     	xdef	_I2C_GetITStatus
2457                     	xdef	_I2C_ClearFlag
2458                     	xdef	_I2C_GetFlagStatus
2459                     	xdef	_I2C_GetLastEvent
2460                     	xdef	_I2C_CheckEvent
2461                     	xdef	_I2C_SendData
2462                     	xdef	_I2C_Send7bitAddress
2463                     	xdef	_I2C_ReceiveData
2464                     	xdef	_I2C_ITConfig
2465                     	xdef	_I2C_FastModeDutyCycleConfig
2466                     	xdef	_I2C_AcknowledgeConfig
2467                     	xdef	_I2C_StretchClockCmd
2468                     	xdef	_I2C_SoftwareResetCmd
2469                     	xdef	_I2C_GenerateSTOP
2470                     	xdef	_I2C_GenerateSTART
2471                     	xdef	_I2C_GeneralCallCmd
2472                     	xdef	_I2C_Cmd
2473                     	xdef	_I2C_Init
2474                     	xdef	_I2C_DeInit
2475                     	xref.b	c_lreg
2476                     	xref.b	c_x
2495                     	xref	c_sdivx
2496                     	xref	c_ludv
2497                     	xref	c_rtol
2498                     	xref	c_smul
2499                     	xref	c_lmul
2500                     	xref	c_lcmp
2501                     	xref	c_ltor
2502                     	end
