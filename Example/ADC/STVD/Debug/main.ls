   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  16                     	bsct
  17  0000               _adc_value:
  18  0000 0000          	dc.w	0
  61                     ; 26 int main()
  61                     ; 27 {
  63                     	switch	.text
  64  0000               _main:
  68                     ; 28 	Clock_setup();//goi lai ham
  70  0000 ad46          	call	_Clock_setup
  72                     ; 29 	GPIO_setup();//goi lai ham
  74  0002 ad4c          	call	_GPIO_setup
  76                     ; 30 	delay_config();
  78  0004 cd0000        	call	_delay_config
  80                     ; 31 	uart_init();
  82  0007 cd008b        	call	_uart_init
  84                     ; 32 	ADC1_DeInit();
  86  000a cd0000        	call	_ADC1_DeInit
  88                     ; 33 	ADC1_Init(ADC1_CONVERSIONMODE_SINGLE, ADC1_CHANNEL_3, ADC1_PRESSEL_FCPU_D18, 
  88                     ; 34 		ADC1_EXTTRIG_TIM, DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL3, DISABLE);
  90  000d 4b00          	push	#0
  91  000f 4b03          	push	#3
  92  0011 4b08          	push	#8
  93  0013 4b00          	push	#0
  94  0015 4b00          	push	#0
  95  0017 4b70          	push	#112
  96  0019 ae0003        	ldw	x,#3
  97  001c cd0000        	call	_ADC1_Init
  99  001f 5b06          	addw	sp,#6
 100                     ; 35 	ADC1_Cmd(ENABLE);
 102  0021 a601          	ld	a,#1
 103  0023 cd0000        	call	_ADC1_Cmd
 105  0026               L12:
 106                     ; 39 		ADC1_StartConversion();
 108  0026 cd0000        	call	_ADC1_StartConversion
 111  0029               L72:
 112                     ; 40 		while(ADC1_GetFlagStatus(ADC1_FLAG_EOC)==0){}
 114  0029 a680          	ld	a,#128
 115  002b cd0000        	call	_ADC1_GetFlagStatus
 117  002e 4d            	tnz	a
 118  002f 27f8          	jreq	L72
 119                     ; 41 		ADC1_ClearFlag(ADC1_FLAG_EOC);
 121  0031 a680          	ld	a,#128
 122  0033 cd0000        	call	_ADC1_ClearFlag
 124                     ; 42 		adc_value = ADC1_GetConversionValue();
 126  0036 cd0000        	call	_ADC1_GetConversionValue
 128  0039 bf00          	ldw	_adc_value,x
 129                     ; 43 		uart1_number(adc_value);
 131  003b be00          	ldw	x,_adc_value
 132  003d cd00ed        	call	_uart1_number
 134                     ; 44 		delay_ms(1000);
 136  0040 ae03e8        	ldw	x,#1000
 137  0043 cd0000        	call	_delay_ms
 140  0046 20de          	jra	L12
 165                     ; 48 void Clock_setup(void)
 165                     ; 49 {
 166                     	switch	.text
 167  0048               _Clock_setup:
 171                     ; 51 	CLK_DeInit();   
 173  0048 cd0000        	call	_CLK_DeInit
 175                     ; 52 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 177  004b 4f            	clr	a
 178  004c cd0000        	call	_CLK_HSIPrescalerConfig
 180                     ; 53 }
 183  004f 81            	ret
 208                     ; 54 void GPIO_setup(void)
 208                     ; 55 {
 209                     	switch	.text
 210  0050               _GPIO_setup:
 214                     ; 57 	GPIO_DeInit(GPIOD);
 216  0050 ae500f        	ldw	x,#20495
 217  0053 cd0000        	call	_GPIO_DeInit
 219                     ; 58 	GPIO_DeInit(GPIOC);
 221  0056 ae500a        	ldw	x,#20490
 222  0059 cd0000        	call	_GPIO_DeInit
 224                     ; 59 	GPIO_DeInit(GPIOA);
 226  005c ae5000        	ldw	x,#20480
 227  005f cd0000        	call	_GPIO_DeInit
 229                     ; 60 	GPIO_DeInit(GPIOE);
 231  0062 ae5014        	ldw	x,#20500
 232  0065 cd0000        	call	_GPIO_DeInit
 234                     ; 61 	GPIO_DeInit(GPIOB);   
 236  0068 ae5005        	ldw	x,#20485
 237  006b cd0000        	call	_GPIO_DeInit
 239                     ; 62 	GPIO_DeInit(GPIOF);
 241  006e ae5019        	ldw	x,#20505
 242  0071 cd0000        	call	_GPIO_DeInit
 244                     ; 64 	GPIO_Init(LED_PORT,LED_PIN,GPIO_MODE_OUT_PP_LOW_FAST);
 246  0074 4be0          	push	#224
 247  0076 4b08          	push	#8
 248  0078 ae5000        	ldw	x,#20480
 249  007b cd0000        	call	_GPIO_Init
 251  007e 85            	popw	x
 252                     ; 65 	GPIO_Init(BUT_PORT,BUT_PIN,GPIO_MODE_IN_PU_IT);
 254  007f 4b60          	push	#96
 255  0081 4b10          	push	#16
 256  0083 ae500f        	ldw	x,#20495
 257  0086 cd0000        	call	_GPIO_Init
 259  0089 85            	popw	x
 260                     ; 66 }
 263  008a 81            	ret
 307                     ; 68 void uart_init(void){
 308                     	switch	.text
 309  008b               _uart_init:
 311  008b 5208          	subw	sp,#8
 312       00000008      OFST:	set	8
 315                     ; 69 	uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 317  008d ae0000        	ldw	x,#0
 318  0090 1f03          	ldw	(OFST-5,sp),x
 319  0092 ae0000        	ldw	x,#0
 320  0095 1f01          	ldw	(OFST-7,sp),x
 323  0097 ae0000        	ldw	x,#0
 324  009a 1f07          	ldw	(OFST-1,sp),x
 325  009c ae0000        	ldw	x,#0
 326  009f 1f05          	ldw	(OFST-3,sp),x
 327                     ; 71 	UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  /* Clear the word length bit */
 329  00a1 72195234      	bres	21044,#4
 330                     ; 72 	UART1->CR1 |= (uint8_t)0x00; /* Set the word length bit, 8 Data bits */
 332  00a5 c65234        	ld	a,21044
 333                     ; 73 	UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  /* Clear the STOP bits */
 335  00a8 c65236        	ld	a,21046
 336  00ab a4cf          	and	a,#207
 337  00ad c75236        	ld	21046,a
 338                     ; 74 	UART1->CR3 |= (uint8_t)0x00; /**< One stop bit is transmitted at the end of frame*/
 340  00b0 c65236        	ld	a,21046
 341                     ; 76 	UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  /* Clear the Parity Control bit */
 343  00b3 c65234        	ld	a,21044
 344  00b6 a4f9          	and	a,#249
 345  00b8 c75234        	ld	21044,a
 346                     ; 77 	UART1->CR1 |= (uint8_t)0x00;  /* Set No Parity Control bit */
 348  00bb c65234        	ld	a,21044
 349                     ; 79 	UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  /* Clear the LSB mantissa of UART1DIV  */
 351  00be 725f5232      	clr	21042
 352                     ; 80 	UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);	/* Clear the MSB mantissa of UART1DIV  */
 354  00c2 c65233        	ld	a,21043
 355  00c5 a40f          	and	a,#15
 356  00c7 c75233        	ld	21043,a
 357                     ; 81 	UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  /* Clear the Fraction bits of UART1DIV */
 359  00ca c65233        	ld	a,21043
 360  00cd a4f0          	and	a,#240
 361  00cf c75233        	ld	21043,a
 362                     ; 88 	UART1->BRR2 = (uint8_t)0x01;
 364  00d2 35015233      	mov	21043,#1
 365                     ; 89 	UART1->BRR1 = (uint8_t)0x34;
 367  00d6 35345232      	mov	21042,#52
 368                     ; 95 	UART1->CR2 |= (uint8_t)UART1_CR2_TEN; /*Transmit Enable and Receive Enable*/ 
 370  00da 72165235      	bset	21045,#3
 371                     ; 96 	UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
 373  00de 72145235      	bset	21045,#2
 374                     ; 97 	UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); /*Sync mode Disable, SLK pin Disable*/
 376  00e2 72175236      	bres	21046,#3
 377                     ; 98 	UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); /* UART1 Enable */
 379  00e6 721b5234      	bres	21044,#5
 380                     ; 99 }
 383  00ea 5b08          	addw	sp,#8
 384  00ec 81            	ret
 387                     .const:	section	.text
 388  0000               L57_digit:
 389  0000 00            	dc.b	0
 390  0001 00000000      	ds.b	4
 441                     ; 101 void uart1_number(int number)
 441                     ; 102 {
 442                     	switch	.text
 443  00ed               _uart1_number:
 445  00ed 89            	pushw	x
 446  00ee 5208          	subw	sp,#8
 447       00000008      OFST:	set	8
 450                     ; 103     char count = 0;
 452  00f0 0f08          	clr	(OFST+0,sp)
 453                     ; 104     char digit[5] = "";
 455  00f2 96            	ldw	x,sp
 456  00f3 1c0003        	addw	x,#OFST-5
 457  00f6 90ae0000      	ldw	y,#L57_digit
 458  00fa a605          	ld	a,#5
 459  00fc cd0000        	call	c_xymvx
 461                     ; 105 	if (number == 0)
 463  00ff 1e09          	ldw	x,(OFST+1,sp)
 464  0101 262b          	jrne	L131
 465                     ; 107 		digit[0] = 0;
 467  0103 0f03          	clr	(OFST-5,sp)
 468                     ; 108 		count = 1;
 470  0105 a601          	ld	a,#1
 471  0107 6b08          	ld	(OFST+0,sp),a
 472  0109 2023          	jra	L131
 473  010b               L721:
 474                     ; 112         digit[count] = number%10;   //lay chu so ngoai cung xxxx8;
 476  010b 96            	ldw	x,sp
 477  010c 1c0003        	addw	x,#OFST-5
 478  010f 9f            	ld	a,xl
 479  0110 5e            	swapw	x
 480  0111 1b08          	add	a,(OFST+0,sp)
 481  0113 2401          	jrnc	L61
 482  0115 5c            	incw	x
 483  0116               L61:
 484  0116 02            	rlwa	x,a
 485  0117 1609          	ldw	y,(OFST+1,sp)
 486  0119 a60a          	ld	a,#10
 487  011b cd0000        	call	c_smody
 489  011e 9001          	rrwa	y,a
 490  0120 f7            	ld	(x),a
 491  0121 9002          	rlwa	y,a
 492                     ; 113         ++count;
 494  0123 0c08          	inc	(OFST+0,sp)
 495                     ; 114         number = number/10;         //chia so number cho 10 de bo so ngoai cung xxxx
 497  0125 1e09          	ldw	x,(OFST+1,sp)
 498  0127 a60a          	ld	a,#10
 499  0129 cd0000        	call	c_sdivx
 501  012c 1f09          	ldw	(OFST+1,sp),x
 502  012e               L131:
 503                     ; 110     while(number != 0)
 505  012e 1e09          	ldw	x,(OFST+1,sp)
 506  0130 26d9          	jrne	L721
 508  0132 201d          	jra	L731
 509  0134               L531:
 510                     ; 118         UART1->DR = (digit[count - 1] + 0x30); // 0x30 = 48 ;
 512  0134 96            	ldw	x,sp
 513  0135 1c0003        	addw	x,#OFST-5
 514  0138 1f01          	ldw	(OFST-7,sp),x
 515  013a 7b08          	ld	a,(OFST+0,sp)
 516  013c 5f            	clrw	x
 517  013d 97            	ld	xl,a
 518  013e 5a            	decw	x
 519  013f 72fb01        	addw	x,(OFST-7,sp)
 520  0142 f6            	ld	a,(x)
 521  0143 ab30          	add	a,#48
 522  0145 c75231        	ld	21041,a
 524  0148               L741:
 525                     ; 119 		while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET);
 527  0148 c65230        	ld	a,21040
 528  014b a580          	bcp	a,#128
 529  014d 27f9          	jreq	L741
 530                     ; 120         --count;
 532  014f 0a08          	dec	(OFST+0,sp)
 533  0151               L731:
 534                     ; 116     while (count!=0)
 536  0151 0d08          	tnz	(OFST+0,sp)
 537  0153 26df          	jrne	L531
 538                     ; 122 }
 541  0155 5b0a          	addw	sp,#10
 542  0157 81            	ret
 577                     ; 123 void uart1_string(const char *cy)
 577                     ; 124 {
 578                     	switch	.text
 579  0158               _uart1_string:
 581  0158 89            	pushw	x
 582       00000000      OFST:	set	0
 585  0159 2014          	jra	L371
 586  015b               L171:
 587                     ; 127         UART1->DR = (*cy);
 589  015b 1e01          	ldw	x,(OFST+1,sp)
 590  015d f6            	ld	a,(x)
 591  015e c75231        	ld	21041,a
 593  0161               L302:
 594                     ; 128         while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET){}
 596  0161 c65230        	ld	a,21040
 597  0164 a580          	bcp	a,#128
 598  0166 27f9          	jreq	L302
 599                     ; 129         cy++;
 601  0168 1e01          	ldw	x,(OFST+1,sp)
 602  016a 1c0001        	addw	x,#1
 603  016d 1f01          	ldw	(OFST+1,sp),x
 604  016f               L371:
 605                     ; 125 	while(*cy)
 607  016f 1e01          	ldw	x,(OFST+1,sp)
 608  0171 7d            	tnz	(x)
 609  0172 26e7          	jrne	L171
 610                     ; 131 }
 613  0174 85            	popw	x
 614  0175 81            	ret
 637                     ; 132 void uart1_nline(void)
 637                     ; 133 {
 638                     	switch	.text
 639  0176               _uart1_nline:
 643                     ; 134     UART1->DR = (0x0a);
 645  0176 350a5231      	mov	21041,#10
 647  017a               L322:
 648                     ; 135     while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET);
 650  017a c65230        	ld	a,21040
 651  017d a580          	bcp	a,#128
 652  017f 27f9          	jreq	L322
 653                     ; 136 }
 656  0181 81            	ret
 680                     	xdef	_main
 681                     	xdef	_uart1_nline
 682                     	xdef	_uart1_string
 683                     	xdef	_uart1_number
 684                     	xdef	_uart_init
 685                     	xdef	_GPIO_setup
 686                     	xdef	_Clock_setup
 687                     	xdef	_adc_value
 688                     	xref	_delay_ms
 689                     	xref	_delay_config
 690                     	xref	_GPIO_Init
 691                     	xref	_GPIO_DeInit
 692                     	xref	_CLK_HSIPrescalerConfig
 693                     	xref	_CLK_DeInit
 694                     	xref	_ADC1_ClearFlag
 695                     	xref	_ADC1_GetFlagStatus
 696                     	xref	_ADC1_GetConversionValue
 697                     	xref	_ADC1_StartConversion
 698                     	xref	_ADC1_Cmd
 699                     	xref	_ADC1_Init
 700                     	xref	_ADC1_DeInit
 701                     	xref.b	c_x
 720                     	xref	c_sdivx
 721                     	xref	c_smody
 722                     	xref	c_smodx
 723                     	xref	c_xymvx
 724                     	end
