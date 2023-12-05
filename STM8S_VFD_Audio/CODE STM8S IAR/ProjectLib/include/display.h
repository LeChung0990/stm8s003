#ifndef __DISPLAY_H
#define __DISPLAY_H
#include "main.h"

void VFD_Display(void);
void Display_Effect(void);
void Spectrum_Smoothing(void);
void Scan_Key(void);

void Debug_System(void);

#define TEXT_L          0x0001
#define TEXT_R          0x0002
#define TEXT_LR         0x0004
#define TEXT_EQ         0x0008
#define TEXT_HIGH       0x0010
#define TEXT_NORMAL     0x0020
#define TEXT_FLAT       0x0040
#define TEXT_REVERSE    0x0080
#define TEXT_MEMORY     0x0100
#define TEXT_1          0x0200
#define TEXT_2          0x0400
#define TEXT_3          0x0800
#define TEXT_4          0x1000
#define TEXT_5          0x2000

#define TEXT_BAR_SHOW   0x8000

#endif
