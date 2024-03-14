   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
 132                     ; 3 void SPI_Master_Init(SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler)
 132                     ; 4 {
 134                     	switch	.text
 135  0000               _SPI_Master_Init:
 137  0000 88            	push	a
 138       00000000      OFST:	set	0
 141                     ; 6     CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, ENABLE);
 143  0001 ae0101        	ldw	x,#257
 144  0004 cd0000        	call	_CLK_PeripheralClockConfig
 146                     ; 8     GPIO_ExternalPullUpConfig(GPIOC, (GPIO_Pin_TypeDef)(GPIO_PIN_5 | GPIO_PIN_6 | GPIO_PIN_7), ENABLE);
 148  0007 4b01          	push	#1
 149  0009 4be0          	push	#224
 150  000b ae500a        	ldw	x,#20490
 151  000e cd0000        	call	_GPIO_ExternalPullUpConfig
 153  0011 85            	popw	x
 154                     ; 10     SPI_Init(SPI_FIRSTBIT_MSB, 
 154                     ; 11         BaudRatePrescaler,
 154                     ; 12         SPI_MODE_MASTER,
 154                     ; 13         SPI_CLOCKPOLARITY_LOW,
 154                     ; 14         SPI_CLOCKPHASE_1EDGE,
 154                     ; 15         SPI_DATADIRECTION_1LINE_TX,
 154                     ; 16         SPI_NSS_SOFT,0x07);
 156  0012 4b07          	push	#7
 157  0014 4b02          	push	#2
 158  0016 4bc0          	push	#192
 159  0018 4b00          	push	#0
 160  001a 4b00          	push	#0
 161  001c 4b04          	push	#4
 162  001e 7b07          	ld	a,(OFST+7,sp)
 163  0020 97            	ld	xl,a
 164  0021 4f            	clr	a
 165  0022 95            	ld	xh,a
 166  0023 cd0000        	call	_SPI_Init
 168  0026 5b06          	addw	sp,#6
 169                     ; 18     SPI_Cmd(ENABLE);
 171  0028 a601          	ld	a,#1
 172  002a cd0000        	call	_SPI_Cmd
 174                     ; 19     GPIO_Init(CE_PORT, (GPIO_Pin_TypeDef) (CE_PIN | CSN_PIN), GPIO_MODE_OUT_PP_LOW_FAST);
 176  002d 4be0          	push	#224
 177  002f 4b18          	push	#24
 178  0031 ae500a        	ldw	x,#20490
 179  0034 cd0000        	call	_GPIO_Init
 181  0037 85            	popw	x
 182                     ; 20 	GPIO_WriteHigh(CSN_PORT, CSN_PIN);
 184  0038 4b10          	push	#16
 185  003a ae500a        	ldw	x,#20490
 186  003d cd0000        	call	_GPIO_WriteHigh
 188  0040 84            	pop	a
 189                     ; 21 }
 192  0041 84            	pop	a
 193  0042 81            	ret
 217                     ; 22 void CS_Select(void){
 218                     	switch	.text
 219  0043               _CS_Select:
 223                     ; 23     GPIO_WriteLow(CSN_PORT, CSN_PIN);
 225  0043 4b10          	push	#16
 226  0045 ae500a        	ldw	x,#20490
 227  0048 cd0000        	call	_GPIO_WriteLow
 229  004b 84            	pop	a
 230                     ; 24 }
 233  004c 81            	ret
 257                     ; 26 void CS_UnSelect(void){
 258                     	switch	.text
 259  004d               _CS_UnSelect:
 263                     ; 27     GPIO_WriteHigh(CSN_PORT, CSN_PIN);
 265  004d 4b10          	push	#16
 266  004f ae500a        	ldw	x,#20490
 267  0052 cd0000        	call	_GPIO_WriteHigh
 269  0055 84            	pop	a
 270                     ; 28 }
 273  0056 81            	ret
 297                     ; 30 void CE_Enable(void){
 298                     	switch	.text
 299  0057               _CE_Enable:
 303                     ; 31     GPIO_WriteHigh(CE_PORT, CE_PIN);
 305  0057 4b08          	push	#8
 306  0059 ae500a        	ldw	x,#20490
 307  005c cd0000        	call	_GPIO_WriteHigh
 309  005f 84            	pop	a
 310                     ; 32 }
 313  0060 81            	ret
 337                     ; 34 void CE_Disable(void){
 338                     	switch	.text
 339  0061               _CE_Disable:
 343                     ; 35     GPIO_WriteLow(CE_PORT, CE_PIN);
 345  0061 4b08          	push	#8
 346  0063 ae500a        	ldw	x,#20490
 347  0066 cd0000        	call	_GPIO_WriteLow
 349  0069 84            	pop	a
 350                     ; 36 }
 353  006a 81            	ret
 408                     ; 38 void SPI_TRansmit(uint8_t* send_data, uint8_t length)
 408                     ; 39 {
 409                     	switch	.text
 410  006b               _SPI_TRansmit:
 412  006b 89            	pushw	x
 413  006c 88            	push	a
 414       00000001      OFST:	set	1
 417                     ; 41   for (i=0; i<length; ++i)
 419  006d 0f01          	clr	(OFST+0,sp)
 421  006f 2019          	jra	L541
 422  0071               L141:
 423                     ; 43 	SPI_SendData(* (send_data + i));
 425  0071 7b02          	ld	a,(OFST+1,sp)
 426  0073 97            	ld	xl,a
 427  0074 7b03          	ld	a,(OFST+2,sp)
 428  0076 1b01          	add	a,(OFST+0,sp)
 429  0078 2401          	jrnc	L02
 430  007a 5c            	incw	x
 431  007b               L02:
 432  007b 02            	rlwa	x,a
 433  007c f6            	ld	a,(x)
 434  007d cd0000        	call	_SPI_SendData
 437  0080               L351:
 438                     ; 44 	while( !SPI_GetFlagStatus(SPI_FLAG_TXE));
 440  0080 a602          	ld	a,#2
 441  0082 cd0000        	call	_SPI_GetFlagStatus
 443  0085 4d            	tnz	a
 444  0086 27f8          	jreq	L351
 445                     ; 41   for (i=0; i<length; ++i)
 447  0088 0c01          	inc	(OFST+0,sp)
 448  008a               L541:
 451  008a 7b01          	ld	a,(OFST+0,sp)
 452  008c 1106          	cp	a,(OFST+5,sp)
 453  008e 25e1          	jrult	L141
 454                     ; 46 }
 457  0090 5b03          	addw	sp,#3
 458  0092 81            	ret
 513                     ; 48 void SPI_Receive(uint8_t* receive_data, uint8_t length)
 513                     ; 49 {
 514                     	switch	.text
 515  0093               _SPI_Receive:
 517  0093 89            	pushw	x
 518  0094 88            	push	a
 519       00000001      OFST:	set	1
 522                     ; 51   for (i=0; i<length; ++i)
 524  0095 0f01          	clr	(OFST+0,sp)
 526  0097 201f          	jra	L112
 527  0099               L502:
 528                     ; 53     if(receive_data != RESET)
 530  0099 1e02          	ldw	x,(OFST+1,sp)
 531  009b 2719          	jreq	L512
 533  009d               L122:
 534                     ; 55         while( !SPI_GetFlagStatus(SPI_FLAG_RXNE));
 536  009d a601          	ld	a,#1
 537  009f cd0000        	call	_SPI_GetFlagStatus
 539  00a2 4d            	tnz	a
 540  00a3 27f8          	jreq	L122
 541                     ; 56         *(receive_data + i) = SPI_ReceiveData();
 543  00a5 7b02          	ld	a,(OFST+1,sp)
 544  00a7 97            	ld	xl,a
 545  00a8 7b03          	ld	a,(OFST+2,sp)
 546  00aa 1b01          	add	a,(OFST+0,sp)
 547  00ac 2401          	jrnc	L42
 548  00ae 5c            	incw	x
 549  00af               L42:
 550  00af 02            	rlwa	x,a
 551  00b0 89            	pushw	x
 552  00b1 cd0000        	call	_SPI_ReceiveData
 554  00b4 85            	popw	x
 555  00b5 f7            	ld	(x),a
 556  00b6               L512:
 557                     ; 51   for (i=0; i<length; ++i)
 559  00b6 0c01          	inc	(OFST+0,sp)
 560  00b8               L112:
 563  00b8 7b01          	ld	a,(OFST+0,sp)
 564  00ba 1106          	cp	a,(OFST+5,sp)
 565  00bc 25db          	jrult	L502
 566                     ; 59 }
 569  00be 5b03          	addw	sp,#3
 570  00c0 81            	ret
 626                     ; 62 void nRF24_WriteReg(uint8_t Reg, uint8_t Data)
 626                     ; 63 {
 627                     	switch	.text
 628  00c1               _nRF24_WriteReg:
 630  00c1 89            	pushw	x
 631  00c2 89            	pushw	x
 632       00000002      OFST:	set	2
 635                     ; 65     buf[0] = Reg | (1<<5);
 637  00c3 9e            	ld	a,xh
 638  00c4 aa20          	or	a,#32
 639  00c6 6b01          	ld	(OFST-1,sp),a
 640                     ; 66     buf[1] = Data;
 642  00c8 7b04          	ld	a,(OFST+2,sp)
 643  00ca 6b02          	ld	(OFST+0,sp),a
 644                     ; 68     CS_Select();
 646  00cc cd0043        	call	_CS_Select
 648                     ; 70     SPI_TRansmit(buf, 2);
 650  00cf 4b02          	push	#2
 651  00d1 96            	ldw	x,sp
 652  00d2 1c0002        	addw	x,#OFST+0
 653  00d5 ad94          	call	_SPI_TRansmit
 655  00d7 84            	pop	a
 656                     ; 72     CS_UnSelect();
 658  00d8 cd004d        	call	_CS_UnSelect
 660                     ; 73 }
 663  00db 5b04          	addw	sp,#4
 664  00dd 81            	ret
 731                     ; 76 void nRF24_WriteRegMulti (uint8_t Reg, uint8_t *data, int size)
 731                     ; 77 {
 732                     	switch	.text
 733  00de               _nRF24_WriteRegMulti:
 735  00de 88            	push	a
 736  00df 89            	pushw	x
 737       00000002      OFST:	set	2
 740                     ; 79     buf[0] = Reg | (1<<5);
 742  00e0 aa20          	or	a,#32
 743  00e2 6b01          	ld	(OFST-1,sp),a
 744                     ; 83     CS_Select();
 746  00e4 cd0043        	call	_CS_Select
 748                     ; 85     SPI_TRansmit(buf, 1);
 750  00e7 4b01          	push	#1
 751  00e9 96            	ldw	x,sp
 752  00ea 1c0002        	addw	x,#OFST+0
 753  00ed cd006b        	call	_SPI_TRansmit
 755  00f0 84            	pop	a
 756                     ; 86     SPI_TRansmit(data, size);
 758  00f1 7b09          	ld	a,(OFST+7,sp)
 759  00f3 88            	push	a
 760  00f4 1e07          	ldw	x,(OFST+5,sp)
 761  00f6 cd006b        	call	_SPI_TRansmit
 763  00f9 84            	pop	a
 764                     ; 88     CS_UnSelect();
 766  00fa cd004d        	call	_CS_UnSelect
 768                     ; 89 }
 771  00fd 5b03          	addw	sp,#3
 772  00ff 81            	ret
 819                     ; 91 uint8_t nRF24_ReadReg( uint8_t Reg)
 819                     ; 92 {
 820                     	switch	.text
 821  0100               _nRF24_ReadReg:
 823  0100 88            	push	a
 824  0101 88            	push	a
 825       00000001      OFST:	set	1
 828                     ; 93     uint8_t data = 0;
 830  0102 0f01          	clr	(OFST+0,sp)
 831                     ; 96     CS_Select();
 833  0104 cd0043        	call	_CS_Select
 835                     ; 98     SPI_TRansmit(&Reg, 1);
 837  0107 4b01          	push	#1
 838  0109 96            	ldw	x,sp
 839  010a 1c0003        	addw	x,#OFST+2
 840  010d cd006b        	call	_SPI_TRansmit
 842  0110 84            	pop	a
 843                     ; 99     SPI_Receive(&data, 1);
 845  0111 4b01          	push	#1
 846  0113 96            	ldw	x,sp
 847  0114 1c0002        	addw	x,#OFST+1
 848  0117 cd0093        	call	_SPI_Receive
 850  011a 84            	pop	a
 851                     ; 102     CS_UnSelect();
 853  011b cd004d        	call	_CS_UnSelect
 855                     ; 104     return data;
 857  011e 7b01          	ld	a,(OFST+0,sp)
 860  0120 85            	popw	x
 861  0121 81            	ret
 919                     ; 108 uint8_t nRF24_ReadReg_Multi( uint8_t Reg, uint8_t *data, uint8_t size)
 919                     ; 109 {
 920                     	switch	.text
 921  0122               _nRF24_ReadReg_Multi:
 923  0122 88            	push	a
 924       00000000      OFST:	set	0
 927                     ; 111     CS_Select();
 929  0123 cd0043        	call	_CS_Select
 931                     ; 113     SPI_TRansmit(&Reg, 1);
 933  0126 4b01          	push	#1
 934  0128 96            	ldw	x,sp
 935  0129 1c0002        	addw	x,#OFST+2
 936  012c cd006b        	call	_SPI_TRansmit
 938  012f 84            	pop	a
 939                     ; 114     SPI_Receive(data, size);
 941  0130 7b06          	ld	a,(OFST+6,sp)
 942  0132 88            	push	a
 943  0133 1e05          	ldw	x,(OFST+5,sp)
 944  0135 cd0093        	call	_SPI_Receive
 946  0138 84            	pop	a
 947                     ; 117     CS_UnSelect();
 949  0139 cd004d        	call	_CS_UnSelect
 951                     ; 119 }
 954  013c 84            	pop	a
 955  013d 81            	ret
 992                     ; 122 void nRF24_Cmd(uint8_t cmd)
 992                     ; 123 {
 993                     	switch	.text
 994  013e               _nRF24_Cmd:
 996  013e 88            	push	a
 997       00000000      OFST:	set	0
1000                     ; 125     CS_Select();
1002  013f cd0043        	call	_CS_Select
1004                     ; 127     SPI_TRansmit(&cmd, 1);
1006  0142 4b01          	push	#1
1007  0144 96            	ldw	x,sp
1008  0145 1c0002        	addw	x,#OFST+2
1009  0148 cd006b        	call	_SPI_TRansmit
1011  014b 84            	pop	a
1012                     ; 129     CS_UnSelect();
1014  014c cd004d        	call	_CS_UnSelect
1016                     ; 130 }
1019  014f 84            	pop	a
1020  0150 81            	ret
1048                     ; 132 void nRF24_Init(void)
1048                     ; 133 {
1049                     	switch	.text
1050  0151               _nRF24_Init:
1054                     ; 135     CE_Disable();
1056  0151 cd0061        	call	_CE_Disable
1058                     ; 136     CS_UnSelect();
1060  0154 cd004d        	call	_CS_UnSelect
1062                     ; 138     nRF24_WriteReg(CONFIG, 0); /*will be configured later*/
1064  0157 5f            	clrw	x
1065  0158 cd00c1        	call	_nRF24_WriteReg
1067                     ; 140     nRF24_WriteReg(EN_AA, 0); /*NO AUTO ACK*/
1069  015b ae0100        	ldw	x,#256
1070  015e cd00c1        	call	_nRF24_WriteReg
1072                     ; 142     nRF24_WriteReg(EN_RXADDR, 0); /*NOT ENABLING ANY DATA PIPE RIGHT NOW*/
1074  0161 ae0200        	ldw	x,#512
1075  0164 cd00c1        	call	_nRF24_WriteReg
1077                     ; 144     nRF24_WriteReg(SETUP_AW, 0x03); /*5 Byte for TX/RX address*/
1079  0167 ae0303        	ldw	x,#771
1080  016a cd00c1        	call	_nRF24_WriteReg
1082                     ; 146     nRF24_WriteReg(SETUP_RETR, 0); /*No Retransmission*/
1084  016d ae0400        	ldw	x,#1024
1085  0170 cd00c1        	call	_nRF24_WriteReg
1087                     ; 148     nRF24_WriteReg(RF_CH, 0); /*will be setup during TX or RX*/
1089  0173 ae0500        	ldw	x,#1280
1090  0176 cd00c1        	call	_nRF24_WriteReg
1092                     ; 150     nRF24_WriteReg(RF_SETUP, 0x0E); /*Power = 0dB, data rate = 2Mbps*/
1094  0179 ae060e        	ldw	x,#1550
1095  017c cd00c1        	call	_nRF24_WriteReg
1097                     ; 153     CE_Enable();
1099  017f cd0057        	call	_CE_Enable
1101                     ; 154     CS_Select();
1103  0182 cd0043        	call	_CS_Select
1105                     ; 155 }
1108  0185 81            	ret
1166                     ; 158 void nRF24_TxMode(uint8_t *Address, uint8_t channel)
1166                     ; 159 {
1167                     	switch	.text
1168  0186               _nRF24_TxMode:
1170  0186 89            	pushw	x
1171  0187 88            	push	a
1172       00000001      OFST:	set	1
1175                     ; 161     CE_Disable();
1177  0188 cd0061        	call	_CE_Disable
1179                     ; 163     nRF24_WriteReg(RF_CH, channel); /*select channel*/
1181  018b 7b06          	ld	a,(OFST+5,sp)
1182  018d 97            	ld	xl,a
1183  018e a605          	ld	a,#5
1184  0190 95            	ld	xh,a
1185  0191 cd00c1        	call	_nRF24_WriteReg
1187                     ; 165     nRF24_WriteRegMulti(TX_ADDR, Address, 5); /*Write the Tx Address*/
1189  0194 ae0005        	ldw	x,#5
1190  0197 89            	pushw	x
1191  0198 1e04          	ldw	x,(OFST+3,sp)
1192  019a 89            	pushw	x
1193  019b a610          	ld	a,#16
1194  019d cd00de        	call	_nRF24_WriteRegMulti
1196  01a0 5b04          	addw	sp,#4
1197                     ; 168     config = nRF24_ReadReg(CONFIG);
1199  01a2 4f            	clr	a
1200  01a3 cd0100        	call	_nRF24_ReadReg
1202  01a6 6b01          	ld	(OFST+0,sp),a
1203                     ; 169     config = config | (1<<1);
1205  01a8 7b01          	ld	a,(OFST+0,sp)
1206  01aa aa02          	or	a,#2
1207  01ac 6b01          	ld	(OFST+0,sp),a
1208                     ; 170     nRF24_WriteReg(CONFIG, config);
1210  01ae 7b01          	ld	a,(OFST+0,sp)
1211  01b0 97            	ld	xl,a
1212  01b1 4f            	clr	a
1213  01b2 95            	ld	xh,a
1214  01b3 cd00c1        	call	_nRF24_WriteReg
1216                     ; 173     CE_Enable();
1218  01b6 cd0057        	call	_CE_Enable
1220                     ; 175 }
1223  01b9 5b03          	addw	sp,#3
1224  01bb 81            	ret
1283                     ; 178 uint8_t nRF24_Transmit(uint8_t *data)
1283                     ; 179 {
1284                     	switch	.text
1285  01bc               _nRF24_Transmit:
1287  01bc 89            	pushw	x
1288  01bd 89            	pushw	x
1289       00000002      OFST:	set	2
1292                     ; 180 	uint8_t cmdtosend = 0;
1294  01be 0f02          	clr	(OFST+0,sp)
1295                     ; 182 	CS_Select(); /*select the device*/
1297  01c0 cd0043        	call	_CS_Select
1299                     ; 184 	cmdtosend = W_TX_PAYLOAD;
1301  01c3 a6a0          	ld	a,#160
1302  01c5 6b02          	ld	(OFST+0,sp),a
1303                     ; 185 	SPI_TRansmit(&cmdtosend, 1);
1305  01c7 4b01          	push	#1
1306  01c9 96            	ldw	x,sp
1307  01ca 1c0003        	addw	x,#OFST+1
1308  01cd cd006b        	call	_SPI_TRansmit
1310  01d0 84            	pop	a
1311                     ; 188     SPI_TRansmit(data, 32);
1313  01d1 4b20          	push	#32
1314  01d3 1e04          	ldw	x,(OFST+2,sp)
1315  01d5 cd006b        	call	_SPI_TRansmit
1317  01d8 84            	pop	a
1318                     ; 190     CS_UnSelect(); /*Unselect device*/
1320  01d9 cd004d        	call	_CS_UnSelect
1322                     ; 192     delay_ms(1);
1324  01dc ae0001        	ldw	x,#1
1325  01df cd0000        	call	_delay_ms
1327                     ; 194     fifoStatus = nRF24_ReadReg(FIFO_STATUS);
1329  01e2 a617          	ld	a,#23
1330  01e4 cd0100        	call	_nRF24_ReadReg
1332  01e7 6b01          	ld	(OFST-1,sp),a
1333                     ; 196     if( (fifoStatus & (1<<4)) && (fifoStatus & (1<<3)))
1335  01e9 7b01          	ld	a,(OFST-1,sp)
1336  01eb a510          	bcp	a,#16
1337  01ed 2713          	jreq	L754
1339  01ef 7b01          	ld	a,(OFST-1,sp)
1340  01f1 a508          	bcp	a,#8
1341  01f3 270d          	jreq	L754
1342                     ; 198         cmdtosend = FLUSH_TX;
1344  01f5 a6e1          	ld	a,#225
1345  01f7 6b02          	ld	(OFST+0,sp),a
1346                     ; 199         nRF24_Cmd(cmdtosend);
1348  01f9 7b02          	ld	a,(OFST+0,sp)
1349  01fb cd013e        	call	_nRF24_Cmd
1351                     ; 200         return 1;
1353  01fe a601          	ld	a,#1
1355  0200 2001          	jra	L64
1356  0202               L754:
1357                     ; 202     return 0;
1359  0202 4f            	clr	a
1361  0203               L64:
1363  0203 5b04          	addw	sp,#4
1364  0205 81            	ret
1377                     	xdef	_CE_Disable
1378                     	xdef	_CE_Enable
1379                     	xdef	_CS_UnSelect
1380                     	xdef	_CS_Select
1381                     	xdef	_nRF24_Transmit
1382                     	xdef	_nRF24_TxMode
1383                     	xdef	_nRF24_Init
1384                     	xdef	_nRF24_Cmd
1385                     	xdef	_nRF24_ReadReg_Multi
1386                     	xdef	_nRF24_ReadReg
1387                     	xdef	_nRF24_WriteRegMulti
1388                     	xdef	_nRF24_WriteReg
1389                     	xdef	_SPI_Receive
1390                     	xdef	_SPI_TRansmit
1391                     	xdef	_SPI_Master_Init
1392                     	xref	_delay_ms
1393                     	xref	_SPI_GetFlagStatus
1394                     	xref	_SPI_ReceiveData
1395                     	xref	_SPI_SendData
1396                     	xref	_SPI_Cmd
1397                     	xref	_SPI_Init
1398                     	xref	_GPIO_ExternalPullUpConfig
1399                     	xref	_GPIO_WriteLow
1400                     	xref	_GPIO_WriteHigh
1401                     	xref	_GPIO_Init
1402                     	xref	_CLK_PeripheralClockConfig
1421                     	end
