#include "display.h"

extern uint16_t ADC_Vref, Time_Tick_1;
extern uint8_t Time_Tick_2, Time_Tick_4;
static uint8_t Display_Index, Effect=1, BUT_EN=1, DIR_Bar_Last_Point=1;
static uint16_t VFD_Display_Data[16]; //static uint8_t Bright=10;
static uint8_t Time_Set_New, Time_Set_Last, Spectrum_Count, Spectrum_Count_2;
const uint8_t Bar_Data[8]={0x01, 0x03, 0x07, 0x0f, 0x1f, 0x3f, 0x7f, 0xff};
BAR_DATA Spectrum_New, Spectrum_Last, Sample;
/***************************CD4094 Driver**********************************/
void CD4094_SendData(uint8_t Data)
{  
    uint8_t i;
    for(i=0; i<8; i++){
        if((Data&0x80))SDA=0; else SDA=1; //NOT
        SCK=1; nop(); nop(); nop();
        SCK=0; nop(); nop(); nop(); 
        Data<<=1;
    }
}
void CD4094_Driver(uint8_t *Byte, uint8_t Len)   //Max 255 IC
{
     while(Len--)CD4094_SendData(Byte[Len]);
     STR=0; delay_us(1); STR=1; 
}
 /***************************VFD Driver************************************/
void VFD_Driver(uint8_t Index, uint16_t Anot)
{
    uint8_t Output[4];
    uint16_t Grid = 1<<Index;
    Output[0] = (uint8_t)Anot;
    Output[1] = (uint8_t)(Anot>>8);
    Output[2] = (uint8_t)Grid;
    Output[3] = (uint8_t)(Grid>>8);
    CD4094_Driver(Output, 4);
}
/***************************Hien thi man VFD************************************/
void VFD_Display(void)       //16 Grid+, 16 Anot+
{
      VFD_Driver(Display_Index, VFD_Display_Data[Display_Index]);
      if(++Display_Index > 15)Display_Index=0;
}
/***********************Lam muot & cap nhat du lieu moi***********************/
void Spectrum_Smoothing(void)
{
    uint8_t Spectrum_Data = Sample.Data[Spectrum_Count_2]; //Convert
    if(Spectrum_Data > BAR_MAX)Spectrum_Data = BAR_MAX;
    if(Effect == 5 && Spectrum_Count_2 < Point_FFT/2)Spectrum_Data >>= 1;
    ///////////
    if(Spectrum_Data >= Spectrum_New.Data[Spectrum_Count_2]){ //Data New >= New
        Spectrum_New.Data[Spectrum_Count_2] = Spectrum_Data;
        if(++Spectrum_Count_2 > (Point_FFT/2))Spectrum_Count_2=0;
        Time_Tick_4=0;
    }else{
        if(Time_Tick_4 >= Time_Set_New){  //Delay
            if(Spectrum_New.Data[Spectrum_Count_2] > 0)
                Spectrum_New.Data[Spectrum_Count_2]--;
            if(++Spectrum_Count_2 > (Point_FFT/2))Spectrum_Count_2=0;
            Time_Tick_4=0;
        }
    }
    //////////
    if(Spectrum_New.Data[Spectrum_Count] >= Spectrum_Last.Data[Spectrum_Count]){ //new >= last
        Spectrum_Last.Data[Spectrum_Count] = Spectrum_New.Data[Spectrum_Count];
        if(++Spectrum_Count > (Point_FFT/2)-1)Spectrum_Count=0;
        Time_Tick_2=0;
    }else{
        if(Time_Tick_2 >= Time_Set_Last){  //Delay
            if(DIR_Bar_Last_Point){
                if(Spectrum_Last.Data[Spectrum_Count] > 0)
                    Spectrum_Last.Data[Spectrum_Count]--;
            }else{
                if(Spectrum_Last.Data[Spectrum_Count] < BAR_MAX+1)
                    Spectrum_Last.Data[Spectrum_Count]++;
            }
            if(++Spectrum_Count > (Point_FFT/2)-1)Spectrum_Count=0;
            Time_Tick_2=0;
        }
    }
}
/*****************************Scan Key************************************/
void Scan_Key(void)
{
    if(!KEY){
        if(BUT_EN){
            VFD_Driver(0, 0);
            delay_ms(30);
            if(!KEY){
                BUT_EN=0;
                if(++Effect>TOTAL_EFFECT)Effect=1;
                Time_Tick_1 = 0;
            }
        }
    }else if(!SET){
        if(BUT_EN){
            VFD_Driver(0, 0);
            delay_ms(30);
            if(!SET){
                BUT_EN=0;
                //if(++Bright>10)Bright=1;
                //Display_Bright(Bright*10);
                if(--Effect<1)Effect=TOTAL_EFFECT;
                Time_Tick_1 = 0;
            }
        }
    }else BUT_EN=1;
}

/*********************** Ham tao doi xung 16bit *******************************/
uint16_t Function_Symmetry(uint8_t Data) //Toa ra, doi xung tai Bit D7
{
    uint8_t s;
    uint16_t Output=0;
    for(s=1; s<8; s++){ //Nua Byte thap
        Output <<= 1;
        if(Data & (1<<s))Output |= 1; //Sap xep lai bit
    }
    Output |= Data << 7; //Nua Byte cao
    return Output; //OutBit D0-D14, D15=0; Data=0 --> D7=1; Data=1 --> D6=D7=D8=1; ...
}
/***************************Display Effect************************************/
void Display_Effect(void)
{
    uint8_t i;
    Spectrum_Smoothing();
    /////////////////////////////////HIEU UNG////////////////////////////////
    if(Effect == 1){  //Hieu ung BAR
        Time_Set_New = 5;
        Time_Set_Last = 0;
        DIR_Bar_Last_Point = 1; //Roi xuong
        for(i=0; i < Point_FFT/2; i++){
            if(Spectrum_New.Data[i]>8){
                VFD_Display_Data[i] = ((uint16_t)Bar_Data[Spectrum_New.Data[i]-9] << 8) | 0x00ff;
            }else if(Spectrum_New.Data[i]>0){
                VFD_Display_Data[i] = (uint16_t)Bar_Data[Spectrum_New.Data[i]-1];
            }else{
                VFD_Display_Data[i] = 0; //No Bar
            }
            VFD_Display_Data[i] |= TEXT_BAR_SHOW;
        }
    }else if(Effect == 2){ //Hieu ung BAR roi tu do
        Time_Set_New = 4;
        Time_Set_Last = 13;
        DIR_Bar_Last_Point = 1; //Roi xuong
        for(i=0; i < Point_FFT/2; i++){
            if(Spectrum_New.Data[i]>8){
                VFD_Display_Data[i] = ((uint16_t)Bar_Data[Spectrum_New.Data[i]-9] << 8) | 0x00ff;
            }else if(Spectrum_New.Data[i]>0){
                VFD_Display_Data[i] = (uint16_t)Bar_Data[Spectrum_New.Data[i]-1];
            }else{
                VFD_Display_Data[i] = 0; //No Bar
            }
            VFD_Display_Data[i] |= ((1 << Spectrum_Last.Data[i]) >> 1) | TEXT_BAR_SHOW;
        }
    }else if(Effect == 3){ //Hieu ung 1 diem roi tu do
        Time_Set_New = 5;
        Time_Set_Last = 0;
        DIR_Bar_Last_Point = 1; //Roi xuong
        for(i=0; i < Point_FFT/2; i++){
            VFD_Display_Data[i] = (1 << Spectrum_New.Data[i]) >> 1;
            VFD_Display_Data[i] |= TEXT_BAR_SHOW;
        }
    }else if(Effect == 4){ //Hieu ung BAR bay len
        Time_Set_New = 4;
        Time_Set_Last = 12; //Point Delay
        DIR_Bar_Last_Point = 0; //Bay len
        for(i=0; i < Point_FFT/2; i++){
            if(Spectrum_New.Data[i]>8){
                VFD_Display_Data[i] = ((uint16_t)Bar_Data[Spectrum_New.Data[i]-9] << 8) | 0x00ff;
            }else if(Spectrum_New.Data[i]>0){
                VFD_Display_Data[i] = (uint16_t)Bar_Data[Spectrum_New.Data[i]-1];
            }else{
                VFD_Display_Data[i] = 0; //No Bar
            }
            if(Spectrum_Last.Data[i] == BAR_MAX+1)Spectrum_Last.Data[i] = Spectrum_New.Data[i]; //Update Point
            VFD_Display_Data[i] |= ((1 << Spectrum_Last.Data[i]) >> 1) | TEXT_BAR_SHOW;
        }
    }else if(Effect == 5){ //Hieu ung BAR doi xung
        Time_Set_New = 6;
        Time_Set_Last = 0; //Disable last
        DIR_Bar_Last_Point = 1; //Roi xuong
        for(i=0; i < Point_FFT/2; i++){
            VFD_Display_Data[i] = Function_Symmetry(Bar_Data[Spectrum_New.Data[i]]);
            VFD_Display_Data[i] |= TEXT_BAR_SHOW;
        }
    }
    //End Effect
    if(Time_Tick_1 >= 30000){ //Next Effect Auto --> 30s (MAX 65s)
        if(++Effect > TOTAL_EFFECT)Effect = 1;
        Time_Tick_1 = 0;
    }
    if(Spectrum_New.Data[Point_FFT/2] > BAR_MAX-1)Spectrum_New.Data[Point_FFT/2] = BAR_MAX-1;
    VFD_Display_Data[14] = (1 << Spectrum_New.Data[Point_FFT/2]) | TEXT_BAR_SHOW;  //Hien thi Bar Total
    VFD_Display_Data[15] = ((Effect<TOTAL_EFFECT+1)?(1<<(Effect+8)):(TEXT_MEMORY)) | ((Spectrum_New.Data[Point_FFT/2]>10)?(TEXT_HIGH):(TEXT_NORMAL));   //Hien thi Icon Text
}
/***************************Debug System************************************/
#if(DEBUG==1)
static uint16_t Time_Debug;
static char buff[30];
extern uint16_t Vol_FB;
void Debug_System(void)
{
    if(++Time_Debug < 2000)return;
    Time_Debug = 0;
    sprintf(buff, "\rV_Ref: %u *** V_FB: %u\r", ADC_Vref, Vol_FB);
    USART_PutString(buff); 
}
#endif

