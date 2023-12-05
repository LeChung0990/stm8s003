#include "fft.h"

int REX[Point_FFT];
int IMX[Point_FFT];

void Process_Audio_Spectrum_Analyzer(void)   //FFT
{
	uint8_t nm1 = Point_FFT - 1;
	uint8_t nd2 = Point_FFT / 2;
	uint8_t m = (uint8_t)(log10(Point_FFT)/log10(2));
	uint8_t j = nd2;
	uint8_t i, k, l;
	uint8_t le, le2;
	float ur, ui, sr, si;
	uint8_t jm1, ip;
	float tr, ti;

	for (i = 0; i <= nm1; i++)
	{
		IMX[i] = 0;
	}

	// Bit reversal sorting
	for (i = 1; i <= Point_FFT-2; i++)
	{
		if (i >= j) goto a;
		tr = REX[j];
		ti = IMX[j];
		REX[j] = REX[i];
		IMX[j] = IMX[i];
		REX[i] = (int)tr;
		IMX[i] = (int)ti;
		a:
		k = nd2;
		b:
		if (k > j) goto c;
		j -= k;
		k /= 2;
		goto b;
		c:
		j += k;
	}

	// Loop for each FFT stage
	for (l = 1; l <= m; l++)
	{
		le = (uint8_t)pow(2, l);
		le2 = le / 2;
		ur = 1;
		ui = 0;
		// Calculate sine and cosine values
		sr = cos(PI/le2);
		si = -sin(PI/le2);
		// Loop for each sub FFT
		for (j = 1; j <= le2; j++)
		{
			jm1 = j - 1;
			for (i = jm1; i <= nm1; i += le)
			{
				ip = i + le2;
				tr = REX[ip]*ur - IMX[ip]*ui;
				ti = REX[ip]*ui + IMX[ip]*ur;
				REX[ip] = REX[i] - (int)tr;
				IMX[ip] = IMX[i] - (int)ti;
				REX[i] = REX[i] + (int)tr;
				IMX[i] = IMX[i] + (int)ti;
			}
			tr = ur;
			ur = tr*sr - ui*si;
			ui = tr*si + ui*sr;
		}
	}
}