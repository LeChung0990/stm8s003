   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  44                     ; 52 void ADC1_DeInit(void)
  44                     ; 53 {
  46                     	switch	.text
  47  0000               _ADC1_DeInit:
  51                     ; 54   ADC1->CSR  = ADC1_CSR_RESET_VALUE;
  53  0000 725f5400      	clr	21504
  54                     ; 55   ADC1->CR1  = ADC1_CR1_RESET_VALUE;
  56  0004 725f5401      	clr	21505
  57                     ; 56   ADC1->CR2  = ADC1_CR2_RESET_VALUE;
  59  0008 725f5402      	clr	21506
  60                     ; 57   ADC1->CR3  = ADC1_CR3_RESET_VALUE;
  62  000c 725f5403      	clr	21507
  63                     ; 58   ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
  65  0010 725f5406      	clr	21510
  66                     ; 59   ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
  68  0014 725f5407      	clr	21511
  69                     ; 60   ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
  71  0018 35ff5408      	mov	21512,#255
  72                     ; 61   ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
  74  001c 35035409      	mov	21513,#3
  75                     ; 62   ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
  77  0020 725f540a      	clr	21514
  78                     ; 63   ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
  80  0024 725f540b      	clr	21515
  81                     ; 64   ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
  83  0028 725f540e      	clr	21518
  84                     ; 65   ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
  86  002c 725f540f      	clr	21519
  87                     ; 66 }
  90  0030 81            	ret
 541                     ; 88 void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
 541                     ; 89 {
 542                     	switch	.text
 543  0031               _ADC1_Init:
 545  0031 89            	pushw	x
 546       00000000      OFST:	set	0
 549                     ; 91   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
 551                     ; 92   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
 553                     ; 93   assert_param(IS_ADC1_PRESSEL_OK(ADC1_PrescalerSelection));
 555                     ; 94   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
 557                     ; 95   assert_param(IS_FUNCTIONALSTATE_OK(((ADC1_ExtTriggerState))));
 559                     ; 96   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
 561                     ; 97   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
 563                     ; 98   assert_param(IS_FUNCTIONALSTATE_OK(ADC1_SchmittTriggerState));
 565                     ; 103   ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
 567  0032 7b08          	ld	a,(OFST+8,sp)
 568  0034 88            	push	a
 569  0035 9f            	ld	a,xl
 570  0036 97            	ld	xl,a
 571  0037 7b02          	ld	a,(OFST+2,sp)
 572  0039 95            	ld	xh,a
 573  003a cd013d        	call	_ADC1_ConversionConfig
 575  003d 84            	pop	a
 576                     ; 105   ADC1_PrescalerConfig(ADC1_PrescalerSelection);
 578  003e 7b05          	ld	a,(OFST+5,sp)
 579  0040 ad5a          	call	_ADC1_PrescalerConfig
 581                     ; 110   ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
 583  0042 7b07          	ld	a,(OFST+7,sp)
 584  0044 97            	ld	xl,a
 585  0045 7b06          	ld	a,(OFST+6,sp)
 586  0047 95            	ld	xh,a
 587  0048 cd016b        	call	_ADC1_ExternalTriggerConfig
 589                     ; 115   ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
 591  004b 7b0a          	ld	a,(OFST+10,sp)
 592  004d 97            	ld	xl,a
 593  004e 7b09          	ld	a,(OFST+9,sp)
 594  0050 95            	ld	xh,a
 595  0051 ad5c          	call	_ADC1_SchmittTriggerConfig
 597                     ; 118   ADC1->CR1 |= ADC1_CR1_ADON;
 599  0053 72105401      	bset	21505,#0
 600                     ; 119 }
 603  0057 85            	popw	x
 604  0058 81            	ret
 639                     ; 126 void ADC1_Cmd(FunctionalState NewState)
 639                     ; 127 {
 640                     	switch	.text
 641  0059               _ADC1_Cmd:
 645                     ; 129   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 647                     ; 131   if (NewState != DISABLE)
 649  0059 4d            	tnz	a
 650  005a 2706          	jreq	L362
 651                     ; 133     ADC1->CR1 |= ADC1_CR1_ADON;
 653  005c 72105401      	bset	21505,#0
 655  0060 2004          	jra	L562
 656  0062               L362:
 657                     ; 137     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_ADON);
 659  0062 72115401      	bres	21505,#0
 660  0066               L562:
 661                     ; 139 }
 664  0066 81            	ret
 699                     ; 146 void ADC1_ScanModeCmd(FunctionalState NewState)
 699                     ; 147 {
 700                     	switch	.text
 701  0067               _ADC1_ScanModeCmd:
 705                     ; 149   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 707                     ; 151   if (NewState != DISABLE)
 709  0067 4d            	tnz	a
 710  0068 2706          	jreq	L503
 711                     ; 153     ADC1->CR2 |= ADC1_CR2_SCAN;
 713  006a 72125402      	bset	21506,#1
 715  006e 2004          	jra	L703
 716  0070               L503:
 717                     ; 157     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_SCAN);
 719  0070 72135402      	bres	21506,#1
 720  0074               L703:
 721                     ; 159 }
 724  0074 81            	ret
 759                     ; 166 void ADC1_DataBufferCmd(FunctionalState NewState)
 759                     ; 167 {
 760                     	switch	.text
 761  0075               _ADC1_DataBufferCmd:
 765                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 767                     ; 171   if (NewState != DISABLE)
 769  0075 4d            	tnz	a
 770  0076 2706          	jreq	L723
 771                     ; 173     ADC1->CR3 |= ADC1_CR3_DBUF;
 773  0078 721e5403      	bset	21507,#7
 775  007c 2004          	jra	L133
 776  007e               L723:
 777                     ; 177     ADC1->CR3 &= (uint8_t)(~ADC1_CR3_DBUF);
 779  007e 721f5403      	bres	21507,#7
 780  0082               L133:
 781                     ; 179 }
 784  0082 81            	ret
 940                     ; 190 void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
 940                     ; 191 {
 941                     	switch	.text
 942  0083               _ADC1_ITConfig:
 944  0083 89            	pushw	x
 945       00000000      OFST:	set	0
 948                     ; 193   assert_param(IS_ADC1_IT_OK(ADC1_IT));
 950                     ; 194   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 952                     ; 196   if (NewState != DISABLE)
 954  0084 0d05          	tnz	(OFST+5,sp)
 955  0086 2709          	jreq	L714
 956                     ; 199     ADC1->CSR |= (uint8_t)ADC1_IT;
 958  0088 9f            	ld	a,xl
 959  0089 ca5400        	or	a,21504
 960  008c c75400        	ld	21504,a
 962  008f 2009          	jra	L124
 963  0091               L714:
 964                     ; 204     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT);
 966  0091 7b02          	ld	a,(OFST+2,sp)
 967  0093 43            	cpl	a
 968  0094 c45400        	and	a,21504
 969  0097 c75400        	ld	21504,a
 970  009a               L124:
 971                     ; 206 }
 974  009a 85            	popw	x
 975  009b 81            	ret
1011                     ; 214 void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
1011                     ; 215 {
1012                     	switch	.text
1013  009c               _ADC1_PrescalerConfig:
1015  009c 88            	push	a
1016       00000000      OFST:	set	0
1019                     ; 217   assert_param(IS_ADC1_PRESSEL_OK(ADC1_Prescaler));
1021                     ; 220   ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
1023  009d c65401        	ld	a,21505
1024  00a0 a48f          	and	a,#143
1025  00a2 c75401        	ld	21505,a
1026                     ; 222   ADC1->CR1 |= (uint8_t)(ADC1_Prescaler);
1028  00a5 c65401        	ld	a,21505
1029  00a8 1a01          	or	a,(OFST+1,sp)
1030  00aa c75401        	ld	21505,a
1031                     ; 223 }
1034  00ad 84            	pop	a
1035  00ae 81            	ret
1082                     ; 233 void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
1082                     ; 234 {
1083                     	switch	.text
1084  00af               _ADC1_SchmittTriggerConfig:
1086  00af 89            	pushw	x
1087       00000000      OFST:	set	0
1090                     ; 236   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
1092                     ; 237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1094                     ; 239   if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
1096  00b0 9e            	ld	a,xh
1097  00b1 a1ff          	cp	a,#255
1098  00b3 2620          	jrne	L364
1099                     ; 241     if (NewState != DISABLE)
1101  00b5 9f            	ld	a,xl
1102  00b6 4d            	tnz	a
1103  00b7 270a          	jreq	L564
1104                     ; 243       ADC1->TDRL &= (uint8_t)0x0;
1106  00b9 725f5407      	clr	21511
1107                     ; 244       ADC1->TDRH &= (uint8_t)0x0;
1109  00bd 725f5406      	clr	21510
1111  00c1 2078          	jra	L174
1112  00c3               L564:
1113                     ; 248       ADC1->TDRL |= (uint8_t)0xFF;
1115  00c3 c65407        	ld	a,21511
1116  00c6 aaff          	or	a,#255
1117  00c8 c75407        	ld	21511,a
1118                     ; 249       ADC1->TDRH |= (uint8_t)0xFF;
1120  00cb c65406        	ld	a,21510
1121  00ce aaff          	or	a,#255
1122  00d0 c75406        	ld	21510,a
1123  00d3 2066          	jra	L174
1124  00d5               L364:
1125                     ; 252   else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
1127  00d5 7b01          	ld	a,(OFST+1,sp)
1128  00d7 a108          	cp	a,#8
1129  00d9 242f          	jruge	L374
1130                     ; 254     if (NewState != DISABLE)
1132  00db 0d02          	tnz	(OFST+2,sp)
1133  00dd 2716          	jreq	L574
1134                     ; 256       ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
1136  00df 7b01          	ld	a,(OFST+1,sp)
1137  00e1 5f            	clrw	x
1138  00e2 97            	ld	xl,a
1139  00e3 a601          	ld	a,#1
1140  00e5 5d            	tnzw	x
1141  00e6 2704          	jreq	L42
1142  00e8               L62:
1143  00e8 48            	sll	a
1144  00e9 5a            	decw	x
1145  00ea 26fc          	jrne	L62
1146  00ec               L42:
1147  00ec 43            	cpl	a
1148  00ed c45407        	and	a,21511
1149  00f0 c75407        	ld	21511,a
1151  00f3 2046          	jra	L174
1152  00f5               L574:
1153                     ; 260       ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
1155  00f5 7b01          	ld	a,(OFST+1,sp)
1156  00f7 5f            	clrw	x
1157  00f8 97            	ld	xl,a
1158  00f9 a601          	ld	a,#1
1159  00fb 5d            	tnzw	x
1160  00fc 2704          	jreq	L03
1161  00fe               L23:
1162  00fe 48            	sll	a
1163  00ff 5a            	decw	x
1164  0100 26fc          	jrne	L23
1165  0102               L03:
1166  0102 ca5407        	or	a,21511
1167  0105 c75407        	ld	21511,a
1168  0108 2031          	jra	L174
1169  010a               L374:
1170                     ; 265     if (NewState != DISABLE)
1172  010a 0d02          	tnz	(OFST+2,sp)
1173  010c 2718          	jreq	L305
1174                     ; 267       ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
1176  010e 7b01          	ld	a,(OFST+1,sp)
1177  0110 a008          	sub	a,#8
1178  0112 5f            	clrw	x
1179  0113 97            	ld	xl,a
1180  0114 a601          	ld	a,#1
1181  0116 5d            	tnzw	x
1182  0117 2704          	jreq	L43
1183  0119               L63:
1184  0119 48            	sll	a
1185  011a 5a            	decw	x
1186  011b 26fc          	jrne	L63
1187  011d               L43:
1188  011d 43            	cpl	a
1189  011e c45406        	and	a,21510
1190  0121 c75406        	ld	21510,a
1192  0124 2015          	jra	L174
1193  0126               L305:
1194                     ; 271       ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
1196  0126 7b01          	ld	a,(OFST+1,sp)
1197  0128 a008          	sub	a,#8
1198  012a 5f            	clrw	x
1199  012b 97            	ld	xl,a
1200  012c a601          	ld	a,#1
1201  012e 5d            	tnzw	x
1202  012f 2704          	jreq	L04
1203  0131               L24:
1204  0131 48            	sll	a
1205  0132 5a            	decw	x
1206  0133 26fc          	jrne	L24
1207  0135               L04:
1208  0135 ca5406        	or	a,21510
1209  0138 c75406        	ld	21510,a
1210  013b               L174:
1211                     ; 274 }
1214  013b 85            	popw	x
1215  013c 81            	ret
1272                     ; 286 void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
1272                     ; 287 {
1273                     	switch	.text
1274  013d               _ADC1_ConversionConfig:
1276  013d 89            	pushw	x
1277       00000000      OFST:	set	0
1280                     ; 289   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
1282                     ; 290   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
1284                     ; 291   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
1286                     ; 294   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
1288  013e 72175402      	bres	21506,#3
1289                     ; 296   ADC1->CR2 |= (uint8_t)(ADC1_Align);
1291  0142 c65402        	ld	a,21506
1292  0145 1a05          	or	a,(OFST+5,sp)
1293  0147 c75402        	ld	21506,a
1294                     ; 298   if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
1296  014a 9e            	ld	a,xh
1297  014b a101          	cp	a,#1
1298  014d 2606          	jrne	L535
1299                     ; 301     ADC1->CR1 |= ADC1_CR1_CONT;
1301  014f 72125401      	bset	21505,#1
1303  0153 2004          	jra	L735
1304  0155               L535:
1305                     ; 306     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
1307  0155 72135401      	bres	21505,#1
1308  0159               L735:
1309                     ; 310   ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
1311  0159 c65400        	ld	a,21504
1312  015c a4f0          	and	a,#240
1313  015e c75400        	ld	21504,a
1314                     ; 312   ADC1->CSR |= (uint8_t)(ADC1_Channel);
1316  0161 c65400        	ld	a,21504
1317  0164 1a02          	or	a,(OFST+2,sp)
1318  0166 c75400        	ld	21504,a
1319                     ; 313 }
1322  0169 85            	popw	x
1323  016a 81            	ret
1369                     ; 325 void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
1369                     ; 326 {
1370                     	switch	.text
1371  016b               _ADC1_ExternalTriggerConfig:
1373  016b 89            	pushw	x
1374       00000000      OFST:	set	0
1377                     ; 328   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
1379                     ; 329   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1381                     ; 332   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
1383  016c c65402        	ld	a,21506
1384  016f a4cf          	and	a,#207
1385  0171 c75402        	ld	21506,a
1386                     ; 334   if (NewState != DISABLE)
1388  0174 9f            	ld	a,xl
1389  0175 4d            	tnz	a
1390  0176 2706          	jreq	L365
1391                     ; 337     ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
1393  0178 721c5402      	bset	21506,#6
1395  017c 2004          	jra	L565
1396  017e               L365:
1397                     ; 342     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
1399  017e 721d5402      	bres	21506,#6
1400  0182               L565:
1401                     ; 346   ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
1403  0182 c65402        	ld	a,21506
1404  0185 1a01          	or	a,(OFST+1,sp)
1405  0187 c75402        	ld	21506,a
1406                     ; 347 }
1409  018a 85            	popw	x
1410  018b 81            	ret
1434                     ; 358 void ADC1_StartConversion(void)
1434                     ; 359 {
1435                     	switch	.text
1436  018c               _ADC1_StartConversion:
1440                     ; 360   ADC1->CR1 |= ADC1_CR1_ADON;
1442  018c 72105401      	bset	21505,#0
1443                     ; 361 }
1446  0190 81            	ret
1490                     ; 370 uint16_t ADC1_GetConversionValue(void)
1490                     ; 371 {
1491                     	switch	.text
1492  0191               _ADC1_GetConversionValue:
1494  0191 5205          	subw	sp,#5
1495       00000005      OFST:	set	5
1498                     ; 372   uint16_t temph = 0;
1500                     ; 373   uint8_t templ = 0;
1502                     ; 375   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1504  0193 c65402        	ld	a,21506
1505  0196 a508          	bcp	a,#8
1506  0198 2715          	jreq	L126
1507                     ; 378     templ = ADC1->DRL;
1509  019a c65405        	ld	a,21509
1510  019d 6b03          	ld	(OFST-2,sp),a
1511                     ; 380     temph = ADC1->DRH;
1513  019f c65404        	ld	a,21508
1514  01a2 5f            	clrw	x
1515  01a3 97            	ld	xl,a
1516  01a4 1f04          	ldw	(OFST-1,sp),x
1517                     ; 382     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1519  01a6 1e04          	ldw	x,(OFST-1,sp)
1520  01a8 7b03          	ld	a,(OFST-2,sp)
1521  01aa 02            	rlwa	x,a
1522  01ab 1f04          	ldw	(OFST-1,sp),x
1524  01ad 2021          	jra	L326
1525  01af               L126:
1526                     ; 387     temph = ADC1->DRH;
1528  01af c65404        	ld	a,21508
1529  01b2 5f            	clrw	x
1530  01b3 97            	ld	xl,a
1531  01b4 1f04          	ldw	(OFST-1,sp),x
1532                     ; 389     templ = ADC1->DRL;
1534  01b6 c65405        	ld	a,21509
1535  01b9 6b03          	ld	(OFST-2,sp),a
1536                     ; 391     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
1538  01bb 1e04          	ldw	x,(OFST-1,sp)
1539  01bd 4f            	clr	a
1540  01be 02            	rlwa	x,a
1541  01bf 1f01          	ldw	(OFST-4,sp),x
1542  01c1 7b03          	ld	a,(OFST-2,sp)
1543  01c3 97            	ld	xl,a
1544  01c4 a640          	ld	a,#64
1545  01c6 42            	mul	x,a
1546  01c7 01            	rrwa	x,a
1547  01c8 1a02          	or	a,(OFST-3,sp)
1548  01ca 01            	rrwa	x,a
1549  01cb 1a01          	or	a,(OFST-4,sp)
1550  01cd 01            	rrwa	x,a
1551  01ce 1f04          	ldw	(OFST-1,sp),x
1552  01d0               L326:
1553                     ; 394   return ((uint16_t)temph);
1555  01d0 1e04          	ldw	x,(OFST-1,sp)
1558  01d2 5b05          	addw	sp,#5
1559  01d4 81            	ret
1605                     ; 405 void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
1605                     ; 406 {
1606                     	switch	.text
1607  01d5               _ADC1_AWDChannelConfig:
1609  01d5 89            	pushw	x
1610       00000000      OFST:	set	0
1613                     ; 408   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1615                     ; 409   assert_param(IS_ADC1_CHANNEL_OK(Channel));
1617                     ; 411   if (Channel < (uint8_t)8)
1619  01d6 9e            	ld	a,xh
1620  01d7 a108          	cp	a,#8
1621  01d9 242e          	jruge	L746
1622                     ; 413     if (NewState != DISABLE)
1624  01db 9f            	ld	a,xl
1625  01dc 4d            	tnz	a
1626  01dd 2714          	jreq	L156
1627                     ; 415       ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
1629  01df 9e            	ld	a,xh
1630  01e0 5f            	clrw	x
1631  01e1 97            	ld	xl,a
1632  01e2 a601          	ld	a,#1
1633  01e4 5d            	tnzw	x
1634  01e5 2704          	jreq	L65
1635  01e7               L06:
1636  01e7 48            	sll	a
1637  01e8 5a            	decw	x
1638  01e9 26fc          	jrne	L06
1639  01eb               L65:
1640  01eb ca540f        	or	a,21519
1641  01ee c7540f        	ld	21519,a
1643  01f1 2047          	jra	L556
1644  01f3               L156:
1645                     ; 419       ADC1->AWCRL &= (uint8_t)~(uint8_t)((uint8_t)1 << Channel);
1647  01f3 7b01          	ld	a,(OFST+1,sp)
1648  01f5 5f            	clrw	x
1649  01f6 97            	ld	xl,a
1650  01f7 a601          	ld	a,#1
1651  01f9 5d            	tnzw	x
1652  01fa 2704          	jreq	L26
1653  01fc               L46:
1654  01fc 48            	sll	a
1655  01fd 5a            	decw	x
1656  01fe 26fc          	jrne	L46
1657  0200               L26:
1658  0200 43            	cpl	a
1659  0201 c4540f        	and	a,21519
1660  0204 c7540f        	ld	21519,a
1661  0207 2031          	jra	L556
1662  0209               L746:
1663                     ; 424     if (NewState != DISABLE)
1665  0209 0d02          	tnz	(OFST+2,sp)
1666  020b 2717          	jreq	L756
1667                     ; 426       ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
1669  020d 7b01          	ld	a,(OFST+1,sp)
1670  020f a008          	sub	a,#8
1671  0211 5f            	clrw	x
1672  0212 97            	ld	xl,a
1673  0213 a601          	ld	a,#1
1674  0215 5d            	tnzw	x
1675  0216 2704          	jreq	L66
1676  0218               L07:
1677  0218 48            	sll	a
1678  0219 5a            	decw	x
1679  021a 26fc          	jrne	L07
1680  021c               L66:
1681  021c ca540e        	or	a,21518
1682  021f c7540e        	ld	21518,a
1684  0222 2016          	jra	L556
1685  0224               L756:
1686                     ; 430       ADC1->AWCRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (uint8_t)(Channel - (uint8_t)8));
1688  0224 7b01          	ld	a,(OFST+1,sp)
1689  0226 a008          	sub	a,#8
1690  0228 5f            	clrw	x
1691  0229 97            	ld	xl,a
1692  022a a601          	ld	a,#1
1693  022c 5d            	tnzw	x
1694  022d 2704          	jreq	L27
1695  022f               L47:
1696  022f 48            	sll	a
1697  0230 5a            	decw	x
1698  0231 26fc          	jrne	L47
1699  0233               L27:
1700  0233 43            	cpl	a
1701  0234 c4540e        	and	a,21518
1702  0237 c7540e        	ld	21518,a
1703  023a               L556:
1704                     ; 433 }
1707  023a 85            	popw	x
1708  023b 81            	ret
1743                     ; 441 void ADC1_SetHighThreshold(uint16_t Threshold)
1743                     ; 442 {
1744                     	switch	.text
1745  023c               _ADC1_SetHighThreshold:
1747  023c 89            	pushw	x
1748       00000000      OFST:	set	0
1751                     ; 443   ADC1->HTRH = (uint8_t)(Threshold >> (uint8_t)2);
1753  023d 54            	srlw	x
1754  023e 54            	srlw	x
1755  023f 9f            	ld	a,xl
1756  0240 c75408        	ld	21512,a
1757                     ; 444   ADC1->HTRL = (uint8_t)Threshold;
1759  0243 7b02          	ld	a,(OFST+2,sp)
1760  0245 c75409        	ld	21513,a
1761                     ; 445 }
1764  0248 85            	popw	x
1765  0249 81            	ret
1800                     ; 453 void ADC1_SetLowThreshold(uint16_t Threshold)
1800                     ; 454 {
1801                     	switch	.text
1802  024a               _ADC1_SetLowThreshold:
1806                     ; 455   ADC1->LTRL = (uint8_t)Threshold;
1808  024a 9f            	ld	a,xl
1809  024b c7540b        	ld	21515,a
1810                     ; 456   ADC1->LTRH = (uint8_t)(Threshold >> (uint8_t)2);
1812  024e 54            	srlw	x
1813  024f 54            	srlw	x
1814  0250 9f            	ld	a,xl
1815  0251 c7540a        	ld	21514,a
1816                     ; 457 }
1819  0254 81            	ret
1872                     ; 466 uint16_t ADC1_GetBufferValue(uint8_t Buffer)
1872                     ; 467 {
1873                     	switch	.text
1874  0255               _ADC1_GetBufferValue:
1876  0255 88            	push	a
1877  0256 5205          	subw	sp,#5
1878       00000005      OFST:	set	5
1881                     ; 468   uint16_t temph = 0;
1883                     ; 469   uint8_t templ = 0;
1885                     ; 472   assert_param(IS_ADC1_BUFFER_OK(Buffer));
1887                     ; 474   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1889  0258 c65402        	ld	a,21506
1890  025b a508          	bcp	a,#8
1891  025d 271f          	jreq	L547
1892                     ; 477     templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1894  025f 7b06          	ld	a,(OFST+1,sp)
1895  0261 48            	sll	a
1896  0262 5f            	clrw	x
1897  0263 97            	ld	xl,a
1898  0264 d653e1        	ld	a,(21473,x)
1899  0267 6b03          	ld	(OFST-2,sp),a
1900                     ; 479     temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1902  0269 7b06          	ld	a,(OFST+1,sp)
1903  026b 48            	sll	a
1904  026c 5f            	clrw	x
1905  026d 97            	ld	xl,a
1906  026e d653e0        	ld	a,(21472,x)
1907  0271 5f            	clrw	x
1908  0272 97            	ld	xl,a
1909  0273 1f04          	ldw	(OFST-1,sp),x
1910                     ; 481     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1912  0275 1e04          	ldw	x,(OFST-1,sp)
1913  0277 7b03          	ld	a,(OFST-2,sp)
1914  0279 02            	rlwa	x,a
1915  027a 1f04          	ldw	(OFST-1,sp),x
1917  027c 202b          	jra	L747
1918  027e               L547:
1919                     ; 486     temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1921  027e 7b06          	ld	a,(OFST+1,sp)
1922  0280 48            	sll	a
1923  0281 5f            	clrw	x
1924  0282 97            	ld	xl,a
1925  0283 d653e0        	ld	a,(21472,x)
1926  0286 5f            	clrw	x
1927  0287 97            	ld	xl,a
1928  0288 1f04          	ldw	(OFST-1,sp),x
1929                     ; 488     templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1931  028a 7b06          	ld	a,(OFST+1,sp)
1932  028c 48            	sll	a
1933  028d 5f            	clrw	x
1934  028e 97            	ld	xl,a
1935  028f d653e1        	ld	a,(21473,x)
1936  0292 6b03          	ld	(OFST-2,sp),a
1937                     ; 490     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)(temph << 8));
1939  0294 1e04          	ldw	x,(OFST-1,sp)
1940  0296 4f            	clr	a
1941  0297 02            	rlwa	x,a
1942  0298 1f01          	ldw	(OFST-4,sp),x
1943  029a 7b03          	ld	a,(OFST-2,sp)
1944  029c 97            	ld	xl,a
1945  029d a640          	ld	a,#64
1946  029f 42            	mul	x,a
1947  02a0 01            	rrwa	x,a
1948  02a1 1a02          	or	a,(OFST-3,sp)
1949  02a3 01            	rrwa	x,a
1950  02a4 1a01          	or	a,(OFST-4,sp)
1951  02a6 01            	rrwa	x,a
1952  02a7 1f04          	ldw	(OFST-1,sp),x
1953  02a9               L747:
1954                     ; 493   return ((uint16_t)temph);
1956  02a9 1e04          	ldw	x,(OFST-1,sp)
1959  02ab 5b06          	addw	sp,#6
1960  02ad 81            	ret
2026                     ; 502 FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
2026                     ; 503 {
2027                     	switch	.text
2028  02ae               _ADC1_GetAWDChannelStatus:
2030  02ae 88            	push	a
2031  02af 88            	push	a
2032       00000001      OFST:	set	1
2035                     ; 504   uint8_t status = 0;
2037                     ; 507   assert_param(IS_ADC1_CHANNEL_OK(Channel));
2039                     ; 509   if (Channel < (uint8_t)8)
2041  02b0 a108          	cp	a,#8
2042  02b2 2412          	jruge	L3001
2043                     ; 511     status = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << Channel));
2045  02b4 5f            	clrw	x
2046  02b5 97            	ld	xl,a
2047  02b6 a601          	ld	a,#1
2048  02b8 5d            	tnzw	x
2049  02b9 2704          	jreq	L601
2050  02bb               L011:
2051  02bb 48            	sll	a
2052  02bc 5a            	decw	x
2053  02bd 26fc          	jrne	L011
2054  02bf               L601:
2055  02bf c4540d        	and	a,21517
2056  02c2 6b01          	ld	(OFST+0,sp),a
2058  02c4 2014          	jra	L5001
2059  02c6               L3001:
2060                     ; 515     status = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8)));
2062  02c6 7b02          	ld	a,(OFST+1,sp)
2063  02c8 a008          	sub	a,#8
2064  02ca 5f            	clrw	x
2065  02cb 97            	ld	xl,a
2066  02cc a601          	ld	a,#1
2067  02ce 5d            	tnzw	x
2068  02cf 2704          	jreq	L211
2069  02d1               L411:
2070  02d1 48            	sll	a
2071  02d2 5a            	decw	x
2072  02d3 26fc          	jrne	L411
2073  02d5               L211:
2074  02d5 c4540c        	and	a,21516
2075  02d8 6b01          	ld	(OFST+0,sp),a
2076  02da               L5001:
2077                     ; 518   return ((FlagStatus)status);
2079  02da 7b01          	ld	a,(OFST+0,sp)
2082  02dc 85            	popw	x
2083  02dd 81            	ret
2241                     ; 527 FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
2241                     ; 528 {
2242                     	switch	.text
2243  02de               _ADC1_GetFlagStatus:
2245  02de 88            	push	a
2246  02df 88            	push	a
2247       00000001      OFST:	set	1
2250                     ; 529   uint8_t flagstatus = 0;
2252                     ; 530   uint8_t temp = 0;
2254                     ; 533   assert_param(IS_ADC1_FLAG_OK(Flag));
2256                     ; 535   if ((Flag & 0x0F) == 0x01)
2258  02e0 a40f          	and	a,#15
2259  02e2 a101          	cp	a,#1
2260  02e4 2609          	jrne	L5701
2261                     ; 538     flagstatus = (uint8_t)(ADC1->CR3 & ADC1_CR3_OVR);
2263  02e6 c65403        	ld	a,21507
2264  02e9 a440          	and	a,#64
2265  02eb 6b01          	ld	(OFST+0,sp),a
2267  02ed 2045          	jra	L7701
2268  02ef               L5701:
2269                     ; 540   else if ((Flag & 0xF0) == 0x10)
2271  02ef 7b02          	ld	a,(OFST+1,sp)
2272  02f1 a4f0          	and	a,#240
2273  02f3 a110          	cp	a,#16
2274  02f5 2636          	jrne	L1011
2275                     ; 543     temp = (uint8_t)(Flag & (uint8_t)0x0F);
2277  02f7 7b02          	ld	a,(OFST+1,sp)
2278  02f9 a40f          	and	a,#15
2279  02fb 6b01          	ld	(OFST+0,sp),a
2280                     ; 544     if (temp < 8)
2282  02fd 7b01          	ld	a,(OFST+0,sp)
2283  02ff a108          	cp	a,#8
2284  0301 2414          	jruge	L3011
2285                     ; 546       flagstatus = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2287  0303 7b01          	ld	a,(OFST+0,sp)
2288  0305 5f            	clrw	x
2289  0306 97            	ld	xl,a
2290  0307 a601          	ld	a,#1
2291  0309 5d            	tnzw	x
2292  030a 2704          	jreq	L021
2293  030c               L221:
2294  030c 48            	sll	a
2295  030d 5a            	decw	x
2296  030e 26fc          	jrne	L221
2297  0310               L021:
2298  0310 c4540d        	and	a,21517
2299  0313 6b01          	ld	(OFST+0,sp),a
2301  0315 201d          	jra	L7701
2302  0317               L3011:
2303                     ; 550       flagstatus = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2305  0317 7b01          	ld	a,(OFST+0,sp)
2306  0319 a008          	sub	a,#8
2307  031b 5f            	clrw	x
2308  031c 97            	ld	xl,a
2309  031d a601          	ld	a,#1
2310  031f 5d            	tnzw	x
2311  0320 2704          	jreq	L421
2312  0322               L621:
2313  0322 48            	sll	a
2314  0323 5a            	decw	x
2315  0324 26fc          	jrne	L621
2316  0326               L421:
2317  0326 c4540c        	and	a,21516
2318  0329 6b01          	ld	(OFST+0,sp),a
2319  032b 2007          	jra	L7701
2320  032d               L1011:
2321                     ; 555     flagstatus = (uint8_t)(ADC1->CSR & Flag);
2323  032d c65400        	ld	a,21504
2324  0330 1402          	and	a,(OFST+1,sp)
2325  0332 6b01          	ld	(OFST+0,sp),a
2326  0334               L7701:
2327                     ; 557   return ((FlagStatus)flagstatus);
2329  0334 7b01          	ld	a,(OFST+0,sp)
2332  0336 85            	popw	x
2333  0337 81            	ret
2377                     ; 567 void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
2377                     ; 568 {
2378                     	switch	.text
2379  0338               _ADC1_ClearFlag:
2381  0338 88            	push	a
2382  0339 88            	push	a
2383       00000001      OFST:	set	1
2386                     ; 569   uint8_t temp = 0;
2388                     ; 572   assert_param(IS_ADC1_FLAG_OK(Flag));
2390                     ; 574   if ((Flag & 0x0F) == 0x01)
2392  033a a40f          	and	a,#15
2393  033c a101          	cp	a,#1
2394  033e 2606          	jrne	L3311
2395                     ; 577     ADC1->CR3 &= (uint8_t)(~ADC1_CR3_OVR);
2397  0340 721d5403      	bres	21507,#6
2399  0344 204b          	jra	L5311
2400  0346               L3311:
2401                     ; 579   else if ((Flag & 0xF0) == 0x10)
2403  0346 7b02          	ld	a,(OFST+1,sp)
2404  0348 a4f0          	and	a,#240
2405  034a a110          	cp	a,#16
2406  034c 263a          	jrne	L7311
2407                     ; 582     temp = (uint8_t)(Flag & (uint8_t)0x0F);
2409  034e 7b02          	ld	a,(OFST+1,sp)
2410  0350 a40f          	and	a,#15
2411  0352 6b01          	ld	(OFST+0,sp),a
2412                     ; 583     if (temp < 8)
2414  0354 7b01          	ld	a,(OFST+0,sp)
2415  0356 a108          	cp	a,#8
2416  0358 2416          	jruge	L1411
2417                     ; 585       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2419  035a 7b01          	ld	a,(OFST+0,sp)
2420  035c 5f            	clrw	x
2421  035d 97            	ld	xl,a
2422  035e a601          	ld	a,#1
2423  0360 5d            	tnzw	x
2424  0361 2704          	jreq	L231
2425  0363               L431:
2426  0363 48            	sll	a
2427  0364 5a            	decw	x
2428  0365 26fc          	jrne	L431
2429  0367               L231:
2430  0367 43            	cpl	a
2431  0368 c4540d        	and	a,21517
2432  036b c7540d        	ld	21517,a
2434  036e 2021          	jra	L5311
2435  0370               L1411:
2436                     ; 589       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2438  0370 7b01          	ld	a,(OFST+0,sp)
2439  0372 a008          	sub	a,#8
2440  0374 5f            	clrw	x
2441  0375 97            	ld	xl,a
2442  0376 a601          	ld	a,#1
2443  0378 5d            	tnzw	x
2444  0379 2704          	jreq	L631
2445  037b               L041:
2446  037b 48            	sll	a
2447  037c 5a            	decw	x
2448  037d 26fc          	jrne	L041
2449  037f               L631:
2450  037f 43            	cpl	a
2451  0380 c4540c        	and	a,21516
2452  0383 c7540c        	ld	21516,a
2453  0386 2009          	jra	L5311
2454  0388               L7311:
2455                     ; 594     ADC1->CSR &= (uint8_t) (~Flag);
2457  0388 7b02          	ld	a,(OFST+1,sp)
2458  038a 43            	cpl	a
2459  038b c45400        	and	a,21504
2460  038e c75400        	ld	21504,a
2461  0391               L5311:
2462                     ; 596 }
2465  0391 85            	popw	x
2466  0392 81            	ret
2521                     ; 616 ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
2521                     ; 617 {
2522                     	switch	.text
2523  0393               _ADC1_GetITStatus:
2525  0393 89            	pushw	x
2526  0394 88            	push	a
2527       00000001      OFST:	set	1
2530                     ; 618   ITStatus itstatus = RESET;
2532                     ; 619   uint8_t temp = 0;
2534                     ; 622   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2536                     ; 624   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2538  0395 01            	rrwa	x,a
2539  0396 a4f0          	and	a,#240
2540  0398 5f            	clrw	x
2541  0399 02            	rlwa	x,a
2542  039a a30010        	cpw	x,#16
2543  039d 2636          	jrne	L5711
2544                     ; 627     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2546  039f 7b03          	ld	a,(OFST+2,sp)
2547  03a1 a40f          	and	a,#15
2548  03a3 6b01          	ld	(OFST+0,sp),a
2549                     ; 628     if (temp < 8)
2551  03a5 7b01          	ld	a,(OFST+0,sp)
2552  03a7 a108          	cp	a,#8
2553  03a9 2414          	jruge	L7711
2554                     ; 630       itstatus = (ITStatus)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2556  03ab 7b01          	ld	a,(OFST+0,sp)
2557  03ad 5f            	clrw	x
2558  03ae 97            	ld	xl,a
2559  03af a601          	ld	a,#1
2560  03b1 5d            	tnzw	x
2561  03b2 2704          	jreq	L441
2562  03b4               L641:
2563  03b4 48            	sll	a
2564  03b5 5a            	decw	x
2565  03b6 26fc          	jrne	L641
2566  03b8               L441:
2567  03b8 c4540d        	and	a,21517
2568  03bb 6b01          	ld	(OFST+0,sp),a
2570  03bd 201d          	jra	L3021
2571  03bf               L7711:
2572                     ; 634       itstatus = (ITStatus)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2574  03bf 7b01          	ld	a,(OFST+0,sp)
2575  03c1 a008          	sub	a,#8
2576  03c3 5f            	clrw	x
2577  03c4 97            	ld	xl,a
2578  03c5 a601          	ld	a,#1
2579  03c7 5d            	tnzw	x
2580  03c8 2704          	jreq	L051
2581  03ca               L251:
2582  03ca 48            	sll	a
2583  03cb 5a            	decw	x
2584  03cc 26fc          	jrne	L251
2585  03ce               L051:
2586  03ce c4540c        	and	a,21516
2587  03d1 6b01          	ld	(OFST+0,sp),a
2588  03d3 2007          	jra	L3021
2589  03d5               L5711:
2590                     ; 639     itstatus = (ITStatus)(ADC1->CSR & (uint8_t)ITPendingBit);
2592  03d5 c65400        	ld	a,21504
2593  03d8 1403          	and	a,(OFST+2,sp)
2594  03da 6b01          	ld	(OFST+0,sp),a
2595  03dc               L3021:
2596                     ; 641   return ((ITStatus)itstatus);
2598  03dc 7b01          	ld	a,(OFST+0,sp)
2601  03de 5b03          	addw	sp,#3
2602  03e0 81            	ret
2647                     ; 662 void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
2647                     ; 663 {
2648                     	switch	.text
2649  03e1               _ADC1_ClearITPendingBit:
2651  03e1 89            	pushw	x
2652  03e2 88            	push	a
2653       00000001      OFST:	set	1
2656                     ; 664   uint8_t temp = 0;
2658                     ; 667   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2660                     ; 669   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2662  03e3 01            	rrwa	x,a
2663  03e4 a4f0          	and	a,#240
2664  03e6 5f            	clrw	x
2665  03e7 02            	rlwa	x,a
2666  03e8 a30010        	cpw	x,#16
2667  03eb 263a          	jrne	L7221
2668                     ; 672     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2670  03ed 7b03          	ld	a,(OFST+2,sp)
2671  03ef a40f          	and	a,#15
2672  03f1 6b01          	ld	(OFST+0,sp),a
2673                     ; 673     if (temp < 8)
2675  03f3 7b01          	ld	a,(OFST+0,sp)
2676  03f5 a108          	cp	a,#8
2677  03f7 2416          	jruge	L1321
2678                     ; 675       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2680  03f9 7b01          	ld	a,(OFST+0,sp)
2681  03fb 5f            	clrw	x
2682  03fc 97            	ld	xl,a
2683  03fd a601          	ld	a,#1
2684  03ff 5d            	tnzw	x
2685  0400 2704          	jreq	L651
2686  0402               L061:
2687  0402 48            	sll	a
2688  0403 5a            	decw	x
2689  0404 26fc          	jrne	L061
2690  0406               L651:
2691  0406 43            	cpl	a
2692  0407 c4540d        	and	a,21517
2693  040a c7540d        	ld	21517,a
2695  040d 2021          	jra	L5321
2696  040f               L1321:
2697                     ; 679       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2699  040f 7b01          	ld	a,(OFST+0,sp)
2700  0411 a008          	sub	a,#8
2701  0413 5f            	clrw	x
2702  0414 97            	ld	xl,a
2703  0415 a601          	ld	a,#1
2704  0417 5d            	tnzw	x
2705  0418 2704          	jreq	L261
2706  041a               L461:
2707  041a 48            	sll	a
2708  041b 5a            	decw	x
2709  041c 26fc          	jrne	L461
2710  041e               L261:
2711  041e 43            	cpl	a
2712  041f c4540c        	and	a,21516
2713  0422 c7540c        	ld	21516,a
2714  0425 2009          	jra	L5321
2715  0427               L7221:
2716                     ; 684     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
2718  0427 7b03          	ld	a,(OFST+2,sp)
2719  0429 43            	cpl	a
2720  042a c45400        	and	a,21504
2721  042d c75400        	ld	21504,a
2722  0430               L5321:
2723                     ; 686 }
2726  0430 5b03          	addw	sp,#3
2727  0432 81            	ret
2740                     	xdef	_ADC1_ClearITPendingBit
2741                     	xdef	_ADC1_GetITStatus
2742                     	xdef	_ADC1_ClearFlag
2743                     	xdef	_ADC1_GetFlagStatus
2744                     	xdef	_ADC1_GetAWDChannelStatus
2745                     	xdef	_ADC1_GetBufferValue
2746                     	xdef	_ADC1_SetLowThreshold
2747                     	xdef	_ADC1_SetHighThreshold
2748                     	xdef	_ADC1_GetConversionValue
2749                     	xdef	_ADC1_StartConversion
2750                     	xdef	_ADC1_AWDChannelConfig
2751                     	xdef	_ADC1_ExternalTriggerConfig
2752                     	xdef	_ADC1_ConversionConfig
2753                     	xdef	_ADC1_SchmittTriggerConfig
2754                     	xdef	_ADC1_PrescalerConfig
2755                     	xdef	_ADC1_ITConfig
2756                     	xdef	_ADC1_DataBufferCmd
2757                     	xdef	_ADC1_ScanModeCmd
2758                     	xdef	_ADC1_Cmd
2759                     	xdef	_ADC1_Init
2760                     	xdef	_ADC1_DeInit
2779                     	end
