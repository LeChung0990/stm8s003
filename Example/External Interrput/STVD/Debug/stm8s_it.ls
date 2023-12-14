   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  45                     ; 53 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  45                     ; 54 {
  46                     	switch	.text
  47  0000               f_NonHandledInterrupt:
  51                     ; 58 }
  54  0000 80            	iret
  76                     ; 66 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  76                     ; 67 {
  77                     	switch	.text
  78  0001               f_TRAP_IRQHandler:
  82                     ; 71 }
  85  0001 80            	iret
 107                     ; 78 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 107                     ; 79 
 107                     ; 80 {
 108                     	switch	.text
 109  0002               f_TLI_IRQHandler:
 113                     ; 84 }
 116  0002 80            	iret
 138                     ; 91 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 138                     ; 92 {
 139                     	switch	.text
 140  0003               f_AWU_IRQHandler:
 144                     ; 96 }
 147  0003 80            	iret
 169                     ; 103 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 169                     ; 104 {
 170                     	switch	.text
 171  0004               f_CLK_IRQHandler:
 175                     ; 108 }
 178  0004 80            	iret
 201                     ; 115 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 201                     ; 116 {
 202                     	switch	.text
 203  0005               f_EXTI_PORTA_IRQHandler:
 207                     ; 120 }
 210  0005 80            	iret
 233                     ; 127 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 233                     ; 128 {
 234                     	switch	.text
 235  0006               f_EXTI_PORTB_IRQHandler:
 239                     ; 132 }
 242  0006 80            	iret
 265                     ; 139 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 265                     ; 140 {
 266                     	switch	.text
 267  0007               f_EXTI_PORTC_IRQHandler:
 271                     ; 144 }
 274  0007 80            	iret
 298                     ; 151 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 298                     ; 152 {
 299                     	switch	.text
 300  0008               f_EXTI_PORTD_IRQHandler:
 302  0008 8a            	push	cc
 303  0009 84            	pop	a
 304  000a a4bf          	and	a,#191
 305  000c 88            	push	a
 306  000d 86            	pop	cc
 307  000e 3b0002        	push	c_x+2
 308  0011 be00          	ldw	x,c_x
 309  0013 89            	pushw	x
 310  0014 3b0002        	push	c_y+2
 311  0017 be00          	ldw	x,c_y
 312  0019 89            	pushw	x
 315                     ; 156 	GPIO_WriteReverse(GPIOA, GPIO_PIN_3);
 317  001a 4b08          	push	#8
 318  001c ae5000        	ldw	x,#20480
 319  001f cd0000        	call	_GPIO_WriteReverse
 321  0022 84            	pop	a
 322                     ; 157 }
 325  0023 85            	popw	x
 326  0024 bf00          	ldw	c_y,x
 327  0026 320002        	pop	c_y+2
 328  0029 85            	popw	x
 329  002a bf00          	ldw	c_x,x
 330  002c 320002        	pop	c_x+2
 331  002f 80            	iret
 354                     ; 164 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 354                     ; 165 {
 355                     	switch	.text
 356  0030               f_EXTI_PORTE_IRQHandler:
 360                     ; 169 }
 363  0030 80            	iret
 385                     ; 216 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 385                     ; 217 {
 386                     	switch	.text
 387  0031               f_SPI_IRQHandler:
 391                     ; 221 }
 394  0031 80            	iret
 417                     ; 228 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 417                     ; 229 {
 418                     	switch	.text
 419  0032               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 423                     ; 233 }
 426  0032 80            	iret
 449                     ; 240 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 449                     ; 241 {
 450                     	switch	.text
 451  0033               f_TIM1_CAP_COM_IRQHandler:
 455                     ; 245 }
 458  0033 80            	iret
 481                     ; 278  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 481                     ; 279  {
 482                     	switch	.text
 483  0034               f_TIM2_UPD_OVF_BRK_IRQHandler:
 487                     ; 283  }
 490  0034 80            	iret
 513                     ; 290  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 513                     ; 291  {
 514                     	switch	.text
 515  0035               f_TIM2_CAP_COM_IRQHandler:
 519                     ; 295  }
 522  0035 80            	iret
 545                     ; 332  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 545                     ; 333  {
 546                     	switch	.text
 547  0036               f_UART1_TX_IRQHandler:
 551                     ; 337  }
 554  0036 80            	iret
 577                     ; 344  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 577                     ; 345  {
 578                     	switch	.text
 579  0037               f_UART1_RX_IRQHandler:
 583                     ; 349  }
 586  0037 80            	iret
 608                     ; 383 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 608                     ; 384 {
 609                     	switch	.text
 610  0038               f_I2C_IRQHandler:
 614                     ; 388 }
 617  0038 80            	iret
 639                     ; 462  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 639                     ; 463  {
 640                     	switch	.text
 641  0039               f_ADC1_IRQHandler:
 645                     ; 467  }
 648  0039 80            	iret
 671                     ; 488  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 671                     ; 489  {
 672                     	switch	.text
 673  003a               f_TIM4_UPD_OVF_IRQHandler:
 677                     ; 493  }
 680  003a 80            	iret
 703                     ; 501 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 703                     ; 502 {
 704                     	switch	.text
 705  003b               f_EEPROM_EEC_IRQHandler:
 709                     ; 506 }
 712  003b 80            	iret
 724                     	xdef	f_EEPROM_EEC_IRQHandler
 725                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 726                     	xdef	f_ADC1_IRQHandler
 727                     	xdef	f_I2C_IRQHandler
 728                     	xdef	f_UART1_RX_IRQHandler
 729                     	xdef	f_UART1_TX_IRQHandler
 730                     	xdef	f_TIM2_CAP_COM_IRQHandler
 731                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 732                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 733                     	xdef	f_TIM1_CAP_COM_IRQHandler
 734                     	xdef	f_SPI_IRQHandler
 735                     	xdef	f_EXTI_PORTE_IRQHandler
 736                     	xdef	f_EXTI_PORTD_IRQHandler
 737                     	xdef	f_EXTI_PORTC_IRQHandler
 738                     	xdef	f_EXTI_PORTB_IRQHandler
 739                     	xdef	f_EXTI_PORTA_IRQHandler
 740                     	xdef	f_CLK_IRQHandler
 741                     	xdef	f_AWU_IRQHandler
 742                     	xdef	f_TLI_IRQHandler
 743                     	xdef	f_TRAP_IRQHandler
 744                     	xdef	f_NonHandledInterrupt
 745                     	xref	_GPIO_WriteReverse
 746                     	xref.b	c_x
 747                     	xref.b	c_y
 766                     	end
