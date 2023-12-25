   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
   4                     ; Optimizer V4.3.6 - 29 Nov 2011
  49                     ; 53 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  49                     ; 54 {
  50                     	switch	.text
  51  0000               f_NonHandledInterrupt:
  55                     ; 58 }
  58  0000 80            	iret	
  80                     ; 66 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  80                     ; 67 {
  81                     	switch	.text
  82  0001               f_TRAP_IRQHandler:
  86                     ; 71 }
  89  0001 80            	iret	
 111                     ; 78 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 111                     ; 79 
 111                     ; 80 {
 112                     	switch	.text
 113  0002               f_TLI_IRQHandler:
 117                     ; 84 }
 120  0002 80            	iret	
 142                     ; 91 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 142                     ; 92 {
 143                     	switch	.text
 144  0003               f_AWU_IRQHandler:
 148                     ; 96 }
 151  0003 80            	iret	
 173                     ; 103 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 173                     ; 104 {
 174                     	switch	.text
 175  0004               f_CLK_IRQHandler:
 179                     ; 108 }
 182  0004 80            	iret	
 205                     ; 115 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 205                     ; 116 {
 206                     	switch	.text
 207  0005               f_EXTI_PORTA_IRQHandler:
 211                     ; 120 }
 214  0005 80            	iret	
 237                     ; 127 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 237                     ; 128 {
 238                     	switch	.text
 239  0006               f_EXTI_PORTB_IRQHandler:
 243                     ; 132 }
 246  0006 80            	iret	
 269                     ; 139 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 269                     ; 140 {
 270                     	switch	.text
 271  0007               f_EXTI_PORTC_IRQHandler:
 275                     ; 144 }
 278  0007 80            	iret	
 302                     ; 151 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 302                     ; 152 {
 303                     	switch	.text
 304  0008               f_EXTI_PORTD_IRQHandler:
 306  0008 8a            	push	cc
 307  0009 84            	pop	a
 308  000a a4bf          	and	a,#191
 309  000c 88            	push	a
 310  000d 86            	pop	cc
 311  000e 3b0002        	push	c_x+2
 312  0011 be00          	ldw	x,c_x
 313  0013 89            	pushw	x
 314  0014 3b0002        	push	c_y+2
 315  0017 be00          	ldw	x,c_y
 316  0019 89            	pushw	x
 319                     ; 156 	GPIO_WriteReverse(GPIOD, GPIO_PIN_3);
 321  001a 4b08          	push	#8
 322  001c ae500f        	ldw	x,#20495
 323  001f cd0000        	call	_GPIO_WriteReverse
 325  0022 84            	pop	a
 326                     ; 157 }
 329  0023 85            	popw	x
 330  0024 bf00          	ldw	c_y,x
 331  0026 320002        	pop	c_y+2
 332  0029 85            	popw	x
 333  002a bf00          	ldw	c_x,x
 334  002c 320002        	pop	c_x+2
 335  002f 80            	iret	
 358                     ; 164 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 358                     ; 165 {
 359                     	switch	.text
 360  0030               f_EXTI_PORTE_IRQHandler:
 364                     ; 169 }
 367  0030 80            	iret	
 389                     ; 216 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 389                     ; 217 {
 390                     	switch	.text
 391  0031               f_SPI_IRQHandler:
 395                     ; 221 }
 398  0031 80            	iret	
 421                     ; 228 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 421                     ; 229 {
 422                     	switch	.text
 423  0032               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 427                     ; 233 }
 430  0032 80            	iret	
 453                     ; 240 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 453                     ; 241 {
 454                     	switch	.text
 455  0033               f_TIM1_CAP_COM_IRQHandler:
 459                     ; 245 }
 462  0033 80            	iret	
 485                     ; 278  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 485                     ; 279  {
 486                     	switch	.text
 487  0034               f_TIM2_UPD_OVF_BRK_IRQHandler:
 491                     ; 283  }
 494  0034 80            	iret	
 517                     ; 290  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 517                     ; 291  {
 518                     	switch	.text
 519  0035               f_TIM2_CAP_COM_IRQHandler:
 523                     ; 295  }
 526  0035 80            	iret	
 549                     ; 332  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 549                     ; 333  {
 550                     	switch	.text
 551  0036               f_UART1_TX_IRQHandler:
 555                     ; 337  }
 558  0036 80            	iret	
 581                     ; 344  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 581                     ; 345  {
 582                     	switch	.text
 583  0037               f_UART1_RX_IRQHandler:
 587                     ; 349  }
 590  0037 80            	iret	
 612                     ; 383 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 612                     ; 384 {
 613                     	switch	.text
 614  0038               f_I2C_IRQHandler:
 618                     ; 388 }
 621  0038 80            	iret	
 643                     ; 462  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 643                     ; 463  {
 644                     	switch	.text
 645  0039               f_ADC1_IRQHandler:
 649                     ; 467  }
 652  0039 80            	iret	
 675                     ; 488  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 675                     ; 489  {
 676                     	switch	.text
 677  003a               f_TIM4_UPD_OVF_IRQHandler:
 681                     ; 493  }
 684  003a 80            	iret	
 707                     ; 501 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 707                     ; 502 {
 708                     	switch	.text
 709  003b               f_EEPROM_EEC_IRQHandler:
 713                     ; 506 }
 716  003b 80            	iret	
 728                     	xdef	f_EEPROM_EEC_IRQHandler
 729                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 730                     	xdef	f_ADC1_IRQHandler
 731                     	xdef	f_I2C_IRQHandler
 732                     	xdef	f_UART1_RX_IRQHandler
 733                     	xdef	f_UART1_TX_IRQHandler
 734                     	xdef	f_TIM2_CAP_COM_IRQHandler
 735                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 736                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 737                     	xdef	f_TIM1_CAP_COM_IRQHandler
 738                     	xdef	f_SPI_IRQHandler
 739                     	xdef	f_EXTI_PORTE_IRQHandler
 740                     	xdef	f_EXTI_PORTD_IRQHandler
 741                     	xdef	f_EXTI_PORTC_IRQHandler
 742                     	xdef	f_EXTI_PORTB_IRQHandler
 743                     	xdef	f_EXTI_PORTA_IRQHandler
 744                     	xdef	f_CLK_IRQHandler
 745                     	xdef	f_AWU_IRQHandler
 746                     	xdef	f_TLI_IRQHandler
 747                     	xdef	f_TRAP_IRQHandler
 748                     	xdef	f_NonHandledInterrupt
 749                     	xref	_GPIO_WriteReverse
 750                     	xref.b	c_x
 751                     	xref.b	c_y
 770                     	end
