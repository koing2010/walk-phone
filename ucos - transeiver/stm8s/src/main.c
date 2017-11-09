#include "includes.h"



#define  LONG_DELAY_TICKS   OS_TICKS_PER_SEC/10
#define  SHORT_DELAY_TICKS  OS_TICKS_PER_SEC/100

#define  OS_TASK_0_STK_SIZE                50
#define  OS_TASK_1_STK_SIZE                50
#define  OS_TASK_2_STK_SIZE                50

#define  OS_TASK_0_PRIO                    5
#define  OS_TASK_1_PRIO                    6
#define  OS_TASK_2_PRIO                    7

OS_STK	Task0Stack[OS_TASK_0_STK_SIZE];	
OS_STK	Task1Stack[OS_TASK_1_STK_SIZE];
OS_STK	Task2Stack[OS_TASK_2_STK_SIZE];

OS_EVENT *Sem_0=NULL;
u16 frequency =  13330;

OS_EVENT *Sem_1=NULL;
u8 key = 0;

OS_EVENT *Sem_2=NULL;

void task0( void * pdata )
{
  INT8U err;
  for(;;)
  {    

    OSSemPend(Sem_0,0,&err);
    if(err == OS_NO_ERR)
    {
      
      LED1_ON;        
      OSTimeDly(LONG_DELAY_TICKS); 
      LED1_OFF; 

      OSTimeDly(SHORT_DELAY_TICKS);

    }
    
  }
  
}
#define RX
void task1(void * pdata )
{
  //INT8U err;
//#ifdef RX  
//  RxPowerEN = 1;
//  SQL = 1;
//  OSTimeDly(SHORT_DELAY_TICKS);
//  RDA1846_Init();
//  RDA1846RX(0x26);
//#else //TX
//  TxPowerEN = 1;
//  SQL = 0;
//  OSTimeDly(SHORT_DELAY_TICKS);
//  RDA1846_Init();
//  RDA1846TX();
//#endif
#ifdef RX  
  RxPowerEN = 1;
  SQL = 1;
  OSTimeDly(SHORT_DELAY_TICKS);
  IntAt1846s();
  OSTimeDly(10);;
  At1846sOPenRx();
#else //TX
  TxPowerEN = 1;
  SQL = 0;
  OSTimeDly(SHORT_DELAY_TICKS);
  IntAt1846s();
  OSTimeDly(10);;
  At1846sOPenTx();
#endif
  for(;;)
  {    

    if(key_up == 0|| key_down == 0)
    {
      LED0_ON; 
      OSTimeDly(LONG_DELAY_TICKS);
      LED0_OFF;
      if(key_up == 0)
      {
        key =1;
        OSSemPost(Sem_1);  
      }
      else if( key_down == 0)
      {
        key = 2;
        OSSemPost(Sem_1); 
        
      }else
      {
        key = 0;
      }
      
    }
    OSTimeDly(LONG_DELAY_TICKS);       
  }
}
void task2(void * pdata)
{
  INT8U err;
  
  
  for(;;)
  {    
  
    OSSemPend(Sem_1,0,&err);
    if(err == OS_NO_ERR)
    {
      if(key == 1)
      {
        frequency += 1;
        OSSemPost(Sem_0);
      }
      else if(key == 2)
      {
        frequency -= 1;
        OSSemPost(Sem_0);
      }
      // Write_8LED(3,frequency/10000,frequency%10000/1000,frequency%1000/100,frequency%100/10);
    }
    //OSTimeDly(LONG_DELAY_TICKS);       
  }
}




int main()
{
  __disable_interrupt();
  All_Init();


  OSInit();
  
  OSTaskCreate( task0, (void *)OS_TASK_0_STK_SIZE, &Task0Stack[OS_TASK_0_STK_SIZE-1], OS_TASK_0_PRIO );
  OSTaskCreate( task1, (void *)OS_TASK_1_STK_SIZE, &Task1Stack[OS_TASK_1_STK_SIZE-1], OS_TASK_1_PRIO );
  OSTaskCreate( task2, (void *)OS_TASK_2_STK_SIZE, &Task2Stack[OS_TASK_2_STK_SIZE-1], OS_TASK_2_PRIO );
  
  Sem_0=OSSemCreate (1);
  Sem_1=OSSemCreate (1);
  Sem_2=OSSemCreate (1);
  
  
  OSStart();
  return	0;
}

