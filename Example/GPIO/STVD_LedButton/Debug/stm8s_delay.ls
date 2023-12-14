   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
   4                     ; Optimizer V4.3.6 - 29 Nov 2011
  50                     ; 2 void delay_config(void){
  52                     	switch	.text
  53  0000               _delay_config:
  57                     ; 3 	TIM4_TimeBaseInit(TIM4_PRESCALER_128, 125 - 1);
  59  0000 ae077c        	ldw	x,#1916
  60  0003 cd0000        	call	_TIM4_TimeBaseInit
  62                     ; 4 	TIM4_Cmd(ENABLE);
  64  0006 a601          	ld	a,#1
  66                     ; 5 }
  69  0008 cc0000        	jp	_TIM4_Cmd
 106                     ; 6 void delay_ms(unsigned int  u16Delay)
 106                     ; 7 {
 107                     	switch	.text
 108  000b               _delay_ms:
 110  000b 89            	pushw	x
 111       00000000      OFST:	set	0
 114  000c 2016          	jra	L14
 115  000e               L73:
 116                     ; 9 		TIM4_SetCounter(0);
 118  000e 4f            	clr	a
 119  000f cd0000        	call	_TIM4_SetCounter
 121                     ; 10 		TIM4_ClearFlag(TIM4_FLAG_UPDATE);
 123  0012 a601          	ld	a,#1
 124  0014 cd0000        	call	_TIM4_ClearFlag
 127  0017               L74:
 128                     ; 11 		while (TIM4_GetFlagStatus(TIM4_FLAG_UPDATE) == RESET) {
 130  0017 a601          	ld	a,#1
 131  0019 cd0000        	call	_TIM4_GetFlagStatus
 133  001c 4d            	tnz	a
 134  001d 27f8          	jreq	L74
 135                     ; 13 		--u16Delay;
 137  001f 1e01          	ldw	x,(OFST+1,sp)
 138  0021 5a            	decw	x
 139  0022 1f01          	ldw	(OFST+1,sp),x
 140  0024               L14:
 141                     ; 8 	while (u16Delay) {
 143  0024 1e01          	ldw	x,(OFST+1,sp)
 144  0026 26e6          	jrne	L73
 145                     ; 15 }
 148  0028 85            	popw	x
 149  0029 81            	ret	
 162                     	xdef	_delay_ms
 163                     	xdef	_delay_config
 164                     	xref	_TIM4_ClearFlag
 165                     	xref	_TIM4_GetFlagStatus
 166                     	xref	_TIM4_SetCounter
 167                     	xref	_TIM4_Cmd
 168                     	xref	_TIM4_TimeBaseInit
 187                     	end
