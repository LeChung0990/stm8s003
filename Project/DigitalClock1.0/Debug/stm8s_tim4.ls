   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  44                     ; 49 void TIM4_DeInit(void)
  44                     ; 50 {
  46                     	switch	.text
  47  0000               _TIM4_DeInit:
  51                     ; 51   TIM4->CR1 = TIM4_CR1_RESET_VALUE;
  53  0000 725f5340      	clr	21312
  54                     ; 52   TIM4->IER = TIM4_IER_RESET_VALUE;
  56  0004 725f5343      	clr	21315
  57                     ; 53   TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
  59  0008 725f5346      	clr	21318
  60                     ; 54   TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
  62  000c 725f5347      	clr	21319
  63                     ; 55   TIM4->ARR = TIM4_ARR_RESET_VALUE;
  65  0010 35ff5348      	mov	21320,#255
  66                     ; 56   TIM4->SR1 = TIM4_SR1_RESET_VALUE;
  68  0014 725f5344      	clr	21316
  69                     ; 57 }
  72  0018 81            	ret
 178                     ; 65 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
 178                     ; 66 {
 179                     	switch	.text
 180  0019               _TIM4_TimeBaseInit:
 184                     ; 68   assert_param(IS_TIM4_PRESCALER_OK(TIM4_Prescaler));
 186                     ; 70   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 188  0019 9e            	ld	a,xh
 189  001a c75347        	ld	21319,a
 190                     ; 72   TIM4->ARR = (uint8_t)(TIM4_Period);
 192  001d 9f            	ld	a,xl
 193  001e c75348        	ld	21320,a
 194                     ; 73 }
 197  0021 81            	ret
 252                     ; 81 void TIM4_Cmd(FunctionalState NewState)
 252                     ; 82 {
 253                     	switch	.text
 254  0022               _TIM4_Cmd:
 258                     ; 84   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 260                     ; 87   if (NewState != DISABLE)
 262  0022 4d            	tnz	a
 263  0023 2706          	jreq	L511
 264                     ; 89     TIM4->CR1 |= TIM4_CR1_CEN;
 266  0025 72105340      	bset	21312,#0
 268  0029 2004          	jra	L711
 269  002b               L511:
 270                     ; 93     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
 272  002b 72115340      	bres	21312,#0
 273  002f               L711:
 274                     ; 95 }
 277  002f 81            	ret
 335                     ; 107 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 335                     ; 108 {
 336                     	switch	.text
 337  0030               _TIM4_ITConfig:
 339  0030 89            	pushw	x
 340       00000000      OFST:	set	0
 343                     ; 110   assert_param(IS_TIM4_IT_OK(TIM4_IT));
 345                     ; 111   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 347                     ; 113   if (NewState != DISABLE)
 349  0031 9f            	ld	a,xl
 350  0032 4d            	tnz	a
 351  0033 2709          	jreq	L151
 352                     ; 116     TIM4->IER |= (uint8_t)TIM4_IT;
 354  0035 9e            	ld	a,xh
 355  0036 ca5343        	or	a,21315
 356  0039 c75343        	ld	21315,a
 358  003c 2009          	jra	L351
 359  003e               L151:
 360                     ; 121     TIM4->IER &= (uint8_t)(~TIM4_IT);
 362  003e 7b01          	ld	a,(OFST+1,sp)
 363  0040 43            	cpl	a
 364  0041 c45343        	and	a,21315
 365  0044 c75343        	ld	21315,a
 366  0047               L351:
 367                     ; 123 }
 370  0047 85            	popw	x
 371  0048 81            	ret
 407                     ; 131 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 407                     ; 132 {
 408                     	switch	.text
 409  0049               _TIM4_UpdateDisableConfig:
 413                     ; 134   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 415                     ; 137   if (NewState != DISABLE)
 417  0049 4d            	tnz	a
 418  004a 2706          	jreq	L371
 419                     ; 139     TIM4->CR1 |= TIM4_CR1_UDIS;
 421  004c 72125340      	bset	21312,#1
 423  0050 2004          	jra	L571
 424  0052               L371:
 425                     ; 143     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
 427  0052 72135340      	bres	21312,#1
 428  0056               L571:
 429                     ; 145 }
 432  0056 81            	ret
 490                     ; 155 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 490                     ; 156 {
 491                     	switch	.text
 492  0057               _TIM4_UpdateRequestConfig:
 496                     ; 158   assert_param(IS_TIM4_UPDATE_SOURCE_OK(TIM4_UpdateSource));
 498                     ; 161   if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
 500  0057 4d            	tnz	a
 501  0058 2706          	jreq	L522
 502                     ; 163     TIM4->CR1 |= TIM4_CR1_URS;
 504  005a 72145340      	bset	21312,#2
 506  005e 2004          	jra	L722
 507  0060               L522:
 508                     ; 167     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
 510  0060 72155340      	bres	21312,#2
 511  0064               L722:
 512                     ; 169 }
 515  0064 81            	ret
 572                     ; 179 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 572                     ; 180 {
 573                     	switch	.text
 574  0065               _TIM4_SelectOnePulseMode:
 578                     ; 182   assert_param(IS_TIM4_OPM_MODE_OK(TIM4_OPMode));
 580                     ; 185   if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
 582  0065 4d            	tnz	a
 583  0066 2706          	jreq	L752
 584                     ; 187     TIM4->CR1 |= TIM4_CR1_OPM;
 586  0068 72165340      	bset	21312,#3
 588  006c 2004          	jra	L162
 589  006e               L752:
 590                     ; 191     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
 592  006e 72175340      	bres	21312,#3
 593  0072               L162:
 594                     ; 193 }
 597  0072 81            	ret
 665                     ; 215 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 665                     ; 216 {
 666                     	switch	.text
 667  0073               _TIM4_PrescalerConfig:
 671                     ; 218   assert_param(IS_TIM4_PRESCALER_RELOAD_OK(TIM4_PSCReloadMode));
 673                     ; 219   assert_param(IS_TIM4_PRESCALER_OK(Prescaler));
 675                     ; 222   TIM4->PSCR = (uint8_t)Prescaler;
 677  0073 9e            	ld	a,xh
 678  0074 c75347        	ld	21319,a
 679                     ; 225   TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
 681  0077 9f            	ld	a,xl
 682  0078 c75345        	ld	21317,a
 683                     ; 226 }
 686  007b 81            	ret
 722                     ; 234 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 722                     ; 235 {
 723                     	switch	.text
 724  007c               _TIM4_ARRPreloadConfig:
 728                     ; 237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 730                     ; 240   if (NewState != DISABLE)
 732  007c 4d            	tnz	a
 733  007d 2706          	jreq	L333
 734                     ; 242     TIM4->CR1 |= TIM4_CR1_ARPE;
 736  007f 721e5340      	bset	21312,#7
 738  0083 2004          	jra	L533
 739  0085               L333:
 740                     ; 246     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
 742  0085 721f5340      	bres	21312,#7
 743  0089               L533:
 744                     ; 248 }
 747  0089 81            	ret
 796                     ; 257 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
 796                     ; 258 {
 797                     	switch	.text
 798  008a               _TIM4_GenerateEvent:
 802                     ; 260   assert_param(IS_TIM4_EVENT_SOURCE_OK(TIM4_EventSource));
 804                     ; 263   TIM4->EGR = (uint8_t)(TIM4_EventSource);
 806  008a c75345        	ld	21317,a
 807                     ; 264 }
 810  008d 81            	ret
 844                     ; 272 void TIM4_SetCounter(uint8_t Counter)
 844                     ; 273 {
 845                     	switch	.text
 846  008e               _TIM4_SetCounter:
 850                     ; 275   TIM4->CNTR = (uint8_t)(Counter);
 852  008e c75346        	ld	21318,a
 853                     ; 276 }
 856  0091 81            	ret
 890                     ; 284 void TIM4_SetAutoreload(uint8_t Autoreload)
 890                     ; 285 {
 891                     	switch	.text
 892  0092               _TIM4_SetAutoreload:
 896                     ; 287   TIM4->ARR = (uint8_t)(Autoreload);
 898  0092 c75348        	ld	21320,a
 899                     ; 288 }
 902  0095 81            	ret
 925                     ; 295 uint8_t TIM4_GetCounter(void)
 925                     ; 296 {
 926                     	switch	.text
 927  0096               _TIM4_GetCounter:
 931                     ; 298   return (uint8_t)(TIM4->CNTR);
 933  0096 c65346        	ld	a,21318
 936  0099 81            	ret
 960                     ; 306 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 960                     ; 307 {
 961                     	switch	.text
 962  009a               _TIM4_GetPrescaler:
 966                     ; 309   return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
 968  009a c65347        	ld	a,21319
 971  009d 81            	ret
1050                     ; 319 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1050                     ; 320 {
1051                     	switch	.text
1052  009e               _TIM4_GetFlagStatus:
1054  009e 88            	push	a
1055       00000001      OFST:	set	1
1058                     ; 321   FlagStatus bitstatus = RESET;
1060                     ; 324   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1062                     ; 326   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1064  009f c45344        	and	a,21316
1065  00a2 2706          	jreq	L774
1066                     ; 328     bitstatus = SET;
1068  00a4 a601          	ld	a,#1
1069  00a6 6b01          	ld	(OFST+0,sp),a
1071  00a8 2002          	jra	L105
1072  00aa               L774:
1073                     ; 332     bitstatus = RESET;
1075  00aa 0f01          	clr	(OFST+0,sp)
1076  00ac               L105:
1077                     ; 334   return ((FlagStatus)bitstatus);
1079  00ac 7b01          	ld	a,(OFST+0,sp)
1082  00ae 5b01          	addw	sp,#1
1083  00b0 81            	ret
1118                     ; 344 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1118                     ; 345 {
1119                     	switch	.text
1120  00b1               _TIM4_ClearFlag:
1124                     ; 347   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1126                     ; 350   TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
1128  00b1 43            	cpl	a
1129  00b2 c75344        	ld	21316,a
1130                     ; 351 }
1133  00b5 81            	ret
1197                     ; 360 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1197                     ; 361 {
1198                     	switch	.text
1199  00b6               _TIM4_GetITStatus:
1201  00b6 88            	push	a
1202  00b7 89            	pushw	x
1203       00000002      OFST:	set	2
1206                     ; 362   ITStatus bitstatus = RESET;
1208                     ; 364   uint8_t itstatus = 0x0, itenable = 0x0;
1212                     ; 367   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1214                     ; 369   itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1216  00b8 c45344        	and	a,21316
1217  00bb 6b01          	ld	(OFST-1,sp),a
1218                     ; 371   itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1220  00bd c65343        	ld	a,21315
1221  00c0 1403          	and	a,(OFST+1,sp)
1222  00c2 6b02          	ld	(OFST+0,sp),a
1223                     ; 373   if ((itstatus != (uint8_t)RESET ) && (itenable != (uint8_t)RESET ))
1225  00c4 0d01          	tnz	(OFST-1,sp)
1226  00c6 270a          	jreq	L355
1228  00c8 0d02          	tnz	(OFST+0,sp)
1229  00ca 2706          	jreq	L355
1230                     ; 375     bitstatus = (ITStatus)SET;
1232  00cc a601          	ld	a,#1
1233  00ce 6b02          	ld	(OFST+0,sp),a
1235  00d0 2002          	jra	L555
1236  00d2               L355:
1237                     ; 379     bitstatus = (ITStatus)RESET;
1239  00d2 0f02          	clr	(OFST+0,sp)
1240  00d4               L555:
1241                     ; 381   return ((ITStatus)bitstatus);
1243  00d4 7b02          	ld	a,(OFST+0,sp)
1246  00d6 5b03          	addw	sp,#3
1247  00d8 81            	ret
1283                     ; 391 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1283                     ; 392 {
1284                     	switch	.text
1285  00d9               _TIM4_ClearITPendingBit:
1289                     ; 394   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1291                     ; 397   TIM4->SR1 = (uint8_t)(~TIM4_IT);
1293  00d9 43            	cpl	a
1294  00da c75344        	ld	21316,a
1295                     ; 398 }
1298  00dd 81            	ret
1311                     	xdef	_TIM4_ClearITPendingBit
1312                     	xdef	_TIM4_GetITStatus
1313                     	xdef	_TIM4_ClearFlag
1314                     	xdef	_TIM4_GetFlagStatus
1315                     	xdef	_TIM4_GetPrescaler
1316                     	xdef	_TIM4_GetCounter
1317                     	xdef	_TIM4_SetAutoreload
1318                     	xdef	_TIM4_SetCounter
1319                     	xdef	_TIM4_GenerateEvent
1320                     	xdef	_TIM4_ARRPreloadConfig
1321                     	xdef	_TIM4_PrescalerConfig
1322                     	xdef	_TIM4_SelectOnePulseMode
1323                     	xdef	_TIM4_UpdateRequestConfig
1324                     	xdef	_TIM4_UpdateDisableConfig
1325                     	xdef	_TIM4_ITConfig
1326                     	xdef	_TIM4_Cmd
1327                     	xdef	_TIM4_TimeBaseInit
1328                     	xdef	_TIM4_DeInit
1347                     	end
