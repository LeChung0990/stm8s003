   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
   4                     ; Optimizer V4.3.6 - 29 Nov 2011
  62                     ; 21 int main()
  62                     ; 22 {
  64                     	switch	.text
  65  0000               _main:
  69                     ; 23 	Clock_setup();//goi lai ham
  71  0000 ad43          	call	_Clock_setup
  73                     ; 24 	GPIO_setup();//goi lai ham
  75  0002 ad48          	call	_GPIO_setup
  77                     ; 25 	delay_config();
  79  0004 cd0000        	call	_delay_config
  81                     ; 26 	I2C_init();
  83  0007 cd0000        	call	_I2C_init
  85                     ; 27 	uart_init();
  87  000a cd0000        	call	_uart_init
  89                     ; 28 	initMPU6050();
  91  000d cd0000        	call	_initMPU6050
  93  0010               L12:
  94                     ; 31 		DataEEprom = I2C_Read_Eeprom();
  96  0010 cd0000        	call	_I2C_Read_Eeprom
  98  0013 b706          	ld	_DataEEprom,a
  99                     ; 32 		DataMPU = I2C_Read_MPU6050();
 101  0015 cd0000        	call	_I2C_Read_MPU6050
 103  0018 bf04          	ldw	_DataMPU,x
 104                     ; 34 		AccX = DataMPU/4096.0;
 106  001a cd0000        	call	c_uitof
 108  001d ae0004        	ldw	x,#L13
 109  0020 cd0000        	call	c_fdiv
 111  0023 ae0000        	ldw	x,#_AccX
 112  0026 cd0000        	call	c_rtol
 114                     ; 35 		AccX = AccX * 100;
 116  0029 ae0000        	ldw	x,#L14
 117  002c cd0000        	call	c_ltor
 119  002f ae0000        	ldw	x,#_AccX
 120  0032 cd0000        	call	c_fgmul
 122                     ; 36 		uart1_number((int)DataMPU);
 124  0035 be04          	ldw	x,_DataMPU
 125  0037 cd0000        	call	_uart1_number
 127                     ; 37 		uart1_nline();
 129  003a cd0000        	call	_uart1_nline
 131                     ; 38 		delay_ms(1000);
 133  003d ae03e8        	ldw	x,#1000
 134  0040 cd0000        	call	_delay_ms
 137  0043 20cb          	jra	L12
 162                     ; 42 void Clock_setup(void)
 162                     ; 43 {
 163                     	switch	.text
 164  0045               _Clock_setup:
 168                     ; 45 	CLK_DeInit();   
 170  0045 cd0000        	call	_CLK_DeInit
 172                     ; 46 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 174  0048 4f            	clr	a
 176                     ; 47 }
 179  0049 cc0000        	jp	_CLK_HSIPrescalerConfig
 204                     ; 48 void GPIO_setup(void)
 204                     ; 49 {
 205                     	switch	.text
 206  004c               _GPIO_setup:
 210                     ; 51 	GPIO_DeInit(GPIOD);
 212  004c ae500f        	ldw	x,#20495
 213  004f cd0000        	call	_GPIO_DeInit
 215                     ; 52 	GPIO_DeInit(GPIOC);
 217  0052 ae500a        	ldw	x,#20490
 218  0055 cd0000        	call	_GPIO_DeInit
 220                     ; 53 	GPIO_DeInit(GPIOA);
 222  0058 ae5000        	ldw	x,#20480
 223  005b cd0000        	call	_GPIO_DeInit
 225                     ; 54 	GPIO_DeInit(GPIOE);
 227  005e ae5014        	ldw	x,#20500
 228  0061 cd0000        	call	_GPIO_DeInit
 230                     ; 55 	GPIO_DeInit(GPIOB);   
 232  0064 ae5005        	ldw	x,#20485
 233  0067 cd0000        	call	_GPIO_DeInit
 235                     ; 56 	GPIO_DeInit(GPIOF);
 237  006a ae5019        	ldw	x,#20505
 238  006d cd0000        	call	_GPIO_DeInit
 240                     ; 58 	GPIO_Init(LED_PORT,LED_PIN,GPIO_MODE_OUT_PP_LOW_FAST);
 242  0070 4be0          	push	#224
 243  0072 4b08          	push	#8
 244  0074 ae5000        	ldw	x,#20480
 245  0077 cd0000        	call	_GPIO_Init
 247  007a 85            	popw	x
 248                     ; 59 	GPIO_Init(GPIOB, GPIO_PIN_4 | GPIO_PIN_5, GPIO_MODE_OUT_OD_HIZ_SLOW);
 250  007b 4b90          	push	#144
 251  007d 4b30          	push	#48
 252  007f ae5005        	ldw	x,#20485
 253  0082 cd0000        	call	_GPIO_Init
 255  0085 85            	popw	x
 256                     ; 60 }
 259  0086 81            	ret	
 301                     	xdef	_main
 302                     	xdef	_GPIO_setup
 303                     	xdef	_Clock_setup
 304                     	switch	.ubsct
 305  0000               _AccX:
 306  0000 00000000      	ds.b	4
 307                     	xdef	_AccX
 308  0004               _DataMPU:
 309  0004 0000          	ds.b	2
 310                     	xdef	_DataMPU
 311  0006               _DataEEprom:
 312  0006 00            	ds.b	1
 313                     	xdef	_DataEEprom
 314                     	xref	_uart1_nline
 315                     	xref	_uart1_number
 316                     	xref	_uart_init
 317                     	xref	_initMPU6050
 318                     	xref	_I2C_Read_Eeprom
 319                     	xref	_I2C_Read_MPU6050
 320                     	xref	_I2C_init
 321                     	xref	_delay_ms
 322                     	xref	_delay_config
 323                     	xref	_GPIO_Init
 324                     	xref	_GPIO_DeInit
 325                     	xref	_CLK_HSIPrescalerConfig
 326                     	xref	_CLK_DeInit
 327                     .const:	section	.text
 328  0000               L14:
 329  0000 42c80000      	dc.w	17096,0
 330  0004               L13:
 331  0004 45800000      	dc.w	17792,0
 332                     	xref.b	c_x
 352                     	xref	c_fgmul
 353                     	xref	c_ltor
 354                     	xref	c_rtol
 355                     	xref	c_fdiv
 356                     	xref	c_uitof
 357                     	end
