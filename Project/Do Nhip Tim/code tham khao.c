#include <htc.h>
#include "lcd.h"
#define _XTAL_FREQ 4000000
#define MAX_SAMPLE 10
__CONFIG(FOSC_HS & WDTE_OFF & PWRTE_OFF & BOREN_OFF & LVP_OFF
& CPD_OFF & WRT_OFF & CP_OFF);
// Khai bao cac bien
unsigned long time[MAX_SAMPLE];
unsigned long time_tmp = 0x00;
unsigned char index = 0x00;
void timer0_config();
// Chuong trinh con xu ly ngat
void interrupt ISR()
{
	/* Ngat ngoai INT0 */
	if((INTF == 1) && (INTE == 1))
	{
		time[index] = time_tmp + TMR0;
		// Tang bien dem
		index++;
		if(index == MAX_SAMPLE)
		index = 0x00;
		// Xoa du lieuTMR0 = 0x00;
		time_tmp = 0x00;
		// Xoa co ngat
		INTF = 0;
	}
	/* Ngat Timer0 */
	if((TMR0IE == 1) && (TMR0IF == 1))
	{
		time_tmp += 0xFF;
		TMR0 = 0x00;
		TMR0IF = 0;
	}
}
// Chuong trinh chinh
void main(void)
{
	unsigned char i;
	unsigned int tmp;
	float sum;
	lcd_init(); // Khoi tao LCD
	timer0_config(); // Thiet lap Timer0
	lcd_goto(0); // Ve dau dong
	lcd_puts("Mach do nhip tim");
	lcd_goto(0x40); // Xuong dong thu 2
	lcd_puts("Nhip tim: ");
	INTE = 1; // Cho phep ngat ngoai
	GIE = 1; // Cho phep ngat toan cuc
	for(i = 0; i < MAX_SAMPLE; i++) // Xoa du lieu
	{
		time[i] = 0x00;
	}
	while(1)
	{
		// Hien thi nhip tim
		sum = 0x00;
		for(i = 0; i < MAX_SAMPLE; i++)
		{
			sum += time[i];
		}
		sum = sum/MAX_SAMPLE; // Gia tri thoi gian trung binh
		sum = 15625.0/(4*sum); // f = fTimer / average_timer_value
		sum = 60*sum; // Nhip tim = sum * 60 nhip/phut
		tmp = (int)sum; // Lay phan nguyen
		lcd_goto(0x4A);
		lcd_putch((tmp/100) + 48); // Hien thi hang tram
		tmp = tmp%100;
		lcd_putch((tmp/10) + 48); // Hien thi hang chuc
		lcd_putch((tmp%10) + 48); // Hien thi hang don vi
		__delay_ms(600);
	}
}
// Thiet lap Timer0
void timer0_config()
{
	TMR0 = 0x00; // Xoa gia tri thanh ghi TMR0
	TMR0IE = 0; // Khong cho phep ngat Timer0
	OPTION_REG = 0xC7; // Thiet lap thanh ghi Option
	TMR0IE = 1; // Cho phep ngat Timer0
	GIE = 1; // Cho phep ngat toan cuc
}