   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  45                     ; 57 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  45                     ; 58 {
  46                     	switch	.text
  47  0000               f_NonHandledInterrupt:
  51                     ; 62 }
  54  0000 80            	iret
  76                     ; 70 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  76                     ; 71 {
  77                     	switch	.text
  78  0001               f_TRAP_IRQHandler:
  82                     ; 75 }
  85  0001 80            	iret
 107                     ; 82 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 107                     ; 83 
 107                     ; 84 {
 108                     	switch	.text
 109  0002               f_TLI_IRQHandler:
 113                     ; 88 }
 116  0002 80            	iret
 138                     ; 95 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 138                     ; 96 {
 139                     	switch	.text
 140  0003               f_AWU_IRQHandler:
 144                     ; 100 }
 147  0003 80            	iret
 169                     ; 107 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 169                     ; 108 {
 170                     	switch	.text
 171  0004               f_CLK_IRQHandler:
 175                     ; 112 }
 178  0004 80            	iret
 201                     ; 119 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 201                     ; 120 {
 202                     	switch	.text
 203  0005               f_EXTI_PORTA_IRQHandler:
 207                     ; 124 }
 210  0005 80            	iret
 233                     ; 131 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 233                     ; 132 {
 234                     	switch	.text
 235  0006               f_EXTI_PORTB_IRQHandler:
 239                     ; 136 }
 242  0006 80            	iret
 265                     ; 143 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 265                     ; 144 {
 266                     	switch	.text
 267  0007               f_EXTI_PORTC_IRQHandler:
 271                     ; 148 }
 274  0007 80            	iret
 301                     ; 155 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 301                     ; 156 {
 302                     	switch	.text
 303  0008               f_EXTI_PORTD_IRQHandler:
 305  0008 8a            	push	cc
 306  0009 84            	pop	a
 307  000a a4bf          	and	a,#191
 308  000c 88            	push	a
 309  000d 86            	pop	cc
 310  000e 3b0002        	push	c_x+2
 311  0011 be00          	ldw	x,c_x
 312  0013 89            	pushw	x
 313  0014 3b0002        	push	c_y+2
 314  0017 be00          	ldw	x,c_y
 315  0019 89            	pushw	x
 318                     ; 160 	if (GPIO_ReadInputPin(BUT_PORT1, BUT_PIN1) == RESET){
 320  001a 4b08          	push	#8
 321  001c ae500f        	ldw	x,#20495
 322  001f cd0000        	call	_GPIO_ReadInputPin
 324  0022 5b01          	addw	sp,#1
 325  0024 4d            	tnz	a
 326  0025 262d          	jrne	L121
 327                     ; 161 		BEEP_Cmd(ENABLE );
 329  0027 a601          	ld	a,#1
 330  0029 cd0000        	call	_BEEP_Cmd
 332                     ; 162 		delay_us(100000);
 334  002c ae86a0        	ldw	x,#34464
 335  002f 89            	pushw	x
 336  0030 ae0001        	ldw	x,#1
 337  0033 89            	pushw	x
 338  0034 cd0000        	call	_delay_us
 340  0037 5b04          	addw	sp,#4
 341                     ; 163 		BEEP_Cmd(DISABLE );
 343  0039 4f            	clr	a
 344  003a cd0000        	call	_BEEP_Cmd
 347  003d               L521:
 348                     ; 164 		while (GPIO_ReadInputPin(BUT_PORT1, BUT_PIN1) == RESET){}
 350  003d 4b08          	push	#8
 351  003f ae500f        	ldw	x,#20495
 352  0042 cd0000        	call	_GPIO_ReadInputPin
 354  0045 5b01          	addw	sp,#1
 355  0047 4d            	tnz	a
 356  0048 27f3          	jreq	L521
 357                     ; 165 		mode++;
 359  004a 3c00          	inc	_mode
 360                     ; 166 		if(mode > 3) mode = 0;
 362  004c b600          	ld	a,_mode
 363  004e a104          	cp	a,#4
 364  0050 2502          	jrult	L121
 367  0052 3f00          	clr	_mode
 368  0054               L121:
 369                     ; 168 }
 372  0054 85            	popw	x
 373  0055 bf00          	ldw	c_y,x
 374  0057 320002        	pop	c_y+2
 375  005a 85            	popw	x
 376  005b bf00          	ldw	c_x,x
 377  005d 320002        	pop	c_x+2
 378  0060 80            	iret
 401                     ; 175 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 401                     ; 176 {
 402                     	switch	.text
 403  0061               f_EXTI_PORTE_IRQHandler:
 407                     ; 180 }
 410  0061 80            	iret
 432                     ; 227 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 432                     ; 228 {
 433                     	switch	.text
 434  0062               f_SPI_IRQHandler:
 438                     ; 232 }
 441  0062 80            	iret
 464                     ; 239 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 464                     ; 240 {
 465                     	switch	.text
 466  0063               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 470                     ; 250 }
 473  0063 80            	iret
 496                     ; 257 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 496                     ; 258 {
 497                     	switch	.text
 498  0064               f_TIM1_CAP_COM_IRQHandler:
 502                     ; 262 }
 505  0064 80            	iret
 528                     ; 295  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 528                     ; 296  {
 529                     	switch	.text
 530  0065               f_TIM2_UPD_OVF_BRK_IRQHandler:
 534                     ; 300  }
 537  0065 80            	iret
 560                     ; 307  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 560                     ; 308  {
 561                     	switch	.text
 562  0066               f_TIM2_CAP_COM_IRQHandler:
 566                     ; 312  }
 569  0066 80            	iret
 592                     ; 349  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 592                     ; 350  {
 593                     	switch	.text
 594  0067               f_UART1_TX_IRQHandler:
 598                     ; 354  }
 601  0067 80            	iret
 624                     ; 361  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 624                     ; 362  {
 625                     	switch	.text
 626  0068               f_UART1_RX_IRQHandler:
 630                     ; 366  }
 633  0068 80            	iret
 655                     ; 400 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 655                     ; 401 {
 656                     	switch	.text
 657  0069               f_I2C_IRQHandler:
 661                     ; 405 }
 664  0069 80            	iret
 686                     ; 479  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 686                     ; 480  {
 687                     	switch	.text
 688  006a               f_ADC1_IRQHandler:
 692                     ; 484  }
 695  006a 80            	iret
 722                     ; 505  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 722                     ; 506  {
 723                     	switch	.text
 724  006b               f_TIM4_UPD_OVF_IRQHandler:
 726  006b 8a            	push	cc
 727  006c 84            	pop	a
 728  006d a4bf          	and	a,#191
 729  006f 88            	push	a
 730  0070 86            	pop	cc
 731  0071 3b0002        	push	c_x+2
 732  0074 be00          	ldw	x,c_x
 733  0076 89            	pushw	x
 734  0077 3b0002        	push	c_y+2
 735  007a be00          	ldw	x,c_y
 736  007c 89            	pushw	x
 739                     ; 511 	counter++;
 741  007d be00          	ldw	x,_counter
 742  007f 1c0001        	addw	x,#1
 743  0082 bf00          	ldw	_counter,x
 744                     ; 512 	if (counter == 1000)
 746  0084 be00          	ldw	x,_counter
 747  0086 a303e8        	cpw	x,#1000
 748  0089 2617          	jrne	L362
 749                     ; 514 		counter = 0;
 751  008b 5f            	clrw	x
 752  008c bf00          	ldw	_counter,x
 753                     ; 515 		ValueSecond++;
 755  008e 3c00          	inc	_ValueSecond
 756                     ; 516 		if (ValueSecond > 59) 
 758  0090 b600          	ld	a,_ValueSecond
 759  0092 a13c          	cp	a,#60
 760  0094 250c          	jrult	L362
 761                     ; 518 			ValueSecond = 0;
 763  0096 3f00          	clr	_ValueSecond
 764                     ; 519 			ValueMinute++;
 766  0098 3c00          	inc	_ValueMinute
 767                     ; 520 			if (ValueMinute > 59) ValueMinute = 0;
 769  009a b600          	ld	a,_ValueMinute
 770  009c a13c          	cp	a,#60
 771  009e 2502          	jrult	L362
 774  00a0 3f00          	clr	_ValueMinute
 775  00a2               L362:
 776                     ; 524 	TIM4_ClearITPendingBit(TIM4_IT_UPDATE); 
 778  00a2 a601          	ld	a,#1
 779  00a4 cd0000        	call	_TIM4_ClearITPendingBit
 781                     ; 525  }
 784  00a7 85            	popw	x
 785  00a8 bf00          	ldw	c_y,x
 786  00aa 320002        	pop	c_y+2
 787  00ad 85            	popw	x
 788  00ae bf00          	ldw	c_x,x
 789  00b0 320002        	pop	c_x+2
 790  00b3 80            	iret
 813                     ; 533 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 813                     ; 534 {
 814                     	switch	.text
 815  00b4               f_EEPROM_EEC_IRQHandler:
 819                     ; 538 }
 822  00b4 80            	iret
 845                     	xref.b	_mode
 846                     	xref.b	_ValueMinute
 847                     	xref.b	_ValueSecond
 848                     	switch	.ubsct
 849  0000               _counter:
 850  0000 0000          	ds.b	2
 851                     	xdef	_counter
 852                     	xdef	f_EEPROM_EEC_IRQHandler
 853                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 854                     	xdef	f_ADC1_IRQHandler
 855                     	xdef	f_I2C_IRQHandler
 856                     	xdef	f_UART1_RX_IRQHandler
 857                     	xdef	f_UART1_TX_IRQHandler
 858                     	xdef	f_TIM2_CAP_COM_IRQHandler
 859                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 860                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 861                     	xdef	f_TIM1_CAP_COM_IRQHandler
 862                     	xdef	f_SPI_IRQHandler
 863                     	xdef	f_EXTI_PORTE_IRQHandler
 864                     	xdef	f_EXTI_PORTD_IRQHandler
 865                     	xdef	f_EXTI_PORTC_IRQHandler
 866                     	xdef	f_EXTI_PORTB_IRQHandler
 867                     	xdef	f_EXTI_PORTA_IRQHandler
 868                     	xdef	f_CLK_IRQHandler
 869                     	xdef	f_AWU_IRQHandler
 870                     	xdef	f_TLI_IRQHandler
 871                     	xdef	f_TRAP_IRQHandler
 872                     	xdef	f_NonHandledInterrupt
 873                     	xref	_delay_us
 874                     	xref	_TIM4_ClearITPendingBit
 875                     	xref	_GPIO_ReadInputPin
 876                     	xref	_BEEP_Cmd
 877                     	xref.b	c_x
 878                     	xref.b	c_y
 898                     	end
