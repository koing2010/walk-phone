///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.40.1.50106 for STM8            05/Feb/2017  11:28:52 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\RDA1846s\walkphone program\ucos -                    /
//                    transeiver\ucos_II\OS_SEM.C                             /
//    Command line =  "E:\RDA1846s\walkphone program\ucos -                   /
//                    transeiver\ucos_II\OS_SEM.C" -e -On --no_cse            /
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
//                    transeiver\stm8s\iar\Debug\List\OS_SEM.s                /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME OS_SEM

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b10
        EXTERN ?b12
        EXTERN ?b13
        EXTERN ?b14
        EXTERN ?epilogue_l2
        EXTERN ?epilogue_l2_l3
        EXTERN ?epilogue_l2_w6
        EXTERN ?epilogue_w4
        EXTERN ?mov_w4_w0
        EXTERN ?pop_w7
        EXTERN ?push_l2
        EXTERN ?push_l3
        EXTERN ?push_w4
        EXTERN ?push_w6
        EXTERN ?push_w7
        EXTERN ?w0
        EXTERN ?w4
        EXTERN ?w5
        EXTERN ?w6
        EXTERN ?w7
        EXTERN OSEventFreeList
        EXTERN OSIntNesting
        EXTERN OSTCBCur
        EXTERN OS_EventTO
        EXTERN OS_EventTaskRdy
        EXTERN OS_EventTaskWait
        EXTERN OS_EventWaitListInit
        EXTERN OS_Sched

        PUBLIC OSSemAccept
        PUBLIC OSSemCreate
        PUBLIC OSSemDel
        PUBLIC OSSemPend
        PUBLIC OSSemPost
        PUBLIC OSSemQuery

// E:\RDA1846s\walkphone program\ucos - transeiver\ucos_II\OS_SEM.C
//    1 /*
//    2 *********************************************************************************************************
//    3 *                                                uC/OS-II
//    4 *                                          The Real-Time Kernel
//    5 *                                          SEMAPHORE MANAGEMENT
//    6 *
//    7 *                          (c) Copyright 1992-2002, Jean J. Labrosse, Weston, FL
//    8 *                                           All Rights Reserved
//    9 *
//   10 * File : OS_SEM.C
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
//   19 #if OS_SEM_EN > 0
//   20 /*
//   21 *********************************************************************************************************
//   22 *                                           ACCEPT SEMAPHORE
//   23 *
//   24 * Description: This function checks the semaphore to see if a resource is available or, if an event
//   25 *              occurred.  Unlike OSSemPend(), OSSemAccept() does not suspend the calling task if the
//   26 *              resource is not available or the event did not occur.
//   27 *
//   28 * Arguments  : pevent     is a pointer to the event control block
//   29 *
//   30 * Returns    : >  0       if the resource is available or the event did not occur the semaphore is
//   31 *                         decremented to obtain the resource.
//   32 *              == 0       if the resource is not available or the event did not occur or,
//   33 *                         if 'pevent' is a NULL pointer or,
//   34 *                         if you didn't pass a pointer to a semaphore
//   35 *********************************************************************************************************
//   36 */
//   37 
//   38 #if OS_SEM_ACCEPT_EN > 0

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   39 INT16U  OSSemAccept (OS_EVENT *pevent)
//   40 {
OSSemAccept:
        CALL      L:?push_l2
        PUSH      S:?b12
        LDW       S:?w4, X
//   41 #if OS_CRITICAL_METHOD == 3                           /* Allocate storage for CPU status register      */
//   42     OS_CPU_SR  cpu_sr;
//   43 #endif    
//   44     INT16U     cnt;
//   45 
//   46 
//   47 #if OS_ARG_CHK_EN > 0
//   48     if (pevent == (OS_EVENT *)0) {                    /* Validate 'pevent'                             */
        LDW       X, S:?w4
        TNZW      X
        JRNE      L:??OSSemAccept_0
//   49         return (0);
        CLRW      X
        JRA       L:??OSSemAccept_1
//   50     }
//   51     if (pevent->OSEventType != OS_EVENT_TYPE_SEM) {   /* Validate event block type                     */
??OSSemAccept_0:
        LD        A, [S:?w4.w]
        CP        A, #0x3
        JREQ      L:??OSSemAccept_2
//   52         return (0);
        CLRW      X
        JRA       L:??OSSemAccept_1
//   53     }
//   54 #endif
//   55     OS_ENTER_CRITICAL();
??OSSemAccept_2:
        CALL      L:CriticalEnter
        LD        S:?b12, A
//   56     cnt = pevent->OSEventCnt;
        LDW       X, S:?w4
        ADDW      X, #0x2
        LDW       X, (X)
        LDW       S:?w5, X
//   57     if (cnt > 0) {                                    /* See if resource is available                  */
        LDW       X, S:?w5
        TNZW      X
        JREQ      L:??OSSemAccept_3
//   58         pevent->OSEventCnt--;                         /* Yes, decrement semaphore and notify caller    */
        LDW       X, S:?w4
        ADDW      X, #0x2
        LDW       X, (X)
        DECW      X
        LDW       Y, X
        LDW       X, S:?w4
        ADDW      X, #0x2
        LDW       S:?w0, X
        LDW       [S:?w0.w], Y
//   59     }
//   60     OS_EXIT_CRITICAL();
??OSSemAccept_3:
        LD        A, S:?b12
        CALL      L:CriticalExit
//   61     return (cnt);                                     /* Return semaphore count                        */
        LDW       X, S:?w5
??OSSemAccept_1:
        POP       S:?b12
        JP        L:?epilogue_l2
//   62 }
//   63 #endif    
//   64 
//   65 /*$PAGE*/
//   66 /*
//   67 *********************************************************************************************************
//   68 *                                           CREATE A SEMAPHORE
//   69 *
//   70 * Description: This function creates a semaphore.
//   71 *
//   72 * Arguments  : cnt           is the initial value for the semaphore.  If the value is 0, no resource is
//   73 *                            available (or no event has occurred).  You initialize the semaphore to a
//   74 *                            non-zero value to specify how many resources are available (e.g. if you have
//   75 *                            10 resources, you would initialize the semaphore to 10).
//   76 *
//   77 * Returns    : != (void *)0  is a pointer to the event control clock (OS_EVENT) associated with the
//   78 *                            created semaphore
//   79 *              == (void *)0  if no event control blocks were available
//   80 *********************************************************************************************************
//   81 */
//   82 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   83 OS_EVENT  *OSSemCreate (INT16U cnt)
//   84 {
OSSemCreate:
        CALL      L:?push_l2
        PUSH      S:?b12
        LDW       S:?w5, X
//   85 #if OS_CRITICAL_METHOD == 3                                /* Allocate storage for CPU status register */
//   86     OS_CPU_SR  cpu_sr;
//   87 #endif    
//   88     OS_EVENT  *pevent;
//   89 
//   90 
//   91     if (OSIntNesting > 0) {                                /* See if called from ISR ...               */
        LD        A, L:OSIntNesting
        CP        A, #0x0
        JREQ      L:??OSSemCreate_0
//   92         return ((OS_EVENT *)0);                            /* ... can't CREATE from an ISR             */
        CLRW      X
        JRA       L:??OSSemCreate_1
//   93     }
//   94     OS_ENTER_CRITICAL();
??OSSemCreate_0:
        CALL      L:CriticalEnter
        LD        S:?b12, A
//   95     pevent = OSEventFreeList;                              /* Get next free event control block        */
        LDW       X, L:OSEventFreeList
        LDW       S:?w4, X
//   96     if (OSEventFreeList != (OS_EVENT *)0) {                /* See if pool of free ECB pool was empty   */
        LDW       X, L:OSEventFreeList
        TNZW      X
        JREQ      L:??OSSemCreate_2
//   97         OSEventFreeList = (OS_EVENT *)OSEventFreeList->OSEventPtr;
        LDW       X, L:OSEventFreeList
        ADDW      X, #0x4
        LDW       X, (X)
        LDW       L:OSEventFreeList, X
//   98     }
//   99     OS_EXIT_CRITICAL();
??OSSemCreate_2:
        LD        A, S:?b12
        CALL      L:CriticalExit
//  100     if (pevent != (OS_EVENT *)0) {                         /* Get an event control block               */
        LDW       X, S:?w4
        TNZW      X
        JREQ      L:??OSSemCreate_3
//  101         pevent->OSEventType = OS_EVENT_TYPE_SEM;
        LD        A, #0x3
        LD        [S:?w4.w], A
//  102         pevent->OSEventCnt  = cnt;                         /* Set semaphore value                      */
        LDW       X, S:?w4
        ADDW      X, #0x2
        LDW       Y, X
        LDW       X, S:?w5
        LDW       (Y), X
//  103         pevent->OSEventPtr  = (void *)0;                   /* Unlink from ECB free list                */
        LDW       X, S:?w4
        ADDW      X, #0x4
        LDW       Y, X
        CLRW      X
        LDW       (Y), X
//  104         OS_EventWaitListInit(pevent);                      /* Initialize to 'nobody waiting' on sem.   */
        LDW       X, S:?w4
        CALL      L:OS_EventWaitListInit
//  105     }
//  106     return (pevent);
??OSSemCreate_3:
        LDW       X, S:?w4
??OSSemCreate_1:
        POP       S:?b12
        JP        L:?epilogue_l2
//  107 }
//  108 
//  109 /*$PAGE*/
//  110 /*
//  111 *********************************************************************************************************
//  112 *                                         DELETE A SEMAPHORE
//  113 *
//  114 * Description: This function deletes a semaphore and readies all tasks pending on the semaphore.
//  115 *
//  116 * Arguments  : pevent        is a pointer to the event control block associated with the desired
//  117 *                            semaphore.
//  118 *
//  119 *              opt           determines delete options as follows:
//  120 *                            opt == OS_DEL_NO_PEND   Delete semaphore ONLY if no task pending
//  121 *                            opt == OS_DEL_ALWAYS    Deletes the semaphore even if tasks are waiting.
//  122 *                                                    In this case, all the tasks pending will be readied.
//  123 *
//  124 *              err           is a pointer to an error code that can contain one of the following values:
//  125 *                            OS_NO_ERR               The call was successful and the semaphore was deleted
//  126 *                            OS_ERR_DEL_ISR          If you attempted to delete the semaphore from an ISR
//  127 *                            OS_ERR_INVALID_OPT      An invalid option was specified
//  128 *                            OS_ERR_TASK_WAITING     One or more tasks were waiting on the semaphore
//  129 *                            OS_ERR_EVENT_TYPE       If you didn't pass a pointer to a semaphore
//  130 *                            OS_ERR_PEVENT_NULL      If 'pevent' is a NULL pointer.
//  131 *
//  132 * Returns    : pevent        upon error
//  133 *              (OS_EVENT *)0 if the semaphore was successfully deleted.
//  134 *
//  135 * Note(s)    : 1) This function must be used with care.  Tasks that would normally expect the presence of
//  136 *                 the semaphore MUST check the return code of OSSemPend().
//  137 *              2) OSSemAccept() callers will not know that the intended semaphore has been deleted unless
//  138 *                 they check 'pevent' to see that it's a NULL pointer.
//  139 *              3) This call can potentially disable interrupts for a long time.  The interrupt disable
//  140 *                 time is directly proportional to the number of tasks waiting on the semaphore.
//  141 *              4) Because ALL tasks pending on the semaphore will be readied, you MUST be careful in
//  142 *                 applications where the semaphore is used for mutual exclusion because the resource(s)
//  143 *                 will no longer be guarded by the semaphore.
//  144 *********************************************************************************************************
//  145 */
//  146 
//  147 #if OS_SEM_DEL_EN > 0

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  148 OS_EVENT  *OSSemDel (OS_EVENT *pevent, INT8U opt, INT8U *err)
//  149 {
OSSemDel:
        CALL      L:?push_l2
        CALL      L:?push_w6
        PUSH      S:?b14
        LDW       S:?w4, X
        LD        S:?b13, A
        LDW       S:?w5, Y
//  150 #if OS_CRITICAL_METHOD == 3                                /* Allocate storage for CPU status register */
//  151     OS_CPU_SR  cpu_sr;
//  152 #endif    
//  153     BOOLEAN    tasks_waiting;
//  154 
//  155 
//  156     if (OSIntNesting > 0) {                                /* See if called from ISR ...               */
        LD        A, L:OSIntNesting
        CP        A, #0x0
        JREQ      L:??OSSemDel_0
//  157         *err = OS_ERR_DEL_ISR;                             /* ... can't DELETE from an ISR             */
        LD        A, #0x8c
        LD        [S:?w5.w], A
//  158         return (pevent);
        LDW       X, S:?w4
        JP        L:??OSSemDel_1
//  159     }
//  160 #if OS_ARG_CHK_EN > 0
//  161     if (pevent == (OS_EVENT *)0) {                         /* Validate 'pevent'                        */
??OSSemDel_0:
        LDW       X, S:?w4
        TNZW      X
        JRNE      L:??OSSemDel_2
//  162         *err = OS_ERR_PEVENT_NULL;
        LD        A, #0x4
        LD        [S:?w5.w], A
//  163         return (pevent);
        LDW       X, S:?w4
        JP        L:??OSSemDel_1
//  164     }
//  165     if (pevent->OSEventType != OS_EVENT_TYPE_SEM) {        /* Validate event block type                */
??OSSemDel_2:
        LD        A, [S:?w4.w]
        CP        A, #0x3
        JREQ      L:??OSSemDel_3
//  166         *err = OS_ERR_EVENT_TYPE;
        LD        A, #0x1
        LD        [S:?w5.w], A
//  167         return (pevent);
        LDW       X, S:?w4
        JP        L:??OSSemDel_1
//  168     }
//  169 #endif
//  170     OS_ENTER_CRITICAL();
??OSSemDel_3:
        CALL      L:CriticalEnter
        LD        S:?b12, A
//  171     if (pevent->OSEventGrp != 0x00) {                      /* See if any tasks waiting on semaphore    */
        LDW       X, S:?w4
        INCW      X
        TNZ       (X)
        JREQ      L:??OSSemDel_4
//  172         tasks_waiting = TRUE;                              /* Yes                                      */
        LD        A, #0x1
        LD        S:?b14, A
        JRA       L:??OSSemDel_5
//  173     } else {
//  174         tasks_waiting = FALSE;                             /* No                                       */
??OSSemDel_4:
        CLR       A
        LD        S:?b14, A
//  175     }
//  176     switch (opt) {
??OSSemDel_5:
        LD        A, S:?b13
        TNZ       A
        JREQ      L:??OSSemDel_6
        DEC       A
        JREQ      L:??OSSemDel_7
        JRA       L:??OSSemDel_8
//  177         case OS_DEL_NO_PEND:                               /* Delete semaphore only if no task waiting */
//  178              if (tasks_waiting == FALSE) {
??OSSemDel_6:
        TNZ       S:?b14
        JRNE      L:??OSSemDel_9
//  179                  pevent->OSEventType = OS_EVENT_TYPE_UNUSED;
        CLR       A
        LD        [S:?w4.w], A
//  180                  pevent->OSEventPtr  = OSEventFreeList;    /* Return Event Control Block to free list  */
        LDW       X, S:?w4
        ADDW      X, #0x4
        LDW       Y, X
        LDW       X, L:OSEventFreeList
        LDW       (Y), X
//  181                  OSEventFreeList     = pevent;             /* Get next free event control block        */
        LDW       X, S:?w4
        LDW       L:OSEventFreeList, X
//  182                  OS_EXIT_CRITICAL();
        LD        A, S:?b12
        CALL      L:CriticalExit
//  183                  *err = OS_NO_ERR;
        CLR       A
        LD        [S:?w5.w], A
//  184                  return ((OS_EVENT *)0);                   /* Semaphore has been deleted               */
        CLRW      X
        JRA       L:??OSSemDel_1
//  185              } else {
//  186                  OS_EXIT_CRITICAL();
??OSSemDel_9:
        LD        A, S:?b12
        CALL      L:CriticalExit
//  187                  *err = OS_ERR_TASK_WAITING;
        LD        A, #0x8
        LD        [S:?w5.w], A
//  188                  return (pevent);
        LDW       X, S:?w4
        JRA       L:??OSSemDel_1
//  189              }
//  190 
//  191         case OS_DEL_ALWAYS:                                /* Always delete the semaphore              */
//  192              while (pevent->OSEventGrp != 0x00) {          /* Ready ALL tasks waiting for semaphore    */
??OSSemDel_7:
        LDW       X, S:?w4
        INCW      X
        TNZ       (X)
        JREQ      L:??OSSemDel_10
//  193                  OS_EventTaskRdy(pevent, (void *)0, OS_STAT_SEM);
        LD        A, #0x1
        CLRW      Y
        LDW       X, S:?w4
        CALL      L:OS_EventTaskRdy
        JRA       L:??OSSemDel_7
//  194              }
//  195              pevent->OSEventType = OS_EVENT_TYPE_UNUSED;
??OSSemDel_10:
        CLR       A
        LD        [S:?w4.w], A
//  196              pevent->OSEventPtr  = OSEventFreeList;        /* Return Event Control Block to free list  */
        LDW       X, S:?w4
        ADDW      X, #0x4
        LDW       Y, X
        LDW       X, L:OSEventFreeList
        LDW       (Y), X
//  197              OSEventFreeList     = pevent;                 /* Get next free event control block        */
        LDW       X, S:?w4
        LDW       L:OSEventFreeList, X
//  198              OS_EXIT_CRITICAL();
        LD        A, S:?b12
        CALL      L:CriticalExit
//  199              if (tasks_waiting == TRUE) {                  /* Reschedule only if task(s) were waiting  */
        LD        A, S:?b14
        CP        A, #0x1
        JRNE      L:??OSSemDel_11
//  200                  OS_Sched();                               /* Find highest priority task ready to run  */
        CALL      L:OS_Sched
//  201              }
//  202              *err = OS_NO_ERR;
??OSSemDel_11:
        CLR       A
        LD        [S:?w5.w], A
//  203              return ((OS_EVENT *)0);                       /* Semaphore has been deleted               */
        CLRW      X
        JRA       L:??OSSemDel_1
//  204 
//  205         default:
//  206              OS_EXIT_CRITICAL();
??OSSemDel_8:
        LD        A, S:?b12
        CALL      L:CriticalExit
//  207              *err = OS_ERR_INVALID_OPT;
        LD        A, #0x7
        LD        [S:?w5.w], A
//  208              return (pevent);
        LDW       X, S:?w4
??OSSemDel_1:
        POP       S:?b14
        JP        L:?epilogue_l2_w6
//  209     }
//  210 }
//  211 #endif
//  212 
//  213 /*$PAGE*/
//  214 /*
//  215 *********************************************************************************************************
//  216 *                                           PEND ON SEMAPHORE
//  217 *
//  218 * Description: This function waits for a semaphore.
//  219 *
//  220 * Arguments  : pevent        is a pointer to the event control block associated with the desired
//  221 *                            semaphore.
//  222 *
//  223 *              timeout       is an optional timeout period (in clock ticks).  If non-zero, your task will
//  224 *                            wait for the resource up to the amount of time specified by this argument.
//  225 *                            If you specify 0, however, your task will wait forever at the specified
//  226 *                            semaphore or, until the resource becomes available (or the event occurs).
//  227 *
//  228 *              err           is a pointer to where an error message will be deposited.  Possible error
//  229 *                            messages are:
//  230 *
//  231 *                            OS_NO_ERR           The call was successful and your task owns the resource
//  232 *                                                or, the event you are waiting for occurred.
//  233 *                            OS_TIMEOUT          The semaphore was not received within the specified
//  234 *                                                timeout.
//  235 *                            OS_ERR_EVENT_TYPE   If you didn't pass a pointer to a semaphore.
//  236 *                            OS_ERR_PEND_ISR     If you called this function from an ISR and the result
//  237 *                                                would lead to a suspension.
//  238 *                            OS_ERR_PEVENT_NULL  If 'pevent' is a NULL pointer.
//  239 *
//  240 * Returns    : none
//  241 *********************************************************************************************************
//  242 */
//  243 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  244 void  OSSemPend (OS_EVENT *pevent, INT16U timeout, INT8U *err)
//  245 {
OSSemPend:
        CALL      L:?push_l2
        CALL      L:?push_w7
        PUSH      S:?b12
        LDW       S:?w5, X
        LDW       S:?w7, Y
        CALL      L:?mov_w4_w0
//  246 #if OS_CRITICAL_METHOD == 3                           /* Allocate storage for CPU status register      */
//  247     OS_CPU_SR  cpu_sr;
//  248 #endif    
//  249 
//  250 
//  251     if (OSIntNesting > 0) {                           /* See if called from ISR ...                    */
        LD        A, L:OSIntNesting
        CP        A, #0x0
        JREQ      L:??OSSemPend_0
//  252         *err = OS_ERR_PEND_ISR;                       /* ... can't PEND from an ISR                    */
        LD        A, #0x2
        LD        [S:?w4.w], A
//  253         return;
        JP        L:??OSSemPend_1
//  254     }
//  255 #if OS_ARG_CHK_EN > 0
//  256     if (pevent == (OS_EVENT *)0) {                    /* Validate 'pevent'                             */
??OSSemPend_0:
        LDW       X, S:?w5
        TNZW      X
        JRNE      L:??OSSemPend_2
//  257         *err = OS_ERR_PEVENT_NULL;
        LD        A, #0x4
        LD        [S:?w4.w], A
//  258         return;
        JP        L:??OSSemPend_1
//  259     }
//  260     if (pevent->OSEventType != OS_EVENT_TYPE_SEM) {   /* Validate event block type                     */
??OSSemPend_2:
        LD        A, [S:?w5.w]
        CP        A, #0x3
        JREQ      L:??OSSemPend_3
//  261         *err = OS_ERR_EVENT_TYPE;
        LD        A, #0x1
        LD        [S:?w4.w], A
//  262         return;
        JP        L:??OSSemPend_1
//  263     }
//  264 #endif
//  265     OS_ENTER_CRITICAL();
??OSSemPend_3:
        CALL      L:CriticalEnter
        LD        S:?b12, A
//  266     if (pevent->OSEventCnt > 0) {                     /* If sem. is positive, resource available ...   */
        LDW       X, S:?w5
        ADDW      X, #0x2
        LDW       X, (X)
        TNZW      X
        JREQ      L:??OSSemPend_4
//  267         pevent->OSEventCnt--;                         /* ... decrement semaphore only if positive.     */
        LDW       X, S:?w5
        ADDW      X, #0x2
        LDW       X, (X)
        DECW      X
        LDW       Y, X
        LDW       X, S:?w5
        ADDW      X, #0x2
        LDW       S:?w0, X
        LDW       [S:?w0.w], Y
//  268         OS_EXIT_CRITICAL();
        LD        A, S:?b12
        CALL      L:CriticalExit
//  269         *err = OS_NO_ERR;
        CLR       A
        LD        [S:?w4.w], A
//  270         return;
        JRA       L:??OSSemPend_1
//  271     }
//  272                                                       /* Otherwise, must wait until event occurs       */
//  273     OSTCBCur->OSTCBStat |= OS_STAT_SEM;               /* Resource not available, pend on semaphore     */
??OSSemPend_4:
        LDW       X, L:OSTCBCur
        ADDW      X, #0x18
        LD        A, (X)
        OR        A, #0x1
        LDW       X, L:OSTCBCur
        ADDW      X, #0x18
        LD        (X), A
//  274     OSTCBCur->OSTCBDly   = timeout;                   /* Store pend timeout in TCB                     */
        LDW       X, L:OSTCBCur
        ADDW      X, #0x16
        LDW       Y, X
        LDW       X, S:?w7
        LDW       (Y), X
//  275     OS_EventTaskWait(pevent);                         /* Suspend task until event or timeout occurs    */
        LDW       X, S:?w5
        CALL      L:OS_EventTaskWait
//  276     OS_EXIT_CRITICAL();
        LD        A, S:?b12
        CALL      L:CriticalExit
//  277     OS_Sched();                                       /* Find next highest priority task ready         */
        CALL      L:OS_Sched
//  278     OS_ENTER_CRITICAL();
        CALL      L:CriticalEnter
        LD        S:?b12, A
//  279     if (OSTCBCur->OSTCBStat & OS_STAT_SEM) {          /* Must have timed out if still waiting for event*/
        LDW       X, L:OSTCBCur
        ADDW      X, #0x18
        LD        A, (X)
        AND       A, #0x1
        CP        A, #0x0
        JREQ      L:??OSSemPend_5
//  280         OS_EventTO(pevent);
        LDW       X, S:?w5
        CALL      L:OS_EventTO
//  281         OS_EXIT_CRITICAL();
        LD        A, S:?b12
        CALL      L:CriticalExit
//  282         *err = OS_TIMEOUT;                            /* Indicate that didn't get event within TO      */
        LD        A, #0xa
        LD        [S:?w4.w], A
//  283         return;
        JRA       L:??OSSemPend_1
//  284     }
//  285     OSTCBCur->OSTCBEventPtr = (OS_EVENT *)0;
??OSSemPend_5:
        LDW       X, L:OSTCBCur
        ADDW      X, #0x12
        LDW       Y, X
        CLRW      X
        LDW       (Y), X
//  286     OS_EXIT_CRITICAL();
        LD        A, S:?b12
        CALL      L:CriticalExit
//  287     *err = OS_NO_ERR;
        CLR       A
        LD        [S:?w4.w], A
//  288 }
??OSSemPend_1:
        POP       S:?b12
        CALL      L:?pop_w7
        JP        L:?epilogue_l2
//  289 /*$PAGE*/
//  290 /*
//  291 *********************************************************************************************************
//  292 *                                         POST TO A SEMAPHORE
//  293 *
//  294 * Description: This function signals a semaphore
//  295 *
//  296 * Arguments  : pevent        is a pointer to the event control block associated with the desired
//  297 *                            semaphore.
//  298 *
//  299 * Returns    : OS_NO_ERR           The call was successful and the semaphore was signaled.
//  300 *              OS_SEM_OVF          If the semaphore count exceeded its limit.  In other words, you have
//  301 *                                  signalled the semaphore more often than you waited on it with either
//  302 *                                  OSSemAccept() or OSSemPend().
//  303 *              OS_ERR_EVENT_TYPE   If you didn't pass a pointer to a semaphore
//  304 *              OS_ERR_PEVENT_NULL  If 'pevent' is a NULL pointer.
//  305 *********************************************************************************************************
//  306 */
//  307 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  308 INT8U  OSSemPost (OS_EVENT *pevent)
//  309 {
OSSemPost:
        CALL      L:?push_w4
        PUSH      S:?b10
        LDW       S:?w4, X
//  310 #if OS_CRITICAL_METHOD == 3                                /* Allocate storage for CPU status register */
//  311     OS_CPU_SR  cpu_sr;                               
//  312 #endif    
//  313 
//  314 
//  315 #if OS_ARG_CHK_EN > 0
//  316     if (pevent == (OS_EVENT *)0) {                         /* Validate 'pevent'                        */
        LDW       X, S:?w4
        TNZW      X
        JRNE      L:??OSSemPost_0
//  317         return (OS_ERR_PEVENT_NULL);
        LD        A, #0x4
        JRA       L:??OSSemPost_1
//  318     }
//  319     if (pevent->OSEventType != OS_EVENT_TYPE_SEM) {        /* Validate event block type                */
??OSSemPost_0:
        LD        A, [S:?w4.w]
        CP        A, #0x3
        JREQ      L:??OSSemPost_2
//  320         return (OS_ERR_EVENT_TYPE);
        LD        A, #0x1
        JRA       L:??OSSemPost_1
//  321     }
//  322 #endif
//  323     OS_ENTER_CRITICAL();
??OSSemPost_2:
        CALL      L:CriticalEnter
        LD        S:?b10, A
//  324     if (pevent->OSEventGrp != 0x00) {                      /* See if any task waiting for semaphore    */
        LDW       X, S:?w4
        INCW      X
        TNZ       (X)
        JREQ      L:??OSSemPost_3
//  325         OS_EventTaskRdy(pevent, (void *)0, OS_STAT_SEM);   /* Ready highest prio task waiting on event */
        LD        A, #0x1
        CLRW      Y
        LDW       X, S:?w4
        CALL      L:OS_EventTaskRdy
//  326         OS_EXIT_CRITICAL();
        LD        A, S:?b10
        CALL      L:CriticalExit
//  327         OS_Sched();                                        /* Find highest priority task ready to run  */
        CALL      L:OS_Sched
//  328         return (OS_NO_ERR);
        CLR       A
        JRA       L:??OSSemPost_1
//  329     }
//  330     if (pevent->OSEventCnt < 65535) {                 /* Make sure semaphore will not overflow         */
??OSSemPost_3:
        LDW       X, S:?w4
        ADDW      X, #0x2
        LDW       X, (X)
        CPW       X, #0xffff
        JREQ      L:??OSSemPost_4
//  331         pevent->OSEventCnt++;                         /* Increment semaphore count to register event   */
        LDW       X, S:?w4
        ADDW      X, #0x2
        LDW       X, (X)
        INCW      X
        LDW       Y, X
        LDW       X, S:?w4
        ADDW      X, #0x2
        LDW       (X), Y
//  332         OS_EXIT_CRITICAL();
        LD        A, S:?b10
        CALL      L:CriticalExit
//  333         return (OS_NO_ERR);
        CLR       A
        JRA       L:??OSSemPost_1
//  334     }
//  335     OS_EXIT_CRITICAL();                               /* Semaphore value has reached its maximum       */
??OSSemPost_4:
        LD        A, S:?b10
        CALL      L:CriticalExit
//  336     return (OS_SEM_OVF);
        LD        A, #0x32
??OSSemPost_1:
        POP       S:?b10
        JP        L:?epilogue_w4
//  337 }
//  338 /*$PAGE*/
//  339 /*
//  340 *********************************************************************************************************
//  341 *                                          QUERY A SEMAPHORE
//  342 *
//  343 * Description: This function obtains information about a semaphore
//  344 *
//  345 * Arguments  : pevent        is a pointer to the event control block associated with the desired
//  346 *                            semaphore
//  347 *
//  348 *              pdata         is a pointer to a structure that will contain information about the
//  349 *                            semaphore.
//  350 *
//  351 * Returns    : OS_NO_ERR           The call was successful and the message was sent
//  352 *              OS_ERR_EVENT_TYPE   If you are attempting to obtain data from a non semaphore.
//  353 *              OS_ERR_PEVENT_NULL  If 'pevent' is a NULL pointer.
//  354 *********************************************************************************************************
//  355 */
//  356 
//  357 #if OS_SEM_QUERY_EN > 0

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  358 INT8U  OSSemQuery (OS_EVENT *pevent, OS_SEM_DATA *pdata)
//  359 {
OSSemQuery:
        CALL      L:?push_l2
        CALL      L:?push_l3
        SUB       SP, #0x1
        LDW       S:?w6, X
        LDW       S:?w7, Y
//  360 #if OS_CRITICAL_METHOD == 3                                /* Allocate storage for CPU status register */
//  361     OS_CPU_SR  cpu_sr;
//  362 #endif    
//  363     INT8U     *psrc;
//  364     INT8U     *pdest;
//  365 
//  366 
//  367 #if OS_ARG_CHK_EN > 0
//  368     if (pevent == (OS_EVENT *)0) {                         /* Validate 'pevent'                        */
        LDW       X, S:?w6
        TNZW      X
        JRNE      L:??OSSemQuery_0
//  369         return (OS_ERR_PEVENT_NULL);
        LD        A, #0x4
        JP        L:??OSSemQuery_1
//  370     }
//  371     if (pevent->OSEventType != OS_EVENT_TYPE_SEM) {        /* Validate event block type                */
??OSSemQuery_0:
        LD        A, [S:?w6.w]
        CP        A, #0x3
        JREQ      L:??OSSemQuery_2
//  372         return (OS_ERR_EVENT_TYPE);
        LD        A, #0x1
        JP        L:??OSSemQuery_1
//  373     }
//  374 #endif
//  375     OS_ENTER_CRITICAL();
??OSSemQuery_2:
        CALL      L:CriticalEnter
        LD        (0x1,SP), A
//  376     pdata->OSEventGrp = pevent->OSEventGrp;                /* Copy message mailbox wait list           */
        LDW       X, S:?w6
        INCW      X
        LD        A, (X)
        LDW       X, S:?w7
        ADDW      X, #0xa
        LD        (X), A
//  377     psrc              = &pevent->OSEventTbl[0];
        LDW       X, S:?w6
        ADDW      X, #0x6
        LDW       S:?w5, X
//  378     pdest             = &pdata->OSEventTbl[0];
        LDW       X, S:?w7
        ADDW      X, #0x2
        LDW       S:?w4, X
//  379 #if OS_EVENT_TBL_SIZE > 0
//  380     *pdest++          = *psrc++;
        LD        A, [S:?w5.w]
        LD        [S:?w4.w], A
        LDW       X, S:?w5
        INCW      X
        LDW       S:?w5, X
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
//  381 #endif
//  382 
//  383 #if OS_EVENT_TBL_SIZE > 1
//  384     *pdest++          = *psrc++;
        LD        A, [S:?w5.w]
        LD        [S:?w4.w], A
        LDW       X, S:?w5
        INCW      X
        LDW       S:?w5, X
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
//  385 #endif
//  386 
//  387 #if OS_EVENT_TBL_SIZE > 2
//  388     *pdest++          = *psrc++;
        LD        A, [S:?w5.w]
        LD        [S:?w4.w], A
        LDW       X, S:?w5
        INCW      X
        LDW       S:?w5, X
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
//  389 #endif
//  390 
//  391 #if OS_EVENT_TBL_SIZE > 3
//  392     *pdest++          = *psrc++;
        LD        A, [S:?w5.w]
        LD        [S:?w4.w], A
        LDW       X, S:?w5
        INCW      X
        LDW       S:?w5, X
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
//  393 #endif
//  394 
//  395 #if OS_EVENT_TBL_SIZE > 4
//  396     *pdest++          = *psrc++;
        LD        A, [S:?w5.w]
        LD        [S:?w4.w], A
        LDW       X, S:?w5
        INCW      X
        LDW       S:?w5, X
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
//  397 #endif
//  398 
//  399 #if OS_EVENT_TBL_SIZE > 5
//  400     *pdest++          = *psrc++;
        LD        A, [S:?w5.w]
        LD        [S:?w4.w], A
        LDW       X, S:?w5
        INCW      X
        LDW       S:?w5, X
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
//  401 #endif
//  402 
//  403 #if OS_EVENT_TBL_SIZE > 6
//  404     *pdest++          = *psrc++;
        LD        A, [S:?w5.w]
        LD        [S:?w4.w], A
        LDW       X, S:?w5
        INCW      X
        LDW       S:?w5, X
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
//  405 #endif
//  406 
//  407 #if OS_EVENT_TBL_SIZE > 7
//  408     *pdest            = *psrc;
        LD        A, [S:?w5.w]
        LD        [S:?w4.w], A
//  409 #endif
//  410     pdata->OSCnt      = pevent->OSEventCnt;                /* Get semaphore count                      */
        LDW       X, S:?w6
        ADDW      X, #0x2
        LDW       X, (X)
        LDW       [S:?w7.w], X
//  411     OS_EXIT_CRITICAL();
        LD        A, (0x1,SP)
        CALL      L:CriticalExit
//  412     return (OS_NO_ERR);
        CLR       A
??OSSemQuery_1:
        ADD       SP, #0x1
        JP        L:?epilogue_l2_l3
//  413 }

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  414 #endif                                                     /* OS_SEM_QUERY_EN                          */
//  415 #endif                                                     /* OS_SEM_EN                                */
// 
// 930 bytes in section .near_func.text
// 
// 930 bytes of CODE memory
//
//Errors: none
//Warnings: 2
