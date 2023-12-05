#include "iwatchdog.h"

void IWATCHDOG_Init(void)
{
  /******************************************************************************
    Thu Tu Khoi Independent WatchDog
    1:        IWDG_Enable();                                 // Cho phep WatchDog hoat dong
    2:        IWDG_ReloadCounter();                          // Refresh WatchDog
    3:        IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);  // Cho phep ghi vao cac thanh ghi Prescaler va Reload
    4:        IWDG_SetPrescaler(IWDG_Prescaler_256);         // Xac dinh he so Prescaler
    5:        IWDG_SetReload(0xff);                          // Xac dinh so Reload
    Chu Ky WatchDog T = (2*Reload*Prescaler)/128000.
    ******************************************************************************/
    //IWDG_Enable();
    IWDG->KR = IWDG_KEY_ENABLE;
    //IWDG_ReloadCounter();
    //IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
    IWDG->KR = IWDG_WriteAccess_Enable;
    //IWDG_SetPrescaler(IWDG_Prescaler_256);                   // Tan so = 128000/(2*IWDG_Prescaler);
    IWDG->PR = IWDG_Prescaler_256;
    //IWDG_SetReload(0xff);
    IWDG->RLR = 0xff;
/*******************************************************************************/
}