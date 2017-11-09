///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.40.1.50106 for STM8            05/Feb/2017  11:28:54 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\RDA1846s\walkphone program\ucos -                    /
//                    transeiver\ucos_II\OS_TASK.C                            /
//    Command line =  "E:\RDA1846s\walkphone program\ucos -                   /
//                    transeiver\ucos_II\OS_TASK.C" -e -On --no_cse           /
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
//                    transeiver\stm8s\iar\Debug\List\OS_TASK.s               /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME OS_TASK

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b10
        EXTERN ?b11
        EXTERN ?b12
        EXTERN ?b13
        EXTERN ?b14
        EXTERN ?b15
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?epilogue_l2
        EXTERN ?epilogue_l2_l3
        EXTERN ?epilogue_l2_w6
        EXTERN ?inc32_l2_l2
        EXTERN ?load32_0x_l0
        EXTERN ?load32_0x_l2
        EXTERN ?load32_dbsp_l0
        EXTERN ?load32_l0_0x
        EXTERN ?load32_l0_dbsp
        EXTERN ?load32_l2_dbsp
        EXTERN ?mov_l1_l2
        EXTERN ?mov_l2_l0
        EXTERN ?mov_w0_w5
        EXTERN ?mov_w1_w7
        EXTERN ?mov_w5_w0
        EXTERN ?push_l2
        EXTERN ?push_l3
        EXTERN ?push_w0
        EXTERN ?push_w1
        EXTERN ?push_w2
        EXTERN ?push_w3
        EXTERN ?push_w6
        EXTERN ?push_w7
        EXTERN ?sub32_l0_l0_l1
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w2
        EXTERN ?w3
        EXTERN ?w4
        EXTERN ?w5
        EXTERN ?w6
        EXTERN ?w7
        EXTERN OSIntNesting
        EXTERN OSLockNesting
        EXTERN OSMapTbl
        EXTERN OSRdyGrp
        EXTERN OSRdyTbl
        EXTERN OSRunning
        EXTERN OSTCBCur
        EXTERN OSTCBFreeList
        EXTERN OSTCBList
        EXTERN OSTCBPrioTbl
        EXTERN OSTaskCtr
        EXTERN OSTaskDelHook
        EXTERN OSTaskStkInit
        EXTERN OS_Dummy
        EXTERN OS_Sched
        EXTERN OS_TCBInit
        EXTERN memcpy
        EXTERN memset

        PUBLIC OSTaskChangePrio
        PUBLIC OSTaskCreate
        PUBLIC OSTaskCreateExt
        PUBLIC OSTaskDel
        PUBLIC OSTaskDelReq
        PUBLIC OSTaskQuery
        PUBLIC OSTaskResume
        PUBLIC OSTaskStkChk
        PUBLIC OSTaskSuspend

// E:\RDA1846s\walkphone program\ucos - transeiver\ucos_II\OS_TASK.C
//    1 /*
//    2 *********************************************************************************************************
//    3 *                                                uC/OS-II
//    4 *                                          The Real-Time Kernel
//    5 *                                            TASK MANAGEMENT
//    6 *
//    7 *                          (c) Copyright 1992-2002, Jean J. Labrosse, Weston, FL
//    8 *                                           All Rights Reserved
//    9 *
//   10 * File : OS_TASK.C
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
//   21 *                                        CHANGE PRIORITY OF A TASK
//   22 *
//   23 * Description: This function allows you to change the priority of a task dynamically.  Note that the new
//   24 *              priority MUST be available.
//   25 *
//   26 * Arguments  : oldp     is the old priority
//   27 *
//   28 *              newp     is the new priority
//   29 *
//   30 * Returns    : OS_NO_ERR        is the call was successful
//   31 *              OS_PRIO_INVALID  if the priority you specify is higher that the maximum allowed
//   32 *                               (i.e. >= OS_LOWEST_PRIO)
//   33 *              OS_PRIO_EXIST    if the new priority already exist.
//   34 *              OS_PRIO_ERR      there is no task with the specified OLD priority (i.e. the OLD task does
//   35 *                               not exist.
//   36 *********************************************************************************************************
//   37 */
//   38 
//   39 #if OS_TASK_CHANGE_PRIO_EN > 0

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   40 INT8U  OSTaskChangePrio (INT8U oldprio, INT8U newprio)
//   41 {
OSTaskChangePrio:
        CALL      L:?push_l2
        CALL      L:?push_l3
        SUB       SP, #0x3
        LD        S:?b10, A
        MOV       S:?b11, S:?b0
//   42 #if OS_CRITICAL_METHOD == 3                      /* Allocate storage for CPU status register           */
//   43     OS_CPU_SR    cpu_sr;
//   44 #endif
//   45 
//   46 #if OS_EVENT_EN > 0
//   47     OS_EVENT    *pevent;
//   48 #endif
//   49 
//   50     OS_TCB      *ptcb;
//   51     INT8U        x;
//   52     INT8U        y;
//   53     INT8U        bitx;
//   54     INT8U        bity;
//   55 
//   56 
//   57 
//   58 #if OS_ARG_CHK_EN > 0
//   59     if ((oldprio >= OS_LOWEST_PRIO && oldprio != OS_PRIO_SELF)  ||
//   60          newprio >= OS_LOWEST_PRIO) {
        LD        A, S:?b10
        CP        A, #0x3f
        JRC       L:??OSTaskChangePrio_0
        LD        A, S:?b10
        CP        A, #0xff
        JRNE      L:??OSTaskChangePrio_1
??OSTaskChangePrio_0:
        LD        A, S:?b11
        CP        A, #0x3f
        JRC       L:??OSTaskChangePrio_2
//   61         return (OS_PRIO_INVALID);
??OSTaskChangePrio_1:
        LD        A, #0x2a
        JP        L:??OSTaskChangePrio_3
//   62     }
//   63 #endif
//   64     OS_ENTER_CRITICAL();
??OSTaskChangePrio_2:
        CALL      L:CriticalEnter
        LD        S:?b12, A
//   65     if (OSTCBPrioTbl[newprio] != (OS_TCB *)0) {                 /* New priority must not already exist */
        CLRW      X
        EXG       A, XL
        LD        A, S:?b11
        EXG       A, XL
        SLLW      X
        LDW       X, (L:OSTCBPrioTbl,X)
        TNZW      X
        JREQ      L:??OSTaskChangePrio_4
//   66         OS_EXIT_CRITICAL();
        LD        A, S:?b12
        CALL      L:CriticalExit
//   67         return (OS_PRIO_EXIST);
        LD        A, #0x28
        JP        L:??OSTaskChangePrio_3
//   68     } else {
//   69         OSTCBPrioTbl[newprio] = (OS_TCB *)1;                    /* Reserve the entry to prevent others */
??OSTaskChangePrio_4:
        CLRW      X
        EXG       A, XL
        LD        A, S:?b11
        EXG       A, XL
        SLLW      X
        LDW       S:?w0, X
        CLRW      X
        INCW      X
        LDW       Y, X
        LDW       X, S:?w0
        LDW       (L:OSTCBPrioTbl,X), Y
//   70         OS_EXIT_CRITICAL();
        LD        A, S:?b12
        CALL      L:CriticalExit
//   71         y    = newprio >> 3;                                    /* Precompute to reduce INT. latency   */
        LD        A, S:?b11
        SRL       A
        SRL       A
        SRL       A
        LD        S:?b14, A
//   72         bity = OSMapTbl[y];
        CLRW      X
        EXG       A, XL
        LD        A, S:?b14
        EXG       A, XL
        LD        A, (L:OSMapTbl,X)
        LD        S:?b15, A
//   73         x    = newprio & 0x07;
        LD        A, S:?b11
        AND       A, #0x7
        LD        S:?b13, A
//   74         bitx = OSMapTbl[x];
        CLRW      X
        EXG       A, XL
        LD        A, S:?b13
        EXG       A, XL
        LD        A, (L:OSMapTbl,X)
        LD        (0x3,SP), A
//   75         OS_ENTER_CRITICAL();
        CALL      L:CriticalEnter
        LD        S:?b12, A
//   76         if (oldprio == OS_PRIO_SELF) {                          /* See if changing self                */
        LD        A, S:?b10
        CP        A, #0xff
        JRNE      L:??OSTaskChangePrio_5
//   77             oldprio = OSTCBCur->OSTCBPrio;                      /* Yes, get priority                   */
        LDW       X, L:OSTCBCur
        ADDW      X, #0x19
        LD        A, (X)
        LD        S:?b10, A
//   78         }
//   79         ptcb = OSTCBPrioTbl[oldprio];
??OSTaskChangePrio_5:
        CLRW      X
        EXG       A, XL
        LD        A, S:?b10
        EXG       A, XL
        SLLW      X
        LDW       X, (L:OSTCBPrioTbl,X)
        LDW       S:?w4, X
//   80         if (ptcb != (OS_TCB *)0) {                              /* Task to change must exist           */
        LDW       X, S:?w4
        TNZW      X
        JRNE      ??lb_2
        JP        L:??OSTaskChangePrio_6
//   81             OSTCBPrioTbl[oldprio] = (OS_TCB *)0;                /* Remove TCB from old priority        */
??lb_2:
        CLRW      X
        EXG       A, XL
        LD        A, S:?b10
        EXG       A, XL
        SLLW      X
        CLRW      Y
        LDW       (L:OSTCBPrioTbl,X), Y
//   82             if ((OSRdyTbl[ptcb->OSTCBY] & ptcb->OSTCBBitX) != 0x00) {  /* If task is ready make it not */
        LDW       X, S:?w4
        ADDW      X, #0x1b
        LD        A, (X)
        CLRW      X
        LD        XL, A
        LD        A, (L:OSRdyTbl,X)
        LDW       X, S:?w4
        ADDW      X, #0x1c
        AND       A, (X)
        CP        A, #0x0
        JREQ      L:??OSTaskChangePrio_7
//   83                 if ((OSRdyTbl[ptcb->OSTCBY] &= ~ptcb->OSTCBBitX) == 0x00) {
        LDW       X, S:?w4
        ADDW      X, #0x1b
        LD        A, (X)
        CLRW      X
        LD        XL, A
        LDW       Y, X
        LDW       X, S:?w4
        ADDW      X, #0x1c
        LD        A, (X)
        CPL       A
        LDW       X, Y
        AND       A, (L:OSRdyTbl,X)
        LD        S:?b0, A
        LDW       X, S:?w4
        ADDW      X, #0x1b
        LD        A, (X)
        CLRW      X
        LD        XL, A
        LD        A, S:?b0
        LD        (L:OSRdyTbl,X), A
        TNZ       S:?b0
        JRNE      L:??OSTaskChangePrio_8
//   84                     OSRdyGrp &= ~ptcb->OSTCBBitY;
        LDW       X, S:?w4
        ADDW      X, #0x1d
        LD        A, (X)
        CPL       A
        AND       A, L:OSRdyGrp
        LD        L:OSRdyGrp, A
//   85                 }
//   86                 OSRdyGrp    |= bity;                            /* Make new priority ready to run      */
??OSTaskChangePrio_8:
        LD        A, S:?b15
        OR        A, L:OSRdyGrp
        LD        L:OSRdyGrp, A
//   87                 OSRdyTbl[y] |= bitx;
        CLRW      X
        EXG       A, XL
        LD        A, S:?b14
        EXG       A, XL
        LD        A, (L:OSRdyTbl,X)
        OR        A, (0x3,SP)
        CLRW      X
        EXG       A, XL
        LD        A, S:?b14
        EXG       A, XL
        LD        (L:OSRdyTbl,X), A
        JRA       L:??OSTaskChangePrio_9
//   88 #if OS_EVENT_EN > 0
//   89             } else {
//   90                 pevent = ptcb->OSTCBEventPtr;
??OSTaskChangePrio_7:
        LDW       X, S:?w4
        ADDW      X, #0x12
        LDW       X, (X)
        LDW       (0x1,SP), X
//   91                 if (pevent != (OS_EVENT *)0) {                  /* Remove from event wait list  */
        LDW       X, (0x1,SP)
        TNZW      X
        JREQ      L:??OSTaskChangePrio_9
//   92                     if ((pevent->OSEventTbl[ptcb->OSTCBY] &= ~ptcb->OSTCBBitX) == 0) {
        LDW       X, S:?w4
        ADDW      X, #0x1b
        LD        A, (X)
        CLRW      X
        LD        XL, A
        ADDW      X, (0x1,SP)
        ADDW      X, #0x6
        LDW       Y, X
        LDW       X, S:?w4
        ADDW      X, #0x1c
        LD        A, (X)
        CPL       A
        AND       A, (Y)
        LD        S:?b0, A
        LDW       X, S:?w4
        ADDW      X, #0x1b
        LD        A, (X)
        CLRW      X
        LD        XL, A
        ADDW      X, (0x1,SP)
        ADDW      X, #0x6
        LD        A, S:?b0
        LD        (X), A
        TNZ       S:?b0
        JRNE      L:??OSTaskChangePrio_10
//   93                         pevent->OSEventGrp &= ~ptcb->OSTCBBitY;
        LDW       X, S:?w4
        ADDW      X, #0x1d
        LD        A, (X)
        CPL       A
        LDW       X, (0x1,SP)
        INCW      X
        AND       A, (X)
        LDW       X, (0x1,SP)
        INCW      X
        LD        (X), A
//   94                     }
//   95                     pevent->OSEventGrp    |= bity;              /* Add new priority to wait list       */
??OSTaskChangePrio_10:
        LDW       X, (0x1,SP)
        INCW      X
        LD        A, S:?b15
        OR        A, (X)
        LDW       X, (0x1,SP)
        INCW      X
        LD        (X), A
//   96                     pevent->OSEventTbl[y] |= bitx;
        CLRW      X
        EXG       A, XL
        LD        A, S:?b14
        EXG       A, XL
        ADDW      X, (0x1,SP)
        ADDW      X, #0x6
        LD        A, (0x3,SP)
        OR        A, (X)
        CLRW      X
        EXG       A, XL
        LD        A, S:?b14
        EXG       A, XL
        ADDW      X, (0x1,SP)
        ADDW      X, #0x6
        LD        (X), A
//   97                 }
//   98 #endif
//   99             }
//  100             OSTCBPrioTbl[newprio] = ptcb;                       /* Place pointer to TCB @ new priority */
??OSTaskChangePrio_9:
        CLRW      X
        EXG       A, XL
        LD        A, S:?b11
        EXG       A, XL
        SLLW      X
        LDW       Y, S:?w4
        LDW       (L:OSTCBPrioTbl,X), Y
//  101             ptcb->OSTCBPrio       = newprio;                    /* Set new task priority               */
        LDW       X, S:?w4
        ADDW      X, #0x19
        LD        A, S:?b11
        LD        (X), A
//  102             ptcb->OSTCBY          = y;
        LDW       X, S:?w4
        ADDW      X, #0x1b
        LD        A, S:?b14
        LD        (X), A
//  103             ptcb->OSTCBX          = x;
        LDW       X, S:?w4
        ADDW      X, #0x1a
        LD        A, S:?b13
        LD        (X), A
//  104             ptcb->OSTCBBitY       = bity;
        LDW       X, S:?w4
        ADDW      X, #0x1d
        LD        A, S:?b15
        LD        (X), A
//  105             ptcb->OSTCBBitX       = bitx;
        LDW       X, S:?w4
        ADDW      X, #0x1c
        LD        A, (0x3,SP)
        LD        (X), A
//  106             OS_EXIT_CRITICAL();
        LD        A, S:?b12
        CALL      L:CriticalExit
//  107             OS_Sched();                                         /* Run highest priority task ready     */
        CALL      L:OS_Sched
//  108             return (OS_NO_ERR);
        CLR       A
        JRA       L:??OSTaskChangePrio_3
//  109         } else {
//  110             OSTCBPrioTbl[newprio] = (OS_TCB *)0;                /* Release the reserved prio.          */
??OSTaskChangePrio_6:
        CLRW      X
        EXG       A, XL
        LD        A, S:?b11
        EXG       A, XL
        SLLW      X
        CLRW      Y
        LDW       (L:OSTCBPrioTbl,X), Y
//  111             OS_EXIT_CRITICAL();
        LD        A, S:?b12
        CALL      L:CriticalExit
//  112             return (OS_PRIO_ERR);                               /* Task to change didn't exist         */
        LD        A, #0x29
??OSTaskChangePrio_3:
        ADD       SP, #0x3
        JP        L:?epilogue_l2_l3
//  113         }
//  114     }
//  115 }
//  116 #endif
//  117 /*$PAGE*/
//  118 /*
//  119 *********************************************************************************************************
//  120 *                                            CREATE A TASK
//  121 *
//  122 * Description: This function is used to have uC/OS-II manage the execution of a task.  Tasks can either
//  123 *              be created prior to the start of multitasking or by a running task.  A task cannot be
//  124 *              created by an ISR.
//  125 *
//  126 * Arguments  : task     is a pointer to the task's code
//  127 *
//  128 *              pdata    is a pointer to an optional data area which can be used to pass parameters to
//  129 *                       the task when the task first executes.  Where the task is concerned it thinks
//  130 *                       it was invoked and passed the argument 'pdata' as follows:
//  131 *
//  132 *                           void Task (void *pdata)
//  133 *                           {
//  134 *                               for (;;) {
//  135 *                                   Task code;
//  136 *                               }
//  137 *                           }
//  138 *
//  139 *              ptos     is a pointer to the task's top of stack.  If the configuration constant
//  140 *                       OS_STK_GROWTH is set to 1, the stack is assumed to grow downward (i.e. from high
//  141 *                       memory to low memory).  'pstk' will thus point to the highest (valid) memory
//  142 *                       location of the stack.  If OS_STK_GROWTH is set to 0, 'pstk' will point to the
//  143 *                       lowest memory location of the stack and the stack will grow with increasing
//  144 *                       memory locations.
//  145 *
//  146 *              prio     is the task's priority.  A unique priority MUST be assigned to each task and the
//  147 *                       lower the number, the higher the priority.
//  148 *
//  149 * Returns    : OS_NO_ERR        if the function was successful.
//  150 *              OS_PRIO_EXIT     if the task priority already exist
//  151 *                               (each task MUST have a unique priority).
//  152 *              OS_PRIO_INVALID  if the priority you specify is higher that the maximum allowed
//  153 *                               (i.e. >= OS_LOWEST_PRIO)
//  154 *********************************************************************************************************
//  155 */
//  156 
//  157 #if OS_TASK_CREATE_EN > 0

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  158 INT8U  OSTaskCreate (void (*task)(void *pd), void *pdata, OS_STK *ptos, INT8U prio)
//  159 {
OSTaskCreate:
        CALL      L:?push_l2
        CALL      L:?push_l3
        SUB       SP, #0x3
        LDW       S:?w7, X
        LDW       S:?w6, Y
        CALL      L:?mov_w5_w0
        LD        S:?b8, A
//  160 #if OS_CRITICAL_METHOD == 3                  /* Allocate storage for CPU status register               */
//  161     OS_CPU_SR  cpu_sr;
//  162 #endif
//  163     OS_STK    *psp;
//  164     INT8U      err;
//  165 
//  166 
//  167 #if OS_ARG_CHK_EN > 0
//  168     if (prio > OS_LOWEST_PRIO) {             /* Make sure priority is within allowable range           */
        LD        A, S:?b8
        CP        A, #0x40
        JRC       L:??OSTaskCreate_0
//  169         return (OS_PRIO_INVALID);
        LD        A, #0x2a
        JP        L:??OSTaskCreate_1
//  170     }
//  171 #endif
//  172     OS_ENTER_CRITICAL();
??OSTaskCreate_0:
        CALL      L:CriticalEnter
        LD        S:?b9, A
//  173     if (OSTCBPrioTbl[prio] == (OS_TCB *)0) { /* Make sure task doesn't already exist at this priority  */
        CLRW      X
        EXG       A, XL
        LD        A, S:?b8
        EXG       A, XL
        SLLW      X
        LDW       X, (L:OSTCBPrioTbl,X)
        TNZW      X
        JRNE      L:??OSTaskCreate_2
//  174         OSTCBPrioTbl[prio] = (OS_TCB *)1;    /* Reserve the priority to prevent others from doing ...  */
        CLRW      X
        EXG       A, XL
        LD        A, S:?b8
        EXG       A, XL
        SLLW      X
        LDW       S:?w0, X
        CLRW      X
        INCW      X
        LDW       Y, X
        LDW       X, S:?w0
        LDW       (L:OSTCBPrioTbl,X), Y
//  175                                              /* ... the same thing until task is created.              */
//  176         OS_EXIT_CRITICAL();
        LD        A, S:?b9
        CALL      L:CriticalExit
//  177         psp = (OS_STK *)OSTaskStkInit(task, pdata, ptos, 0);    /* Initialize the task's stack         */
        CLR       S:?b3
        CLR       S:?b2
        CALL      L:?mov_w0_w5
        LDW       Y, S:?w6
        LDW       X, S:?w7
        CALL      L:OSTaskStkInit
        LDW       (0x2,SP), X
//  178         err = OS_TCBInit(prio, psp, (OS_STK *)0, 0, 0, (void *)0, 0);
        PUSH      #0x0
        PUSH      #0x0
        CLR       S:?b3
        CLR       S:?b2
        CLRW      X
        LDW       S:?w3, X
        LDW       S:?w2, X
        CLRW      X
        LDW       S:?w0, X
        CLRW      Y
        LDW       X, (0x4,SP)
        LD        A, S:?b8
        CALL      L:OS_TCBInit
        ADD       SP, #0x2
        LD        (0x1,SP), A
//  179         if (err == OS_NO_ERR) {
        TNZ       (0x1,SP)
        JRNE      L:??OSTaskCreate_3
//  180             OS_ENTER_CRITICAL();
        CALL      L:CriticalEnter
        LD        S:?b9, A
//  181             OSTaskCtr++;                                        /* Increment the #tasks counter        */
        LD        A, L:OSTaskCtr
        ADD       A, #0x1
        LD        L:OSTaskCtr, A
//  182             OS_EXIT_CRITICAL();
        LD        A, S:?b9
        CALL      L:CriticalExit
//  183             if (OSRunning == TRUE) {         /* Find highest priority task if multitasking has started */
        LD        A, L:OSRunning
        CP        A, #0x1
        JRNE      L:??OSTaskCreate_4
//  184                 OS_Sched();
        CALL      L:OS_Sched
        JRA       L:??OSTaskCreate_4
//  185             }
//  186         } else {
//  187             OS_ENTER_CRITICAL();
??OSTaskCreate_3:
        CALL      L:CriticalEnter
        LD        S:?b9, A
//  188             OSTCBPrioTbl[prio] = (OS_TCB *)0;/* Make this priority available to others                 */
        CLRW      X
        EXG       A, XL
        LD        A, S:?b8
        EXG       A, XL
        SLLW      X
        CLRW      Y
        LDW       (L:OSTCBPrioTbl,X), Y
//  189             OS_EXIT_CRITICAL();
        LD        A, S:?b9
        CALL      L:CriticalExit
//  190         }
//  191         return (err);
??OSTaskCreate_4:
        LD        A, (0x1,SP)
        JRA       L:??OSTaskCreate_1
//  192     }
//  193     OS_EXIT_CRITICAL();
??OSTaskCreate_2:
        LD        A, S:?b9
        CALL      L:CriticalExit
//  194     return (OS_PRIO_EXIST);
        LD        A, #0x28
??OSTaskCreate_1:
        ADD       SP, #0x3
        JP        L:?epilogue_l2_l3
//  195 }
//  196 #endif
//  197 /*$PAGE*/
//  198 /*
//  199 *********************************************************************************************************
//  200 *                                     CREATE A TASK (Extended Version)
//  201 *
//  202 * Description: This function is used to have uC/OS-II manage the execution of a task.  Tasks can either
//  203 *              be created prior to the start of multitasking or by a running task.  A task cannot be
//  204 *              created by an ISR.  This function is similar to OSTaskCreate() except that it allows
//  205 *              additional information about a task to be specified.
//  206 *
//  207 * Arguments  : task     is a pointer to the task's code
//  208 *
//  209 *              pdata    is a pointer to an optional data area which can be used to pass parameters to
//  210 *                       the task when the task first executes.  Where the task is concerned it thinks
//  211 *                       it was invoked and passed the argument 'pdata' as follows:
//  212 *
//  213 *                           void Task (void *pdata)
//  214 *                           {
//  215 *                               for (;;) {
//  216 *                                   Task code;
//  217 *                               }
//  218 *                           }
//  219 *
//  220 *              ptos     is a pointer to the task's top of stack.  If the configuration constant
//  221 *                       OS_STK_GROWTH is set to 1, the stack is assumed to grow downward (i.e. from high
//  222 *                       memory to low memory).  'pstk' will thus point to the highest (valid) memory
//  223 *                       location of the stack.  If OS_STK_GROWTH is set to 0, 'pstk' will point to the
//  224 *                       lowest memory location of the stack and the stack will grow with increasing
//  225 *                       memory locations.  'pstk' MUST point to a valid 'free' data item.
//  226 *
//  227 *              prio     is the task's priority.  A unique priority MUST be assigned to each task and the
//  228 *                       lower the number, the higher the priority.
//  229 *
//  230 *              id       is the task's ID (0..65535)
//  231 *
//  232 *              pbos     is a pointer to the task's bottom of stack.  If the configuration constant
//  233 *                       OS_STK_GROWTH is set to 1, the stack is assumed to grow downward (i.e. from high
//  234 *                       memory to low memory).  'pbos' will thus point to the LOWEST (valid) memory
//  235 *                       location of the stack.  If OS_STK_GROWTH is set to 0, 'pbos' will point to the
//  236 *                       HIGHEST memory location of the stack and the stack will grow with increasing
//  237 *                       memory locations.  'pbos' MUST point to a valid 'free' data item.
//  238 *
//  239 *              stk_size is the size of the stack in number of elements.  If OS_STK is set to INT8U,
//  240 *                       'stk_size' corresponds to the number of bytes available.  If OS_STK is set to
//  241 *                       INT16U, 'stk_size' contains the number of 16-bit entries available.  Finally, if
//  242 *                       OS_STK is set to INT32U, 'stk_size' contains the number of 32-bit entries
//  243 *                       available on the stack.
//  244 *
//  245 *              pext     is a pointer to a user supplied memory location which is used as a TCB extension.
//  246 *                       For example, this user memory can hold the contents of floating-point registers
//  247 *                       during a context switch, the time each task takes to execute, the number of times
//  248 *                       the task has been switched-in, etc.
//  249 *
//  250 *              opt      contains additional information (or options) about the behavior of the task.  The
//  251 *                       LOWER 8-bits are reserved by uC/OS-II while the upper 8 bits can be application
//  252 *                       specific.  See OS_TASK_OPT_??? in uCOS-II.H.
//  253 *
//  254 * Returns    : OS_NO_ERR        if the function was successful.
//  255 *              OS_PRIO_EXIT     if the task priority already exist
//  256 *                               (each task MUST have a unique priority).
//  257 *              OS_PRIO_INVALID  if the priority you specify is higher that the maximum allowed
//  258 *                               (i.e. > OS_LOWEST_PRIO)
//  259 *********************************************************************************************************
//  260 */
//  261 /*$PAGE*/
//  262 #if OS_TASK_CREATE_EXT_EN > 0

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  263 INT8U  OSTaskCreateExt (void   (*task)(void *pd),
//  264                         void    *pdata,
//  265                         OS_STK  *ptos,
//  266                         INT8U    prio,
//  267                         INT16U   id,
//  268                         OS_STK  *pbos,
//  269                         INT32U   stk_size,
//  270                         void    *pext,
//  271                         INT16U   opt)
//  272 {
OSTaskCreateExt:
        CALL      L:?push_l2
        CALL      L:?push_l3
        PUSHW     X
        PUSHW     Y
        CALL      L:?push_w0
        CALL      L:?push_w1
        CALL      L:?push_w2
        CALL      L:?push_w3
        SUB       SP, #0x3
        LD        S:?b12, A
        CALL      L:?load32_l2_dbsp
        DATA
        DC8       0x1a
        CODE
        LDW       X, (0x1e,SP)
        LDW       S:?w7, X
//  273 #if OS_CRITICAL_METHOD == 3                  /* Allocate storage for CPU status register               */
//  274     OS_CPU_SR  cpu_sr;
//  275 #endif
//  276     OS_STK    *psp;
//  277     INT8U      err;
//  278 
//  279 
//  280 #if OS_ARG_CHK_EN > 0
//  281     if (prio > OS_LOWEST_PRIO) {             /* Make sure priority is within allowable range           */
        LD        A, S:?b12
        CP        A, #0x40
        JRC       L:??OSTaskCreateExt_0
//  282         return (OS_PRIO_INVALID);
        LD        A, #0x2a
        JP        L:??OSTaskCreateExt_1
//  283     }
//  284 #endif
//  285     OS_ENTER_CRITICAL();
??OSTaskCreateExt_0:
        CALL      L:CriticalEnter
        LD        S:?b13, A
//  286     if (OSTCBPrioTbl[prio] == (OS_TCB *)0) { /* Make sure task doesn't already exist at this priority  */
        CLRW      X
        EXG       A, XL
        LD        A, S:?b12
        EXG       A, XL
        SLLW      X
        LDW       X, (L:OSTCBPrioTbl,X)
        TNZW      X
        JREQ      ??lb_1
        JP        L:??OSTaskCreateExt_2
//  287         OSTCBPrioTbl[prio] = (OS_TCB *)1;    /* Reserve the priority to prevent others from doing ...  */
??lb_1:
        CLRW      X
        EXG       A, XL
        LD        A, S:?b12
        EXG       A, XL
        SLLW      X
        LDW       S:?w0, X
        CLRW      X
        INCW      X
        LDW       Y, X
        LDW       X, S:?w0
        LDW       (L:OSTCBPrioTbl,X), Y
//  288                                              /* ... the same thing until task is created.              */
//  289         OS_EXIT_CRITICAL();
        LD        A, S:?b13
        CALL      L:CriticalExit
//  290 
//  291         if (((opt & OS_TASK_OPT_STK_CHK) != 0x0000) ||   /* See if stack checking has been enabled     */
//  292             ((opt & OS_TASK_OPT_STK_CLR) != 0x0000)) {   /* See if stack needs to be cleared           */
        LDW       X, S:?w7
        RLWA      X, A
        AND       A, #0x0
        RLWA      X, A
        AND       A, #0x3
        RLWA      X, A
        TNZW      X
        JREQ      L:??OSTaskCreateExt_3
//  293             #if OS_STK_GROWTH == 1
//  294             (void)memset(pbos, 0, stk_size * sizeof(OS_STK));
        CALL      L:?mov_w0_w5
        CLRW      Y
        LDW       X, (0x6,SP)
        CALL      L:memset
//  295             #else
//  296             (void)memset(ptos, 0, stk_size * sizeof(OS_STK));
//  297             #endif
//  298         }
//  299 
//  300         psp = (OS_STK *)OSTaskStkInit(task, pdata, ptos, opt); /* Initialize the task's stack          */
??OSTaskCreateExt_3:
        CALL      L:?mov_w1_w7
        LDW       X, (0xa,SP)
        LDW       S:?w0, X
        LDW       Y, (0xc,SP)
        LDW       X, (0xe,SP)
        CALL      L:OSTaskStkInit
        LDW       (0x2,SP), X
//  301         err = OS_TCBInit(prio, psp, pbos, id, stk_size, pext, opt);
        CALL      L:?push_w7
        LDW       X, (0x6,SP)
        LDW       S:?w1, X
        CALL      L:?mov_l1_l2
        LDW       X, (0xa,SP)
        LDW       S:?w0, X
        LDW       X, (0x8,SP)
        LDW       Y, X
        LDW       X, (0x4,SP)
        LD        A, S:?b12
        CALL      L:OS_TCBInit
        ADD       SP, #0x2
        LD        (0x1,SP), A
//  302         if (err == OS_NO_ERR) {
        TNZ       (0x1,SP)
        JRNE      L:??OSTaskCreateExt_4
//  303             OS_ENTER_CRITICAL();
        CALL      L:CriticalEnter
        LD        S:?b13, A
//  304             OSTaskCtr++;                                       /* Increment the #tasks counter         */
        LD        A, L:OSTaskCtr
        ADD       A, #0x1
        LD        L:OSTaskCtr, A
//  305             OS_EXIT_CRITICAL();
        LD        A, S:?b13
        CALL      L:CriticalExit
//  306             if (OSRunning == TRUE) {                           /* Find HPT if multitasking has started */
        LD        A, L:OSRunning
        CP        A, #0x1
        JRNE      L:??OSTaskCreateExt_5
//  307                 OS_Sched();
        CALL      L:OS_Sched
        JRA       L:??OSTaskCreateExt_5
//  308             }
//  309         } else {
//  310             OS_ENTER_CRITICAL();
??OSTaskCreateExt_4:
        CALL      L:CriticalEnter
        LD        S:?b13, A
//  311             OSTCBPrioTbl[prio] = (OS_TCB *)0;                  /* Make this priority avail. to others  */
        CLRW      X
        EXG       A, XL
        LD        A, S:?b12
        EXG       A, XL
        SLLW      X
        CLRW      Y
        LDW       (L:OSTCBPrioTbl,X), Y
//  312             OS_EXIT_CRITICAL();
        LD        A, S:?b13
        CALL      L:CriticalExit
//  313         }
//  314         return (err);
??OSTaskCreateExt_5:
        LD        A, (0x1,SP)
        JRA       L:??OSTaskCreateExt_1
//  315     }
//  316     OS_EXIT_CRITICAL();
??OSTaskCreateExt_2:
        LD        A, S:?b13
        CALL      L:CriticalExit
//  317     return (OS_PRIO_EXIST);
        LD        A, #0x28
??OSTaskCreateExt_1:
        ADD       SP, #0xf
        JP        L:?epilogue_l2_l3
//  318 }
//  319 #endif
//  320 /*$PAGE*/
//  321 /*
//  322 *********************************************************************************************************
//  323 *                                            DELETE A TASK
//  324 *
//  325 * Description: This function allows you to delete a task.  The calling task can delete itself by
//  326 *              its own priority number.  The deleted task is returned to the dormant state and can be
//  327 *              re-activated by creating the deleted task again.
//  328 *
//  329 * Arguments  : prio    is the priority of the task to delete.  Note that you can explicitely delete
//  330 *                      the current task without knowing its priority level by setting 'prio' to
//  331 *                      OS_PRIO_SELF.
//  332 *
//  333 * Returns    : OS_NO_ERR           if the call is successful
//  334 *              OS_TASK_DEL_IDLE    if you attempted to delete uC/OS-II's idle task
//  335 *              OS_PRIO_INVALID     if the priority you specify is higher that the maximum allowed
//  336 *                                  (i.e. >= OS_LOWEST_PRIO) or, you have not specified OS_PRIO_SELF.
//  337 *              OS_TASK_DEL_ERR     if the task you want to delete does not exist
//  338 *              OS_TASK_DEL_ISR     if you tried to delete a task from an ISR
//  339 *
//  340 * Notes      : 1) To reduce interrupt latency, OSTaskDel() 'disables' the task:
//  341 *                    a) by making it not ready
//  342 *                    b) by removing it from any wait lists
//  343 *                    c) by preventing OSTimeTick() from making the task ready to run.
//  344 *                 The task can then be 'unlinked' from the miscellaneous structures in uC/OS-II.
//  345 *              2) The function OS_Dummy() is called after OS_EXIT_CRITICAL() because, on most processors,
//  346 *                 the next instruction following the enable interrupt instruction is ignored.  
//  347 *              3) An ISR cannot delete a task.
//  348 *              4) The lock nesting counter is incremented because, for a brief instant, if the current
//  349 *                 task is being deleted, the current task would not be able to be rescheduled because it
//  350 *                 is removed from the ready list.  Incrementing the nesting counter prevents another task
//  351 *                 from being schedule.  This means that an ISR would return to the current task which is
//  352 *                 being deleted.  The rest of the deletion would thus be able to be completed.
//  353 *********************************************************************************************************
//  354 */
//  355 /*$PAGE*/
//  356 #if OS_TASK_DEL_EN > 0

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  357 INT8U  OSTaskDel (INT8U prio)
//  358 {
OSTaskDel:
        CALL      L:?push_l2
        CALL      L:?push_w6
        LD        S:?b10, A
//  359 #if OS_CRITICAL_METHOD == 3                      /* Allocate storage for CPU status register           */
//  360     OS_CPU_SR     cpu_sr;
//  361 #endif
//  362 
//  363 #if OS_EVENT_EN > 0
//  364     OS_EVENT     *pevent;
//  365 #endif    
//  366 #if (OS_VERSION >= 251) && (OS_FLAG_EN > 0) && (OS_MAX_FLAGS > 0)
//  367     OS_FLAG_NODE *pnode;
//  368 #endif
//  369     OS_TCB       *ptcb;
//  370     BOOLEAN       self;
//  371 
//  372 
//  373 
//  374     if (OSIntNesting > 0) {                                     /* See if trying to delete from ISR    */
        LD        A, L:OSIntNesting
        CP        A, #0x0
        JREQ      L:??OSTaskDel_0
//  375         return (OS_TASK_DEL_ISR);
        LD        A, #0x3f
        JP        L:??OSTaskDel_1
//  376     }
//  377 #if OS_ARG_CHK_EN > 0
//  378     if (prio == OS_IDLE_PRIO) {                                 /* Not allowed to delete idle task     */
??OSTaskDel_0:
        LD        A, S:?b10
        CP        A, #0x3f
        JRNE      L:??OSTaskDel_2
//  379         return (OS_TASK_DEL_IDLE);
        LD        A, #0x3d
        JP        L:??OSTaskDel_1
//  380     }
//  381     if (prio >= OS_LOWEST_PRIO && prio != OS_PRIO_SELF) {       /* Task priority valid ?               */
??OSTaskDel_2:
        LD        A, S:?b10
        CP        A, #0x3f
        JRC       L:??OSTaskDel_3
        LD        A, S:?b10
        CP        A, #0xff
        JREQ      L:??OSTaskDel_3
//  382         return (OS_PRIO_INVALID);
        LD        A, #0x2a
        JP        L:??OSTaskDel_1
//  383     }
//  384 #endif
//  385     OS_ENTER_CRITICAL();
??OSTaskDel_3:
        CALL      L:CriticalEnter
        LD        S:?b11, A
//  386     if (prio == OS_PRIO_SELF) {                                 /* See if requesting to delete self    */
        LD        A, S:?b10
        CP        A, #0xff
        JRNE      L:??OSTaskDel_4
//  387         prio = OSTCBCur->OSTCBPrio;                             /* Set priority to delete to current   */
        LDW       X, L:OSTCBCur
        ADDW      X, #0x19
        LD        A, (X)
        LD        S:?b10, A
//  388     }
//  389     ptcb = OSTCBPrioTbl[prio];
??OSTaskDel_4:
        CLRW      X
        EXG       A, XL
        LD        A, S:?b10
        EXG       A, XL
        SLLW      X
        LDW       X, (L:OSTCBPrioTbl,X)
        LDW       S:?w4, X
//  390     if (ptcb != (OS_TCB *)0) {                                       /* Task to delete must exist      */
        LDW       X, S:?w4
        TNZW      X
        JRNE      ??lb_0
        JP        L:??OSTaskDel_5
//  391         if ((OSRdyTbl[ptcb->OSTCBY] &= ~ptcb->OSTCBBitX) == 0x00) {  /* Make task not ready            */
??lb_0:
        LDW       X, S:?w4
        ADDW      X, #0x1b
        LD        A, (X)
        CLRW      X
        LD        XL, A
        LDW       Y, X
        LDW       X, S:?w4
        ADDW      X, #0x1c
        LD        A, (X)
        CPL       A
        LDW       X, Y
        AND       A, (L:OSRdyTbl,X)
        LD        S:?b0, A
        LDW       X, S:?w4
        ADDW      X, #0x1b
        LD        A, (X)
        CLRW      X
        LD        XL, A
        LD        A, S:?b0
        LD        (L:OSRdyTbl,X), A
        TNZ       S:?b0
        JRNE      L:??OSTaskDel_6
//  392             OSRdyGrp &= ~ptcb->OSTCBBitY;
        LDW       X, S:?w4
        ADDW      X, #0x1d
        LD        A, (X)
        CPL       A
        AND       A, L:OSRdyGrp
        LD        L:OSRdyGrp, A
//  393         }
//  394 #if OS_EVENT_EN > 0
//  395         pevent = ptcb->OSTCBEventPtr;
??OSTaskDel_6:
        LDW       X, S:?w4
        ADDW      X, #0x12
        LDW       X, (X)
        LDW       S:?w6, X
//  396         if (pevent != (OS_EVENT *)0) {                          /* If task is waiting on event         */
        LDW       X, S:?w6
        TNZW      X
        JREQ      L:??OSTaskDel_7
//  397             if ((pevent->OSEventTbl[ptcb->OSTCBY] &= ~ptcb->OSTCBBitX) == 0) { /* ... remove task from */
        LDW       X, S:?w4
        ADDW      X, #0x1b
        LD        A, (X)
        CLRW      X
        LD        XL, A
        ADDW      X, S:?w6
        ADDW      X, #0x6
        LDW       Y, X
        LDW       X, S:?w4
        ADDW      X, #0x1c
        LD        A, (X)
        CPL       A
        AND       A, (Y)
        LD        S:?b0, A
        LDW       X, S:?w4
        ADDW      X, #0x1b
        LD        A, (X)
        CLRW      X
        LD        XL, A
        ADDW      X, S:?w6
        ADDW      X, #0x6
        LD        A, S:?b0
        LD        (X), A
        TNZ       S:?b0
        JRNE      L:??OSTaskDel_7
//  398                 pevent->OSEventGrp &= ~ptcb->OSTCBBitY;                        /* ... event ctrl block */
        LDW       X, S:?w4
        ADDW      X, #0x1d
        LD        A, (X)
        CPL       A
        LDW       X, S:?w6
        INCW      X
        AND       A, (X)
        LDW       X, S:?w6
        INCW      X
        LD        (X), A
//  399             }
//  400         }
//  401 #endif
//  402 #if (OS_VERSION >= 251) && (OS_FLAG_EN > 0) && (OS_MAX_FLAGS > 0)
//  403         pnode = ptcb->OSTCBFlagNode;
//  404         if (pnode != (OS_FLAG_NODE *)0) {                       /* If task is waiting on event flag    */
//  405             OS_FlagUnlink(pnode);                               /* Remove from wait list               */
//  406         }
//  407 #endif
//  408         ptcb->OSTCBDly  = 0;                                    /* Prevent OSTimeTick() from updating  */
??OSTaskDel_7:
        LDW       X, S:?w4
        ADDW      X, #0x16
        LDW       Y, X
        CLRW      X
        LDW       (Y), X
//  409         ptcb->OSTCBStat = OS_STAT_RDY;                          /* Prevent task from being resumed     */
        LDW       X, S:?w4
        ADDW      X, #0x18
        CLR       A
        LD        (X), A
//  410 		if (OSLockNesting < 255) {
        LD        A, L:OSLockNesting
        CP        A, #0xff
        JREQ      L:??OSTaskDel_8
//  411             OSLockNesting++;
        LD        A, L:OSLockNesting
        ADD       A, #0x1
        LD        L:OSLockNesting, A
//  412 		}
//  413         OS_EXIT_CRITICAL();                                     /* Enabling INT. ignores next instruc. */
??OSTaskDel_8:
        LD        A, S:?b11
        CALL      L:CriticalExit
//  414         OS_Dummy();                                             /* ... Dummy ensures that INTs will be */
        CALL      L:OS_Dummy
//  415         OS_ENTER_CRITICAL();                                    /* ... disabled HERE!                  */
        CALL      L:CriticalEnter
        LD        S:?b11, A
//  416 		if (OSLockNesting > 0) {
        LD        A, L:OSLockNesting
        CP        A, #0x0
        JREQ      L:??OSTaskDel_9
//  417             OSLockNesting--;
        LD        A, L:OSLockNesting
        ADD       A, #0xff
        LD        L:OSLockNesting, A
//  418 		}
//  419         OSTaskDelHook(ptcb);                                    /* Call user defined hook              */
??OSTaskDel_9:
        LDW       X, S:?w4
        CALL      L:OSTaskDelHook
//  420         OSTaskCtr--;                                            /* One less task being managed         */
        LD        A, L:OSTaskCtr
        ADD       A, #0xff
        LD        L:OSTaskCtr, A
//  421         OSTCBPrioTbl[prio] = (OS_TCB *)0;                       /* Clear old priority entry            */
        CLRW      X
        EXG       A, XL
        LD        A, S:?b10
        EXG       A, XL
        SLLW      X
        CLRW      Y
        LDW       (L:OSTCBPrioTbl,X), Y
//  422         if (ptcb->OSTCBPrev == (OS_TCB *)0) {                   /* Remove from TCB chain               */
        LDW       X, S:?w4
        ADDW      X, #0x10
        LDW       X, (X)
        TNZW      X
        JRNE      L:??OSTaskDel_10
//  423             ptcb->OSTCBNext->OSTCBPrev = (OS_TCB *)0;
        LDW       X, S:?w4
        ADDW      X, #0xe
        LDW       X, (X)
        ADDW      X, #0x10
        LDW       Y, X
        CLRW      X
        LDW       (Y), X
//  424             OSTCBList                  = ptcb->OSTCBNext;
        LDW       X, S:?w4
        ADDW      X, #0xe
        LDW       X, (X)
        LDW       L:OSTCBList, X
        JRA       L:??OSTaskDel_11
//  425         } else {
//  426             ptcb->OSTCBPrev->OSTCBNext = ptcb->OSTCBNext;
??OSTaskDel_10:
        LDW       X, S:?w4
        ADDW      X, #0x10
        LDW       X, (X)
        ADDW      X, #0xe
        LDW       Y, X
        LDW       X, S:?w4
        ADDW      X, #0xe
        LDW       X, (X)
        LDW       (Y), X
//  427             ptcb->OSTCBNext->OSTCBPrev = ptcb->OSTCBPrev;
        LDW       X, S:?w4
        ADDW      X, #0xe
        LDW       X, (X)
        ADDW      X, #0x10
        LDW       Y, X
        LDW       X, S:?w4
        ADDW      X, #0x10
        LDW       X, (X)
        LDW       (Y), X
//  428         }
//  429         ptcb->OSTCBNext = OSTCBFreeList;                        /* Return TCB to free TCB list         */
??OSTaskDel_11:
        LDW       X, S:?w4
        ADDW      X, #0xe
        LDW       Y, X
        LDW       X, L:OSTCBFreeList
        LDW       (Y), X
//  430         OSTCBFreeList   = ptcb;
        LDW       X, S:?w4
        LDW       L:OSTCBFreeList, X
//  431         OS_EXIT_CRITICAL();
        LD        A, S:?b11
        CALL      L:CriticalExit
//  432         OS_Sched();                                             /* Find new highest priority task      */
        CALL      L:OS_Sched
//  433         return (OS_NO_ERR);
        CLR       A
        JRA       L:??OSTaskDel_1
//  434     }
//  435     OS_EXIT_CRITICAL();
??OSTaskDel_5:
        LD        A, S:?b11
        CALL      L:CriticalExit
//  436     return (OS_TASK_DEL_ERR);
        LD        A, #0x3c
??OSTaskDel_1:
        JP        L:?epilogue_l2_w6
//  437 }
//  438 #endif
//  439 /*$PAGE*/
//  440 /*
//  441 *********************************************************************************************************
//  442 *                                    REQUEST THAT A TASK DELETE ITSELF
//  443 *
//  444 * Description: This function is used to:
//  445 *                   a) notify a task to delete itself.
//  446 *                   b) to see if a task requested that the current task delete itself.
//  447 *              This function is a little tricky to understand.  Basically, you have a task that needs
//  448 *              to be deleted however, this task has resources that it has allocated (memory buffers,
//  449 *              semaphores, mailboxes, queues etc.).  The task cannot be deleted otherwise these
//  450 *              resources would not be freed.  The requesting task calls OSTaskDelReq() to indicate that
//  451 *              the task needs to be deleted.  Deleting of the task is however, deferred to the task to
//  452 *              be deleted.  For example, suppose that task #10 needs to be deleted.  The requesting task
//  453 *              example, task #5, would call OSTaskDelReq(10).  When task #10 gets to execute, it calls
//  454 *              this function by specifying OS_PRIO_SELF and monitors the returned value.  If the return
//  455 *              value is OS_TASK_DEL_REQ, another task requested a task delete.  Task #10 would look like
//  456 *              this:
//  457 *
//  458 *                   void Task(void *data)
//  459 *                   {
//  460 *                       .
//  461 *                       .
//  462 *                       while (1) {
//  463 *                           OSTimeDly(1);
//  464 *                           if (OSTaskDelReq(OS_PRIO_SELF) == OS_TASK_DEL_REQ) {
//  465 *                               Release any owned resources;
//  466 *                               De-allocate any dynamic memory;
//  467 *                               OSTaskDel(OS_PRIO_SELF);
//  468 *                           }
//  469 *                       }
//  470 *                   }
//  471 *
//  472 * Arguments  : prio    is the priority of the task to request the delete from
//  473 *
//  474 * Returns    : OS_NO_ERR          if the task exist and the request has been registered
//  475 *              OS_TASK_NOT_EXIST  if the task has been deleted.  This allows the caller to know whether
//  476 *                                 the request has been executed.
//  477 *              OS_TASK_DEL_IDLE   if you requested to delete uC/OS-II's idle task
//  478 *              OS_PRIO_INVALID    if the priority you specify is higher that the maximum allowed
//  479 *                                 (i.e. >= OS_LOWEST_PRIO) or, you have not specified OS_PRIO_SELF.
//  480 *              OS_TASK_DEL_REQ    if a task (possibly another task) requested that the running task be
//  481 *                                 deleted.
//  482 *********************************************************************************************************
//  483 */
//  484 /*$PAGE*/
//  485 #if OS_TASK_DEL_EN > 0

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  486 INT8U  OSTaskDelReq (INT8U prio)
//  487 {
OSTaskDelReq:
        CALL      L:?push_l2
        CALL      L:?push_w6
        LD        S:?b10, A
//  488 #if OS_CRITICAL_METHOD == 3                      /* Allocate storage for CPU status register           */
//  489     OS_CPU_SR  cpu_sr;
//  490 #endif
//  491     BOOLEAN    stat;
//  492     INT8U      err;
//  493     OS_TCB    *ptcb;
//  494 
//  495 
//  496 #if OS_ARG_CHK_EN > 0
//  497     if (prio == OS_IDLE_PRIO) {                                 /* Not allowed to delete idle task     */
        LD        A, S:?b10
        CP        A, #0x3f
        JRNE      L:??OSTaskDelReq_0
//  498         return (OS_TASK_DEL_IDLE);
        LD        A, #0x3d
        JRA       L:??OSTaskDelReq_1
//  499     }
//  500     if (prio >= OS_LOWEST_PRIO && prio != OS_PRIO_SELF) {       /* Task priority valid ?               */
??OSTaskDelReq_0:
        LD        A, S:?b10
        CP        A, #0x3f
        JRC       L:??OSTaskDelReq_2
        LD        A, S:?b10
        CP        A, #0xff
        JREQ      L:??OSTaskDelReq_2
//  501         return (OS_PRIO_INVALID);
        LD        A, #0x2a
        JRA       L:??OSTaskDelReq_1
//  502     }
//  503 #endif
//  504     if (prio == OS_PRIO_SELF) {                                 /* See if a task is requesting to ...  */
??OSTaskDelReq_2:
        LD        A, S:?b10
        CP        A, #0xff
        JRNE      L:??OSTaskDelReq_3
//  505         OS_ENTER_CRITICAL();                                    /* ... this task to delete itself      */
        CALL      L:CriticalEnter
        LD        S:?b11, A
//  506         stat = OSTCBCur->OSTCBDelReq;                           /* Return request status to caller     */
        LDW       X, L:OSTCBCur
        ADDW      X, #0x1e
        LD        A, (X)
        LD        S:?b13, A
//  507         OS_EXIT_CRITICAL();
        LD        A, S:?b11
        CALL      L:CriticalExit
//  508         return (stat);
        LD        A, S:?b13
        JRA       L:??OSTaskDelReq_1
//  509     }
//  510     OS_ENTER_CRITICAL();
??OSTaskDelReq_3:
        CALL      L:CriticalEnter
        LD        S:?b11, A
//  511     ptcb = OSTCBPrioTbl[prio];
        CLRW      X
        EXG       A, XL
        LD        A, S:?b10
        EXG       A, XL
        SLLW      X
        LDW       X, (L:OSTCBPrioTbl,X)
        LDW       S:?w4, X
//  512     if (ptcb != (OS_TCB *)0) {                                  /* Task to delete must exist           */
        LDW       X, S:?w4
        TNZW      X
        JREQ      L:??OSTaskDelReq_4
//  513         ptcb->OSTCBDelReq = OS_TASK_DEL_REQ;                    /* Set flag indicating task to be DEL. */
        LDW       X, S:?w4
        ADDW      X, #0x1e
        LD        A, #0x3e
        LD        (X), A
//  514         err               = OS_NO_ERR;
        CLR       A
        LD        S:?b12, A
        JRA       L:??OSTaskDelReq_5
//  515     } else {
//  516         err               = OS_TASK_NOT_EXIST;                  /* Task must be deleted                */
??OSTaskDelReq_4:
        LD        A, #0xb
        LD        S:?b12, A
//  517     }
//  518     OS_EXIT_CRITICAL();
??OSTaskDelReq_5:
        LD        A, S:?b11
        CALL      L:CriticalExit
//  519     return (err);
        LD        A, S:?b12
??OSTaskDelReq_1:
        JP        L:?epilogue_l2_w6
//  520 }
//  521 #endif
//  522 /*$PAGE*/
//  523 /*
//  524 *********************************************************************************************************
//  525 *                                        RESUME A SUSPENDED TASK
//  526 *
//  527 * Description: This function is called to resume a previously suspended task.  This is the only call that
//  528 *              will remove an explicit task suspension.
//  529 *
//  530 * Arguments  : prio     is the priority of the task to resume.
//  531 *
//  532 * Returns    : OS_NO_ERR                if the requested task is resumed
//  533 *              OS_PRIO_INVALID          if the priority you specify is higher that the maximum allowed
//  534 *                                       (i.e. >= OS_LOWEST_PRIO)
//  535 *              OS_TASK_RESUME_PRIO      if the task to resume does not exist
//  536 *              OS_TASK_NOT_SUSPENDED    if the task to resume has not been suspended
//  537 *********************************************************************************************************
//  538 */
//  539 
//  540 #if OS_TASK_SUSPEND_EN > 0

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  541 INT8U  OSTaskResume (INT8U prio)
//  542 {
OSTaskResume:
        CALL      L:?push_l2
        LD        S:?b10, A
//  543 #if OS_CRITICAL_METHOD == 3                      /* Allocate storage for CPU status register           */
//  544     OS_CPU_SR  cpu_sr;
//  545 #endif
//  546     OS_TCB    *ptcb;
//  547 
//  548 
//  549 #if OS_ARG_CHK_EN > 0
//  550     if (prio >= OS_LOWEST_PRIO) {                               /* Make sure task priority is valid    */
        LD        A, S:?b10
        CP        A, #0x3f
        JRC       L:??OSTaskResume_0
//  551         return (OS_PRIO_INVALID);
        LD        A, #0x2a
        JP        L:??OSTaskResume_1
//  552     }
//  553 #endif
//  554     OS_ENTER_CRITICAL();
??OSTaskResume_0:
        CALL      L:CriticalEnter
        LD        S:?b11, A
//  555     ptcb = OSTCBPrioTbl[prio];
        CLRW      X
        EXG       A, XL
        LD        A, S:?b10
        EXG       A, XL
        SLLW      X
        LDW       X, (L:OSTCBPrioTbl,X)
        LDW       S:?w4, X
//  556     if (ptcb == (OS_TCB *)0) {                                  /* Task to suspend must exist          */
        LDW       X, S:?w4
        TNZW      X
        JRNE      L:??OSTaskResume_2
//  557         OS_EXIT_CRITICAL();
        LD        A, S:?b11
        CALL      L:CriticalExit
//  558         return (OS_TASK_RESUME_PRIO);
        LD        A, #0x64
        JRA       L:??OSTaskResume_1
//  559     }
//  560     if ((ptcb->OSTCBStat & OS_STAT_SUSPEND) != OS_STAT_RDY) {              /* Task must be suspended   */
??OSTaskResume_2:
        LDW       X, S:?w4
        ADDW      X, #0x18
        LD        A, (X)
        AND       A, #0x8
        CP        A, #0x0
        JREQ      L:??OSTaskResume_3
//  561         if (((ptcb->OSTCBStat &= ~OS_STAT_SUSPEND) == OS_STAT_RDY) &&      /* Remove suspension        */
//  562              (ptcb->OSTCBDly  == 0)) {                                     /* Must not be delayed      */
        LDW       X, S:?w4
        ADDW      X, #0x18
        LD        A, (X)
        AND       A, #0xf7
        LDW       X, S:?w4
        ADDW      X, #0x18
        LD        (X), A
        TNZ       A
        JRNE      L:??OSTaskResume_4
        LDW       X, S:?w4
        ADDW      X, #0x16
        LDW       X, (X)
        TNZW      X
        JRNE      L:??OSTaskResume_4
//  563             OSRdyGrp               |= ptcb->OSTCBBitY;                     /* Make task ready to run   */
        LDW       X, S:?w4
        ADDW      X, #0x1d
        LD        A, (X)
        OR        A, L:OSRdyGrp
        LD        L:OSRdyGrp, A
//  564             OSRdyTbl[ptcb->OSTCBY] |= ptcb->OSTCBBitX;
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
//  565             OS_EXIT_CRITICAL();
        LD        A, S:?b11
        CALL      L:CriticalExit
//  566             OS_Sched();
        CALL      L:OS_Sched
        JRA       L:??OSTaskResume_5
//  567         } else {
//  568             OS_EXIT_CRITICAL();
??OSTaskResume_4:
        LD        A, S:?b11
        CALL      L:CriticalExit
//  569         }
//  570         return (OS_NO_ERR);
??OSTaskResume_5:
        CLR       A
        JRA       L:??OSTaskResume_1
//  571     }
//  572     OS_EXIT_CRITICAL();
??OSTaskResume_3:
        LD        A, S:?b11
        CALL      L:CriticalExit
//  573     return (OS_TASK_NOT_SUSPENDED);
        LD        A, #0x65
??OSTaskResume_1:
        JP        L:?epilogue_l2
//  574 }
//  575 #endif
//  576 /*$PAGE*/
//  577 /*
//  578 *********************************************************************************************************
//  579 *                                             STACK CHECKING
//  580 *
//  581 * Description: This function is called to check the amount of free memory left on the specified task's
//  582 *              stack.
//  583 *
//  584 * Arguments  : prio     is the task priority
//  585 *
//  586 *              pdata    is a pointer to a data structure of type OS_STK_DATA.
//  587 *
//  588 * Returns    : OS_NO_ERR           upon success
//  589 *              OS_PRIO_INVALID     if the priority you specify is higher that the maximum allowed
//  590 *                                  (i.e. > OS_LOWEST_PRIO) or, you have not specified OS_PRIO_SELF.
//  591 *              OS_TASK_NOT_EXIST   if the desired task has not been created
//  592 *              OS_TASK_OPT_ERR     if you did NOT specified OS_TASK_OPT_STK_CHK when the task was created
//  593 *********************************************************************************************************
//  594 */
//  595 #if OS_TASK_CREATE_EXT_EN > 0

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  596 INT8U  OSTaskStkChk (INT8U prio, OS_STK_DATA *pdata)
//  597 {
OSTaskStkChk:
        CALL      L:?push_l2
        CALL      L:?push_l3
        SUB       SP, #0x8
        LD        S:?b14, A
        LDW       S:?w6, X
//  598 #if OS_CRITICAL_METHOD == 3                      /* Allocate storage for CPU status register           */
//  599     OS_CPU_SR  cpu_sr;
//  600 #endif
//  601     OS_TCB    *ptcb;
//  602     OS_STK    *pchk;
//  603     INT32U     free;
//  604     INT32U     size;
//  605 
//  606 
//  607 #if OS_ARG_CHK_EN > 0
//  608     if (prio > OS_LOWEST_PRIO && prio != OS_PRIO_SELF) {        /* Make sure task priority is valid    */
        LD        A, S:?b14
        CP        A, #0x40
        JRC       L:??OSTaskStkChk_0
        LD        A, S:?b14
        CP        A, #0xff
        JREQ      L:??OSTaskStkChk_0
//  609         return (OS_PRIO_INVALID);
        LD        A, #0x2a
        JP        L:??OSTaskStkChk_1
//  610     }
//  611 #endif
//  612     pdata->OSFree = 0;                                          /* Assume failure, set to 0 size       */
??OSTaskStkChk_0:
        CLRW      X
        LDW       S:?w1, X
        LDW       S:?w0, X
        LDW       X, S:?w6
        CALL      L:?load32_0x_l0
//  613     pdata->OSUsed = 0;
        LDW       X, S:?w6
        ADDW      X, #0x4
        LDW       Y, X
        CLRW      X
        LDW       S:?w1, X
        LDW       S:?w0, X
        LDW       X, Y
        CALL      L:?load32_0x_l0
//  614     OS_ENTER_CRITICAL();
        CALL      L:CriticalEnter
        LD        S:?b15, A
//  615     if (prio == OS_PRIO_SELF) {                        /* See if check for SELF                        */
        LD        A, S:?b14
        CP        A, #0xff
        JRNE      L:??OSTaskStkChk_2
//  616         prio = OSTCBCur->OSTCBPrio;
        LDW       X, L:OSTCBCur
        ADDW      X, #0x19
        LD        A, (X)
        LD        S:?b14, A
//  617     }
//  618     ptcb = OSTCBPrioTbl[prio];
??OSTaskStkChk_2:
        CLRW      X
        EXG       A, XL
        LD        A, S:?b14
        EXG       A, XL
        SLLW      X
        LDW       X, (L:OSTCBPrioTbl,X)
        LDW       (0x1,SP), X
//  619     if (ptcb == (OS_TCB *)0) {                         /* Make sure task exist                         */
        LDW       X, (0x1,SP)
        TNZW      X
        JRNE      L:??OSTaskStkChk_3
//  620         OS_EXIT_CRITICAL();
        LD        A, S:?b15
        CALL      L:CriticalExit
//  621         return (OS_TASK_NOT_EXIST);
        LD        A, #0xb
        JRA       L:??OSTaskStkChk_1
//  622     }
//  623     if ((ptcb->OSTCBOpt & OS_TASK_OPT_STK_CHK) == 0) { /* Make sure stack checking option is set       */
??OSTaskStkChk_3:
        LDW       X, (0x1,SP)
        ADDW      X, #0xa
        LDW       X, (X)
        LD        A, XL
        AND       A, #0x1
        CP        A, #0x0
        JRNE      L:??OSTaskStkChk_4
//  624         OS_EXIT_CRITICAL();
        LD        A, S:?b15
        CALL      L:CriticalExit
//  625         return (OS_TASK_OPT_ERR);
        LD        A, #0x82
        JRA       L:??OSTaskStkChk_1
//  626     }
//  627     free = 0;
??OSTaskStkChk_4:
        CLRW      X
        LDW       S:?w1, X
        LDW       S:?w0, X
        CALL      L:?mov_l2_l0
//  628     size = ptcb->OSTCBStkSize;
        LDW       X, (0x1,SP)
        ADDW      X, #0x6
        CALL      L:?load32_l0_0x
        CALL      L:?load32_dbsp_l0
        DATA
        DC8       0x5
        CODE
//  629     pchk = ptcb->OSTCBStkBottom;
        LDW       X, (0x1,SP)
        ADDW      X, #0x4
        LDW       X, (X)
        LDW       (0x3,SP), X
//  630     OS_EXIT_CRITICAL();
        LD        A, S:?b15
        CALL      L:CriticalExit
//  631 #if OS_STK_GROWTH == 1
//  632     while (*pchk++ == (OS_STK)0) {                    /* Compute the number of zero entries on the stk */
??OSTaskStkChk_5:
        LDW       X, (0x3,SP)
        LDW       Y, X
        LDW       X, Y
        INCW      X
        LDW       (0x3,SP), X
        TNZ       (Y)
        JRNE      L:??OSTaskStkChk_6
//  633         free++;
        CALL      L:?inc32_l2_l2
        JRA       L:??OSTaskStkChk_5
//  634     }
//  635 #else
//  636     while (*pchk-- == (OS_STK)0) {
//  637         free++;
//  638     }
//  639 #endif
//  640     pdata->OSFree = free * sizeof(OS_STK);            /* Compute number of free bytes on the stack     */
??OSTaskStkChk_6:
        LDW       X, S:?w6
        CALL      L:?load32_0x_l2
//  641     pdata->OSUsed = (size - free) * sizeof(OS_STK);   /* Compute number of bytes used on the stack     */
        CALL      L:?load32_l0_dbsp
        DATA
        DC8       0x5
        CODE
        CALL      L:?mov_l1_l2
        CALL      L:?sub32_l0_l0_l1
        LDW       X, S:?w6
        ADDW      X, #0x4
        CALL      L:?load32_0x_l0
//  642     return (OS_NO_ERR);
        CLR       A
??OSTaskStkChk_1:
        ADD       SP, #0x8
        JP        L:?epilogue_l2_l3
//  643 }
//  644 #endif
//  645 /*$PAGE*/
//  646 /*
//  647 *********************************************************************************************************
//  648 *                                            SUSPEND A TASK
//  649 *
//  650 * Description: This function is called to suspend a task.  The task can be the calling task if the
//  651 *              priority passed to OSTaskSuspend() is the priority of the calling task or OS_PRIO_SELF.
//  652 *
//  653 * Arguments  : prio     is the priority of the task to suspend.  If you specify OS_PRIO_SELF, the
//  654 *                       calling task will suspend itself and rescheduling will occur.
//  655 *
//  656 * Returns    : OS_NO_ERR                if the requested task is suspended
//  657 *              OS_TASK_SUSPEND_IDLE     if you attempted to suspend the idle task which is not allowed.
//  658 *              OS_PRIO_INVALID          if the priority you specify is higher that the maximum allowed
//  659 *                                       (i.e. >= OS_LOWEST_PRIO) or, you have not specified OS_PRIO_SELF.
//  660 *              OS_TASK_SUSPEND_PRIO     if the task to suspend does not exist
//  661 *
//  662 * Note       : You should use this function with great care.  If you suspend a task that is waiting for
//  663 *              an event (i.e. a message, a semaphore, a queue ...) you will prevent this task from
//  664 *              running when the event arrives.
//  665 *********************************************************************************************************
//  666 */
//  667 
//  668 #if OS_TASK_SUSPEND_EN > 0

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  669 INT8U  OSTaskSuspend (INT8U prio)
//  670 {
OSTaskSuspend:
        CALL      L:?push_l2
        PUSH      S:?b12
        LD        S:?b12, A
//  671 #if OS_CRITICAL_METHOD == 3                      /* Allocate storage for CPU status register           */
//  672     OS_CPU_SR  cpu_sr;
//  673 #endif
//  674     BOOLEAN    self;
//  675     OS_TCB    *ptcb;
//  676 
//  677 
//  678 #if OS_ARG_CHK_EN > 0
//  679     if (prio == OS_IDLE_PRIO) {                                 /* Not allowed to suspend idle task    */
        LD        A, S:?b12
        CP        A, #0x3f
        JRNE      L:??OSTaskSuspend_0
//  680         return (OS_TASK_SUSPEND_IDLE);
        LD        A, #0x5b
        JP        L:??OSTaskSuspend_1
//  681     }
//  682     if (prio >= OS_LOWEST_PRIO && prio != OS_PRIO_SELF) {       /* Task priority valid ?               */
??OSTaskSuspend_0:
        LD        A, S:?b12
        CP        A, #0x3f
        JRC       L:??OSTaskSuspend_2
        LD        A, S:?b12
        CP        A, #0xff
        JREQ      L:??OSTaskSuspend_2
//  683         return (OS_PRIO_INVALID);
        LD        A, #0x2a
        JP        L:??OSTaskSuspend_1
//  684     }
//  685 #endif
//  686     OS_ENTER_CRITICAL();
??OSTaskSuspend_2:
        CALL      L:CriticalEnter
        LD        S:?b10, A
//  687     if (prio == OS_PRIO_SELF) {                                 /* See if suspend SELF                 */
        LD        A, S:?b12
        CP        A, #0xff
        JRNE      L:??OSTaskSuspend_3
//  688         prio = OSTCBCur->OSTCBPrio;
        LDW       X, L:OSTCBCur
        ADDW      X, #0x19
        LD        A, (X)
        LD        S:?b12, A
//  689         self = TRUE;
        LD        A, #0x1
        LD        S:?b11, A
        JRA       L:??OSTaskSuspend_4
//  690     } else if (prio == OSTCBCur->OSTCBPrio) {                   /* See if suspending self              */
??OSTaskSuspend_3:
        LDW       X, L:OSTCBCur
        ADDW      X, #0x19
        LD        A, (X)
        CP        A, S:?b12
        JRNE      L:??OSTaskSuspend_5
//  691         self = TRUE;
        LD        A, #0x1
        LD        S:?b11, A
        JRA       L:??OSTaskSuspend_4
//  692     } else {
//  693         self = FALSE;                                           /* No suspending another task          */
??OSTaskSuspend_5:
        CLR       A
        LD        S:?b11, A
//  694     }
//  695     ptcb = OSTCBPrioTbl[prio];
??OSTaskSuspend_4:
        CLRW      X
        EXG       A, XL
        LD        A, S:?b12
        EXG       A, XL
        SLLW      X
        LDW       X, (L:OSTCBPrioTbl,X)
        LDW       S:?w4, X
//  696     if (ptcb == (OS_TCB *)0) {                                  /* Task to suspend must exist          */
        LDW       X, S:?w4
        TNZW      X
        JRNE      L:??OSTaskSuspend_6
//  697         OS_EXIT_CRITICAL();
        LD        A, S:?b10
        CALL      L:CriticalExit
//  698         return (OS_TASK_SUSPEND_PRIO);
        LD        A, #0x5a
        JRA       L:??OSTaskSuspend_1
//  699     }
//  700     if ((OSRdyTbl[ptcb->OSTCBY] &= ~ptcb->OSTCBBitX) == 0x00) { /* Make task not ready                 */
??OSTaskSuspend_6:
        LDW       X, S:?w4
        ADDW      X, #0x1b
        LD        A, (X)
        CLRW      X
        LD        XL, A
        LDW       Y, X
        LDW       X, S:?w4
        ADDW      X, #0x1c
        LD        A, (X)
        CPL       A
        LDW       X, Y
        AND       A, (L:OSRdyTbl,X)
        LD        S:?b0, A
        LDW       X, S:?w4
        ADDW      X, #0x1b
        LD        A, (X)
        CLRW      X
        LD        XL, A
        LD        A, S:?b0
        LD        (L:OSRdyTbl,X), A
        TNZ       S:?b0
        JRNE      L:??OSTaskSuspend_7
//  701         OSRdyGrp &= ~ptcb->OSTCBBitY;
        LDW       X, S:?w4
        ADDW      X, #0x1d
        LD        A, (X)
        CPL       A
        AND       A, L:OSRdyGrp
        LD        L:OSRdyGrp, A
//  702     }
//  703     ptcb->OSTCBStat |= OS_STAT_SUSPEND;                         /* Status of task is 'SUSPENDED'       */
??OSTaskSuspend_7:
        LDW       X, S:?w4
        ADDW      X, #0x18
        LD        A, (X)
        OR        A, #0x8
        LDW       X, S:?w4
        ADDW      X, #0x18
        LD        (X), A
//  704     OS_EXIT_CRITICAL();
        LD        A, S:?b10
        CALL      L:CriticalExit
//  705     if (self == TRUE) {                                         /* Context switch only if SELF         */
        LD        A, S:?b11
        CP        A, #0x1
        JRNE      L:??OSTaskSuspend_8
//  706         OS_Sched();
        CALL      L:OS_Sched
//  707     }
//  708     return (OS_NO_ERR);
??OSTaskSuspend_8:
        CLR       A
??OSTaskSuspend_1:
        POP       S:?b12
        JP        L:?epilogue_l2
//  709 }
//  710 #endif
//  711 /*$PAGE*/
//  712 /*
//  713 *********************************************************************************************************
//  714 *                                            QUERY A TASK
//  715 *
//  716 * Description: This function is called to obtain a copy of the desired task's TCB.
//  717 *
//  718 * Arguments  : prio     is the priority of the task to obtain information from.
//  719 *
//  720 * Returns    : OS_NO_ERR       if the requested task is suspended
//  721 *              OS_PRIO_INVALID if the priority you specify is higher that the maximum allowed
//  722 *                              (i.e. > OS_LOWEST_PRIO) or, you have not specified OS_PRIO_SELF.
//  723 *              OS_PRIO_ERR     if the desired task has not been created
//  724 *********************************************************************************************************
//  725 */
//  726 
//  727 #if OS_TASK_QUERY_EN > 0

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  728 INT8U  OSTaskQuery (INT8U prio, OS_TCB *pdata)
//  729 {
OSTaskQuery:
        CALL      L:?push_l2
        CALL      L:?push_w6
        LD        S:?b12, A
        LDW       S:?w5, X
//  730 #if OS_CRITICAL_METHOD == 3                      /* Allocate storage for CPU status register           */
//  731     OS_CPU_SR  cpu_sr;
//  732 #endif
//  733     OS_TCB    *ptcb;
//  734 
//  735 
//  736 #if OS_ARG_CHK_EN > 0
//  737     if (prio > OS_LOWEST_PRIO && prio != OS_PRIO_SELF) {   /* Task priority valid ?                    */
        LD        A, S:?b12
        CP        A, #0x40
        JRC       L:??OSTaskQuery_0
        LD        A, S:?b12
        CP        A, #0xff
        JREQ      L:??OSTaskQuery_0
//  738         return (OS_PRIO_INVALID);
        LD        A, #0x2a
        JRA       L:??OSTaskQuery_1
//  739     }
//  740 #endif
//  741     OS_ENTER_CRITICAL();
??OSTaskQuery_0:
        CALL      L:CriticalEnter
        LD        S:?b13, A
//  742     if (prio == OS_PRIO_SELF) {                            /* See if suspend SELF                      */
        LD        A, S:?b12
        CP        A, #0xff
        JRNE      L:??OSTaskQuery_2
//  743         prio = OSTCBCur->OSTCBPrio;
        LDW       X, L:OSTCBCur
        ADDW      X, #0x19
        LD        A, (X)
        LD        S:?b12, A
//  744     }
//  745     ptcb = OSTCBPrioTbl[prio];
??OSTaskQuery_2:
        CLRW      X
        EXG       A, XL
        LD        A, S:?b12
        EXG       A, XL
        SLLW      X
        LDW       X, (L:OSTCBPrioTbl,X)
        LDW       S:?w4, X
//  746     if (ptcb == (OS_TCB *)0) {                             /* Task to query must exist                 */
        LDW       X, S:?w4
        TNZW      X
        JRNE      L:??OSTaskQuery_3
//  747         OS_EXIT_CRITICAL();
        LD        A, S:?b13
        CALL      L:CriticalExit
//  748         return (OS_PRIO_ERR);
        LD        A, #0x29
        JRA       L:??OSTaskQuery_1
//  749     }
//  750     memcpy(pdata, ptcb, sizeof(OS_TCB));                   /* Copy TCB into user storage area          */
??OSTaskQuery_3:
        LDW       X, #0x1f
        LDW       S:?w0, X
        LDW       Y, S:?w4
        LDW       X, S:?w5
        CALL      L:memcpy
//  751     OS_EXIT_CRITICAL();
        LD        A, S:?b13
        CALL      L:CriticalExit
//  752     return (OS_NO_ERR);
        CLR       A
??OSTaskQuery_1:
        JP        L:?epilogue_l2_w6
//  753 }

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  754 #endif
// 
// 2 066 bytes in section .near_func.text
// 
// 2 066 bytes of CODE memory
//
//Errors: none
//Warnings: 3
