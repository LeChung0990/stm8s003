   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
   4                     ; Optimizer V4.3.6 - 29 Nov 2011
  54                     ; 20 int main()
  54                     ; 21 {
  56                     	switch	.text
  57  0000               _main:
  61                     ; 22 	Clock_setup();//goi lai ham
  63  0000 ad2a          	call	_Clock_setup
  65                     ; 23 	GPIO_setup();//goi lai ham
  67  0002 ad2f          	call	_GPIO_setup
  69                     ; 24 	delay_config();
  71  0004 cd0000        	call	_delay_config
  73  0007               L12:
  74                     ; 28 		if(GPIO_ReadInputPin(BUT_PORT, BUT_PIN)== RESET)
  76  0007 ad17          	call	LC001
  77  0009 26fc          	jrne	L12
  78                     ; 30 			delay_ms(200);
  80  000b ae00c8        	ldw	x,#200
  81  000e cd0000        	call	_delay_ms
  84  0011               L13:
  85                     ; 31 			while(GPIO_ReadInputPin(BUT_PORT, BUT_PIN)== RESET);
  87  0011 ad0d          	call	LC001
  88  0013 27fc          	jreq	L13
  89                     ; 32 			GPIO_WriteReverse(LED_PORT, LED_PIN);
  91  0015 4b08          	push	#8
  92  0017 ae5000        	ldw	x,#20480
  93  001a cd0000        	call	_GPIO_WriteReverse
  95  001d 84            	pop	a
  96  001e 20e7          	jra	L12
  97  0020               LC001:
  98  0020 4b10          	push	#16
  99  0022 ae500a        	ldw	x,#20490
 100  0025 cd0000        	call	_GPIO_ReadInputPin
 102  0028 5b01          	addw	sp,#1
 103  002a 4d            	tnz	a
 104  002b 81            	ret	
 129                     ; 57 void Clock_setup(void)
 129                     ; 58 {
 130                     	switch	.text
 131  002c               _Clock_setup:
 135                     ; 60 	CLK_DeInit();   
 137  002c cd0000        	call	_CLK_DeInit
 139                     ; 61 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 141  002f 4f            	clr	a
 143                     ; 62 }
 146  0030 cc0000        	jp	_CLK_HSIPrescalerConfig
 171                     ; 63 void GPIO_setup(void)
 171                     ; 64 {
 172                     	switch	.text
 173  0033               _GPIO_setup:
 177                     ; 66 	GPIO_DeInit(GPIOD);
 179  0033 ae500f        	ldw	x,#20495
 180  0036 cd0000        	call	_GPIO_DeInit
 182                     ; 67 	GPIO_DeInit(GPIOC);
 184  0039 ae500a        	ldw	x,#20490
 185  003c cd0000        	call	_GPIO_DeInit
 187                     ; 68 	GPIO_DeInit(GPIOA);
 189  003f ae5000        	ldw	x,#20480
 190  0042 cd0000        	call	_GPIO_DeInit
 192                     ; 69 	GPIO_DeInit(GPIOE);
 194  0045 ae5014        	ldw	x,#20500
 195  0048 cd0000        	call	_GPIO_DeInit
 197                     ; 70 	GPIO_DeInit(GPIOB);   
 199  004b ae5005        	ldw	x,#20485
 200  004e cd0000        	call	_GPIO_DeInit
 202                     ; 71 	GPIO_DeInit(GPIOF);
 204  0051 ae5019        	ldw	x,#20505
 205  0054 cd0000        	call	_GPIO_DeInit
 207                     ; 73 	GPIO_Init(LED_PORT,LED_PIN,GPIO_MODE_OUT_PP_LOW_FAST);
 209  0057 4be0          	push	#224
 210  0059 4b08          	push	#8
 211  005b ae5000        	ldw	x,#20480
 212  005e cd0000        	call	_GPIO_Init
 214  0061 85            	popw	x
 215                     ; 74 }
 218  0062 81            	ret	
 231                     	xdef	_main
 232                     	xdef	_GPIO_setup
 233                     	xdef	_Clock_setup
 234                     	xref	_delay_ms
 235                     	xref	_delay_config
 236                     	xref	_GPIO_ReadInputPin
 237                     	xref	_GPIO_WriteReverse
 238                     	xref	_GPIO_Init
 239                     	xref	_GPIO_DeInit
 240                     	xref	_CLK_HSIPrescalerConfig
 241                     	xref	_CLK_DeInit
 260                     	end
