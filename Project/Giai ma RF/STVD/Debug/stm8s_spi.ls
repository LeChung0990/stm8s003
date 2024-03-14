   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  44                     ; 50 void SPI_DeInit(void)
  44                     ; 51 {
  46                     	switch	.text
  47  0000               _SPI_DeInit:
  51                     ; 52   SPI->CR1    = SPI_CR1_RESET_VALUE;
  53  0000 725f5200      	clr	20992
  54                     ; 53   SPI->CR2    = SPI_CR2_RESET_VALUE;
  56  0004 725f5201      	clr	20993
  57                     ; 54   SPI->ICR    = SPI_ICR_RESET_VALUE;
  59  0008 725f5202      	clr	20994
  60                     ; 55   SPI->SR     = SPI_SR_RESET_VALUE;
  62  000c 35025203      	mov	20995,#2
  63                     ; 56   SPI->CRCPR  = SPI_CRCPR_RESET_VALUE;
  65  0010 35075205      	mov	20997,#7
  66                     ; 57 }
  69  0014 81            	ret
 385                     ; 78 void SPI_Init(SPI_FirstBit_TypeDef FirstBit, SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler, SPI_Mode_TypeDef Mode, SPI_ClockPolarity_TypeDef ClockPolarity, SPI_ClockPhase_TypeDef ClockPhase, SPI_DataDirection_TypeDef Data_Direction, SPI_NSS_TypeDef Slave_Management, uint8_t CRCPolynomial)
 385                     ; 79 {
 386                     	switch	.text
 387  0015               _SPI_Init:
 389  0015 89            	pushw	x
 390  0016 88            	push	a
 391       00000001      OFST:	set	1
 394                     ; 81   assert_param(IS_SPI_FIRSTBIT_OK(FirstBit));
 396                     ; 82   assert_param(IS_SPI_BAUDRATE_PRESCALER_OK(BaudRatePrescaler));
 398                     ; 83   assert_param(IS_SPI_MODE_OK(Mode));
 400                     ; 84   assert_param(IS_SPI_POLARITY_OK(ClockPolarity));
 402                     ; 85   assert_param(IS_SPI_PHASE_OK(ClockPhase));
 404                     ; 86   assert_param(IS_SPI_DATA_DIRECTION_OK(Data_Direction));
 406                     ; 87   assert_param(IS_SPI_SLAVEMANAGEMENT_OK(Slave_Management));
 408                     ; 88   assert_param(IS_SPI_CRC_POLYNOMIAL_OK(CRCPolynomial));
 410                     ; 91   SPI->CR1 = (uint8_t)((uint8_t)((uint8_t)FirstBit | BaudRatePrescaler) |
 410                     ; 92                        (uint8_t)((uint8_t)ClockPolarity | ClockPhase));
 412  0017 7b07          	ld	a,(OFST+6,sp)
 413  0019 1a08          	or	a,(OFST+7,sp)
 414  001b 6b01          	ld	(OFST+0,sp),a
 415  001d 9f            	ld	a,xl
 416  001e 1a02          	or	a,(OFST+1,sp)
 417  0020 1a01          	or	a,(OFST+0,sp)
 418  0022 c75200        	ld	20992,a
 419                     ; 95   SPI->CR2 = (uint8_t)((uint8_t)(Data_Direction) | (uint8_t)(Slave_Management));
 421  0025 7b09          	ld	a,(OFST+8,sp)
 422  0027 1a0a          	or	a,(OFST+9,sp)
 423  0029 c75201        	ld	20993,a
 424                     ; 97   if (Mode == SPI_MODE_MASTER)
 426  002c 7b06          	ld	a,(OFST+5,sp)
 427  002e a104          	cp	a,#4
 428  0030 2606          	jrne	L302
 429                     ; 99     SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
 431  0032 72105201      	bset	20993,#0
 433  0036 2004          	jra	L502
 434  0038               L302:
 435                     ; 103     SPI->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 437  0038 72115201      	bres	20993,#0
 438  003c               L502:
 439                     ; 107   SPI->CR1 |= (uint8_t)(Mode);
 441  003c c65200        	ld	a,20992
 442  003f 1a06          	or	a,(OFST+5,sp)
 443  0041 c75200        	ld	20992,a
 444                     ; 110   SPI->CRCPR = (uint8_t)CRCPolynomial;
 446  0044 7b0b          	ld	a,(OFST+10,sp)
 447  0046 c75205        	ld	20997,a
 448                     ; 111 }
 451  0049 5b03          	addw	sp,#3
 452  004b 81            	ret
 507                     ; 119 void SPI_Cmd(FunctionalState NewState)
 507                     ; 120 {
 508                     	switch	.text
 509  004c               _SPI_Cmd:
 513                     ; 122   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 515                     ; 124   if (NewState != DISABLE)
 517  004c 4d            	tnz	a
 518  004d 2706          	jreq	L532
 519                     ; 126     SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 521  004f 721c5200      	bset	20992,#6
 523  0053 2004          	jra	L732
 524  0055               L532:
 525                     ; 130     SPI->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 527  0055 721d5200      	bres	20992,#6
 528  0059               L732:
 529                     ; 132 }
 532  0059 81            	ret
 641                     ; 141 void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
 641                     ; 142 {
 642                     	switch	.text
 643  005a               _SPI_ITConfig:
 645  005a 89            	pushw	x
 646  005b 88            	push	a
 647       00000001      OFST:	set	1
 650                     ; 143   uint8_t itpos = 0;
 652                     ; 145   assert_param(IS_SPI_CONFIG_IT_OK(SPI_IT));
 654                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 656                     ; 149   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
 658  005c 9e            	ld	a,xh
 659  005d a40f          	and	a,#15
 660  005f 5f            	clrw	x
 661  0060 97            	ld	xl,a
 662  0061 a601          	ld	a,#1
 663  0063 5d            	tnzw	x
 664  0064 2704          	jreq	L41
 665  0066               L61:
 666  0066 48            	sll	a
 667  0067 5a            	decw	x
 668  0068 26fc          	jrne	L61
 669  006a               L41:
 670  006a 6b01          	ld	(OFST+0,sp),a
 671                     ; 151   if (NewState != DISABLE)
 673  006c 0d03          	tnz	(OFST+2,sp)
 674  006e 270a          	jreq	L113
 675                     ; 153     SPI->ICR |= itpos; /* Enable interrupt*/
 677  0070 c65202        	ld	a,20994
 678  0073 1a01          	or	a,(OFST+0,sp)
 679  0075 c75202        	ld	20994,a
 681  0078 2009          	jra	L313
 682  007a               L113:
 683                     ; 157     SPI->ICR &= (uint8_t)(~itpos); /* Disable interrupt*/
 685  007a 7b01          	ld	a,(OFST+0,sp)
 686  007c 43            	cpl	a
 687  007d c45202        	and	a,20994
 688  0080 c75202        	ld	20994,a
 689  0083               L313:
 690                     ; 159 }
 693  0083 5b03          	addw	sp,#3
 694  0085 81            	ret
 728                     ; 166 void SPI_SendData(uint8_t Data)
 728                     ; 167 {
 729                     	switch	.text
 730  0086               _SPI_SendData:
 734                     ; 168   SPI->DR = Data; /* Write in the DR register the data to be sent*/
 736  0086 c75204        	ld	20996,a
 737                     ; 169 }
 740  0089 81            	ret
 763                     ; 176 uint8_t SPI_ReceiveData(void)
 763                     ; 177 {
 764                     	switch	.text
 765  008a               _SPI_ReceiveData:
 769                     ; 178   return ((uint8_t)SPI->DR); /* Return the data in the DR register*/
 771  008a c65204        	ld	a,20996
 774  008d 81            	ret
 810                     ; 187 void SPI_NSSInternalSoftwareCmd(FunctionalState NewState)
 810                     ; 188 {
 811                     	switch	.text
 812  008e               _SPI_NSSInternalSoftwareCmd:
 816                     ; 190   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 818                     ; 192   if (NewState != DISABLE)
 820  008e 4d            	tnz	a
 821  008f 2706          	jreq	L163
 822                     ; 194     SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
 824  0091 72105201      	bset	20993,#0
 826  0095 2004          	jra	L363
 827  0097               L163:
 828                     ; 198     SPI->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
 830  0097 72115201      	bres	20993,#0
 831  009b               L363:
 832                     ; 200 }
 835  009b 81            	ret
 858                     ; 207 void SPI_TransmitCRC(void)
 858                     ; 208 {
 859                     	switch	.text
 860  009c               _SPI_TransmitCRC:
 864                     ; 209   SPI->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
 866  009c 72185201      	bset	20993,#4
 867                     ; 210 }
 870  00a0 81            	ret
 906                     ; 218 void SPI_CalculateCRCCmd(FunctionalState NewState)
 906                     ; 219 {
 907                     	switch	.text
 908  00a1               _SPI_CalculateCRCCmd:
 912                     ; 221   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 914                     ; 223   if (NewState != DISABLE)
 916  00a1 4d            	tnz	a
 917  00a2 2706          	jreq	L314
 918                     ; 225     SPI->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
 920  00a4 721a5201      	bset	20993,#5
 922  00a8 2004          	jra	L514
 923  00aa               L314:
 924                     ; 229     SPI->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
 926  00aa 721b5201      	bres	20993,#5
 927  00ae               L514:
 928                     ; 231 }
 931  00ae 81            	ret
 995                     ; 238 uint8_t SPI_GetCRC(SPI_CRC_TypeDef SPI_CRC)
 995                     ; 239 {
 996                     	switch	.text
 997  00af               _SPI_GetCRC:
 999  00af 88            	push	a
1000       00000001      OFST:	set	1
1003                     ; 240   uint8_t crcreg = 0;
1005                     ; 243   assert_param(IS_SPI_CRC_OK(SPI_CRC));
1007                     ; 245   if (SPI_CRC != SPI_CRC_RX)
1009  00b0 4d            	tnz	a
1010  00b1 2707          	jreq	L154
1011                     ; 247     crcreg = SPI->TXCRCR;  /* Get the Tx CRC register*/
1013  00b3 c65207        	ld	a,20999
1014  00b6 6b01          	ld	(OFST+0,sp),a
1016  00b8 2005          	jra	L354
1017  00ba               L154:
1018                     ; 251     crcreg = SPI->RXCRCR; /* Get the Rx CRC register*/
1020  00ba c65206        	ld	a,20998
1021  00bd 6b01          	ld	(OFST+0,sp),a
1022  00bf               L354:
1023                     ; 255   return crcreg;
1025  00bf 7b01          	ld	a,(OFST+0,sp)
1028  00c1 5b01          	addw	sp,#1
1029  00c3 81            	ret
1054                     ; 263 void SPI_ResetCRC(void)
1054                     ; 264 {
1055                     	switch	.text
1056  00c4               _SPI_ResetCRC:
1060                     ; 267   SPI_CalculateCRCCmd(ENABLE);
1062  00c4 a601          	ld	a,#1
1063  00c6 add9          	call	_SPI_CalculateCRCCmd
1065                     ; 270   SPI_Cmd(ENABLE);
1067  00c8 a601          	ld	a,#1
1068  00ca ad80          	call	_SPI_Cmd
1070                     ; 271 }
1073  00cc 81            	ret
1097                     ; 278 uint8_t SPI_GetCRCPolynomial(void)
1097                     ; 279 {
1098                     	switch	.text
1099  00cd               _SPI_GetCRCPolynomial:
1103                     ; 280   return SPI->CRCPR; /* Return the CRC polynomial register */
1105  00cd c65205        	ld	a,20997
1108  00d0 81            	ret
1164                     ; 288 void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction)
1164                     ; 289 {
1165                     	switch	.text
1166  00d1               _SPI_BiDirectionalLineConfig:
1170                     ; 291   assert_param(IS_SPI_DIRECTION_OK(SPI_Direction));
1172                     ; 293   if (SPI_Direction != SPI_DIRECTION_RX)
1174  00d1 4d            	tnz	a
1175  00d2 2706          	jreq	L325
1176                     ; 295     SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
1178  00d4 721c5201      	bset	20993,#6
1180  00d8 2004          	jra	L525
1181  00da               L325:
1182                     ; 299     SPI->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
1184  00da 721d5201      	bres	20993,#6
1185  00de               L525:
1186                     ; 301 }
1189  00de 81            	ret
1310                     ; 311 FlagStatus SPI_GetFlagStatus(SPI_Flag_TypeDef SPI_FLAG)
1310                     ; 312 {
1311                     	switch	.text
1312  00df               _SPI_GetFlagStatus:
1314  00df 88            	push	a
1315       00000001      OFST:	set	1
1318                     ; 313   FlagStatus status = RESET;
1320                     ; 315   assert_param(IS_SPI_FLAGS_OK(SPI_FLAG));
1322                     ; 318   if ((SPI->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1324  00e0 c45203        	and	a,20995
1325  00e3 2706          	jreq	L306
1326                     ; 320     status = SET; /* SPI_FLAG is set */
1328  00e5 a601          	ld	a,#1
1329  00e7 6b01          	ld	(OFST+0,sp),a
1331  00e9 2002          	jra	L506
1332  00eb               L306:
1333                     ; 324     status = RESET; /* SPI_FLAG is reset*/
1335  00eb 0f01          	clr	(OFST+0,sp)
1336  00ed               L506:
1337                     ; 328   return status;
1339  00ed 7b01          	ld	a,(OFST+0,sp)
1342  00ef 5b01          	addw	sp,#1
1343  00f1 81            	ret
1378                     ; 346 void SPI_ClearFlag(SPI_Flag_TypeDef SPI_FLAG)
1378                     ; 347 {
1379                     	switch	.text
1380  00f2               _SPI_ClearFlag:
1384                     ; 348   assert_param(IS_SPI_CLEAR_FLAGS_OK(SPI_FLAG));
1386                     ; 350   SPI->SR = (uint8_t)(~SPI_FLAG);
1388  00f2 43            	cpl	a
1389  00f3 c75203        	ld	20995,a
1390                     ; 351 }
1393  00f6 81            	ret
1475                     ; 366 ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT)
1475                     ; 367 {
1476                     	switch	.text
1477  00f7               _SPI_GetITStatus:
1479  00f7 88            	push	a
1480  00f8 89            	pushw	x
1481       00000002      OFST:	set	2
1484                     ; 368   ITStatus pendingbitstatus = RESET;
1486                     ; 369   uint8_t itpos = 0;
1488                     ; 370   uint8_t itmask1 = 0;
1490                     ; 371   uint8_t itmask2 = 0;
1492                     ; 372   uint8_t enablestatus = 0;
1494                     ; 373   assert_param(IS_SPI_GET_IT_OK(SPI_IT));
1496                     ; 375   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1498  00f9 a40f          	and	a,#15
1499  00fb 5f            	clrw	x
1500  00fc 97            	ld	xl,a
1501  00fd a601          	ld	a,#1
1502  00ff 5d            	tnzw	x
1503  0100 2704          	jreq	L05
1504  0102               L25:
1505  0102 48            	sll	a
1506  0103 5a            	decw	x
1507  0104 26fc          	jrne	L25
1508  0106               L05:
1509  0106 6b01          	ld	(OFST-1,sp),a
1510                     ; 378   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1512  0108 7b03          	ld	a,(OFST+1,sp)
1513  010a 4e            	swap	a
1514  010b a40f          	and	a,#15
1515  010d 6b02          	ld	(OFST+0,sp),a
1516                     ; 380   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1518  010f 7b02          	ld	a,(OFST+0,sp)
1519  0111 5f            	clrw	x
1520  0112 97            	ld	xl,a
1521  0113 a601          	ld	a,#1
1522  0115 5d            	tnzw	x
1523  0116 2704          	jreq	L45
1524  0118               L65:
1525  0118 48            	sll	a
1526  0119 5a            	decw	x
1527  011a 26fc          	jrne	L65
1528  011c               L45:
1529  011c 6b02          	ld	(OFST+0,sp),a
1530                     ; 382   enablestatus = (uint8_t)((uint8_t)SPI->SR & itmask2);
1532  011e c65203        	ld	a,20995
1533  0121 1402          	and	a,(OFST+0,sp)
1534  0123 6b02          	ld	(OFST+0,sp),a
1535                     ; 384   if (((SPI->ICR & itpos) != RESET) && enablestatus)
1537  0125 c65202        	ld	a,20994
1538  0128 1501          	bcp	a,(OFST-1,sp)
1539  012a 270a          	jreq	L766
1541  012c 0d02          	tnz	(OFST+0,sp)
1542  012e 2706          	jreq	L766
1543                     ; 387     pendingbitstatus = SET;
1545  0130 a601          	ld	a,#1
1546  0132 6b02          	ld	(OFST+0,sp),a
1548  0134 2002          	jra	L176
1549  0136               L766:
1550                     ; 392     pendingbitstatus = RESET;
1552  0136 0f02          	clr	(OFST+0,sp)
1553  0138               L176:
1554                     ; 395   return  pendingbitstatus;
1556  0138 7b02          	ld	a,(OFST+0,sp)
1559  013a 5b03          	addw	sp,#3
1560  013c 81            	ret
1605                     ; 412 void SPI_ClearITPendingBit(SPI_IT_TypeDef SPI_IT)
1605                     ; 413 {
1606                     	switch	.text
1607  013d               _SPI_ClearITPendingBit:
1609  013d 88            	push	a
1610       00000001      OFST:	set	1
1613                     ; 414   uint8_t itpos = 0;
1615                     ; 415   assert_param(IS_SPI_CLEAR_IT_OK(SPI_IT));
1617                     ; 420   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
1619  013e a4f0          	and	a,#240
1620  0140 4e            	swap	a
1621  0141 a40f          	and	a,#15
1622  0143 5f            	clrw	x
1623  0144 97            	ld	xl,a
1624  0145 a601          	ld	a,#1
1625  0147 5d            	tnzw	x
1626  0148 2704          	jreq	L26
1627  014a               L46:
1628  014a 48            	sll	a
1629  014b 5a            	decw	x
1630  014c 26fc          	jrne	L46
1631  014e               L26:
1632  014e 6b01          	ld	(OFST+0,sp),a
1633                     ; 422   SPI->SR = (uint8_t)(~itpos);
1635  0150 7b01          	ld	a,(OFST+0,sp)
1636  0152 43            	cpl	a
1637  0153 c75203        	ld	20995,a
1638                     ; 424 }
1641  0156 84            	pop	a
1642  0157 81            	ret
1655                     	xdef	_SPI_ClearITPendingBit
1656                     	xdef	_SPI_GetITStatus
1657                     	xdef	_SPI_ClearFlag
1658                     	xdef	_SPI_GetFlagStatus
1659                     	xdef	_SPI_BiDirectionalLineConfig
1660                     	xdef	_SPI_GetCRCPolynomial
1661                     	xdef	_SPI_ResetCRC
1662                     	xdef	_SPI_GetCRC
1663                     	xdef	_SPI_CalculateCRCCmd
1664                     	xdef	_SPI_TransmitCRC
1665                     	xdef	_SPI_NSSInternalSoftwareCmd
1666                     	xdef	_SPI_ReceiveData
1667                     	xdef	_SPI_SendData
1668                     	xdef	_SPI_ITConfig
1669                     	xdef	_SPI_Cmd
1670                     	xdef	_SPI_Init
1671                     	xdef	_SPI_DeInit
1690                     	end
