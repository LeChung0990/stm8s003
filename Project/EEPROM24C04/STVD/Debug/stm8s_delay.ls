   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  46                     ; 2 void delay_config(void){
  48                     	switch	.text
  49  0000               _delay_config:
  53                     ; 3 	TIM4_TimeBaseInit(TIM4_PRESCALER_128, 125 - 1);
  55  0000 ae077c        	ldw	x,#1916
  56  0003 cd0000        	call	_TIM4_TimeBaseInit
  58                     ; 4 	TIM4_Cmd(ENABLE);
  60  0006 a601          	ld	a,#1
  61  0008 cd0000        	call	_TIM4_Cmd
  63                     ; 5 }
  66  000b 81            	ret
 103                     ; 6 void delay_ms(unsigned int  u16Delay)
 103                     ; 7 {
 104                     	switch	.text
 105  000c               _delay_ms:
 107  000c 89            	pushw	x
 108       00000000      OFST:	set	0
 111  000d 2018          	jra	L14
 112  000f               L73:
 113                     ; 9 		TIM4_SetCounter(0);
 115  000f 4f            	clr	a
 116  0010 cd0000        	call	_TIM4_SetCounter
 118                     ; 10 		TIM4_ClearFlag(TIM4_FLAG_UPDATE);
 120  0013 a601          	ld	a,#1
 121  0015 cd0000        	call	_TIM4_ClearFlag
 124  0018               L74:
 125                     ; 11 		while (TIM4_GetFlagStatus(TIM4_FLAG_UPDATE) == RESET) {
 127  0018 a601          	ld	a,#1
 128  001a cd0000        	call	_TIM4_GetFlagStatus
 130  001d 4d            	tnz	a
 131  001e 27f8          	jreq	L74
 132                     ; 13 		--u16Delay;
 134  0020 1e01          	ldw	x,(OFST+1,sp)
 135  0022 1d0001        	subw	x,#1
 136  0025 1f01          	ldw	(OFST+1,sp),x
 137  0027               L14:
 138                     ; 8 	while (u16Delay) {
 140  0027 1e01          	ldw	x,(OFST+1,sp)
 141  0029 26e4          	jrne	L73
 142                     ; 15 }
 145  002b 85            	popw	x
 146  002c 81            	ret
 159                     	xdef	_delay_ms
 160                     	xdef	_delay_config
 161                     	xref	_TIM4_ClearFlag
 162                     	xref	_TIM4_GetFlagStatus
 163                     	xref	_TIM4_SetCounter
 164                     	xref	_TIM4_Cmd
 165                     	xref	_TIM4_TimeBaseInit
 184                     	end
