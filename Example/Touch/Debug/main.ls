   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  16                     	bsct
  17  0000               _thr1:
  18  0000 0f            	dc.b	15
  58                     ; 32 int main()
  58                     ; 33 {
  60                     	switch	.text
  61  0000               _main:
  65                     ; 34 	Clock_setup();//goi lai ham
  67  0000 ad5b          	call	_Clock_setup
  69                     ; 35 	GPIO_setup();//goi lai ham
  71  0002 ad61          	call	_GPIO_setup
  73                     ; 36 	delay_config();
  75  0004 cd0000        	call	_delay_config
  77                     ; 37 	uart_init();
  79  0007 cd00a9        	call	_uart_init
  81                     ; 58 	uart1_string("Start:");
  83  000a ae0005        	ldw	x,#L12
  84  000d cd0176        	call	_uart1_string
  86                     ; 60 	uart1_nline();
  88  0010 cd0194        	call	_uart1_nline
  90  0013               L32:
  91                     ; 67 		time=0;
  93  0013 5f            	clrw	x
  94  0014 bf05          	ldw	_time,x
  95                     ; 70 		TOUCH_PORT->DDR |= (uint8_t)TOUCH_PIN;
  97  0016 72185011      	bset	20497,#4
  98                     ; 71 		TOUCH_PORT->ODR |= (uint8_t)TOUCH_PIN; /*1*/
 100  001a 7218500f      	bset	20495,#4
 101                     ; 73 		wait();
 103  001e cd00a0        	call	_wait
 105                     ; 77 		TOUCH_PORT->DDR &= (uint8_t)(~(TOUCH_PIN));
 107  0021 72195011      	bres	20497,#4
 108                     ; 79 		TOUCH_PORT->CR1 &= (uint8_t)(~(TOUCH_PIN));
 110  0025 72195012      	bres	20498,#4
 112  0029 2007          	jra	L13
 113  002b               L72:
 114                     ; 82 		{ time++; }
 116  002b be05          	ldw	x,_time
 117  002d 1c0001        	addw	x,#1
 118  0030 bf05          	ldw	_time,x
 119  0032               L13:
 120                     ; 81 		while( (TOUCH_PORT->IDR & (uint8_t)TOUCH_PIN) )
 122  0032 c65010        	ld	a,20496
 123  0035 a510          	bcp	a,#16
 124  0037 26f2          	jrne	L72
 125                     ; 85         if (time > 6000) {
 127  0039 9c            	rvf
 128  003a be05          	ldw	x,_time
 129  003c a31771        	cpw	x,#6001
 130  003f 2f0b          	jrslt	L53
 131                     ; 87             GPIO_WriteHigh(LED_PORT, LED_PIN);
 133  0041 4b08          	push	#8
 134  0043 ae5000        	ldw	x,#20480
 135  0046 cd0000        	call	_GPIO_WriteHigh
 137  0049 84            	pop	a
 139  004a 2009          	jra	L73
 140  004c               L53:
 141                     ; 92                 GPIO_WriteLow(LED_PORT, LED_PIN);
 143  004c 4b08          	push	#8
 144  004e ae5000        	ldw	x,#20480
 145  0051 cd0000        	call	_GPIO_WriteLow
 147  0054 84            	pop	a
 148  0055               L73:
 149                     ; 100 		delay_ms(10);
 151  0055 ae000a        	ldw	x,#10
 152  0058 cd0000        	call	_delay_ms
 155  005b 20b6          	jra	L32
 180                     ; 104 void Clock_setup(void)
 180                     ; 105 {
 181                     	switch	.text
 182  005d               _Clock_setup:
 186                     ; 107 	CLK_DeInit();   
 188  005d cd0000        	call	_CLK_DeInit
 190                     ; 108 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 192  0060 4f            	clr	a
 193  0061 cd0000        	call	_CLK_HSIPrescalerConfig
 195                     ; 109 }
 198  0064 81            	ret
 223                     ; 110 void GPIO_setup(void)
 223                     ; 111 {
 224                     	switch	.text
 225  0065               _GPIO_setup:
 229                     ; 113 	GPIO_DeInit(GPIOD);
 231  0065 ae500f        	ldw	x,#20495
 232  0068 cd0000        	call	_GPIO_DeInit
 234                     ; 114 	GPIO_DeInit(GPIOC);
 236  006b ae500a        	ldw	x,#20490
 237  006e cd0000        	call	_GPIO_DeInit
 239                     ; 115 	GPIO_DeInit(GPIOA);
 241  0071 ae5000        	ldw	x,#20480
 242  0074 cd0000        	call	_GPIO_DeInit
 244                     ; 116 	GPIO_DeInit(GPIOE);
 246  0077 ae5014        	ldw	x,#20500
 247  007a cd0000        	call	_GPIO_DeInit
 249                     ; 117 	GPIO_DeInit(GPIOB);   
 251  007d ae5005        	ldw	x,#20485
 252  0080 cd0000        	call	_GPIO_DeInit
 254                     ; 118 	GPIO_DeInit(GPIOF);
 256  0083 ae5019        	ldw	x,#20505
 257  0086 cd0000        	call	_GPIO_DeInit
 259                     ; 120 	GPIO_Init(TOUCH_PORT, TOUCH_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
 261  0089 4be0          	push	#224
 262  008b 4b10          	push	#16
 263  008d ae500f        	ldw	x,#20495
 264  0090 cd0000        	call	_GPIO_Init
 266  0093 85            	popw	x
 267                     ; 121 	GPIO_Init(LED_PORT, LED_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
 269  0094 4be0          	push	#224
 270  0096 4b08          	push	#8
 271  0098 ae5000        	ldw	x,#20480
 272  009b cd0000        	call	_GPIO_Init
 274  009e 85            	popw	x
 275                     ; 123 }
 278  009f 81            	ret
 309                     ; 125 void wait(void)
 309                     ; 126 {
 310                     	switch	.text
 311  00a0               _wait:
 315                     ; 127 	nop(); nop(); nop(); nop();
 318  00a0 9d            nop
 324  00a1 9d            nop
 330  00a2 9d            nop
 336  00a3 9d            nop
 338                     ; 128 	nop(); nop(); nop(); nop();
 342  00a4 9d            nop
 348  00a5 9d            nop
 354  00a6 9d            nop
 360  00a7 9d            nop
 362                     ; 129 }
 366  00a8 81            	ret
 410                     ; 131 void uart_init(void){
 411                     	switch	.text
 412  00a9               _uart_init:
 414  00a9 5208          	subw	sp,#8
 415       00000008      OFST:	set	8
 418                     ; 132 	uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 420  00ab ae0000        	ldw	x,#0
 421  00ae 1f03          	ldw	(OFST-5,sp),x
 422  00b0 ae0000        	ldw	x,#0
 423  00b3 1f01          	ldw	(OFST-7,sp),x
 426  00b5 ae0000        	ldw	x,#0
 427  00b8 1f07          	ldw	(OFST-1,sp),x
 428  00ba ae0000        	ldw	x,#0
 429  00bd 1f05          	ldw	(OFST-3,sp),x
 430                     ; 134 	UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  /* Clear the word length bit */
 432  00bf 72195234      	bres	21044,#4
 433                     ; 135 	UART1->CR1 |= (uint8_t)0x00; /* Set the word length bit, 8 Data bits */
 435  00c3 c65234        	ld	a,21044
 436                     ; 136 	UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  /* Clear the STOP bits */
 438  00c6 c65236        	ld	a,21046
 439  00c9 a4cf          	and	a,#207
 440  00cb c75236        	ld	21046,a
 441                     ; 137 	UART1->CR3 |= (uint8_t)0x00; /**< One stop bit is transmitted at the end of frame*/
 443  00ce c65236        	ld	a,21046
 444                     ; 139 	UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  /* Clear the Parity Control bit */
 446  00d1 c65234        	ld	a,21044
 447  00d4 a4f9          	and	a,#249
 448  00d6 c75234        	ld	21044,a
 449                     ; 140 	UART1->CR1 |= (uint8_t)0x00;  /* Set No Parity Control bit */
 451  00d9 c65234        	ld	a,21044
 452                     ; 142 	UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  /* Clear the LSB mantissa of UART1DIV  */
 454  00dc 725f5232      	clr	21042
 455                     ; 143 	UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);	/* Clear the MSB mantissa of UART1DIV  */
 457  00e0 c65233        	ld	a,21043
 458  00e3 a40f          	and	a,#15
 459  00e5 c75233        	ld	21043,a
 460                     ; 144 	UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  /* Clear the Fraction bits of UART1DIV */
 462  00e8 c65233        	ld	a,21043
 463  00eb a4f0          	and	a,#240
 464  00ed c75233        	ld	21043,a
 465                     ; 151 	UART1->BRR2 = (uint8_t)0x01;
 467  00f0 35015233      	mov	21043,#1
 468                     ; 152 	UART1->BRR1 = (uint8_t)0x34;
 470  00f4 35345232      	mov	21042,#52
 471                     ; 158 	UART1->CR2 |= (uint8_t)UART1_CR2_TEN; /*Transmit Enable and Receive Enable*/ 
 473  00f8 72165235      	bset	21045,#3
 474                     ; 159 	UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
 476  00fc 72145235      	bset	21045,#2
 477                     ; 160 	UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); /*Sync mode Disable, SLK pin Disable*/
 479  0100 72175236      	bres	21046,#3
 480                     ; 161 	UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); /* UART1 Enable */
 482  0104 721b5234      	bres	21044,#5
 483                     ; 162 }
 486  0108 5b08          	addw	sp,#8
 487  010a 81            	ret
 490                     .const:	section	.text
 491  0000               L311_digit:
 492  0000 00            	dc.b	0
 493  0001 00000000      	ds.b	4
 544                     ; 164 void uart1_number(int number)
 544                     ; 165 {
 545                     	switch	.text
 546  010b               _uart1_number:
 548  010b 89            	pushw	x
 549  010c 5208          	subw	sp,#8
 550       00000008      OFST:	set	8
 553                     ; 166     char count = 0;
 555  010e 0f08          	clr	(OFST+0,sp)
 556                     ; 167     char digit[5] = "";
 558  0110 96            	ldw	x,sp
 559  0111 1c0003        	addw	x,#OFST-5
 560  0114 90ae0000      	ldw	y,#L311_digit
 561  0118 a605          	ld	a,#5
 562  011a cd0000        	call	c_xymvx
 564                     ; 168 	if (number == 0)
 566  011d 1e09          	ldw	x,(OFST+1,sp)
 567  011f 262b          	jrne	L741
 568                     ; 170 		digit[0] = 0;
 570  0121 0f03          	clr	(OFST-5,sp)
 571                     ; 171 		count = 1;
 573  0123 a601          	ld	a,#1
 574  0125 6b08          	ld	(OFST+0,sp),a
 575  0127 2023          	jra	L741
 576  0129               L541:
 577                     ; 175         digit[count] = number%10;   //lay chu so ngoai cung xxxx8;
 579  0129 96            	ldw	x,sp
 580  012a 1c0003        	addw	x,#OFST-5
 581  012d 9f            	ld	a,xl
 582  012e 5e            	swapw	x
 583  012f 1b08          	add	a,(OFST+0,sp)
 584  0131 2401          	jrnc	L02
 585  0133 5c            	incw	x
 586  0134               L02:
 587  0134 02            	rlwa	x,a
 588  0135 1609          	ldw	y,(OFST+1,sp)
 589  0137 a60a          	ld	a,#10
 590  0139 cd0000        	call	c_smody
 592  013c 9001          	rrwa	y,a
 593  013e f7            	ld	(x),a
 594  013f 9002          	rlwa	y,a
 595                     ; 176         ++count;
 597  0141 0c08          	inc	(OFST+0,sp)
 598                     ; 177         number = number/10;         //chia so number cho 10 de bo so ngoai cung xxxx
 600  0143 1e09          	ldw	x,(OFST+1,sp)
 601  0145 a60a          	ld	a,#10
 602  0147 cd0000        	call	c_sdivx
 604  014a 1f09          	ldw	(OFST+1,sp),x
 605  014c               L741:
 606                     ; 173     while(number != 0)
 608  014c 1e09          	ldw	x,(OFST+1,sp)
 609  014e 26d9          	jrne	L541
 611  0150 201d          	jra	L551
 612  0152               L351:
 613                     ; 181         UART1->DR = (digit[count - 1] + 0x30); // 0x30 = 48 ;
 615  0152 96            	ldw	x,sp
 616  0153 1c0003        	addw	x,#OFST-5
 617  0156 1f01          	ldw	(OFST-7,sp),x
 618  0158 7b08          	ld	a,(OFST+0,sp)
 619  015a 5f            	clrw	x
 620  015b 97            	ld	xl,a
 621  015c 5a            	decw	x
 622  015d 72fb01        	addw	x,(OFST-7,sp)
 623  0160 f6            	ld	a,(x)
 624  0161 ab30          	add	a,#48
 625  0163 c75231        	ld	21041,a
 627  0166               L561:
 628                     ; 182 		while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET);
 630  0166 c65230        	ld	a,21040
 631  0169 a580          	bcp	a,#128
 632  016b 27f9          	jreq	L561
 633                     ; 183         --count;
 635  016d 0a08          	dec	(OFST+0,sp)
 636  016f               L551:
 637                     ; 179     while (count!=0)
 639  016f 0d08          	tnz	(OFST+0,sp)
 640  0171 26df          	jrne	L351
 641                     ; 185 }
 644  0173 5b0a          	addw	sp,#10
 645  0175 81            	ret
 680                     ; 186 void uart1_string(const char *cy)
 680                     ; 187 {
 681                     	switch	.text
 682  0176               _uart1_string:
 684  0176 89            	pushw	x
 685       00000000      OFST:	set	0
 688  0177 2014          	jra	L112
 689  0179               L702:
 690                     ; 190         UART1->DR = (*cy);
 692  0179 1e01          	ldw	x,(OFST+1,sp)
 693  017b f6            	ld	a,(x)
 694  017c c75231        	ld	21041,a
 696  017f               L122:
 697                     ; 191         while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET){}
 699  017f c65230        	ld	a,21040
 700  0182 a580          	bcp	a,#128
 701  0184 27f9          	jreq	L122
 702                     ; 192         cy++;
 704  0186 1e01          	ldw	x,(OFST+1,sp)
 705  0188 1c0001        	addw	x,#1
 706  018b 1f01          	ldw	(OFST+1,sp),x
 707  018d               L112:
 708                     ; 188 	while(*cy)
 710  018d 1e01          	ldw	x,(OFST+1,sp)
 711  018f 7d            	tnz	(x)
 712  0190 26e7          	jrne	L702
 713                     ; 194 }
 716  0192 85            	popw	x
 717  0193 81            	ret
 740                     ; 195 void uart1_nline(void)
 740                     ; 196 {
 741                     	switch	.text
 742  0194               _uart1_nline:
 746                     ; 197     UART1->DR = (0x0a);
 748  0194 350a5231      	mov	21041,#10
 750  0198               L142:
 751                     ; 198     while((UART1->SR & (uint8_t)UART1_SR_TXE)==RESET);
 753  0198 c65230        	ld	a,21040
 754  019b a580          	bcp	a,#128
 755  019d 27f9          	jreq	L142
 756                     ; 199 }
 759  019f 81            	ret
 819                     	xdef	_main
 820                     	xdef	_uart1_nline
 821                     	xdef	_uart1_string
 822                     	xdef	_uart1_number
 823                     	xdef	_uart_init
 824                     	xdef	_wait
 825                     	xdef	_GPIO_setup
 826                     	xdef	_Clock_setup
 827                     	switch	.ubsct
 828  0000               _c:
 829  0000 00            	ds.b	1
 830                     	xdef	_c
 831  0001               _buf1:
 832  0001 0000          	ds.b	2
 833                     	xdef	_buf1
 834                     	xdef	_thr1
 835  0003               _avg1:
 836  0003 0000          	ds.b	2
 837                     	xdef	_avg1
 838  0005               _time:
 839  0005 0000          	ds.b	2
 840                     	xdef	_time
 841                     	xref	_delay_ms
 842                     	xref	_delay_config
 843                     	xref	_GPIO_WriteLow
 844                     	xref	_GPIO_WriteHigh
 845                     	xref	_GPIO_Init
 846                     	xref	_GPIO_DeInit
 847                     	xref	_CLK_HSIPrescalerConfig
 848                     	xref	_CLK_DeInit
 849                     	switch	.const
 850  0005               L12:
 851  0005 53746172743a  	dc.b	"Start:",0
 852                     	xref.b	c_x
 872                     	xref	c_sdivx
 873                     	xref	c_smody
 874                     	xref	c_smodx
 875                     	xref	c_xymvx
 876                     	end
