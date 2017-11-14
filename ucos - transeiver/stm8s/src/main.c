#include "includes.h"



#define  LONG_DELAY_TICKS   OS_TICKS_PER_SEC/10
#define  SHORT_DELAY_TICKS  OS_TICKS_PER_SEC/100

#define  OS_TASK_0_STK_SIZE                50
#define  OS_TASK_1_STK_SIZE                50
#define  OS_TASK_2_STK_SIZE                50

#define  OS_TASK_0_PRIO                    7
#define  OS_TASK_1_PRIO                    6
#define  OS_TASK_2_PRIO                    5

OS_STK	Task0Stack[OS_TASK_0_STK_SIZE];	
OS_STK	Task1Stack[OS_TASK_1_STK_SIZE];
OS_STK	Task2Stack[OS_TASK_2_STK_SIZE];

OS_EVENT *Sem_0=NULL;
u16 frequency =  13330;

OS_EVENT *Sem_1=NULL;
u8 key = 0;
u8 last_key = 0;

OS_EVENT *Sem_2=NULL;

void task0( void * pdata )
{
  INT8U err;
  OSSemPend(Sem_0,0,&err);
  for(;;)
  {    


    if(err == OS_NO_ERR)
    {
            
      OSTimeDly(LONG_DELAY_TICKS); 
      OSTimeDly(LONG_DELAY_TICKS); 
      OSTimeDly(SHORT_DELAY_TICKS);

   }
    
  }
  
}
#define RX
void task1(void * pdata )
{

  for(;;)
  {    
    if(key_up == 0|| key_down == 0)
    {
      OSTimeDly(LONG_DELAY_TICKS);
      if(key_up == 0)
      {
        key =1;
      }
      else if( key_down == 0)
      {
        key = 2;    
      }else
      {
        key = 0;
      }
      
      //send the key value
      if( last_key != key )
      {
        last_key = key;
        OSSemPost(Sem_1);
      }
      
    }

    OSTimeDly(LONG_DELAY_TICKS); 
  }
}
void task2(void * pdata)
{
  INT8U err;
  OSTimeDly(100);
  IntAt1846s();
  for(;;)
  {    

    OSSemPend(Sem_1,200,&err);
    if(err == OS_NO_ERR)
    {
      if(last_key == 1)
      {//enter tx modle
        frequency += 1;
        
        OSTimeDly(10);;
        At1846sOPenTx();
        
      }
      else if(last_key == 2)
      {
        frequency -= 1;
      }
      
      //enter rx modle
      else if(last_key == 0)
      {

        //OSTimeDly(10);//100ms
        //At1846sOPenRx();
        

      }
      last_key = 3;
      //OSSemPost(Sem_0);
      // Write_8LED(3,frequency/10000,frequency%10000/1000,frequency%1000/100,frequency%100/10);
    }
    ReadSignal();
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
  
  Sem_0=OSSemCreate (0);
  Sem_1=OSSemCreate (0);
  Sem_2=OSSemCreate (0);
  
  
  OSStart();
  return	0;
}

