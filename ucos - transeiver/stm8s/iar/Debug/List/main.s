///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.40.1.50106 for STM8            05/Feb/2017  11:35:14 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\RDA1846s\walkphone program\ucos -                    /
//                    transeiver\stm8s\src\main.c                             /
//    Command line =  "E:\RDA1846s\walkphone program\ucos -                   /
//                    transeiver\stm8s\src\main.c" -e -On --no_cse            /
//                    --no_unroll --no_inline --no_code_motion --no_tbaa      /
//                    --no_cross_call --debug --code_model small              /
//                    --data_model medium -o "E:\RDA1846s\walkphone           /
//                    program\ucos - transeiver\stm8s\iar\Debug\Obj\"         /
//                    --dlib_config "C:\Program Files (x86)\IAR               /
//                    Systems\Embedded Workbench 6.5\stm8\LIB\dlstm8smn.h"    /
//                    -D STM8S207 -lB "E:\RDA1846s\walkphone program\ucos -   /
//                    transeiver\stm8s\iar\Debug\List\" --diag_suppress       /
//                    pa089 -I "E:\RDA1846s\walkphone program\ucos -          /
//                    transeiver\stm8s\iar\..\..\ucos_ii\" -I                 /
//                    "E:\RDA1846s\walkphone program\ucos -                   /
//                    transeiver\stm8s\iar\..\..\ucos_ii\iarstm8\" -I         /
//                    "E:\RDA1846s\walkphone program\ucos -                   /
//                    transeiver\stm8s\iar\..\src\" -I                        /
//                    "E:\RDA1846s\walkphone program\ucos -                   /
//                    transeiver\stm8s\iar\..\fwlib\inc\" --vregs 16          /
//    List file    =  E:\RDA1846s\walkphone program\ucos -                    /
//                    transeiver\stm8s\iar\Debug\List\main.s                  /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME main

        EXTERN ?push_w4
        EXTERN ?w0
        EXTERN ?w4
        EXTERN All_Init
        EXTERN At1846sOPenRx
        EXTERN IntAt1846s
        EXTERN OSInit
        EXTERN OSSemCreate
        EXTERN OSSemPend
        EXTERN OSSemPost
        EXTERN OSStart
        EXTERN OSTaskCreate
        EXTERN OSTimeDly

        PUBLIC Sem_0
        PUBLIC Sem_1
        PUBLIC Sem_2
        PUBLIC Task0Stack
        PUBLIC Task1Stack
        PUBLIC Task2Stack
        PUBLIC _A_PB_IDR
        PUBLIC _A_PD_IDR
        PUBLIC _A_PD_ODR
        PUBLIC _A_PF_ODR
        PUBLIC frequency
        PUBLIC key
        PUBLIC main
        PUBLIC task0
        PUBLIC task1
        PUBLIC task2

// E:\RDA1846s\walkphone program\ucos - transeiver\stm8s\src\main.c
//    1 #include "includes.h"

        ASEGN `.near.noinit`:DATA:NOROOT,05006H
        SECTION_GROUP _A_PB_IDR
// union <unnamed> const volatile _A_PB_IDR
_A_PB_IDR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,0500fH
        SECTION_GROUP _A_PD_ODR
// union <unnamed> volatile _A_PD_ODR
_A_PD_ODR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05010H
        SECTION_GROUP _A_PD_IDR
// union <unnamed> const volatile _A_PD_IDR
_A_PD_IDR:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05019H
        SECTION_GROUP _A_PF_ODR
// union <unnamed> volatile _A_PF_ODR
_A_PF_ODR:
        DS8 1
//    2 
//    3 
//    4 
//    5 #define  LONG_DELAY_TICKS   OS_TICKS_PER_SEC/10
//    6 #define  SHORT_DELAY_TICKS  OS_TICKS_PER_SEC/100
//    7 
//    8 #define  OS_TASK_0_STK_SIZE                50
//    9 #define  OS_TASK_1_STK_SIZE                50
//   10 #define  OS_TASK_2_STK_SIZE                50
//   11 
//   12 #define  OS_TASK_0_PRIO                    5
//   13 #define  OS_TASK_1_PRIO                    6
//   14 #define  OS_TASK_2_PRIO                    7
//   15 

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   16 OS_STK	Task0Stack[OS_TASK_0_STK_SIZE];	
Task0Stack:
        DS8 50

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   17 OS_STK	Task1Stack[OS_TASK_1_STK_SIZE];
Task1Stack:
        DS8 50

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   18 OS_STK	Task2Stack[OS_TASK_2_STK_SIZE];
Task2Stack:
        DS8 50
//   19 

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   20 OS_EVENT *Sem_0=NULL;
Sem_0:
        DS8 2

        SECTION `.near.data`:DATA:REORDER:NOROOT(0)
//   21 u16 frequency =  13330;
frequency:
        DC16 13330
//   22 

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   23 OS_EVENT *Sem_1=NULL;
Sem_1:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   24 u8 key = 0;
key:
        DS8 1
//   25 

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   26 OS_EVENT *Sem_2=NULL;
Sem_2:
        DS8 2
//   27 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   28 void task0( void * pdata )
//   29 {
task0:
        CALL      L:?push_w4
        SUB       SP, #0x1
        LDW       S:?w4, X
//   30   INT8U err;
//   31   for(;;)
//   32   {    
//   33 
//   34     OSSemPend(Sem_0,0,&err);
??task0_0:
        LDW       X, SP
        ADDW      X, #0x1
        LDW       S:?w0, X
        CLRW      Y
        LDW       X, L:Sem_0
        CALL      L:OSSemPend
//   35     if(err == OS_NO_ERR)
        TNZ       (0x1,SP)
        JRNE      L:??task0_0
//   36     {
//   37       
//   38       LED1_ON;        
        BSET      L:0x500f, #0x3
//   39       OSTimeDly(LONG_DELAY_TICKS); 
        LDW       X, #0xa
        CALL      L:OSTimeDly
//   40       LED1_OFF; 
        BRES      L:0x500f, #0x3
//   41 
//   42       OSTimeDly(SHORT_DELAY_TICKS);
        CLRW      X
        INCW      X
        CALL      L:OSTimeDly
        JRA       L:??task0_0
        REQUIRE _A_PD_ODR
//   43 
//   44     }
//   45     
//   46   }
//   47   
//   48 }
//   49 #define RX

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   50 void task1(void * pdata )
//   51 {
task1:
        CALL      L:?push_w4
        LDW       S:?w4, X
//   52   //INT8U err;
//   53 //#ifdef RX  
//   54 //  RxPowerEN = 1;
//   55 //  SQL = 1;
//   56 //  OSTimeDly(SHORT_DELAY_TICKS);
//   57 //  RDA1846_Init();
//   58 //  RDA1846RX(0x26);
//   59 //#else //TX
//   60 //  TxPowerEN = 1;
//   61 //  SQL = 0;
//   62 //  OSTimeDly(SHORT_DELAY_TICKS);
//   63 //  RDA1846_Init();
//   64 //  RDA1846TX();
//   65 //#endif
//   66 #ifdef RX  
//   67   RxPowerEN = 1;
        BSET      L:0x500f, #0x6
//   68   SQL = 1;
        BSET      L:0x5019, #0x4
//   69   OSTimeDly(SHORT_DELAY_TICKS);
        CLRW      X
        INCW      X
        CALL      L:OSTimeDly
//   70   IntAt1846s();
        CALL      L:IntAt1846s
//   71   OSTimeDly(10);;
        LDW       X, #0xa
        CALL      L:OSTimeDly
//   72   At1846sOPenRx();
        CALL      L:At1846sOPenRx
//   73 #else //TX
//   74   TxPowerEN = 1;
//   75   SQL = 0;
//   76   OSTimeDly(SHORT_DELAY_TICKS);
//   77   IntAt1846s();
//   78   OSTimeDly(10);;
//   79   At1846sOPenTx();
//   80 #endif
//   81   for(;;)
//   82   {    
//   83 
//   84     if(key_up == 0|| key_down == 0)
??task1_0:
        LD        A, L:0x5006
        SRL       A
        AND       A, #0x1
        CP        A, #0x0
        JREQ      L:??task1_1
        BTJT      L:0x5010, #0x7, L:??task1_2
//   85     {
//   86       LED0_ON; 
??task1_1:
        BSET      L:0x500f, #0x0
//   87       OSTimeDly(LONG_DELAY_TICKS);
        LDW       X, #0xa
        CALL      L:OSTimeDly
//   88       LED0_OFF;
        BRES      L:0x500f, #0x0
//   89       if(key_up == 0)
        LD        A, L:0x5006
        SRL       A
        AND       A, #0x1
        CP        A, #0x0
        JRNE      L:??task1_3
//   90       {
//   91         key =1;
        MOV       L:key, #0x1
//   92         OSSemPost(Sem_1);  
        LDW       X, L:Sem_1
        CALL      L:OSSemPost
        JRA       L:??task1_2
//   93       }
//   94       else if( key_down == 0)
??task1_3:
        BTJT      L:0x5010, #0x7, L:??task1_4
//   95       {
//   96         key = 2;
        MOV       L:key, #0x2
//   97         OSSemPost(Sem_1); 
        LDW       X, L:Sem_1
        CALL      L:OSSemPost
        JRA       L:??task1_2
//   98         
//   99       }else
//  100       {
//  101         key = 0;
??task1_4:
        MOV       L:key, #0x0
//  102       }
//  103       
//  104     }
//  105     OSTimeDly(LONG_DELAY_TICKS);       
??task1_2:
        LDW       X, #0xa
        CALL      L:OSTimeDly
        JRA       L:??task1_0
        REQUIRE _A_PD_ODR
        REQUIRE _A_PF_ODR
        REQUIRE _A_PB_IDR
        REQUIRE _A_PD_IDR
//  106   }
//  107 }

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  108 void task2(void * pdata)
//  109 {
task2:
        CALL      L:?push_w4
        SUB       SP, #0x1
        LDW       S:?w4, X
//  110   INT8U err;
//  111   
//  112   
//  113   for(;;)
//  114   {    
//  115   
//  116     OSSemPend(Sem_1,0,&err);
??task2_0:
        LDW       X, SP
        ADDW      X, #0x1
        LDW       S:?w0, X
        CLRW      Y
        LDW       X, L:Sem_1
        CALL      L:OSSemPend
//  117     if(err == OS_NO_ERR)
        TNZ       (0x1,SP)
        JRNE      L:??task2_0
//  118     {
//  119       if(key == 1)
        LD        A, L:key
        CP        A, #0x1
        JRNE      L:??task2_1
//  120       {
//  121         frequency += 1;
        LDW       X, L:frequency
        INCW      X
        LDW       L:frequency, X
//  122         OSSemPost(Sem_0);
        LDW       X, L:Sem_0
        CALL      L:OSSemPost
        JRA       L:??task2_0
//  123       }
//  124       else if(key == 2)
??task2_1:
        LD        A, L:key
        CP        A, #0x2
        JRNE      L:??task2_0
//  125       {
//  126         frequency -= 1;
        LDW       X, L:frequency
        DECW      X
        LDW       L:frequency, X
//  127         OSSemPost(Sem_0);
        LDW       X, L:Sem_0
        CALL      L:OSSemPost
        JRA       L:??task2_0
//  128       }
//  129       // Write_8LED(3,frequency/10000,frequency%10000/1000,frequency%1000/100,frequency%100/10);
//  130     }
//  131     //OSTimeDly(LONG_DELAY_TICKS);       
//  132   }
//  133 }
//  134 
//  135 
//  136 
//  137 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  138 int main()
//  139 {
//  140   __disable_interrupt();
main:
        SIM
//  141   All_Init();
        CALL      L:All_Init
//  142 
//  143 
//  144   OSInit();
        CALL      L:OSInit
//  145   
//  146   OSTaskCreate( task0, (void *)OS_TASK_0_STK_SIZE, &Task0Stack[OS_TASK_0_STK_SIZE-1], OS_TASK_0_PRIO );
        LD        A, #0x5
        LDW       X, #Task0Stack + 49
        LDW       S:?w0, X
        LDW       Y, #0x32
        LDW       X, #task0
        CALL      L:OSTaskCreate
//  147   OSTaskCreate( task1, (void *)OS_TASK_1_STK_SIZE, &Task1Stack[OS_TASK_1_STK_SIZE-1], OS_TASK_1_PRIO );
        LD        A, #0x6
        LDW       X, #Task1Stack + 49
        LDW       S:?w0, X
        LDW       Y, #0x32
        LDW       X, #task1
        CALL      L:OSTaskCreate
//  148   OSTaskCreate( task2, (void *)OS_TASK_2_STK_SIZE, &Task2Stack[OS_TASK_2_STK_SIZE-1], OS_TASK_2_PRIO );
        LD        A, #0x7
        LDW       X, #Task2Stack + 49
        LDW       S:?w0, X
        LDW       Y, #0x32
        LDW       X, #task2
        CALL      L:OSTaskCreate
//  149   
//  150   Sem_0=OSSemCreate (1);
        CLRW      X
        INCW      X
        CALL      L:OSSemCreate
        LDW       L:Sem_0, X
//  151   Sem_1=OSSemCreate (1);
        CLRW      X
        INCW      X
        CALL      L:OSSemCreate
        LDW       L:Sem_1, X
//  152   Sem_2=OSSemCreate (1);
        CLRW      X
        INCW      X
        CALL      L:OSSemCreate
        LDW       L:Sem_2, X
//  153   
//  154   
//  155   OSStart();
        CALL      L:OSStart
//  156   return	0;
        CLRW      X
        RET
//  157 }

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  158 
// 
// 157 bytes in section .near.bss
//   2 bytes in section .near.data
//   4 bytes in section .near.noinit    (abs)
// 312 bytes in section .near_func.text
// 
// 312 bytes of CODE memory
// 159 bytes of DATA memory (+ 4 bytes shared)
//
//Errors: none
//Warnings: none
