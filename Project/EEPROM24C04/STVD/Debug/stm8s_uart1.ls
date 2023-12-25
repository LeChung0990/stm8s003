   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
   4                     ; Optimizer V4.3.6 - 29 Nov 2011
  48                     ; 53 void UART1_DeInit(void)
  48                     ; 54 {
  50                     	switch	.text
  51  0000               _UART1_DeInit:
  55                     ; 57   (void)UART1->SR;
  57  0000 c65230        	ld	a,21040
  58                     ; 58   (void)UART1->DR;
  60  0003 c65231        	ld	a,21041
  61                     ; 60   UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /* Set UART1_BRR2 to reset value 0x00 */
  63  0006 725f5233      	clr	21043
  64                     ; 61   UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /* Set UART1_BRR1 to reset value 0x00 */
  66  000a 725f5232      	clr	21042
  67                     ; 63   UART1->CR1 = UART1_CR1_RESET_VALUE;  /* Set UART1_CR1 to reset value 0x00 */
  69  000e 725f5234      	clr	21044
  70                     ; 64   UART1->CR2 = UART1_CR2_RESET_VALUE;  /* Set UART1_CR2 to reset value 0x00 */
  72  0012 725f5235      	clr	21045
  73                     ; 65   UART1->CR3 = UART1_CR3_RESET_VALUE;  /* Set UART1_CR3 to reset value 0x00 */
  75  0016 725f5236      	clr	21046
  76                     ; 66   UART1->CR4 = UART1_CR4_RESET_VALUE;  /* Set UART1_CR4 to reset value 0x00 */
  78  001a 725f5237      	clr	21047
  79                     ; 67   UART1->CR5 = UART1_CR5_RESET_VALUE;  /* Set UART1_CR5 to reset value 0x00 */
  81  001e 725f5238      	clr	21048
  82                     ; 69   UART1->GTR = UART1_GTR_RESET_VALUE;
  84  0022 725f5239      	clr	21049
  85                     ; 70   UART1->PSCR = UART1_PSCR_RESET_VALUE;
  87  0026 725f523a      	clr	21050
  88                     ; 71 }
  91  002a 81            	ret	
 394                     .const:	section	.text
 395  0000               L41:
 396  0000 00000064      	dc.l	100
 397                     ; 90 void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength, 
 397                     ; 91                 UART1_StopBits_TypeDef StopBits, UART1_Parity_TypeDef Parity, 
 397                     ; 92                 UART1_SyncMode_TypeDef SyncMode, UART1_Mode_TypeDef Mode)
 397                     ; 93 {
 398                     	switch	.text
 399  002b               _UART1_Init:
 401       0000000c      OFST:	set	12
 404                     ; 94   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 408                     ; 97   assert_param(IS_UART1_BAUDRATE_OK(BaudRate));
 410                     ; 98   assert_param(IS_UART1_WORDLENGTH_OK(WordLength));
 412                     ; 99   assert_param(IS_UART1_STOPBITS_OK(StopBits));
 414                     ; 100   assert_param(IS_UART1_PARITY_OK(Parity));
 416                     ; 101   assert_param(IS_UART1_MODE_OK((uint8_t)Mode));
 418                     ; 102   assert_param(IS_UART1_SYNCMODE_OK((uint8_t)SyncMode));
 420                     ; 105   UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  
 422  002b 72195234      	bres	21044,#4
 423  002f 520c          	subw	sp,#12
 424                     ; 108   UART1->CR1 |= (uint8_t)WordLength;
 426  0031 c65234        	ld	a,21044
 427  0034 1a13          	or	a,(OFST+7,sp)
 428  0036 c75234        	ld	21044,a
 429                     ; 111   UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
 431  0039 c65236        	ld	a,21046
 432  003c a4cf          	and	a,#207
 433  003e c75236        	ld	21046,a
 434                     ; 113   UART1->CR3 |= (uint8_t)StopBits;  
 436  0041 c65236        	ld	a,21046
 437  0044 1a14          	or	a,(OFST+8,sp)
 438  0046 c75236        	ld	21046,a
 439                     ; 116   UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  
 441  0049 c65234        	ld	a,21044
 442  004c a4f9          	and	a,#249
 443  004e c75234        	ld	21044,a
 444                     ; 118   UART1->CR1 |= (uint8_t)Parity;  
 446  0051 c65234        	ld	a,21044
 447  0054 1a15          	or	a,(OFST+9,sp)
 448  0056 c75234        	ld	21044,a
 449                     ; 121   UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  
 451  0059 725f5232      	clr	21042
 452                     ; 123   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);  
 454  005d c65233        	ld	a,21043
 455  0060 a40f          	and	a,#15
 456  0062 c75233        	ld	21043,a
 457                     ; 125   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  
 459  0065 c65233        	ld	a,21043
 460  0068 a4f0          	and	a,#240
 461  006a c75233        	ld	21043,a
 462                     ; 128   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 464  006d 96            	ldw	x,sp
 465  006e cd0147        	call	LC001
 467  0071 96            	ldw	x,sp
 468  0072 5c            	incw	x
 469  0073 cd0000        	call	c_rtol
 471  0076 cd0000        	call	_CLK_GetClockFreq
 473  0079 96            	ldw	x,sp
 474  007a 5c            	incw	x
 475  007b cd0000        	call	c_ludv
 477  007e 96            	ldw	x,sp
 478  007f 1c0009        	addw	x,#OFST-3
 479  0082 cd0000        	call	c_rtol
 481                     ; 129   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 483  0085 96            	ldw	x,sp
 484  0086 cd0147        	call	LC001
 486  0089 96            	ldw	x,sp
 487  008a 5c            	incw	x
 488  008b cd0000        	call	c_rtol
 490  008e cd0000        	call	_CLK_GetClockFreq
 492  0091 a664          	ld	a,#100
 493  0093 cd0000        	call	c_smul
 495  0096 96            	ldw	x,sp
 496  0097 5c            	incw	x
 497  0098 cd0000        	call	c_ludv
 499  009b 96            	ldw	x,sp
 500  009c 1c0005        	addw	x,#OFST-7
 501  009f cd0000        	call	c_rtol
 503                     ; 131   UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F); 
 505  00a2 96            	ldw	x,sp
 506  00a3 1c0009        	addw	x,#OFST-3
 507  00a6 cd0000        	call	c_ltor
 509  00a9 a664          	ld	a,#100
 510  00ab cd0000        	call	c_smul
 512  00ae 96            	ldw	x,sp
 513  00af 5c            	incw	x
 514  00b0 cd0000        	call	c_rtol
 516  00b3 96            	ldw	x,sp
 517  00b4 1c0005        	addw	x,#OFST-7
 518  00b7 cd0000        	call	c_ltor
 520  00ba 96            	ldw	x,sp
 521  00bb 5c            	incw	x
 522  00bc cd0000        	call	c_lsub
 524  00bf a604          	ld	a,#4
 525  00c1 cd0000        	call	c_llsh
 527  00c4 ae0000        	ldw	x,#L41
 528  00c7 cd0000        	call	c_ludv
 530  00ca b603          	ld	a,c_lreg+3
 531  00cc a40f          	and	a,#15
 532  00ce ca5233        	or	a,21043
 533  00d1 c75233        	ld	21043,a
 534                     ; 133   UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0); 
 536  00d4 96            	ldw	x,sp
 537  00d5 1c0009        	addw	x,#OFST-3
 538  00d8 cd0000        	call	c_ltor
 540  00db a604          	ld	a,#4
 541  00dd cd0000        	call	c_lursh
 543  00e0 b603          	ld	a,c_lreg+3
 544  00e2 a4f0          	and	a,#240
 545  00e4 b703          	ld	c_lreg+3,a
 546  00e6 3f02          	clr	c_lreg+2
 547  00e8 3f01          	clr	c_lreg+1
 548  00ea 3f00          	clr	c_lreg
 549  00ec ca5233        	or	a,21043
 550  00ef c75233        	ld	21043,a
 551                     ; 135   UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;           
 553  00f2 c65232        	ld	a,21042
 554  00f5 1a0c          	or	a,(OFST+0,sp)
 555  00f7 c75232        	ld	21042,a
 556                     ; 138   UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
 558  00fa c65235        	ld	a,21045
 559  00fd a4f3          	and	a,#243
 560  00ff c75235        	ld	21045,a
 561                     ; 140   UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL); 
 563  0102 c65236        	ld	a,21046
 564  0105 a4f8          	and	a,#248
 565  0107 c75236        	ld	21046,a
 566                     ; 142   UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL | 
 566                     ; 143                                                         UART1_CR3_CPHA | UART1_CR3_LBCL));  
 568  010a 7b16          	ld	a,(OFST+10,sp)
 569  010c a407          	and	a,#7
 570  010e ca5236        	or	a,21046
 571  0111 c75236        	ld	21046,a
 572                     ; 145   if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
 574  0114 7b17          	ld	a,(OFST+11,sp)
 575  0116 a504          	bcp	a,#4
 576  0118 2706          	jreq	L371
 577                     ; 148     UART1->CR2 |= (uint8_t)UART1_CR2_TEN;  
 579  011a 72165235      	bset	21045,#3
 581  011e 2004          	jra	L571
 582  0120               L371:
 583                     ; 153     UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);  
 585  0120 72175235      	bres	21045,#3
 586  0124               L571:
 587                     ; 155   if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
 589  0124 a508          	bcp	a,#8
 590  0126 2706          	jreq	L771
 591                     ; 158     UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
 593  0128 72145235      	bset	21045,#2
 595  012c 2004          	jra	L102
 596  012e               L771:
 597                     ; 163     UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);  
 599  012e 72155235      	bres	21045,#2
 600  0132               L102:
 601                     ; 167   if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
 603  0132 7b16          	ld	a,(OFST+10,sp)
 604  0134 2a06          	jrpl	L302
 605                     ; 170     UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); 
 607  0136 72175236      	bres	21046,#3
 609  013a 2008          	jra	L502
 610  013c               L302:
 611                     ; 174     UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
 613  013c a408          	and	a,#8
 614  013e ca5236        	or	a,21046
 615  0141 c75236        	ld	21046,a
 616  0144               L502:
 617                     ; 176 }
 620  0144 5b0c          	addw	sp,#12
 621  0146 81            	ret	
 622  0147               LC001:
 623  0147 1c000f        	addw	x,#OFST+3
 624  014a cd0000        	call	c_ltor
 626  014d a604          	ld	a,#4
 627  014f cc0000        	jp	c_llsh
 682                     ; 184 void UART1_Cmd(FunctionalState NewState)
 682                     ; 185 {
 683                     	switch	.text
 684  0152               _UART1_Cmd:
 688                     ; 186   if (NewState != DISABLE)
 690  0152 4d            	tnz	a
 691  0153 2705          	jreq	L532
 692                     ; 189     UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
 694  0155 721b5234      	bres	21044,#5
 697  0159 81            	ret	
 698  015a               L532:
 699                     ; 194     UART1->CR1 |= UART1_CR1_UARTD;  
 701  015a 721a5234      	bset	21044,#5
 702                     ; 196 }
 705  015e 81            	ret	
 830                     ; 211 void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
 830                     ; 212 {
 831                     	switch	.text
 832  015f               _UART1_ITConfig:
 834  015f 89            	pushw	x
 835  0160 89            	pushw	x
 836       00000002      OFST:	set	2
 839                     ; 213   uint8_t uartreg = 0, itpos = 0x00;
 843                     ; 216   assert_param(IS_UART1_CONFIG_IT_OK(UART1_IT));
 845                     ; 217   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 847                     ; 220   uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
 849  0161 9e            	ld	a,xh
 850  0162 6b01          	ld	(OFST-1,sp),a
 851                     ; 222   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
 853  0164 9f            	ld	a,xl
 854  0165 a40f          	and	a,#15
 855  0167 5f            	clrw	x
 856  0168 97            	ld	xl,a
 857  0169 a601          	ld	a,#1
 858  016b 5d            	tnzw	x
 859  016c 2704          	jreq	L22
 860  016e               L42:
 861  016e 48            	sll	a
 862  016f 5a            	decw	x
 863  0170 26fc          	jrne	L42
 864  0172               L22:
 865  0172 6b02          	ld	(OFST+0,sp),a
 866                     ; 224   if (NewState != DISABLE)
 868  0174 7b07          	ld	a,(OFST+5,sp)
 869  0176 271f          	jreq	L713
 870                     ; 227     if (uartreg == 0x01)
 872  0178 7b01          	ld	a,(OFST-1,sp)
 873  017a a101          	cp	a,#1
 874  017c 2607          	jrne	L123
 875                     ; 229       UART1->CR1 |= itpos;
 877  017e c65234        	ld	a,21044
 878  0181 1a02          	or	a,(OFST+0,sp)
 880  0183 201e          	jp	LC003
 881  0185               L123:
 882                     ; 231     else if (uartreg == 0x02)
 884  0185 a102          	cp	a,#2
 885  0187 2607          	jrne	L523
 886                     ; 233       UART1->CR2 |= itpos;
 888  0189 c65235        	ld	a,21045
 889  018c 1a02          	or	a,(OFST+0,sp)
 891  018e 2022          	jp	LC004
 892  0190               L523:
 893                     ; 237       UART1->CR4 |= itpos;
 895  0190 c65237        	ld	a,21047
 896  0193 1a02          	or	a,(OFST+0,sp)
 897  0195 2026          	jp	LC002
 898  0197               L713:
 899                     ; 243     if (uartreg == 0x01)
 901  0197 7b01          	ld	a,(OFST-1,sp)
 902  0199 a101          	cp	a,#1
 903  019b 260b          	jrne	L333
 904                     ; 245       UART1->CR1 &= (uint8_t)(~itpos);
 906  019d 7b02          	ld	a,(OFST+0,sp)
 907  019f 43            	cpl	a
 908  01a0 c45234        	and	a,21044
 909  01a3               LC003:
 910  01a3 c75234        	ld	21044,a
 912  01a6 2018          	jra	L133
 913  01a8               L333:
 914                     ; 247     else if (uartreg == 0x02)
 916  01a8 a102          	cp	a,#2
 917  01aa 260b          	jrne	L733
 918                     ; 249       UART1->CR2 &= (uint8_t)(~itpos);
 920  01ac 7b02          	ld	a,(OFST+0,sp)
 921  01ae 43            	cpl	a
 922  01af c45235        	and	a,21045
 923  01b2               LC004:
 924  01b2 c75235        	ld	21045,a
 926  01b5 2009          	jra	L133
 927  01b7               L733:
 928                     ; 253       UART1->CR4 &= (uint8_t)(~itpos);
 930  01b7 7b02          	ld	a,(OFST+0,sp)
 931  01b9 43            	cpl	a
 932  01ba c45237        	and	a,21047
 933  01bd               LC002:
 934  01bd c75237        	ld	21047,a
 935  01c0               L133:
 936                     ; 257 }
 939  01c0 5b04          	addw	sp,#4
 940  01c2 81            	ret	
 976                     ; 265 void UART1_HalfDuplexCmd(FunctionalState NewState)
 976                     ; 266 {
 977                     	switch	.text
 978  01c3               _UART1_HalfDuplexCmd:
 982                     ; 267   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 984                     ; 269   if (NewState != DISABLE)
 986  01c3 4d            	tnz	a
 987  01c4 2705          	jreq	L163
 988                     ; 271     UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
 990  01c6 72165238      	bset	21048,#3
 993  01ca 81            	ret	
 994  01cb               L163:
 995                     ; 275     UART1->CR5 &= (uint8_t)~UART1_CR5_HDSEL; /**< UART1 Half Duplex Disable */
 997  01cb 72175238      	bres	21048,#3
 998                     ; 277 }
1001  01cf 81            	ret	
1058                     ; 285 void UART1_IrDAConfig(UART1_IrDAMode_TypeDef UART1_IrDAMode)
1058                     ; 286 {
1059                     	switch	.text
1060  01d0               _UART1_IrDAConfig:
1064                     ; 287   assert_param(IS_UART1_IRDAMODE_OK(UART1_IrDAMode));
1066                     ; 289   if (UART1_IrDAMode != UART1_IRDAMODE_NORMAL)
1068  01d0 4d            	tnz	a
1069  01d1 2705          	jreq	L314
1070                     ; 291     UART1->CR5 |= UART1_CR5_IRLP;
1072  01d3 72145238      	bset	21048,#2
1075  01d7 81            	ret	
1076  01d8               L314:
1077                     ; 295     UART1->CR5 &= ((uint8_t)~UART1_CR5_IRLP);
1079  01d8 72155238      	bres	21048,#2
1080                     ; 297 }
1083  01dc 81            	ret	
1118                     ; 305 void UART1_IrDACmd(FunctionalState NewState)
1118                     ; 306 {
1119                     	switch	.text
1120  01dd               _UART1_IrDACmd:
1124                     ; 308   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1126                     ; 310   if (NewState != DISABLE)
1128  01dd 4d            	tnz	a
1129  01de 2705          	jreq	L534
1130                     ; 313     UART1->CR5 |= UART1_CR5_IREN;
1132  01e0 72125238      	bset	21048,#1
1135  01e4 81            	ret	
1136  01e5               L534:
1137                     ; 318     UART1->CR5 &= ((uint8_t)~UART1_CR5_IREN);
1139  01e5 72135238      	bres	21048,#1
1140                     ; 320 }
1143  01e9 81            	ret	
1202                     ; 329 void UART1_LINBreakDetectionConfig(UART1_LINBreakDetectionLength_TypeDef UART1_LINBreakDetectionLength)
1202                     ; 330 {
1203                     	switch	.text
1204  01ea               _UART1_LINBreakDetectionConfig:
1208                     ; 331   assert_param(IS_UART1_LINBREAKDETECTIONLENGTH_OK(UART1_LINBreakDetectionLength));
1210                     ; 333   if (UART1_LINBreakDetectionLength != UART1_LINBREAKDETECTIONLENGTH_10BITS)
1212  01ea 4d            	tnz	a
1213  01eb 2705          	jreq	L764
1214                     ; 335     UART1->CR4 |= UART1_CR4_LBDL;
1216  01ed 721a5237      	bset	21047,#5
1219  01f1 81            	ret	
1220  01f2               L764:
1221                     ; 339     UART1->CR4 &= ((uint8_t)~UART1_CR4_LBDL);
1223  01f2 721b5237      	bres	21047,#5
1224                     ; 341 }
1227  01f6 81            	ret	
1262                     ; 349 void UART1_LINCmd(FunctionalState NewState)
1262                     ; 350 {
1263                     	switch	.text
1264  01f7               _UART1_LINCmd:
1268                     ; 351   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1270                     ; 353   if (NewState != DISABLE)
1272  01f7 4d            	tnz	a
1273  01f8 2705          	jreq	L115
1274                     ; 356     UART1->CR3 |= UART1_CR3_LINEN;
1276  01fa 721c5236      	bset	21046,#6
1279  01fe 81            	ret	
1280  01ff               L115:
1281                     ; 361     UART1->CR3 &= ((uint8_t)~UART1_CR3_LINEN);
1283  01ff 721d5236      	bres	21046,#6
1284                     ; 363 }
1287  0203 81            	ret	
1322                     ; 371 void UART1_SmartCardCmd(FunctionalState NewState)
1322                     ; 372 {
1323                     	switch	.text
1324  0204               _UART1_SmartCardCmd:
1328                     ; 373   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1330                     ; 375   if (NewState != DISABLE)
1332  0204 4d            	tnz	a
1333  0205 2705          	jreq	L335
1334                     ; 378     UART1->CR5 |= UART1_CR5_SCEN;
1336  0207 721a5238      	bset	21048,#5
1339  020b 81            	ret	
1340  020c               L335:
1341                     ; 383     UART1->CR5 &= ((uint8_t)(~UART1_CR5_SCEN));
1343  020c 721b5238      	bres	21048,#5
1344                     ; 385 }
1347  0210 81            	ret	
1383                     ; 394 void UART1_SmartCardNACKCmd(FunctionalState NewState)
1383                     ; 395 {
1384                     	switch	.text
1385  0211               _UART1_SmartCardNACKCmd:
1389                     ; 396   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1391                     ; 398   if (NewState != DISABLE)
1393  0211 4d            	tnz	a
1394  0212 2705          	jreq	L555
1395                     ; 401     UART1->CR5 |= UART1_CR5_NACK;
1397  0214 72185238      	bset	21048,#4
1400  0218 81            	ret	
1401  0219               L555:
1402                     ; 406     UART1->CR5 &= ((uint8_t)~(UART1_CR5_NACK));
1404  0219 72195238      	bres	21048,#4
1405                     ; 408 }
1408  021d 81            	ret	
1465                     ; 416 void UART1_WakeUpConfig(UART1_WakeUp_TypeDef UART1_WakeUp)
1465                     ; 417 {
1466                     	switch	.text
1467  021e               _UART1_WakeUpConfig:
1471                     ; 418   assert_param(IS_UART1_WAKEUP_OK(UART1_WakeUp));
1473                     ; 420   UART1->CR1 &= ((uint8_t)~UART1_CR1_WAKE);
1475  021e 72175234      	bres	21044,#3
1476                     ; 421   UART1->CR1 |= (uint8_t)UART1_WakeUp;
1478  0222 ca5234        	or	a,21044
1479  0225 c75234        	ld	21044,a
1480                     ; 422 }
1483  0228 81            	ret	
1519                     ; 430 void UART1_ReceiverWakeUpCmd(FunctionalState NewState)
1519                     ; 431 {
1520                     	switch	.text
1521  0229               _UART1_ReceiverWakeUpCmd:
1525                     ; 432   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1527                     ; 434   if (NewState != DISABLE)
1529  0229 4d            	tnz	a
1530  022a 2705          	jreq	L526
1531                     ; 437     UART1->CR2 |= UART1_CR2_RWU;
1533  022c 72125235      	bset	21045,#1
1536  0230 81            	ret	
1537  0231               L526:
1538                     ; 442     UART1->CR2 &= ((uint8_t)~UART1_CR2_RWU);
1540  0231 72135235      	bres	21045,#1
1541                     ; 444 }
1544  0235 81            	ret	
1567                     ; 451 uint8_t UART1_ReceiveData8(void)
1567                     ; 452 {
1568                     	switch	.text
1569  0236               _UART1_ReceiveData8:
1573                     ; 453   return ((uint8_t)UART1->DR);
1575  0236 c65231        	ld	a,21041
1578  0239 81            	ret	
1612                     ; 461 uint16_t UART1_ReceiveData9(void)
1612                     ; 462 {
1613                     	switch	.text
1614  023a               _UART1_ReceiveData9:
1616  023a 89            	pushw	x
1617       00000002      OFST:	set	2
1620                     ; 463   uint16_t temp = 0;
1622                     ; 465   temp = (uint16_t)(((uint16_t)( (uint16_t)UART1->CR1 & (uint16_t)UART1_CR1_R8)) << 1);
1624  023b c65234        	ld	a,21044
1625  023e a480          	and	a,#128
1626  0240 5f            	clrw	x
1627  0241 02            	rlwa	x,a
1628  0242 58            	sllw	x
1629  0243 1f01          	ldw	(OFST-1,sp),x
1630                     ; 466   return (uint16_t)( (((uint16_t) UART1->DR) | temp ) & ((uint16_t)0x01FF));
1632  0245 5f            	clrw	x
1633  0246 c65231        	ld	a,21041
1634  0249 97            	ld	xl,a
1635  024a 01            	rrwa	x,a
1636  024b 1a02          	or	a,(OFST+0,sp)
1637  024d 01            	rrwa	x,a
1638  024e 1a01          	or	a,(OFST-1,sp)
1639  0250 a401          	and	a,#1
1640  0252 01            	rrwa	x,a
1643  0253 5b02          	addw	sp,#2
1644  0255 81            	ret	
1678                     ; 474 void UART1_SendData8(uint8_t Data)
1678                     ; 475 {
1679                     	switch	.text
1680  0256               _UART1_SendData8:
1684                     ; 477   UART1->DR = Data;
1686  0256 c75231        	ld	21041,a
1687                     ; 478 }
1690  0259 81            	ret	
1724                     ; 486 void UART1_SendData9(uint16_t Data)
1724                     ; 487 {
1725                     	switch	.text
1726  025a               _UART1_SendData9:
1728  025a 89            	pushw	x
1729       00000000      OFST:	set	0
1732                     ; 489   UART1->CR1 &= ((uint8_t)~UART1_CR1_T8);
1734  025b 721d5234      	bres	21044,#6
1735                     ; 491   UART1->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART1_CR1_T8);
1737  025f 54            	srlw	x
1738  0260 54            	srlw	x
1739  0261 9f            	ld	a,xl
1740  0262 a440          	and	a,#64
1741  0264 ca5234        	or	a,21044
1742  0267 c75234        	ld	21044,a
1743                     ; 493   UART1->DR   = (uint8_t)(Data);
1745  026a 7b02          	ld	a,(OFST+2,sp)
1746  026c c75231        	ld	21041,a
1747                     ; 494 }
1750  026f 85            	popw	x
1751  0270 81            	ret	
1774                     ; 501 void UART1_SendBreak(void)
1774                     ; 502 {
1775                     	switch	.text
1776  0271               _UART1_SendBreak:
1780                     ; 503   UART1->CR2 |= UART1_CR2_SBK;
1782  0271 72105235      	bset	21045,#0
1783                     ; 504 }
1786  0275 81            	ret	
1820                     ; 511 void UART1_SetAddress(uint8_t UART1_Address)
1820                     ; 512 {
1821                     	switch	.text
1822  0276               _UART1_SetAddress:
1824  0276 88            	push	a
1825       00000000      OFST:	set	0
1828                     ; 514   assert_param(IS_UART1_ADDRESS_OK(UART1_Address));
1830                     ; 517   UART1->CR4 &= ((uint8_t)~UART1_CR4_ADD);
1832  0277 c65237        	ld	a,21047
1833  027a a4f0          	and	a,#240
1834  027c c75237        	ld	21047,a
1835                     ; 519   UART1->CR4 |= UART1_Address;
1837  027f c65237        	ld	a,21047
1838  0282 1a01          	or	a,(OFST+1,sp)
1839  0284 c75237        	ld	21047,a
1840                     ; 520 }
1843  0287 84            	pop	a
1844  0288 81            	ret	
1878                     ; 528 void UART1_SetGuardTime(uint8_t UART1_GuardTime)
1878                     ; 529 {
1879                     	switch	.text
1880  0289               _UART1_SetGuardTime:
1884                     ; 531   UART1->GTR = UART1_GuardTime;
1886  0289 c75239        	ld	21049,a
1887                     ; 532 }
1890  028c 81            	ret	
1924                     ; 556 void UART1_SetPrescaler(uint8_t UART1_Prescaler)
1924                     ; 557 {
1925                     	switch	.text
1926  028d               _UART1_SetPrescaler:
1930                     ; 559   UART1->PSCR = UART1_Prescaler;
1932  028d c7523a        	ld	21050,a
1933                     ; 560 }
1936  0290 81            	ret	
2079                     ; 568 FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
2079                     ; 569 {
2080                     	switch	.text
2081  0291               _UART1_GetFlagStatus:
2083  0291 89            	pushw	x
2084  0292 88            	push	a
2085       00000001      OFST:	set	1
2088                     ; 570   FlagStatus status = RESET;
2090                     ; 573   assert_param(IS_UART1_FLAG_OK(UART1_FLAG));
2092                     ; 577   if (UART1_FLAG == UART1_FLAG_LBDF)
2094  0293 a30210        	cpw	x,#528
2095  0296 2608          	jrne	L7501
2096                     ; 579     if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2098  0298 9f            	ld	a,xl
2099  0299 c45237        	and	a,21047
2100  029c 271e          	jreq	L5601
2101                     ; 582       status = SET;
2103  029e 2017          	jp	LC007
2104                     ; 587       status = RESET;
2105  02a0               L7501:
2106                     ; 590   else if (UART1_FLAG == UART1_FLAG_SBK)
2108  02a0 1e02          	ldw	x,(OFST+1,sp)
2109  02a2 a30101        	cpw	x,#257
2110  02a5 2609          	jrne	L7601
2111                     ; 592     if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2113  02a7 c65235        	ld	a,21045
2114  02aa 1503          	bcp	a,(OFST+2,sp)
2115  02ac 270d          	jreq	L7701
2116                     ; 595       status = SET;
2118  02ae 2007          	jp	LC007
2119                     ; 600       status = RESET;
2120  02b0               L7601:
2121                     ; 605     if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2123  02b0 c65230        	ld	a,21040
2124  02b3 1503          	bcp	a,(OFST+2,sp)
2125  02b5 2704          	jreq	L7701
2126                     ; 608       status = SET;
2128  02b7               LC007:
2131  02b7 a601          	ld	a,#1
2134  02b9 2001          	jra	L5601
2135  02bb               L7701:
2136                     ; 613       status = RESET;
2139  02bb 4f            	clr	a
2140  02bc               L5601:
2141                     ; 617   return status;
2145  02bc 5b03          	addw	sp,#3
2146  02be 81            	ret	
2181                     ; 646 void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
2181                     ; 647 {
2182                     	switch	.text
2183  02bf               _UART1_ClearFlag:
2187                     ; 648   assert_param(IS_UART1_CLEAR_FLAG_OK(UART1_FLAG));
2189                     ; 651   if (UART1_FLAG == UART1_FLAG_RXNE)
2191  02bf a30020        	cpw	x,#32
2192  02c2 2605          	jrne	L1211
2193                     ; 653     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2195  02c4 35df5230      	mov	21040,#223
2198  02c8 81            	ret	
2199  02c9               L1211:
2200                     ; 658     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2202  02c9 72195237      	bres	21047,#4
2203                     ; 660 }
2206  02cd 81            	ret	
2288                     ; 675 ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
2288                     ; 676 {
2289                     	switch	.text
2290  02ce               _UART1_GetITStatus:
2292  02ce 89            	pushw	x
2293  02cf 89            	pushw	x
2294       00000002      OFST:	set	2
2297                     ; 677   ITStatus pendingbitstatus = RESET;
2299                     ; 678   uint8_t itpos = 0;
2301                     ; 679   uint8_t itmask1 = 0;
2303                     ; 680   uint8_t itmask2 = 0;
2305                     ; 681   uint8_t enablestatus = 0;
2307                     ; 684   assert_param(IS_UART1_GET_IT_OK(UART1_IT));
2309                     ; 687   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
2311  02d0 9f            	ld	a,xl
2312  02d1 a40f          	and	a,#15
2313  02d3 5f            	clrw	x
2314  02d4 97            	ld	xl,a
2315  02d5 a601          	ld	a,#1
2316  02d7 5d            	tnzw	x
2317  02d8 2704          	jreq	L67
2318  02da               L001:
2319  02da 48            	sll	a
2320  02db 5a            	decw	x
2321  02dc 26fc          	jrne	L001
2322  02de               L67:
2323  02de 6b01          	ld	(OFST-1,sp),a
2324                     ; 689   itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
2326  02e0 7b04          	ld	a,(OFST+2,sp)
2327  02e2 4e            	swap	a
2328  02e3 a40f          	and	a,#15
2329  02e5 6b02          	ld	(OFST+0,sp),a
2330                     ; 691   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2332  02e7 5f            	clrw	x
2333  02e8 97            	ld	xl,a
2334  02e9 a601          	ld	a,#1
2335  02eb 5d            	tnzw	x
2336  02ec 2704          	jreq	L201
2337  02ee               L401:
2338  02ee 48            	sll	a
2339  02ef 5a            	decw	x
2340  02f0 26fc          	jrne	L401
2341  02f2               L201:
2342  02f2 6b02          	ld	(OFST+0,sp),a
2343                     ; 695   if (UART1_IT == UART1_IT_PE)
2345  02f4 1e03          	ldw	x,(OFST+1,sp)
2346  02f6 a30100        	cpw	x,#256
2347  02f9 260c          	jrne	L7611
2348                     ; 698     enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
2350  02fb c65234        	ld	a,21044
2351  02fe 1402          	and	a,(OFST+0,sp)
2352  0300 6b02          	ld	(OFST+0,sp),a
2353                     ; 701     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2355  0302 c65230        	ld	a,21040
2357                     ; 704       pendingbitstatus = SET;
2359  0305 200f          	jp	LC010
2360                     ; 709       pendingbitstatus = RESET;
2361  0307               L7611:
2362                     ; 713   else if (UART1_IT == UART1_IT_LBDF)
2364  0307 a30346        	cpw	x,#838
2365  030a 2616          	jrne	L7711
2366                     ; 716     enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
2368  030c c65237        	ld	a,21047
2369  030f 1402          	and	a,(OFST+0,sp)
2370  0311 6b02          	ld	(OFST+0,sp),a
2371                     ; 718     if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2373  0313 c65237        	ld	a,21047
2375  0316               LC010:
2376  0316 1501          	bcp	a,(OFST-1,sp)
2377  0318 271a          	jreq	L7021
2378  031a 7b02          	ld	a,(OFST+0,sp)
2379  031c 2716          	jreq	L7021
2380                     ; 721       pendingbitstatus = SET;
2382  031e               LC009:
2385  031e a601          	ld	a,#1
2387  0320 2013          	jra	L5711
2388                     ; 726       pendingbitstatus = RESET;
2389  0322               L7711:
2390                     ; 732     enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
2392  0322 c65235        	ld	a,21045
2393  0325 1402          	and	a,(OFST+0,sp)
2394  0327 6b02          	ld	(OFST+0,sp),a
2395                     ; 734     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2397  0329 c65230        	ld	a,21040
2398  032c 1501          	bcp	a,(OFST-1,sp)
2399  032e 2704          	jreq	L7021
2401  0330 7b02          	ld	a,(OFST+0,sp)
2402                     ; 737       pendingbitstatus = SET;
2404  0332 26ea          	jrne	LC009
2405  0334               L7021:
2406                     ; 742       pendingbitstatus = RESET;
2410  0334 4f            	clr	a
2411  0335               L5711:
2412                     ; 747   return  pendingbitstatus;
2416  0335 5b04          	addw	sp,#4
2417  0337 81            	ret	
2453                     ; 775 void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
2453                     ; 776 {
2454                     	switch	.text
2455  0338               _UART1_ClearITPendingBit:
2459                     ; 777   assert_param(IS_UART1_CLEAR_IT_OK(UART1_IT));
2461                     ; 780   if (UART1_IT == UART1_IT_RXNE)
2463  0338 a30255        	cpw	x,#597
2464  033b 2605          	jrne	L1321
2465                     ; 782     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2467  033d 35df5230      	mov	21040,#223
2470  0341 81            	ret	
2471  0342               L1321:
2472                     ; 787     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2474  0342 72195237      	bres	21047,#4
2475                     ; 789 }
2478  0346 81            	ret	
2491                     	xdef	_UART1_ClearITPendingBit
2492                     	xdef	_UART1_GetITStatus
2493                     	xdef	_UART1_ClearFlag
2494                     	xdef	_UART1_GetFlagStatus
2495                     	xdef	_UART1_SetPrescaler
2496                     	xdef	_UART1_SetGuardTime
2497                     	xdef	_UART1_SetAddress
2498                     	xdef	_UART1_SendBreak
2499                     	xdef	_UART1_SendData9
2500                     	xdef	_UART1_SendData8
2501                     	xdef	_UART1_ReceiveData9
2502                     	xdef	_UART1_ReceiveData8
2503                     	xdef	_UART1_ReceiverWakeUpCmd
2504                     	xdef	_UART1_WakeUpConfig
2505                     	xdef	_UART1_SmartCardNACKCmd
2506                     	xdef	_UART1_SmartCardCmd
2507                     	xdef	_UART1_LINCmd
2508                     	xdef	_UART1_LINBreakDetectionConfig
2509                     	xdef	_UART1_IrDACmd
2510                     	xdef	_UART1_IrDAConfig
2511                     	xdef	_UART1_HalfDuplexCmd
2512                     	xdef	_UART1_ITConfig
2513                     	xdef	_UART1_Cmd
2514                     	xdef	_UART1_Init
2515                     	xdef	_UART1_DeInit
2516                     	xref	_CLK_GetClockFreq
2517                     	xref.b	c_lreg
2518                     	xref.b	c_x
2537                     	xref	c_lursh
2538                     	xref	c_lsub
2539                     	xref	c_smul
2540                     	xref	c_ludv
2541                     	xref	c_rtol
2542                     	xref	c_llsh
2543                     	xref	c_ltor
2544                     	end
