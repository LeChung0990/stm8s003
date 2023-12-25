   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  50                     ; 24 int main()
  50                     ; 25 {
  52                     	switch	.text
  53  0000               _main:
  57                     ; 26 	Clock_setup();
  59  0000 ad15          	call	_Clock_setup
  61                     ; 27 	GPIO_setup();
  63  0002 ad1b          	call	_GPIO_setup
  65                     ; 28 	delay_config();
  67  0004 cd0000        	call	_delay_config
  69                     ; 29 	uart_init();
  71  0007 ad46          	call	_uart_init
  73  0009               L12:
  74                     ; 32 		uart1_string("chung");
  76  0009 ae0005        	ldw	x,#L52
  77  000c cd0112        	call	_uart1_string
  79                     ; 33 		delay_ms(1000);
  81  000f ae03e8        	ldw	x,#1000
  82  0012 cd0000        	call	_delay_ms
  85  0015 20f2          	jra	L12
 110                     ; 37 void Clock_setup(void)
 110                     ; 38 {
 111                     	switch	.text
 112  0017               _Clock_setup:
 116                     ; 40 	CLK_DeInit();   
 118  0017 cd0000        	call	_CLK_DeInit
 120                     ; 41 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 122  001a 4f            	clr	a
 123  001b cd0000        	call	_CLK_HSIPrescalerConfig
 125                     ; 42 }
 128  001e 81            	ret
 153                     ; 43 void GPIO_setup(void)
 153                     ; 44 {
 154                     	switch	.text
 155  001f               _GPIO_setup:
 159                     ; 46 	GPIO_DeInit(GPIOD);
 161  001f ae500f        	ldw	x,#20495
 162  0022 cd0000        	call	_GPIO_DeInit
 164                     ; 47 	GPIO_DeInit(GPIOC);
 166  0025 ae500a        	ldw	x,#20490
 167  0028 cd0000        	call	_GPIO_DeInit
 169                     ; 48 	GPIO_DeInit(GPIOA);
 171  002b ae5000        	ldw	x,#20480
 172  002e cd0000        	call	_GPIO_DeInit
 174                     ; 49 	GPIO_DeInit(GPIOE);
 176  0031 ae5014        	ldw	x,#20500
 177  0034 cd0000        	call	_GPIO_DeInit
 179                     ; 50 	GPIO_DeInit(GPIOB);   
 181  0037 ae5005        	ldw	x,#20485
 182  003a cd0000        	call	_GPIO_DeInit
 184                     ; 51 	GPIO_DeInit(GPIOF);
 186  003d ae5019        	ldw	x,#20505
 187  0040 cd0000        	call	_GPIO_DeInit
 189                     ; 53 	GPIO_Init(LED_PORT,LED_PIN,GPIO_MODE_OUT_PP_LOW_FAST);
 191  0043 4be0          	push	#224
 192  0045 4b08          	push	#8
 193  0047 ae5000        	ldw	x,#20480
 194  004a cd0000        	call	_GPIO_Init
 196  004d 85            	popw	x
 197                     ; 54 }
 200  004e 81            	ret
 244                     ; 58 void uart_init(void){
 245                     	switch	.text
 246  004f               _uart_init:
 248  004f 5208          	subw	sp,#8
 249       00000008      OFST:	set	8
 252                     ; 59 	uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 254  0051 ae0000        	ldw	x,#0
 255  0054 1f03          	ldw	(OFST-5,sp),x
 256  0056 ae0000        	ldw	x,#0
 257  0059 1f01          	ldw	(OFST-7,sp),x
 260  005b ae0000        	ldw	x,#0
 261  005e 1f07          	ldw	(OFST-1,sp),x
 262  0060 ae0000        	ldw	x,#0
 263  0063 1f05          	ldw	(OFST-3,sp),x
 264                     ; 61 	UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  /* Clear the word length bit */
 266  0065 72195234      	bres	21044,#4
 267                     ; 62 	UART1->CR1 |= (uint8_t)0x00; /* Set the word length bit, 8 Data bits */
 269  0069 c65234        	ld	a,21044
 270                     ; 63 	UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  /* Clear the STOP bits */
 272  006c c65236        	ld	a,21046
 273  006f a4cf          	and	a,#207
 274  0071 c75236        	ld	21046,a
 275                     ; 64 	UART1->CR3 |= (uint8_t)0x00; /**< One stop bit is transmitted at the end of frame*/
 277  0074 c65236        	ld	a,21046
 278                     ; 66 	UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  /* Clear the Parity Control bit */
 280  0077 c65234        	ld	a,21044
 281  007a a4f9          	and	a,#249
 282  007c c75234        	ld	21044,a
 283                     ; 67 	UART1->CR1 |= (uint8_t)0x00;  /* Set No Parity Control bit */
 285  007f c65234        	ld	a,21044
 286                     ; 69 	UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  /* Clear the LSB mantissa of UART1DIV  */
 288  0082 725f5232      	clr	21042
 289                     ; 70 	UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);	/* Clear the MSB mantissa of UART1DIV  */
 291  0086 c65233        	ld	a,21043
 292  0089 a40f          	and	a,#15
 293  008b c75233        	ld	21043,a
 294                     ; 71 	UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  /* Clear the Fraction bits of UART1DIV */
 296  008e c65233        	ld	a,21043
 297  0091 a4f0          	and	a,#240
 298  0093 c75233        	ld	21043,a
 299                     ; 78 	UART1->BRR2 = (uint8_t)0x01;
 301  0096 35015233      	mov	21043,#1
 302                     ; 79 	UART1->BRR1 = (uint8_t)0x34;
 304  009a 35345232      	mov	21042,#52
 305                     ; 85 	UART1->CR2 |= (uint8_t)UART1_CR2_TEN; /*Transmit Enable and Receive Enable*/ 
 307  009e 72165235      	bset	21045,#3
 308                     ; 86 	UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
 310  00a2 72145235      	bset	21045,#2
 311                     ; 87 	UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); /*Sync mode Disable, SLK pin Disable*/
 313  00a6 72175236      	bres	21046,#3
 314                     ; 88 	UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); /* UART1 Enable */
 316  00aa 721b5234      	bres	21044,#5
 317                     ; 89 }
 320  00ae 5b08          	addw	sp,#8
 321  00b0 81            	ret
 324                     .const:	section	.text
 325  0000               L17_digit:
 326  0000 00            	dc.b	0
 327  0001 00000000      	ds.b	4
 378                     ; 91 void uart1_number(int number)
 378                     ; 92 {
 379                     	switch	.text
 380  00b1               _uart1_number:
 382  00b1 89            	pushw	x
 383  00b2 5208          	subw	sp,#8
 384       00000008      OFST:	set	8
 387                     ; 93     char count = 0;
 389  00b4 0f08          	clr	(OFST+0,sp)
 390                     ; 94     char digit[5] = "";
 392  00b6 96            	ldw	x,sp
 393  00b7 1c0003        	addw	x,#OFST-5
 394  00ba 90ae0000      	ldw	y,#L17_digit
 395  00be a605          	ld	a,#5
 396  00c0 cd0000        	call	c_xymvx
 399  00c3 2023          	jra	L521
 400  00c5               L121:
 401                     ; 97         digit[count] = number%10;   //lay chu so ngoai cung xxxx8;
 403  00c5 96            	ldw	x,sp
 404  00c6 1c0003        	addw	x,#OFST-5
 405  00c9 9f            	ld	a,xl
 406  00ca 5e            	swapw	x
 407  00cb 1b08          	add	a,(OFST+0,sp)
 408  00cd 2401          	jrnc	L61
 409  00cf 5c            	incw	x
 410  00d0               L61:
 411  00d0 02            	rlwa	x,a
 412  00d1 1609          	ldw	y,(OFST+1,sp)
 413  00d3 a60a          	ld	a,#10
 414  00d5 cd0000        	call	c_smody
 416  00d8 9001          	rrwa	y,a
 417  00da f7            	ld	(x),a
 418  00db 9002          	rlwa	y,a
 419                     ; 98         ++count;
 421  00dd 0c08          	inc	(OFST+0,sp)
 422                     ; 99         number = number/10;         //chia so number cho 10 de bo so ngoai cung xxxx
 424  00df 1e09          	ldw	x,(OFST+1,sp)
 425  00e1 a60a          	ld	a,#10
 426  00e3 cd0000        	call	c_sdivx
 428  00e6 1f09          	ldw	(OFST+1,sp),x
 429  00e8               L521:
 430                     ; 95     while(number != 0)
 432  00e8 1e09          	ldw	x,(OFST+1,sp)
 433  00ea 26d9          	jrne	L121
 435  00ec 201d          	jra	L331
 436  00ee               L131:
 437                     ; 103         UART1->DR = (digit[count - 1] + 0x30); // 0x30 = 48 ;
 439  00ee 96            	ldw	x,sp
 440  00ef 1c0003        	addw	x,#OFST-5
 441  00f2 1f01          	ldw	(OFST-7,sp),x
 442  00f4 7b08          	ld	a,(OFST+0,sp)
 443  00f6 5f            	clrw	x
 444  00f7 97            	ld	xl,a
 445  00f8 5a            	decw	x
 446  00f9 72fb01        	addw	x,(OFST-7,sp)
 447  00fc f6            	ld	a,(x)
 448  00fd ab30          	add	a,#48
 449  00ff c75231        	ld	21041,a
 451  0102               L341:
 452                     ; 104 		while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET);
 454  0102 c65230        	ld	a,21040
 455  0105 a580          	bcp	a,#128
 456  0107 27f9          	jreq	L341
 457                     ; 105         --count;
 459  0109 0a08          	dec	(OFST+0,sp)
 460  010b               L331:
 461                     ; 101     while (count!=0)
 463  010b 0d08          	tnz	(OFST+0,sp)
 464  010d 26df          	jrne	L131
 465                     ; 107 }
 468  010f 5b0a          	addw	sp,#10
 469  0111 81            	ret
 504                     ; 108 void uart1_string(const char *cy)
 504                     ; 109 {
 505                     	switch	.text
 506  0112               _uart1_string:
 508  0112 89            	pushw	x
 509       00000000      OFST:	set	0
 512  0113 2014          	jra	L761
 513  0115               L561:
 514                     ; 112         UART1->DR = (*cy);
 516  0115 1e01          	ldw	x,(OFST+1,sp)
 517  0117 f6            	ld	a,(x)
 518  0118 c75231        	ld	21041,a
 520  011b               L771:
 521                     ; 113         while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET){}
 523  011b c65230        	ld	a,21040
 524  011e a580          	bcp	a,#128
 525  0120 27f9          	jreq	L771
 526                     ; 114         cy++;
 528  0122 1e01          	ldw	x,(OFST+1,sp)
 529  0124 1c0001        	addw	x,#1
 530  0127 1f01          	ldw	(OFST+1,sp),x
 531  0129               L761:
 532                     ; 110 	while(*cy)
 534  0129 1e01          	ldw	x,(OFST+1,sp)
 535  012b 7d            	tnz	(x)
 536  012c 26e7          	jrne	L561
 537                     ; 116 }
 540  012e 85            	popw	x
 541  012f 81            	ret
 564                     ; 117 void uart1_nline(void)
 564                     ; 118 {
 565                     	switch	.text
 566  0130               _uart1_nline:
 570                     ; 119     UART1->DR = (0x0a);
 572  0130 350a5231      	mov	21041,#10
 574  0134               L712:
 575                     ; 120     while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET);
 577  0134 c65230        	ld	a,21040
 578  0137 a580          	bcp	a,#128
 579  0139 27f9          	jreq	L712
 580                     ; 121 }
 583  013b 81            	ret
 596                     	xdef	_main
 597                     	xdef	_uart1_nline
 598                     	xdef	_uart1_string
 599                     	xdef	_uart1_number
 600                     	xdef	_uart_init
 601                     	xdef	_GPIO_setup
 602                     	xdef	_Clock_setup
 603                     	xref	_delay_ms
 604                     	xref	_delay_config
 605                     	xref	_GPIO_Init
 606                     	xref	_GPIO_DeInit
 607                     	xref	_CLK_HSIPrescalerConfig
 608                     	xref	_CLK_DeInit
 609                     	switch	.const
 610  0005               L52:
 611  0005 6368756e6700  	dc.b	"chung",0
 612                     	xref.b	c_x
 632                     	xref	c_sdivx
 633                     	xref	c_smody
 634                     	xref	c_smodx
 635                     	xref	c_xymvx
 636                     	end
