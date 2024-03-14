   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
   4                     ; Optimizer V4.3.6 - 29 Nov 2011
  50                     ; 3 void delay_config(void){
  52                     	switch	.text
  53  0000               _delay_config:
  57                     ; 4 	TIM4_TimeBaseInit(TIM4_PRESCALER_128, 125 - 1);
  59  0000 ae077c        	ldw	x,#1916
  60  0003 cd0000        	call	_TIM4_TimeBaseInit
  62                     ; 5 	TIM4_Cmd(ENABLE);
  64  0006 a601          	ld	a,#1
  66                     ; 6 }
  69  0008 cc0000        	jp	_TIM4_Cmd
 106                     ; 7 void delay_ms(unsigned int  u16Delay)
 106                     ; 8 {
 107                     	switch	.text
 108  000b               _delay_ms:
 110  000b 89            	pushw	x
 111       00000000      OFST:	set	0
 114  000c 2016          	jra	L14
 115  000e               L73:
 116                     ; 10 		TIM4_SetCounter(0);
 118  000e 4f            	clr	a
 119  000f cd0000        	call	_TIM4_SetCounter
 121                     ; 11 		TIM4_ClearFlag(TIM4_FLAG_UPDATE);
 123  0012 a601          	ld	a,#1
 124  0014 cd0000        	call	_TIM4_ClearFlag
 127  0017               L74:
 128                     ; 12 		while (TIM4_GetFlagStatus(TIM4_FLAG_UPDATE) == RESET) {
 130  0017 a601          	ld	a,#1
 131  0019 cd0000        	call	_TIM4_GetFlagStatus
 133  001c 4d            	tnz	a
 134  001d 27f8          	jreq	L74
 135                     ; 14 		--u16Delay;
 137  001f 1e01          	ldw	x,(OFST+1,sp)
 138  0021 5a            	decw	x
 139  0022 1f01          	ldw	(OFST+1,sp),x
 140  0024               L14:
 141                     ; 9 	while (u16Delay) {
 143  0024 1e01          	ldw	x,(OFST+1,sp)
 144  0026 26e6          	jrne	L73
 145                     ; 16 }
 148  0028 85            	popw	x
 149  0029 81            	ret	
 175                     ; 17 void I2C_init(void)
 175                     ; 18 {
 176                     	switch	.text
 177  002a               _I2C_init:
 181                     ; 19 	I2C_DeInit();
 183  002a cd0000        	call	_I2C_DeInit
 185                     ; 20 	I2C_Init( 100000,0x68,I2C_DUTYCYCLE_2 , I2C_ACK_CURR ,I2C_ADDMODE_7BIT ,16);
 187  002d 4b10          	push	#16
 188  002f 4b00          	push	#0
 189  0031 4b01          	push	#1
 190  0033 4b00          	push	#0
 191  0035 ae0068        	ldw	x,#104
 192  0038 89            	pushw	x
 193  0039 ae86a0        	ldw	x,#34464
 194  003c 89            	pushw	x
 195  003d ae0001        	ldw	x,#1
 196  0040 89            	pushw	x
 197  0041 cd0000        	call	_I2C_Init
 199  0044 5b0a          	addw	sp,#10
 200                     ; 21 	I2C_Cmd(ENABLE);
 202  0046 a601          	ld	a,#1
 204                     ; 22 }
 207  0048 cc0000        	jp	_I2C_Cmd
 233                     ; 23 void I2C_start(void)
 233                     ; 24 {
 234                     	switch	.text
 235  004b               _I2C_start:
 239  004b               L57:
 240                     ; 26 	while(I2C_GetFlagStatus(I2C_FLAG_BUSBUSY) == SET);
 242  004b ae0302        	ldw	x,#770
 243  004e cd0000        	call	_I2C_GetFlagStatus
 245  0051 4a            	dec	a
 246  0052 27f7          	jreq	L57
 247                     ; 27 	I2C_GenerateSTART(ENABLE);
 249  0054 a601          	ld	a,#1
 250  0056 cd0000        	call	_I2C_GenerateSTART
 253  0059               L301:
 254                     ; 28 	while(I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT) == ERROR);
 256  0059 ae0301        	ldw	x,#769
 257  005c cd0000        	call	_I2C_CheckEvent
 259  005f 4d            	tnz	a
 260  0060 27f7          	jreq	L301
 261                     ; 39 }
 264  0062 81            	ret	
 290                     ; 40 void I2C_Re_start(void)
 290                     ; 41 {
 291                     	switch	.text
 292  0063               _I2C_Re_start:
 296                     ; 43 	I2C_GenerateSTART(ENABLE);
 298  0063 a601          	ld	a,#1
 299  0065 cd0000        	call	_I2C_GenerateSTART
 301                     ; 44 	I2C_AcknowledgeConfig(I2C_ACK_CURR);
 303  0068 a601          	ld	a,#1
 304  006a cd0000        	call	_I2C_AcknowledgeConfig
 307  006d               L121:
 308                     ; 45 	while(I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT) == ERROR);
 310  006d ae0301        	ldw	x,#769
 311  0070 cd0000        	call	_I2C_CheckEvent
 313  0073 4d            	tnz	a
 314  0074 27f7          	jreq	L121
 315                     ; 46 }
 318  0076 81            	ret	
 342                     ; 47 void I2C_stop(void)
 342                     ; 48 {
 343                     	switch	.text
 344  0077               _I2C_stop:
 348                     ; 50 	I2C_GenerateSTOP(ENABLE);
 350  0077 a601          	ld	a,#1
 352                     ; 57 }
 355  0079 cc0000        	jp	_I2C_GenerateSTOP
 421                     ; 58 void I2C_address(uint8_t I2C_ADDR, I2C_Direction_TypeDef Direction)
 421                     ; 59 {
 422                     	switch	.text
 423  007c               _I2C_address:
 425  007c 89            	pushw	x
 426       00000000      OFST:	set	0
 429                     ; 61 	I2C_Send7bitAddress(I2C_ADDR, Direction );
 431  007d 7b01          	ld	a,(OFST+1,sp)
 432  007f 95            	ld	xh,a
 433  0080 cd0000        	call	_I2C_Send7bitAddress
 436  0083               L171:
 437                     ; 62 	while(I2C_CheckEvent(I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED) == ERROR);
 439  0083 ae0302        	ldw	x,#770
 440  0086 cd0000        	call	_I2C_CheckEvent
 442  0089 4d            	tnz	a
 443  008a 27f7          	jreq	L171
 444                     ; 70 }
 447  008c 85            	popw	x
 448  008d 81            	ret	
 484                     ; 71 void I2C_write(uint8_t data)
 484                     ; 72 {
 485                     	switch	.text
 486  008e               _I2C_write:
 490                     ; 75 	I2C_SendData(data);
 492  008e cd0000        	call	_I2C_SendData
 495  0091               L512:
 496                     ; 77 	while(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTING)== ERROR);
 498  0091 ae0780        	ldw	x,#1920
 499  0094 cd0000        	call	_I2C_CheckEvent
 501  0097 4d            	tnz	a
 502  0098 27f7          	jreq	L512
 503                     ; 86 }
 506  009a 81            	ret	
 566                     ; 87 uint16_t I2C_Read_MPU6050(void)
 566                     ; 88 {
 567                     	switch	.text
 568  009b               _I2C_Read_MPU6050:
 570  009b 5205          	subw	sp,#5
 571       00000005      OFST:	set	5
 574                     ; 90 	uint8_t I2C_Slave_Address = (uint8_t)0x68 << 1; /*MPU6050 Address*/
 576  009d a6d0          	ld	a,#208
 577  009f 6b03          	ld	(OFST-2,sp),a
 578                     ; 91 	I2C_start();
 580  00a1 ada8          	call	_I2C_start
 582                     ; 92 	I2C_address(I2C_Slave_Address, I2C_DIRECTION_TX);
 584  00a3 5f            	clrw	x
 585  00a4 7b03          	ld	a,(OFST-2,sp)
 586  00a6 95            	ld	xh,a
 587  00a7 add3          	call	_I2C_address
 589                     ; 93 	I2C_write(0x3B);
 591  00a9 a63b          	ld	a,#59
 592  00ab ade1          	call	_I2C_write
 594                     ; 95 	I2C_Re_start();
 596  00ad adb4          	call	_I2C_Re_start
 598                     ; 96 	I2C_address(I2C_Slave_Address, I2C_DIRECTION_RX);
 600  00af ae0001        	ldw	x,#1
 601  00b2 7b03          	ld	a,(OFST-2,sp)
 602  00b4 95            	ld	xh,a
 603  00b5 adc5          	call	_I2C_address
 606  00b7               L152:
 607                     ; 98 	while(I2C_GetFlagStatus(I2C_FLAG_RXNOTEMPTY) ==RESET);
 609  00b7 ae0140        	ldw	x,#320
 610  00ba cd0000        	call	_I2C_GetFlagStatus
 612  00bd 4d            	tnz	a
 613  00be 27f7          	jreq	L152
 614                     ; 99 	AccXLSB  = I2C_ReceiveData();
 616  00c0 cd0000        	call	_I2C_ReceiveData
 618  00c3 5f            	clrw	x
 619  00c4 97            	ld	xl,a
 620  00c5 1f04          	ldw	(OFST-1,sp),x
 621                     ; 100 	I2C_AcknowledgeConfig(I2C_ACK_CURR);	
 623  00c7 a601          	ld	a,#1
 624  00c9 cd0000        	call	_I2C_AcknowledgeConfig
 627  00cc               L752:
 628                     ; 102 	while(I2C_GetFlagStatus(I2C_FLAG_RXNOTEMPTY) ==RESET);
 630  00cc ae0140        	ldw	x,#320
 631  00cf cd0000        	call	_I2C_GetFlagStatus
 633  00d2 4d            	tnz	a
 634  00d3 27f7          	jreq	L752
 635                     ; 103 	AccXMSB  = I2C_ReceiveData();
 637  00d5 cd0000        	call	_I2C_ReceiveData
 639  00d8 5f            	clrw	x
 640  00d9 97            	ld	xl,a
 641  00da 1f01          	ldw	(OFST-4,sp),x
 642                     ; 104 	I2C_AcknowledgeConfig(I2C_ACK_NONE);    /*NACK*/	
 644  00dc 4f            	clr	a
 645  00dd cd0000        	call	_I2C_AcknowledgeConfig
 647                     ; 106 	I2C_stop();
 649  00e0 ad95          	call	_I2C_stop
 651                     ; 108 	AccXLSB = (AccXLSB << 8) | AccXMSB;
 653  00e2 1e04          	ldw	x,(OFST-1,sp)
 654  00e4 7b02          	ld	a,(OFST-3,sp)
 655  00e6 01            	rrwa	x,a
 656  00e7 1a01          	or	a,(OFST-4,sp)
 657  00e9 01            	rrwa	x,a
 658                     ; 109 	return AccXLSB;
 662  00ea 5b05          	addw	sp,#5
 663  00ec 81            	ret	
 714                     ; 112 uint8_t I2C_Read_Eeprom(void)
 714                     ; 113 {
 715                     	switch	.text
 716  00ed               _I2C_Read_Eeprom:
 718  00ed 88            	push	a
 719       00000001      OFST:	set	1
 722                     ; 115 	uint8_t I2C_Slave_Address = (uint8_t)0xA0; /*MPU6050 Address*/
 724  00ee a6a0          	ld	a,#160
 725  00f0 6b01          	ld	(OFST+0,sp),a
 726                     ; 116 	I2C_start();
 728  00f2 cd004b        	call	_I2C_start
 730                     ; 117 	I2C_address(I2C_Slave_Address, I2C_DIRECTION_TX);
 732  00f5 5f            	clrw	x
 733  00f6 7b01          	ld	a,(OFST+0,sp)
 734  00f8 95            	ld	xh,a
 735  00f9 ad81          	call	_I2C_address
 737                     ; 118 	I2C_write(0x09);	/*Read Data from 0x09 Address*/
 739  00fb a609          	ld	a,#9
 740  00fd ad8f          	call	_I2C_write
 742                     ; 121 	I2C_Re_start();
 744  00ff cd0063        	call	_I2C_Re_start
 746                     ; 122 	I2C_address(0xA1, I2C_DIRECTION_RX);
 748  0102 aea101        	ldw	x,#41217
 749  0105 cd007c        	call	_I2C_address
 752  0108               L703:
 753                     ; 123 	while(I2C_GetFlagStatus(I2C_FLAG_BUSBUSY) ==SET);
 755  0108 ae0302        	ldw	x,#770
 756  010b cd0000        	call	_I2C_GetFlagStatus
 758  010e 4a            	dec	a
 759  010f 27f7          	jreq	L703
 761  0111               L513:
 762                     ; 129 	while(I2C_GetFlagStatus(I2C_FLAG_RXNOTEMPTY) ==RESET);
 764  0111 ae0140        	ldw	x,#320
 765  0114 cd0000        	call	_I2C_GetFlagStatus
 767  0117 4d            	tnz	a
 768  0118 27f7          	jreq	L513
 769                     ; 130 	Result  = I2C_ReceiveData();
 771  011a cd0000        	call	_I2C_ReceiveData
 773  011d 6b01          	ld	(OFST+0,sp),a
 774                     ; 131 	I2C_AcknowledgeConfig(I2C_ACK_NONE);    /*NACK*/
 776  011f 4f            	clr	a
 777  0120 cd0000        	call	_I2C_AcknowledgeConfig
 779                     ; 133 	I2C_stop();
 781  0123 cd0077        	call	_I2C_stop
 783                     ; 134 	return Result;
 785  0126 7b01          	ld	a,(OFST+0,sp)
 788  0128 5b01          	addw	sp,#1
 789  012a 81            	ret	
 817                     ; 137 void initMPU6050(void)
 817                     ; 138 {
 818                     	switch	.text
 819  012b               _initMPU6050:
 823                     ; 139 	I2C_start();	/*Disable SLEEP Mode*/
 825  012b ad32          	call	LC002
 827                     ; 141 	I2C_write(0x6B);
 829  012d a66b          	ld	a,#107
 830  012f cd008e        	call	_I2C_write
 832                     ; 142 	I2C_write(0x00);
 834  0132 4f            	clr	a
 835  0133 ad1e          	call	LC001
 837                     ; 148 	I2C_write(0x1A);
 839  0135 a61a          	ld	a,#26
 840  0137 cd008e        	call	_I2C_write
 842                     ; 149 	I2C_write(0x05);
 844  013a a605          	ld	a,#5
 845  013c ad15          	call	LC001
 847                     ; 155 	I2C_write(0x1B);
 849  013e a61b          	ld	a,#27
 850  0140 cd008e        	call	_I2C_write
 852                     ; 156 	I2C_write(0x00); // 250 do/s
 854  0143 4f            	clr	a
 855  0144 ad0d          	call	LC001
 857                     ; 162 	I2C_write(0x1C);
 859  0146 a61c          	ld	a,#28
 860  0148 cd008e        	call	_I2C_write
 862                     ; 163 	I2C_write(0x10); //+-8g
 864  014b a610          	ld	a,#16
 865  014d cd008e        	call	_I2C_write
 867                     ; 164 	I2C_stop();
 870                     ; 165 }
 873  0150 cc0077        	jp	_I2C_stop
 874  0153               LC001:
 875  0153 cd008e        	call	_I2C_write
 877                     ; 157 	I2C_stop();
 879  0156 cd0077        	call	_I2C_stop
 881                     ; 158 	delay_ms(100);
 883  0159 ae0064        	ldw	x,#100
 884  015c cd000b        	call	_delay_ms
 886                     ; 160 	I2C_start(); /*Accelerometer Configuration*/
 888  015f               LC002:
 889  015f cd004b        	call	_I2C_start
 891                     ; 161 	I2C_address((uint8_t)0x68 << 1, I2C_DIRECTION_TX);
 893  0162 aed000        	ldw	x,#53248
 894  0165 cc007c        	jp	_I2C_address
 938                     ; 167 void uart_init(void){
 939                     	switch	.text
 940  0168               _uart_init:
 942  0168 5208          	subw	sp,#8
 943       00000008      OFST:	set	8
 946                     ; 168 	uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 948  016a 5f            	clrw	x
 949  016b 1f03          	ldw	(OFST-5,sp),x
 950  016d 1f01          	ldw	(OFST-7,sp),x
 953  016f 1f07          	ldw	(OFST-1,sp),x
 954  0171 1f05          	ldw	(OFST-3,sp),x
 955                     ; 170 	UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  /* Clear the word length bit */
 957  0173 72195234      	bres	21044,#4
 958                     ; 171 	UART1->CR1 |= (uint8_t)0x00; /* Set the word length bit, 8 Data bits */
 960  0177 c65234        	ld	a,21044
 961                     ; 172 	UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  /* Clear the STOP bits */
 963  017a c65236        	ld	a,21046
 964  017d a4cf          	and	a,#207
 965  017f c75236        	ld	21046,a
 966                     ; 173 	UART1->CR3 |= (uint8_t)0x00; /**< One stop bit is transmitted at the end of frame*/
 968  0182 c65236        	ld	a,21046
 969                     ; 175 	UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  /* Clear the Parity Control bit */
 971  0185 c65234        	ld	a,21044
 972  0188 a4f9          	and	a,#249
 973  018a c75234        	ld	21044,a
 974                     ; 176 	UART1->CR1 |= (uint8_t)0x00;  /* Set No Parity Control bit */
 976  018d c65234        	ld	a,21044
 977                     ; 178 	UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  /* Clear the LSB mantissa of UART1DIV  */
 979  0190 725f5232      	clr	21042
 980                     ; 179 	UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);	/* Clear the MSB mantissa of UART1DIV  */
 982  0194 c65233        	ld	a,21043
 983  0197 a40f          	and	a,#15
 984  0199 c75233        	ld	21043,a
 985                     ; 180 	UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  /* Clear the Fraction bits of UART1DIV */
 987  019c c65233        	ld	a,21043
 988  019f a4f0          	and	a,#240
 989  01a1 c75233        	ld	21043,a
 990                     ; 187 	UART1->BRR2 = (uint8_t)0x01;
 992  01a4 35015233      	mov	21043,#1
 993                     ; 188 	UART1->BRR1 = (uint8_t)0x34;
 995  01a8 35345232      	mov	21042,#52
 996                     ; 194 	UART1->CR2 |= (uint8_t)UART1_CR2_TEN; /*Transmit Enable and Receive Enable*/ 
 998  01ac 72165235      	bset	21045,#3
 999                     ; 195 	UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
1001  01b0 72145235      	bset	21045,#2
1002                     ; 196 	UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); /*Sync mode Disable, SLK pin Disable*/
1004  01b4 72175236      	bres	21046,#3
1005                     ; 197 	UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); /* UART1 Enable */
1007                     ; 198 }
1010  01b8 5b08          	addw	sp,#8
1011  01ba 721b5234      	bres	21044,#5
1012  01be 81            	ret	
1015                     .const:	section	.text
1016  0000               L353_digit:
1017  0000 00            	dc.b	0
1018  0001 00000000      	ds.b	4
1069                     ; 200 void uart1_number(int number)
1069                     ; 201 {
1070                     	switch	.text
1071  01bf               _uart1_number:
1073  01bf 89            	pushw	x
1074  01c0 5208          	subw	sp,#8
1075       00000008      OFST:	set	8
1078                     ; 202     char count = 0;
1080  01c2 0f08          	clr	(OFST+0,sp)
1081                     ; 203     char digit[5] = "";
1083  01c4 96            	ldw	x,sp
1084  01c5 1c0003        	addw	x,#OFST-5
1085  01c8 90ae0000      	ldw	y,#L353_digit
1086  01cc a605          	ld	a,#5
1087  01ce cd0000        	call	c_xymvx
1090  01d1 2021          	jra	L704
1091  01d3               L304:
1092                     ; 206         digit[count] = number%10;   //lay chu so ngoai cung xxxx8;
1094  01d3 96            	ldw	x,sp
1095  01d4 1c0003        	addw	x,#OFST-5
1096  01d7 9f            	ld	a,xl
1097  01d8 5e            	swapw	x
1098  01d9 1b08          	add	a,(OFST+0,sp)
1099  01db 2401          	jrnc	L632
1100  01dd 5c            	incw	x
1101  01de               L632:
1102  01de 02            	rlwa	x,a
1103  01df 1609          	ldw	y,(OFST+1,sp)
1104  01e1 a60a          	ld	a,#10
1105  01e3 cd0000        	call	c_smody
1107  01e6 9001          	rrwa	y,a
1108  01e8 f7            	ld	(x),a
1109                     ; 207         ++count;
1111  01e9 0c08          	inc	(OFST+0,sp)
1112                     ; 208         number = number/10;         //chia so number cho 10 de bo so ngoai cung xxxx
1114  01eb a60a          	ld	a,#10
1115  01ed 1e09          	ldw	x,(OFST+1,sp)
1116  01ef cd0000        	call	c_sdivx
1118  01f2 1f09          	ldw	(OFST+1,sp),x
1119  01f4               L704:
1120                     ; 204     while(number != 0)
1122  01f4 1e09          	ldw	x,(OFST+1,sp)
1123  01f6 26db          	jrne	L304
1125  01f8 2019          	jra	L514
1126  01fa               L314:
1127                     ; 212         UART1->DR = (digit[count - 1] + 0x30); // 0x30 = 48 ;
1129  01fa 96            	ldw	x,sp
1130  01fb 1c0003        	addw	x,#OFST-5
1131  01fe 1f01          	ldw	(OFST-7,sp),x
1132  0200 5f            	clrw	x
1133  0201 97            	ld	xl,a
1134  0202 5a            	decw	x
1135  0203 72fb01        	addw	x,(OFST-7,sp)
1136  0206 f6            	ld	a,(x)
1137  0207 ab30          	add	a,#48
1138  0209 c75231        	ld	21041,a
1140  020c               L524:
1141                     ; 213 		while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET);
1143  020c 720f5230fb    	btjf	21040,#7,L524
1144                     ; 214         --count;
1146  0211 0a08          	dec	(OFST+0,sp)
1147  0213               L514:
1148                     ; 210     while (count!=0)
1150  0213 7b08          	ld	a,(OFST+0,sp)
1151  0215 26e3          	jrne	L314
1152                     ; 216 }
1155  0217 5b0a          	addw	sp,#10
1156  0219 81            	ret	
1191                     ; 217 void uart1_string(const char *cy)
1191                     ; 218 {
1192                     	switch	.text
1193  021a               _uart1_string:
1195  021a 89            	pushw	x
1196       00000000      OFST:	set	0
1199  021b 1e01          	ldw	x,(OFST+1,sp)
1200  021d 200d          	jra	L154
1201  021f               L744:
1202                     ; 221         UART1->DR = (*cy);
1204  021f c75231        	ld	21041,a
1206  0222               L164:
1207                     ; 222         while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET){}
1209  0222 720f5230fb    	btjf	21040,#7,L164
1210                     ; 223         cy++;
1212  0227 1e01          	ldw	x,(OFST+1,sp)
1213  0229 5c            	incw	x
1214  022a 1f01          	ldw	(OFST+1,sp),x
1215  022c               L154:
1216                     ; 219 	while(*cy)
1218  022c f6            	ld	a,(x)
1219  022d 26f0          	jrne	L744
1220                     ; 225 }
1223  022f 85            	popw	x
1224  0230 81            	ret	
1247                     ; 226 void uart1_nline(void)
1247                     ; 227 {
1248                     	switch	.text
1249  0231               _uart1_nline:
1253                     ; 228     UART1->DR = (0x0a);
1255  0231 350a5231      	mov	21041,#10
1257  0235               L105:
1258                     ; 229     while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET);
1260  0235 720f5230fb    	btjf	21040,#7,L105
1261                     ; 230 }
1264  023a 81            	ret	
1277                     	xdef	_uart1_nline
1278                     	xdef	_uart1_string
1279                     	xdef	_uart1_number
1280                     	xdef	_uart_init
1281                     	xdef	_initMPU6050
1282                     	xdef	_I2C_Read_Eeprom
1283                     	xdef	_I2C_Read_MPU6050
1284                     	xdef	_I2C_write
1285                     	xdef	_I2C_address
1286                     	xdef	_I2C_stop
1287                     	xdef	_I2C_Re_start
1288                     	xdef	_I2C_start
1289                     	xdef	_I2C_init
1290                     	xdef	_delay_ms
1291                     	xdef	_delay_config
1292                     	xref	_TIM4_ClearFlag
1293                     	xref	_TIM4_GetFlagStatus
1294                     	xref	_TIM4_SetCounter
1295                     	xref	_TIM4_Cmd
1296                     	xref	_TIM4_TimeBaseInit
1297                     	xref	_I2C_GetFlagStatus
1298                     	xref	_I2C_CheckEvent
1299                     	xref	_I2C_SendData
1300                     	xref	_I2C_Send7bitAddress
1301                     	xref	_I2C_ReceiveData
1302                     	xref	_I2C_AcknowledgeConfig
1303                     	xref	_I2C_GenerateSTOP
1304                     	xref	_I2C_GenerateSTART
1305                     	xref	_I2C_Cmd
1306                     	xref	_I2C_Init
1307                     	xref	_I2C_DeInit
1308                     	xref.b	c_x
1327                     	xref	c_sdivx
1328                     	xref	c_smody
1329                     	xref	c_smodx
1330                     	xref	c_xymvx
1331                     	end
