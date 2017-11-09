///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.40.1.50106 for STM8            05/Feb/2017  11:28:53 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\RDA1846s\walkphone program\ucos -                    /
//                    transeiver\ucos_II\OS_CORE.C                            /
//    Command line =  "E:\RDA1846s\walkphone program\ucos -                   /
//                    transeiver\ucos_II\OS_CORE.C" -e -On --no_cse           /
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
//                    transeiver\stm8s\iar\Debug\List\OS_CORE.s               /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME OS_CORE

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b10
        EXTERN ?b11
        EXTERN ?b4
        EXTERN ?b6
        EXTERN ?b7
        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?epilogue_l2
        EXTERN ?epilogue_l2_l3
        EXTERN ?epilogue_w4
        EXTERN ?inc32_l0_l0
        EXTERN ?load32_0x_l0
        EXTERN ?load32_0x_l3
        EXTERN ?load32_l0_0x
        EXTERN ?mov_l3_l1
        EXTERN ?push_l2
        EXTERN ?push_l3
        EXTERN ?push_w0
        EXTERN ?push_w1
        EXTERN ?push_w4
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w2
        EXTERN ?w4
        EXTERN OSInitHookBegin
        EXTERN OSInitHookEnd
        EXTERN OSTCBInitHook
        EXTERN OSTaskCreateExt
        EXTERN OSTaskCreateHook
        EXTERN OSTaskIdleHook
        EXTERN OSTimeTickHook
        EXTERN OS_MemInit
        EXTERN OS_QInit
        EXTERN __near_OSCtxSw
        EXTERN __near_OSIntCtxSw
        EXTERN __near_OSStartHighRdy

        PUBLIC OSCtxSwCtr
        PUBLIC OSEventFreeList
        PUBLIC OSEventTbl
        PUBLIC OSIdleCtr
        PUBLIC OSInit
        PUBLIC OSIntEnter
        PUBLIC OSIntExit
        PUBLIC OSIntExitY
        PUBLIC OSIntNesting
        PUBLIC OSLockNesting
        PUBLIC OSMapTbl
        PUBLIC OSMemFreeList
        PUBLIC OSMemTbl
        PUBLIC OSPrioCur
        PUBLIC OSPrioHighRdy
        PUBLIC OSQFreeList
        PUBLIC OSQTbl
        PUBLIC OSRdyGrp
        PUBLIC OSRdyTbl
        PUBLIC OSRunning
        PUBLIC OSSchedLock
        PUBLIC OSSchedUnlock
        PUBLIC OSStart
        PUBLIC OSTCBCur
        PUBLIC OSTCBFreeList
        PUBLIC OSTCBHighRdy
        PUBLIC OSTCBList
        PUBLIC OSTCBPrioTbl
        PUBLIC OSTCBTbl
        PUBLIC OSTaskCtr
        PUBLIC OSTaskIdleStk
        PUBLIC OSTime
        PUBLIC OSTimeTick
        PUBLIC OSUnMapTbl
        PUBLIC OSVersion
        PUBLIC OS_Dummy
        PUBLIC OS_EventTO
        PUBLIC OS_EventTaskRdy
        PUBLIC OS_EventTaskWait
        PUBLIC OS_EventWaitListInit
        PUBLIC OS_Sched
        PUBLIC OS_TCBInit
        PUBLIC OS_TaskIdle

// E:\RDA1846s\walkphone program\ucos - transeiver\ucos_II\OS_CORE.C
//    1 /*
//    2 *********************************************************************************************************
//    3 *                                                uC/OS-II
//    4 *                                          The Real-Time Kernel
//    5 *                                             CORE FUNCTIONS
//    6 *
//    7 *                          (c) Copyright 1992-2002, Jean J. Labrosse, Weston, FL
//    8 *                                           All Rights Reserved
//    9 *
//   10 * File : OS_CORE.C
//   11 * By   : Jean J. Labrosse
//   12 *********************************************************************************************************
//   13 */
//   14 
//   15 #ifndef  OS_MASTER_FILE
//   16 #define  OS_GLOBALS
//   17 #include "includes.h"

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// static unsigned char CriticalEnter(void)
CriticalEnter:
        PUSH      CC
        POP       A
        AND       A, #0x28
        SIM
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// static void CriticalExit(unsigned char)
CriticalExit:
        LD        S:?b0, A
        LD        A, S:?b0
        LD        S:?b1, A
        PUSH      CC
        POP       A
        AND       A, #0xffffffffffffffd7
        OR        A, S:?b1
        PUSH      A
        POP       CC
        RET

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// INT32U OSCtxSwCtr
OSCtxSwCtr:
        DS8 4

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// struct <unnamed> *__near OSEventFreeList
OSEventFreeList:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// OS_EVENT OSEventTbl[8]
OSEventTbl:
        DS8 112

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// INT8U OSIntNesting
OSIntNesting:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// INT8U OSIntExitY
OSIntExitY:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// INT8U OSLockNesting
OSLockNesting:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// INT8U OSPrioCur
OSPrioCur:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// INT8U OSPrioHighRdy
OSPrioHighRdy:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// INT8U OSRdyGrp
OSRdyGrp:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// INT8U OSRdyTbl[8]
OSRdyTbl:
        DS8 8

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// BOOLEAN OSRunning
OSRunning:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// INT8U OSTaskCtr
OSTaskCtr:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// INT32U volatile OSIdleCtr
OSIdleCtr:
        DS8 4

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// OS_STK OSTaskIdleStk[64]
OSTaskIdleStk:
        DS8 64

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// struct os_tcb *__near OSTCBCur
OSTCBCur:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// struct os_tcb *__near OSTCBFreeList
OSTCBFreeList:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// struct os_tcb *__near OSTCBHighRdy
OSTCBHighRdy:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// struct os_tcb *__near OSTCBList
OSTCBList:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// struct os_tcb *__near OSTCBPrioTbl[64]
OSTCBPrioTbl:
        DS8 128

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// OS_TCB OSTCBTbl[6]
OSTCBTbl:
        DS8 186

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// struct <unnamed> *__near OSMemFreeList
OSMemFreeList:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// OS_MEM OSMemTbl[8]
OSMemTbl:
        DS8 128

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// OS_Q *__near OSQFreeList
OSQFreeList:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// OS_Q OSQTbl[1]
OSQTbl:
        DS8 14

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
// INT32U volatile OSTime
OSTime:
        DS8 4
//   18 #endif
//   19 
//   20 /*
//   21 *********************************************************************************************************
//   22 *                              MAPPING TABLE TO MAP BIT POSITION TO BIT MASK
//   23 *
//   24 * Note: Index into table is desired bit position, 0..7
//   25 *       Indexed value corresponds to bit mask
//   26 *********************************************************************************************************
//   27 */
//   28 

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
//   29 INT8U  const  OSMapTbl[]   = {0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80};
OSMapTbl:
        DC8 1, 2, 4, 8, 16, 32, 64, 128
//   30 
//   31 /*
//   32 *********************************************************************************************************
//   33 *                                       PRIORITY RESOLUTION TABLE
//   34 *
//   35 * Note: Index into table is bit pattern to resolve highest priority
//   36 *       Indexed value corresponds to highest priority bit position (i.e. 0..7)
//   37 *********************************************************************************************************
//   38 */
//   39 

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
//   40 INT8U  const  OSUnMapTbl[] = {
OSUnMapTbl:
        DC8 0, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 4, 0, 1, 0, 2, 0, 1
        DC8 0, 3, 0, 1, 0, 2, 0, 1, 0, 5, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0
        DC8 1, 0, 4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 6, 0, 1, 0, 2
        DC8 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0
        DC8 2, 0, 1, 0, 5, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 4, 0, 1
        DC8 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 7, 0, 1, 0, 2, 0, 1, 0, 3, 0
        DC8 1, 0, 2, 0, 1, 0, 4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 5
        DC8 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 4, 0, 1, 0, 2, 0, 1, 0
        DC8 3, 0, 1, 0, 2, 0, 1, 0, 6, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1
        DC8 0, 4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 5, 0, 1, 0, 2, 0
        DC8 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2
        DC8 0, 1, 0
//   41     0, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,       /* 0x00 to 0x0F                             */
//   42     4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,       /* 0x10 to 0x1F                             */
//   43     5, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,       /* 0x20 to 0x2F                             */
//   44     4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,       /* 0x30 to 0x3F                             */
//   45     6, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,       /* 0x40 to 0x4F                             */
//   46     4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,       /* 0x50 to 0x5F                             */
//   47     5, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,       /* 0x60 to 0x6F                             */
//   48     4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,       /* 0x70 to 0x7F                             */
//   49     7, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,       /* 0x80 to 0x8F                             */
//   50     4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,       /* 0x90 to 0x9F                             */
//   51     5, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,       /* 0xA0 to 0xAF                             */
//   52     4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,       /* 0xB0 to 0xBF                             */
//   53     6, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,       /* 0xC0 to 0xCF                             */
//   54     4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,       /* 0xD0 to 0xDF                             */
//   55     5, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,       /* 0xE0 to 0xEF                             */
//   56     4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0        /* 0xF0 to 0xFF                             */
//   57 };
//   58 
//   59 /*
//   60 *********************************************************************************************************
//   61 *                                       FUNCTION PROTOTYPES
//   62 *********************************************************************************************************
//   63 */
//   64 static  void  OS_InitEventList(void);
//   65 static  void  OS_InitMisc(void);
//   66 static  void  OS_InitRdyList(void);
//   67 static  void  OS_InitTaskIdle(void);
//   68 static  void  OS_InitTaskStat(void);
//   69 static  void  OS_InitTCBList(void);
//   70 
//   71 /*$PAGE*/
//   72 /*
//   73 *********************************************************************************************************
//   74 *                                             INITIALIZATION
//   75 *
//   76 * Description: This function is used to initialize the internals of uC/OS-II and MUST be called prior to
//   77 *              creating any uC/OS-II object and, prior to calling OSStart().
//   78 *
//   79 * Arguments  : none
//   80 *
//   81 * Returns    : none
//   82 *********************************************************************************************************
//   83 */
//   84 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   85 void  OSInit (void)
//   86 {
//   87 #if OS_VERSION >= 204
//   88     OSInitHookBegin();                                           /* Call port specific initialization code   */
OSInit:
        CALL      L:OSInitHookBegin
//   89 #endif
//   90 
//   91     OS_InitMisc();                                               /* Initialize miscellaneous variables       */
        CALL      L:OS_InitMisc
//   92 
//   93     OS_InitRdyList();                                            /* Initialize the Ready List                */
        CALL      L:OS_InitRdyList
//   94     OS_InitTCBList();                                            /* Initialize the free list of OS_TCBs      */
        CALL      L:OS_InitTCBList
//   95     OS_InitEventList();                                          /* Initialize the free list of OS_EVENTs    */
        CALL      L:OS_InitEventList
//   96 
//   97 #if (OS_VERSION >= 251) && (OS_FLAG_EN > 0) && (OS_MAX_FLAGS > 0)
//   98     OS_FlagInit();                                               /* Initialize the event flag structures     */
//   99 #endif
//  100 
//  101 #if (OS_MEM_EN > 0) && (OS_MAX_MEM_PART > 0)
//  102     OS_MemInit();                                                /* Initialize the memory manager            */
        CALL      L:OS_MemInit
//  103 #endif
//  104 
//  105 #if (OS_Q_EN > 0) && (OS_MAX_QS > 0)
//  106     OS_QInit();                                                  /* Initialize the message queue structures  */
        CALL      L:OS_QInit
//  107 #endif
//  108 
//  109     OS_InitTaskIdle();                                           /* Create the Idle Task                     */
        CALL      L:OS_InitTaskIdle
//  110 #if OS_TASK_STAT_EN > 0
//  111     OS_InitTaskStat();                                           /* Create the Statistic Task                */
//  112 #endif
//  113 
//  114 #if OS_VERSION >= 204
//  115     OSInitHookEnd();                                             /* Call port specific init. code            */
        CALL      L:OSInitHookEnd
//  116 #endif
//  117 }
        RET
//  118 /*$PAGE*/
//  119 /*
//  120 *********************************************************************************************************
//  121 *                                              ENTER ISR
//  122 *
//  123 * Description: This function is used to notify uC/OS-II that you are about to service an interrupt
//  124 *              service routine (ISR).  This allows uC/OS-II to keep track of interrupt nesting and thus
//  125 *              only perform rescheduling at the last nested ISR.
//  126 *
//  127 * Arguments  : none
//  128 *
//  129 * Returns    : none
//  130 *
//  131 * Notes      : 1) This function should be called ith interrupts already disabled
//  132 *              2) Your ISR can directly increment OSIntNesting without calling this function because
//  133 *                 OSIntNesting has been declared 'global'.  
//  134 *              3) You MUST still call OSIntExit() even though you increment OSIntNesting directly.
//  135 *              4) You MUST invoke OSIntEnter() and OSIntExit() in pair.  In other words, for every call
//  136 *                 to OSIntEnter() at the beginning of the ISR you MUST have a call to OSIntExit() at the
//  137 *                 end of the ISR.
//  138 *              5) You are allowed to nest interrupts up to 255 levels deep.
//  139 *              6) I removed the OS_ENTER_CRITICAL() and OS_EXIT_CRITICAL() around the increment because
//  140 *                 OSIntEnter() is always called with interrupts disabled.
//  141 *********************************************************************************************************
//  142 */
//  143 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  144 void  OSIntEnter (void)
//  145 {
//  146     if (OSRunning == TRUE) {
OSIntEnter:
        LD        A, L:OSRunning
        CP        A, #0x1
        JRNE      L:??OSIntEnter_0
//  147         if (OSIntNesting < 255) {
        LD        A, L:OSIntNesting
        CP        A, #0xff
        JREQ      L:??OSIntEnter_0
//  148             OSIntNesting++;                      /* Increment ISR nesting level                        */
        LD        A, L:OSIntNesting
        ADD       A, #0x1
        LD        L:OSIntNesting, A
//  149         }
//  150     }
//  151 }
??OSIntEnter_0:
        RET
//  152 /*$PAGE*/
//  153 /*
//  154 *********************************************************************************************************
//  155 *                                               EXIT ISR
//  156 *
//  157 * Description: This function is used to notify uC/OS-II that you have completed serviving an ISR.  When
//  158 *              the last nested ISR has completed, uC/OS-II will call the scheduler to determine whether
//  159 *              a new, high-priority task, is ready to run.
//  160 *
//  161 * Arguments  : none
//  162 *
//  163 * Returns    : none
//  164 *
//  165 * Notes      : 1) You MUST invoke OSIntEnter() and OSIntExit() in pair.  In other words, for every call
//  166 *                 to OSIntEnter() at the beginning of the ISR you MUST have a call to OSIntExit() at the
//  167 *                 end of the ISR.
//  168 *              2) Rescheduling is prevented when the scheduler is locked (see OS_SchedLock())
//  169 *********************************************************************************************************
//  170 */
//  171 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  172 void  OSIntExit (void)
//  173 {
OSIntExit:
        PUSH      S:?b8
//  174 #if OS_CRITICAL_METHOD == 3                                /* Allocate storage for CPU status register */
//  175     OS_CPU_SR  cpu_sr;
//  176 #endif
//  177     
//  178     
//  179     if (OSRunning == TRUE) {
        LD        A, L:OSRunning
        CP        A, #0x1
        JRNE      L:??OSIntExit_0
//  180         OS_ENTER_CRITICAL();
        CALL      L:CriticalEnter
        LD        S:?b8, A
//  181         if (OSIntNesting > 0) {                            /* Prevent OSIntNesting from wrapping       */
        LD        A, L:OSIntNesting
        CP        A, #0x0
        JREQ      L:??OSIntExit_1
//  182             OSIntNesting--;
        LD        A, L:OSIntNesting
        ADD       A, #0xff
        LD        L:OSIntNesting, A
//  183         }
//  184         if ((OSIntNesting == 0) && (OSLockNesting == 0)) { /* Reschedule only if all ISRs complete ... */
??OSIntExit_1:
        LD        A, L:OSIntNesting
        CP        A, #0x0
        JRNE      L:??OSIntExit_2
        LD        A, L:OSLockNesting
        CP        A, #0x0
        JRNE      L:??OSIntExit_2
//  185             OSIntExitY    = OSUnMapTbl[OSRdyGrp];          /* ... and not locked.                      */
        LD        A, L:OSRdyGrp
        CLRW      X
        LD        XL, A
        LD        A, (L:OSUnMapTbl,X)
        LD        L:OSIntExitY, A
//  186             OSPrioHighRdy = (INT8U)((OSIntExitY << 3) + OSUnMapTbl[OSRdyTbl[OSIntExitY]]);
        LD        A, L:OSIntExitY
        CLRW      X
        LD        XL, A
        LD        A, (L:OSRdyTbl,X)
        CLRW      X
        LD        XL, A
        LD        A, L:OSIntExitY
        SLL       A
        SLL       A
        SLL       A
        ADD       A, (L:OSUnMapTbl,X)
        LD        L:OSPrioHighRdy, A
//  187             if (OSPrioHighRdy != OSPrioCur) {              /* No Ctx Sw if current task is highest rdy */
        LD        A, L:OSPrioCur
        CP        A, L:OSPrioHighRdy
        JREQ      L:??OSIntExit_2
//  188                 OSTCBHighRdy  = OSTCBPrioTbl[OSPrioHighRdy];
        LD        A, L:OSPrioHighRdy
        CLRW      X
        LD        XL, A
        SLLW      X
        LDW       X, (L:OSTCBPrioTbl,X)
        LDW       L:OSTCBHighRdy, X
//  189                 OSCtxSwCtr++;                              /* Keep track of the number of ctx switches */
        LDW       X, #OSCtxSwCtr
        CALL      L:?load32_l0_0x
        CALL      L:?inc32_l0_l0
        LDW       X, #OSCtxSwCtr
        CALL      L:?load32_0x_l0
//  190                 OSIntCtxSw();                              /* Perform interrupt level ctx switch       */
        CALL      L:__near_OSIntCtxSw
//  191             }
//  192         }
//  193         OS_EXIT_CRITICAL();
??OSIntExit_2:
        LD        A, S:?b8
        CALL      L:CriticalExit
//  194     }
//  195 }
??OSIntExit_0:
        POP       S:?b8
        RET
//  196 /*$PAGE*/
//  197 /*
//  198 *********************************************************************************************************
//  199 *                                          PREVENT SCHEDULING
//  200 *
//  201 * Description: This function is used to prevent rescheduling to take place.  This allows your application
//  202 *              to prevent context switches until you are ready to permit context switching.
//  203 *
//  204 * Arguments  : none
//  205 *
//  206 * Returns    : none
//  207 *
//  208 * Notes      : 1) You MUST invoke OSSchedLock() and OSSchedUnlock() in pair.  In other words, for every
//  209 *                 call to OSSchedLock() you MUST have a call to OSSchedUnlock().
//  210 *********************************************************************************************************
//  211 */
//  212 
//  213 #if OS_SCHED_LOCK_EN > 0

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  214 void  OSSchedLock (void)
//  215 {
OSSchedLock:
        PUSH      S:?b8
//  216 #if OS_CRITICAL_METHOD == 3                      /* Allocate storage for CPU status register           */
//  217     OS_CPU_SR  cpu_sr;
//  218 #endif    
//  219     
//  220     
//  221     if (OSRunning == TRUE) {                     /* Make sure multitasking is running                  */
        LD        A, L:OSRunning
        CP        A, #0x1
        JRNE      L:??OSSchedLock_0
//  222         OS_ENTER_CRITICAL();
        CALL      L:CriticalEnter
        LD        S:?b8, A
//  223         if (OSLockNesting < 255) {               /* Prevent OSLockNesting from wrapping back to 0      */
        LD        A, L:OSLockNesting
        CP        A, #0xff
        JREQ      L:??OSSchedLock_1
//  224             OSLockNesting++;                     /* Increment lock nesting level                       */
        LD        A, L:OSLockNesting
        ADD       A, #0x1
        LD        L:OSLockNesting, A
//  225         }
//  226         OS_EXIT_CRITICAL();
??OSSchedLock_1:
        LD        A, S:?b8
        CALL      L:CriticalExit
//  227     }
//  228 }
??OSSchedLock_0:
        POP       S:?b8
        RET
//  229 #endif    
//  230 
//  231 /*$PAGE*/
//  232 /*
//  233 *********************************************************************************************************
//  234 *                                          ENABLE SCHEDULING
//  235 *
//  236 * Description: This function is used to re-allow rescheduling.
//  237 *
//  238 * Arguments  : none
//  239 *
//  240 * Returns    : none
//  241 *
//  242 * Notes      : 1) You MUST invoke OSSchedLock() and OSSchedUnlock() in pair.  In other words, for every
//  243 *                 call to OSSchedLock() you MUST have a call to OSSchedUnlock().
//  244 *********************************************************************************************************
//  245 */
//  246 
//  247 #if OS_SCHED_LOCK_EN > 0

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  248 void  OSSchedUnlock (void)
//  249 {
OSSchedUnlock:
        PUSH      S:?b8
//  250 #if OS_CRITICAL_METHOD == 3                                /* Allocate storage for CPU status register */
//  251     OS_CPU_SR  cpu_sr;
//  252 #endif    
//  253     
//  254     
//  255     if (OSRunning == TRUE) {                                   /* Make sure multitasking is running    */
        LD        A, L:OSRunning
        CP        A, #0x1
        JRNE      L:??OSSchedUnlock_0
//  256         OS_ENTER_CRITICAL();
        CALL      L:CriticalEnter
        LD        S:?b8, A
//  257         if (OSLockNesting > 0) {                               /* Do not decrement if already 0        */
        LD        A, L:OSLockNesting
        CP        A, #0x0
        JREQ      L:??OSSchedUnlock_1
//  258             OSLockNesting--;                                   /* Decrement lock nesting level         */
        LD        A, L:OSLockNesting
        ADD       A, #0xff
        LD        L:OSLockNesting, A
//  259             if ((OSLockNesting == 0) && (OSIntNesting == 0)) { /* See if sched. enabled and not an ISR */
        LD        A, L:OSLockNesting
        CP        A, #0x0
        JRNE      L:??OSSchedUnlock_2
        LD        A, L:OSIntNesting
        CP        A, #0x0
        JRNE      L:??OSSchedUnlock_2
//  260                 OS_EXIT_CRITICAL();
        LD        A, S:?b8
        CALL      L:CriticalExit
//  261                 OS_Sched();                                    /* See if a HPT is ready                */
        CALL      L:OS_Sched
        JRA       L:??OSSchedUnlock_0
//  262             } else {
//  263                 OS_EXIT_CRITICAL();
??OSSchedUnlock_2:
        LD        A, S:?b8
        CALL      L:CriticalExit
        JRA       L:??OSSchedUnlock_0
//  264             }
//  265         } else {
//  266             OS_EXIT_CRITICAL();
??OSSchedUnlock_1:
        LD        A, S:?b8
        CALL      L:CriticalExit
//  267         }
//  268     }
//  269 }
??OSSchedUnlock_0:
        POP       S:?b8
        RET
//  270 #endif    
//  271 
//  272 /*$PAGE*/
//  273 /*
//  274 *********************************************************************************************************
//  275 *                                          START MULTITASKING
//  276 *
//  277 * Description: This function is used to start the multitasking process which lets uC/OS-II manages the
//  278 *              task that you have created.  Before you can call OSStart(), you MUST have called OSInit()
//  279 *              and you MUST have created at least one task.
//  280 *
//  281 * Arguments  : none
//  282 *
//  283 * Returns    : none
//  284 *
//  285 * Note       : OSStartHighRdy() MUST:
//  286 *                 a) Call OSTaskSwHook() then,
//  287 *                 b) Set OSRunning to TRUE.
//  288 *                 c) Load the context of the task pointed to by OSTCBHighRdy.
//  289 *                 d_ Execute the task.
//  290 *********************************************************************************************************
//  291 */
//  292 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  293 void  OSStart (void)
//  294 {
OSStart:
        CALL      L:?push_w4
//  295     INT8U y;
//  296     INT8U x;
//  297 
//  298 
//  299     if (OSRunning == FALSE) {
        LD        A, L:OSRunning
        CP        A, #0x0
        JRNE      L:??OSStart_0
//  300         y             = OSUnMapTbl[OSRdyGrp];        /* Find highest priority's task priority number   */
        LD        A, L:OSRdyGrp
        CLRW      X
        LD        XL, A
        LD        A, (L:OSUnMapTbl,X)
        LD        S:?b8, A
//  301         x             = OSUnMapTbl[OSRdyTbl[y]];
        CLRW      X
        EXG       A, XL
        LD        A, S:?b8
        EXG       A, XL
        LD        A, (L:OSRdyTbl,X)
        CLRW      X
        LD        XL, A
        LD        A, (L:OSUnMapTbl,X)
        LD        S:?b9, A
//  302         OSPrioHighRdy = (INT8U)((y << 3) + x);
        LD        A, S:?b8
        SLL       A
        SLL       A
        SLL       A
        ADD       A, S:?b9
        LD        L:OSPrioHighRdy, A
//  303         OSPrioCur     = OSPrioHighRdy;
        LD        A, L:OSPrioHighRdy
        LD        L:OSPrioCur, A
//  304         OSTCBHighRdy  = OSTCBPrioTbl[OSPrioHighRdy]; /* Point to highest priority task ready to run    */
        LD        A, L:OSPrioHighRdy
        CLRW      X
        LD        XL, A
        SLLW      X
        LDW       X, (L:OSTCBPrioTbl,X)
        LDW       L:OSTCBHighRdy, X
//  305         OSTCBCur      = OSTCBHighRdy;
        LDW       X, L:OSTCBHighRdy
        LDW       L:OSTCBCur, X
//  306         OSStartHighRdy();                            /* Execute target specific code to start task     */
        CALL      L:__near_OSStartHighRdy
//  307     }
//  308 }
??OSStart_0:
        JP        L:?epilogue_w4
//  309 /*$PAGE*/
//  310 /*
//  311 *********************************************************************************************************
//  312 *                                        STATISTICS INITIALIZATION
//  313 *
//  314 * Description: This function is called by your application to establish CPU usage by first determining
//  315 *              how high a 32-bit counter would count to in 1 second if no other tasks were to execute
//  316 *              during that time.  CPU usage is then determined by a low priority task which keeps track
//  317 *              of this 32-bit counter every second but this time, with other tasks running.  CPU usage is
//  318 *              determined by:
//  319 *
//  320 *                                             OSIdleCtr
//  321 *                 CPU Usage (%) = 100 * (1 - ------------)
//  322 *                                            OSIdleCtrMax
//  323 *
//  324 * Arguments  : none
//  325 *
//  326 * Returns    : none
//  327 *********************************************************************************************************
//  328 */
//  329 
//  330 #if OS_TASK_STAT_EN > 0
//  331 void  OSStatInit (void)
//  332 {
//  333 #if OS_CRITICAL_METHOD == 3                      /* Allocate storage for CPU status register           */
//  334     OS_CPU_SR  cpu_sr;
//  335 #endif    
//  336     
//  337     
//  338     OSTimeDly(2);                                /* Synchronize with clock tick                        */
//  339     OS_ENTER_CRITICAL();
//  340     OSIdleCtr    = 0L;                           /* Clear idle counter                                 */
//  341     OS_EXIT_CRITICAL();
//  342     OSTimeDly(OS_TICKS_PER_SEC);                 /* Determine MAX. idle counter value for 1 second     */
//  343     OS_ENTER_CRITICAL();
//  344     OSIdleCtrMax = OSIdleCtr;                    /* Store maximum idle counter count in 1 second       */
//  345     OSStatRdy    = TRUE;
//  346     OS_EXIT_CRITICAL();
//  347 }
//  348 #endif
//  349 /*$PAGE*/
//  350 /*
//  351 *********************************************************************************************************
//  352 *                                         PROCESS SYSTEM TICK
//  353 *
//  354 * Description: This function is used to signal to uC/OS-II the occurrence of a 'system tick' (also known
//  355 *              as a 'clock tick').  This function should be called by the ticker ISR but, can also be
//  356 *              called by a high priority task.
//  357 *
//  358 * Arguments  : none
//  359 *
//  360 * Returns    : none
//  361 *********************************************************************************************************
//  362 */
//  363 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  364 void  OSTimeTick (void)
//  365 {
OSTimeTick:
        CALL      L:?push_w4
        PUSH      S:?b10
//  366 #if OS_CRITICAL_METHOD == 3                                /* Allocate storage for CPU status register */
//  367     OS_CPU_SR  cpu_sr;
//  368 #endif    
//  369     OS_TCB    *ptcb;
//  370 
//  371 
//  372     OSTimeTickHook();                                      /* Call user definable hook                 */
        CALL      L:OSTimeTickHook
//  373 #if OS_TIME_GET_SET_EN > 0   
//  374     OS_ENTER_CRITICAL();                                   /* Update the 32-bit tick counter           */
        CALL      L:CriticalEnter
        LD        S:?b10, A
//  375     OSTime++;
        LDW       X, #OSTime
        CALL      L:?load32_l0_0x
        CALL      L:?inc32_l0_l0
        LDW       X, #OSTime
        CALL      L:?load32_0x_l0
//  376     OS_EXIT_CRITICAL();
        LD        A, S:?b10
        CALL      L:CriticalExit
//  377 #endif
//  378     if (OSRunning == TRUE) {    
        LD        A, L:OSRunning
        CP        A, #0x1
        JREQ      ??lb_1
        JP        L:??OSTimeTick_0
//  379         ptcb = OSTCBList;                                  /* Point at first TCB in TCB list           */
??lb_1:
        LDW       X, L:OSTCBList
        LDW       S:?w4, X
//  380         while (ptcb->OSTCBPrio != OS_IDLE_PRIO) {          /* Go through all TCBs in TCB list          */
??OSTimeTick_1:
        LDW       X, S:?w4
        ADDW      X, #0x19
        LD        A, (X)
        CP        A, #0x3f
        JREQ      L:??OSTimeTick_0
//  381             OS_ENTER_CRITICAL();
        CALL      L:CriticalEnter
        LD        S:?b10, A
//  382             if (ptcb->OSTCBDly != 0) {                     /* Delayed or waiting for event with TO     */
        LDW       X, S:?w4
        ADDW      X, #0x16
        LDW       X, (X)
        TNZW      X
        JREQ      L:??OSTimeTick_2
//  383                 if (--ptcb->OSTCBDly == 0) {               /* Decrement nbr of ticks to end of delay   */
        LDW       X, S:?w4
        ADDW      X, #0x16
        LDW       X, (X)
        DECW      X
        LDW       Y, X
        LDW       X, S:?w4
        ADDW      X, #0x16
        LDW       (X), Y
        TNZW      Y
        JRNE      L:??OSTimeTick_2
//  384                     if ((ptcb->OSTCBStat & OS_STAT_SUSPEND) == OS_STAT_RDY) { /* Is task suspended?    */
        LDW       X, S:?w4
        ADDW      X, #0x18
        LD        A, (X)
        AND       A, #0x8
        CP        A, #0x0
        JRNE      L:??OSTimeTick_3
//  385                         OSRdyGrp               |= ptcb->OSTCBBitY; /* No,  Make task R-to-R (timed out)*/
        LDW       X, S:?w4
        ADDW      X, #0x1d
        LD        A, (X)
        OR        A, L:OSRdyGrp
        LD        L:OSRdyGrp, A
//  386                         OSRdyTbl[ptcb->OSTCBY] |= ptcb->OSTCBBitX;
        LDW       X, S:?w4
        ADDW      X, #0x1b
        LD        A, (X)
        CLRW      X
        LD        XL, A
        LD        A, (L:OSRdyTbl,X)
        LDW       X, S:?w4
        ADDW      X, #0x1c
        OR        A, (X)
        LD        S:?b0, A
        LDW       X, S:?w4
        ADDW      X, #0x1b
        LD        A, (X)
        CLRW      X
        LD        XL, A
        LD        A, S:?b0
        LD        (L:OSRdyTbl,X), A
        JRA       L:??OSTimeTick_2
//  387                     } else {                               /* Yes, Leave 1 tick to prevent ...         */
//  388                         ptcb->OSTCBDly = 1;                /* ... loosing the task when the ...        */
??OSTimeTick_3:
        LDW       X, S:?w4
        ADDW      X, #0x16
        LDW       Y, X
        CLRW      X
        INCW      X
        LDW       (Y), X
//  389                     }                                      /* ... suspension is removed.               */
//  390                 }
//  391             }
//  392             ptcb = ptcb->OSTCBNext;                        /* Point at next TCB in TCB list            */
??OSTimeTick_2:
        LDW       X, S:?w4
        ADDW      X, #0xe
        LDW       X, (X)
        LDW       S:?w4, X
//  393             OS_EXIT_CRITICAL();
        LD        A, S:?b10
        CALL      L:CriticalExit
        JRA       L:??OSTimeTick_1
//  394         }
//  395     }
//  396 }
??OSTimeTick_0:
        POP       S:?b10
        JP        L:?epilogue_w4
//  397 /*$PAGE*/
//  398 /*
//  399 *********************************************************************************************************
//  400 *                                             GET VERSION
//  401 *
//  402 * Description: This function is used to return the version number of uC/OS-II.  The returned value
//  403 *              corresponds to uC/OS-II's version number multiplied by 100.  In other words, version 2.00
//  404 *              would be returned as 200.
//  405 *
//  406 * Arguments  : none
//  407 *
//  408 * Returns    : the version number of uC/OS-II multiplied by 100.
//  409 *********************************************************************************************************
//  410 */
//  411 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  412 INT16U  OSVersion (void)
//  413 {
//  414     return (OS_VERSION);
OSVersion:
        LDW       X, #0xfc
        RET
//  415 }
//  416 
//  417 /*$PAGE*/
//  418 /*
//  419 *********************************************************************************************************
//  420 *                                            DUMMY FUNCTION
//  421 *
//  422 * Description: This function doesn't do anything.  It is called by OSTaskDel().
//  423 *
//  424 * Arguments  : none
//  425 *
//  426 * Returns    : none
//  427 *********************************************************************************************************
//  428 */
//  429 
//  430 #if OS_TASK_DEL_EN > 0

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  431 void  OS_Dummy (void)
//  432 {
//  433 }
OS_Dummy:
        RET
//  434 #endif
//  435 
//  436 /*$PAGE*/
//  437 /*
//  438 *********************************************************************************************************
//  439 *                             MAKE TASK READY TO RUN BASED ON EVENT OCCURING
//  440 *
//  441 * Description: This function is called by other uC/OS-II services and is used to ready a task that was
//  442 *              waiting for an event to occur.
//  443 *
//  444 * Arguments  : pevent    is a pointer to the event control block corresponding to the event.
//  445 *
//  446 *              msg       is a pointer to a message.  This pointer is used by message oriented services
//  447 *                        such as MAILBOXEs and QUEUEs.  The pointer is not used when called by other
//  448 *                        service functions.
//  449 *
//  450 *              msk       is a mask that is used to clear the status byte of the TCB.  For example,
//  451 *                        OSSemPost() will pass OS_STAT_SEM, OSMboxPost() will pass OS_STAT_MBOX etc.
//  452 *
//  453 * Returns    : none
//  454 *
//  455 * Note       : This function is INTERNAL to uC/OS-II and your application should not call it.
//  456 *********************************************************************************************************
//  457 */
//  458 #if OS_EVENT_EN > 0

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  459 INT8U  OS_EventTaskRdy (OS_EVENT *pevent, void *msg, INT8U msk)
//  460 {
OS_EventTaskRdy:
        CALL      L:?push_l2
        LDW       S:?w0, X
        LDW       S:?w1, Y
        LD        S:?b6, A
//  461     OS_TCB *ptcb;
//  462     INT8U   x;
//  463     INT8U   y;
//  464     INT8U   bitx;
//  465     INT8U   bity;
//  466     INT8U   prio;
//  467 
//  468 
//  469     y    = OSUnMapTbl[pevent->OSEventGrp];            /* Find highest prio. task waiting for message   */
        LDW       X, S:?w0
        INCW      X
        LD        A, (X)
        CLRW      X
        LD        XL, A
        LD        A, (L:OSUnMapTbl,X)
        LD        S:?b8, A
//  470     bity = OSMapTbl[y];
        CLRW      X
        EXG       A, XL
        LD        A, S:?b8
        EXG       A, XL
        LD        A, (L:OSMapTbl,X)
        LD        S:?b9, A
//  471     x    = OSUnMapTbl[pevent->OSEventTbl[y]];
        CLRW      X
        EXG       A, XL
        LD        A, S:?b8
        EXG       A, XL
        ADDW      X, S:?w0
        ADDW      X, #0x6
        LD        A, (X)
        CLRW      X
        LD        XL, A
        LD        A, (L:OSUnMapTbl,X)
        LD        S:?b7, A
//  472     bitx = OSMapTbl[x];
        CLRW      X
        EXG       A, XL
        LD        A, S:?b7
        EXG       A, XL
        LD        A, (L:OSMapTbl,X)
        LD        S:?b11, A
//  473     prio = (INT8U)((y << 3) + x);                     /* Find priority of task getting the msg         */
        LD        A, S:?b8
        SLL       A
        SLL       A
        SLL       A
        ADD       A, S:?b7
        LD        S:?b10, A
//  474     if ((pevent->OSEventTbl[y] &= ~bitx) == 0x00) {   /* Remove this task from the waiting list        */
        CLRW      X
        EXG       A, XL
        LD        A, S:?b8
        EXG       A, XL
        ADDW      X, S:?w0
        ADDW      X, #0x6
        LD        A, S:?b11
        CPL       A
        AND       A, (X)
        CLRW      X
        EXG       A, XL
        LD        A, S:?b8
        EXG       A, XL
        ADDW      X, S:?w0
        ADDW      X, #0x6
        LD        (X), A
        TNZ       A
        JRNE      L:??OS_EventTaskRdy_0
//  475         pevent->OSEventGrp &= ~bity;                  /* Clr group bit if this was only task pending   */
        LDW       X, S:?w0
        INCW      X
        LD        A, S:?b9
        CPL       A
        AND       A, (X)
        LDW       X, S:?w0
        INCW      X
        LD        (X), A
//  476     }
//  477     ptcb                 =  OSTCBPrioTbl[prio];       /* Point to this task's OS_TCB                   */
??OS_EventTaskRdy_0:
        CLRW      X
        EXG       A, XL
        LD        A, S:?b10
        EXG       A, XL
        SLLW      X
        LDW       X, (L:OSTCBPrioTbl,X)
        LDW       Y, X
//  478     ptcb->OSTCBDly       =  0;                        /* Prevent OSTimeTick() from readying task       */
        LDW       X, Y
        ADDW      X, #0x16
        LDW       S:?w2, X
        CLRW      X
        LDW       [S:?w2.w], X
//  479     ptcb->OSTCBEventPtr  = (OS_EVENT *)0;             /* Unlink ECB from this task                     */
        LDW       X, Y
        ADDW      X, #0x12
        LDW       S:?w2, X
        CLRW      X
        LDW       [S:?w2.w], X
//  480 #if ((OS_Q_EN > 0) && (OS_MAX_QS > 0)) || (OS_MBOX_EN > 0)
//  481     ptcb->OSTCBMsg       = msg;                       /* Send message directly to waiting task         */
        LDW       X, Y
        ADDW      X, #0x14
        LDW       S:?w2, X
        LDW       X, S:?w1
        LDW       [S:?w2.w], X
//  482 #else
//  483     msg                  = msg;                       /* Prevent compiler warning if not used          */
//  484 #endif
//  485     ptcb->OSTCBStat     &= ~msk;                      /* Clear bit associated with event type          */
        LDW       X, Y
        ADDW      X, #0x18
        LD        A, S:?b6
        CPL       A
        AND       A, (X)
        LDW       X, Y
        ADDW      X, #0x18
        LD        (X), A
//  486     if (ptcb->OSTCBStat == OS_STAT_RDY) {             /* See if task is ready (could be susp'd)        */
        LDW       X, Y
        ADDW      X, #0x18
        TNZ       (X)
        JRNE      L:??OS_EventTaskRdy_1
//  487         OSRdyGrp        |=  bity;                     /* Put task in the ready to run list             */
        LD        A, S:?b9
        OR        A, L:OSRdyGrp
        LD        L:OSRdyGrp, A
//  488         OSRdyTbl[y]     |=  bitx;
        CLRW      X
        EXG       A, XL
        LD        A, S:?b8
        EXG       A, XL
        LD        A, (L:OSRdyTbl,X)
        OR        A, S:?b11
        CLRW      X
        EXG       A, XL
        LD        A, S:?b8
        EXG       A, XL
        LD        (L:OSRdyTbl,X), A
//  489     }
//  490     return (prio);
??OS_EventTaskRdy_1:
        LD        A, S:?b10
        JP        L:?epilogue_l2
//  491 }
//  492 #endif
//  493 /*$PAGE*/
//  494 /*
//  495 *********************************************************************************************************
//  496 *                                   MAKE TASK WAIT FOR EVENT TO OCCUR
//  497 *
//  498 * Description: This function is called by other uC/OS-II services to suspend a task because an event has
//  499 *              not occurred.
//  500 *
//  501 * Arguments  : pevent   is a pointer to the event control block for which the task will be waiting for.
//  502 *
//  503 * Returns    : none
//  504 *
//  505 * Note       : This function is INTERNAL to uC/OS-II and your application should not call it.
//  506 *********************************************************************************************************
//  507 */
//  508 #if OS_EVENT_EN > 0

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  509 void  OS_EventTaskWait (OS_EVENT *pevent)
//  510 {
OS_EventTaskWait:
        LDW       S:?w1, X
//  511     OSTCBCur->OSTCBEventPtr = pevent;            /* Store pointer to event control block in TCB        */
        LDW       X, L:OSTCBCur
        ADDW      X, #0x12
        LDW       Y, S:?w1
        LDW       (X), Y
//  512     if ((OSRdyTbl[OSTCBCur->OSTCBY] &= ~OSTCBCur->OSTCBBitX) == 0x00) {   /* Task no longer ready      */
        LDW       X, L:OSTCBCur
        ADDW      X, #0x1b
        LD        A, (X)
        CLRW      X
        LD        XL, A
        LDW       Y, X
        LDW       X, L:OSTCBCur
        ADDW      X, #0x1c
        LD        A, (X)
        CPL       A
        LDW       X, Y
        AND       A, (L:OSRdyTbl,X)
        LD        S:?b0, A
        LDW       X, L:OSTCBCur
        ADDW      X, #0x1b
        LD        A, (X)
        CLRW      X
        LD        XL, A
        LD        A, S:?b0
        LD        (L:OSRdyTbl,X), A
        TNZ       S:?b0
        JRNE      L:??OS_EventTaskWait_0
//  513         OSRdyGrp &= ~OSTCBCur->OSTCBBitY;        /* Clear event grp bit if this was only task pending  */
        LDW       X, L:OSTCBCur
        ADDW      X, #0x1d
        LD        A, (X)
        CPL       A
        AND       A, L:OSRdyGrp
        LD        L:OSRdyGrp, A
//  514     }
//  515     pevent->OSEventTbl[OSTCBCur->OSTCBY] |= OSTCBCur->OSTCBBitX;          /* Put task in waiting list  */
??OS_EventTaskWait_0:
        LDW       X, L:OSTCBCur
        ADDW      X, #0x1b
        LD        A, (X)
        CLRW      X
        LD        XL, A
        ADDW      X, S:?w1
        ADDW      X, #0x6
        LDW       Y, X
        LDW       X, L:OSTCBCur
        ADDW      X, #0x1c
        LD        A, (X)
        OR        A, (Y)
        LD        S:?b0, A
        LDW       X, L:OSTCBCur
        ADDW      X, #0x1b
        LD        A, (X)
        CLRW      X
        LD        XL, A
        ADDW      X, S:?w1
        ADDW      X, #0x6
        LD        A, S:?b0
        LD        (X), A
//  516     pevent->OSEventGrp                   |= OSTCBCur->OSTCBBitY;
        LDW       X, L:OSTCBCur
        ADDW      X, #0x1d
        LD        A, (X)
        LDW       X, S:?w1
        INCW      X
        OR        A, (X)
        LDW       X, S:?w1
        INCW      X
        LD        (X), A
//  517 }
        RET
//  518 #endif
//  519 /*$PAGE*/
//  520 /*
//  521 *********************************************************************************************************
//  522 *                              MAKE TASK READY TO RUN BASED ON EVENT TIMEOUT
//  523 *
//  524 * Description: This function is called by other uC/OS-II services to make a task ready to run because a
//  525 *              timeout occurred.
//  526 *
//  527 * Arguments  : pevent   is a pointer to the event control block which is readying a task.
//  528 *
//  529 * Returns    : none
//  530 *
//  531 * Note       : This function is INTERNAL to uC/OS-II and your application should not call it.
//  532 *********************************************************************************************************
//  533 */
//  534 #if OS_EVENT_EN > 0

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  535 void  OS_EventTO (OS_EVENT *pevent)
//  536 {
OS_EventTO:
        LDW       S:?w1, X
//  537     if ((pevent->OSEventTbl[OSTCBCur->OSTCBY] &= ~OSTCBCur->OSTCBBitX) == 0x00) {
        LDW       X, L:OSTCBCur
        ADDW      X, #0x1b
        LD        A, (X)
        CLRW      X
        LD        XL, A
        ADDW      X, S:?w1
        ADDW      X, #0x6
        LDW       Y, X
        LDW       X, L:OSTCBCur
        ADDW      X, #0x1c
        LD        A, (X)
        CPL       A
        AND       A, (Y)
        LD        S:?b0, A
        LDW       X, L:OSTCBCur
        ADDW      X, #0x1b
        LD        A, (X)
        CLRW      X
        LD        XL, A
        ADDW      X, S:?w1
        ADDW      X, #0x6
        LD        A, S:?b0
        LD        (X), A
        TNZ       S:?b0
        JRNE      L:??OS_EventTO_0
//  538         pevent->OSEventGrp &= ~OSTCBCur->OSTCBBitY;
        LDW       X, L:OSTCBCur
        ADDW      X, #0x1d
        LD        A, (X)
        CPL       A
        LDW       X, S:?w1
        INCW      X
        AND       A, (X)
        LDW       X, S:?w1
        INCW      X
        LD        (X), A
//  539     }
//  540     OSTCBCur->OSTCBStat     = OS_STAT_RDY;       /* Set status to ready                                */
??OS_EventTO_0:
        LDW       X, L:OSTCBCur
        ADDW      X, #0x18
        CLR       A
        LD        (X), A
//  541     OSTCBCur->OSTCBEventPtr = (OS_EVENT *)0;     /* No longer waiting for event                        */
        LDW       X, L:OSTCBCur
        ADDW      X, #0x12
        CLRW      Y
        LDW       (X), Y
//  542 }
        RET
//  543 #endif
//  544 /*$PAGE*/
//  545 /*
//  546 *********************************************************************************************************
//  547 *                                 INITIALIZE EVENT CONTROL BLOCK'S WAIT LIST
//  548 *
//  549 * Description: This function is called by other uC/OS-II services to initialize the event wait list.
//  550 *
//  551 * Arguments  : pevent    is a pointer to the event control block allocated to the event.
//  552 *
//  553 * Returns    : none
//  554 *
//  555 * Note       : This function is INTERNAL to uC/OS-II and your application should not call it.
//  556 *********************************************************************************************************
//  557 */
//  558 #if ((OS_Q_EN > 0) && (OS_MAX_QS > 0)) || (OS_MBOX_EN > 0) || (OS_SEM_EN > 0) || (OS_MUTEX_EN > 0)

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  559 void  OS_EventWaitListInit (OS_EVENT *pevent)
//  560 {
OS_EventWaitListInit:
        LDW       S:?w0, X
//  561     INT8U  *ptbl;
//  562 
//  563 
//  564     pevent->OSEventGrp = 0x00;                   /* No task waiting on event                           */
        LDW       Y, S:?w0
        INCW      Y
        CLR       A
        LD        (Y), A
//  565     ptbl               = &pevent->OSEventTbl[0];
        LDW       Y, S:?w0
        ADDW      Y, #0x6
        LDW       X, Y
//  566 
//  567 #if OS_EVENT_TBL_SIZE > 0
//  568     *ptbl++            = 0x00;
        CLR       A
        LD        (X), A
        INCW      X
//  569 #endif
//  570 
//  571 #if OS_EVENT_TBL_SIZE > 1
//  572     *ptbl++            = 0x00;
        CLR       A
        LD        (X), A
        INCW      X
//  573 #endif
//  574 
//  575 #if OS_EVENT_TBL_SIZE > 2
//  576     *ptbl++            = 0x00;
        CLR       A
        LD        (X), A
        INCW      X
//  577 #endif
//  578 
//  579 #if OS_EVENT_TBL_SIZE > 3
//  580     *ptbl++            = 0x00;
        CLR       A
        LD        (X), A
        INCW      X
//  581 #endif
//  582 
//  583 #if OS_EVENT_TBL_SIZE > 4
//  584     *ptbl++            = 0x00;
        CLR       A
        LD        (X), A
        INCW      X
//  585 #endif
//  586 
//  587 #if OS_EVENT_TBL_SIZE > 5
//  588     *ptbl++            = 0x00;
        CLR       A
        LD        (X), A
        INCW      X
//  589 #endif
//  590 
//  591 #if OS_EVENT_TBL_SIZE > 6
//  592     *ptbl++            = 0x00;
        CLR       A
        LD        (X), A
        INCW      X
//  593 #endif
//  594 
//  595 #if OS_EVENT_TBL_SIZE > 7
//  596     *ptbl              = 0x00;
        CLR       A
        LD        (X), A
//  597 #endif
//  598 }
        RET
//  599 #endif
//  600 /*$PAGE*/
//  601 /*
//  602 *********************************************************************************************************
//  603 *                                             INITIALIZATION
//  604 *                           INITIALIZE THE FREE LIST OF EVENT CONTROL BLOCKS
//  605 *
//  606 * Description: This function is called by OSInit() to initialize the free list of event control blocks.
//  607 *
//  608 * Arguments  : none
//  609 *
//  610 * Returns    : none
//  611 *********************************************************************************************************
//  612 */
//  613 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  614 static  void  OS_InitEventList (void)
//  615 {
//  616 #if (OS_EVENT_EN > 0) && (OS_MAX_EVENTS > 0)
//  617 #if (OS_MAX_EVENTS > 1)
//  618     INT16U     i;
//  619     OS_EVENT  *pevent1;
//  620     OS_EVENT  *pevent2;
//  621 
//  622 
//  623     pevent1 = &OSEventTbl[0];
OS_InitEventList:
        LDW       Y, #OSEventTbl
        LDW       S:?w0, Y
//  624     pevent2 = &OSEventTbl[1];
        LDW       Y, #OSEventTbl + 14
        LDW       X, Y
//  625     for (i = 0; i < (OS_MAX_EVENTS - 1); i++) {                  /* Init. list of free EVENT control blocks  */
        CLRW      Y
        LDW       S:?w1, Y
??OS_InitEventList_0:
        LDW       Y, S:?w1
        CPW       Y, #0x7
        JRNC      L:??OS_InitEventList_1
//  626         pevent1->OSEventType = OS_EVENT_TYPE_UNUSED;
        CLR       A
        LD        [S:?w0.w], A
//  627         pevent1->OSEventPtr  = pevent2;
        LDW       Y, S:?w0
        ADDW      Y, #0x4
        LDW       (Y), X
//  628         pevent1++;
        LDW       Y, S:?w0
        ADDW      Y, #0xe
        LDW       S:?w0, Y
//  629         pevent2++;
        ADDW      X, #0xe
//  630     }
        LDW       Y, S:?w1
        INCW      Y
        LDW       S:?w1, Y
        JRA       L:??OS_InitEventList_0
//  631     pevent1->OSEventType = OS_EVENT_TYPE_UNUSED;
??OS_InitEventList_1:
        CLR       A
        LD        [S:?w0.w], A
//  632     pevent1->OSEventPtr  = (OS_EVENT *)0;
        LDW       Y, S:?w0
        ADDW      Y, #0x4
        LDW       S:?w2, Y
        CLRW      Y
        LDW       [S:?w2.w], Y
//  633     OSEventFreeList      = &OSEventTbl[0];
        LDW       Y, #OSEventTbl
        LDW       L:OSEventFreeList, Y
//  634 #else
//  635     OSEventFreeList              = &OSEventTbl[0];               /* Only have ONE event control block        */
//  636     OSEventFreeList->OSEventType = OS_EVENT_TYPE_UNUSED;
//  637     OSEventFreeList->OSEventPtr  = (OS_EVENT *)0;
//  638 #endif
//  639 #endif
//  640 }
        RET
//  641 /*$PAGE*/
//  642 /*
//  643 *********************************************************************************************************
//  644 *                                             INITIALIZATION
//  645 *                                    INITIALIZE MISCELLANEOUS VARIABLES
//  646 *
//  647 * Description: This function is called by OSInit() to initialize miscellaneous variables.
//  648 *
//  649 * Arguments  : none
//  650 *
//  651 * Returns    : none
//  652 *********************************************************************************************************
//  653 */
//  654 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  655 static  void  OS_InitMisc (void)
//  656 {
//  657 #if OS_TIME_GET_SET_EN > 0   
//  658     OSTime        = 0L;                                          /* Clear the 32-bit system clock            */
OS_InitMisc:
        LDW       X, #0x0
        LDW       L:OSTime, X
        LDW       X, #0x0
        LDW       L:OSTime + 2, X
//  659 #endif
//  660 
//  661     OSIntNesting  = 0;                                           /* Clear the interrupt nesting counter      */
        MOV       L:OSIntNesting, #0x0
//  662     OSLockNesting = 0;                                           /* Clear the scheduling lock counter        */
        MOV       L:OSLockNesting, #0x0
//  663 
//  664     OSTaskCtr     = 0;                                           /* Clear the number of tasks                */
        MOV       L:OSTaskCtr, #0x0
//  665 
//  666     OSRunning     = FALSE;                                       /* Indicate that multitasking not started   */
        MOV       L:OSRunning, #0x0
//  667     
//  668     OSCtxSwCtr    = 0;                                           /* Clear the context switch counter         */
        LDW       X, #0x0
        LDW       L:OSCtxSwCtr, X
        LDW       X, #0x0
        LDW       L:OSCtxSwCtr + 2, X
//  669     OSIdleCtr     = 0L;                                          /* Clear the 32-bit idle counter            */
        LDW       X, #0x0
        LDW       L:OSIdleCtr, X
        LDW       X, #0x0
        LDW       L:OSIdleCtr + 2, X
//  670 
//  671 #if (OS_TASK_STAT_EN > 0) && (OS_TASK_CREATE_EXT_EN > 0)
//  672     OSIdleCtrRun  = 0L;
//  673     OSIdleCtrMax  = 0L;
//  674     OSStatRdy     = FALSE;                                       /* Statistic task is not ready              */
//  675 #endif
//  676 }
        RET
//  677 /*$PAGE*/
//  678 /*
//  679 *********************************************************************************************************
//  680 *                                             INITIALIZATION
//  681 *                                       INITIALIZE THE READY LIST
//  682 *
//  683 * Description: This function is called by OSInit() to initialize the Ready List.
//  684 *
//  685 * Arguments  : none
//  686 *
//  687 * Returns    : none
//  688 *********************************************************************************************************
//  689 */
//  690 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  691 static  void  OS_InitRdyList (void)
//  692 {
//  693     INT16U   i;
//  694     INT8U   *prdytbl;
//  695 
//  696 
//  697     OSRdyGrp      = 0x00;                                        /* Clear the ready list                     */
OS_InitRdyList:
        MOV       L:OSRdyGrp, #0x0
//  698     prdytbl       = &OSRdyTbl[0];
        LDW       X, #OSRdyTbl
        LDW       S:?w0, X
//  699     for (i = 0; i < OS_RDY_TBL_SIZE; i++) {
        CLRW      X
        LDW       Y, X
??OS_InitRdyList_0:
        CPW       Y, #0x8
        JRNC      L:??OS_InitRdyList_1
//  700         *prdytbl++ = 0x00;
        CLR       A
        LD        [S:?w0.w], A
        LDW       X, S:?w0
        INCW      X
        LDW       S:?w0, X
//  701     }
        LDW       X, Y
        INCW      X
        LDW       Y, X
        JRA       L:??OS_InitRdyList_0
//  702 
//  703     OSPrioCur     = 0;
??OS_InitRdyList_1:
        MOV       L:OSPrioCur, #0x0
//  704     OSPrioHighRdy = 0;
        MOV       L:OSPrioHighRdy, #0x0
//  705 
//  706     OSTCBHighRdy  = (OS_TCB *)0;                                 
        CLRW      X
        LDW       L:OSTCBHighRdy, X
//  707     OSTCBCur      = (OS_TCB *)0;
        CLRW      X
        LDW       L:OSTCBCur, X
//  708 }
        RET
//  709 
//  710 /*$PAGE*/
//  711 /*
//  712 *********************************************************************************************************
//  713 *                                             INITIALIZATION
//  714 *                                         CREATING THE IDLE TASK
//  715 *
//  716 * Description: This function creates the Idle Task.
//  717 *
//  718 * Arguments  : none
//  719 *
//  720 * Returns    : none
//  721 *********************************************************************************************************
//  722 */
//  723 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  724 static  void  OS_InitTaskIdle (void)
//  725 {
//  726 #if OS_TASK_CREATE_EXT_EN > 0
//  727     #if OS_STK_GROWTH == 1
//  728     (void)OSTaskCreateExt(OS_TaskIdle,
//  729                           (void *)0,                                 /* No arguments passed to OS_TaskIdle() */
//  730                           &OSTaskIdleStk[OS_TASK_IDLE_STK_SIZE - 1], /* Set Top-Of-Stack                     */
//  731                           OS_IDLE_PRIO,                              /* Lowest priority level                */
//  732                           OS_TASK_IDLE_ID,
//  733                           &OSTaskIdleStk[0],                         /* Set Bottom-Of-Stack                  */
//  734                           OS_TASK_IDLE_STK_SIZE,
//  735                           (void *)0,                                 /* No TCB extension                     */
//  736                           OS_TASK_OPT_STK_CHK | OS_TASK_OPT_STK_CLR);/* Enable stack checking + clear stack  */
OS_InitTaskIdle:
        PUSH      #0x3
        PUSH      #0x0
        PUSH      #0x40
        PUSH      #0x0
        PUSH      #0x0
        PUSH      #0x0
        CLR       S:?b7
        CLR       S:?b6
        LDW       X, #OSTaskIdleStk
        LDW       S:?w2, X
        CLRW      X
        DECW      X
        LDW       S:?w1, X
        LD        A, #0x3f
        LDW       X, #OSTaskIdleStk + 63
        LDW       S:?w0, X
        CLRW      Y
        LDW       X, #OS_TaskIdle
        CALL      L:OSTaskCreateExt
        ADD       SP, #0x6
//  737     #else
//  738     (void)OSTaskCreateExt(OS_TaskIdle,
//  739                           (void *)0,                                 /* No arguments passed to OS_TaskIdle() */
//  740                           &OSTaskIdleStk[0],                         /* Set Top-Of-Stack                     */
//  741                           OS_IDLE_PRIO,                              /* Lowest priority level                */
//  742                           OS_TASK_IDLE_ID,
//  743                           &OSTaskIdleStk[OS_TASK_IDLE_STK_SIZE - 1], /* Set Bottom-Of-Stack                  */
//  744                           OS_TASK_IDLE_STK_SIZE,
//  745                           (void *)0,                                 /* No TCB extension                     */
//  746                           OS_TASK_OPT_STK_CHK | OS_TASK_OPT_STK_CLR);/* Enable stack checking + clear stack  */
//  747     #endif
//  748 #else
//  749     #if OS_STK_GROWTH == 1
//  750     (void)OSTaskCreate(OS_TaskIdle,
//  751                        (void *)0,
//  752                        &OSTaskIdleStk[OS_TASK_IDLE_STK_SIZE - 1],
//  753                        OS_IDLE_PRIO);
//  754     #else
//  755     (void)OSTaskCreate(OS_TaskIdle,
//  756                        (void *)0,
//  757                        &OSTaskIdleStk[0],
//  758                        OS_IDLE_PRIO);
//  759     #endif
//  760 #endif
//  761 }
        RET
//  762 /*$PAGE*/
//  763 /*
//  764 *********************************************************************************************************
//  765 *                                             INITIALIZATION
//  766 *                                      CREATING THE STATISTIC TASK
//  767 *
//  768 * Description: This function creates the Statistic Task.
//  769 *
//  770 * Arguments  : none
//  771 *
//  772 * Returns    : none
//  773 *********************************************************************************************************
//  774 */
//  775 
//  776 #if OS_TASK_STAT_EN > 0
//  777 static  void  OS_InitTaskStat (void)
//  778 {
//  779 #if OS_TASK_CREATE_EXT_EN > 0
//  780     #if OS_STK_GROWTH == 1
//  781     (void)OSTaskCreateExt(OS_TaskStat,
//  782                           (void *)0,                                   /* No args passed to OS_TaskStat()*/
//  783                           &OSTaskStatStk[OS_TASK_STAT_STK_SIZE - 1],   /* Set Top-Of-Stack               */
//  784                           OS_STAT_PRIO,                                /* One higher than the idle task  */
//  785                           OS_TASK_STAT_ID,
//  786                           &OSTaskStatStk[0],                           /* Set Bottom-Of-Stack            */
//  787                           OS_TASK_STAT_STK_SIZE,
//  788                           (void *)0,                                   /* No TCB extension               */
//  789                           OS_TASK_OPT_STK_CHK | OS_TASK_OPT_STK_CLR);  /* Enable stack checking + clear  */
//  790     #else
//  791     (void)OSTaskCreateExt(OS_TaskStat,
//  792                           (void *)0,                                   /* No args passed to OS_TaskStat()*/
//  793                           &OSTaskStatStk[0],                           /* Set Top-Of-Stack               */
//  794                           OS_STAT_PRIO,                                /* One higher than the idle task  */
//  795                           OS_TASK_STAT_ID,
//  796                           &OSTaskStatStk[OS_TASK_STAT_STK_SIZE - 1],   /* Set Bottom-Of-Stack            */
//  797                           OS_TASK_STAT_STK_SIZE,
//  798                           (void *)0,                                   /* No TCB extension               */
//  799                           OS_TASK_OPT_STK_CHK | OS_TASK_OPT_STK_CLR);  /* Enable stack checking + clear  */
//  800     #endif
//  801 #else
//  802     #if OS_STK_GROWTH == 1
//  803     (void)OSTaskCreate(OS_TaskStat,
//  804                        (void *)0,                                      /* No args passed to OS_TaskStat()*/
//  805                        &OSTaskStatStk[OS_TASK_STAT_STK_SIZE - 1],      /* Set Top-Of-Stack               */
//  806                        OS_STAT_PRIO);                                  /* One higher than the idle task  */
//  807     #else
//  808     (void)OSTaskCreate(OS_TaskStat,
//  809                        (void *)0,                                      /* No args passed to OS_TaskStat()*/
//  810                        &OSTaskStatStk[0],                              /* Set Top-Of-Stack               */
//  811                        OS_STAT_PRIO);                                  /* One higher than the idle task  */
//  812     #endif
//  813 #endif
//  814 }
//  815 #endif
//  816 /*$PAGE*/
//  817 /*
//  818 *********************************************************************************************************
//  819 *                                             INITIALIZATION
//  820 *                            INITIALIZE THE FREE LIST OF TASK CONTROL BLOCKS
//  821 *
//  822 * Description: This function is called by OSInit() to initialize the free list of OS_TCBs.
//  823 *
//  824 * Arguments  : none
//  825 *
//  826 * Returns    : none
//  827 *********************************************************************************************************
//  828 */
//  829 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  830 static  void  OS_InitTCBList (void)
//  831 {
//  832     INT8U    i;
//  833     OS_TCB  *ptcb1;
//  834     OS_TCB  *ptcb2;
//  835 
//  836 
//  837     OSTCBList     = (OS_TCB *)0;                                 /* TCB Initialization                       */
OS_InitTCBList:
        CLRW      X
        LDW       L:OSTCBList, X
//  838     for (i = 0; i < (OS_LOWEST_PRIO + 1); i++) {                 /* Clear the priority table                 */
        CLR       S:?b4
        LD        A, S:?b4
??OS_InitTCBList_0:
        CP        A, #0x40
        JRNC      L:??OS_InitTCBList_1
//  839         OSTCBPrioTbl[i] = (OS_TCB *)0;
        CLRW      X
        LD        XL, A
        SLLW      X
        CLRW      Y
        LDW       (L:OSTCBPrioTbl,X), Y
//  840     }
        ADD       A, #0x1
        JRA       L:??OS_InitTCBList_0
//  841     ptcb1 = &OSTCBTbl[0];
??OS_InitTCBList_1:
        LDW       X, #OSTCBTbl
        LDW       S:?w1, X
//  842     ptcb2 = &OSTCBTbl[1];
        LDW       X, #OSTCBTbl + 31
        LDW       S:?w0, X
//  843     for (i = 0; i < (OS_MAX_TASKS + OS_N_SYS_TASKS - 1); i++) {  /* Init. list of free TCBs                  */
        CLR       S:?b4
        LD        A, S:?b4
??OS_InitTCBList_2:
        CP        A, #0x5
        JRNC      L:??OS_InitTCBList_3
//  844         ptcb1->OSTCBNext = ptcb2;
        LDW       X, S:?w1
        ADDW      X, #0xe
        LDW       Y, X
        LDW       X, S:?w0
        LDW       (Y), X
//  845         ptcb1++;
        LDW       X, S:?w1
        ADDW      X, #0x1f
        LDW       S:?w1, X
//  846         ptcb2++;
        LDW       X, S:?w0
        ADDW      X, #0x1f
        LDW       S:?w0, X
//  847     }
        ADD       A, #0x1
        JRA       L:??OS_InitTCBList_2
//  848     ptcb1->OSTCBNext = (OS_TCB *)0;                              /* Last OS_TCB                              */
??OS_InitTCBList_3:
        LDW       X, S:?w1
        ADDW      X, #0xe
        LDW       Y, X
        CLRW      X
        LDW       (Y), X
//  849     OSTCBFreeList    = &OSTCBTbl[0];
        LDW       X, #OSTCBTbl
        LDW       L:OSTCBFreeList, X
//  850 }
        RET
//  851 /*$PAGE*/
//  852 /*
//  853 *********************************************************************************************************
//  854 *                                              SCHEDULER
//  855 *
//  856 * Description: This function is called by other uC/OS-II services to determine whether a new, high
//  857 *              priority task has been made ready to run.  This function is invoked by TASK level code
//  858 *              and is not used to reschedule tasks from ISRs (see OSIntExit() for ISR rescheduling).
//  859 *
//  860 * Arguments  : none
//  861 *
//  862 * Returns    : none
//  863 *
//  864 * Notes      : 1) This function is INTERNAL to uC/OS-II and your application should not call it.
//  865 *              2) Rescheduling is prevented when the scheduler is locked (see OS_SchedLock())
//  866 *********************************************************************************************************
//  867 */
//  868 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  869 void  OS_Sched (void)
//  870 {
OS_Sched:
        CALL      L:?push_w4
//  871 #if OS_CRITICAL_METHOD == 3                            /* Allocate storage for CPU status register     */
//  872     OS_CPU_SR  cpu_sr;
//  873 #endif    
//  874     INT8U      y;
//  875 
//  876 
//  877     OS_ENTER_CRITICAL();
        CALL      L:CriticalEnter
        LD        S:?b8, A
//  878     if ((OSIntNesting == 0) && (OSLockNesting == 0)) { /* Sched. only if all ISRs done & not locked    */
        LD        A, L:OSIntNesting
        CP        A, #0x0
        JRNE      L:??OS_Sched_0
        LD        A, L:OSLockNesting
        CP        A, #0x0
        JRNE      L:??OS_Sched_0
//  879         y             = OSUnMapTbl[OSRdyGrp];          /* Get pointer to HPT ready to run              */
        LD        A, L:OSRdyGrp
        CLRW      X
        LD        XL, A
        LD        A, (L:OSUnMapTbl,X)
        LD        S:?b9, A
//  880         OSPrioHighRdy = (INT8U)((y << 3) + OSUnMapTbl[OSRdyTbl[y]]);
        CLRW      X
        EXG       A, XL
        LD        A, S:?b9
        EXG       A, XL
        LD        A, (L:OSRdyTbl,X)
        CLRW      X
        LD        XL, A
        LD        A, S:?b9
        SLL       A
        SLL       A
        SLL       A
        ADD       A, (L:OSUnMapTbl,X)
        LD        L:OSPrioHighRdy, A
//  881         if (OSPrioHighRdy != OSPrioCur) {              /* No Ctx Sw if current task is highest rdy     */
        LD        A, L:OSPrioCur
        CP        A, L:OSPrioHighRdy
        JREQ      L:??OS_Sched_0
//  882             OSTCBHighRdy = OSTCBPrioTbl[OSPrioHighRdy];
        LD        A, L:OSPrioHighRdy
        CLRW      X
        LD        XL, A
        SLLW      X
        LDW       X, (L:OSTCBPrioTbl,X)
        LDW       L:OSTCBHighRdy, X
//  883             OSCtxSwCtr++;                              /* Increment context switch counter             */
        LDW       X, #OSCtxSwCtr
        CALL      L:?load32_l0_0x
        CALL      L:?inc32_l0_l0
        LDW       X, #OSCtxSwCtr
        CALL      L:?load32_0x_l0
//  884             OS_TASK_SW();                              /* Perform a context switch                     */
        CALL      L:__near_OSCtxSw
//  885         }
//  886     }
//  887     OS_EXIT_CRITICAL();
??OS_Sched_0:
        LD        A, S:?b8
        CALL      L:CriticalExit
//  888 }
        JP        L:?epilogue_w4
//  889 /*$PAGE*/
//  890 /*
//  891 *********************************************************************************************************
//  892 *                                              IDLE TASK
//  893 *
//  894 * Description: This task is internal to uC/OS-II and executes whenever no other higher priority tasks
//  895 *              executes because they are ALL waiting for event(s) to occur.
//  896 *
//  897 * Arguments  : none
//  898 *
//  899 * Returns    : none
//  900 *
//  901 * Note(s)    : 1) OSTaskIdleHook() is called after the critical section to ensure that interrupts will be
//  902 *                 enabled for at least a few instructions.  On some processors (ex. Philips XA), enabling
//  903 *                 and then disabling interrupts didn't allow the processor enough time to have interrupts
//  904 *                 enabled before they were disabled again.  uC/OS-II would thus never recognize
//  905 *                 interrupts.
//  906 *              2) This hook has been added to allow you to do such things as STOP the CPU to conserve 
//  907 *                 power.
//  908 *********************************************************************************************************
//  909 */
//  910 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  911 void  OS_TaskIdle (void *pdata)
//  912 {
OS_TaskIdle:
        CALL      L:?push_w4
        PUSH      S:?b10
        LDW       S:?w4, X
//  913 #if OS_CRITICAL_METHOD == 3                      /* Allocate storage for CPU status register           */
//  914     OS_CPU_SR  cpu_sr;
//  915 #endif    
//  916     
//  917     
//  918     pdata = pdata;                               /* Prevent compiler warning for not using 'pdata'     */
//  919     for (;;) {
//  920         OS_ENTER_CRITICAL();
??OS_TaskIdle_0:
        CALL      L:CriticalEnter
        LD        S:?b10, A
//  921         OSIdleCtr++;
        LDW       X, #OSIdleCtr
        CALL      L:?load32_l0_0x
        CALL      L:?inc32_l0_l0
        LDW       X, #OSIdleCtr
        CALL      L:?load32_0x_l0
//  922         OS_EXIT_CRITICAL();
        LD        A, S:?b10
        CALL      L:CriticalExit
//  923         OSTaskIdleHook();                        /* Call user definable HOOK                           */
        CALL      L:OSTaskIdleHook
        JRA       L:??OS_TaskIdle_0
//  924     }
//  925 }
//  926 /*$PAGE*/
//  927 /*
//  928 *********************************************************************************************************
//  929 *                                            STATISTICS TASK
//  930 *
//  931 * Description: This task is internal to uC/OS-II and is used to compute some statistics about the
//  932 *              multitasking environment.  Specifically, OS_TaskStat() computes the CPU usage.
//  933 *              CPU usage is determined by:
//  934 *
//  935 *                                          OSIdleCtr
//  936 *                 OSCPUUsage = 100 * (1 - ------------)     (units are in %)
//  937 *                                         OSIdleCtrMax
//  938 *
//  939 * Arguments  : pdata     this pointer is not used at this time.
//  940 *
//  941 * Returns    : none
//  942 *
//  943 * Notes      : 1) This task runs at a priority level higher than the idle task.  In fact, it runs at the
//  944 *                 next higher priority, OS_IDLE_PRIO-1.
//  945 *              2) You can disable this task by setting the configuration #define OS_TASK_STAT_EN to 0.
//  946 *              3) We delay for 5 seconds in the beginning to allow the system to reach steady state and
//  947 *                 have all other tasks created before we do statistics.  You MUST have at least a delay
//  948 *                 of 2 seconds to allow for the system to establish the maximum value for the idle
//  949 *                 counter.
//  950 *********************************************************************************************************
//  951 */
//  952 
//  953 #if OS_TASK_STAT_EN > 0
//  954 void  OS_TaskStat (void *pdata)
//  955 {
//  956 #if OS_CRITICAL_METHOD == 3                      /* Allocate storage for CPU status register           */
//  957     OS_CPU_SR  cpu_sr;
//  958 #endif    
//  959     INT32U     run;
//  960     INT32U     max;
//  961     INT8S      usage;
//  962 
//  963 
//  964     pdata = pdata;                               /* Prevent compiler warning for not using 'pdata'     */
//  965     while (OSStatRdy == FALSE) {
//  966         OSTimeDly(2 * OS_TICKS_PER_SEC);         /* Wait until statistic task is ready                 */
//  967     }
//  968     max = OSIdleCtrMax / 100L;
//  969     for (;;) {
//  970         OS_ENTER_CRITICAL();
//  971         OSIdleCtrRun = OSIdleCtr;                /* Obtain the of the idle counter for the past second */
//  972         run          = OSIdleCtr;
//  973         OSIdleCtr    = 0L;                       /* Reset the idle counter for the next second         */
//  974         OS_EXIT_CRITICAL();
//  975         if (max > 0L) {
//  976             usage = (INT8S)(100L - run / max);
//  977             if (usage >= 0) {                    /* Make sure we don't have a negative percentage      */
//  978                 OSCPUUsage = usage;
//  979             } else {
//  980                 OSCPUUsage = 0;
//  981             }
//  982         } else {
//  983             OSCPUUsage = 0;
//  984             max        = OSIdleCtrMax / 100L;
//  985         }
//  986         OSTaskStatHook();                        /* Invoke user definable hook                         */
//  987         OSTimeDly(OS_TICKS_PER_SEC);             /* Accumulate OSIdleCtr for the next second           */
//  988     }
//  989 }
//  990 #endif
//  991 /*$PAGE*/
//  992 /*
//  993 *********************************************************************************************************
//  994 *                                            INITIALIZE TCB
//  995 *
//  996 * Description: This function is internal to uC/OS-II and is used to initialize a Task Control Block when
//  997 *              a task is created (see OSTaskCreate() and OSTaskCreateExt()).
//  998 *
//  999 * Arguments  : prio          is the priority of the task being created
// 1000 *
// 1001 *              ptos          is a pointer to the task's top-of-stack assuming that the CPU registers
// 1002 *                            have been placed on the stack.  Note that the top-of-stack corresponds to a
// 1003 *                            'high' memory location is OS_STK_GROWTH is set to 1 and a 'low' memory
// 1004 *                            location if OS_STK_GROWTH is set to 0.  Note that stack growth is CPU
// 1005 *                            specific.
// 1006 *
// 1007 *              pbos          is a pointer to the bottom of stack.  A NULL pointer is passed if called by
// 1008 *                            'OSTaskCreate()'.
// 1009 *
// 1010 *              id            is the task's ID (0..65535)
// 1011 *
// 1012 *              stk_size      is the size of the stack (in 'stack units').  If the stack units are INT8Us
// 1013 *                            then, 'stk_size' contains the number of bytes for the stack.  If the stack
// 1014 *                            units are INT32Us then, the stack contains '4 * stk_size' bytes.  The stack
// 1015 *                            units are established by the #define constant OS_STK which is CPU
// 1016 *                            specific.  'stk_size' is 0 if called by 'OSTaskCreate()'.
// 1017 *
// 1018 *              pext          is a pointer to a user supplied memory area that is used to extend the task
// 1019 *                            control block.  This allows you to store the contents of floating-point
// 1020 *                            registers, MMU registers or anything else you could find useful during a
// 1021 *                            context switch.  You can even assign a name to each task and store this name
// 1022 *                            in this TCB extension.  A NULL pointer is passed if called by OSTaskCreate().
// 1023 *
// 1024 *              opt           options as passed to 'OSTaskCreateExt()' or,
// 1025 *                            0 if called from 'OSTaskCreate()'.
// 1026 *
// 1027 * Returns    : OS_NO_ERR         if the call was successful
// 1028 *              OS_NO_MORE_TCB    if there are no more free TCBs to be allocated and thus, the task cannot
// 1029 *                                be created.
// 1030 *
// 1031 * Note       : This function is INTERNAL to uC/OS-II and your application should not call it.
// 1032 *********************************************************************************************************
// 1033 */
// 1034 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1035 INT8U  OS_TCBInit (INT8U prio, OS_STK *ptos, OS_STK *pbos, INT16U id, INT32U stk_size, void *pext, INT16U opt)
// 1036 {
OS_TCBInit:
        CALL      L:?push_l2
        CALL      L:?push_l3
        PUSHW     X
        PUSHW     Y
        CALL      L:?push_w0
        CALL      L:?push_w1
        LD        S:?b10, A
        CALL      L:?mov_l3_l1
// 1037 #if OS_CRITICAL_METHOD == 3                                /* Allocate storage for CPU status register */
// 1038     OS_CPU_SR  cpu_sr;
// 1039 #endif    
// 1040     OS_TCB    *ptcb;
// 1041 
// 1042 
// 1043     OS_ENTER_CRITICAL();
        CALL      L:CriticalEnter
        LD        S:?b11, A
// 1044     ptcb = OSTCBFreeList;                                  /* Get a free TCB from the free TCB list    */
        LDW       X, L:OSTCBFreeList
        LDW       S:?w4, X
// 1045     if (ptcb != (OS_TCB *)0) {
        LDW       X, S:?w4
        TNZW      X
        JRNE      ??lb_0
        JP        L:??OS_TCBInit_0
// 1046         OSTCBFreeList        = ptcb->OSTCBNext;            /* Update pointer to free TCB list          */
??lb_0:
        LDW       X, S:?w4
        ADDW      X, #0xe
        LDW       X, (X)
        LDW       L:OSTCBFreeList, X
// 1047         OS_EXIT_CRITICAL();
        LD        A, S:?b11
        CALL      L:CriticalExit
// 1048         ptcb->OSTCBStkPtr    = ptos;                       /* Load Stack pointer in TCB                */
        LDW       X, (0x7,SP)
        LDW       [S:?w4.w], X
// 1049         ptcb->OSTCBPrio      = (INT8U)prio;                /* Load task priority into TCB              */
        LDW       X, S:?w4
        ADDW      X, #0x19
        LD        A, S:?b10
        LD        (X), A
// 1050         ptcb->OSTCBStat      = OS_STAT_RDY;                /* Task is ready to run                     */
        LDW       X, S:?w4
        ADDW      X, #0x18
        CLR       A
        LD        (X), A
// 1051         ptcb->OSTCBDly       = 0;                          /* Task is not delayed                      */
        LDW       X, S:?w4
        ADDW      X, #0x16
        LDW       Y, X
        CLRW      X
        LDW       (Y), X
// 1052 
// 1053 #if OS_TASK_CREATE_EXT_EN > 0
// 1054         ptcb->OSTCBExtPtr    = pext;                       /* Store pointer to TCB extension           */
        LDW       X, S:?w4
        ADDW      X, #0x2
        LDW       Y, X
        LDW       X, (0x1,SP)
        LDW       (Y), X
// 1055         ptcb->OSTCBStkSize   = stk_size;                   /* Store stack size                         */
        LDW       X, S:?w4
        ADDW      X, #0x6
        CALL      L:?load32_0x_l3
// 1056         ptcb->OSTCBStkBottom = pbos;                       /* Store pointer to bottom of stack         */
        LDW       X, S:?w4
        ADDW      X, #0x4
        LDW       Y, X
        LDW       X, (0x5,SP)
        LDW       (Y), X
// 1057         ptcb->OSTCBOpt       = opt;                        /* Store task options                       */
        LDW       X, S:?w4
        ADDW      X, #0xa
        LDW       Y, X
        LDW       X, (0x13,SP)
        LDW       (Y), X
// 1058         ptcb->OSTCBId        = id;                         /* Store task ID                            */
        LDW       X, S:?w4
        ADDW      X, #0xc
        LDW       Y, X
        LDW       X, (0x3,SP)
        LDW       (Y), X
// 1059 #else
// 1060         pext                 = pext;                       /* Prevent compiler warning if not used     */
// 1061         stk_size             = stk_size;
// 1062         pbos                 = pbos;
// 1063         opt                  = opt;
// 1064         id                   = id;
// 1065 #endif
// 1066 
// 1067 #if OS_TASK_DEL_EN > 0
// 1068         ptcb->OSTCBDelReq    = OS_NO_ERR;
        LDW       X, S:?w4
        ADDW      X, #0x1e
        CLR       A
        LD        (X), A
// 1069 #endif
// 1070 
// 1071         ptcb->OSTCBY         = prio >> 3;                  /* Pre-compute X, Y, BitX and BitY          */
        LD        A, S:?b10
        SRL       A
        SRL       A
        SRL       A
        LDW       X, S:?w4
        ADDW      X, #0x1b
        LD        (X), A
// 1072         ptcb->OSTCBBitY      = OSMapTbl[ptcb->OSTCBY];
        LDW       X, S:?w4
        ADDW      X, #0x1b
        LD        A, (X)
        CLRW      X
        LD        XL, A
        LD        A, (L:OSMapTbl,X)
        LDW       X, S:?w4
        ADDW      X, #0x1d
        LD        (X), A
// 1073         ptcb->OSTCBX         = prio & 0x07;
        LD        A, S:?b10
        AND       A, #0x7
        LDW       X, S:?w4
        ADDW      X, #0x1a
        LD        (X), A
// 1074         ptcb->OSTCBBitX      = OSMapTbl[ptcb->OSTCBX];
        LDW       X, S:?w4
        ADDW      X, #0x1a
        LD        A, (X)
        CLRW      X
        LD        XL, A
        LD        A, (L:OSMapTbl,X)
        LDW       X, S:?w4
        ADDW      X, #0x1c
        LD        (X), A
// 1075 
// 1076 #if OS_EVENT_EN > 0
// 1077         ptcb->OSTCBEventPtr  = (OS_EVENT *)0;              /* Task is not pending on an event          */
        LDW       X, S:?w4
        ADDW      X, #0x12
        LDW       Y, X
        CLRW      X
        LDW       (Y), X
// 1078 #endif
// 1079 
// 1080 #if (OS_VERSION >= 251) && (OS_FLAG_EN > 0) && (OS_MAX_FLAGS > 0) && (OS_TASK_DEL_EN > 0)
// 1081         ptcb->OSTCBFlagNode  = (OS_FLAG_NODE *)0;          /* Task is not pending on an event flag     */
// 1082 #endif
// 1083 
// 1084 #if (OS_MBOX_EN > 0) || ((OS_Q_EN > 0) && (OS_MAX_QS > 0))
// 1085         ptcb->OSTCBMsg       = (void *)0;                  /* No message received                      */
        LDW       X, S:?w4
        ADDW      X, #0x14
        LDW       Y, X
        CLRW      X
        LDW       (Y), X
// 1086 #endif
// 1087 
// 1088 #if OS_VERSION >= 204
// 1089         OSTCBInitHook(ptcb);
        LDW       X, S:?w4
        CALL      L:OSTCBInitHook
// 1090 #endif
// 1091 
// 1092         OSTaskCreateHook(ptcb);                            /* Call user defined hook                   */
        LDW       X, S:?w4
        CALL      L:OSTaskCreateHook
// 1093         
// 1094         OS_ENTER_CRITICAL();
        CALL      L:CriticalEnter
        LD        S:?b11, A
// 1095         OSTCBPrioTbl[prio] = ptcb;
        CLRW      X
        EXG       A, XL
        LD        A, S:?b10
        EXG       A, XL
        SLLW      X
        LDW       Y, S:?w4
        LDW       (L:OSTCBPrioTbl,X), Y
// 1096         ptcb->OSTCBNext    = OSTCBList;                    /* Link into TCB chain                      */
        LDW       X, S:?w4
        ADDW      X, #0xe
        LDW       Y, X
        LDW       X, L:OSTCBList
        LDW       (Y), X
// 1097         ptcb->OSTCBPrev    = (OS_TCB *)0;
        LDW       X, S:?w4
        ADDW      X, #0x10
        LDW       Y, X
        CLRW      X
        LDW       (Y), X
// 1098         if (OSTCBList != (OS_TCB *)0) {
        LDW       X, L:OSTCBList
        TNZW      X
        JREQ      L:??OS_TCBInit_1
// 1099             OSTCBList->OSTCBPrev = ptcb;
        LDW       X, L:OSTCBList
        ADDW      X, #0x10
        LDW       Y, S:?w4
        LDW       (X), Y
// 1100         }
// 1101         OSTCBList               = ptcb;
??OS_TCBInit_1:
        LDW       X, S:?w4
        LDW       L:OSTCBList, X
// 1102         OSRdyGrp               |= ptcb->OSTCBBitY;         /* Make task ready to run                   */
        LDW       X, S:?w4
        ADDW      X, #0x1d
        LD        A, (X)
        OR        A, L:OSRdyGrp
        LD        L:OSRdyGrp, A
// 1103         OSRdyTbl[ptcb->OSTCBY] |= ptcb->OSTCBBitX;
        LDW       X, S:?w4
        ADDW      X, #0x1b
        LD        A, (X)
        CLRW      X
        LD        XL, A
        LD        A, (L:OSRdyTbl,X)
        LDW       X, S:?w4
        ADDW      X, #0x1c
        OR        A, (X)
        LD        S:?b0, A
        LDW       X, S:?w4
        ADDW      X, #0x1b
        LD        A, (X)
        CLRW      X
        LD        XL, A
        LD        A, S:?b0
        LD        (L:OSRdyTbl,X), A
// 1104         OS_EXIT_CRITICAL();
        LD        A, S:?b11
        CALL      L:CriticalExit
// 1105         return (OS_NO_ERR);
        CLR       A
        JRA       L:??OS_TCBInit_2
// 1106     }
// 1107     OS_EXIT_CRITICAL();
??OS_TCBInit_0:
        LD        A, S:?b11
        CALL      L:CriticalExit
// 1108     return (OS_NO_MORE_TCB);
        LD        A, #0x46
??OS_TCBInit_2:
        ADD       SP, #0x8
        JP        L:?epilogue_l2_l3
// 1109 }

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
//   674 bytes in section .near.bss
//   264 bytes in section .near.rodata
// 1 848 bytes in section .near_func.text
// 
// 1 848 bytes of CODE  memory
//   264 bytes of CONST memory
//   674 bytes of DATA  memory
//
//Errors: none
//Warnings: 3
