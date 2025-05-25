   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  44                     ; 58 void TIM1_DeInit(void)
  44                     ; 59 {
  46                     	switch	.text
  47  0000               _TIM1_DeInit:
  51                     ; 60   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  53  0000 725f5250      	clr	21072
  54                     ; 61   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  56  0004 725f5251      	clr	21073
  57                     ; 62   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  59  0008 725f5252      	clr	21074
  60                     ; 63   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  62  000c 725f5253      	clr	21075
  63                     ; 64   TIM1->IER  = TIM1_IER_RESET_VALUE;
  65  0010 725f5254      	clr	21076
  66                     ; 65   TIM1->SR2  = TIM1_SR2_RESET_VALUE;
  68  0014 725f5256      	clr	21078
  69                     ; 67   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  71  0018 725f525c      	clr	21084
  72                     ; 68   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  74  001c 725f525d      	clr	21085
  75                     ; 70   TIM1->CCMR1 = 0x01;
  77  0020 35015258      	mov	21080,#1
  78                     ; 71   TIM1->CCMR2 = 0x01;
  80  0024 35015259      	mov	21081,#1
  81                     ; 72   TIM1->CCMR3 = 0x01;
  83  0028 3501525a      	mov	21082,#1
  84                     ; 73   TIM1->CCMR4 = 0x01;
  86  002c 3501525b      	mov	21083,#1
  87                     ; 75   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  89  0030 725f525c      	clr	21084
  90                     ; 76   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  92  0034 725f525d      	clr	21085
  93                     ; 77   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  95  0038 725f5258      	clr	21080
  96                     ; 78   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
  98  003c 725f5259      	clr	21081
  99                     ; 79   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
 101  0040 725f525a      	clr	21082
 102                     ; 80   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 104  0044 725f525b      	clr	21083
 105                     ; 81   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 107  0048 725f525e      	clr	21086
 108                     ; 82   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 110  004c 725f525f      	clr	21087
 111                     ; 83   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 113  0050 725f5260      	clr	21088
 114                     ; 84   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 116  0054 725f5261      	clr	21089
 117                     ; 85   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 119  0058 35ff5262      	mov	21090,#255
 120                     ; 86   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 122  005c 35ff5263      	mov	21091,#255
 123                     ; 87   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 125  0060 725f5265      	clr	21093
 126                     ; 88   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 128  0064 725f5266      	clr	21094
 129                     ; 89   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 131  0068 725f5267      	clr	21095
 132                     ; 90   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 134  006c 725f5268      	clr	21096
 135                     ; 91   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 137  0070 725f5269      	clr	21097
 138                     ; 92   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 140  0074 725f526a      	clr	21098
 141                     ; 93   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 143  0078 725f526b      	clr	21099
 144                     ; 94   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 146  007c 725f526c      	clr	21100
 147                     ; 95   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 149  0080 725f526f      	clr	21103
 150                     ; 96   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 152  0084 35015257      	mov	21079,#1
 153                     ; 97   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 155  0088 725f526e      	clr	21102
 156                     ; 98   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 158  008c 725f526d      	clr	21101
 159                     ; 99   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 161  0090 725f5264      	clr	21092
 162                     ; 100   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 164  0094 725f5255      	clr	21077
 165                     ; 101 }
 168  0098 81            	ret
 277                     ; 111 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 277                     ; 112                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 277                     ; 113                        uint16_t TIM1_Period,
 277                     ; 114                        uint8_t TIM1_RepetitionCounter)
 277                     ; 115 {
 278                     	switch	.text
 279  0099               _TIM1_TimeBaseInit:
 281  0099 89            	pushw	x
 282       00000000      OFST:	set	0
 285                     ; 117   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 287                     ; 120   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 289  009a 7b06          	ld	a,(OFST+6,sp)
 290  009c c75262        	ld	21090,a
 291                     ; 121   TIM1->ARRL = (uint8_t)(TIM1_Period);
 293  009f 7b07          	ld	a,(OFST+7,sp)
 294  00a1 c75263        	ld	21091,a
 295                     ; 124   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 297  00a4 9e            	ld	a,xh
 298  00a5 c75260        	ld	21088,a
 299                     ; 125   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 301  00a8 9f            	ld	a,xl
 302  00a9 c75261        	ld	21089,a
 303                     ; 128   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 303                     ; 129                         | (uint8_t)(TIM1_CounterMode));
 305  00ac c65250        	ld	a,21072
 306  00af a48f          	and	a,#143
 307  00b1 1a05          	or	a,(OFST+5,sp)
 308  00b3 c75250        	ld	21072,a
 309                     ; 132   TIM1->RCR = TIM1_RepetitionCounter;
 311  00b6 7b08          	ld	a,(OFST+8,sp)
 312  00b8 c75264        	ld	21092,a
 313                     ; 133 }
 316  00bb 85            	popw	x
 317  00bc 81            	ret
 602                     ; 154 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 602                     ; 155                   TIM1_OutputState_TypeDef TIM1_OutputState,
 602                     ; 156                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 602                     ; 157                   uint16_t TIM1_Pulse,
 602                     ; 158                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 602                     ; 159                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 602                     ; 160                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 602                     ; 161                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 602                     ; 162 {
 603                     	switch	.text
 604  00bd               _TIM1_OC1Init:
 606  00bd 89            	pushw	x
 607  00be 5203          	subw	sp,#3
 608       00000003      OFST:	set	3
 611                     ; 164   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 613                     ; 165   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 615                     ; 166   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 617                     ; 167   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 619                     ; 168   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 621                     ; 169   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 623                     ; 170   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 625                     ; 174   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE 
 625                     ; 175                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
 627  00c0 c6525c        	ld	a,21084
 628  00c3 a4f0          	and	a,#240
 629  00c5 c7525c        	ld	21084,a
 630                     ; 178   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
 630                     ; 179                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
 630                     ; 180                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
 630                     ; 181                                        | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
 632  00c8 7b0c          	ld	a,(OFST+9,sp)
 633  00ca a408          	and	a,#8
 634  00cc 6b03          	ld	(OFST+0,sp),a
 635  00ce 7b0b          	ld	a,(OFST+8,sp)
 636  00d0 a402          	and	a,#2
 637  00d2 1a03          	or	a,(OFST+0,sp)
 638  00d4 6b02          	ld	(OFST-1,sp),a
 639  00d6 7b08          	ld	a,(OFST+5,sp)
 640  00d8 a404          	and	a,#4
 641  00da 6b01          	ld	(OFST-2,sp),a
 642  00dc 9f            	ld	a,xl
 643  00dd a401          	and	a,#1
 644  00df 1a01          	or	a,(OFST-2,sp)
 645  00e1 1a02          	or	a,(OFST-1,sp)
 646  00e3 ca525c        	or	a,21084
 647  00e6 c7525c        	ld	21084,a
 648                     ; 184   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 648                     ; 185                           (uint8_t)TIM1_OCMode);
 650  00e9 c65258        	ld	a,21080
 651  00ec a48f          	and	a,#143
 652  00ee 1a04          	or	a,(OFST+1,sp)
 653  00f0 c75258        	ld	21080,a
 654                     ; 188   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
 656  00f3 c6526f        	ld	a,21103
 657  00f6 a4fc          	and	a,#252
 658  00f8 c7526f        	ld	21103,a
 659                     ; 190   TIM1->OISR |= (uint8_t)((uint8_t)( TIM1_OCIdleState & TIM1_OISR_OIS1 ) | 
 659                     ; 191                           (uint8_t)( TIM1_OCNIdleState & TIM1_OISR_OIS1N ));
 661  00fb 7b0e          	ld	a,(OFST+11,sp)
 662  00fd a402          	and	a,#2
 663  00ff 6b03          	ld	(OFST+0,sp),a
 664  0101 7b0d          	ld	a,(OFST+10,sp)
 665  0103 a401          	and	a,#1
 666  0105 1a03          	or	a,(OFST+0,sp)
 667  0107 ca526f        	or	a,21103
 668  010a c7526f        	ld	21103,a
 669                     ; 194   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
 671  010d 7b09          	ld	a,(OFST+6,sp)
 672  010f c75265        	ld	21093,a
 673                     ; 195   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
 675  0112 7b0a          	ld	a,(OFST+7,sp)
 676  0114 c75266        	ld	21094,a
 677                     ; 196 }
 680  0117 5b05          	addw	sp,#5
 681  0119 81            	ret
 785                     ; 217 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 785                     ; 218                   TIM1_OutputState_TypeDef TIM1_OutputState,
 785                     ; 219                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 785                     ; 220                   uint16_t TIM1_Pulse,
 785                     ; 221                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 785                     ; 222                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 785                     ; 223                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 785                     ; 224                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 785                     ; 225 {
 786                     	switch	.text
 787  011a               _TIM1_OC2Init:
 789  011a 89            	pushw	x
 790  011b 5203          	subw	sp,#3
 791       00000003      OFST:	set	3
 794                     ; 227   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 796                     ; 228   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 798                     ; 229   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 800                     ; 230   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 802                     ; 231   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 804                     ; 232   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 806                     ; 233   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 808                     ; 237   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
 808                     ; 238                              TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
 810  011d c6525c        	ld	a,21084
 811  0120 a40f          	and	a,#15
 812  0122 c7525c        	ld	21084,a
 813                     ; 242   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
 813                     ; 243                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
 813                     ; 244                            (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
 813                     ; 245                                      (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
 815  0125 7b0c          	ld	a,(OFST+9,sp)
 816  0127 a480          	and	a,#128
 817  0129 6b03          	ld	(OFST+0,sp),a
 818  012b 7b0b          	ld	a,(OFST+8,sp)
 819  012d a420          	and	a,#32
 820  012f 1a03          	or	a,(OFST+0,sp)
 821  0131 6b02          	ld	(OFST-1,sp),a
 822  0133 7b08          	ld	a,(OFST+5,sp)
 823  0135 a440          	and	a,#64
 824  0137 6b01          	ld	(OFST-2,sp),a
 825  0139 9f            	ld	a,xl
 826  013a a410          	and	a,#16
 827  013c 1a01          	or	a,(OFST-2,sp)
 828  013e 1a02          	or	a,(OFST-1,sp)
 829  0140 ca525c        	or	a,21084
 830  0143 c7525c        	ld	21084,a
 831                     ; 248   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 831                     ; 249                           (uint8_t)TIM1_OCMode);
 833  0146 c65259        	ld	a,21081
 834  0149 a48f          	and	a,#143
 835  014b 1a04          	or	a,(OFST+1,sp)
 836  014d c75259        	ld	21081,a
 837                     ; 252   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
 839  0150 c6526f        	ld	a,21103
 840  0153 a4f3          	and	a,#243
 841  0155 c7526f        	ld	21103,a
 842                     ; 254   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
 842                     ; 255                           (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
 844  0158 7b0e          	ld	a,(OFST+11,sp)
 845  015a a408          	and	a,#8
 846  015c 6b03          	ld	(OFST+0,sp),a
 847  015e 7b0d          	ld	a,(OFST+10,sp)
 848  0160 a404          	and	a,#4
 849  0162 1a03          	or	a,(OFST+0,sp)
 850  0164 ca526f        	or	a,21103
 851  0167 c7526f        	ld	21103,a
 852                     ; 258   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
 854  016a 7b09          	ld	a,(OFST+6,sp)
 855  016c c75267        	ld	21095,a
 856                     ; 259   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
 858  016f 7b0a          	ld	a,(OFST+7,sp)
 859  0171 c75268        	ld	21096,a
 860                     ; 260 }
 863  0174 5b05          	addw	sp,#5
 864  0176 81            	ret
 968                     ; 281 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 968                     ; 282                   TIM1_OutputState_TypeDef TIM1_OutputState,
 968                     ; 283                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 968                     ; 284                   uint16_t TIM1_Pulse,
 968                     ; 285                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 968                     ; 286                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 968                     ; 287                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 968                     ; 288                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 968                     ; 289 {
 969                     	switch	.text
 970  0177               _TIM1_OC3Init:
 972  0177 89            	pushw	x
 973  0178 5203          	subw	sp,#3
 974       00000003      OFST:	set	3
 977                     ; 291   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 979                     ; 292   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 981                     ; 293   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 983                     ; 294   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 985                     ; 295   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 987                     ; 296   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 989                     ; 297   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 991                     ; 301   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | 
 991                     ; 302                              TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
 993  017a c6525d        	ld	a,21085
 994  017d a4f0          	and	a,#240
 995  017f c7525d        	ld	21085,a
 996                     ; 305   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState  & TIM1_CCER2_CC3E   ) |
 996                     ; 306                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE  )) | 
 996                     ; 307                            (uint8_t)((uint8_t)(TIM1_OCPolarity   & TIM1_CCER2_CC3P   ) | 
 996                     ; 308                                      (uint8_t)(TIM1_OCNPolarity  & TIM1_CCER2_CC3NP  )));
 998  0182 7b0c          	ld	a,(OFST+9,sp)
 999  0184 a408          	and	a,#8
1000  0186 6b03          	ld	(OFST+0,sp),a
1001  0188 7b0b          	ld	a,(OFST+8,sp)
1002  018a a402          	and	a,#2
1003  018c 1a03          	or	a,(OFST+0,sp)
1004  018e 6b02          	ld	(OFST-1,sp),a
1005  0190 7b08          	ld	a,(OFST+5,sp)
1006  0192 a404          	and	a,#4
1007  0194 6b01          	ld	(OFST-2,sp),a
1008  0196 9f            	ld	a,xl
1009  0197 a401          	and	a,#1
1010  0199 1a01          	or	a,(OFST-2,sp)
1011  019b 1a02          	or	a,(OFST-1,sp)
1012  019d ca525d        	or	a,21085
1013  01a0 c7525d        	ld	21085,a
1014                     ; 311   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1014                     ; 312                           (uint8_t)TIM1_OCMode);
1016  01a3 c6525a        	ld	a,21082
1017  01a6 a48f          	and	a,#143
1018  01a8 1a04          	or	a,(OFST+1,sp)
1019  01aa c7525a        	ld	21082,a
1020                     ; 315   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1022  01ad c6526f        	ld	a,21103
1023  01b0 a4cf          	and	a,#207
1024  01b2 c7526f        	ld	21103,a
1025                     ; 317   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | 
1025                     ; 318                           (uint8_t)(TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1027  01b5 7b0e          	ld	a,(OFST+11,sp)
1028  01b7 a420          	and	a,#32
1029  01b9 6b03          	ld	(OFST+0,sp),a
1030  01bb 7b0d          	ld	a,(OFST+10,sp)
1031  01bd a410          	and	a,#16
1032  01bf 1a03          	or	a,(OFST+0,sp)
1033  01c1 ca526f        	or	a,21103
1034  01c4 c7526f        	ld	21103,a
1035                     ; 321   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1037  01c7 7b09          	ld	a,(OFST+6,sp)
1038  01c9 c75269        	ld	21097,a
1039                     ; 322   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1041  01cc 7b0a          	ld	a,(OFST+7,sp)
1042  01ce c7526a        	ld	21098,a
1043                     ; 323 }
1046  01d1 5b05          	addw	sp,#5
1047  01d3 81            	ret
1121                     ; 338 void TIM1_OC4Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1121                     ; 339                   TIM1_OutputState_TypeDef TIM1_OutputState,
1121                     ; 340                   uint16_t TIM1_Pulse,
1121                     ; 341                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1121                     ; 342                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState)
1121                     ; 343 {
1122                     	switch	.text
1123  01d4               _TIM1_OC4Init:
1125  01d4 89            	pushw	x
1126  01d5 88            	push	a
1127       00000001      OFST:	set	1
1130                     ; 345   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1132                     ; 346   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1134                     ; 347   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1136                     ; 348   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1138                     ; 351   TIM1->CCER2 &= (uint8_t)(~(TIM1_CCER2_CC4E | TIM1_CCER2_CC4P));
1140  01d6 c6525d        	ld	a,21085
1141  01d9 a4cf          	and	a,#207
1142  01db c7525d        	ld	21085,a
1143                     ; 353   TIM1->CCER2 |= (uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC4E ) |  
1143                     ; 354                            (uint8_t)(TIM1_OCPolarity  & TIM1_CCER2_CC4P ));
1145  01de 7b08          	ld	a,(OFST+7,sp)
1146  01e0 a420          	and	a,#32
1147  01e2 6b01          	ld	(OFST+0,sp),a
1148  01e4 9f            	ld	a,xl
1149  01e5 a410          	and	a,#16
1150  01e7 1a01          	or	a,(OFST+0,sp)
1151  01e9 ca525d        	or	a,21085
1152  01ec c7525d        	ld	21085,a
1153                     ; 357   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1153                     ; 358                           TIM1_OCMode);
1155  01ef c6525b        	ld	a,21083
1156  01f2 a48f          	and	a,#143
1157  01f4 1a02          	or	a,(OFST+1,sp)
1158  01f6 c7525b        	ld	21083,a
1159                     ; 361   if (TIM1_OCIdleState != TIM1_OCIDLESTATE_RESET)
1161  01f9 0d09          	tnz	(OFST+8,sp)
1162  01fb 270a          	jreq	L534
1163                     ; 363     TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
1165  01fd c6526f        	ld	a,21103
1166  0200 aadf          	or	a,#223
1167  0202 c7526f        	ld	21103,a
1169  0205 2004          	jra	L734
1170  0207               L534:
1171                     ; 367     TIM1->OISR &= (uint8_t)(~TIM1_OISR_OIS4);
1173  0207 721d526f      	bres	21103,#6
1174  020b               L734:
1175                     ; 371   TIM1->CCR4H = (uint8_t)(TIM1_Pulse >> 8);
1177  020b 7b06          	ld	a,(OFST+5,sp)
1178  020d c7526b        	ld	21099,a
1179                     ; 372   TIM1->CCR4L = (uint8_t)(TIM1_Pulse);
1181  0210 7b07          	ld	a,(OFST+6,sp)
1182  0212 c7526c        	ld	21100,a
1183                     ; 373 }
1186  0215 5b03          	addw	sp,#3
1187  0217 81            	ret
1392                     ; 388 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
1392                     ; 389                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
1392                     ; 390                      uint8_t TIM1_DeadTime,
1392                     ; 391                      TIM1_BreakState_TypeDef TIM1_Break,
1392                     ; 392                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
1392                     ; 393                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
1392                     ; 394 {
1393                     	switch	.text
1394  0218               _TIM1_BDTRConfig:
1396  0218 89            	pushw	x
1397  0219 88            	push	a
1398       00000001      OFST:	set	1
1401                     ; 396   assert_param(IS_TIM1_OSSI_STATE_OK(TIM1_OSSIState));
1403                     ; 397   assert_param(IS_TIM1_LOCK_LEVEL_OK(TIM1_LockLevel));
1405                     ; 398   assert_param(IS_TIM1_BREAK_STATE_OK(TIM1_Break));
1407                     ; 399   assert_param(IS_TIM1_BREAK_POLARITY_OK(TIM1_BreakPolarity));
1409                     ; 400   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE_OK(TIM1_AutomaticOutput));
1411                     ; 402   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
1413  021a 7b06          	ld	a,(OFST+5,sp)
1414  021c c7526e        	ld	21102,a
1415                     ; 406   TIM1->BKR  =  (uint8_t)((uint8_t)(TIM1_OSSIState | (uint8_t)TIM1_LockLevel)  | 
1415                     ; 407                           (uint8_t)((uint8_t)(TIM1_Break | (uint8_t)TIM1_BreakPolarity)  | 
1415                     ; 408                           (uint8_t)TIM1_AutomaticOutput));
1417  021f 7b07          	ld	a,(OFST+6,sp)
1418  0221 1a08          	or	a,(OFST+7,sp)
1419  0223 1a09          	or	a,(OFST+8,sp)
1420  0225 6b01          	ld	(OFST+0,sp),a
1421  0227 9f            	ld	a,xl
1422  0228 1a02          	or	a,(OFST+1,sp)
1423  022a 1a01          	or	a,(OFST+0,sp)
1424  022c c7526d        	ld	21101,a
1425                     ; 409 }
1428  022f 5b03          	addw	sp,#3
1429  0231 81            	ret
1631                     ; 423 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
1631                     ; 424                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1631                     ; 425                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
1631                     ; 426                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1631                     ; 427                  uint8_t TIM1_ICFilter)
1631                     ; 428 {
1632                     	switch	.text
1633  0232               _TIM1_ICInit:
1635  0232 89            	pushw	x
1636       00000000      OFST:	set	0
1639                     ; 430   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
1641                     ; 431   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1643                     ; 432   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1645                     ; 433   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1647                     ; 434   assert_param(IS_TIM1_IC_FILTER_OK(TIM1_ICFilter));
1649                     ; 436   if (TIM1_Channel == TIM1_CHANNEL_1)
1651  0233 9e            	ld	a,xh
1652  0234 4d            	tnz	a
1653  0235 2614          	jrne	L766
1654                     ; 439     TI1_Config((uint8_t)TIM1_ICPolarity,
1654                     ; 440                (uint8_t)TIM1_ICSelection,
1654                     ; 441                (uint8_t)TIM1_ICFilter);
1656  0237 7b07          	ld	a,(OFST+7,sp)
1657  0239 88            	push	a
1658  023a 7b06          	ld	a,(OFST+6,sp)
1659  023c 97            	ld	xl,a
1660  023d 7b03          	ld	a,(OFST+3,sp)
1661  023f 95            	ld	xh,a
1662  0240 cd080f        	call	L3_TI1_Config
1664  0243 84            	pop	a
1665                     ; 443     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1667  0244 7b06          	ld	a,(OFST+6,sp)
1668  0246 cd06b7        	call	_TIM1_SetIC1Prescaler
1671  0249 2046          	jra	L176
1672  024b               L766:
1673                     ; 445   else if (TIM1_Channel == TIM1_CHANNEL_2)
1675  024b 7b01          	ld	a,(OFST+1,sp)
1676  024d a101          	cp	a,#1
1677  024f 2614          	jrne	L376
1678                     ; 448     TI2_Config((uint8_t)TIM1_ICPolarity,
1678                     ; 449                (uint8_t)TIM1_ICSelection,
1678                     ; 450                (uint8_t)TIM1_ICFilter);
1680  0251 7b07          	ld	a,(OFST+7,sp)
1681  0253 88            	push	a
1682  0254 7b06          	ld	a,(OFST+6,sp)
1683  0256 97            	ld	xl,a
1684  0257 7b03          	ld	a,(OFST+3,sp)
1685  0259 95            	ld	xh,a
1686  025a cd083f        	call	L5_TI2_Config
1688  025d 84            	pop	a
1689                     ; 452     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1691  025e 7b06          	ld	a,(OFST+6,sp)
1692  0260 cd06c4        	call	_TIM1_SetIC2Prescaler
1695  0263 202c          	jra	L176
1696  0265               L376:
1697                     ; 454   else if (TIM1_Channel == TIM1_CHANNEL_3)
1699  0265 7b01          	ld	a,(OFST+1,sp)
1700  0267 a102          	cp	a,#2
1701  0269 2614          	jrne	L776
1702                     ; 457     TI3_Config((uint8_t)TIM1_ICPolarity,
1702                     ; 458                (uint8_t)TIM1_ICSelection,
1702                     ; 459                (uint8_t)TIM1_ICFilter);
1704  026b 7b07          	ld	a,(OFST+7,sp)
1705  026d 88            	push	a
1706  026e 7b06          	ld	a,(OFST+6,sp)
1707  0270 97            	ld	xl,a
1708  0271 7b03          	ld	a,(OFST+3,sp)
1709  0273 95            	ld	xh,a
1710  0274 cd086f        	call	L7_TI3_Config
1712  0277 84            	pop	a
1713                     ; 461     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
1715  0278 7b06          	ld	a,(OFST+6,sp)
1716  027a cd06d1        	call	_TIM1_SetIC3Prescaler
1719  027d 2012          	jra	L176
1720  027f               L776:
1721                     ; 466     TI4_Config((uint8_t)TIM1_ICPolarity,
1721                     ; 467                (uint8_t)TIM1_ICSelection,
1721                     ; 468                (uint8_t)TIM1_ICFilter);
1723  027f 7b07          	ld	a,(OFST+7,sp)
1724  0281 88            	push	a
1725  0282 7b06          	ld	a,(OFST+6,sp)
1726  0284 97            	ld	xl,a
1727  0285 7b03          	ld	a,(OFST+3,sp)
1728  0287 95            	ld	xh,a
1729  0288 cd089f        	call	L11_TI4_Config
1731  028b 84            	pop	a
1732                     ; 470     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
1734  028c 7b06          	ld	a,(OFST+6,sp)
1735  028e cd06de        	call	_TIM1_SetIC4Prescaler
1737  0291               L176:
1738                     ; 472 }
1741  0291 85            	popw	x
1742  0292 81            	ret
1838                     ; 488 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
1838                     ; 489                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1838                     ; 490                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
1838                     ; 491                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1838                     ; 492                      uint8_t TIM1_ICFilter)
1838                     ; 493 {
1839                     	switch	.text
1840  0293               _TIM1_PWMIConfig:
1842  0293 89            	pushw	x
1843  0294 89            	pushw	x
1844       00000002      OFST:	set	2
1847                     ; 494   uint8_t icpolarity = TIM1_ICPOLARITY_RISING;
1849                     ; 495   uint8_t icselection = TIM1_ICSELECTION_DIRECTTI;
1851                     ; 498   assert_param(IS_TIM1_PWMI_CHANNEL_OK(TIM1_Channel));
1853                     ; 499   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1855                     ; 500   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1857                     ; 501   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1859                     ; 504   if (TIM1_ICPolarity != TIM1_ICPOLARITY_FALLING)
1861  0295 9f            	ld	a,xl
1862  0296 a101          	cp	a,#1
1863  0298 2706          	jreq	L157
1864                     ; 506     icpolarity = TIM1_ICPOLARITY_FALLING;
1866  029a a601          	ld	a,#1
1867  029c 6b01          	ld	(OFST-1,sp),a
1869  029e 2002          	jra	L357
1870  02a0               L157:
1871                     ; 510     icpolarity = TIM1_ICPOLARITY_RISING;
1873  02a0 0f01          	clr	(OFST-1,sp)
1874  02a2               L357:
1875                     ; 514   if (TIM1_ICSelection == TIM1_ICSELECTION_DIRECTTI)
1877  02a2 7b07          	ld	a,(OFST+5,sp)
1878  02a4 a101          	cp	a,#1
1879  02a6 2606          	jrne	L557
1880                     ; 516     icselection = TIM1_ICSELECTION_INDIRECTTI;
1882  02a8 a602          	ld	a,#2
1883  02aa 6b02          	ld	(OFST+0,sp),a
1885  02ac 2004          	jra	L757
1886  02ae               L557:
1887                     ; 520     icselection = TIM1_ICSELECTION_DIRECTTI;
1889  02ae a601          	ld	a,#1
1890  02b0 6b02          	ld	(OFST+0,sp),a
1891  02b2               L757:
1892                     ; 523   if (TIM1_Channel == TIM1_CHANNEL_1)
1894  02b2 0d03          	tnz	(OFST+1,sp)
1895  02b4 2626          	jrne	L167
1896                     ; 526     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1896                     ; 527                (uint8_t)TIM1_ICFilter);
1898  02b6 7b09          	ld	a,(OFST+7,sp)
1899  02b8 88            	push	a
1900  02b9 7b08          	ld	a,(OFST+6,sp)
1901  02bb 97            	ld	xl,a
1902  02bc 7b05          	ld	a,(OFST+3,sp)
1903  02be 95            	ld	xh,a
1904  02bf cd080f        	call	L3_TI1_Config
1906  02c2 84            	pop	a
1907                     ; 530     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1909  02c3 7b08          	ld	a,(OFST+6,sp)
1910  02c5 cd06b7        	call	_TIM1_SetIC1Prescaler
1912                     ; 533     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
1914  02c8 7b09          	ld	a,(OFST+7,sp)
1915  02ca 88            	push	a
1916  02cb 7b03          	ld	a,(OFST+1,sp)
1917  02cd 97            	ld	xl,a
1918  02ce 7b02          	ld	a,(OFST+0,sp)
1919  02d0 95            	ld	xh,a
1920  02d1 cd083f        	call	L5_TI2_Config
1922  02d4 84            	pop	a
1923                     ; 536     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1925  02d5 7b08          	ld	a,(OFST+6,sp)
1926  02d7 cd06c4        	call	_TIM1_SetIC2Prescaler
1929  02da 2024          	jra	L367
1930  02dc               L167:
1931                     ; 541     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1931                     ; 542                (uint8_t)TIM1_ICFilter);
1933  02dc 7b09          	ld	a,(OFST+7,sp)
1934  02de 88            	push	a
1935  02df 7b08          	ld	a,(OFST+6,sp)
1936  02e1 97            	ld	xl,a
1937  02e2 7b05          	ld	a,(OFST+3,sp)
1938  02e4 95            	ld	xh,a
1939  02e5 cd083f        	call	L5_TI2_Config
1941  02e8 84            	pop	a
1942                     ; 545     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1944  02e9 7b08          	ld	a,(OFST+6,sp)
1945  02eb cd06c4        	call	_TIM1_SetIC2Prescaler
1947                     ; 548     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
1949  02ee 7b09          	ld	a,(OFST+7,sp)
1950  02f0 88            	push	a
1951  02f1 7b03          	ld	a,(OFST+1,sp)
1952  02f3 97            	ld	xl,a
1953  02f4 7b02          	ld	a,(OFST+0,sp)
1954  02f6 95            	ld	xh,a
1955  02f7 cd080f        	call	L3_TI1_Config
1957  02fa 84            	pop	a
1958                     ; 551     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1960  02fb 7b08          	ld	a,(OFST+6,sp)
1961  02fd cd06b7        	call	_TIM1_SetIC1Prescaler
1963  0300               L367:
1964                     ; 553 }
1967  0300 5b04          	addw	sp,#4
1968  0302 81            	ret
2023                     ; 561 void TIM1_Cmd(FunctionalState NewState)
2023                     ; 562 {
2024                     	switch	.text
2025  0303               _TIM1_Cmd:
2029                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2031                     ; 567   if (NewState != DISABLE)
2033  0303 4d            	tnz	a
2034  0304 2706          	jreq	L3101
2035                     ; 569     TIM1->CR1 |= TIM1_CR1_CEN;
2037  0306 72105250      	bset	21072,#0
2039  030a 2004          	jra	L5101
2040  030c               L3101:
2041                     ; 573     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
2043  030c 72115250      	bres	21072,#0
2044  0310               L5101:
2045                     ; 575 }
2048  0310 81            	ret
2084                     ; 583 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2084                     ; 584 {
2085                     	switch	.text
2086  0311               _TIM1_CtrlPWMOutputs:
2090                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2092                     ; 590   if (NewState != DISABLE)
2094  0311 4d            	tnz	a
2095  0312 2706          	jreq	L5301
2096                     ; 592     TIM1->BKR |= TIM1_BKR_MOE;
2098  0314 721e526d      	bset	21101,#7
2100  0318 2004          	jra	L7301
2101  031a               L5301:
2102                     ; 596     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2104  031a 721f526d      	bres	21101,#7
2105  031e               L7301:
2106                     ; 598 }
2109  031e 81            	ret
2216                     ; 617 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
2216                     ; 618 {
2217                     	switch	.text
2218  031f               _TIM1_ITConfig:
2220  031f 89            	pushw	x
2221       00000000      OFST:	set	0
2224                     ; 620   assert_param(IS_TIM1_IT_OK(TIM1_IT));
2226                     ; 621   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2228                     ; 623   if (NewState != DISABLE)
2230  0320 9f            	ld	a,xl
2231  0321 4d            	tnz	a
2232  0322 2709          	jreq	L7011
2233                     ; 626     TIM1->IER |= (uint8_t)TIM1_IT;
2235  0324 9e            	ld	a,xh
2236  0325 ca5254        	or	a,21076
2237  0328 c75254        	ld	21076,a
2239  032b 2009          	jra	L1111
2240  032d               L7011:
2241                     ; 631     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
2243  032d 7b01          	ld	a,(OFST+1,sp)
2244  032f 43            	cpl	a
2245  0330 c45254        	and	a,21076
2246  0333 c75254        	ld	21076,a
2247  0336               L1111:
2248                     ; 633 }
2251  0336 85            	popw	x
2252  0337 81            	ret
2276                     ; 640 void TIM1_InternalClockConfig(void)
2276                     ; 641 {
2277                     	switch	.text
2278  0338               _TIM1_InternalClockConfig:
2282                     ; 643   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
2284  0338 c65252        	ld	a,21074
2285  033b a4f8          	and	a,#248
2286  033d c75252        	ld	21074,a
2287                     ; 644 }
2290  0340 81            	ret
2407                     ; 662 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2407                     ; 663                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2407                     ; 664                               uint8_t ExtTRGFilter)
2407                     ; 665 {
2408                     	switch	.text
2409  0341               _TIM1_ETRClockMode1Config:
2411  0341 89            	pushw	x
2412       00000000      OFST:	set	0
2415                     ; 667   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2417                     ; 668   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2419                     ; 671   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2421  0342 7b05          	ld	a,(OFST+5,sp)
2422  0344 88            	push	a
2423  0345 9f            	ld	a,xl
2424  0346 97            	ld	xl,a
2425  0347 7b02          	ld	a,(OFST+2,sp)
2426  0349 95            	ld	xh,a
2427  034a ad1f          	call	_TIM1_ETRConfig
2429  034c 84            	pop	a
2430                     ; 674   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(uint8_t)(TIM1_SMCR_SMS | TIM1_SMCR_TS )))
2430                     ; 675                          | (uint8_t)((uint8_t)TIM1_SLAVEMODE_EXTERNAL1 | TIM1_TS_ETRF ));
2432  034d c65252        	ld	a,21074
2433  0350 a488          	and	a,#136
2434  0352 aa77          	or	a,#119
2435  0354 c75252        	ld	21074,a
2436                     ; 676 }
2439  0357 85            	popw	x
2440  0358 81            	ret
2498                     ; 694 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2498                     ; 695                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2498                     ; 696                               uint8_t ExtTRGFilter)
2498                     ; 697 {
2499                     	switch	.text
2500  0359               _TIM1_ETRClockMode2Config:
2502  0359 89            	pushw	x
2503       00000000      OFST:	set	0
2506                     ; 699   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2508                     ; 700   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2510                     ; 703   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2512  035a 7b05          	ld	a,(OFST+5,sp)
2513  035c 88            	push	a
2514  035d 9f            	ld	a,xl
2515  035e 97            	ld	xl,a
2516  035f 7b02          	ld	a,(OFST+2,sp)
2517  0361 95            	ld	xh,a
2518  0362 ad07          	call	_TIM1_ETRConfig
2520  0364 84            	pop	a
2521                     ; 706   TIM1->ETR |= TIM1_ETR_ECE;
2523  0365 721c5253      	bset	21075,#6
2524                     ; 707 }
2527  0369 85            	popw	x
2528  036a 81            	ret
2584                     ; 725 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2584                     ; 726                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2584                     ; 727                     uint8_t ExtTRGFilter)
2584                     ; 728 {
2585                     	switch	.text
2586  036b               _TIM1_ETRConfig:
2588  036b 89            	pushw	x
2589       00000000      OFST:	set	0
2592                     ; 730   assert_param(IS_TIM1_EXT_TRG_FILTER_OK(ExtTRGFilter));
2594                     ; 732   TIM1->ETR |= (uint8_t)((uint8_t)(TIM1_ExtTRGPrescaler | (uint8_t)TIM1_ExtTRGPolarity )|
2594                     ; 733                          (uint8_t)ExtTRGFilter );
2596  036c 9f            	ld	a,xl
2597  036d 1a01          	or	a,(OFST+1,sp)
2598  036f 1a05          	or	a,(OFST+5,sp)
2599  0371 ca5253        	or	a,21075
2600  0374 c75253        	ld	21075,a
2601                     ; 734 }
2604  0377 85            	popw	x
2605  0378 81            	ret
2694                     ; 751 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
2694                     ; 752                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2694                     ; 753                                  uint8_t ICFilter)
2694                     ; 754 {
2695                     	switch	.text
2696  0379               _TIM1_TIxExternalClockConfig:
2698  0379 89            	pushw	x
2699       00000000      OFST:	set	0
2702                     ; 756   assert_param(IS_TIM1_TIXCLK_SOURCE_OK(TIM1_TIxExternalCLKSource));
2704                     ; 757   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2706                     ; 758   assert_param(IS_TIM1_IC_FILTER_OK(ICFilter));
2708                     ; 761   if (TIM1_TIxExternalCLKSource == TIM1_TIXEXTERNALCLK1SOURCE_TI2)
2710  037a 9e            	ld	a,xh
2711  037b a160          	cp	a,#96
2712  037d 260f          	jrne	L1131
2713                     ; 763     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2715  037f 7b05          	ld	a,(OFST+5,sp)
2716  0381 88            	push	a
2717  0382 ae0001        	ldw	x,#1
2718  0385 7b03          	ld	a,(OFST+3,sp)
2719  0387 95            	ld	xh,a
2720  0388 cd083f        	call	L5_TI2_Config
2722  038b 84            	pop	a
2724  038c 200d          	jra	L3131
2725  038e               L1131:
2726                     ; 767     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2728  038e 7b05          	ld	a,(OFST+5,sp)
2729  0390 88            	push	a
2730  0391 ae0001        	ldw	x,#1
2731  0394 7b03          	ld	a,(OFST+3,sp)
2732  0396 95            	ld	xh,a
2733  0397 cd080f        	call	L3_TI1_Config
2735  039a 84            	pop	a
2736  039b               L3131:
2737                     ; 771   TIM1_SelectInputTrigger((TIM1_TS_TypeDef)TIM1_TIxExternalCLKSource);
2739  039b 7b01          	ld	a,(OFST+1,sp)
2740  039d ad0a          	call	_TIM1_SelectInputTrigger
2742                     ; 774   TIM1->SMCR |= (uint8_t)(TIM1_SLAVEMODE_EXTERNAL1);
2744  039f c65252        	ld	a,21074
2745  03a2 aa07          	or	a,#7
2746  03a4 c75252        	ld	21074,a
2747                     ; 775 }
2750  03a7 85            	popw	x
2751  03a8 81            	ret
2836                     ; 787 void TIM1_SelectInputTrigger(TIM1_TS_TypeDef TIM1_InputTriggerSource)
2836                     ; 788 {
2837                     	switch	.text
2838  03a9               _TIM1_SelectInputTrigger:
2840  03a9 88            	push	a
2841       00000000      OFST:	set	0
2844                     ; 790   assert_param(IS_TIM1_TRIGGER_SELECTION_OK(TIM1_InputTriggerSource));
2846                     ; 793   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
2848  03aa c65252        	ld	a,21074
2849  03ad a48f          	and	a,#143
2850  03af 1a01          	or	a,(OFST+1,sp)
2851  03b1 c75252        	ld	21074,a
2852                     ; 794 }
2855  03b4 84            	pop	a
2856  03b5 81            	ret
2892                     ; 803 void TIM1_UpdateDisableConfig(FunctionalState NewState)
2892                     ; 804 {
2893                     	switch	.text
2894  03b6               _TIM1_UpdateDisableConfig:
2898                     ; 806   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2900                     ; 809   if (NewState != DISABLE)
2902  03b6 4d            	tnz	a
2903  03b7 2706          	jreq	L1731
2904                     ; 811     TIM1->CR1 |= TIM1_CR1_UDIS;
2906  03b9 72125250      	bset	21072,#1
2908  03bd 2004          	jra	L3731
2909  03bf               L1731:
2910                     ; 815     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
2912  03bf 72135250      	bres	21072,#1
2913  03c3               L3731:
2914                     ; 817 }
2917  03c3 81            	ret
2975                     ; 827 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
2975                     ; 828 {
2976                     	switch	.text
2977  03c4               _TIM1_UpdateRequestConfig:
2981                     ; 830   assert_param(IS_TIM1_UPDATE_SOURCE_OK(TIM1_UpdateSource));
2983                     ; 833   if (TIM1_UpdateSource != TIM1_UPDATESOURCE_GLOBAL)
2985  03c4 4d            	tnz	a
2986  03c5 2706          	jreq	L3241
2987                     ; 835     TIM1->CR1 |= TIM1_CR1_URS;
2989  03c7 72145250      	bset	21072,#2
2991  03cb 2004          	jra	L5241
2992  03cd               L3241:
2993                     ; 839     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
2995  03cd 72155250      	bres	21072,#2
2996  03d1               L5241:
2997                     ; 841 }
3000  03d1 81            	ret
3036                     ; 849 void TIM1_SelectHallSensor(FunctionalState NewState)
3036                     ; 850 {
3037                     	switch	.text
3038  03d2               _TIM1_SelectHallSensor:
3042                     ; 852   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3044                     ; 855   if (NewState != DISABLE)
3046  03d2 4d            	tnz	a
3047  03d3 2706          	jreq	L5441
3048                     ; 857     TIM1->CR2 |= TIM1_CR2_TI1S;
3050  03d5 721e5251      	bset	21073,#7
3052  03d9 2004          	jra	L7441
3053  03db               L5441:
3054                     ; 861     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
3056  03db 721f5251      	bres	21073,#7
3057  03df               L7441:
3058                     ; 863 }
3061  03df 81            	ret
3118                     ; 873 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
3118                     ; 874 {
3119                     	switch	.text
3120  03e0               _TIM1_SelectOnePulseMode:
3124                     ; 876   assert_param(IS_TIM1_OPM_MODE_OK(TIM1_OPMode));
3126                     ; 879   if (TIM1_OPMode != TIM1_OPMODE_REPETITIVE)
3128  03e0 4d            	tnz	a
3129  03e1 2706          	jreq	L7741
3130                     ; 881     TIM1->CR1 |= TIM1_CR1_OPM;
3132  03e3 72165250      	bset	21072,#3
3134  03e7 2004          	jra	L1051
3135  03e9               L7741:
3136                     ; 885     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
3138  03e9 72175250      	bres	21072,#3
3139  03ed               L1051:
3140                     ; 888 }
3143  03ed 81            	ret
3241                     ; 903 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
3241                     ; 904 {
3242                     	switch	.text
3243  03ee               _TIM1_SelectOutputTrigger:
3245  03ee 88            	push	a
3246       00000000      OFST:	set	0
3249                     ; 906   assert_param(IS_TIM1_TRGO_SOURCE_OK(TIM1_TRGOSource));
3251                     ; 909   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | 
3251                     ; 910                         (uint8_t) TIM1_TRGOSource);
3253  03ef c65251        	ld	a,21073
3254  03f2 a48f          	and	a,#143
3255  03f4 1a01          	or	a,(OFST+1,sp)
3256  03f6 c75251        	ld	21073,a
3257                     ; 911 }
3260  03f9 84            	pop	a
3261  03fa 81            	ret
3335                     ; 923 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
3335                     ; 924 {
3336                     	switch	.text
3337  03fb               _TIM1_SelectSlaveMode:
3339  03fb 88            	push	a
3340       00000000      OFST:	set	0
3343                     ; 926   assert_param(IS_TIM1_SLAVE_MODE_OK(TIM1_SlaveMode));
3345                     ; 929   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) |
3345                     ; 930                          (uint8_t)TIM1_SlaveMode);
3347  03fc c65252        	ld	a,21074
3348  03ff a4f8          	and	a,#248
3349  0401 1a01          	or	a,(OFST+1,sp)
3350  0403 c75252        	ld	21074,a
3351                     ; 931 }
3354  0406 84            	pop	a
3355  0407 81            	ret
3391                     ; 939 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
3391                     ; 940 {
3392                     	switch	.text
3393  0408               _TIM1_SelectMasterSlaveMode:
3397                     ; 942   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3399                     ; 945   if (NewState != DISABLE)
3401  0408 4d            	tnz	a
3402  0409 2706          	jreq	L3161
3403                     ; 947     TIM1->SMCR |= TIM1_SMCR_MSM;
3405  040b 721e5252      	bset	21074,#7
3407  040f 2004          	jra	L5161
3408  0411               L3161:
3409                     ; 951     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
3411  0411 721f5252      	bres	21074,#7
3412  0415               L5161:
3413                     ; 953 }
3416  0415 81            	ret
3502                     ; 975 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
3502                     ; 976                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
3502                     ; 977                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
3502                     ; 978 {
3503                     	switch	.text
3504  0416               _TIM1_EncoderInterfaceConfig:
3506  0416 89            	pushw	x
3507       00000000      OFST:	set	0
3510                     ; 980   assert_param(IS_TIM1_ENCODER_MODE_OK(TIM1_EncoderMode));
3512                     ; 981   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC1Polarity));
3514                     ; 982   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC2Polarity));
3516                     ; 985   if (TIM1_IC1Polarity != TIM1_ICPOLARITY_RISING)
3518  0417 9f            	ld	a,xl
3519  0418 4d            	tnz	a
3520  0419 2706          	jreq	L7561
3521                     ; 987     TIM1->CCER1 |= TIM1_CCER1_CC1P;
3523  041b 7212525c      	bset	21084,#1
3525  041f 2004          	jra	L1661
3526  0421               L7561:
3527                     ; 991     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
3529  0421 7213525c      	bres	21084,#1
3530  0425               L1661:
3531                     ; 994   if (TIM1_IC2Polarity != TIM1_ICPOLARITY_RISING)
3533  0425 0d05          	tnz	(OFST+5,sp)
3534  0427 2706          	jreq	L3661
3535                     ; 996     TIM1->CCER1 |= TIM1_CCER1_CC2P;
3537  0429 721a525c      	bset	21084,#5
3539  042d 2004          	jra	L5661
3540  042f               L3661:
3541                     ; 1000     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
3543  042f 721b525c      	bres	21084,#5
3544  0433               L5661:
3545                     ; 1003   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS))
3545                     ; 1004                          | (uint8_t) TIM1_EncoderMode);
3547  0433 c65252        	ld	a,21074
3548  0436 a4f0          	and	a,#240
3549  0438 1a01          	or	a,(OFST+1,sp)
3550  043a c75252        	ld	21074,a
3551                     ; 1007   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS)) 
3551                     ; 1008                           | (uint8_t) CCMR_TIxDirect_Set);
3553  043d c65258        	ld	a,21080
3554  0440 a4fc          	and	a,#252
3555  0442 aa01          	or	a,#1
3556  0444 c75258        	ld	21080,a
3557                     ; 1009   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS))
3557                     ; 1010                           | (uint8_t) CCMR_TIxDirect_Set);
3559  0447 c65259        	ld	a,21081
3560  044a a4fc          	and	a,#252
3561  044c aa01          	or	a,#1
3562  044e c75259        	ld	21081,a
3563                     ; 1011 }
3566  0451 85            	popw	x
3567  0452 81            	ret
3634                     ; 1023 void TIM1_PrescalerConfig(uint16_t Prescaler,
3634                     ; 1024                           TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
3634                     ; 1025 {
3635                     	switch	.text
3636  0453               _TIM1_PrescalerConfig:
3638  0453 89            	pushw	x
3639       00000000      OFST:	set	0
3642                     ; 1027   assert_param(IS_TIM1_PRESCALER_RELOAD_OK(TIM1_PSCReloadMode));
3644                     ; 1030   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
3646  0454 9e            	ld	a,xh
3647  0455 c75260        	ld	21088,a
3648                     ; 1031   TIM1->PSCRL = (uint8_t)(Prescaler);
3650  0458 9f            	ld	a,xl
3651  0459 c75261        	ld	21089,a
3652                     ; 1034   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
3654  045c 7b05          	ld	a,(OFST+5,sp)
3655  045e c75257        	ld	21079,a
3656                     ; 1035 }
3659  0461 85            	popw	x
3660  0462 81            	ret
3696                     ; 1048 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
3696                     ; 1049 {
3697                     	switch	.text
3698  0463               _TIM1_CounterModeConfig:
3700  0463 88            	push	a
3701       00000000      OFST:	set	0
3704                     ; 1051   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
3706                     ; 1055   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
3706                     ; 1056                         | (uint8_t)TIM1_CounterMode);
3708  0464 c65250        	ld	a,21072
3709  0467 a48f          	and	a,#143
3710  0469 1a01          	or	a,(OFST+1,sp)
3711  046b c75250        	ld	21072,a
3712                     ; 1057 }
3715  046e 84            	pop	a
3716  046f 81            	ret
3774                     ; 1067 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3774                     ; 1068 {
3775                     	switch	.text
3776  0470               _TIM1_ForcedOC1Config:
3778  0470 88            	push	a
3779       00000000      OFST:	set	0
3782                     ; 1070   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3784                     ; 1073   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))|
3784                     ; 1074                            (uint8_t)TIM1_ForcedAction);
3786  0471 c65258        	ld	a,21080
3787  0474 a48f          	and	a,#143
3788  0476 1a01          	or	a,(OFST+1,sp)
3789  0478 c75258        	ld	21080,a
3790                     ; 1075 }
3793  047b 84            	pop	a
3794  047c 81            	ret
3830                     ; 1085 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3830                     ; 1086 {
3831                     	switch	.text
3832  047d               _TIM1_ForcedOC2Config:
3834  047d 88            	push	a
3835       00000000      OFST:	set	0
3838                     ; 1088   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3840                     ; 1091   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
3840                     ; 1092                             | (uint8_t)TIM1_ForcedAction);
3842  047e c65259        	ld	a,21081
3843  0481 a48f          	and	a,#143
3844  0483 1a01          	or	a,(OFST+1,sp)
3845  0485 c75259        	ld	21081,a
3846                     ; 1093 }
3849  0488 84            	pop	a
3850  0489 81            	ret
3886                     ; 1104 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3886                     ; 1105 {
3887                     	switch	.text
3888  048a               _TIM1_ForcedOC3Config:
3890  048a 88            	push	a
3891       00000000      OFST:	set	0
3894                     ; 1107   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3896                     ; 1110   TIM1->CCMR3  =  (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM))  
3896                     ; 1111                             | (uint8_t)TIM1_ForcedAction);
3898  048b c6525a        	ld	a,21082
3899  048e a48f          	and	a,#143
3900  0490 1a01          	or	a,(OFST+1,sp)
3901  0492 c7525a        	ld	21082,a
3902                     ; 1112 }
3905  0495 84            	pop	a
3906  0496 81            	ret
3942                     ; 1123 void TIM1_ForcedOC4Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3942                     ; 1124 {
3943                     	switch	.text
3944  0497               _TIM1_ForcedOC4Config:
3946  0497 88            	push	a
3947       00000000      OFST:	set	0
3950                     ; 1126   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3952                     ; 1129   TIM1->CCMR4  =  (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
3952                     ; 1130                             | (uint8_t)TIM1_ForcedAction);
3954  0498 c6525b        	ld	a,21083
3955  049b a48f          	and	a,#143
3956  049d 1a01          	or	a,(OFST+1,sp)
3957  049f c7525b        	ld	21083,a
3958                     ; 1131 }
3961  04a2 84            	pop	a
3962  04a3 81            	ret
3998                     ; 1139 void TIM1_ARRPreloadConfig(FunctionalState NewState)
3998                     ; 1140 {
3999                     	switch	.text
4000  04a4               _TIM1_ARRPreloadConfig:
4004                     ; 1142   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4006                     ; 1145   if (NewState != DISABLE)
4008  04a4 4d            	tnz	a
4009  04a5 2706          	jreq	L5502
4010                     ; 1147     TIM1->CR1 |= TIM1_CR1_ARPE;
4012  04a7 721e5250      	bset	21072,#7
4014  04ab 2004          	jra	L7502
4015  04ad               L5502:
4016                     ; 1151     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
4018  04ad 721f5250      	bres	21072,#7
4019  04b1               L7502:
4020                     ; 1153 }
4023  04b1 81            	ret
4058                     ; 1161 void TIM1_SelectCOM(FunctionalState NewState)
4058                     ; 1162 {
4059                     	switch	.text
4060  04b2               _TIM1_SelectCOM:
4064                     ; 1164   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4066                     ; 1167   if (NewState != DISABLE)
4068  04b2 4d            	tnz	a
4069  04b3 2706          	jreq	L7702
4070                     ; 1169     TIM1->CR2 |= TIM1_CR2_COMS;
4072  04b5 72145251      	bset	21073,#2
4074  04b9 2004          	jra	L1012
4075  04bb               L7702:
4076                     ; 1173     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_COMS);
4078  04bb 72155251      	bres	21073,#2
4079  04bf               L1012:
4080                     ; 1175 }
4083  04bf 81            	ret
4119                     ; 1183 void TIM1_CCPreloadControl(FunctionalState NewState)
4119                     ; 1184 {
4120                     	switch	.text
4121  04c0               _TIM1_CCPreloadControl:
4125                     ; 1186   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4127                     ; 1189   if (NewState != DISABLE)
4129  04c0 4d            	tnz	a
4130  04c1 2706          	jreq	L1212
4131                     ; 1191     TIM1->CR2 |= TIM1_CR2_CCPC;
4133  04c3 72105251      	bset	21073,#0
4135  04c7 2004          	jra	L3212
4136  04c9               L1212:
4137                     ; 1195     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
4139  04c9 72115251      	bres	21073,#0
4140  04cd               L3212:
4141                     ; 1197 }
4144  04cd 81            	ret
4180                     ; 1205 void TIM1_OC1PreloadConfig(FunctionalState NewState)
4180                     ; 1206 {
4181                     	switch	.text
4182  04ce               _TIM1_OC1PreloadConfig:
4186                     ; 1208   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4188                     ; 1211   if (NewState != DISABLE)
4190  04ce 4d            	tnz	a
4191  04cf 2706          	jreq	L3412
4192                     ; 1213     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
4194  04d1 72165258      	bset	21080,#3
4196  04d5 2004          	jra	L5412
4197  04d7               L3412:
4198                     ; 1217     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4200  04d7 72175258      	bres	21080,#3
4201  04db               L5412:
4202                     ; 1219 }
4205  04db 81            	ret
4241                     ; 1227 void TIM1_OC2PreloadConfig(FunctionalState NewState)
4241                     ; 1228 {
4242                     	switch	.text
4243  04dc               _TIM1_OC2PreloadConfig:
4247                     ; 1230   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4249                     ; 1233   if (NewState != DISABLE)
4251  04dc 4d            	tnz	a
4252  04dd 2706          	jreq	L5612
4253                     ; 1235     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
4255  04df 72165259      	bset	21081,#3
4257  04e3 2004          	jra	L7612
4258  04e5               L5612:
4259                     ; 1239     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4261  04e5 72175259      	bres	21081,#3
4262  04e9               L7612:
4263                     ; 1241 }
4266  04e9 81            	ret
4302                     ; 1249 void TIM1_OC3PreloadConfig(FunctionalState NewState)
4302                     ; 1250 {
4303                     	switch	.text
4304  04ea               _TIM1_OC3PreloadConfig:
4308                     ; 1252   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4310                     ; 1255   if (NewState != DISABLE)
4312  04ea 4d            	tnz	a
4313  04eb 2706          	jreq	L7022
4314                     ; 1257     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
4316  04ed 7216525a      	bset	21082,#3
4318  04f1 2004          	jra	L1122
4319  04f3               L7022:
4320                     ; 1261     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4322  04f3 7217525a      	bres	21082,#3
4323  04f7               L1122:
4324                     ; 1263 }
4327  04f7 81            	ret
4363                     ; 1271 void TIM1_OC4PreloadConfig(FunctionalState NewState)
4363                     ; 1272 {
4364                     	switch	.text
4365  04f8               _TIM1_OC4PreloadConfig:
4369                     ; 1274   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4371                     ; 1277   if (NewState != DISABLE)
4373  04f8 4d            	tnz	a
4374  04f9 2706          	jreq	L1322
4375                     ; 1279     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
4377  04fb 7216525b      	bset	21083,#3
4379  04ff 2004          	jra	L3322
4380  0501               L1322:
4381                     ; 1283     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4383  0501 7217525b      	bres	21083,#3
4384  0505               L3322:
4385                     ; 1285 }
4388  0505 81            	ret
4423                     ; 1293 void TIM1_OC1FastConfig(FunctionalState NewState)
4423                     ; 1294 {
4424                     	switch	.text
4425  0506               _TIM1_OC1FastConfig:
4429                     ; 1296   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4431                     ; 1299   if (NewState != DISABLE)
4433  0506 4d            	tnz	a
4434  0507 2706          	jreq	L3522
4435                     ; 1301     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
4437  0509 72145258      	bset	21080,#2
4439  050d 2004          	jra	L5522
4440  050f               L3522:
4441                     ; 1305     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4443  050f 72155258      	bres	21080,#2
4444  0513               L5522:
4445                     ; 1307 }
4448  0513 81            	ret
4483                     ; 1315 void TIM1_OC2FastConfig(FunctionalState NewState)
4483                     ; 1316 {
4484                     	switch	.text
4485  0514               _TIM1_OC2FastConfig:
4489                     ; 1318   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4491                     ; 1321   if (NewState != DISABLE)
4493  0514 4d            	tnz	a
4494  0515 2706          	jreq	L5722
4495                     ; 1323     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
4497  0517 72145259      	bset	21081,#2
4499  051b 2004          	jra	L7722
4500  051d               L5722:
4501                     ; 1327     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4503  051d 72155259      	bres	21081,#2
4504  0521               L7722:
4505                     ; 1329 }
4508  0521 81            	ret
4543                     ; 1337 void TIM1_OC3FastConfig(FunctionalState NewState)
4543                     ; 1338 {
4544                     	switch	.text
4545  0522               _TIM1_OC3FastConfig:
4549                     ; 1340   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4551                     ; 1343   if (NewState != DISABLE)
4553  0522 4d            	tnz	a
4554  0523 2706          	jreq	L7132
4555                     ; 1345     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
4557  0525 7214525a      	bset	21082,#2
4559  0529 2004          	jra	L1232
4560  052b               L7132:
4561                     ; 1349     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4563  052b 7215525a      	bres	21082,#2
4564  052f               L1232:
4565                     ; 1351 }
4568  052f 81            	ret
4603                     ; 1359 void TIM1_OC4FastConfig(FunctionalState NewState)
4603                     ; 1360 {
4604                     	switch	.text
4605  0530               _TIM1_OC4FastConfig:
4609                     ; 1362   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4611                     ; 1365   if (NewState != DISABLE)
4613  0530 4d            	tnz	a
4614  0531 2706          	jreq	L1432
4615                     ; 1367     TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
4617  0533 7214525b      	bset	21083,#2
4619  0537 2004          	jra	L3432
4620  0539               L1432:
4621                     ; 1371     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4623  0539 7215525b      	bres	21083,#2
4624  053d               L3432:
4625                     ; 1373 }
4628  053d 81            	ret
4733                     ; 1389 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
4733                     ; 1390 {
4734                     	switch	.text
4735  053e               _TIM1_GenerateEvent:
4739                     ; 1392   assert_param(IS_TIM1_EVENT_SOURCE_OK(TIM1_EventSource));
4741                     ; 1395   TIM1->EGR = (uint8_t)TIM1_EventSource;
4743  053e c75257        	ld	21079,a
4744                     ; 1396 }
4747  0541 81            	ret
4783                     ; 1406 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4783                     ; 1407 {
4784                     	switch	.text
4785  0542               _TIM1_OC1PolarityConfig:
4789                     ; 1409   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4791                     ; 1412   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4793  0542 4d            	tnz	a
4794  0543 2706          	jreq	L5242
4795                     ; 1414     TIM1->CCER1 |= TIM1_CCER1_CC1P;
4797  0545 7212525c      	bset	21084,#1
4799  0549 2004          	jra	L7242
4800  054b               L5242:
4801                     ; 1418     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
4803  054b 7213525c      	bres	21084,#1
4804  054f               L7242:
4805                     ; 1420 }
4808  054f 81            	ret
4844                     ; 1430 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4844                     ; 1431 {
4845                     	switch	.text
4846  0550               _TIM1_OC1NPolarityConfig:
4850                     ; 1433   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4852                     ; 1436   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4854  0550 4d            	tnz	a
4855  0551 2706          	jreq	L7442
4856                     ; 1438     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
4858  0553 7216525c      	bset	21084,#3
4860  0557 2004          	jra	L1542
4861  0559               L7442:
4862                     ; 1442     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
4864  0559 7217525c      	bres	21084,#3
4865  055d               L1542:
4866                     ; 1444 }
4869  055d 81            	ret
4905                     ; 1454 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4905                     ; 1455 {
4906                     	switch	.text
4907  055e               _TIM1_OC2PolarityConfig:
4911                     ; 1457   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4913                     ; 1460   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4915  055e 4d            	tnz	a
4916  055f 2706          	jreq	L1742
4917                     ; 1462     TIM1->CCER1 |= TIM1_CCER1_CC2P;
4919  0561 721a525c      	bset	21084,#5
4921  0565 2004          	jra	L3742
4922  0567               L1742:
4923                     ; 1466     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
4925  0567 721b525c      	bres	21084,#5
4926  056b               L3742:
4927                     ; 1468 }
4930  056b 81            	ret
4966                     ; 1478 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4966                     ; 1479 {
4967                     	switch	.text
4968  056c               _TIM1_OC2NPolarityConfig:
4972                     ; 1481   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4974                     ; 1484   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4976  056c 4d            	tnz	a
4977  056d 2706          	jreq	L3152
4978                     ; 1486     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
4980  056f 721e525c      	bset	21084,#7
4982  0573 2004          	jra	L5152
4983  0575               L3152:
4984                     ; 1490     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
4986  0575 721f525c      	bres	21084,#7
4987  0579               L5152:
4988                     ; 1492 }
4991  0579 81            	ret
5027                     ; 1502 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5027                     ; 1503 {
5028                     	switch	.text
5029  057a               _TIM1_OC3PolarityConfig:
5033                     ; 1505   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5035                     ; 1508   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5037  057a 4d            	tnz	a
5038  057b 2706          	jreq	L5352
5039                     ; 1510     TIM1->CCER2 |= TIM1_CCER2_CC3P;
5041  057d 7212525d      	bset	21085,#1
5043  0581 2004          	jra	L7352
5044  0583               L5352:
5045                     ; 1514     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
5047  0583 7213525d      	bres	21085,#1
5048  0587               L7352:
5049                     ; 1516 }
5052  0587 81            	ret
5088                     ; 1527 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
5088                     ; 1528 {
5089                     	switch	.text
5090  0588               _TIM1_OC3NPolarityConfig:
5094                     ; 1530   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
5096                     ; 1533   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
5098  0588 4d            	tnz	a
5099  0589 2706          	jreq	L7552
5100                     ; 1535     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
5102  058b 7216525d      	bset	21085,#3
5104  058f 2004          	jra	L1652
5105  0591               L7552:
5106                     ; 1539     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
5108  0591 7217525d      	bres	21085,#3
5109  0595               L1652:
5110                     ; 1541 }
5113  0595 81            	ret
5149                     ; 1551 void TIM1_OC4PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5149                     ; 1552 {
5150                     	switch	.text
5151  0596               _TIM1_OC4PolarityConfig:
5155                     ; 1554   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5157                     ; 1557   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5159  0596 4d            	tnz	a
5160  0597 2706          	jreq	L1062
5161                     ; 1559     TIM1->CCER2 |= TIM1_CCER2_CC4P;
5163  0599 721a525d      	bset	21085,#5
5165  059d 2004          	jra	L3062
5166  059f               L1062:
5167                     ; 1563     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
5169  059f 721b525d      	bres	21085,#5
5170  05a3               L3062:
5171                     ; 1565 }
5174  05a3 81            	ret
5219                     ; 1579 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5219                     ; 1580 {
5220                     	switch	.text
5221  05a4               _TIM1_CCxCmd:
5223  05a4 89            	pushw	x
5224       00000000      OFST:	set	0
5227                     ; 1582   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5229                     ; 1583   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5231                     ; 1585   if (TIM1_Channel == TIM1_CHANNEL_1)
5233  05a5 9e            	ld	a,xh
5234  05a6 4d            	tnz	a
5235  05a7 2610          	jrne	L7262
5236                     ; 1588     if (NewState != DISABLE)
5238  05a9 9f            	ld	a,xl
5239  05aa 4d            	tnz	a
5240  05ab 2706          	jreq	L1362
5241                     ; 1590       TIM1->CCER1 |= TIM1_CCER1_CC1E;
5243  05ad 7210525c      	bset	21084,#0
5245  05b1 2040          	jra	L5362
5246  05b3               L1362:
5247                     ; 1594       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5249  05b3 7211525c      	bres	21084,#0
5250  05b7 203a          	jra	L5362
5251  05b9               L7262:
5252                     ; 1598   else if (TIM1_Channel == TIM1_CHANNEL_2)
5254  05b9 7b01          	ld	a,(OFST+1,sp)
5255  05bb a101          	cp	a,#1
5256  05bd 2610          	jrne	L7362
5257                     ; 1601     if (NewState != DISABLE)
5259  05bf 0d02          	tnz	(OFST+2,sp)
5260  05c1 2706          	jreq	L1462
5261                     ; 1603       TIM1->CCER1 |= TIM1_CCER1_CC2E;
5263  05c3 7218525c      	bset	21084,#4
5265  05c7 202a          	jra	L5362
5266  05c9               L1462:
5267                     ; 1607       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5269  05c9 7219525c      	bres	21084,#4
5270  05cd 2024          	jra	L5362
5271  05cf               L7362:
5272                     ; 1610   else if (TIM1_Channel == TIM1_CHANNEL_3)
5274  05cf 7b01          	ld	a,(OFST+1,sp)
5275  05d1 a102          	cp	a,#2
5276  05d3 2610          	jrne	L7462
5277                     ; 1613     if (NewState != DISABLE)
5279  05d5 0d02          	tnz	(OFST+2,sp)
5280  05d7 2706          	jreq	L1562
5281                     ; 1615       TIM1->CCER2 |= TIM1_CCER2_CC3E;
5283  05d9 7210525d      	bset	21085,#0
5285  05dd 2014          	jra	L5362
5286  05df               L1562:
5287                     ; 1619       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5289  05df 7211525d      	bres	21085,#0
5290  05e3 200e          	jra	L5362
5291  05e5               L7462:
5292                     ; 1625     if (NewState != DISABLE)
5294  05e5 0d02          	tnz	(OFST+2,sp)
5295  05e7 2706          	jreq	L7562
5296                     ; 1627       TIM1->CCER2 |= TIM1_CCER2_CC4E;
5298  05e9 7218525d      	bset	21085,#4
5300  05ed 2004          	jra	L5362
5301  05ef               L7562:
5302                     ; 1631       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5304  05ef 7219525d      	bres	21085,#4
5305  05f3               L5362:
5306                     ; 1634 }
5309  05f3 85            	popw	x
5310  05f4 81            	ret
5355                     ; 1647 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5355                     ; 1648 {
5356                     	switch	.text
5357  05f5               _TIM1_CCxNCmd:
5359  05f5 89            	pushw	x
5360       00000000      OFST:	set	0
5363                     ; 1650   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL_OK(TIM1_Channel));
5365                     ; 1651   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5367                     ; 1653   if (TIM1_Channel == TIM1_CHANNEL_1)
5369  05f6 9e            	ld	a,xh
5370  05f7 4d            	tnz	a
5371  05f8 2610          	jrne	L5072
5372                     ; 1656     if (NewState != DISABLE)
5374  05fa 9f            	ld	a,xl
5375  05fb 4d            	tnz	a
5376  05fc 2706          	jreq	L7072
5377                     ; 1658       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
5379  05fe 7214525c      	bset	21084,#2
5381  0602 202a          	jra	L3172
5382  0604               L7072:
5383                     ; 1662       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
5385  0604 7215525c      	bres	21084,#2
5386  0608 2024          	jra	L3172
5387  060a               L5072:
5388                     ; 1665   else if (TIM1_Channel == TIM1_CHANNEL_2)
5390  060a 7b01          	ld	a,(OFST+1,sp)
5391  060c a101          	cp	a,#1
5392  060e 2610          	jrne	L5172
5393                     ; 1668     if (NewState != DISABLE)
5395  0610 0d02          	tnz	(OFST+2,sp)
5396  0612 2706          	jreq	L7172
5397                     ; 1670       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
5399  0614 721c525c      	bset	21084,#6
5401  0618 2014          	jra	L3172
5402  061a               L7172:
5403                     ; 1674       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
5405  061a 721d525c      	bres	21084,#6
5406  061e 200e          	jra	L3172
5407  0620               L5172:
5408                     ; 1680     if (NewState != DISABLE)
5410  0620 0d02          	tnz	(OFST+2,sp)
5411  0622 2706          	jreq	L5272
5412                     ; 1682       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
5414  0624 7214525d      	bset	21085,#2
5416  0628 2004          	jra	L3172
5417  062a               L5272:
5418                     ; 1686       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
5420  062a 7215525d      	bres	21085,#2
5421  062e               L3172:
5422                     ; 1689 }
5425  062e 85            	popw	x
5426  062f 81            	ret
5471                     ; 1712 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
5471                     ; 1713 {
5472                     	switch	.text
5473  0630               _TIM1_SelectOCxM:
5475  0630 89            	pushw	x
5476       00000000      OFST:	set	0
5479                     ; 1715   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5481                     ; 1716   assert_param(IS_TIM1_OCM_OK(TIM1_OCMode));
5483                     ; 1718   if (TIM1_Channel == TIM1_CHANNEL_1)
5485  0631 9e            	ld	a,xh
5486  0632 4d            	tnz	a
5487  0633 2610          	jrne	L3572
5488                     ; 1721     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5490  0635 7211525c      	bres	21084,#0
5491                     ; 1724     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) 
5491                     ; 1725                             | (uint8_t)TIM1_OCMode);
5493  0639 c65258        	ld	a,21080
5494  063c a48f          	and	a,#143
5495  063e 1a02          	or	a,(OFST+2,sp)
5496  0640 c75258        	ld	21080,a
5498  0643 203a          	jra	L5572
5499  0645               L3572:
5500                     ; 1727   else if (TIM1_Channel == TIM1_CHANNEL_2)
5502  0645 7b01          	ld	a,(OFST+1,sp)
5503  0647 a101          	cp	a,#1
5504  0649 2610          	jrne	L7572
5505                     ; 1730     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5507  064b 7219525c      	bres	21084,#4
5508                     ; 1733     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
5508                     ; 1734                             | (uint8_t)TIM1_OCMode);
5510  064f c65259        	ld	a,21081
5511  0652 a48f          	and	a,#143
5512  0654 1a02          	or	a,(OFST+2,sp)
5513  0656 c75259        	ld	21081,a
5515  0659 2024          	jra	L5572
5516  065b               L7572:
5517                     ; 1736   else if (TIM1_Channel == TIM1_CHANNEL_3)
5519  065b 7b01          	ld	a,(OFST+1,sp)
5520  065d a102          	cp	a,#2
5521  065f 2610          	jrne	L3672
5522                     ; 1739     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5524  0661 7211525d      	bres	21085,#0
5525                     ; 1742     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) 
5525                     ; 1743                             | (uint8_t)TIM1_OCMode);
5527  0665 c6525a        	ld	a,21082
5528  0668 a48f          	and	a,#143
5529  066a 1a02          	or	a,(OFST+2,sp)
5530  066c c7525a        	ld	21082,a
5532  066f 200e          	jra	L5572
5533  0671               L3672:
5534                     ; 1748     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5536  0671 7219525d      	bres	21085,#4
5537                     ; 1751     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
5537                     ; 1752                             | (uint8_t)TIM1_OCMode);
5539  0675 c6525b        	ld	a,21083
5540  0678 a48f          	and	a,#143
5541  067a 1a02          	or	a,(OFST+2,sp)
5542  067c c7525b        	ld	21083,a
5543  067f               L5572:
5544                     ; 1754 }
5547  067f 85            	popw	x
5548  0680 81            	ret
5582                     ; 1762 void TIM1_SetCounter(uint16_t Counter)
5582                     ; 1763 {
5583                     	switch	.text
5584  0681               _TIM1_SetCounter:
5588                     ; 1765   TIM1->CNTRH = (uint8_t)(Counter >> 8);
5590  0681 9e            	ld	a,xh
5591  0682 c7525e        	ld	21086,a
5592                     ; 1766   TIM1->CNTRL = (uint8_t)(Counter);
5594  0685 9f            	ld	a,xl
5595  0686 c7525f        	ld	21087,a
5596                     ; 1767 }
5599  0689 81            	ret
5633                     ; 1775 void TIM1_SetAutoreload(uint16_t Autoreload)
5633                     ; 1776 {
5634                     	switch	.text
5635  068a               _TIM1_SetAutoreload:
5639                     ; 1778   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
5641  068a 9e            	ld	a,xh
5642  068b c75262        	ld	21090,a
5643                     ; 1779   TIM1->ARRL = (uint8_t)(Autoreload);
5645  068e 9f            	ld	a,xl
5646  068f c75263        	ld	21091,a
5647                     ; 1780  }
5650  0692 81            	ret
5684                     ; 1788 void TIM1_SetCompare1(uint16_t Compare1)
5684                     ; 1789 {
5685                     	switch	.text
5686  0693               _TIM1_SetCompare1:
5690                     ; 1791   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
5692  0693 9e            	ld	a,xh
5693  0694 c75265        	ld	21093,a
5694                     ; 1792   TIM1->CCR1L = (uint8_t)(Compare1);
5696  0697 9f            	ld	a,xl
5697  0698 c75266        	ld	21094,a
5698                     ; 1793 }
5701  069b 81            	ret
5735                     ; 1801 void TIM1_SetCompare2(uint16_t Compare2)
5735                     ; 1802 {
5736                     	switch	.text
5737  069c               _TIM1_SetCompare2:
5741                     ; 1804   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
5743  069c 9e            	ld	a,xh
5744  069d c75267        	ld	21095,a
5745                     ; 1805   TIM1->CCR2L = (uint8_t)(Compare2);
5747  06a0 9f            	ld	a,xl
5748  06a1 c75268        	ld	21096,a
5749                     ; 1806 }
5752  06a4 81            	ret
5786                     ; 1814 void TIM1_SetCompare3(uint16_t Compare3)
5786                     ; 1815 {
5787                     	switch	.text
5788  06a5               _TIM1_SetCompare3:
5792                     ; 1817   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
5794  06a5 9e            	ld	a,xh
5795  06a6 c75269        	ld	21097,a
5796                     ; 1818   TIM1->CCR3L = (uint8_t)(Compare3);
5798  06a9 9f            	ld	a,xl
5799  06aa c7526a        	ld	21098,a
5800                     ; 1819 }
5803  06ad 81            	ret
5837                     ; 1827 void TIM1_SetCompare4(uint16_t Compare4)
5837                     ; 1828 {
5838                     	switch	.text
5839  06ae               _TIM1_SetCompare4:
5843                     ; 1830   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
5845  06ae 9e            	ld	a,xh
5846  06af c7526b        	ld	21099,a
5847                     ; 1831   TIM1->CCR4L = (uint8_t)(Compare4);
5849  06b2 9f            	ld	a,xl
5850  06b3 c7526c        	ld	21100,a
5851                     ; 1832 }
5854  06b6 81            	ret
5890                     ; 1844 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
5890                     ; 1845 {
5891                     	switch	.text
5892  06b7               _TIM1_SetIC1Prescaler:
5894  06b7 88            	push	a
5895       00000000      OFST:	set	0
5898                     ; 1847   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC1Prescaler));
5900                     ; 1850   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) 
5900                     ; 1851                           | (uint8_t)TIM1_IC1Prescaler);
5902  06b8 c65258        	ld	a,21080
5903  06bb a4f3          	and	a,#243
5904  06bd 1a01          	or	a,(OFST+1,sp)
5905  06bf c75258        	ld	21080,a
5906                     ; 1852 }
5909  06c2 84            	pop	a
5910  06c3 81            	ret
5946                     ; 1864 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
5946                     ; 1865 {
5947                     	switch	.text
5948  06c4               _TIM1_SetIC2Prescaler:
5950  06c4 88            	push	a
5951       00000000      OFST:	set	0
5954                     ; 1868   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC2Prescaler));
5956                     ; 1871   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC))
5956                     ; 1872                           | (uint8_t)TIM1_IC2Prescaler);
5958  06c5 c65259        	ld	a,21081
5959  06c8 a4f3          	and	a,#243
5960  06ca 1a01          	or	a,(OFST+1,sp)
5961  06cc c75259        	ld	21081,a
5962                     ; 1873 }
5965  06cf 84            	pop	a
5966  06d0 81            	ret
6002                     ; 1885 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
6002                     ; 1886 {
6003                     	switch	.text
6004  06d1               _TIM1_SetIC3Prescaler:
6006  06d1 88            	push	a
6007       00000000      OFST:	set	0
6010                     ; 1889   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC3Prescaler));
6012                     ; 1892   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | 
6012                     ; 1893                           (uint8_t)TIM1_IC3Prescaler);
6014  06d2 c6525a        	ld	a,21082
6015  06d5 a4f3          	and	a,#243
6016  06d7 1a01          	or	a,(OFST+1,sp)
6017  06d9 c7525a        	ld	21082,a
6018                     ; 1894 }
6021  06dc 84            	pop	a
6022  06dd 81            	ret
6058                     ; 1906 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
6058                     ; 1907 {
6059                     	switch	.text
6060  06de               _TIM1_SetIC4Prescaler:
6062  06de 88            	push	a
6063       00000000      OFST:	set	0
6066                     ; 1910   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC4Prescaler));
6068                     ; 1913   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) |
6068                     ; 1914                           (uint8_t)TIM1_IC4Prescaler);
6070  06df c6525b        	ld	a,21083
6071  06e2 a4f3          	and	a,#243
6072  06e4 1a01          	or	a,(OFST+1,sp)
6073  06e6 c7525b        	ld	21083,a
6074                     ; 1915 }
6077  06e9 84            	pop	a
6078  06ea 81            	ret
6130                     ; 1922 uint16_t TIM1_GetCapture1(void)
6130                     ; 1923 {
6131                     	switch	.text
6132  06eb               _TIM1_GetCapture1:
6134  06eb 5204          	subw	sp,#4
6135       00000004      OFST:	set	4
6138                     ; 1926   uint16_t tmpccr1 = 0;
6140                     ; 1927   uint8_t tmpccr1l=0, tmpccr1h=0;
6144                     ; 1929   tmpccr1h = TIM1->CCR1H;
6146  06ed c65265        	ld	a,21093
6147  06f0 6b02          	ld	(OFST-2,sp),a
6148                     ; 1930   tmpccr1l = TIM1->CCR1L;
6150  06f2 c65266        	ld	a,21094
6151  06f5 6b01          	ld	(OFST-3,sp),a
6152                     ; 1932   tmpccr1 = (uint16_t)(tmpccr1l);
6154  06f7 7b01          	ld	a,(OFST-3,sp)
6155  06f9 5f            	clrw	x
6156  06fa 97            	ld	xl,a
6157  06fb 1f03          	ldw	(OFST-1,sp),x
6158                     ; 1933   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
6160  06fd 7b02          	ld	a,(OFST-2,sp)
6161  06ff 5f            	clrw	x
6162  0700 97            	ld	xl,a
6163  0701 4f            	clr	a
6164  0702 02            	rlwa	x,a
6165  0703 01            	rrwa	x,a
6166  0704 1a04          	or	a,(OFST+0,sp)
6167  0706 01            	rrwa	x,a
6168  0707 1a03          	or	a,(OFST-1,sp)
6169  0709 01            	rrwa	x,a
6170  070a 1f03          	ldw	(OFST-1,sp),x
6171                     ; 1935   return (uint16_t)tmpccr1;
6173  070c 1e03          	ldw	x,(OFST-1,sp)
6176  070e 5b04          	addw	sp,#4
6177  0710 81            	ret
6229                     ; 1943 uint16_t TIM1_GetCapture2(void)
6229                     ; 1944 {
6230                     	switch	.text
6231  0711               _TIM1_GetCapture2:
6233  0711 5204          	subw	sp,#4
6234       00000004      OFST:	set	4
6237                     ; 1947   uint16_t tmpccr2 = 0;
6239                     ; 1948   uint8_t tmpccr2l=0, tmpccr2h=0;
6243                     ; 1950   tmpccr2h = TIM1->CCR2H;
6245  0713 c65267        	ld	a,21095
6246  0716 6b02          	ld	(OFST-2,sp),a
6247                     ; 1951   tmpccr2l = TIM1->CCR2L;
6249  0718 c65268        	ld	a,21096
6250  071b 6b01          	ld	(OFST-3,sp),a
6251                     ; 1953   tmpccr2 = (uint16_t)(tmpccr2l);
6253  071d 7b01          	ld	a,(OFST-3,sp)
6254  071f 5f            	clrw	x
6255  0720 97            	ld	xl,a
6256  0721 1f03          	ldw	(OFST-1,sp),x
6257                     ; 1954   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
6259  0723 7b02          	ld	a,(OFST-2,sp)
6260  0725 5f            	clrw	x
6261  0726 97            	ld	xl,a
6262  0727 4f            	clr	a
6263  0728 02            	rlwa	x,a
6264  0729 01            	rrwa	x,a
6265  072a 1a04          	or	a,(OFST+0,sp)
6266  072c 01            	rrwa	x,a
6267  072d 1a03          	or	a,(OFST-1,sp)
6268  072f 01            	rrwa	x,a
6269  0730 1f03          	ldw	(OFST-1,sp),x
6270                     ; 1956   return (uint16_t)tmpccr2;
6272  0732 1e03          	ldw	x,(OFST-1,sp)
6275  0734 5b04          	addw	sp,#4
6276  0736 81            	ret
6328                     ; 1964 uint16_t TIM1_GetCapture3(void)
6328                     ; 1965 {
6329                     	switch	.text
6330  0737               _TIM1_GetCapture3:
6332  0737 5204          	subw	sp,#4
6333       00000004      OFST:	set	4
6336                     ; 1967   uint16_t tmpccr3 = 0;
6338                     ; 1968   uint8_t tmpccr3l=0, tmpccr3h=0;
6342                     ; 1970   tmpccr3h = TIM1->CCR3H;
6344  0739 c65269        	ld	a,21097
6345  073c 6b02          	ld	(OFST-2,sp),a
6346                     ; 1971   tmpccr3l = TIM1->CCR3L;
6348  073e c6526a        	ld	a,21098
6349  0741 6b01          	ld	(OFST-3,sp),a
6350                     ; 1973   tmpccr3 = (uint16_t)(tmpccr3l);
6352  0743 7b01          	ld	a,(OFST-3,sp)
6353  0745 5f            	clrw	x
6354  0746 97            	ld	xl,a
6355  0747 1f03          	ldw	(OFST-1,sp),x
6356                     ; 1974   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
6358  0749 7b02          	ld	a,(OFST-2,sp)
6359  074b 5f            	clrw	x
6360  074c 97            	ld	xl,a
6361  074d 4f            	clr	a
6362  074e 02            	rlwa	x,a
6363  074f 01            	rrwa	x,a
6364  0750 1a04          	or	a,(OFST+0,sp)
6365  0752 01            	rrwa	x,a
6366  0753 1a03          	or	a,(OFST-1,sp)
6367  0755 01            	rrwa	x,a
6368  0756 1f03          	ldw	(OFST-1,sp),x
6369                     ; 1976   return (uint16_t)tmpccr3;
6371  0758 1e03          	ldw	x,(OFST-1,sp)
6374  075a 5b04          	addw	sp,#4
6375  075c 81            	ret
6427                     ; 1984 uint16_t TIM1_GetCapture4(void)
6427                     ; 1985 {
6428                     	switch	.text
6429  075d               _TIM1_GetCapture4:
6431  075d 5204          	subw	sp,#4
6432       00000004      OFST:	set	4
6435                     ; 1987   uint16_t tmpccr4 = 0;
6437                     ; 1988   uint8_t tmpccr4l=0, tmpccr4h=0;
6441                     ; 1990   tmpccr4h = TIM1->CCR4H;
6443  075f c6526b        	ld	a,21099
6444  0762 6b02          	ld	(OFST-2,sp),a
6445                     ; 1991   tmpccr4l = TIM1->CCR4L;
6447  0764 c6526c        	ld	a,21100
6448  0767 6b01          	ld	(OFST-3,sp),a
6449                     ; 1993   tmpccr4 = (uint16_t)(tmpccr4l);
6451  0769 7b01          	ld	a,(OFST-3,sp)
6452  076b 5f            	clrw	x
6453  076c 97            	ld	xl,a
6454  076d 1f03          	ldw	(OFST-1,sp),x
6455                     ; 1994   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
6457  076f 7b02          	ld	a,(OFST-2,sp)
6458  0771 5f            	clrw	x
6459  0772 97            	ld	xl,a
6460  0773 4f            	clr	a
6461  0774 02            	rlwa	x,a
6462  0775 01            	rrwa	x,a
6463  0776 1a04          	or	a,(OFST+0,sp)
6464  0778 01            	rrwa	x,a
6465  0779 1a03          	or	a,(OFST-1,sp)
6466  077b 01            	rrwa	x,a
6467  077c 1f03          	ldw	(OFST-1,sp),x
6468                     ; 1996   return (uint16_t)tmpccr4;
6470  077e 1e03          	ldw	x,(OFST-1,sp)
6473  0780 5b04          	addw	sp,#4
6474  0782 81            	ret
6508                     ; 2004 uint16_t TIM1_GetCounter(void)
6508                     ; 2005 {
6509                     	switch	.text
6510  0783               _TIM1_GetCounter:
6512  0783 89            	pushw	x
6513       00000002      OFST:	set	2
6516                     ; 2006   uint16_t tmpcntr = 0;
6518                     ; 2008   tmpcntr = ((uint16_t)TIM1->CNTRH << 8);
6520  0784 c6525e        	ld	a,21086
6521  0787 5f            	clrw	x
6522  0788 97            	ld	xl,a
6523  0789 4f            	clr	a
6524  078a 02            	rlwa	x,a
6525  078b 1f01          	ldw	(OFST-1,sp),x
6526                     ; 2011   return (uint16_t)(tmpcntr | (uint16_t)(TIM1->CNTRL));
6528  078d c6525f        	ld	a,21087
6529  0790 5f            	clrw	x
6530  0791 97            	ld	xl,a
6531  0792 01            	rrwa	x,a
6532  0793 1a02          	or	a,(OFST+0,sp)
6533  0795 01            	rrwa	x,a
6534  0796 1a01          	or	a,(OFST-1,sp)
6535  0798 01            	rrwa	x,a
6538  0799 5b02          	addw	sp,#2
6539  079b 81            	ret
6573                     ; 2019 uint16_t TIM1_GetPrescaler(void)
6573                     ; 2020 {
6574                     	switch	.text
6575  079c               _TIM1_GetPrescaler:
6577  079c 89            	pushw	x
6578       00000002      OFST:	set	2
6581                     ; 2021   uint16_t temp = 0;
6583                     ; 2023   temp = ((uint16_t)TIM1->PSCRH << 8);
6585  079d c65260        	ld	a,21088
6586  07a0 5f            	clrw	x
6587  07a1 97            	ld	xl,a
6588  07a2 4f            	clr	a
6589  07a3 02            	rlwa	x,a
6590  07a4 1f01          	ldw	(OFST-1,sp),x
6591                     ; 2026   return (uint16_t)( temp | (uint16_t)(TIM1->PSCRL));
6593  07a6 c65261        	ld	a,21089
6594  07a9 5f            	clrw	x
6595  07aa 97            	ld	xl,a
6596  07ab 01            	rrwa	x,a
6597  07ac 1a02          	or	a,(OFST+0,sp)
6598  07ae 01            	rrwa	x,a
6599  07af 1a01          	or	a,(OFST-1,sp)
6600  07b1 01            	rrwa	x,a
6603  07b2 5b02          	addw	sp,#2
6604  07b4 81            	ret
6778                     ; 2047 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
6778                     ; 2048 {
6779                     	switch	.text
6780  07b5               _TIM1_GetFlagStatus:
6782  07b5 89            	pushw	x
6783  07b6 89            	pushw	x
6784       00000002      OFST:	set	2
6787                     ; 2049   FlagStatus bitstatus = RESET;
6789                     ; 2050   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
6793                     ; 2053   assert_param(IS_TIM1_GET_FLAG_OK(TIM1_FLAG));
6795                     ; 2055   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
6797  07b7 9f            	ld	a,xl
6798  07b8 c45255        	and	a,21077
6799  07bb 6b01          	ld	(OFST-1,sp),a
6800                     ; 2056   tim1_flag_h = (uint8_t)((uint16_t)TIM1_FLAG >> 8);
6802  07bd 7b03          	ld	a,(OFST+1,sp)
6803  07bf 6b02          	ld	(OFST+0,sp),a
6804                     ; 2058   if ((tim1_flag_l | (uint8_t)(TIM1->SR2 & tim1_flag_h)) != 0)
6806  07c1 c65256        	ld	a,21078
6807  07c4 1402          	and	a,(OFST+0,sp)
6808  07c6 1a01          	or	a,(OFST-1,sp)
6809  07c8 2706          	jreq	L5643
6810                     ; 2060     bitstatus = SET;
6812  07ca a601          	ld	a,#1
6813  07cc 6b02          	ld	(OFST+0,sp),a
6815  07ce 2002          	jra	L7643
6816  07d0               L5643:
6817                     ; 2064     bitstatus = RESET;
6819  07d0 0f02          	clr	(OFST+0,sp)
6820  07d2               L7643:
6821                     ; 2066   return (FlagStatus)(bitstatus);
6823  07d2 7b02          	ld	a,(OFST+0,sp)
6826  07d4 5b04          	addw	sp,#4
6827  07d6 81            	ret
6862                     ; 2087 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
6862                     ; 2088 {
6863                     	switch	.text
6864  07d7               _TIM1_ClearFlag:
6866  07d7 89            	pushw	x
6867       00000000      OFST:	set	0
6870                     ; 2090   assert_param(IS_TIM1_CLEAR_FLAG_OK(TIM1_FLAG));
6872                     ; 2093   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
6874  07d8 9f            	ld	a,xl
6875  07d9 43            	cpl	a
6876  07da c75255        	ld	21077,a
6877                     ; 2094   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
6877                     ; 2095                         (uint8_t)0x1E);
6879  07dd 7b01          	ld	a,(OFST+1,sp)
6880  07df 43            	cpl	a
6881  07e0 a41e          	and	a,#30
6882  07e2 c75256        	ld	21078,a
6883                     ; 2096 }
6886  07e5 85            	popw	x
6887  07e6 81            	ret
6951                     ; 2112 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
6951                     ; 2113 {
6952                     	switch	.text
6953  07e7               _TIM1_GetITStatus:
6955  07e7 88            	push	a
6956  07e8 89            	pushw	x
6957       00000002      OFST:	set	2
6960                     ; 2114   ITStatus bitstatus = RESET;
6962                     ; 2115   uint8_t TIM1_itStatus = 0, TIM1_itEnable = 0;
6966                     ; 2118   assert_param(IS_TIM1_GET_IT_OK(TIM1_IT));
6968                     ; 2120   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
6970  07e9 c45255        	and	a,21077
6971  07ec 6b01          	ld	(OFST-1,sp),a
6972                     ; 2122   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
6974  07ee c65254        	ld	a,21076
6975  07f1 1403          	and	a,(OFST+1,sp)
6976  07f3 6b02          	ld	(OFST+0,sp),a
6977                     ; 2124   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
6979  07f5 0d01          	tnz	(OFST-1,sp)
6980  07f7 270a          	jreq	L1453
6982  07f9 0d02          	tnz	(OFST+0,sp)
6983  07fb 2706          	jreq	L1453
6984                     ; 2126     bitstatus = SET;
6986  07fd a601          	ld	a,#1
6987  07ff 6b02          	ld	(OFST+0,sp),a
6989  0801 2002          	jra	L3453
6990  0803               L1453:
6991                     ; 2130     bitstatus = RESET;
6993  0803 0f02          	clr	(OFST+0,sp)
6994  0805               L3453:
6995                     ; 2132   return (ITStatus)(bitstatus);
6997  0805 7b02          	ld	a,(OFST+0,sp)
7000  0807 5b03          	addw	sp,#3
7001  0809 81            	ret
7037                     ; 2149 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
7037                     ; 2150 {
7038                     	switch	.text
7039  080a               _TIM1_ClearITPendingBit:
7043                     ; 2152   assert_param(IS_TIM1_IT_OK(TIM1_IT));
7045                     ; 2155   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
7047  080a 43            	cpl	a
7048  080b c75255        	ld	21077,a
7049                     ; 2156 }
7052  080e 81            	ret
7104                     ; 2174 static void TI1_Config(uint8_t TIM1_ICPolarity,
7104                     ; 2175                        uint8_t TIM1_ICSelection,
7104                     ; 2176                        uint8_t TIM1_ICFilter)
7104                     ; 2177 {
7105                     	switch	.text
7106  080f               L3_TI1_Config:
7108  080f 89            	pushw	x
7109  0810 88            	push	a
7110       00000001      OFST:	set	1
7113                     ; 2179   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7115  0811 7211525c      	bres	21084,#0
7116                     ; 2182   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) | 
7116                     ; 2183                           (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7118  0815 7b06          	ld	a,(OFST+5,sp)
7119  0817 97            	ld	xl,a
7120  0818 a610          	ld	a,#16
7121  081a 42            	mul	x,a
7122  081b 9f            	ld	a,xl
7123  081c 1a03          	or	a,(OFST+2,sp)
7124  081e 6b01          	ld	(OFST+0,sp),a
7125  0820 c65258        	ld	a,21080
7126  0823 a40c          	and	a,#12
7127  0825 1a01          	or	a,(OFST+0,sp)
7128  0827 c75258        	ld	21080,a
7129                     ; 2186   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7131  082a 0d02          	tnz	(OFST+1,sp)
7132  082c 2706          	jreq	L1163
7133                     ; 2188     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7135  082e 7212525c      	bset	21084,#1
7137  0832 2004          	jra	L3163
7138  0834               L1163:
7139                     ; 2192     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7141  0834 7213525c      	bres	21084,#1
7142  0838               L3163:
7143                     ; 2196   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
7145  0838 7210525c      	bset	21084,#0
7146                     ; 2197 }
7149  083c 5b03          	addw	sp,#3
7150  083e 81            	ret
7202                     ; 2215 static void TI2_Config(uint8_t TIM1_ICPolarity,
7202                     ; 2216                        uint8_t TIM1_ICSelection,
7202                     ; 2217                        uint8_t TIM1_ICFilter)
7202                     ; 2218 {
7203                     	switch	.text
7204  083f               L5_TI2_Config:
7206  083f 89            	pushw	x
7207  0840 88            	push	a
7208       00000001      OFST:	set	1
7211                     ; 2220   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
7213  0841 7219525c      	bres	21084,#4
7214                     ; 2223   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) 
7214                     ; 2224                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7216  0845 7b06          	ld	a,(OFST+5,sp)
7217  0847 97            	ld	xl,a
7218  0848 a610          	ld	a,#16
7219  084a 42            	mul	x,a
7220  084b 9f            	ld	a,xl
7221  084c 1a03          	or	a,(OFST+2,sp)
7222  084e 6b01          	ld	(OFST+0,sp),a
7223  0850 c65259        	ld	a,21081
7224  0853 a40c          	and	a,#12
7225  0855 1a01          	or	a,(OFST+0,sp)
7226  0857 c75259        	ld	21081,a
7227                     ; 2226   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7229  085a 0d02          	tnz	(OFST+1,sp)
7230  085c 2706          	jreq	L3463
7231                     ; 2228     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7233  085e 721a525c      	bset	21084,#5
7235  0862 2004          	jra	L5463
7236  0864               L3463:
7237                     ; 2232     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7239  0864 721b525c      	bres	21084,#5
7240  0868               L5463:
7241                     ; 2235   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
7243  0868 7218525c      	bset	21084,#4
7244                     ; 2236 }
7247  086c 5b03          	addw	sp,#3
7248  086e 81            	ret
7300                     ; 2254 static void TI3_Config(uint8_t TIM1_ICPolarity,
7300                     ; 2255                        uint8_t TIM1_ICSelection,
7300                     ; 2256                        uint8_t TIM1_ICFilter)
7300                     ; 2257 {
7301                     	switch	.text
7302  086f               L7_TI3_Config:
7304  086f 89            	pushw	x
7305  0870 88            	push	a
7306       00000001      OFST:	set	1
7309                     ; 2259   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
7311  0871 7211525d      	bres	21085,#0
7312                     ; 2262   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF))) 
7312                     ; 2263                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7314  0875 7b06          	ld	a,(OFST+5,sp)
7315  0877 97            	ld	xl,a
7316  0878 a610          	ld	a,#16
7317  087a 42            	mul	x,a
7318  087b 9f            	ld	a,xl
7319  087c 1a03          	or	a,(OFST+2,sp)
7320  087e 6b01          	ld	(OFST+0,sp),a
7321  0880 c6525a        	ld	a,21082
7322  0883 a40c          	and	a,#12
7323  0885 1a01          	or	a,(OFST+0,sp)
7324  0887 c7525a        	ld	21082,a
7325                     ; 2266   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7327  088a 0d02          	tnz	(OFST+1,sp)
7328  088c 2706          	jreq	L5763
7329                     ; 2268     TIM1->CCER2 |= TIM1_CCER2_CC3P;
7331  088e 7212525d      	bset	21085,#1
7333  0892 2004          	jra	L7763
7334  0894               L5763:
7335                     ; 2272     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
7337  0894 7213525d      	bres	21085,#1
7338  0898               L7763:
7339                     ; 2275   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
7341  0898 7210525d      	bset	21085,#0
7342                     ; 2276 }
7345  089c 5b03          	addw	sp,#3
7346  089e 81            	ret
7398                     ; 2294 static void TI4_Config(uint8_t TIM1_ICPolarity,
7398                     ; 2295                        uint8_t TIM1_ICSelection,
7398                     ; 2296                        uint8_t TIM1_ICFilter)
7398                     ; 2297 {
7399                     	switch	.text
7400  089f               L11_TI4_Config:
7402  089f 89            	pushw	x
7403  08a0 88            	push	a
7404       00000001      OFST:	set	1
7407                     ; 2299   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
7409  08a1 7219525d      	bres	21085,#4
7410                     ; 2302   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF )))
7410                     ; 2303                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7412  08a5 7b06          	ld	a,(OFST+5,sp)
7413  08a7 97            	ld	xl,a
7414  08a8 a610          	ld	a,#16
7415  08aa 42            	mul	x,a
7416  08ab 9f            	ld	a,xl
7417  08ac 1a03          	or	a,(OFST+2,sp)
7418  08ae 6b01          	ld	(OFST+0,sp),a
7419  08b0 c6525b        	ld	a,21083
7420  08b3 a40c          	and	a,#12
7421  08b5 1a01          	or	a,(OFST+0,sp)
7422  08b7 c7525b        	ld	21083,a
7423                     ; 2306   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7425  08ba 0d02          	tnz	(OFST+1,sp)
7426  08bc 2706          	jreq	L7273
7427                     ; 2308     TIM1->CCER2 |= TIM1_CCER2_CC4P;
7429  08be 721a525d      	bset	21085,#5
7431  08c2 2004          	jra	L1373
7432  08c4               L7273:
7433                     ; 2312     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
7435  08c4 721b525d      	bres	21085,#5
7436  08c8               L1373:
7437                     ; 2316   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
7439  08c8 7218525d      	bset	21085,#4
7440                     ; 2317 }
7443  08cc 5b03          	addw	sp,#3
7444  08ce 81            	ret
7457                     	xdef	_TIM1_ClearITPendingBit
7458                     	xdef	_TIM1_GetITStatus
7459                     	xdef	_TIM1_ClearFlag
7460                     	xdef	_TIM1_GetFlagStatus
7461                     	xdef	_TIM1_GetPrescaler
7462                     	xdef	_TIM1_GetCounter
7463                     	xdef	_TIM1_GetCapture4
7464                     	xdef	_TIM1_GetCapture3
7465                     	xdef	_TIM1_GetCapture2
7466                     	xdef	_TIM1_GetCapture1
7467                     	xdef	_TIM1_SetIC4Prescaler
7468                     	xdef	_TIM1_SetIC3Prescaler
7469                     	xdef	_TIM1_SetIC2Prescaler
7470                     	xdef	_TIM1_SetIC1Prescaler
7471                     	xdef	_TIM1_SetCompare4
7472                     	xdef	_TIM1_SetCompare3
7473                     	xdef	_TIM1_SetCompare2
7474                     	xdef	_TIM1_SetCompare1
7475                     	xdef	_TIM1_SetAutoreload
7476                     	xdef	_TIM1_SetCounter
7477                     	xdef	_TIM1_SelectOCxM
7478                     	xdef	_TIM1_CCxNCmd
7479                     	xdef	_TIM1_CCxCmd
7480                     	xdef	_TIM1_OC4PolarityConfig
7481                     	xdef	_TIM1_OC3NPolarityConfig
7482                     	xdef	_TIM1_OC3PolarityConfig
7483                     	xdef	_TIM1_OC2NPolarityConfig
7484                     	xdef	_TIM1_OC2PolarityConfig
7485                     	xdef	_TIM1_OC1NPolarityConfig
7486                     	xdef	_TIM1_OC1PolarityConfig
7487                     	xdef	_TIM1_GenerateEvent
7488                     	xdef	_TIM1_OC4FastConfig
7489                     	xdef	_TIM1_OC3FastConfig
7490                     	xdef	_TIM1_OC2FastConfig
7491                     	xdef	_TIM1_OC1FastConfig
7492                     	xdef	_TIM1_OC4PreloadConfig
7493                     	xdef	_TIM1_OC3PreloadConfig
7494                     	xdef	_TIM1_OC2PreloadConfig
7495                     	xdef	_TIM1_OC1PreloadConfig
7496                     	xdef	_TIM1_CCPreloadControl
7497                     	xdef	_TIM1_SelectCOM
7498                     	xdef	_TIM1_ARRPreloadConfig
7499                     	xdef	_TIM1_ForcedOC4Config
7500                     	xdef	_TIM1_ForcedOC3Config
7501                     	xdef	_TIM1_ForcedOC2Config
7502                     	xdef	_TIM1_ForcedOC1Config
7503                     	xdef	_TIM1_CounterModeConfig
7504                     	xdef	_TIM1_PrescalerConfig
7505                     	xdef	_TIM1_EncoderInterfaceConfig
7506                     	xdef	_TIM1_SelectMasterSlaveMode
7507                     	xdef	_TIM1_SelectSlaveMode
7508                     	xdef	_TIM1_SelectOutputTrigger
7509                     	xdef	_TIM1_SelectOnePulseMode
7510                     	xdef	_TIM1_SelectHallSensor
7511                     	xdef	_TIM1_UpdateRequestConfig
7512                     	xdef	_TIM1_UpdateDisableConfig
7513                     	xdef	_TIM1_SelectInputTrigger
7514                     	xdef	_TIM1_TIxExternalClockConfig
7515                     	xdef	_TIM1_ETRConfig
7516                     	xdef	_TIM1_ETRClockMode2Config
7517                     	xdef	_TIM1_ETRClockMode1Config
7518                     	xdef	_TIM1_InternalClockConfig
7519                     	xdef	_TIM1_ITConfig
7520                     	xdef	_TIM1_CtrlPWMOutputs
7521                     	xdef	_TIM1_Cmd
7522                     	xdef	_TIM1_PWMIConfig
7523                     	xdef	_TIM1_ICInit
7524                     	xdef	_TIM1_BDTRConfig
7525                     	xdef	_TIM1_OC4Init
7526                     	xdef	_TIM1_OC3Init
7527                     	xdef	_TIM1_OC2Init
7528                     	xdef	_TIM1_OC1Init
7529                     	xdef	_TIM1_TimeBaseInit
7530                     	xdef	_TIM1_DeInit
7549                     	end
