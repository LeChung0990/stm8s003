;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.0 #14184 (MINGW64)
;--------------------------------------------------------
	.module main
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _mangAL
	.globl _TIM4_UPD_OVF_IRQHandler
	.globl _ADC1_IRQHandler
	.globl _EXTI_PORTA_IRQHandler
	.globl _main
	.globl _EXTI_SetTLISensitivity
	.globl _EXTI_SetExtIntSensitivity
	.globl _EXTI_DeInit
	.globl _clock_icon_ds
	.globl _station_chanel
	.globl _print_rssi
	.globl _print_levelBAT
	.globl _SD1106_CUS_PRINT
	.globl _SD1106_printBigLine
	.globl _SD1106_printBigPoint
	.globl _SD1106_printBigNum
	.globl _SD1106_printNum
	.globl _SD1106_print_one_num
	.globl _SD1106_printP
	.globl _SD1106_resetDis
	.globl _SD1106_setContranst
	.globl _SD1106_clear
	.globl _SD1106_sendInitCom
	.globl _SD1106_sendCom
	.globl _writeDay
	.globl _writeTime
	.globl _data_read
	.globl _i2c_write
	.globl _i2c_stop
	.globl _i2c_start
	.globl _i2c_init
	.globl _BEEP_Cmd
	.globl _BEEP_config
	.globl _delay_ms
	.globl _configADC
	.globl _Tim4_config
	.globl _GPIO_ReadInputPin
	.globl _GPIO_WriteReverse
	.globl _GPIO_WriteLow
	.globl _GPIO_Init
	.globl _GPIO_DeInit
	.globl _lcdstate
	.globl _cnt_refesh
	.globl _monthAL
	.globl _dateAL
	.globl _month
	.globl _date
	.globl _templ
	.globl _temph
	.globl _mode
	.globl _cnt_minute
	.globl _cnt_autoOff
	.globl _cnt_second
	.globl _powerradio
	.globl _counter
	.globl _voltBat
	.globl _adc_value
	.globl _FreFM
	.globl _u8Radio
	.globl _u8Time
	.globl _Clock_setup
	.globl _GPIO_setup
	.globl _Exti_Config
	.globl _readTime
	.globl _setchannel
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
_u8Time::
	.ds 6
_u8Radio::
	.ds 4
_FreFM::
	.ds 2
_adc_value::
	.ds 2
_voltBat::
	.ds 2
_counter::
	.ds 2
_powerradio::
	.ds 1
_cnt_second::
	.ds 1
_cnt_autoOff::
	.ds 1
_cnt_minute::
	.ds 1
_mode::
	.ds 1
_temph::
	.ds 2
_templ::
	.ds 1
_date::
	.ds 1
_month::
	.ds 1
_dateAL::
	.ds 1
_monthAL::
	.ds 1
_cnt_refesh::
	.ds 1
_lcdstate::
	.ds 1
;--------------------------------------------------------
; Stack segment in internal ram
;--------------------------------------------------------
	.area SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)

; default segment ordering for linker
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area CONST
	.area INITIALIZER
	.area CODE

;--------------------------------------------------------
; interrupt vector
;--------------------------------------------------------
	.area HOME
__interrupt_vect:
	int s_GSINIT ; reset
	int 0x000000 ; trap
	int 0x000000 ; int0
	int 0x000000 ; int1
	int 0x000000 ; int2
	int _EXTI_PORTA_IRQHandler ; int3
	int 0x000000 ; int4
	int 0x000000 ; int5
	int 0x000000 ; int6
	int 0x000000 ; int7
	int 0x000000 ; int8
	int 0x000000 ; int9
	int 0x000000 ; int10
	int 0x000000 ; int11
	int 0x000000 ; int12
	int 0x000000 ; int13
	int 0x000000 ; int14
	int 0x000000 ; int15
	int 0x000000 ; int16
	int 0x000000 ; int17
	int 0x000000 ; int18
	int 0x000000 ; int19
	int 0x000000 ; int20
	int 0x000000 ; int21
	int _ADC1_IRQHandler ; int22
	int _TIM4_UPD_OVF_IRQHandler ; int23
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
	call	___sdcc_external_startup
	tnz	a
	jreq	__sdcc_init_data
	jp	__sdcc_program_startup
__sdcc_init_data:
; stm8_genXINIT() start
	ldw x, #l_DATA
	jreq	00002$
00001$:
	clr (s_DATA - 1, x)
	decw x
	jrne	00001$
00002$:
	ldw	x, #l_INITIALIZER
	jreq	00004$
00003$:
	ld	a, (s_INITIALIZER - 1, x)
	ld	(s_INITIALIZED - 1, x), a
	decw	x
	jrne	00003$
00004$:
; stm8_genXINIT() end
	.area GSFINAL
	jp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
__sdcc_program_startup:
	jp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	main.c: 72: void main()
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	sub	sp, #6
;	main.c: 74: Clock_setup();
	call	_Clock_setup
;	main.c: 75: GPIO_setup();
	call	_GPIO_setup
;	main.c: 76: Tim4_config();
	call	_Tim4_config
;	main.c: 77: Exti_Config();
	call	_Exti_Config
;	main.c: 78: configADC();
	call	_configADC
;	main.c: 79: BEEP_config();
	call	_BEEP_config
;	main.c: 80: i2c_init();
	call	_i2c_init
;	main.c: 82: delay_ms(100);  //Wait LCD OLED init
	ldw	x, #0x0064
	call	_delay_ms
;	main.c: 83: SD1106_sendInitCom();
	call	_SD1106_sendInitCom
;	main.c: 84: SD1106_resetDis();
	call	_SD1106_resetDis
;	main.c: 85: SD1106_setContranst(200);
	ld	a, #0xc8
	call	_SD1106_setContranst
;	main.c: 86: SD1106_clear();
	call	_SD1106_clear
;	main.c: 87: lcdstate = SET;
	mov	_lcdstate+0, #0x01
;	main.c: 88: delay_ms(1);
	clrw	x
	incw	x
	call	_delay_ms
;	main.c: 101: SD1106_CUS_PRINT();
	call	_SD1106_CUS_PRINT
;	main.c: 103: while (1)
00174$:
;	main.c: 105: if(!cnt_refesh){
	ld	a, _cnt_refesh+0
	jrne	00102$
;	main.c: 106: SD1106_clear();
	call	_SD1106_clear
;	main.c: 107: cnt_refesh++;
	inc	_cnt_refesh+0
00102$:
;	main.c: 110: if( (cnt_autoOff >= 30) & lcdstate ){
	ld	a, _cnt_autoOff+0
	cp	a, #0x1e
	clr	a
	rlc	a
	xor	a, #0x01
	and	a, _lcdstate+0
	jreq	00107$
;	main.c: 111: SD1106_sendCom(0xAE);   //OLED Off
	ld	a, #0xae
	call	_SD1106_sendCom
;	main.c: 112: lcdstate = 0;
	clr	_lcdstate+0
;	main.c: 113: cnt_minute = 0;
	clr	_cnt_minute+0
;	main.c: 114: cnt_second = 0; 
	clr	_cnt_second+0
;	main.c: 115: cnt_autoOff = 0;
	clr	_cnt_autoOff+0
;	main.c: 116: if(powerradio){
	tnz	_powerradio+0
	jrne	00107$
;	main.c: 118: halt();
	halt
00107$:
;	main.c: 123: if(dateAL == 1 | dateAL == 15){
	ld	a, _dateAL+0
	dec	a
	jrne	00374$
	ld	a, #0x01
	ld	(0x06, sp), a
	.byte 0xc5
00374$:
	clr	(0x06, sp)
00375$:
	ld	a, _dateAL+0
	sub	a, #0x0f
	jrne	00377$
	inc	a
	.byte 0x21
00377$:
	clr	a
00378$:
	or	a, (0x06, sp)
	jreq	00109$
;	main.c: 124: SD1106_printP("AL:1|15",0,2);
	push	#0x02
	clr	a
	ldw	x, #(___str_0+0)
	call	_SD1106_printP
00109$:
;	main.c: 127: if(adc_value != temph){
	ldw	x, _temph+0
	cpw	x, _adc_value+0
	jreq	00111$
;	main.c: 132: voltBat = 5325 / temph;
	ldw	x, #0x14cd
	ldw	y, _temph+0
	divw	x, y
	ldw	_voltBat+0, x
;	main.c: 134: print_levelBAT(voltBat);
	ld	a, _voltBat+1
	call	_print_levelBAT
;	main.c: 135: SD1106_print_one_num( (uint8_t)voltBat/10,0,100);
	ld	a, _voltBat+1
	clrw	x
	push	#0x0a
	push	#0x00
	ld	xl, a
	call	__divsint
	ld	a, xl
	push	#0x64
	push	#0x00
	call	_SD1106_print_one_num
;	main.c: 136: SD1106_printP(".",    0,  106);
	push	#0x6a
	clr	a
	ldw	x, #(___str_1+0)
	call	_SD1106_printP
;	main.c: 137: SD1106_print_one_num( (uint8_t)voltBat%10, 0, 112);
	ld	a, _voltBat+1
	clrw	x
	push	#0x0a
	push	#0x00
	ld	xl, a
	call	__modsint
	ld	a, xl
	push	#0x70
	push	#0x00
	call	_SD1106_print_one_num
;	main.c: 138: SD1106_printP("V", 0, 118);
	push	#0x76
	clr	a
	ldw	x, #(___str_2+0)
	call	_SD1106_printP
;	main.c: 140: adc_value = temph;
	ldw	x, _temph+0
	ldw	_adc_value+0, x
00111$:
;	main.c: 143: if (GPIO_ReadInputPin(right_port, right_pin) == RESET){
	ld	a, #0x40
	ldw	x, #0x500a
	call	_GPIO_ReadInputPin
	tnz	a
	jrne	00118$
;	main.c: 144: delay_ms(20);
	ldw	x, #0x0014
	call	_delay_ms
;	main.c: 145: if(powerradio){
	ld	a, _powerradio+0
	jreq	00118$
;	main.c: 146: while (GPIO_ReadInputPin(right_port, right_pin) == RESET);
00112$:
	ld	a, #0x40
	ldw	x, #0x500a
	call	_GPIO_ReadInputPin
	tnz	a
	jreq	00112$
;	main.c: 147: setchannel(1000);   //Tan so 100.0 MHZ
	ldw	x, #0x03e8
	call	_setchannel
00118$:
;	main.c: 152: if (GPIO_ReadInputPin(left_port, left_pin) == RESET){
	ld	a, #0x20
	ldw	x, #0x500a
	call	_GPIO_ReadInputPin
	ld	(0x06, sp), a
	jreq	00386$
	jp	00138$
00386$:
;	main.c: 153: delay_ms(20);
	ldw	x, #0x0014
	call	_delay_ms
;	main.c: 154: if(powerradio){
	ld	a, _powerradio+0
	jreq	00135$
;	main.c: 156: i2c_start();
	call	_i2c_start
;	main.c: 157: i2c_write(ADDR_5807M);
	ld	a, #0x20
	call	_i2c_write
;	main.c: 158: i2c_write(0xC3);
	ld	a, #0xc3
	call	_i2c_write
;	main.c: 159: i2c_write(0x01);
	ld	a, #0x01
	call	_i2c_write
;	main.c: 160: i2c_stop();
	call	_i2c_stop
	jp	00138$
00135$:
;	main.c: 163: delay_ms(500);
	ldw	x, #0x01f4
	call	_delay_ms
;	main.c: 164: SD1106_clear();
	call	_SD1106_clear
;	main.c: 165: while (GPIO_ReadInputPin(left_port, left_pin) == RESET){
00131$:
	ld	a, #0x20
	ldw	x, #0x500a
	call	_GPIO_ReadInputPin
	ld	(0x06, sp), a
	jreq	00388$
	jp	00133$
00388$:
;	main.c: 166: SD1106_printP("+DATE+",   1,  70);
	push	#0x46
	ld	a, #0x01
	ldw	x, #(___str_3+0)
	call	_SD1106_printP
;	main.c: 167: readTime();
	call	_readTime
;	main.c: 168: uint8_t flag = ( (mangAL[(u8Time[5] - 8)*4] - u8Time[4] >= 1) ? 0 : 1);
	ld	a, _u8Time+5
	sub	a, #0x08
	ld	(0x03, sp), a
	ld	xl, a
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	xh, a
	sllw	x
	sllw	x
	ld	a, (_mangAL+0, x)
	ld	(0x04, sp), a
	clrw	x
	ld	a, (0x04, sp)
	ld	xl, a
	ld	a, _u8Time+4
	ld	(0x05, sp), a
	ld	(0x02, sp), a
	clr	(0x01, sp)
	subw	x, (0x01, sp)
	cpw	x, #0x0001
	jrslt	00178$
	clr	a
	.byte 0xc5
00178$:
	ld	a, #0x01
00179$:
;	main.c: 169: if(flag){
	ld	(0x06, sp), a
	jreq	00120$
;	main.c: 170: dateAL = u8Time[4] - mangAL[(u8Time[5] - 8)*4] + 1;
	ld	a, (0x05, sp)
	sub	a, (0x04, sp)
	inc	a
	ld	_dateAL+0, a
;	main.c: 171: monthAL = mangAL[(u8Time[5] - 8)*4 + 3];
	ld	a, _u8Time+5
	sub	a, #0x08
	sll	a
	sll	a
	add	a, #0x03
	ld	xl, a
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	xh, a
	ld	a, (_mangAL+0, x)
	ld	_monthAL+0, a
	jra	00121$
00120$:
;	main.c: 174: dateAL = u8Time[4] + mangAL[(u8Time[5] - 8)*4 + 2] - 1;
	ld	a, (0x03, sp)
	sll	a
	sll	a
	add	a, #0x02
	ld	xl, a
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	xh, a
	ld	a, (_mangAL+0, x)
	add	a, (0x05, sp)
	dec	a
	ld	_dateAL+0, a
;	main.c: 175: monthAL = mangAL[(u8Time[5] - 8)*4 + 1];
	ld	a, _u8Time+5
	sub	a, #0x08
	sll	a
	sll	a
	inc	a
	ld	xl, a
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	xh, a
	ld	a, (_mangAL+0, x)
	ld	_monthAL+0, a
00121$:
;	main.c: 177: SD1106_printBigNum(u8Time[4]/10, 25);
	ld	a, _u8Time+4
	clrw	x
	ld	xl, a
	push	#0x0a
	push	#0x00
	call	__divsint
	ld	a, xl
	push	#0x19
	call	_SD1106_printBigNum
;	main.c: 178: SD1106_printBigNum(u8Time[4]%10, 42);
	ld	a, _u8Time+4
	clrw	x
	ld	xl, a
	push	#0x0a
	push	#0x00
	call	__modsint
	ld	a, xl
	push	#0x2a
	call	_SD1106_printBigNum
;	main.c: 179: SD1106_printBigLine(59);
	ld	a, #0x3b
	call	_SD1106_printBigLine
;	main.c: 180: SD1106_printBigNum(u8Time[5]/10, 66);
	ld	a, _u8Time+5
	clrw	x
	ld	xl, a
	push	#0x0a
	push	#0x00
	call	__divsint
	ld	a, xl
	push	#0x42
	call	_SD1106_printBigNum
;	main.c: 181: SD1106_printBigNum(u8Time[5]%10, 83);
	ld	a, _u8Time+5
	clrw	x
	ld	xl, a
	push	#0x0a
	push	#0x00
	call	__modsint
	ld	a, xl
	push	#0x53
	call	_SD1106_printBigNum
;	main.c: 183: SD1106_printP("AL:",0,2);
	push	#0x02
	clr	a
	ldw	x, #(___str_4+0)
	call	_SD1106_printP
;	main.c: 184: SD1106_printNum(dateAL,0,20);
	clrw	x
	ld	a, _dateAL+0
	ld	xl, a
	push	#0x14
	clr	a
	call	_SD1106_printNum
;	main.c: 185: SD1106_printP("-",0,32);
	push	#0x20
	clr	a
	ldw	x, #(___str_5+0)
	call	_SD1106_printP
;	main.c: 186: SD1106_printNum( monthAL, 0, 38);
	clrw	x
	ld	a, _monthAL+0
	ld	xl, a
	push	#0x26
	clr	a
	call	_SD1106_printNum
;	main.c: 187: delay_ms(100);
	ldw	x, #0x0064
	call	_delay_ms
;	main.c: 188: if(GPIO_ReadInputPin(right_port, right_pin) == RESET){
	ld	a, #0x40
	ldw	x, #0x500a
	call	_GPIO_ReadInputPin
	tnz	a
	jreq	00391$
	jp	00131$
00391$:
;	main.c: 189: delay_ms(400);
	ldw	x, #0x0190
	call	_delay_ms
;	main.c: 190: while(GPIO_ReadInputPin(right_port, right_pin) == RESET){
00124$:
	ld	a, #0x40
	ldw	x, #0x500a
	call	_GPIO_ReadInputPin
	tnz	a
	jrne	00126$
;	main.c: 191: delay_ms(400);
	ldw	x, #0x0190
	call	_delay_ms
;	main.c: 192: month++;
	inc	_month+0
;	main.c: 193: if(month > 12) month = 0;
	ld	a, _month+0
	cp	a, #0x0c
	jrule	00123$
	clr	_month+0
00123$:
;	main.c: 194: SD1106_printBigNum(month/10, 66);
	clrw	x
	ld	a, _month+0
	ld	xl, a
	push	#0x0a
	push	#0x00
	call	__divsint
	ld	a, xl
	push	#0x42
	call	_SD1106_printBigNum
;	main.c: 195: SD1106_printBigNum(month%10, 83);
	ld	a, _month+0
	clrw	x
	push	#0x0a
	push	#0x00
	ld	xl, a
	call	__modsint
	ld	a, xl
	push	#0x53
	call	_SD1106_printBigNum
	jra	00124$
00126$:
;	main.c: 197: date++;
	inc	_date+0
;	main.c: 198: if(date > 31) date = 0;
	ld	a, _date+0
	cp	a, #0x1f
	jrule	00128$
	clr	_date+0
00128$:
;	main.c: 199: writeDay(date, month);
	push	_month+0
	ld	a, _date+0
	call	_writeDay
	jp	00131$
00133$:
;	main.c: 203: SD1106_clear();
	call	_SD1106_clear
00138$:
;	main.c: 208: readTime();
	call	_readTime
;	main.c: 221: SD1106_printBigNum(u8Time[2]/10, 25);
	ld	a, _u8Time+2
	clrw	x
	push	#0x0a
	push	#0x00
	ld	xl, a
	call	__divsint
	ld	a, xl
	push	#0x19
	call	_SD1106_printBigNum
;	main.c: 222: SD1106_printBigNum(u8Time[2]%10, 42);
	ld	a, _u8Time+2
	clrw	x
	push	#0x0a
	push	#0x00
	ld	xl, a
	call	__modsint
	ld	a, xl
	push	#0x2a
	call	_SD1106_printBigNum
;	main.c: 223: SD1106_printBigPoint(59);
	ld	a, #0x3b
	call	_SD1106_printBigPoint
;	main.c: 225: SD1106_printBigNum(u8Time[1]/10, 66);
	ld	a, _u8Time+1
	clrw	x
	push	#0x0a
	push	#0x00
	ld	xl, a
	call	__divsint
	ld	a, xl
	push	#0x42
	call	_SD1106_printBigNum
;	main.c: 226: SD1106_printBigNum(u8Time[1]%10, 83);
	ld	a, _u8Time+1
	clrw	x
	push	#0x0a
	push	#0x00
	ld	xl, a
	call	__modsint
	ld	a, xl
	push	#0x53
	call	_SD1106_printBigNum
;	main.c: 228: SD1106_print_one_num( (uint8_t)u8Time[0]/10,7,100);
	ld	a, _u8Time+0
	clrw	x
	push	#0x0a
	push	#0x00
	ld	xl, a
	call	__divsint
	ld	a, xl
	push	#0x64
	push	#0x07
	call	_SD1106_print_one_num
;	main.c: 229: SD1106_print_one_num( (uint8_t)u8Time[0]%10,7,106);
	ld	a, _u8Time+0
	clrw	x
	push	#0x0a
	push	#0x00
	ld	xl, a
	call	__modsint
	ld	a, xl
	push	#0x6a
	push	#0x07
	call	_SD1106_print_one_num
;	main.c: 230: delay_ms(100);
	ldw	x, #0x0064
	call	_delay_ms
;	main.c: 232: if(GPIO_ReadInputPin(switch_PORT, switch_PIN)){
	ld	a, #0x10
	ldw	x, #0x500a
	call	_GPIO_ReadInputPin
	tnz	a
	jreq	00140$
;	main.c: 233: powerradio = 1;
	mov	_powerradio+0, #0x01
;	main.c: 234: delay_ms(1);
	clrw	x
	incw	x
	call	_delay_ms
	jra	00141$
00140$:
;	main.c: 236: powerradio = 0;
	clr	_powerradio+0
;	main.c: 237: clock_icon_ds();
	call	_clock_icon_ds
;	main.c: 238: delay_ms(1);
	clrw	x
	incw	x
	call	_delay_ms
00141$:
;	main.c: 242: if(powerradio == 1){
	ld	a, _powerradio+0
	dec	a
	jreq	00398$
	jp	00208$
00398$:
;	main.c: 243: data_read(ADDR_5807M | 0x22, 0x0A, 4, u8Radio);
	push	#<(_u8Radio+0)
	push	#((_u8Radio+0) >> 8)
	push	#0x04
	push	#0x0a
	ld	a, #0x22
	call	_data_read
;	main.c: 244: FreFM = (u8Radio[0] & 0x1) << 8;    //bit cao
	ld	a, _u8Radio+0
	clrw	x
	and	a, #0x01
	ld	xl, a
	clr	a
	rlwa	x
	ldw	_FreFM+0, x
;	main.c: 245: FreFM |= u8Radio[1];                //bit thap
	ld	a, _u8Radio+1
	clrw	x
	or	a, _FreFM+1
	rlwa	x
	or	a, _FreFM+0
	ld	xh, a
;	main.c: 246: FreFM += 870; //tan so kenh hien tai
	ldw	_FreFM+0, x
	addw	x, #0x0366
	ldw	_FreFM+0, x
;	main.c: 248: print_rssi();
	call	_print_rssi
;	main.c: 249: SD1106_printNum(u8Radio[2] >> 2,    0,  20);
	ld	a, _u8Radio+2
	srl	a
	srl	a
	clrw	x
	ld	xl, a
	push	#0x14
	clr	a
	call	_SD1106_printNum
;	main.c: 251: station_chanel();
	call	_station_chanel
;	main.c: 252: SD1106_print_one_num(  FreFM/1000,      1,  20); // + 6
	ldw	x, _FreFM+0
	ldw	y, #0x03e8
	divw	x, y
	ld	a, xl
	push	#0x14
	push	#0x01
	call	_SD1106_print_one_num
;	main.c: 253: SD1106_print_one_num( (FreFM/100)%10,   1,  26);
	ldw	x, _FreFM+0
	ldw	y, #0x0064
	divw	x, y
	ldw	y, #0x000a
	divw	x, y
	ld	a, yl
	push	#0x1a
	push	#0x01
	call	_SD1106_print_one_num
;	main.c: 254: SD1106_print_one_num( (FreFM/10) % 10,  1,  32);
	ldw	x, _FreFM+0
	ldw	y, #0x000a
	divw	x, y
	ldw	y, #0x000a
	divw	x, y
	ld	a, yl
	push	#0x20
	push	#0x01
	call	_SD1106_print_one_num
;	main.c: 255: SD1106_printP(".",    1,  38);
	push	#0x26
	ld	a, #0x01
	ldw	x, #(___str_1+0)
	call	_SD1106_printP
;	main.c: 256: SD1106_print_one_num( (FreFM/1) %10,    1,  44);
	ldw	x, _FreFM+0
	ldw	y, #0x000a
	divw	x, y
	ld	a, yl
	push	#0x2c
	push	#0x01
	call	_SD1106_print_one_num
;	main.c: 259: while(mode == 1){
00208$:
00155$:
	ld	a, _mode+0
	dec	a
	jreq	00401$
	jp	00217$
00401$:
;	main.c: 261: if(!cnt_refesh){
	ld	a, _cnt_refesh+0
	jrne	00145$
;	main.c: 262: SD1106_sendCom(0xAF);   ////OLED On
	ld	a, #0xaf
	call	_SD1106_sendCom
;	main.c: 263: lcdstate = SET;
	mov	_lcdstate+0, #0x01
;	main.c: 264: SD1106_clear();
	call	_SD1106_clear
;	main.c: 265: cnt_refesh++;
	inc	_cnt_refesh+0
00145$:
;	main.c: 267: SD1106_printP("+COUNTER+",   1,  70);
	push	#0x46
	ld	a, #0x01
	ldw	x, #(___str_6+0)
	call	_SD1106_printP
;	main.c: 268: if(GPIO_ReadInputPin(right_port, right_pin) == RESET){
	ld	a, #0x40
	ldw	x, #0x500a
	call	_GPIO_ReadInputPin
	tnz	a
	jrne	00150$
;	main.c: 269: delay_ms(20); //stop/start
	ldw	x, #0x0014
	call	_delay_ms
;	main.c: 270: while(GPIO_ReadInputPin(right_port, right_pin) == RESET);
00146$:
	ld	a, #0x40
	ldw	x, #0x500a
	call	_GPIO_ReadInputPin
	tnz	a
	jreq	00146$
;	main.c: 271: TIM4->CR1 ^= TIM4_CR1_CEN;
	bcpl	0x5340, #0
00150$:
;	main.c: 273: if(GPIO_ReadInputPin(left_port, left_pin) == RESET){
	ld	a, #0x20
	ldw	x, #0x500a
	call	_GPIO_ReadInputPin
	tnz	a
	jrne	00154$
;	main.c: 274: delay_ms(50); //reset
	ldw	x, #0x0032
	call	_delay_ms
;	main.c: 275: counter = 0;
	clrw	x
	ldw	_counter+0, x
;	main.c: 276: cnt_second = 0;
	clr	_cnt_second+0
;	main.c: 277: cnt_minute = 0;
	clr	_cnt_minute+0
;	main.c: 278: delay_ms(500);
	ldw	x, #0x01f4
	call	_delay_ms
;	main.c: 279: if(GPIO_ReadInputPin(left_port, left_pin) == RESET){
	ld	a, #0x20
	ldw	x, #0x500a
	call	_GPIO_ReadInputPin
	tnz	a
	jrne	00154$
;	main.c: 280: mode = 0;
	clr	_mode+0
00154$:
;	main.c: 284: SD1106_printBigNum(cnt_minute/10, 25);
	ld	a, _cnt_minute+0
	clrw	x
	push	#0x0a
	push	#0x00
	ld	xl, a
	call	__divsint
	ld	a, xl
	push	#0x19
	call	_SD1106_printBigNum
;	main.c: 285: SD1106_printBigNum(cnt_minute%10, 42);
	ld	a, _cnt_minute+0
	clrw	x
	push	#0x0a
	push	#0x00
	ld	xl, a
	call	__modsint
	ld	a, xl
	push	#0x2a
	call	_SD1106_printBigNum
;	main.c: 286: SD1106_printBigPoint(59);
	ld	a, #0x3b
	call	_SD1106_printBigPoint
;	main.c: 287: SD1106_printBigNum(cnt_second/10, 66);
	ld	a, _cnt_second+0
	clrw	x
	push	#0x0a
	push	#0x00
	ld	xl, a
	call	__divsint
	ld	a, xl
	push	#0x42
	call	_SD1106_printBigNum
;	main.c: 288: SD1106_printBigNum(cnt_second%10, 83);
	ld	a, _cnt_second+0
	clrw	x
	push	#0x0a
	push	#0x00
	ld	xl, a
	call	__modsint
	ld	a, xl
	push	#0x53
	call	_SD1106_printBigNum
;	main.c: 289: delay_ms(100);
	ldw	x, #0x0064
	call	_delay_ms
	jp	00155$
;	main.c: 292: while(mode == 2)
00217$:
00170$:
	ld	a, _mode+0
	cp	a, #0x02
	jreq	00409$
	jp	00174$
00409$:
;	main.c: 294: if(!cnt_refesh){
	ld	a, _cnt_refesh+0
	jrne	00159$
;	main.c: 295: SD1106_sendCom(0xAF);   ////OLED On
	ld	a, #0xaf
	call	_SD1106_sendCom
;	main.c: 296: lcdstate = SET;
	mov	_lcdstate+0, #0x01
;	main.c: 297: SD1106_clear();
	call	_SD1106_clear
;	main.c: 298: cnt_refesh++;
	inc	_cnt_refesh+0
00159$:
;	main.c: 300: SD1106_printP("+SET TIME+",   1,  70);
	push	#0x46
	ld	a, #0x01
	ldw	x, #(___str_7+0)
	call	_SD1106_printP
;	main.c: 301: if( (GPIO_ReadInputPin(right_port, right_pin) == RESET) | (GPIO_ReadInputPin(left_port, left_pin) == RESET) ) {
	ld	a, #0x40
	ldw	x, #0x500a
	call	_GPIO_ReadInputPin
	sub	a, #0x00
	jrne	00412$
	inc	a
	ld	(0x06, sp), a
	.byte 0xc5
00412$:
	clr	(0x06, sp)
00413$:
	ld	a, #0x20
	ldw	x, #0x500a
	call	_GPIO_ReadInputPin
	sub	a, #0x00
	jrne	00415$
	inc	a
	.byte 0x21
00415$:
	clr	a
00416$:
	or	a, (0x06, sp)
	jreq	00169$
;	main.c: 302: delay_ms(20);
	ldw	x, #0x0014
	call	_delay_ms
;	main.c: 303: if(GPIO_ReadInputPin(right_port, right_pin) == RESET){
	ld	a, #0x40
	ldw	x, #0x500a
	call	_GPIO_ReadInputPin
	tnz	a
	jrne	00163$
;	main.c: 304: delay_ms(100);
	ldw	x, #0x0064
	call	_delay_ms
;	main.c: 305: u8Time[1]++;
	ld	a, _u8Time+1
	inc	a
	ld	_u8Time+1, a
;	main.c: 306: if(u8Time[1] > 59) u8Time[1] = 0;
	cp	a, #0x3b
	jrule	00163$
	mov	_u8Time+1, #0x00
00163$:
;	main.c: 308: if(GPIO_ReadInputPin(left_port, left_pin) == RESET){
	ld	a, #0x20
	ldw	x, #0x500a
	call	_GPIO_ReadInputPin
	tnz	a
	jrne	00167$
;	main.c: 309: delay_ms(100);
	ldw	x, #0x0064
	call	_delay_ms
;	main.c: 310: u8Time[2]++;
	ld	a, _u8Time+2
	inc	a
	ld	_u8Time+2, a
;	main.c: 311: if(u8Time[2] > 23) u8Time[2] = 0;
	cp	a, #0x17
	jrule	00167$
	mov	_u8Time+2, #0x00
00167$:
;	main.c: 313: writeTime(00,u8Time[1],u8Time[2]);
	ld	a, _u8Time+2
	ld	xl, a
	ld	a, _u8Time+1
	pushw	x
	addw	sp, #1
	push	a
	clr	a
	call	_writeTime
00169$:
;	main.c: 316: delay_ms(10);
	ldw	x, #0x000a
	call	_delay_ms
;	main.c: 326: SD1106_printBigNum(u8Time[2]/10, 25);
	ld	a, _u8Time+2
	clrw	x
	push	#0x0a
	push	#0x00
	ld	xl, a
	call	__divsint
	ld	a, xl
	push	#0x19
	call	_SD1106_printBigNum
;	main.c: 327: SD1106_printBigNum(u8Time[2]%10, 42);
	ld	a, _u8Time+2
	clrw	x
	push	#0x0a
	push	#0x00
	ld	xl, a
	call	__modsint
	ld	a, xl
	push	#0x2a
	call	_SD1106_printBigNum
;	main.c: 328: SD1106_printBigPoint(59);
	ld	a, #0x3b
	call	_SD1106_printBigPoint
;	main.c: 329: SD1106_printBigNum(u8Time[1]/10, 66);
	ld	a, _u8Time+1
	clrw	x
	push	#0x0a
	push	#0x00
	ld	xl, a
	call	__divsint
	ld	a, xl
	push	#0x42
	call	_SD1106_printBigNum
;	main.c: 330: SD1106_printBigNum(u8Time[1]%10, 83);
	ld	a, _u8Time+1
	clrw	x
	push	#0x0a
	push	#0x00
	ld	xl, a
	call	__modsint
	ld	a, xl
	push	#0x53
	call	_SD1106_printBigNum
;	main.c: 333: }
	jp	00170$
;	main.c: 335: void Clock_setup(void)
;	-----------------------------------------
;	 function Clock_setup
;	-----------------------------------------
_Clock_setup:
;	main.c: 338: CLK->ICKR = CLK_ICKR_RESET_VALUE;
	mov	0x50c0+0, #0x01
;	main.c: 339: CLK->ECKR = CLK_ECKR_RESET_VALUE;
	mov	0x50c1+0, #0x00
;	main.c: 340: CLK->SWR  = CLK_SWR_RESET_VALUE;
	mov	0x50c4+0, #0xe1
;	main.c: 341: CLK->SWCR = CLK_SWCR_RESET_VALUE;
	mov	0x50c5+0, #0x00
;	main.c: 342: CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
	mov	0x50c6+0, #0x18
;	main.c: 343: CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
	mov	0x50c7+0, #0xff
;	main.c: 344: CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
	mov	0x50ca+0, #0xff
;	main.c: 345: CLK->CSSR = CLK_CSSR_RESET_VALUE;
	mov	0x50c8+0, #0x00
;	main.c: 346: CLK->CCOR = CLK_CCOR_RESET_VALUE;
	mov	0x50c9+0, #0x00
;	main.c: 347: while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0) {}
00101$:
	btjt	0x50c9, #0, 00101$
;	main.c: 348: CLK->CCOR = CLK_CCOR_RESET_VALUE;
	mov	0x50c9+0, #0x00
;	main.c: 349: CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
	mov	0x50cc+0, #0x00
;	main.c: 350: CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
	mov	0x50cd+0, #0x00
;	main.c: 353: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
	ld	a, 0x50c6
	and	a, #0xe7
	ld	0x50c6, a
;	main.c: 356: CLK->CKDIVR |= (uint8_t)0x00; /*!< High speed internal clock prescaler: 1 */
	mov	0x50c6, 0x50c6
;	main.c: 357: }
	ret
;	main.c: 360: void GPIO_setup(void)
;	-----------------------------------------
;	 function GPIO_setup
;	-----------------------------------------
_GPIO_setup:
;	main.c: 363: GPIO_DeInit(GPIOD);
	ldw	x, #0x500f
	call	_GPIO_DeInit
;	main.c: 364: GPIO_DeInit(GPIOC);
	ldw	x, #0x500a
	call	_GPIO_DeInit
;	main.c: 365: GPIO_DeInit(GPIOA);
	ldw	x, #0x5000
	call	_GPIO_DeInit
;	main.c: 366: GPIO_DeInit(GPIOE);
	ldw	x, #0x5014
	call	_GPIO_DeInit
;	main.c: 367: GPIO_DeInit(GPIOB);   
	ldw	x, #0x5005
	call	_GPIO_DeInit
;	main.c: 368: GPIO_DeInit(GPIOF);
	ldw	x, #0x5019
	call	_GPIO_DeInit
;	main.c: 370: GPIO_Init(mode_PORT, mode_PIN, GPIO_MODE_IN_PU_IT);
	push	#0x60
	ld	a, #0x08
	ldw	x, #0x5000
	call	_GPIO_Init
;	main.c: 371: GPIO_Init(left_port, left_pin, GPIO_MODE_IN_PU_NO_IT);
	push	#0x40
	ld	a, #0x20
	ldw	x, #0x500a
	call	_GPIO_Init
;	main.c: 372: GPIO_Init(right_port, right_pin, GPIO_MODE_IN_PU_NO_IT);
	push	#0x40
	ld	a, #0x40
	ldw	x, #0x500a
	call	_GPIO_Init
;	main.c: 374: GPIO_Init(GPIOB, GPIO_PIN_4 | GPIO_PIN_5, GPIO_MODE_OUT_OD_HIZ_SLOW);
	push	#0x90
	ld	a, #0x30
	ldw	x, #0x5005
	call	_GPIO_Init
;	main.c: 375: GPIO_Init(GPIOC ,GPIO_PIN_4 ,GPIO_MODE_OUT_PP_LOW_SLOW);
	push	#0xc0
	ld	a, #0x10
	ldw	x, #0x500a
	call	_GPIO_Init
;	main.c: 376: GPIO_WriteLow(GPIOC, GPIO_PIN_4);
	ld	a, #0x10
	ldw	x, #0x500a
;	main.c: 377: }
	jp	_GPIO_WriteLow
;	main.c: 379: void Exti_Config(void){
;	-----------------------------------------
;	 function Exti_Config
;	-----------------------------------------
_Exti_Config:
;	main.c: 381: EXTI_DeInit();
	call	_EXTI_DeInit
;	main.c: 382: EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOA, EXTI_SENSITIVITY_FALL_ONLY);
	push	#0x02
	clr	a
	call	_EXTI_SetExtIntSensitivity
;	main.c: 383: EXTI_SetTLISensitivity(EXTI_TLISENSITIVITY_FALL_ONLY);
	clr	a
	call	_EXTI_SetTLISensitivity
;	main.c: 384: enableInterrupts();
	rim
;	main.c: 385: }
	ret
;	main.c: 386: void readTime(void){
;	-----------------------------------------
;	 function readTime
;	-----------------------------------------
_readTime:
	push	a
;	main.c: 388: data_read(ADDR_DS13, 0x00, 6, u8Time);
	push	#<(_u8Time+0)
	push	#((_u8Time+0) >> 8)
	push	#0x06
	push	#0x00
	ld	a, #0xd0
	call	_data_read
;	main.c: 389: for(uint8_t i=0; i<6; ++i){
	clr	(0x01, sp)
00107$:
	ld	a, (0x01, sp)
	cp	a, #0x06
	jrnc	00109$
;	main.c: 391: if((u8Time[i] >=0) && (u8Time[i] < 90) ){
	clrw	y
	ld	a, (0x01, sp)
	ld	yl, a
	addw	y, #(_u8Time+0)
	ld	a, (y)
	ld	xh, a
	cp	a, #0x5a
	jrnc	00102$
;	main.c: 392: temp = (u8Time[i] >> 4) & 0x0F;
	ld	a, xh
	swap	a
	and	a, #15
	ld	xl, a
;	main.c: 393: u8Time[i] = u8Time[i] & 0x0F;
	ld	a, xh
	and	a, #0x0f
	ld	(y), a
;	main.c: 394: u8Time[i] = (temp * 10) + u8Time[i];
	push	a
	ld	a, #0x0a
	mul	x, a
	pop	a
	pushw	x
	add	a, (2, sp)
	popw	x
	ld	(y), a
	jra	00108$
00102$:
;	main.c: 396: u8Time[i] = 0;
	clr	(y)
00108$:
;	main.c: 389: for(uint8_t i=0; i<6; ++i){
	inc	(0x01, sp)
	jra	00107$
00109$:
;	main.c: 399: }
	pop	a
	ret
;	main.c: 420: void setchannel(uint16_t fre){
;	-----------------------------------------
;	 function setchannel
;	-----------------------------------------
_setchannel:
	sub	sp, #2
;	main.c: 421: fre = fre - 870;
	subw	x, #0x0366
;	main.c: 422: uint8_t high = (uint8_t) fre >> 2;
	ld	a, xl
	srl	a
	srl	a
	ld	(0x01, sp), a
;	main.c: 423: uint8_t low = (uint8_t) ( (fre & 0b11) << 6) | 0b00010000;
	ld	a, xl
	and	a, #0x03
	swap	a
	and	a, #0xf0
	sll	a
	sll	a
	or	a, #0x10
	ld	(0x02, sp), a
;	main.c: 424: i2c_start();
	call	_i2c_start
;	main.c: 425: i2c_write(ADDR_5807M);
	ld	a, #0x20
	call	_i2c_write
;	main.c: 426: i2c_write(0xC0);
	ld	a, #0xc0
	call	_i2c_write
;	main.c: 427: i2c_write(0x01);
	ld	a, #0x01
	call	_i2c_write
;	main.c: 428: i2c_write(high);
	ld	a, (0x01, sp)
	call	_i2c_write
;	main.c: 429: i2c_write(low);
	ld	a, (0x02, sp)
	call	_i2c_write
;	main.c: 430: i2c_stop();
	addw	sp, #2
;	main.c: 431: }
	jp	_i2c_stop
;	main.c: 433: INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
;	-----------------------------------------
;	 function EXTI_PORTA_IRQHandler
;	-----------------------------------------
_EXTI_PORTA_IRQHandler:
	clr	a
	div	x, a
;	main.c: 438: if (GPIO_ReadInputPin(mode_PORT, mode_PIN) == RESET){
	ld	a, #0x08
	ldw	x, #0x5000
	call	_GPIO_ReadInputPin
	tnz	a
	jrne	00112$
;	main.c: 439: BEEP_Cmd(ENABLE);
	ld	a, #0x01
	call	_BEEP_Cmd
;	main.c: 440: delay_ms(200);
	ldw	x, #0x00c8
	call	_delay_ms
;	main.c: 441: BEEP_Cmd(DISABLE);
	clr	a
	call	_BEEP_Cmd
;	main.c: 443: cnt_refesh = 0;
	clr	_cnt_refesh+0
;	main.c: 444: cnt_autoOff = 0;
	clr	_cnt_autoOff+0
;	main.c: 445: mode++;
	inc	_mode+0
;	main.c: 446: if(mode > 2) mode = 0;
	ld	a, _mode+0
	cp	a, #0x02
	jrule	00102$
	clr	_mode+0
00102$:
;	main.c: 447: delay_ms(200);
	ldw	x, #0x00c8
	call	_delay_ms
;	main.c: 448: if(GPIO_ReadInputPin(mode_PORT, mode_PIN) == RESET){
	ld	a, #0x08
	ldw	x, #0x5000
	call	_GPIO_ReadInputPin
	tnz	a
	jrne	00112$
;	main.c: 449: delay_ms(400);
	ldw	x, #0x0190
	call	_delay_ms
;	main.c: 450: if(GPIO_ReadInputPin(mode_PORT, mode_PIN) == RESET){
	ld	a, #0x08
	ldw	x, #0x5000
	call	_GPIO_ReadInputPin
	tnz	a
	jrne	00112$
;	main.c: 451: delay_ms(400);
	ldw	x, #0x0190
	call	_delay_ms
;	main.c: 452: while(GPIO_ReadInputPin(mode_PORT, mode_PIN) == RESET);
00103$:
	ld	a, #0x08
	ldw	x, #0x5000
	call	_GPIO_ReadInputPin
	tnz	a
	jreq	00103$
;	main.c: 453: mode = 0;
	clr	_mode+0
;	main.c: 454: GPIO_WriteReverse(switch_PORT, switch_PIN);
	ld	a, #0x10
	ldw	x, #0x500a
	call	_GPIO_WriteReverse
00112$:
;	main.c: 460: }
	iret
;	main.c: 462: INTERRUPT_HANDLER(ADC1_IRQHandler, 22){    
;	-----------------------------------------
;	 function ADC1_IRQHandler
;	-----------------------------------------
_ADC1_IRQHandler:
	sub	sp, #2
;	main.c: 465: templ = ADC1->DRL;
	mov	_templ+0, 0x5405
;	main.c: 467: temph = ADC1->DRH;
	ld	a, 0x5404
	clrw	x
	ld	xl, a
	ldw	_temph+0, x
;	main.c: 469: temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t) 8 ));
	ld	a, _temph+1
	ld	(0x01, sp), a
	clr	(0x02, sp)
	ld	a, _templ+0
	clrw	x
	or	a, (0x02, sp)
	rlwa	x
	or	a, (0x01, sp)
	ld	xh, a
	ldw	_temph+0, x
;	main.c: 472: ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT_EOC);    
	bres	0x5400, #7
;	main.c: 473: }
	addw	sp, #2
	iret
;	main.c: 476: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
;	-----------------------------------------
;	 function TIM4_UPD_OVF_IRQHandler
;	-----------------------------------------
_TIM4_UPD_OVF_IRQHandler:
	clr	a
	div	x, a
;	main.c: 478: counter++;
	ldw	x, _counter+0
	incw	x
;	main.c: 479: if (counter == 1000)
	ldw	_counter+0, x
	cpw	x, #0x03e8
	jrne	00108$
;	main.c: 481: counter = 0;
	clrw	x
	ldw	_counter+0, x
;	main.c: 482: cnt_second++;
	inc	_cnt_second+0
;	main.c: 483: cnt_autoOff++;
	inc	_cnt_autoOff+0
;	main.c: 484: if((cnt_second % 5) == 0){
	ld	a, _cnt_second+0
	clrw	x
	push	#0x05
	push	#0x00
	ld	xl, a
	call	__modsint
	tnzw	x
	jrne	00102$
;	main.c: 486: ADC1->CR1 |= ADC1_CR1_ADON;    
	bset	0x5401, #0
00102$:
;	main.c: 488: if (cnt_second > 59) 
	ld	a, _cnt_second+0
	cp	a, #0x3b
	jrule	00108$
;	main.c: 490: cnt_second = 0;
	clr	_cnt_second+0
;	main.c: 491: cnt_minute++;
	inc	_cnt_minute+0
;	main.c: 492: if (cnt_minute > 59) cnt_minute = 0;
	ld	a, _cnt_minute+0
	cp	a, #0x3b
	jrule	00108$
	clr	_cnt_minute+0
00108$:
;	main.c: 496: TIM4->SR1 = (uint8_t)(~TIM4_IT_UPDATE);
	mov	0x5344+0, #0xfe
;	main.c: 497: }
	iret
	.area CODE
	.area CONST
_mangAL:
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x1b	; 27
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x1d	; 29
	.db #0x08	; 8
	.db #0x03	; 3
	.db #0x08	; 8
	.db #0x1d	; 29
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0x0a	; 10
	.db #0x01	; 1
	.db #0x0a	; 10
	.db #0x01	; 1
	.db #0x0b	; 11
	.db #0x01	; 1
	.db #0x0b	; 11
	.area CONST
___str_0:
	.ascii "AL:1|15"
	.db 0x00
	.area CODE
	.area CONST
___str_1:
	.ascii "."
	.db 0x00
	.area CODE
	.area CONST
___str_2:
	.ascii "V"
	.db 0x00
	.area CODE
	.area CONST
___str_3:
	.ascii "+DATE+"
	.db 0x00
	.area CODE
	.area CONST
___str_4:
	.ascii "AL:"
	.db 0x00
	.area CODE
	.area CONST
___str_5:
	.ascii "-"
	.db 0x00
	.area CODE
	.area CONST
___str_6:
	.ascii "+COUNTER+"
	.db 0x00
	.area CODE
	.area CONST
___str_7:
	.ascii "+SET TIME+"
	.db 0x00
	.area CODE
	.area INITIALIZER
__xinit__u8Time:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
__xinit__u8Radio:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
__xinit__FreFM:
	.dw #0x0000
__xinit__adc_value:
	.dw #0x0000
__xinit__voltBat:
	.dw #0x0000
__xinit__counter:
	.dw #0x0000
__xinit__powerradio:
	.db #0x00	; 0
__xinit__cnt_second:
	.db #0x00	; 0
__xinit__cnt_autoOff:
	.db #0x00	; 0
__xinit__cnt_minute:
	.db #0x00	; 0
__xinit__mode:
	.db #0x00	; 0
__xinit__temph:
	.dw #0x0000
__xinit__templ:
	.db #0x00	; 0
__xinit__date:
	.db #0x00	; 0
__xinit__month:
	.db #0x00	; 0
__xinit__dateAL:
	.db #0x00	; 0
__xinit__monthAL:
	.db #0x00	; 0
__xinit__cnt_refesh:
	.db #0x00	; 0
__xinit__lcdstate:
	.db #0x00	;  0
	.area CABS (ABS)
