   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  16                     	bsct
  17  0000               L3__config:
  18  0000 0f            	dc.b	15
  19  0001               L5__segments:
  20  0001 ff            	dc.b	255
  21                     .const:	section	.text
  22  0000               L7__digit2segments:
  23  0000 3f            	dc.b	63
  24  0001 06            	dc.b	6
  25  0002 5b            	dc.b	91
  26  0003 4f            	dc.b	79
  27  0004 66            	dc.b	102
  28  0005 6d            	dc.b	109
  29  0006 7d            	dc.b	125
  30  0007 07            	dc.b	7
  31  0008 7f            	dc.b	127
  32  0009 6f            	dc.b	111
  67                     ; 19 void delay_config(void){
  69                     	switch	.text
  70  0000               _delay_config:
  74                     ; 20 	TIM4_DeInit();
  76  0000 cd0000        	call	_TIM4_DeInit
  78                     ; 21 	TIM4_TimeBaseInit(TIM4_PRESCALER_128, 125 - 1);
  80  0003 ae077c        	ldw	x,#1916
  81  0006 cd0000        	call	_TIM4_TimeBaseInit
  83                     ; 22 	TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
  85  0009 ae0101        	ldw	x,#257
  86  000c cd0000        	call	_TIM4_ITConfig
  88                     ; 23 	TIM4_ClearFlag(TIM4_FLAG_UPDATE);
  90  000f a601          	ld	a,#1
  91  0011 cd0000        	call	_TIM4_ClearFlag
  93                     ; 24 	TIM4_Cmd(DISABLE);
  95  0014 4f            	clr	a
  96  0015 cd0000        	call	_TIM4_Cmd
  98                     ; 25 	enableInterrupts();
 101  0018 9a            rim
 103                     ; 26 }
 107  0019 81            	ret
 144                     ; 27 void delay_ms(unsigned int  u16Delay)
 144                     ; 28 {
 145                     	switch	.text
 146  001a               _delay_ms:
 148  001a 89            	pushw	x
 149       00000000      OFST:	set	0
 152  001b 2018          	jra	L74
 153  001d               L54:
 154                     ; 30 		TIM4_SetCounter(0);
 156  001d 4f            	clr	a
 157  001e cd0000        	call	_TIM4_SetCounter
 159                     ; 31 		TIM4_ClearFlag(TIM4_FLAG_UPDATE);
 161  0021 a601          	ld	a,#1
 162  0023 cd0000        	call	_TIM4_ClearFlag
 165  0026               L55:
 166                     ; 32 		while (TIM4_GetFlagStatus(TIM4_FLAG_UPDATE) == RESET) {
 168  0026 a601          	ld	a,#1
 169  0028 cd0000        	call	_TIM4_GetFlagStatus
 171  002b 4d            	tnz	a
 172  002c 27f8          	jreq	L55
 173                     ; 34 		--u16Delay;
 175  002e 1e01          	ldw	x,(OFST+1,sp)
 176  0030 1d0001        	subw	x,#1
 177  0033 1f01          	ldw	(OFST+1,sp),x
 178  0035               L74:
 179                     ; 29 	while (u16Delay) {
 181  0035 1e01          	ldw	x,(OFST+1,sp)
 182  0037 26e4          	jrne	L54
 183                     ; 36 }
 186  0039 85            	popw	x
 187  003a 81            	ret
 222                     ; 38 void delay_us(unsigned long int  us) {
 223                     	switch	.text
 224  003b               _delay_us:
 226       00000000      OFST:	set	0
 229  003b 200a          	jra	L301
 230  003d               L77:
 231                     ; 39   for(;us > 0; us--) nop();
 234  003d 9d            nop
 238  003e 96            	ldw	x,sp
 239  003f 1c0003        	addw	x,#OFST+3
 240  0042 a601          	ld	a,#1
 241  0044 cd0000        	call	c_lgsbc
 243  0047               L301:
 246  0047 96            	ldw	x,sp
 247  0048 1c0003        	addw	x,#OFST+3
 248  004b cd0000        	call	c_lzmp
 250  004e 26ed          	jrne	L77
 251                     ; 40 }
 255  0050 81            	ret
 281                     ; 42 void SEND_STOP(void)
 281                     ; 43 {
 282                     	switch	.text
 283  0051               _SEND_STOP:
 287                     ; 44 	STB_1;
 289  0051 4b40          	push	#64
 290  0053 ae500a        	ldw	x,#20490
 291  0056 cd0000        	call	_GPIO_WriteHigh
 293  0059 84            	pop	a
 294                     ; 45 	DIO_0; TM_DELAY;  
 296  005a 4b10          	push	#16
 297  005c ae500a        	ldw	x,#20490
 298  005f cd0000        	call	_GPIO_WriteLow
 300  0062 84            	pop	a
 303  0063 ae0064        	ldw	x,#100
 304  0066 89            	pushw	x
 305  0067 ae0000        	ldw	x,#0
 306  006a 89            	pushw	x
 307  006b adce          	call	_delay_us
 309  006d 5b04          	addw	sp,#4
 310                     ; 46 	CLK_1; TM_DELAY;
 313  006f 4b20          	push	#32
 314  0071 ae500a        	ldw	x,#20490
 315  0074 cd0000        	call	_GPIO_WriteHigh
 317  0077 84            	pop	a
 320  0078 ae0064        	ldw	x,#100
 321  007b 89            	pushw	x
 322  007c ae0000        	ldw	x,#0
 323  007f 89            	pushw	x
 324  0080 adb9          	call	_delay_us
 326  0082 5b04          	addw	sp,#4
 327                     ; 47 	DIO_1; TM_DELAY;
 330  0084 4b10          	push	#16
 331  0086 ae500a        	ldw	x,#20490
 332  0089 cd0000        	call	_GPIO_WriteHigh
 334  008c 84            	pop	a
 337  008d ae0064        	ldw	x,#100
 338  0090 89            	pushw	x
 339  0091 ae0000        	ldw	x,#0
 340  0094 89            	pushw	x
 341  0095 ada4          	call	_delay_us
 343  0097 5b04          	addw	sp,#4
 344                     ; 48 }
 348  0099 81            	ret
 374                     ; 49 void SEND_START(void)
 374                     ; 50 {
 375                     	switch	.text
 376  009a               _SEND_START:
 380                     ; 52 	CLK_1; TM_DELAY;
 382  009a 4b20          	push	#32
 383  009c ae500a        	ldw	x,#20490
 384  009f cd0000        	call	_GPIO_WriteHigh
 386  00a2 84            	pop	a
 389  00a3 ae0064        	ldw	x,#100
 390  00a6 89            	pushw	x
 391  00a7 ae0000        	ldw	x,#0
 392  00aa 89            	pushw	x
 393  00ab ad8e          	call	_delay_us
 395  00ad 5b04          	addw	sp,#4
 396                     ; 53 	DIO_1; TM_DELAY;
 399  00af 4b10          	push	#16
 400  00b1 ae500a        	ldw	x,#20490
 401  00b4 cd0000        	call	_GPIO_WriteHigh
 403  00b7 84            	pop	a
 406  00b8 ae0064        	ldw	x,#100
 407  00bb 89            	pushw	x
 408  00bc ae0000        	ldw	x,#0
 409  00bf 89            	pushw	x
 410  00c0 cd003b        	call	_delay_us
 412  00c3 5b04          	addw	sp,#4
 413                     ; 54 	STB_0;
 416  00c5 4b40          	push	#64
 417  00c7 ae500a        	ldw	x,#20490
 418  00ca cd0000        	call	_GPIO_WriteLow
 420  00cd 84            	pop	a
 421                     ; 55 	DIO_0; TM_DELAY;
 423  00ce 4b10          	push	#16
 424  00d0 ae500a        	ldw	x,#20490
 425  00d3 cd0000        	call	_GPIO_WriteLow
 427  00d6 84            	pop	a
 430  00d7 ae0064        	ldw	x,#100
 431  00da 89            	pushw	x
 432  00db ae0000        	ldw	x,#0
 433  00de 89            	pushw	x
 434  00df cd003b        	call	_delay_us
 436  00e2 5b04          	addw	sp,#4
 437                     ; 56 	CLK_0; TM_DELAY;
 440  00e4 4b20          	push	#32
 441  00e6 ae500a        	ldw	x,#20490
 442  00e9 cd0000        	call	_GPIO_WriteLow
 444  00ec 84            	pop	a
 447  00ed ae0064        	ldw	x,#100
 448  00f0 89            	pushw	x
 449  00f1 ae0000        	ldw	x,#0
 450  00f4 89            	pushw	x
 451  00f5 cd003b        	call	_delay_us
 453  00f8 5b04          	addw	sp,#4
 454                     ; 57 }
 458  00fa 81            	ret
 504                     ; 59 void SEND_WRITE(unsigned char data)
 504                     ; 60 {
 505                     	switch	.text
 506  00fb               _SEND_WRITE:
 508  00fb 88            	push	a
 509  00fc 88            	push	a
 510       00000001      OFST:	set	1
 513                     ; 62 	for (i = 0; i < 8; ++i)
 515  00fd 0f01          	clr	(OFST+0,sp)
 516  00ff               L151:
 517                     ; 64 		if (data & 0x01) {DIO_1;}
 519  00ff 7b02          	ld	a,(OFST+1,sp)
 520  0101 a501          	bcp	a,#1
 521  0103 270b          	jreq	L751
 524  0105 4b10          	push	#16
 525  0107 ae500a        	ldw	x,#20490
 526  010a cd0000        	call	_GPIO_WriteHigh
 528  010d 84            	pop	a
 530  010e 2009          	jra	L161
 531  0110               L751:
 532                     ; 65 		else {DIO_0;}
 534  0110 4b10          	push	#16
 535  0112 ae500a        	ldw	x,#20490
 536  0115 cd0000        	call	_GPIO_WriteLow
 538  0118 84            	pop	a
 539  0119               L161:
 540                     ; 66 		TM_DELAY;	
 542  0119 ae0064        	ldw	x,#100
 543  011c 89            	pushw	x
 544  011d ae0000        	ldw	x,#0
 545  0120 89            	pushw	x
 546  0121 cd003b        	call	_delay_us
 548  0124 5b04          	addw	sp,#4
 549                     ; 67 		CLK_1;
 552  0126 4b20          	push	#32
 553  0128 ae500a        	ldw	x,#20490
 554  012b cd0000        	call	_GPIO_WriteHigh
 556  012e 84            	pop	a
 557                     ; 68 		TM_DELAY;
 559  012f ae0064        	ldw	x,#100
 560  0132 89            	pushw	x
 561  0133 ae0000        	ldw	x,#0
 562  0136 89            	pushw	x
 563  0137 cd003b        	call	_delay_us
 565  013a 5b04          	addw	sp,#4
 566                     ; 69 		CLK_0;
 569  013c 4b20          	push	#32
 570  013e ae500a        	ldw	x,#20490
 571  0141 cd0000        	call	_GPIO_WriteLow
 573  0144 84            	pop	a
 574                     ; 70 		data >>= 1;
 576  0145 0402          	srl	(OFST+1,sp)
 577                     ; 62 	for (i = 0; i < 8; ++i)
 579  0147 0c01          	inc	(OFST+0,sp)
 582  0149 7b01          	ld	a,(OFST+0,sp)
 583  014b a108          	cp	a,#8
 584  014d 25b0          	jrult	L151
 585                     ; 74 }
 588  014f 85            	popw	x
 589  0150 81            	ret
 628                     ; 75 void TM1628_SEND_COMMAND(const unsigned char value)
 628                     ; 76 {
 629                     	switch	.text
 630  0151               _TM1628_SEND_COMMAND:
 632  0151 88            	push	a
 633       00000000      OFST:	set	0
 636                     ; 77 	SEND_START();
 638  0152 cd009a        	call	_SEND_START
 640                     ; 78 	SEND_WRITE(value);
 642  0155 7b01          	ld	a,(OFST+1,sp)
 643  0157 ada2          	call	_SEND_WRITE
 645                     ; 79 	SEND_STOP();
 647  0159 cd0051        	call	_SEND_STOP
 649                     ; 80 	TM_DELAY;
 651  015c ae0064        	ldw	x,#100
 652  015f 89            	pushw	x
 653  0160 ae0000        	ldw	x,#0
 654  0163 89            	pushw	x
 655  0164 cd003b        	call	_delay_us
 657  0167 5b04          	addw	sp,#4
 658                     ; 81 }
 662  0169 84            	pop	a
 663  016a 81            	ret
 708                     ; 83 void TM1628_SEND_CONFIG(const unsigned char enable, const unsigned char brightness)
 708                     ; 84 {
 709                     	switch	.text
 710  016b               _TM1628_SEND_CONFIG:
 712  016b 89            	pushw	x
 713  016c 88            	push	a
 714       00000001      OFST:	set	1
 717                     ; 85 	TM1628_SEND_COMMAND(TM1628_CMD_MODE_DIS_2);
 719  016d a603          	ld	a,#3
 720  016f ade0          	call	_TM1628_SEND_COMMAND
 722                     ; 86 	_config = (enable ? TM1628_SET_DISPLAY_ON : TM1628_SET_DISPLAY_OFF) |
 722                     ; 87 		(brightness > TM1628_BRIGHTNESS_MAX ? TM1628_BRIGHTNESS_MAX : brightness);
 724  0171 7b03          	ld	a,(OFST+2,sp)
 725  0173 a108          	cp	a,#8
 726  0175 2504          	jrult	L42
 727  0177 a607          	ld	a,#7
 728  0179 2002          	jra	L62
 729  017b               L42:
 730  017b 7b03          	ld	a,(OFST+2,sp)
 731  017d               L62:
 732  017d 6b01          	ld	(OFST+0,sp),a
 733  017f 0d02          	tnz	(OFST+1,sp)
 734  0181 2704          	jreq	L03
 735  0183 a608          	ld	a,#8
 736  0185 2001          	jra	L23
 737  0187               L03:
 738  0187 4f            	clr	a
 739  0188               L23:
 740  0188 1a01          	or	a,(OFST+0,sp)
 741  018a b700          	ld	L3__config,a
 742                     ; 89 	TM1628_SEND_COMMAND(TM1628_CMD_SET_DSIPLAY | _config);
 744  018c b600          	ld	a,L3__config
 745  018e aa80          	or	a,#128
 746  0190 adbf          	call	_TM1628_SEND_COMMAND
 748                     ; 91 }
 751  0192 5b03          	addw	sp,#3
 752  0194 81            	ret
 797                     ; 92 void TM1628_INIT(unsigned char enable, const unsigned char brightness)
 797                     ; 93 {	
 798                     	switch	.text
 799  0195               _TM1628_INIT:
 801  0195 89            	pushw	x
 802       00000000      OFST:	set	0
 805                     ; 94 	GPIO_Init(TM1628_PORT, DIO|SCLK|STB, GPIO_MODE_OUT_PP_HIGH_FAST);	
 807  0196 4bf0          	push	#240
 808  0198 4b70          	push	#112
 809  019a ae500a        	ldw	x,#20490
 810  019d cd0000        	call	_GPIO_Init
 812  01a0 85            	popw	x
 813                     ; 96 	TM1628_SEND_CONFIG(enable, brightness);
 815  01a1 7b02          	ld	a,(OFST+2,sp)
 816  01a3 97            	ld	xl,a
 817  01a4 7b01          	ld	a,(OFST+1,sp)
 818  01a6 95            	ld	xh,a
 819  01a7 adc2          	call	_TM1628_SEND_CONFIG
 821                     ; 97 }
 824  01a9 85            	popw	x
 825  01aa 81            	ret
 893                     ; 98 void TM1628_display_segments(const unsigned char position, const unsigned char digit, unsigned char dot)
 893                     ; 99 {
 894                     	switch	.text
 895  01ab               _TM1628_display_segments:
 897  01ab 89            	pushw	x
 898  01ac 5207          	subw	sp,#7
 899       00000007      OFST:	set	7
 902                     ; 101 	if (digit < 10)
 904  01ae 9f            	ld	a,xl
 905  01af a10a          	cp	a,#10
 906  01b1 240a          	jruge	L772
 907                     ; 103 		segments = _digit2segments[digit];
 909  01b3 9f            	ld	a,xl
 910  01b4 5f            	clrw	x
 911  01b5 97            	ld	xl,a
 912  01b6 d60000        	ld	a,(L7__digit2segments,x)
 913  01b9 6b07          	ld	(OFST+0,sp),a
 915  01bb 2002          	jra	L103
 916  01bd               L772:
 917                     ; 106 		segments = 0x00;	
 919  01bd 0f07          	clr	(OFST+0,sp)
 920  01bf               L103:
 921                     ; 108 	if ( (dot == 1 & (position == 2 )) | (dot == 2 & (position == 0 )) ) {
 923  01bf 0d08          	tnz	(OFST+1,sp)
 924  01c1 2605          	jrne	L04
 925  01c3 ae0001        	ldw	x,#1
 926  01c6 2001          	jra	L24
 927  01c8               L04:
 928  01c8 5f            	clrw	x
 929  01c9               L24:
 930  01c9 1f05          	ldw	(OFST-2,sp),x
 931  01cb 7b0c          	ld	a,(OFST+5,sp)
 932  01cd a102          	cp	a,#2
 933  01cf 2605          	jrne	L44
 934  01d1 ae0001        	ldw	x,#1
 935  01d4 2001          	jra	L64
 936  01d6               L44:
 937  01d6 5f            	clrw	x
 938  01d7               L64:
 939  01d7 01            	rrwa	x,a
 940  01d8 1406          	and	a,(OFST-1,sp)
 941  01da 01            	rrwa	x,a
 942  01db 1405          	and	a,(OFST-2,sp)
 943  01dd 01            	rrwa	x,a
 944  01de 1f03          	ldw	(OFST-4,sp),x
 945  01e0 7b08          	ld	a,(OFST+1,sp)
 946  01e2 a102          	cp	a,#2
 947  01e4 2605          	jrne	L05
 948  01e6 ae0001        	ldw	x,#1
 949  01e9 2001          	jra	L25
 950  01eb               L05:
 951  01eb 5f            	clrw	x
 952  01ec               L25:
 953  01ec 1f01          	ldw	(OFST-6,sp),x
 954  01ee 7b0c          	ld	a,(OFST+5,sp)
 955  01f0 a101          	cp	a,#1
 956  01f2 2605          	jrne	L45
 957  01f4 ae0001        	ldw	x,#1
 958  01f7 2001          	jra	L65
 959  01f9               L45:
 960  01f9 5f            	clrw	x
 961  01fa               L65:
 962  01fa 01            	rrwa	x,a
 963  01fb 1402          	and	a,(OFST-5,sp)
 964  01fd 01            	rrwa	x,a
 965  01fe 1401          	and	a,(OFST-6,sp)
 966  0200 01            	rrwa	x,a
 967  0201 01            	rrwa	x,a
 968  0202 1a04          	or	a,(OFST-3,sp)
 969  0204 01            	rrwa	x,a
 970  0205 1a03          	or	a,(OFST-4,sp)
 971  0207 01            	rrwa	x,a
 972  0208 a30000        	cpw	x,#0
 973  020b 2706          	jreq	L303
 974                     ; 109 		segments = segments | 0x80;
 976  020d 7b07          	ld	a,(OFST+0,sp)
 977  020f aa80          	or	a,#128
 978  0211 6b07          	ld	(OFST+0,sp),a
 979  0213               L303:
 980                     ; 111 	TM1628_SEND_COMMAND(TM1628_CMD_SET_DATA | TM1628_SET_DATA_F_ADDR);
 982  0213 a644          	ld	a,#68
 983  0215 cd0151        	call	_TM1628_SEND_COMMAND
 985                     ; 112 	SEND_START();
 987  0218 cd009a        	call	_SEND_START
 989                     ; 113 	SEND_WRITE(TM1628_CMD_SET_ADDR | position );
 991  021b 7b08          	ld	a,(OFST+1,sp)
 992  021d aac0          	or	a,#192
 993  021f cd00fb        	call	_SEND_WRITE
 995                     ; 114 	SEND_WRITE(segments);
 997  0222 7b07          	ld	a,(OFST+0,sp)
 998  0224 cd00fb        	call	_SEND_WRITE
1000                     ; 115 	SEND_STOP();
1002  0227 cd0051        	call	_SEND_STOP
1004                     ; 116 	TM_DELAY;
1006  022a ae0064        	ldw	x,#100
1007  022d 89            	pushw	x
1008  022e ae0000        	ldw	x,#0
1009  0231 89            	pushw	x
1010  0232 cd003b        	call	_delay_us
1012  0235 5b04          	addw	sp,#4
1013                     ; 117 }
1017  0237 5b09          	addw	sp,#9
1018  0239 81            	ret
1044                     ; 120 void I2C_init(void)
1044                     ; 121 {
1045                     	switch	.text
1046  023a               _I2C_init:
1050                     ; 122 	I2C_DeInit();
1052  023a cd0000        	call	_I2C_DeInit
1054                     ; 123 	I2C_Init( 100000,0xD0,I2C_DUTYCYCLE_2 , I2C_ACK_CURR ,I2C_ADDMODE_7BIT ,16);
1056  023d 4b10          	push	#16
1057  023f 4b00          	push	#0
1058  0241 4b01          	push	#1
1059  0243 4b00          	push	#0
1060  0245 ae00d0        	ldw	x,#208
1061  0248 89            	pushw	x
1062  0249 ae86a0        	ldw	x,#34464
1063  024c 89            	pushw	x
1064  024d ae0001        	ldw	x,#1
1065  0250 89            	pushw	x
1066  0251 cd0000        	call	_I2C_Init
1068  0254 5b0a          	addw	sp,#10
1069                     ; 124 	I2C_Cmd(ENABLE);
1071  0256 a601          	ld	a,#1
1072  0258 cd0000        	call	_I2C_Cmd
1074                     ; 125 }
1077  025b 81            	ret
1103                     ; 126 void I2C_start(void)
1103                     ; 127 {
1104                     	switch	.text
1105  025c               _I2C_start:
1109  025c               L723:
1110                     ; 129 	while(I2C_GetFlagStatus(I2C_FLAG_BUSBUSY) == SET);
1112  025c ae0302        	ldw	x,#770
1113  025f cd0000        	call	_I2C_GetFlagStatus
1115  0262 a101          	cp	a,#1
1116  0264 27f6          	jreq	L723
1117                     ; 131 	I2C_GenerateSTART(ENABLE);
1119  0266 a601          	ld	a,#1
1120  0268 cd0000        	call	_I2C_GenerateSTART
1123  026b               L533:
1124                     ; 133 	while(I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT) == ERROR);
1126  026b ae0301        	ldw	x,#769
1127  026e cd0000        	call	_I2C_CheckEvent
1129  0271 4d            	tnz	a
1130  0272 27f7          	jreq	L533
1131                     ; 138 }
1134  0274 81            	ret
1160                     ; 139 void I2C_Re_start(void)
1160                     ; 140 {
1161                     	switch	.text
1162  0275               _I2C_Re_start:
1166                     ; 142 	I2C_GenerateSTART(ENABLE);
1168  0275 a601          	ld	a,#1
1169  0277 cd0000        	call	_I2C_GenerateSTART
1171                     ; 143 	I2C_AcknowledgeConfig(I2C_ACK_CURR);
1173  027a a601          	ld	a,#1
1174  027c cd0000        	call	_I2C_AcknowledgeConfig
1177  027f               L353:
1178                     ; 144 	while(I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT) == ERROR);
1180  027f ae0301        	ldw	x,#769
1181  0282 cd0000        	call	_I2C_CheckEvent
1183  0285 4d            	tnz	a
1184  0286 27f7          	jreq	L353
1185                     ; 145 }
1188  0288 81            	ret
1212                     ; 146 void I2C_stop(void)
1212                     ; 147 {
1213                     	switch	.text
1214  0289               _I2C_stop:
1218                     ; 148 	I2C_GenerateSTOP(ENABLE);
1220  0289 a601          	ld	a,#1
1221  028b cd0000        	call	_I2C_GenerateSTOP
1223                     ; 153 }
1226  028e 81            	ret
1292                     ; 154 void I2C_address(uint8_t I2C_ADDR, I2C_Direction_TypeDef Direction)
1292                     ; 155 {
1293                     	switch	.text
1294  028f               _I2C_address:
1296  028f 89            	pushw	x
1297       00000000      OFST:	set	0
1300                     ; 156 	I2C_Send7bitAddress(I2C_ADDR, Direction );
1302  0290 9f            	ld	a,xl
1303  0291 97            	ld	xl,a
1304  0292 7b01          	ld	a,(OFST+1,sp)
1305  0294 95            	ld	xh,a
1306  0295 cd0000        	call	_I2C_Send7bitAddress
1309  0298               L324:
1310                     ; 157 	while(I2C_CheckEvent(I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED) == ERROR);
1312  0298 ae0302        	ldw	x,#770
1313  029b cd0000        	call	_I2C_CheckEvent
1315  029e 4d            	tnz	a
1316  029f 27f7          	jreq	L324
1317                     ; 164 }
1320  02a1 85            	popw	x
1321  02a2 81            	ret
1357                     ; 165 void I2C_write(uint8_t data)
1357                     ; 166 {
1358                     	switch	.text
1359  02a3               _I2C_write:
1363                     ; 169 	I2C_SendData(data);
1365  02a3 cd0000        	call	_I2C_SendData
1368  02a6               L744:
1369                     ; 171 	while(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTING)== ERROR);
1371  02a6 ae0780        	ldw	x,#1920
1372  02a9 cd0000        	call	_I2C_CheckEvent
1374  02ac 4d            	tnz	a
1375  02ad 27f7          	jreq	L744
1376                     ; 178 }
1379  02af 81            	ret
1422                     ; 181 unsigned char decimal_to_bcd(unsigned char value)
1422                     ; 182 {
1423                     	switch	.text
1424  02b0               _decimal_to_bcd:
1426  02b0 88            	push	a
1427  02b1 5203          	subw	sp,#3
1428       00000003      OFST:	set	3
1431                     ; 184 	hex = (((value / 10) << 4) + (value % 10));
1433  02b3 5f            	clrw	x
1434  02b4 97            	ld	xl,a
1435  02b5 a60a          	ld	a,#10
1436  02b7 cd0000        	call	c_smodx
1438  02ba 1f01          	ldw	(OFST-2,sp),x
1439  02bc 7b04          	ld	a,(OFST+1,sp)
1440  02be 5f            	clrw	x
1441  02bf 97            	ld	xl,a
1442  02c0 a60a          	ld	a,#10
1443  02c2 cd0000        	call	c_sdivx
1445  02c5 58            	sllw	x
1446  02c6 58            	sllw	x
1447  02c7 58            	sllw	x
1448  02c8 58            	sllw	x
1449  02c9 72fb01        	addw	x,(OFST-2,sp)
1450  02cc 01            	rrwa	x,a
1451  02cd 6b03          	ld	(OFST+0,sp),a
1452  02cf 02            	rlwa	x,a
1453                     ; 185 	return hex;
1455  02d0 7b03          	ld	a,(OFST+0,sp)
1458  02d2 5b04          	addw	sp,#4
1459  02d4 81            	ret
1507                     ; 187 void WriteData(unsigned char AddressData, unsigned char Data)
1507                     ; 188 {
1508                     	switch	.text
1509  02d5               _WriteData:
1511  02d5 89            	pushw	x
1512       00000000      OFST:	set	0
1515                     ; 189 	I2C_start();
1517  02d6 ad84          	call	_I2C_start
1519                     ; 190 	I2C_address((unsigned char)0xD0, I2C_DIRECTION_TX);
1521  02d8 aed000        	ldw	x,#53248
1522  02db adb2          	call	_I2C_address
1524                     ; 191 	I2C_write(AddressData);
1526  02dd 7b01          	ld	a,(OFST+1,sp)
1527  02df adc2          	call	_I2C_write
1529                     ; 192 	I2C_write(decimal_to_bcd(Data));
1531  02e1 7b02          	ld	a,(OFST+2,sp)
1532  02e3 adcb          	call	_decimal_to_bcd
1534  02e5 adbc          	call	_I2C_write
1536                     ; 193 	I2C_stop();
1538  02e7 ada0          	call	_I2C_stop
1540                     ; 194 }
1543  02e9 85            	popw	x
1544  02ea 81            	ret
1604                     ; 195 unsigned char ReadData(unsigned char AddressData)
1604                     ; 196 {
1605                     	switch	.text
1606  02eb               _ReadData:
1608  02eb 88            	push	a
1609  02ec 89            	pushw	x
1610       00000002      OFST:	set	2
1613                     ; 197 	unsigned char ResultData = 0;
1615                     ; 199 	I2C_start();
1617  02ed cd025c        	call	_I2C_start
1619                     ; 200 	I2C_address((unsigned char)0xD0, I2C_DIRECTION_TX);
1621  02f0 aed000        	ldw	x,#53248
1622  02f3 ad9a          	call	_I2C_address
1624                     ; 201 	I2C_write(AddressData);
1626  02f5 7b03          	ld	a,(OFST+1,sp)
1627  02f7 adaa          	call	_I2C_write
1629                     ; 203 	I2C_Re_start();
1631  02f9 cd0275        	call	_I2C_Re_start
1633                     ; 204 	I2C_address((unsigned char)0xD1, I2C_DIRECTION_RX);
1635  02fc aed101        	ldw	x,#53505
1636  02ff ad8e          	call	_I2C_address
1639  0301               L745:
1640                     ; 206 	while(I2C_GetFlagStatus(I2C_FLAG_RXNOTEMPTY) ==RESET);
1642  0301 ae0140        	ldw	x,#320
1643  0304 cd0000        	call	_I2C_GetFlagStatus
1645  0307 4d            	tnz	a
1646  0308 27f7          	jreq	L745
1647                     ; 207 	ResultData  = I2C_ReceiveData();
1649  030a cd0000        	call	_I2C_ReceiveData
1651  030d 6b02          	ld	(OFST+0,sp),a
1652                     ; 208 	I2C_AcknowledgeConfig(I2C_ACK_NONE);    /*NACK*/
1654  030f 4f            	clr	a
1655  0310 cd0000        	call	_I2C_AcknowledgeConfig
1657                     ; 209 	I2C_stop();
1659  0313 cd0289        	call	_I2C_stop
1661                     ; 212 	temp = (ResultData >> 4) & 0x0F;
1663  0316 7b02          	ld	a,(OFST+0,sp)
1664  0318 4e            	swap	a
1665  0319 a40f          	and	a,#15
1666  031b 6b01          	ld	(OFST-1,sp),a
1667                     ; 213 	ResultData = ResultData & 0x0F;
1669  031d 7b02          	ld	a,(OFST+0,sp)
1670  031f a40f          	and	a,#15
1671  0321 6b02          	ld	(OFST+0,sp),a
1672                     ; 214 	return ((temp*10)+ResultData);
1674  0323 7b01          	ld	a,(OFST-1,sp)
1675  0325 97            	ld	xl,a
1676  0326 a60a          	ld	a,#10
1677  0328 42            	mul	x,a
1678  0329 9f            	ld	a,xl
1679  032a 1b02          	add	a,(OFST+0,sp)
1682  032c 5b03          	addw	sp,#3
1683  032e 81            	ret
1727                     ; 218 void uart_init(void){
1728                     	switch	.text
1729  032f               _uart_init:
1731  032f 5208          	subw	sp,#8
1732       00000008      OFST:	set	8
1735                     ; 219 	uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
1737  0331 ae0000        	ldw	x,#0
1738  0334 1f03          	ldw	(OFST-5,sp),x
1739  0336 ae0000        	ldw	x,#0
1740  0339 1f01          	ldw	(OFST-7,sp),x
1743  033b ae0000        	ldw	x,#0
1744  033e 1f07          	ldw	(OFST-1,sp),x
1745  0340 ae0000        	ldw	x,#0
1746  0343 1f05          	ldw	(OFST-3,sp),x
1747                     ; 221 	UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  /* Clear the word length bit */
1749  0345 72195234      	bres	21044,#4
1750                     ; 222 	UART1->CR1 |= (uint8_t)0x00; /* Set the word length bit, 8 Data bits */
1752  0349 c65234        	ld	a,21044
1753                     ; 223 	UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  /* Clear the STOP bits */
1755  034c c65236        	ld	a,21046
1756  034f a4cf          	and	a,#207
1757  0351 c75236        	ld	21046,a
1758                     ; 224 	UART1->CR3 |= (uint8_t)0x00; /**< One stop bit is transmitted at the end of frame*/
1760  0354 c65236        	ld	a,21046
1761                     ; 226 	UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  /* Clear the Parity Control bit */
1763  0357 c65234        	ld	a,21044
1764  035a a4f9          	and	a,#249
1765  035c c75234        	ld	21044,a
1766                     ; 227 	UART1->CR1 |= (uint8_t)0x00;  /* Set No Parity Control bit */
1768  035f c65234        	ld	a,21044
1769                     ; 229 	UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  /* Clear the LSB mantissa of UART1DIV  */
1771  0362 725f5232      	clr	21042
1772                     ; 230 	UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);	/* Clear the MSB mantissa of UART1DIV  */
1774  0366 c65233        	ld	a,21043
1775  0369 a40f          	and	a,#15
1776  036b c75233        	ld	21043,a
1777                     ; 231 	UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  /* Clear the Fraction bits of UART1DIV */
1779  036e c65233        	ld	a,21043
1780  0371 a4f0          	and	a,#240
1781  0373 c75233        	ld	21043,a
1782                     ; 238 	UART1->BRR2 = (uint8_t)0x01;
1784  0376 35015233      	mov	21043,#1
1785                     ; 239 	UART1->BRR1 = (uint8_t)0x34;
1787  037a 35345232      	mov	21042,#52
1788                     ; 245 	UART1->CR2 |= (uint8_t)UART1_CR2_TEN; /*Transmit Enable and Receive Enable*/ 
1790  037e 72165235      	bset	21045,#3
1791                     ; 246 	UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
1793  0382 72145235      	bset	21045,#2
1794                     ; 247 	UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); /*Sync mode Disable, SLK pin Disable*/
1796  0386 72175236      	bres	21046,#3
1797                     ; 248 	UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); /* UART1 Enable */
1799  038a 721b5234      	bres	21044,#5
1800                     ; 249 }
1803  038e 5b08          	addw	sp,#8
1804  0390 81            	ret
1807                     	switch	.const
1808  000a               L575_digit:
1809  000a 00            	dc.b	0
1810  000b 00000000      	ds.b	4
1861                     ; 251 void uart1_number(int number)
1861                     ; 252 {
1862                     	switch	.text
1863  0391               _uart1_number:
1865  0391 89            	pushw	x
1866  0392 5208          	subw	sp,#8
1867       00000008      OFST:	set	8
1870                     ; 253     char count = 0;
1872  0394 0f08          	clr	(OFST+0,sp)
1873                     ; 254     char digit[5] = "";
1875  0396 96            	ldw	x,sp
1876  0397 1c0003        	addw	x,#OFST-5
1877  039a 90ae000a      	ldw	y,#L575_digit
1878  039e a605          	ld	a,#5
1879  03a0 cd0000        	call	c_xymvx
1882  03a3 2023          	jra	L136
1883  03a5               L526:
1884                     ; 257         digit[count] = number%10;   //lay chu so ngoai cung xxxx8;
1886  03a5 96            	ldw	x,sp
1887  03a6 1c0003        	addw	x,#OFST-5
1888  03a9 9f            	ld	a,xl
1889  03aa 5e            	swapw	x
1890  03ab 1b08          	add	a,(OFST+0,sp)
1891  03ad 2401          	jrnc	L601
1892  03af 5c            	incw	x
1893  03b0               L601:
1894  03b0 02            	rlwa	x,a
1895  03b1 1609          	ldw	y,(OFST+1,sp)
1896  03b3 a60a          	ld	a,#10
1897  03b5 cd0000        	call	c_smody
1899  03b8 9001          	rrwa	y,a
1900  03ba f7            	ld	(x),a
1901  03bb 9002          	rlwa	y,a
1902                     ; 258         ++count;
1904  03bd 0c08          	inc	(OFST+0,sp)
1905                     ; 259         number = number/10;         //chia so number cho 10 de bo so ngoai cung xxxx
1907  03bf 1e09          	ldw	x,(OFST+1,sp)
1908  03c1 a60a          	ld	a,#10
1909  03c3 cd0000        	call	c_sdivx
1911  03c6 1f09          	ldw	(OFST+1,sp),x
1912  03c8               L136:
1913                     ; 255     while(number != 0)
1915  03c8 1e09          	ldw	x,(OFST+1,sp)
1916  03ca 26d9          	jrne	L526
1918  03cc 201d          	jra	L736
1919  03ce               L536:
1920                     ; 263         UART1->DR = (digit[count - 1] + 0x30); // 0x30 = 48 ;
1922  03ce 96            	ldw	x,sp
1923  03cf 1c0003        	addw	x,#OFST-5
1924  03d2 1f01          	ldw	(OFST-7,sp),x
1925  03d4 7b08          	ld	a,(OFST+0,sp)
1926  03d6 5f            	clrw	x
1927  03d7 97            	ld	xl,a
1928  03d8 5a            	decw	x
1929  03d9 72fb01        	addw	x,(OFST-7,sp)
1930  03dc f6            	ld	a,(x)
1931  03dd ab30          	add	a,#48
1932  03df c75231        	ld	21041,a
1934  03e2               L746:
1935                     ; 264 		while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET);
1937  03e2 c65230        	ld	a,21040
1938  03e5 a580          	bcp	a,#128
1939  03e7 27f9          	jreq	L746
1940                     ; 265         --count;
1942  03e9 0a08          	dec	(OFST+0,sp)
1943  03eb               L736:
1944                     ; 261     while (count!=0)
1946  03eb 0d08          	tnz	(OFST+0,sp)
1947  03ed 26df          	jrne	L536
1948                     ; 267 }
1951  03ef 5b0a          	addw	sp,#10
1952  03f1 81            	ret
1987                     ; 268 void uart1_string(const char *cy)
1987                     ; 269 {
1988                     	switch	.text
1989  03f2               _uart1_string:
1991  03f2 89            	pushw	x
1992       00000000      OFST:	set	0
1995  03f3 2014          	jra	L376
1996  03f5               L176:
1997                     ; 272         UART1->DR = (*cy);
1999  03f5 1e01          	ldw	x,(OFST+1,sp)
2000  03f7 f6            	ld	a,(x)
2001  03f8 c75231        	ld	21041,a
2003  03fb               L307:
2004                     ; 273         while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET){}
2006  03fb c65230        	ld	a,21040
2007  03fe a580          	bcp	a,#128
2008  0400 27f9          	jreq	L307
2009                     ; 274         cy++;
2011  0402 1e01          	ldw	x,(OFST+1,sp)
2012  0404 1c0001        	addw	x,#1
2013  0407 1f01          	ldw	(OFST+1,sp),x
2014  0409               L376:
2015                     ; 270 	while(*cy)
2017  0409 1e01          	ldw	x,(OFST+1,sp)
2018  040b 7d            	tnz	(x)
2019  040c 26e7          	jrne	L176
2020                     ; 276 }
2023  040e 85            	popw	x
2024  040f 81            	ret
2047                     ; 277 void uart1_nline(void)
2047                     ; 278 {
2048                     	switch	.text
2049  0410               _uart1_nline:
2053                     ; 279     UART1->DR = (0x0a);
2055  0410 350a5231      	mov	21041,#10
2057  0414               L327:
2058                     ; 280     while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET);
2060  0414 c65230        	ld	a,21040
2061  0417 a580          	bcp	a,#128
2062  0419 27f9          	jreq	L327
2063                     ; 281 }
2066  041b 81            	ret
2112                     ; 283 void Write_EEPROM(uint32_t Address, unsigned char Data){
2113                     	switch	.text
2114  041c               _Write_EEPROM:
2116       00000000      OFST:	set	0
2119                     ; 284 	FLASH_Unlock(FLASH_MEMTYPE_DATA);
2121  041c a6f7          	ld	a,#247
2122  041e cd0000        	call	_FLASH_Unlock
2124                     ; 285 	FLASH_ProgramByte(Address, Data);
2126  0421 7b07          	ld	a,(OFST+7,sp)
2127  0423 88            	push	a
2128  0424 1e06          	ldw	x,(OFST+6,sp)
2129  0426 89            	pushw	x
2130  0427 1e06          	ldw	x,(OFST+6,sp)
2131  0429 89            	pushw	x
2132  042a cd0000        	call	_FLASH_ProgramByte
2134  042d 5b05          	addw	sp,#5
2135                     ; 286 	FLASH_Lock(FLASH_MEMTYPE_DATA);
2137  042f a6f7          	ld	a,#247
2138  0431 cd0000        	call	_FLASH_Lock
2140                     ; 287 }
2143  0434 81            	ret
2187                     ; 288 unsigned char Read_EEPROM(uint32_t Address){
2188                     	switch	.text
2189  0435               _Read_EEPROM:
2191  0435 88            	push	a
2192       00000001      OFST:	set	1
2195                     ; 290 	Data = FLASH_ReadByte(Address);
2197  0436 1e06          	ldw	x,(OFST+5,sp)
2198  0438 89            	pushw	x
2199  0439 1e06          	ldw	x,(OFST+5,sp)
2200  043b 89            	pushw	x
2201  043c cd0000        	call	_FLASH_ReadByte
2203  043f 5b04          	addw	sp,#4
2204  0441 6b01          	ld	(OFST+0,sp),a
2205                     ; 291 	return Data;
2207  0443 7b01          	ld	a,(OFST+0,sp)
2210  0445 5b01          	addw	sp,#1
2211  0447 81            	ret
2254                     	xdef	_decimal_to_bcd
2255                     	xdef	_TM1628_SEND_CONFIG
2256                     	xdef	_TM1628_SEND_COMMAND
2257                     	xdef	_SEND_WRITE
2258                     	xdef	_SEND_START
2259                     	xdef	_SEND_STOP
2260                     	xdef	_Read_EEPROM
2261                     	xdef	_Write_EEPROM
2262                     	xdef	_uart1_nline
2263                     	xdef	_uart1_string
2264                     	xdef	_uart1_number
2265                     	xdef	_uart_init
2266                     	xdef	_ReadData
2267                     	xdef	_WriteData
2268                     	xdef	_I2C_write
2269                     	xdef	_I2C_address
2270                     	xdef	_I2C_stop
2271                     	xdef	_I2C_Re_start
2272                     	xdef	_I2C_start
2273                     	xdef	_I2C_init
2274                     	xdef	_TM1628_display_segments
2275                     	xdef	_TM1628_INIT
2276                     	xdef	_delay_us
2277                     	xdef	_delay_ms
2278                     	xdef	_delay_config
2279                     	xref	_TIM4_ClearFlag
2280                     	xref	_TIM4_GetFlagStatus
2281                     	xref	_TIM4_SetCounter
2282                     	xref	_TIM4_ITConfig
2283                     	xref	_TIM4_Cmd
2284                     	xref	_TIM4_TimeBaseInit
2285                     	xref	_TIM4_DeInit
2286                     	xref	_I2C_GetFlagStatus
2287                     	xref	_I2C_CheckEvent
2288                     	xref	_I2C_SendData
2289                     	xref	_I2C_Send7bitAddress
2290                     	xref	_I2C_ReceiveData
2291                     	xref	_I2C_AcknowledgeConfig
2292                     	xref	_I2C_GenerateSTOP
2293                     	xref	_I2C_GenerateSTART
2294                     	xref	_I2C_Cmd
2295                     	xref	_I2C_Init
2296                     	xref	_I2C_DeInit
2297                     	xref	_GPIO_WriteLow
2298                     	xref	_GPIO_WriteHigh
2299                     	xref	_GPIO_Init
2300                     	xref	_FLASH_ReadByte
2301                     	xref	_FLASH_ProgramByte
2302                     	xref	_FLASH_Lock
2303                     	xref	_FLASH_Unlock
2304                     	xref.b	c_x
2323                     	xref	c_xymvx
2324                     	xref	c_smodx
2325                     	xref	c_smody
2326                     	xref	c_sdivx
2327                     	xref	c_lzmp
2328                     	xref	c_lgsbc
2329                     	end
