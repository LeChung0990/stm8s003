   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
   4                     ; Optimizer V4.3.6 - 29 Nov 2011
  59                     ; 21 int main()
  59                     ; 22 {
  61                     	switch	.text
  62  0000               _main:
  66                     ; 23 	Clock_setup();//goi lai ham
  68  0000 ad21          	call	_Clock_setup
  70                     ; 24 	GPIO_setup();//goi lai ham
  72  0002 ad26          	call	_GPIO_setup
  74                     ; 25 	delay_config();
  76  0004 cd0000        	call	_delay_config
  78                     ; 26 	I2C_init();
  80  0007 cd0000        	call	_I2C_init
  82                     ; 27 	uart_init();
  84  000a cd0000        	call	_uart_init
  86                     ; 28 	initMPU6050();
  88  000d cd0000        	call	_initMPU6050
  90  0010               L12:
  91                     ; 32 		DataMPU = I2C_Read_MPU6050();
  93  0010 cd0000        	call	_I2C_Read_MPU6050
  95  0013 bf04          	ldw	_DataMPU,x
  96                     ; 36 		uart1_number((int)DataMPU);
  98  0015 cd0000        	call	_uart1_number
 100                     ; 37 		uart1_nline();
 102  0018 cd0000        	call	_uart1_nline
 104                     ; 38 		delay_ms(1000);
 106  001b ae03e8        	ldw	x,#1000
 107  001e cd0000        	call	_delay_ms
 110  0021 20ed          	jra	L12
 135                     ; 42 void Clock_setup(void)
 135                     ; 43 {
 136                     	switch	.text
 137  0023               _Clock_setup:
 141                     ; 45 	CLK_DeInit();   
 143  0023 cd0000        	call	_CLK_DeInit
 145                     ; 46 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 147  0026 4f            	clr	a
 149                     ; 47 }
 152  0027 cc0000        	jp	_CLK_HSIPrescalerConfig
 177                     ; 48 void GPIO_setup(void)
 177                     ; 49 {
 178                     	switch	.text
 179  002a               _GPIO_setup:
 183                     ; 51 	GPIO_DeInit(GPIOD);
 185  002a ae500f        	ldw	x,#20495
 186  002d cd0000        	call	_GPIO_DeInit
 188                     ; 52 	GPIO_DeInit(GPIOC);
 190  0030 ae500a        	ldw	x,#20490
 191  0033 cd0000        	call	_GPIO_DeInit
 193                     ; 53 	GPIO_DeInit(GPIOA);
 195  0036 ae5000        	ldw	x,#20480
 196  0039 cd0000        	call	_GPIO_DeInit
 198                     ; 54 	GPIO_DeInit(GPIOE);
 200  003c ae5014        	ldw	x,#20500
 201  003f cd0000        	call	_GPIO_DeInit
 203                     ; 55 	GPIO_DeInit(GPIOB);   
 205  0042 ae5005        	ldw	x,#20485
 206  0045 cd0000        	call	_GPIO_DeInit
 208                     ; 56 	GPIO_DeInit(GPIOF);
 210  0048 ae5019        	ldw	x,#20505
 211  004b cd0000        	call	_GPIO_DeInit
 213                     ; 58 	GPIO_Init(LED_PORT,LED_PIN,GPIO_MODE_OUT_PP_LOW_FAST);
 215  004e 4be0          	push	#224
 216  0050 4b08          	push	#8
 217  0052 ae5000        	ldw	x,#20480
 218  0055 cd0000        	call	_GPIO_Init
 220  0058 85            	popw	x
 221                     ; 59 	GPIO_Init(GPIOB, GPIO_PIN_4 | GPIO_PIN_5, GPIO_MODE_OUT_OD_HIZ_SLOW);
 223  0059 4b90          	push	#144
 224  005b 4b30          	push	#48
 225  005d ae5005        	ldw	x,#20485
 226  0060 cd0000        	call	_GPIO_Init
 228  0063 85            	popw	x
 229                     ; 60 }
 232  0064 81            	ret	
 274                     	xdef	_main
 275                     	xdef	_GPIO_setup
 276                     	xdef	_Clock_setup
 277                     	switch	.ubsct
 278  0000               _AccX:
 279  0000 00000000      	ds.b	4
 280                     	xdef	_AccX
 281  0004               _DataMPU:
 282  0004 0000          	ds.b	2
 283                     	xdef	_DataMPU
 284  0006               _DataEEprom:
 285  0006 00            	ds.b	1
 286                     	xdef	_DataEEprom
 287                     	xref	_uart1_nline
 288                     	xref	_uart1_number
 289                     	xref	_uart_init
 290                     	xref	_initMPU6050
 291                     	xref	_I2C_Read_MPU6050
 292                     	xref	_I2C_init
 293                     	xref	_delay_ms
 294                     	xref	_delay_config
 295                     	xref	_GPIO_Init
 296                     	xref	_GPIO_DeInit
 297                     	xref	_CLK_HSIPrescalerConfig
 298                     	xref	_CLK_DeInit
 318                     	end
