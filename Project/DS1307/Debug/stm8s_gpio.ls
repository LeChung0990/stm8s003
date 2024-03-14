   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
   4                     ; Optimizer V4.3.6 - 29 Nov 2011
 114                     ; 53 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 114                     ; 54 {
 116                     	switch	.text
 117  0000               _GPIO_DeInit:
 121                     ; 55   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 123  0000 7f            	clr	(x)
 124                     ; 56   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 126  0001 6f02          	clr	(2,x)
 127                     ; 57   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 129  0003 6f03          	clr	(3,x)
 130                     ; 58   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 132  0005 6f04          	clr	(4,x)
 133                     ; 59 }
 136  0007 81            	ret	
 376                     ; 71 void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 376                     ; 72 {
 377                     	switch	.text
 378  0008               _GPIO_Init:
 380  0008 89            	pushw	x
 381       00000000      OFST:	set	0
 384                     ; 77   assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
 386                     ; 78   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 388                     ; 81   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 390  0009 7b05          	ld	a,(OFST+5,sp)
 391  000b 43            	cpl	a
 392  000c e404          	and	a,(4,x)
 393  000e e704          	ld	(4,x),a
 394                     ; 87   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 396  0010 7b06          	ld	a,(OFST+6,sp)
 397  0012 2a18          	jrpl	L771
 398                     ; 89     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 400  0014 a510          	bcp	a,#16
 401  0016 2705          	jreq	L102
 402                     ; 91       GPIOx->ODR |= (uint8_t)GPIO_Pin;
 404  0018 f6            	ld	a,(x)
 405  0019 1a05          	or	a,(OFST+5,sp)
 407  001b 2006          	jra	L302
 408  001d               L102:
 409                     ; 95       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 411  001d 1e01          	ldw	x,(OFST+1,sp)
 412  001f 7b05          	ld	a,(OFST+5,sp)
 413  0021 43            	cpl	a
 414  0022 f4            	and	a,(x)
 415  0023               L302:
 416  0023 f7            	ld	(x),a
 417                     ; 98     GPIOx->DDR |= (uint8_t)GPIO_Pin;
 419  0024 1e01          	ldw	x,(OFST+1,sp)
 420  0026 e602          	ld	a,(2,x)
 421  0028 1a05          	or	a,(OFST+5,sp)
 423  002a 2007          	jra	L502
 424  002c               L771:
 425                     ; 103     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 427  002c 1e01          	ldw	x,(OFST+1,sp)
 428  002e 7b05          	ld	a,(OFST+5,sp)
 429  0030 43            	cpl	a
 430  0031 e402          	and	a,(2,x)
 431  0033               L502:
 432  0033 e702          	ld	(2,x),a
 433                     ; 110   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 435  0035 7b06          	ld	a,(OFST+6,sp)
 436  0037 a540          	bcp	a,#64
 437  0039 2706          	jreq	L702
 438                     ; 112     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 440  003b e603          	ld	a,(3,x)
 441  003d 1a05          	or	a,(OFST+5,sp)
 443  003f 2005          	jra	L112
 444  0041               L702:
 445                     ; 116     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 447  0041 7b05          	ld	a,(OFST+5,sp)
 448  0043 43            	cpl	a
 449  0044 e403          	and	a,(3,x)
 450  0046               L112:
 451  0046 e703          	ld	(3,x),a
 452                     ; 123   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 454  0048 7b06          	ld	a,(OFST+6,sp)
 455  004a a520          	bcp	a,#32
 456  004c 2706          	jreq	L312
 457                     ; 125     GPIOx->CR2 |= (uint8_t)GPIO_Pin;
 459  004e e604          	ld	a,(4,x)
 460  0050 1a05          	or	a,(OFST+5,sp)
 462  0052 2005          	jra	L512
 463  0054               L312:
 464                     ; 129     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 466  0054 7b05          	ld	a,(OFST+5,sp)
 467  0056 43            	cpl	a
 468  0057 e404          	and	a,(4,x)
 469  0059               L512:
 470  0059 e704          	ld	(4,x),a
 471                     ; 131 }
 474  005b 85            	popw	x
 475  005c 81            	ret	
 521                     ; 141 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
 521                     ; 142 {
 522                     	switch	.text
 523  005d               _GPIO_Write:
 525  005d 89            	pushw	x
 526       00000000      OFST:	set	0
 529                     ; 143   GPIOx->ODR = PortVal;
 531  005e 1e01          	ldw	x,(OFST+1,sp)
 532  0060 7b05          	ld	a,(OFST+5,sp)
 533  0062 f7            	ld	(x),a
 534                     ; 144 }
 537  0063 85            	popw	x
 538  0064 81            	ret	
 585                     ; 154 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 585                     ; 155 {
 586                     	switch	.text
 587  0065               _GPIO_WriteHigh:
 589  0065 89            	pushw	x
 590       00000000      OFST:	set	0
 593                     ; 156   GPIOx->ODR |= (uint8_t)PortPins;
 595  0066 f6            	ld	a,(x)
 596  0067 1a05          	or	a,(OFST+5,sp)
 597  0069 f7            	ld	(x),a
 598                     ; 157 }
 601  006a 85            	popw	x
 602  006b 81            	ret	
 649                     ; 167 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 649                     ; 168 {
 650                     	switch	.text
 651  006c               _GPIO_WriteLow:
 653  006c 89            	pushw	x
 654       00000000      OFST:	set	0
 657                     ; 169   GPIOx->ODR &= (uint8_t)(~PortPins);
 659  006d 7b05          	ld	a,(OFST+5,sp)
 660  006f 43            	cpl	a
 661  0070 f4            	and	a,(x)
 662  0071 f7            	ld	(x),a
 663                     ; 170 }
 666  0072 85            	popw	x
 667  0073 81            	ret	
 714                     ; 180 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 714                     ; 181 {
 715                     	switch	.text
 716  0074               _GPIO_WriteReverse:
 718  0074 89            	pushw	x
 719       00000000      OFST:	set	0
 722                     ; 182   GPIOx->ODR ^= (uint8_t)PortPins;
 724  0075 f6            	ld	a,(x)
 725  0076 1805          	xor	a,(OFST+5,sp)
 726  0078 f7            	ld	(x),a
 727                     ; 183 }
 730  0079 85            	popw	x
 731  007a 81            	ret	
 769                     ; 191 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 769                     ; 192 {
 770                     	switch	.text
 771  007b               _GPIO_ReadOutputData:
 775                     ; 193   return ((uint8_t)GPIOx->ODR);
 777  007b f6            	ld	a,(x)
 780  007c 81            	ret	
 817                     ; 202 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 817                     ; 203 {
 818                     	switch	.text
 819  007d               _GPIO_ReadInputData:
 823                     ; 204   return ((uint8_t)GPIOx->IDR);
 825  007d e601          	ld	a,(1,x)
 828  007f 81            	ret	
 896                     ; 213 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 896                     ; 214 {
 897                     	switch	.text
 898  0080               _GPIO_ReadInputPin:
 900  0080 89            	pushw	x
 901       00000000      OFST:	set	0
 904                     ; 215   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
 906  0081 e601          	ld	a,(1,x)
 907  0083 1405          	and	a,(OFST+5,sp)
 910  0085 85            	popw	x
 911  0086 81            	ret	
 989                     ; 225 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
 989                     ; 226 {
 990                     	switch	.text
 991  0087               _GPIO_ExternalPullUpConfig:
 993  0087 89            	pushw	x
 994       00000000      OFST:	set	0
 997                     ; 228   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 999                     ; 229   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1001                     ; 231   if (NewState != DISABLE) /* External Pull-Up Set*/
1003  0088 7b06          	ld	a,(OFST+6,sp)
1004  008a 2706          	jreq	L374
1005                     ; 233     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
1007  008c e603          	ld	a,(3,x)
1008  008e 1a05          	or	a,(OFST+5,sp)
1010  0090 2007          	jra	L574
1011  0092               L374:
1012                     ; 236     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
1014  0092 1e01          	ldw	x,(OFST+1,sp)
1015  0094 7b05          	ld	a,(OFST+5,sp)
1016  0096 43            	cpl	a
1017  0097 e403          	and	a,(3,x)
1018  0099               L574:
1019  0099 e703          	ld	(3,x),a
1020                     ; 238 }
1023  009b 85            	popw	x
1024  009c 81            	ret	
1037                     	xdef	_GPIO_ExternalPullUpConfig
1038                     	xdef	_GPIO_ReadInputPin
1039                     	xdef	_GPIO_ReadOutputData
1040                     	xdef	_GPIO_ReadInputData
1041                     	xdef	_GPIO_WriteReverse
1042                     	xdef	_GPIO_WriteLow
1043                     	xdef	_GPIO_WriteHigh
1044                     	xdef	_GPIO_Write
1045                     	xdef	_GPIO_Init
1046                     	xdef	_GPIO_DeInit
1065                     	end
