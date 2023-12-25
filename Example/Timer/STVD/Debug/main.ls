   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  50                     ; 16 int main()
  50                     ; 17 {
  52                     	switch	.text
  53  0000               _main:
  57                     ; 18 	Clock_setup();//goi lai ham
  59  0000 ad25          	call	_Clock_setup
  61                     ; 19 	GPIO_setup();//goi lai ham
  63  0002 ad2b          	call	_GPIO_setup
  65                     ; 20 	delay_config();
  67  0004 cd0000        	call	_delay_config
  69  0007               L12:
  70                     ; 23 			GPIO_WriteLow(LED_PORT,LED1_PIN);//goi muc 0 ra LED1
  72  0007 4b08          	push	#8
  73  0009 ae5000        	ldw	x,#20480
  74  000c cd0000        	call	_GPIO_WriteLow
  76  000f 84            	pop	a
  77                     ; 24 			delay_ms(10);
  79  0010 ae000a        	ldw	x,#10
  80  0013 cd0000        	call	_delay_ms
  82                     ; 25 			GPIO_WriteHigh(LED_PORT,LED1_PIN);//goi muc 1 ra LED1
  84  0016 4b08          	push	#8
  85  0018 ae5000        	ldw	x,#20480
  86  001b cd0000        	call	_GPIO_WriteHigh
  88  001e 84            	pop	a
  89                     ; 26 			delay_ms(10);
  91  001f ae000a        	ldw	x,#10
  92  0022 cd0000        	call	_delay_ms
  95  0025 20e0          	jra	L12
 120                     ; 30 void Clock_setup()
 120                     ; 31 {
 121                     	switch	.text
 122  0027               _Clock_setup:
 126                     ; 33 			CLK_DeInit();   
 128  0027 cd0000        	call	_CLK_DeInit
 130                     ; 34 			CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 132  002a 4f            	clr	a
 133  002b cd0000        	call	_CLK_HSIPrescalerConfig
 135                     ; 35 }
 138  002e 81            	ret
 163                     ; 36 void GPIO_setup()
 163                     ; 37 {
 164                     	switch	.text
 165  002f               _GPIO_setup:
 169                     ; 39 	    GPIO_DeInit(GPIOD);
 171  002f ae500f        	ldw	x,#20495
 172  0032 cd0000        	call	_GPIO_DeInit
 174                     ; 40       GPIO_DeInit(GPIOC);
 176  0035 ae500a        	ldw	x,#20490
 177  0038 cd0000        	call	_GPIO_DeInit
 179                     ; 41       GPIO_DeInit(GPIOA);
 181  003b ae5000        	ldw	x,#20480
 182  003e cd0000        	call	_GPIO_DeInit
 184                     ; 42       GPIO_DeInit(GPIOE);
 186  0041 ae5014        	ldw	x,#20500
 187  0044 cd0000        	call	_GPIO_DeInit
 189                     ; 43       GPIO_DeInit(GPIOB);   
 191  0047 ae5005        	ldw	x,#20485
 192  004a cd0000        	call	_GPIO_DeInit
 194                     ; 44       GPIO_DeInit(GPIOF);
 196  004d ae5019        	ldw	x,#20505
 197  0050 cd0000        	call	_GPIO_DeInit
 199                     ; 46       GPIO_Init(LED_PORT,LED1_PIN,GPIO_MODE_OUT_PP_LOW_FAST);
 201  0053 4be0          	push	#224
 202  0055 4b08          	push	#8
 203  0057 ae5000        	ldw	x,#20480
 204  005a cd0000        	call	_GPIO_Init
 206  005d 85            	popw	x
 207                     ; 47 }
 210  005e 81            	ret
 223                     	xdef	_main
 224                     	xdef	_GPIO_setup
 225                     	xdef	_Clock_setup
 226                     	xref	_delay_ms
 227                     	xref	_delay_config
 228                     	xref	_GPIO_WriteLow
 229                     	xref	_GPIO_WriteHigh
 230                     	xref	_GPIO_Init
 231                     	xref	_GPIO_DeInit
 232                     	xref	_CLK_HSIPrescalerConfig
 233                     	xref	_CLK_DeInit
 252                     	end
