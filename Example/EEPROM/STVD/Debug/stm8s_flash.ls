   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  76                     ; 87 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
  76                     ; 88 {
  78                     	switch	.text
  79  0000               _FLASH_Unlock:
  83                     ; 90   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
  85                     ; 93   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
  87  0000 a1fd          	cp	a,#253
  88  0002 260a          	jrne	L73
  89                     ; 95     FLASH->PUKR = FLASH_RASS_KEY1;
  91  0004 35565062      	mov	20578,#86
  92                     ; 96     FLASH->PUKR = FLASH_RASS_KEY2;
  94  0008 35ae5062      	mov	20578,#174
  96  000c 2008          	jra	L14
  97  000e               L73:
  98                     ; 101     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 100  000e 35ae5064      	mov	20580,#174
 101                     ; 102     FLASH->DUKR = FLASH_RASS_KEY1;
 103  0012 35565064      	mov	20580,#86
 104  0016               L14:
 105                     ; 104 }
 108  0016 81            	ret
 143                     ; 112 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 143                     ; 113 {
 144                     	switch	.text
 145  0017               _FLASH_Lock:
 149                     ; 115   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
 151                     ; 118   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 153  0017 c4505f        	and	a,20575
 154  001a c7505f        	ld	20575,a
 155                     ; 119 }
 158  001d 81            	ret
 181                     ; 126 void FLASH_DeInit(void)
 181                     ; 127 {
 182                     	switch	.text
 183  001e               _FLASH_DeInit:
 187                     ; 128   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 189  001e 725f505a      	clr	20570
 190                     ; 129   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 192  0022 725f505b      	clr	20571
 193                     ; 130   FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
 195  0026 35ff505c      	mov	20572,#255
 196                     ; 131   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
 198  002a 7217505f      	bres	20575,#3
 199                     ; 132   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
 201  002e 7213505f      	bres	20575,#1
 202                     ; 133   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 204  0032 c6505f        	ld	a,20575
 205                     ; 134 }
 208  0035 81            	ret
 263                     ; 142 void FLASH_ITConfig(FunctionalState NewState)
 263                     ; 143 {
 264                     	switch	.text
 265  0036               _FLASH_ITConfig:
 269                     ; 145   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 271                     ; 147   if(NewState != DISABLE)
 273  0036 4d            	tnz	a
 274  0037 2706          	jreq	L711
 275                     ; 149     FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
 277  0039 7212505a      	bset	20570,#1
 279  003d 2004          	jra	L121
 280  003f               L711:
 281                     ; 153     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
 283  003f 7213505a      	bres	20570,#1
 284  0043               L121:
 285                     ; 155 }
 288  0043 81            	ret
 322                     ; 164 void FLASH_EraseByte(uint32_t Address)
 322                     ; 165 {
 323                     	switch	.text
 324  0044               _FLASH_EraseByte:
 326       00000000      OFST:	set	0
 329                     ; 167   assert_param(IS_FLASH_ADDRESS_OK(Address));
 331                     ; 170   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; 
 333  0044 1e05          	ldw	x,(OFST+5,sp)
 334  0046 7f            	clr	(x)
 335                     ; 171 }
 338  0047 81            	ret
 381                     ; 181 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 381                     ; 182 {
 382                     	switch	.text
 383  0048               _FLASH_ProgramByte:
 385       00000000      OFST:	set	0
 388                     ; 184   assert_param(IS_FLASH_ADDRESS_OK(Address));
 390                     ; 185   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 392  0048 7b07          	ld	a,(OFST+7,sp)
 393  004a 1e05          	ldw	x,(OFST+5,sp)
 394  004c f7            	ld	(x),a
 395                     ; 186 }
 398  004d 81            	ret
 432                     ; 195 uint8_t FLASH_ReadByte(uint32_t Address)
 432                     ; 196 {
 433                     	switch	.text
 434  004e               _FLASH_ReadByte:
 436       00000000      OFST:	set	0
 439                     ; 198   assert_param(IS_FLASH_ADDRESS_OK(Address));
 441                     ; 201   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address); 
 443  004e 1e05          	ldw	x,(OFST+5,sp)
 444  0050 f6            	ld	a,(x)
 447  0051 81            	ret
 490                     ; 212 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 490                     ; 213 {
 491                     	switch	.text
 492  0052               _FLASH_ProgramWord:
 494       00000000      OFST:	set	0
 497                     ; 215   assert_param(IS_FLASH_ADDRESS_OK(Address));
 499                     ; 218   FLASH->CR2 |= FLASH_CR2_WPRG;
 501  0052 721c505b      	bset	20571,#6
 502                     ; 219   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
 504  0056 721d505c      	bres	20572,#6
 505                     ; 222   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));
 507  005a 7b07          	ld	a,(OFST+7,sp)
 508  005c 1e05          	ldw	x,(OFST+5,sp)
 509  005e f7            	ld	(x),a
 510                     ; 224   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data)+1); 
 512  005f 7b08          	ld	a,(OFST+8,sp)
 513  0061 1e05          	ldw	x,(OFST+5,sp)
 514  0063 e701          	ld	(1,x),a
 515                     ; 226   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data)+2); 
 517  0065 7b09          	ld	a,(OFST+9,sp)
 518  0067 1e05          	ldw	x,(OFST+5,sp)
 519  0069 e702          	ld	(2,x),a
 520                     ; 228   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data)+3); 
 522  006b 7b0a          	ld	a,(OFST+10,sp)
 523  006d 1e05          	ldw	x,(OFST+5,sp)
 524  006f e703          	ld	(3,x),a
 525                     ; 229 }
 528  0071 81            	ret
 573                     ; 237 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 573                     ; 238 {
 574                     	switch	.text
 575  0072               _FLASH_ProgramOptionByte:
 577  0072 89            	pushw	x
 578       00000000      OFST:	set	0
 581                     ; 240   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 583                     ; 243   FLASH->CR2 |= FLASH_CR2_OPT;
 585  0073 721e505b      	bset	20571,#7
 586                     ; 244   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 588  0077 721f505c      	bres	20572,#7
 589                     ; 247   if(Address == 0x4800)
 591  007b a34800        	cpw	x,#18432
 592  007e 2607          	jrne	L542
 593                     ; 250     *((NEAR uint8_t*)Address) = Data;
 595  0080 7b05          	ld	a,(OFST+5,sp)
 596  0082 1e01          	ldw	x,(OFST+1,sp)
 597  0084 f7            	ld	(x),a
 599  0085 200c          	jra	L742
 600  0087               L542:
 601                     ; 255     *((NEAR uint8_t*)Address) = Data;
 603  0087 7b05          	ld	a,(OFST+5,sp)
 604  0089 1e01          	ldw	x,(OFST+1,sp)
 605  008b f7            	ld	(x),a
 606                     ; 256     *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
 608  008c 7b05          	ld	a,(OFST+5,sp)
 609  008e 43            	cpl	a
 610  008f 1e01          	ldw	x,(OFST+1,sp)
 611  0091 e701          	ld	(1,x),a
 612  0093               L742:
 613                     ; 258   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 615  0093 a6fd          	ld	a,#253
 616  0095 cd017d        	call	_FLASH_WaitForLastOperation
 618                     ; 261   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 620  0098 721f505b      	bres	20571,#7
 621                     ; 262   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 623  009c 721e505c      	bset	20572,#7
 624                     ; 263 }
 627  00a0 85            	popw	x
 628  00a1 81            	ret
 664                     ; 270 void FLASH_EraseOptionByte(uint16_t Address)
 664                     ; 271 {
 665                     	switch	.text
 666  00a2               _FLASH_EraseOptionByte:
 668  00a2 89            	pushw	x
 669       00000000      OFST:	set	0
 672                     ; 273   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 674                     ; 276   FLASH->CR2 |= FLASH_CR2_OPT;
 676  00a3 721e505b      	bset	20571,#7
 677                     ; 277   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 679  00a7 721f505c      	bres	20572,#7
 680                     ; 280   if(Address == 0x4800)
 682  00ab a34800        	cpw	x,#18432
 683  00ae 2603          	jrne	L762
 684                     ; 283     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 686  00b0 7f            	clr	(x)
 688  00b1 2009          	jra	L172
 689  00b3               L762:
 690                     ; 288     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 692  00b3 1e01          	ldw	x,(OFST+1,sp)
 693  00b5 7f            	clr	(x)
 694                     ; 289     *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
 696  00b6 1e01          	ldw	x,(OFST+1,sp)
 697  00b8 a6ff          	ld	a,#255
 698  00ba e701          	ld	(1,x),a
 699  00bc               L172:
 700                     ; 291   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 702  00bc a6fd          	ld	a,#253
 703  00be cd017d        	call	_FLASH_WaitForLastOperation
 705                     ; 294   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 707  00c1 721f505b      	bres	20571,#7
 708                     ; 295   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 710  00c5 721e505c      	bset	20572,#7
 711                     ; 296 }
 714  00c9 85            	popw	x
 715  00ca 81            	ret
 778                     ; 303 uint16_t FLASH_ReadOptionByte(uint16_t Address)
 778                     ; 304 {
 779                     	switch	.text
 780  00cb               _FLASH_ReadOptionByte:
 782  00cb 5204          	subw	sp,#4
 783       00000004      OFST:	set	4
 786                     ; 305   uint8_t value_optbyte, value_optbyte_complement = 0;
 788                     ; 306   uint16_t res_value = 0;
 790                     ; 309   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 792                     ; 311   value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
 794  00cd f6            	ld	a,(x)
 795  00ce 6b02          	ld	(OFST-2,sp),a
 796                     ; 312   value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
 798  00d0 e601          	ld	a,(1,x)
 799  00d2 6b01          	ld	(OFST-3,sp),a
 800                     ; 315   if(Address == 0x4800)	 
 802  00d4 a34800        	cpw	x,#18432
 803  00d7 2608          	jrne	L523
 804                     ; 317     res_value =	 value_optbyte;
 806  00d9 7b02          	ld	a,(OFST-2,sp)
 807  00db 5f            	clrw	x
 808  00dc 97            	ld	xl,a
 809  00dd 1f03          	ldw	(OFST-1,sp),x
 811  00df 2023          	jra	L723
 812  00e1               L523:
 813                     ; 321     if(value_optbyte == (uint8_t)(~value_optbyte_complement))
 815  00e1 7b01          	ld	a,(OFST-3,sp)
 816  00e3 43            	cpl	a
 817  00e4 1102          	cp	a,(OFST-2,sp)
 818  00e6 2617          	jrne	L133
 819                     ; 323       res_value = (uint16_t)((uint16_t)value_optbyte << 8);
 821  00e8 7b02          	ld	a,(OFST-2,sp)
 822  00ea 5f            	clrw	x
 823  00eb 97            	ld	xl,a
 824  00ec 4f            	clr	a
 825  00ed 02            	rlwa	x,a
 826  00ee 1f03          	ldw	(OFST-1,sp),x
 827                     ; 324       res_value = res_value | (uint16_t)value_optbyte_complement;
 829  00f0 7b01          	ld	a,(OFST-3,sp)
 830  00f2 5f            	clrw	x
 831  00f3 97            	ld	xl,a
 832  00f4 01            	rrwa	x,a
 833  00f5 1a04          	or	a,(OFST+0,sp)
 834  00f7 01            	rrwa	x,a
 835  00f8 1a03          	or	a,(OFST-1,sp)
 836  00fa 01            	rrwa	x,a
 837  00fb 1f03          	ldw	(OFST-1,sp),x
 839  00fd 2005          	jra	L723
 840  00ff               L133:
 841                     ; 328       res_value = FLASH_OPTIONBYTE_ERROR;
 843  00ff ae5555        	ldw	x,#21845
 844  0102 1f03          	ldw	(OFST-1,sp),x
 845  0104               L723:
 846                     ; 331   return(res_value);
 848  0104 1e03          	ldw	x,(OFST-1,sp)
 851  0106 5b04          	addw	sp,#4
 852  0108 81            	ret
 926                     ; 340 void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
 926                     ; 341 {
 927                     	switch	.text
 928  0109               _FLASH_SetLowPowerMode:
 930  0109 88            	push	a
 931       00000000      OFST:	set	0
 934                     ; 343   assert_param(IS_FLASH_LOW_POWER_MODE_OK(FLASH_LPMode));
 936                     ; 346   FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
 938  010a c6505a        	ld	a,20570
 939  010d a4f3          	and	a,#243
 940  010f c7505a        	ld	20570,a
 941                     ; 349   FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
 943  0112 c6505a        	ld	a,20570
 944  0115 1a01          	or	a,(OFST+1,sp)
 945  0117 c7505a        	ld	20570,a
 946                     ; 350 }
 949  011a 84            	pop	a
 950  011b 81            	ret
1008                     ; 358 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
1008                     ; 359 {
1009                     	switch	.text
1010  011c               _FLASH_SetProgrammingTime:
1014                     ; 361   assert_param(IS_FLASH_PROGRAM_TIME_OK(FLASH_ProgTime));
1016                     ; 363   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
1018  011c 7211505a      	bres	20570,#0
1019                     ; 364   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
1021  0120 ca505a        	or	a,20570
1022  0123 c7505a        	ld	20570,a
1023                     ; 365 }
1026  0126 81            	ret
1051                     ; 372 FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
1051                     ; 373 {
1052                     	switch	.text
1053  0127               _FLASH_GetLowPowerMode:
1057                     ; 374   return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
1059  0127 c6505a        	ld	a,20570
1060  012a a40c          	and	a,#12
1063  012c 81            	ret
1088                     ; 382 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
1088                     ; 383 {
1089                     	switch	.text
1090  012d               _FLASH_GetProgrammingTime:
1094                     ; 384   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
1096  012d c6505a        	ld	a,20570
1097  0130 a401          	and	a,#1
1100  0132 81            	ret
1134                     ; 392 uint32_t FLASH_GetBootSize(void)
1134                     ; 393 {
1135                     	switch	.text
1136  0133               _FLASH_GetBootSize:
1138  0133 5204          	subw	sp,#4
1139       00000004      OFST:	set	4
1142                     ; 394   uint32_t temp = 0;
1144                     ; 397   temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
1146  0135 c6505d        	ld	a,20573
1147  0138 5f            	clrw	x
1148  0139 97            	ld	xl,a
1149  013a 90ae0200      	ldw	y,#512
1150  013e cd0000        	call	c_umul
1152  0141 96            	ldw	x,sp
1153  0142 1c0001        	addw	x,#OFST-3
1154  0145 cd0000        	call	c_rtol
1156                     ; 400   if(FLASH->FPR == 0xFF)
1158  0148 c6505d        	ld	a,20573
1159  014b a1ff          	cp	a,#255
1160  014d 2611          	jrne	L354
1161                     ; 402     temp += 512;
1163  014f ae0200        	ldw	x,#512
1164  0152 bf02          	ldw	c_lreg+2,x
1165  0154 ae0000        	ldw	x,#0
1166  0157 bf00          	ldw	c_lreg,x
1167  0159 96            	ldw	x,sp
1168  015a 1c0001        	addw	x,#OFST-3
1169  015d cd0000        	call	c_lgadd
1171  0160               L354:
1172                     ; 406   return(temp);
1174  0160 96            	ldw	x,sp
1175  0161 1c0001        	addw	x,#OFST-3
1176  0164 cd0000        	call	c_ltor
1180  0167 5b04          	addw	sp,#4
1181  0169 81            	ret
1283                     ; 417 FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
1283                     ; 418 {
1284                     	switch	.text
1285  016a               _FLASH_GetFlagStatus:
1287  016a 88            	push	a
1288       00000001      OFST:	set	1
1291                     ; 419   FlagStatus status = RESET;
1293                     ; 421   assert_param(IS_FLASH_FLAGS_OK(FLASH_FLAG));
1295                     ; 424   if((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1297  016b c4505f        	and	a,20575
1298  016e 2706          	jreq	L325
1299                     ; 426     status = SET; /* FLASH_FLAG is set */
1301  0170 a601          	ld	a,#1
1302  0172 6b01          	ld	(OFST+0,sp),a
1304  0174 2002          	jra	L525
1305  0176               L325:
1306                     ; 430     status = RESET; /* FLASH_FLAG is reset*/
1308  0176 0f01          	clr	(OFST+0,sp)
1309  0178               L525:
1310                     ; 434   return status;
1312  0178 7b01          	ld	a,(OFST+0,sp)
1315  017a 5b01          	addw	sp,#1
1316  017c 81            	ret
1401                     ; 549 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
1401                     ; 550 {
1402                     	switch	.text
1403  017d               _FLASH_WaitForLastOperation:
1405  017d 5203          	subw	sp,#3
1406       00000003      OFST:	set	3
1409                     ; 551   uint8_t flagstatus = 0x00;
1411  017f 0f03          	clr	(OFST+0,sp)
1412                     ; 552   uint16_t timeout = OPERATION_TIMEOUT;
1414  0181 aeffff        	ldw	x,#65535
1415  0184 1f01          	ldw	(OFST-2,sp),x
1417  0186 200e          	jra	L375
1418  0188               L765:
1419                     ; 578     flagstatus = (uint8_t)(FLASH->IAPSR & (FLASH_IAPSR_EOP | FLASH_IAPSR_WR_PG_DIS));
1421  0188 c6505f        	ld	a,20575
1422  018b a405          	and	a,#5
1423  018d 6b03          	ld	(OFST+0,sp),a
1424                     ; 579     timeout--;
1426  018f 1e01          	ldw	x,(OFST-2,sp)
1427  0191 1d0001        	subw	x,#1
1428  0194 1f01          	ldw	(OFST-2,sp),x
1429  0196               L375:
1430                     ; 576   while((flagstatus == 0x00) && (timeout != 0x00))
1432  0196 0d03          	tnz	(OFST+0,sp)
1433  0198 2604          	jrne	L775
1435  019a 1e01          	ldw	x,(OFST-2,sp)
1436  019c 26ea          	jrne	L765
1437  019e               L775:
1438                     ; 583   if(timeout == 0x00 )
1440  019e 1e01          	ldw	x,(OFST-2,sp)
1441  01a0 2604          	jrne	L106
1442                     ; 585     flagstatus = FLASH_STATUS_TIMEOUT;
1444  01a2 a602          	ld	a,#2
1445  01a4 6b03          	ld	(OFST+0,sp),a
1446  01a6               L106:
1447                     ; 588   return((FLASH_Status_TypeDef)flagstatus);
1449  01a6 7b03          	ld	a,(OFST+0,sp)
1452  01a8 5b03          	addw	sp,#3
1453  01aa 81            	ret
1516                     ; 598 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1516                     ; 599 {
1517                     	switch	.text
1518  01ab               _FLASH_EraseBlock:
1520  01ab 89            	pushw	x
1521  01ac 5206          	subw	sp,#6
1522       00000006      OFST:	set	6
1525                     ; 600   uint32_t startaddress = 0;
1527                     ; 610   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1529                     ; 611   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1531  01ae 7b0b          	ld	a,(OFST+5,sp)
1532  01b0 a1fd          	cp	a,#253
1533  01b2 260c          	jrne	L536
1534                     ; 613     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1536                     ; 614     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1538  01b4 ae8000        	ldw	x,#32768
1539  01b7 1f05          	ldw	(OFST-1,sp),x
1540  01b9 ae0000        	ldw	x,#0
1541  01bc 1f03          	ldw	(OFST-3,sp),x
1543  01be 200a          	jra	L736
1544  01c0               L536:
1545                     ; 618     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1547                     ; 619     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1549  01c0 ae4000        	ldw	x,#16384
1550  01c3 1f05          	ldw	(OFST-1,sp),x
1551  01c5 ae0000        	ldw	x,#0
1552  01c8 1f03          	ldw	(OFST-3,sp),x
1553  01ca               L736:
1554                     ; 627     pwFlash = (PointerAttr uint32_t *)(MemoryAddressCast)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1556  01ca 1e07          	ldw	x,(OFST+1,sp)
1557  01cc a640          	ld	a,#64
1558  01ce cd0000        	call	c_cmulx
1560  01d1 96            	ldw	x,sp
1561  01d2 1c0003        	addw	x,#OFST-3
1562  01d5 cd0000        	call	c_ladd
1564  01d8 be02          	ldw	x,c_lreg+2
1565  01da 1f01          	ldw	(OFST-5,sp),x
1566                     ; 631   FLASH->CR2 |= FLASH_CR2_ERASE;
1568  01dc 721a505b      	bset	20571,#5
1569                     ; 632   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
1571  01e0 721b505c      	bres	20572,#5
1572                     ; 636     *pwFlash = (uint32_t)0;
1574  01e4 1e01          	ldw	x,(OFST-5,sp)
1575  01e6 a600          	ld	a,#0
1576  01e8 e703          	ld	(3,x),a
1577  01ea a600          	ld	a,#0
1578  01ec e702          	ld	(2,x),a
1579  01ee a600          	ld	a,#0
1580  01f0 e701          	ld	(1,x),a
1581  01f2 a600          	ld	a,#0
1582  01f4 f7            	ld	(x),a
1583                     ; 644 }
1586  01f5 5b08          	addw	sp,#8
1587  01f7 81            	ret
1691                     ; 655 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
1691                     ; 656                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
1691                     ; 657 {
1692                     	switch	.text
1693  01f8               _FLASH_ProgramBlock:
1695  01f8 89            	pushw	x
1696  01f9 5206          	subw	sp,#6
1697       00000006      OFST:	set	6
1700                     ; 658   uint16_t Count = 0;
1702                     ; 659   uint32_t startaddress = 0;
1704                     ; 662   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1706                     ; 663   assert_param(IS_FLASH_PROGRAM_MODE_OK(FLASH_ProgMode));
1708                     ; 664   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1710  01fb 7b0b          	ld	a,(OFST+5,sp)
1711  01fd a1fd          	cp	a,#253
1712  01ff 260c          	jrne	L317
1713                     ; 666     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1715                     ; 667     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1717  0201 ae8000        	ldw	x,#32768
1718  0204 1f03          	ldw	(OFST-3,sp),x
1719  0206 ae0000        	ldw	x,#0
1720  0209 1f01          	ldw	(OFST-5,sp),x
1722  020b 200a          	jra	L517
1723  020d               L317:
1724                     ; 671     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1726                     ; 672     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1728  020d ae4000        	ldw	x,#16384
1729  0210 1f03          	ldw	(OFST-3,sp),x
1730  0212 ae0000        	ldw	x,#0
1731  0215 1f01          	ldw	(OFST-5,sp),x
1732  0217               L517:
1733                     ; 676   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1735  0217 1e07          	ldw	x,(OFST+1,sp)
1736  0219 a640          	ld	a,#64
1737  021b cd0000        	call	c_cmulx
1739  021e 96            	ldw	x,sp
1740  021f 1c0001        	addw	x,#OFST-5
1741  0222 cd0000        	call	c_lgadd
1743                     ; 679   if(FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
1745  0225 0d0c          	tnz	(OFST+6,sp)
1746  0227 260a          	jrne	L717
1747                     ; 682     FLASH->CR2 |= FLASH_CR2_PRG;
1749  0229 7210505b      	bset	20571,#0
1750                     ; 683     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
1752  022d 7211505c      	bres	20572,#0
1754  0231 2008          	jra	L127
1755  0233               L717:
1756                     ; 688     FLASH->CR2 |= FLASH_CR2_FPRG;
1758  0233 7218505b      	bset	20571,#4
1759                     ; 689     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
1761  0237 7219505c      	bres	20572,#4
1762  023b               L127:
1763                     ; 693   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1765  023b 5f            	clrw	x
1766  023c 1f05          	ldw	(OFST-1,sp),x
1767  023e               L327:
1768                     ; 695     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1770  023e 1e0d          	ldw	x,(OFST+7,sp)
1771  0240 72fb05        	addw	x,(OFST-1,sp)
1772  0243 f6            	ld	a,(x)
1773  0244 1e03          	ldw	x,(OFST-3,sp)
1774  0246 72fb05        	addw	x,(OFST-1,sp)
1775  0249 f7            	ld	(x),a
1776                     ; 693   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1778  024a 1e05          	ldw	x,(OFST-1,sp)
1779  024c 1c0001        	addw	x,#1
1780  024f 1f05          	ldw	(OFST-1,sp),x
1783  0251 1e05          	ldw	x,(OFST-1,sp)
1784  0253 a30040        	cpw	x,#64
1785  0256 25e6          	jrult	L327
1786                     ; 697 }
1789  0258 5b08          	addw	sp,#8
1790  025a 81            	ret
1803                     	xdef	_FLASH_WaitForLastOperation
1804                     	xdef	_FLASH_ProgramBlock
1805                     	xdef	_FLASH_EraseBlock
1806                     	xdef	_FLASH_GetFlagStatus
1807                     	xdef	_FLASH_GetBootSize
1808                     	xdef	_FLASH_GetProgrammingTime
1809                     	xdef	_FLASH_GetLowPowerMode
1810                     	xdef	_FLASH_SetProgrammingTime
1811                     	xdef	_FLASH_SetLowPowerMode
1812                     	xdef	_FLASH_EraseOptionByte
1813                     	xdef	_FLASH_ProgramOptionByte
1814                     	xdef	_FLASH_ReadOptionByte
1815                     	xdef	_FLASH_ProgramWord
1816                     	xdef	_FLASH_ReadByte
1817                     	xdef	_FLASH_ProgramByte
1818                     	xdef	_FLASH_EraseByte
1819                     	xdef	_FLASH_ITConfig
1820                     	xdef	_FLASH_DeInit
1821                     	xdef	_FLASH_Lock
1822                     	xdef	_FLASH_Unlock
1823                     	xref.b	c_lreg
1824                     	xref.b	c_x
1825                     	xref.b	c_y
1844                     	xref	c_ladd
1845                     	xref	c_cmulx
1846                     	xref	c_ltor
1847                     	xref	c_lgadd
1848                     	xref	c_rtol
1849                     	xref	c_umul
1850                     	end
