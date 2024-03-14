   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  16                     	bsct
  17  0000               _adc_value:
  18  0000 0000          	dc.w	0
  69                     ; 26 int main()
  69                     ; 27 {
  71                     	switch	.text
  72  0000               _main:
  76                     ; 28 	Clock_setup();//goi lai ham
  78  0000 cd012a        	call	_Clock_setup
  80                     ; 29 	GPIO_setup();//goi lai ham
  82  0003 cd0132        	call	_GPIO_setup
  84                     ; 30 	delay_config();
  86  0006 cd0000        	call	_delay_config
  88                     ; 31 	uart_init();
  90  0009 cd0162        	call	_uart_init
  92                     ; 32 	ADC1_DeInit();
  94  000c cd0000        	call	_ADC1_DeInit
  96                     ; 33 	ADC1_Init(ADC1_CONVERSIONMODE_SINGLE, ADC1_CHANNEL_4, ADC1_PRESSEL_FCPU_D18, 
  96                     ; 34 		ADC1_EXTTRIG_TIM, DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL4, DISABLE);
  98  000f 4b00          	push	#0
  99  0011 4b04          	push	#4
 100  0013 4b08          	push	#8
 101  0015 4b00          	push	#0
 102  0017 4b00          	push	#0
 103  0019 4b70          	push	#112
 104  001b ae0004        	ldw	x,#4
 105  001e cd0000        	call	_ADC1_Init
 107  0021 5b06          	addw	sp,#6
 108                     ; 35 	ADC1_Cmd(ENABLE);
 110  0023 a601          	ld	a,#1
 111  0025 cd0000        	call	_ADC1_Cmd
 113                     ; 37 	for (i=0; i<20; ++i)
 115  0028 3f00          	clr	_i
 116  002a               L12:
 117                     ; 39 		ADC1_StartConversion();
 119  002a cd0000        	call	_ADC1_StartConversion
 122  002d               L13:
 123                     ; 40 		while(ADC1_GetFlagStatus(ADC1_FLAG_EOC)==0){}
 125  002d a680          	ld	a,#128
 126  002f cd0000        	call	_ADC1_GetFlagStatus
 128  0032 4d            	tnz	a
 129  0033 27f8          	jreq	L13
 130                     ; 41 		ADC1_ClearFlag(ADC1_FLAG_EOC);
 132  0035 a680          	ld	a,#128
 133  0037 cd0000        	call	_ADC1_ClearFlag
 135                     ; 42 		adc_value = ADC1_GetConversionValue();
 137  003a cd0000        	call	_ADC1_GetConversionValue
 139  003d bf00          	ldw	_adc_value,x
 140                     ; 43 		ADC_Offset += adc_value;
 142  003f be00          	ldw	x,_adc_value
 143  0041 cd0000        	call	c_uitof
 145  0044 ae0009        	ldw	x,#_ADC_Offset
 146  0047 cd0000        	call	c_fgadd
 148                     ; 37 	for (i=0; i<20; ++i)
 150  004a 3c00          	inc	_i
 153  004c b600          	ld	a,_i
 154  004e a114          	cp	a,#20
 155  0050 25d8          	jrult	L12
 156                     ; 45 	ADC_Offset = ADC_Offset / 20.0;
 158  0052 ae0013        	ldw	x,#L14
 159  0055 cd0000        	call	c_ltor
 161  0058 ae0009        	ldw	x,#_ADC_Offset
 162  005b cd0000        	call	c_fgdiv
 164  005e               L54:
 165                     ; 49 		if(GPIO_ReadInputPin(BUT_PORT, BUT_PIN) == 0)
 167  005e 4b04          	push	#4
 168  0060 ae500f        	ldw	x,#20495
 169  0063 cd0000        	call	_GPIO_ReadInputPin
 171  0066 5b01          	addw	sp,#1
 172  0068 4d            	tnz	a
 173  0069 2653          	jrne	L15
 174                     ; 51 			delay_ms(200);
 176  006b ae00c8        	ldw	x,#200
 177  006e cd0000        	call	_delay_ms
 180  0071               L55:
 181                     ; 52 			while(GPIO_ReadInputPin(BUT_PORT, BUT_PIN) == 0){}
 183  0071 4b04          	push	#4
 184  0073 ae500f        	ldw	x,#20495
 185  0076 cd0000        	call	_GPIO_ReadInputPin
 187  0079 5b01          	addw	sp,#1
 188  007b 4d            	tnz	a
 189  007c 27f3          	jreq	L55
 190                     ; 53 			ADC_Offset = 0;
 192  007e ae0000        	ldw	x,#0
 193  0081 bf0b          	ldw	_ADC_Offset+2,x
 194  0083 ae0000        	ldw	x,#0
 195  0086 bf09          	ldw	_ADC_Offset,x
 196                     ; 54 			for (i=0; i<20; ++i)
 198  0088 3f00          	clr	_i
 199  008a               L16:
 200                     ; 56 				ADC1_StartConversion();
 202  008a cd0000        	call	_ADC1_StartConversion
 205  008d               L17:
 206                     ; 57 				while(ADC1_GetFlagStatus(ADC1_FLAG_EOC)==0){}
 208  008d a680          	ld	a,#128
 209  008f cd0000        	call	_ADC1_GetFlagStatus
 211  0092 4d            	tnz	a
 212  0093 27f8          	jreq	L17
 213                     ; 58 				ADC1_ClearFlag(ADC1_FLAG_EOC);
 215  0095 a680          	ld	a,#128
 216  0097 cd0000        	call	_ADC1_ClearFlag
 218                     ; 59 				adc_value = ADC1_GetConversionValue();
 220  009a cd0000        	call	_ADC1_GetConversionValue
 222  009d bf00          	ldw	_adc_value,x
 223                     ; 60 				ADC_Offset += adc_value;
 225  009f be00          	ldw	x,_adc_value
 226  00a1 cd0000        	call	c_uitof
 228  00a4 ae0009        	ldw	x,#_ADC_Offset
 229  00a7 cd0000        	call	c_fgadd
 231                     ; 54 			for (i=0; i<20; ++i)
 233  00aa 3c00          	inc	_i
 236  00ac b600          	ld	a,_i
 237  00ae a114          	cp	a,#20
 238  00b0 25d8          	jrult	L16
 239                     ; 62 			ADC_Offset = ADC_Offset / 20.0;
 241  00b2 ae0013        	ldw	x,#L14
 242  00b5 cd0000        	call	c_ltor
 244  00b8 ae0009        	ldw	x,#_ADC_Offset
 245  00bb cd0000        	call	c_fgdiv
 247  00be               L15:
 248                     ; 64 		ADC1_StartConversion();
 250  00be cd0000        	call	_ADC1_StartConversion
 253  00c1               L77:
 254                     ; 65 		while(ADC1_GetFlagStatus(ADC1_FLAG_EOC)==0){}
 256  00c1 a680          	ld	a,#128
 257  00c3 cd0000        	call	_ADC1_GetFlagStatus
 259  00c6 4d            	tnz	a
 260  00c7 27f8          	jreq	L77
 261                     ; 66 		ADC1_ClearFlag(ADC1_FLAG_EOC);
 263  00c9 a680          	ld	a,#128
 264  00cb cd0000        	call	_ADC1_ClearFlag
 266                     ; 67 		adc_value = ADC1_GetConversionValue();
 268  00ce cd0000        	call	_ADC1_GetConversionValue
 270  00d1 bf00          	ldw	_adc_value,x
 271                     ; 68 		ADC_current = adc_value;
 273  00d3 be00          	ldw	x,_adc_value
 274  00d5 cd0000        	call	c_uitof
 276  00d8 ae0005        	ldw	x,#_ADC_current
 277  00db cd0000        	call	c_rtol
 279                     ; 70 		Weight = (( abs((int) (ADC_current - ADC_Offset) )/1024.0) * 3.3) * 1000.0;
 281  00de ae0005        	ldw	x,#_ADC_current
 282  00e1 cd0000        	call	c_ltor
 284  00e4 ae0009        	ldw	x,#_ADC_Offset
 285  00e7 cd0000        	call	c_fsub
 287  00ea cd0000        	call	c_ftoi
 289  00ed cd0000        	call	_abs
 291  00f0 cd0000        	call	c_itof
 293  00f3 ae000f        	ldw	x,#L701
 294  00f6 cd0000        	call	c_fdiv
 296  00f9 ae000b        	ldw	x,#L711
 297  00fc cd0000        	call	c_fmul
 299  00ff ae0007        	ldw	x,#L721
 300  0102 cd0000        	call	c_fmul
 302  0105 ae0001        	ldw	x,#_Weight
 303  0108 cd0000        	call	c_rtol
 305                     ; 71 		uart1_string("S");
 307  010b ae0005        	ldw	x,#L331
 308  010e cd022f        	call	_uart1_string
 310                     ; 72 		uart1_number((int)Weight);
 312  0111 ae0001        	ldw	x,#_Weight
 313  0114 cd0000        	call	c_ltor
 315  0117 cd0000        	call	c_ftoi
 317  011a cd01c4        	call	_uart1_number
 319                     ; 73 		uart1_nline();
 321  011d cd024d        	call	_uart1_nline
 323                     ; 74 		delay_ms(500);
 325  0120 ae01f4        	ldw	x,#500
 326  0123 cd0000        	call	_delay_ms
 329  0126 ac5e005e      	jpf	L54
 354                     ; 78 void Clock_setup(void)
 354                     ; 79 {
 355                     	switch	.text
 356  012a               _Clock_setup:
 360                     ; 81 	CLK_DeInit();   
 362  012a cd0000        	call	_CLK_DeInit
 364                     ; 82 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 366  012d 4f            	clr	a
 367  012e cd0000        	call	_CLK_HSIPrescalerConfig
 369                     ; 83 }
 372  0131 81            	ret
 397                     ; 84 void GPIO_setup(void)
 397                     ; 85 {
 398                     	switch	.text
 399  0132               _GPIO_setup:
 403                     ; 87 	GPIO_DeInit(GPIOD);
 405  0132 ae500f        	ldw	x,#20495
 406  0135 cd0000        	call	_GPIO_DeInit
 408                     ; 88 	GPIO_DeInit(GPIOC);
 410  0138 ae500a        	ldw	x,#20490
 411  013b cd0000        	call	_GPIO_DeInit
 413                     ; 89 	GPIO_DeInit(GPIOA);
 415  013e ae5000        	ldw	x,#20480
 416  0141 cd0000        	call	_GPIO_DeInit
 418                     ; 90 	GPIO_DeInit(GPIOE);
 420  0144 ae5014        	ldw	x,#20500
 421  0147 cd0000        	call	_GPIO_DeInit
 423                     ; 91 	GPIO_DeInit(GPIOB);   
 425  014a ae5005        	ldw	x,#20485
 426  014d cd0000        	call	_GPIO_DeInit
 428                     ; 92 	GPIO_DeInit(GPIOF);
 430  0150 ae5019        	ldw	x,#20505
 431  0153 cd0000        	call	_GPIO_DeInit
 433                     ; 94 	GPIO_Init(BUT_PORT,BUT_PIN,GPIO_MODE_IN_PU_IT);
 435  0156 4b60          	push	#96
 436  0158 4b04          	push	#4
 437  015a ae500f        	ldw	x,#20495
 438  015d cd0000        	call	_GPIO_Init
 440  0160 85            	popw	x
 441                     ; 95 }
 444  0161 81            	ret
 488                     ; 97 void uart_init(void){
 489                     	switch	.text
 490  0162               _uart_init:
 492  0162 5208          	subw	sp,#8
 493       00000008      OFST:	set	8
 496                     ; 98 	uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 498  0164 ae0000        	ldw	x,#0
 499  0167 1f03          	ldw	(OFST-5,sp),x
 500  0169 ae0000        	ldw	x,#0
 501  016c 1f01          	ldw	(OFST-7,sp),x
 504  016e ae0000        	ldw	x,#0
 505  0171 1f07          	ldw	(OFST-1,sp),x
 506  0173 ae0000        	ldw	x,#0
 507  0176 1f05          	ldw	(OFST-3,sp),x
 508                     ; 100 	UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  /* Clear the word length bit */
 510  0178 72195234      	bres	21044,#4
 511                     ; 101 	UART1->CR1 |= (uint8_t)0x00; /* Set the word length bit, 8 Data bits */
 513  017c c65234        	ld	a,21044
 514                     ; 102 	UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  /* Clear the STOP bits */
 516  017f c65236        	ld	a,21046
 517  0182 a4cf          	and	a,#207
 518  0184 c75236        	ld	21046,a
 519                     ; 103 	UART1->CR3 |= (uint8_t)0x00; /**< One stop bit is transmitted at the end of frame*/
 521  0187 c65236        	ld	a,21046
 522                     ; 105 	UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  /* Clear the Parity Control bit */
 524  018a c65234        	ld	a,21044
 525  018d a4f9          	and	a,#249
 526  018f c75234        	ld	21044,a
 527                     ; 106 	UART1->CR1 |= (uint8_t)0x00;  /* Set No Parity Control bit */
 529  0192 c65234        	ld	a,21044
 530                     ; 108 	UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  /* Clear the LSB mantissa of UART1DIV  */
 532  0195 725f5232      	clr	21042
 533                     ; 109 	UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);	/* Clear the MSB mantissa of UART1DIV  */
 535  0199 c65233        	ld	a,21043
 536  019c a40f          	and	a,#15
 537  019e c75233        	ld	21043,a
 538                     ; 110 	UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  /* Clear the Fraction bits of UART1DIV */
 540  01a1 c65233        	ld	a,21043
 541  01a4 a4f0          	and	a,#240
 542  01a6 c75233        	ld	21043,a
 543                     ; 113 	UART1->BRR2 = (uint8_t)0x0B;
 545  01a9 350b5233      	mov	21043,#11
 546                     ; 114 	UART1->BRR1 = (uint8_t)0x08;
 548  01ad 35085232      	mov	21042,#8
 549                     ; 116 	UART1->CR2 |= (uint8_t)UART1_CR2_TEN; /*Transmit Enable and Receive Enable*/ 
 551  01b1 72165235      	bset	21045,#3
 552                     ; 117 	UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
 554  01b5 72145235      	bset	21045,#2
 555                     ; 118 	UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); /*Sync mode Disable, SLK pin Disable*/
 557  01b9 72175236      	bres	21046,#3
 558                     ; 119 	UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); /* UART1 Enable */
 560  01bd 721b5234      	bres	21044,#5
 561                     ; 120 }
 564  01c1 5b08          	addw	sp,#8
 565  01c3 81            	ret
 568                     .const:	section	.text
 569  0000               L771_digit:
 570  0000 00            	dc.b	0
 571  0001 00000000      	ds.b	4
 622                     ; 122 void uart1_number(int number)
 622                     ; 123 {
 623                     	switch	.text
 624  01c4               _uart1_number:
 626  01c4 89            	pushw	x
 627  01c5 5208          	subw	sp,#8
 628       00000008      OFST:	set	8
 631                     ; 124     char count = 0;
 633  01c7 0f08          	clr	(OFST+0,sp)
 634                     ; 125     char digit[5] = "";
 636  01c9 96            	ldw	x,sp
 637  01ca 1c0003        	addw	x,#OFST-5
 638  01cd 90ae0000      	ldw	y,#L771_digit
 639  01d1 a605          	ld	a,#5
 640  01d3 cd0000        	call	c_xymvx
 642                     ; 126 	if (number == 0)
 644  01d6 1e09          	ldw	x,(OFST+1,sp)
 645  01d8 262b          	jrne	L332
 646                     ; 128 		digit[0] = 0;
 648  01da 0f03          	clr	(OFST-5,sp)
 649                     ; 129 		count = 1;
 651  01dc a601          	ld	a,#1
 652  01de 6b08          	ld	(OFST+0,sp),a
 653  01e0 2023          	jra	L332
 654  01e2               L132:
 655                     ; 133         digit[count] = number%10;   //lay chu so ngoai cung xxxx8;
 657  01e2 96            	ldw	x,sp
 658  01e3 1c0003        	addw	x,#OFST-5
 659  01e6 9f            	ld	a,xl
 660  01e7 5e            	swapw	x
 661  01e8 1b08          	add	a,(OFST+0,sp)
 662  01ea 2401          	jrnc	L61
 663  01ec 5c            	incw	x
 664  01ed               L61:
 665  01ed 02            	rlwa	x,a
 666  01ee 1609          	ldw	y,(OFST+1,sp)
 667  01f0 a60a          	ld	a,#10
 668  01f2 cd0000        	call	c_smody
 670  01f5 9001          	rrwa	y,a
 671  01f7 f7            	ld	(x),a
 672  01f8 9002          	rlwa	y,a
 673                     ; 134         ++count;
 675  01fa 0c08          	inc	(OFST+0,sp)
 676                     ; 135         number = number/10;         //chia so number cho 10 de bo so ngoai cung xxxx
 678  01fc 1e09          	ldw	x,(OFST+1,sp)
 679  01fe a60a          	ld	a,#10
 680  0200 cd0000        	call	c_sdivx
 682  0203 1f09          	ldw	(OFST+1,sp),x
 683  0205               L332:
 684                     ; 131     while(number != 0)
 686  0205 1e09          	ldw	x,(OFST+1,sp)
 687  0207 26d9          	jrne	L132
 689  0209 201d          	jra	L142
 690  020b               L732:
 691                     ; 139         UART1->DR = (digit[count - 1] + 0x30); // 0x30 = 48 ;
 693  020b 96            	ldw	x,sp
 694  020c 1c0003        	addw	x,#OFST-5
 695  020f 1f01          	ldw	(OFST-7,sp),x
 696  0211 7b08          	ld	a,(OFST+0,sp)
 697  0213 5f            	clrw	x
 698  0214 97            	ld	xl,a
 699  0215 5a            	decw	x
 700  0216 72fb01        	addw	x,(OFST-7,sp)
 701  0219 f6            	ld	a,(x)
 702  021a ab30          	add	a,#48
 703  021c c75231        	ld	21041,a
 705  021f               L152:
 706                     ; 140 		while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET);
 708  021f c65230        	ld	a,21040
 709  0222 a580          	bcp	a,#128
 710  0224 27f9          	jreq	L152
 711                     ; 141         --count;
 713  0226 0a08          	dec	(OFST+0,sp)
 714  0228               L142:
 715                     ; 137     while (count!=0)
 717  0228 0d08          	tnz	(OFST+0,sp)
 718  022a 26df          	jrne	L732
 719                     ; 143 }
 722  022c 5b0a          	addw	sp,#10
 723  022e 81            	ret
 758                     ; 144 void uart1_string(const char *cy)
 758                     ; 145 {
 759                     	switch	.text
 760  022f               _uart1_string:
 762  022f 89            	pushw	x
 763       00000000      OFST:	set	0
 766  0230 2014          	jra	L572
 767  0232               L372:
 768                     ; 148         UART1->DR = (*cy);
 770  0232 1e01          	ldw	x,(OFST+1,sp)
 771  0234 f6            	ld	a,(x)
 772  0235 c75231        	ld	21041,a
 774  0238               L503:
 775                     ; 149         while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET){}
 777  0238 c65230        	ld	a,21040
 778  023b a580          	bcp	a,#128
 779  023d 27f9          	jreq	L503
 780                     ; 150         cy++;
 782  023f 1e01          	ldw	x,(OFST+1,sp)
 783  0241 1c0001        	addw	x,#1
 784  0244 1f01          	ldw	(OFST+1,sp),x
 785  0246               L572:
 786                     ; 146 	while(*cy)
 788  0246 1e01          	ldw	x,(OFST+1,sp)
 789  0248 7d            	tnz	(x)
 790  0249 26e7          	jrne	L372
 791                     ; 152 }
 794  024b 85            	popw	x
 795  024c 81            	ret
 818                     ; 153 void uart1_nline(void)
 818                     ; 154 {
 819                     	switch	.text
 820  024d               _uart1_nline:
 824                     ; 155     UART1->DR = (0x0a);
 826  024d 350a5231      	mov	21041,#10
 828  0251               L523:
 829                     ; 156     while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET);
 831  0251 c65230        	ld	a,21040
 832  0254 a580          	bcp	a,#128
 833  0256 27f9          	jreq	L523
 834                     ; 157 }
 837  0258 81            	ret
 897                     	xdef	_main
 898                     	xdef	_uart1_nline
 899                     	xdef	_uart1_string
 900                     	xdef	_uart1_number
 901                     	xdef	_uart_init
 902                     	xdef	_GPIO_setup
 903                     	xdef	_Clock_setup
 904                     	switch	.ubsct
 905  0000               _i:
 906  0000 00            	ds.b	1
 907                     	xdef	_i
 908  0001               _Weight:
 909  0001 00000000      	ds.b	4
 910                     	xdef	_Weight
 911  0005               _ADC_current:
 912  0005 00000000      	ds.b	4
 913                     	xdef	_ADC_current
 914  0009               _ADC_Offset:
 915  0009 00000000      	ds.b	4
 916                     	xdef	_ADC_Offset
 917                     	xdef	_adc_value
 918                     	xref	_delay_ms
 919                     	xref	_delay_config
 920                     	xref	_GPIO_ReadInputPin
 921                     	xref	_GPIO_Init
 922                     	xref	_GPIO_DeInit
 923                     	xref	_CLK_HSIPrescalerConfig
 924                     	xref	_CLK_DeInit
 925                     	xref	_ADC1_ClearFlag
 926                     	xref	_ADC1_GetFlagStatus
 927                     	xref	_ADC1_GetConversionValue
 928                     	xref	_ADC1_StartConversion
 929                     	xref	_ADC1_Cmd
 930                     	xref	_ADC1_Init
 931                     	xref	_ADC1_DeInit
 932                     	xref	_abs
 933                     	switch	.const
 934  0005               L331:
 935  0005 5300          	dc.b	"S",0
 936  0007               L721:
 937  0007 447a0000      	dc.w	17530,0
 938  000b               L711:
 939  000b 40533333      	dc.w	16467,13107
 940  000f               L701:
 941  000f 44800000      	dc.w	17536,0
 942  0013               L14:
 943  0013 41a00000      	dc.w	16800,0
 944                     	xref.b	c_x
 964                     	xref	c_sdivx
 965                     	xref	c_smody
 966                     	xref	c_smodx
 967                     	xref	c_xymvx
 968                     	xref	c_fmul
 969                     	xref	c_fdiv
 970                     	xref	c_itof
 971                     	xref	c_ftoi
 972                     	xref	c_fsub
 973                     	xref	c_rtol
 974                     	xref	c_fgdiv
 975                     	xref	c_ltor
 976                     	xref	c_fgadd
 977                     	xref	c_uitof
 978                     	end
