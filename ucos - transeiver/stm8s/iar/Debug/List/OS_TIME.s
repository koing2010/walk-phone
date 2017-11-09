///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.40.1.50106 for STM8            05/Feb/2017  11:28:54 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\RDA1846s\walkphone program\ucos -                    /
//                    transeiver\ucos_II\OS_TIME.C                            /
//    Command line =  "E:\RDA1846s\walkphone program\ucos -                   /
//                    transeiver\ucos_II\OS_TIME.C" -e -On --no_cse           /
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
//                    transeiver\stm8s\iar\Debug\List\OS_TIME.s               /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME OS_TIME

        EXTERN ?add32_l0_l0_dl
        EXTERN ?add32_l0_l0_l1
        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b10
        EXTERN ?b11
        EXTERN ?b12
        EXTERN ?epilogue_l2
        EXTERN ?epilogue_l2_l3
        EXTERN ?epilogue_w4
        EXTERN ?load32_0x_l2
        EXTERN ?load32_l0_0x
        EXTERN ?mov_l0_l2
        EXTERN ?mov_l2_l0
        EXTERN ?mov_l2_l1
        EXTERN ?mov_w1_w7
        EXTERN ?mov_w6_w1
        EXTERN ?mul32_l0_l0_dl
        EXTERN ?pop_l1
        EXTERN ?push_l0
        EXTERN ?push_l2
        EXTERN ?push_l3
        EXTERN ?push_w4
        EXTERN ?srl32_l0_l0_db
        EXTERN ?udiv32_l0_l0_dl
        EXTERN ?umod32_l1_l0_dl
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w4
        EXTERN ?w5
        EXTERN ?w6
        EXTERN ?w7
        EXTERN OSRdyGrp
        EXTERN OSRdyTbl
        EXTERN OSTCBCur
        EXTERN OSTCBPrioTbl
        EXTERN OSTime
        EXTERN OS_Sched

        PUBLIC OSTimeDly
        PUBLIC OSTimeDlyHMSM
        PUBLIC OSTimeDlyResume
        PUBLIC OSTimeGet
        PUBLIC OSTimeSet

// E:\RDA1846s\walkphone program\ucos - transeiver\ucos_II\OS_TIME.C
//    1 /*
//    2 *********************************************************************************************************
//    3 *                                                uC/OS-II
//    4 *                                          The Real-Time Kernel
//    5 *                                             TIME MANAGEMENT
//    6 *
//    7 *                          (c) Copyright 1992-2002, Jean J. Labrosse, Weston, FL
//    8 *                                           All Rights Reserved
//    9 *
//   10 * File : OS_TIME.C
//   11 * By   : Jean J. Labrosse
//   12 *********************************************************************************************************
//   13 */
//   14 
//   15 #ifndef  OS_MASTER_FILE
//   16 #include "includes.h"

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
//   17 #endif
//   18 
//   19 /*
//   20 *********************************************************************************************************
//   21 *                                DELAY TASK 'n' TICKS   (n from 0 to 65535)
//   22 *
//   23 * Description: This function is called to delay execution of the currently running task until the
//   24 *              specified number of system ticks expires.  This, of course, directly equates to delaying
//   25 *              the current task for some time to expire.  No delay will result If the specified delay is
//   26 *              0.  If the specified delay is greater than 0 then, a context switch will result.
//   27 *
//   28 * Arguments  : ticks     is the time delay that the task will be suspended in number of clock 'ticks'.
//   29 *                        Note that by specifying 0, the task will not be delayed.
//   30 *
//   31 * Returns    : none
//   32 *********************************************************************************************************
//   33 */
//   34 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   35 void  OSTimeDly (INT16U ticks)
//   36 {
OSTimeDly:
        CALL      L:?push_w4
        PUSH      S:?b10
        LDW       S:?w4, X
//   37 #if OS_CRITICAL_METHOD == 3                      /* Allocate storage for CPU status register           */
//   38     OS_CPU_SR  cpu_sr;
//   39 #endif    
//   40 
//   41 
//   42     if (ticks > 0) {                                                      /* 0 means no delay!         */
        LDW       X, S:?w4
        TNZW      X
        JREQ      L:??OSTimeDly_0
//   43         OS_ENTER_CRITICAL();
        CALL      L:CriticalEnter
        LD        S:?b10, A
//   44         if ((OSRdyTbl[OSTCBCur->OSTCBY] &= ~OSTCBCur->OSTCBBitX) == 0) {  /* Delay current task        */
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
        JRNE      L:??OSTimeDly_1
//   45             OSRdyGrp &= ~OSTCBCur->OSTCBBitY;
        LDW       X, L:OSTCBCur
        ADDW      X, #0x1d
        LD        A, (X)
        CPL       A
        AND       A, L:OSRdyGrp
        LD        L:OSRdyGrp, A
//   46         }
//   47         OSTCBCur->OSTCBDly = ticks;                                       /* Load ticks in TCB         */
??OSTimeDly_1:
        LDW       X, L:OSTCBCur
        ADDW      X, #0x16
        LDW       Y, S:?w4
        LDW       (X), Y
//   48         OS_EXIT_CRITICAL();
        LD        A, S:?b10
        CALL      L:CriticalExit
//   49         OS_Sched();                                                       /* Find next task to run!    */
        CALL      L:OS_Sched
//   50     }
//   51 }
??OSTimeDly_0:
        POP       S:?b10
        JP        L:?epilogue_w4
//   52 /*$PAGE*/
//   53 /*
//   54 *********************************************************************************************************
//   55 *                                     DELAY TASK FOR SPECIFIED TIME
//   56 *
//   57 * Description: This function is called to delay execution of the currently running task until some time
//   58 *              expires.  This call allows you to specify the delay time in HOURS, MINUTES, SECONDS and
//   59 *              MILLISECONDS instead of ticks.
//   60 *
//   61 * Arguments  : hours     specifies the number of hours that the task will be delayed (max. is 255)
//   62 *              minutes   specifies the number of minutes (max. 59)
//   63 *              seconds   specifies the number of seconds (max. 59)
//   64 *              milli     specifies the number of milliseconds (max. 999)
//   65 *
//   66 * Returns    : OS_NO_ERR
//   67 *              OS_TIME_INVALID_MINUTES
//   68 *              OS_TIME_INVALID_SECONDS
//   69 *              OS_TIME_INVALID_MS
//   70 *              OS_TIME_ZERO_DLY
//   71 *
//   72 * Note(s)    : The resolution on the milliseconds depends on the tick rate.  For example, you can't do
//   73 *              a 10 mS delay if the ticker interrupts every 100 mS.  In this case, the delay would be
//   74 *              set to 0.  The actual delay is rounded to the nearest tick.
//   75 *********************************************************************************************************
//   76 */
//   77 
//   78 #if OS_TIME_DLY_HMSM_EN > 0

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   79 INT8U  OSTimeDlyHMSM (INT8U hours, INT8U minutes, INT8U seconds, INT16U milli)
//   80 {
OSTimeDlyHMSM:
        CALL      L:?push_l2
        CALL      L:?push_l3
        PUSH      A
        PUSH      S:?b0
        PUSH      S:?b1
        LDW       S:?w7, X
//   81     INT32U ticks;
//   82     INT16U loops;
//   83 
//   84 
//   85     if (hours > 0 || minutes > 0 || seconds > 0 || milli > 0) {
        TNZ       (0x3,SP)
        JRNE      L:??OSTimeDlyHMSM_0
        TNZ       (0x2,SP)
        JRNE      L:??OSTimeDlyHMSM_0
        TNZ       (0x1,SP)
        JRNE      L:??OSTimeDlyHMSM_0
        LDW       X, S:?w7
        TNZW      X
        JRNE      ??lb_0
        JP        L:??OSTimeDlyHMSM_1
//   86         if (minutes > 59) {
??lb_0:
??OSTimeDlyHMSM_0:
        LD        A, (0x2,SP)
        CP        A, #0x3c
        JRC       L:??OSTimeDlyHMSM_2
//   87             return (OS_TIME_INVALID_MINUTES);    /* Validate arguments to be within range              */
        LD        A, #0x51
        JP        L:??OSTimeDlyHMSM_3
//   88         }
//   89         if (seconds > 59) {
??OSTimeDlyHMSM_2:
        LD        A, (0x1,SP)
        CP        A, #0x3c
        JRC       L:??OSTimeDlyHMSM_4
//   90             return (OS_TIME_INVALID_SECONDS);
        LD        A, #0x52
        JP        L:??OSTimeDlyHMSM_3
//   91         }
//   92         if (milli > 999) {
??OSTimeDlyHMSM_4:
        LDW       X, S:?w7
        CPW       X, #0x3e8
        JRC       L:??OSTimeDlyHMSM_5
//   93             return (OS_TIME_INVALID_MILLI);
        LD        A, #0x53
        JP        L:??OSTimeDlyHMSM_3
//   94         }
//   95                                                  /* Compute the total number of clock ticks required.. */
//   96                                                  /* .. (rounded to the nearest tick)                   */
//   97         ticks = ((INT32U)hours * 3600L + (INT32U)minutes * 60L + (INT32U)seconds) * OS_TICKS_PER_SEC
//   98               + OS_TICKS_PER_SEC * ((INT32U)milli + 500L / OS_TICKS_PER_SEC) / 1000L;
??OSTimeDlyHMSM_5:
        CALL      L:?mov_w1_w7
        CLRW      X
        LDW       S:?w0, X
        CALL      L:?add32_l0_l0_dl
        DATA
        DC32      0x5
        CODE
        CALL      L:?mul32_l0_l0_dl
        DATA
        DC32      0x64
        CODE
        CALL      L:?udiv32_l0_l0_dl
        DATA
        DC32      0x3e8
        CODE
        CALL      L:?push_l0
        LD        A, (0x5,SP)
        CLRW      X
        LD        XL, A
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:?push_l0
        LD        A, (0xa,SP)
        CLRW      X
        LD        XL, A
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:?mul32_l0_l0_dl
        DATA
        DC32      0x3c
        CODE
        CALL      L:?push_l0
        LD        A, (0xf,SP)
        CLRW      X
        LD        XL, A
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:?mul32_l0_l0_dl
        DATA
        DC32      0xe10
        CODE
        CALL      L:?pop_l1
        CALL      L:?add32_l0_l0_l1
        CALL      L:?pop_l1
        CALL      L:?add32_l0_l0_l1
        CALL      L:?mul32_l0_l0_dl
        DATA
        DC32      0x64
        CODE
        CALL      L:?pop_l1
        CALL      L:?add32_l0_l0_l1
        CALL      L:?mov_l2_l0
//   99         loops = (INT16U)(ticks / 65536L);        /* Compute the integral number of 65536 tick delays   */
        CALL      L:?mov_l0_l2
        CALL      L:?srl32_l0_l0_db
        DATA
        DC8       0x10
        CODE
        CALL      L:?mov_w6_w1
//  100         ticks = ticks % 65536L;                  /* Obtain  the fractional number of ticks             */
        CALL      L:?mov_l0_l2
        CALL      L:?umod32_l1_l0_dl
        DATA
        DC32      0x10000
        CODE
        CALL      L:?mov_l2_l1
//  101         OSTimeDly((INT16U)ticks);
        LDW       X, S:?w5
        CALL      L:OSTimeDly
//  102         while (loops > 0) {
??OSTimeDlyHMSM_6:
        LDW       X, S:?w6
        TNZW      X
        JREQ      L:??OSTimeDlyHMSM_7
//  103             OSTimeDly(32768);
        LDW       X, #0x8000
        CALL      L:OSTimeDly
//  104             OSTimeDly(32768);
        LDW       X, #0x8000
        CALL      L:OSTimeDly
//  105             loops--;
        LDW       X, S:?w6
        DECW      X
        LDW       S:?w6, X
        JRA       L:??OSTimeDlyHMSM_6
//  106         }
//  107         return (OS_NO_ERR);
??OSTimeDlyHMSM_7:
        CLR       A
        JRA       L:??OSTimeDlyHMSM_3
//  108     }
//  109     return (OS_TIME_ZERO_DLY);
??OSTimeDlyHMSM_1:
        LD        A, #0x54
??OSTimeDlyHMSM_3:
        ADD       SP, #0x3
        JP        L:?epilogue_l2_l3
//  110 }
//  111 #endif
//  112 /*$PAGE*/
//  113 /*
//  114 *********************************************************************************************************
//  115 *                                         RESUME A DELAYED TASK
//  116 *
//  117 * Description: This function is used resume a task that has been delayed through a call to either
//  118 *              OSTimeDly() or OSTimeDlyHMSM().  Note that you MUST NOT call this function to resume a
//  119 *              task that is waiting for an event with timeout.  This situation would make the task look
//  120 *              like a timeout occurred (unless you desire this effect).  Also, you cannot resume a task
//  121 *              that has called OSTimeDlyHMSM() with a combined time that exceeds 65535 clock ticks.  In
//  122 *              other words, if the clock tick runs at 100 Hz then, you will not be able to resume a
//  123 *              delayed task that called OSTimeDlyHMSM(0, 10, 55, 350) or higher.
//  124 *
//  125 *                  (10 Minutes * 60 + 55 Seconds + 0.35) * 100 ticks/second.
//  126 *
//  127 * Arguments  : prio      specifies the priority of the task to resume
//  128 *
//  129 * Returns    : OS_NO_ERR                 Task has been resumed
//  130 *              OS_PRIO_INVALID           if the priority you specify is higher that the maximum allowed
//  131 *                                        (i.e. >= OS_LOWEST_PRIO)
//  132 *              OS_TIME_NOT_DLY           Task is not waiting for time to expire
//  133 *              OS_TASK_NOT_EXIST         The desired task has not been created
//  134 *********************************************************************************************************
//  135 */
//  136 
//  137 #if OS_TIME_DLY_RESUME_EN > 0

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  138 INT8U  OSTimeDlyResume (INT8U prio)
//  139 {
OSTimeDlyResume:
        CALL      L:?push_l2
        LD        S:?b10, A
//  140 #if OS_CRITICAL_METHOD == 3                      /* Allocate storage for CPU status register           */
//  141     OS_CPU_SR  cpu_sr;
//  142 #endif    
//  143     OS_TCB    *ptcb;
//  144 
//  145 
//  146     if (prio >= OS_LOWEST_PRIO) {
        LD        A, S:?b10
        CP        A, #0x3f
        JRC       L:??OSTimeDlyResume_0
//  147         return (OS_PRIO_INVALID);
        LD        A, #0x2a
        JP        L:??OSTimeDlyResume_1
//  148     }
//  149     OS_ENTER_CRITICAL();
??OSTimeDlyResume_0:
        CALL      L:CriticalEnter
        LD        S:?b11, A
//  150     ptcb = (OS_TCB *)OSTCBPrioTbl[prio];                   /* Make sure that task exist                */
        CLRW      X
        EXG       A, XL
        LD        A, S:?b10
        EXG       A, XL
        SLLW      X
        LDW       X, (L:OSTCBPrioTbl,X)
        LDW       S:?w4, X
//  151     if (ptcb != (OS_TCB *)0) {
        LDW       X, S:?w4
        TNZW      X
        JREQ      L:??OSTimeDlyResume_2
//  152         if (ptcb->OSTCBDly != 0) {                         /* See if task is delayed                   */
        LDW       X, S:?w4
        ADDW      X, #0x16
        LDW       X, (X)
        TNZW      X
        JREQ      L:??OSTimeDlyResume_3
//  153             ptcb->OSTCBDly  = 0;                           /* Clear the time delay                     */
        LDW       X, S:?w4
        ADDW      X, #0x16
        LDW       Y, X
        CLRW      X
        LDW       (Y), X
//  154             if ((ptcb->OSTCBStat & OS_STAT_SUSPEND) == OS_STAT_RDY) {  /* See if task is ready to run  */
        LDW       X, S:?w4
        ADDW      X, #0x18
        LD        A, (X)
        AND       A, #0x8
        CP        A, #0x0
        JRNE      L:??OSTimeDlyResume_4
//  155                 OSRdyGrp               |= ptcb->OSTCBBitY;             /* Make task ready to run       */
        LDW       X, S:?w4
        ADDW      X, #0x1d
        LD        A, (X)
        OR        A, L:OSRdyGrp
        LD        L:OSRdyGrp, A
//  156                 OSRdyTbl[ptcb->OSTCBY] |= ptcb->OSTCBBitX;
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
//  157                 OS_EXIT_CRITICAL();
        LD        A, S:?b11
        CALL      L:CriticalExit
//  158                 OS_Sched();                                /* See if this is new highest priority      */
        CALL      L:OS_Sched
        JRA       L:??OSTimeDlyResume_5
//  159             } else {
//  160                 OS_EXIT_CRITICAL();                        /* Task may be suspended                    */
??OSTimeDlyResume_4:
        LD        A, S:?b11
        CALL      L:CriticalExit
//  161             }
//  162             return (OS_NO_ERR);
??OSTimeDlyResume_5:
        CLR       A
        JRA       L:??OSTimeDlyResume_1
//  163         } else {
//  164             OS_EXIT_CRITICAL();
??OSTimeDlyResume_3:
        LD        A, S:?b11
        CALL      L:CriticalExit
//  165             return (OS_TIME_NOT_DLY);                      /* Indicate that task was not delayed       */
        LD        A, #0x50
        JRA       L:??OSTimeDlyResume_1
//  166         }
//  167     }
//  168     OS_EXIT_CRITICAL();
??OSTimeDlyResume_2:
        LD        A, S:?b11
        CALL      L:CriticalExit
//  169     return (OS_TASK_NOT_EXIST);                            /* The task does not exist                  */
        LD        A, #0xb
??OSTimeDlyResume_1:
        JP        L:?epilogue_l2
//  170 }
//  171 #endif    
//  172 /*$PAGE*/
//  173 /*
//  174 *********************************************************************************************************
//  175 *                                         GET CURRENT SYSTEM TIME
//  176 *
//  177 * Description: This function is used by your application to obtain the current value of the 32-bit
//  178 *              counter which keeps track of the number of clock ticks.
//  179 *
//  180 * Arguments  : none
//  181 *
//  182 * Returns    : The current value of OSTime
//  183 *********************************************************************************************************
//  184 */
//  185 
//  186 #if OS_TIME_GET_SET_EN > 0

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  187 INT32U  OSTimeGet (void)
//  188 {
OSTimeGet:
        CALL      L:?push_l2
        PUSH      S:?b12
//  189 #if OS_CRITICAL_METHOD == 3                      /* Allocate storage for CPU status register           */
//  190     OS_CPU_SR  cpu_sr;
//  191 #endif    
//  192     INT32U     ticks;
//  193 
//  194 
//  195     OS_ENTER_CRITICAL();
        CALL      L:CriticalEnter
        LD        S:?b12, A
//  196     ticks = OSTime;
        LDW       X, #OSTime
        CALL      L:?load32_l0_0x
        CALL      L:?mov_l2_l0
//  197     OS_EXIT_CRITICAL();
        LD        A, S:?b12
        CALL      L:CriticalExit
//  198     return (ticks);
        CALL      L:?mov_l0_l2
        POP       S:?b12
        JP        L:?epilogue_l2
//  199 }
//  200 #endif    
//  201 
//  202 /*
//  203 *********************************************************************************************************
//  204 *                                            SET SYSTEM CLOCK
//  205 *
//  206 * Description: This function sets the 32-bit counter which keeps track of the number of clock ticks.
//  207 *
//  208 * Arguments  : ticks      specifies the new value that OSTime needs to take.
//  209 *
//  210 * Returns    : none
//  211 *********************************************************************************************************
//  212 */
//  213 
//  214 #if OS_TIME_GET_SET_EN > 0

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  215 void  OSTimeSet (INT32U ticks)
//  216 {
OSTimeSet:
        CALL      L:?push_l2
        PUSH      S:?b12
        CALL      L:?mov_l2_l0
//  217 #if OS_CRITICAL_METHOD == 3                      /* Allocate storage for CPU status register           */
//  218     OS_CPU_SR  cpu_sr;
//  219 #endif    
//  220 
//  221 
//  222     OS_ENTER_CRITICAL();
        CALL      L:CriticalEnter
        LD        S:?b12, A
//  223     OSTime = ticks;
        LDW       X, #OSTime
        CALL      L:?load32_0x_l2
//  224     OS_EXIT_CRITICAL();
        LD        A, S:?b12
        CALL      L:CriticalExit
//  225 }
        POP       S:?b12
        JP        L:?epilogue_l2

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  226 #endif    
// 
// 570 bytes in section .near_func.text
// 
// 570 bytes of CODE memory
//
//Errors: none
//Warnings: 2
