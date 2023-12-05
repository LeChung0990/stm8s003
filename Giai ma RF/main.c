/*khai bao macro chan nhan tin hieu la D3*/
#define RF_IN (GPIO_ReadInputData(GPIOD) & (1<<3))
/*dung timer2 de do thoi gian cac xung nhan duoc
, 1 tick la 1us*/
#define SYNC_MAX 11000	//XUNG sync
#define SYNC_MIN 9000	//xung sync
#define BIT_S_MIN 200
#define BIT_S_MAX 400
#define BIT_L_MIN 900
#define BIT_L_MAX 1100
/*
		
___SYNC______|-0.3ms-|___0.97ms____|---


*/
uint32_t rf_decode(void)
{
	uint32_t timeout = 0;
	uint32_t count = 0;
	uint32_t timevalue = 0;
	uint32_t result = 0;
	
	if(RF_IN){
		return 0;
	}
	timeout = 1;
	TIM4_SetCounter(0);
	while(TIM4_GetCounter() < SYNC_MAX){
		if(RF_IN){
			timeout = 0;
			break;
		}
	}
	if(timeout){
		return 0;
	}
	if(TIM4_GetCounter() < SYNC_MIN){
		return 0; //ket thuc giai ma
	}
	
	 count = 0;
	while(count < 24){
		timeout = 1;
		TIM4_SetCounter(0);
		while(TIM4_GetCounter() < BIT_L_MAX){
			if(!RF_IN){
				timeout = 0;
				break;
			}
		}
		if(timeout){
			return 0;
		}
		timevalue = TIM4_GetCounter();
		if((timevalue > BIT_S_MIN) && (timevalue < BIT_S_MAX)){
			/*bit 0*/
			timeout = 1;
			TIM4_SetCounter(0);
			while (TIM4_GetCounter() < BIT_L_MAX){
				if(RF_IN){
					timeout = 0;	//dieu khien dung
					break;
				}
			}
			if(timeout){
				return 0;
			}
			timevalue = TIM4_GetCounter();
			if((timevalue > BIT_L_MIN) && (timevalue < BIT_L_MAX)){
				result <<= 1;	//gui thanh cong bit 0
				++count;
			} else {
				return 0;
			}
		} else if ((timevalue > BIT_L_MIN) && (timevalue < BIT_L_MAX)){
			/*bit 1*/
			timeout = 1;
			TIM4_SetCounter(0);
			while (TIM4_GetCounter() < BIT_L_MAX){
				if(RF_IN){
					timeout = 0;	//dieu khien dung
					break;
				}
			}
			if(timeout){
				return 0;
			}
			timevalue = TIM4_GetCounter();
			if((timevalue > BIT_S_MIN) && (timevalue < BIT_S_MAX)){
				result <<= 1;	//gui thanh cong bit 1
				result |= 1;
				++count;
			} else {
				return 0;
			}
		} else {
			return 0;
		}
	}
	return result;
}

void main(){
	GPIO_Init(GPIOD, GPIO_PIN_3,GPIO_MODE_IN_FL_NO_IT);
}







uint32_t rf_decode(void)
{
	uint32_t timeout = 0;
	uint32_t count = 0;
	uint32_t timevalue = 0;
	uint32_t result = 0;
	
	if(RF_IN == 0){
		return 0;
	}
	timeout = 1;
	TCNT1 = 0;
	while(TCNT1 < (SYNC_MAX<<1)){
		if(RF_IN){
			timeout = 0;
			break;
		}
	}
	if(timeout){
		return 0;
	}
	if(TIM4_GetCounter() < SYNC_MIN){
		return 0; //ket thuc giai ma
	}
	
	 count = 0;
	while(count < 24){
		timeout = 1;
		TIM4_SetCounter(0);
		while(TIM4_GetCounter() < BIT_L_MAX){
			if(!RF_IN){
				timeout = 0;
				break;
			}
		}
		if(timeout){
			return 0;
		}
		timevalue = TIM4_GetCounter();
		if((timevalue > BIT_S_MIN) && (timevalue < BIT_S_MAX)){
			/*bit 0*/
			timeout = 1;
			TIM4_SetCounter(0);
			while (TIM4_GetCounter() < BIT_L_MAX){
				if(RF_IN){
					timeout = 0;	//dieu khien dung
					break;
				}
			}
			if(timeout){
				return 0;
			}
			timevalue = TIM4_GetCounter();
			if((timevalue > BIT_L_MIN) && (timevalue < BIT_L_MAX)){
				result <<= 1;	//gui thanh cong bit 0
				++count;
			} else {
				return 0;
			}
		} else if ((timevalue > BIT_L_MIN) && (timevalue < BIT_L_MAX)){
			/*bit 1*/
			timeout = 1;
			TIM4_SetCounter(0);
			while (TIM4_GetCounter() < BIT_L_MAX){
				if(RF_IN){
					timeout = 0;	//dieu khien dung
					break;
				}
			}
			if(timeout){
				return 0;
			}
			timevalue = TIM4_GetCounter();
			if((timevalue > BIT_S_MIN) && (timevalue < BIT_S_MAX)){
				result <<= 1;	//gui thanh cong bit 1
				result |= 1;
				++count;
			} else {
				return 0;
			}
		} else {
			return 0;
		}
	}
	return result;
}
