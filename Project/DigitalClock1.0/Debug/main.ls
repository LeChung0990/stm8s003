   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  16                     	bsct
  17  0000               _buffer:
  18  0000 00            	dc.b	0
  19  0001 00            	dc.b	0
  20  0002 00            	dc.b	0
  21  0003 00            	dc.b	0
  22  0004 00            	dc.b	0
  23  0005 00            	dc.b	0
  24  0006 00            	dc.b	0
  25  0007 00            	dc.b	0
  26  0008 00            	dc.b	0
  27  0009 00            	dc.b	0
  28  000a 00            	dc.b	0
  29  000b 00            	dc.b	0
  30  000c 00            	dc.b	0
  31  000d 00            	dc.b	0
  32  000e               _hour:
  33  000e 00            	dc.b	0
  34  000f               _minute:
  35  000f 00            	dc.b	0
  36  0010               _second:
  37  0010 00            	dc.b	0
  38  0011               _date:
  39  0011 00            	dc.b	0
  40  0012               _month:
  41  0012 00            	dc.b	0
  42  0013               _hourAlam:
  43  0013 00            	dc.b	0
  44  0014               _minuteAlam:
  45  0014 00            	dc.b	0
  46  0015               _StatusAlam:
  47  0015 00            	dc.b	0
  48  0016               _mode:
  49  0016 00            	dc.b	0
 111                     ; 31 int main()
 111                     ; 32 {
 113                     	switch	.text
 114  0000               _main:
 118                     ; 33 	Clock_setup();
 120  0000 cd0410        	call	_Clock_setup
 122                     ; 34 	GPIO_setup();
 124  0003 cd0418        	call	_GPIO_setup
 126                     ; 35 	delay_config();
 128  0006 cd0000        	call	_delay_config
 130                     ; 36 	Exti_Config();
 132  0009 cd0474        	call	_Exti_Config
 134                     ; 37 	TM1628_INIT(1,1);
 136  000c ae0101        	ldw	x,#257
 137  000f cd0000        	call	_TM1628_INIT
 139                     ; 38 	I2C_init();
 141  0012 cd0000        	call	_I2C_init
 143                     ; 40 	BEEP_DeInit();
 145  0015 cd0000        	call	_BEEP_DeInit
 147                     ; 41 	BEEP_Init(BEEP_FREQUENCY_4KHZ);
 149  0018 a680          	ld	a,#128
 150  001a cd0000        	call	_BEEP_Init
 152                     ; 42 	BEEP_Cmd(DISABLE );
 154  001d 4f            	clr	a
 155  001e cd0000        	call	_BEEP_Cmd
 157                     ; 44 	for(i=0; i< 14; ++i)
 159  0021 3f03          	clr	_i
 160  0023               L12:
 161                     ; 46 		TM1628_display_segments(i,0,0); 
 163  0023 4b00          	push	#0
 164  0025 5f            	clrw	x
 165  0026 b603          	ld	a,_i
 166  0028 95            	ld	xh,a
 167  0029 cd0000        	call	_TM1628_display_segments
 169  002c 84            	pop	a
 170                     ; 44 	for(i=0; i< 14; ++i)
 172  002d 3c03          	inc	_i
 175  002f b603          	ld	a,_i
 176  0031 a10e          	cp	a,#14
 177  0033 25ee          	jrult	L12
 178                     ; 48 	BEEP_Cmd(DISABLE );
 180  0035 4f            	clr	a
 181  0036 cd0000        	call	_BEEP_Cmd
 183  0039               L72:
 184                     ; 58 		hour = ReadData(0x02);
 186  0039 a602          	ld	a,#2
 187  003b cd0000        	call	_ReadData
 189  003e b70e          	ld	_hour,a
 190                     ; 59 		minute = ReadData(0x01);
 192  0040 a601          	ld	a,#1
 193  0042 cd0000        	call	_ReadData
 195  0045 b70f          	ld	_minute,a
 196                     ; 60 		second = ReadData(0x00);
 198  0047 4f            	clr	a
 199  0048 cd0000        	call	_ReadData
 201  004b b710          	ld	_second,a
 202                     ; 62 		if (GPIO_ReadInputPin(BUT_PORT2, BUT_PIN2) == RESET){
 204  004d 4b04          	push	#4
 205  004f ae500f        	ldw	x,#20495
 206  0052 cd0000        	call	_GPIO_ReadInputPin
 208  0055 5b01          	addw	sp,#1
 209  0057 4d            	tnz	a
 210  0058 2644          	jrne	L33
 211                     ; 63 			date = ReadData(0x04);
 213  005a a604          	ld	a,#4
 214  005c cd0000        	call	_ReadData
 216  005f b711          	ld	_date,a
 217                     ; 64 			month = ReadData(0x05);
 219  0061 a605          	ld	a,#5
 220  0063 cd0000        	call	_ReadData
 222  0066 b712          	ld	_month,a
 223                     ; 65 			buffer[0] = date / 10;
 225  0068 b611          	ld	a,_date
 226  006a 5f            	clrw	x
 227  006b 97            	ld	xl,a
 228  006c a60a          	ld	a,#10
 229  006e cd0000        	call	c_sdivx
 231  0071 01            	rrwa	x,a
 232  0072 b700          	ld	_buffer,a
 233  0074 02            	rlwa	x,a
 234                     ; 66 			buffer[2] = date % 10;
 236  0075 b611          	ld	a,_date
 237  0077 5f            	clrw	x
 238  0078 97            	ld	xl,a
 239  0079 a60a          	ld	a,#10
 240  007b cd0000        	call	c_smodx
 242  007e 01            	rrwa	x,a
 243  007f b702          	ld	_buffer+2,a
 244  0081 02            	rlwa	x,a
 245                     ; 67 			buffer[4] = month / 10;
 247  0082 b612          	ld	a,_month
 248  0084 5f            	clrw	x
 249  0085 97            	ld	xl,a
 250  0086 a60a          	ld	a,#10
 251  0088 cd0000        	call	c_sdivx
 253  008b 01            	rrwa	x,a
 254  008c b704          	ld	_buffer+4,a
 255  008e 02            	rlwa	x,a
 256                     ; 68 			buffer[6] = month % 10;
 258  008f b612          	ld	a,_month
 259  0091 5f            	clrw	x
 260  0092 97            	ld	xl,a
 261  0093 a60a          	ld	a,#10
 262  0095 cd0000        	call	c_smodx
 264  0098 01            	rrwa	x,a
 265  0099 b706          	ld	_buffer+6,a
 266  009b 02            	rlwa	x,a
 268  009c 2034          	jra	L53
 269  009e               L33:
 270                     ; 70 			buffer[0] = hour / 10;
 272  009e b60e          	ld	a,_hour
 273  00a0 5f            	clrw	x
 274  00a1 97            	ld	xl,a
 275  00a2 a60a          	ld	a,#10
 276  00a4 cd0000        	call	c_sdivx
 278  00a7 01            	rrwa	x,a
 279  00a8 b700          	ld	_buffer,a
 280  00aa 02            	rlwa	x,a
 281                     ; 71 			buffer[2] = hour % 10;
 283  00ab b60e          	ld	a,_hour
 284  00ad 5f            	clrw	x
 285  00ae 97            	ld	xl,a
 286  00af a60a          	ld	a,#10
 287  00b1 cd0000        	call	c_smodx
 289  00b4 01            	rrwa	x,a
 290  00b5 b702          	ld	_buffer+2,a
 291  00b7 02            	rlwa	x,a
 292                     ; 72 			buffer[4] = minute / 10;
 294  00b8 b60f          	ld	a,_minute
 295  00ba 5f            	clrw	x
 296  00bb 97            	ld	xl,a
 297  00bc a60a          	ld	a,#10
 298  00be cd0000        	call	c_sdivx
 300  00c1 01            	rrwa	x,a
 301  00c2 b704          	ld	_buffer+4,a
 302  00c4 02            	rlwa	x,a
 303                     ; 73 			buffer[6] = minute % 10;
 305  00c5 b60f          	ld	a,_minute
 306  00c7 5f            	clrw	x
 307  00c8 97            	ld	xl,a
 308  00c9 a60a          	ld	a,#10
 309  00cb cd0000        	call	c_smodx
 311  00ce 01            	rrwa	x,a
 312  00cf b706          	ld	_buffer+6,a
 313  00d1 02            	rlwa	x,a
 314  00d2               L53:
 315                     ; 76 		if (GPIO_ReadInputPin(BUT_PORT3, BUT_PIN3) == RESET){
 317  00d2 4b80          	push	#128
 318  00d4 ae500a        	ldw	x,#20490
 319  00d7 cd0000        	call	_GPIO_ReadInputPin
 321  00da 5b01          	addw	sp,#1
 322  00dc 4d            	tnz	a
 323  00dd 2646          	jrne	L73
 324                     ; 77 			BEEP_Cmd(ENABLE );
 326  00df a601          	ld	a,#1
 327  00e1 cd0000        	call	_BEEP_Cmd
 329                     ; 78 			delay_us(50000);
 331  00e4 aec350        	ldw	x,#50000
 332  00e7 89            	pushw	x
 333  00e8 ae0000        	ldw	x,#0
 334  00eb 89            	pushw	x
 335  00ec cd0000        	call	_delay_us
 337  00ef 5b04          	addw	sp,#4
 338                     ; 79 			BEEP_Cmd(DISABLE );
 340  00f1 4f            	clr	a
 341  00f2 cd0000        	call	_BEEP_Cmd
 344  00f5               L34:
 345                     ; 80 			while (GPIO_ReadInputPin(BUT_PORT3, BUT_PIN3) == RESET){}
 347  00f5 4b80          	push	#128
 348  00f7 ae500a        	ldw	x,#20490
 349  00fa cd0000        	call	_GPIO_ReadInputPin
 351  00fd 5b01          	addw	sp,#1
 352  00ff 4d            	tnz	a
 353  0100 27f3          	jreq	L34
 354                     ; 81 			StatusAlam = ! StatusAlam;
 356  0102 3d15          	tnz	_StatusAlam
 357  0104 2604          	jrne	L6
 358  0106 a601          	ld	a,#1
 359  0108 2001          	jra	L01
 360  010a               L6:
 361  010a 4f            	clr	a
 362  010b               L01:
 363  010b b715          	ld	_StatusAlam,a
 364                     ; 82 			if (StatusAlam){
 366  010d 3d15          	tnz	_StatusAlam
 367  010f 270b          	jreq	L74
 368                     ; 83 				GPIO_WriteHigh(LedAlam_PORT, LedAlam_PIN);
 370  0111 4b08          	push	#8
 371  0113 ae5000        	ldw	x,#20480
 372  0116 cd0000        	call	_GPIO_WriteHigh
 374  0119 84            	pop	a
 376  011a 2009          	jra	L73
 377  011c               L74:
 378                     ; 86 				GPIO_WriteLow(LedAlam_PORT, LedAlam_PIN);
 380  011c 4b08          	push	#8
 381  011e ae5000        	ldw	x,#20480
 382  0121 cd0000        	call	_GPIO_WriteLow
 384  0124 84            	pop	a
 385  0125               L73:
 386                     ; 90 		for(i=0; i< 14; ++i)
 388  0125 3f03          	clr	_i
 389  0127               L35:
 390                     ; 92 			if( second % 2 ){
 392  0127 b610          	ld	a,_second
 393  0129 a501          	bcp	a,#1
 394  012b 2712          	jreq	L16
 395                     ; 93 				TM1628_display_segments(i,buffer[i],1); 
 397  012d 4b01          	push	#1
 398  012f b603          	ld	a,_i
 399  0131 5f            	clrw	x
 400  0132 97            	ld	xl,a
 401  0133 e600          	ld	a,(_buffer,x)
 402  0135 97            	ld	xl,a
 403  0136 b603          	ld	a,_i
 404  0138 95            	ld	xh,a
 405  0139 cd0000        	call	_TM1628_display_segments
 407  013c 84            	pop	a
 409  013d 2010          	jra	L36
 410  013f               L16:
 411                     ; 96 				TM1628_display_segments(i,buffer[i],0); 
 413  013f 4b00          	push	#0
 414  0141 b603          	ld	a,_i
 415  0143 5f            	clrw	x
 416  0144 97            	ld	xl,a
 417  0145 e600          	ld	a,(_buffer,x)
 418  0147 97            	ld	xl,a
 419  0148 b603          	ld	a,_i
 420  014a 95            	ld	xh,a
 421  014b cd0000        	call	_TM1628_display_segments
 423  014e 84            	pop	a
 424  014f               L36:
 425                     ; 90 		for(i=0; i< 14; ++i)
 427  014f 3c03          	inc	_i
 430  0151 b603          	ld	a,_i
 431  0153 a10e          	cp	a,#14
 432  0155 25d0          	jrult	L35
 433                     ; 100 		if (StatusAlam){
 435  0157 3d15          	tnz	_StatusAlam
 436  0159 2603          	jrne	L21
 437  015b cc0254        	jp	L301
 438  015e               L21:
 439                     ; 101 			if (hour == hourAlam){
 441  015e b60e          	ld	a,_hour
 442  0160 b113          	cp	a,_hourAlam
 443  0162 2703          	jreq	L41
 444  0164 cc0254        	jp	L301
 445  0167               L41:
 446                     ; 102 				if (minute == minuteAlam){
 448  0167 b60f          	ld	a,_minute
 449  0169 b114          	cp	a,_minuteAlam
 450  016b 2703          	jreq	L61
 451  016d cc0254        	jp	L301
 452  0170               L61:
 453                     ; 103 					TIM4_Cmd(ENABLE);
 455  0170 a601          	ld	a,#1
 456  0172 cd0000        	call	_TIM4_Cmd
 459  0175 2023          	jra	L57
 460  0177               L37:
 461                     ; 105 						BEEP_Cmd(ENABLE );
 463  0177 a601          	ld	a,#1
 464  0179 cd0000        	call	_BEEP_Cmd
 466                     ; 106 						delay_us(10000);
 468  017c ae2710        	ldw	x,#10000
 469  017f 89            	pushw	x
 470  0180 ae0000        	ldw	x,#0
 471  0183 89            	pushw	x
 472  0184 cd0000        	call	_delay_us
 474  0187 5b04          	addw	sp,#4
 475                     ; 107 						BEEP_Cmd(DISABLE );
 477  0189 4f            	clr	a
 478  018a cd0000        	call	_BEEP_Cmd
 480                     ; 108 						delay_us(40000);
 482  018d ae9c40        	ldw	x,#40000
 483  0190 89            	pushw	x
 484  0191 ae0000        	ldw	x,#0
 485  0194 89            	pushw	x
 486  0195 cd0000        	call	_delay_us
 488  0198 5b04          	addw	sp,#4
 489  019a               L57:
 490                     ; 104 					while(ValueSecond < 5){
 492  019a b602          	ld	a,_ValueSecond
 493  019c a105          	cp	a,#5
 494  019e 25d7          	jrult	L37
 495                     ; 110 					TIM4_Cmd(DISABLE);
 497  01a0 4f            	clr	a
 498  01a1 cd0000        	call	_TIM4_Cmd
 500  01a4 ac540254      	jpf	L301
 501  01a8               L101:
 502                     ; 118 			if (GPIO_ReadInputPin(BUT_PORT2, BUT_PIN2) == RESET){
 504  01a8 4b04          	push	#4
 505  01aa ae500f        	ldw	x,#20495
 506  01ad cd0000        	call	_GPIO_ReadInputPin
 508  01b0 5b01          	addw	sp,#1
 509  01b2 4d            	tnz	a
 510  01b3 2620          	jrne	L701
 511                     ; 119 				delay_us(5000);
 513  01b5 ae1388        	ldw	x,#5000
 514  01b8 89            	pushw	x
 515  01b9 ae0000        	ldw	x,#0
 516  01bc 89            	pushw	x
 517  01bd cd0000        	call	_delay_us
 519  01c0 5b04          	addw	sp,#4
 520                     ; 121 				hour++;
 522  01c2 3c0e          	inc	_hour
 523                     ; 122 				if(hour > 23) hour = 0;
 525  01c4 b60e          	ld	a,_hour
 526  01c6 a118          	cp	a,#24
 527  01c8 2502          	jrult	L111
 530  01ca 3f0e          	clr	_hour
 531  01cc               L111:
 532                     ; 123 				WriteData(0x02, hour);
 534  01cc b60e          	ld	a,_hour
 535  01ce 97            	ld	xl,a
 536  01cf a602          	ld	a,#2
 537  01d1 95            	ld	xh,a
 538  01d2 cd0000        	call	_WriteData
 540  01d5               L701:
 541                     ; 126 			if (GPIO_ReadInputPin(BUT_PORT3, BUT_PIN3) == RESET){
 543  01d5 4b80          	push	#128
 544  01d7 ae500a        	ldw	x,#20490
 545  01da cd0000        	call	_GPIO_ReadInputPin
 547  01dd 5b01          	addw	sp,#1
 548  01df 4d            	tnz	a
 549  01e0 2624          	jrne	L311
 550                     ; 127 				delay_us(5000);
 552  01e2 ae1388        	ldw	x,#5000
 553  01e5 89            	pushw	x
 554  01e6 ae0000        	ldw	x,#0
 555  01e9 89            	pushw	x
 556  01ea cd0000        	call	_delay_us
 558  01ed 5b04          	addw	sp,#4
 559                     ; 129 				minute++;
 561  01ef 3c0f          	inc	_minute
 562                     ; 130 				if(minute > 59) minute = 0;
 564  01f1 b60f          	ld	a,_minute
 565  01f3 a13c          	cp	a,#60
 566  01f5 2502          	jrult	L511
 569  01f7 3f0f          	clr	_minute
 570  01f9               L511:
 571                     ; 131 				WriteData(0x01, minute);
 573  01f9 b60f          	ld	a,_minute
 574  01fb 97            	ld	xl,a
 575  01fc a601          	ld	a,#1
 576  01fe 95            	ld	xh,a
 577  01ff cd0000        	call	_WriteData
 579                     ; 132 				WriteData(0x00, 0);
 581  0202 5f            	clrw	x
 582  0203 cd0000        	call	_WriteData
 584  0206               L311:
 585                     ; 136 			buffer[0] = hour / 10;
 587  0206 b60e          	ld	a,_hour
 588  0208 5f            	clrw	x
 589  0209 97            	ld	xl,a
 590  020a a60a          	ld	a,#10
 591  020c cd0000        	call	c_sdivx
 593  020f 01            	rrwa	x,a
 594  0210 b700          	ld	_buffer,a
 595  0212 02            	rlwa	x,a
 596                     ; 137 			buffer[2] = hour % 10;
 598  0213 b60e          	ld	a,_hour
 599  0215 5f            	clrw	x
 600  0216 97            	ld	xl,a
 601  0217 a60a          	ld	a,#10
 602  0219 cd0000        	call	c_smodx
 604  021c 01            	rrwa	x,a
 605  021d b702          	ld	_buffer+2,a
 606  021f 02            	rlwa	x,a
 607                     ; 138 			buffer[4] = minute / 10;
 609  0220 b60f          	ld	a,_minute
 610  0222 5f            	clrw	x
 611  0223 97            	ld	xl,a
 612  0224 a60a          	ld	a,#10
 613  0226 cd0000        	call	c_sdivx
 615  0229 01            	rrwa	x,a
 616  022a b704          	ld	_buffer+4,a
 617  022c 02            	rlwa	x,a
 618                     ; 139 			buffer[6] = minute % 10;
 620  022d b60f          	ld	a,_minute
 621  022f 5f            	clrw	x
 622  0230 97            	ld	xl,a
 623  0231 a60a          	ld	a,#10
 624  0233 cd0000        	call	c_smodx
 626  0236 01            	rrwa	x,a
 627  0237 b706          	ld	_buffer+6,a
 628  0239 02            	rlwa	x,a
 629                     ; 141 			for(i=0; i< 14; ++i)
 631  023a 3f03          	clr	_i
 632  023c               L711:
 633                     ; 143 				TM1628_display_segments(i,buffer[i],1); 
 635  023c 4b01          	push	#1
 636  023e b603          	ld	a,_i
 637  0240 5f            	clrw	x
 638  0241 97            	ld	xl,a
 639  0242 e600          	ld	a,(_buffer,x)
 640  0244 97            	ld	xl,a
 641  0245 b603          	ld	a,_i
 642  0247 95            	ld	xh,a
 643  0248 cd0000        	call	_TM1628_display_segments
 645  024b 84            	pop	a
 646                     ; 141 			for(i=0; i< 14; ++i)
 648  024c 3c03          	inc	_i
 651  024e b603          	ld	a,_i
 652  0250 a10e          	cp	a,#14
 653  0252 25e8          	jrult	L711
 654  0254               L301:
 655                     ; 115 		while (mode == 1){
 657  0254 b616          	ld	a,_mode
 658  0256 a101          	cp	a,#1
 659  0258 2603          	jrne	L02
 660  025a cc01a8        	jp	L101
 661  025d               L02:
 663  025d ac220322      	jpf	L721
 664  0261               L521:
 665                     ; 149 			if (GPIO_ReadInputPin(BUT_PORT2, BUT_PIN2) == RESET){
 667  0261 4b04          	push	#4
 668  0263 ae500f        	ldw	x,#20495
 669  0266 cd0000        	call	_GPIO_ReadInputPin
 671  0269 5b01          	addw	sp,#1
 672  026b 4d            	tnz	a
 673  026c 2634          	jrne	L331
 674                     ; 151 				BEEP_Cmd(ENABLE );
 676  026e a601          	ld	a,#1
 677  0270 cd0000        	call	_BEEP_Cmd
 679                     ; 152 				delay_us(50000);
 681  0273 aec350        	ldw	x,#50000
 682  0276 89            	pushw	x
 683  0277 ae0000        	ldw	x,#0
 684  027a 89            	pushw	x
 685  027b cd0000        	call	_delay_us
 687  027e 5b04          	addw	sp,#4
 688                     ; 153 				BEEP_Cmd(DISABLE );
 690  0280 4f            	clr	a
 691  0281 cd0000        	call	_BEEP_Cmd
 694  0284               L731:
 695                     ; 154 				while (GPIO_ReadInputPin(BUT_PORT2, BUT_PIN2) == RESET){}
 697  0284 4b04          	push	#4
 698  0286 ae500f        	ldw	x,#20495
 699  0289 cd0000        	call	_GPIO_ReadInputPin
 701  028c 5b01          	addw	sp,#1
 702  028e 4d            	tnz	a
 703  028f 27f3          	jreq	L731
 704                     ; 155 				StatusStartStop = ~StatusStartStop ;
 706  0291 3300          	cpl	_StatusStartStop
 707                     ; 156 				if (StatusStartStop){
 709  0293 3d00          	tnz	_StatusStartStop
 710  0295 2707          	jreq	L341
 711                     ; 157 					TIM4_Cmd(ENABLE);
 713  0297 a601          	ld	a,#1
 714  0299 cd0000        	call	_TIM4_Cmd
 717  029c 2004          	jra	L331
 718  029e               L341:
 719                     ; 160 					TIM4_Cmd(DISABLE);
 721  029e 4f            	clr	a
 722  029f cd0000        	call	_TIM4_Cmd
 724  02a2               L331:
 725                     ; 164 			if (GPIO_ReadInputPin(BUT_PORT3, BUT_PIN3) == RESET){
 727  02a2 4b80          	push	#128
 728  02a4 ae500a        	ldw	x,#20490
 729  02a7 cd0000        	call	_GPIO_ReadInputPin
 731  02aa 5b01          	addw	sp,#1
 732  02ac 4d            	tnz	a
 733  02ad 2625          	jrne	L741
 734                     ; 166 				BEEP_Cmd(ENABLE );
 736  02af a601          	ld	a,#1
 737  02b1 cd0000        	call	_BEEP_Cmd
 739                     ; 167 				delay_us(50000);
 741  02b4 aec350        	ldw	x,#50000
 742  02b7 89            	pushw	x
 743  02b8 ae0000        	ldw	x,#0
 744  02bb 89            	pushw	x
 745  02bc cd0000        	call	_delay_us
 747  02bf 5b04          	addw	sp,#4
 748                     ; 168 				BEEP_Cmd(DISABLE );
 750  02c1 4f            	clr	a
 751  02c2 cd0000        	call	_BEEP_Cmd
 754  02c5               L351:
 755                     ; 169 				while (GPIO_ReadInputPin(BUT_PORT3, BUT_PIN3) == RESET){}
 757  02c5 4b80          	push	#128
 758  02c7 ae500a        	ldw	x,#20490
 759  02ca cd0000        	call	_GPIO_ReadInputPin
 761  02cd 5b01          	addw	sp,#1
 762  02cf 4d            	tnz	a
 763  02d0 27f3          	jreq	L351
 764                     ; 170 				ValueSecond = 0;
 766  02d2 3f02          	clr	_ValueSecond
 767  02d4               L741:
 768                     ; 173 			buffer[0] = ValueMinute / 10;
 770  02d4 b601          	ld	a,_ValueMinute
 771  02d6 5f            	clrw	x
 772  02d7 97            	ld	xl,a
 773  02d8 a60a          	ld	a,#10
 774  02da cd0000        	call	c_sdivx
 776  02dd 01            	rrwa	x,a
 777  02de b700          	ld	_buffer,a
 778  02e0 02            	rlwa	x,a
 779                     ; 174 			buffer[2] = ValueMinute % 10;
 781  02e1 b601          	ld	a,_ValueMinute
 782  02e3 5f            	clrw	x
 783  02e4 97            	ld	xl,a
 784  02e5 a60a          	ld	a,#10
 785  02e7 cd0000        	call	c_smodx
 787  02ea 01            	rrwa	x,a
 788  02eb b702          	ld	_buffer+2,a
 789  02ed 02            	rlwa	x,a
 790                     ; 175 			buffer[4] = ValueSecond / 10;
 792  02ee b602          	ld	a,_ValueSecond
 793  02f0 5f            	clrw	x
 794  02f1 97            	ld	xl,a
 795  02f2 a60a          	ld	a,#10
 796  02f4 cd0000        	call	c_sdivx
 798  02f7 01            	rrwa	x,a
 799  02f8 b704          	ld	_buffer+4,a
 800  02fa 02            	rlwa	x,a
 801                     ; 176 			buffer[6] = ValueSecond % 10;
 803  02fb b602          	ld	a,_ValueSecond
 804  02fd 5f            	clrw	x
 805  02fe 97            	ld	xl,a
 806  02ff a60a          	ld	a,#10
 807  0301 cd0000        	call	c_smodx
 809  0304 01            	rrwa	x,a
 810  0305 b706          	ld	_buffer+6,a
 811  0307 02            	rlwa	x,a
 812                     ; 178 			for(i=0; i< 14; ++i)
 814  0308 3f03          	clr	_i
 815  030a               L751:
 816                     ; 180 				TM1628_display_segments(i,buffer[i],2); 
 818  030a 4b02          	push	#2
 819  030c b603          	ld	a,_i
 820  030e 5f            	clrw	x
 821  030f 97            	ld	xl,a
 822  0310 e600          	ld	a,(_buffer,x)
 823  0312 97            	ld	xl,a
 824  0313 b603          	ld	a,_i
 825  0315 95            	ld	xh,a
 826  0316 cd0000        	call	_TM1628_display_segments
 828  0319 84            	pop	a
 829                     ; 178 			for(i=0; i< 14; ++i)
 831  031a 3c03          	inc	_i
 834  031c b603          	ld	a,_i
 835  031e a10e          	cp	a,#14
 836  0320 25e8          	jrult	L751
 837  0322               L721:
 838                     ; 147 		while(mode == 2){
 840  0322 b616          	ld	a,_mode
 841  0324 a102          	cp	a,#2
 842  0326 2603          	jrne	L22
 843  0328 cc0261        	jp	L521
 844  032b               L22:
 846  032b ac030403      	jpf	L761
 847  032f               L561:
 848                     ; 187 			hourAlam = Read_EEPROM(0x4000);
 850  032f ae4000        	ldw	x,#16384
 851  0332 89            	pushw	x
 852  0333 ae0000        	ldw	x,#0
 853  0336 89            	pushw	x
 854  0337 cd0000        	call	_Read_EEPROM
 856  033a 5b04          	addw	sp,#4
 857  033c b713          	ld	_hourAlam,a
 858                     ; 188 			minuteAlam = Read_EEPROM(0x4001);
 860  033e ae4001        	ldw	x,#16385
 861  0341 89            	pushw	x
 862  0342 ae0000        	ldw	x,#0
 863  0345 89            	pushw	x
 864  0346 cd0000        	call	_Read_EEPROM
 866  0349 5b04          	addw	sp,#4
 867  034b b714          	ld	_minuteAlam,a
 868                     ; 190 			if (GPIO_ReadInputPin(BUT_PORT2, BUT_PIN2) == RESET){
 870  034d 4b04          	push	#4
 871  034f ae500f        	ldw	x,#20495
 872  0352 cd0000        	call	_GPIO_ReadInputPin
 874  0355 5b01          	addw	sp,#1
 875  0357 4d            	tnz	a
 876  0358 2627          	jrne	L371
 877                     ; 191 				delay_us(5000);
 879  035a ae1388        	ldw	x,#5000
 880  035d 89            	pushw	x
 881  035e ae0000        	ldw	x,#0
 882  0361 89            	pushw	x
 883  0362 cd0000        	call	_delay_us
 885  0365 5b04          	addw	sp,#4
 886                     ; 192 				hourAlam++;
 888  0367 3c13          	inc	_hourAlam
 889                     ; 193 				if(hourAlam > 23) hourAlam = 0;
 891  0369 b613          	ld	a,_hourAlam
 892  036b a118          	cp	a,#24
 893  036d 2502          	jrult	L571
 896  036f 3f13          	clr	_hourAlam
 897  0371               L571:
 898                     ; 194 				Write_EEPROM(0x4000, hourAlam);
 900  0371 3b0013        	push	_hourAlam
 901  0374 ae4000        	ldw	x,#16384
 902  0377 89            	pushw	x
 903  0378 ae0000        	ldw	x,#0
 904  037b 89            	pushw	x
 905  037c cd0000        	call	_Write_EEPROM
 907  037f 5b05          	addw	sp,#5
 908  0381               L371:
 909                     ; 197 			if (GPIO_ReadInputPin(BUT_PORT3, BUT_PIN3) == RESET){
 911  0381 4b80          	push	#128
 912  0383 ae500a        	ldw	x,#20490
 913  0386 cd0000        	call	_GPIO_ReadInputPin
 915  0389 5b01          	addw	sp,#1
 916  038b 4d            	tnz	a
 917  038c 2627          	jrne	L771
 918                     ; 198 				delay_us(5000);
 920  038e ae1388        	ldw	x,#5000
 921  0391 89            	pushw	x
 922  0392 ae0000        	ldw	x,#0
 923  0395 89            	pushw	x
 924  0396 cd0000        	call	_delay_us
 926  0399 5b04          	addw	sp,#4
 927                     ; 199 				minuteAlam++;
 929  039b 3c14          	inc	_minuteAlam
 930                     ; 200 				if(minuteAlam > 59) minuteAlam = 0;
 932  039d b614          	ld	a,_minuteAlam
 933  039f a13c          	cp	a,#60
 934  03a1 2502          	jrult	L102
 937  03a3 3f14          	clr	_minuteAlam
 938  03a5               L102:
 939                     ; 201 				Write_EEPROM(0x4001, minuteAlam);
 941  03a5 3b0014        	push	_minuteAlam
 942  03a8 ae4001        	ldw	x,#16385
 943  03ab 89            	pushw	x
 944  03ac ae0000        	ldw	x,#0
 945  03af 89            	pushw	x
 946  03b0 cd0000        	call	_Write_EEPROM
 948  03b3 5b05          	addw	sp,#5
 949  03b5               L771:
 950                     ; 204 			buffer[0] = hourAlam / 10;
 952  03b5 b613          	ld	a,_hourAlam
 953  03b7 5f            	clrw	x
 954  03b8 97            	ld	xl,a
 955  03b9 a60a          	ld	a,#10
 956  03bb cd0000        	call	c_sdivx
 958  03be 01            	rrwa	x,a
 959  03bf b700          	ld	_buffer,a
 960  03c1 02            	rlwa	x,a
 961                     ; 205 			buffer[2] = hourAlam % 10;
 963  03c2 b613          	ld	a,_hourAlam
 964  03c4 5f            	clrw	x
 965  03c5 97            	ld	xl,a
 966  03c6 a60a          	ld	a,#10
 967  03c8 cd0000        	call	c_smodx
 969  03cb 01            	rrwa	x,a
 970  03cc b702          	ld	_buffer+2,a
 971  03ce 02            	rlwa	x,a
 972                     ; 206 			buffer[4] = minuteAlam / 10;
 974  03cf b614          	ld	a,_minuteAlam
 975  03d1 5f            	clrw	x
 976  03d2 97            	ld	xl,a
 977  03d3 a60a          	ld	a,#10
 978  03d5 cd0000        	call	c_sdivx
 980  03d8 01            	rrwa	x,a
 981  03d9 b704          	ld	_buffer+4,a
 982  03db 02            	rlwa	x,a
 983                     ; 207 			buffer[6] = minuteAlam % 10;
 985  03dc b614          	ld	a,_minuteAlam
 986  03de 5f            	clrw	x
 987  03df 97            	ld	xl,a
 988  03e0 a60a          	ld	a,#10
 989  03e2 cd0000        	call	c_smodx
 991  03e5 01            	rrwa	x,a
 992  03e6 b706          	ld	_buffer+6,a
 993  03e8 02            	rlwa	x,a
 994                     ; 209 			for(i=0; i< 14; ++i)
 996  03e9 3f03          	clr	_i
 997  03eb               L302:
 998                     ; 211 				TM1628_display_segments(i,buffer[i],0); 
1000  03eb 4b00          	push	#0
1001  03ed b603          	ld	a,_i
1002  03ef 5f            	clrw	x
1003  03f0 97            	ld	xl,a
1004  03f1 e600          	ld	a,(_buffer,x)
1005  03f3 97            	ld	xl,a
1006  03f4 b603          	ld	a,_i
1007  03f6 95            	ld	xh,a
1008  03f7 cd0000        	call	_TM1628_display_segments
1010  03fa 84            	pop	a
1011                     ; 209 			for(i=0; i< 14; ++i)
1013  03fb 3c03          	inc	_i
1016  03fd b603          	ld	a,_i
1017  03ff a10e          	cp	a,#14
1018  0401 25e8          	jrult	L302
1019  0403               L761:
1020                     ; 185 		while (mode == 3)
1022  0403 b616          	ld	a,_mode
1023  0405 a103          	cp	a,#3
1024  0407 2603          	jrne	L42
1025  0409 cc032f        	jp	L561
1026  040c               L42:
1028  040c ac390039      	jpf	L72
1053                     ; 217 void Clock_setup(void)
1053                     ; 218 {
1054                     	switch	.text
1055  0410               _Clock_setup:
1059                     ; 220 	CLK_DeInit();   
1061  0410 cd0000        	call	_CLK_DeInit
1063                     ; 221 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
1065  0413 4f            	clr	a
1066  0414 cd0000        	call	_CLK_HSIPrescalerConfig
1068                     ; 222 }
1071  0417 81            	ret
1096                     ; 223 void GPIO_setup(void)
1096                     ; 224 {
1097                     	switch	.text
1098  0418               _GPIO_setup:
1102                     ; 226 	GPIO_DeInit(GPIOD);
1104  0418 ae500f        	ldw	x,#20495
1105  041b cd0000        	call	_GPIO_DeInit
1107                     ; 227 	GPIO_DeInit(GPIOC);
1109  041e ae500a        	ldw	x,#20490
1110  0421 cd0000        	call	_GPIO_DeInit
1112                     ; 228 	GPIO_DeInit(GPIOA);
1114  0424 ae5000        	ldw	x,#20480
1115  0427 cd0000        	call	_GPIO_DeInit
1117                     ; 229 	GPIO_DeInit(GPIOE);
1119  042a ae5014        	ldw	x,#20500
1120  042d cd0000        	call	_GPIO_DeInit
1122                     ; 230 	GPIO_DeInit(GPIOB);   
1124  0430 ae5005        	ldw	x,#20485
1125  0433 cd0000        	call	_GPIO_DeInit
1127                     ; 231 	GPIO_DeInit(GPIOF);
1129  0436 ae5019        	ldw	x,#20505
1130  0439 cd0000        	call	_GPIO_DeInit
1132                     ; 233 	GPIO_Init(LedAlam_PORT, LedAlam_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
1134  043c 4bc0          	push	#192
1135  043e 4b08          	push	#8
1136  0440 ae5000        	ldw	x,#20480
1137  0443 cd0000        	call	_GPIO_Init
1139  0446 85            	popw	x
1140                     ; 234 	GPIO_Init(GPIOB, GPIO_PIN_4 | GPIO_PIN_5, GPIO_MODE_OUT_OD_HIZ_SLOW);
1142  0447 4b90          	push	#144
1143  0449 4b30          	push	#48
1144  044b ae5005        	ldw	x,#20485
1145  044e cd0000        	call	_GPIO_Init
1147  0451 85            	popw	x
1148                     ; 235 	GPIO_Init(BUT_PORT1 ,BUT_PIN1 ,GPIO_MODE_IN_PU_IT);
1150  0452 4b60          	push	#96
1151  0454 4b08          	push	#8
1152  0456 ae500f        	ldw	x,#20495
1153  0459 cd0000        	call	_GPIO_Init
1155  045c 85            	popw	x
1156                     ; 236 	GPIO_Init(BUT_PORT2 ,BUT_PIN2 ,GPIO_MODE_IN_PU_NO_IT);
1158  045d 4b40          	push	#64
1159  045f 4b04          	push	#4
1160  0461 ae500f        	ldw	x,#20495
1161  0464 cd0000        	call	_GPIO_Init
1163  0467 85            	popw	x
1164                     ; 237 	GPIO_Init(BUT_PORT3 ,BUT_PIN3 ,GPIO_MODE_IN_PU_NO_IT);
1166  0468 4b40          	push	#64
1167  046a 4b80          	push	#128
1168  046c ae500a        	ldw	x,#20490
1169  046f cd0000        	call	_GPIO_Init
1171  0472 85            	popw	x
1172                     ; 238 }
1175  0473 81            	ret
1201                     ; 240 void Exti_Config(void){
1202                     	switch	.text
1203  0474               _Exti_Config:
1207                     ; 242 	EXTI_DeInit();
1209  0474 cd0000        	call	_EXTI_DeInit
1211                     ; 243 	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOD, EXTI_SENSITIVITY_FALL_ONLY);
1213  0477 ae0302        	ldw	x,#770
1214  047a cd0000        	call	_EXTI_SetExtIntSensitivity
1216                     ; 244 	enableInterrupts();
1219  047d 9a            rim
1221                     ; 245 }
1225  047e 81            	ret
1416                     	xdef	_main
1417                     	xdef	_Exti_Config
1418                     	xdef	_GPIO_setup
1419                     	xdef	_Clock_setup
1420                     	xdef	_mode
1421                     	xdef	_StatusAlam
1422                     	switch	.ubsct
1423  0000               _StatusStartStop:
1424  0000 00            	ds.b	1
1425                     	xdef	_StatusStartStop
1426  0001               _ValueMinute:
1427  0001 00            	ds.b	1
1428                     	xdef	_ValueMinute
1429  0002               _ValueSecond:
1430  0002 00            	ds.b	1
1431                     	xdef	_ValueSecond
1432                     	xdef	_minuteAlam
1433                     	xdef	_hourAlam
1434                     	xdef	_month
1435                     	xdef	_date
1436                     	xdef	_second
1437                     	xdef	_minute
1438                     	xdef	_hour
1439                     	xdef	_buffer
1440  0003               _i:
1441  0003 00            	ds.b	1
1442                     	xdef	_i
1443  0004               _AccX:
1444  0004 00000000      	ds.b	4
1445                     	xdef	_AccX
1446  0008               _DataMPU:
1447  0008 0000          	ds.b	2
1448                     	xdef	_DataMPU
1449  000a               _DataEEprom:
1450  000a 00            	ds.b	1
1451                     	xdef	_DataEEprom
1452                     	xref	_Read_EEPROM
1453                     	xref	_Write_EEPROM
1454                     	xref	_ReadData
1455                     	xref	_WriteData
1456                     	xref	_I2C_init
1457                     	xref	_TM1628_display_segments
1458                     	xref	_TM1628_INIT
1459                     	xref	_delay_us
1460                     	xref	_delay_config
1461                     	xref	_TIM4_Cmd
1462                     	xref	_GPIO_ReadInputPin
1463                     	xref	_GPIO_WriteLow
1464                     	xref	_GPIO_WriteHigh
1465                     	xref	_GPIO_Init
1466                     	xref	_GPIO_DeInit
1467                     	xref	_EXTI_SetExtIntSensitivity
1468                     	xref	_EXTI_DeInit
1469                     	xref	_CLK_HSIPrescalerConfig
1470                     	xref	_CLK_DeInit
1471                     	xref	_BEEP_Cmd
1472                     	xref	_BEEP_Init
1473                     	xref	_BEEP_DeInit
1474                     	xref.b	c_x
1494                     	xref	c_smodx
1495                     	xref	c_sdivx
1496                     	end
