   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
   4                     ; Optimizer V4.3.6 - 29 Nov 2011
  20                     .const:	section	.text
  21  0000               _HSIDivFactor:
  22  0000 01            	dc.b	1
  23  0001 02            	dc.b	2
  24  0002 04            	dc.b	4
  25  0003 08            	dc.b	8
  26  0004               _CLKPrescTable:
  27  0004 01            	dc.b	1
  28  0005 02            	dc.b	2
  29  0006 04            	dc.b	4
  30  0007 08            	dc.b	8
  31  0008 0a            	dc.b	10
  32  0009 10            	dc.b	16
  33  000a 14            	dc.b	20
  34  000b 28            	dc.b	40
  63                     ; 72 void CLK_DeInit(void)
  63                     ; 73 {
  65                     	switch	.text
  66  0000               _CLK_DeInit:
  70                     ; 74   CLK->ICKR = CLK_ICKR_RESET_VALUE;
  72  0000 350150c0      	mov	20672,#1
  73                     ; 75   CLK->ECKR = CLK_ECKR_RESET_VALUE;
  75  0004 725f50c1      	clr	20673
  76                     ; 76   CLK->SWR  = CLK_SWR_RESET_VALUE;
  78  0008 35e150c4      	mov	20676,#225
  79                     ; 77   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  81  000c 725f50c5      	clr	20677
  82                     ; 78   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  84  0010 351850c6      	mov	20678,#24
  85                     ; 79   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  87  0014 35ff50c7      	mov	20679,#255
  88                     ; 80   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  90  0018 35ff50ca      	mov	20682,#255
  91                     ; 81   CLK->CSSR = CLK_CSSR_RESET_VALUE;
  93  001c 725f50c8      	clr	20680
  94                     ; 82   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  96  0020 725f50c9      	clr	20681
  98  0024               L52:
  99                     ; 83   while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
 101  0024 720050c9fb    	btjt	20681,#0,L52
 102                     ; 85   CLK->CCOR = CLK_CCOR_RESET_VALUE;
 104  0029 725f50c9      	clr	20681
 105                     ; 86   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 107  002d 725f50cc      	clr	20684
 108                     ; 87   CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 110  0031 725f50cd      	clr	20685
 111                     ; 88 }
 114  0035 81            	ret	
 170                     ; 99 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 170                     ; 100 {
 171                     	switch	.text
 172  0036               _CLK_FastHaltWakeUpCmd:
 176                     ; 102   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 178                     ; 104   if (NewState != DISABLE)
 180  0036 4d            	tnz	a
 181  0037 2705          	jreq	L75
 182                     ; 107     CLK->ICKR |= CLK_ICKR_FHWU;
 184  0039 721450c0      	bset	20672,#2
 187  003d 81            	ret	
 188  003e               L75:
 189                     ; 112     CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 191  003e 721550c0      	bres	20672,#2
 192                     ; 114 }
 195  0042 81            	ret	
 230                     ; 121 void CLK_HSECmd(FunctionalState NewState)
 230                     ; 122 {
 231                     	switch	.text
 232  0043               _CLK_HSECmd:
 236                     ; 124   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 238                     ; 126   if (NewState != DISABLE)
 240  0043 4d            	tnz	a
 241  0044 2705          	jreq	L101
 242                     ; 129     CLK->ECKR |= CLK_ECKR_HSEEN;
 244  0046 721050c1      	bset	20673,#0
 247  004a 81            	ret	
 248  004b               L101:
 249                     ; 134     CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 251  004b 721150c1      	bres	20673,#0
 252                     ; 136 }
 255  004f 81            	ret	
 290                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 290                     ; 144 {
 291                     	switch	.text
 292  0050               _CLK_HSICmd:
 296                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 298                     ; 148   if (NewState != DISABLE)
 300  0050 4d            	tnz	a
 301  0051 2705          	jreq	L321
 302                     ; 151     CLK->ICKR |= CLK_ICKR_HSIEN;
 304  0053 721050c0      	bset	20672,#0
 307  0057 81            	ret	
 308  0058               L321:
 309                     ; 156     CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 311  0058 721150c0      	bres	20672,#0
 312                     ; 158 }
 315  005c 81            	ret	
 350                     ; 166 void CLK_LSICmd(FunctionalState NewState)
 350                     ; 167 {
 351                     	switch	.text
 352  005d               _CLK_LSICmd:
 356                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 358                     ; 171   if (NewState != DISABLE)
 360  005d 4d            	tnz	a
 361  005e 2705          	jreq	L541
 362                     ; 174     CLK->ICKR |= CLK_ICKR_LSIEN;
 364  0060 721650c0      	bset	20672,#3
 367  0064 81            	ret	
 368  0065               L541:
 369                     ; 179     CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 371  0065 721750c0      	bres	20672,#3
 372                     ; 181 }
 375  0069 81            	ret	
 410                     ; 189 void CLK_CCOCmd(FunctionalState NewState)
 410                     ; 190 {
 411                     	switch	.text
 412  006a               _CLK_CCOCmd:
 416                     ; 192   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 418                     ; 194   if (NewState != DISABLE)
 420  006a 4d            	tnz	a
 421  006b 2705          	jreq	L761
 422                     ; 197     CLK->CCOR |= CLK_CCOR_CCOEN;
 424  006d 721050c9      	bset	20681,#0
 427  0071 81            	ret	
 428  0072               L761:
 429                     ; 202     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 431  0072 721150c9      	bres	20681,#0
 432                     ; 204 }
 435  0076 81            	ret	
 470                     ; 213 void CLK_ClockSwitchCmd(FunctionalState NewState)
 470                     ; 214 {
 471                     	switch	.text
 472  0077               _CLK_ClockSwitchCmd:
 476                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 478                     ; 218   if (NewState != DISABLE )
 480  0077 4d            	tnz	a
 481  0078 2705          	jreq	L112
 482                     ; 221     CLK->SWCR |= CLK_SWCR_SWEN;
 484  007a 721250c5      	bset	20677,#1
 487  007e 81            	ret	
 488  007f               L112:
 489                     ; 226     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 491  007f 721350c5      	bres	20677,#1
 492                     ; 228 }
 495  0083 81            	ret	
 531                     ; 238 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 531                     ; 239 {
 532                     	switch	.text
 533  0084               _CLK_SlowActiveHaltWakeUpCmd:
 537                     ; 241   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 539                     ; 243   if (NewState != DISABLE)
 541  0084 4d            	tnz	a
 542  0085 2705          	jreq	L332
 543                     ; 246     CLK->ICKR |= CLK_ICKR_SWUAH;
 545  0087 721a50c0      	bset	20672,#5
 548  008b 81            	ret	
 549  008c               L332:
 550                     ; 251     CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 552  008c 721b50c0      	bres	20672,#5
 553                     ; 253 }
 556  0090 81            	ret	
 715                     ; 263 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 715                     ; 264 {
 716                     	switch	.text
 717  0091               _CLK_PeripheralClockConfig:
 719  0091 89            	pushw	x
 720       00000000      OFST:	set	0
 723                     ; 266   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 725                     ; 267   assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 727                     ; 269   if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 729  0092 9e            	ld	a,xh
 730  0093 a510          	bcp	a,#16
 731  0095 2626          	jrne	L123
 732                     ; 271     if (NewState != DISABLE)
 734  0097 7b02          	ld	a,(OFST+2,sp)
 735  0099 270f          	jreq	L323
 736                     ; 274       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 738  009b 7b01          	ld	a,(OFST+1,sp)
 739  009d ad44          	call	LC003
 740  009f 2704          	jreq	L62
 741  00a1               L03:
 742  00a1 48            	sll	a
 743  00a2 5a            	decw	x
 744  00a3 26fc          	jrne	L03
 745  00a5               L62:
 746  00a5 ca50c7        	or	a,20679
 748  00a8 200e          	jp	LC002
 749  00aa               L323:
 750                     ; 279       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 752  00aa 7b01          	ld	a,(OFST+1,sp)
 753  00ac ad35          	call	LC003
 754  00ae 2704          	jreq	L23
 755  00b0               L43:
 756  00b0 48            	sll	a
 757  00b1 5a            	decw	x
 758  00b2 26fc          	jrne	L43
 759  00b4               L23:
 760  00b4 43            	cpl	a
 761  00b5 c450c7        	and	a,20679
 762  00b8               LC002:
 763  00b8 c750c7        	ld	20679,a
 764  00bb 2024          	jra	L723
 765  00bd               L123:
 766                     ; 284     if (NewState != DISABLE)
 768  00bd 7b02          	ld	a,(OFST+2,sp)
 769  00bf 270f          	jreq	L133
 770                     ; 287       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 772  00c1 7b01          	ld	a,(OFST+1,sp)
 773  00c3 ad1e          	call	LC003
 774  00c5 2704          	jreq	L63
 775  00c7               L04:
 776  00c7 48            	sll	a
 777  00c8 5a            	decw	x
 778  00c9 26fc          	jrne	L04
 779  00cb               L63:
 780  00cb ca50ca        	or	a,20682
 782  00ce 200e          	jp	LC001
 783  00d0               L133:
 784                     ; 292       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 786  00d0 7b01          	ld	a,(OFST+1,sp)
 787  00d2 ad0f          	call	LC003
 788  00d4 2704          	jreq	L24
 789  00d6               L44:
 790  00d6 48            	sll	a
 791  00d7 5a            	decw	x
 792  00d8 26fc          	jrne	L44
 793  00da               L24:
 794  00da 43            	cpl	a
 795  00db c450ca        	and	a,20682
 796  00de               LC001:
 797  00de c750ca        	ld	20682,a
 798  00e1               L723:
 799                     ; 295 }
 802  00e1 85            	popw	x
 803  00e2 81            	ret	
 804  00e3               LC003:
 805  00e3 a40f          	and	a,#15
 806  00e5 5f            	clrw	x
 807  00e6 97            	ld	xl,a
 808  00e7 a601          	ld	a,#1
 809  00e9 5d            	tnzw	x
 810  00ea 81            	ret	
 998                     ; 309 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
 998                     ; 310 {
 999                     	switch	.text
1000  00eb               _CLK_ClockSwitchConfig:
1002  00eb 89            	pushw	x
1003  00ec 5204          	subw	sp,#4
1004       00000004      OFST:	set	4
1007                     ; 312   uint16_t DownCounter = CLK_TIMEOUT;
1009  00ee aeffff        	ldw	x,#65535
1010  00f1 1f03          	ldw	(OFST-1,sp),x
1011                     ; 313   ErrorStatus Swif = ERROR;
1013                     ; 316   assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1015                     ; 317   assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1017                     ; 318   assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1019                     ; 319   assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1021                     ; 322   clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1023  00f3 c650c3        	ld	a,20675
1024  00f6 6b01          	ld	(OFST-3,sp),a
1025                     ; 325   if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1027  00f8 7b05          	ld	a,(OFST+1,sp)
1028  00fa 4a            	dec	a
1029  00fb 263d          	jrne	L544
1030                     ; 328     CLK->SWCR |= CLK_SWCR_SWEN;
1032  00fd 721250c5      	bset	20677,#1
1033                     ; 331     if (ITState != DISABLE)
1035  0101 7b09          	ld	a,(OFST+5,sp)
1036  0103 2706          	jreq	L744
1037                     ; 333       CLK->SWCR |= CLK_SWCR_SWIEN;
1039  0105 721450c5      	bset	20677,#2
1041  0109 2004          	jra	L154
1042  010b               L744:
1043                     ; 337       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1045  010b 721550c5      	bres	20677,#2
1046  010f               L154:
1047                     ; 341     CLK->SWR = (uint8_t)CLK_NewClock;
1049  010f 7b06          	ld	a,(OFST+2,sp)
1050  0111 c750c4        	ld	20676,a
1052  0114 2003          	jra	L754
1053  0116               L354:
1054                     ; 346       DownCounter--;
1056  0116 5a            	decw	x
1057  0117 1f03          	ldw	(OFST-1,sp),x
1058  0119               L754:
1059                     ; 344     while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1061  0119 720150c504    	btjf	20677,#0,L364
1063  011e 1e03          	ldw	x,(OFST-1,sp)
1064  0120 26f4          	jrne	L354
1065  0122               L364:
1066                     ; 349     if(DownCounter != 0)
1068  0122 1e03          	ldw	x,(OFST-1,sp)
1069                     ; 351       Swif = SUCCESS;
1071  0124 263d          	jrne	LC005
1072  0126               L564:
1073                     ; 355       Swif = ERROR;
1076  0126 0f02          	clr	(OFST-2,sp)
1077  0128               L174:
1078                     ; 390   if(Swif != ERROR)
1080  0128 275d          	jreq	L515
1081                     ; 393     if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1083  012a 7b0a          	ld	a,(OFST+6,sp)
1084  012c 263b          	jrne	L715
1086  012e 7b01          	ld	a,(OFST-3,sp)
1087  0130 a1e1          	cp	a,#225
1088  0132 2635          	jrne	L715
1089                     ; 395       CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1091  0134 721150c0      	bres	20672,#0
1093  0138 204d          	jra	L515
1094  013a               L544:
1095                     ; 361     if (ITState != DISABLE)
1097  013a 7b09          	ld	a,(OFST+5,sp)
1098  013c 2706          	jreq	L374
1099                     ; 363       CLK->SWCR |= CLK_SWCR_SWIEN;
1101  013e 721450c5      	bset	20677,#2
1103  0142 2004          	jra	L574
1104  0144               L374:
1105                     ; 367       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1107  0144 721550c5      	bres	20677,#2
1108  0148               L574:
1109                     ; 371     CLK->SWR = (uint8_t)CLK_NewClock;
1111  0148 7b06          	ld	a,(OFST+2,sp)
1112  014a c750c4        	ld	20676,a
1114  014d 2003          	jra	L305
1115  014f               L774:
1116                     ; 376       DownCounter--;
1118  014f 5a            	decw	x
1119  0150 1f03          	ldw	(OFST-1,sp),x
1120  0152               L305:
1121                     ; 374     while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
1123  0152 720750c504    	btjf	20677,#3,L705
1125  0157 1e03          	ldw	x,(OFST-1,sp)
1126  0159 26f4          	jrne	L774
1127  015b               L705:
1128                     ; 379     if(DownCounter != 0)
1130  015b 1e03          	ldw	x,(OFST-1,sp)
1131  015d 27c7          	jreq	L564
1132                     ; 382       CLK->SWCR |= CLK_SWCR_SWEN;
1134  015f 721250c5      	bset	20677,#1
1135                     ; 383       Swif = SUCCESS;
1137  0163               LC005:
1139  0163 a601          	ld	a,#1
1140  0165 6b02          	ld	(OFST-2,sp),a
1142  0167 20bf          	jra	L174
1143                     ; 387       Swif = ERROR;
1144  0169               L715:
1145                     ; 397     else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1147  0169 7b0a          	ld	a,(OFST+6,sp)
1148  016b 260c          	jrne	L325
1150  016d 7b01          	ld	a,(OFST-3,sp)
1151  016f a1d2          	cp	a,#210
1152  0171 2606          	jrne	L325
1153                     ; 399       CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1155  0173 721750c0      	bres	20672,#3
1157  0177 200e          	jra	L515
1158  0179               L325:
1159                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1161  0179 7b0a          	ld	a,(OFST+6,sp)
1162  017b 260a          	jrne	L515
1164  017d 7b01          	ld	a,(OFST-3,sp)
1165  017f a1b4          	cp	a,#180
1166  0181 2604          	jrne	L515
1167                     ; 403       CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1169  0183 721150c1      	bres	20673,#0
1170  0187               L515:
1171                     ; 406   return(Swif);
1173  0187 7b02          	ld	a,(OFST-2,sp)
1176  0189 5b06          	addw	sp,#6
1177  018b 81            	ret	
1315                     ; 415 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1315                     ; 416 {
1316                     	switch	.text
1317  018c               _CLK_HSIPrescalerConfig:
1319  018c 88            	push	a
1320       00000000      OFST:	set	0
1323                     ; 418   assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1325                     ; 421   CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1327  018d c650c6        	ld	a,20678
1328  0190 a4e7          	and	a,#231
1329  0192 c750c6        	ld	20678,a
1330                     ; 424   CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1332  0195 c650c6        	ld	a,20678
1333  0198 1a01          	or	a,(OFST+1,sp)
1334  019a c750c6        	ld	20678,a
1335                     ; 425 }
1338  019d 84            	pop	a
1339  019e 81            	ret	
1474                     ; 436 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1474                     ; 437 {
1475                     	switch	.text
1476  019f               _CLK_CCOConfig:
1478  019f 88            	push	a
1479       00000000      OFST:	set	0
1482                     ; 439   assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1484                     ; 442   CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1486  01a0 c650c9        	ld	a,20681
1487  01a3 a4e1          	and	a,#225
1488  01a5 c750c9        	ld	20681,a
1489                     ; 445   CLK->CCOR |= (uint8_t)CLK_CCO;
1491  01a8 c650c9        	ld	a,20681
1492  01ab 1a01          	or	a,(OFST+1,sp)
1493  01ad c750c9        	ld	20681,a
1494                     ; 448   CLK->CCOR |= CLK_CCOR_CCOEN;
1496                     ; 449 }
1499  01b0 84            	pop	a
1500  01b1 721050c9      	bset	20681,#0
1501  01b5 81            	ret	
1566                     ; 459 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1566                     ; 460 {
1567                     	switch	.text
1568  01b6               _CLK_ITConfig:
1570  01b6 89            	pushw	x
1571       00000000      OFST:	set	0
1574                     ; 462   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1576                     ; 463   assert_param(IS_CLK_IT_OK(CLK_IT));
1578                     ; 465   if (NewState != DISABLE)
1580  01b7 9f            	ld	a,xl
1581  01b8 4d            	tnz	a
1582  01b9 2715          	jreq	L527
1583                     ; 467     switch (CLK_IT)
1585  01bb 9e            	ld	a,xh
1587                     ; 475     default:
1587                     ; 476       break;
1588  01bc a00c          	sub	a,#12
1589  01be 270a          	jreq	L166
1590  01c0 a010          	sub	a,#16
1591  01c2 2620          	jrne	L337
1592                     ; 469     case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1592                     ; 470       CLK->SWCR |= CLK_SWCR_SWIEN;
1594  01c4 721450c5      	bset	20677,#2
1595                     ; 471       break;
1597  01c8 201a          	jra	L337
1598  01ca               L166:
1599                     ; 472     case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1599                     ; 473       CLK->CSSR |= CLK_CSSR_CSSDIE;
1601  01ca 721450c8      	bset	20680,#2
1602                     ; 474       break;
1604  01ce 2014          	jra	L337
1605                     ; 475     default:
1605                     ; 476       break;
1608  01d0               L527:
1609                     ; 481     switch (CLK_IT)
1611  01d0 7b01          	ld	a,(OFST+1,sp)
1613                     ; 489     default:
1613                     ; 490       break;
1614  01d2 a00c          	sub	a,#12
1615  01d4 270a          	jreq	L766
1616  01d6 a010          	sub	a,#16
1617  01d8 260a          	jrne	L337
1618                     ; 483     case CLK_IT_SWIF: /* Disable the clock switch interrupt */
1618                     ; 484       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
1620  01da 721550c5      	bres	20677,#2
1621                     ; 485       break;
1623  01de 2004          	jra	L337
1624  01e0               L766:
1625                     ; 486     case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
1625                     ; 487       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
1627  01e0 721550c8      	bres	20680,#2
1628                     ; 488       break;
1629  01e4               L337:
1630                     ; 493 }
1633  01e4 85            	popw	x
1634  01e5 81            	ret	
1635                     ; 489     default:
1635                     ; 490       break;
1671                     ; 500 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
1671                     ; 501 {
1672                     	switch	.text
1673  01e6               _CLK_SYSCLKConfig:
1675  01e6 88            	push	a
1676       00000000      OFST:	set	0
1679                     ; 503   assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
1681                     ; 505   if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
1683  01e7 a580          	bcp	a,#128
1684  01e9 260e          	jrne	L757
1685                     ; 507     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1687  01eb c650c6        	ld	a,20678
1688  01ee a4e7          	and	a,#231
1689  01f0 c750c6        	ld	20678,a
1690                     ; 508     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
1692  01f3 7b01          	ld	a,(OFST+1,sp)
1693  01f5 a418          	and	a,#24
1695  01f7 200c          	jra	L167
1696  01f9               L757:
1697                     ; 512     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
1699  01f9 c650c6        	ld	a,20678
1700  01fc a4f8          	and	a,#248
1701  01fe c750c6        	ld	20678,a
1702                     ; 513     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
1704  0201 7b01          	ld	a,(OFST+1,sp)
1705  0203 a407          	and	a,#7
1706  0205               L167:
1707  0205 ca50c6        	or	a,20678
1708  0208 c750c6        	ld	20678,a
1709                     ; 515 }
1712  020b 84            	pop	a
1713  020c 81            	ret	
1769                     ; 523 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
1769                     ; 524 {
1770                     	switch	.text
1771  020d               _CLK_SWIMConfig:
1775                     ; 526   assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
1777                     ; 528   if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
1779  020d 4d            	tnz	a
1780  020e 2705          	jreq	L1101
1781                     ; 531     CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
1783  0210 721050cd      	bset	20685,#0
1786  0214 81            	ret	
1787  0215               L1101:
1788                     ; 536     CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
1790  0215 721150cd      	bres	20685,#0
1791                     ; 538 }
1794  0219 81            	ret	
1818                     ; 547 void CLK_ClockSecuritySystemEnable(void)
1818                     ; 548 {
1819                     	switch	.text
1820  021a               _CLK_ClockSecuritySystemEnable:
1824                     ; 550   CLK->CSSR |= CLK_CSSR_CSSEN;
1826  021a 721050c8      	bset	20680,#0
1827                     ; 551 }
1830  021e 81            	ret	
1855                     ; 559 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
1855                     ; 560 {
1856                     	switch	.text
1857  021f               _CLK_GetSYSCLKSource:
1861                     ; 561   return((CLK_Source_TypeDef)CLK->CMSR);
1863  021f c650c3        	ld	a,20675
1866  0222 81            	ret	
1929                     ; 569 uint32_t CLK_GetClockFreq(void)
1929                     ; 570 {
1930                     	switch	.text
1931  0223               _CLK_GetClockFreq:
1933  0223 5209          	subw	sp,#9
1934       00000009      OFST:	set	9
1937                     ; 571   uint32_t clockfrequency = 0;
1939                     ; 572   CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
1941                     ; 573   uint8_t tmp = 0, presc = 0;
1945                     ; 576   clocksource = (CLK_Source_TypeDef)CLK->CMSR;
1947  0225 c650c3        	ld	a,20675
1948  0228 6b09          	ld	(OFST+0,sp),a
1949                     ; 578   if (clocksource == CLK_SOURCE_HSI)
1951  022a a1e1          	cp	a,#225
1952  022c 2634          	jrne	L7601
1953                     ; 580     tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
1955  022e c650c6        	ld	a,20678
1956  0231 a418          	and	a,#24
1957  0233 44            	srl	a
1958  0234 44            	srl	a
1959  0235 44            	srl	a
1960                     ; 581     tmp = (uint8_t)(tmp >> 3);
1962                     ; 582     presc = HSIDivFactor[tmp];
1964  0236 5f            	clrw	x
1965  0237 97            	ld	xl,a
1966  0238 d60000        	ld	a,(_HSIDivFactor,x)
1967  023b 6b09          	ld	(OFST+0,sp),a
1968                     ; 583     clockfrequency = HSI_VALUE / presc;
1970  023d b703          	ld	c_lreg+3,a
1971  023f 3f02          	clr	c_lreg+2
1972  0241 3f01          	clr	c_lreg+1
1973  0243 3f00          	clr	c_lreg
1974  0245 96            	ldw	x,sp
1975  0246 5c            	incw	x
1976  0247 cd0000        	call	c_rtol
1978  024a ae2400        	ldw	x,#9216
1979  024d bf02          	ldw	c_lreg+2,x
1980  024f ae00f4        	ldw	x,#244
1981  0252 bf00          	ldw	c_lreg,x
1982  0254 96            	ldw	x,sp
1983  0255 5c            	incw	x
1984  0256 cd0000        	call	c_ludv
1986  0259 96            	ldw	x,sp
1987  025a 1c0005        	addw	x,#OFST-4
1988  025d cd0000        	call	c_rtol
1991  0260 2018          	jra	L1701
1992  0262               L7601:
1993                     ; 585   else if ( clocksource == CLK_SOURCE_LSI)
1995  0262 a1d2          	cp	a,#210
1996  0264 260a          	jrne	L3701
1997                     ; 587     clockfrequency = LSI_VALUE;
1999  0266 aef400        	ldw	x,#62464
2000  0269 1f07          	ldw	(OFST-2,sp),x
2001  026b ae0001        	ldw	x,#1
2003  026e 2008          	jp	LC006
2004  0270               L3701:
2005                     ; 591     clockfrequency = HSE_VALUE;
2007  0270 ae2400        	ldw	x,#9216
2008  0273 1f07          	ldw	(OFST-2,sp),x
2009  0275 ae00f4        	ldw	x,#244
2010  0278               LC006:
2011  0278 1f05          	ldw	(OFST-4,sp),x
2012  027a               L1701:
2013                     ; 594   return((uint32_t)clockfrequency);
2015  027a 96            	ldw	x,sp
2016  027b 1c0005        	addw	x,#OFST-4
2017  027e cd0000        	call	c_ltor
2021  0281 5b09          	addw	sp,#9
2022  0283 81            	ret	
2121                     ; 604 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2121                     ; 605 {
2122                     	switch	.text
2123  0284               _CLK_AdjustHSICalibrationValue:
2125  0284 88            	push	a
2126       00000000      OFST:	set	0
2129                     ; 607   assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2131                     ; 610   CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2133  0285 c650cc        	ld	a,20684
2134  0288 a4f8          	and	a,#248
2135  028a 1a01          	or	a,(OFST+1,sp)
2136  028c c750cc        	ld	20684,a
2137                     ; 611 }
2140  028f 84            	pop	a
2141  0290 81            	ret	
2165                     ; 622 void CLK_SYSCLKEmergencyClear(void)
2165                     ; 623 {
2166                     	switch	.text
2167  0291               _CLK_SYSCLKEmergencyClear:
2171                     ; 624   CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2173  0291 721150c5      	bres	20677,#0
2174                     ; 625 }
2177  0295 81            	ret	
2330                     ; 634 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2330                     ; 635 {
2331                     	switch	.text
2332  0296               _CLK_GetFlagStatus:
2334  0296 89            	pushw	x
2335  0297 5203          	subw	sp,#3
2336       00000003      OFST:	set	3
2339                     ; 636   uint16_t statusreg = 0;
2341                     ; 637   uint8_t tmpreg = 0;
2343                     ; 638   FlagStatus bitstatus = RESET;
2345                     ; 641   assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2347                     ; 644   statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2349  0299 01            	rrwa	x,a
2350  029a 4f            	clr	a
2351  029b 02            	rlwa	x,a
2352  029c 1f01          	ldw	(OFST-2,sp),x
2353                     ; 647   if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2355  029e a30100        	cpw	x,#256
2356  02a1 2605          	jrne	L1421
2357                     ; 649     tmpreg = CLK->ICKR;
2359  02a3 c650c0        	ld	a,20672
2361  02a6 2021          	jra	L3421
2362  02a8               L1421:
2363                     ; 651   else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2365  02a8 a30200        	cpw	x,#512
2366  02ab 2605          	jrne	L5421
2367                     ; 653     tmpreg = CLK->ECKR;
2369  02ad c650c1        	ld	a,20673
2371  02b0 2017          	jra	L3421
2372  02b2               L5421:
2373                     ; 655   else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2375  02b2 a30300        	cpw	x,#768
2376  02b5 2605          	jrne	L1521
2377                     ; 657     tmpreg = CLK->SWCR;
2379  02b7 c650c5        	ld	a,20677
2381  02ba 200d          	jra	L3421
2382  02bc               L1521:
2383                     ; 659   else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2385  02bc a30400        	cpw	x,#1024
2386  02bf 2605          	jrne	L5521
2387                     ; 661     tmpreg = CLK->CSSR;
2389  02c1 c650c8        	ld	a,20680
2391  02c4 2003          	jra	L3421
2392  02c6               L5521:
2393                     ; 665     tmpreg = CLK->CCOR;
2395  02c6 c650c9        	ld	a,20681
2396  02c9               L3421:
2397  02c9 6b03          	ld	(OFST+0,sp),a
2398                     ; 668   if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2400  02cb 7b05          	ld	a,(OFST+2,sp)
2401  02cd 1503          	bcp	a,(OFST+0,sp)
2402  02cf 2704          	jreq	L1621
2403                     ; 670     bitstatus = SET;
2405  02d1 a601          	ld	a,#1
2407  02d3 2001          	jra	L3621
2408  02d5               L1621:
2409                     ; 674     bitstatus = RESET;
2411  02d5 4f            	clr	a
2412  02d6               L3621:
2413                     ; 678   return((FlagStatus)bitstatus);
2417  02d6 5b05          	addw	sp,#5
2418  02d8 81            	ret	
2464                     ; 687 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2464                     ; 688 {
2465                     	switch	.text
2466  02d9               _CLK_GetITStatus:
2468  02d9 88            	push	a
2469  02da 88            	push	a
2470       00000001      OFST:	set	1
2473                     ; 689   ITStatus bitstatus = RESET;
2475                     ; 692   assert_param(IS_CLK_IT_OK(CLK_IT));
2477                     ; 694   if (CLK_IT == CLK_IT_SWIF)
2479  02db a11c          	cp	a,#28
2480  02dd 2609          	jrne	L7031
2481                     ; 697     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2483  02df c450c5        	and	a,20677
2484  02e2 a10c          	cp	a,#12
2485  02e4 260f          	jrne	L7131
2486                     ; 699       bitstatus = SET;
2488  02e6 2009          	jp	LC008
2489                     ; 703       bitstatus = RESET;
2490  02e8               L7031:
2491                     ; 709     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2493  02e8 c650c8        	ld	a,20680
2494  02eb 1402          	and	a,(OFST+1,sp)
2495  02ed a10c          	cp	a,#12
2496  02ef 2604          	jrne	L7131
2497                     ; 711       bitstatus = SET;
2499  02f1               LC008:
2501  02f1 a601          	ld	a,#1
2503  02f3 2001          	jra	L5131
2504  02f5               L7131:
2505                     ; 715       bitstatus = RESET;
2508  02f5 4f            	clr	a
2509  02f6               L5131:
2510                     ; 720   return bitstatus;
2514  02f6 85            	popw	x
2515  02f7 81            	ret	
2551                     ; 729 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2551                     ; 730 {
2552                     	switch	.text
2553  02f8               _CLK_ClearITPendingBit:
2557                     ; 732   assert_param(IS_CLK_IT_OK(CLK_IT));
2559                     ; 734   if (CLK_IT == (uint8_t)CLK_IT_CSSD)
2561  02f8 a10c          	cp	a,#12
2562  02fa 2605          	jrne	L1431
2563                     ; 737     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
2565  02fc 721750c8      	bres	20680,#3
2568  0300 81            	ret	
2569  0301               L1431:
2570                     ; 742     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2572  0301 721750c5      	bres	20677,#3
2573                     ; 745 }
2576  0305 81            	ret	
2611                     	xdef	_CLKPrescTable
2612                     	xdef	_HSIDivFactor
2613                     	xdef	_CLK_ClearITPendingBit
2614                     	xdef	_CLK_GetITStatus
2615                     	xdef	_CLK_GetFlagStatus
2616                     	xdef	_CLK_GetSYSCLKSource
2617                     	xdef	_CLK_GetClockFreq
2618                     	xdef	_CLK_AdjustHSICalibrationValue
2619                     	xdef	_CLK_SYSCLKEmergencyClear
2620                     	xdef	_CLK_ClockSecuritySystemEnable
2621                     	xdef	_CLK_SWIMConfig
2622                     	xdef	_CLK_SYSCLKConfig
2623                     	xdef	_CLK_ITConfig
2624                     	xdef	_CLK_CCOConfig
2625                     	xdef	_CLK_HSIPrescalerConfig
2626                     	xdef	_CLK_ClockSwitchConfig
2627                     	xdef	_CLK_PeripheralClockConfig
2628                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
2629                     	xdef	_CLK_FastHaltWakeUpCmd
2630                     	xdef	_CLK_ClockSwitchCmd
2631                     	xdef	_CLK_CCOCmd
2632                     	xdef	_CLK_LSICmd
2633                     	xdef	_CLK_HSICmd
2634                     	xdef	_CLK_HSECmd
2635                     	xdef	_CLK_DeInit
2636                     	xref.b	c_lreg
2637                     	xref.b	c_x
2656                     	xref	c_ltor
2657                     	xref	c_ludv
2658                     	xref	c_rtol
2659                     	end
