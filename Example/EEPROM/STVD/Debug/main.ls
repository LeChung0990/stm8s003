   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  51                     ; 18 int main()
  51                     ; 19 {
  53                     	switch	.text
  54  0000               _main:
  58                     ; 20 	Clock_setup();//goi lai ham
  60  0000 ad2f          	call	_Clock_setup
  62                     ; 21 	GPIO_setup();//goi lai ham
  64  0002 ad35          	call	_GPIO_setup
  66                     ; 22 	delay_config();
  68  0004 cd0000        	call	_delay_config
  70                     ; 23 	Write_EEPROM(0xff);
  72  0007 a6ff          	ld	a,#255
  73  0009 ad5e          	call	_Write_EEPROM
  75                     ; 24 	if(Read_EEPROM(0x4000) == 255) GPIO_WriteHigh(LED_PORT, GPIO_PIN_3);	/*Nhap nhay LED tai chan PD3*/
  77  000b ae4000        	ldw	x,#16384
  78  000e 89            	pushw	x
  79  000f ae0000        	ldw	x,#0
  80  0012 89            	pushw	x
  81  0013 ad71          	call	_Read_EEPROM
  83  0015 5b04          	addw	sp,#4
  84  0017 a1ff          	cp	a,#255
  85  0019 260b          	jrne	L12
  88  001b 4b08          	push	#8
  89  001d ae5000        	ldw	x,#20480
  90  0020 cd0000        	call	_GPIO_WriteHigh
  92  0023 84            	pop	a
  94  0024 2009          	jra	L52
  95  0026               L12:
  96                     ; 25 	else GPIO_WriteLow(LED_PORT, GPIO_PIN_3);
  98  0026 4b08          	push	#8
  99  0028 ae5000        	ldw	x,#20480
 100  002b cd0000        	call	_GPIO_WriteLow
 102  002e 84            	pop	a
 103  002f               L52:
 105  002f 20fe          	jra	L52
 130                     ; 32 void Clock_setup()
 130                     ; 33 {
 131                     	switch	.text
 132  0031               _Clock_setup:
 136                     ; 35 			CLK_DeInit();   
 138  0031 cd0000        	call	_CLK_DeInit
 140                     ; 36 			CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 142  0034 4f            	clr	a
 143  0035 cd0000        	call	_CLK_HSIPrescalerConfig
 145                     ; 37 }
 148  0038 81            	ret
 173                     ; 38 void GPIO_setup()
 173                     ; 39 {
 174                     	switch	.text
 175  0039               _GPIO_setup:
 179                     ; 41 	    GPIO_DeInit(GPIOD);
 181  0039 ae500f        	ldw	x,#20495
 182  003c cd0000        	call	_GPIO_DeInit
 184                     ; 42       GPIO_DeInit(GPIOC);
 186  003f ae500a        	ldw	x,#20490
 187  0042 cd0000        	call	_GPIO_DeInit
 189                     ; 43       GPIO_DeInit(GPIOA);
 191  0045 ae5000        	ldw	x,#20480
 192  0048 cd0000        	call	_GPIO_DeInit
 194                     ; 44       GPIO_DeInit(GPIOE);
 196  004b ae5014        	ldw	x,#20500
 197  004e cd0000        	call	_GPIO_DeInit
 199                     ; 45       GPIO_DeInit(GPIOB);   
 201  0051 ae5005        	ldw	x,#20485
 202  0054 cd0000        	call	_GPIO_DeInit
 204                     ; 46       GPIO_DeInit(GPIOF);
 206  0057 ae5019        	ldw	x,#20505
 207  005a cd0000        	call	_GPIO_DeInit
 209                     ; 48       GPIO_Init(LED_PORT,LED1_PIN,GPIO_MODE_OUT_PP_LOW_FAST);
 211  005d 4be0          	push	#224
 212  005f 4b08          	push	#8
 213  0061 ae5000        	ldw	x,#20480
 214  0064 cd0000        	call	_GPIO_Init
 216  0067 85            	popw	x
 217                     ; 49 }
 220  0068 81            	ret
 257                     ; 50 void Write_EEPROM(uint8_t Data){
 258                     	switch	.text
 259  0069               _Write_EEPROM:
 261  0069 88            	push	a
 262       00000000      OFST:	set	0
 265                     ; 51 	FLASH_Unlock(FLASH_MEMTYPE_DATA);
 267  006a a6f7          	ld	a,#247
 268  006c cd0000        	call	_FLASH_Unlock
 270                     ; 52 	FLASH_ProgramByte(0x4000, Data);
 272  006f 7b01          	ld	a,(OFST+1,sp)
 273  0071 88            	push	a
 274  0072 ae4000        	ldw	x,#16384
 275  0075 89            	pushw	x
 276  0076 ae0000        	ldw	x,#0
 277  0079 89            	pushw	x
 278  007a cd0000        	call	_FLASH_ProgramByte
 280  007d 5b05          	addw	sp,#5
 281                     ; 53 	FLASH_Lock(FLASH_MEMTYPE_DATA);
 283  007f a6f7          	ld	a,#247
 284  0081 cd0000        	call	_FLASH_Lock
 286                     ; 54 }
 289  0084 84            	pop	a
 290  0085 81            	ret
 334                     ; 55 uint8_t Read_EEPROM(uint32_t Address){
 335                     	switch	.text
 336  0086               _Read_EEPROM:
 338  0086 88            	push	a
 339       00000001      OFST:	set	1
 342                     ; 57 	Data = FLASH_ReadByte(Address);
 344  0087 1e06          	ldw	x,(OFST+5,sp)
 345  0089 89            	pushw	x
 346  008a 1e06          	ldw	x,(OFST+5,sp)
 347  008c 89            	pushw	x
 348  008d cd0000        	call	_FLASH_ReadByte
 350  0090 5b04          	addw	sp,#4
 351  0092 6b01          	ld	(OFST+0,sp),a
 352                     ; 58 	return Data;
 354  0094 7b01          	ld	a,(OFST+0,sp)
 357  0096 5b01          	addw	sp,#1
 358  0098 81            	ret
 371                     	xdef	_main
 372                     	xdef	_Read_EEPROM
 373                     	xdef	_Write_EEPROM
 374                     	xdef	_GPIO_setup
 375                     	xdef	_Clock_setup
 376                     	xref	_delay_config
 377                     	xref	_GPIO_WriteLow
 378                     	xref	_GPIO_WriteHigh
 379                     	xref	_GPIO_Init
 380                     	xref	_GPIO_DeInit
 381                     	xref	_FLASH_ReadByte
 382                     	xref	_FLASH_ProgramByte
 383                     	xref	_FLASH_Lock
 384                     	xref	_FLASH_Unlock
 385                     	xref	_CLK_HSIPrescalerConfig
 386                     	xref	_CLK_DeInit
 405                     	end
