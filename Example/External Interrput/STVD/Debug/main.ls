   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  48                     ; 19 int main()
  48                     ; 20 {
  50                     	switch	.text
  51  0000               _main:
  55                     ; 21 	Clock_setup();//goi lai ham
  57  0000 ad09          	call	_Clock_setup
  59                     ; 22 	GPIO_setup();//goi lai ham
  61  0002 ad0f          	call	_GPIO_setup
  63                     ; 23 	Exti_Config();
  65  0004 ad3d          	call	_Exti_Config
  67                     ; 24 	delay_config();
  69  0006 cd0000        	call	_delay_config
  71  0009               L12:
  73  0009 20fe          	jra	L12
  98                     ; 36 void Clock_setup(void)
  98                     ; 37 {
  99                     	switch	.text
 100  000b               _Clock_setup:
 104                     ; 39 	CLK_DeInit();   
 106  000b cd0000        	call	_CLK_DeInit
 108                     ; 40 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 110  000e 4f            	clr	a
 111  000f cd0000        	call	_CLK_HSIPrescalerConfig
 113                     ; 41 }
 116  0012 81            	ret
 141                     ; 42 void GPIO_setup(void)
 141                     ; 43 {
 142                     	switch	.text
 143  0013               _GPIO_setup:
 147                     ; 45 	GPIO_DeInit(GPIOD);
 149  0013 ae500f        	ldw	x,#20495
 150  0016 cd0000        	call	_GPIO_DeInit
 152                     ; 46 	GPIO_DeInit(GPIOC);
 154  0019 ae500a        	ldw	x,#20490
 155  001c cd0000        	call	_GPIO_DeInit
 157                     ; 47 	GPIO_DeInit(GPIOA);
 159  001f ae5000        	ldw	x,#20480
 160  0022 cd0000        	call	_GPIO_DeInit
 162                     ; 48 	GPIO_DeInit(GPIOE);
 164  0025 ae5014        	ldw	x,#20500
 165  0028 cd0000        	call	_GPIO_DeInit
 167                     ; 49 	GPIO_DeInit(GPIOB);   
 169  002b ae5005        	ldw	x,#20485
 170  002e cd0000        	call	_GPIO_DeInit
 172                     ; 50 	GPIO_DeInit(GPIOF);
 174  0031 ae5019        	ldw	x,#20505
 175  0034 cd0000        	call	_GPIO_DeInit
 177                     ; 52 	GPIO_Init(LED_PORT,LED1_PIN,GPIO_MODE_OUT_PP_LOW_FAST);
 179  0037 4be0          	push	#224
 180  0039 4b08          	push	#8
 181  003b ae5000        	ldw	x,#20480
 182  003e cd0000        	call	_GPIO_Init
 184  0041 85            	popw	x
 185                     ; 53 }
 188  0042 81            	ret
 215                     ; 54 void Exti_Config(void){
 216                     	switch	.text
 217  0043               _Exti_Config:
 221                     ; 55 	GPIO_Init(GPIOD, GPIO_PIN_4, GPIO_MODE_IN_PU_IT);
 223  0043 4b60          	push	#96
 224  0045 4b10          	push	#16
 225  0047 ae500f        	ldw	x,#20495
 226  004a cd0000        	call	_GPIO_Init
 228  004d 85            	popw	x
 229                     ; 56 	EXTI_DeInit();
 231  004e cd0000        	call	_EXTI_DeInit
 233                     ; 57 	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOD, EXTI_SENSITIVITY_FALL_ONLY);
 235  0051 ae0302        	ldw	x,#770
 236  0054 cd0000        	call	_EXTI_SetExtIntSensitivity
 238                     ; 58 	enableInterrupts();
 241  0057 9a            rim
 243                     ; 59 }
 247  0058 81            	ret
 260                     	xdef	_main
 261                     	xdef	_Exti_Config
 262                     	xdef	_GPIO_setup
 263                     	xdef	_Clock_setup
 264                     	xref	_delay_config
 265                     	xref	_GPIO_Init
 266                     	xref	_GPIO_DeInit
 267                     	xref	_EXTI_SetExtIntSensitivity
 268                     	xref	_EXTI_DeInit
 269                     	xref	_CLK_HSIPrescalerConfig
 270                     	xref	_CLK_DeInit
 289                     	end
