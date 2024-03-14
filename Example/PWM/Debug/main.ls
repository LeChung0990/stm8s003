   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  49                     ; 20 int main()
  49                     ; 21 {
  51                     	switch	.text
  52  0000               _main:
  56                     ; 22 	Clock_setup();//goi lai ham
  58  0000 ad16          	call	_Clock_setup
  60                     ; 23 	GPIO_setup();//goi lai ham
  62  0002 ad1c          	call	_GPIO_setup
  64                     ; 24 	delay_config();
  66  0004 cd0000        	call	_delay_config
  68  0007               L12:
  69                     ; 38 		GPIO_WriteReverse(LED_PORT, LED_PIN);
  71  0007 4b08          	push	#8
  72  0009 ae500f        	ldw	x,#20495
  73  000c cd0000        	call	_GPIO_WriteReverse
  75  000f 84            	pop	a
  76                     ; 39 		delay_ms(100);
  78  0010 ae0064        	ldw	x,#100
  79  0013 cd0000        	call	_delay_ms
  82  0016 20ef          	jra	L12
 107                     ; 62 void Clock_setup(void)
 107                     ; 63 {
 108                     	switch	.text
 109  0018               _Clock_setup:
 113                     ; 65 	CLK_DeInit();   
 115  0018 cd0000        	call	_CLK_DeInit
 117                     ; 66 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 119  001b 4f            	clr	a
 120  001c cd0000        	call	_CLK_HSIPrescalerConfig
 122                     ; 67 }
 125  001f 81            	ret
 150                     ; 68 void GPIO_setup(void)
 150                     ; 69 {
 151                     	switch	.text
 152  0020               _GPIO_setup:
 156                     ; 71 	GPIO_DeInit(GPIOD);
 158  0020 ae500f        	ldw	x,#20495
 159  0023 cd0000        	call	_GPIO_DeInit
 161                     ; 72 	GPIO_DeInit(GPIOC);
 163  0026 ae500a        	ldw	x,#20490
 164  0029 cd0000        	call	_GPIO_DeInit
 166                     ; 73 	GPIO_DeInit(GPIOA);
 168  002c ae5000        	ldw	x,#20480
 169  002f cd0000        	call	_GPIO_DeInit
 171                     ; 74 	GPIO_DeInit(GPIOE);
 173  0032 ae5014        	ldw	x,#20500
 174  0035 cd0000        	call	_GPIO_DeInit
 176                     ; 75 	GPIO_DeInit(GPIOB);   
 178  0038 ae5005        	ldw	x,#20485
 179  003b cd0000        	call	_GPIO_DeInit
 181                     ; 76 	GPIO_DeInit(GPIOF);
 183  003e ae5019        	ldw	x,#20505
 184  0041 cd0000        	call	_GPIO_DeInit
 186                     ; 78 	GPIO_Init(LED_PORT,LED_PIN,GPIO_MODE_OUT_PP_LOW_FAST);
 188  0044 4be0          	push	#224
 189  0046 4b08          	push	#8
 190  0048 ae500f        	ldw	x,#20495
 191  004b cd0000        	call	_GPIO_Init
 193  004e 85            	popw	x
 194                     ; 79 	GPIO_Init(BUT_PORT,BUT_PIN,GPIO_MODE_IN_PU_IT);
 196  004f 4b60          	push	#96
 197  0051 4b10          	push	#16
 198  0053 ae500f        	ldw	x,#20495
 199  0056 cd0000        	call	_GPIO_Init
 201  0059 85            	popw	x
 202                     ; 80 }
 205  005a 81            	ret
 218                     	xdef	_main
 219                     	xdef	_GPIO_setup
 220                     	xdef	_Clock_setup
 221                     	xref	_delay_ms
 222                     	xref	_delay_config
 223                     	xref	_GPIO_WriteReverse
 224                     	xref	_GPIO_Init
 225                     	xref	_GPIO_DeInit
 226                     	xref	_CLK_HSIPrescalerConfig
 227                     	xref	_CLK_DeInit
 246                     	end
