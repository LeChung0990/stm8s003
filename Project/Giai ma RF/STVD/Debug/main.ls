   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  16                     	bsct
  17  0000               _TxAddress:
  18  0000 ee            	dc.b	238
  19  0001 dd            	dc.b	221
  20  0002 cc            	dc.b	204
  21  0003 bb            	dc.b	187
  22  0004 aa            	dc.b	170
  23  0005               _TxData:
  24  0005 48656c6c6f20  	dc.b	"Hello World",10,0
  62                     ; 23 int main()
  62                     ; 24 {
  64                     	switch	.text
  65  0000               _main:
  69                     ; 25 	Clock_setup();//goi lai ham
  71  0000 ad31          	call	_Clock_setup
  73                     ; 26 	GPIO_setup();//goi lai ham
  75  0002 ad37          	call	_GPIO_setup
  77                     ; 27 	delay_config();
  79  0004 cd0000        	call	_delay_config
  81                     ; 29 	SPI_Master_Init(SPI_BAUDRATEPRESCALER_64);
  83  0007 a628          	ld	a,#40
  84  0009 cd0000        	call	_SPI_Master_Init
  86  000c               L12:
  87                     ; 41 		GPIO_WriteHigh(LED_PORT, LED_PIN);
  89  000c 4b08          	push	#8
  90  000e ae5000        	ldw	x,#20480
  91  0011 cd0000        	call	_GPIO_WriteHigh
  93  0014 84            	pop	a
  94                     ; 42 		SPI_SendData(0x08);
  96  0015 a608          	ld	a,#8
  97  0017 cd0000        	call	_SPI_SendData
 100  001a               L72:
 101                     ; 43 		while( !SPI_GetFlagStatus(SPI_FLAG_TXE));
 103  001a a602          	ld	a,#2
 104  001c cd0000        	call	_SPI_GetFlagStatus
 106  001f 4d            	tnz	a
 107  0020 27f8          	jreq	L72
 108                     ; 44 		GPIO_WriteLow(LED_PORT, LED_PIN);
 110  0022 4b08          	push	#8
 111  0024 ae5000        	ldw	x,#20480
 112  0027 cd0000        	call	_GPIO_WriteLow
 114  002a 84            	pop	a
 115                     ; 45 		delay_ms(1);
 117  002b ae0001        	ldw	x,#1
 118  002e cd0000        	call	_delay_ms
 121  0031 20d9          	jra	L12
 146                     ; 50 void Clock_setup(void)
 146                     ; 51 {
 147                     	switch	.text
 148  0033               _Clock_setup:
 152                     ; 53 	CLK_DeInit();   
 154  0033 cd0000        	call	_CLK_DeInit
 156                     ; 54 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 158  0036 4f            	clr	a
 159  0037 cd0000        	call	_CLK_HSIPrescalerConfig
 161                     ; 55 }
 164  003a 81            	ret
 189                     ; 56 void GPIO_setup(void)
 189                     ; 57 {
 190                     	switch	.text
 191  003b               _GPIO_setup:
 195                     ; 59 	GPIO_DeInit(GPIOD);
 197  003b ae500f        	ldw	x,#20495
 198  003e cd0000        	call	_GPIO_DeInit
 200                     ; 60 	GPIO_DeInit(GPIOC);
 202  0041 ae500a        	ldw	x,#20490
 203  0044 cd0000        	call	_GPIO_DeInit
 205                     ; 61 	GPIO_DeInit(GPIOA);
 207  0047 ae5000        	ldw	x,#20480
 208  004a cd0000        	call	_GPIO_DeInit
 210                     ; 62 	GPIO_DeInit(GPIOE);
 212  004d ae5014        	ldw	x,#20500
 213  0050 cd0000        	call	_GPIO_DeInit
 215                     ; 63 	GPIO_DeInit(GPIOB);   
 217  0053 ae5005        	ldw	x,#20485
 218  0056 cd0000        	call	_GPIO_DeInit
 220                     ; 64 	GPIO_DeInit(GPIOF);
 222  0059 ae5019        	ldw	x,#20505
 223  005c cd0000        	call	_GPIO_DeInit
 225                     ; 66 	GPIO_Init(LED_PORT,LED_PIN,GPIO_MODE_OUT_PP_LOW_FAST);
 227  005f 4be0          	push	#224
 228  0061 4b08          	push	#8
 229  0063 ae5000        	ldw	x,#20480
 230  0066 cd0000        	call	_GPIO_Init
 232  0069 85            	popw	x
 233                     ; 67 	GPIO_Init(BUT_PORT,BUT_PIN,GPIO_MODE_IN_PU_IT);
 235  006a 4b60          	push	#96
 236  006c 4b10          	push	#16
 237  006e ae500f        	ldw	x,#20495
 238  0071 cd0000        	call	_GPIO_Init
 240  0074 85            	popw	x
 241                     ; 69 }
 244  0075 81            	ret
 279                     	xdef	_main
 280                     	xdef	_GPIO_setup
 281                     	xdef	_Clock_setup
 282                     	xdef	_TxData
 283                     	xdef	_TxAddress
 284                     	xref	_SPI_Master_Init
 285                     	xref	_delay_ms
 286                     	xref	_delay_config
 287                     	xref	_SPI_GetFlagStatus
 288                     	xref	_SPI_SendData
 289                     	xref	_GPIO_WriteLow
 290                     	xref	_GPIO_WriteHigh
 291                     	xref	_GPIO_Init
 292                     	xref	_GPIO_DeInit
 293                     	xref	_CLK_HSIPrescalerConfig
 294                     	xref	_CLK_DeInit
 313                     	end
