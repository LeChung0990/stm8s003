   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  44                     ; 53 void UART1_DeInit(void)
  44                     ; 54 {
  46                     	switch	.text
  47  0000               _UART1_DeInit:
  51                     ; 57   (void)UART1->SR;
  53  0000 c65230        	ld	a,21040
  54                     ; 58   (void)UART1->DR;
  56  0003 c65231        	ld	a,21041
  57                     ; 60   UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /* Set UART1_BRR2 to reset value 0x00 */
  59  0006 725f5233      	clr	21043
  60                     ; 61   UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /* Set UART1_BRR1 to reset value 0x00 */
  62  000a 725f5232      	clr	21042
  63                     ; 63   UART1->CR1 = UART1_CR1_RESET_VALUE;  /* Set UART1_CR1 to reset value 0x00 */
  65  000e 725f5234      	clr	21044
  66                     ; 64   UART1->CR2 = UART1_CR2_RESET_VALUE;  /* Set UART1_CR2 to reset value 0x00 */
  68  0012 725f5235      	clr	21045
  69                     ; 65   UART1->CR3 = UART1_CR3_RESET_VALUE;  /* Set UART1_CR3 to reset value 0x00 */
  71  0016 725f5236      	clr	21046
  72                     ; 66   UART1->CR4 = UART1_CR4_RESET_VALUE;  /* Set UART1_CR4 to reset value 0x00 */
  74  001a 725f5237      	clr	21047
  75                     ; 67   UART1->CR5 = UART1_CR5_RESET_VALUE;  /* Set UART1_CR5 to reset value 0x00 */
  77  001e 725f5238      	clr	21048
  78                     ; 69   UART1->GTR = UART1_GTR_RESET_VALUE;
  80  0022 725f5239      	clr	21049
  81                     ; 70   UART1->PSCR = UART1_PSCR_RESET_VALUE;
  83  0026 725f523a      	clr	21050
  84                     ; 71 }
  87  002a 81            	ret
 390                     .const:	section	.text
 391  0000               L01:
 392  0000 00000064      	dc.l	100
 393                     ; 90 void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength, 
 393                     ; 91                 UART1_StopBits_TypeDef StopBits, UART1_Parity_TypeDef Parity, 
 393                     ; 92                 UART1_SyncMode_TypeDef SyncMode, UART1_Mode_TypeDef Mode)
 393                     ; 93 {
 394                     	switch	.text
 395  002b               _UART1_Init:
 397  002b 520c          	subw	sp,#12
 398       0000000c      OFST:	set	12
 401                     ; 94   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 405                     ; 97   assert_param(IS_UART1_BAUDRATE_OK(BaudRate));
 407                     ; 98   assert_param(IS_UART1_WORDLENGTH_OK(WordLength));
 409                     ; 99   assert_param(IS_UART1_STOPBITS_OK(StopBits));
 411                     ; 100   assert_param(IS_UART1_PARITY_OK(Parity));
 413                     ; 101   assert_param(IS_UART1_MODE_OK((uint8_t)Mode));
 415                     ; 102   assert_param(IS_UART1_SYNCMODE_OK((uint8_t)SyncMode));
 417                     ; 105   UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  
 419  002d 72195234      	bres	21044,#4
 420                     ; 108   UART1->CR1 |= (uint8_t)WordLength;
 422  0031 c65234        	ld	a,21044
 423  0034 1a13          	or	a,(OFST+7,sp)
 424  0036 c75234        	ld	21044,a
 425                     ; 111   UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
 427  0039 c65236        	ld	a,21046
 428  003c a4cf          	and	a,#207
 429  003e c75236        	ld	21046,a
 430                     ; 113   UART1->CR3 |= (uint8_t)StopBits;  
 432  0041 c65236        	ld	a,21046
 433  0044 1a14          	or	a,(OFST+8,sp)
 434  0046 c75236        	ld	21046,a
 435                     ; 116   UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  
 437  0049 c65234        	ld	a,21044
 438  004c a4f9          	and	a,#249
 439  004e c75234        	ld	21044,a
 440                     ; 118   UART1->CR1 |= (uint8_t)Parity;  
 442  0051 c65234        	ld	a,21044
 443  0054 1a15          	or	a,(OFST+9,sp)
 444  0056 c75234        	ld	21044,a
 445                     ; 121   UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  
 447  0059 725f5232      	clr	21042
 448                     ; 123   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);  
 450  005d c65233        	ld	a,21043
 451  0060 a40f          	and	a,#15
 452  0062 c75233        	ld	21043,a
 453                     ; 125   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  
 455  0065 c65233        	ld	a,21043
 456  0068 a4f0          	and	a,#240
 457  006a c75233        	ld	21043,a
 458                     ; 128   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 460  006d 96            	ldw	x,sp
 461  006e 1c000f        	addw	x,#OFST+3
 462  0071 cd0000        	call	c_ltor
 464  0074 a604          	ld	a,#4
 465  0076 cd0000        	call	c_llsh
 467  0079 96            	ldw	x,sp
 468  007a 1c0001        	addw	x,#OFST-11
 469  007d cd0000        	call	c_rtol
 471  0080 cd0000        	call	_CLK_GetClockFreq
 473  0083 96            	ldw	x,sp
 474  0084 1c0001        	addw	x,#OFST-11
 475  0087 cd0000        	call	c_ludv
 477  008a 96            	ldw	x,sp
 478  008b 1c0009        	addw	x,#OFST-3
 479  008e cd0000        	call	c_rtol
 481                     ; 129   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 483  0091 96            	ldw	x,sp
 484  0092 1c000f        	addw	x,#OFST+3
 485  0095 cd0000        	call	c_ltor
 487  0098 a604          	ld	a,#4
 488  009a cd0000        	call	c_llsh
 490  009d 96            	ldw	x,sp
 491  009e 1c0001        	addw	x,#OFST-11
 492  00a1 cd0000        	call	c_rtol
 494  00a4 cd0000        	call	_CLK_GetClockFreq
 496  00a7 a664          	ld	a,#100
 497  00a9 cd0000        	call	c_smul
 499  00ac 96            	ldw	x,sp
 500  00ad 1c0001        	addw	x,#OFST-11
 501  00b0 cd0000        	call	c_ludv
 503  00b3 96            	ldw	x,sp
 504  00b4 1c0005        	addw	x,#OFST-7
 505  00b7 cd0000        	call	c_rtol
 507                     ; 131   UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F); 
 509  00ba 96            	ldw	x,sp
 510  00bb 1c0009        	addw	x,#OFST-3
 511  00be cd0000        	call	c_ltor
 513  00c1 a664          	ld	a,#100
 514  00c3 cd0000        	call	c_smul
 516  00c6 96            	ldw	x,sp
 517  00c7 1c0001        	addw	x,#OFST-11
 518  00ca cd0000        	call	c_rtol
 520  00cd 96            	ldw	x,sp
 521  00ce 1c0005        	addw	x,#OFST-7
 522  00d1 cd0000        	call	c_ltor
 524  00d4 96            	ldw	x,sp
 525  00d5 1c0001        	addw	x,#OFST-11
 526  00d8 cd0000        	call	c_lsub
 528  00db a604          	ld	a,#4
 529  00dd cd0000        	call	c_llsh
 531  00e0 ae0000        	ldw	x,#L01
 532  00e3 cd0000        	call	c_ludv
 534  00e6 b603          	ld	a,c_lreg+3
 535  00e8 a40f          	and	a,#15
 536  00ea ca5233        	or	a,21043
 537  00ed c75233        	ld	21043,a
 538                     ; 133   UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0); 
 540  00f0 96            	ldw	x,sp
 541  00f1 1c0009        	addw	x,#OFST-3
 542  00f4 cd0000        	call	c_ltor
 544  00f7 a604          	ld	a,#4
 545  00f9 cd0000        	call	c_lursh
 547  00fc b603          	ld	a,c_lreg+3
 548  00fe a4f0          	and	a,#240
 549  0100 b703          	ld	c_lreg+3,a
 550  0102 3f02          	clr	c_lreg+2
 551  0104 3f01          	clr	c_lreg+1
 552  0106 3f00          	clr	c_lreg
 553  0108 b603          	ld	a,c_lreg+3
 554  010a ca5233        	or	a,21043
 555  010d c75233        	ld	21043,a
 556                     ; 135   UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;           
 558  0110 c65232        	ld	a,21042
 559  0113 1a0c          	or	a,(OFST+0,sp)
 560  0115 c75232        	ld	21042,a
 561                     ; 138   UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
 563  0118 c65235        	ld	a,21045
 564  011b a4f3          	and	a,#243
 565  011d c75235        	ld	21045,a
 566                     ; 140   UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL); 
 568  0120 c65236        	ld	a,21046
 569  0123 a4f8          	and	a,#248
 570  0125 c75236        	ld	21046,a
 571                     ; 142   UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL | 
 571                     ; 143                                                         UART1_CR3_CPHA | UART1_CR3_LBCL));  
 573  0128 7b16          	ld	a,(OFST+10,sp)
 574  012a a407          	and	a,#7
 575  012c ca5236        	or	a,21046
 576  012f c75236        	ld	21046,a
 577                     ; 145   if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
 579  0132 7b17          	ld	a,(OFST+11,sp)
 580  0134 a504          	bcp	a,#4
 581  0136 2706          	jreq	L371
 582                     ; 148     UART1->CR2 |= (uint8_t)UART1_CR2_TEN;  
 584  0138 72165235      	bset	21045,#3
 586  013c 2004          	jra	L571
 587  013e               L371:
 588                     ; 153     UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);  
 590  013e 72175235      	bres	21045,#3
 591  0142               L571:
 592                     ; 155   if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
 594  0142 7b17          	ld	a,(OFST+11,sp)
 595  0144 a508          	bcp	a,#8
 596  0146 2706          	jreq	L771
 597                     ; 158     UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
 599  0148 72145235      	bset	21045,#2
 601  014c 2004          	jra	L102
 602  014e               L771:
 603                     ; 163     UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);  
 605  014e 72155235      	bres	21045,#2
 606  0152               L102:
 607                     ; 167   if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
 609  0152 7b16          	ld	a,(OFST+10,sp)
 610  0154 a580          	bcp	a,#128
 611  0156 2706          	jreq	L302
 612                     ; 170     UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); 
 614  0158 72175236      	bres	21046,#3
 616  015c 200a          	jra	L502
 617  015e               L302:
 618                     ; 174     UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
 620  015e 7b16          	ld	a,(OFST+10,sp)
 621  0160 a408          	and	a,#8
 622  0162 ca5236        	or	a,21046
 623  0165 c75236        	ld	21046,a
 624  0168               L502:
 625                     ; 176 }
 628  0168 5b0c          	addw	sp,#12
 629  016a 81            	ret
 684                     ; 184 void UART1_Cmd(FunctionalState NewState)
 684                     ; 185 {
 685                     	switch	.text
 686  016b               _UART1_Cmd:
 690                     ; 186   if (NewState != DISABLE)
 692  016b 4d            	tnz	a
 693  016c 2706          	jreq	L532
 694                     ; 189     UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
 696  016e 721b5234      	bres	21044,#5
 698  0172 2004          	jra	L732
 699  0174               L532:
 700                     ; 194     UART1->CR1 |= UART1_CR1_UARTD;  
 702  0174 721a5234      	bset	21044,#5
 703  0178               L732:
 704                     ; 196 }
 707  0178 81            	ret
 832                     ; 211 void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
 832                     ; 212 {
 833                     	switch	.text
 834  0179               _UART1_ITConfig:
 836  0179 89            	pushw	x
 837  017a 89            	pushw	x
 838       00000002      OFST:	set	2
 841                     ; 213   uint8_t uartreg = 0, itpos = 0x00;
 845                     ; 216   assert_param(IS_UART1_CONFIG_IT_OK(UART1_IT));
 847                     ; 217   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 849                     ; 220   uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
 851  017b 9e            	ld	a,xh
 852  017c 6b01          	ld	(OFST-1,sp),a
 853                     ; 222   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
 855  017e 9f            	ld	a,xl
 856  017f a40f          	and	a,#15
 857  0181 5f            	clrw	x
 858  0182 97            	ld	xl,a
 859  0183 a601          	ld	a,#1
 860  0185 5d            	tnzw	x
 861  0186 2704          	jreq	L61
 862  0188               L02:
 863  0188 48            	sll	a
 864  0189 5a            	decw	x
 865  018a 26fc          	jrne	L02
 866  018c               L61:
 867  018c 6b02          	ld	(OFST+0,sp),a
 868                     ; 224   if (NewState != DISABLE)
 870  018e 0d07          	tnz	(OFST+5,sp)
 871  0190 272a          	jreq	L713
 872                     ; 227     if (uartreg == 0x01)
 874  0192 7b01          	ld	a,(OFST-1,sp)
 875  0194 a101          	cp	a,#1
 876  0196 260a          	jrne	L123
 877                     ; 229       UART1->CR1 |= itpos;
 879  0198 c65234        	ld	a,21044
 880  019b 1a02          	or	a,(OFST+0,sp)
 881  019d c75234        	ld	21044,a
 883  01a0 2045          	jra	L133
 884  01a2               L123:
 885                     ; 231     else if (uartreg == 0x02)
 887  01a2 7b01          	ld	a,(OFST-1,sp)
 888  01a4 a102          	cp	a,#2
 889  01a6 260a          	jrne	L523
 890                     ; 233       UART1->CR2 |= itpos;
 892  01a8 c65235        	ld	a,21045
 893  01ab 1a02          	or	a,(OFST+0,sp)
 894  01ad c75235        	ld	21045,a
 896  01b0 2035          	jra	L133
 897  01b2               L523:
 898                     ; 237       UART1->CR4 |= itpos;
 900  01b2 c65237        	ld	a,21047
 901  01b5 1a02          	or	a,(OFST+0,sp)
 902  01b7 c75237        	ld	21047,a
 903  01ba 202b          	jra	L133
 904  01bc               L713:
 905                     ; 243     if (uartreg == 0x01)
 907  01bc 7b01          	ld	a,(OFST-1,sp)
 908  01be a101          	cp	a,#1
 909  01c0 260b          	jrne	L333
 910                     ; 245       UART1->CR1 &= (uint8_t)(~itpos);
 912  01c2 7b02          	ld	a,(OFST+0,sp)
 913  01c4 43            	cpl	a
 914  01c5 c45234        	and	a,21044
 915  01c8 c75234        	ld	21044,a
 917  01cb 201a          	jra	L133
 918  01cd               L333:
 919                     ; 247     else if (uartreg == 0x02)
 921  01cd 7b01          	ld	a,(OFST-1,sp)
 922  01cf a102          	cp	a,#2
 923  01d1 260b          	jrne	L733
 924                     ; 249       UART1->CR2 &= (uint8_t)(~itpos);
 926  01d3 7b02          	ld	a,(OFST+0,sp)
 927  01d5 43            	cpl	a
 928  01d6 c45235        	and	a,21045
 929  01d9 c75235        	ld	21045,a
 931  01dc 2009          	jra	L133
 932  01de               L733:
 933                     ; 253       UART1->CR4 &= (uint8_t)(~itpos);
 935  01de 7b02          	ld	a,(OFST+0,sp)
 936  01e0 43            	cpl	a
 937  01e1 c45237        	and	a,21047
 938  01e4 c75237        	ld	21047,a
 939  01e7               L133:
 940                     ; 257 }
 943  01e7 5b04          	addw	sp,#4
 944  01e9 81            	ret
 980                     ; 265 void UART1_HalfDuplexCmd(FunctionalState NewState)
 980                     ; 266 {
 981                     	switch	.text
 982  01ea               _UART1_HalfDuplexCmd:
 986                     ; 267   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 988                     ; 269   if (NewState != DISABLE)
 990  01ea 4d            	tnz	a
 991  01eb 2706          	jreq	L163
 992                     ; 271     UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
 994  01ed 72165238      	bset	21048,#3
 996  01f1 2004          	jra	L363
 997  01f3               L163:
 998                     ; 275     UART1->CR5 &= (uint8_t)~UART1_CR5_HDSEL; /**< UART1 Half Duplex Disable */
1000  01f3 72175238      	bres	21048,#3
1001  01f7               L363:
1002                     ; 277 }
1005  01f7 81            	ret
1062                     ; 285 void UART1_IrDAConfig(UART1_IrDAMode_TypeDef UART1_IrDAMode)
1062                     ; 286 {
1063                     	switch	.text
1064  01f8               _UART1_IrDAConfig:
1068                     ; 287   assert_param(IS_UART1_IRDAMODE_OK(UART1_IrDAMode));
1070                     ; 289   if (UART1_IrDAMode != UART1_IRDAMODE_NORMAL)
1072  01f8 4d            	tnz	a
1073  01f9 2706          	jreq	L314
1074                     ; 291     UART1->CR5 |= UART1_CR5_IRLP;
1076  01fb 72145238      	bset	21048,#2
1078  01ff 2004          	jra	L514
1079  0201               L314:
1080                     ; 295     UART1->CR5 &= ((uint8_t)~UART1_CR5_IRLP);
1082  0201 72155238      	bres	21048,#2
1083  0205               L514:
1084                     ; 297 }
1087  0205 81            	ret
1122                     ; 305 void UART1_IrDACmd(FunctionalState NewState)
1122                     ; 306 {
1123                     	switch	.text
1124  0206               _UART1_IrDACmd:
1128                     ; 308   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1130                     ; 310   if (NewState != DISABLE)
1132  0206 4d            	tnz	a
1133  0207 2706          	jreq	L534
1134                     ; 313     UART1->CR5 |= UART1_CR5_IREN;
1136  0209 72125238      	bset	21048,#1
1138  020d 2004          	jra	L734
1139  020f               L534:
1140                     ; 318     UART1->CR5 &= ((uint8_t)~UART1_CR5_IREN);
1142  020f 72135238      	bres	21048,#1
1143  0213               L734:
1144                     ; 320 }
1147  0213 81            	ret
1206                     ; 329 void UART1_LINBreakDetectionConfig(UART1_LINBreakDetectionLength_TypeDef UART1_LINBreakDetectionLength)
1206                     ; 330 {
1207                     	switch	.text
1208  0214               _UART1_LINBreakDetectionConfig:
1212                     ; 331   assert_param(IS_UART1_LINBREAKDETECTIONLENGTH_OK(UART1_LINBreakDetectionLength));
1214                     ; 333   if (UART1_LINBreakDetectionLength != UART1_LINBREAKDETECTIONLENGTH_10BITS)
1216  0214 4d            	tnz	a
1217  0215 2706          	jreq	L764
1218                     ; 335     UART1->CR4 |= UART1_CR4_LBDL;
1220  0217 721a5237      	bset	21047,#5
1222  021b 2004          	jra	L174
1223  021d               L764:
1224                     ; 339     UART1->CR4 &= ((uint8_t)~UART1_CR4_LBDL);
1226  021d 721b5237      	bres	21047,#5
1227  0221               L174:
1228                     ; 341 }
1231  0221 81            	ret
1266                     ; 349 void UART1_LINCmd(FunctionalState NewState)
1266                     ; 350 {
1267                     	switch	.text
1268  0222               _UART1_LINCmd:
1272                     ; 351   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1274                     ; 353   if (NewState != DISABLE)
1276  0222 4d            	tnz	a
1277  0223 2706          	jreq	L115
1278                     ; 356     UART1->CR3 |= UART1_CR3_LINEN;
1280  0225 721c5236      	bset	21046,#6
1282  0229 2004          	jra	L315
1283  022b               L115:
1284                     ; 361     UART1->CR3 &= ((uint8_t)~UART1_CR3_LINEN);
1286  022b 721d5236      	bres	21046,#6
1287  022f               L315:
1288                     ; 363 }
1291  022f 81            	ret
1326                     ; 371 void UART1_SmartCardCmd(FunctionalState NewState)
1326                     ; 372 {
1327                     	switch	.text
1328  0230               _UART1_SmartCardCmd:
1332                     ; 373   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1334                     ; 375   if (NewState != DISABLE)
1336  0230 4d            	tnz	a
1337  0231 2706          	jreq	L335
1338                     ; 378     UART1->CR5 |= UART1_CR5_SCEN;
1340  0233 721a5238      	bset	21048,#5
1342  0237 2004          	jra	L535
1343  0239               L335:
1344                     ; 383     UART1->CR5 &= ((uint8_t)(~UART1_CR5_SCEN));
1346  0239 721b5238      	bres	21048,#5
1347  023d               L535:
1348                     ; 385 }
1351  023d 81            	ret
1387                     ; 394 void UART1_SmartCardNACKCmd(FunctionalState NewState)
1387                     ; 395 {
1388                     	switch	.text
1389  023e               _UART1_SmartCardNACKCmd:
1393                     ; 396   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1395                     ; 398   if (NewState != DISABLE)
1397  023e 4d            	tnz	a
1398  023f 2706          	jreq	L555
1399                     ; 401     UART1->CR5 |= UART1_CR5_NACK;
1401  0241 72185238      	bset	21048,#4
1403  0245 2004          	jra	L755
1404  0247               L555:
1405                     ; 406     UART1->CR5 &= ((uint8_t)~(UART1_CR5_NACK));
1407  0247 72195238      	bres	21048,#4
1408  024b               L755:
1409                     ; 408 }
1412  024b 81            	ret
1469                     ; 416 void UART1_WakeUpConfig(UART1_WakeUp_TypeDef UART1_WakeUp)
1469                     ; 417 {
1470                     	switch	.text
1471  024c               _UART1_WakeUpConfig:
1475                     ; 418   assert_param(IS_UART1_WAKEUP_OK(UART1_WakeUp));
1477                     ; 420   UART1->CR1 &= ((uint8_t)~UART1_CR1_WAKE);
1479  024c 72175234      	bres	21044,#3
1480                     ; 421   UART1->CR1 |= (uint8_t)UART1_WakeUp;
1482  0250 ca5234        	or	a,21044
1483  0253 c75234        	ld	21044,a
1484                     ; 422 }
1487  0256 81            	ret
1523                     ; 430 void UART1_ReceiverWakeUpCmd(FunctionalState NewState)
1523                     ; 431 {
1524                     	switch	.text
1525  0257               _UART1_ReceiverWakeUpCmd:
1529                     ; 432   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1531                     ; 434   if (NewState != DISABLE)
1533  0257 4d            	tnz	a
1534  0258 2706          	jreq	L526
1535                     ; 437     UART1->CR2 |= UART1_CR2_RWU;
1537  025a 72125235      	bset	21045,#1
1539  025e 2004          	jra	L726
1540  0260               L526:
1541                     ; 442     UART1->CR2 &= ((uint8_t)~UART1_CR2_RWU);
1543  0260 72135235      	bres	21045,#1
1544  0264               L726:
1545                     ; 444 }
1548  0264 81            	ret
1571                     ; 451 uint8_t UART1_ReceiveData8(void)
1571                     ; 452 {
1572                     	switch	.text
1573  0265               _UART1_ReceiveData8:
1577                     ; 453   return ((uint8_t)UART1->DR);
1579  0265 c65231        	ld	a,21041
1582  0268 81            	ret
1616                     ; 461 uint16_t UART1_ReceiveData9(void)
1616                     ; 462 {
1617                     	switch	.text
1618  0269               _UART1_ReceiveData9:
1620  0269 89            	pushw	x
1621       00000002      OFST:	set	2
1624                     ; 463   uint16_t temp = 0;
1626                     ; 465   temp = (uint16_t)(((uint16_t)( (uint16_t)UART1->CR1 & (uint16_t)UART1_CR1_R8)) << 1);
1628  026a c65234        	ld	a,21044
1629  026d 5f            	clrw	x
1630  026e a480          	and	a,#128
1631  0270 5f            	clrw	x
1632  0271 02            	rlwa	x,a
1633  0272 58            	sllw	x
1634  0273 1f01          	ldw	(OFST-1,sp),x
1635                     ; 466   return (uint16_t)( (((uint16_t) UART1->DR) | temp ) & ((uint16_t)0x01FF));
1637  0275 c65231        	ld	a,21041
1638  0278 5f            	clrw	x
1639  0279 97            	ld	xl,a
1640  027a 01            	rrwa	x,a
1641  027b 1a02          	or	a,(OFST+0,sp)
1642  027d 01            	rrwa	x,a
1643  027e 1a01          	or	a,(OFST-1,sp)
1644  0280 01            	rrwa	x,a
1645  0281 01            	rrwa	x,a
1646  0282 a4ff          	and	a,#255
1647  0284 01            	rrwa	x,a
1648  0285 a401          	and	a,#1
1649  0287 01            	rrwa	x,a
1652  0288 5b02          	addw	sp,#2
1653  028a 81            	ret
1687                     ; 474 void UART1_SendData8(uint8_t Data)
1687                     ; 475 {
1688                     	switch	.text
1689  028b               _UART1_SendData8:
1693                     ; 477   UART1->DR = Data;
1695  028b c75231        	ld	21041,a
1696                     ; 478 }
1699  028e 81            	ret
1733                     ; 486 void UART1_SendData9(uint16_t Data)
1733                     ; 487 {
1734                     	switch	.text
1735  028f               _UART1_SendData9:
1737  028f 89            	pushw	x
1738       00000000      OFST:	set	0
1741                     ; 489   UART1->CR1 &= ((uint8_t)~UART1_CR1_T8);
1743  0290 721d5234      	bres	21044,#6
1744                     ; 491   UART1->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART1_CR1_T8);
1746  0294 54            	srlw	x
1747  0295 54            	srlw	x
1748  0296 9f            	ld	a,xl
1749  0297 a440          	and	a,#64
1750  0299 ca5234        	or	a,21044
1751  029c c75234        	ld	21044,a
1752                     ; 493   UART1->DR   = (uint8_t)(Data);
1754  029f 7b02          	ld	a,(OFST+2,sp)
1755  02a1 c75231        	ld	21041,a
1756                     ; 494 }
1759  02a4 85            	popw	x
1760  02a5 81            	ret
1783                     ; 501 void UART1_SendBreak(void)
1783                     ; 502 {
1784                     	switch	.text
1785  02a6               _UART1_SendBreak:
1789                     ; 503   UART1->CR2 |= UART1_CR2_SBK;
1791  02a6 72105235      	bset	21045,#0
1792                     ; 504 }
1795  02aa 81            	ret
1829                     ; 511 void UART1_SetAddress(uint8_t UART1_Address)
1829                     ; 512 {
1830                     	switch	.text
1831  02ab               _UART1_SetAddress:
1833  02ab 88            	push	a
1834       00000000      OFST:	set	0
1837                     ; 514   assert_param(IS_UART1_ADDRESS_OK(UART1_Address));
1839                     ; 517   UART1->CR4 &= ((uint8_t)~UART1_CR4_ADD);
1841  02ac c65237        	ld	a,21047
1842  02af a4f0          	and	a,#240
1843  02b1 c75237        	ld	21047,a
1844                     ; 519   UART1->CR4 |= UART1_Address;
1846  02b4 c65237        	ld	a,21047
1847  02b7 1a01          	or	a,(OFST+1,sp)
1848  02b9 c75237        	ld	21047,a
1849                     ; 520 }
1852  02bc 84            	pop	a
1853  02bd 81            	ret
1887                     ; 528 void UART1_SetGuardTime(uint8_t UART1_GuardTime)
1887                     ; 529 {
1888                     	switch	.text
1889  02be               _UART1_SetGuardTime:
1893                     ; 531   UART1->GTR = UART1_GuardTime;
1895  02be c75239        	ld	21049,a
1896                     ; 532 }
1899  02c1 81            	ret
1933                     ; 556 void UART1_SetPrescaler(uint8_t UART1_Prescaler)
1933                     ; 557 {
1934                     	switch	.text
1935  02c2               _UART1_SetPrescaler:
1939                     ; 559   UART1->PSCR = UART1_Prescaler;
1941  02c2 c7523a        	ld	21050,a
1942                     ; 560 }
1945  02c5 81            	ret
2088                     ; 568 FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
2088                     ; 569 {
2089                     	switch	.text
2090  02c6               _UART1_GetFlagStatus:
2092  02c6 89            	pushw	x
2093  02c7 88            	push	a
2094       00000001      OFST:	set	1
2097                     ; 570   FlagStatus status = RESET;
2099                     ; 573   assert_param(IS_UART1_FLAG_OK(UART1_FLAG));
2101                     ; 577   if (UART1_FLAG == UART1_FLAG_LBDF)
2103  02c8 a30210        	cpw	x,#528
2104  02cb 2610          	jrne	L7501
2105                     ; 579     if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2107  02cd 9f            	ld	a,xl
2108  02ce c45237        	and	a,21047
2109  02d1 2706          	jreq	L1601
2110                     ; 582       status = SET;
2112  02d3 a601          	ld	a,#1
2113  02d5 6b01          	ld	(OFST+0,sp),a
2115  02d7 202b          	jra	L5601
2116  02d9               L1601:
2117                     ; 587       status = RESET;
2119  02d9 0f01          	clr	(OFST+0,sp)
2120  02db 2027          	jra	L5601
2121  02dd               L7501:
2122                     ; 590   else if (UART1_FLAG == UART1_FLAG_SBK)
2124  02dd 1e02          	ldw	x,(OFST+1,sp)
2125  02df a30101        	cpw	x,#257
2126  02e2 2611          	jrne	L7601
2127                     ; 592     if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2129  02e4 c65235        	ld	a,21045
2130  02e7 1503          	bcp	a,(OFST+2,sp)
2131  02e9 2706          	jreq	L1701
2132                     ; 595       status = SET;
2134  02eb a601          	ld	a,#1
2135  02ed 6b01          	ld	(OFST+0,sp),a
2137  02ef 2013          	jra	L5601
2138  02f1               L1701:
2139                     ; 600       status = RESET;
2141  02f1 0f01          	clr	(OFST+0,sp)
2142  02f3 200f          	jra	L5601
2143  02f5               L7601:
2144                     ; 605     if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2146  02f5 c65230        	ld	a,21040
2147  02f8 1503          	bcp	a,(OFST+2,sp)
2148  02fa 2706          	jreq	L7701
2149                     ; 608       status = SET;
2151  02fc a601          	ld	a,#1
2152  02fe 6b01          	ld	(OFST+0,sp),a
2154  0300 2002          	jra	L5601
2155  0302               L7701:
2156                     ; 613       status = RESET;
2158  0302 0f01          	clr	(OFST+0,sp)
2159  0304               L5601:
2160                     ; 617   return status;
2162  0304 7b01          	ld	a,(OFST+0,sp)
2165  0306 5b03          	addw	sp,#3
2166  0308 81            	ret
2201                     ; 646 void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
2201                     ; 647 {
2202                     	switch	.text
2203  0309               _UART1_ClearFlag:
2207                     ; 648   assert_param(IS_UART1_CLEAR_FLAG_OK(UART1_FLAG));
2209                     ; 651   if (UART1_FLAG == UART1_FLAG_RXNE)
2211  0309 a30020        	cpw	x,#32
2212  030c 2606          	jrne	L1211
2213                     ; 653     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2215  030e 35df5230      	mov	21040,#223
2217  0312 2004          	jra	L3211
2218  0314               L1211:
2219                     ; 658     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2221  0314 72195237      	bres	21047,#4
2222  0318               L3211:
2223                     ; 660 }
2226  0318 81            	ret
2308                     ; 675 ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
2308                     ; 676 {
2309                     	switch	.text
2310  0319               _UART1_GetITStatus:
2312  0319 89            	pushw	x
2313  031a 89            	pushw	x
2314       00000002      OFST:	set	2
2317                     ; 677   ITStatus pendingbitstatus = RESET;
2319                     ; 678   uint8_t itpos = 0;
2321                     ; 679   uint8_t itmask1 = 0;
2323                     ; 680   uint8_t itmask2 = 0;
2325                     ; 681   uint8_t enablestatus = 0;
2327                     ; 684   assert_param(IS_UART1_GET_IT_OK(UART1_IT));
2329                     ; 687   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
2331  031b 9f            	ld	a,xl
2332  031c a40f          	and	a,#15
2333  031e 5f            	clrw	x
2334  031f 97            	ld	xl,a
2335  0320 a601          	ld	a,#1
2336  0322 5d            	tnzw	x
2337  0323 2704          	jreq	L27
2338  0325               L47:
2339  0325 48            	sll	a
2340  0326 5a            	decw	x
2341  0327 26fc          	jrne	L47
2342  0329               L27:
2343  0329 6b01          	ld	(OFST-1,sp),a
2344                     ; 689   itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
2346  032b 7b04          	ld	a,(OFST+2,sp)
2347  032d 4e            	swap	a
2348  032e a40f          	and	a,#15
2349  0330 6b02          	ld	(OFST+0,sp),a
2350                     ; 691   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2352  0332 7b02          	ld	a,(OFST+0,sp)
2353  0334 5f            	clrw	x
2354  0335 97            	ld	xl,a
2355  0336 a601          	ld	a,#1
2356  0338 5d            	tnzw	x
2357  0339 2704          	jreq	L67
2358  033b               L001:
2359  033b 48            	sll	a
2360  033c 5a            	decw	x
2361  033d 26fc          	jrne	L001
2362  033f               L67:
2363  033f 6b02          	ld	(OFST+0,sp),a
2364                     ; 695   if (UART1_IT == UART1_IT_PE)
2366  0341 1e03          	ldw	x,(OFST+1,sp)
2367  0343 a30100        	cpw	x,#256
2368  0346 261c          	jrne	L7611
2369                     ; 698     enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
2371  0348 c65234        	ld	a,21044
2372  034b 1402          	and	a,(OFST+0,sp)
2373  034d 6b02          	ld	(OFST+0,sp),a
2374                     ; 701     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2376  034f c65230        	ld	a,21040
2377  0352 1501          	bcp	a,(OFST-1,sp)
2378  0354 270a          	jreq	L1711
2380  0356 0d02          	tnz	(OFST+0,sp)
2381  0358 2706          	jreq	L1711
2382                     ; 704       pendingbitstatus = SET;
2384  035a a601          	ld	a,#1
2385  035c 6b02          	ld	(OFST+0,sp),a
2387  035e 2041          	jra	L5711
2388  0360               L1711:
2389                     ; 709       pendingbitstatus = RESET;
2391  0360 0f02          	clr	(OFST+0,sp)
2392  0362 203d          	jra	L5711
2393  0364               L7611:
2394                     ; 713   else if (UART1_IT == UART1_IT_LBDF)
2396  0364 1e03          	ldw	x,(OFST+1,sp)
2397  0366 a30346        	cpw	x,#838
2398  0369 261c          	jrne	L7711
2399                     ; 716     enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
2401  036b c65237        	ld	a,21047
2402  036e 1402          	and	a,(OFST+0,sp)
2403  0370 6b02          	ld	(OFST+0,sp),a
2404                     ; 718     if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2406  0372 c65237        	ld	a,21047
2407  0375 1501          	bcp	a,(OFST-1,sp)
2408  0377 270a          	jreq	L1021
2410  0379 0d02          	tnz	(OFST+0,sp)
2411  037b 2706          	jreq	L1021
2412                     ; 721       pendingbitstatus = SET;
2414  037d a601          	ld	a,#1
2415  037f 6b02          	ld	(OFST+0,sp),a
2417  0381 201e          	jra	L5711
2418  0383               L1021:
2419                     ; 726       pendingbitstatus = RESET;
2421  0383 0f02          	clr	(OFST+0,sp)
2422  0385 201a          	jra	L5711
2423  0387               L7711:
2424                     ; 732     enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
2426  0387 c65235        	ld	a,21045
2427  038a 1402          	and	a,(OFST+0,sp)
2428  038c 6b02          	ld	(OFST+0,sp),a
2429                     ; 734     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2431  038e c65230        	ld	a,21040
2432  0391 1501          	bcp	a,(OFST-1,sp)
2433  0393 270a          	jreq	L7021
2435  0395 0d02          	tnz	(OFST+0,sp)
2436  0397 2706          	jreq	L7021
2437                     ; 737       pendingbitstatus = SET;
2439  0399 a601          	ld	a,#1
2440  039b 6b02          	ld	(OFST+0,sp),a
2442  039d 2002          	jra	L5711
2443  039f               L7021:
2444                     ; 742       pendingbitstatus = RESET;
2446  039f 0f02          	clr	(OFST+0,sp)
2447  03a1               L5711:
2448                     ; 747   return  pendingbitstatus;
2450  03a1 7b02          	ld	a,(OFST+0,sp)
2453  03a3 5b04          	addw	sp,#4
2454  03a5 81            	ret
2490                     ; 775 void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
2490                     ; 776 {
2491                     	switch	.text
2492  03a6               _UART1_ClearITPendingBit:
2496                     ; 777   assert_param(IS_UART1_CLEAR_IT_OK(UART1_IT));
2498                     ; 780   if (UART1_IT == UART1_IT_RXNE)
2500  03a6 a30255        	cpw	x,#597
2501  03a9 2606          	jrne	L1321
2502                     ; 782     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2504  03ab 35df5230      	mov	21040,#223
2506  03af 2004          	jra	L3321
2507  03b1               L1321:
2508                     ; 787     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2510  03b1 72195237      	bres	21047,#4
2511  03b5               L3321:
2512                     ; 789 }
2515  03b5 81            	ret
2528                     	xdef	_UART1_ClearITPendingBit
2529                     	xdef	_UART1_GetITStatus
2530                     	xdef	_UART1_ClearFlag
2531                     	xdef	_UART1_GetFlagStatus
2532                     	xdef	_UART1_SetPrescaler
2533                     	xdef	_UART1_SetGuardTime
2534                     	xdef	_UART1_SetAddress
2535                     	xdef	_UART1_SendBreak
2536                     	xdef	_UART1_SendData9
2537                     	xdef	_UART1_SendData8
2538                     	xdef	_UART1_ReceiveData9
2539                     	xdef	_UART1_ReceiveData8
2540                     	xdef	_UART1_ReceiverWakeUpCmd
2541                     	xdef	_UART1_WakeUpConfig
2542                     	xdef	_UART1_SmartCardNACKCmd
2543                     	xdef	_UART1_SmartCardCmd
2544                     	xdef	_UART1_LINCmd
2545                     	xdef	_UART1_LINBreakDetectionConfig
2546                     	xdef	_UART1_IrDACmd
2547                     	xdef	_UART1_IrDAConfig
2548                     	xdef	_UART1_HalfDuplexCmd
2549                     	xdef	_UART1_ITConfig
2550                     	xdef	_UART1_Cmd
2551                     	xdef	_UART1_Init
2552                     	xdef	_UART1_DeInit
2553                     	xref	_CLK_GetClockFreq
2554                     	xref.b	c_lreg
2555                     	xref.b	c_x
2574                     	xref	c_lursh
2575                     	xref	c_lsub
2576                     	xref	c_smul
2577                     	xref	c_ludv
2578                     	xref	c_rtol
2579                     	xref	c_llsh
2580                     	xref	c_ltor
2581                     	end
